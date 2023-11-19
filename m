Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9799D17980
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WX/tw0Ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700435954; x=1731971954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b50dDd2EiaIVGkD3Aiv6Bi2pqx7RJ+nnxepdf7IMN9Y=;
  b=WX/tw0Ip792Y3u0hrZL0Bvili2btqXGsT6LOMTHpBt2Vkrn3PWA2qehB
   Aa17viOZLXI8vc3vmhhS/Jy4QEZLStnLrQ4X+YFGA2uEEFXn/y45jvi/f
   e2rf31O7NOD4/DJKo0i41RtmzPttqrXq3At3drZF0RoWVeWbp3TCGqTlZ
   5lfQrYfIZ0u24i1EMGjJ4Oud95E7gTWlLTGhjFO5eWdzQTDoy9bfnj9fA
   G5ghpTZQwKa2MLEn+aZFJUKJvkzSu0CXuUKEI9nfB+m8zcuL8X+KcnGJn
   eZlnJ86afVgCenrU16oR64fEQ1qq2qtag2tYQC4pMg57a/IdDQ3Vi+SLo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="376561465"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="376561465"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 15:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1097592293"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="1097592293"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Nov 2023 15:19:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4r4C-0005gO-1c;
	Sun, 19 Nov 2023 23:19:07 +0000
Date: Mon, 20 Nov 2023 07:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 408/449] include/linux/cpumask.h:28:37: error: invalid
 type argument of '->' (have 'int')
Message-ID: <202311200705.cfpHOfwk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/prjc
head:   a343b008e1bf155cdcfe9a46e38336032adeb65a
commit: 60e37e86027139db2d687b2bc3beb8b503e5bf63 [408/449] sched/alt: [Sync] 596ff4a09b89 cpumask: re-introduce constant-sized cpumask optimizations
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200705.cfpHOfwk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200705.cfpHOfwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200705.cfpHOfwk-lkp@intel.com/

Note: the zen/6.6/prjc HEAD a343b008e1bf155cdcfe9a46e38336032adeb65a builds fine.
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
   kernel/sched/alt_core.c:1231:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
    1231 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:2467:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2467 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2504:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2504 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__sched_setscheduler':
   kernel/sched/alt_core.c:5594:17: error: implicit declaration of function 'cpuset_read_lock'; did you mean 'cpus_read_lock'? [-Werror=implicit-function-declaration]
    5594 |                 cpuset_read_lock();
         |                 ^~~~~~~~~~~~~~~~
         |                 cpus_read_lock
   kernel/sched/alt_core.c:5642:25: error: implicit declaration of function 'cpuset_read_unlock'; did you mean 'cpus_read_unlock'? [-Werror=implicit-function-declaration]
    5642 |                         cpuset_read_unlock();
         |                         ^~~~~~~~~~~~~~~~~~
         |                         cpus_read_unlock
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:7047:5: error: conflicting types for 'task_can_attach'; have 'int(struct task_struct *, const struct cpumask *)'
    7047 | int task_can_attach(struct task_struct *p,
         |     ^~~~~~~~~~~~~~~
   In file included from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:15:
   include/linux/sched.h:1883:12: note: previous declaration of 'task_can_attach' with type 'int(struct task_struct *)'
    1883 | extern int task_can_attach(struct task_struct *p);
         |            ^~~~~~~~~~~~~~~
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
   kernel/sched/alt_core.c:7950:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    7950 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7961:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    7961 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7972:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    7972 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7978:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    7978 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8046:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    8046 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8116:27: warning: initialized field overwritten [-Woverride-init]
    8116 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8116:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
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
