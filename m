Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD538F9D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 22:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmMKiV2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699568886; x=1731104886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hvdblZvRsGvfm+xmtSohfWXZ8fOhlYhFaXLmCCb6sVc=;
  b=ZmMKiV2h2M85jSUml95KyALmZf5+NkO0nxeLuokw9bt8R6rvs/F5SFj8
   N9bOmMJH4Sjd+TF38GH0e3JRereXoihbp8fPL9T+3uqSLuCscNHmwdtYp
   RluScmfUvgAQG0MwjsKdL1WL+/FJj8orYLTYs49dPAcOSeh0K2nm9sVKX
   E6nPEqK2mTIFQ97m0O7KMaZ5ToGN4BXcdkg17Ai7jKnjKDWlttgYu7rX/
   BdOTdHAAzQdBHdciZ+ofDeZ+W2o4F4oIiXSWqCPvZZiiDzTxjjG4jRr0t
   6fT4iuCS2SdVj0kf4JKWYzcwI5hdW7eEBExBi+X8bSMZOv/Z2v1kbc6X8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="456580153"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="456580153"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="829458470"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="829458470"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2023 14:28:04 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1DVK-0009Cv-08;
	Thu, 09 Nov 2023 22:28:02 +0000
Date: Fri, 10 Nov 2023 06:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 38/41] arch/x86/include/asm/cmpxchg.h:214:17:
 error: call to '__cmpxchg_wrong_size' declared with attribute error: Bad
 argument size for cmpxchg
