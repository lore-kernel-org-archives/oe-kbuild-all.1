Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEBC139
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692809346; x=1724345346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=55+6sxbv4lZsabuU2iOM3ULNDCa1wZQ83X3jVd6oEac=;
  b=UgKIhRpb1lNSD80NL5ZV/DsF72TnfwlzkzLuJUB2IvDbg1oOjxPMtU/m
   KoFR4h2BVmyYAJO9XBC8lOAyveJVa7AwQHTwdMCHVpUGAE1iFd1XdYgsf
   wpYJzkQl04STq8xjWWmp+ghgd1UJfWwM8pWJ+IP0/8bRTSfSKKlYuTeBY
   pysCF3DCx7WhwVJ8LKN8q6XE+0626IV4HkMbZZGZ/g6PzM3ypc7v0ePPi
   6TmjflckDt9WMEW0wmTqNfeVU67QzJsulgGFBwJHDqQYzmOah7sxLGFXs
   LvRuqOmjlydUWdUd65h67fVGR0Bgof8gwe2Vci02wA8+u4/1LBhPTvVd5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="373098652"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="373098652"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 09:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="766207894"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="766207894"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 09:48:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYr2H-0001M0-30;
	Wed, 23 Aug 2023 16:48:50 +0000
Date: Thu, 24 Aug 2023 00:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:generalized-misfit-lb 6/13] kernel/sched/sched.h:949:1:
 error: version control conflict marker in file
Message-ID: <202308240012.WPdwrurD-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20230824/202308240012.WPdwrurD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240012.WPdwrurD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240012.WPdwrurD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:86:
>> kernel/sched/sched.h:949:1: error: version control conflict marker in file
     949 | <<<<<<< HEAD
         | ^~~~~~~
   kernel/sched/sched.h:955:1: error: version control conflict marker in file
     955 | =======
         | ^~~~~~~
>> kernel/sched/sched.h:959:3: warning: data definition has no type or storage class
     959 | } misfit_reason_t;
         |   ^~~~~~~~~~~~~~~
>> kernel/sched/sched.h:959:3: error: type defaults to 'int' in declaration of 'misfit_reason_t' [-Werror=implicit-int]
   kernel/sched/sched.h:960:1: error: version control conflict marker in file
     960 | >>>>>>> 142f46429aff (sched/fair: Add a misfit reason)
         | ^~~~~~~
>> kernel/sched/sched.h:960:9: error: invalid suffix "f46429aff" on integer constant
     960 | >>>>>>> 142f46429aff (sched/fair: Add a misfit reason)
         |         ^~~~~~~~~~~~
   kernel/sched/sched.h:1183:9: error: invalid suffix "f46429aff" on integer constant
    1183 | >>>>>>> 142f46429aff (sched/fair: Add a misfit reason)
         |         ^~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/sched.h: In function 'rq_of':
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct rq'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   kernel/sched/sched.h:1198:16: note: in expansion of macro 'container_of'
    1198 |         return container_of(cfs_rq, struct rq, cfs);
         |                ^~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   kernel/sched/sched.h:1198:16: note: in expansion of macro 'container_of'
    1198 |         return container_of(cfs_rq, struct rq, cfs);
         |                ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct rq'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   kernel/sched/sched.h:1198:16: note: in expansion of macro 'container_of'
    1198 |         return container_of(cfs_rq, struct rq, cfs);
         |                ^~~~~~~~~~~~
   kernel/sched/sched.h: In function 'rq_lockp':
>> kernel/sched/sched.h:1349:19: error: invalid use of undefined type 'struct rq'
    1349 |         return &rq->__lock;
         |                   ^~
   kernel/sched/sched.h: In function '__rq_lockp':
   kernel/sched/sched.h:1354:19: error: invalid use of undefined type 'struct rq'
    1354 |         return &rq->__lock;
         |                   ^~
   In file included from include/asm-generic/percpu.h:7,
                    from arch/arm/include/asm/percpu.h:68,
                    from include/linux/irqflags.h:18,
                    from arch/arm/include/asm/bitops.h:28,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9:
   kernel/sched/sched.h: In function 'task_cfs_rq':
