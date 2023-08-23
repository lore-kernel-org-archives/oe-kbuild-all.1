Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819801F951
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692816898; x=1724352898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhd4CPQDv0hsh2NVxlwu6bUZCtmKOL7L9Co16V62bG8=;
  b=QLPeaoxsmQLIVsnyQAP/6ZtzW/2A0oG5hfQC6uGN/d4oKadZe+PYHTfB
   zfYzwWQSmgwImWbm9ldQNFN/CjkBkuVaU4YDmtppDQqmcTPghHECFCDDq
   X+5vPQvWUowFyi+bhrPeOgWNS/HLZVODgOPUwExpRMeQmQkNZZ+0nIaFW
   tXyKEYMWmFuYsYf7I4RtuWn6ulX0Ng0FITvH/FJC2X8Q719T/k6pHNL/Y
   VHXzfD9gMODoPIEK8EubipSEDuX5S7ymYdJccG2eDjaCU5hwT/qTNB/ZO
   WcDZULUJ3CyKcR+aB6WYwpEIuzggCbY/LxHyMIa3QvRn+j9N8/U5IcZWj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377999084"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377999084"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 11:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="739884222"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="739884222"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 11:54:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYt02-0001Qs-2g;
	Wed, 23 Aug 2023 18:54:38 +0000
Date: Thu, 24 Aug 2023 02:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:generalized-misfit-lb 6/13] kernel/sched/fair.c:4912:9:
 warning: statement with no effect
Message-ID: <202308240222.Rx12qK2b-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230824/202308240222.Rx12qK2b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240222.Rx12qK2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240222.Rx12qK2b-lkp@intel.com/

