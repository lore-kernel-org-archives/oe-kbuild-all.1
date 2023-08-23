Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5921FB35
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 21:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692826561; x=1724362561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SMgpZUHqm0NdKoF+JYrC7IkaRZlZ7/7l0GwkehiY4/E=;
  b=Bf+NeyFk3m9x63LF/irSu/SLmvtgRQYbVRraSg7CXuUmb9dxO2rwi6pF
   rgopyJSU330Zxby+jHKM6u+myuq7qwv50M0DRp5zZASKiC80+VVw+Qzxs
   HwLmwY+QcfZcF2jFW7X/QNMEWem1lKGJOamCWtS7SUjB6EC6tjc6UiI1I
   lCoED9irj5U6CCLuN5eS/eTgaf+Nh/OVz67i8+0nmQgvgR4uayZ0frmMr
   khy5OWJHiQN46b2pWv/JubMw1auQegeJ7vwtHE4W1N6pBiIrX6JWTpRWt
   KM61nL8ZpZV0ndQqlXJ/gBLtaeWjTHnMEbkVxjc7zf+JOaBFc2LsIXTlf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405281999"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="405281999"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 14:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="860465662"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="860465662"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 23 Aug 2023 14:35:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYvVP-0001We-2y;
	Wed, 23 Aug 2023 21:35:14 +0000
Date: Thu, 24 Aug 2023 05:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:generalized-misfit-lb 6/13]
 kernel/sched/fair.c:9693:20: error: 'struct sg_lb_stats' has no member named
 'nr_numa_running'
Message-ID: <202308240556.UA1ajMhB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux generalized-misfit-lb
head:   c3b510f9f9b7eb321f7179b6036214b7a9509333
commit: 9d321b581f2987c828cba02753a41273b7f155c3 [6/13] sched/fair: Add a misfit reason
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230824/202308240556.UA1ajMhB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240556.UA1ajMhB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240556.UA1ajMhB-lkp@intel.com/

