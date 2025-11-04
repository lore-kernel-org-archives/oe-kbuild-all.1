Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FD5309EEB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241954; cv=none; b=oBePamokvjiHfuiKztcGq5RLEegRqq7SJ2Eu4pUnSvlsjeP6muPr4sIHF0enSD0oT1VmwCx9mkvxYtTx/BFULHLiVe1jfAisJ9hGiTyEaJw3a0V/ncDbRoxkXx4Ph+GHUQYexqKfGNig7PUvkqJEh65wHNZQq8nxvodhu331zYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241954; c=relaxed/simple;
	bh=RXQ6p0Pi8auaGj5/sMtdFvlxu09UmN+ncmczcIrDHSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLT3fDWRbPLuZHefwzRcbci/mRkMdL/HJ9XJF8tFLt/NYsFLvqUqwemw9oi2QGiB38+4gr2r2xz6DqxjU4usnoUaTrmqIsvn1M7Hw72RxgbNauHorRQOTmzjJ7AzoWEaZjO3hsUJvjvivntzcB7zeguCWJ2qmZMmonAy/IVmsSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RibqJ0BT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RibqJ0BT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762241952; x=1793777952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXQ6p0Pi8auaGj5/sMtdFvlxu09UmN+ncmczcIrDHSA=;
  b=RibqJ0BTDe6uPzkdyyVHpGZpS1INZIWkJJk9pEuLk0IUV4n9eND+XTym
   CWdamx9Bor81btwGKHiavRHbRCih4eP1zXqa50jQHM5sMw17/IWsywbcx
   9rxKpPDoB6y6vKfYnDNH43Ke1pTA4UjnFL+P44EBqiuHsDE5rgaggWOMb
   mfKWoIbP0/vniR/zr7Zm87Xv5mderkNcte6VzrrZBba/FHxy8duLJ6lAJ
   MKdewLbN7CWR9J9X2pwW0CFgeQOrDzgzyJ9hiH3mm3Wn5Ky42QoO9ajGF
   CQVef0FJxa+42blMT50Zw/6nW8D3VwDlPIJYXgWE+TvhhXueEZgrQAAOx
   w==;
X-CSE-ConnectionGUID: XUA2GptRT5q9fgx2FZSK1w==
X-CSE-MsgGUID: egRPQ/oMQVCwRgfLB8xnqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64026238"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64026238"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 23:39:10 -0800
X-CSE-ConnectionGUID: 6srV3UBUQW2il3u9+bzgGg==
X-CSE-MsgGUID: 9AaBvRlVTj2hEWVqy/Le+Q==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2025 23:39:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGBcw-000R3S-24;
	Tue, 04 Nov 2025 07:38:54 +0000
Date: Tue, 4 Nov 2025 15:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 24/24]
 drivers/cma/mm/mem_phys_layout.c:275:7: error: 'MIGRATE_CMA' undeclared; did
 you mean 'MIGRATE_SYNC'?
Message-ID: <202511041518.UPwGBozi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   b696261dbf8a4b298226981a96af8587dc5f5558
commit: b696261dbf8a4b298226981a96af8587dc5f5558 [24/24] ANDROID: mm: Get number free pages per node, zone, order and migrate type
config: arm-randconfig-004-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041518.UPwGBozi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041518.UPwGBozi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041518.UPwGBozi-lkp@intel.com/

