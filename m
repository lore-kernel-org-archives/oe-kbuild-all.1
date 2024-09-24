Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D531B85DF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 02:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727145238; cv=none; b=fVrYcQuvWsraXKBdEeObg3TGiwNRkDIHm5PLiWSEu814FN4aKLGMYE3UflInz2xSb2mt7K2IYErfksZ3DUGawawf8umJ1ByVTM+78nWr4tALY2pmTFKhdhGkrVnYgDa0hgj2k7AmQgzmwGd5GBF/r8oSCpr7faz9OKebgfD2Rr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727145238; c=relaxed/simple;
	bh=TknieJ0kaPf6XYeTMGQTgg9ONKQxSINZjGsHPtKs/rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gN0GT4zYeU1DZZkj25RXOJyLY7qPNPLeweKUazAU9xZfp+XaLYgNSfny3j/Kv4wrGVErcdnfdeyrCRUs3VSAn9cOakbIBOgfES9vG92ZGdDpSAxKZJDnGyA47aRhD6AhCxD5hEE/QSyaqjZAeoTjkDa4B1TXhMYw6mxSOpYwkZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhlmhGfL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhlmhGfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727145236; x=1758681236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TknieJ0kaPf6XYeTMGQTgg9ONKQxSINZjGsHPtKs/rQ=;
  b=XhlmhGfL0wGbKHYVIzFoI/hvW5k8nEPq/0Y82VNgfJ92n/3oO7ZKHap/
   SXaCxp1z+JRz7CaaC+t/sCycV7BbYqv2vvvDG7OcGAsWahRNSNJEVF7Py
   8RnQzxcQgQivwqkvQRlqvBTyOIkUSXluobQV9NLX3/nu9dpRUliVedkKN
   U/8V7ru1BKbEwifpLdAS6a0IzBLyARnEiXIiwxjevViOSg2YHTFimRl6H
   OuTCGjsA1WqxnFwFfE6OaOBID7IA1y3Tp1aNaVV8/4+DLti7r+n52SQVV
   8Ts367OUF7NjJXT0xAls0lL9WU/VDYKtNt5DQrkQaEuDhctWME1mbL0ap
   g==;
X-CSE-ConnectionGUID: MODg8soGQv29dBx1SroDhw==
X-CSE-MsgGUID: L4tNcA45TvuM6WfZduI6aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25942952"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="25942952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 19:33:55 -0700
X-CSE-ConnectionGUID: GeBL8sc3QHChm8B+YoBjEQ==
X-CSE-MsgGUID: t5hBgwY2Sy6XL6lOTPnHDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="76037625"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2024 19:33:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssvNA-000HpC-0T;
	Tue, 24 Sep 2024 02:33:52 +0000
Date: Tue, 24 Sep 2024 10:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/main 297/2981] kernel/sched/alt_core.c:7213:43: error:
 call to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202409241025.xXs7UtFO-lkp@intel.com>
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
commit: 2b4e42ef42a303c490df287c577cd61f215e8724 [297/2981] sched/alt: [Sync] 2c14f578b5a0 sched/core: Always flush pending blk_plug
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409241025.xXs7UtFO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241025.xXs7UtFO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241025.xXs7UtFO-lkp@intel.com/

