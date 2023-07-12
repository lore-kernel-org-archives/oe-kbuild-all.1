Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B951F95D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689185170; x=1720721170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9wFXPySwsOQl4cOpkmtF5aBH2nitwA99NJko0u2Y0Zg=;
  b=Ki6xwhg2opMvAF9IH09TmSgyDbnzWZH+33i+cMXyPaUi/oH7gfH4mV8t
   aID57adlkG04uRWyr2KmwcbOMEvMvHYl9XBle303NN81TryTziRGC/+EI
   pXMhRKDrGthmq+2NJjGdpYGchkb/AlPCEWEeN13HQo1B2tFDdJ3ODwQWm
   v3S9/H+zJSNKIY2P5gV2nzXf42RRFr/A7yZeRko6ny30IGUhbDzMaYIwB
   FeGlY9GtuEl8pWSezv3Hzb359smfiI1k5NS3Cf0GeBoztShUFtqG7rI75
   fFnKl9nl9pHfXIe6ylwfQer56cFaR42JSe25OgGc/ppqq8UQ2UjD0lOue
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="362431366"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="362431366"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 11:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895716999"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="895716999"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 11:06:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJeDz-0005u5-2Q;
	Wed, 12 Jul 2023 18:06:03 +0000
Date: Thu, 13 Jul 2023 02:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:net/defer-free 1/2]
 include/linux/atomic/atomic-arch-fallback.h:326:14: error: void value not
 ignored as it ought to be
Message-ID: <202307130107.GnUXIFII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux net/defer-free
head:   bc14c0e28995a8d2a7c5c481a90973553861cbe2
commit: c3205b3c22a6b7d0147dd98c1c0a4888436efe73 [1/2] net/core: lockless defer free
config: csky-randconfig-r032-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130107.GnUXIFII-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130107.GnUXIFII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130107.GnUXIFII-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/dev.c:90:
   include/linux/netdevice.h:3196:9: error: unknown type name 'u128'
    3196 |         u128    full;
         |         ^~~~
   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/current.h:5,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/uaccess.h:8,
                    from net/core/dev.c:71:
   net/core/dev.c: In function 'skb_defer_free_flush':
>> include/linux/atomic/atomic-arch-fallback.h:326:14: error: void value not ignored as it ought to be
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4914:9: note: in expansion of macro 'raw_try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~
   net/core/dev.c:6574:17: note: in expansion of macro 'try_cmpxchg128'
    6574 |         while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full)) {}
         |                 ^~~~~~~~~~~~~~
   net/core/dev.c:6567:35: warning: unused variable 'new' [-Wunused-variable]
    6567 |         softnet_defer_list_t old, new = {};
         |                                   ^~~
--
   In file included from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from net/core/skbuff.c:45:
   include/linux/netdevice.h:3196:9: error: unknown type name 'u128'
    3196 |         u128    full;
         |         ^~~~
   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/core/skbuff.c:37:
   net/core/skbuff.c: In function 'skb_attempt_defer_free':
>> include/linux/atomic/atomic-arch-fallback.h:326:14: error: void value not ignored as it ought to be
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4914:9: note: in expansion of macro 'raw_try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~
   net/core/skbuff.c:6752:19: note: in expansion of macro 'try_cmpxchg128'
    6752 |         } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
         |                   ^~~~~~~~~~~~~~
   net/core/skbuff.c:6726:35: warning: variable 'new' set but not used [-Wunused-but-set-variable]
    6726 |         softnet_defer_list_t old, new = {};
         |                                   ^~~


vim +326 include/linux/atomic/atomic-arch-fallback.h

0aa7be05d83cc5 Uros Bizjak    2022-05-15  316  
9257959a6e5b4f Mark Rutland   2023-06-05  317  #if defined(arch_try_cmpxchg128)
9257959a6e5b4f Mark Rutland   2023-06-05  318  #define raw_try_cmpxchg128 arch_try_cmpxchg128
9257959a6e5b4f Mark Rutland   2023-06-05  319  #elif defined(arch_try_cmpxchg128_relaxed)
9257959a6e5b4f Mark Rutland   2023-06-05  320  #define raw_try_cmpxchg128(...) \
9257959a6e5b4f Mark Rutland   2023-06-05  321  	__atomic_op_fence(arch_try_cmpxchg128, __VA_ARGS__)
9257959a6e5b4f Mark Rutland   2023-06-05  322  #else
9257959a6e5b4f Mark Rutland   2023-06-05  323  #define raw_try_cmpxchg128(_ptr, _oldp, _new) \
8c8b096a23d12f Peter Zijlstra 2023-05-31  324  ({ \
8c8b096a23d12f Peter Zijlstra 2023-05-31  325  	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
9257959a6e5b4f Mark Rutland   2023-06-05 @326  	___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
8c8b096a23d12f Peter Zijlstra 2023-05-31  327  	if (unlikely(___r != ___o)) \
8c8b096a23d12f Peter Zijlstra 2023-05-31  328  		*___op = ___r; \
8c8b096a23d12f Peter Zijlstra 2023-05-31  329  	likely(___r == ___o); \
8c8b096a23d12f Peter Zijlstra 2023-05-31  330  })
9257959a6e5b4f Mark Rutland   2023-06-05  331  #endif
8c8b096a23d12f Peter Zijlstra 2023-05-31  332  

:::::: The code at line 326 was first introduced by commit
:::::: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
