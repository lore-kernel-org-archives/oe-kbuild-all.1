Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669271C3C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 05:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688706354; x=1720242354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j6Ay2i+jlU0sMBKiHNks7TMvYksZIQXPx/dciJGPJj0=;
  b=EFUvWEBKkLy6lSTfjxPkyePgdXz37DIo5WTi0nviU1tKuJ/FGP0Zy3Xz
   oAjkGZ3WndNkzuVoZaEDIBxQ55zRQEuReM1KPAGUSk+gm7SIr9JcjXwtT
   qnhz+B/1/u8FFoSjIgPntruWUeQp/yzlpx3WOTz4XFltPo4TLe3GI9USj
   6/YWi6jdP88c8EfPM5JZZuNdE+D8J6xb+kWrZq4nB4zVgVg0uUZXO9I4z
   Mnx1prIKX5jO/NzSAKMnry7kLAWINcUwiGAVWWvzEfLU+DfUAyDjQRTI9
   jemLpIgEARbco1oepmxp6cJxPy8DtBXhlWdpCQHvr6gLFnx6KTRjukTej
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="344135972"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="344135972"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 22:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="966490959"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="966490959"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2023 22:05:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHdfD-0001mk-0r;
	Fri, 07 Jul 2023 05:05:51 +0000
Date: Fri, 7 Jul 2023 13:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 40/224]
 include/linux/atomic-fallback.h:2419:17: error: implicit declaration of
 function 'atomic64_read'; did you mean 'atomic64_dec'?
Message-ID: <202307071309.oQ0Gg08H-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230707/202307071309.oQ0Gg08H-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071309.oQ0Gg08H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071309.oQ0Gg08H-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~
         |         atomic_inc
   include/linux/atomic-fallback.h: In function 'atomic_inc_return':
   include/linux/atomic-fallback.h:323:16: error: implicit declaration of function 'atomic_add_return'; did you mean 'atomic_inc_return'? [-Werror=implicit-function-declaration]
     323 |         return atomic_add_return(1, v);
         |                ^~~~~~~~~~~~~~~~~
         |                atomic_inc_return
   include/linux/atomic-fallback.h: In function 'atomic_fetch_inc':
   include/linux/atomic-fallback.h:409:16: error: implicit declaration of function 'atomic_fetch_add'; did you mean 'atomic_fetch_inc'? [-Werror=implicit-function-declaration]
     409 |         return atomic_fetch_add(1, v);
         |                ^~~~~~~~~~~~~~~~
         |                atomic_fetch_inc
   include/linux/atomic-fallback.h: In function 'atomic_dec':
   include/linux/atomic-fallback.h:485:9: error: implicit declaration of function 'atomic_sub'; did you mean 'atomic_dec'? [-Werror=implicit-function-declaration]
     485 |         atomic_sub(1, v);
         |         ^~~~~~~~~~
         |         atomic_dec
   include/linux/atomic-fallback.h: In function 'atomic_dec_return':
   include/linux/atomic-fallback.h:506:16: error: implicit declaration of function 'atomic_sub_return'; did you mean 'atomic_dec_return'? [-Werror=implicit-function-declaration]
     506 |         return atomic_sub_return(1, v);
         |                ^~~~~~~~~~~~~~~~~
         |                atomic_dec_return
   include/linux/atomic-fallback.h: In function 'atomic_fetch_dec':
   include/linux/atomic-fallback.h:592:16: error: implicit declaration of function 'atomic_fetch_sub'; did you mean 'atomic_fetch_dec'? [-Werror=implicit-function-declaration]
     592 |         return atomic_fetch_sub(1, v);
         |                ^~~~~~~~~~~~~~~~
         |                atomic_fetch_dec
   include/linux/atomic-fallback.h: At top level:
   include/linux/atomic-fallback.h:667: warning: "arch_atomic_fetch_and_relaxed" redefined
     667 | #define arch_atomic_fetch_and_relaxed atomic_fetch_and_relaxed
         | 
   arch/arm/include/asm/atomic.h:101: note: this is the location of the previous definition
     101 | #define arch_atomic_fetch_and_relaxed           arch_atomic_fetch_and_relaxed
         | 
   include/linux/atomic-fallback.h:711: warning: "arch_atomic_andnot" redefined
     711 | #define arch_atomic_andnot atomic_andnot
         | 
   arch/arm/include/asm/atomic.h:226: note: this is the location of the previous definition
     226 | #define arch_atomic_andnot arch_atomic_andnot
         | 
   include/linux/atomic-fallback.h: In function 'atomic_andnot':
   include/linux/atomic-fallback.h:717:9: error: implicit declaration of function 'atomic_and'; did you mean 'atomic_inc'? [-Werror=implicit-function-declaration]
     717 |         atomic_and(~i, v);
         |         ^~~~~~~~~~
         |         atomic_inc
   include/linux/atomic-fallback.h: At top level:
   include/linux/atomic-fallback.h:725: warning: "arch_atomic_fetch_andnot_relaxed" redefined
     725 | #define arch_atomic_fetch_andnot_relaxed atomic_fetch_andnot_relaxed
         | 
   arch/arm/include/asm/atomic.h:102: note: this is the location of the previous definition
     102 | #define arch_atomic_fetch_andnot_relaxed        arch_atomic_fetch_andnot_relaxed
         | 
   include/linux/atomic-fallback.h: In function 'atomic_fetch_andnot':
   include/linux/atomic-fallback.h:738:16: error: implicit declaration of function 'atomic_fetch_and'; did you mean 'atomic_fetch_inc'? [-Werror=implicit-function-declaration]
     738 |         return atomic_fetch_and(~i, v);
         |                ^~~~~~~~~~~~~~~~
         |                atomic_fetch_inc
   include/linux/atomic-fallback.h: At top level:
   include/linux/atomic-fallback.h:813: warning: "arch_atomic_fetch_or_relaxed" redefined
     813 | #define arch_atomic_fetch_or_relaxed atomic_fetch_or_relaxed
         | 
   arch/arm/include/asm/atomic.h:103: note: this is the location of the previous definition
     103 | #define arch_atomic_fetch_or_relaxed            arch_atomic_fetch_or_relaxed
         | 
   include/linux/atomic-fallback.h:862: warning: "arch_atomic_fetch_xor_relaxed" redefined
     862 | #define arch_atomic_fetch_xor_relaxed atomic_fetch_xor_relaxed
         | 
   arch/arm/include/asm/atomic.h:104: note: this is the location of the previous definition
     104 | #define arch_atomic_fetch_xor_relaxed           arch_atomic_fetch_xor_relaxed
         | 
   include/linux/atomic-fallback.h:906: warning: "arch_atomic_xchg" redefined
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
   include/linux/atomic-fallback.h: At top level:
