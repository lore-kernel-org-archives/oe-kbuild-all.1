Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBC01FDF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 04:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzLX3TGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700453671; x=1731989671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DfYOIHOdUaTA9Im4n3YdJhBZLhnWURnGSXXkG92U0Cs=;
  b=KzLX3TGepIx3qDY4d6Pw8yLsso+Ks7Tw069iznZDs421WmR23vcn4E7t
   TjdP4SsFM5mKR3wXksTSaq05K7C/Q5Wc5fNVLh6HZ8Qqn2hmp0WWZCvUt
   b1IRtQo3s9Kd/4zflAu4xQ9JMrLgOqFtPDUz16ZcpBz/XtcMAos2L6uRC
   P3giguBzBFjG+2NgPzcfwUcbHb60rWZkM1h0pEN75bPY3F7+zG48jWjTj
   6HMpdeidXjRq9YRG2syMTV7yyBOQ/JbAv7x67gf6tj7up7a+S2qvJH+pP
   v4jR/bbFNoC99cw93jQovKrG+kzxHuoH5AEwhegofqABZqkYYbClz+ywY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="391328030"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="391328030"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 20:13:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="795353217"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="795353217"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Nov 2023 20:13:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4vew-0005vZ-1Z;
	Mon, 20 Nov 2023 04:13:35 +0000
Date: Mon, 20 Nov 2023 12:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 423/449] kernel/sched/alt_core.c:2516:6: warning: no
 previous prototype for function 'call_function_single_prep_ipi'
Message-ID: <202311201210.qJXAnMqm-lkp@intel.com>
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
commit: e87f8ff87a16260e09635f7c5c494d2a6ca5a717 [423/449] sched/alt: [Sync] 68f4ff04dbad sched, smp: Trace smp callback causing an IPI
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311201210.qJXAnMqm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201210.qJXAnMqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201210.qJXAnMqm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:44:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:690:21: error: no member named 'cid_lock' in 'struct mm_struct'
     690 |         raw_spin_lock(&mm->cid_lock);
         |                        ~~  ^
   include/linux/spinlock.h:217:44: note: expanded from macro 'raw_spin_lock'
     217 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                                ^~~~
   In file included from kernel/sched/alt_core.c:44:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:692:23: error: no member named 'cid_lock' in 'struct mm_struct'
     692 |         raw_spin_unlock(&mm->cid_lock);
         |                          ~~  ^
   include/linux/spinlock.h:276:49: note: expanded from macro 'raw_spin_unlock'
     276 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                                          ^~~~
   In file included from kernel/sched/alt_core.c:44:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:700:21: error: no member named 'cid_lock' in 'struct mm_struct'
     700 |         raw_spin_lock(&mm->cid_lock);
         |                        ~~  ^
   include/linux/spinlock.h:217:44: note: expanded from macro 'raw_spin_lock'
     217 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                                ^~~~
   In file included from kernel/sched/alt_core.c:44:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:702:23: error: no member named 'cid_lock' in 'struct mm_struct'
     702 |         raw_spin_unlock(&mm->cid_lock);
         |                          ~~  ^
   include/linux/spinlock.h:276:49: note: expanded from macro 'raw_spin_unlock'
     276 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                                          ^~~~
   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for function 'resched_curr' [-Wmissing-prototypes]
    1006 | void resched_curr(struct rq *rq)
         |      ^
   kernel/sched/alt_core.c:1006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1006 | void resched_curr(struct rq *rq)
         | ^
         | static 
   kernel/sched/alt_core.c:1029:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
    1029 | void resched_cpu(int cpu)
         |      ^
   kernel/sched/alt_core.c:1029:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1029 | void resched_cpu(int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:1044:6: warning: no previous prototype for function 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1044 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^
   kernel/sched/alt_core.c:1044:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1044 | void select_nohz_load_balancer(int stop_tick) {}
         | ^
         | static 
   kernel/sched/alt_core.c:1046:6: warning: no previous prototype for function 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1046 | void set_cpu_sd_state_idle(void) {}
         |      ^
   kernel/sched/alt_core.c:1046:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1046 | void set_cpu_sd_state_idle(void) {}
         | ^
         | static 
   kernel/sched/alt_core.c:1232:6: warning: no previous prototype for function 'hrtick_start' [-Wmissing-prototypes]
    1232 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^
   kernel/sched/alt_core.c:1232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1232 | void hrtick_start(struct rq *rq, u64 delay)
         | ^
         | static 
   kernel/sched/alt_core.c:2473:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
    2473 | void sched_ttwu_pending(void *arg)
         |      ^
   kernel/sched/alt_core.c:2473:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2473 | void sched_ttwu_pending(void *arg)
         | ^
         | static 
>> kernel/sched/alt_core.c:2516:6: warning: no previous prototype for function 'call_function_single_prep_ipi' [-Wmissing-prototypes]
    2516 | bool call_function_single_prep_ipi(int cpu)
         |      ^
   kernel/sched/alt_core.c:2516:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2516 | bool call_function_single_prep_ipi(int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:5607:3: error: call to undeclared function 'cpuset_read_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5607 |                 cpuset_read_lock();
         |                 ^
   kernel/sched/alt_core.c:5607:3: note: did you mean 'cpus_read_lock'?
   include/linux/cpu.h:130:13: note: 'cpus_read_lock' declared here
     130 | extern void cpus_read_lock(void);
         |             ^
   kernel/sched/alt_core.c:5655:4: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5655 |                         cpuset_read_unlock();
         |                         ^
   kernel/sched/alt_core.c:5687:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5687 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:5701:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5701 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:7110:5: error: conflicting types for 'task_can_attach'
    7110 | int task_can_attach(struct task_struct *p,
         |     ^
   include/linux/sched.h:1883:12: note: previous declaration is here
    1883 | extern int task_can_attach(struct task_struct *p);
         |            ^
   kernel/sched/alt_core.c:7137:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
    7137 | void idle_task_exit(void)
         |      ^
   kernel/sched/alt_core.c:7137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7137 | void idle_task_exit(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7347:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
    7347 | int sched_cpu_activate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7347 | int sched_cpu_activate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7386:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7386 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7386:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7386 | int sched_cpu_deactivate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7450:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
    7450 | int sched_cpu_starting(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7450:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7450 | int sched_cpu_starting(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7470:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7470 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7470:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7470 | int sched_cpu_wait_empty(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7512:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
    7512 | int sched_cpu_dying(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7512:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7512 | int sched_cpu_dying(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7578:43: error: call to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7578 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^
   kernel/sched/alt_core.c:7578:43: note: did you mean 'cpu_core_mask'?
   arch/powerpc/include/asm/smp.h:118:31: note: 'cpu_core_mask' declared here
     118 | static inline struct cpumask *cpu_core_mask(int cpu)
         |                               ^
   kernel/sched/alt_core.c:7578:43: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7578 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:160:64: note: passing argument to parameter 'srcp' here
     160 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                                ^
   kernel/sched/alt_core.c:7580:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7580 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7553:30: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7553 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:567:33: note: passing argument to parameter 'src2p' here
     567 |                                const struct cpumask *src2p)
         |                                                      ^
   kernel/sched/alt_core.c:7580:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7580 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7554:22: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7554 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:738:27: note: passing argument to parameter 'srcp' here
     738 |                                 const struct cpumask *srcp)


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
