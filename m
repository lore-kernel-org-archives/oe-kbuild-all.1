Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B228135FF40
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770987513; cv=none; b=PAwaBanwn8i2YfVn9xe/cg0YnsI4KsU1iLf51XzqCQFvmLLLFMxyqQIDNi/bYxIZfBzQv6L4sfU2swWhPywGIFFlZj9offMidBZFYQfOjRKtFWcisIartLJ37Lcp0diuNGoRhlDhB/10hutJvF7vS/jHyyAwCadP6q9fJD22Okk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770987513; c=relaxed/simple;
	bh=qW1VTrgrYSDFhq/Nsi8+Mjnlq0McB/Mb/DeNIQIMxXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OxBv/zUY1jNreJy3vx33SyJAxYI7xYQ7hSdEyIMh1qdk5zjWCAsMA4wqbXHE+DIe7DkfsvKhO/xHrt6uHuNKJibFwr9zDQJXKJs/WcpkDEVBhCV6bUmSGwqHMVjFIyexN21TtU38E/cgyk6SzLa9gFeDuGXvfCNP9OkgBB3ftu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6Ea4Hk6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6Ea4Hk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770987510; x=1802523510;
  h=date:from:to:cc:subject:message-id;
  bh=qW1VTrgrYSDFhq/Nsi8+Mjnlq0McB/Mb/DeNIQIMxXE=;
  b=d6Ea4Hk6JHVRObwECm35VFmnZkmOPzepwITF4zJENsOSVOG7iAlEj5bw
   yuBACvVSvjl4e4XmF8MEWaHL22Kdht/QdM0z5H9MonAkqHlwd0igihdRN
   CYXbfOlAkXxms3Zi0QUrxOX9GKJiV7DmT+CIS4I3vSXLssChIG5KXEPyU
   aWmhRLHOkb8WckkxjSJTe+qRWZEArebcOYcxgykPiLnVPUxA/j0Tc+i7m
   cKRYlNPzc1rX6XfCh0U7ncynG6NDNWnJjHw3MU6wovF90Iekd7ALZA8Fi
   cIxypY7XmrTgUZrHhWQh6WRTqlLOxSB4kuS2XLchyeEa6IJdM/N/oa4kL
   w==;
X-CSE-ConnectionGUID: Ze+bQljlShqrWB3T8pUMdQ==
X-CSE-MsgGUID: P7T7VdBhTQyORXUYGqLvZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89583115"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="89583115"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 04:58:29 -0800
X-CSE-ConnectionGUID: 4hToFEYsRZakALcZ9e2qvg==
X-CSE-MsgGUID: YoQvi4BHRS2j9rlrUzYJcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="217059270"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Feb 2026 04:58:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqskb-00000000vNA-1BXt;
	Fri, 13 Feb 2026 12:58:25 +0000
Date: Fri, 13 Feb 2026 20:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 9/16] mm/highmem.c:291:56: error: implicit
 declaration of function 'mk_pte'; did you mean 'mkpte'?
Message-ID: <202602132005.EI3Dm0zF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   f562d70c53ccc0213b4afbf20fc312d85f9972bb
commit: ddb2f7282e42e469f2d3e51ef1e2c170ab23543c [9/16] mkpte
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602132005.EI3Dm0zF-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602132005.EI3Dm0zF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602132005.EI3Dm0zF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from mm/highmem.c:20:
   arch/sparc/include/asm/pgtable_32.h:51:9: warning: 'PTE_SIZE' redefined
      51 | #define PTE_SIZE                (PTRS_PER_PTE*4)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/page_32.h:14,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/vdso/page.h:15:9: note: this is the location of the previous definition
      15 | #define PTE_SIZE        (_AC(1,UL) << CONFIG_PTE_SHIFT)
         |         ^~~~~~~~
   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from mm/highmem.c:22:
   include/linux/highmem.h: In function 'memcpy_folio':
   include/linux/highmem.h:413:41: error: implicit declaration of function 'offset_in_page'; did you mean 'offset_in_pg'? [-Wimplicit-function-declaration]
     413 |                     chunk > PAGE_SIZE - offset_in_page(dst_off))
         |                                         ^~~~~~~~~~~~~~
         |                                         offset_in_pg
   mm/highmem.c: In function 'map_new_virtual':
