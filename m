Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDEC8D7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721595549; cv=none; b=kmHBqZd29NEEd9YGf3qoXJ4oq2dXyTHA4SG+SuDcN13oqt2g1RGHVxXBqGb94a8hrdB+wo32gcalcjRn7XgYYImhJAeUONoWUDBSynMKx5jC2qWSa8YQBgoaJftZKCNYedsqeGpaNrOezQNCueNM0ZPcvsEsWo5C0waoA9FJdC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721595549; c=relaxed/simple;
	bh=/d31BB0yA2fM5yvO3KMy6keYxAmMMVCXFyyerI/5kSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mGTRKxhktPe5m7mfYuUVrMq5p4z+2Wg2D4yRMENEFS0kCOviuZMo5KkX9qCtlCG9Gbu1Mkc4/81D1rMlFKidt9PGtauiaBKz2lCgfXiYrMdXNffzt90izUmeB+tNylfQ7uAt/Vt63jBx29rIMZmGe549RD7ACqtyWNZ4EdFRLrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBY1nmwi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBY1nmwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721595546; x=1753131546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/d31BB0yA2fM5yvO3KMy6keYxAmMMVCXFyyerI/5kSk=;
  b=HBY1nmwihyEh7LPq0sf8JmFnj2Q+X8IKLRS6ah5651i/fbKRb/VM6w+i
   xEmo2Noa8vysed8XNReTllRkZK1pmadruZhYuDaEA4KzYD/27TGcZ3Spt
   mBe9orBO+ls2THF1NSCl4qyMwKfsUH+z8exSFKLSi4D17SQKUgzWVBcCS
   91PNU5tVS5PS/oKDsj5bhDDBYOdMWR6ANBwwfV7kcNbC927lZZzAqwEzq
   rNZFCvE5eAP1fX3QxPlSaBhPqYYscknJkrB2+qjljJYHasQhnA1R4U3Wp
   FHuSEW4pOLgztGPFNycXEDXxGLAyezbLvreXGKdr76DwI9mranumspyIb
   A==;
X-CSE-ConnectionGUID: vNxanXPUToGvJBkO3UrBRw==
X-CSE-MsgGUID: OQfwpatwRkuTcsxVJNQiQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="30577786"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="30577786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 13:59:05 -0700
X-CSE-ConnectionGUID: FwhrUp7uSamIfnzxvhyu8Q==
X-CSE-MsgGUID: pVyEQkV5TiSpY62J9PsqaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="56782755"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jul 2024 13:59:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVde2-000kd4-17;
	Sun, 21 Jul 2024 20:59:02 +0000
Date: Mon, 22 Jul 2024 04:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 43/43] mm/memory.c:194:27: error: passing
 argument 2 of 'pte_free_tlb' from incompatible pointer type
Message-ID: <202407220416.FUM32QfX-lkp@intel.com>
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
commit: 24c8778745b223097d5e3d590967626176306b1d [43/43] use ptdesc in free_pte_range and pte_free_tlb series functions
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240722/202407220416.FUM32QfX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407220416.FUM32QfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407220416.FUM32QfX-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'free_pte_range':
>> mm/memory.c:194:27: error: passing argument 2 of 'pte_free_tlb' from incompatible pointer type [-Wincompatible-pointer-types]
     194 |         pte_free_tlb(tlb, token, addr);
         |                           ^~~~~
         |                           |
         |                           struct ptdesc *
   In file included from mm/memory.c:88:
   arch/s390/include/asm/tlb.h:81:67: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      81 | static inline void pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
         |                                                         ~~~~~~~~~~^~~
   mm/memory.c: In function 'pmd_install':
   mm/memory.c:440:39: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     440 |                 pmd_populate(mm, pmd, *pte);
         |                                       ^~~~
         |                                       |
         |                                       struct ptdesc *
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
   arch/s390/include/asm/pgalloc.h:129:55: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
     129 |                                 pmd_t *pmd, pgtable_t pte)
         |                                             ~~~~~~~~~~^~~
   mm/memory.c: In function '__pte_alloc':
   arch/s390/include/asm/pgalloc.h:140:27: error: initialization of 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                           ^
   mm/memory.c:448:33: note: in expansion of macro 'pte_alloc_one'
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                                 ^~~~~~~~~~~~~
   mm/memory.c: In function '__do_fault':
   mm/memory.c:4650:35: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
    4650 |                 vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
         |                                   ^
   mm/memory.c: In function 'do_set_pmd':
   mm/memory.c:4728:35: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
    4728 |                 vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
         |                                   ^
   mm/memory.c: In function 'do_fault_around':
   mm/memory.c:5013:35: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
    5013 |                 vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
         |                                   ^


vim +/pte_free_tlb +194 mm/memory.c

d559db086ff5be KAMEZAWA Hiroyuki      2010-03-05  184  
^1da177e4c3f41 Linus Torvalds         2005-04-16  185  /*
^1da177e4c3f41 Linus Torvalds         2005-04-16  186   * Note: this doesn't free the actual pages themselves. That
^1da177e4c3f41 Linus Torvalds         2005-04-16  187   * has been handled earlier when unmapping all the memory regions.
^1da177e4c3f41 Linus Torvalds         2005-04-16  188   */
9e1b32caa525cb Benjamin Herrenschmidt 2009-07-22  189  static void free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
9e1b32caa525cb Benjamin Herrenschmidt 2009-07-22  190  			   unsigned long addr)
^1da177e4c3f41 Linus Torvalds         2005-04-16  191  {
24c8778745b223 Alex Shi (Tencent      2024-07-20  192) 	struct ptdesc *token = pmd_ptdesc(pmd);
^1da177e4c3f41 Linus Torvalds         2005-04-16  193  	pmd_clear(pmd);
9e1b32caa525cb Benjamin Herrenschmidt 2009-07-22 @194  	pte_free_tlb(tlb, token, addr);
c4812909f5d5a9 Kirill A. Shutemov     2017-11-15  195  	mm_dec_nr_ptes(tlb->mm);
^1da177e4c3f41 Linus Torvalds         2005-04-16  196  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  197  

:::::: The code at line 194 was first introduced by commit
:::::: 9e1b32caa525cb236e80e9c671e179bcecccc657 mm: Pass virtual address to [__]p{te,ud,md}_free_tlb()

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
