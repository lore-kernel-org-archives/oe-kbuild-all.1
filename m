Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E480B1FB2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 05:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688706358; x=1720242358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQyMEFPtBkzQgtRJ85UDQmTbgjiGEmMzdN0xwaETQoo=;
  b=BxqtEa5npcIF4Yj9kc0cPZNyXRtUR2qvUjc8+IwnufWwu5FImTfG+RyA
   gRkfP2640MIsjYDx0a0zTKfE1gT5xNlBkpYe/0JJrA+0dAtez8E7pTuNc
   DoyqoWCUB85+S6CWEQkDex/6vQnnzh3VcIoXR+2GkHUbrc/dl3B2IkB6l
   BqvujIzTsjQNgnSz4+oHEYuLuWUEB6ZCZFctG45JlZpitgiL/dAWdbP9i
   UbU9jqw2t/PiGZQMavuE1cWQvdIB7dWpTgIk2wmxFxpPUle2XCsXwmOOP
   adeJOePZ7sucFaW1Q8D6v1O5dBYEHmQinflW1JPFIUOpNs3QGeLHjiXzr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="344135975"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="344135975"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 22:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="966490957"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="966490957"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2023 22:05:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHdfD-0001mm-0w;
	Fri, 07 Jul 2023 05:05:51 +0000
Date: Fri, 7 Jul 2023 13:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 40/224]
 include/linux/atomic-fallback.h:1017:13: error: implicit declaration of
 function 'atomic_cmpxchg'; did you mean 'atomic_try_cmpxchg'?
