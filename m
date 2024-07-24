Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1108115B102
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721835747; cv=none; b=mOrxHnVdSV+nQ8j1DKBN8IacQdG+Iuay1MBNDJBhSk47q6O4+6vJXB/C9JUU3HjoINfQt1x/3/TpA2T6cnBjpXBCqEh/nE8RGINaA+Q9irCJf4BVSWmLQ7pQLJENmVhd59mmVx1TE7qO0upIlnJsfx9zvzYJBTNw1cppAeF2ijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721835747; c=relaxed/simple;
	bh=anKiYU/h5siF3hPIeuXWUvqLUxqlGFaWYFX57EkpUkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DMjhxXL+wni9l3MT+QonlDS+62l8NwOyrvL0/K48MSxjjP7ZzQeppuQNcDCSOckOSIOZ635QrzLs+0zIfpWDVE+NBvDVDrjfNita4y8pX98ut+ltu0SPPUVK/73HLT0LW+puGexRpWR6x98ABJwry7fAcAMtKh+zYsqPkrnwkpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQqujahC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQqujahC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721835746; x=1753371746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anKiYU/h5siF3hPIeuXWUvqLUxqlGFaWYFX57EkpUkg=;
  b=AQqujahCzXQqjwEnAJIqEeK1kMvN6f9l9bDdVVLlAJngTAMhiyf8tmgp
   i/KTdpsENVwA7j1FM6XrUC5gFPV9tGWMPNDPQ0Y5yKNs85emnIkyk6k22
   lJukfPAl2kw8dUnQ0cQctuEc9bnXhzwjQoJcYbAROTSnqXa7xFJJ2ocFh
   gEgYIuu8ABonLSTX7hQqYjEwD+s+Dzweh1Nl2dOKLQFpxxoVJ50Xrma7S
   IWvYNiBToapuCZmHwhZ5gKJY8rZYpRzoDe7Eh3m8aMNm6voUIwtq1C5bl
   jmB15IOn5XP9lvAeZEUElVhZSjk8Qq3TpqPXf8eUsJfUt19z2gTYIrf3w
   g==;
X-CSE-ConnectionGUID: My7wpQQ0T0KVqft1fc9Fgw==
X-CSE-MsgGUID: T9prcAiVS9ye/VQlPVOJ+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19660254"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="19660254"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 08:42:25 -0700
X-CSE-ConnectionGUID: 2BJs7C2FS2eQyznFDaJtQQ==
X-CSE-MsgGUID: oASMGbLPTnit3P0w95R6Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52308056"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jul 2024 08:42:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWe8E-000n8e-0v;
	Wed, 24 Jul 2024 15:42:22 +0000
Date: Wed, 24 Jul 2024 23:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 31/41] arch/s390/include/asm/pgalloc.h:140:27:
 error: initialization of 'struct ptdesc *' from incompatible pointer type
 'pte_t *'
Message-ID: <202407242312.7e6oLU4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   45de53e1a6ceb1ede64b54126f9ee514f50c4e4c
commit: a0b75c1c1fda3892f1c8e0946254a4cb1226e10a [31/41] mm/pgtable: fully use ptdesc in pte_alloc_one series functions
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240724/202407242312.7e6oLU4e-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242312.7e6oLU4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242312.7e6oLU4e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/mmu_context.h:11,
                    from arch/s390/include/asm/elf.h:173,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/mm_inline.h:8,
                    from mm/memory.c:45:
   mm/memory.c: In function '__pte_alloc':
