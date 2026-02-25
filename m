Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208D283FC9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 10:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016372; cv=none; b=eRSeU1X1LHt2nPoRaV3nXEKjTfJc6rTKD+J8f6nR67Jag/yTXDirs2YCywCR5SBfjRP2O4C4tUXjmgCbO7Eui7u+PGwoB0Krk2kRrbNfkCYksCmvlhlJ5ky7ab10ZUgxMupCSCjyhIKvaJS2uo4sQMNPxrg2Kp/lImexRKm2f3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016372; c=relaxed/simple;
	bh=+QiEAqnPHchhC9MawvX+FUv/mFywbZaD5j6XBsHM0Jk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fEz1nxZ2QZjY0zJLxd5giG+EM9cY99SWGgJmVE+4aQJg68lVznsTsOmZa2KYFo+GmOxbMDoHl+YgJi4MqeZCJzLg6K46N7pn8MS88U9mejsh4MQ+wisoIs9tPb2mqfiiyrtekt8qRS7nJ3iGL0hwCbOSMTo7dl4mX6BJxZvz+vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+TIFJKT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+TIFJKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772016370; x=1803552370;
  h=date:from:to:cc:subject:message-id;
  bh=+QiEAqnPHchhC9MawvX+FUv/mFywbZaD5j6XBsHM0Jk=;
  b=h+TIFJKTbh45gtSOdZu2anBYTbimueH6mJQtWceOYFQE4gjPREqh+vRU
   Brxqbm3Hi/+0Us5ML+aOA7lJ531kDyLkD5BjcMnygc6N4LppcSEUdUOjs
   KdQQ+fuiAgC++CLPyg5/qBfRvPCZ9ff9PNas2rXcLVtBqhTy9AC2pLKcd
   wA0BDBvm/EnNftyjI+PHzgEykOKBcne7b9AdJtbfRIf/MY2fj8g7y3sXA
   +Xxp8wHkZH7NQVkPGmm7D4A7sd9k8xfwZ4w7knwrh9gPbA9+Yj/BoIeCK
   srwnXUcblN/KeX9yXL9rcLJtHM1DDL8szOtbry8bkkv3Nb9hqbA3kPvkJ
   w==;
X-CSE-ConnectionGUID: nDepCn/0RqOcfCWBDkWzxA==
X-CSE-MsgGUID: YcUQhL0rSXqoKnzPVKInkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72260311"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72260311"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 02:46:09 -0800
X-CSE-ConnectionGUID: jokFqWAtSKK+GJI7OoCq1Q==
X-CSE-MsgGUID: 8Xvfhd1aSnSJyO20EIkjKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="220315903"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Feb 2026 02:46:07 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvCP7-000000005IS-2FUd;
	Wed, 25 Feb 2026 10:46:05 +0000
Date: Wed, 25 Feb 2026 18:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-sub-sched-v2 27/40]
 kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member
 named 'sched'
