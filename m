Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B9C2E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 19:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692820722; x=1724356722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jn8+iP6LN4m0ved9SU2vKBD5jXl3R+UTSJ2Z0nVa+Cw=;
  b=DeFptH1p9NIt3Sfx0Jn3d/V9aWt6oEJ0WghfxvzhU8Io48aoNFzFi4KE
   nSN3zctVwkwaTl2ygfECA9pfK3MZwzc8aDK9zN7vuEy6Du1XLmYy+0nnK
   BDsIa/L04EASK7v9XikrI4t5sBfnlL419NXuROzZgdLd3hocQJbYsQBCo
   2qRJNudLcd/BgSV3+PWyrEfguX6iyIcxQeJgytDuL0OeKYC9keUxPrZJ6
   wjoCdCk8d2Zgpt/n19rBpdEs+0/Hs7Di2Yede49N0w3bGf6oHFrz3vIZz
   mj60n9aZDUP3qXULro38Cai/rqg07vJVKxZDcF/JofgjOa7XjgKvro4Wy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460619979"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460619979"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 12:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826848518"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826848518"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 12:58:40 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYtzv-0001Sl-31;
	Wed, 23 Aug 2023 19:58:37 +0000
Date: Thu, 24 Aug 2023 03:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:generalized-misfit-lb 6/13]
 include/linux/atomic/atomic-instrumented.h:4715:38: warning: passing
 argument 1 of 'instrument_atomic_read_write' makes pointer from integer
 without a cast
Message-ID: <202308240306.l7mZKmzL-lkp@intel.com>
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
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230824/202308240306.l7mZKmzL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240306.l7mZKmzL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240306.l7mZKmzL-lkp@intel.com/

