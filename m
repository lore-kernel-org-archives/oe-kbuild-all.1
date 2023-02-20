Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944357E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 00:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676853538; x=1708389538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nNe1tZu8hSVt5MW72bf3F9bhp2Y/6BAcQUY4znTuna8=;
  b=PfhHySl+qY1HOzgSpIcREmegbNJG2sPybPRcLQ/6siccbB98LHTOMZJy
   7njZegUzL5q5xlF+/rSbIKUoMrBiQRyU/Bru6O/EOzfmT1dkpwFW+uO4H
   4WulvOE2+ZQT1La8K8Dstv63j/DGqNFxHvkQqGpK0RGnXypE8PHH9TY/2
   EJrV7tOZAitwryetx7MstxpPluiUX6jvcnN3HgY8FCnv5eXzGITfAapd1
   S9P41H3tnTXbfgctZT8XUvg9A21R3JSxQKUfL/FMBn5JkBm+E0QXBwyoG
   LBjc9K6LtaXv2QXzI2STJGSrlalvCAVKfrhyFSi2PPwLxT5+3b9/wXEH1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="396982797"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="396982797"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 16:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="795008536"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="795008536"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Feb 2023 16:38:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTuCg-000DVt-2M;
	Mon, 20 Feb 2023 00:38:50 +0000
Date: Mon, 20 Feb 2023 08:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/prjc 295/375] kernel/sched/alt_core.c:7209:43: error: call
 to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202302200852.eKfjhbdv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.1/prjc