>> mm/highmem.c:291:56: error: implicit declaration of function 'mk_pte'; did you mean 'mkpte'? [-Wimplicit-function-declaration]
     291 |                    &(pkmap_page_table[last_pkmap_nr]), mk_pte(page, kmap_prot));
         |                                                        ^~~~~~
   include/linux/pgtable.h:303:66: note: in definition of macro 'set_pte_at'
     303 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
--
   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from arch/sparc/mm/iommu.c:13:
   arch/sparc/include/asm/pgtable_32.h:51:9: warning: 'PTE_SIZE' redefined
      51 | #define PTE_SIZE                (PTRS_PER_PTE*4)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/page_32.h:14,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/vdso/page.h:15:9: note: this is the location of the previous definition
      15 | #define PTE_SIZE        (_AC(1,UL) << CONFIG_PTE_SHIFT)
         |         ^~~~~~~~
   In file included from include/linux/dma-mapping.h:8,
                    from include/linux/dma-map-ops.h:9,
                    from arch/sparc/mm/iommu.c:15:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/linux/scatterlist.h:211:52: error: implicit declaration of function 'offset_in_page'; did you mean 'offset_in_pg'? [-Wimplicit-function-declaration]
     211 |         sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
         |                                                    ^~~~~~~~~~~~~~
         |                                                    offset_in_pg
   arch/sparc/mm/iommu.c: In function 'iommu_flush_iotlb':
   arch/sparc/mm/iommu.c:164:15: error: implicit declaration of function 'PAGE_ALIGN'; did you mean 'PTE_ALIGN'? [-Wimplicit-function-declaration]
     164 |         end = PAGE_ALIGN(start + niopte*sizeof(iopte_t));
         |               ^~~~~~~~~~
         |               PTE_ALIGN
   arch/sparc/mm/iommu.c: In function 'sbus_iommu_alloc':
>> arch/sparc/mm/iommu.c:364:39: error: implicit declaration of function 'mk_pte'; did you mean 'mkpte'? [-Wimplicit-function-declaration]
     364 |                         set_pte(ptep, mk_pte(virt_to_page(page), dvma_prot));
         |                                       ^~~~~~
         |                                       mkpte
--
   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from arch/sparc/mm/io-unit.c:12:
   arch/sparc/include/asm/pgtable_32.h:51:9: warning: 'PTE_SIZE' redefined
      51 | #define PTE_SIZE                (PTRS_PER_PTE*4)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/page_32.h:14,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from arch/sparc/mm/io-unit.c:10:
   include/vdso/page.h:15:9: note: this is the location of the previous definition
      15 | #define PTE_SIZE        (_AC(1,UL) << CONFIG_PTE_SHIFT)
         |         ^~~~~~~~
   In file included from include/linux/dma-mapping.h:8,
                    from include/linux/dma-map-ops.h:9,
                    from arch/sparc/mm/io-unit.c:14:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/linux/scatterlist.h:211:52: error: implicit declaration of function 'offset_in_page'; did you mean 'offset_in_pg'? [-Wimplicit-function-declaration]
     211 |         sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
         |                                                    ^~~~~~~~~~~~~~
         |                                                    offset_in_pg
   arch/sparc/mm/io-unit.c: In function 'iounit_alloc':
   arch/sparc/mm/io-unit.c:228:15: error: implicit declaration of function 'PAGE_ALIGN'; did you mean 'PTE_ALIGN'? [-Wimplicit-function-declaration]
     228 |         len = PAGE_ALIGN(len);
         |               ^~~~~~~~~~
         |               PTE_ALIGN
>> arch/sparc/mm/io-unit.c:250:39: error: implicit declaration of function 'mk_pte'; did you mean 'mkpte'? [-Wimplicit-function-declaration]
     250 |                         set_pte(ptep, mk_pte(virt_to_page(page), dvma_prot));
         |                                       ^~~~~~
         |                                       mkpte


vim +291 mm/highmem.c