>> include/linux/atomic-fallback.h:1333: warning: "arch_atomic64_add_return_relaxed" redefined
    1333 | #define arch_atomic64_add_return_relaxed atomic64_add_return_relaxed
         | 
   arch/arm/include/asm/atomic.h:377: note: this is the location of the previous definition
     377 | #define arch_atomic64_add_return_relaxed        arch_atomic64_add_return_relaxed
         | 
>> include/linux/atomic-fallback.h:1380: warning: "arch_atomic64_fetch_add_relaxed" redefined
    1380 | #define arch_atomic64_fetch_add_relaxed atomic64_fetch_add_relaxed
         | 
   arch/arm/include/asm/atomic.h:379: note: this is the location of the previous definition
     379 | #define arch_atomic64_fetch_add_relaxed         arch_atomic64_fetch_add_relaxed
         | 
>> include/linux/atomic-fallback.h:1429: warning: "arch_atomic64_sub_return_relaxed" redefined
    1429 | #define arch_atomic64_sub_return_relaxed atomic64_sub_return_relaxed
         | 
   arch/arm/include/asm/atomic.h:378: note: this is the location of the previous definition
     378 | #define arch_atomic64_sub_return_relaxed        arch_atomic64_sub_return_relaxed
         | 
>> include/linux/atomic-fallback.h:1476: warning: "arch_atomic64_fetch_sub_relaxed" redefined
    1476 | #define arch_atomic64_fetch_sub_relaxed atomic64_fetch_sub_relaxed
         | 
   arch/arm/include/asm/atomic.h:380: note: this is the location of the previous definition
     380 | #define arch_atomic64_fetch_sub_relaxed         arch_atomic64_fetch_sub_relaxed
         | 
   include/linux/atomic-fallback.h: In function 'atomic64_inc':
>> include/linux/atomic-fallback.h:1526:9: error: implicit declaration of function 'atomic64_add'; did you mean 'atomic64_inc'? [-Werror=implicit-function-declaration]
    1526 |         atomic64_add(1, v);
         |         ^~~~~~~~~~~~
         |         atomic64_inc
   include/linux/atomic-fallback.h: In function 'atomic64_inc_return':
>> include/linux/atomic-fallback.h:1547:16: error: implicit declaration of function 'atomic64_add_return'; did you mean 'atomic64_inc_return'? [-Werror=implicit-function-declaration]
    1547 |         return atomic64_add_return(1, v);
         |                ^~~~~~~~~~~~~~~~~~~
         |                atomic64_inc_return
   include/linux/atomic-fallback.h: In function 'atomic64_fetch_inc':
>> include/linux/atomic-fallback.h:1633:16: error: implicit declaration of function 'atomic64_fetch_add'; did you mean 'atomic64_fetch_inc'? [-Werror=implicit-function-declaration]
    1633 |         return atomic64_fetch_add(1, v);
         |                ^~~~~~~~~~~~~~~~~~
         |                atomic64_fetch_inc
   include/linux/atomic-fallback.h: In function 'atomic64_dec':
>> include/linux/atomic-fallback.h:1709:9: error: implicit declaration of function 'atomic64_sub'; did you mean 'atomic64_dec'? [-Werror=implicit-function-declaration]
    1709 |         atomic64_sub(1, v);
         |         ^~~~~~~~~~~~
         |         atomic64_dec
   include/linux/atomic-fallback.h: In function 'atomic64_dec_return':
>> include/linux/atomic-fallback.h:1730:16: error: implicit declaration of function 'atomic64_sub_return'; did you mean 'atomic64_dec_return'? [-Werror=implicit-function-declaration]
    1730 |         return atomic64_sub_return(1, v);
         |                ^~~~~~~~~~~~~~~~~~~
         |                atomic64_dec_return
   include/linux/atomic-fallback.h: In function 'atomic64_fetch_dec':
