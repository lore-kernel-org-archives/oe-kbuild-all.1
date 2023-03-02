Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E8D524
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 20:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677789577; x=1709325577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zCVmhkbpwQ6vegWeL2cUoAx3TUtAT40mp8HpwXVBGAk=;
  b=FyUnCCiePfLpOyCaIpD8uXLvFuSu/HVv20ocgWd2+03sDeobLuK1LvrI
   wA+s+ed71YkFwni4QIZLlJz39PwsAhHXIyTj4N4OXlIWQA4RsPnzn2+or
   MVtFh//ejMN9TIyXoxjNBspt5zNgO8yzhTx8L8drD2D5MRq6x7CBx/O5k
   DO+NhSpNYyngiKmldO8FiUc0tNCrrNr/EE9NRGLbKhcyUpldzj4A0Ru7X
   RparC26CFMZZIvD24G3fXL6UVzAD3+YdyvK2KgFl6hxEulCVbQjG4Nh4/
   6p01kPfs/PTEQNdX83wRj81X9g29Un2X00iJvoPfdP/5RZ3hRYm2zM16q
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362442579"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="362442579"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 12:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="798973359"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="798973359"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 12:39:33 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXpi8-0000ru-2p;
	Thu, 02 Mar 2023 20:39:32 +0000
Date: Fri, 3 Mar 2023 04:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 295/362] kernel/sched/alt_core.c:7209:57: error:
 implicit declaration of function 'cpu_coregroup_mask'; did you mean
 'cpu_core_mask'?
Message-ID: <202303030417.k63vYnLJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   2a811c44752ac1409f134484912a4664726c399b
commit: 758c39a103c58a35cb772408e0ceb8ff65399e12 [295/362] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230303/202303030417.k63vYnLJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/758c39a103c58a35cb772408e0ceb8ff65399e12
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 758c39a103c58a35cb772408e0ceb8ff65399e12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030417.k63vYnLJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:632:15: error: conflicting types for 'sched_cpu_util'; have 'long unsigned int(int,  long unsigned int)'
     632 | unsigned long sched_cpu_util(int cpu, unsigned long max)
         |               ^~~~~~~~~~~~~~
   In file included from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:14:
   include/linux/sched.h:2319:15: note: previous declaration of 'sched_cpu_util' with type 'long unsigned int(int)'
    2319 | unsigned long sched_cpu_util(int cpu);
         |               ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
     989 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1004:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1004 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1006 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1192:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
    1192 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:2339:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2339 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2372:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2372 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__schedule':
   kernel/sched/alt_core.c:4558:49: error: 'PF_FROZEN' undeclared (first use in this function); did you mean 'PF_ROSE'?
    4558 |                                 !(prev->flags & PF_FROZEN);
         |                                                 ^~~~~~~~~
         |                                                 PF_ROSE
   kernel/sched/alt_core.c:4558:49: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/alt_core.c: In function 'sched_submit_work':
   kernel/sched/alt_core.c:4674:13: error: implicit declaration of function 'tsk_is_pi_blocked'; did you mean 'osq_is_locked'? [-Werror=implicit-function-declaration]
    4674 |         if (tsk_is_pi_blocked(tsk))
         |             ^~~~~~~~~~~~~~~~~
         |             osq_is_locked
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:4734:35: warning: no previous prototype for 'schedule_user' [-Wmissing-prototypes]
    4734 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^~~~~~~~~~~~~
   kernel/sched/alt_core.c:6770:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    6770 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6980:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    6980 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7019:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7019 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7083:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7083 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7103:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7103 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7145:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7145 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
>> kernel/sched/alt_core.c:7209:57: error: implicit declaration of function 'cpu_coregroup_mask'; did you mean 'cpu_core_mask'? [-Werror=implicit-function-declaration]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
         |                                                         cpu_core_mask
   kernel/sched/alt_core.c:7209:57: warning: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5:
   include/linux/cpumask.h:127:64: note: expected 'const struct cpumask *' but argument is of type 'int'
     127 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:7211:45: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7186:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7186 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:503:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     503 |                                const struct cpumask *src2p)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:7211:45: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7187:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7187 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:686:55: note: expected 'const struct cpumask *' but argument is of type 'int'
     686 |                                 const struct cpumask *srcp)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:7211:45: warning: passing argument 2 of 'cpumask_complement' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7192:42: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7192 |                 cpumask_complement(topo, mask)
         |                                          ^~~~
   include/linux/cpumask.h:558:61: note: expected 'const struct cpumask *' but argument is of type 'int'
     558 |                                       const struct cpumask *srcp)
         |                                       ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:7226:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7226 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7278 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:7633:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7644:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7655:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    7655 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7661:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    7661 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7731:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    7731 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: warning: initialized field overwritten [-Woverride-init]
    7800 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   cc1: some warnings being treated as errors


