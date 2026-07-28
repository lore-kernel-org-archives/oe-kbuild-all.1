Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6201F8723
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 19:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785265846; cv=none; b=gXU71XRPP9lo8pmL9EmILOw5Np1FHS6I+HZGOxh8GPW6n+R5n9ST4JFYBysVVEX/mHGo8y3+XtOqVMro+i8U1+OACky4Gevw5lDPIAmqSzs+ZCwALEbP5x4OSvNg5NN1AUZz91ancRrj3X1zccsaTVIamB//TXy1ua/2px7t3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785265846; c=relaxed/simple;
	bh=gdXFWfCZFCJYP426Cn90HY+I0WL49GB0OOgYnxD4FPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QIVIPXjs/0FIMwdTfzrxeIK2elkC5CUOfVhZbr/dt+9VgpmgdT+EY2DrbHzsyYg3PwdC+BckxvtSJ4N2YvrLF+FQTXiI6lSfUeHPUu2amJ0NDfdRiUBDMJ8Sezyxx358C9CM0+9h4GY25KKHn8VSbQJhUnxIKf0Udjf90BnKDUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXQpk3T/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXQpk3T/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785265842; x=1816801842;
  h=date:from:to:cc:subject:message-id;
  bh=gdXFWfCZFCJYP426Cn90HY+I0WL49GB0OOgYnxD4FPc=;
  b=bXQpk3T//if1oCYGnhQjFL5G6y0UmxVohf+yIajSgY6L4nPcR3BW97rs
   s+lb97BIJnWwtihNX+Rh4qWKBrTAUga0XLRr+mrtv37mFTwbP0r+MUujE
   YszVCmF+OZNfOtXDe8R2Kisw92zBOBEe5U7iNV/TCW5aTz9Zu1ZEcGtoi
   VGYkdcINt2TfZaZtlwMWAkGhq8JJx26Em5IoUEGxPmXn8xP44lYQWQRDM
   lxtIBPZT8NmMNKAvsWBmMFtFRPDQN+ERK8ZkMyVGTGhcsL//PIvQq4eDc
   iAL1bBoRepm0lYOKZGb9htz60OaaBkWw6KqqrjPjDgCk1AmDporE7x0kZ
   g==;
X-CSE-ConnectionGUID: NaquMjeZTbW5M8djUoN1xw==
X-CSE-MsgGUID: Sz7yhUADTg+7f1UcPLXjPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85904159"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85904159"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 12:10:39 -0700
X-CSE-ConnectionGUID: aXjedqC+QneI8b1meHPGLA==
X-CSE-MsgGUID: jmbJcJ5jSoGpDmNn5EMFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="257118010"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jul 2026 12:10:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wonCF-00000000ehL-1z3D;
	Tue, 28 Jul 2026 19:10:35 +0000
Date: Wed, 29 Jul 2026 03:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 35/35]
 drivers/cma/mm/mem_phys_layout.c:277:14: error: 'MIGRATE_ISOLATE' undeclared;
 did you mean 'MIGRATE_MOVABLE'?