>> include/linux/atomic-fallback.h:1816:16: error: implicit declaration of function 'atomic64_fetch_sub'; did you mean 'atomic64_fetch_dec'? [-Werror=implicit-function-declaration]
    1816 |         return atomic64_fetch_sub(1, v);
         |                ^~~~~~~~~~~~~~~~~~
         |                atomic64_fetch_dec
   include/linux/atomic-fallback.h: At top level:
>> include/linux/atomic-fallback.h:1891: warning: "arch_atomic64_fetch_and_relaxed" redefined
    1891 | #define arch_atomic64_fetch_and_relaxed atomic64_fetch_and_relaxed
         | 
   arch/arm/include/asm/atomic.h:394: note: this is the location of the previous definition
     394 | #define arch_atomic64_fetch_and_relaxed         arch_atomic64_fetch_and_relaxed
         | 
>> include/linux/atomic-fallback.h:1935: warning: "arch_atomic64_andnot" redefined
    1935 | #define arch_atomic64_andnot atomic64_andnot
         | 
   arch/arm/include/asm/atomic.h:387: note: this is the location of the previous definition
     387 | #define arch_atomic64_andnot arch_atomic64_andnot
         | 
   include/linux/atomic-fallback.h: In function 'atomic64_andnot':
>> include/linux/atomic-fallback.h:1941:9: error: implicit declaration of function 'atomic64_and'; did you mean 'atomic64_inc'? [-Werror=implicit-function-declaration]
    1941 |         atomic64_and(~i, v);
         |         ^~~~~~~~~~~~
         |         atomic64_inc
   include/linux/atomic-fallback.h: At top level:
>> include/linux/atomic-fallback.h:1949: warning: "arch_atomic64_fetch_andnot_relaxed" redefined
    1949 | #define arch_atomic64_fetch_andnot_relaxed atomic64_fetch_andnot_relaxed
         | 
   arch/arm/include/asm/atomic.h:395: note: this is the location of the previous definition
     395 | #define arch_atomic64_fetch_andnot_relaxed      arch_atomic64_fetch_andnot_relaxed
         | 
   include/linux/atomic-fallback.h: In function 'atomic64_fetch_andnot':
>> include/linux/atomic-fallback.h:1962:16: error: implicit declaration of function 'atomic64_fetch_and'; did you mean 'atomic64_fetch_inc'? [-Werror=implicit-function-declaration]
    1962 |         return atomic64_fetch_and(~i, v);
         |                ^~~~~~~~~~~~~~~~~~
         |                atomic64_fetch_inc
   include/linux/atomic-fallback.h: At top level:
>> include/linux/atomic-fallback.h:2037: warning: "arch_atomic64_fetch_or_relaxed" redefined
    2037 | #define arch_atomic64_fetch_or_relaxed atomic64_fetch_or_relaxed
         | 
   arch/arm/include/asm/atomic.h:396: note: this is the location of the previous definition
     396 | #define arch_atomic64_fetch_or_relaxed          arch_atomic64_fetch_or_relaxed
         | 
>> include/linux/atomic-fallback.h:2086: warning: "arch_atomic64_fetch_xor_relaxed" redefined
    2086 | #define arch_atomic64_fetch_xor_relaxed atomic64_fetch_xor_relaxed
         | 
   arch/arm/include/asm/atomic.h:397: note: this is the location of the previous definition
     397 | #define arch_atomic64_fetch_xor_relaxed         arch_atomic64_fetch_xor_relaxed
         | 
>> include/linux/atomic-fallback.h:2133: warning: "arch_atomic64_xchg_relaxed" redefined
    2133 | #define arch_atomic64_xchg_relaxed atomic64_xchg_relaxed
         | 
   arch/arm/include/asm/atomic.h:445: note: this is the location of the previous definition
     445 | #define arch_atomic64_xchg_relaxed              arch_atomic64_xchg_relaxed
         | 
>> include/linux/atomic-fallback.h:2180: warning: "arch_atomic64_cmpxchg_relaxed" redefined
    2180 | #define arch_atomic64_cmpxchg_relaxed atomic64_cmpxchg_relaxed
         | 
   arch/arm/include/asm/atomic.h:425: note: this is the location of the previous definition
     425 | #define arch_atomic64_cmpxchg_relaxed   arch_atomic64_cmpxchg_relaxed
         | 
   include/linux/atomic-fallback.h: In function 'atomic64_try_cmpxchg':
