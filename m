Received: from out-193.mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911361A5B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 19:49:58 +0000 (UTC)
Date: Wed, 27 Sep 2023 12:49:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1695844196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rPosdZyMscje/wspCfp41NwtrMJwA341D3kBRp5ZUE=;
	b=N9XxUvoth4ASIcS82DfjXBo1kok52byOuBwAoMCcWH+WQ32Ce6Vxd6qR1yHPt1qjg2GX8P
	3EjNuskOg0+vus+/qD9WNzmwticx+j3CKf1ahSOLro2lue5xWyDCZtampZOVZWbNlgf1CR
	kvArgoi53qZoTSqcmhEc5cUEhS4Dm6c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [rgushchin:kmem_performance.rfc 4/7] mm/memcontrol.c:6916:17:
 error: 'mem_cgroup_fork' undeclared here (not in a function); did you mean
 'mem_cgroup_free'?
Message-ID: <ZRSHVl0PoUuM0juI@P9FQF9L96D.corp.robot.car>
References: <202309280001.3XUUG8Ye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309280001.3XUUG8Ye-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Sep 28, 2023 at 12:45:12AM +0800, kernel test robot wrote:
> tree:   https://github.com/rgushchin/linux.git kmem_performance.rfc
> head:   2861702df93fd8d8093e9750f67d57bed3a673c8
> commit: 2938aa6b55a86fcc01eac93b94650782d10d7042 [4/7] mm: kmem: add direct objcg pointer to task_struct
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230928/202309280001.3XUUG8Ye-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280001.3XUUG8Ye-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309280001.3XUUG8Ye-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/memcontrol.c:6916:17: error: 'mem_cgroup_fork' undeclared here (not in a function); did you mean 'mem_cgroup_free'?
>     6916 |         .fork = mem_cgroup_fork,
>          |                 ^~~~~~~~~~~~~~~
>          |                 mem_cgroup_free
> >> mm/memcontrol.c:6917:17: error: 'mem_cgroup_exit' undeclared here (not in a function); did you mean 'mem_cgroup_reset'?
>     6917 |         .exit = mem_cgroup_exit,
>          |                 ^~~~~~~~~~~~~~~
>          |                 mem_cgroup_reset
> 

Ok, ok, thanks, !MMU build is broken.

Here is an updated version:

From fa3dd3371dd6bb9675d636736a9ccf0b99f085e1 Mon Sep 17 00:00:00 2001
From: Roman Gushchin <roman.gushchin@linux.dev>
Date: Mon, 19 Dec 2022 15:46:18 -0800
Subject: [PATCH v1 2/5] mm: kmem: add direct objcg pointer to task_struct

To charge a freshly allocated kernel object to a memory cgroup, the
kernel needs to obtain an objcg pointer. Currently it does it
indirectly by obtaining the memcg pointer first and then calling to
__get_obj_cgroup_from_memcg().

Usually tasks spend their entire life belonging to the same object
cgroup. So it makes sense to save the objcg pointer on task_struct
directly, so it can be obtained faster. It requires some work on fork,
exit and cgroup migrate paths, but these paths are way colder.

To avoid any costly synchronization the following rules are applied:
1) A task sets it's objcg pointer itself.

2) If a task is being migrated to another cgroup, the least
   significant bit of the objcg pointer is set.

3) On the allocation path the objcg pointer is obtained locklessly
   using the READ_ONCE() macro and the least significant bit is
   checked. If it set, the task updates it's objcg before proceeding
   with an allocation.

4) Operations 1) and 4) are synchronized via a new spinlock, so that
   if a task is moved twice, the update bit can't be lost.

This allows to keep the hot path fully lockless. Because the task
is keeping a reference to the objcg, it can't go away while the task
is alive.

This commit doesn't change the way the remote memcg charging works.

