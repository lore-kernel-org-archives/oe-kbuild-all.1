Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED058202963
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239261; cv=none; b=P0R1lgv3a3y7Qat+HwJh4i2JvIQyCqyv7OMPWcfpLN6Lws6vcr1mfnM5fQV1gxlNbgTr+OYQmg9FMpqu8xSMHqhX1HkhWxZm6De0Lw6Xp5UACf7uuyEEo9hJOii7Bg/HawshpN/ingVpPqJBCI/qgkfPSrltrJ9lJPDSZIu3tMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239261; c=relaxed/simple;
	bh=nZYtKjvO3GA7G0gGQcgsNPtYs2Rq5SC8qtY5NYFQSkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNy3DhSFRwciptKHe1VWe3cAMUCPh2hXRkHAzD9XKPK8QQQXLfLt/BUdduvhnf1FY9v9yawpUZ5zaYVKVZbfkCqW4TS+NuxgxSTrMLdGsdl0f3L6BK0SL1beoSB/FF5zV98GFfsGpPW86uW4RvdV/0HacMDwFo9MWgmoetvlpvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUZ4nycG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUZ4nycG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766239260; x=1797775260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZYtKjvO3GA7G0gGQcgsNPtYs2Rq5SC8qtY5NYFQSkc=;
  b=lUZ4nycGzvqe0xSF4+y5OPnGbVPMJqV7499VsF84sd4ns9BNS+oBQZWf
   md3nrC0TOE8y2PljQqcpTGt0nHxlIG1sHEvnHmk9aBoKQ0Sh1+azUkA1y
   BFeNn3oT+iqZDH5J5Sa50LD4gv+p8UHTDMxl9ixGLq0ely3fJqdtjOaC7
   bKweJkwg0L5Q1ASnOYRxqEIw7SX8b6iTFW8cli6KYLwaRkK+jlfPfTSqq
   9TmFMbYX8uXO5bGWaGzRyaftD2BMS2vjlKonXzds9XNMFCQRp9zgdpg6A
   vdg4hQ1IULlXsIX93l1tx1eyCNx8qQLjZEMiY8XngyPJrWAZYOQr7DK4E
   w==;
X-CSE-ConnectionGUID: RpVIiOTgTNWkbSTqUcMUmA==
X-CSE-MsgGUID: wZdOcbtzSQim18WgIzHe4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85590750"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85590750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:00:58 -0800
X-CSE-ConnectionGUID: 8Tq21H+xRtCIzOgwSrIUKg==
X-CSE-MsgGUID: 6yBTSYfwTR20yHjmMPiozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199344205"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 06:00:56 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxVu-000000004bU-1m81;
	Sat, 20 Dec 2025 14:00:54 +0000
Date: Sat, 20 Dec 2025 21:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc1216 1/1] arch/m68k/include/asm/sun3_pgalloc.h:30:58:
 error: passing argument 1 of 'lowmem_page_address' from incompatible pointer
 type