>> include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:259:9: note: in expansion of macro '__verify_pcpu_ptr'
     259 |         __verify_pcpu_ptr(__p);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:263:49: note: in expansion of macro 'VERIFY_PERCPU_PTR'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/sched.h:1226:33: note: in expansion of macro 'cpu_rq'
    1226 | #define task_rq(p)              cpu_rq(task_cpu(p))
         |                                 ^~~~~~
   kernel/sched/sched.h:1463:17: note: in expansion of macro 'task_rq'
    1463 |         return &task_rq(p)->cfs;
         |                 ^~~~~~~
   kernel/sched/sched.h:1463:27: error: invalid use of undefined type 'struct rq'
    1463 |         return &task_rq(p)->cfs;
         |                           ^~
   kernel/sched/sched.h: In function 'cfs_rq_of':
>> include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:259:9: note: in expansion of macro '__verify_pcpu_ptr'
     259 |         __verify_pcpu_ptr(__p);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:263:49: note: in expansion of macro 'VERIFY_PERCPU_PTR'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/sched.h:1226:33: note: in expansion of macro 'cpu_rq'
    1226 | #define task_rq(p)              cpu_rq(task_cpu(p))
         |                                 ^~~~~~
   kernel/sched/sched.h:1469:25: note: in expansion of macro 'task_rq'
    1469 |         struct rq *rq = task_rq(p);
         |                         ^~~~~~~
   kernel/sched/sched.h:1471:19: error: invalid use of undefined type 'struct rq'
    1471 |         return &rq->cfs;
         |                   ^~
   kernel/sched/sched.h: In function 'assert_clock_updated':
   kernel/sched/sched.h:1516:25: error: invalid use of undefined type 'struct rq'
    1516 |         SCHED_WARN_ON(rq->clock_update_flags < RQCF_ACT_SKIP);
         |                         ^~
   kernel/sched/sched.h:97:42: note: in definition of macro 'SCHED_WARN_ON'
      97 | # define SCHED_WARN_ON(x)      ({ (void)(x), 0; })
         |                                          ^
>> kernel/sched/sched.h:97:44: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      97 | # define SCHED_WARN_ON(x)      ({ (void)(x), 0; })
         |                                            ^
   kernel/sched/sched.h:1516:9: note: in expansion of macro 'SCHED_WARN_ON'
    1516 |         SCHED_WARN_ON(rq->clock_update_flags < RQCF_ACT_SKIP);
         |         ^~~~~~~~~~~~~
   kernel/sched/sched.h: In function 'rq_clock':
   kernel/sched/sched.h:1524:18: error: invalid use of undefined type 'struct rq'
    1524 |         return rq->clock;
         |                  ^~
   kernel/sched/sched.h: In function 'rq_clock_task':
   kernel/sched/sched.h:1532:18: error: invalid use of undefined type 'struct rq'
    1532 |         return rq->clock_task;
         |                  ^~
   kernel/sched/sched.h: In function 'rq_clock_skip_update':
   kernel/sched/sched.h:1556:11: error: invalid use of undefined type 'struct rq'
    1556 |         rq->clock_update_flags |= RQCF_REQ_SKIP;
         |           ^~
   kernel/sched/sched.h: In function 'rq_clock_cancel_skipupdate':
   kernel/sched/sched.h:1566:11: error: invalid use of undefined type 'struct rq'
    1566 |         rq->clock_update_flags &= ~RQCF_REQ_SKIP;
         |           ^~
   kernel/sched/sched.h: In function 'rq_clock_start_loop_update':
   kernel/sched/sched.h:1581:25: error: invalid use of undefined type 'struct rq'
    1581 |         SCHED_WARN_ON(rq->clock_update_flags & RQCF_ACT_SKIP);
         |                         ^~
   kernel/sched/sched.h:97:42: note: in definition of macro 'SCHED_WARN_ON'
      97 | # define SCHED_WARN_ON(x)      ({ (void)(x), 0; })
         |                                          ^
