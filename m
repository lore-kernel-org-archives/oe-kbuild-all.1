Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CC3C072
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvoO/1/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697651655; x=1729187655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AbPcyIFcKNxY0ZuCLP8EGhniUBsTKqvdY/GGR8MIpas=;
  b=mvoO/1/mny1/76K+XfhdHf1zxUX69YirMb+xohFVlw2hbIz1WPczACP2
   4G+iHS/05oQOh0NQOCZq9+xg15PW/V8BSBrV+AetJ2Nj7J6n6TaJosOTi
   elsDN94dPjgYnXbA27angRkSWZmYcL0ozFmFWsIjD1p7j2NBwG1Pc9/5U
   kjrGdg018Ro/cLdxc9r1ka4ItVtm5bYV/dR0YcxF/APO+hyzn7exxR2NP
   7DrSYtFYefw1ORTBrNKoqDiUQW4xtI0wj33JXdjlFInh1+hjiaU6g8rZh
   mdY2ZpeXXzmYdvj6voAbaxviFTcA53gbYJy0G3BOcSvqhStJaD1zz29VY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="450296218"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="450296218"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 10:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="880319677"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="880319677"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Oct 2023 10:54:13 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtAkE-0000mk-2w;
	Wed, 18 Oct 2023 17:54:10 +0000
Date: Thu, 19 Oct 2023 01:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/ilb-no-needs-kick 1/2]
 arch/arc/include/asm/cmpxchg.h:44:20: error: invalid type argument of unary
 '*' (have 'int')
Message-ID: <202310190109.q9Lbm0jO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/ilb-no-needs-kick
head:   742880248d6c4270f61e4fc73d27d65928cc4309
commit: 5998b4cd054c0ec4118e60b050b7796fe821ef79 [1/2] sched/nohz: Update nohz.next_balance directly without IPIs
config: arc-randconfig-002-20231019 (https://download.01.org/0day-ci/archive/20231019/202310190109.q9Lbm0jO-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190109.q9Lbm0jO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190109.q9Lbm0jO-lkp@intel.com/

All errors (new ones prefixed by >>):

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
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:188,
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
   include/linux/atomic/atomic-instrumented.h:4836:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
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
   In file included from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7:
>> arch/arc/include/asm/cmpxchg.h:44:20: error: invalid type argument of unary '*' (have 'int')
      44 |         __typeof__(*(ptr)) _o_ = (old);                                 \
         |                    ^~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:45:20: error: invalid type argument of unary '*' (have 'int')
      45 |         __typeof__(*(ptr)) _n_ = (new);                                 \
         |                    ^~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:46:20: error: invalid type argument of unary '*' (have 'int')
      46 |         __typeof__(*(ptr)) _prev_;                                      \
         |                    ^~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:23:20: error: invalid type argument of unary '*' (have 'int')
      23 |         __typeof__(*(ptr)) _prev;                                       \
         |                    ^~~~~~
   arch/arc/include/asm/cmpxchg.h:50:26: note: in expansion of macro '__cmpxchg'
      50 |                 _prev_ = __cmpxchg(_p_, _o_, _n_);                      \
         |                          ^~~~~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:44:20: error: invalid type argument of unary '*' (have 'int')
      44 |         __typeof__(*(ptr)) _o_ = (old);                                 \
         |                    ^~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:45:20: error: invalid type argument of unary '*' (have 'int')
      45 |         __typeof__(*(ptr)) _n_ = (new);                                 \
         |                    ^~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:46:20: error: invalid type argument of unary '*' (have 'int')
      46 |         __typeof__(*(ptr)) _prev_;                                      \
         |                    ^~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:23:20: error: invalid type argument of unary '*' (have 'int')
      23 |         __typeof__(*(ptr)) _prev;                                       \
         |                    ^~~~~~
   arch/arc/include/asm/cmpxchg.h:50:26: note: in expansion of macro '__cmpxchg'
      50 |                 _prev_ = __cmpxchg(_p_, _o_, _n_);                      \
         |                          ^~~~~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +44 arch/arc/include/asm/cmpxchg.h

14e968bad788de Vineet Gupta 2013-01-18  40  
ddc348c44d82d0 Vineet Gupta 2020-05-09  41  #define arch_cmpxchg_relaxed(ptr, old, new)				\
e188f3330a13df Vineet Gupta 2020-05-06  42  ({									\
e188f3330a13df Vineet Gupta 2020-05-06  43  	__typeof__(ptr) _p_ = (ptr);					\
e188f3330a13df Vineet Gupta 2020-05-06 @44  	__typeof__(*(ptr)) _o_ = (old);					\
e188f3330a13df Vineet Gupta 2020-05-06  45  	__typeof__(*(ptr)) _n_ = (new);					\
e188f3330a13df Vineet Gupta 2020-05-06  46  	__typeof__(*(ptr)) _prev_;					\
e188f3330a13df Vineet Gupta 2020-05-06  47  									\
e188f3330a13df Vineet Gupta 2020-05-06  48  	switch(sizeof((_p_))) {						\
e188f3330a13df Vineet Gupta 2020-05-06  49  	case 4:								\
e188f3330a13df Vineet Gupta 2020-05-06  50  		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
e188f3330a13df Vineet Gupta 2020-05-06  51  		break;							\
e188f3330a13df Vineet Gupta 2020-05-06  52  	default:							\
e188f3330a13df Vineet Gupta 2020-05-06  53  		BUILD_BUG();						\
e188f3330a13df Vineet Gupta 2020-05-06  54  	}								\
e188f3330a13df Vineet Gupta 2020-05-06  55  	_prev_;								\
e188f3330a13df Vineet Gupta 2020-05-06  56  })
14e968bad788de Vineet Gupta 2013-01-18  57  

:::::: The code at line 44 was first introduced by commit
:::::: e188f3330a13df904d77003846eafd3edf99009d ARC: cmpxchg/xchg: rewrite as macros to make type safe

:::::: TO: Vineet Gupta <vgupta@kernel.org>
:::::: CC: Vineet Gupta <vgupta@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
