Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35DD4A1E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 01:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjcRs7dT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699578253; x=1731114253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+5XOMzy79dmLzkGFttJj7PhRDkk1KJl5TrNBcJkgTE=;
  b=XjcRs7dTSyGE/ymWR8uohL79QjAV0ouTjBc09+W4JsmxbLn6zv6sABL7
   vPKzJATkeTWEBobvK5J/uYqXS7rQQSKDKoFb8Qbb4Vt4EmnAKxy8xP02p
   Ntalm0H6PFc6cq/8WPu+7gUpRq+KdGig3AEm3eBIri+82/4Xqgv4PTEjB
   rdqiyeDsKUnjTeblGLS9ebZwVrXd117rmrwrh/BFXZYzcXs7wfU0mmc3m
   GWOctdZUzVebQkgKcJS3WX4gV03HxQ5IRbj/pG8wxv1w/aShh5gVO1DGk
   HrgA6JUUpLHKM9c1t8UpMem/lcXCv16dVtdggPttJ7U8I+8jODynbg4/l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389916570"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="389916570"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 17:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="757063779"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="757063779"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2023 17:04:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1FwO-0009K5-14;
	Fri, 10 Nov 2023 01:04:08 +0000
Date: Fri, 10 Nov 2023 09:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 39/41] arch/x86/include/asm/cmpxchg.h:67:25:
 error: call to '__xchg_wrong_size' declared with attribute error: Bad
 argument size for xchg
Message-ID: <202311100817.GChoE97R-lkp@intel.com>
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
commit: a28bddd8212862afdcbb53e210e2ff92e991d2a9 [39/41] afs: Overhaul invalidation handling to better support RO volumes
config: i386-buildonly-randconfig-003-20231110 (https://download.01.org/0day-ci/archive/20231110/202311100817.GChoE97R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100817.GChoE97R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100817.GChoE97R-lkp@intel.com/

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
                    from fs/afs/callback.c:17:
   fs/afs/callback.c: In function '__afs_break_callback':
>> arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   fs/afs/callback.c:82:13: note: in expansion of macro 'xchg'
      82 |         if (xchg(&vnode->cb_expires_at, AFS_NO_CB_PROMISE) != AFS_NO_CB_PROMISE) {
         |             ^~~~
--
   In file included from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:13,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from fs/afs/rotate.c:9:
   fs/afs/rotate.c: In function 'afs_start_fs_iteration':
>> arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   fs/afs/rotate.c:62:21: note: in expansion of macro 'xchg'
      62 |                 if (xchg(&vnode->cb_expires_at, AFS_NO_CB_PROMISE) != AFS_NO_CB_PROMISE)
         |                     ^~~~


vim +/__xchg_wrong_size +67 arch/x86/include/asm/cmpxchg.h

e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  37  
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  38  /* 
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  39   * An exchange-type operation, which takes a value and a pointer, and
7f5281ae8a8e7f Li Zhong            2013-04-25  40   * returns the old value.
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  41   */
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  42  #define __xchg_op(ptr, arg, op, lock)					\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  43  	({								\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  44  	        __typeof__ (*(ptr)) __ret = (arg);			\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  45  		switch (sizeof(*(ptr))) {				\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  46  		case __X86_CASE_B:					\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  47  			asm volatile (lock #op "b %b0, %1\n"		\
2ca052a3710fac Jeremy Fitzhardinge 2012-04-02  48  				      : "+q" (__ret), "+m" (*(ptr))	\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  49  				      : : "memory", "cc");		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  50  			break;						\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  51  		case __X86_CASE_W:					\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  52  			asm volatile (lock #op "w %w0, %1\n"		\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  53  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  54  				      : : "memory", "cc");		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  55  			break;						\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  56  		case __X86_CASE_L:					\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  57  			asm volatile (lock #op "l %0, %1\n"		\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  58  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  59  				      : : "memory", "cc");		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  60  			break;						\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  61  		case __X86_CASE_Q:					\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  62  			asm volatile (lock #op "q %q0, %1\n"		\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  63  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  64  				      : : "memory", "cc");		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  65  			break;						\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  66  		default:						\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30 @67  			__ ## op ## _wrong_size();			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  68  		}							\
31a8394e069e47 Jeremy Fitzhardinge 2011-09-30  69  		__ret;							\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  70  	})
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  71  

:::::: The code at line 67 was first introduced by commit
:::::: 31a8394e069e47dc47f4c29e4213aa943342f19f x86: consolidate xchg and xadd macros

:::::: TO: Jeremy Fitzhardinge <jeremy@goop.org>
:::::: CC: Jeremy Fitzhardinge <jeremy@goop.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
