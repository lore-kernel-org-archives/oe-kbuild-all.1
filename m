Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE533EBF3D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771112405; cv=none; b=gLfj+zyTz+cfHj55Wg/x26Cp+8wojna4NEHwJss98YXhksySfmX2XiLd+nXEkozBbZ4SFgqLGjqmPpeyXZtCDFxUb8VEDLBk2xJczOTzX0mbePeOncaWpXpvCxdRkxUL9JJa7/ot1H0oqAe1s4aVbbzTHF3GBMz9wCGBV4r5KSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771112405; c=relaxed/simple;
	bh=nFE/tjQvu/aJ6D+15pKAM8sO3amkqzxz285KvxIZ8k4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tbxYgvVkn+vYJtjlOIBkYR1ToVs4CxlsPP/4JbE7TH8dS8wtxuqUOIXGfq1rwxF0UKLckta/T3u1AOk354ZXgKCd1tGYBmaEoIxqCczpGPo6sIAATFSm4sVY00aCrz1mrYJaUi7Tp+WdO91lTLk+EE4uPUTAUbZ4Y59TFby+ItQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhxGF8yZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhxGF8yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771112401; x=1802648401;
  h=date:from:to:cc:subject:message-id;
  bh=nFE/tjQvu/aJ6D+15pKAM8sO3amkqzxz285KvxIZ8k4=;
  b=ZhxGF8yZWyJ5ECug4TiQA7OyiVUbGyQWCfOtvEO1bANU5GrijMJCNCNm
   3k9NqEWE4X5Y1hm27+xyCxd+za3bRLPvddqDGN3bAQw5modXZJ58Kdhfo
   hfTtnshR7FjTKSaLQN878zwTzdStb9+YzMlxfzxMptdKt0YE07IEQsGfS
   kbF4tTRQLMy61JInk6d+prJZZcEoRhCk+dH2RMJSXG1A/VvAkUx/Yjroz
   3laR/n/REoFQyralX5hVwJtouI39VcESR57Wbu135kOfkGM0ocITE9nku
   7geH5u6HS3P6ExcStIZNYiFprmsZPKRHaJNC01DCAQPl+5KRMlpHObhx4
   Q==;
X-CSE-ConnectionGUID: d4fTwi9lQDOOHq95a6xxQw==
X-CSE-MsgGUID: 2LxjH5pTTPCErssCBUqizA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="83693989"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="83693989"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 15:40:00 -0800
X-CSE-ConnectionGUID: 593X1FdUTtuIAX+cERA3IQ==
X-CSE-MsgGUID: bqU7cPJ3QMiJg2KSQf2KgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="218219129"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Feb 2026 15:39:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrPEy-00000000x5Y-0Zz9;
	Sat, 14 Feb 2026 23:39:56 +0000
Date: Sun, 15 Feb 2026 07:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety-2026-02-13 7/85]
 include/linux/mm.h:2356:22: error: conflicting types for 'folio_size'
