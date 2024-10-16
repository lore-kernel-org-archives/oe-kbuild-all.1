Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE9F16088F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 03:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729049073; cv=none; b=Ytxsojd6WJ+FZuzeYjT+Cc7wTFIBUEbMYb/sbV3DgDZevPRQV8SNVo83fKBRoEHafO++famBWw7jeNK19cgHuj8Ug2TtFQLZz3dMRwexCHB5p69xRRblgwaeSsIzSVEL2BollKNX7p+9WTjPjwBvClELxQhkWL0NiODBSwVJ+Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729049073; c=relaxed/simple;
	bh=H6YBgLqHqVRdDHU4BxIX//GzQnIabMl7nnN/W0Ar/8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mUjWAL8RRi1OTaFh0pL+yhSjGpJgh5wZn3AF2sJhnZgxzg5o1olpk8Rsn26P4LAk+mY/DHSAO835NfUOfDih5y3Fz1kwdyGU5zSjEiLKf3CRebppZdOrFU2a0r/GU5a02S0tt82285enE7agdgNUa7bAl0q/OMmPHOubYFh/oGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ra1E4pzC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ra1E4pzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729049072; x=1760585072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H6YBgLqHqVRdDHU4BxIX//GzQnIabMl7nnN/W0Ar/8M=;
  b=Ra1E4pzCimTVzMT8hcyTR+f+ULQLjNxyWpbnEdY+dh0Tvj1rmuar485z
   dT6MEg2uhOaU8FRjEN1p3M6GOYEI2jfSDFcA0isdC4oam4Mwo/DN9n9n2
   WHbu3OUl6TqHbjhKmn1CaBCL7/iOhfU6B7NVhbZyrbHHHFVABirXEb6OS
   wFLD1VD+ITc+qYRb8nHDphnxujRSp1TNwmQtiHiOIdxjuqv+pIeeo6XWG
   qtFtdLPXFuCcErlXA7TXINzQnzNz8klg+OchA+6NSEjeFCvIi++/r9xyF
   GhhxgGW/Ey5NJlL1M0wkHFYyboW4OLOOKwtx1WfQzBn4sdqkilSa81Ago
   g==;
X-CSE-ConnectionGUID: 5HkQDnH2S4C5rgTKzJmq8Q==
X-CSE-MsgGUID: K9nBhngySNKy+cuNpMAmoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39029223"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39029223"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:24:31 -0700
X-CSE-ConnectionGUID: ox4o1Vb9Q4K4U0vNrUO/CQ==
X-CSE-MsgGUID: P8N5HgZOQMCOFcvtLscvFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="108872214"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Oct 2024 20:24:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0ueB-000KDf-25;
	Wed, 16 Oct 2024 03:24:27 +0000
Date: Wed, 16 Oct 2024 11:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.11/main 294/1854] kernel/sched/alt_core.c:556:25: error: use
 of undeclared identifier 'paravirt_steal_rq_enabled'