All errors (new ones prefixed by >>):

    2432 |                 sched_clock_cpu(cpu); /* Sync clocks across CPUs */
         |                 ^
   kernel/sched/alt_core.c:3021:2: error: call to undeclared function 'rseq_migrate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3021 |         rseq_migrate(p);
         |         ^
   kernel/sched/alt_core.c:3133:2: error: call to undeclared function 'rseq_migrate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3133 |         rseq_migrate(p);
         |         ^
   kernel/sched/alt_core.c:3284:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    3284 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:3308:10: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    3308 |         .func = (void (*)(struct callback_head *))balance_push,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:3449:2: error: call to undeclared function 'rseq_preempt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3449 |         rseq_preempt(prev);
         |         ^
   kernel/sched/alt_core.c:3894:2: error: call to undeclared function 'sched_clock_tick'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3894 |         sched_clock_tick();
         |         ^
   kernel/sched/alt_core.c:3894:2: note: did you mean 'scheduler_tick'?
   kernel/sched/alt_core.c:3887:6: note: 'scheduler_tick' declared here
    3887 | void scheduler_tick(void)
         |      ^
    3888 | {
    3889 |         int cpu __maybe_unused = smp_processor_id();
    3890 |         struct rq *rq = cpu_rq(cpu);
    3891 |         u64 resched_latency;
    3892 | 
    3893 |         arch_scale_freq_tick();
    3894 |         sched_clock_tick();
         |         ~~~~~~~~~~~~~~~~
         |         scheduler_tick
   kernel/sched/alt_core.c:3887:6: warning: no previous prototype for function 'scheduler_tick' [-Wmissing-prototypes]
    3887 | void scheduler_tick(void)
         |      ^
   kernel/sched/alt_core.c:3887:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3887 | void scheduler_tick(void)
         | ^
         | static 
   kernel/sched/alt_core.c:4558:21: error: use of undeclared identifier 'PF_FROZEN'
    4558 |                                 !(prev->flags & PF_FROZEN);
         |                                                 ^
   kernel/sched/alt_core.c:4738:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
    4738 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^
   kernel/sched/alt_core.c:4738:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4738 | asmlinkage __visible void __sched schedule_user(void)
         |                      ^
         |                      static 
   kernel/sched/alt_core.c:5361:3: error: call to undeclared function 'cpuset_read_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5361 |                 cpuset_read_lock();
         |                 ^
   kernel/sched/alt_core.c:5361:3: note: did you mean 'cpus_read_lock'?
   include/linux/cpu.h:155:20: note: 'cpus_read_lock' declared here
     155 | static inline void cpus_read_lock(void) { }
         |                    ^
   kernel/sched/alt_core.c:5409:4: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5409 |                         cpuset_read_unlock();
         |                         ^
   kernel/sched/alt_core.c:5441:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5441 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:5455:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5455 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:6747:5: error: conflicting types for 'task_can_attach'
    6747 | int task_can_attach(struct task_struct *p,
         |     ^
   include/linux/sched.h:1786:12: note: previous declaration is here
    1786 | extern int task_can_attach(struct task_struct *p);
         |            ^
   kernel/sched/alt_core.c:6984:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
    6984 | int sched_cpu_activate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:6984:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6984 | int sched_cpu_activate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7023:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7023 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7023:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7023 | int sched_cpu_deactivate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7087:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
    7087 | int sched_cpu_starting(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7087:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7087 | int sched_cpu_starting(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7209:3: error: call to undeclared function 'cpumask_complement'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7209 |                 cpumask_complement(topo, cpumask_of(cpu));
         |                 ^
   kernel/sched/alt_core.c:7209:3: note: did you mean 'bitmap_complement'?
   include/linux/bitmap.h:343:20: note: 'bitmap_complement' declared here
     343 | static inline void bitmap_complement(unsigned long *dst, const unsigned long *src,
         |                    ^
>> kernel/sched/alt_core.c:7213:43: error: call to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7213 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   22 warnings and 20 errors generated.


vim +/cpu_coregroup_mask +7213 kernel/sched/alt_core.c

d821e3e8509258 Alfred Chen 2019-08-19  7188  
d821e3e8509258 Alfred Chen 2019-08-19  7189  #define TOPOLOGY_CPUMASK(name, mask, last)\
4076e7f2335228 Alfred Chen 2021-07-10  7190  	if (cpumask_and(topo, topo, mask)) {					\
b99c6a31af83d8 Alfred Chen 2020-12-25  7191  		cpumask_copy(topo, mask);					\
4076e7f2335228 Alfred Chen 2021-07-10  7192  		printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
4076e7f2335228 Alfred Chen 2021-07-10  7193  		       cpu, (topo++)->bits[0]);					\
b99c6a31af83d8 Alfred Chen 2020-12-25  7194  	}									\
d821e3e8509258 Alfred Chen 2019-08-19  7195  	if (!last)								\
4076e7f2335228 Alfred Chen 2021-07-10  7196  		cpumask_complement(topo, mask)
d821e3e8509258 Alfred Chen 2019-08-19  7197  
d821e3e8509258 Alfred Chen 2019-08-19  7198  static void sched_init_topology_cpumask(void)
d821e3e8509258 Alfred Chen 2019-08-19  7199  {
d821e3e8509258 Alfred Chen 2019-08-19  7200  	int cpu;
4076e7f2335228 Alfred Chen 2021-07-10  7201  	cpumask_t *topo;
d821e3e8509258 Alfred Chen 2019-08-19  7202  
d821e3e8509258 Alfred Chen 2019-08-19  7203  	for_each_online_cpu(cpu) {
d821e3e8509258 Alfred Chen 2019-08-19  7204  		/* take chance to reset time slice for idle tasks */
d821e3e8509258 Alfred Chen 2019-08-19  7205  		cpu_rq(cpu)->idle->time_slice = sched_timeslice_ns;
d821e3e8509258 Alfred Chen 2019-08-19  7206  
b99c6a31af83d8 Alfred Chen 2020-12-25  7207  		topo = per_cpu(sched_cpu_topo_masks, cpu) + 1;
82f4452315a839 Alfred Chen 2020-11-09  7208  
4076e7f2335228 Alfred Chen 2021-07-10 @7209  		cpumask_complement(topo, cpumask_of(cpu));
d821e3e8509258 Alfred Chen 2019-08-19  7210  #ifdef CONFIG_SCHED_SMT
d821e3e8509258 Alfred Chen 2019-08-19  7211  		TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
d821e3e8509258 Alfred Chen 2019-08-19  7212  #endif
d821e3e8509258 Alfred Chen 2019-08-19 @7213  		per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
b99c6a31af83d8 Alfred Chen 2020-12-25  7214  		per_cpu(sched_cpu_llc_mask, cpu) = topo;
d821e3e8509258 Alfred Chen 2019-08-19  7215  		TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
d821e3e8509258 Alfred Chen 2019-08-19  7216  
d821e3e8509258 Alfred Chen 2019-08-19  7217  		TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
d821e3e8509258 Alfred Chen 2019-08-19  7218  
d821e3e8509258 Alfred Chen 2019-08-19  7219  		TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
d821e3e8509258 Alfred Chen 2019-08-19  7220  
4076e7f2335228 Alfred Chen 2021-07-10  7221  		per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
617d32624ea559 Alfred Chen 2020-11-03  7222  		printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
617d32624ea559 Alfred Chen 2020-11-03  7223  		       cpu, per_cpu(sd_llc_id, cpu),
617d32624ea559 Alfred Chen 2020-11-03  7224  		       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
b99c6a31af83d8 Alfred Chen 2020-12-25  7225  			      per_cpu(sched_cpu_topo_masks, cpu)));
d821e3e8509258 Alfred Chen 2019-08-19  7226  	}
d821e3e8509258 Alfred Chen 2019-08-19  7227  }
d821e3e8509258 Alfred Chen 2019-08-19  7228  #endif
d821e3e8509258 Alfred Chen 2019-08-19  7229  

:::::: The code at line 7213 was first introduced by commit
:::::: d821e3e85092581709b1b5f9ab8cacf0ce70c1a8 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