Signed-off-by: Roman Gushchin (Cruise) <roman.gushchin@linux.dev>
---
 include/linux/memcontrol.h |  10 ++++
 include/linux/sched.h      |   4 ++
 mm/memcontrol.c            | 107 +++++++++++++++++++++++++++++++++----
 3 files changed, 112 insertions(+), 9 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index ab94ad4597d0..84425bfe4124 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -553,6 +553,16 @@ static inline bool folio_memcg_kmem(struct folio *folio)
 	return folio->memcg_data & MEMCG_DATA_KMEM;
 }
 
+static inline bool current_objcg_needs_update(struct obj_cgroup *objcg)
+{
+	return (struct obj_cgroup *)((unsigned long)objcg & 0x1);
+}
+
+static inline struct obj_cgroup *
+current_objcg_clear_update_flag(struct obj_cgroup *objcg)
+{
+	return (struct obj_cgroup *)((unsigned long)objcg & ~0x1);
+}
 
 #else
 static inline bool folio_memcg_kmem(struct folio *folio)
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 77f01ac385f7..60de42715b56 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1443,6 +1443,10 @@ struct task_struct {
 	struct mem_cgroup		*active_memcg;
 #endif
 
+#ifdef CONFIG_MEMCG_KMEM
+	struct obj_cgroup		*objcg;
+#endif
+
 #ifdef CONFIG_BLK_CGROUP
 	struct gendisk			*throttle_disk;
 #endif
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 16ac2a5838fb..d981b932df5c 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -3001,6 +3001,47 @@ static struct obj_cgroup *__get_obj_cgroup_from_memcg(struct mem_cgroup *memcg)
 	return objcg;
 }
 
+static DEFINE_SPINLOCK(current_objcg_lock);
+
+static struct obj_cgroup *current_objcg_update(struct obj_cgroup *old)
+{
+	struct mem_cgroup *memcg;
+	struct obj_cgroup *objcg;
+	unsigned long flags;
+
+	old = current_objcg_clear_update_flag(old);
+	if (old)
+		obj_cgroup_put(old);
+
+	spin_lock_irqsave(&current_objcg_lock, flags);
+	rcu_read_lock();
+	memcg = mem_cgroup_from_task(current);
+	for (; memcg != root_mem_cgroup; memcg = parent_mem_cgroup(memcg)) {
+		objcg = rcu_dereference(memcg->objcg);
+		if (objcg && obj_cgroup_tryget(objcg))
+			break;
+		objcg = NULL;
+	}
+	rcu_read_unlock();
+
+	WRITE_ONCE(current->objcg, objcg);
+	spin_unlock_irqrestore(&current_objcg_lock, flags);
+
+	return objcg;
+}
+
+static inline void current_objcg_set_needs_update(struct task_struct *task)
+{
+	struct obj_cgroup *objcg;
+	unsigned long flags;
+
+	spin_lock_irqsave(&current_objcg_lock, flags);
+	objcg = READ_ONCE(task->objcg);
+	objcg = (struct obj_cgroup *)((unsigned long)objcg | 0x1);
+	WRITE_ONCE(task->objcg, objcg);
+	spin_unlock_irqrestore(&current_objcg_lock, flags);
+}
+
 __always_inline struct obj_cgroup *get_obj_cgroup_from_current(void)
 {
 	struct mem_cgroup *memcg;
@@ -3008,19 +3049,26 @@ __always_inline struct obj_cgroup *get_obj_cgroup_from_current(void)
 
 	if (in_task()) {
 		memcg = current->active_memcg;
+		if (unlikely(memcg))
+			goto from_memcg;
 
-		/* Memcg to charge can't be determined. */
-		if (likely(!memcg) && (!current->mm || (current->flags & PF_KTHREAD)))
-			return NULL;
+		objcg = READ_ONCE(current->objcg);
+		if (unlikely(current_objcg_needs_update(objcg)))
+			objcg = current_objcg_update(objcg);
+
+		if (objcg) {
+			obj_cgroup_get(objcg);
+			return objcg;
+		}
 	} else {
 		memcg = this_cpu_read(int_active_memcg);
-		if (likely(!memcg))
-			return NULL;
+		if (unlikely(memcg))
+			goto from_memcg;
 	}
+	return NULL;
 
+from_memcg:
 	rcu_read_lock();
-	if (!memcg)
-		memcg = mem_cgroup_from_task(current);
 	objcg = __get_obj_cgroup_from_memcg(memcg);
 	rcu_read_unlock();
 	return objcg;
@@ -6345,6 +6393,7 @@ static void mem_cgroup_move_task(void)
 		mem_cgroup_clear_mc();
 	}
 }