Message-ID: <202410161121.EXEsaC0D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.11/main
head:   afade16a193faf08d100d52c254bb5c6c5605b8c
commit: eb12a7b51b974d5d081846afd6ae8741716092ed [294/1854] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241016/202410161121.EXEsaC0D-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161121.EXEsaC0D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161121.EXEsaC0D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:16:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:556:25: error: use of undeclared identifier 'paravirt_steal_rq_enabled'
     556 |         if (static_key_false((&paravirt_steal_rq_enabled))) {
         |                                ^
>> kernel/sched/alt_core.c:557:11: error: call to undeclared function 'paravirt_steal_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     557 |                 steal = paravirt_steal_clock(cpu_of(rq));
         |                         ^
   kernel/sched/alt_core.c:578:14: error: call to undeclared function 'sched_clock_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     578 |         s64 delta = sched_clock_cpu(cpu_of(rq)) - rq->clock;
         |                     ^
   kernel/sched/alt_core.c:632:15: error: conflicting types for 'sched_cpu_util'
     632 | unsigned long sched_cpu_util(int cpu, unsigned long max)
         |               ^
   include/linux/sched.h:2183:15: note: previous declaration is here
    2183 | unsigned long sched_cpu_util(int cpu);
         |               ^
   kernel/sched/alt_core.c:984:3: error: call to undeclared function 'trace_ipi_send_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     984 |                 smp_send_reschedule(cpu);
         |                 ^
   include/linux/smp.h:140:2: note: expanded from macro 'smp_send_reschedule'
     140 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for function 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^
   kernel/sched/alt_core.c:966:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     966 | void resched_curr(struct rq *rq)
         | ^
         | static 
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
     989 | void resched_cpu(int cpu)
         |      ^
   kernel/sched/alt_core.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     989 | void resched_cpu(int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:1004:6: warning: no previous prototype for function 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1004 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^
   kernel/sched/alt_core.c:1004:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1004 | void select_nohz_load_balancer(int stop_tick) {}
         | ^
         | static 
   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for function 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1006 | void set_cpu_sd_state_idle(void) {}
         |      ^
   kernel/sched/alt_core.c:1006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1006 | void set_cpu_sd_state_idle(void) {}
         | ^
         | static 
   kernel/sched/alt_core.c:1061:3: error: call to undeclared function 'trace_ipi_send_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1061 |                 smp_send_reschedule(cpu);
         |                 ^
   include/linux/smp.h:140:2: note: expanded from macro 'smp_send_reschedule'
     140 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^
   kernel/sched/alt_core.c:1192:6: warning: no previous prototype for function 'hrtick_start' [-Wmissing-prototypes]
    1192 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^
   kernel/sched/alt_core.c:1192:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1192 | void hrtick_start(struct rq *rq, u64 delay)
         | ^
         | static 
   kernel/sched/alt_core.c:1380:2: error: call to undeclared function 'rseq_migrate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1380 |         rseq_migrate(p);
         |         ^
   kernel/sched/alt_core.c:1797:3: error: call to undeclared function 'trace_ipi_send_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1797 |                 smp_send_reschedule(cpu);
         |                 ^
   include/linux/smp.h:140:2: note: expanded from macro 'smp_send_reschedule'
     140 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^
   kernel/sched/alt_core.c:2339:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
    2339 | void sched_ttwu_pending(void *arg)
         |      ^
   kernel/sched/alt_core.c:2339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2339 | void sched_ttwu_pending(void *arg)
         | ^
         | static 
   kernel/sched/alt_core.c:2372:6: warning: no previous prototype for function 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2372 | void send_call_function_single_ipi(int cpu)
         |      ^
   kernel/sched/alt_core.c:2372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2372 | void send_call_function_single_ipi(int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:2432:3: error: call to undeclared function 'sched_clock_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2432 |                 sched_clock_cpu(cpu); /* Sync clocks across CPUs */
         |                 ^
   kernel/sched/alt_core.c:3021:2: error: call to undeclared function 'rseq_migrate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3021 |         rseq_migrate(p);
         |         ^
   kernel/sched/alt_core.c:3102:21: error: incompatible function pointer types initializing 'proc_handler *' (aka 'int (*)(const struct ctl_table *, int, void *, unsigned long *, long long *)') with an expression of type 'int (struct ctl_table *, int, void *, size_t *, loff_t *)' (aka 'int (struct ctl_table *, int, void *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
    3102 |                 .proc_handler   = sysctl_schedstats,
         |                                   ^~~~~~~~~~~~~~~~~
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


vim +/paravirt_steal_rq_enabled +556 kernel/sched/alt_core.c

8fcc2434d7911b Alfred Chen 2021-09-02  518  
ce5a2e79cb434d Alfred Chen 2019-08-19  519  /*
ce5a2e79cb434d Alfred Chen 2019-08-19  520   * RQ-clock updating methods:
ce5a2e79cb434d Alfred Chen 2019-08-19  521   */
ce5a2e79cb434d Alfred Chen 2019-08-19  522  
ce5a2e79cb434d Alfred Chen 2019-08-19  523  static void update_rq_clock_task(struct rq *rq, s64 delta)
ce5a2e79cb434d Alfred Chen 2019-08-19  524  {
ce5a2e79cb434d Alfred Chen 2019-08-19  525  /*
ce5a2e79cb434d Alfred Chen 2019-08-19  526   * In theory, the compile should just see 0 here, and optimize out the call
ce5a2e79cb434d Alfred Chen 2019-08-19  527   * to sched_rt_avg_update. But I don't trust it...
ce5a2e79cb434d Alfred Chen 2019-08-19  528   */
ce5a2e79cb434d Alfred Chen 2019-08-19  529  	s64 __maybe_unused steal = 0, irq_delta = 0;
ce5a2e79cb434d Alfred Chen 2019-08-19  530  
ce5a2e79cb434d Alfred Chen 2019-08-19  531  #ifdef CONFIG_IRQ_TIME_ACCOUNTING
ce5a2e79cb434d Alfred Chen 2019-08-19  532  	irq_delta = irq_time_read(cpu_of(rq)) - rq->prev_irq_time;
ce5a2e79cb434d Alfred Chen 2019-08-19  533  
ce5a2e79cb434d Alfred Chen 2019-08-19  534  	/*
ce5a2e79cb434d Alfred Chen 2019-08-19  535  	 * Since irq_time is only updated on {soft,}irq_exit, we might run into
ce5a2e79cb434d Alfred Chen 2019-08-19  536  	 * this case when a previous update_rq_clock() happened inside a
ce5a2e79cb434d Alfred Chen 2019-08-19  537  	 * {soft,}irq region.
ce5a2e79cb434d Alfred Chen 2019-08-19  538  	 *
ce5a2e79cb434d Alfred Chen 2019-08-19  539  	 * When this happens, we stop ->clock_task and only update the
ce5a2e79cb434d Alfred Chen 2019-08-19  540  	 * prev_irq_time stamp to account for the part that fit, so that a next
ce5a2e79cb434d Alfred Chen 2019-08-19  541  	 * update will consume the rest. This ensures ->clock_task is
ce5a2e79cb434d Alfred Chen 2019-08-19  542  	 * monotonic.
ce5a2e79cb434d Alfred Chen 2019-08-19  543  	 *
ce5a2e79cb434d Alfred Chen 2019-08-19  544  	 * It does however cause some slight miss-attribution of {soft,}irq
ce5a2e79cb434d Alfred Chen 2019-08-19  545  	 * time, a more accurate solution would be to update the irq_time using
ce5a2e79cb434d Alfred Chen 2019-08-19  546  	 * the current rq->clock timestamp, except that would require using
ce5a2e79cb434d Alfred Chen 2019-08-19  547  	 * atomic ops.
ce5a2e79cb434d Alfred Chen 2019-08-19  548  	 */
ce5a2e79cb434d Alfred Chen 2019-08-19  549  	if (irq_delta > delta)
ce5a2e79cb434d Alfred Chen 2019-08-19  550  		irq_delta = delta;
ce5a2e79cb434d Alfred Chen 2019-08-19  551  
ce5a2e79cb434d Alfred Chen 2019-08-19  552  	rq->prev_irq_time += irq_delta;
ce5a2e79cb434d Alfred Chen 2019-08-19  553  	delta -= irq_delta;
ce5a2e79cb434d Alfred Chen 2019-08-19  554  #endif
ce5a2e79cb434d Alfred Chen 2019-08-19  555  #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
ce5a2e79cb434d Alfred Chen 2019-08-19 @556  	if (static_key_false((&paravirt_steal_rq_enabled))) {
ce5a2e79cb434d Alfred Chen 2019-08-19 @557  		steal = paravirt_steal_clock(cpu_of(rq));
ce5a2e79cb434d Alfred Chen 2019-08-19  558  		steal -= rq->prev_steal_time_rq;
ce5a2e79cb434d Alfred Chen 2019-08-19  559  
ce5a2e79cb434d Alfred Chen 2019-08-19  560  		if (unlikely(steal > delta))
ce5a2e79cb434d Alfred Chen 2019-08-19  561  			steal = delta;
ce5a2e79cb434d Alfred Chen 2019-08-19  562  
ce5a2e79cb434d Alfred Chen 2019-08-19  563  		rq->prev_steal_time_rq += steal;
ce5a2e79cb434d Alfred Chen 2019-08-19  564  		delta -= steal;
ce5a2e79cb434d Alfred Chen 2019-08-19  565  	}
ce5a2e79cb434d Alfred Chen 2019-08-19  566  #endif
ce5a2e79cb434d Alfred Chen 2019-08-19  567  
ce5a2e79cb434d Alfred Chen 2019-08-19  568  	rq->clock_task += delta;
ce5a2e79cb434d Alfred Chen 2019-08-19  569  

:::::: The code at line 556 was first introduced by commit
:::::: ce5a2e79cb434dd19c9e68f22d13090d097e8731 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
