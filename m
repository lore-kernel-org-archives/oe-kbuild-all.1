Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6301B85F3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 04:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727151483; cv=none; b=ShcH0cQTiOTEvGptE9Fplpjv656b8NIhCfLUpcLKSxqTYNdggbDoxbofptU5KpdPU+XGqDiLXaAPAbzhzhQd/MkzNA91SKKB17a+GjUTZwmBGkWZPL7qyNGLG8DTeab4+osBF87cEfL4hYolt0IZSkwH9i9xewS+9YARrQ+Qo9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727151483; c=relaxed/simple;
	bh=h30nOLi3j+7/oatA5qTwKu9cVecjevorhh4z7KxPmVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gE2UPWq9tqr7qgMVqIvWfBz+wshLq386UWAs/+2FPRFlAXuydI7OYoWuWYQEH+H0aiyQBzYr1OLguUkPYt+EPbauHQ0J6V0fG03gRFHKkh/y2pZURK1nrkcwc8/rNzEBsjT8KOJi15MUftIUZJRw5gXWM4uhClOe5eUoqE5RrmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+P2zwFe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+P2zwFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727151482; x=1758687482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h30nOLi3j+7/oatA5qTwKu9cVecjevorhh4z7KxPmVY=;
  b=i+P2zwFe/p/Ad9RRd7r8gsUYQsErpr6qBquKd/aEWD4stD12PvJuz51Z
   RKg6sMkQhZz3GNfISmmo/qoAkx7Uk9tddpFpTKl50NOVJFN0SIy1Hk3w4
   BML3kv/CzDfUMuUjSuF56t3kzuDRM2bjsCoqoLEdBZe/zC6CQAD5rmkam
   S+7lN4eFhF62Ykg1MDrSMYzyqkylrrkBwxlKuSgl3TjWe5rVP9NeLRDBv
   QWTgEiB+Zy8vdBYaWi+67hSJBhcd7UAqC9oCh3f9vODwjMCYPPp97qxvr
   I8fXJKXVLm0dk3mMWFBvsNemJaHGhZEHHx/I/5gnp8aAAxJzGqbW3GW0b
   g==;
X-CSE-ConnectionGUID: QosA9PMsRkmLJNsXvWwbfQ==
X-CSE-MsgGUID: mFEB5/tRQuORNwb4SgSS7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48659110"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="48659110"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 21:18:01 -0700
X-CSE-ConnectionGUID: qAhGBFWNS16yRQhjW2LCdA==
X-CSE-MsgGUID: /zqqE3nARHOVf4kDoCms8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71548645"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2024 21:17:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sswzs-000Hth-3C;
	Tue, 24 Sep 2024 04:17:56 +0000
Date: Tue, 24 Sep 2024 12:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/main 365/2981] kernel/sched/alt_core.c:7515:43: error:
 incompatible integer to pointer conversion passing 'int' to parameter of
 type 'const struct cpumask *'
Message-ID: <202409241217.wrJpDxtJ-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409241217.wrJpDxtJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241217.wrJpDxtJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241217.wrJpDxtJ-lkp@intel.com/