>> include/linux/atomic-fallback.h:2241:13: error: implicit declaration of function 'atomic64_cmpxchg'; did you mean 'atomic64_try_cmpxchg'? [-Werror=implicit-function-declaration]
    2241 |         r = atomic64_cmpxchg(v, o, new);
         |             ^~~~~~~~~~~~~~~~
         |             atomic64_try_cmpxchg
   include/linux/atomic-fallback.h: At top level:
   include/linux/atomic-fallback.h:2404: warning: "arch_atomic64_fetch_add_unless" redefined
    2404 | #define arch_atomic64_fetch_add_unless atomic64_fetch_add_unless
         | 
   arch/arm/include/asm/atomic.h:503: note: this is the location of the previous definition
     503 | #define arch_atomic64_fetch_add_unless arch_atomic64_fetch_add_unless
         | 
   include/linux/atomic-fallback.h: In function 'atomic64_fetch_add_unless':
   include/linux/atomic-fallback.h:2419:17: error: implicit declaration of function 'atomic64_read'; did you mean 'atomic64_dec'? [-Werror=implicit-function-declaration]
    2419 |         s64 c = atomic64_read(v);
         |                 ^~~~~~~~~~~~~
         |                 atomic64_dec
   include/linux/atomic-fallback.h: At top level:
   include/linux/atomic-fallback.h:2505: warning: "arch_atomic64_dec_if_positive" redefined
    2505 | #define arch_atomic64_dec_if_positive atomic64_dec_if_positive
         | 
   arch/arm/include/asm/atomic.h:473: note: this is the location of the previous definition
     473 | #define arch_atomic64_dec_if_positive arch_atomic64_dec_if_positive
         | 
   In file included from include/linux/atomic.h:87:
   include/asm-generic/atomic-long.h: In function 'atomic_long_set':
   include/asm-generic/atomic-long.h:535:9: error: implicit declaration of function 'atomic_set'; did you mean 'atomic_dec'? [-Werror=implicit-function-declaration]
     535 |         atomic_set(v, i);
         |         ^~~~~~~~~~
         |         atomic_dec
   include/asm-generic/atomic-long.h: In function 'atomic_long_or':
   include/asm-generic/atomic-long.h:823:9: error: implicit declaration of function 'atomic_or'; did you mean 'atomic_dec'? [-Werror=implicit-function-declaration]
     823 |         atomic_or(i, v);
         |         ^~~~~~~~~
         |         atomic_dec
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_or':
   include/asm-generic/atomic-long.h:829:16: error: implicit declaration of function 'atomic_fetch_or'; did you mean 'atomic_fetch_dec'? [-Werror=implicit-function-declaration]
     829 |         return atomic_fetch_or(i, v);
         |                ^~~~~~~~~~~~~~~
         |                atomic_fetch_dec
   include/asm-generic/atomic-long.h: In function 'atomic_long_xor':
   include/asm-generic/atomic-long.h:853:9: error: implicit declaration of function 'atomic_xor'; did you mean 'atomic_dec'? [-Werror=implicit-function-declaration]
     853 |         atomic_xor(i, v);
         |         ^~~~~~~~~~
         |         atomic_dec
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_xor':
   include/asm-generic/atomic-long.h:859:16: error: implicit declaration of function 'atomic_fetch_xor'; did you mean 'atomic_fetch_dec'? [-Werror=implicit-function-declaration]
     859 |         return atomic_fetch_xor(i, v);
         |                ^~~~~~~~~~~~~~~~
         |                atomic_fetch_dec
   include/asm-generic/atomic-long.h: In function 'atomic_long_xchg':
   include/asm-generic/atomic-long.h:883:16: error: implicit declaration of function 'atomic_xchg' [-Werror=implicit-function-declaration]
     883 |         return atomic_xchg(v, i);
         |                ^~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1243: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:192: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +2419 include/linux/atomic-fallback.h

