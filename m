Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17652F44
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688808987; x=1720344987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ApViLmKZLyepJ+VR6gvdGKg08pG4RR7byOXKBc5CJ5E=;
  b=gMjhoj2hsPv1BjEdWtuxH7L2bMgKyrAZZwVMbTnK1uEo/Dr80ZdyUHVO
   eC8NLkwxlakEpAmQHp3OuLzsI9GKNdPojGRgNJX2GI3QMT06kEuZ0rMM7
   ejaEuIucSVPImGmJ1hBwhUaf9o1d5DsZBy5DRnKY6ClAB0DnpdZXNqVx9
   xIPfFgceKWEnOdMF7Zv5+Bb7JV8HqD1aKw1MQYwkEsmwpjzpWBksvnOkH
   K25vN8/QXW859Oy6IQptXCF7ZJEu3OrE42asvNQjjw6Fh8Fs+m0fkR/Y2
   L9LsAg6f662lASE0Uawu+60Bri4bSXOtlHZa+e/APvZasBVLrtGsuSXGF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="450406921"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="450406921"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 02:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="894244008"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="894244008"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Jul 2023 02:36:25 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qI4Ma-0002fI-1o;
	Sat, 08 Jul 2023 09:36:24 +0000
Date: Sat, 8 Jul 2023 17:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 16/38]
 arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT'
 undeclared; did you mean 'PFN_PTE_SHIFT'?
