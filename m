Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47261878
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 05:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687928991; x=1719464991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=85QBcAAqaG/lETN+1yiheLB3DzQADk5wL15WvFCsj78=;
  b=daEL8pTcNTpBiOao20iSzbRjRd5mOQkWAMs6CSO+7BHEHoxI96gAUoZm
   6vXIr6Nzu7c+6+InUf/39C8OCrG75Fbwq2TojbD4e2ayH7RvWD9suZZMr
   JPTu7zstdqoFwD63CLl4BdPU8AQP0SJuaDq76ox4a/UffRLPKOQr9aAkZ
   /qX2S/rsiXaOWrC8P1uF8yHhpVVQHg4sduEJTd4poPvBCAU4kD7M4ENaL
   0O0PMCHrdYo4qcZYNWaRelWs0oJ4MAt9Ju7b9Fsax99f9u5wlQnWj71Bs
   D0CBIWGPi1SVJtv1t/UOUul/ovinjYn+JBStawx9gDehFgTGb4VENgk29
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="365209545"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="365209545"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 22:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="782127668"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="782127668"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2023 22:09:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qENR4-000CpJ-2R;
	Wed, 28 Jun 2023 05:09:46 +0000
Date: Wed, 28 Jun 2023 13:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 364/385] include/linux/cpumask.h:28:37: error: invalid
 type argument of '->' (have 'int')
Message-ID: <202306281340.nFC6869y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   d6148915d97f4535395579f728454c4f68f0774b
commit: 1ccb501e2339eb0caf90af913c9eeebd37e6aa3c [364/385] sched/alt: [Sync] 596ff4a09b89 cpumask: re-introduce constant-sized cpumask optimizations
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230628/202306281340.nFC6869y-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281340.nFC6869y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281340.nFC6869y-lkp@intel.com/

Note: the zen/6.4/prjc HEAD d6148915d97f4535395579f728454c4f68f0774b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:1005:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
    1005 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   In file included from include/linux/sched/clock.h:5,
                    from kernel/sched/alt_core.c:14:
   kernel/sched/alt_core.c: In function 'resched_curr':
   include/linux/smp.h:134:9: error: implicit declaration of function 'trace_ipi_send_cpu' [-Werror=implicit-function-declaration]
     134 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1023:17: note: in expansion of macro 'smp_send_reschedule'
    1023 |                 smp_send_reschedule(cpu);
         |                 ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:1028:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
    1028 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1043:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1043 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1045:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1045 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2467:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2467 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2504:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2504 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'choose_next_task':
   kernel/sched/alt_core.c:4620:17: error: implicit declaration of function 'hrtick_start'; did you mean 'hrtimer_start'? [-Werror=implicit-function-declaration]
    4620 |                 hrtick_start(rq, next->time_slice);
         |                 ^~~~~~~~~~~~
         |                 hrtimer_start
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:7284:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    7284 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7323:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7323 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7387:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7387 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:7515:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
    7515 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7515:57: warning: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    7515 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13:
   include/linux/cpumask.h:160:64: note: expected 'const struct cpumask *' but argument is of type 'int'
     160 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:7517:45: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7490:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7490 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:567:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     567 |                                const struct cpumask *src2p)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:7517:45: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7491:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7491 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:738:55: note: expected 'const struct cpumask *' but argument is of type 'int'
     738 |                                 const struct cpumask *srcp)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> include/linux/cpumask.h:28:37: error: invalid type argument of '->' (have 'int')
      28 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/sched/alt_core.c:7496:55: note: in expansion of macro 'cpumask_bits'
    7496 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:7517:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:7532:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7532 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7592:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7592 | void __init sched_init(void)
         |             ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +28 include/linux/cpumask.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  20  
ae7a47e72e1a0b Rusty Russell  2008-12-30  21  /**
6ba2ef7baac23a Rusty Russell  2009-09-24  22   * cpumask_bits - get the bits in a cpumask
6ba2ef7baac23a Rusty Russell  2009-09-24  23   * @maskp: the struct cpumask *
ae7a47e72e1a0b Rusty Russell  2008-12-30  24   *
6ba2ef7baac23a Rusty Russell  2009-09-24  25   * You should only assume nr_cpu_ids bits of this mask are valid.  This is
6ba2ef7baac23a Rusty Russell  2009-09-24  26   * a macro so it's const-correct.
ae7a47e72e1a0b Rusty Russell  2008-12-30  27   */
6ba2ef7baac23a Rusty Russell  2009-09-24 @28  #define cpumask_bits(maskp) ((maskp)->bits)
7ea931c9fc80c4 Paul Jackson   2008-04-28  29  

:::::: The code at line 28 was first introduced by commit
:::::: 6ba2ef7baac23a5d9bb85e28b882d16b439a2293 cpumask: Move deprecated functions to end of header.

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