vim +7209 kernel/sched/alt_core.c

8b025fc742d7609 Alfred Chen 2019-08-19  7184  
8b025fc742d7609 Alfred Chen 2019-08-19  7185  #define TOPOLOGY_CPUMASK(name, mask, last)\
45dc1e23cc5f2a8 Alfred Chen 2021-07-10  7186  	if (cpumask_and(topo, topo, mask)) {					\
e7fdb7ccec3a81d Alfred Chen 2020-12-25  7187  		cpumask_copy(topo, mask);					\
45dc1e23cc5f2a8 Alfred Chen 2021-07-10  7188  		printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
45dc1e23cc5f2a8 Alfred Chen 2021-07-10  7189  		       cpu, (topo++)->bits[0]);					\
e7fdb7ccec3a81d Alfred Chen 2020-12-25  7190  	}									\
8b025fc742d7609 Alfred Chen 2019-08-19  7191  	if (!last)								\
45dc1e23cc5f2a8 Alfred Chen 2021-07-10  7192  		cpumask_complement(topo, mask)
8b025fc742d7609 Alfred Chen 2019-08-19  7193  
8b025fc742d7609 Alfred Chen 2019-08-19  7194  static void sched_init_topology_cpumask(void)
8b025fc742d7609 Alfred Chen 2019-08-19  7195  {
8b025fc742d7609 Alfred Chen 2019-08-19  7196  	int cpu;
45dc1e23cc5f2a8 Alfred Chen 2021-07-10  7197  	cpumask_t *topo;
8b025fc742d7609 Alfred Chen 2019-08-19  7198  
8b025fc742d7609 Alfred Chen 2019-08-19  7199  	for_each_online_cpu(cpu) {
8b025fc742d7609 Alfred Chen 2019-08-19  7200  		/* take chance to reset time slice for idle tasks */
8b025fc742d7609 Alfred Chen 2019-08-19  7201  		cpu_rq(cpu)->idle->time_slice = sched_timeslice_ns;
8b025fc742d7609 Alfred Chen 2019-08-19  7202  
e7fdb7ccec3a81d Alfred Chen 2020-12-25  7203  		topo = per_cpu(sched_cpu_topo_masks, cpu) + 1;
6e346c79dee38d6 Alfred Chen 2020-11-09  7204  
45dc1e23cc5f2a8 Alfred Chen 2021-07-10  7205  		cpumask_complement(topo, cpumask_of(cpu));
8b025fc742d7609 Alfred Chen 2019-08-19  7206  #ifdef CONFIG_SCHED_SMT
8b025fc742d7609 Alfred Chen 2019-08-19  7207  		TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
8b025fc742d7609 Alfred Chen 2019-08-19  7208  #endif
8b025fc742d7609 Alfred Chen 2019-08-19 @7209  		per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
e7fdb7ccec3a81d Alfred Chen 2020-12-25  7210  		per_cpu(sched_cpu_llc_mask, cpu) = topo;
8b025fc742d7609 Alfred Chen 2019-08-19  7211  		TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
8b025fc742d7609 Alfred Chen 2019-08-19  7212  
8b025fc742d7609 Alfred Chen 2019-08-19  7213  		TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
8b025fc742d7609 Alfred Chen 2019-08-19  7214  
8b025fc742d7609 Alfred Chen 2019-08-19  7215  		TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
8b025fc742d7609 Alfred Chen 2019-08-19  7216  
45dc1e23cc5f2a8 Alfred Chen 2021-07-10  7217  		per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
8fbad632e72290b Alfred Chen 2020-11-03  7218  		printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
8fbad632e72290b Alfred Chen 2020-11-03  7219  		       cpu, per_cpu(sd_llc_id, cpu),
8fbad632e72290b Alfred Chen 2020-11-03  7220  		       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
e7fdb7ccec3a81d Alfred Chen 2020-12-25  7221  			      per_cpu(sched_cpu_topo_masks, cpu)));
8b025fc742d7609 Alfred Chen 2019-08-19  7222  	}
8b025fc742d7609 Alfred Chen 2019-08-19  7223  }
8b025fc742d7609 Alfred Chen 2019-08-19  7224  #endif
8b025fc742d7609 Alfred Chen 2019-08-19  7225  

:::::: The code at line 7209 was first introduced by commit
:::::: 8b025fc742d76091232a7404a7ad09c8cad61492 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