9fa45070a2e59a Mark Rutland   2018-09-04  2235  
9fa45070a2e59a Mark Rutland   2018-09-04  2236  #ifndef atomic64_try_cmpxchg
765dcd209947e7 Marco Elver    2019-11-26  2237  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2238  atomic64_try_cmpxchg(atomic64_t *v, s64 *old, s64 new)
9fa45070a2e59a Mark Rutland   2018-09-04  2239  {
9fa45070a2e59a Mark Rutland   2018-09-04  2240  	s64 r, o = *old;
9fa45070a2e59a Mark Rutland   2018-09-04 @2241  	r = atomic64_cmpxchg(v, o, new);
9fa45070a2e59a Mark Rutland   2018-09-04  2242  	if (unlikely(r != o))
9fa45070a2e59a Mark Rutland   2018-09-04  2243  		*old = r;
9fa45070a2e59a Mark Rutland   2018-09-04  2244  	return likely(r == o);
9fa45070a2e59a Mark Rutland   2018-09-04  2245  }
9fa45070a2e59a Mark Rutland   2018-09-04  2246  #define atomic64_try_cmpxchg atomic64_try_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04  2247  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2248  
9fa45070a2e59a Mark Rutland   2018-09-04  2249  #ifndef atomic64_try_cmpxchg_acquire
765dcd209947e7 Marco Elver    2019-11-26  2250  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2251  atomic64_try_cmpxchg_acquire(atomic64_t *v, s64 *old, s64 new)
9fa45070a2e59a Mark Rutland   2018-09-04  2252  {
9fa45070a2e59a Mark Rutland   2018-09-04  2253  	s64 r, o = *old;
9fa45070a2e59a Mark Rutland   2018-09-04  2254  	r = atomic64_cmpxchg_acquire(v, o, new);
9fa45070a2e59a Mark Rutland   2018-09-04  2255  	if (unlikely(r != o))
9fa45070a2e59a Mark Rutland   2018-09-04  2256  		*old = r;
9fa45070a2e59a Mark Rutland   2018-09-04  2257  	return likely(r == o);
9fa45070a2e59a Mark Rutland   2018-09-04  2258  }
9fa45070a2e59a Mark Rutland   2018-09-04  2259  #define atomic64_try_cmpxchg_acquire atomic64_try_cmpxchg_acquire
9fa45070a2e59a Mark Rutland   2018-09-04  2260  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2261  
9fa45070a2e59a Mark Rutland   2018-09-04  2262  #ifndef atomic64_try_cmpxchg_release
765dcd209947e7 Marco Elver    2019-11-26  2263  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2264  atomic64_try_cmpxchg_release(atomic64_t *v, s64 *old, s64 new)
9fa45070a2e59a Mark Rutland   2018-09-04  2265  {
9fa45070a2e59a Mark Rutland   2018-09-04  2266  	s64 r, o = *old;
9fa45070a2e59a Mark Rutland   2018-09-04  2267  	r = atomic64_cmpxchg_release(v, o, new);
9fa45070a2e59a Mark Rutland   2018-09-04  2268  	if (unlikely(r != o))
9fa45070a2e59a Mark Rutland   2018-09-04  2269  		*old = r;
9fa45070a2e59a Mark Rutland   2018-09-04  2270  	return likely(r == o);
9fa45070a2e59a Mark Rutland   2018-09-04  2271  }
9fa45070a2e59a Mark Rutland   2018-09-04  2272  #define atomic64_try_cmpxchg_release atomic64_try_cmpxchg_release
9fa45070a2e59a Mark Rutland   2018-09-04  2273  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2274  
9fa45070a2e59a Mark Rutland   2018-09-04  2275  #ifndef atomic64_try_cmpxchg_relaxed
765dcd209947e7 Marco Elver    2019-11-26  2276  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2277  atomic64_try_cmpxchg_relaxed(atomic64_t *v, s64 *old, s64 new)
9fa45070a2e59a Mark Rutland   2018-09-04  2278  {
9fa45070a2e59a Mark Rutland   2018-09-04  2279  	s64 r, o = *old;
9fa45070a2e59a Mark Rutland   2018-09-04  2280  	r = atomic64_cmpxchg_relaxed(v, o, new);
9fa45070a2e59a Mark Rutland   2018-09-04  2281  	if (unlikely(r != o))
9fa45070a2e59a Mark Rutland   2018-09-04  2282  		*old = r;
9fa45070a2e59a Mark Rutland   2018-09-04  2283  	return likely(r == o);
9fa45070a2e59a Mark Rutland   2018-09-04  2284  }
9fa45070a2e59a Mark Rutland   2018-09-04  2285  #define atomic64_try_cmpxchg_relaxed atomic64_try_cmpxchg_relaxed
9fa45070a2e59a Mark Rutland   2018-09-04  2286  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2287  
9fa45070a2e59a Mark Rutland   2018-09-04  2288  #else /* atomic64_try_cmpxchg_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04  2289  
9fa45070a2e59a Mark Rutland   2018-09-04  2290  #ifndef atomic64_try_cmpxchg_acquire
765dcd209947e7 Marco Elver    2019-11-26  2291  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2292  atomic64_try_cmpxchg_acquire(atomic64_t *v, s64 *old, s64 new)
9fa45070a2e59a Mark Rutland   2018-09-04  2293  {
9fa45070a2e59a Mark Rutland   2018-09-04  2294  	bool ret = atomic64_try_cmpxchg_relaxed(v, old, new);
9fa45070a2e59a Mark Rutland   2018-09-04  2295  	__atomic_acquire_fence();
9fa45070a2e59a Mark Rutland   2018-09-04  2296  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04  2297  }
9fa45070a2e59a Mark Rutland   2018-09-04  2298  #define atomic64_try_cmpxchg_acquire atomic64_try_cmpxchg_acquire
9fa45070a2e59a Mark Rutland   2018-09-04  2299  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2300  
9fa45070a2e59a Mark Rutland   2018-09-04  2301  #ifndef atomic64_try_cmpxchg_release
765dcd209947e7 Marco Elver    2019-11-26  2302  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2303  atomic64_try_cmpxchg_release(atomic64_t *v, s64 *old, s64 new)
9fa45070a2e59a Mark Rutland   2018-09-04  2304  {
9fa45070a2e59a Mark Rutland   2018-09-04  2305  	__atomic_release_fence();
9fa45070a2e59a Mark Rutland   2018-09-04  2306  	return atomic64_try_cmpxchg_relaxed(v, old, new);
9fa45070a2e59a Mark Rutland   2018-09-04  2307  }
9fa45070a2e59a Mark Rutland   2018-09-04  2308  #define atomic64_try_cmpxchg_release atomic64_try_cmpxchg_release
9fa45070a2e59a Mark Rutland   2018-09-04  2309  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2310  
9fa45070a2e59a Mark Rutland   2018-09-04  2311  #ifndef atomic64_try_cmpxchg
765dcd209947e7 Marco Elver    2019-11-26  2312  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2313  atomic64_try_cmpxchg(atomic64_t *v, s64 *old, s64 new)
9fa45070a2e59a Mark Rutland   2018-09-04  2314  {
9fa45070a2e59a Mark Rutland   2018-09-04  2315  	bool ret;
9fa45070a2e59a Mark Rutland   2018-09-04  2316  	__atomic_pre_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04  2317  	ret = atomic64_try_cmpxchg_relaxed(v, old, new);
9fa45070a2e59a Mark Rutland   2018-09-04  2318  	__atomic_post_full_fence();
9fa45070a2e59a Mark Rutland   2018-09-04  2319  	return ret;
9fa45070a2e59a Mark Rutland   2018-09-04  2320  }
9fa45070a2e59a Mark Rutland   2018-09-04  2321  #define atomic64_try_cmpxchg atomic64_try_cmpxchg
9fa45070a2e59a Mark Rutland   2018-09-04  2322  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2323  
9fa45070a2e59a Mark Rutland   2018-09-04  2324  #endif /* atomic64_try_cmpxchg_relaxed */
9fa45070a2e59a Mark Rutland   2018-09-04  2325  
5faafd5685764e Peter Zijlstra 2020-06-25  2326  #define arch_atomic64_sub_and_test atomic64_sub_and_test
5faafd5685764e Peter Zijlstra 2020-06-25  2327  
9fa45070a2e59a Mark Rutland   2018-09-04  2328  #ifndef atomic64_sub_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  2329  /**
9fa45070a2e59a Mark Rutland   2018-09-04  2330   * atomic64_sub_and_test - subtract value from variable and test result
9fa45070a2e59a Mark Rutland   2018-09-04  2331   * @i: integer value to subtract
9fa45070a2e59a Mark Rutland   2018-09-04  2332   * @v: pointer of type atomic64_t
9fa45070a2e59a Mark Rutland   2018-09-04  2333   *
9fa45070a2e59a Mark Rutland   2018-09-04  2334   * Atomically subtracts @i from @v and returns
9fa45070a2e59a Mark Rutland   2018-09-04  2335   * true if the result is zero, or false for all
9fa45070a2e59a Mark Rutland   2018-09-04  2336   * other cases.
9fa45070a2e59a Mark Rutland   2018-09-04  2337   */
765dcd209947e7 Marco Elver    2019-11-26  2338  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2339  atomic64_sub_and_test(s64 i, atomic64_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  2340  {
9fa45070a2e59a Mark Rutland   2018-09-04  2341  	return atomic64_sub_return(i, v) == 0;
9fa45070a2e59a Mark Rutland   2018-09-04  2342  }
9fa45070a2e59a Mark Rutland   2018-09-04  2343  #define atomic64_sub_and_test atomic64_sub_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  2344  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2345  
5faafd5685764e Peter Zijlstra 2020-06-25  2346  #define arch_atomic64_dec_and_test atomic64_dec_and_test
5faafd5685764e Peter Zijlstra 2020-06-25  2347  
9fa45070a2e59a Mark Rutland   2018-09-04  2348  #ifndef atomic64_dec_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  2349  /**
9fa45070a2e59a Mark Rutland   2018-09-04  2350   * atomic64_dec_and_test - decrement and test
9fa45070a2e59a Mark Rutland   2018-09-04  2351   * @v: pointer of type atomic64_t
9fa45070a2e59a Mark Rutland   2018-09-04  2352   *
9fa45070a2e59a Mark Rutland   2018-09-04  2353   * Atomically decrements @v by 1 and
9fa45070a2e59a Mark Rutland   2018-09-04  2354   * returns true if the result is 0, or false for all other
9fa45070a2e59a Mark Rutland   2018-09-04  2355   * cases.
9fa45070a2e59a Mark Rutland   2018-09-04  2356   */
765dcd209947e7 Marco Elver    2019-11-26  2357  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2358  atomic64_dec_and_test(atomic64_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  2359  {
9fa45070a2e59a Mark Rutland   2018-09-04  2360  	return atomic64_dec_return(v) == 0;
9fa45070a2e59a Mark Rutland   2018-09-04  2361  }
9fa45070a2e59a Mark Rutland   2018-09-04  2362  #define atomic64_dec_and_test atomic64_dec_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  2363  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2364  
5faafd5685764e Peter Zijlstra 2020-06-25  2365  #define arch_atomic64_inc_and_test atomic64_inc_and_test
5faafd5685764e Peter Zijlstra 2020-06-25  2366  
9fa45070a2e59a Mark Rutland   2018-09-04  2367  #ifndef atomic64_inc_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  2368  /**
9fa45070a2e59a Mark Rutland   2018-09-04  2369   * atomic64_inc_and_test - increment and test
9fa45070a2e59a Mark Rutland   2018-09-04  2370   * @v: pointer of type atomic64_t
9fa45070a2e59a Mark Rutland   2018-09-04  2371   *
9fa45070a2e59a Mark Rutland   2018-09-04  2372   * Atomically increments @v by 1
9fa45070a2e59a Mark Rutland   2018-09-04  2373   * and returns true if the result is zero, or false for all
9fa45070a2e59a Mark Rutland   2018-09-04  2374   * other cases.
9fa45070a2e59a Mark Rutland   2018-09-04  2375   */
765dcd209947e7 Marco Elver    2019-11-26  2376  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2377  atomic64_inc_and_test(atomic64_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  2378  {
9fa45070a2e59a Mark Rutland   2018-09-04  2379  	return atomic64_inc_return(v) == 0;
9fa45070a2e59a Mark Rutland   2018-09-04  2380  }
9fa45070a2e59a Mark Rutland   2018-09-04  2381  #define atomic64_inc_and_test atomic64_inc_and_test
9fa45070a2e59a Mark Rutland   2018-09-04  2382  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2383  
5faafd5685764e Peter Zijlstra 2020-06-25  2384  #define arch_atomic64_add_negative atomic64_add_negative
5faafd5685764e Peter Zijlstra 2020-06-25  2385  
9fa45070a2e59a Mark Rutland   2018-09-04  2386  #ifndef atomic64_add_negative
9fa45070a2e59a Mark Rutland   2018-09-04  2387  /**
9fa45070a2e59a Mark Rutland   2018-09-04  2388   * atomic64_add_negative - add and test if negative
9fa45070a2e59a Mark Rutland   2018-09-04  2389   * @i: integer value to add
9fa45070a2e59a Mark Rutland   2018-09-04  2390   * @v: pointer of type atomic64_t
9fa45070a2e59a Mark Rutland   2018-09-04  2391   *
9fa45070a2e59a Mark Rutland   2018-09-04  2392   * Atomically adds @i to @v and returns true
9fa45070a2e59a Mark Rutland   2018-09-04  2393   * if the result is negative, or false when
9fa45070a2e59a Mark Rutland   2018-09-04  2394   * result is greater than or equal to zero.
9fa45070a2e59a Mark Rutland   2018-09-04  2395   */
765dcd209947e7 Marco Elver    2019-11-26  2396  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2397  atomic64_add_negative(s64 i, atomic64_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  2398  {
9fa45070a2e59a Mark Rutland   2018-09-04  2399  	return atomic64_add_return(i, v) < 0;
9fa45070a2e59a Mark Rutland   2018-09-04  2400  }
9fa45070a2e59a Mark Rutland   2018-09-04  2401  #define atomic64_add_negative atomic64_add_negative
9fa45070a2e59a Mark Rutland   2018-09-04  2402  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2403  
5faafd5685764e Peter Zijlstra 2020-06-25 @2404  #define arch_atomic64_fetch_add_unless atomic64_fetch_add_unless
5faafd5685764e Peter Zijlstra 2020-06-25  2405  
9fa45070a2e59a Mark Rutland   2018-09-04  2406  #ifndef atomic64_fetch_add_unless
9fa45070a2e59a Mark Rutland   2018-09-04  2407  /**
9fa45070a2e59a Mark Rutland   2018-09-04  2408   * atomic64_fetch_add_unless - add unless the number is already a given value
9fa45070a2e59a Mark Rutland   2018-09-04  2409   * @v: pointer of type atomic64_t
9fa45070a2e59a Mark Rutland   2018-09-04  2410   * @a: the amount to add to v...
9fa45070a2e59a Mark Rutland   2018-09-04  2411   * @u: ...unless v is equal to u.
9fa45070a2e59a Mark Rutland   2018-09-04  2412   *
9fa45070a2e59a Mark Rutland   2018-09-04  2413   * Atomically adds @a to @v, so long as @v was not already @u.
9fa45070a2e59a Mark Rutland   2018-09-04  2414   * Returns original value of @v
9fa45070a2e59a Mark Rutland   2018-09-04  2415   */
765dcd209947e7 Marco Elver    2019-11-26  2416  static __always_inline s64
9fa45070a2e59a Mark Rutland   2018-09-04  2417  atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
9fa45070a2e59a Mark Rutland   2018-09-04  2418  {
9fa45070a2e59a Mark Rutland   2018-09-04 @2419  	s64 c = atomic64_read(v);
9fa45070a2e59a Mark Rutland   2018-09-04  2420  
9fa45070a2e59a Mark Rutland   2018-09-04  2421  	do {
9fa45070a2e59a Mark Rutland   2018-09-04  2422  		if (unlikely(c == u))
9fa45070a2e59a Mark Rutland   2018-09-04  2423  			break;
9fa45070a2e59a Mark Rutland   2018-09-04  2424  	} while (!atomic64_try_cmpxchg(v, &c, c + a));
9fa45070a2e59a Mark Rutland   2018-09-04  2425  
9fa45070a2e59a Mark Rutland   2018-09-04  2426  	return c;
9fa45070a2e59a Mark Rutland   2018-09-04  2427  }
9fa45070a2e59a Mark Rutland   2018-09-04  2428  #define atomic64_fetch_add_unless atomic64_fetch_add_unless
9fa45070a2e59a Mark Rutland   2018-09-04  2429  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2430  
5faafd5685764e Peter Zijlstra 2020-06-25  2431  #define arch_atomic64_add_unless atomic64_add_unless
5faafd5685764e Peter Zijlstra 2020-06-25  2432  
9fa45070a2e59a Mark Rutland   2018-09-04  2433  #ifndef atomic64_add_unless
9fa45070a2e59a Mark Rutland   2018-09-04  2434  /**
9fa45070a2e59a Mark Rutland   2018-09-04  2435   * atomic64_add_unless - add unless the number is already a given value
9fa45070a2e59a Mark Rutland   2018-09-04  2436   * @v: pointer of type atomic64_t
9fa45070a2e59a Mark Rutland   2018-09-04  2437   * @a: the amount to add to v...
9fa45070a2e59a Mark Rutland   2018-09-04  2438   * @u: ...unless v is equal to u.
9fa45070a2e59a Mark Rutland   2018-09-04  2439   *
9fa45070a2e59a Mark Rutland   2018-09-04  2440   * Atomically adds @a to @v, if @v was not already @u.
9fa45070a2e59a Mark Rutland   2018-09-04  2441   * Returns true if the addition was done.
9fa45070a2e59a Mark Rutland   2018-09-04  2442   */
765dcd209947e7 Marco Elver    2019-11-26  2443  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2444  atomic64_add_unless(atomic64_t *v, s64 a, s64 u)
9fa45070a2e59a Mark Rutland   2018-09-04  2445  {
9fa45070a2e59a Mark Rutland   2018-09-04  2446  	return atomic64_fetch_add_unless(v, a, u) != u;
9fa45070a2e59a Mark Rutland   2018-09-04  2447  }
9fa45070a2e59a Mark Rutland   2018-09-04  2448  #define atomic64_add_unless atomic64_add_unless
9fa45070a2e59a Mark Rutland   2018-09-04  2449  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2450  
5faafd5685764e Peter Zijlstra 2020-06-25  2451  #define arch_atomic64_inc_not_zero atomic64_inc_not_zero
5faafd5685764e Peter Zijlstra 2020-06-25  2452  
9fa45070a2e59a Mark Rutland   2018-09-04  2453  #ifndef atomic64_inc_not_zero
9fa45070a2e59a Mark Rutland   2018-09-04  2454  /**
9fa45070a2e59a Mark Rutland   2018-09-04  2455   * atomic64_inc_not_zero - increment unless the number is zero
9fa45070a2e59a Mark Rutland   2018-09-04  2456   * @v: pointer of type atomic64_t
9fa45070a2e59a Mark Rutland   2018-09-04  2457   *
9fa45070a2e59a Mark Rutland   2018-09-04  2458   * Atomically increments @v by 1, if @v is non-zero.
9fa45070a2e59a Mark Rutland   2018-09-04  2459   * Returns true if the increment was done.
9fa45070a2e59a Mark Rutland   2018-09-04  2460   */
765dcd209947e7 Marco Elver    2019-11-26  2461  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2462  atomic64_inc_not_zero(atomic64_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  2463  {
9fa45070a2e59a Mark Rutland   2018-09-04  2464  	return atomic64_add_unless(v, 1, 0);
9fa45070a2e59a Mark Rutland   2018-09-04  2465  }
9fa45070a2e59a Mark Rutland   2018-09-04  2466  #define atomic64_inc_not_zero atomic64_inc_not_zero
9fa45070a2e59a Mark Rutland   2018-09-04  2467  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2468  
5faafd5685764e Peter Zijlstra 2020-06-25  2469  #define arch_atomic64_inc_unless_negative atomic64_inc_unless_negative
5faafd5685764e Peter Zijlstra 2020-06-25  2470  
9fa45070a2e59a Mark Rutland   2018-09-04  2471  #ifndef atomic64_inc_unless_negative
765dcd209947e7 Marco Elver    2019-11-26  2472  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2473  atomic64_inc_unless_negative(atomic64_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  2474  {
9fa45070a2e59a Mark Rutland   2018-09-04  2475  	s64 c = atomic64_read(v);
9fa45070a2e59a Mark Rutland   2018-09-04  2476  
9fa45070a2e59a Mark Rutland   2018-09-04  2477  	do {
9fa45070a2e59a Mark Rutland   2018-09-04  2478  		if (unlikely(c < 0))
9fa45070a2e59a Mark Rutland   2018-09-04  2479  			return false;
9fa45070a2e59a Mark Rutland   2018-09-04  2480  	} while (!atomic64_try_cmpxchg(v, &c, c + 1));
9fa45070a2e59a Mark Rutland   2018-09-04  2481  
9fa45070a2e59a Mark Rutland   2018-09-04  2482  	return true;
9fa45070a2e59a Mark Rutland   2018-09-04  2483  }
9fa45070a2e59a Mark Rutland   2018-09-04  2484  #define atomic64_inc_unless_negative atomic64_inc_unless_negative
9fa45070a2e59a Mark Rutland   2018-09-04  2485  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2486  
5faafd5685764e Peter Zijlstra 2020-06-25  2487  #define arch_atomic64_dec_unless_positive atomic64_dec_unless_positive
5faafd5685764e Peter Zijlstra 2020-06-25  2488  
9fa45070a2e59a Mark Rutland   2018-09-04  2489  #ifndef atomic64_dec_unless_positive
765dcd209947e7 Marco Elver    2019-11-26  2490  static __always_inline bool
9fa45070a2e59a Mark Rutland   2018-09-04  2491  atomic64_dec_unless_positive(atomic64_t *v)
9fa45070a2e59a Mark Rutland   2018-09-04  2492  {
9fa45070a2e59a Mark Rutland   2018-09-04  2493  	s64 c = atomic64_read(v);
9fa45070a2e59a Mark Rutland   2018-09-04  2494  
9fa45070a2e59a Mark Rutland   2018-09-04  2495  	do {
9fa45070a2e59a Mark Rutland   2018-09-04  2496  		if (unlikely(c > 0))
9fa45070a2e59a Mark Rutland   2018-09-04  2497  			return false;
9fa45070a2e59a Mark Rutland   2018-09-04  2498  	} while (!atomic64_try_cmpxchg(v, &c, c - 1));
9fa45070a2e59a Mark Rutland   2018-09-04  2499  
9fa45070a2e59a Mark Rutland   2018-09-04  2500  	return true;
9fa45070a2e59a Mark Rutland   2018-09-04  2501  }
9fa45070a2e59a Mark Rutland   2018-09-04  2502  #define atomic64_dec_unless_positive atomic64_dec_unless_positive
9fa45070a2e59a Mark Rutland   2018-09-04  2503  #endif
9fa45070a2e59a Mark Rutland   2018-09-04  2504  
5faafd5685764e Peter Zijlstra 2020-06-25 @2505  #define arch_atomic64_dec_if_positive atomic64_dec_if_positive
5faafd5685764e Peter Zijlstra 2020-06-25  2506  

:::::: The code at line 2419 was first introduced by commit
:::::: 9fa45070a2e59a871e1cd3370173369f3a4f61e2 locking/atomics: Switch to generated fallbacks

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