ce6234b5298902 Jeremy Fitzhardinge 2007-05-02  244  
^1da177e4c3f41 Linus Torvalds      2005-04-16  245  static inline unsigned long map_new_virtual(struct page *page)
^1da177e4c3f41 Linus Torvalds      2005-04-16  246  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  247  	unsigned long vaddr;
^1da177e4c3f41 Linus Torvalds      2005-04-16  248  	int count;
15de36a4c3cf33 Max Filippov        2014-08-06  249  	unsigned int last_pkmap_nr;
15de36a4c3cf33 Max Filippov        2014-08-06  250  	unsigned int color = get_pkmap_color(page);
^1da177e4c3f41 Linus Torvalds      2005-04-16  251  
^1da177e4c3f41 Linus Torvalds      2005-04-16  252  start:
15de36a4c3cf33 Max Filippov        2014-08-06  253  	count = get_pkmap_entries_count(color);
^1da177e4c3f41 Linus Torvalds      2005-04-16  254  	/* Find an empty entry */
^1da177e4c3f41 Linus Torvalds      2005-04-16  255  	for (;;) {
15de36a4c3cf33 Max Filippov        2014-08-06  256  		last_pkmap_nr = get_next_pkmap_nr(color);
15de36a4c3cf33 Max Filippov        2014-08-06  257  		if (no_more_pkmaps(last_pkmap_nr, color)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  258  			flush_all_zero_pkmaps();
15de36a4c3cf33 Max Filippov        2014-08-06  259  			count = get_pkmap_entries_count(color);
^1da177e4c3f41 Linus Torvalds      2005-04-16  260  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  261  		if (!pkmap_count[last_pkmap_nr])
^1da177e4c3f41 Linus Torvalds      2005-04-16  262  			break;	/* Found a usable entry */
^1da177e4c3f41 Linus Torvalds      2005-04-16  263  		if (--count)
^1da177e4c3f41 Linus Torvalds      2005-04-16  264  			continue;
^1da177e4c3f41 Linus Torvalds      2005-04-16  265  
^1da177e4c3f41 Linus Torvalds      2005-04-16  266  		/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  267  		 * Sleep for somebody else to unmap their entries
^1da177e4c3f41 Linus Torvalds      2005-04-16  268  		 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  269  		{
^1da177e4c3f41 Linus Torvalds      2005-04-16  270  			DECLARE_WAITQUEUE(wait, current);
15de36a4c3cf33 Max Filippov        2014-08-06  271  			wait_queue_head_t *pkmap_map_wait =
15de36a4c3cf33 Max Filippov        2014-08-06  272  				get_pkmap_wait_queue_head(color);
^1da177e4c3f41 Linus Torvalds      2005-04-16  273  
^1da177e4c3f41 Linus Torvalds      2005-04-16  274  			__set_current_state(TASK_UNINTERRUPTIBLE);
15de36a4c3cf33 Max Filippov        2014-08-06  275  			add_wait_queue(pkmap_map_wait, &wait);
3297e760776af1 Nicolas Pitre       2009-03-04  276  			unlock_kmap();
^1da177e4c3f41 Linus Torvalds      2005-04-16  277  			schedule();
15de36a4c3cf33 Max Filippov        2014-08-06  278  			remove_wait_queue(pkmap_map_wait, &wait);
3297e760776af1 Nicolas Pitre       2009-03-04  279  			lock_kmap();
^1da177e4c3f41 Linus Torvalds      2005-04-16  280  
^1da177e4c3f41 Linus Torvalds      2005-04-16  281  			/* Somebody else might have mapped it while we slept */
^1da177e4c3f41 Linus Torvalds      2005-04-16  282  			if (page_address(page))
^1da177e4c3f41 Linus Torvalds      2005-04-16  283  				return (unsigned long)page_address(page);
^1da177e4c3f41 Linus Torvalds      2005-04-16  284  
^1da177e4c3f41 Linus Torvalds      2005-04-16  285  			/* Re-start */
^1da177e4c3f41 Linus Torvalds      2005-04-16  286  			goto start;
^1da177e4c3f41 Linus Torvalds      2005-04-16  287  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  288  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  289  	vaddr = PKMAP_ADDR(last_pkmap_nr);
^1da177e4c3f41 Linus Torvalds      2005-04-16  290  	set_pte_at(&init_mm, vaddr,
^1da177e4c3f41 Linus Torvalds      2005-04-16 @291  		   &(pkmap_page_table[last_pkmap_nr]), mk_pte(page, kmap_prot));
^1da177e4c3f41 Linus Torvalds      2005-04-16  292  
^1da177e4c3f41 Linus Torvalds      2005-04-16  293  	pkmap_count[last_pkmap_nr] = 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  294  	set_page_address(page, (void *)vaddr);
^1da177e4c3f41 Linus Torvalds      2005-04-16  295  
^1da177e4c3f41 Linus Torvalds      2005-04-16  296  	return vaddr;
^1da177e4c3f41 Linus Torvalds      2005-04-16  297  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  298  

:::::: The code at line 291 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