Message-ID: <202307071208.sknbOzS4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   f0a133b849634b4a3052fb456a980bf89a08f154
commit: 5dee87246f6c6aa4cbc0027ceffc7eee64c93813 [40/224] locking/atomic: arm: move to ARCH_ATOMIC
config: arm-randconfig-r046-20230707 (https://download.01.org/0day-ci/archive/20230707/202307071208.sknbOzS4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071208.sknbOzS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071208.sknbOzS4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/atomic.h:84,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:243,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/asm-generic/bug.h:20,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> include/linux/atomic-fallback.h:80: warning: "arch_atomic_read" redefined
      80 | #define arch_atomic_read atomic_read
         | 
   In file included from include/linux/atomic.h:7:
   arch/arm/include/asm/atomic.h:25: note: this is the location of the previous definition
      25 | #define arch_atomic_read(v)     READ_ONCE((v)->counter)
         | 
>> include/linux/atomic-fallback.h:92: warning: "arch_atomic_set" redefined
      92 | #define arch_atomic_set atomic_set
         | 
   arch/arm/include/asm/atomic.h:26: note: this is the location of the previous definition
      26 | #define arch_atomic_set(v,i)    WRITE_ONCE(((v)->counter), (i))
         | 
>> include/linux/atomic-fallback.h:109: warning: "arch_atomic_add_return_relaxed" redefined
     109 | #define arch_atomic_add_return_relaxed atomic_add_return_relaxed
         | 
   arch/arm/include/asm/atomic.h:96: note: this is the location of the previous definition
      96 | #define arch_atomic_add_return_relaxed          arch_atomic_add_return_relaxed
         | 
>> include/linux/atomic-fallback.h:156: warning: "arch_atomic_fetch_add_relaxed" redefined
     156 | #define arch_atomic_fetch_add_relaxed atomic_fetch_add_relaxed
         | 
   arch/arm/include/asm/atomic.h:98: note: this is the location of the previous definition
      98 | #define arch_atomic_fetch_add_relaxed           arch_atomic_fetch_add_relaxed
         | 
>> include/linux/atomic-fallback.h:205: warning: "arch_atomic_sub_return_relaxed" redefined
     205 | #define arch_atomic_sub_return_relaxed atomic_sub_return_relaxed
         | 
   arch/arm/include/asm/atomic.h:97: note: this is the location of the previous definition
      97 | #define arch_atomic_sub_return_relaxed          arch_atomic_sub_return_relaxed
         | 
>> include/linux/atomic-fallback.h:252: warning: "arch_atomic_fetch_sub_relaxed" redefined
     252 | #define arch_atomic_fetch_sub_relaxed atomic_fetch_sub_relaxed
         | 
   arch/arm/include/asm/atomic.h:99: note: this is the location of the previous definition
      99 | #define arch_atomic_fetch_sub_relaxed           arch_atomic_fetch_sub_relaxed
         | 
   include/linux/atomic-fallback.h: In function 'atomic_inc':
>> include/linux/atomic-fallback.h:302:9: error: implicit declaration of function 'atomic_add'; did you mean 'atomic_inc'? [-Werror=implicit-function-declaration]
     302 |         atomic_add(1, v);
         |         ^~~~~~~~~~
         |         atomic_inc
   include/linux/atomic-fallback.h: In function 'atomic_inc_return':
>> include/linux/atomic-fallback.h:323:16: error: implicit declaration of function 'atomic_add_return'; did you mean 'atomic_inc_return'? [-Werror=implicit-function-declaration]
     323 |         return atomic_add_return(1, v);
         |                ^~~~~~~~~~~~~~~~~
         |                atomic_inc_return
   include/linux/atomic-fallback.h: In function 'atomic_fetch_inc':
>> include/linux/atomic-fallback.h:409:16: error: implicit declaration of function 'atomic_fetch_add'; did you mean 'atomic_fetch_inc'? [-Werror=implicit-function-declaration]
     409 |         return atomic_fetch_add(1, v);
         |                ^~~~~~~~~~~~~~~~
         |                atomic_fetch_inc
   include/linux/atomic-fallback.h: In function 'atomic_dec':
>> include/linux/atomic-fallback.h:485:9: error: implicit declaration of function 'atomic_sub'; did you mean 'atomic_dec'? [-Werror=implicit-function-declaration]
     485 |         atomic_sub(1, v);
         |         ^~~~~~~~~~
         |         atomic_dec
   include/linux/atomic-fallback.h: In function 'atomic_dec_return':
>> include/linux/atomic-fallback.h:506:16: error: implicit declaration of function 'atomic_sub_return'; did you mean 'atomic_dec_return'? [-Werror=implicit-function-declaration]
     506 |         return atomic_sub_return(1, v);
         |                ^~~~~~~~~~~~~~~~~
         |                atomic_dec_return
   include/linux/atomic-fallback.h: In function 'atomic_fetch_dec':
>> include/linux/atomic-fallback.h:592:16: error: implicit declaration of function 'atomic_fetch_sub'; did you mean 'atomic_fetch_dec'? [-Werror=implicit-function-declaration]
     592 |         return atomic_fetch_sub(1, v);
         |                ^~~~~~~~~~~~~~~~
         |                atomic_fetch_dec
   include/linux/atomic-fallback.h: At top level:
>> include/linux/atomic-fallback.h:667: warning: "arch_atomic_fetch_and_relaxed" redefined
     667 | #define arch_atomic_fetch_and_relaxed atomic_fetch_and_relaxed
         | 
   arch/arm/include/asm/atomic.h:101: note: this is the location of the previous definition
     101 | #define arch_atomic_fetch_and_relaxed           arch_atomic_fetch_and_relaxed
         | 
>> include/linux/atomic-fallback.h:711: warning: "arch_atomic_andnot" redefined
     711 | #define arch_atomic_andnot atomic_andnot
         | 
   arch/arm/include/asm/atomic.h:226: note: this is the location of the previous definition
     226 | #define arch_atomic_andnot arch_atomic_andnot
         | 
   include/linux/atomic-fallback.h: In function 'atomic_andnot':
>> include/linux/atomic-fallback.h:717:9: error: implicit declaration of function 'atomic_and'; did you mean 'atomic_inc'? [-Werror=implicit-function-declaration]
     717 |         atomic_and(~i, v);
         |         ^~~~~~~~~~
         |         atomic_inc
   include/linux/atomic-fallback.h: At top level:
>> include/linux/atomic-fallback.h:725: warning: "arch_atomic_fetch_andnot_relaxed" redefined
     725 | #define arch_atomic_fetch_andnot_relaxed atomic_fetch_andnot_relaxed
         | 
   arch/arm/include/asm/atomic.h:102: note: this is the location of the previous definition
     102 | #define arch_atomic_fetch_andnot_relaxed        arch_atomic_fetch_andnot_relaxed
         | 
   include/linux/atomic-fallback.h: In function 'atomic_fetch_andnot':
>> include/linux/atomic-fallback.h:738:16: error: implicit declaration of function 'atomic_fetch_and'; did you mean 'atomic_fetch_inc'? [-Werror=implicit-function-declaration]
     738 |         return atomic_fetch_and(~i, v);
         |                ^~~~~~~~~~~~~~~~
         |                atomic_fetch_inc
   include/linux/atomic-fallback.h: At top level:
>> include/linux/atomic-fallback.h:813: warning: "arch_atomic_fetch_or_relaxed" redefined
     813 | #define arch_atomic_fetch_or_relaxed atomic_fetch_or_relaxed
         | 
   arch/arm/include/asm/atomic.h:103: note: this is the location of the previous definition
     103 | #define arch_atomic_fetch_or_relaxed            arch_atomic_fetch_or_relaxed
         | 
>> include/linux/atomic-fallback.h:862: warning: "arch_atomic_fetch_xor_relaxed" redefined
     862 | #define arch_atomic_fetch_xor_relaxed atomic_fetch_xor_relaxed
         | 
   arch/arm/include/asm/atomic.h:104: note: this is the location of the previous definition
     104 | #define arch_atomic_fetch_xor_relaxed           arch_atomic_fetch_xor_relaxed
         | 
>> include/linux/atomic-fallback.h:906: warning: "arch_atomic_xchg" redefined
     906 | #define arch_atomic_xchg atomic_xchg
         | 
   arch/arm/include/asm/atomic.h:243: note: this is the location of the previous definition
     243 | #define arch_atomic_xchg(v, new) (arch_xchg(&((v)->counter), new))
         | 
   include/linux/atomic-fallback.h:956: warning: "arch_atomic_cmpxchg_relaxed" redefined
     956 | #define arch_atomic_cmpxchg_relaxed atomic_cmpxchg_relaxed
         | 
   arch/arm/include/asm/atomic.h:126: note: this is the location of the previous definition
     126 | #define arch_atomic_cmpxchg_relaxed             arch_atomic_cmpxchg_relaxed
         | 
   include/linux/atomic-fallback.h: In function 'atomic_try_cmpxchg':
   include/linux/atomic-fallback.h:1017:13: error: implicit declaration of function 'atomic_cmpxchg'; did you mean 'atomic_try_cmpxchg'? [-Werror=implicit-function-declaration]
    1017 |         r = atomic_cmpxchg(v, o, new);
         |             ^~~~~~~~~~~~~~
         |             atomic_try_cmpxchg
   include/linux/atomic-fallback.h: At top level:
   include/linux/atomic-fallback.h:1180: warning: "arch_atomic_fetch_add_unless" redefined
    1180 | #define arch_atomic_fetch_add_unless atomic_fetch_add_unless
         | 
   arch/arm/include/asm/atomic.h:154: note: this is the location of the previous definition
     154 | #define arch_atomic_fetch_add_unless            arch_atomic_fetch_add_unless
         | 
   include/linux/atomic-fallback.h: In function 'atomic_fetch_add_unless':
   include/linux/atomic-fallback.h:1195:17: error: implicit declaration of function 'atomic_read'; did you mean 'atomic_dec'? [-Werror=implicit-function-declaration]
    1195 |         int c = atomic_read(v);
         |                 ^~~~~~~~~~~
         |                 atomic_dec
   In file included from include/linux/atomic.h:87:
   include/asm-generic/atomic-long.h: In function 'atomic_long_set':
   include/asm-generic/atomic-long.h:535:9: error: implicit declaration of function 'atomic_set'; did you mean 'atomic64_set'? [-Werror=implicit-function-declaration]
     535 |         atomic_set(v, i);
         |         ^~~~~~~~~~
         |         atomic64_set
   include/asm-generic/atomic-long.h: In function 'atomic_long_or':
   include/asm-generic/atomic-long.h:823:9: error: implicit declaration of function 'atomic_or'; did you mean 'atomic64_or'? [-Werror=implicit-function-declaration]
     823 |         atomic_or(i, v);
         |         ^~~~~~~~~
         |         atomic64_or
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_or':
   include/asm-generic/atomic-long.h:829:16: error: implicit declaration of function 'atomic_fetch_or'; did you mean 'atomic64_fetch_or'? [-Werror=implicit-function-declaration]
     829 |         return atomic_fetch_or(i, v);
         |                ^~~~~~~~~~~~~~~
         |                atomic64_fetch_or
   include/asm-generic/atomic-long.h: In function 'atomic_long_xor':
   include/asm-generic/atomic-long.h:853:9: error: implicit declaration of function 'atomic_xor'; did you mean 'atomic64_xor'? [-Werror=implicit-function-declaration]
     853 |         atomic_xor(i, v);
         |         ^~~~~~~~~~
         |         atomic64_xor
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_xor':
   include/asm-generic/atomic-long.h:859:16: error: implicit declaration of function 'atomic_fetch_xor'; did you mean 'atomic64_fetch_xor'? [-Werror=implicit-function-declaration]
     859 |         return atomic_fetch_xor(i, v);
         |                ^~~~~~~~~~~~~~~~
         |                atomic64_fetch_xor
   include/asm-generic/atomic-long.h: In function 'atomic_long_xchg':
   include/asm-generic/atomic-long.h:883:16: error: implicit declaration of function 'atomic_xchg'; did you mean 'atomic64_xchg'? [-Werror=implicit-function-declaration]
     883 |         return atomic_xchg(v, i);
         |                ^~~~~~~~~~~
         |                atomic64_xchg
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1 shuffle=1543106573
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1243: prepare0] Error 2 shuffle=1543106573
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:192: __sub-make] Error 2 shuffle=1543106573
   make: Target 'prepare' not remade because of errors.