Message-ID: <202602150752.OUDxsiMk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety-2026-02-13
head:   b3d50cd353767e14c2bc42f6b49ec42114b0425f
commit: 564a4cd602be522e2844ccb8ebc2e9ac56b7a37b [7/85] mm/pgtable: Fix a build error
config: arm-randconfig-r062-20260215 (https://download.01.org/0day-ci/archive/20260215/202602150752.OUDxsiMk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602150752.OUDxsiMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602150752.OUDxsiMk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/slab.h:264,
                    from include/linux/fs.h:45,
                    from include/linux/highmem.h:5,
                    from include/linux/pgtable.h:123,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/linux/kasan.h:54:37: error: 'MAX_PTRS_PER_PTE' undeclared here (not in a function); did you mean 'PTRS_PER_PTE'?
      54 | extern pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE + PTE_HWTABLE_PTRS];
         |                                     ^~~~~~~~~~~~~~~~
         |                                     PTRS_PER_PTE
   include/linux/kasan.h:55:37: error: 'MAX_PTRS_PER_PMD' undeclared here (not in a function); did you mean 'PTRS_PER_PMD'?
      55 | extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
         |                                     ^~~~~~~~~~~~~~~~
         |                                     PTRS_PER_PMD
   include/linux/kasan.h:56:37: error: 'MAX_PTRS_PER_PUD' undeclared here (not in a function); did you mean 'PTRS_PER_PUD'?
      56 | extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
         |                                     ^~~~~~~~~~~~~~~~
         |                                     PTRS_PER_PUD
   include/linux/kasan.h:57:37: error: 'MAX_PTRS_PER_P4D' undeclared here (not in a function); did you mean 'PTRS_PER_P4D'?
      57 | extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
         |                                     ^~~~~~~~~~~~~~~~
         |                                     PTRS_PER_P4D
   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/pgtable.h:123,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   arch/arm/include/asm/cacheflush.h: In function 'vivt_flush_cache_range':
   arch/arm/include/asm/cacheflush.h:230:46: error: implicit declaration of function 'PAGE_ALIGN'; did you mean 'PTR_ALIGN'? [-Werror=implicit-function-declaration]
     230 |   __cpuc_flush_user_range(start & PAGE_MASK, PAGE_ALIGN(end),
         |                                              ^~~~~~~~~~
         |                                              PTR_ALIGN
   In file included from include/linux/highmem.h:14,
                    from include/linux/pgtable.h:123,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/linux/highmem-internal.h: In function 'kmap':
   include/linux/highmem-internal.h:46:10: error: implicit declaration of function 'page_address'; did you mean 'page_ptdesc'? [-Werror=implicit-function-declaration]
      46 |   addr = page_address(page);
         |          ^~~~~~~~~~~~
         |          page_ptdesc
>> include/linux/highmem-internal.h:46:8: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      46 |   addr = page_address(page);
         |        ^
   include/linux/highmem-internal.h: In function 'kmap_local_page_try_from_panic':
>> include/linux/highmem-internal.h:79:10: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
      79 |   return page_address(page);
         |          ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/pgtable.h:123,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/linux/highmem.h: In function 'vma_alloc_zeroed_movable_folio':
   include/linux/highmem.h:326:15: error: implicit declaration of function 'user_alloc_needs_zeroing' [-Werror=implicit-function-declaration]
     326 |  if (folio && user_alloc_needs_zeroing())
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:12:
   include/linux/highmem.h: In function 'memcpy_folio':
   include/linux/highmem.h:502:28: error: implicit declaration of function 'folio_size'; did you mean 'folio_page'? [-Werror=implicit-function-declaration]
     502 |  VM_BUG_ON(dst_off + len > folio_size(dst_folio));
         |                            ^~~~~~~~~~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/mmdebug.h:21:25: note: in expansion of macro 'BUG_ON'
      21 | #define VM_BUG_ON(cond) BUG_ON(cond)
         |                         ^~~~~~
   include/linux/highmem.h:502:2: note: in expansion of macro 'VM_BUG_ON'
     502 |  VM_BUG_ON(dst_off + len > folio_size(dst_folio));
         |  ^~~~~~~~~
   In file included from include/linux/pgtable.h:123,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/linux/highmem.h:511:27: error: implicit declaration of function 'offset_in_page' [-Werror=implicit-function-declaration]
     511 |       chunk > PAGE_SIZE - offset_in_page(dst_off))
         |                           ^~~~~~~~~~~~~~
   include/linux/highmem.h: In function 'memcpy_from_file_folio':
   include/linux/highmem.h:716:18: error: implicit declaration of function 'offset_in_folio' [-Werror=implicit-function-declaration]
     716 |  size_t offset = offset_in_folio(folio, pos);
         |                  ^~~~~~~~~~~~~~~
   include/linux/highmem.h: In function 'folio_release_kmap':
   include/linux/highmem.h:781:2: error: implicit declaration of function 'folio_put'; did you mean 'folio_page'? [-Werror=implicit-function-declaration]
     781 |  folio_put(folio);
         |  ^~~~~~~~~
         |  folio_page
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h: At top level:
>> include/linux/mm.h:1613:20: warning: conflicting types for 'folio_put'
    1613 | static inline void folio_put(struct folio *folio)
         |                    ^~~~~~~~~
   include/linux/mm.h:1613:20: error: static declaration of 'folio_put' follows non-static declaration
   In file included from include/linux/pgtable.h:123,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/linux/highmem.h:781:2: note: previous implicit declaration of 'folio_put' was here
     781 |  folio_put(folio);
         |  ^~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:2356:22: error: conflicting types for 'folio_size'
    2356 | static inline size_t folio_size(const struct folio *folio)
         |                      ^~~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:12:
   include/linux/highmem.h:502:28: note: previous implicit declaration of 'folio_size' was here
     502 |  VM_BUG_ON(dst_off + len > folio_size(dst_folio));
         |                            ^~~~~~~~~~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/mmdebug.h:21:25: note: in expansion of macro 'BUG_ON'
      21 | #define VM_BUG_ON(cond) BUG_ON(cond)
         |                         ^~~~~~
   include/linux/highmem.h:502:2: note: in expansion of macro 'VM_BUG_ON'
     502 |  VM_BUG_ON(dst_off + len > folio_size(dst_folio));
         |  ^~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:2509:7: error: conflicting types for 'page_address'
    2509 | void *page_address(const struct page *page);
         |       ^~~~~~~~~~~~
   In file included from include/linux/highmem.h:14,
                    from include/linux/pgtable.h:123,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/linux/highmem-internal.h:46:10: note: previous implicit declaration of 'page_address' was here
      46 |   addr = page_address(page);
         |          ^~~~~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:4594:20: error: conflicting types for 'user_alloc_needs_zeroing'
    4594 | static inline bool user_alloc_needs_zeroing(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/pgtable.h:123,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/linux/highmem.h:326:15: note: previous implicit declaration of 'user_alloc_needs_zeroing' was here
     326 |  if (folio && user_alloc_needs_zeroing())
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/folio_size +2356 include/linux/mm.h

7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2347) 
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2348) /**
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2349)  * folio_size - The number of bytes in a folio.
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2350)  * @folio: The folio.
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2351)  *
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2352)  * Context: The caller should have a reference on the folio to prevent
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2353)  * it from being split.  It is not necessary for the folio to be locked.
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2354)  * Return: The number of bytes in this folio.
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2355)  */
4d2bcefa965b06 Matthew Wilcox (Oracle  2024-05-31 @2356) static inline size_t folio_size(const struct folio *folio)
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2357) {
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2358) 	return PAGE_SIZE << folio_order(folio);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2359) }
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  2360) 
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2361) /**
003fde4492c88a David Hildenbrand       2025-03-03  2362   * folio_maybe_mapped_shared - Whether the folio is mapped into the page
ebb34f78d72c23 David Hildenbrand       2024-02-27  2363   *			       tables of more than one MM
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2364)  * @folio: The folio.
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2365)  *
003fde4492c88a David Hildenbrand       2025-03-03  2366   * This function checks if the folio maybe currently mapped into more than one
003fde4492c88a David Hildenbrand       2025-03-03  2367   * MM ("maybe mapped shared"), or if the folio is certainly mapped into a single
003fde4492c88a David Hildenbrand       2025-03-03  2368   * MM ("mapped exclusively").
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2369)  *
17d5f38b33b662 David Hildenbrand       2024-07-31  2370   * For KSM folios, this function also returns "mapped shared" when a folio is
17d5f38b33b662 David Hildenbrand       2024-07-31  2371   * mapped multiple times into the same MM, because the individual page mappings
17d5f38b33b662 David Hildenbrand       2024-07-31  2372   * are independent.
17d5f38b33b662 David Hildenbrand       2024-07-31  2373   *
17d5f38b33b662 David Hildenbrand       2024-07-31  2374   * For small anonymous folios and anonymous hugetlb folios, the return
17d5f38b33b662 David Hildenbrand       2024-07-31  2375   * value will be exactly correct: non-KSM folios can only be mapped at most once
17d5f38b33b662 David Hildenbrand       2024-07-31  2376   * into an MM, and they cannot be partially mapped. KSM folios are
17d5f38b33b662 David Hildenbrand       2024-07-31  2377   * considered shared even if mapped multiple times into the same MM.
ebb34f78d72c23 David Hildenbrand       2024-02-27  2378   *
ebb34f78d72c23 David Hildenbrand       2024-02-27  2379   * For other folios, the result can be fuzzy:
ebb34f78d72c23 David Hildenbrand       2024-02-27  2380   *    #. For partially-mappable large folios (THP), the return value can wrongly
003fde4492c88a David Hildenbrand       2025-03-03  2381   *       indicate "mapped shared" (false positive) if a folio was mapped by
003fde4492c88a David Hildenbrand       2025-03-03  2382   *       more than two MMs at one point in time.
ebb34f78d72c23 David Hildenbrand       2024-02-27  2383   *    #. For pagecache folios (including hugetlb), the return value can wrongly
ebb34f78d72c23 David Hildenbrand       2024-02-27  2384   *       indicate "mapped shared" (false positive) when two VMAs in the same MM
ebb34f78d72c23 David Hildenbrand       2024-02-27  2385   *       cover the same file range.
ebb34f78d72c23 David Hildenbrand       2024-02-27  2386   *
ebb34f78d72c23 David Hildenbrand       2024-02-27  2387   * Further, this function only considers current page table mappings that
ebb34f78d72c23 David Hildenbrand       2024-02-27  2388   * are tracked using the folio mapcount(s).
ebb34f78d72c23 David Hildenbrand       2024-02-27  2389   *
ebb34f78d72c23 David Hildenbrand       2024-02-27  2390   * This function does not consider:
ebb34f78d72c23 David Hildenbrand       2024-02-27  2391   *    #. If the folio might get mapped in the (near) future (e.g., swapcache,
ebb34f78d72c23 David Hildenbrand       2024-02-27  2392   *       pagecache, temporary unmapping for migration).
ebb34f78d72c23 David Hildenbrand       2024-02-27  2393   *    #. If the folio is mapped differently (VM_PFNMAP).
ebb34f78d72c23 David Hildenbrand       2024-02-27  2394   *    #. If hugetlb page table sharing applies. Callers might want to check
ebb34f78d72c23 David Hildenbrand       2024-02-27  2395   *       hugetlb_pmd_shared().
ebb34f78d72c23 David Hildenbrand       2024-02-27  2396   *
ebb34f78d72c23 David Hildenbrand       2024-02-27  2397   * Return: Whether the folio is estimated to be mapped into more than one MM.
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2398)  */
003fde4492c88a David Hildenbrand       2025-03-03  2399  static inline bool folio_maybe_mapped_shared(struct folio *folio)
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2400) {
eefb9b2725e395 David Hildenbrand       2024-04-09  2401  	int mapcount = folio_mapcount(folio);
eefb9b2725e395 David Hildenbrand       2024-04-09  2402  
eefb9b2725e395 David Hildenbrand       2024-04-09  2403  	/* Only partially-mappable folios require more care. */
eefb9b2725e395 David Hildenbrand       2024-04-09  2404  	if (!folio_test_large(folio) || unlikely(folio_test_hugetlb(folio)))
eefb9b2725e395 David Hildenbrand       2024-04-09  2405  		return mapcount > 1;
eefb9b2725e395 David Hildenbrand       2024-04-09  2406  
003fde4492c88a David Hildenbrand       2025-03-03  2407  	/*
003fde4492c88a David Hildenbrand       2025-03-03  2408  	 * vm_insert_page() without CONFIG_TRANSPARENT_HUGEPAGE ...
003fde4492c88a David Hildenbrand       2025-03-03  2409  	 * simply assume "mapped shared", nobody should really care
003fde4492c88a David Hildenbrand       2025-03-03  2410  	 * about this for arbitrary kernel allocations.
003fde4492c88a David Hildenbrand       2025-03-03  2411  	 */
003fde4492c88a David Hildenbrand       2025-03-03  2412  	if (!IS_ENABLED(CONFIG_MM_ID))
eefb9b2725e395 David Hildenbrand       2024-04-09  2413  		return true;
eefb9b2725e395 David Hildenbrand       2024-04-09  2414  
003fde4492c88a David Hildenbrand       2025-03-03  2415  	/*
003fde4492c88a David Hildenbrand       2025-03-03  2416  	 * A single mapping implies "mapped exclusively", even if the
003fde4492c88a David Hildenbrand       2025-03-03  2417  	 * folio flag says something different: it's easier to handle this
003fde4492c88a David Hildenbrand       2025-03-03  2418  	 * case here instead of on the RMAP hot path.
003fde4492c88a David Hildenbrand       2025-03-03  2419  	 */
003fde4492c88a David Hildenbrand       2025-03-03  2420  	if (mapcount <= 1)
003fde4492c88a David Hildenbrand       2025-03-03  2421  		return false;
4428a35f91f0f0 Lance Yang              2025-04-24  2422  	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2423) }
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2424) 
86ebd50224c073 Shivank Garg            2025-04-30  2425  /**
86ebd50224c073 Shivank Garg            2025-04-30  2426   * folio_expected_ref_count - calculate the expected folio refcount
86ebd50224c073 Shivank Garg            2025-04-30  2427   * @folio: the folio
86ebd50224c073 Shivank Garg            2025-04-30  2428   *
86ebd50224c073 Shivank Garg            2025-04-30  2429   * Calculate the expected folio refcount, taking references from the pagecache,
86ebd50224c073 Shivank Garg            2025-04-30  2430   * swapcache, PG_private and page table mappings into account. Useful in
86ebd50224c073 Shivank Garg            2025-04-30  2431   * combination with folio_ref_count() to detect unexpected references (e.g.,
86ebd50224c073 Shivank Garg            2025-04-30  2432   * GUP or other temporary references).
86ebd50224c073 Shivank Garg            2025-04-30  2433   *
86ebd50224c073 Shivank Garg            2025-04-30  2434   * Does currently not consider references from the LRU cache. If the folio
86ebd50224c073 Shivank Garg            2025-04-30  2435   * was isolated from the LRU (which is the case during migration or split),
86ebd50224c073 Shivank Garg            2025-04-30  2436   * the LRU cache does not apply.
86ebd50224c073 Shivank Garg            2025-04-30  2437   *
86ebd50224c073 Shivank Garg            2025-04-30  2438   * Calling this function on an unmapped folio -- !folio_mapped() -- that is
86ebd50224c073 Shivank Garg            2025-04-30  2439   * locked will return a stable result.
86ebd50224c073 Shivank Garg            2025-04-30  2440   *
86ebd50224c073 Shivank Garg            2025-04-30  2441   * Calling this function on a mapped folio will not result in a stable result,
86ebd50224c073 Shivank Garg            2025-04-30  2442   * because nothing stops additional page table mappings from coming (e.g.,
86ebd50224c073 Shivank Garg            2025-04-30  2443   * fork()) or going (e.g., munmap()).
86ebd50224c073 Shivank Garg            2025-04-30  2444   *
86ebd50224c073 Shivank Garg            2025-04-30  2445   * Calling this function without the folio lock will also not result in a
86ebd50224c073 Shivank Garg            2025-04-30  2446   * stable result: for example, the folio might get dropped from the swapcache
86ebd50224c073 Shivank Garg            2025-04-30  2447   * concurrently.
86ebd50224c073 Shivank Garg            2025-04-30  2448   *
86ebd50224c073 Shivank Garg            2025-04-30  2449   * However, even when called without the folio lock or on a mapped folio,
86ebd50224c073 Shivank Garg            2025-04-30  2450   * this function can be used to detect unexpected references early (for example,
86ebd50224c073 Shivank Garg            2025-04-30  2451   * if it makes sense to even lock the folio and unmap it).
86ebd50224c073 Shivank Garg            2025-04-30  2452   *
86ebd50224c073 Shivank Garg            2025-04-30  2453   * The caller must add any reference (e.g., from folio_try_get()) it might be
86ebd50224c073 Shivank Garg            2025-04-30  2454   * holding itself to the result.
86ebd50224c073 Shivank Garg            2025-04-30  2455   *
86ebd50224c073 Shivank Garg            2025-04-30  2456   * Returns the expected folio refcount.
86ebd50224c073 Shivank Garg            2025-04-30  2457   */
86ebd50224c073 Shivank Garg            2025-04-30  2458  static inline int folio_expected_ref_count(const struct folio *folio)
86ebd50224c073 Shivank Garg            2025-04-30  2459  {
86ebd50224c073 Shivank Garg            2025-04-30  2460  	const int order = folio_order(folio);
86ebd50224c073 Shivank Garg            2025-04-30  2461  	int ref_count = 0;
86ebd50224c073 Shivank Garg            2025-04-30  2462  
78cb1a13c42a6d David Hildenbrand       2025-07-04  2463  	if (WARN_ON_ONCE(page_has_type(&folio->page) && !folio_test_hugetlb(folio)))
86ebd50224c073 Shivank Garg            2025-04-30  2464  		return 0;
86ebd50224c073 Shivank Garg            2025-04-30  2465  
86ebd50224c073 Shivank Garg            2025-04-30  2466  	/* One reference per page from the swapcache. */
86ebd50224c073 Shivank Garg            2025-04-30  2467  	ref_count += folio_test_swapcache(folio) << order;
f183663901f21f Bijan Tabatabai         2025-12-16  2468  
f183663901f21f Bijan Tabatabai         2025-12-16  2469  	if (!folio_test_anon(folio)) {
86ebd50224c073 Shivank Garg            2025-04-30  2470  		/* One reference per page from the pagecache. */
86ebd50224c073 Shivank Garg            2025-04-30  2471  		ref_count += !!folio->mapping << order;
86ebd50224c073 Shivank Garg            2025-04-30  2472  		/* One reference from PG_private. */
86ebd50224c073 Shivank Garg            2025-04-30  2473  		ref_count += folio_test_private(folio);
86ebd50224c073 Shivank Garg            2025-04-30  2474  	}
86ebd50224c073 Shivank Garg            2025-04-30  2475  
86ebd50224c073 Shivank Garg            2025-04-30  2476  	/* One reference per page table mapping. */
86ebd50224c073 Shivank Garg            2025-04-30  2477  	return ref_count + folio_mapcount(folio);
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2478) }
fa4e3f5ffa5e6e Vishal Moola (Oracle    2023-01-30  2479) 
b424de33c42dbd Matthew Wilcox (Oracle  2021-04-24  2480) #ifndef HAVE_ARCH_MAKE_FOLIO_ACCESSIBLE
b424de33c42dbd Matthew Wilcox (Oracle  2021-04-24  2481) static inline int arch_make_folio_accessible(struct folio *folio)
b424de33c42dbd Matthew Wilcox (Oracle  2021-04-24  2482) {
e5a41fc77771c7 David Hildenbrand       2024-07-29  2483  	return 0;
b424de33c42dbd Matthew Wilcox (Oracle  2021-04-24  2484) }
b424de33c42dbd Matthew Wilcox (Oracle  2021-04-24  2485) #endif
b424de33c42dbd Matthew Wilcox (Oracle  2021-04-24  2486) 
f6ac2354d79119 Christoph Lameter       2006-06-30  2487  /*
f6ac2354d79119 Christoph Lameter       2006-06-30  2488   * Some inline functions in vmstat.h depend on page_zone()
f6ac2354d79119 Christoph Lameter       2006-06-30  2489   */
f6ac2354d79119 Christoph Lameter       2006-06-30  2490  #include <linux/vmstat.h>
f6ac2354d79119 Christoph Lameter       2006-06-30  2491  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2492  #if defined(CONFIG_HIGHMEM) && !defined(WANT_PAGE_VIRTUAL)
^1da177e4c3f41 Linus Torvalds          2005-04-16  2493  #define HASHED_PAGE_VIRTUAL
^1da177e4c3f41 Linus Torvalds          2005-04-16  2494  #endif
^1da177e4c3f41 Linus Torvalds          2005-04-16  2495  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2496  #if defined(WANT_PAGE_VIRTUAL)
f92f455f67fef2 Geert Uytterhoeven      2014-01-21  2497  static inline void *page_address(const struct page *page)
f92f455f67fef2 Geert Uytterhoeven      2014-01-21  2498  {
f92f455f67fef2 Geert Uytterhoeven      2014-01-21  2499  	return page->virtual;
f92f455f67fef2 Geert Uytterhoeven      2014-01-21  2500  }
f92f455f67fef2 Geert Uytterhoeven      2014-01-21  2501  static inline void set_page_address(struct page *page, void *address)
f92f455f67fef2 Geert Uytterhoeven      2014-01-21  2502  {
f92f455f67fef2 Geert Uytterhoeven      2014-01-21  2503  	page->virtual = address;
f92f455f67fef2 Geert Uytterhoeven      2014-01-21  2504  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  2505  #define page_address_init()  do { } while(0)
^1da177e4c3f41 Linus Torvalds          2005-04-16  2506  #endif
^1da177e4c3f41 Linus Torvalds          2005-04-16  2507  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2508  #if defined(HASHED_PAGE_VIRTUAL)
f991879473828f Ian Campbell            2011-08-17 @2509  void *page_address(const struct page *page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  2510  void set_page_address(struct page *page, void *virtual);
^1da177e4c3f41 Linus Torvalds          2005-04-16  2511  void page_address_init(void);
^1da177e4c3f41 Linus Torvalds          2005-04-16  2512  #endif
^1da177e4c3f41 Linus Torvalds          2005-04-16  2513  

:::::: The code at line 2356 was first introduced by commit
:::::: 4d2bcefa965b06a1f2be6912456bcfa86a34f184 mm: Reduce the number of slab->folio casts

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