Message-ID: <202607290216.W7scVaZ5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Juan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   d0ed0375a65ca817f907805e163e103822348f02
commit: b696261dbf8a4b298226981a96af8587dc5f5558 [35/35] ANDROID: mm: Get number free pages per node, zone, order and migrate type
config: i386-randconfig-005-20260728 (https://download.01.org/0day-ci/archive/20260729/202607290216.W7scVaZ5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290216.W7scVaZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290216.W7scVaZ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cma/mm/mem_phys_layout.c:237:55: note: each undeclared identifier is reported only once for each function it appears in
     237 |         pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
         |                                                       ^~~~~~~~~~~~~~
   include/linux/printk.h:422:33: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:523:9: note: in expansion of macro 'printk'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:237:9: note: in expansion of macro 'pr_info'
     237 |         pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
         |         ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:239:55: error: 'PFN_SECTION_SHIFT' undeclared (first use in this function); did you mean 'SECTIONS_SHIFT'?
     239 |         pr_info("PFN_SECTION_SHIFT             = %d", PFN_SECTION_SHIFT);
         |                                                       ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:422:33: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:523:9: note: in expansion of macro 'printk'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:239:9: note: in expansion of macro 'pr_info'
     239 |         pr_info("PFN_SECTION_SHIFT             = %d", PFN_SECTION_SHIFT);
         |         ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:241:55: error: 'SECTION_SIZE_BITS' undeclared (first use in this function)
     241 |         pr_info("SECTION_SIZE_BITS             = %d", SECTION_SIZE_BITS);
         |                                                       ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:422:33: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:523:9: note: in expansion of macro 'printk'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:241:9: note: in expansion of macro 'pr_info'
     241 |         pr_info("SECTION_SIZE_BITS             = %d", SECTION_SIZE_BITS);
         |         ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:243:56: error: 'SUBSECTION_SIZE' undeclared (first use in this function)
     243 |         pr_info("SUBSECTION_SIZE               = %ld", SUBSECTION_SIZE);
         |                                                        ^~~~~~~~~~~~~~~
   include/linux/printk.h:422:33: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:523:9: note: in expansion of macro 'printk'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:243:9: note: in expansion of macro 'pr_info'
     243 |         pr_info("SUBSECTION_SIZE               = %ld", SUBSECTION_SIZE);
         |         ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:244:56: error: 'SUBSECTIONS_PER_SECTION' undeclared (first use in this function)
     244 |         pr_info("SUBSECTIONS_PER_SECTION       = %ld", SUBSECTIONS_PER_SECTION);
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:422:33: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:523:9: note: in expansion of macro 'printk'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:244:9: note: in expansion of macro 'pr_info'
     244 |         pr_info("SUBSECTIONS_PER_SECTION       = %ld", SUBSECTIONS_PER_SECTION);
         |         ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:248:50: error: 'PAGES_PER_SUBSECTION' undeclared (first use in this function)
     248 |         pr_info("PAGES_PER_SUBSECTION    = %ld", PAGES_PER_SUBSECTION);
         |                                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:422:33: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:523:9: note: in expansion of macro 'printk'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:248:9: note: in expansion of macro 'pr_info'
     248 |         pr_info("PAGES_PER_SUBSECTION    = %ld", PAGES_PER_SUBSECTION);
         |         ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:250:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     250 |         phys_addr_t start_addr = memblock_start_of_DRAM();
         |         ^~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:252:39: error: implicit declaration of function '__pfn_to_section' [-Werror=implicit-function-declaration]
     252 |         struct mem_section *section = __pfn_to_section(start_pfn);
         |                                       ^~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:252:39: warning: initialization of 'struct mem_section *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/cma/mm/mem_phys_layout.c:253:29: error: implicit declaration of function '__section_mem_map_addr' [-Werror=implicit-function-declaration]
     253 |         struct page *page = __section_mem_map_addr(section);
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:253:29: warning: initialization of 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/cma/mm/mem_phys_layout.c:259:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     259 |                         (u64) page,
         |                         ^
   include/linux/printk.h:422:33: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:523:9: note: in expansion of macro 'printk'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:256:9: note: in expansion of macro 'pr_info'
     256 |         pr_info("    PFN: %10llu == %#010Lx  struct page[mem %#010Lx], PHYS[mem %#010Lx]",
         |         ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c: In function 'get_migrate_type_name':
   drivers/cma/mm/mem_phys_layout.c:275:14: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
     275 |         case MIGRATE_CMA:
         |              ^~~~~~~~~~~
         |              MIGRATE_SYNC
>> drivers/cma/mm/mem_phys_layout.c:277:14: error: 'MIGRATE_ISOLATE' undeclared (first use in this function); did you mean 'MIGRATE_MOVABLE'?
     277 |         case MIGRATE_ISOLATE:
         |              ^~~~~~~~~~~~~~~
         |              MIGRATE_MOVABLE
   drivers/cma/mm/mem_phys_layout.c: In function 'free_memory_per_area':
   drivers/cma/mm/mem_phys_layout.c:292:9: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
     292 |         for (int migrate_type = 0; migrate_type < MIGRATE_TYPES; migrate_type++) {
         |         ^~~
   drivers/cma/mm/mem_phys_layout.c:292:9: note: use option '-std=c99', '-std=gnu99', '-std=c11' or '-std=gnu11' to compile your code
   drivers/cma/mm/mem_phys_layout.c: In function 'free_memory_per_zone':
   drivers/cma/mm/mem_phys_layout.c:326:9: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
     326 |         for (int current_order = 0; current_order < NR_PAGE_ORDERS; current_order++) {
         |         ^~~
   drivers/cma/mm/mem_phys_layout.c:326:53: error: 'NR_PAGE_ORDERS' undeclared (first use in this function)
     326 |         for (int current_order = 0; current_order < NR_PAGE_ORDERS; current_order++) {
         |                                                     ^~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c: In function 'free_memory_per_node':
   drivers/cma/mm/mem_phys_layout.c:346:17: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
     346 |                 for (int i = 0; i < node->nr_zones; i++) {
         |                 ^~~
   cc1: some warnings being treated as errors


vim +277 drivers/cma/mm/mem_phys_layout.c

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
   275		case MIGRATE_CMA:
   276			return "CMA";
 > 277		case MIGRATE_ISOLATE:
   278			return "ISOLATE";
   279		default:
   280			return "UNKNOWN MIGRATE TYPE";
   281		}
   282	}
   283	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