Message-ID: <202512202109.eIfoMrcJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc1216
head:   d02e2979ce67b963aaf8bdb8ec12e4dc8b294af8
commit: d02e2979ce67b963aaf8bdb8ec12e4dc8b294af8 [1/1] mm/pgtable: convert pgtable_t to ptdesc pointer
config: m68k-sun3_defconfig (https://download.01.org/0day-ci/archive/20251220/202512202109.eIfoMrcJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202109.eIfoMrcJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202109.eIfoMrcJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:54,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/shrinker.h:5,
                    from include/linux/list_lru.h:13,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/dax.h:5,
                    from mm/filemap.c:15:
   arch/m68k/include/asm/sun3_pgalloc.h: In function 'pmd_populate':
>> arch/m68k/include/asm/sun3_pgalloc.h:30:58: error: passing argument 1 of 'lowmem_page_address' from incompatible pointer type [-Wincompatible-pointer-types]
      30 |         pmd_val(*pmd) = __pa((unsigned long)page_address(page));
         |                                                          ^~~~
         |                                                          |
         |                                                          pgtable_t {aka struct ptdesc *}
   arch/m68k/include/asm/page_mm.h:94:39: note: in definition of macro '__pa'
      94 | #define __pa(x) ___pa((unsigned long)(x))
         |                                       ^
   arch/m68k/include/asm/sun3_pgalloc.h:30:45: note: in expansion of macro 'page_address'
      30 |         pmd_val(*pmd) = __pa((unsigned long)page_address(page));
         |                                             ^~~~~~~~~~~~
   In file included from include/linux/dax.h:6:
   include/linux/mm.h:2510:69: note: expected 'const struct page *' but argument is of type 'pgtable_t' {aka 'struct ptdesc *'}
    2510 | static __always_inline void *lowmem_page_address(const struct page *page)
         |                                                  ~~~~~~~~~~~~~~~~~~~^~~~
   arch/m68k/include/asm/page.h:34:24: note: 'pgtable_t' declared here
      34 | typedef struct ptdesc *pgtable_t;
         |                        ^~~~~~~~~
--
   In file included from arch/m68k/include/asm/page.h:54,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/kernel_stat.h:5,
                    from mm/memory.c:42:
   arch/m68k/include/asm/sun3_pgalloc.h: In function 'pmd_populate':
>> arch/m68k/include/asm/sun3_pgalloc.h:30:58: error: passing argument 1 of 'lowmem_page_address' from incompatible pointer type [-Wincompatible-pointer-types]
      30 |         pmd_val(*pmd) = __pa((unsigned long)page_address(page));
         |                                                          ^~~~
         |                                                          |
         |                                                          pgtable_t {aka struct ptdesc *}
   arch/m68k/include/asm/page_mm.h:94:39: note: in definition of macro '__pa'
      94 | #define __pa(x) ___pa((unsigned long)(x))
         |                                       ^
   arch/m68k/include/asm/sun3_pgalloc.h:30:45: note: in expansion of macro 'page_address'
      30 |         pmd_val(*pmd) = __pa((unsigned long)page_address(page));
         |                                             ^~~~~~~~~~~~
   In file included from mm/memory.c:43:
   include/linux/mm.h:2510:69: note: expected 'const struct page *' but argument is of type 'pgtable_t' {aka 'struct ptdesc *'}
    2510 | static __always_inline void *lowmem_page_address(const struct page *page)
         |                                                  ~~~~~~~~~~~~~~~~~~~^~~~
   arch/m68k/include/asm/page.h:34:24: note: 'pgtable_t' declared here
      34 | typedef struct ptdesc *pgtable_t;
         |                        ^~~~~~~~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:34,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8:
   mm/memory.c: In function 'free_pte_range':
   include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'struct ptdesc *' is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   arch/m68k/include/asm/sun3_pgalloc.h:21:34: note: in expansion of macro 'page_ptdesc'
      21 |         tlb_remove_ptdesc((tlb), page_ptdesc(pte))
         |                                  ^~~~~~~~~~~
   include/asm-generic/tlb.h:731:17: note: in expansion of macro '__pte_free_tlb'
     731 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~
   mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~


vim +/lowmem_page_address +30 arch/m68k/include/asm/sun3_pgalloc.h

^1da177e4c3f41 include/asm-m68k/sun3_pgalloc.h Linus Torvalds     2005-04-16  27  
2f569afd9ced9e include/asm-m68k/sun3_pgalloc.h Martin Schwidefsky 2008-02-08  28  static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t page)
^1da177e4c3f41 include/asm-m68k/sun3_pgalloc.h Linus Torvalds     2005-04-16  29  {
^1da177e4c3f41 include/asm-m68k/sun3_pgalloc.h Linus Torvalds     2005-04-16 @30  	pmd_val(*pmd) = __pa((unsigned long)page_address(page));
^1da177e4c3f41 include/asm-m68k/sun3_pgalloc.h Linus Torvalds     2005-04-16  31  }
^1da177e4c3f41 include/asm-m68k/sun3_pgalloc.h Linus Torvalds     2005-04-16  32  

:::::: The code at line 30 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