head:   99884319eac07951839c3ea93918003cec3bf555
commit: e9aa933fffbcd3860f608f851f18e49b2954190d [295/375] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: mips-randconfig-r033-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200852.eKfjhbdv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://github.com/zen-kernel/zen-kernel/commit/e9aa933fffbcd3860f608f851f18e49b2954190d
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.1/prjc
        git checkout e9aa933fffbcd3860f608f851f18e49b2954190d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200852.eKfjhbdv-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:966:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_curr(struct rq *rq)
   ^
   static 
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
   void resched_cpu(int cpu)
        ^
   kernel/sched/alt_core.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_cpu(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:1004:6: warning: no previous prototype for function 'select_nohz_load_balancer' [-Wmissing-prototypes]
   void select_nohz_load_balancer(int stop_tick) {}
        ^
   kernel/sched/alt_core.c:1004:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void select_nohz_load_balancer(int stop_tick) {}
   ^
   static 
   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for function 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
   void set_cpu_sd_state_idle(void) {}
        ^
   kernel/sched/alt_core.c:1006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_cpu_sd_state_idle(void) {}
   ^
   static 
   kernel/sched/alt_core.c:2339:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
   void sched_ttwu_pending(void *arg)
        ^
   kernel/sched/alt_core.c:2339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_ttwu_pending(void *arg)
   ^
   static 
   kernel/sched/alt_core.c:2372:6: warning: no previous prototype for function 'send_call_function_single_ipi' [-Wmissing-prototypes]
   void send_call_function_single_ipi(int cpu)
        ^
   kernel/sched/alt_core.c:2372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void send_call_function_single_ipi(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:3284:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
                   func = (void (*)(struct rq *))head->func;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:3308:10: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
           .func = (void (*)(struct callback_head *))balance_push,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:4558:21: error: use of undeclared identifier 'PF_FROZEN'
                                   !(prev->flags & PF_FROZEN);
                                                   ^
   kernel/sched/alt_core.c:4674:6: error: call to undeclared function 'tsk_is_pi_blocked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (tsk_is_pi_blocked(tsk))
               ^
   kernel/sched/alt_core.c:4734:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
   asmlinkage __visible void __sched schedule_user(void)
                                     ^
   kernel/sched/alt_core.c:4734:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage __visible void __sched schedule_user(void)
                        ^
                        static 
   kernel/sched/alt_core.c:6770:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
   void idle_task_exit(void)
        ^
   kernel/sched/alt_core.c:6770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void idle_task_exit(void)
   ^
   static 
   kernel/sched/alt_core.c:6980:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
   int sched_cpu_activate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:6980:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_activate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7019:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
   int sched_cpu_deactivate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7019:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_deactivate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7083:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
   int sched_cpu_starting(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7083:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_starting(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7103:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
   int sched_cpu_wait_empty(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_wait_empty(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7145:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
   int sched_cpu_dying(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_dying(unsigned int cpu)
   ^
   static 
>> kernel/sched/alt_core.c:7209:43: error: call to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
                                                           ^
>> kernel/sched/alt_core.c:7209:43: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
                   per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
                                                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:127:64: note: passing argument to parameter 'srcp' here
   static inline unsigned int cpumask_first(const struct cpumask *srcp)
                                                                  ^
   kernel/sched/alt_core.c:7211:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
                   TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7186:30: note: expanded from macro 'TOPOLOGY_CPUMASK'
           if (cpumask_and(topo, topo, mask)) {                                    \
                                       ^~~~
   include/linux/cpumask.h:503:33: note: passing argument to parameter 'src2p' here
                                  const struct cpumask *src2p)
                                                        ^
   kernel/sched/alt_core.c:7211:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
                   TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7187:22: note: expanded from macro 'TOPOLOGY_CPUMASK'
                   cpumask_copy(topo, mask);                                       \
                                      ^~~~
   include/linux/cpumask.h:686:27: note: passing argument to parameter 'srcp' here
                                   const struct cpumask *srcp)
                                                         ^
   kernel/sched/alt_core.c:7211:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
                   TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7192:28: note: expanded from macro 'TOPOLOGY_CPUMASK'
                   cpumask_complement(topo, mask)
                                            ^~~~
   include/linux/cpumask.h:558:33: note: passing argument to parameter 'srcp' here
                                         const struct cpumask *srcp)
                                                               ^
   kernel/sched/alt_core.c:7226:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
   void __init sched_init_smp(void)
               ^
   kernel/sched/alt_core.c:7226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init_smp(void)
   ^
   static 
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
   void __init sched_init(void)
               ^
   kernel/sched/alt_core.c:7278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init(void)
   ^
   static 
   17 warnings and 8 errors generated.


vim +/cpu_coregroup_mask +7209 kernel/sched/alt_core.c

570d4c77574657 Alfred Chen 2019-08-19  7184  
570d4c77574657 Alfred Chen 2019-08-19  7185  #define TOPOLOGY_CPUMASK(name, mask, last)\
29b38f3cae51bd Alfred Chen 2021-07-10  7186  	if (cpumask_and(topo, topo, mask)) {					\
ddb984bb2806c8 Alfred Chen 2020-12-25  7187  		cpumask_copy(topo, mask);					\
29b38f3cae51bd Alfred Chen 2021-07-10  7188  		printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
29b38f3cae51bd Alfred Chen 2021-07-10  7189  		       cpu, (topo++)->bits[0]);					\
ddb984bb2806c8 Alfred Chen 2020-12-25  7190  	}									\
570d4c77574657 Alfred Chen 2019-08-19  7191  	if (!last)								\
29b38f3cae51bd Alfred Chen 2021-07-10  7192  		cpumask_complement(topo, mask)
570d4c77574657 Alfred Chen 2019-08-19  7193  
570d4c77574657 Alfred Chen 2019-08-19  7194  static void sched_init_topology_cpumask(void)
570d4c77574657 Alfred Chen 2019-08-19  7195  {
570d4c77574657 Alfred Chen 2019-08-19  7196  	int cpu;
29b38f3cae51bd Alfred Chen 2021-07-10  7197  	cpumask_t *topo;
570d4c77574657 Alfred Chen 2019-08-19  7198  
570d4c77574657 Alfred Chen 2019-08-19  7199  	for_each_online_cpu(cpu) {
570d4c77574657 Alfred Chen 2019-08-19  7200  		/* take chance to reset time slice for idle tasks */
570d4c77574657 Alfred Chen 2019-08-19  7201  		cpu_rq(cpu)->idle->time_slice = sched_timeslice_ns;
570d4c77574657 Alfred Chen 2019-08-19  7202  
ddb984bb2806c8 Alfred Chen 2020-12-25  7203  		topo = per_cpu(sched_cpu_topo_masks, cpu) + 1;
b22006015d2f24 Alfred Chen 2020-11-09  7204  
29b38f3cae51bd Alfred Chen 2021-07-10  7205  		cpumask_complement(topo, cpumask_of(cpu));
570d4c77574657 Alfred Chen 2019-08-19  7206  #ifdef CONFIG_SCHED_SMT
570d4c77574657 Alfred Chen 2019-08-19  7207  		TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
570d4c77574657 Alfred Chen 2019-08-19  7208  #endif
570d4c77574657 Alfred Chen 2019-08-19 @7209  		per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
ddb984bb2806c8 Alfred Chen 2020-12-25  7210  		per_cpu(sched_cpu_llc_mask, cpu) = topo;
570d4c77574657 Alfred Chen 2019-08-19  7211  		TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
570d4c77574657 Alfred Chen 2019-08-19  7212  
570d4c77574657 Alfred Chen 2019-08-19  7213  		TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
570d4c77574657 Alfred Chen 2019-08-19  7214  
570d4c77574657 Alfred Chen 2019-08-19  7215  		TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
570d4c77574657 Alfred Chen 2019-08-19  7216  
29b38f3cae51bd Alfred Chen 2021-07-10  7217  		per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
9346ee1dcd0031 Alfred Chen 2020-11-03  7218  		printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
9346ee1dcd0031 Alfred Chen 2020-11-03  7219  		       cpu, per_cpu(sd_llc_id, cpu),
9346ee1dcd0031 Alfred Chen 2020-11-03  7220  		       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
ddb984bb2806c8 Alfred Chen 2020-12-25  7221  			      per_cpu(sched_cpu_topo_masks, cpu)));
570d4c77574657 Alfred Chen 2019-08-19  7222  	}
570d4c77574657 Alfred Chen 2019-08-19  7223  }
570d4c77574657 Alfred Chen 2019-08-19  7224  #endif
570d4c77574657 Alfred Chen 2019-08-19  7225  

:::::: The code at line 7209 was first introduced by commit
:::::: 570d4c77574657dc1df2ca8c54e6b4407de76fd5 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
