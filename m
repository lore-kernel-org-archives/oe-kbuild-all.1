Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96742EAFA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zd2BtBw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697571620; x=1729107620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iuDacD4bFC8EuyZzRYqANo0lRav6yeKLn9ozJ1PDvtw=;
  b=Zd2BtBw/+UQz3n74LicSECx5+OR44SEuir6/V++ZvxTqsErl9cSf3KNq
   SS5/tWGmughXI3/ikTFc3Z6lVgBsYNhWYzhli+Dt0zCKzJtNQYrbAKsio
   P0dNJVubkUtqD7il6qe/GgOLF+QGDmOMZ3JFivQmfaIr62ylPsHoFOgZz
   OGRXMyovfXIhwlDVO9u2ainb88IBzr/oVzrJCtbZm7kvQ0VH/4Jbg4oNe
   phCCTWPE0JJXeD/6NecgDtqMIh5e6uity+fdeGiTNrT0vw451fzFN7GZH
   b2a+N4eKDtqb/cw+YujZczoFOWKXRYtiUQ1NiCxbWxvtvVzSjJ3AkGHMT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452344432"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="452344432"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 12:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="1003468957"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="1003468957"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2023 12:40:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qspvI-000A0t-0h;
	Tue, 17 Oct 2023 19:40:14 +0000
Date: Wed, 18 Oct 2023 03:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelaf@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/ilb-no-needs-kick 1/1]
 include/linux/atomic/atomic-instrumented.h:4836:38: warning: passing
 argument 1 of 'instrument_atomic_read_write' makes pointer from integer
 without a cast
Message-ID: <202310180356.7LHMZ5nA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/ilb-no-needs-kick
head:   6ffc130c8b74b0f1d0b31aeca463f164891523ad
commit: 6ffc130c8b74b0f1d0b31aeca463f164891523ad [1/1] Update nohz next_balance without IPIs
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310180356.7LHMZ5nA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180356.7LHMZ5nA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180356.7LHMZ5nA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <command-line>:
   kernel/sched/fair.c: In function 'update_nohz_next_balance':
   kernel/sched/fair.c:11303:47: error: 'nohz' undeclared (first use in this function)
   11303 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
         |                                               ^~~~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:11303:37: note: in expansion of macro 'READ_ONCE'
   11303 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
         |                                     ^~~~~~~~~
   kernel/sched/fair.c:11303:47: note: each undeclared identifier is reported only once for each function it appears in
   11303 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
         |                                               ^~~~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:11303:37: note: in expansion of macro 'READ_ONCE'
   11303 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
         |                                     ^~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:10,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   include/linux/atomic/atomic-instrumented.h:4836:55: error: invalid type argument of unary '*' (have 'int')
    4836 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4836:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4836 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from include/linux/atomic.h:80:
   include/linux/atomic/atomic-arch-fallback.h:191:16: error: invalid type argument of unary '*' (have 'int')
     191 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:191:34: error: initialization of 'int *' from incompatible pointer type 'long unsigned int *' [-Werror=incompatible-pointer-types]
     191 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                  ^
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   In file included from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7:
   arch/parisc/include/asm/cmpxchg.h:83:20: error: invalid type argument of unary '*' (have 'int')
      83 |         __typeof__(*(ptr)) _o_ = (o);                                    \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/parisc/include/asm/cmpxchg.h:84:20: error: invalid type argument of unary '*' (have 'int')
      84 |         __typeof__(*(ptr)) _n_ = (n);                                    \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/parisc/include/asm/cmpxchg.h:85:21: error: invalid type argument of unary '*' (have 'int')
      85 |         (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,        \
         |                     ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/parisc/include/asm/cmpxchg.h:86:64: error: invalid type argument of unary '*' (have 'int')
      86 |                                     (unsigned long)_n_, sizeof(*(ptr))); \
         |                                                                ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
>> arch/parisc/include/asm/cmpxchg.h:85:40: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
      85 |         (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,        \
         |                                        ^~~~~
         |                                        |
         |                                        int
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/parisc/include/asm/cmpxchg.h:67:26: note: expected 'volatile void *' but argument is of type 'int'
      67 | __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new_, int size)
         |           ~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/instrument_atomic_read_write +4836 include/linux/atomic/atomic-instrumented.h

8c8b096a23d12f include/linux/atomic/atomic-instrumented.h Peter Zijlstra 2023-05-31  4830  
29f006fdefe6f8 include/asm-generic/atomic-instrumented.h  Peter Zijlstra 2020-08-29  4831  #define try_cmpxchg(ptr, oldp, ...) \
29f006fdefe6f8 include/asm-generic/atomic-instrumented.h  Peter Zijlstra 2020-08-29  4832  ({ \
29f006fdefe6f8 include/asm-generic/atomic-instrumented.h  Peter Zijlstra 2020-08-29  4833  	typeof(ptr) __ai_ptr = (ptr); \
29f006fdefe6f8 include/asm-generic/atomic-instrumented.h  Peter Zijlstra 2020-08-29  4834  	typeof(oldp) __ai_oldp = (oldp); \
e87c4f6642f496 include/linux/atomic/atomic-instrumented.h Marco Elver    2021-11-30  4835  	kcsan_mb(); \
ec570320b09f76 include/linux/atomic/atomic-instrumented.h Mark Rutland   2023-04-13 @4836  	instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
ec570320b09f76 include/linux/atomic/atomic-instrumented.h Mark Rutland   2023-04-13  4837  	instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
c9268ac615f9f6 include/linux/atomic/atomic-instrumented.h Mark Rutland   2023-06-05  4838  	raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
29f006fdefe6f8 include/asm-generic/atomic-instrumented.h  Peter Zijlstra 2020-08-29  4839  })
29f006fdefe6f8 include/asm-generic/atomic-instrumented.h  Peter Zijlstra 2020-08-29  4840  

:::::: The code at line 4836 was first introduced by commit
:::::: ec570320b09f76d52819e60abdccf372658216b6 locking/atomic: Correct (cmp)xchg() instrumentation

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
