Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C710A29CEA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoNEqUfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697723478; x=1729259478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GBm+h6fYUC/ClA7Yfne8EEaiFfSWQ0T4KiBe84U1Iv4=;
  b=FoNEqUfWrbckAJd3ks3WR+ZmlkojQ+XBmS58Cl0oH7nD07lmbWRT2iyz
   msKStmuX7IXehA3BtCRmEo3hdxrgdBHMiAj3EDa73wJhpYBQ6oElunOvg
   dgW0HlPwZmG89SiHJks1GlqQBaONIR4/H6OFbcP1l65l/H/WrV/+m49Xv
   sJrivkTdAMmh4JrCVUrRSKzxZlRQBZinQGvkqFaF/SMa3PwCU0YXlP2tU
   08hDf54iGIb8rxUghalvpgWRtOysFdEaVaV85K8GaUPBPHnN+xv2rhOg7
   K04QmHG3TBiPOYz6lVHbbIO2gY5kIqNufn5SP4RAu6Yj8zTqNNsvp8DwP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390144124"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="390144124"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 06:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750514352"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="750514352"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Oct 2023 06:48:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtTNh-00029i-2j;
	Thu, 19 Oct 2023 13:48:09 +0000
Date: Thu, 19 Oct 2023 21:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/ilb-no-needs-kick 1/3]
 arch/mips/include/asm/cmpxchg.h:186:20: error: invalid type argument of
 unary '*' (have 'int')
Message-ID: <202310192114.zMuBvOqM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/ilb-no-needs-kick
head:   6a27fea4c21f111a2cb84908a209092104ed18fa
commit: 52bc56376f3116e32c1cd4f9e00b9fff380ec0c3 [1/3] sched/nohz: Update nohz.next_balance directly without IPIs (v2)
config: mips-xway_defconfig (https://download.01.org/0day-ci/archive/20231019/202310192114.zMuBvOqM-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192114.zMuBvOqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192114.zMuBvOqM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   kernel/sched/fair.c: In function 'update_nohz_next_balance':
   kernel/sched/fair.c:11304:47: error: 'nohz' undeclared (first use in this function)
   11304 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
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
   kernel/sched/fair.c:11304:37: note: in expansion of macro 'READ_ONCE'
   11304 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
         |                                     ^~~~~~~~~
   kernel/sched/fair.c:11304:47: note: each undeclared identifier is reported only once for each function it appears in
   11304 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
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
   kernel/sched/fair.c:11304:37: note: in expansion of macro 'READ_ONCE'
   11304 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
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
   In file included from arch/mips/include/asm/atomic.h:23,
                    from include/linux/atomic.h:7:
>> arch/mips/include/asm/cmpxchg.h:186:20: error: invalid type argument of unary '*' (have 'int')
     186 |         __typeof__(*(ptr)) __res;                                       \
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
   arch/mips/include/asm/cmpxchg.h:178:22: error: invalid type argument of unary '*' (have 'int')
     178 |         ((__typeof__(*(ptr)))                                           \
         |                      ^~~~~~
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
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
   arch/mips/include/asm/cmpxchg.h:180:54: error: invalid type argument of unary '*' (have 'int')
     180 |                           (unsigned long)(__typeof__(*(ptr)))(old),     \
         |                                                      ^~~~~~
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
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
   arch/mips/include/asm/cmpxchg.h:181:54: error: invalid type argument of unary '*' (have 'int')
     181 |                           (unsigned long)(__typeof__(*(ptr)))(new),     \
         |                                                      ^~~~~~
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
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
   arch/mips/include/asm/cmpxchg.h:182:34: error: invalid type argument of unary '*' (have 'int')
     182 |                           sizeof(*(ptr))))
         |                                  ^~~~~~
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
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
   arch/mips/include/asm/cmpxchg.h:179:27: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
     179 |                 __cmpxchg((ptr),                                        \
         |                           ^~~~~
         |                           |
         |                           int
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~


vim +186 arch/mips/include/asm/cmpxchg.h

8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09  176  
c7b5fd6faa1dc6 arch/mips/include/asm/cmpxchg.h Mark Rutland      2021-05-25  177  #define arch_cmpxchg_local(ptr, old, new)				\
8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09  178  	((__typeof__(*(ptr)))						\
8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09  179  		__cmpxchg((ptr),					\
8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09  180  			  (unsigned long)(__typeof__(*(ptr)))(old),	\
8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09  181  			  (unsigned long)(__typeof__(*(ptr)))(new),	\
8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09  182  			  sizeof(*(ptr))))
8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09  183  
c7b5fd6faa1dc6 arch/mips/include/asm/cmpxchg.h Mark Rutland      2021-05-25  184  #define arch_cmpxchg(ptr, old, new)					\
fef74705ea310a include/asm-mips/cmpxchg.h      Ralf Baechle      2007-10-01  185  ({									\
8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09 @186  	__typeof__(*(ptr)) __res;					\
fef74705ea310a include/asm-mips/cmpxchg.h      Ralf Baechle      2007-10-01  187  									\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  188  	/*								\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  189  	 * In the Loongson3 workaround case __cmpxchg_asm() already	\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  190  	 * contains a completion barrier prior to the LL, so we don't	\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  191  	 * need to emit an extra one here.				\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  192  	 */								\
8790ccf8daf1a8 arch/mips/include/asm/cmpxchg.h Nathan Chancellor 2021-01-14  193  	if (__SYNC_loongson3_war == 0)					\
8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09  194  		smp_mb__before_llsc();					\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  195  									\
c7b5fd6faa1dc6 arch/mips/include/asm/cmpxchg.h Mark Rutland      2021-05-25  196  	__res = arch_cmpxchg_local((ptr), (old), (new));		\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  197  									\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  198  	/*								\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  199  	 * In the Loongson3 workaround case __cmpxchg_asm() already	\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  200  	 * contains a completion barrier after the SC, so we don't	\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  201  	 * need to emit an extra one here.				\
a91f2a1dba44c2 arch/mips/include/asm/cmpxchg.h Paul Burton       2019-10-01  202  	 */								\
8790ccf8daf1a8 arch/mips/include/asm/cmpxchg.h Nathan Chancellor 2021-01-14  203  	if (__SYNC_loongson3_war == 0)					\
8263db4d776844 arch/mips/include/asm/cmpxchg.h Paul Burton       2017-06-09  204  		smp_llsc_mb();						\
fef74705ea310a include/asm-mips/cmpxchg.h      Ralf Baechle      2007-10-01  205  									\
fef74705ea310a include/asm-mips/cmpxchg.h      Ralf Baechle      2007-10-01  206  	__res;								\
fef74705ea310a include/asm-mips/cmpxchg.h      Ralf Baechle      2007-10-01  207  })
fef74705ea310a include/asm-mips/cmpxchg.h      Ralf Baechle      2007-10-01  208  

:::::: The code at line 186 was first introduced by commit
:::::: 8263db4d7768448cb06adbbdd14c613a1ea09830 MIPS: cmpxchg: Implement __cmpxchg() as a function

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
