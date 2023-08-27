Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C81A63A5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693136415; x=1724672415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sEtApCH/xTSAMqHz+ySvniOtg4d/v8Xo6i3ziW3Klvs=;
  b=RjS+0Xp21DYua/t3CC6b9GZZO4CW0Sn/Vy0LducnkBwEHVhkgx0OhntO
   SyC19KalnCO3XRYjv/D4xOrsiV4w0IEaNfolT3pXcquRuHclEcgZFYuac
   VHX12R8KP5ewiKkDhEqj9ps4m/KjIBMrx4OidSJiRj9LwPhAJ286vDwU9
   PBx5IYcW5/fFQh3bB0Zsqn1LoIWsm5L/UCv975yEqUElAv9/x+QfmIWOI
   /Q3CVK9kQ7zOFSbppJu9kx18xkETWLEvWBl1E3HVHAa4imVDgcySz6xVb
   Hg+m8LibXNbPcwg2nIFnyrj3VkGd/cPpAl5wFNSvNjRvwYw8EWGYzhXdS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="359929917"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="359929917"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 04:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="807993592"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="807993592"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Aug 2023 04:40:12 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaE7o-0005jv-0Y;
	Sun, 27 Aug 2023 11:40:12 +0000
Date: Sun, 27 Aug 2023 19:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:aass 22/28] include/linux/bitmap.h:765:17: error: use of
 undeclared identifier 'dst'
Message-ID: <202308271926.Ezje7gDY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux aass
head:   09c5536da36c57d74f151b53a4b810a46fc63948
commit: 2b2196b70138e822fae24225696c3835914f6b56 [22/28] bitmap: add small_const_nbits() optimization for bitmap_bitremap()
config: i386-randconfig-001-20230827 (https://download.01.org/0day-ci/archive/20230827/202308271926.Ezje7gDY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271926.Ezje7gDY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271926.Ezje7gDY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

                                 bits
   include/asm-generic/bitsperlong.h:36:35: note: expanded from macro 'small_const_nbits'
           (__builtin_constant_p(nbits) && (nbits) <= BITS_PER_LONG && (nbits) > 0)
                                            ^
   include/linux/bitmap.h:748:59: note: 'bits' declared here
                   const unsigned long *old, const unsigned long *new, int bits)
                                                                           ^
   include/linux/bitmap.h:750:24: error: use of undeclared identifier 'nbits'; did you mean 'bits'?
           if (small_const_nbits(nbits)) {
                                 ^~~~~
                                 bits
   include/asm-generic/bitsperlong.h:36:63: note: expanded from macro 'small_const_nbits'
           (__builtin_constant_p(nbits) && (nbits) <= BITS_PER_LONG && (nbits) > 0)
                                                                        ^
   include/linux/bitmap.h:748:59: note: 'bits' declared here
                   const unsigned long *old, const unsigned long *new, int bits)
                                                                           ^
   include/linux/bitmap.h:750:24: error: use of undeclared identifier 'nbits'; did you mean 'bits'?
           if (small_const_nbits(nbits)) {
                                 ^~~~~
                                 bits
   include/asm-generic/bitsperlong.h:36:24: note: expanded from macro 'small_const_nbits'
           (__builtin_constant_p(nbits) && (nbits) <= BITS_PER_LONG && (nbits) > 0)
                                 ^
   include/linux/bitmap.h:748:59: note: 'bits' declared here
                   const unsigned long *old, const unsigned long *new, int bits)
                                                                           ^
   include/linux/bitmap.h:753:12: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
                   if (*old & BIT(oldbit) == 0 ||
                            ^~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:753:12: note: place parentheses around the '==' expression to silence this warning
                   if (*old & BIT(oldbit) == 0 ||
                            ^ ~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:753:12: note: place parentheses around the & expression to evaluate it first
                   if (*old & BIT(oldbit) == 0 ||
                       ~~~~~^~~~~~~~~~~~~
   include/linux/bitmap.h:754:36: error: use of undeclared identifier 'nbits'; did you mean 'bits'?
                       *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
                                                    ^~~~~
                                                    bits
   include/linux/bitmap.h:239:50: note: expanded from macro 'BITMAP_LAST_WORD_MASK'
   #define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
                                                    ^
   include/linux/bitmap.h:748:59: note: 'bits' declared here
                   const unsigned long *old, const unsigned long *new, int bits)
                                                                           ^
   include/linux/bitmap.h:754:12: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
                       *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:754:12: note: place parentheses around the '==' expression to silence this warning
                       *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:754:12: note: place parentheses around the & expression to evaluate it first
                       *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:755:36: error: use of undeclared identifier 'nbits'; did you mean 'bits'?
                       *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
                                                    ^~~~~
                                                    bits
   include/linux/bitmap.h:239:50: note: expanded from macro 'BITMAP_LAST_WORD_MASK'
   #define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
                                                    ^
   include/linux/bitmap.h:748:59: note: 'bits' declared here
                   const unsigned long *old, const unsigned long *new, int bits)
                                                                           ^
   include/linux/bitmap.h:755:12: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
                       *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:755:12: note: place parentheses around the '==' expression to silence this warning
                       *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:755:12: note: place parentheses around the & expression to evaluate it first
                       *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:756:45: error: use of undeclared identifier 'nbits'; did you mean 'bits'?
                       (*new ^ *old) & BITMAP_LAST_WORD_MASK(nbits) == 0) {
                                                             ^~~~~
                                                             bits
   include/linux/bitmap.h:239:50: note: expanded from macro 'BITMAP_LAST_WORD_MASK'
   #define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
                                                    ^
   include/linux/bitmap.h:748:59: note: 'bits' declared here
                   const unsigned long *old, const unsigned long *new, int bits)
                                                                           ^
   include/linux/bitmap.h:756:21: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
                       (*new ^ *old) & BITMAP_LAST_WORD_MASK(nbits) == 0) {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:756:21: note: place parentheses around the '==' expression to silence this warning
                       (*new ^ *old) & BITMAP_LAST_WORD_MASK(nbits) == 0) {
                                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:756:21: note: place parentheses around the & expression to evaluate it first
                       (*new ^ *old) & BITMAP_LAST_WORD_MASK(nbits) == 0) {
                       ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:762:28: error: use of undeclared identifier 'nbits'; did you mean 'bits'?
                   return find_nth_bit(new, nbits, n % w);
                                            ^~~~~
                                            bits
   include/linux/bitmap.h:748:59: note: 'bits' declared here
                   const unsigned long *old, const unsigned long *new, int bits)
                                                                           ^
