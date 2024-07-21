Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB05833C8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 19:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721590563; cv=none; b=fEWn5TzattQPdI2l3Nk0Gzfv0Id8bKq8gAix7FLoPbjE3BtOCvvklXB1xqOU6ufOfwDp/6KIyUyiEiaPJkJBRalLrWeiZoZpjm/l/fm7HCSUIqwc/RfxBGSZG+9NPyCKxq8s2/6Z0MIFE9SxbbtLgEzay0+p4HVQsLvpkPG1fgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721590563; c=relaxed/simple;
	bh=ARPvTAdASDcOyETEwRk5aoiIaOXQ3AdDfvZgc3f7fCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQAAqg0hXxHZYpjhH21dvC5j4NhwO1IN+Scbyt1+qdH799WCcJEGCB06zK1zwZvZ0hAg8dgpHQB/WC0Qo3xI6L1zcBEOloituWzva+R/vDHIOAzCLmN/lIrZ2XdxdVvqhkccAAivNCcwgYDzGpYX4HoiFFkC6W58K7hnojIXfLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ox6LUWUK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ox6LUWUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721590558; x=1753126558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ARPvTAdASDcOyETEwRk5aoiIaOXQ3AdDfvZgc3f7fCA=;
  b=Ox6LUWUK9kRYkm8hdvCPYdSMTlNJNhbSd/1nJ+MKDk/v8w8qydKsDyuJ
   7u1OBII1yVsuq1QugRe3NrSZq9MMdeGRjceAu0iKBilcg58hSO+7Wodyx
   uP6hWT5UrloBrW4UmhpJwdR1nvNhcQ/Hgw9/IGeX5ostv8VUDssjvhz73
   RErtekonPg+QOcFn4MNx5sDsDIVATnV6dy4++Te92W7wKsoCuOKgK2jaO
   1OGN2uuBh2Db571XhkuuyOYa5ohs6brdtky8Xdmnnqj1nV9Nyi2WckBSb
   YLCteowyY/c5zrYS1ZckHkDLW0jXMyqoryF0RWTlYm+s2uzFMNTtS7oc0
   Q==;
X-CSE-ConnectionGUID: B9AEqsztTMC3gkXrM+TuEw==
X-CSE-MsgGUID: uEJfwsxJQKuSVCkhLW8Y7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22050598"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="22050598"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 12:35:57 -0700
X-CSE-ConnectionGUID: RRiuMcPoQfKA8458Q/WaOw==
X-CSE-MsgGUID: W9nrCDWcTf2o9U3D3x9zCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51549165"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jul 2024 12:35:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVcLZ-000kWg-0h;
	Sun, 21 Jul 2024 19:35:53 +0000
Date: Mon, 22 Jul 2024 03:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 31/43] arch/s390/include/asm/pgalloc.h:140:27:
 error: initialization of 'struct ptdesc *' from incompatible pointer type
 'pte_t *'
Message-ID: <202407220341.lYwXVnPX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   24c8778745b223097d5e3d590967626176306b1d
commit: 3ee93675accebc1936331d1225cb0e84411ee71f [31/43] mm/pgtable: fully use ptdesc in pte_alloc_one series functions
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240722/202407220341.lYwXVnPX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407220341.lYwXVnPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407220341.lYwXVnPX-lkp@intel.com/

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

b2fa47e6bf5148 arch/s390/include/asm/pgalloc.h Martin Schwidefsky      2011-05-23  135  
^1da177e4c3f41 include/asm-s390/pgalloc.h      Linus Torvalds          2005-04-16  136  /*
^1da177e4c3f41 include/asm-s390/pgalloc.h      Linus Torvalds          2005-04-16  137   * page table entry allocation/free routines.
^1da177e4c3f41 include/asm-s390/pgalloc.h      Linus Torvalds          2005-04-16  138   */
4cf58924951ef8 arch/s390/include/asm/pgalloc.h Joel Fernandes (Google  2019-01-03  139) #define pte_alloc_one_kernel(mm) ((pte_t *)page_table_alloc(mm))
4cf58924951ef8 arch/s390/include/asm/pgalloc.h Joel Fernandes (Google  2019-01-03 @140) #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
146e4b3c8b9207 include/asm-s390/pgalloc.h      Martin Schwidefsky      2008-02-09  141  

:::::: The code at line 140 was first introduced by commit
:::::: 4cf58924951ef80eec636b863e7a53973c44261a mm: treewide: remove unused address argument from pte_alloc functions

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
