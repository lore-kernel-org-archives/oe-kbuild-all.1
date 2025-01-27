Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9249B25A63B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 18:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738002639; cv=none; b=YpGBW7K4Raa+Lol8ALRmYzpyhztLl9Wk2YW1N01WcW+e7MQOhGfOdZc4WLGS3Jw31wFgP9SbMD+/iBKCKk1WlgRmzxzXxs2+uwyZ1gbl0+EYbBvJMpzVADOXDp+plpf8GpLgdtLzm6+ehpHHI/nBZw0q1C214CSy9WjHWAIXFu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738002639; c=relaxed/simple;
	bh=Derl7P/xPYZziMIl4bgcPvpyqYLmt7LKWvc+L/nnsfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ap3nvLQOD8lOGAQxMuH9wt23IqP1r91T8L6tfuklXODBGb3uaE26imD28294QO9Z3z+WSFAu3FG/BGkrdtOO23/dX45yDLOkSh1/74VL+CHux4OlxL3hWovomsE+oK0GZXXd8OEV72aMkkrhJLKV1IAmIj7oHBoXaPX7tV+dg4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgP9eXmG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgP9eXmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738002637; x=1769538637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Derl7P/xPYZziMIl4bgcPvpyqYLmt7LKWvc+L/nnsfs=;
  b=UgP9eXmGEPdfKLlcZwK3OdntPJbI7yOWX2NtzRcmVhn5LUuo2EltAbZG
   hu2dCdViQyM4qFH6yPGPF2DBNhMSaQDPQ8kpL8CkBrhJeXTpeTQSFMRkv
   m7VEVUDyOD5OHyAZih7ozHRdGJ7U3jdSo6oKvEUh8L0dovL66346v6N5F
   onATEAoj3c5AOdyaepAPKzKGuS/6vqKbJ8OEH98sn6a291L7lTTyKZll0
   bQ+e6qGH8ww1ebo/HrnThSXYUGvSkfZbzWz7U/JIMx21+byw15aAiFnez
   W6RxJ+7QK3PVO/0SG+CIn2tLtPX1sNWu7tUg9IBXuR29DmDwHKYMSyTRr
   A==;
X-CSE-ConnectionGUID: xnAKybx2RA20p5EA5Zo2Og==
X-CSE-MsgGUID: zXkkS4UwQk6JHoTFQa7T3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38508115"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="38508115"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 10:30:37 -0800
X-CSE-ConnectionGUID: KSzmW1xUQ2G17UNkiPIILw==
X-CSE-MsgGUID: 2yGgvIrbTVGNVSLR8FJ+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="108302413"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jan 2025 10:30:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcTsX-000h3r-1a;
	Mon, 27 Jan 2025 18:30:33 +0000
Date: Tue, 28 Jan 2025 02:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 83/83] kernel/sched/bore.c:145:53:
 sparse: sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202501280250.B4Jy4gG1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: c358c65925524fe1dfe962d59966a6aa01b5fc9b [83/83] linux6.13.y-bore5.9.6