All errors (new ones prefixed by >>):

         | ^
         | static 
   kernel/sched/alt_core.c:1100:3: error: call to undeclared function 'trace_ipi_send_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1100 |                 smp_send_reschedule(cpu);
         |                 ^
   include/linux/smp.h:140:2: note: expanded from macro 'smp_send_reschedule'
     140 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^
   kernel/sched/alt_core.c:1231:6: warning: no previous prototype for function 'hrtick_start' [-Wmissing-prototypes]
    1231 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^
   kernel/sched/alt_core.c:1231:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1231 | void hrtick_start(struct rq *rq, u64 delay)
         | ^
         | static 
   kernel/sched/alt_core.c:1420:3: error: call to undeclared function 'rseq_migrate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1420 |                 rseq_migrate(p);
         |                 ^
   kernel/sched/alt_core.c:1904:3: error: call to undeclared function 'trace_ipi_send_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1904 |                 smp_send_reschedule(cpu);
         |                 ^
   include/linux/smp.h:140:2: note: expanded from macro 'smp_send_reschedule'
     140 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^
   kernel/sched/alt_core.c:2467:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
    2467 | void sched_ttwu_pending(void *arg)
         |      ^
   kernel/sched/alt_core.c:2467:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2467 | void sched_ttwu_pending(void *arg)
         | ^
         | static 
   kernel/sched/alt_core.c:2504:6: warning: no previous prototype for function 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2504 | void send_call_function_single_ipi(int cpu)
         |      ^
   kernel/sched/alt_core.c:2504:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2504 | void send_call_function_single_ipi(int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:3212:2: error: call to undeclared function 'rseq_migrate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3212 |         rseq_migrate(p);
         |         ^
   kernel/sched/alt_core.c:3324:2: error: call to undeclared function 'rseq_migrate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3324 |         rseq_migrate(p);
         |         ^
   kernel/sched/alt_core.c:3641:2: error: call to undeclared function 'rseq_preempt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3641 |         rseq_preempt(prev);
         |         ^
   kernel/sched/alt_core.c:4080:6: warning: no previous prototype for function 'scheduler_tick' [-Wmissing-prototypes]
    4080 | void scheduler_tick(void)
         |      ^
   kernel/sched/alt_core.c:4080:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4080 | void scheduler_tick(void)
         | ^
         | static 
   kernel/sched/alt_core.c:5594:3: error: call to undeclared function 'cpuset_read_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5594 |                 cpuset_read_lock();
         |                 ^
   kernel/sched/alt_core.c:5594:3: note: did you mean 'cpus_read_lock'?
   include/linux/cpu.h:155:20: note: 'cpus_read_lock' declared here
     155 | static inline void cpus_read_lock(void) { }
         |                    ^
   kernel/sched/alt_core.c:5642:4: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5642 |                         cpuset_read_unlock();
         |                         ^
   kernel/sched/alt_core.c:5674:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5674 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:5688:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5688 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:7047:5: error: conflicting types for 'task_can_attach'
    7047 | int task_can_attach(struct task_struct *p,
         |     ^
   include/linux/sched.h:1786:12: note: previous declaration is here
    1786 | extern int task_can_attach(struct task_struct *p);
         |            ^
   kernel/sched/alt_core.c:7284:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
    7284 | int sched_cpu_activate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7284:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7284 | int sched_cpu_activate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7323:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7323 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7323 | int sched_cpu_deactivate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7387:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
    7387 | int sched_cpu_starting(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7387:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7387 | int sched_cpu_starting(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7515:43: error: call to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7515 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^
>> kernel/sched/alt_core.c:7515:43: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7515 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:161:64: note: passing argument to parameter 'srcp' here
     161 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                                ^
   kernel/sched/alt_core.c:7517:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7490:30: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7490 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:634:33: note: passing argument to parameter 'src2p' here
     634 |                                const struct cpumask *src2p)
         |                                                      ^
   kernel/sched/alt_core.c:7517:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7491:22: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7491 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:834:27: note: passing argument to parameter 'srcp' here
     834 |                                 const struct cpumask *srcp)
         |                                                       ^
>> kernel/sched/alt_core.c:7517:3: error: member reference type 'int' is not a pointer
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7496:41: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7496 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:29:39: note: expanded from macro 'cpumask_bits'
      29 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                              ~~~~~~~  ^
   kernel/sched/alt_core.c:7532:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
    7532 | void __init sched_init_smp(void)
         |             ^
   kernel/sched/alt_core.c:7532:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7532 | void __init sched_init_smp(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7592:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
    7592 | void __init sched_init(void)
         |             ^
   kernel/sched/alt_core.c:7592:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7592 | void __init sched_init(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7950:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
    7950 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^
   kernel/sched/alt_core.c:7950:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7950 | struct task_group *sched_create_group(struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:7961:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
    7961 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^
   kernel/sched/alt_core.c:7961:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7961 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:7972:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
    7972 | void sched_destroy_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7972:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7972 | void sched_destroy_group(struct task_group *tg)
         | ^
         | static 
   kernel/sched/alt_core.c:7978:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
    7978 | void sched_release_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7978:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7978 | void sched_release_group(struct task_group *tg)
         | ^
         | static 
   kernel/sched/alt_core.c:8046:5: warning: no previous prototype for function 'sched_group_set_shares' [-Wmissing-prototypes]
    8046 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^
   kernel/sched/alt_core.c:8046:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    8046 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         | ^
         | static 
   kernel/sched/alt_core.c:8116:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    8116 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8115:20: note: previous initialization is here
    8115 |         .legacy_cftypes = cpu_files,
         |                           ^~~~~~~~~
   26 warnings and 17 errors generated.


vim +7515 kernel/sched/alt_core.c

d821e3e8509258 Alfred Chen 2019-08-19  7488  
d821e3e8509258 Alfred Chen 2019-08-19  7489  #define TOPOLOGY_CPUMASK(name, mask, last)\
4076e7f2335228 Alfred Chen 2021-07-10  7490  	if (cpumask_and(topo, topo, mask)) {					\
b99c6a31af83d8 Alfred Chen 2020-12-25  7491  		cpumask_copy(topo, mask);					\
4076e7f2335228 Alfred Chen 2021-07-10  7492  		printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
4076e7f2335228 Alfred Chen 2021-07-10  7493  		       cpu, (topo++)->bits[0]);					\
b99c6a31af83d8 Alfred Chen 2020-12-25  7494  	}									\
d821e3e8509258 Alfred Chen 2019-08-19  7495  	if (!last)								\
b73f8b552e87f0 Alfred Chen 2023-04-08  7496  		bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),	\
b73f8b552e87f0 Alfred Chen 2023-04-08  7497  				  nr_cpumask_bits);
d821e3e8509258 Alfred Chen 2019-08-19  7498  
d821e3e8509258 Alfred Chen 2019-08-19  7499  static void sched_init_topology_cpumask(void)
d821e3e8509258 Alfred Chen 2019-08-19  7500  {
d821e3e8509258 Alfred Chen 2019-08-19  7501  	int cpu;
4076e7f2335228 Alfred Chen 2021-07-10  7502  	cpumask_t *topo;
d821e3e8509258 Alfred Chen 2019-08-19  7503  
d821e3e8509258 Alfred Chen 2019-08-19  7504  	for_each_online_cpu(cpu) {
d821e3e8509258 Alfred Chen 2019-08-19  7505  		/* take chance to reset time slice for idle tasks */
d821e3e8509258 Alfred Chen 2019-08-19  7506  		cpu_rq(cpu)->idle->time_slice = sched_timeslice_ns;
d821e3e8509258 Alfred Chen 2019-08-19  7507  
b99c6a31af83d8 Alfred Chen 2020-12-25  7508  		topo = per_cpu(sched_cpu_topo_masks, cpu) + 1;
82f4452315a839 Alfred Chen 2020-11-09  7509  
b73f8b552e87f0 Alfred Chen 2023-04-08  7510  		bitmap_complement(cpumask_bits(topo), cpumask_bits(cpumask_of(cpu)),
b73f8b552e87f0 Alfred Chen 2023-04-08  7511  				  nr_cpumask_bits);
d821e3e8509258 Alfred Chen 2019-08-19  7512  #ifdef CONFIG_SCHED_SMT
d821e3e8509258 Alfred Chen 2019-08-19  7513  		TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
d821e3e8509258 Alfred Chen 2019-08-19  7514  #endif
d821e3e8509258 Alfred Chen 2019-08-19 @7515  		per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
b99c6a31af83d8 Alfred Chen 2020-12-25  7516  		per_cpu(sched_cpu_llc_mask, cpu) = topo;
d821e3e8509258 Alfred Chen 2019-08-19 @7517  		TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
d821e3e8509258 Alfred Chen 2019-08-19  7518  
d821e3e8509258 Alfred Chen 2019-08-19  7519  		TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
d821e3e8509258 Alfred Chen 2019-08-19  7520  
d821e3e8509258 Alfred Chen 2019-08-19  7521  		TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
d821e3e8509258 Alfred Chen 2019-08-19  7522  
4076e7f2335228 Alfred Chen 2021-07-10  7523  		per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
617d32624ea559 Alfred Chen 2020-11-03  7524  		printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
617d32624ea559 Alfred Chen 2020-11-03  7525  		       cpu, per_cpu(sd_llc_id, cpu),
617d32624ea559 Alfred Chen 2020-11-03  7526  		       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
b99c6a31af83d8 Alfred Chen 2020-12-25  7527  			      per_cpu(sched_cpu_topo_masks, cpu)));
d821e3e8509258 Alfred Chen 2019-08-19  7528  	}
d821e3e8509258 Alfred Chen 2019-08-19  7529  }
d821e3e8509258 Alfred Chen 2019-08-19  7530  #endif
d821e3e8509258 Alfred Chen 2019-08-19  7531  

:::::: The code at line 7515 was first introduced by commit
:::::: d821e3e85092581709b1b5f9ab8cacf0ce70c1a8 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