All warnings (new ones prefixed by >>):

     586 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:658:28: note: in expansion of macro 'rcu_dereference_check'
     658 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4224:32: note: in expansion of macro 'rcu_dereference'
    4224 |         is_idle = is_idle_task(rcu_dereference(rq->curr));
         |                                ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:4224:50: error: invalid use of undefined type 'struct rq'
    4224 |         is_idle = is_idle_task(rcu_dereference(rq->curr));
         |                                                  ^~
   include/linux/compiler_types.h:353:27: note: in definition of macro '__unqual_scalar_typeof'
     353 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/rcupdate.h:438:50: note: in expansion of macro 'READ_ONCE'
     438 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:586:9: note: in expansion of macro '__rcu_dereference_check'
     586 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:658:28: note: in expansion of macro 'rcu_dereference_check'
     658 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4224:32: note: in expansion of macro 'rcu_dereference'
    4224 |         is_idle = is_idle_task(rcu_dereference(rq->curr));
         |                                ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:4224:50: error: invalid use of undefined type 'struct rq'
    4224 |         is_idle = is_idle_task(rcu_dereference(rq->curr));
         |                                                  ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:438:50: note: in expansion of macro 'READ_ONCE'
     438 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:586:9: note: in expansion of macro '__rcu_dereference_check'
     586 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:658:28: note: in expansion of macro 'rcu_dereference_check'
     658 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4224:32: note: in expansion of macro 'rcu_dereference'
    4224 |         is_idle = is_idle_task(rcu_dereference(rq->curr));
         |                                ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:4224:50: error: invalid use of undefined type 'struct rq'
    4224 |         is_idle = is_idle_task(rcu_dereference(rq->curr));
         |                                                  ^~
   include/linux/rcupdate.h:441:19: note: in definition of macro '__rcu_dereference_check'
     441 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   include/linux/rcupdate.h:658:28: note: in expansion of macro 'rcu_dereference_check'
     658 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4224:32: note: in expansion of macro 'rcu_dereference'
    4224 |         is_idle = is_idle_task(rcu_dereference(rq->curr));
         |                                ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:4266:30: error: invalid use of undefined type 'struct rq'
    4266 |         now = u64_u32_load(rq->clock_pelt_idle);
         |                              ^~
   kernel/sched/sched.h:520:30: note: in definition of macro 'u64_u32_load_copy'
     520 |                 __val_copy = copy;                                      \
         |                              ^~~~
   kernel/sched/fair.c:4266:15: note: in expansion of macro 'u64_u32_load'
    4266 |         now = u64_u32_load(rq->clock_pelt_idle);
         |               ^~~~~~~~~~~~
   kernel/sched/fair.c:4266:30: error: invalid use of undefined type 'struct rq'
    4266 |         now = u64_u32_load(rq->clock_pelt_idle);
         |                              ^~
   kernel/sched/sched.h:526:25: note: in definition of macro 'u64_u32_load_copy'
     526 |                 __val = var;                                            \
         |                         ^~~
   kernel/sched/fair.c:4266:15: note: in expansion of macro 'u64_u32_load'
    4266 |         now = u64_u32_load(rq->clock_pelt_idle);
         |               ^~~~~~~~~~~~
   kernel/sched/fair.c:4284:69: error: invalid use of undefined type 'struct rq'
    4284 |                 now += sched_clock_cpu(cpu_of(rq)) - u64_u32_load(rq->clock_idle);
         |                                                                     ^~
   kernel/sched/sched.h:520:30: note: in definition of macro 'u64_u32_load_copy'
     520 |                 __val_copy = copy;                                      \
         |                              ^~~~
   kernel/sched/fair.c:4284:54: note: in expansion of macro 'u64_u32_load'
    4284 |                 now += sched_clock_cpu(cpu_of(rq)) - u64_u32_load(rq->clock_idle);
         |                                                      ^~~~~~~~~~~~
   kernel/sched/fair.c:4284:69: error: invalid use of undefined type 'struct rq'
    4284 |                 now += sched_clock_cpu(cpu_of(rq)) - u64_u32_load(rq->clock_idle);
         |                                                                     ^~
   kernel/sched/sched.h:526:25: note: in definition of macro 'u64_u32_load_copy'
     526 |                 __val = var;                                            \
         |                         ^~~
   kernel/sched/fair.c:4284:54: note: in expansion of macro 'u64_u32_load'
    4284 |                 now += sched_clock_cpu(cpu_of(rq)) - u64_u32_load(rq->clock_idle);
         |                                                      ^~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:4855:34: error: expected declaration specifiers or '...' before 'misfit_reason_t'
    4855 |                                  misfit_reason_t *reason)
         |                                  ^~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'update_misfit_status':