All errors (new ones prefixed by >>):

    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:438:50: note: in expansion of macro 'READ_ONCE'
     438 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:586:9: note: in expansion of macro '__rcu_dereference_check'
     586 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1818:9: note: in expansion of macro 'rcu_dereference_check'
    1818 |         rcu_dereference_check((p), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:21: note: in expansion of macro 'rcu_dereference_check_sched_domain'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/sched.h:1829:56: note: in expansion of macro 'cpu_rq'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                                                        ^~~~~~
   kernel/sched/sched.h:1874:9: note: in expansion of macro 'for_each_domain'
    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:67: error: invalid use of undefined type 'struct rq'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                                                                   ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:438:50: note: in expansion of macro 'READ_ONCE'
     438 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:586:9: note: in expansion of macro '__rcu_dereference_check'
     586 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1818:9: note: in expansion of macro 'rcu_dereference_check'
    1818 |         rcu_dereference_check((p), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:21: note: in expansion of macro 'rcu_dereference_check_sched_domain'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1874:9: note: in expansion of macro 'for_each_domain'
    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/rcupdate.h:441:19: note: in definition of macro '__rcu_dereference_check'
     441 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   kernel/sched/sched.h:1818:9: note: in expansion of macro 'rcu_dereference_check'
    1818 |         rcu_dereference_check((p), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:21: note: in expansion of macro 'rcu_dereference_check_sched_domain'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/sched.h:1829:56: note: in expansion of macro 'cpu_rq'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                                                        ^~~~~~
   kernel/sched/sched.h:1874:9: note: in expansion of macro 'for_each_domain'
    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:67: error: invalid use of undefined type 'struct rq'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                                                                   ^~
   include/linux/rcupdate.h:441:19: note: in definition of macro '__rcu_dereference_check'
     441 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   kernel/sched/sched.h:1818:9: note: in expansion of macro 'rcu_dereference_check'
    1818 |         rcu_dereference_check((p), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:21: note: in expansion of macro 'rcu_dereference_check_sched_domain'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1874:9: note: in expansion of macro 'for_each_domain'
    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   In file included from kernel/sched/sched.h:1972:
   kernel/sched/stats.h: In function 'rq_sched_info_arrive':
>> kernel/sched/stats.h:16:19: error: invalid use of undefined type 'struct rq'
      16 |                 rq->rq_sched_info.run_delay += delta;
         |                   ^~
   kernel/sched/stats.h:17:19: error: invalid use of undefined type 'struct rq'
      17 |                 rq->rq_sched_info.pcount++;
         |                   ^~
   kernel/sched/stats.h: In function 'rq_sched_info_depart':
   kernel/sched/stats.h:28:19: error: invalid use of undefined type 'struct rq'
      28 |                 rq->rq_cpu_time += delta;
         |                   ^~
   kernel/sched/stats.h: In function 'rq_sched_info_dequeue':
   kernel/sched/stats.h:35:19: error: invalid use of undefined type 'struct rq'
      35 |                 rq->rq_sched_info.run_delay += delta;
         |                   ^~
   kernel/sched/stats.h: In function 'sched_info_switch':
   kernel/sched/stats.h:283:23: error: invalid use of undefined type 'struct rq'
     283 |         if (prev != rq->idle)
         |                       ^~
   kernel/sched/stats.h:286:23: error: invalid use of undefined type 'struct rq'
     286 |         if (next != rq->idle)
         |                       ^~
   kernel/sched/sched.h: In function 'task_current':
   kernel/sched/sched.h:2147:18: error: invalid use of undefined type 'struct rq'
    2147 |         return rq->curr == p;
         |                  ^~
   kernel/sched/sched.h: In function 'put_prev_task':
   kernel/sched/sched.h:2310:24: error: invalid use of undefined type 'struct rq'
    2310 |         WARN_ON_ONCE(rq->curr != prev);
         |                        ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   kernel/sched/sched.h: In function 'sched_stop_runnable':
   kernel/sched/sched.h:2355:18: error: invalid use of undefined type 'struct rq'
    2355 |         return rq->stop && task_on_rq_queued(rq->stop);
         |                  ^~
   kernel/sched/sched.h:2355:48: error: invalid use of undefined type 'struct rq'
    2355 |         return rq->stop && task_on_rq_queued(rq->stop);
         |                                                ^~
   kernel/sched/sched.h: In function 'sched_dl_runnable':
   kernel/sched/sched.h:2360:18: error: invalid use of undefined type 'struct rq'
    2360 |         return rq->dl.dl_nr_running > 0;
         |                  ^~
   kernel/sched/sched.h: In function 'sched_rt_runnable':
   kernel/sched/sched.h:2365:18: error: invalid use of undefined type 'struct rq'
    2365 |         return rq->rt.rt_queued > 0;
         |                  ^~
   kernel/sched/sched.h: In function 'sched_fair_runnable':
   kernel/sched/sched.h:2370:18: error: invalid use of undefined type 'struct rq'
    2370 |         return rq->cfs.nr_running > 0;
         |                  ^~
   kernel/sched/sched.h: In function 'get_push_task':
   kernel/sched/sched.h:2391:35: error: invalid use of undefined type 'struct rq'
    2391 |         struct task_struct *p = rq->curr;
         |                                   ^~
   kernel/sched/sched.h:2395:15: error: invalid use of undefined type 'struct rq'
    2395 |         if (rq->push_busy)
         |               ^~
   kernel/sched/sched.h:2404:11: error: invalid use of undefined type 'struct rq'
    2404 |         rq->push_busy = true;
         |           ^~
   kernel/sched/sched.h: In function 'add_nr_running':
   kernel/sched/sched.h:2497:30: error: invalid use of undefined type 'struct rq'
    2497 |         unsigned prev_nr = rq->nr_running;
         |                              ^~
   kernel/sched/sched.h:2499:11: error: invalid use of undefined type 'struct rq'
    2499 |         rq->nr_running = prev_nr + count;
         |           ^~
   kernel/sched/sched.h:2505:30: error: invalid use of undefined type 'struct rq'
    2505 |         if (prev_nr < 2 && rq->nr_running >= 2) {
         |                              ^~
   kernel/sched/sched.h:2506:34: error: invalid use of undefined type 'struct rq'
    2506 |                 if (!READ_ONCE(rq->rd->overload))
         |                                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/sched.h:2506:22: note: in expansion of macro 'READ_ONCE'
    2506 |                 if (!READ_ONCE(rq->rd->overload))
         |                      ^~~~~~~~~
   kernel/sched/sched.h:2506:34: error: invalid use of undefined type 'struct rq'
    2506 |                 if (!READ_ONCE(rq->rd->overload))
         |                                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
--
    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:438:50: note: in expansion of macro 'READ_ONCE'
     438 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:586:9: note: in expansion of macro '__rcu_dereference_check'
     586 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1818:9: note: in expansion of macro 'rcu_dereference_check'
    1818 |         rcu_dereference_check((p), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:21: note: in expansion of macro 'rcu_dereference_check_sched_domain'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/sched.h:1829:56: note: in expansion of macro 'cpu_rq'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                                                        ^~~~~~
   kernel/sched/sched.h:1874:9: note: in expansion of macro 'for_each_domain'
    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:67: error: invalid use of undefined type 'struct rq'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                                                                   ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:438:50: note: in expansion of macro 'READ_ONCE'
     438 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:586:9: note: in expansion of macro '__rcu_dereference_check'
     586 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1818:9: note: in expansion of macro 'rcu_dereference_check'
    1818 |         rcu_dereference_check((p), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:21: note: in expansion of macro 'rcu_dereference_check_sched_domain'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1874:9: note: in expansion of macro 'for_each_domain'
    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/rcupdate.h:441:19: note: in definition of macro '__rcu_dereference_check'
     441 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   kernel/sched/sched.h:1818:9: note: in expansion of macro 'rcu_dereference_check'
    1818 |         rcu_dereference_check((p), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:21: note: in expansion of macro 'rcu_dereference_check_sched_domain'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/sched.h:1829:56: note: in expansion of macro 'cpu_rq'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                                                        ^~~~~~
   kernel/sched/sched.h:1874:9: note: in expansion of macro 'for_each_domain'
    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:67: error: invalid use of undefined type 'struct rq'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                                                                   ^~
   include/linux/rcupdate.h:441:19: note: in definition of macro '__rcu_dereference_check'
     441 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   kernel/sched/sched.h:1818:9: note: in expansion of macro 'rcu_dereference_check'
    1818 |         rcu_dereference_check((p), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1829:21: note: in expansion of macro 'rcu_dereference_check_sched_domain'
    1829 |         for (__sd = rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd); \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:1874:9: note: in expansion of macro 'for_each_domain'
    1874 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
   In file included from kernel/sched/sched.h:1972:
   kernel/sched/stats.h: In function 'rq_sched_info_arrive':
>> kernel/sched/stats.h:16:19: error: invalid use of undefined type 'struct rq'
      16 |                 rq->rq_sched_info.run_delay += delta;
         |                   ^~
   kernel/sched/stats.h:17:19: error: invalid use of undefined type 'struct rq'
      17 |                 rq->rq_sched_info.pcount++;
         |                   ^~
   kernel/sched/stats.h: In function 'rq_sched_info_depart':
   kernel/sched/stats.h:28:19: error: invalid use of undefined type 'struct rq'
      28 |                 rq->rq_cpu_time += delta;
         |                   ^~
   kernel/sched/stats.h: In function 'rq_sched_info_dequeue':
   kernel/sched/stats.h:35:19: error: invalid use of undefined type 'struct rq'
      35 |                 rq->rq_sched_info.run_delay += delta;
         |                   ^~
   kernel/sched/stats.h: In function 'sched_info_switch':
   kernel/sched/stats.h:283:23: error: invalid use of undefined type 'struct rq'
     283 |         if (prev != rq->idle)
         |                       ^~
   kernel/sched/stats.h:286:23: error: invalid use of undefined type 'struct rq'
     286 |         if (next != rq->idle)
         |                       ^~
   kernel/sched/sched.h: In function 'task_current':
   kernel/sched/sched.h:2147:18: error: invalid use of undefined type 'struct rq'
    2147 |         return rq->curr == p;
         |                  ^~
   In file included from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:13:
   kernel/sched/sched.h: In function 'put_prev_task':
   kernel/sched/sched.h:2310:24: error: invalid use of undefined type 'struct rq'
    2310 |         WARN_ON_ONCE(rq->curr != prev);
         |                        ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   kernel/sched/sched.h: In function 'sched_stop_runnable':
   kernel/sched/sched.h:2355:18: error: invalid use of undefined type 'struct rq'
    2355 |         return rq->stop && task_on_rq_queued(rq->stop);
         |                  ^~
   kernel/sched/sched.h:2355:48: error: invalid use of undefined type 'struct rq'
    2355 |         return rq->stop && task_on_rq_queued(rq->stop);
         |                                                ^~
   kernel/sched/sched.h: In function 'sched_dl_runnable':
   kernel/sched/sched.h:2360:18: error: invalid use of undefined type 'struct rq'
    2360 |         return rq->dl.dl_nr_running > 0;
         |                  ^~
   kernel/sched/sched.h: In function 'sched_rt_runnable':
   kernel/sched/sched.h:2365:18: error: invalid use of undefined type 'struct rq'
    2365 |         return rq->rt.rt_queued > 0;
         |                  ^~
   kernel/sched/sched.h: In function 'sched_fair_runnable':
   kernel/sched/sched.h:2370:18: error: invalid use of undefined type 'struct rq'
    2370 |         return rq->cfs.nr_running > 0;
         |                  ^~
   kernel/sched/sched.h: In function 'get_push_task':
   kernel/sched/sched.h:2391:35: error: invalid use of undefined type 'struct rq'
    2391 |         struct task_struct *p = rq->curr;
         |                                   ^~
   kernel/sched/sched.h:2395:15: error: invalid use of undefined type 'struct rq'
    2395 |         if (rq->push_busy)
         |               ^~
   kernel/sched/sched.h:2404:11: error: invalid use of undefined type 'struct rq'
    2404 |         rq->push_busy = true;
         |           ^~
   kernel/sched/sched.h: In function 'add_nr_running':
   kernel/sched/sched.h:2497:30: error: invalid use of undefined type 'struct rq'
    2497 |         unsigned prev_nr = rq->nr_running;
         |                              ^~
   kernel/sched/sched.h:2499:11: error: invalid use of undefined type 'struct rq'
    2499 |         rq->nr_running = prev_nr + count;
         |           ^~
   kernel/sched/sched.h:2505:30: error: invalid use of undefined type 'struct rq'
    2505 |         if (prev_nr < 2 && rq->nr_running >= 2) {
         |                              ^~
   kernel/sched/sched.h:2506:34: error: invalid use of undefined type 'struct rq'
    2506 |                 if (!READ_ONCE(rq->rd->overload))
         |                                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/sched.h:2506:22: note: in expansion of macro 'READ_ONCE'
    2506 |                 if (!READ_ONCE(rq->rd->overload))
         |                      ^~~~~~~~~
   kernel/sched/sched.h:2506:34: error: invalid use of undefined type 'struct rq'
    2506 |                 if (!READ_ONCE(rq->rd->overload))
..


vim +9693 kernel/sched/fair.c

c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9653  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9654  /**
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9655   * update_sg_lb_stats - Update sched_group's statistics for load balancing.
cd96891d48a945 kernel/sched/fair.c Randy Dunlap       2012-06-08  9656   * @env: The load balancing environment.
a315da5e686b02 kernel/sched/fair.c Randy Dunlap       2021-12-17  9657   * @sds: Load-balancing data with statistics of the local group.
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9658   * @group: sched_group whose statistics are to be updated.
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9659   * @sgs: variable to hold the statistics for this group.
630246a06ae2a7 kernel/sched/fair.c Quentin Perret     2018-12-03  9660   * @sg_status: Holds flag indicating the status of the sched_group
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9661   */
bd939f45da24e2 kernel/sched/fair.c Peter Zijlstra     2012-05-02  9662  static inline void update_sg_lb_stats(struct lb_env *env,
c0d14b57fe0c11 kernel/sched/fair.c Ricardo Neri       2021-09-10  9663  				      struct sd_lb_stats *sds,
630246a06ae2a7 kernel/sched/fair.c Quentin Perret     2018-12-03  9664  				      struct sched_group *group,
630246a06ae2a7 kernel/sched/fair.c Quentin Perret     2018-12-03  9665  				      struct sg_lb_stats *sgs,
630246a06ae2a7 kernel/sched/fair.c Quentin Perret     2018-12-03  9666  				      int *sg_status)
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9667  {
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9668  	int i, nr_running, local_group;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9669  
b72ff13ce6021b kernel/sched/fair.c Peter Zijlstra     2013-08-28  9670  	memset(sgs, 0, sizeof(*sgs));
b72ff13ce6021b kernel/sched/fair.c Peter Zijlstra     2013-08-28  9671  
c0d14b57fe0c11 kernel/sched/fair.c Ricardo Neri       2021-09-10  9672  	local_group = group == sds->local;
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9673  
ae4df9d6c93510 kernel/sched/fair.c Peter Zijlstra     2017-05-01  9674  	for_each_cpu_and(i, sched_group_span(group), env->cpus) {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17 @9675  		struct rq *rq = cpu_rq(i);
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9676  		unsigned long load = cpu_load(rq);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9677  
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9678  		sgs->group_load += load;
82762d2af31a60 kernel/sched/fair.c Dietmar Eggemann   2021-11-18  9679  		sgs->group_util += cpu_util_cfs(i);
070f5e860ee2bf kernel/sched/fair.c Vincent Guittot    2020-02-24  9680  		sgs->group_runnable += cpu_runnable(rq);
a3498347030101 kernel/sched/fair.c Vincent Guittot    2019-10-18  9681  		sgs->sum_h_nr_running += rq->cfs.h_nr_running;
4486edd12b5ac8 kernel/sched/fair.c Tim Chen           2014-06-23  9682  
a426f99c91d103 kernel/sched/fair.c Waiman Long        2015-11-25 @9683  		nr_running = rq->nr_running;
5e23e474431529 kernel/sched/fair.c Vincent Guittot    2019-10-18  9684  		sgs->sum_nr_running += nr_running;
5e23e474431529 kernel/sched/fair.c Vincent Guittot    2019-10-18  9685  
a426f99c91d103 kernel/sched/fair.c Waiman Long        2015-11-25  9686  		if (nr_running > 1)
630246a06ae2a7 kernel/sched/fair.c Quentin Perret     2018-12-03  9687  			*sg_status |= SG_OVERLOAD;
4486edd12b5ac8 kernel/sched/fair.c Tim Chen           2014-06-23  9688  
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen   2018-12-03  9689  		if (cpu_overutilized(i))
2802bf3cd936fe kernel/sched/fair.c Morten Rasmussen   2018-12-03  9690  			*sg_status |= SG_OVERUTILIZED;
4486edd12b5ac8 kernel/sched/fair.c Tim Chen           2014-06-23  9691  
0ec8aa00f2b4dc kernel/sched/fair.c Peter Zijlstra     2013-10-07  9692  #ifdef CONFIG_NUMA_BALANCING
0ec8aa00f2b4dc kernel/sched/fair.c Peter Zijlstra     2013-10-07 @9693  		sgs->nr_numa_running += rq->nr_numa_running;
0ec8aa00f2b4dc kernel/sched/fair.c Peter Zijlstra     2013-10-07 @9694  		sgs->nr_preferred_running += rq->nr_preferred_running;
0ec8aa00f2b4dc kernel/sched/fair.c Peter Zijlstra     2013-10-07  9695  #endif
a426f99c91d103 kernel/sched/fair.c Waiman Long        2015-11-25  9696  		/*
a426f99c91d103 kernel/sched/fair.c Waiman Long        2015-11-25  9697  		 * No need to call idle_cpu() if nr_running is not 0
a426f99c91d103 kernel/sched/fair.c Waiman Long        2015-11-25  9698  		 */
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9699  		if (!nr_running && idle_cpu(i)) {
aae6d3ddd8b90f kernel/sched_fair.c Suresh Siddha      2010-09-17  9700  			sgs->idle_cpus++;
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9701  			/* Idle cpu can't have misfit task */
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9702  			continue;
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9703  		}
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9704  
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9705  		if (local_group)
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9706  			continue;
3b1baa6496e6b7 kernel/sched/fair.c Morten Rasmussen   2018-07-04  9707  
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9708  		if (env->sd->flags & SD_ASYM_CPUCAPACITY) {
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9709  			/* Check for a misfit task on the cpu */
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9710  			if (sgs->group_misfit_task_load < rq->misfit_task_load) {
3b1baa6496e6b7 kernel/sched/fair.c Morten Rasmussen   2018-07-04  9711  				sgs->group_misfit_task_load = rq->misfit_task_load;
9d321b581f2987 kernel/sched/fair.c Qais Yousef        2023-08-20  9712  				sgs->group_misfit_reason = rq->misfit_reason;
630246a06ae2a7 kernel/sched/fair.c Quentin Perret     2018-12-03  9713  				*sg_status |= SG_OVERLOAD;
757ffdd705ee94 kernel/sched/fair.c Valentin Schneider 2018-07-04  9714  			}
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9715  		} else if ((env->idle != CPU_NOT_IDLE) &&
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9716  			   sched_reduced_capacity(rq, env->sd)) {
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9717  			/* Check for a task running on a CPU with reduced capacity */
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9718  			if (sgs->group_misfit_task_load < load)
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9719  				sgs->group_misfit_task_load = load;
c82a69629c53ed kernel/sched/fair.c Vincent Guittot    2022-07-08  9720  		}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9721  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9722  
aafc917a3c31dc kernel/sched/fair.c Ricardo Neri       2021-09-10  9723  	sgs->group_capacity = group->sgc->capacity;
aafc917a3c31dc kernel/sched/fair.c Ricardo Neri       2021-09-10  9724  
aafc917a3c31dc kernel/sched/fair.c Ricardo Neri       2021-09-10  9725  	sgs->group_weight = group->group_weight;
aafc917a3c31dc kernel/sched/fair.c Ricardo Neri       2021-09-10  9726  
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9727  	/* Check if dst CPU is idle and preferred to this group */
60256435968956 kernel/sched/fair.c Ricardo Neri       2021-09-10  9728  	if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
aafc917a3c31dc kernel/sched/fair.c Ricardo Neri       2021-09-10  9729  	    env->idle != CPU_NOT_IDLE && sgs->sum_h_nr_running &&
aafc917a3c31dc kernel/sched/fair.c Ricardo Neri       2021-09-10  9730  	    sched_asym(env, sds, sgs, group)) {
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9731  		sgs->group_asym_packing = 1;
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9732  	}
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9733  
fee1759e4f042a kernel/sched/fair.c Tim C Chen         2023-07-07  9734  	/* Check for loaded SMT group to be balanced to dst CPU */
fee1759e4f042a kernel/sched/fair.c Tim C Chen         2023-07-07  9735  	if (!local_group && smt_balance(env, sgs, group))
fee1759e4f042a kernel/sched/fair.c Tim C Chen         2023-07-07  9736  		sgs->group_smt_balance = 1;
fee1759e4f042a kernel/sched/fair.c Tim C Chen         2023-07-07  9737  
57abff067a0848 kernel/sched/fair.c Vincent Guittot    2019-10-18  9738  	sgs->group_type = group_classify(env->sd->imbalance_pct, group, sgs);
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9739  
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9740  	/* Computing avg_load makes sense only when group is overloaded */
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9741  	if (sgs->group_type == group_overloaded)
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9742  		sgs->avg_load = (sgs->group_load * SCHED_CAPACITY_SCALE) /
0b0695f2b34a4a kernel/sched/fair.c Vincent Guittot    2019-10-18  9743  				sgs->group_capacity;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9744  }
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra     2009-12-17  9745  

:::::: The code at line 9693 was first introduced by commit
:::::: 0ec8aa00f2b4dc457836ef4e2662b02483e94fb7 sched/numa: Avoid migrating tasks that are placed on their preferred node

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
