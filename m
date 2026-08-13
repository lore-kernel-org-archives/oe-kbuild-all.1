Received: from latitanza.investici.org (latitanza.investici.org [185.218.207.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDAF361651
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 04:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.218.207.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786596956; cv=none; b=GQyNBa+7r/drHYTUMo+Zf0INHbXM6GwdZt0fzHeEw//XI9n5P04RIuRuazFYQlyK9hAEdH+/i1PByfdeRes0BHU3oAdRC3DK9jP7BUjsyBvs0CXQy4s0GP6+6lI6/yrgbPCyzv/YLFJ7DkHPV4NcmZjlHAWQ3F7Q1dZwJHzCRJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786596956; c=relaxed/simple;
	bh=ezMsmGhmRuQoCb9ZU/TVw/TGT9yUyiMLmubsapfH4SY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=vDphlJcVNX3aDIyPWL7tlLdWuP3YpNqFQCEH5nkIHpmhYJa3ms/+uXTkdRQIVj+nhgaBm5dOKSpSmItmPBUoB0bmuG/XdPkljz3qRRbCF869CShhhreo6wWnPCPyg+4ICt8sIwsbhFwkkrM7JZ1hLRKeNp9dd4ZdYKwmSg8E8hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=grrlz.net; dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b=mmCyr5BM; arc=none smtp.client-ip=185.218.207.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grrlz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b="mmCyr5BM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1786596943;
	bh=18Hj4XS4+MbXRMQ6ePVv1ETlohOJV0I4O5B4GmeTZyg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=mmCyr5BMr64OCIGLumMrqUNILsY4QzIL+hGuAPbeo0aB1oTVJ7y4zj+63b8azz0wI
	 Bi8Opm00/1fi4dn93Ilk9nbwlvNkLqJIG3JuUSon+zkBV01mVswMo2/0dGHJmaWd2N
	 ysCI6X2JK4aqfSUx/I0xQS4jbkQD/i3rdCD+rp5o=
Received: from mx3.investici.org (unknown [127.0.0.1])
	by latitanza.investici.org (Postfix) with ESMTP id 4hLCjW6bNZzGpJP;
	Thu, 13 Aug 2026 04:55:43 +0000 (UTC)
Received: by mx3.investici.org (Postfix) id 4hLCjW10kxzGpH8;
	Thu, 13 Aug 2026 04:55:43 +0000 (UTC)
Date: Thu, 13 Aug 2026 05:55:43 +0100
From: Bradley Morgan <include@grrlz.net>
To: kernel test robot <lkp@intel.com>, Oleg Nesterov <oleg@redhat.com>
CC: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5Btip=3Atimers/core_2/58=5D_kernel/?=
 =?US-ASCII?Q?time/posix-cpu-timers=2Ec=3A1307=3A9=3A_sp?=
 =?US-ASCII?Q?arse=3A_sparse=3A_incorrect_type_in_ar?=
 =?US-ASCII?Q?gument_1_=28different_address_spaces=29?=
In-Reply-To: <54BAD005-B341-4BE3-9935-C82C6852505D@grrlz.net>
References: <202608130320.o3cNs7Lr-lkp@intel.com> <54BAD005-B341-4BE3-9935-C82C6852505D@grrlz.net>
Message-ID: <633EF9A6-9F03-4A54-8227-7747FE57E669@grrlz.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 12 August 2026 20:42:03 BST, Bradley Morgan <include@grrlz.net> wrote:
>On 12 August 2026 20:40:00 BST, kernel test robot <lkp@intel.com> wrote:
>>tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
>timers/core
>>head:   4fa377c19e111c539a530a8200996b911ceff9ff
>>commit: a73d7f98e41a96d6e1bcb0e731ab185d9d67878e [2/58] posix-cpu-timers:
>Don't abuse lock_task_sighand() in handle_posix_cpu_timers()
>>config: microblaze-randconfig-r122-20260812
>(https://download.01.org/0day-ci/archive/20260813/202608130320.o3cNs7Lr-lkp@intel.com/config)
>>compiler: microblaze-linux-gcc (GCC) 11.5.0
>>sparse: v0.6.5-rc1
>>reproduce (this is a W=1 build):
>>(https://download.01.org/0day-ci/archive/20260813/202608130320.o3cNs7Lr-lkp@intel.com/reproduce)
>>
>>If you fix the issue in a separate patch/commit (i.e. not just a new
>>version of
>>the same patch/commit), kindly add following tags
>>| Reported-by: kernel test robot <lkp@intel.com>
>>| Closes:
>>https://lore.kernel.org/oe-kbuild-all/202608130320.o3cNs7Lr-lkp@intel.com/
>>
>>sparse warnings: (new ones prefixed by >>)
>>>> kernel/time/posix-cpu-timers.c:1307:9: sparse: sparse: incorrect type
>>in argument 1 (different address spaces) @@     expected struct spinlock
>>[usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>>   kernel/time/posix-cpu-timers.c:1307:9: sparse:     expected struct
>spinlock [usertype] *lock
>>   kernel/time/posix-cpu-timers.c:1307:9: sparse:     got struct spinlock
>[noderef] __rcu *
>>   kernel/time/posix-cpu-timers.c:1367:36: sparse: sparse: incorrect type
>in argument 1 (different address spaces) @@     expected struct spinlock
>[usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>>   kernel/time/posix-cpu-timers.c:1367:36: sparse:     expected struct
>spinlock [usertype] *lock
>>   kernel/time/posix-cpu-timers.c:1367:36: sparse:     got struct
>spinlock [noderef] __rcu *
>>   kernel/time/posix-cpu-timers.c: note: in included file:
>>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in
>argument 1 (different address spaces) @@     expected struct spinlock
>[usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>>   include/linux/sched/signal.h:749:37: sparse:     expected struct
>spinlock [usertype] *lock
>>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock
>[noderef] __rcu *
>>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in
>argument 1 (different address spaces) @@     expected struct spinlock
>[usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>>   include/linux/sched/signal.h:749:37: sparse:     expected struct
>spinlock [usertype] *lock
>>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock
>[noderef] __rcu *
>>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in
>argument 1 (different address spaces) @@     expected struct spinlock
>[usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>>   include/linux/sched/signal.h:749:37: sparse:     expected struct
>spinlock [usertype] *lock
>>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock
>[noderef] __rcu *
>>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in
>argument 1 (different address spaces) @@     expected struct spinlock
>[usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>>   include/linux/sched/signal.h:749:37: sparse:     expected struct
>spinlock [usertype] *lock
>>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock
>[noderef] __rcu *
>>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in
>argument 1 (different address spaces) @@     expected struct spinlock
>[usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>>   include/linux/sched/signal.h:749:37: sparse:     expected struct
>spinlock [usertype] *lock
>>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock
>[noderef] __rcu *
>>
>>vim +1307 kernel/time/posix-cpu-timers.c
>>
>>  1296	
>>  1297	static void handle_posix_cpu_timers(struct task_struct *tsk)
>>  1298	{
>>  1299		struct k_itimer *timer, *next;
>>  1300		unsigned long flags, start;
>>  1301		LIST_HEAD(firing);
>>  1302	
>>  1303		/*
>>  1304		 * tsk is current and ->sighand is stable, see the
>>  1305		 * tsk->exit_state check in run_posix_cpu_timers()
>>  1306		 */
>>> 1307		spin_lock_irqsave(&tsk->sighand->siglock, flags);
>>  1308	
>>  1309		do {
>>  1310			/*
>>  1311			 * On RT locking sighand lock does not disable interrupts,
>>  1312			 * so this needs to be careful vs. ticks. Store the current
>>  1313			 * jiffies value.
>>  1314			 */
>>  1315			start = READ_ONCE(jiffies);
>>  1316			barrier();
>>  1317	
>>  1318			/*
>>  1319			 * Here we take off tsk->signal->cpu_timers[N] and
>>  1320			 * tsk->cpu_timers[N] all the timers that are firing, and
>>  1321			 * put them on the firing list.
>>  1322			 */
>>  1323			check_thread_timers(tsk, &firing);
>>  1324	
>>  1325			check_process_timers(tsk, &firing);
>>  1326	
>>  1327			/*
>>  1328			 * The above timer checks have updated the expiry cache and
>>  1329			 * because nothing can have queued or modified timers after
>>  1330			 * sighand lock was taken above it is guaranteed to be
>>  1331			 * consistent. So the next timer interrupt fastpath check
>>  1332			 * will find valid data.
>>  1333			 *
>>  1334			 * If timer expiry runs in the timer interrupt context then
>>  1335			 * the loop is not relevant as timers will be directly
>>  1336			 * expired in interrupt context. The stub function below
>>  1337			 * returns always true which allows the compiler to
>>  1338			 * optimize the loop out.
>>  1339			 *
>>  1340			 * If timer expiry is deferred to task work context then
>>  1341			 * the following rules apply:
>>  1342			 *
>>  1343			 * - On !RT kernels no tick can have happened on this CPU
>>  1344			 *   after sighand lock was acquired because interrupts are
>>  1345			 *   disabled. So reenabling task work before dropping
>>  1346			 *   sighand lock and reenabling interrupts is race free.
>>  1347			 *
>>  1348			 * - On RT kernels ticks might have happened but the tick
>>  1349			 *   work ignored posix CPU timer handling because the
>>  1350			 *   CPUTIMERS_WORK_SCHEDULED bit is set. Reenabling work
>>  1351			 *   must be done very carefully including a check whether
>>  1352			 *   ticks have happened since the start of the timer
>>  1353			 *   expiry checks. posix_cpu_timers_enable_work() takes
>>  1354			 *   care of that and eventually lets the expiry checks
>>  1355			 *   run again.
>>  1356			 */
>>  1357		} while (!posix_cpu_timers_enable_work(tsk, start));
>>  1358	
>>  1359		/*
>>  1360		 * We must release sighand lock before taking any timer's lock.
>>  1361		 * There is a potential race with timer deletion here, as the
>>  1362		 * siglock now protects our private firing list.  We have set
>>  1363		 * the firing flag in each timer, so that a deletion attempt
>>  1364		 * that gets the timer lock before we do will give it up and
>>  1365		 * spin until we've taken care of that timer below.
>>  1366		 */
>>  1367		spin_unlock_irqrestore(&tsk->sighand->siglock, flags);
>>  1368	
>>  1369		/*
>>  1370		 * Now that all the timers on our list have the firing flag,
>>  1371		 * no one will touch their list entries but us.  We'll take
>>  1372		 * each timer's lock before clearing its firing flag, so no
>>  1373		 * timer call will interfere.
>>  1374		 */
>>  1375		list_for_each_entry_safe(timer, next, &firing, it.cpu.elist) {
>>  1376			bool cpu_firing;
>>  1377	
>>  1378			/*
>>  1379			 * spin_lock() is sufficient here even independent of the
>>  1380			 * expiry context. If expiry happens in hard interrupt
>>  1381			 * context it's obvious. For task work context it's safe
>>  1382			 * because all other operations on timer::it_lock happen in
>>  1383			 * task context (syscall or exit).
>>  1384			 */
>>  1385			spin_lock(&timer->it_lock);
>>  1386			list_del_init(&timer->it.cpu.elist);
>>  1387			cpu_firing = timer->it.cpu.firing;
>>  1388			timer->it.cpu.firing = false;
>>  1389			/*
>>  1390			 * If the firing flag is cleared then this raced with a
>>  1391			 * timer rearm/delete operation. So don't generate an
>>  1392			 * event.
>>  1393			 */
>>  1394			if (likely(cpu_firing))
>>  1395				cpu_timer_fire(timer);
>>  1396			/* See posix_cpu_timer_wait_running() */
>>  1397			rcu_assign_pointer(timer->it.cpu.handling, NULL);
>>  1398			spin_unlock(&timer->it_lock);
>>  1399		}
>>  1400	}
>>  1401	
>>
>>--
>>0-DAY CI Kernel Test Service
>>https://github.com/intel/lkp-tests/wiki
>>
>
>
>Oleg already addressed to something like  this, I think he said to nuke
>__rcu, which idm looking at and submitting.
>
>Thanks!


Suggested patch, Oleg, what do you think?

From 5e22f00b181c79202bef233d9266a18a4b7abaf9 Mon Sep 17 00:00:00 2001
From: Bradley Morgan <include@grrlz.net>
Date: Wed, 12 Aug 2026 23:52:12 +0000
Subject: [PATCH] signal: Remove the __rcu annotation from task_struct->sighand

sighand is not protected by RCU. It is protected by sighand->siglock,
and by tasklist_lock on the exit path, so the __rcu annotation on
task_struct->sighand describes neither, and sparse complains about
every direct ->siglock use because of it. That is exactly what the
kbuild robot is reporting now for posix-cpu-timers.

What actually keeps lock_task_sighand() safe is SLAB_TYPESAFE_BY_RCU
plus the siglock recheck, not this annotation. Oleg suggested just
dropping the annotation, so that is what this does, and the few rcu_*
accessors
get switched over to the READ_ONCE/WRITE_ONCE/smp_store_release they
already expand to.

This cannot really be split... with the annotation gone the leftover
rcu_* sites are sparse errors, and converting them first while the
annotation stays leaves warnings, so there is no file by file split
that keeps every commit clean. With CONFIG_PROVE_LOCKING off the
generated code is identical, with it on the only difference is the RCU
lockdep assertions that came with the removed accessors.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608130320.o3cNs7Lr-lkp@intel.com/
Suggested-by: Oleg Nesterov <oleg@redhat.com>
Link: https://lore.kernel.org/r/ak5wjJSOyqpXKBdj@redhat.com
Fixes: 913292c97d75 ("sched.h: Annotate sighand_struct with __rcu")
Signed-off-by: Bradley Morgan <include@grrlz.net>
---
 fs/exec.c                | 7 ++++ +-
 include/linux/sched.h    | 2 +-
 kernel/exit.c            | 3 +--
 kernel/fork.c            | 2 +-
 kernel/signal.c          | 6 +++---
 net/sunrpc/svc.c         | 2 +-
 security/selinux/hooks.c | 4 ++--
 7 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index a14f28b15607..9e3d703329ab 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1078,7 +1078,12 @@ static int unshare_sighand(struct task_struct *me)
 		spin_lock(&oldsighand->siglock);
 		memcpy(newsighand->action, oldsighand->action,
 		       sizeof(newsighand->action));
-		rcu_assign_pointer(me->sighand, newsighand);
+		/*
+		 * Pairs with the READ_ONCE() in lock_task_sighand(): the
+		 * ->action copy above has to be visible before anyone can
+		 * see the new ->sighand.
+		 */
+		smp_store_release(&me->sighand, newsighand);
 		spin_unlock(&oldsighand->siglock);
 		write_unlock_irq(&tasklist_lock);
 
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 499943987c1a..ef5bcc8caf74 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1216,7 +1216,7 @@ struct task_struct {
 
 	/* Signal handlers: */
 	struct signal_struct		*signal;
-	struct sighand_struct __rcu		*sighand;
+	struct sighand_struct		*sighand;
 	sigset_t			blocked;
 	sigset_t			real_blocked;
 	/* Restored if set_restore_sigmask() was used: */
diff --git a/kernel/exit.c b/kernel/exit.c
index 182c06671c78..45a9354a6a77 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -163,8 +163,7 @@ static void __exit_signal(struct release_task_post *post, struct task_struct *ts
 	struct tty_struct *tty;
 	u64 utime, stime;
 
-	sighand = rcu_dereference_check(tsk->sighand,
-					lockdep_tasklist_lock_is_held());
+	sighand = READ_ONCE(tsk->sighand);
 	spin_lock(&sighand->siglock);
 
 #ifdef CONFIG_POSIX_TIMERS
diff --git a/kernel/fork.c b/kernel/fork.c
index 86b6351ed120..202915e85b4e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1702,7 +1702,7 @@ static int copy_sighand(u64 clone_flags, struct task_struct *tsk)
 		return 0;
 	}
 	sig = kmem_cache_alloc(sighand_cachep, GFP_KERNEL);
-	RCU_INIT_POINTER(tsk->sighand, sig);
+	WRITE_ONCE(tsk->sighand, sig);
 	if (!sig)
 		return -ENOMEM;
 
diff --git a/kernel/signal.c b/kernel/signal.c
index a5e15bf09d31..04cfefe86208 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1354,7 +1354,7 @@ struct sighand_struct *lock_task_sighand(struct task_struct *tsk,
 
 	rcu_read_lock();
 	for (;;) {
-		sighand = rcu_dereference(tsk->sighand);
+		sighand = READ_ONCE(tsk->sighand);
 		if (unlikely(sighand == NULL)) {
 			/*
 			 * Pairs with the smp_store_release() in
@@ -1378,7 +1378,7 @@ struct sighand_struct *lock_task_sighand(struct task_struct *tsk,
 		 * must see ->sighand == NULL.
 		 */
 		spin_lock_irqsave(&sighand->siglock, *flags);
-		if (likely(sighand == rcu_access_pointer(tsk->sighand)))
+		if (likely(sighand == READ_ONCE(tsk->sighand)))
 			break;
 		spin_unlock_irqrestore(&sighand->siglock, *flags);
 	}
@@ -1393,7 +1393,7 @@ void lockdep_assert_task_sighand_held(struct task_struct *task)
 	struct sighand_struct *sighand;
 
 	rcu_read_lock();
-	sighand = rcu_dereference(task->sighand);
+	sighand = READ_ONCE(task->sighand);
 	if (sighand)
 		lockdep_assert_held(&sighand->siglock);
 	else
diff --git a/net/sunrpc/svc.c b/net/sunrpc/svc.c
index 05c3e6e2f659..7c681b9f829b 100644
--- a/net/sunrpc/svc.c
+++ b/net/sunrpc/svc.c
@@ -1276,7 +1276,7 @@ static void svc_unregister(const struct svc_serv *serv, struct net *net)
 	}
 
 	rcu_read_lock();
-	sighand = rcu_dereference(current->sighand);
+	sighand = READ_ONCE(current->sighand);
 	spin_lock_irqsave(&sighand->siglock, flags);
 	recalc_sigpending();
 	spin_unlock_irqrestore(&sighand->siglock, flags);
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 035aaf113d1d..d6423a05ca6c 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -2586,7 +2586,7 @@ static void selinux_bprm_committed_creds(const struct linux_binprm *bprm)
 	if (rc) {
 		clear_itimer();
 
-		spin_lock_irq(&unrcu_pointer(current->sighand)->siglock);
+		spin_lock_irq(&current->sighand->siglock);
 		if (!fatal_signal_pending(current)) {
 			flush_sigqueue(&current->pending);
 			flush_sigqueue(&current->signal->shared_pending);
@@ -2594,7 +2594,7 @@ static void selinux_bprm_committed_creds(const struct linux_binprm *bprm)
 			sigemptyset(&current->blocked);
 			recalc_sigpending();
 		}
-		spin_unlock_irq(&unrcu_pointer(current->sighand)->siglock);
+		spin_unlock_irq(&current->sighand->siglock);
 	}
 
 	/* Wake up the parent if it is waiting so that it can recheck
-- 
2.47.3


I'm feeling it's a bit, broad, but sparse still cries if I just remove the
annotation from sched.h.. honestly this is odd.

Thanks!
