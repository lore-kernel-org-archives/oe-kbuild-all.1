Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A81374D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzQAI2ZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697653577; x=1729189577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rFVPD5X1mF5oVSaRXCt1vd7CaT6rppQHWa+z1eGwgZY=;
  b=BzQAI2ZZZJvKryYjrquD6uEv1k7HM5NjjfyEcQPMfrvIUfNohKzUD29F
   Lh77aN5MHwN7czDImfty2SM3q/0ebavwUb5DQ9lHfklTghNGTeUTRalhd
   DUshZo0+jXCsCflNSgd4atyN0nbWD92dAEf/lWlKKfLa1m1pKtBzomOG/
   O2uPuIo93NM4cimideDb5mNyICjBnGLp8XfkR2qgraoF979FmvDZygOU4
   5RrqjzXnB7m2qqjXkGSiimx1ALOOhZ8qB5gZDx8kaEleS5+kwxQY9z+gr
   qhere2kpxoYR2aP0f3tqbk7pPfub0uKt6i8PYaT/xFHyaAg2VrsiqC+cA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="384955437"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="384955437"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 11:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="827003855"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="827003855"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2023 11:26:15 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtBFF-0000pA-0S;
	Wed, 18 Oct 2023 18:26:13 +0000
Date: Thu, 19 Oct 2023 02:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/ilb-no-needs-kick 1/2]
 arch/s390/include/asm/cmpxchg.h:181:20: error: invalid type argument of
 unary '*' (have 'int')
Message-ID: <202310190228.7Yntk6yi-lkp@intel.com>
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
config: s390-randconfig-001-20231019 (https://download.01.org/0day-ci/archive/20231019/202310190228.7Yntk6yi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190228.7Yntk6yi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190228.7Yntk6yi-lkp@intel.com/

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
                    from include/linux/cpumask.h:13,
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
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/s390/include/asm/bitops.h:204,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:10:
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
   In file included from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7:
>> arch/s390/include/asm/cmpxchg.h:181:20: error: invalid type argument of unary '*' (have 'int')
     181 |         __typeof__(*(ptr)) __ret;                                       \
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
   arch/s390/include/asm/cmpxchg.h:183:29: error: invalid type argument of unary '*' (have 'int')
     183 |         __ret = (__typeof__(*(ptr)))                                    \
         |                             ^~~~~~
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
   arch/s390/include/asm/cmpxchg.h:185:54: error: invalid type argument of unary '*' (have 'int')
     185 |                           (unsigned long)(n), sizeof(*(ptr)));          \
         |                                                      ^~~~~~
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
   cc1: some warnings being treated as errors


vim +181 arch/s390/include/asm/cmpxchg.h

d2b1f6d2d35043 Heiko Carstens 2021-04-06  178  
000174233b9134 Heiko Carstens 2021-04-06  179  #define arch_cmpxchg(ptr, o, n)						\
6b894a409e8c0f Heiko Carstens 2012-05-29  180  ({									\
d2b1f6d2d35043 Heiko Carstens 2021-04-06 @181  	__typeof__(*(ptr)) __ret;					\
d2b1f6d2d35043 Heiko Carstens 2021-04-06  182  									\
d2b1f6d2d35043 Heiko Carstens 2021-04-06  183  	__ret = (__typeof__(*(ptr)))					\
13525f0a62cc25 Heiko Carstens 2021-04-13  184  		__cmpxchg((unsigned long)(ptr), (unsigned long)(o),	\
d2b1f6d2d35043 Heiko Carstens 2021-04-06  185  			  (unsigned long)(n), sizeof(*(ptr)));		\
d2b1f6d2d35043 Heiko Carstens 2021-04-06  186  	__ret;								\
54eaae3028e6b0 Heiko Carstens 2011-03-23  187  })
54eaae3028e6b0 Heiko Carstens 2011-03-23  188  

:::::: The code at line 181 was first introduced by commit
:::::: d2b1f6d2d35043d2c9d079c1595f10c93bfca7d2 s390/cmpxchg: get rid of gcc atomic builtins

:::::: TO: Heiko Carstens <hca@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