Message-ID: <202307081734.GBnWRzfv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   22fbf134ccc05ced10ef4638c97474c2cdd64ff8
commit: eb64def77fa61b6950442bebe13e2fd031104146 [16/38] microblaze: Implement the new page table range API
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20230708/202307081734.GBnWRzfv-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081734.GBnWRzfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307081734.GBnWRzfv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/pagewalk.h:5,
                    from fs/proc/task_mmu.c:2:
   fs/proc/task_mmu.c: In function 'pte_to_pagemap_entry':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   fs/proc/task_mmu.c:1422:33: note: in expansion of macro 'pte_pfn'
    1422 |                         frame = pte_pfn(pte);
         |                                 ^~~~~~~
   arch/microblaze/include/asm/pgtable.h:235:48: note: each undeclared identifier is reported only once for each function it appears in
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   fs/proc/task_mmu.c:1422:33: note: in expansion of macro 'pte_pfn'
    1422 |                         frame = pte_pfn(pte);
         |                                 ^~~~~~~
   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/mm_inline.h:7,
                    from fs/proc/task_mmu.c:3:
   arch/microblaze/include/asm/cacheflush.h: At top level:
   arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
      77 | static void flush_dcache_folio(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from mm/gup.c:7:
   mm/gup.c: In function 'follow_page_pte':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/gup.c:621:42: note: in expansion of macro 'pte_pfn'
     621 |                 *pgmap = get_dev_pagemap(pte_pfn(pte), *pgmap);
         |                                          ^~~~~~~
   arch/microblaze/include/asm/pgtable.h:235:48: note: each undeclared identifier is reported only once for each function it appears in
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/gup.c:621:42: note: in expansion of macro 'pte_pfn'
     621 |                 *pgmap = get_dev_pagemap(pte_pfn(pte), *pgmap);
         |                                          ^~~~~~~
   mm/gup.c: In function 'get_gate_page':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/gup.c:894:61: note: in expansion of macro 'pte_pfn'
     894 |                 if ((gup_flags & FOLL_DUMP) || !is_zero_pfn(pte_pfn(entry)))
         |                                                             ^~~~~~~
   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/pagemap.h:11,
                    from mm/gup.c:9:
   arch/microblaze/include/asm/cacheflush.h: At top level:
   arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
      77 | static void flush_dcache_folio(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:42:
   include/linux/pfn_t.h: In function 'pfn_t_pte':
   arch/microblaze/include/asm/pgtable.h:238:38: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     238 |         __pte(((pte_basic_t)(pfn) << PTE_PFN_SHIFT) | pgprot_val(prot))
         |                                      ^~~~~~~~~~~~~
   arch/microblaze/include/asm/page.h:69:37: note: in definition of macro '__pte'
      69 | # define __pte(x)       ((pte_t) { (x) })
         |                                     ^
   include/linux/pfn_t.h:82:16: note: in expansion of macro 'pfn_pte'
      82 |         return pfn_pte(pfn_t_to_pfn(pfn), pgprot);
         |                ^~~~~~~
   arch/microblaze/include/asm/pgtable.h:238:38: note: each undeclared identifier is reported only once for each function it appears in
     238 |         __pte(((pte_basic_t)(pfn) << PTE_PFN_SHIFT) | pgprot_val(prot))
         |                                      ^~~~~~~~~~~~~
   arch/microblaze/include/asm/page.h:69:37: note: in definition of macro '__pte'
      69 | # define __pte(x)       ((pte_t) { (x) })
         |                                     ^
   include/linux/pfn_t.h:82:16: note: in expansion of macro 'pfn_pte'
      82 |         return pfn_pte(pfn_t_to_pfn(pfn), pgprot);
         |                ^~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/microblaze/include/asm/io.h:14,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/microblaze/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11:
   mm/memory.c: In function 'vm_normal_page':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/memory.c:587:29: note: in expansion of macro 'pte_pfn'
     587 |         unsigned long pfn = pte_pfn(pte);
         |                             ^~~~~~~
   mm/memory.c: In function 'insert_pfn':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/memory.c:2144:29: note: in expansion of macro 'pte_pfn'
    2144 |                         if (pte_pfn(entry) != pfn_t_to_pfn(pfn)) {
         |                             ^~~~~~~
   mm/memory.c: In function 'remap_pte_range':
   arch/microblaze/include/asm/pgtable.h:238:38: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     238 |         __pte(((pte_basic_t)(pfn) << PTE_PFN_SHIFT) | pgprot_val(prot))
         |                                      ^~~~~~~~~~~~~
   include/linux/pgtable.h:213:66: note: in definition of macro 'set_pte_at'
     213 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   arch/microblaze/include/asm/pgtable.h:238:9: note: in expansion of macro '__pte'
     238 |         __pte(((pte_basic_t)(pfn) << PTE_PFN_SHIFT) | pgprot_val(prot))
         |         ^~~~~
   mm/memory.c:2365:57: note: in expansion of macro 'pfn_pte'
    2365 |                 set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
         |                                                         ^~~~~~~
   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/mm_inline.h:7,
                    from mm/memory.c:44:
   mm/memory.c: In function 'wp_page_reuse':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   arch/microblaze/include/asm/cacheflush.h:66:67: note: in definition of macro 'flush_dcache_range'
      66 | #define flush_dcache_range(start, end)                  mbc->dflr(start, end);
         |                                                                   ^~~~~
   mm/memory.c:3041:9: note: in expansion of macro 'flush_cache_page'
    3041 |         flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
         |         ^~~~~~~~~~~~~~~~
   mm/memory.c:3041:45: note: in expansion of macro 'pte_pfn'
    3041 |         flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
         |                                             ^~~~~~~
   mm/memory.c: In function 'wp_page_copy':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/memory.c:3086:25: note: in expansion of macro 'pte_pfn'
    3086 |         if (is_zero_pfn(pte_pfn(vmf->orig_pte))) {
         |                         ^~~~~~~
   mm/memory.c: In function 'do_anonymous_page':
   arch/microblaze/include/asm/pgtable.h:238:38: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     238 |         __pte(((pte_basic_t)(pfn) << PTE_PFN_SHIFT) | pgprot_val(prot))
         |                                      ^~~~~~~~~~~~~
   arch/microblaze/include/asm/page.h:69:37: note: in definition of macro '__pte'
      69 | # define __pte(x)       ((pte_t) { (x) })
         |                                     ^
   mm/memory.c:4090:39: note: in expansion of macro 'pfn_pte'
    4090 |                 entry = pte_mkspecial(pfn_pte(my_zero_pfn(vmf->address),
         |                                       ^~~~~~~
   mm/memory.c: In function 'follow_pfn':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/memory.c:5603:16: note: in expansion of macro 'pte_pfn'
    5603 |         *pfn = pte_pfn(ptep_get(ptep));
         |                ^~~~~~~
   In file included from mm/memory.c:61:
   include/linux/pfn_t.h: In function 'pfn_t_pte':
   include/linux/pfn_t.h:83:1: error: control reaches end of non-void function [-Werror=return-type]
      83 | }
         | ^
   arch/microblaze/include/asm/cacheflush.h: At top level:
   arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
      77 | static void flush_dcache_folio(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/pagewalk.h:5,
                    from mm/mprotect.c:12:
   mm/mprotect.c: In function 'prot_none_pte_entry':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/mprotect.c:547:35: note: in expansion of macro 'pte_pfn'
     547 |         return pfn_modify_allowed(pte_pfn(ptep_get(pte)),
         |                                   ^~~~~~~
   arch/microblaze/include/asm/pgtable.h:235:48: note: each undeclared identifier is reported only once for each function it appears in
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/mprotect.c:547:35: note: in expansion of macro 'pte_pfn'
     547 |         return pfn_modify_allowed(pte_pfn(ptep_get(pte)),
         |                                   ^~~~~~~
   mm/mprotect.c: In function 'prot_none_hugetlb_entry':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/mprotect.c:556:35: note: in expansion of macro 'pte_pfn'
     556 |         return pfn_modify_allowed(pte_pfn(ptep_get(pte)),
         |                                   ^~~~~~~
   mm/mprotect.c:559:1: error: control reaches end of non-void function [-Werror=return-type]
     559 | }
         | ^
   mm/mprotect.c: In function 'prot_none_pte_entry':
   mm/mprotect.c:550:1: error: control reaches end of non-void function [-Werror=return-type]
     550 | }
         | ^
   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from mm/mprotect.c:17:
   arch/microblaze/include/asm/cacheflush.h: At top level:
   arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
      77 | static void flush_dcache_folio(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from mm/page_vma_mapped.c:2:
   mm/page_vma_mapped.c: In function 'check_pte':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/page_vma_mapped.c:124:23: note: in expansion of macro 'pte_pfn'
     124 |                 pfn = pte_pfn(ptent);
         |                       ^~~~~~~
   arch/microblaze/include/asm/pgtable.h:235:48: note: each undeclared identifier is reported only once for each function it appears in
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/page_vma_mapped.c:124:23: note: in expansion of macro 'pte_pfn'
     124 |                 pfn = pte_pfn(ptent);
         |                       ^~~~~~~
   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/rmap.h:12,
                    from mm/page_vma_mapped.c:3:
   arch/microblaze/include/asm/cacheflush.h: At top level:
   arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
      77 | static void flush_dcache_folio(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/pagemap.h:11,
                    from mm/rmap.c:59:
   mm/rmap.c: In function 'page_vma_mkclean_one':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   arch/microblaze/include/asm/cacheflush.h:66:67: note: in definition of macro 'flush_dcache_range'
      66 | #define flush_dcache_range(start, end)                  mbc->dflr(start, end);
         |                                                                   ^~~~~
   mm/rmap.c:966:25: note: in expansion of macro 'flush_cache_page'
     966 |                         flush_cache_page(vma, address, pte_pfn(entry));
         |                         ^~~~~~~~~~~~~~~~
   mm/rmap.c:966:56: note: in expansion of macro 'pte_pfn'
     966 |                         flush_cache_page(vma, address, pte_pfn(entry));
         |                                                        ^~~~~~~
   arch/microblaze/include/asm/pgtable.h:235:48: note: each undeclared identifier is reported only once for each function it appears in
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   arch/microblaze/include/asm/cacheflush.h:66:67: note: in definition of macro 'flush_dcache_range'
      66 | #define flush_dcache_range(start, end)                  mbc->dflr(start, end);
         |                                                                   ^~~~~
   mm/rmap.c:966:25: note: in expansion of macro 'flush_cache_page'
     966 |                         flush_cache_page(vma, address, pte_pfn(entry));
         |                         ^~~~~~~~~~~~~~~~
   mm/rmap.c:966:56: note: in expansion of macro 'pte_pfn'
     966 |                         flush_cache_page(vma, address, pte_pfn(entry));
         |                                                        ^~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from mm/rmap.c:56:
   mm/rmap.c: In function 'try_to_unmap_one':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/rmap.c:1513:23: note: in expansion of macro 'pte_pfn'
    1513 |                 pfn = pte_pfn(ptep_get(pvmw.pte));
         |                       ^~~~~~~
   mm/rmap.c: In function 'try_to_migrate_one':
>> arch/microblaze/include/asm/pgtable.h:235:48: error: 'PTE_PFN_SHIFT' undeclared (first use in this function); did you mean 'PFN_PTE_SHIFT'?
     235 | #define pte_pfn(x)              (pte_val(x) >> PTE_PFN_SHIFT)
         |                                                ^~~~~~~~~~~~~
   mm/rmap.c:1883:23: note: in expansion of macro 'pte_pfn'
    1883 |                 pfn = pte_pfn(ptep_get(pvmw.pte));
         |                       ^~~~~~~
   arch/microblaze/include/asm/cacheflush.h: At top level:
   arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
      77 | static void flush_dcache_folio(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~


vim +235 arch/microblaze/include/asm/pgtable.h

   234	
 > 235	#define pte_pfn(x)		(pte_val(x) >> PTE_PFN_SHIFT)
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
