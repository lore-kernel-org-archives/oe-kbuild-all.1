Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F691DDCC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 22:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689891246; x=1721427246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/i2KPkVPTkw7VGiBNIu5bptFxBhErW8WDFkgYYWza8o=;
  b=Uv9JgnZEHURSiBSejGA6ecaEm5iHhyrIZzqFP8jGHJ7O82fQlpx/gc6o
   oVR1ssbUJKLBMb5Nen7Q92I8WSoSyYb3KAC+nekl7KuLOWUiCsQ88bAS2
   Emd8mcGqHD6s/i5dAT8ZmPhUrV9tXTzZ0LjPYYxOHIh49OMEiP2I6UMmr
   Hd/kW4W6P1B8tqUKXIf2cwX+kKv9ztoxvIx8+ilHqk3Frd23BTH6rZjHw
   3Y4QLU+6RItxsBzpf+UdXsj+fJgCp0U4e4h1rtx8Q19Grave19aRnZEQy
   T+X/o23/40szMTDOKmIGusvUwHsbS6bJnaDKaGTBB6YhUlHrVpXUpA/qF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="351758925"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="351758925"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 15:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="727868787"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="727868787"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jul 2023 15:14:04 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMbuO-0006ZI-0i;
	Thu, 20 Jul 2023 22:14:04 +0000
Date: Fri, 21 Jul 2023 06:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 15/19]
 arch/powerpc/include/asm/bitops.h:280:54: error: use of undeclared
 identifier 'nr'
Message-ID: <202307210619.jGiZUyZy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   d6ef97f72f7a2d79a24800e83fde132fd704ed05
commit: 6bb72a8aa141cc8d24e20fe5cdaf3170f1c9284a [15/19] bitops: Add change_and_unlock_is_negative_byte()
config: powerpc-randconfig-r014-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210619.jGiZUyZy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210619.jGiZUyZy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210619.jGiZUyZy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:68:
>> arch/powerpc/include/asm/bitops.h:280:54: error: use of undeclared identifier 'nr'
     280 |         unsigned long *p = (unsigned long *)addr + BIT_WORD(nr);
         |                                                             ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1 shuffle=2073655496
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=2073655496
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2073655496
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2073655496
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