All warnings (new ones prefixed by >>):

      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:2009:29: note: in expansion of macro 'READ_ONCE'
    2009 |                         if (READ_ONCE(rq->numa_migrate_on) ||
         |                             ^~~~~~~~~
   kernel/sched/fair.c:2009:41: error: invalid use of undefined type 'struct rq'
    2009 |                         if (READ_ONCE(rq->numa_migrate_on) ||
         |                                         ^~
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
   kernel/sched/fair.c:2009:29: note: in expansion of macro 'READ_ONCE'
    2009 |                         if (READ_ONCE(rq->numa_migrate_on) ||
         |                             ^~~~~~~~~
   kernel/sched/fair.c:2009:41: error: invalid use of undefined type 'struct rq'
    2009 |                         if (READ_ONCE(rq->numa_migrate_on) ||
         |                                         ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:2009:29: note: in expansion of macro 'READ_ONCE'
    2009 |                         if (READ_ONCE(rq->numa_migrate_on) ||
         |                             ^~~~~~~~~
   kernel/sched/fair.c:2009:41: error: invalid use of undefined type 'struct rq'
    2009 |                         if (READ_ONCE(rq->numa_migrate_on) ||
         |                                         ^~
   include/linux/compiler_types.h:353:27: note: in definition of macro '__unqual_scalar_typeof'
     353 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/sched/fair.c:2009:29: note: in expansion of macro 'READ_ONCE'
    2009 |                         if (READ_ONCE(rq->numa_migrate_on) ||
         |                             ^~~~~~~~~
   kernel/sched/fair.c:2009:41: error: invalid use of undefined type 'struct rq'
    2009 |                         if (READ_ONCE(rq->numa_migrate_on) ||
         |                                         ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/sched/fair.c:2009:29: note: in expansion of macro 'READ_ONCE'
    2009 |                         if (READ_ONCE(rq->numa_migrate_on) ||
         |                             ^~~~~~~~~
   kernel/sched/fair.c: In function 'task_numa_assign':
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
   kernel/sched/fair.c:2032:25: note: in expansion of macro 'cpu_rq'
    2032 |         struct rq *rq = cpu_rq(env->dst_cpu);
         |                         ^~~~~~
   In file included from include/linux/atomic.h:82:
   kernel/sched/fair.c:2035:54: error: invalid use of undefined type 'struct rq'
    2035 |         if (env->best_cpu != env->dst_cpu && xchg(&rq->numa_migrate_on, 1)) {
         |                                                      ^~
   include/linux/atomic/atomic-instrumented.h:4713:16: note: in definition of macro 'xchg'
    4713 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   kernel/sched/fair.c:2035:54: error: invalid use of undefined type 'struct rq'
    2035 |         if (env->best_cpu != env->dst_cpu && xchg(&rq->numa_migrate_on, 1)) {
         |                                                      ^~
   include/linux/atomic/atomic-instrumented.h:4713:33: note: in definition of macro 'xchg'
    4713 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
   include/linux/atomic/atomic-instrumented.h:4715:55: error: invalid type argument of unary '*' (have 'int')
    4715 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   kernel/sched/fair.c:2035:46: note: in expansion of macro 'xchg'
    2035 |         if (env->best_cpu != env->dst_cpu && xchg(&rq->numa_migrate_on, 1)) {
         |                                              ^~~~
>> include/linux/atomic/atomic-instrumented.h:4715:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4715 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   kernel/sched/fair.c:2035:46: note: in expansion of macro 'xchg'
    2035 |         if (env->best_cpu != env->dst_cpu && xchg(&rq->numa_migrate_on, 1)) {
         |                                              ^~~~
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/s390/include/asm/bitops.h:204,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   arch/s390/include/asm/cmpxchg.h:77:20: error: invalid type argument of unary '*' (have 'int')
      77 |         __typeof__(*(ptr)) __ret;                                       \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/fair.c:2035:46: note: in expansion of macro 'xchg'
    2035 |         if (env->best_cpu != env->dst_cpu && xchg(&rq->numa_migrate_on, 1)) {
         |                                              ^~~~
   arch/s390/include/asm/cmpxchg.h:79:29: error: invalid type argument of unary '*' (have 'int')
      79 |         __ret = (__typeof__(*(ptr)))                                    \
         |                             ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/fair.c:2035:46: note: in expansion of macro 'xchg'
    2035 |         if (env->best_cpu != env->dst_cpu && xchg(&rq->numa_migrate_on, 1)) {
         |                                              ^~~~
   arch/s390/include/asm/cmpxchg.h:81:36: error: invalid type argument of unary '*' (have 'int')
      81 |                             sizeof(*(ptr)));                            \
         |                                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/fair.c:2035:46: note: in expansion of macro 'xchg'
    2035 |         if (env->best_cpu != env->dst_cpu && xchg(&rq->numa_migrate_on, 1)) {
         |                                              ^~~~
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
   kernel/sched/fair.c:2047:30: note: in expansion of macro 'cpu_rq'
    2047 |                         rq = cpu_rq(env->dst_cpu);
         |                              ^~~~~~
   kernel/sched/fair.c:2048:38: error: invalid use of undefined type 'struct rq'
    2048 |                         if (!xchg(&rq->numa_migrate_on, 1))
         |                                      ^~
   include/linux/atomic/atomic-instrumented.h:4713:16: note: in definition of macro 'xchg'
    4713 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   kernel/sched/fair.c:2048:38: error: invalid use of undefined type 'struct rq'
    2048 |                         if (!xchg(&rq->numa_migrate_on, 1))
         |                                      ^~
   include/linux/atomic/atomic-instrumented.h:4713:33: note: in definition of macro 'xchg'
    4713 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
   include/linux/atomic/atomic-instrumented.h:4715:55: error: invalid type argument of unary '*' (have 'int')
    4715 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   kernel/sched/fair.c:2048:30: note: in expansion of macro 'xchg'
    2048 |                         if (!xchg(&rq->numa_migrate_on, 1))
         |                              ^~~~
>> include/linux/atomic/atomic-instrumented.h:4715:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4715 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   kernel/sched/fair.c:2048:30: note: in expansion of macro 'xchg'
    2048 |                         if (!xchg(&rq->numa_migrate_on, 1))
         |                              ^~~~
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   arch/s390/include/asm/cmpxchg.h:77:20: error: invalid type argument of unary '*' (have 'int')
      77 |         __typeof__(*(ptr)) __ret;                                       \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/fair.c:2048:30: note: in expansion of macro 'xchg'
    2048 |                         if (!xchg(&rq->numa_migrate_on, 1))
         |                              ^~~~
   arch/s390/include/asm/cmpxchg.h:79:29: error: invalid type argument of unary '*' (have 'int')
      79 |         __ret = (__typeof__(*(ptr)))                                    \
         |                             ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/fair.c:2048:30: note: in expansion of macro 'xchg'
    2048 |                         if (!xchg(&rq->numa_migrate_on, 1))
         |                              ^~~~
   arch/s390/include/asm/cmpxchg.h:81:36: error: invalid type argument of unary '*' (have 'int')
      81 |                             sizeof(*(ptr)));                            \
         |                                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/fair.c:2048:30: note: in expansion of macro 'xchg'
    2048 |                         if (!xchg(&rq->numa_migrate_on, 1))
         |                              ^~~~
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
   kernel/sched/fair.c:2062:22: note: in expansion of macro 'cpu_rq'
    2062 |                 rq = cpu_rq(env->best_cpu);
         |                      ^~~~~~
   kernel/sched/fair.c:2063:30: error: invalid use of undefined type 'struct rq'
    2063 |                 WRITE_ONCE(rq->numa_migrate_on, 0);
         |                              ^~
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
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:2063:17: note: in expansion of macro 'WRITE_ONCE'
    2063 |                 WRITE_ONCE(rq->numa_migrate_on, 0);
         |                 ^~~~~~~~~~
   kernel/sched/fair.c:2063:30: error: invalid use of undefined type 'struct rq'
    2063 |                 WRITE_ONCE(rq->numa_migrate_on, 0);
         |                              ^~
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
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/instrument_atomic_read_write +4715 include/linux/atomic/atomic-instrumented.h

67d1b0de258ad0 include/linux/atomic/atomic-instrumented.h Mark Rutland 2021-07-13  4710  
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  4711  #define xchg(ptr, ...) \
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  4712  ({ \
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04 @4713  	typeof(ptr) __ai_ptr = (ptr); \
e87c4f6642f496 include/linux/atomic/atomic-instrumented.h Marco Elver  2021-11-30  4714  	kcsan_mb(); \
ec570320b09f76 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-04-13 @4715  	instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland 2023-06-05  4716  	raw_xchg(__ai_ptr, __VA_ARGS__); \
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  4717  })
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  4718  

:::::: The code at line 4715 was first introduced by commit
:::::: ec570320b09f76d52819e60abdccf372658216b6 locking/atomic: Correct (cmp)xchg() instrumentation

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
