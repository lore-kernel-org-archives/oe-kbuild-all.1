Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7331B1DDDE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 22:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689891870; x=1721427870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uy9qvT2X+54e/hBVO5Y9O9V4GbHtHONj5FOsYCvgfIE=;
  b=MxC6b/pczgZ5GP9hpOqSIel736CKrgpuPldBVIxDi6mdDkjC1Xou7kpu
   6/Y2g6RMZ3gw/MWk/wYtYBmfl92dgUaJtmGcKnsji0Ikl8ADx3J+pyNof
   j+m/9urqPcQKkmvxAvh9fDrmUztTVkuvmklAo188l/n3zdYTlVAJP9h1A
   +9/UT9rOZtzP7dYanlid60FuVEtHIabnHeoI5BzeFnIn8kuNJj+ktERRE
   kiaJ2qsKHyUK+4c3ZpvBDW+UJE3WxuTOFthyz416gDiwN3HpB4U5XmXKz
   2c7UFadv7WXr74nUQRinIZOHGxlWsLnc8viIcn2W1/YQdkEQex5TZ7PcR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346471110"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="346471110"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 15:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701818957"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="701818957"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 15:24:25 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMc4O-0006Zv-1w;
	Thu, 20 Jul 2023 22:24:24 +0000
Date: Fri, 21 Jul 2023 06:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 15/19]
 arch/powerpc/include/asm/bitops.h:280:61: error: 'nr' undeclared
Message-ID: <202307210644.JaqFlNjE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   98061915c6df5892ff3efa2f04a27857ea36ca51
commit: 6bb72a8aa141cc8d24e20fe5cdaf3170f1c9284a [15/19] bitops: Add change_and_unlock_is_negative_byte()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230721/202307210644.JaqFlNjE-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210644.JaqFlNjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210644.JaqFlNjE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:159,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/powerpc/include/asm/bitops.h: In function 'arch_change_and_unlock_is_negative_byte':
>> arch/powerpc/include/asm/bitops.h:280:61: error: 'nr' undeclared (first use in this function)
     280 |         unsigned long *p = (unsigned long *)addr + BIT_WORD(nr);
         |                                                             ^~
   include/linux/bits.h:10:35: note: in definition of macro 'BIT_WORD'
      10 | #define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
         |                                   ^~
   arch/powerpc/include/asm/bitops.h:280:61: note: each undeclared identifier is reported only once for each function it appears in
     280 |         unsigned long *p = (unsigned long *)addr + BIT_WORD(nr);
         |                                                             ^~
   include/linux/bits.h:10:35: note: in definition of macro 'BIT_WORD'
      10 | #define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
         |                                   ^~
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/nr +280 arch/powerpc/include/asm/bitops.h

   268	
   269	/*
   270	 * This is a special function for mm/filemap.c
   271	 * Bit 7 corresponds to PG_waiters.
   272	 */
   273	#define arch_clear_bit_unlock_is_negative_byte(nr, addr)		\
   274		(clear_bit_unlock_return_word(nr, addr) & BIT_MASK(7))
   275	
   276	static inline bool arch_change_and_unlock_is_negative_byte(int change_bit,
   277			int lock_bit, volatile unsigned long *addr)
   278	{
   279		unsigned long old, t;
 > 280		unsigned long *p = (unsigned long *)addr + BIT_WORD(nr);
   281		unsigned long mask = (1 << change_bit) | (1 << lock_bit);
   282	
   283		asm volatile (
   284			PPC_RELEASE_BARRIER
   285		"1:"	PPC_LLARX "%0,0,%3,0\n"
   286			"xor	%1,%0,%2\n"
   287			PPC_STLCX "%1,0,%3\n"
   288			"bne- 1b\n"
   289			: "=&r" (old), "=&r" (t)
   290			: "r" (mask), "r" (p)
   291			: "cc", "memory");
   292	
   293		return (old & BIT_MASK(7)) != 0;
   294	}
   295	#define arch_change_and_unlock_is_negative_byte \
   296		arch_change_and_unlock_is_negative_byte
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