>> arch/s390/include/asm/pgalloc.h:140:27: error: initialization of 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                           ^
   mm/memory.c:448:33: note: in expansion of macro 'pte_alloc_one'
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                                 ^~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/memory.c:44:
   mm/memory.c: In function '__do_fault':
   include/linux/mm_types.h:502:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:4650:37: note: in expansion of macro 'ptdesc_page'
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ^~~~~~~~~~~
   mm/memory.c: In function 'do_set_pmd':
   include/linux/mm_types.h:502:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:4728:37: note: in expansion of macro 'ptdesc_page'
    4728 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ^~~~~~~~~~~
   mm/memory.c: In function 'do_fault_around':
   include/linux/mm_types.h:502:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:5013:37: note: in expansion of macro 'ptdesc_page'
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ^~~~~~~~~~~
--
   mm/huge_memory.c: In function '__do_huge_pmd_anonymous_page':
>> mm/huge_memory.c:959:16: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
     959 |         ptdesc = pte_alloc_one(vma->vm_mm);
         |                ^
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/huge_memory.c:8:
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:997:66: note: in expansion of macro 'ptdesc_page'
     997 |                 pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, ptdesc_page(ptdesc));
         |                                                                  ^~~~~~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30:
   arch/s390/include/asm/pgtable.h:1717:43: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1717 |                                 pgtable_t pgtable);
         |                                 ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'do_huge_pmd_anonymous_page':
   mm/huge_memory.c:1091:24: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
    1091 |                 ptdesc = pte_alloc_one(vma->vm_mm);
         |                        ^
   include/linux/mm_types.h:504:41: error: passing argument 1 of 'set_huge_zero_folio' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1113:53: note: in expansion of macro 'ptdesc_page'
    1113 |                                 set_huge_zero_folio(ptdesc_page(ptdesc), vma->vm_mm, vma,
         |                                                     ^~~~~~~~~~~
   mm/huge_memory.c:1055:43: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1055 | static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
         |                                 ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'insert_pfn_pmd':
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1167:53: note: in expansion of macro 'ptdesc_page'
    1167 |                 pgtable_trans_huge_deposit(mm, pmd, ptdesc_page(ptdesc));
         |                                                     ^~~~~~~~~~~
   arch/s390/include/asm/pgtable.h:1717:43: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1717 |                                 pgtable_t pgtable);
         |                                 ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'vmf_insert_pfn_pmd':
   mm/huge_memory.c:1213:24: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
    1213 |                 ptdesc = pte_alloc_one(vma->vm_mm);
         |                        ^
   mm/huge_memory.c: In function 'copy_huge_pmd':
   mm/huge_memory.c:1376:16: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
    1376 |         ptdesc = pte_alloc_one(dst_mm);
         |                ^
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1449:53: note: in expansion of macro 'ptdesc_page'
    1449 |         pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc_page(ptdesc));
         |                                                     ^~~~~~~~~~~
   arch/s390/include/asm/pgtable.h:1717:43: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1717 |                                 pgtable_t pgtable);
         |                                 ~~~~~~~~~~^~~~~~~


vim +140 arch/s390/include/asm/pgalloc.h

b2fa47e6bf5148a arch/s390/include/asm/pgalloc.h Martin Schwidefsky      2011-05-23  135  
^1da177e4c3f415 include/asm-s390/pgalloc.h      Linus Torvalds          2005-04-16  136  /*
^1da177e4c3f415 include/asm-s390/pgalloc.h      Linus Torvalds          2005-04-16  137   * page table entry allocation/free routines.
^1da177e4c3f415 include/asm-s390/pgalloc.h      Linus Torvalds          2005-04-16  138   */
4cf58924951ef80 arch/s390/include/asm/pgalloc.h Joel Fernandes (Google  2019-01-03  139) #define pte_alloc_one_kernel(mm) ((pte_t *)page_table_alloc(mm))
4cf58924951ef80 arch/s390/include/asm/pgalloc.h Joel Fernandes (Google  2019-01-03 @140) #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
146e4b3c8b92071 include/asm-s390/pgalloc.h      Martin Schwidefsky      2008-02-09  141  

:::::: The code at line 140 was first introduced by commit
:::::: 4cf58924951ef80eec636b863e7a53973c44261a mm: treewide: remove unused address argument from pte_alloc functions

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