Message-ID: <202311100656.gPkGDlzR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-fixes
head:   75a3bc7cc3bd84295e596d1a3c2528f5d6d60b67
commit: bc26e7ef4162b576dfc97aa50aab49830cedad9f [38/41] afs: Parse the VolSync record in the reply of a number of RPC ops
config: i386-buildonly-randconfig-003-20231110 (https://download.01.org/0day-ci/archive/20231110/202311100656.gPkGDlzR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100656.gPkGDlzR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100656.gPkGDlzR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:13,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from fs/afs/validation.c:9:
   In function 'afs_update_volume_creation_time',
       inlined from 'afs_update_volume_state' at fs/afs/validation.c:111:3:
>> arch/x86/include/asm/cmpxchg.h:214:17: error: call to '__cmpxchg_wrong_size' declared with attribute error: Bad argument size for cmpxchg
     214 |                 __cmpxchg_wrong_size();                                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:228:9: note: in expansion of macro '__try_cmpxchg'
     228 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   fs/afs/validation.c:49:13: note: in expansion of macro 'try_cmpxchg'
      49 |         if (try_cmpxchg(&volume->volsync.creation, &old, new)) {
         |             ^~~~~~~~~~~
>> arch/x86/include/asm/cmpxchg.h:214:17: error: call to '__cmpxchg_wrong_size' declared with attribute error: Bad argument size for cmpxchg
     214 |                 __cmpxchg_wrong_size();                                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:228:9: note: in expansion of macro '__try_cmpxchg'
     228 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   fs/afs/validation.c:49:13: note: in expansion of macro 'try_cmpxchg'
      49 |         if (try_cmpxchg(&volume->volsync.creation, &old, new)) {
         |             ^~~~~~~~~~~
   In function 'afs_update_volume_update_time',
       inlined from 'afs_update_volume_state' at fs/afs/validation.c:113:3:
>> arch/x86/include/asm/cmpxchg.h:214:17: error: call to '__cmpxchg_wrong_size' declared with attribute error: Bad argument size for cmpxchg
     214 |                 __cmpxchg_wrong_size();                                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:228:9: note: in expansion of macro '__try_cmpxchg'
     228 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   fs/afs/validation.c:93:13: note: in expansion of macro 'try_cmpxchg'
      93 |         if (try_cmpxchg(&volume->volsync.update, &old, new)) {
         |             ^~~~~~~~~~~
>> arch/x86/include/asm/cmpxchg.h:214:17: error: call to '__cmpxchg_wrong_size' declared with attribute error: Bad argument size for cmpxchg
     214 |                 __cmpxchg_wrong_size();                                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:228:9: note: in expansion of macro '__try_cmpxchg'
     228 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   fs/afs/validation.c:93:13: note: in expansion of macro 'try_cmpxchg'
      93 |         if (try_cmpxchg(&volume->volsync.update, &old, new)) {
         |             ^~~~~~~~~~~


vim +/__cmpxchg_wrong_size +214 arch/x86/include/asm/cmpxchg.h

e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  147  
8bf705d130396e Dmitry Vyukov       2018-01-29  148  #define arch_cmpxchg(ptr, old, new)					\
fc395b9291925b Jan Beulich         2012-01-26  149  	__cmpxchg(ptr, old, new, sizeof(*(ptr)))
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  150  
8bf705d130396e Dmitry Vyukov       2018-01-29  151  #define arch_sync_cmpxchg(ptr, old, new)				\
fc395b9291925b Jan Beulich         2012-01-26  152  	__sync_cmpxchg(ptr, old, new, sizeof(*(ptr)))
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  153  
8bf705d130396e Dmitry Vyukov       2018-01-29  154  #define arch_cmpxchg_local(ptr, old, new)				\
fc395b9291925b Jan Beulich         2012-01-26  155  	__cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  156  
a9ebf306f52c75 Peter Zijlstra      2017-02-01  157  
a9ebf306f52c75 Peter Zijlstra      2017-02-01  158  #define __raw_try_cmpxchg(_ptr, _pold, _new, size, lock)		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  159  ({									\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  160  	bool success;							\
007d185b44620f Dmitry Vyukov       2017-06-17  161  	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  162  	__typeof__(*(_ptr)) __old = *_old;				\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  163  	__typeof__(*(_ptr)) __new = (_new);				\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  164  	switch (size) {							\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  165  	case __X86_CASE_B:						\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  166  	{								\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  167  		volatile u8 *__ptr = (volatile u8 *)(_ptr);		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  168  		asm volatile(lock "cmpxchgb %[new], %[ptr]"		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  169  			     CC_SET(z)					\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  170  			     : CC_OUT(z) (success),			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  171  			       [ptr] "+m" (*__ptr),			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  172  			       [old] "+a" (__old)			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  173  			     : [new] "q" (__new)			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  174  			     : "memory");				\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  175  		break;							\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  176  	}								\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  177  	case __X86_CASE_W:						\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  178  	{								\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  179  		volatile u16 *__ptr = (volatile u16 *)(_ptr);		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  180  		asm volatile(lock "cmpxchgw %[new], %[ptr]"		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  181  			     CC_SET(z)					\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  182  			     : CC_OUT(z) (success),			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  183  			       [ptr] "+m" (*__ptr),			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  184  			       [old] "+a" (__old)			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  185  			     : [new] "r" (__new)			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  186  			     : "memory");				\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  187  		break;							\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  188  	}								\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  189  	case __X86_CASE_L:						\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  190  	{								\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  191  		volatile u32 *__ptr = (volatile u32 *)(_ptr);		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  192  		asm volatile(lock "cmpxchgl %[new], %[ptr]"		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  193  			     CC_SET(z)					\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  194  			     : CC_OUT(z) (success),			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  195  			       [ptr] "+m" (*__ptr),			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  196  			       [old] "+a" (__old)			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  197  			     : [new] "r" (__new)			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  198  			     : "memory");				\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  199  		break;							\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  200  	}								\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  201  	case __X86_CASE_Q:						\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  202  	{								\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  203  		volatile u64 *__ptr = (volatile u64 *)(_ptr);		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  204  		asm volatile(lock "cmpxchgq %[new], %[ptr]"		\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  205  			     CC_SET(z)					\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  206  			     : CC_OUT(z) (success),			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  207  			       [ptr] "+m" (*__ptr),			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  208  			       [old] "+a" (__old)			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  209  			     : [new] "r" (__new)			\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  210  			     : "memory");				\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  211  		break;							\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  212  	}								\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  213  	default:							\
a9ebf306f52c75 Peter Zijlstra      2017-02-01 @214  		__cmpxchg_wrong_size();					\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  215  	}								\
44fe84459faf1a Peter Zijlstra      2017-03-27  216  	if (unlikely(!success))						\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  217  		*_old = __old;						\
44fe84459faf1a Peter Zijlstra      2017-03-27  218  	likely(success);						\
a9ebf306f52c75 Peter Zijlstra      2017-02-01  219  })
a9ebf306f52c75 Peter Zijlstra      2017-02-01  220  

:::::: The code at line 214 was first introduced by commit
:::::: a9ebf306f52c756c4f9e50ee9a60cd6389d71344 locking/atomic: Introduce atomic_try_cmpxchg()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
