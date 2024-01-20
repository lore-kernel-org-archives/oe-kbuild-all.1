Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1210E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705721188; cv=none; b=foVsZZLs7Ur7doddwjU+Bu5AXK+SayfC+ZfUuEb162dNU4fmD1VeoAJPDDBlKDzc/vNbDSvhUFRoWES/Tm5h90/ozSDtIWRhTYkYGwQAuoFXKsCkzUVtObFyw39v5/oXW97+5XHzRQiaoVaEuHuNunjZrxt79Ta4Tnk3Kbm6ywo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705721188; c=relaxed/simple;
	bh=lhd7k57rTm6G3lDJZHchNEi+jMvZ/jdSCFlKMfTci28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K5bUQQ87GX3HCi+47ApifGcte9jFOE24ubWZv+6whSScskZj7XuXnI6HwXc3mxjbDpi1oIWeJ3jMDb6vYHd3LiPHv3/kVoy8AwixmtCnR1Bjxq33aWa67VEAiYyK88iYLFM+k5JbfdaKa7hrwe8hl7TToIsZTIyp0wbqHl8BV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Szy2IvY0; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Szy2IvY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705721186; x=1737257186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lhd7k57rTm6G3lDJZHchNEi+jMvZ/jdSCFlKMfTci28=;
  b=Szy2IvY0cADO2Ha9sBa7G8sfJ/3zG3zQ805n/D+gaq7+PWKO5u+D0QJJ
   /V9+lNV4THpMQFVp+nYhPyGNSZ/PY7YvG+7jN0yIqYRIoHLvMiUj4Pp7d
   uyAX4IySbI4Vs1ImO2oTLZ99F1elcKv+cdrD8G7jehMNH2ZGyquR3KAVK
   us01maXQ2Pw9qK17lDCtJA7ZYlxYdl5WXYHNb2xaJucBxCnCYsOfz7RF1
   WHqvaFFJDE4JRFWxKwLzdPBZvj5YATKLC4dzgRB7f9/KorbhxNXKKFIyv
   C8tlH58miQlSpyvXVtjEq/fCuS81O4O9+20uL0zcUAJvjyraCV95VygSR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="391351739"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="391351739"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 19:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="734701785"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="734701785"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Jan 2024 19:26:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR1zy-0004gE-0N;
	Sat, 20 Jan 2024 03:26:22 +0000
Date: Sat, 20 Jan 2024 11:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_batching 11/11]
 include/linux/pgtable.h:617:21: error: conflicting types for
 'ptep_get_and_clear_full'; have 'pte_t(struct mm_struct *, long unsigned
 int,  pte_t *, int)' {aka 'unsigned int(struct mm_struct *, long unsigned
 int,  unsigned int *, int)'}
Message-ID: <202401201154.beH1Kb8p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_batching
head:   c54f3b69b7a799efa06dbf58a60db9b3fac04111
commit: c54f3b69b7a799efa06dbf58a60db9b3fac04111 [11/11] mm/memory: optimize unmap/zap with PTE-mapped THP
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401201154.beH1Kb8p-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201154.beH1Kb8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201154.beH1Kb8p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/include/asm/page.h:171,
                    from arch/arm/include/asm/thread_info.h:14,
                    from include/linux/thread_info.h:60,
                    from include/linux/sched.h:14,
                    from arch/arm/kernel/asm-offsets.c:11:
   include/linux/pgtable.h: In function 'pte_next_pfn':
   include/linux/pgtable.h:218:45: error: 'PFN_PTE_SHIFT' undeclared (first use in this function)
     218 |         return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                             ^~~~~~~~~~~~~
   arch/arm/include/asm/pgtable-2level-types.h:49:26: note: in definition of macro '__pte'
      49 | #define __pte(x)        (x)
         |                          ^
   include/linux/pgtable.h:218:45: note: each undeclared identifier is reported only once for each function it appears in
     218 |         return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                             ^~~~~~~~~~~~~
   arch/arm/include/asm/pgtable-2level-types.h:49:26: note: in definition of macro '__pte'
      49 | #define __pte(x)        (x)
         |                          ^
   In file included from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
   include/linux/pgtable.h: In function 'wrprotect_ptes':
   include/linux/pgtable.h:227:17: error: implicit declaration of function 'ptep_set_wrprotect'; did you mean 'pte_wrprotect'? [-Werror=implicit-function-declaration]
     227 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 pte_wrprotect
   include/linux/pgtable.h: In function 'get_and_clear_full_ptes':
   include/linux/pgtable.h:250:15: error: implicit declaration of function 'ptep_get_and_clear_full' [-Werror=implicit-function-declaration]
     250 |         pte = ptep_get_and_clear_full(mm, addr, ptep, full);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h: At top level:
>> include/linux/pgtable.h:617:21: error: conflicting types for 'ptep_get_and_clear_full'; have 'pte_t(struct mm_struct *, long unsigned int,  pte_t *, int)' {aka 'unsigned int(struct mm_struct *, long unsigned int,  unsigned int *, int)'}
     617 | static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:250:15: note: previous implicit declaration of 'ptep_get_and_clear_full' with type 'int()'
     250 |         pte = ptep_get_and_clear_full(mm, addr, ptep, full);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:688:20: warning: conflicting types for 'ptep_set_wrprotect'; have 'void(struct mm_struct *, long unsigned int,  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  unsigned int *)'}
     688 | static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:688:20: error: static declaration of 'ptep_set_wrprotect' follows non-static declaration
   include/linux/pgtable.h:227:17: note: previous implicit declaration of 'ptep_set_wrprotect' with type 'void(struct mm_struct *, long unsigned int,  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  unsigned int *)'}
     227 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +617 include/linux/pgtable.h

a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox   2017-02-24  615  
a600388d284193 include/asm-generic/pgtable.h Zachary Amsden   2005-09-03  616  #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR_FULL
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13 @617  static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13  618  					    unsigned long address, pte_t *ptep,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13  619  					    int full)
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13  620  {
d3a89233583bf8 include/linux/pgtable.h       zhang songyi     2022-11-28  621  	return ptep_get_and_clear(mm, address, ptep);
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13  622  }
a600388d284193 include/asm-generic/pgtable.h Zachary Amsden   2005-09-03  623  #endif
a600388d284193 include/asm-generic/pgtable.h Zachary Amsden   2005-09-03  624  
7df676974359f9 include/asm-generic/pgtable.h Bibo Mao         2020-05-27  625  

:::::: The code at line 617 was first introduced by commit
:::::: e2cda322648122dc400c85ada80eaddbc612ef6a thp: add pmd mangling generic functions

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
