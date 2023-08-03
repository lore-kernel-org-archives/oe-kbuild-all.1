Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0A8BFF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 03:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691034836; x=1722570836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIa9MHhHsrS0J760uFjx+IvYzg/Nwxio97JBcx5kqMQ=;
  b=D15vxr9Hx1SkWBO7zHQ5Qqmb0cqw3aJgHKkMVN5obuF4jEvx4x+Ql9PR
   jcs+hp+3Yf4lEZFj8s1Gu+w/adhx8hhq8bo9LzMh+KPEDeRJfmYrk8sBu
   fe/zO5+RbYIBLfzGVPCR/XbK1OjXBm8Qh+3jBSFJSsdwj4dzzdgRYITyV
   A4n5IJlQ3uWlRsFvCmYxtNBkjKlsShx3QinbFFCEBGNtaRpHxKw+8Lqrq
   OnRxEIv7TbRv3hkHU3tBSHq76gJGTgqdWi13yPbJ3gknWSn4Oe/+57Of5
   ddr6AkSnvij1tq16/nBLDULLKBbO5hOlvvYlZ1dCYg2FZ/no2LJGhGaxj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368661793"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="368661793"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 20:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="975926455"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="975926455"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Aug 2023 20:53:53 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRPPM-0001jL-1a;
	Thu, 03 Aug 2023 03:53:52 +0000
Date: Thu, 3 Aug 2023 11:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 379/387] kernel/sched/alt_core.c:2516:6: warning: no
 previous prototype for 'call_function_single_prep_ipi'
Message-ID: <202308031137.Bwm08PbM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   81c27c2ecb3019a7e76026b3fced2f750c2faf0a
commit: 217029dcc8414f797711c3cac589493f62a4dc13 [379/387] sched/alt: [Sync] 68f4ff04dbad sched, smp: Trace smp callback causing an IPI
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230803/202308031137.Bwm08PbM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031137.Bwm08PbM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031137.Bwm08PbM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
    1006 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:1029:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
    1029 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1044:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1044 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1046:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1046 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2473:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2473 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:2516:6: warning: no previous prototype for 'call_function_single_prep_ipi' [-Wmissing-prototypes]
    2516 | bool call_function_single_prep_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'choose_next_task':
   kernel/sched/alt_core.c:4639:17: error: implicit declaration of function 'hrtick_start'; did you mean 'hrtimer_start'? [-Werror=implicit-function-declaration]
    4639 |                 hrtick_start(rq, next->time_slice);
         |                 ^~~~~~~~~~~~
         |                 hrtimer_start
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:7347:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    7347 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7386:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7386 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7450:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7450 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:7578:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
    7578 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7578:57: warning: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    7578 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/alt_core.c:14:
   include/linux/cpumask.h:160:64: note: expected 'const struct cpumask *' but argument is of type 'int'
     160 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:7580:45: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    7580 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7553:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7553 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:567:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     567 |                                const struct cpumask *src2p)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:7580:45: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    7580 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7554:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7554 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:738:55: note: expected 'const struct cpumask *' but argument is of type 'int'
     738 |                                 const struct cpumask *srcp)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/cpumask.h:28:37: error: invalid type argument of '->' (have 'int')
      28 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/sched/alt_core.c:7559:55: note: in expansion of macro 'cpumask_bits'
    7559 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:7580:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    7580 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:7595:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7595 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7655:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7655 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:8011:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    8011 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8022:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    8022 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8033:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    8033 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8039:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    8039 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8107:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    8107 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8177:27: warning: initialized field overwritten [-Woverride-init]
    8177 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8177:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   cc1: some warnings being treated as errors


vim +/call_function_single_prep_ipi +2516 kernel/sched/alt_core.c

  2509	
  2510	/*
  2511	 * Prepare the scene for sending an IPI for a remote smp_call
  2512	 *
  2513	 * Returns true if the caller can proceed with sending the IPI.
  2514	 * Returns false otherwise.
  2515	 */
> 2516	bool call_function_single_prep_ipi(int cpu)
  2517	{
  2518		if (set_nr_if_polling(cpu_rq(cpu)->idle)) {
  2519			trace_sched_wake_idle_without_ipi(cpu);
  2520			return false;
  2521		}
  2522	
  2523		return true;
  2524	}
  2525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
