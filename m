Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D8615CE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 06:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688712055; x=1720248055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wRRmswOihaK4wGL5kJDO98lCQUJOW/ruepjc84XzJCM=;
  b=a3veXzLwwc+3He4s+9bWCk/zXE/RWXikQLOt1CvwKWsdtfMC7VzvTl1g
   yybQqRfGzNxqtUcfCjNtLpdHc6AZAfz5AGaBqQ623IBpCtZfm0TRC0b1h
   2pMcs8mko7B6J0w8Zo8rxq3urqN7yKs/PFS8B3qCWNOVlgkzSgV94FBin
   wOqTiMPo/RfhtCxm3SV/D7nNwokgye3r3MetDmIDNLbUACjPjIr+rUk8v
   ShHsWCA8HvMB6nXm9x2PSzV28FqFwq4yA5jbBAXJlFd+LX5duiQUvpa+3
   6HhcYQlMuXiaRiTw9XF393HzadWYHKhjF3n3nh34zeuTdBQfQNxX7y+Pi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427500676"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="427500676"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 23:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="833247490"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="833247490"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2023 23:40:53 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHf9A-0001qQ-2b;
	Fri, 07 Jul 2023 06:40:52 +0000
Date: Fri, 7 Jul 2023 14:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 364/386] kernel/sched/alt_core.c:1007:38: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202307071430.j5DOc3Bj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   ea6d5107f9aa76407998568ad4cbcf54879ee0c0
commit: 1ccb501e2339eb0caf90af913c9eeebd37e6aa3c [364/386] sched/alt: [Sync] 596ff4a09b89 cpumask: re-introduce constant-sized cpumask optimizations
config: i386-randconfig-i061-20230704 (https://download.01.org/0day-ci/archive/20230707/202307071430.j5DOc3Bj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071430.j5DOc3Bj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071430.j5DOc3Bj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/alt_core.c:1007:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:1007:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:1007:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:3996:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> kernel/sched/alt_core.c:3996:15: sparse:    struct task_struct *
>> kernel/sched/alt_core.c:3996:15: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:4714:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4714:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4714:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5254:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5254:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5254:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5404:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5404:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5404:22: sparse:    struct task_struct *
>> kernel/sched/alt_core.c:6969:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:6969:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:6969:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:533:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/alt_core.c:552:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/alt_core.c:1155:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1155:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1155:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1155:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1155:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1155:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1155:37: sparse:    struct task_struct [noderef] __rcu *

vim +1007 kernel/sched/alt_core.c

cedcd3e67433b3 Alfred Chen 2019-08-19   997  
cedcd3e67433b3 Alfred Chen 2019-08-19   998  /*
cedcd3e67433b3 Alfred Chen 2019-08-19   999   * resched_curr - mark rq's current task 'to be rescheduled now'.
cedcd3e67433b3 Alfred Chen 2019-08-19  1000   *
cedcd3e67433b3 Alfred Chen 2019-08-19  1001   * On UP this means the setting of the need_resched flag, on SMP it
cedcd3e67433b3 Alfred Chen 2019-08-19  1002   * might also involve a cross-CPU call to trigger the scheduler on
cedcd3e67433b3 Alfred Chen 2019-08-19  1003   * the target CPU.
cedcd3e67433b3 Alfred Chen 2019-08-19  1004   */
cedcd3e67433b3 Alfred Chen 2019-08-19  1005  void resched_curr(struct rq *rq)
cedcd3e67433b3 Alfred Chen 2019-08-19  1006  {
cedcd3e67433b3 Alfred Chen 2019-08-19 @1007  	struct task_struct *curr = rq->curr;
cedcd3e67433b3 Alfred Chen 2019-08-19  1008  	int cpu;
cedcd3e67433b3 Alfred Chen 2019-08-19  1009  
cedcd3e67433b3 Alfred Chen 2019-08-19  1010  	lockdep_assert_held(&rq->lock);
cedcd3e67433b3 Alfred Chen 2019-08-19  1011  
cedcd3e67433b3 Alfred Chen 2019-08-19  1012  	if (test_tsk_need_resched(curr))
cedcd3e67433b3 Alfred Chen 2019-08-19  1013  		return;
cedcd3e67433b3 Alfred Chen 2019-08-19  1014  
cedcd3e67433b3 Alfred Chen 2019-08-19  1015  	cpu = cpu_of(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  1016  	if (cpu == smp_processor_id()) {
cedcd3e67433b3 Alfred Chen 2019-08-19  1017  		set_tsk_need_resched(curr);
cedcd3e67433b3 Alfred Chen 2019-08-19  1018  		set_preempt_need_resched();
cedcd3e67433b3 Alfred Chen 2019-08-19  1019  		return;
cedcd3e67433b3 Alfred Chen 2019-08-19  1020  	}
cedcd3e67433b3 Alfred Chen 2019-08-19  1021  
cedcd3e67433b3 Alfred Chen 2019-08-19  1022  	if (set_nr_and_not_polling(curr))
cedcd3e67433b3 Alfred Chen 2019-08-19  1023  		smp_send_reschedule(cpu);
cedcd3e67433b3 Alfred Chen 2019-08-19  1024  	else
cedcd3e67433b3 Alfred Chen 2019-08-19  1025  		trace_sched_wake_idle_without_ipi(cpu);
cedcd3e67433b3 Alfred Chen 2019-08-19  1026  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1027  

:::::: The code at line 1007 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
