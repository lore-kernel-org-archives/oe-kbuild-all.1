Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4205615E89
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708066194; cv=none; b=sbzRY+6Wh8N/0I1vOjKGrBShYe2kNfS77JbxnSax94hoWIj9plo5EKhX0qw89e1CQbocqB0ixJK9kzLJKTARlWT2q1KUTJfUA2jvAAm7ZRTGrFbHy5lz7PipIC1nP1yPssqsPyylzxZpW7RzNAEddBvwackzw8m2oz9pVAy2L8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708066194; c=relaxed/simple;
	bh=jWTsutDJbymqH7cJmh1ed2n2/ng2WMku4cqJIFB6BPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fYmWK4IBw+rvG1aiw8QtTev97IzPrPjJN4TF4FmZJSBbEp6R4lwdnD/tbvsyeXXAlGQJECpzslkRsikyL5M3YKka+1EqJM8O00yIKq6/5WSfBcu2N0ODVYLdB8gv1vb8+F5LBjTfNBxZC+eEFrAMImV4O5NepXnsoU65/uvdHOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyHIu1X3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyHIu1X3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708066192; x=1739602192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWTsutDJbymqH7cJmh1ed2n2/ng2WMku4cqJIFB6BPQ=;
  b=LyHIu1X3nXzy2r3+CT9uxi8/8Zru3U0q12FP2Opux7a/zFLXNToLrMaa
   APWEBcDxLPVvpmD1JdR9+sxU0rbkUnY3jSy0FkSNRLqLy/Dt5d6EsIPeX
   E9siFUHJH5mvLSsCJa0wSHI60kI/kYoizO/nrM2VQt5RNXWFzNEDAW4B9
   uZgUkFJknk4pB1SRs3N3YmfnLzReuzwlVmSwFoSPnC9JirVVYq8kXgUiy
   8UA/4HQo2Sk96vo7Xe2+aTR0kl0ZAQZqXu1UaUbGr0NgUVUgAhaIOA8wm
   d7WN+W0v659CTxwEQIxQhRHPMwdD+jZusYRX4MUVvnK2f2suFfV9cmlqQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="19609289"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="19609289"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 22:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="3737465"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Feb 2024 22:49:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ras2R-00013Y-0L;
	Fri, 16 Feb 2024 06:49:39 +0000
Date: Fri, 16 Feb 2024 14:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/44] kernel/sched/fair_eevdf.c:12894:5:
 warning: no previous prototype for 'scheduler_switch_eevdf'
Message-ID: <202402161401.0yTBEwaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   f0ad352e8fc4195bce44c3227c84dc084608600f
commit: 33508a693bdea05c8d33b4b664c19ce2886b8033 [34/44] CHROMIUM: sched: dynamically switch between cfs and eevdf
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240216/202402161401.0yTBEwaN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161401.0yTBEwaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161401.0yTBEwaN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair_eevdf.c:708:6: warning: no previous prototype for 'update_entity_lag' [-Wmissing-prototypes]
     708 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/fair_eevdf.c: In function 'update_curr_se':
   kernel/sched/fair_eevdf.c:1244:42: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1244 |                 struct sched_statistics *stats;
         |                                          ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_wait_start':
   kernel/sched/fair_eevdf.c:1312:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1312 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_wait_end':
   kernel/sched/fair_eevdf.c:1332:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1332 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_enqueue_sleeper':
   kernel/sched/fair_eevdf.c:1376:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1376 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'set_next_entity':
   kernel/sched/fair_eevdf.c:5250:42: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    5250 |                 struct sched_statistics *stats;
         |                                          ^~~~~
   kernel/sched/fair_eevdf.c: At top level:
>> kernel/sched/fair_eevdf.c:12894:5: warning: no previous prototype for 'scheduler_switch_eevdf' [-Wmissing-prototypes]
   12894 | int scheduler_switch_eevdf(void *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair_eevdf.c:12955:5: warning: no previous prototype for 'sched_use_eevdf' [-Wmissing-prototypes]
   12955 | int sched_use_eevdf(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~


vim +/scheduler_switch_eevdf +12894 kernel/sched/fair_eevdf.c

 12893	
 12894	int scheduler_switch_eevdf(void *arg)
 12895	{
 12896		unsigned int use_eevdf = (unsigned int)((size_t) arg);
 12897		int cpu;
 12898		struct task_struct *p;
 12899		struct rq *rq;
 12900		int num_deq;
 12901		struct list_head* cpu_list;
 12902		struct list_head* cfs_tasks;
 12903		struct rq_flags rf;
 12904	
 12905		// 1. Remove all the scheduling entities from all rq.
 12906		// 2. Change the use_eevdf rq flags.
 12907		// 3. Add all the entities removed back to the rqs.
 12908		lockdep_assert_irqs_disabled();
 12909	
 12910		if (use_eevdf == sysctl_sched_use_eevdf)
 12911			return 0;
 12912	
 12913		// Dequeue all the tasks
 12914		for_each_cpu(cpu, cpu_possible_mask) {
 12915			num_deq = 0;
 12916			cpu_list = &per_cpu(eevdf_switch_tasks, (cpu));
 12917	
 12918			INIT_LIST_HEAD(cpu_list);
 12919			// Since this is running in a stop_machine we don't need to take the
 12920			// lock, but to make lockdep_asserts happy.
 12921			rq = cpu_rq(cpu);
 12922			rq_lock(rq, &rf);
 12923			cfs_tasks = &rq->cfs_tasks;
 12924			while(!list_empty(cfs_tasks)) {
 12925				p = list_first_entry(cfs_tasks, struct task_struct, se.group_node);
 12926				num_deq++;
 12927				dequeue_task(rq, p, DEQUEUE_SAVE);
 12928				list_add(&p->se.group_node, cpu_list);
 12929			}
 12930			if (rb_first_cached(&rq->cfs.tasks_timeline) || rq->cfs.nr_running)
 12931				pr_err("unexpected tasks on rq: num_deq=%d, cfs_rq->nr_running=%d\n",
 12932						num_deq, rq->cfs.nr_running);
 12933			rq_unlock(rq, &rf);
 12934		}
 12935	
 12936		// Switch the EEVDF flag
 12937		sysctl_sched_use_eevdf = use_eevdf;
 12938	
 12939		// Enqueue all the taks back into the rqs
 12940		for_each_cpu(cpu, cpu_possible_mask) {
 12941			cpu_list = &per_cpu(eevdf_switch_tasks, (cpu));
 12942			rq = cpu_rq(cpu);
 12943			rq_lock(rq, &rf);
 12944			while(!list_empty(cpu_list)) {
 12945				p = list_first_entry(cpu_list, struct task_struct, se.group_node);
 12946				list_del(&p->se.group_node);
 12947				enqueue_task(rq, p, ENQUEUE_RESTORE);
 12948			}
 12949			rq_unlock(rq, &rf);
 12950		}
 12951	
 12952		return 0;
 12953	}
 12954	
 12955	int sched_use_eevdf(struct ctl_table *table, int write,
 12956				  void *buffer, size_t *lenp, loff_t *ppos)
 12957	{
 12958		struct ctl_table t;
 12959		int err;
 12960		unsigned int state = sysctl_sched_use_eevdf;
 12961	
 12962		t = *table;
 12963		t.data = &state;
 12964		err = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
 12965		if (err < 0)
 12966			return err;
 12967	
 12968		if (write)
 12969			stop_machine_cpuslocked(
 12970				scheduler_switch_eevdf, (void *)((size_t)state), NULL);
 12971	
 12972		return err;
 12973	}
 12974	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