>> kernel/sched/sched.h:97:44: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      97 | # define SCHED_WARN_ON(x)      ({ (void)(x), 0; })
         |                                            ^
   kernel/sched/sched.h:1581:9: note: in expansion of macro 'SCHED_WARN_ON'
    1581 |         SCHED_WARN_ON(rq->clock_update_flags & RQCF_ACT_SKIP);
         |         ^~~~~~~~~~~~~
   kernel/sched/sched.h:1582:11: error: invalid use of undefined type 'struct rq'
    1582 |         rq->clock_update_flags |= RQCF_ACT_SKIP;
         |           ^~
   kernel/sched/sched.h: In function 'rq_clock_stop_loop_update':
   kernel/sched/sched.h:1588:11: error: invalid use of undefined type 'struct rq'
    1588 |         rq->clock_update_flags &= ~RQCF_ACT_SKIP;
         |           ^~
   kernel/sched/sched.h: In function 'this_rq_lock_irq':
>> include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:259:9: note: in expansion of macro '__verify_pcpu_ptr'
     259 |         __verify_pcpu_ptr(__p);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:263:49: note: in expansion of macro 'VERIFY_PERCPU_PTR'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:33: note: in expansion of macro 'per_cpu_ptr'
     264 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:265:33: note: in expansion of macro 'raw_cpu_ptr'
     265 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   kernel/sched/sched.h:1225:33: note: in expansion of macro 'this_cpu_ptr'
    1225 | #define this_rq()               this_cpu_ptr(&runqueues)
         |                                 ^~~~~~~~~~~~
   kernel/sched/sched.h:1745:14: note: in expansion of macro 'this_rq'
    1745 |         rq = this_rq();
         |              ^~~~~~~
   kernel/sched/sched.h: In function 'task_current':
   kernel/sched/sched.h:2147:18: error: invalid use of undefined type 'struct rq'
    2147 |         return rq->curr == p;
         |                  ^~
   In file included from include/asm-generic/bug.h:7,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13:
   kernel/sched/sched.h: In function 'put_prev_task':
   kernel/sched/sched.h:2310:24: error: invalid use of undefined type 'struct rq'
    2310 |         WARN_ON_ONCE(rq->curr != prev);
         |                        ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/sched.h:2310:9: note: in expansion of macro 'WARN_ON_ONCE'
    2310 |         WARN_ON_ONCE(rq->curr != prev);
         |         ^~~~~~~~~~~~
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
   kernel/sched/sched.h: In function 'add_nr_running':
   kernel/sched/sched.h:2497:30: error: invalid use of undefined type 'struct rq'
    2497 |         unsigned prev_nr = rq->nr_running;
         |                              ^~
   kernel/sched/sched.h:2499:11: error: invalid use of undefined type 'struct rq'
    2499 |         rq->nr_running = prev_nr + count;
         |           ^~
   kernel/sched/sched.h: In function 'sub_nr_running':
   kernel/sched/sched.h:2516:11: error: invalid use of undefined type 'struct rq'
    2516 |         rq->nr_running -= count;
         |           ^~
   In file included from <command-line>:
   kernel/sched/sched.h: In function 'membarrier_switch_mm':
   kernel/sched/sched.h:3258:25: error: invalid use of undefined type 'struct rq'
    3258 |         if (READ_ONCE(rq->membarrier_state) == membarrier_state)
         |                         ^~
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
   kernel/sched/sched.h:3258:13: note: in expansion of macro 'READ_ONCE'
    3258 |         if (READ_ONCE(rq->membarrier_state) == membarrier_state)
         |             ^~~~~~~~~
   kernel/sched/sched.h:3258:25: error: invalid use of undefined type 'struct rq'
    3258 |         if (READ_ONCE(rq->membarrier_state) == membarrier_state)
         |                         ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
..


vim +949 kernel/sched/sched.h

   948	
 > 949	<<<<<<< HEAD
   950	struct rq;
   951	struct balance_callback {
   952		struct balance_callback *next;
   953		void (*func)(struct rq *rq);
   954	};
   955	=======
   956	typedef enum misfit_reason {
   957		UPMIGRATION,
   958		DOWNMIGRATION,
 > 959	} misfit_reason_t;
 > 960	>>>>>>> 142f46429aff (sched/fair: Add a misfit reason)
   961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
