Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B4046A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jprk5PAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697612843; x=1729148843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MOIYTn67O0nKaHF0C2qGsW7hKIZ0//e2G3ZjT1f2FiY=;
  b=jprk5PAzfm2GwbdngiXyjimAkykh95C+S/D/V7wb0FcRcOxVYPnD4AR6
   FoQLafgYxU0wTnDYiAJ3Gwuz4b1ZvhW1/nf5a1HvGOgP03c7UAMDCvNKy
   TYJXtYxkgd4UWOERWOhaFSjxp+aSc7wdgIVKrePm3n4NfxVD4XvJBULVD
   jwq5jstH0ryhBz3VLZE8PUu2snrR3mNHIknGRbxmlJhAjEY7XvMQcY0CE
   ABiNvWjn+x3Rfo/Ffk/bMk39YKwU3w//tcWxHjJxEpJhBNDfxkNEg+o32
   EAwFd3+zNF/Wov/EewruHb7YWFSTG5J2Z4qjALt6IS5gTGJwNKVHagUkH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452426720"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="452426720"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 00:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826756988"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="826756988"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2023 00:07:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt0eF-00002v-1g;
	Wed, 18 Oct 2023 07:07:19 +0000
Date: Wed, 18 Oct 2023 15:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/ilb-no-needs-kick 1/2]
 arch/powerpc/include/asm/cmpxchg.h:703:37: warning: passing argument 1 of
 '__cmpxchg' makes pointer from integer without a cast
Message-ID: <202310181237.2BN7MQgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/ilb-no-needs-kick
head:   2ffef1b93f5fd543729d603697bed169dba84cb6
commit: f1ce99013bb325ab42d7f80f72edd96da8b415c5 [1/2] sched/nohz: Update nohz.next_balance directly without IPIs
config: powerpc64-randconfig-001-20231018 (https://download.01.org/0day-ci/archive/20231018/202310181237.2BN7MQgR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181237.2BN7MQgR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181237.2BN7MQgR-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
                    from arch/powerpc/include/asm/bitops.h:332,
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
   In file included from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7:
   arch/powerpc/include/asm/cmpxchg.h:701:17: error: invalid type argument of unary '*' (have 'int')
     701 |      __typeof__(*(ptr)) _o_ = (o);                                       \
         |                 ^~~~~~
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
   arch/powerpc/include/asm/cmpxchg.h:702:17: error: invalid type argument of unary '*' (have 'int')
     702 |      __typeof__(*(ptr)) _n_ = (n);                                       \
         |                 ^~~~~~
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
   arch/powerpc/include/asm/cmpxchg.h:703:18: error: invalid type argument of unary '*' (have 'int')
     703 |      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,           \
         |                  ^~~~~~
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
   arch/powerpc/include/asm/cmpxchg.h:704:64: error: invalid type argument of unary '*' (have 'int')
     704 |                                     (unsigned long)_n_, sizeof(*(ptr))); \
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
>> arch/powerpc/include/asm/cmpxchg.h:703:37: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
     703 |      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,           \
         |                                     ^~~~~
         |                                     |
         |                                     int
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
   arch/powerpc/include/asm/cmpxchg.h:621:26: note: expected 'volatile void *' but argument is of type 'int'
     621 | __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
         |           ~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/__cmpxchg +703 arch/powerpc/include/asm/cmpxchg.h

56c08e6d226c86 Boqun Feng    2015-12-15  679  
56c08e6d226c86 Boqun Feng    2015-12-15  680  static __always_inline unsigned long
56c08e6d226c86 Boqun Feng    2015-12-15  681  __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
56c08e6d226c86 Boqun Feng    2015-12-15  682  		  unsigned int size)
56c08e6d226c86 Boqun Feng    2015-12-15  683  {
56c08e6d226c86 Boqun Feng    2015-12-15  684  	switch (size) {
d0563a1297e234 Pan Xinhui    2016-04-27  685  	case 1:
d0563a1297e234 Pan Xinhui    2016-04-27  686  		return __cmpxchg_u8_acquire(ptr, old, new);
d0563a1297e234 Pan Xinhui    2016-04-27  687  	case 2:
d0563a1297e234 Pan Xinhui    2016-04-27  688  		return __cmpxchg_u16_acquire(ptr, old, new);
56c08e6d226c86 Boqun Feng    2015-12-15  689  	case 4:
56c08e6d226c86 Boqun Feng    2015-12-15  690  		return __cmpxchg_u32_acquire(ptr, old, new);
56c08e6d226c86 Boqun Feng    2015-12-15  691  #ifdef CONFIG_PPC64
56c08e6d226c86 Boqun Feng    2015-12-15  692  	case 8:
56c08e6d226c86 Boqun Feng    2015-12-15  693  		return __cmpxchg_u64_acquire(ptr, old, new);
56c08e6d226c86 Boqun Feng    2015-12-15  694  #endif
56c08e6d226c86 Boqun Feng    2015-12-15  695  	}
10d8b1480e6966 pan xinhui    2016-02-23  696  	BUILD_BUG_ON_MSG(1, "Unsupported size for __cmpxchg_acquire");
56c08e6d226c86 Boqun Feng    2015-12-15  697  	return old;
56c08e6d226c86 Boqun Feng    2015-12-15  698  }
9eaa82935dccb7 Mark Rutland  2021-05-25  699  #define arch_cmpxchg(ptr, o, n)						 \
ae3a197e3d0bfe David Howells 2012-03-28  700    ({									 \
ae3a197e3d0bfe David Howells 2012-03-28  701       __typeof__(*(ptr)) _o_ = (o);					 \
ae3a197e3d0bfe David Howells 2012-03-28  702       __typeof__(*(ptr)) _n_ = (n);					 \
ae3a197e3d0bfe David Howells 2012-03-28 @703       (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
ae3a197e3d0bfe David Howells 2012-03-28  704  				    (unsigned long)_n_, sizeof(*(ptr))); \
ae3a197e3d0bfe David Howells 2012-03-28  705    })
ae3a197e3d0bfe David Howells 2012-03-28  706  
ae3a197e3d0bfe David Howells 2012-03-28  707  

:::::: The code at line 703 was first introduced by commit
:::::: ae3a197e3d0bfe3f4bf1693723e82dc018c096f3 Disintegrate asm/system.h for PowerPC

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
