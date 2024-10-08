Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109FB2AE77
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 04:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728362798; cv=none; b=C84P8KTBn6FqcOZzOqaZ6kxgt15F4DropurC7s4OAH5vYliiaGJbecfr9ZkPwyfGyo+8fXPOsyBe8F07Qn9wnwcpAZO/gYPmf5Em/GRAr1v+smgNsU6mHAjJrRYShgo9pnGNE3K9cFJ8wHHtE5DuWtskIHT3QiLIVD808gqILE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728362798; c=relaxed/simple;
	bh=M8lCgvFmGVkuU9mbQ7nksM/4ct/6v0+urKx1DRHzicQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fGZEwJ6yGNg/L7OZ+WjN0F+N2KyUtDY/gykSMmG33+KItPBOlLomztqF+AHyiEJooIGx+TWR9b1VayVsJEWfJ+856EIwkL0bCxyIWPD0sWoLF08CRS8c3xpZt0ldW0ruG7ABLoVE206kqNGHsuv+042qC+JcMDWwIV5yKOnwUmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecS/x6Mp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecS/x6Mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728362796; x=1759898796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M8lCgvFmGVkuU9mbQ7nksM/4ct/6v0+urKx1DRHzicQ=;
  b=ecS/x6MpIzDZ49efsnwgvQuNXPdnQ8l24Vx0cXZVkHbko35ifkZ8tt6v
   03QbBoq5bVr3YarT46X72YLpgt44rz3FO+BSDooW78N/LihSwE+Binj2U
   upqiLTwgLMTDgkhFjWJ/8YL0urrIDae9clhjI9ORuQi40FZpYEkmosX+2
   Q280bXkhhOHtRtwgRxlj3qasvpnqbrhLn2Z7EPyNlirr8PdThCS2lfMPL
   pwOkiz3cwESV4q3kBCIxdhcYfE9Y7hsjHExXzOWQCHlP4h5xpixzhrgYN
   Bs5rEkY1zEML0Q9lwfvsMU4kOxzbYS7PG48r7Ai7vEN6+9UccEe7tRDmu
   w==;
X-CSE-ConnectionGUID: ELwfRAmnQmmtb/Wubuunaw==
X-CSE-MsgGUID: QJvaftK5R2OyURHk3c7MUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27477126"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27477126"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 21:46:34 -0700
X-CSE-ConnectionGUID: j4+jFkTHTrWgMm8efzO4Zw==
X-CSE-MsgGUID: 6SC/ru80SYGCwYSNctpoqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="80532135"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Oct 2024 21:46:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy27D-0005u6-0y;
	Tue, 08 Oct 2024 04:46:31 +0000
Date: Tue, 8 Oct 2024 12:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.11/main 363/1296] include/linux/cpumask_types.h:18:37: error:
 invalid type argument of '->' (have 'int')
Message-ID: <202410081247.ellrr5by-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.11/main
head:   c3d69587c6a00162108a14b9b1f5fae63f8846ca
commit: 5faf1299bf7633083d5ebde39299d8dc1a30d05f [363/1296] sched/alt: [Sync] 596ff4a09b89 cpumask: re-introduce constant-sized cpumask optimizations
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241008/202410081247.ellrr5by-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081247.ellrr5by-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081247.ellrr5by-lkp@intel.com/

All errors (new ones prefixed by >>):

         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1043:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1043 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1045:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1045 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'set_task_cpu':
   kernel/sched/alt_core.c:1420:17: error: implicit declaration of function 'rseq_migrate'; did you mean 'cant_migrate'? [-Werror=implicit-function-declaration]
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
   kernel/sched/alt_core.c:3293:35: error: initialization of 'int (*)(const struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(const struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} from incompatible pointer type 'int (*)(struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} [-Werror=incompatible-pointer-types]
    3293 |                 .proc_handler   = sysctl_schedstats,
         |                                   ^~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:3293:35: note: (near initialization for 'sched_core_sysctls[0].proc_handler')
   kernel/sched/alt_core.c: In function 'prepare_task_switch':
   kernel/sched/alt_core.c:3641:9: error: implicit declaration of function 'rseq_preempt' [-Werror=implicit-function-declaration]
    3641 |         rseq_preempt(prev);
         |         ^~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:4080:6: warning: no previous prototype for 'scheduler_tick' [-Wmissing-prototypes]
    4080 | void scheduler_tick(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'choose_next_task':
   kernel/sched/alt_core.c:4620:17: error: implicit declaration of function 'hrtick_start'; did you mean 'hrtimer_start'? [-Werror=implicit-function-declaration]
    4620 |                 hrtick_start(rq, next->time_slice);
         |                 ^~~~~~~~~~~~
         |                 hrtimer_start
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
   include/linux/sched.h:1800:12: note: previous declaration of 'task_can_attach' with type 'int(struct task_struct *)'
    1800 | extern int task_can_attach(struct task_struct *p);
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
   include/linux/cpumask.h:152:64: note: expected 'const struct cpumask *' but argument is of type 'int'
     152 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:7517:45: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7490:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7490 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:625:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     625 |                                const struct cpumask *src2p)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:7517:45: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7491:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7491 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:825:55: note: expected 'const struct cpumask *' but argument is of type 'int'
     825 |                                 const struct cpumask *srcp)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/cpumask.h:13:
>> include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
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


vim +18 include/linux/cpumask_types.h

eb4faa36d674ee Yury Norov 2024-05-27  10  
eb4faa36d674ee Yury Norov 2024-05-27  11  /**
eb4faa36d674ee Yury Norov 2024-05-27  12   * cpumask_bits - get the bits in a cpumask
eb4faa36d674ee Yury Norov 2024-05-27  13   * @maskp: the struct cpumask *
eb4faa36d674ee Yury Norov 2024-05-27  14   *
eb4faa36d674ee Yury Norov 2024-05-27  15   * You should only assume nr_cpu_ids bits of this mask are valid.  This is
eb4faa36d674ee Yury Norov 2024-05-27  16   * a macro so it's const-correct.
eb4faa36d674ee Yury Norov 2024-05-27  17   */
eb4faa36d674ee Yury Norov 2024-05-27 @18  #define cpumask_bits(maskp) ((maskp)->bits)
eb4faa36d674ee Yury Norov 2024-05-27  19  

:::::: The code at line 18 was first introduced by commit
:::::: eb4faa36d674eed60a522a72a3a40384f4b285d4 cpumask: split out include/linux/cpumask_types.h

:::::: TO: Yury Norov <yury.norov@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
