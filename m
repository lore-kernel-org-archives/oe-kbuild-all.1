Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360017E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693132012; x=1724668012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJuFuA5ZUcSzaMP0i2Czf16hlBtfr9hSyRBpncfxXLE=;
  b=hTD1JmLOh0e68H6C1bMhO/2KTgp4PxJ+o1UVc0QK40CKZHmtPbHaeHPG
   gLWnhP7j+gOA275VWz4/pFbVNJZ+Mh6rqSx4u1PTWY0Ibxbrk9XVzZVvQ
   NytcKD8tt6gyuYKK95un3iNfUS4EgkYBWpGisLG4R+ABvETex1Tt7cNEs
   PX0C3WyIuDc99vPz1EY8M1LxI2hdb1TBhHNqgSr8tmruEM6dWQj67bH8R
   yn/+NlD1ha21AbLq8V2AkXrP236C33Op12YZ+y3gxzhn6Sp1p9897U7D8
   m26dOiaK0lCAZF1mNGGGtxgjmAyVBC4J+xiVjWmymqFQ05bKYxjxcPRxp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="372334425"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="372334425"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 03:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="714824090"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="714824090"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Aug 2023 03:26:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaCyn-0005g9-0I;
	Sun, 27 Aug 2023 10:26:49 +0000
Date: Sun, 27 Aug 2023 18:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:aass 1/2] include/linux/bitmap.h:722: multiple definition of
 `bitmap_remap';
 arch/s390/kernel/vdso64/vdso64_generic.o:include/linux/bitmap.h:722: first
 defined here
Message-ID: <202308271841.ALJ6CGcX-lkp@intel.com>
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
commit: 09c5536da36c57d74f151b53a4b810a46fc63948 [1/2] fixq
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230827/202308271841.ALJ6CGcX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271841.ALJ6CGcX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271841.ALJ6CGcX-lkp@intel.com/

Note: the norov/aass HEAD ad585573c81bc132c3f64aae4eef20d68484abfb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/percpu.h:7,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/s390/kernel/asm-offsets.c:11:
   include/linux/bitmap.h:720:6: warning: no previous prototype for 'bitmap_remap' [-Wmissing-prototypes]
     720 | void bitmap_remap(unsigned long *dst, const unsigned long *src,
         |      ^~~~~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_remap':
   include/linux/bitmap.h:724:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     724 |                 if (*src & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:725:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     725 |                     *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:726:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     726 |                     *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h: At top level:
   include/linux/bitmap.h:747:5: warning: no previous prototype for 'bitmap_bitremap' [-Wmissing-prototypes]
     747 | int bitmap_bitremap(int oldbit,
         |     ^~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/s390/include/asm/syscall.h:13,
                    from arch/s390/include/asm/vdso/gettimeofday.h:9,
                    from include/vdso/datapage.h:137,
                    from arch/s390/kernel/vdso64/../../../../lib/vdso/gettimeofday.c:5,
                    from arch/s390/kernel/vdso64/vdso64_generic.c:2:
   include/linux/bitmap.h:720:6: warning: no previous prototype for 'bitmap_remap' [-Wmissing-prototypes]
     720 | void bitmap_remap(unsigned long *dst, const unsigned long *src,
         |      ^~~~~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_remap':
   include/linux/bitmap.h:724:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     724 |                 if (*src & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:725:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     725 |                     *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:726:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     726 |                     *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h: At top level:
   include/linux/bitmap.h:747:5: warning: no previous prototype for 'bitmap_bitremap' [-Wmissing-prototypes]
     747 | int bitmap_bitremap(int oldbit,
         |     ^~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/s390/include/asm/syscall.h:13,
                    from arch/s390/include/asm/vdso/gettimeofday.h:9,
                    from include/vdso/datapage.h:137,
                    from arch/s390/kernel/vdso64/vdso.h:5,
                    from arch/s390/kernel/vdso64/getcpu.c:7:
   include/linux/bitmap.h:720:6: warning: no previous prototype for 'bitmap_remap' [-Wmissing-prototypes]
     720 | void bitmap_remap(unsigned long *dst, const unsigned long *src,
         |      ^~~~~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_remap':
   include/linux/bitmap.h:724:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     724 |                 if (*src & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:725:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     725 |                     *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:726:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     726 |                     *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h: At top level:
   include/linux/bitmap.h:747:5: warning: no previous prototype for 'bitmap_bitremap' [-Wmissing-prototypes]
     747 | int bitmap_bitremap(int oldbit,
         |     ^~~~~~~~~~~~~~~
   s390-linux-ld: arch/s390/kernel/vdso64/getcpu.o: in function `bitmap_remap':
>> include/linux/bitmap.h:722: multiple definition of `bitmap_remap'; arch/s390/kernel/vdso64/vdso64_generic.o:include/linux/bitmap.h:722: first defined here
   s390-linux-ld: arch/s390/kernel/vdso64/getcpu.o: in function `bitmap_bitremap':