All errors (new ones prefixed by >>):

                      ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:237:2: note: in expansion of macro 'pr_info'
     pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
     ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:239:48: error: 'PFN_SECTION_SHIFT' undeclared (first use in this function); did you mean 'SECTIONS_SHIFT'?
     pr_info("PFN_SECTION_SHIFT             = %d", PFN_SECTION_SHIFT);
                                                   ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:239:2: note: in expansion of macro 'pr_info'
     pr_info("PFN_SECTION_SHIFT             = %d", PFN_SECTION_SHIFT);
     ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:241:48: error: 'SECTION_SIZE_BITS' undeclared (first use in this function); did you mean '_IOC_SIZEBITS'?
     pr_info("SECTION_SIZE_BITS             = %d", SECTION_SIZE_BITS);
                                                   ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:241:2: note: in expansion of macro 'pr_info'
     pr_info("SECTION_SIZE_BITS             = %d", SECTION_SIZE_BITS);
     ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:243:49: error: 'SUBSECTION_SIZE' undeclared (first use in this function); did you mean 'AT_VECTOR_SIZE'?
     pr_info("SUBSECTION_SIZE               = %ld", SUBSECTION_SIZE);
                                                    ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:243:2: note: in expansion of macro 'pr_info'
     pr_info("SUBSECTION_SIZE               = %ld", SUBSECTION_SIZE);
     ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:244:49: error: 'SUBSECTIONS_PER_SECTION' undeclared (first use in this function); did you mean 'SUBSECTION_SIZE'?
     pr_info("SUBSECTIONS_PER_SECTION       = %ld", SUBSECTIONS_PER_SECTION);
                                                    ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:244:2: note: in expansion of macro 'pr_info'
     pr_info("SUBSECTIONS_PER_SECTION       = %ld", SUBSECTIONS_PER_SECTION);
     ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:248:43: error: 'PAGES_PER_SUBSECTION' undeclared (first use in this function); did you mean 'DEFINE_PER_CPU_SECTION'?
     pr_info("PAGES_PER_SUBSECTION    = %ld", PAGES_PER_SUBSECTION);
                                              ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:248:2: note: in expansion of macro 'pr_info'
     pr_info("PAGES_PER_SUBSECTION    = %ld", PAGES_PER_SUBSECTION);
     ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:250:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     phys_addr_t start_addr = memblock_start_of_DRAM();
     ^~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:252:32: error: implicit declaration of function '__pfn_to_section'; did you mean '__initcall_section'? [-Werror=implicit-function-declaration]
     struct mem_section *section = __pfn_to_section(start_pfn);
                                   ^~~~~~~~~~~~~~~~
                                   __initcall_section
   drivers/cma/mm/mem_phys_layout.c:252:32: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   drivers/cma/mm/mem_phys_layout.c:253:22: error: implicit declaration of function '__section_mem_map_addr'; did you mean 'is_ioremap_addr'? [-Werror=implicit-function-declaration]
     struct page *page = __section_mem_map_addr(section);
                         ^~~~~~~~~~~~~~~~~~~~~~
                         is_ioremap_addr
   drivers/cma/mm/mem_phys_layout.c:253:22: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/linux/memblock.h:13,
                    from drivers/cma/mm/mem_phys_layout.c:14:
   drivers/cma/mm/mem_phys_layout.c:259:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       (u64) page,
       ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:256:2: note: in expansion of macro 'pr_info'
     pr_info("    PFN: %10llu == %#010Lx  struct page[mem %#010Lx], PHYS[mem %#010Lx]",
     ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c: In function 'get_migrate_type_name':
>> drivers/cma/mm/mem_phys_layout.c:275:7: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
     case MIGRATE_CMA:
          ^~~~~~~~~~~
          MIGRATE_SYNC
>> drivers/cma/mm/mem_phys_layout.c:277:7: error: 'MIGRATE_ISOLATE' undeclared (first use in this function); did you mean 'MIGRATE_MOVABLE'?
     case MIGRATE_ISOLATE:
          ^~~~~~~~~~~~~~~
          MIGRATE_MOVABLE
   drivers/cma/mm/mem_phys_layout.c: In function 'free_memory_per_area':
>> drivers/cma/mm/mem_phys_layout.c:292:2: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
     for (int migrate_type = 0; migrate_type < MIGRATE_TYPES; migrate_type++) {
     ^~~
   drivers/cma/mm/mem_phys_layout.c:292:2: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
   drivers/cma/mm/mem_phys_layout.c: In function 'free_memory_per_zone':
   drivers/cma/mm/mem_phys_layout.c:326:2: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
     for (int current_order = 0; current_order < NR_PAGE_ORDERS; current_order++) {
     ^~~
>> drivers/cma/mm/mem_phys_layout.c:326:46: error: 'NR_PAGE_ORDERS' undeclared (first use in this function); did you mean 'NR_PAGETABLE'?
     for (int current_order = 0; current_order < NR_PAGE_ORDERS; current_order++) {
                                                 ^~~~~~~~~~~~~~
                                                 NR_PAGETABLE
   drivers/cma/mm/mem_phys_layout.c: In function 'free_memory_per_node':
   drivers/cma/mm/mem_phys_layout.c:346:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
      for (int i = 0; i < node->nr_zones; i++) {
      ^~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]


vim +275 drivers/cma/mm/mem_phys_layout.c

   234	
   235	static void print_phys_memory_model(void)
   236	{
   237		pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
   238		pr_info("pageblock_order               = %d", pageblock_order);
   239		pr_info("PFN_SECTION_SHIFT             = %d", PFN_SECTION_SHIFT);
   240		pr_info("(MAX_PAGE_ORDER + PAGE_SHIFT) = %d", (MAX_PAGE_ORDER + PAGE_SHIFT));
   241		pr_info("SECTION_SIZE_BITS             = %d", SECTION_SIZE_BITS);
   242		pr_info("2 ^ SECTION_SIZE_BITS         = %d", (1 << SECTION_SIZE_BITS));
   243		pr_info("SUBSECTION_SIZE               = %ld", SUBSECTION_SIZE);
   244		pr_info("SUBSECTIONS_PER_SECTION       = %ld", SUBSECTIONS_PER_SECTION);
   245		pr_info("SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION = %ld = %ldMiB",
   246				SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION,
   247				SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION / 1024 / 1024);
   248		pr_info("PAGES_PER_SUBSECTION    = %ld", PAGES_PER_SUBSECTION);
   249	
   250		phys_addr_t start_addr = memblock_start_of_DRAM();
   251		unsigned long start_pfn = PHYS_PFN(start_addr);
   252		struct mem_section *section = __pfn_to_section(start_pfn);
   253		struct page *page = __section_mem_map_addr(section);
   254	
   255		pr_info("Using struct mem_section");
 > 256		pr_info("    PFN: %10llu == %#010Lx  struct page[mem %#010Lx], PHYS[mem %#010Lx]",
   257				(u64)start_pfn,
   258				(u64)start_pfn,
   259				(u64) page,
   260				(u64)PFN_PHYS(start_pfn));
   261	}
   262	
   263	static const char *get_migrate_type_name(enum migratetype type)
   264	{
   265		switch (type) {
   266		case MIGRATE_UNMOVABLE:
   267			return "UNMOVABLE";
   268		case MIGRATE_MOVABLE:
   269			return "MOVABLE";
   270		case MIGRATE_RECLAIMABLE:
   271			return "RECLAIMABLE";
   272		case MIGRATE_PCPTYPES:
   273		// case MIGRATE_HIGHATOMIC:
   274			return "PCPTYPES or HIGHATOMIC";
 > 275		case MIGRATE_CMA:
   276			return "CMA";
 > 277		case MIGRATE_ISOLATE:
   278			return "ISOLATE";
   279		default:
   280			return "UNKNOWN MIGRATE TYPE";
   281		}
   282	}
   283	
   284	static void free_memory_per_area(struct free_area *area, int order)
   285	{
   286		pr_info("    zone->free_area[order]->nr_free = %lu list nodes, order = %d",
   287				area->nr_free, order);
   288	
   289		if (area->nr_free == 0)
   290			return;
   291	
 > 292		for (int migrate_type = 0; migrate_type < MIGRATE_TYPES; migrate_type++) {
   293			const char *migrate_name = get_migrate_type_name(migrate_type);
   294	
   295			// free_list contains the struct page objects.
   296			if (!list_empty(&area->free_list[migrate_type]))
   297				pr_info("        free_list[%s] is NOT empty", migrate_name);
   298			else
   299				pr_info("        free_list[%s] is EMPTY", migrate_name);
   300		}
   301	}
   302	
   303	static void free_memory_per_zone(int idx, struct zone *zone)
   304	{
   305		unsigned long flags;
   306		struct free_area *area;
   307	
   308		if (!zone) {
   309			pr_info("zone %d is NULL", idx);
   310			return;
   311		}
   312		pr_info("zone %d (%s)", idx, zone->name);
   313	
   314		if (managed_zone(zone))
   315			pr_info("    zone managed by the buddy allocator");
   316		else
   317			pr_info("    zone NOT managed by the buddy allocator");
   318	
   319		if (populated_zone(zone))
   320			pr_info("    zone has memory");
   321		else {
   322			pr_info("    zone has NOT memory");
   323			return;
   324		}
   325	
 > 326		for (int current_order = 0; current_order < NR_PAGE_ORDERS; current_order++) {
   327			area = &(zone->free_area[current_order]);
   328	
   329			spin_lock_irqsave(&zone->lock, flags);
   330			free_memory_per_area(area, current_order);
   331			spin_unlock_irqrestore(&zone->lock, flags);
   332		}
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