vim +1017 include/linux/atomic-fallback.h

5faafd5685764e Peter Zijlstra 2020-06-25   858  
5faafd5685764e Peter Zijlstra 2020-06-25   859  #define arch_atomic_fetch_xor atomic_fetch_xor
5faafd5685764e Peter Zijlstra 2020-06-25   860  #define arch_atomic_fetch_xor_acquire atomic_fetch_xor_acquire
5faafd5685764e Peter Zijlstra 2020-06-25   861  #define arch_atomic_fetch_xor_release atomic_fetch_xor_release
5faafd5685764e Peter Zijlstra 2020-06-25  @862  #define arch_atomic_fetch_xor_relaxed atomic_fetch_xor_relaxed
5faafd5685764e Peter Zijlstra 2020-06-25   863  
9fa45070a2e59a Mark Rutland   2018-09-04   864  #ifndef atomic_fetch_xor_relaxed
9fa45070a2e59a Mark Rutland   2018-09-04   865  #define atomic_fetch_xor_acquire atomic_fetch_xor
9fa45070a2e59a Mark Rutland   2018-09-04   866  #define atomic_fetch_xor_release atomic_fetch_xor
9fa45070a2e59a Mark Rutland   2018-09-04   867  #define atomic_fetch_xor_relaxed atomic_fetch_xor
9fa45070a2e59a Mark Rutland   2018-09-04   868  #else /* atomic_fetch_xor_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04   869  
9fa45070a2e59a Mark Rutland   2018-09-04   870  #ifndef atomic_fetch_xor_acquire
765dcd209947e7 Marco Elver    2019-11-26   871  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04   872  atomic_fetch_xor_acquire(int i, atomic_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04   873  {
9fa45070a2e59a Mark Rutland   2018-09-04   874  	int ret = atomic_fetch_xor_relaxed(i, v);
9fa45070a2e59a Mark Rutland   2018-09-04   875  	__atomic_acquire_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   876  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04   877  }
9fa45070a2e59a Mark Rutland   2018-09-04   878  #define atomic_fetch_xor_acquire atomic_fetch_xor_acquire
9fa45070a2e59a Mark Rutland   2018-09-04   879  #endif
9fa45070a2e59a Mark Rutland   2018-09-04   880  
9fa45070a2e59a Mark Rutland   2018-09-04   881  #ifndef atomic_fetch_xor_release
765dcd209947e7 Marco Elver    2019-11-26   882  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04   883  atomic_fetch_xor_release(int i, atomic_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04   884  {
9fa45070a2e59a Mark Rutland   2018-09-04   885  	__atomic_release_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   886  	return atomic_fetch_xor_relaxed(i, v);
9fa45070a2e59a Mark Rutland   2018-09-04   887  }
9fa45070a2e59a Mark Rutland   2018-09-04   888  #define atomic_fetch_xor_release atomic_fetch_xor_release
9fa45070a2e59a Mark Rutland   2018-09-04   889  #endif
9fa45070a2e59a Mark Rutland   2018-09-04   890  
9fa45070a2e59a Mark Rutland   2018-09-04   891  #ifndef atomic_fetch_xor
765dcd209947e7 Marco Elver    2019-11-26   892  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04   893  atomic_fetch_xor(int i, atomic_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04   894  {
9fa45070a2e59a Mark Rutland   2018-09-04   895  	int ret;
9fa45070a2e59a Mark Rutland   2018-09-04   896  	__atomic_pre_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   897  	ret = atomic_fetch_xor_relaxed(i, v);
9fa45070a2e59a Mark Rutland   2018-09-04   898  	__atomic_post_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   899  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04   900  }
9fa45070a2e59a Mark Rutland   2018-09-04   901  #define atomic_fetch_xor atomic_fetch_xor
9fa45070a2e59a Mark Rutland   2018-09-04   902  #endif
9fa45070a2e59a Mark Rutland   2018-09-04   903  
9fa45070a2e59a Mark Rutland   2018-09-04   904  #endif /* atomic_fetch_xor_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04   905  
5faafd5685764e Peter Zijlstra 2020-06-25  @906  #define arch_atomic_xchg atomic_xchg
5faafd5685764e Peter Zijlstra 2020-06-25   907  #define arch_atomic_xchg_acquire atomic_xchg_acquire
5faafd5685764e Peter Zijlstra 2020-06-25   908  #define arch_atomic_xchg_release atomic_xchg_release
5faafd5685764e Peter Zijlstra 2020-06-25   909  #define arch_atomic_xchg_relaxed atomic_xchg_relaxed
5faafd5685764e Peter Zijlstra 2020-06-25   910  
9fa45070a2e59a Mark Rutland   2018-09-04   911  #ifndef atomic_xchg_relaxed
9fa45070a2e59a Mark Rutland   2018-09-04   912  #define atomic_xchg_acquire atomic_xchg
9fa45070a2e59a Mark Rutland   2018-09-04   913  #define atomic_xchg_release atomic_xchg
9fa45070a2e59a Mark Rutland   2018-09-04   914  #define atomic_xchg_relaxed atomic_xchg
9fa45070a2e59a Mark Rutland   2018-09-04   915  #else /* atomic_xchg_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04   916  
9fa45070a2e59a Mark Rutland   2018-09-04   917  #ifndef atomic_xchg_acquire
765dcd209947e7 Marco Elver    2019-11-26   918  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04   919  atomic_xchg_acquire(atomic_t *v, int i)
9fa45070a2e59a Mark Rutland   2018-09-04   920  {
9fa45070a2e59a Mark Rutland   2018-09-04   921  	int ret = atomic_xchg_relaxed(v, i);
9fa45070a2e59a Mark Rutland   2018-09-04   922  	__atomic_acquire_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   923  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04   924  }
9fa45070a2e59a Mark Rutland   2018-09-04   925  #define atomic_xchg_acquire atomic_xchg_acquire
9fa45070a2e59a Mark Rutland   2018-09-04   926  #endif
9fa45070a2e59a Mark Rutland   2018-09-04   927  
9fa45070a2e59a Mark Rutland   2018-09-04   928  #ifndef atomic_xchg_release
765dcd209947e7 Marco Elver    2019-11-26   929  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04   930  atomic_xchg_release(atomic_t *v, int i)
9fa45070a2e59a Mark Rutland   2018-09-04   931  {
9fa45070a2e59a Mark Rutland   2018-09-04   932  	__atomic_release_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   933  	return atomic_xchg_relaxed(v, i);
9fa45070a2e59a Mark Rutland   2018-09-04   934  }
9fa45070a2e59a Mark Rutland   2018-09-04   935  #define atomic_xchg_release atomic_xchg_release
9fa45070a2e59a Mark Rutland   2018-09-04   936  #endif
9fa45070a2e59a Mark Rutland   2018-09-04   937  
9fa45070a2e59a Mark Rutland   2018-09-04   938  #ifndef atomic_xchg
765dcd209947e7 Marco Elver    2019-11-26   939  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04   940  atomic_xchg(atomic_t *v, int i)
9fa45070a2e59a Mark Rutland   2018-09-04   941  {
9fa45070a2e59a Mark Rutland   2018-09-04   942  	int ret;
9fa45070a2e59a Mark Rutland   2018-09-04   943  	__atomic_pre_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   944  	ret = atomic_xchg_relaxed(v, i);
9fa45070a2e59a Mark Rutland   2018-09-04   945  	__atomic_post_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   946  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04   947  }
9fa45070a2e59a Mark Rutland   2018-09-04   948  #define atomic_xchg atomic_xchg
9fa45070a2e59a Mark Rutland   2018-09-04   949  #endif
9fa45070a2e59a Mark Rutland   2018-09-04   950  
9fa45070a2e59a Mark Rutland   2018-09-04   951  #endif /* atomic_xchg_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04   952  
5faafd5685764e Peter Zijlstra 2020-06-25   953  #define arch_atomic_cmpxchg atomic_cmpxchg
5faafd5685764e Peter Zijlstra 2020-06-25   954  #define arch_atomic_cmpxchg_acquire atomic_cmpxchg_acquire
5faafd5685764e Peter Zijlstra 2020-06-25   955  #define arch_atomic_cmpxchg_release atomic_cmpxchg_release
5faafd5685764e Peter Zijlstra 2020-06-25  @956  #define arch_atomic_cmpxchg_relaxed atomic_cmpxchg_relaxed
5faafd5685764e Peter Zijlstra 2020-06-25   957  
9fa45070a2e59a Mark Rutland   2018-09-04   958  #ifndef atomic_cmpxchg_relaxed
9fa45070a2e59a Mark Rutland   2018-09-04   959  #define atomic_cmpxchg_acquire atomic_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04   960  #define atomic_cmpxchg_release atomic_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04   961  #define atomic_cmpxchg_relaxed atomic_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04   962  #else /* atomic_cmpxchg_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04   963  
9fa45070a2e59a Mark Rutland   2018-09-04   964  #ifndef atomic_cmpxchg_acquire
765dcd209947e7 Marco Elver    2019-11-26   965  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04   966  atomic_cmpxchg_acquire(atomic_t *v, int old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04   967  {
9fa45070a2e59a Mark Rutland   2018-09-04   968  	int ret = atomic_cmpxchg_relaxed(v, old, new);
9fa45070a2e59a Mark Rutland   2018-09-04   969  	__atomic_acquire_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   970  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04   971  }
9fa45070a2e59a Mark Rutland   2018-09-04   972  #define atomic_cmpxchg_acquire atomic_cmpxchg_acquire
9fa45070a2e59a Mark Rutland   2018-09-04   973  #endif
9fa45070a2e59a Mark Rutland   2018-09-04   974  
9fa45070a2e59a Mark Rutland   2018-09-04   975  #ifndef atomic_cmpxchg_release
765dcd209947e7 Marco Elver    2019-11-26   976  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04   977  atomic_cmpxchg_release(atomic_t *v, int old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04   978  {
9fa45070a2e59a Mark Rutland   2018-09-04   979  	__atomic_release_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   980  	return atomic_cmpxchg_relaxed(v, old, new);
9fa45070a2e59a Mark Rutland   2018-09-04   981  }
9fa45070a2e59a Mark Rutland   2018-09-04   982  #define atomic_cmpxchg_release atomic_cmpxchg_release
9fa45070a2e59a Mark Rutland   2018-09-04   983  #endif
9fa45070a2e59a Mark Rutland   2018-09-04   984  
9fa45070a2e59a Mark Rutland   2018-09-04   985  #ifndef atomic_cmpxchg
765dcd209947e7 Marco Elver    2019-11-26   986  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04   987  atomic_cmpxchg(atomic_t *v, int old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04   988  {
9fa45070a2e59a Mark Rutland   2018-09-04   989  	int ret;
9fa45070a2e59a Mark Rutland   2018-09-04   990  	__atomic_pre_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   991  	ret = atomic_cmpxchg_relaxed(v, old, new);
9fa45070a2e59a Mark Rutland   2018-09-04   992  	__atomic_post_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04   993  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04   994  }
9fa45070a2e59a Mark Rutland   2018-09-04   995  #define atomic_cmpxchg atomic_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04   996  #endif
9fa45070a2e59a Mark Rutland   2018-09-04   997  
9fa45070a2e59a Mark Rutland   2018-09-04   998  #endif /* atomic_cmpxchg_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04   999  
5faafd5685764e Peter Zijlstra 2020-06-25  1000  #define arch_atomic_try_cmpxchg atomic_try_cmpxchg
5faafd5685764e Peter Zijlstra 2020-06-25  1001  #define arch_atomic_try_cmpxchg_acquire atomic_try_cmpxchg_acquire
5faafd5685764e Peter Zijlstra 2020-06-25  1002  #define arch_atomic_try_cmpxchg_release atomic_try_cmpxchg_release
5faafd5685764e Peter Zijlstra 2020-06-25  1003  #define arch_atomic_try_cmpxchg_relaxed atomic_try_cmpxchg_relaxed
5faafd5685764e Peter Zijlstra 2020-06-25  1004  
9fa45070a2e59a Mark Rutland   2018-09-04  1005  #ifndef atomic_try_cmpxchg_relaxed
9fa45070a2e59a Mark Rutland   2018-09-04  1006  #ifdef atomic_try_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04  1007  #define atomic_try_cmpxchg_acquire atomic_try_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04  1008  #define atomic_try_cmpxchg_release atomic_try_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04  1009  #define atomic_try_cmpxchg_relaxed atomic_try_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04  1010  #endif /* atomic_try_cmpxchg */
9fa45070a2e59a Mark Rutland   2018-09-04  1011  
9fa45070a2e59a Mark Rutland   2018-09-04  1012  #ifndef atomic_try_cmpxchg
765dcd209947e7 Marco Elver    2019-11-26  1013  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1014  atomic_try_cmpxchg(atomic_t *v, int *old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04  1015  {
9fa45070a2e59a Mark Rutland   2018-09-04  1016  	int r, o = *old;
9fa45070a2e59a Mark Rutland   2018-09-04 @1017  	r = atomic_cmpxchg(v, o, new);
9fa45070a2e59a Mark Rutland   2018-09-04  1018  	if (unlikely(r != o))
9fa45070a2e59a Mark Rutland   2018-09-04  1019  		*old = r;
9fa45070a2e59a Mark Rutland   2018-09-04  1020  	return likely(r == o);
9fa45070a2e59a Mark Rutland   2018-09-04  1021  }
9fa45070a2e59a Mark Rutland   2018-09-04  1022  #define atomic_try_cmpxchg atomic_try_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04  1023  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1024  
9fa45070a2e59a Mark Rutland   2018-09-04  1025  #ifndef atomic_try_cmpxchg_acquire
765dcd209947e7 Marco Elver    2019-11-26  1026  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1027  atomic_try_cmpxchg_acquire(atomic_t *v, int *old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04  1028  {
9fa45070a2e59a Mark Rutland   2018-09-04  1029  	int r, o = *old;
9fa45070a2e59a Mark Rutland   2018-09-04  1030  	r = atomic_cmpxchg_acquire(v, o, new);
9fa45070a2e59a Mark Rutland   2018-09-04  1031  	if (unlikely(r != o))
9fa45070a2e59a Mark Rutland   2018-09-04  1032  		*old = r;
9fa45070a2e59a Mark Rutland   2018-09-04  1033  	return likely(r == o);
9fa45070a2e59a Mark Rutland   2018-09-04  1034  }
9fa45070a2e59a Mark Rutland   2018-09-04  1035  #define atomic_try_cmpxchg_acquire atomic_try_cmpxchg_acquire
9fa45070a2e59a Mark Rutland   2018-09-04  1036  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1037  
9fa45070a2e59a Mark Rutland   2018-09-04  1038  #ifndef atomic_try_cmpxchg_release
765dcd209947e7 Marco Elver    2019-11-26  1039  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1040  atomic_try_cmpxchg_release(atomic_t *v, int *old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04  1041  {
9fa45070a2e59a Mark Rutland   2018-09-04  1042  	int r, o = *old;
9fa45070a2e59a Mark Rutland   2018-09-04  1043  	r = atomic_cmpxchg_release(v, o, new);
9fa45070a2e59a Mark Rutland   2018-09-04  1044  	if (unlikely(r != o))
9fa45070a2e59a Mark Rutland   2018-09-04  1045  		*old = r;
9fa45070a2e59a Mark Rutland   2018-09-04  1046  	return likely(r == o);
9fa45070a2e59a Mark Rutland   2018-09-04  1047  }
9fa45070a2e59a Mark Rutland   2018-09-04  1048  #define atomic_try_cmpxchg_release atomic_try_cmpxchg_release
9fa45070a2e59a Mark Rutland   2018-09-04  1049  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1050  
9fa45070a2e59a Mark Rutland   2018-09-04  1051  #ifndef atomic_try_cmpxchg_relaxed
765dcd209947e7 Marco Elver    2019-11-26  1052  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1053  atomic_try_cmpxchg_relaxed(atomic_t *v, int *old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04  1054  {
9fa45070a2e59a Mark Rutland   2018-09-04  1055  	int r, o = *old;
9fa45070a2e59a Mark Rutland   2018-09-04  1056  	r = atomic_cmpxchg_relaxed(v, o, new);
9fa45070a2e59a Mark Rutland   2018-09-04  1057  	if (unlikely(r != o))
9fa45070a2e59a Mark Rutland   2018-09-04  1058  		*old = r;
9fa45070a2e59a Mark Rutland   2018-09-04  1059  	return likely(r == o);
9fa45070a2e59a Mark Rutland   2018-09-04  1060  }
9fa45070a2e59a Mark Rutland   2018-09-04  1061  #define atomic_try_cmpxchg_relaxed atomic_try_cmpxchg_relaxed
9fa45070a2e59a Mark Rutland   2018-09-04  1062  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1063  
9fa45070a2e59a Mark Rutland   2018-09-04  1064  #else /* atomic_try_cmpxchg_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04  1065  
9fa45070a2e59a Mark Rutland   2018-09-04  1066  #ifndef atomic_try_cmpxchg_acquire
765dcd209947e7 Marco Elver    2019-11-26  1067  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1068  atomic_try_cmpxchg_acquire(atomic_t *v, int *old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04  1069  {
9fa45070a2e59a Mark Rutland   2018-09-04  1070  	bool ret = atomic_try_cmpxchg_relaxed(v, old, new);
9fa45070a2e59a Mark Rutland   2018-09-04  1071  	__atomic_acquire_fence();
9fa45070a2e59a Mark Rutland   2018-09-04  1072  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04  1073  }
9fa45070a2e59a Mark Rutland   2018-09-04  1074  #define atomic_try_cmpxchg_acquire atomic_try_cmpxchg_acquire
9fa45070a2e59a Mark Rutland   2018-09-04  1075  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1076  
9fa45070a2e59a Mark Rutland   2018-09-04  1077  #ifndef atomic_try_cmpxchg_release
765dcd209947e7 Marco Elver    2019-11-26  1078  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1079  atomic_try_cmpxchg_release(atomic_t *v, int *old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04  1080  {
9fa45070a2e59a Mark Rutland   2018-09-04  1081  	__atomic_release_fence();
9fa45070a2e59a Mark Rutland   2018-09-04  1082  	return atomic_try_cmpxchg_relaxed(v, old, new);
9fa45070a2e59a Mark Rutland   2018-09-04  1083  }
9fa45070a2e59a Mark Rutland   2018-09-04  1084  #define atomic_try_cmpxchg_release atomic_try_cmpxchg_release
9fa45070a2e59a Mark Rutland   2018-09-04  1085  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1086  
9fa45070a2e59a Mark Rutland   2018-09-04  1087  #ifndef atomic_try_cmpxchg
765dcd209947e7 Marco Elver    2019-11-26  1088  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1089  atomic_try_cmpxchg(atomic_t *v, int *old, int new)
9fa45070a2e59a Mark Rutland   2018-09-04  1090  {
9fa45070a2e59a Mark Rutland   2018-09-04  1091  	bool ret;
9fa45070a2e59a Mark Rutland   2018-09-04  1092  	__atomic_pre_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04  1093  	ret = atomic_try_cmpxchg_relaxed(v, old, new);
9fa45070a2e59a Mark Rutland   2018-09-04  1094  	__atomic_post_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04  1095  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04  1096  }
9fa45070a2e59a Mark Rutland   2018-09-04  1097  #define atomic_try_cmpxchg atomic_try_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04  1098  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1099  
9fa45070a2e59a Mark Rutland   2018-09-04  1100  #endif /* atomic_try_cmpxchg_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04  1101  
5faafd5685764e Peter Zijlstra 2020-06-25  1102  #define arch_atomic_sub_and_test atomic_sub_and_test
5faafd5685764e Peter Zijlstra 2020-06-25  1103  
9fa45070a2e59a Mark Rutland   2018-09-04  1104  #ifndef atomic_sub_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  1105  /**
9fa45070a2e59a Mark Rutland   2018-09-04  1106   * atomic_sub_and_test - subtract value from variable and test result
9fa45070a2e59a Mark Rutland   2018-09-04  1107   * @i: integer value to subtract
9fa45070a2e59a Mark Rutland   2018-09-04  1108   * @v: pointer of type atomic_t
9fa45070a2e59a Mark Rutland   2018-09-04  1109   *
9fa45070a2e59a Mark Rutland   2018-09-04  1110   * Atomically subtracts @i from @v and returns
9fa45070a2e59a Mark Rutland   2018-09-04  1111   * true if the result is zero, or false for all
9fa45070a2e59a Mark Rutland   2018-09-04  1112   * other cases.
9fa45070a2e59a Mark Rutland   2018-09-04  1113   */
765dcd209947e7 Marco Elver    2019-11-26  1114  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1115  atomic_sub_and_test(int i, atomic_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  1116  {
9fa45070a2e59a Mark Rutland   2018-09-04  1117  	return atomic_sub_return(i, v) == 0;
9fa45070a2e59a Mark Rutland   2018-09-04  1118  }
9fa45070a2e59a Mark Rutland   2018-09-04  1119  #define atomic_sub_and_test atomic_sub_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  1120  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1121  
5faafd5685764e Peter Zijlstra 2020-06-25  1122  #define arch_atomic_dec_and_test atomic_dec_and_test
5faafd5685764e Peter Zijlstra 2020-06-25  1123  
9fa45070a2e59a Mark Rutland   2018-09-04  1124  #ifndef atomic_dec_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  1125  /**
9fa45070a2e59a Mark Rutland   2018-09-04  1126   * atomic_dec_and_test - decrement and test
9fa45070a2e59a Mark Rutland   2018-09-04  1127   * @v: pointer of type atomic_t
9fa45070a2e59a Mark Rutland   2018-09-04  1128   *
9fa45070a2e59a Mark Rutland   2018-09-04  1129   * Atomically decrements @v by 1 and
9fa45070a2e59a Mark Rutland   2018-09-04  1130   * returns true if the result is 0, or false for all other
9fa45070a2e59a Mark Rutland   2018-09-04  1131   * cases.
9fa45070a2e59a Mark Rutland   2018-09-04  1132   */
765dcd209947e7 Marco Elver    2019-11-26  1133  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1134  atomic_dec_and_test(atomic_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  1135  {
9fa45070a2e59a Mark Rutland   2018-09-04  1136  	return atomic_dec_return(v) == 0;
9fa45070a2e59a Mark Rutland   2018-09-04  1137  }
9fa45070a2e59a Mark Rutland   2018-09-04  1138  #define atomic_dec_and_test atomic_dec_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  1139  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1140  
5faafd5685764e Peter Zijlstra 2020-06-25  1141  #define arch_atomic_inc_and_test atomic_inc_and_test
5faafd5685764e Peter Zijlstra 2020-06-25  1142  
9fa45070a2e59a Mark Rutland   2018-09-04  1143  #ifndef atomic_inc_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  1144  /**
9fa45070a2e59a Mark Rutland   2018-09-04  1145   * atomic_inc_and_test - increment and test
9fa45070a2e59a Mark Rutland   2018-09-04  1146   * @v: pointer of type atomic_t
9fa45070a2e59a Mark Rutland   2018-09-04  1147   *
9fa45070a2e59a Mark Rutland   2018-09-04  1148   * Atomically increments @v by 1
9fa45070a2e59a Mark Rutland   2018-09-04  1149   * and returns true if the result is zero, or false for all
9fa45070a2e59a Mark Rutland   2018-09-04  1150   * other cases.
9fa45070a2e59a Mark Rutland   2018-09-04  1151   */
765dcd209947e7 Marco Elver    2019-11-26  1152  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1153  atomic_inc_and_test(atomic_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  1154  {
9fa45070a2e59a Mark Rutland   2018-09-04  1155  	return atomic_inc_return(v) == 0;
9fa45070a2e59a Mark Rutland   2018-09-04  1156  }
9fa45070a2e59a Mark Rutland   2018-09-04  1157  #define atomic_inc_and_test atomic_inc_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  1158  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1159  
5faafd5685764e Peter Zijlstra 2020-06-25  1160  #define arch_atomic_add_negative atomic_add_negative
5faafd5685764e Peter Zijlstra 2020-06-25  1161  
9fa45070a2e59a Mark Rutland   2018-09-04  1162  #ifndef atomic_add_negative
9fa45070a2e59a Mark Rutland   2018-09-04  1163  /**
9fa45070a2e59a Mark Rutland   2018-09-04  1164   * atomic_add_negative - add and test if negative
9fa45070a2e59a Mark Rutland   2018-09-04  1165   * @i: integer value to add
9fa45070a2e59a Mark Rutland   2018-09-04  1166   * @v: pointer of type atomic_t
9fa45070a2e59a Mark Rutland   2018-09-04  1167   *
9fa45070a2e59a Mark Rutland   2018-09-04  1168   * Atomically adds @i to @v and returns true
9fa45070a2e59a Mark Rutland   2018-09-04  1169   * if the result is negative, or false when
9fa45070a2e59a Mark Rutland   2018-09-04  1170   * result is greater than or equal to zero.
9fa45070a2e59a Mark Rutland   2018-09-04  1171   */
765dcd209947e7 Marco Elver    2019-11-26  1172  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  1173  atomic_add_negative(int i, atomic_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  1174  {
9fa45070a2e59a Mark Rutland   2018-09-04  1175  	return atomic_add_return(i, v) < 0;
9fa45070a2e59a Mark Rutland   2018-09-04  1176  }
9fa45070a2e59a Mark Rutland   2018-09-04  1177  #define atomic_add_negative atomic_add_negative
9fa45070a2e59a Mark Rutland   2018-09-04  1178  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1179  
5faafd5685764e Peter Zijlstra 2020-06-25 @1180  #define arch_atomic_fetch_add_unless atomic_fetch_add_unless
5faafd5685764e Peter Zijlstra 2020-06-25  1181  
9fa45070a2e59a Mark Rutland   2018-09-04  1182  #ifndef atomic_fetch_add_unless
9fa45070a2e59a Mark Rutland   2018-09-04  1183  /**
9fa45070a2e59a Mark Rutland   2018-09-04  1184   * atomic_fetch_add_unless - add unless the number is already a given value
9fa45070a2e59a Mark Rutland   2018-09-04  1185   * @v: pointer of type atomic_t
9fa45070a2e59a Mark Rutland   2018-09-04  1186   * @a: the amount to add to v...
9fa45070a2e59a Mark Rutland   2018-09-04  1187   * @u: ...unless v is equal to u.
9fa45070a2e59a Mark Rutland   2018-09-04  1188   *
9fa45070a2e59a Mark Rutland   2018-09-04  1189   * Atomically adds @a to @v, so long as @v was not already @u.
9fa45070a2e59a Mark Rutland   2018-09-04  1190   * Returns original value of @v
9fa45070a2e59a Mark Rutland   2018-09-04  1191   */
765dcd209947e7 Marco Elver    2019-11-26  1192  static __always_inline int
9fa45070a2e59a Mark Rutland   2018-09-04  1193  atomic_fetch_add_unless(atomic_t *v, int a, int u)
9fa45070a2e59a Mark Rutland   2018-09-04  1194  {
9fa45070a2e59a Mark Rutland   2018-09-04 @1195  	int c = atomic_read(v);
9fa45070a2e59a Mark Rutland   2018-09-04  1196  
9fa45070a2e59a Mark Rutland   2018-09-04  1197  	do {
9fa45070a2e59a Mark Rutland   2018-09-04  1198  		if (unlikely(c == u))
9fa45070a2e59a Mark Rutland   2018-09-04  1199  			break;
9fa45070a2e59a Mark Rutland   2018-09-04  1200  	} while (!atomic_try_cmpxchg(v, &c, c + a));
9fa45070a2e59a Mark Rutland   2018-09-04  1201  
9fa45070a2e59a Mark Rutland   2018-09-04  1202  	return c;
9fa45070a2e59a Mark Rutland   2018-09-04  1203  }
9fa45070a2e59a Mark Rutland   2018-09-04  1204  #define atomic_fetch_add_unless atomic_fetch_add_unless
9fa45070a2e59a Mark Rutland   2018-09-04  1205  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  1206  

:::::: The code at line 1017 was first introduced by commit
:::::: 9fa45070a2e59a871e1cd3370173369f3a4f61e2 locking/atomics: Switch to generated fallbacks

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