+
 #else	/* !CONFIG_MMU */
 static int mem_cgroup_can_attach(struct cgroup_taskset *tset)
 {
@@ -6358,8 +6407,23 @@ static void mem_cgroup_move_task(void)
 }
 #endif
 
+#ifdef CONFIG_MEMCG_KMEM
+static void mem_cgroup_fork(struct task_struct *task)
+{
+	task->objcg = (struct obj_cgroup *)0x1;
+}
+
+static void mem_cgroup_exit(struct task_struct *task)
+{
+	struct obj_cgroup *objcg = current_objcg_clear_update_flag(task->objcg);
+
+	if (objcg)
+		obj_cgroup_put(objcg);
+}
+#endif
+
 #ifdef CONFIG_LRU_GEN
-static void mem_cgroup_attach(struct cgroup_taskset *tset)
+static void mem_cgroup_lru_gen_attach(struct cgroup_taskset *tset)
 {
 	struct task_struct *task;
 	struct cgroup_subsys_state *css;
@@ -6377,10 +6441,29 @@ static void mem_cgroup_attach(struct cgroup_taskset *tset)
 	task_unlock(task);
 }
 #else
+static void mem_cgroup_lru_gen_attach(struct cgroup_taskset *tset) {}
+#endif /* CONFIG_LRU_GEN */
+
+#ifdef CONFIG_MEMCG_KMEM
+static void mem_cgroup_kmem_attach(struct cgroup_taskset *tset)
+{
+	struct task_struct *task;
+	struct cgroup_subsys_state *css;
+
+	cgroup_taskset_for_each(task, css, tset)
+		current_objcg_set_needs_update(task);
+}
+#else
+static void mem_cgroup_kmem_attach(struct cgroup_taskset *tset) {}
+#endif /* CONFIG_MEMCG_KMEM */
+
+#if defined(CONFIG_LRU_GEN) || defined(CONFIG_MEMCG_KMEM)
 static void mem_cgroup_attach(struct cgroup_taskset *tset)
 {
+	mem_cgroup_lru_gen_attach(tset);
+	mem_cgroup_kmem_attach(tset);
 }
-#endif /* CONFIG_LRU_GEN */
+#endif
 
 static int seq_puts_memcg_tunable(struct seq_file *m, unsigned long value)
 {
@@ -6824,9 +6907,15 @@ struct cgroup_subsys memory_cgrp_subsys = {
 	.css_reset = mem_cgroup_css_reset,
 	.css_rstat_flush = mem_cgroup_css_rstat_flush,
 	.can_attach = mem_cgroup_can_attach,
+#if defined(CONFIG_LRU_GEN) || defined(CONFIG_MEMCG_KMEM)
 	.attach = mem_cgroup_attach,
+#endif
 	.cancel_attach = mem_cgroup_cancel_attach,
 	.post_attach = mem_cgroup_move_task,
+#ifdef CONFIG_MEMCG_KMEM
+	.fork = mem_cgroup_fork,
+	.exit = mem_cgroup_exit,
+#endif
 	.dfl_cftypes = memory_files,
 	.legacy_cftypes = mem_cgroup_legacy_files,
 	.early_init = 0,
-- 
2.42.0