>> kernel/sched/fair.c:4912:9: warning: statement with no effect [-Wunused-value]
    4912 |         misfit_reason_t reason;
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:4912:24: error: expected ';' before 'reason'
    4912 |         misfit_reason_t reason;
         |                        ^~~~~~~
         |                        ;
   kernel/sched/fair.c:4917:14: error: implicit declaration of function 'is_misfit_task'; did you mean 'is_idle_task'? [-Werror=implicit-function-declaration]
    4917 |         if (!is_misfit_task(p, rq, &reason)) {
         |              ^~~~~~~~~~~~~~
         |              is_idle_task
   kernel/sched/fair.c:4917:37: error: 'reason' undeclared (first use in this function)
    4917 |         if (!is_misfit_task(p, rq, &reason)) {
         |                                     ^~~~~~
   kernel/sched/fair.c:4917:37: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/fair.c:4918:19: error: invalid use of undefined type 'struct rq'
    4918 |                 rq->misfit_task_load = 0;
         |                   ^~
   kernel/sched/fair.c:4919:19: error: invalid use of undefined type 'struct rq'
    4919 |                 rq->misfit_reason = -1;
         |                   ^~
   kernel/sched/fair.c:4927:11: error: invalid use of undefined type 'struct rq'
    4927 |         rq->misfit_task_load = max_t(unsigned long, task_h_load(p), 1);
         |           ^~
   kernel/sched/fair.c:4928:11: error: invalid use of undefined type 'struct rq'
    4928 |         rq->misfit_reason = reason;
         |           ^~
   kernel/sched/fair.c:4911:14: warning: unused variable 'need_update' [-Wunused-variable]
    4911 |         bool need_update = true;
         |              ^~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_next_entity':
   kernel/sched/fair.c:5248:26: error: invalid use of undefined type 'struct rq'
    5248 |             rq_of(cfs_rq)->cfs.load.weight >= 2*se->load.weight) {
         |                          ^~
   kernel/sched/fair.c: In function 'entity_tick':
   kernel/sched/fair.c:5331:54: error: invalid use of undefined type 'struct rq'
    5331 |                         hrtimer_active(&rq_of(cfs_rq)->hrtick_timer))
         |                                                      ^~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:6393:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6393 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'hrtick_start_fair':
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/sched.h:95:32: note: in expansion of macro 'WARN_ONCE'
      95 | # define SCHED_WARN_ON(x)      WARN_ONCE(x, #x)
         |                                ^~~~~~~~~
   kernel/sched/fair.c:6427:9: note: in expansion of macro 'SCHED_WARN_ON'
    6427 |         SCHED_WARN_ON(task_rq(p) != rq);
         |         ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/sched.h:1226:33: note: in expansion of macro 'cpu_rq'
    1226 | #define task_rq(p)              cpu_rq(task_cpu(p))
         |                                 ^~~~~~
   kernel/sched/fair.c:6427:23: note: in expansion of macro 'task_rq'
    6427 |         SCHED_WARN_ON(task_rq(p) != rq);
         |                       ^~~~~~~
   kernel/sched/fair.c:6429:15: error: invalid use of undefined type 'struct rq'
    6429 |         if (rq->cfs.h_nr_running > 1) {
         |               ^~
   kernel/sched/fair.c: In function 'hrtick_update':
   kernel/sched/fair.c:6450:38: error: invalid use of undefined type 'struct rq'
    6450 |         struct task_struct *curr = rq->curr;
         |                                      ^~
   kernel/sched/fair.c: In function 'cpu_overutilized':
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/fair.c:6471:51: note: in expansion of macro 'cpu_rq'
    6471 |         unsigned long rq_util_min = uclamp_rq_get(cpu_rq(cpu), UCLAMP_MIN);
         |                                                   ^~~~~~
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
--
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/jiffies.h:112:10: note: in expansion of macro 'typecheck'
     112 |          typecheck(unsigned long, b) && \
         |          ^~~~~~~~~
   kernel/sched/fair.c:12211:13: note: in expansion of macro 'time_after_eq'
   12211 |         if (time_after_eq(jiffies, rq->next_balance))
         |             ^~~~~~~~~~~~~
   kernel/sched/fair.c:12211:38: error: invalid use of undefined type 'struct rq'
   12211 |         if (time_after_eq(jiffies, rq->next_balance))
         |                                      ^~
   include/linux/jiffies.h:113:25: note: in definition of macro 'time_after_eq'
     113 |          ((long)((a) - (b)) >= 0))
         |                         ^
   kernel/sched/fair.c: In function 'task_tick_fair':
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/sched.h:1226:33: note: in expansion of macro 'cpu_rq'
    1226 | #define task_rq(p)              cpu_rq(task_cpu(p))
         |                                 ^~~~~~
   kernel/sched/fair.c:12383:36: note: in expansion of macro 'task_rq'
   12383 |         update_overutilized_status(task_rq(curr));
         |                                    ^~~~~~~
   kernel/sched/fair.c: In function 'task_fork_fair':
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:241:9: note: in expansion of macro '__verify_pcpu_ptr'
     241 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:252:27: note: in expansion of macro 'raw_cpu_ptr'
     252 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   kernel/sched/sched.h:1225:33: note: in expansion of macro 'this_cpu_ptr'
    1225 | #define this_rq()               this_cpu_ptr(&runqueues)
         |                                 ^~~~~~~~~~~~
   kernel/sched/fair.c:12397:25: note: in expansion of macro 'this_rq'
   12397 |         struct rq *rq = this_rq();
         |                         ^~~~~~~
   kernel/sched/fair.c: In function 'prio_changed_fair':
   kernel/sched/fair.c:12421:15: error: invalid use of undefined type 'struct rq'
   12421 |         if (rq->cfs.nr_running == 1)
         |               ^~
   kernel/sched/fair.c: In function 'set_next_task_fair':
   kernel/sched/fair.c:12554:47: error: invalid use of undefined type 'struct rq'
   12554 |                 list_move(&se->group_node, &rq->cfs_tasks);
         |                                               ^~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:12855:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   12855 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12857:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   12857 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12862:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   12862 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12864:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   12864 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'get_rr_interval_fair':
   kernel/sched/fair.c:12878:15: error: invalid use of undefined type 'struct rq'
   12878 |         if (rq->cfs.load.weight)
         |               ^~
   kernel/sched/fair.c: In function 'print_cfs_stats':
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   kernel/sched/fair.c:512:32: note: in definition of macro 'for_each_leaf_cfs_rq_safe'
     512 |                 for (cfs_rq = &rq->cfs, pos = NULL; cfs_rq; cfs_rq = pos)
         |                                ^~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/fair.c:12943:35: note: in expansion of macro 'cpu_rq'
   12943 |         for_each_leaf_cfs_rq_safe(cpu_rq(cpu), cfs_rq, pos)
         |                                   ^~~~~~
   kernel/sched/fair.c:512:34: error: invalid use of undefined type 'struct rq'
     512 |                 for (cfs_rq = &rq->cfs, pos = NULL; cfs_rq; cfs_rq = pos)
         |                                  ^~
   kernel/sched/fair.c:12943:9: note: in expansion of macro 'for_each_leaf_cfs_rq_safe'
   12943 |         for_each_leaf_cfs_rq_safe(cpu_rq(cpu), cfs_rq, pos)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:512:39: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     512 |                 for (cfs_rq = &rq->cfs, pos = NULL; cfs_rq; cfs_rq = pos)
         |                                       ^
   kernel/sched/fair.c:12943:9: note: in expansion of macro 'for_each_leaf_cfs_rq_safe'
   12943 |         for_each_leaf_cfs_rq_safe(cpu_rq(cpu), cfs_rq, pos)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h: In function 'task_current':
   kernel/sched/sched.h:2148:1: error: control reaches end of non-void function [-Werror=return-type]
    2148 | }
         | ^
   kernel/sched/sched.h: In function 'cfs_rq_of':
   kernel/sched/sched.h:1472:1: error: control reaches end of non-void function [-Werror=return-type]
    1472 | }
         | ^
   kernel/sched/sched.h: In function 'rq_of':
   kernel/sched/sched.h:1199:1: error: control reaches end of non-void function [-Werror=return-type]
    1199 | }
         | ^
   kernel/sched/pelt.h: In function 'rq_clock_pelt':
   kernel/sched/pelt.h:70:1: error: control reaches end of non-void function [-Werror=return-type]
      70 | }
         | ^
   kernel/sched/sched.h: In function '__rq_lockp':
   kernel/sched/sched.h:1355:1: error: control reaches end of non-void function [-Werror=return-type]
    1355 | }
         | ^
   kernel/sched/sched.h: In function 'task_cfs_rq':
   kernel/sched/sched.h:1464:1: error: control reaches end of non-void function [-Werror=return-type]
    1464 | }
         | ^
   kernel/sched/sched.h: In function 'rq_clock_task':
   kernel/sched/sched.h:1533:1: error: control reaches end of non-void function [-Werror=return-type]
    1533 | }
         | ^
   kernel/sched/sched.h: In function 'cpu_of':
   kernel/sched/sched.h:1209:1: error: control reaches end of non-void function [-Werror=return-type]
    1209 | }
         | ^
   kernel/sched/sched.h: In function 'capacity_orig_of':
   kernel/sched/sched.h:2995:1: error: control reaches end of non-void function [-Werror=return-type]
    2995 | }
         | ^
   kernel/sched/fair.c: In function 'capacity_of':
   kernel/sched/fair.c:6753:1: error: control reaches end of non-void function [-Werror=return-type]
    6753 | }
         | ^
   kernel/sched/fair.c: In function 'cpu_load':
   kernel/sched/fair.c:6694:1: error: control reaches end of non-void function [-Werror=return-type]
    6694 | }
         | ^
   kernel/sched/fair.c: In function 'cpu_runnable':
   kernel/sched/fair.c:6730:1: error: control reaches end of non-void function [-Werror=return-type]
    6730 | }
         | ^
   kernel/sched/fair.c: In function 'sched_idle_rq':
   kernel/sched/fair.c:6494:1: error: control reaches end of non-void function [-Werror=return-type]
    6494 | }
         | ^
   kernel/sched/sched.h: In function 'idle_get_state':
   kernel/sched/sched.h:2424:1: error: control reaches end of non-void function [-Werror=return-type]
    2424 | }
         | ^
   kernel/sched/pelt.h: In function 'thermal_load_avg':
   kernel/sched/pelt.h:16:1: error: control reaches end of non-void function [-Werror=return-type]
      16 | }
         | ^
   kernel/sched/sched.h: In function 'rq_clock':
   kernel/sched/sched.h:1525:1: error: control reaches end of non-void function [-Werror=return-type]
    1525 | }
         | ^
   kernel/sched/fair.c: In function 'check_cpu_capacity':
   kernel/sched/fair.c:9388:1: error: control reaches end of non-void function [-Werror=return-type]
    9388 | }
         | ^
   kernel/sched/sched.h: In function 'hrtick_enabled':
   kernel/sched/sched.h:2566:1: error: control reaches end of non-void function [-Werror=return-type]
    2566 | }
         | ^
   kernel/sched/sched.h: In function 'sched_fair_runnable':
   kernel/sched/sched.h:2371:1: error: control reaches end of non-void function [-Werror=return-type]
    2371 | }
         | ^
   kernel/sched/fair.c: In function 'on_null_domain':
   kernel/sched/fair.c:11547:1: error: control reaches end of non-void function [-Werror=return-type]
   11547 | }
         | ^
   kernel/sched/fair.c: In function 'update_nohz_stats':
   kernel/sched/fair.c:11859:1: error: control reaches end of non-void function [-Werror=return-type]
   11859 | }
         | ^
   kernel/sched/fair.c: In function 'check_misfit_status':
   kernel/sched/fair.c:9400:1: error: control reaches end of non-void function [-Werror=return-type]
    9400 | }
         | ^
   cc1: some warnings being treated as errors
..


vim +4912 kernel/sched/fair.c

  4908	
  4909	static inline void update_misfit_status(struct task_struct *p, struct rq *rq)
  4910	{
  4911		bool need_update = true;
> 4912		misfit_reason_t reason;
  4913	
  4914		if (!sched_asym_cpucap_active())
  4915			return;
  4916	
  4917		if (!is_misfit_task(p, rq, &reason)) {
  4918			rq->misfit_task_load = 0;
  4919			rq->misfit_reason = -1;
  4920			return;
  4921		}
  4922	
  4923		/*
  4924		 * Make sure that misfit_task_load will not be null even if
  4925		 * task_h_load() returns 0.
  4926		 */
  4927		rq->misfit_task_load = max_t(unsigned long, task_h_load(p), 1);
  4928		rq->misfit_reason = reason;
  4929	}
  4930	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
