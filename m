Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BE63B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 11:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693134494; x=1724670494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nhy3vl0caKlLIMcGY1RmxJLArR09NpD7CpgFQhx8nZg=;
  b=cmFEW1jqM2yP6XP2XRvBVXa36T9A92qwcNetHwwyt5enO4Za9FyCOzr5
   2ANvZ8BC9JNtA66UxV23vvatDW27hE33beJ7fEoC27yIlTtXHCvMaDdiD
   1zuLEirF3ZY7CtUgtZ21oJg6ncS7QIc9X1jN+ucYnnvisezxUF8QDRAQK
   E+ffH0m8TakU84PePJIZJy4MjQeEsEogqpQfrO3byHSpBwP4N+IgSq5iR
   38+9g3wAcmHtxWXrLEiHcbNtO6tWmtO2lUdVLoTlOk77rvDob9/zwVe6+
   EHDHHjdVsI40gCVpPOVrxJAEZnkDNDp4MbEUz3fzkNILrVif7Do9RkO1/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="359927829"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="359927829"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 04:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="731531152"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="731531152"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Aug 2023 04:08:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaDcl-0005il-0Q;
	Sun, 27 Aug 2023 11:08:07 +0000
Date: Sun, 27 Aug 2023 19:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:aass 22/29] include/linux/bitmap.h:750:24: error: 'nbits'
 undeclared; did you mean 'bits'?
Message-ID: <202308271915.fMXF10LN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux aass
head:   ad585573c81bc132c3f64aae4eef20d68484abfb
commit: 2b2196b70138e822fae24225696c3835914f6b56 [22/29] bitmap: add small_const_nbits() optimization for bitmap_bitremap()
config: x86_64-randconfig-002-20230827 (https://download.01.org/0day-ci/archive/20230827/202308271915.fMXF10LN-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271915.fMXF10LN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271915.fMXF10LN-lkp@intel.com/

Note: the norov/aass HEAD ad585573c81bc132c3f64aae4eef20d68484abfb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/paravirt.h:17,
                    from arch/x86/include/asm/cpuid.h:62,
                    from arch/x86/include/asm/processor.h:19,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/bitmap.h:720:6: warning: no previous prototype for 'bitmap_remap' [-Wmissing-prototypes]
     720 | void bitmap_remap(unsigned long *dst, const unsigned long *src,
         |      ^~~~~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_remap':
   include/linux/bitmap.h:724:43: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     724 |   if (*src & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                           ^
   include/linux/bitmap.h:725:43: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     725 |       *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                           ^
   include/linux/bitmap.h:726:43: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     726 |       *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                           ^
   include/linux/bitmap.h: At top level:
   include/linux/bitmap.h:747:5: warning: no previous prototype for 'bitmap_bitremap' [-Wmissing-prototypes]
     747 | int bitmap_bitremap(int oldbit,
         |     ^~~~~~~~~~~~~~~
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11,
                    from include/uapi/asm-generic/int-ll64.h:12,
                    from include/asm-generic/int-ll64.h:11,
                    from include/uapi/asm-generic/types.h:7,
                    from ./arch/x86/include/generated/uapi/asm/types.h:1,
                    from include/uapi/linux/types.h:5,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/bitmap.h: In function 'bitmap_bitremap':
>> include/linux/bitmap.h:750:24: error: 'nbits' undeclared (first use in this function); did you mean 'bits'?
     750 |  if (small_const_nbits(nbits)) {
         |                        ^~~~~
   include/asm-generic/bitsperlong.h:36:24: note: in definition of macro 'small_const_nbits'
      36 |  (__builtin_constant_p(nbits) && (nbits) <= BITS_PER_LONG && (nbits) > 0)
         |                        ^~~~~
   include/linux/bitmap.h:750:24: note: each undeclared identifier is reported only once for each function it appears in
     750 |  if (small_const_nbits(nbits)) {
         |                        ^~~~~
   include/asm-generic/bitsperlong.h:36:24: note: in definition of macro 'small_const_nbits'
      36 |  (__builtin_constant_p(nbits) && (nbits) <= BITS_PER_LONG && (nbits) > 0)
         |                        ^~~~~
   In file included from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/paravirt.h:17,
                    from arch/x86/include/asm/cpuid.h:62,
                    from arch/x86/include/asm/processor.h:19,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/bitmap.h:753:26: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     753 |   if (*old & BIT(oldbit) == 0 ||
>> include/linux/bitmap.h:765:17: error: 'dst' undeclared (first use in this function)
     765 |  __bitmap_remap(dst, src, old, new, nbits);
         |                 ^~~
>> include/linux/bitmap.h:765:22: error: 'src' undeclared (first use in this function)
     765 |  __bitmap_remap(dst, src, old, new, nbits);
         |                      ^~~
   In file included from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/paravirt.h:17,
                    from arch/x86/include/asm/cpuid.h:62,
                    from arch/x86/include/asm/processor.h:19,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/bitmap.h:766:1: error: control reaches end of non-void function [-Werror=return-type]
     766 | }
         | ^
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1292089377
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=1292089377
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1292089377
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1292089377
   make: Target 'prepare' not remade because of errors.


vim +750 include/linux/bitmap.h

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
   747	int bitmap_bitremap(int oldbit,
   748			const unsigned long *old, const unsigned long *new, int bits)
   749	{
 > 750		if (small_const_nbits(nbits)) {
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
   762			return find_nth_bit(new, nbits, n % w);
   763		}
   764	
 > 765		__bitmap_remap(dst, src, old, new, nbits);
   766	}
   767	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
