Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF9414012
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 03:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727147162; cv=none; b=BL+kFxb6Bd9TLAwCxCnG19ajsxfWEL4GlWnQL7jljG/r4macl3NWe5tUxTAQMQQNAufHbI5hv5RKI0N3uY3pl8PjXZMP0zEiNvf9GMBgaqzVp4VgXrd5RqPqhVRlHtAB+zxVJbIWVkDmDgjGNOoS5Rf1L+3o+sw4iCNl1MxZ6Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727147162; c=relaxed/simple;
	bh=5wJb2+2ZoA9KFrQLB/dboHpsAAu211iq8TS9EyQROKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGGCXsfzoYRyh14B0RWZKueh5pPIHe9HHBXnZVtQsCqlcARI3HdR1VFfz3iWx5F6U8g++IStfKvAKvtcIikAiZ6kD8okLSp8Id0P1Pks2iFJ8qlyHpdHjFfp/azNkALk/Gxg4rhTZLOqfGo4kxFA2Ij/W/4WBYXg1x/uXauDPiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLYyHPFl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLYyHPFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727147161; x=1758683161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wJb2+2ZoA9KFrQLB/dboHpsAAu211iq8TS9EyQROKg=;
  b=HLYyHPFlwrVfiTbkwDyxlH/tvpz9QdhpTRsdq2ECYVRmt72/4i9ozO+0
   x/AZh8IT6mX1ampKUao7zPhziwYeiFXWaIzrcxaaTgeZ/VICD8WcX+XmZ
   YGqngobCRAG5E6bVLjO04iQUOjL+mCjArNZmqb5OJZ4ffc1VV7j16CG9p
   RUhqpjUjWaMXkzXVEQ3M8oEhFed+TkDuErn0JZDwHVKO+P9tOUuV3Y2p7
   n3FtehCuhhT7mBDsyf35qn5TxbCIKvxiWCTHP9Hb9abRimCKgXrtsIWF8
   AGTldy6IlGtQ/ykSeInav7vQRTr1oVecONu8x5rV/ii4vj4V7bVAJe9ve
   Q==;
X-CSE-ConnectionGUID: Dm5MlDZlTtqhmUiT1QsWxw==
X-CSE-MsgGUID: blv+DohyTmuqV9grzJbFHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25987592"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="25987592"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 20:05:58 -0700
X-CSE-ConnectionGUID: IHHQwU4gRUyyawxtRQpu6Q==
X-CSE-MsgGUID: SJNzsMkYS96WHOA7FWEIZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="75663863"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2024 20:05:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssvsA-000Hqh-2d;
	Tue, 24 Sep 2024 03:05:54 +0000
Date: Tue, 24 Sep 2024 11:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/main 365/2981] include/linux/cpumask.h:29:37: error:
 invalid type argument of '->' (have 'int')
Message-ID: <202409241141.HktU13Mh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.10/main
head:   14cddf41a02f74b2d2a6727fe33914a57b4432f6
commit: b73f8b552e87f0d177977350d93be82249264143 [365/2981] sched/alt: [Sync] 596ff4a09b89 cpumask: re-introduce constant-sized cpumask optimizations
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240924/202409241141.HktU13Mh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241141.HktU13Mh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241141.HktU13Mh-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   kernel/sched/alt_core.c: In function 'set_task_cpu':
   kernel/sched/alt_core.c:1420:17: error: implicit declaration of function 'rseq_migrate'; did you mean 'cant_migrate'? [-Wimplicit-function-declaration]
    1420 |                 rseq_migrate(p);
         |                 ^~~~~~~~~~~~
         |                 cant_migrate
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:2467:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2467 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2504:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2504 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'prepare_task_switch':
   kernel/sched/alt_core.c:3641:9: error: implicit declaration of function 'rseq_preempt' [-Wimplicit-function-declaration]
    3641 |         rseq_preempt(prev);
         |         ^~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:4080:6: warning: no previous prototype for 'scheduler_tick' [-Wmissing-prototypes]
    4080 | void scheduler_tick(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__sched_setscheduler':
   kernel/sched/alt_core.c:5594:17: error: implicit declaration of function 'cpuset_read_lock'; did you mean 'cpus_read_lock'? [-Wimplicit-function-declaration]
    5594 |                 cpuset_read_lock();
         |                 ^~~~~~~~~~~~~~~~
         |                 cpus_read_lock
   kernel/sched/alt_core.c:5642:25: error: implicit declaration of function 'cpuset_read_unlock'; did you mean 'cpus_read_unlock'? [-Wimplicit-function-declaration]
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
   include/linux/sched.h:1786:12: note: previous declaration of 'task_can_attach' with type 'int(struct task_struct *)'
    1786 | extern int task_can_attach(struct task_struct *p);
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
   kernel/sched/alt_core.c:7515:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    7515 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7515:57: error: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    7515 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13:
   include/linux/cpumask.h:161:64: note: expected 'const struct cpumask *' but argument is of type 'int'
     161 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:7517:45: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7490:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7490 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:634:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     634 |                                const struct cpumask *src2p)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:7517:45: error: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7491:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7491 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:834:55: note: expected 'const struct cpumask *' but argument is of type 'int'
     834 |                                 const struct cpumask *srcp)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> include/linux/cpumask.h:29:37: error: invalid type argument of '->' (have 'int')
      29 | #define cpumask_bits(maskp) ((maskp)->bits)
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


vim +29 include/linux/cpumask.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  21  
ae7a47e72e1a0b Rusty Russell  2008-12-30  22  /**
6ba2ef7baac23a Rusty Russell  2009-09-24  23   * cpumask_bits - get the bits in a cpumask
6ba2ef7baac23a Rusty Russell  2009-09-24  24   * @maskp: the struct cpumask *
ae7a47e72e1a0b Rusty Russell  2008-12-30  25   *
6ba2ef7baac23a Rusty Russell  2009-09-24  26   * You should only assume nr_cpu_ids bits of this mask are valid.  This is
6ba2ef7baac23a Rusty Russell  2009-09-24  27   * a macro so it's const-correct.
ae7a47e72e1a0b Rusty Russell  2008-12-30  28   */
6ba2ef7baac23a Rusty Russell  2009-09-24 @29  #define cpumask_bits(maskp) ((maskp)->bits)
7ea931c9fc80c4 Paul Jackson   2008-04-28  30  

:::::: The code at line 29 was first introduced by commit
:::::: 6ba2ef7baac23a5d9bb85e28b882d16b439a2293 cpumask: Move deprecated functions to end of header.

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
