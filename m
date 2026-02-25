Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAB32FD69F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772020753; cv=none; b=oc19jUZItr/mJNOUqFR4lzv8yZ/Mecl2CPvJNVbiL5NmatoOINRO+dXxB7rnOosSmkfuJnoD7uiJPto94RKxleQEfIEDv4LEM74f/cVdEWNpJq53wvYTnEjCqDJqHyM3GlyCyVwCfQwlBfggXIYARpdmJdgsWKhBt11MeeRGtmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772020753; c=relaxed/simple;
	bh=Ph0kdy1DgjRPiSE4DBpyPgTTw5vfVrhnOr8Rt7Hzdxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=od2YaBDVWxpd0w8duoAaEQ6nkDxUl8udP6eFe/i3MnfMLH9JRFvnmDn1ysLKW6eCXEzC/2n+tRDZRX6F7LAo0Ee1gM+Umn/LwzjhWbFT3mM5f4/8VPnvQ+d35ka4ZEgH0msbPHkiNG2rMchq8W+NK9rFGvFU49gWz/6fziijKxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJQU3W3l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJQU3W3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772020752; x=1803556752;
  h=date:from:to:cc:subject:message-id;
  bh=Ph0kdy1DgjRPiSE4DBpyPgTTw5vfVrhnOr8Rt7Hzdxc=;
  b=SJQU3W3lXtGqSbuxoqXOb0vV+zq2OFMJMsHdPbbtjWRiUpDGLR6Y+DmP
   99GofV9WYgQgEIb1Ql03VBN6NhD1QpOB1MjsNlrsD/qPDIig+oznf144E
   F426Az+cTmNMojWq84A1pFvf+pimWLN05AzxW/wr/MHE1a9j+iCvYBRuV
   m8XyfcIh4D0m4130KcdWbE9effFp6c3DiVNfBUgVcxZaK8oW3b9kaEyVh
   cJLp5g2+b6kPqXyyoujbaJjfGBrWg8KK0k8gBGC0mTnNEYqZyuSRprACM
   UWd+7uShGbgWAcJJiRis1w6N5ar2DshOVzqx4X2uC5dj6gfmxQP5dS5b1
   Q==;
X-CSE-ConnectionGUID: wwvtyMMfSYOKR1L2o0E9HA==
X-CSE-MsgGUID: vY5mUu6OQMOwPpMgLxVm9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="95672939"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="95672939"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 03:59:11 -0800
X-CSE-ConnectionGUID: Bxek2Z0XRvmfPJ7B0RSSFA==
X-CSE-MsgGUID: pWWI97yeRP+YxNxvMd28Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="246767336"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Feb 2026 03:59:10 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvDXn-000000005Wx-2VXX;
	Wed, 25 Feb 2026 11:59:07 +0000
Date: Wed, 25 Feb 2026 19:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-sub-sched-v2 29/40]
 kernel/sched/ext.c:2459:27: error: 'struct scx_sched_pcpu' has no member
 named 'bypass_host_seq'
Message-ID: <202602251959.622Zkdps-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-sched-v2
head:   f2122e67cf5ccb9d8844e72cd437a6fd56f0ad80
commit: 6f0091bd18342d745facac02f1f57490f8a67d49 [29/40] sched_ext: Implement hierarchical bypass mode
config: powerpc-randconfig-001-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251959.622Zkdps-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251959.622Zkdps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251959.622Zkdps-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                    ^
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:507:50: note: in expansion of macro 'READ_ONCE'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2435:24: note: in expansion of macro 'rcu_access_pointer'
    2435 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2435:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2435 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:507:50: note: in expansion of macro 'READ_ONCE'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2435:24: note: in expansion of macro 'rcu_access_pointer'
    2435 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2435:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2435 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/compiler_types.h:633:27: note: in definition of macro '__unqual_scalar_typeof'
     633 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/rcupdate.h:507:50: note: in expansion of macro 'READ_ONCE'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2435:24: note: in expansion of macro 'rcu_access_pointer'
    2435 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
   kernel/sched/ext.c:2435:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2435 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:507:50: note: in expansion of macro 'READ_ONCE'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2435:24: note: in expansion of macro 'rcu_access_pointer'
    2435 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2435:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2435 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/rcupdate.h:509:19: note: in definition of macro '__rcu_access_pointer'
     509 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   kernel/sched/ext.c:2435:24: note: in expansion of macro 'rcu_access_pointer'
    2435 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:62:
