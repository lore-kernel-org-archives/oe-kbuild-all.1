Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74A654
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 06:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683007696; x=1714543696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oIJ9eiHZ1ZuDWMUayvxatD4tI2f7tGgPcUeoyzeZLnA=;
  b=H3cHKg1R2mV9dEPPDWjHnhD4PEA/RrJGorSp8i3crWyYBd5FXfCmVIRQ
   AIUw0eIsY8pQGt3okLaP+6iUCWMpaNItGU0+2AgN28LlA4RkHxnRp89LF
   uxjbOfJwkuSK5scLa4b9HrvpopU1St1d4AxbuN1pFFmdnQx0S03PGu8zq
   iYgAW1bRBCSTYRwKPmbbEidxBf/3nIYmYsG52O1rbc0lYZDRP/rNSOcLz
   VvbhSjzkEEL84XFdzKiDaQNyMWlun2GXruR7TWwu1Rb33nSm7GAneIQe8
   1azz1n1optiqOlw30ba8QAftFLsujW4nH7im6K6zGDw7VSgqopKUFyhU2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="347132291"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="347132291"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 23:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="690164125"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="690164125"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 May 2023 23:08:14 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptjBN-0000sW-1f;
	Tue, 02 May 2023 06:08:13 +0000
Date: Tue, 2 May 2023 14:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 303/395] kernel/sched/alt_core.c:968:38: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202305021434.EKiRbAjn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   6a80d978aa1f981122f7478fedea389aa9475f9d
commit: 5dbca3a371400fe69ad2177b7a6c9d6436dd1fa0 [303/395] sched/alt: [Sync] f5d39b020809 freezer,sched: Rewrite core freezer logic
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230502/202305021434.EKiRbAjn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/zen-kernel/zen-kernel/commit/5dbca3a371400fe69ad2177b7a6c9d6436dd1fa0
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 5dbca3a371400fe69ad2177b7a6c9d6436dd1fa0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021434.EKiRbAjn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/alt_core.c:968:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:968:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:968:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:3813:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> kernel/sched/alt_core.c:3813:15: sparse:    struct task_struct *
>> kernel/sched/alt_core.c:3813:15: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:4525:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4525:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4525:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5059:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5059:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5059:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5209:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5209:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5209:22: sparse:    struct task_struct *
>> kernel/sched/alt_core.c:6712:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:6712:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:6712:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:495:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/alt_core.c:514:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *

vim +968 kernel/sched/alt_core.c

8b025fc742d760 Alfred Chen 2019-08-19  958  
8b025fc742d760 Alfred Chen 2019-08-19  959  /*
8b025fc742d760 Alfred Chen 2019-08-19  960   * resched_curr - mark rq's current task 'to be rescheduled now'.
8b025fc742d760 Alfred Chen 2019-08-19  961   *
8b025fc742d760 Alfred Chen 2019-08-19  962   * On UP this means the setting of the need_resched flag, on SMP it
8b025fc742d760 Alfred Chen 2019-08-19  963   * might also involve a cross-CPU call to trigger the scheduler on
8b025fc742d760 Alfred Chen 2019-08-19  964   * the target CPU.
8b025fc742d760 Alfred Chen 2019-08-19  965   */
8b025fc742d760 Alfred Chen 2019-08-19  966  void resched_curr(struct rq *rq)
8b025fc742d760 Alfred Chen 2019-08-19  967  {
8b025fc742d760 Alfred Chen 2019-08-19 @968  	struct task_struct *curr = rq->curr;
8b025fc742d760 Alfred Chen 2019-08-19  969  	int cpu;
8b025fc742d760 Alfred Chen 2019-08-19  970  
8b025fc742d760 Alfred Chen 2019-08-19  971  	lockdep_assert_held(&rq->lock);
8b025fc742d760 Alfred Chen 2019-08-19  972  
8b025fc742d760 Alfred Chen 2019-08-19  973  	if (test_tsk_need_resched(curr))
8b025fc742d760 Alfred Chen 2019-08-19  974  		return;
8b025fc742d760 Alfred Chen 2019-08-19  975  
8b025fc742d760 Alfred Chen 2019-08-19  976  	cpu = cpu_of(rq);
8b025fc742d760 Alfred Chen 2019-08-19  977  	if (cpu == smp_processor_id()) {
8b025fc742d760 Alfred Chen 2019-08-19  978  		set_tsk_need_resched(curr);
8b025fc742d760 Alfred Chen 2019-08-19  979  		set_preempt_need_resched();
8b025fc742d760 Alfred Chen 2019-08-19  980  		return;
8b025fc742d760 Alfred Chen 2019-08-19  981  	}
8b025fc742d760 Alfred Chen 2019-08-19  982  
8b025fc742d760 Alfred Chen 2019-08-19  983  	if (set_nr_and_not_polling(curr))
8b025fc742d760 Alfred Chen 2019-08-19  984  		smp_send_reschedule(cpu);
8b025fc742d760 Alfred Chen 2019-08-19  985  	else
8b025fc742d760 Alfred Chen 2019-08-19  986  		trace_sched_wake_idle_without_ipi(cpu);
8b025fc742d760 Alfred Chen 2019-08-19  987  }
8b025fc742d760 Alfred Chen 2019-08-19  988  

:::::: The code at line 968 was first introduced by commit
:::::: 8b025fc742d76091232a7404a7ad09c8cad61492 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