>> include/linux/bitmap.h:765: multiple definition of `bitmap_bitremap'; arch/s390/kernel/vdso64/vdso64_generic.o:include/linux/bitmap.h:765: first defined here
   make[3]: *** [arch/s390/kernel/vdso64/Makefile:53: arch/s390/kernel/vdso64/vdso64.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso64-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:160: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +722 include/linux/bitmap.h

7a9339c834ec53 Yury Norov 2023-08-10  674  
7fb65ed43cfb3a Yury Norov 2023-08-26  675  /**
7fb65ed43cfb3a Yury Norov 2023-08-26  676   * bitmap_remap - Apply map defined by a pair of bitmaps to another bitmap
7fb65ed43cfb3a Yury Norov 2023-08-26  677   *	@dst: remapped result
7fb65ed43cfb3a Yury Norov 2023-08-26  678   *	@src: subset to be remapped
7fb65ed43cfb3a Yury Norov 2023-08-26  679   *	@old: defines domain of map
7fb65ed43cfb3a Yury Norov 2023-08-26  680   *	@new: defines range of map
7fb65ed43cfb3a Yury Norov 2023-08-26  681   *	@nbits: number of bits in each of these bitmaps
7fb65ed43cfb3a Yury Norov 2023-08-26  682   *
7fb65ed43cfb3a Yury Norov 2023-08-26  683   * Let @old and @new define a mapping of bit positions, such that
7fb65ed43cfb3a Yury Norov 2023-08-26  684   * whatever position is held by the n-th set bit in @old is mapped
7fb65ed43cfb3a Yury Norov 2023-08-26  685   * to the n-th set bit in @new. For example lets say that @old has
7fb65ed43cfb3a Yury Norov 2023-08-26  686   * bits 2 through 4 set, and @new has bits 3 through 5 set:
7fb65ed43cfb3a Yury Norov 2023-08-26  687   *
7fb65ed43cfb3a Yury Norov 2023-08-26  688   *	old: 00011100
7fb65ed43cfb3a Yury Norov 2023-08-26  689   *	     |||///||
7fb65ed43cfb3a Yury Norov 2023-08-26  690   *	new: 00111000
7fb65ed43cfb3a Yury Norov 2023-08-26  691   *
7fb65ed43cfb3a Yury Norov 2023-08-26  692   * This defines the mapping of bit position 2 to 3, 3 to 4 and 4 to 5,
7fb65ed43cfb3a Yury Norov 2023-08-26  693   * and of all other bit positions unchanged. So if say @src comes into
7fb65ed43cfb3a Yury Norov 2023-08-26  694   * this routine with bits 1, 3 and 5 set, then @dst should leave with
7fb65ed43cfb3a Yury Norov 2023-08-26  695   * bits 1, 4 and 5 set:
7fb65ed43cfb3a Yury Norov 2023-08-26  696   *
7fb65ed43cfb3a Yury Norov 2023-08-26  697   *	src: 00101010
7fb65ed43cfb3a Yury Norov 2023-08-26  698   *	       v v v
7fb65ed43cfb3a Yury Norov 2023-08-26  699   *	old: 00011100
7fb65ed43cfb3a Yury Norov 2023-08-26  700   *	     |||///||
7fb65ed43cfb3a Yury Norov 2023-08-26  701   *	new: 00111000
7fb65ed43cfb3a Yury Norov 2023-08-26  702   *	       vv  v
7fb65ed43cfb3a Yury Norov 2023-08-26  703   *	dst: 00110010
7fb65ed43cfb3a Yury Norov 2023-08-26  704   *
7fb65ed43cfb3a Yury Norov 2023-08-26  705   * In the more general case, allowing for the possibility that the weight
7fb65ed43cfb3a Yury Norov 2023-08-26  706   * 'w' of @new is less than the weight of @old, map the position of the
7fb65ed43cfb3a Yury Norov 2023-08-26  707   * n-th set bit in @old to the position of the m-th set bit in @new, where
7fb65ed43cfb3a Yury Norov 2023-08-26  708   * m == n % w.
7fb65ed43cfb3a Yury Norov 2023-08-26  709   *
7fb65ed43cfb3a Yury Norov 2023-08-26  710   * If either of the @old and @new bitmaps are empty, or if @src and
7fb65ed43cfb3a Yury Norov 2023-08-26  711   * @dst point to the same location, then this routine copies @src
7fb65ed43cfb3a Yury Norov 2023-08-26  712   * to @dst.
7fb65ed43cfb3a Yury Norov 2023-08-26  713   *
7fb65ed43cfb3a Yury Norov 2023-08-26  714   * The positions of unset bits in @old are mapped to themselves
7fb65ed43cfb3a Yury Norov 2023-08-26  715   * (the identity map).
7fb65ed43cfb3a Yury Norov 2023-08-26  716   *
7fb65ed43cfb3a Yury Norov 2023-08-26  717   * Apply the above specified mapping to @src, placing the result in
7fb65ed43cfb3a Yury Norov 2023-08-26  718   * @dst, clearing any bits previously set in @dst.
7fb65ed43cfb3a Yury Norov 2023-08-26  719   */
7fb65ed43cfb3a Yury Norov 2023-08-26  720  void bitmap_remap(unsigned long *dst, const unsigned long *src,
7fb65ed43cfb3a Yury Norov 2023-08-26  721  		const unsigned long *old, const unsigned long *new, unsigned int nbits)
7fb65ed43cfb3a Yury Norov 2023-08-26 @722  {
7fb65ed43cfb3a Yury Norov 2023-08-26  723  	if (small_const_nbits(nbits)) {
7fb65ed43cfb3a Yury Norov 2023-08-26  724  		if (*src & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
7fb65ed43cfb3a Yury Norov 2023-08-26  725  		    *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
7fb65ed43cfb3a Yury Norov 2023-08-26  726  		    *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
7fb65ed43cfb3a Yury Norov 2023-08-26  727  		    (*new ^ *old) & BITMAP_LAST_WORD_MASK(nbits)) {
7fb65ed43cfb3a Yury Norov 2023-08-26  728  			*dst = *src & BITMAP_LAST_WORD_MASK(nbits);
7fb65ed43cfb3a Yury Norov 2023-08-26  729  			return;
7fb65ed43cfb3a Yury Norov 2023-08-26  730  		}
7fb65ed43cfb3a Yury Norov 2023-08-26  731  	}
7fb65ed43cfb3a Yury Norov 2023-08-26  732  
7fb65ed43cfb3a Yury Norov 2023-08-26  733  	__bitmap_remap(dst, src, old, new, nbits);
7fb65ed43cfb3a Yury Norov 2023-08-26  734  }
7fb65ed43cfb3a Yury Norov 2023-08-26  735  
2b2196b70138e8 Yury Norov 2023-08-26  736  /**
2b2196b70138e8 Yury Norov 2023-08-26  737   * bitmap_bitremap - Apply map defined by a pair of bitmaps to a single bit
2b2196b70138e8 Yury Norov 2023-08-26  738   *	@oldbit: bit position to be mapped
2b2196b70138e8 Yury Norov 2023-08-26  739   *	@old: defines domain of map
2b2196b70138e8 Yury Norov 2023-08-26  740   *	@new: defines range of map
2b2196b70138e8 Yury Norov 2023-08-26  741   *	@bits: number of bits in each of these bitmaps
2b2196b70138e8 Yury Norov 2023-08-26  742   *
2b2196b70138e8 Yury Norov 2023-08-26  743   * A special case of bitmap_remap(), when a single bit remapping is needed.
2b2196b70138e8 Yury Norov 2023-08-26  744   *
2b2196b70138e8 Yury Norov 2023-08-26  745   * Returns: position of remapped bit
2b2196b70138e8 Yury Norov 2023-08-26  746   */
2b2196b70138e8 Yury Norov 2023-08-26  747  int bitmap_bitremap(int oldbit,
2b2196b70138e8 Yury Norov 2023-08-26  748  		const unsigned long *old, const unsigned long *new, int bits)
2b2196b70138e8 Yury Norov 2023-08-26  749  {
09c5536da36c57 ynorov     2023-08-26  750  	if (small_const_nbits(bits)) {
2b2196b70138e8 Yury Norov 2023-08-26  751  		unsigned int w, n;
2b2196b70138e8 Yury Norov 2023-08-26  752  
09c5536da36c57 ynorov     2023-08-26  753  		if ((*old & BIT(oldbit)) == 0 ||
09c5536da36c57 ynorov     2023-08-26  754  		    (*old & BITMAP_LAST_WORD_MASK(bits)) == 0 ||
09c5536da36c57 ynorov     2023-08-26  755  		    (*new & BITMAP_LAST_WORD_MASK(bits)) == 0 ||
09c5536da36c57 ynorov     2023-08-26  756  		    ((*new ^ *old) & BITMAP_LAST_WORD_MASK(bits)) == 0) {
2b2196b70138e8 Yury Norov 2023-08-26  757  			return oldbit;
2b2196b70138e8 Yury Norov 2023-08-26  758  		}
2b2196b70138e8 Yury Norov 2023-08-26  759  
2b2196b70138e8 Yury Norov 2023-08-26  760  		w = bitmap_weight(new, bits);
2b2196b70138e8 Yury Norov 2023-08-26  761  		n = bitmap_weight(old, bits);
09c5536da36c57 ynorov     2023-08-26  762  		return find_nth_bit(new, bits, n % w);
2b2196b70138e8 Yury Norov 2023-08-26  763  	}
2b2196b70138e8 Yury Norov 2023-08-26  764  
09c5536da36c57 ynorov     2023-08-26 @765  	return __bitmap_bitremap(oldbit, old, new, bits);
2b2196b70138e8 Yury Norov 2023-08-26  766  }
2b2196b70138e8 Yury Norov 2023-08-26  767  

:::::: The code at line 722 was first introduced by commit
:::::: 7fb65ed43cfb3add68a884fd6722a6a1ad0f3ed8 bitmap: add small_cont_nbits() optimization for bitmap_remap()

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