>> kernel/sched/ext.c:2459:27: error: 'struct scx_sched_pcpu' has no member named 'bypass_host_seq'
    2459 |                 if (!(pcpu->bypass_host_seq++ % SCX_BYPASS_HOST_NTH) &&
         |                           ^~
   kernel/sched/ext.c: In function '__scx_init_task':
   kernel/sched/ext.c:3190:28: warning: unused variable 'tg' [-Wunused-variable]
    3190 |         struct task_group *tg = task_group(p);
         |                            ^~
   kernel/sched/ext.c: In function 'scx_root_disable':
   kernel/sched/ext.c:4833:9: error: implicit declaration of function 'drain_descendants' [-Werror=implicit-function-declaration]
    4833 |         drain_descendants(sch);
         |         ^~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:4894:29: error: 'struct scx_sched' has no member named 'cgrp'
    4894 |         set_cgroup_sched(sch->cgrp, NULL);
         |                             ^~
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:5368:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    5368 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_root_enable':
   kernel/sched/ext.c:5619:45: error: 'cgrp_dfl_root' undeclared (first use in this function)
    5619 |         sch = scx_alloc_and_add_sched(ops, &cgrp_dfl_root.cgrp, NULL);
         |                                             ^~~~~~~~~~~~~
   kernel/sched/ext.c:5619:45: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/ext.c:5745:29: error: 'struct scx_sched' has no member named 'cgrp'
    5745 |         set_cgroup_sched(sch->cgrp, sch);
         |                             ^~
   kernel/sched/ext.c: At top level:
   kernel/sched/ext.c:4820:13: warning: 'scx_propgate_disable' defined but not used [-Wunused-function]
    4820 | static void scx_propgate_disable(struct scx_sched *sch) { }
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2459 kernel/sched/ext.c

  2427	
  2428	static bool scx_dispatch_sched(struct scx_sched *sch, struct rq *rq,
  2429				       struct task_struct *prev)
  2430	{
  2431		struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
  2432		int nr_loops = SCX_DSP_MAX_LOOPS;
  2433		s32 cpu = cpu_of(rq);
  2434		bool prev_on_sch = (prev->sched_class == &ext_sched_class) &&
  2435			sch == rcu_access_pointer(prev->scx.sched);
  2436	
  2437		if (consume_global_dsq(sch, rq))
  2438			return true;
  2439	
  2440		if (bypass_dsp_enabled(sch)) {
  2441			struct scx_sched_pcpu *pcpu = per_cpu_ptr(sch->pcpu, cpu);
  2442	
  2443			/* if @sch is bypassing, only the bypass DSQs are active */
  2444			if (scx_bypassing(sch, cpu))
  2445				return consume_dispatch_q(sch, rq, bypass_dsq(sch, cpu));
  2446	
  2447			/*
  2448			 * If @sch isn't bypassing but its children are, @sch is
  2449			 * responsible for making forward progress for both its own
  2450			 * tasks that aren't bypassing and the bypassing descendants'
  2451			 * tasks. The following implements a simple built-in behavior -
  2452			 * let each CPU try to run the bypass DSQ every Nth time.
  2453			 *
  2454			 * Later, if necessary, we can add an ops flag to suppress the
  2455			 * auto-consumption and a kfunc to consume the bypass DSQ and,
  2456			 * so that the BPF scheduler can fully control scheduling of
  2457			 * bypassed tasks.
  2458			 */
> 2459			if (!(pcpu->bypass_host_seq++ % SCX_BYPASS_HOST_NTH) &&
  2460			    consume_dispatch_q(sch, rq, bypass_dsq(sch, cpu))) {
  2461				__scx_add_event(sch, SCX_EV_SUB_BYPASS_DISPATCH, 1);
  2462				return true;
  2463			}
  2464		}
  2465	
  2466		if (unlikely(!SCX_HAS_OP(sch, dispatch)) || !scx_rq_online(rq))
  2467			return false;
  2468	
  2469		dspc->rq = rq;
  2470	
  2471		/*
  2472		 * The dispatch loop. Because flush_dispatch_buf() may drop the rq lock,
  2473		 * the local DSQ might still end up empty after a successful
  2474		 * ops.dispatch(). If the local DSQ is empty even after ops.dispatch()
  2475		 * produced some tasks, retry. The BPF scheduler may depend on this
  2476		 * looping behavior to simplify its implementation.
  2477		 */
  2478		do {
  2479			dspc->nr_tasks = 0;
  2480	
  2481			SCX_CALL_OP(sch, SCX_KF_DISPATCH, dispatch, rq, cpu,
  2482				    prev_on_sch ? prev : NULL);
  2483	
  2484			flush_dispatch_buf(sch, rq);
  2485	
  2486			if ((prev->scx.flags & SCX_TASK_QUEUED) && prev->scx.slice) {
  2487				rq->scx.flags |= SCX_RQ_BAL_KEEP;
  2488				return true;
  2489			}
  2490			if (rq->scx.local_dsq.nr)
  2491				return true;
  2492			if (consume_global_dsq(sch, rq))
  2493				return true;
  2494	
  2495			/*
  2496			 * ops.dispatch() can trap us in this loop by repeatedly
  2497			 * dispatching ineligible tasks. Break out once in a while to
  2498			 * allow the watchdog to run. As IRQ can't be enabled in
  2499			 * balance(), we want to complete this scheduling cycle and then
  2500			 * start a new one. IOW, we want to call resched_curr() on the
  2501			 * next, most likely idle, task, not the current one. Use
  2502			 * __scx_bpf_kick_cpu() for deferred kicking.
  2503			 */
  2504			if (unlikely(!--nr_loops)) {
  2505				scx_kick_cpu(sch, cpu, 0);
  2506				break;
  2507			}
  2508		} while (dspc->nr_tasks);
  2509	
  2510		/*
  2511		 * Prevent the CPU from going idle while bypassed descendants have tasks
  2512		 * queued. Without this fallback, bypassed tasks could stall if the host
  2513		 * scheduler's ops.dispatch() doesn't yield any tasks.
  2514		 */
  2515		if (bypass_dsp_enabled(sch))
  2516			return consume_dispatch_q(sch, rq, bypass_dsq(sch, cpu));
  2517	
  2518		return false;
  2519	}
  2520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