>> include/linux/bitmap.h:765:17: error: use of undeclared identifier 'dst'
           __bitmap_remap(dst, src, old, new, nbits);
                          ^
>> include/linux/bitmap.h:765:22: error: use of undeclared identifier 'src'
           __bitmap_remap(dst, src, old, new, nbits);
                               ^
   include/linux/bitmap.h:765:37: error: use of undeclared identifier 'nbits'
           __bitmap_remap(dst, src, old, new, nbits);
                                              ^
>> include/linux/bitmap.h:747:5: warning: no previous prototype for function 'bitmap_bitremap' [-Wmissing-prototypes]
   int bitmap_bitremap(int oldbit,
       ^
   include/linux/bitmap.h:747:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bitmap_bitremap(int oldbit,
   ^
   static 
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:


vim +/dst +765 include/linux/bitmap.h

   735	
   736	/**
   737	 * bitmap_bitremap - Apply map defined by a pair of bitmaps to a single bit
   738	 *	@oldbit: bit position to be mapped
   739	 *	@old: defines domain of map
   740	 *	@new: defines range of map
   741	 *	@bits: number of bits in each of these bitmaps
   742	 *
   743	 * A special case of bitmap_remap(), when a single bit remapping is needed.
   744	 *
   745	 * Returns: position of remapped bit
   746	 */
 > 747	int bitmap_bitremap(int oldbit,
 > 748			const unsigned long *old, const unsigned long *new, int bits)
   749	{
   750		if (small_const_nbits(nbits)) {
   751			unsigned int w, n;
   752	
   753			if (*old & BIT(oldbit) == 0 ||
   754			    *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
   755			    *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
   756			    (*new ^ *old) & BITMAP_LAST_WORD_MASK(nbits) == 0) {
   757				return oldbit;
   758			}
   759	
   760			w = bitmap_weight(new, bits);
   761			n = bitmap_weight(old, bits);
 > 762			return find_nth_bit(new, nbits, n % w);
   763		}
   764	
 > 765		__bitmap_remap(dst, src, old, new, nbits);
   766	}
   767	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