Message-ID: <202602251856.fZjGb03r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-sched-v2
head:   f2122e67cf5ccb9d8844e72cd437a6fd56f0ad80
commit: f29a075bb677fcd452e67fed00034f2d55866449 [27/40] sched_ext: When calling ops.dispatch() @prev must be on the same scx_sched
config: powerpc-randconfig-001-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251856.fZjGb03r-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251856.fZjGb03r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251856.fZjGb03r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from include/linux/sched/cputime.h:6,
                    from kernel/sched/build_policy.c:17:
   kernel/sched/ext.c: In function 'scx_dispatch_sched':
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/rcupdate.h:507:17: note: in definition of macro '__rcu_access_pointer'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                 ^
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/rcupdate.h:507:38: note: in definition of macro '__rcu_access_pointer'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                      ^
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
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
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
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
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
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
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
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
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
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
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
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
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
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
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:2394:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/rcupdate.h:509:19: note: in definition of macro '__rcu_access_pointer'
     509 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   kernel/sched/ext.c:2394:24: note: in expansion of macro 'rcu_access_pointer'
    2394 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c: In function '__scx_init_task':
   kernel/sched/ext.c:3118:28: warning: unused variable 'tg' [-Wunused-variable]
    3118 |         struct task_group *tg = task_group(p);
         |                            ^~
   kernel/sched/ext.c: In function 'scx_root_disable':
   kernel/sched/ext.c:4698:9: error: implicit declaration of function 'drain_descendants' [-Werror=implicit-function-declaration]
    4698 |         drain_descendants(sch);
         |         ^~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:4759:29: error: 'struct scx_sched' has no member named 'cgrp'
    4759 |         set_cgroup_sched(sch->cgrp, NULL);
         |                             ^~
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:5232:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    5232 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_root_enable':
   kernel/sched/ext.c:5483:45: error: 'cgrp_dfl_root' undeclared (first use in this function)
    5483 |         sch = scx_alloc_and_add_sched(ops, &cgrp_dfl_root.cgrp, NULL);
         |                                             ^~~~~~~~~~~~~
   kernel/sched/ext.c:5483:45: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/ext.c:5609:29: error: 'struct scx_sched' has no member named 'cgrp'
    5609 |         set_cgroup_sched(sch->cgrp, sch);
         |                             ^~
   kernel/sched/ext.c: At top level:
   kernel/sched/ext.c:4685:13: warning: 'scx_propgate_disable' defined but not used [-Wunused-function]
    4685 | static void scx_propgate_disable(struct scx_sched *sch) { }
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2394 kernel/sched/ext.c

  2386	
  2387	static bool scx_dispatch_sched(struct scx_sched *sch, struct rq *rq,
  2388				       struct task_struct *prev)
  2389	{
  2390		struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
  2391		int nr_loops = SCX_DSP_MAX_LOOPS;
  2392		s32 cpu = cpu_of(rq);
  2393		bool prev_on_sch = (prev->sched_class == &ext_sched_class) &&
> 2394			sch == rcu_access_pointer(prev->scx.sched);
  2395	
  2396		if (consume_global_dsq(sch, rq))
  2397			return true;
  2398	
  2399		if (scx_bypassing(sch, cpu))
  2400			return consume_dispatch_q(sch, rq, bypass_dsq(sch, cpu));
  2401	
  2402		if (unlikely(!SCX_HAS_OP(sch, dispatch)) || !scx_rq_online(rq))
  2403			return false;
  2404	
  2405		dspc->rq = rq;
  2406	
  2407		/*
  2408		 * The dispatch loop. Because flush_dispatch_buf() may drop the rq lock,
  2409		 * the local DSQ might still end up empty after a successful
  2410		 * ops.dispatch(). If the local DSQ is empty even after ops.dispatch()
  2411		 * produced some tasks, retry. The BPF scheduler may depend on this
  2412		 * looping behavior to simplify its implementation.
  2413		 */
  2414		do {
  2415			dspc->nr_tasks = 0;
  2416	
  2417			SCX_CALL_OP(sch, SCX_KF_DISPATCH, dispatch, rq, cpu,
  2418				    prev_on_sch ? prev : NULL);
  2419	
  2420			flush_dispatch_buf(sch, rq);
  2421	
  2422			if ((prev->scx.flags & SCX_TASK_QUEUED) && prev->scx.slice) {
  2423				rq->scx.flags |= SCX_RQ_BAL_KEEP;
  2424				return true;
  2425			}
  2426			if (rq->scx.local_dsq.nr)
  2427				return true;
  2428			if (consume_global_dsq(sch, rq))
  2429				return true;
  2430	
  2431			/*
  2432			 * ops.dispatch() can trap us in this loop by repeatedly
  2433			 * dispatching ineligible tasks. Break out once in a while to
  2434			 * allow the watchdog to run. As IRQ can't be enabled in
  2435			 * balance(), we want to complete this scheduling cycle and then
  2436			 * start a new one. IOW, we want to call resched_curr() on the
  2437			 * next, most likely idle, task, not the current one. Use
  2438			 * __scx_bpf_kick_cpu() for deferred kicking.
  2439			 */
  2440			if (unlikely(!--nr_loops)) {
  2441				scx_kick_cpu(sch, cpu, 0);
  2442				break;
  2443			}
  2444		} while (dspc->nr_tasks);
  2445	
  2446		return false;
  2447	}
  2448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