config: csky-randconfig-r111-20250127 (https://download.01.org/0day-ci/archive/20250128/202501280250.B4Jy4gG1-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250128/202501280250.B4Jy4gG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280250.B4Jy4gG1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/bore.c:145:53: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sched/bore.c:145:53: sparse:     expected void *buffer
   kernel/sched/bore.c:145:53: sparse:     got void [noderef] __user *buffer
>> kernel/sched/bore.c:287:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/bore.c:287:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/bore.c:287:38: sparse:    struct task_struct *
>> kernel/sched/bore.c:258:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *next @@     got struct task_struct [noderef] __rcu *real_parent @@
>> kernel/sched/bore.c:197:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sched/bore.c:296:6: sparse: sparse: context imbalance in 'sched_clone_bore' - wrong count at exit

vim +145 kernel/sched/bore.c

   142	
   143	int sched_bore_update_handler(const struct ctl_table *table, int write,
   144		void __user *buffer, size_t *lenp, loff_t *ppos) {
 > 145		int ret = proc_dou8vec_minmax(table, write, buffer, lenp, ppos);
   146		if (ret || !write)
   147			return ret;
   148	
   149		reset_task_weights_bore();
   150	
   151		return 0;
   152	}
   153	
   154	#define for_each_child(p, t) \
   155		list_for_each_entry(t, &(p)->children, sibling)
   156	
   157	static u32 count_entries_upto2(struct list_head *head) {
   158		struct list_head *next = head->next;
   159		return (next != head) + (next->next != head);
   160	}
   161	
   162	static inline void init_task_burst_cache_lock(struct task_struct *p) {
   163		spin_lock_init(&p->se.child_burst.lock);
   164		spin_lock_init(&p->se.group_burst.lock);
   165	}
   166	
   167	static inline bool burst_cache_expired(struct sched_burst_cache *bc, u64 now)
   168	{return (s64)(bc->timestamp + sched_burst_cache_lifetime - now) < 0;}
   169	
   170	static void update_burst_cache(struct sched_burst_cache *bc,
   171		struct task_struct *p, u32 cnt, u32 sum, u64 now) {
   172		u8 avg = cnt ? sum / cnt : 0;
   173		bc->score = max(avg, p->se.burst_penalty);
   174		bc->count = cnt;
   175		bc->timestamp = now;
   176	}
   177	
   178	static inline void update_child_burst_direct(struct task_struct *p, u64 now) {
   179		u32 cnt = 0, sum = 0;
   180		struct task_struct *child;
   181	
   182		for_each_child(p, child) {
   183			if (!task_is_bore_eligible(child)) continue;
   184			cnt++;
   185			sum += child->se.burst_penalty;
   186		}
   187	
   188		update_burst_cache(&p->se.child_burst, p, cnt, sum, now);
   189	}
   190	
   191	static inline u8 inherit_burst_direct(
   192		struct task_struct *p, u64 now, u64 clone_flags) {
   193		struct task_struct *parent = p;
   194		struct sched_burst_cache *bc;
   195	
   196		if (clone_flags & CLONE_PARENT)
 > 197			parent = parent->real_parent;
   198	
   199		bc = &parent->se.child_burst;
   200		guard(spinlock)(&bc->lock);
   201		if (burst_cache_expired(bc, now))
   202			update_child_burst_direct(parent, now);
   203	
   204		return bc->score;
   205	}
   206	
   207	static void update_child_burst_topological(
   208		struct task_struct *p, u64 now, u32 depth, u32 *acnt, u32 *asum) {
   209		u32 cnt = 0, dcnt = 0, sum = 0;
   210		struct task_struct *child, *dec;
   211		struct sched_burst_cache *bc __maybe_unused;
   212	
   213		for_each_child(p, child) {
   214			dec = child;
   215			while ((dcnt = count_entries_upto2(&dec->children)) == 1)
   216				dec = list_first_entry(&dec->children, struct task_struct, sibling);
   217			
   218			if (!dcnt || !depth) {
   219				if (!task_is_bore_eligible(dec)) continue;
   220				cnt++;
   221				sum += dec->se.burst_penalty;
   222				continue;
   223			}
   224			bc = &dec->se.child_burst;
   225			spin_lock(&bc->lock);
   226			if (!burst_cache_expired(bc, now)) {
   227				cnt += bc->count;
   228				sum += (u32)bc->score * bc->count;
   229				if (sched_burst_cache_stop_count <= cnt) {
   230					spin_unlock(&bc->lock);
   231					break;
   232				}
   233				spin_unlock(&bc->lock);
   234				continue;
   235			}
   236			update_child_burst_topological(dec, now, depth - 1, &cnt, &sum);
   237			spin_unlock(&bc->lock);
   238		}
   239	
   240		update_burst_cache(&p->se.child_burst, p, cnt, sum, now);
   241		*acnt += cnt;
   242		*asum += sum;
   243	}
   244	
   245	static inline u8 inherit_burst_topological(
   246		struct task_struct *p, u64 now, u64 clone_flags) {
   247		struct task_struct *anc = p;
   248		struct sched_burst_cache *bc;
   249		u32 cnt = 0, sum = 0;
   250		u32 base_child_cnt = 0;
   251	
   252		if (clone_flags & CLONE_PARENT) {
   253			anc = anc->real_parent;
   254			base_child_cnt = 1;
   255		}
   256	
   257		for (struct task_struct *next;
 > 258			 anc != (next = anc->real_parent) &&
   259			 	count_entries_upto2(&anc->children) <= base_child_cnt;) {
   260			anc = next;
   261			base_child_cnt = 1;
   262		}
   263	
   264		bc = &anc->se.child_burst;
   265		guard(spinlock)(&bc->lock);
   266		if (burst_cache_expired(bc, now))
   267			update_child_burst_topological(
   268				anc, now, sched_burst_fork_atavistic - 1, &cnt, &sum);
   269	
   270		return bc->score;
   271	}
   272	
   273	static inline void update_tg_burst(struct task_struct *p, u64 now) {
   274		struct task_struct *task;
   275		u32 cnt = 0, sum = 0;
   276	
   277		for_each_thread(p, task) {
   278			if (!task_is_bore_eligible(task)) continue;
   279			cnt++;
   280			sum += task->se.burst_penalty;
   281		}
   282	
   283		update_burst_cache(&p->se.group_burst, p, cnt, sum, now);
   284	}
   285	
   286	static inline u8 inherit_burst_tg(struct task_struct *p, u64 now) {
 > 287		struct task_struct *parent = rcu_dereference(p->group_leader);
   288		struct sched_burst_cache *bc = &parent->se.group_burst;
   289		guard(spinlock)(&bc->lock);
   290		if (burst_cache_expired(bc, now))
   291			update_tg_burst(parent, now);
   292	
   293		return bc->score;
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
