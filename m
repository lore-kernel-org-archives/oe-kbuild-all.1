Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FE241D4C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230870; cv=none; b=uD+UyAkXFs9DfaW3kvfJ8sDRpLLLbUap08jGzjPykPfEOoRxWBUeSFV71vvm8CAb18C0sx9/XMQ7azglD/q0q0DHUoNRzLOOiTOyeP6r32sUQe9P373qGQU2Hb7YisLDzMfpQwGcFIKO8XCBzSM5qJ4E0MaIRlvruJ0YInzH0+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230870; c=relaxed/simple;
	bh=rB6pyHoIr4vxaMn4XqKFNAdnubCKEv9bD9zxD1V+dlQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sHe8/HUxvxQyX8RsQdNU5tM+mCoVf9SL9H8NHXB6R0ePgTl8Ujroo8RY2TE/c/tIz94D6kVglrOtw71SuJUJrs3oe2UT0R+eiHlnRY6l0j86pzlFCZXSDQdT+f+MFNlRXzDjy2UJVtOB9EBwsvsKG2xYwcy7oVVljL1cGTw5mXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C61Ecmxz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C61Ecmxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785230869; x=1816766869;
  h=date:from:to:cc:subject:message-id;
  bh=rB6pyHoIr4vxaMn4XqKFNAdnubCKEv9bD9zxD1V+dlQ=;
  b=C61Ecmxz2teKMnMEgdIedfSjUxXGUagz2erIy9vhkAUdSK7kMqLag0VK
   +hUP/7nw1b6si6YCRw8DexZXxrtc9cK/vmq7lzsIDxy9Puy3p3Opr8NOZ
   hPgZ+E6Aii6dpHc8mIjsci86Gxd02+v8COcSKu/VuUc6zPuTs3/Z2VNlO
   LgocyJS6rsTemiTLXxoXhD6e4KgU+1VckMjcvgm/92hCAEyl7zPHnJOMl
   x9V7U4ctHaWJAFqL1TAqKFIKlOPrSnNHs+2vYn4lrO+4+86SkZiU+06o0
   45+6ZRuRDvoVhj43BuF6puL5CVYeu4v1K7xEz8CO/yhWc4jqTjIFqGIwY
   Q==;
X-CSE-ConnectionGUID: 3jFFHPITQdGkRz6215CRpA==
X-CSE-MsgGUID: 1kAsF5TnQv2qo8JFe0No9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85677709"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85677709"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 02:27:48 -0700
X-CSE-ConnectionGUID: SnxcYjACTmaruNgG+xBGYQ==
X-CSE-MsgGUID: bhfGv1iuR2OOf1IToIX7UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="263440787"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Jul 2026 02:27:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woe68-00000000eBz-3uHY;
	Tue, 28 Jul 2026 09:27:42 +0000
Date: Tue, 28 Jul 2026 17:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 35/35]
 drivers/cma/mm/mem_phys_layout.c:239:48: error: use of undeclared identifier
 'PFN_SECTION_SHIFT'
Message-ID: <202607281752.M3OsgJ71-lkp@intel.com>
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
commit: 90b05bcbb174b28bb0bc20f6d7f68c092a66a64f [35/35] ANDROID: mm: Get Physical memory model for the system
config: i386-randconfig-001 (https://download.01.org/0day-ci/archive/20260728/202607281752.M3OsgJ71-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281752.M3OsgJ71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281752.M3OsgJ71-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cma/mm/mem_phys_layout.c:189:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     189 |                 struct page *page = pfn_to_page(pfn);
         |                              ^
   drivers/cma/mm/mem_phys_layout.c:237:48: error: use of undeclared identifier 'MAX_PAGE_ORDER'
     237 |         pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
         |                                                       ^~~~~~~~~~~~~~
>> drivers/cma/mm/mem_phys_layout.c:239:48: error: use of undeclared identifier 'PFN_SECTION_SHIFT'
     239 |         pr_info("PFN_SECTION_SHIFT             = %d", PFN_SECTION_SHIFT);
         |                                                       ^~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:240:49: error: use of undeclared identifier 'MAX_PAGE_ORDER'
     240 |         pr_info("(MAX_PAGE_ORDER + PAGE_SHIFT) = %d", (MAX_PAGE_ORDER + PAGE_SHIFT));
         |                                                        ^~~~~~~~~~~~~~
>> drivers/cma/mm/mem_phys_layout.c:241:48: error: use of undeclared identifier 'SECTION_SIZE_BITS'
     241 |         pr_info("SECTION_SIZE_BITS             = %d", SECTION_SIZE_BITS);
         |                                                       ^~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:242:54: error: use of undeclared identifier 'SECTION_SIZE_BITS'
     242 |         pr_info("2 ^ SECTION_SIZE_BITS         = %d", (1 << SECTION_SIZE_BITS));
         |                                                             ^~~~~~~~~~~~~~~~~
>> drivers/cma/mm/mem_phys_layout.c:243:49: error: use of undeclared identifier 'SUBSECTION_SIZE'
     243 |         pr_info("SUBSECTION_SIZE               = %ld", SUBSECTION_SIZE);
         |                                                        ^~~~~~~~~~~~~~~
>> drivers/cma/mm/mem_phys_layout.c:244:49: error: use of undeclared identifier 'SUBSECTIONS_PER_SECTION'
     244 |         pr_info("SUBSECTIONS_PER_SECTION       = %ld", SUBSECTIONS_PER_SECTION);
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:246:4: error: use of undeclared identifier 'SUBSECTION_SIZE'
     246 |                         SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION,
         |                         ^~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:246:22: error: use of undeclared identifier 'SUBSECTIONS_PER_SECTION'
     246 |                         SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:247:4: error: use of undeclared identifier 'SUBSECTION_SIZE'
     247 |                         SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION / 1024 / 1024);
         |                         ^~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:247:22: error: use of undeclared identifier 'SUBSECTIONS_PER_SECTION'
     247 |                         SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION / 1024 / 1024);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cma/mm/mem_phys_layout.c:248:43: error: use of undeclared identifier 'PAGES_PER_SUBSECTION'
     248 |         pr_info("PAGES_PER_SUBSECTION    = %ld", PAGES_PER_SUBSECTION);
         |                                                  ^~~~~~~~~~~~~~~~~~~~
>> drivers/cma/mm/mem_phys_layout.c:252:32: error: implicit declaration of function '__pfn_to_section' [-Werror,-Wimplicit-function-declaration]
     252 |         struct mem_section *section = __pfn_to_section(start_pfn);
         |                                       ^
>> drivers/cma/mm/mem_phys_layout.c:252:22: error: incompatible integer to pointer conversion initializing 'struct mem_section *' with an expression of type 'int' [-Wint-conversion]
     252 |         struct mem_section *section = __pfn_to_section(start_pfn);
         |                             ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cma/mm/mem_phys_layout.c:253:22: error: implicit declaration of function '__section_mem_map_addr' [-Werror,-Wimplicit-function-declaration]
     253 |         struct page *page = __section_mem_map_addr(section);
         |                             ^
>> drivers/cma/mm/mem_phys_layout.c:253:15: error: incompatible integer to pointer conversion initializing 'struct page *' with an expression of type 'int' [-Wint-conversion]
     253 |         struct page *page = __section_mem_map_addr(section);
         |                      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:250:14: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     250 |         phys_addr_t start_addr = memblock_start_of_DRAM();
         |                     ^
   2 warnings and 16 errors generated.


vim +/PFN_SECTION_SHIFT +239 drivers/cma/mm/mem_phys_layout.c

   234	
   235	static void print_phys_memory_model(void)
   236	{
   237		pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
   238		pr_info("pageblock_order               = %d", pageblock_order);
 > 239		pr_info("PFN_SECTION_SHIFT             = %d", PFN_SECTION_SHIFT);
   240		pr_info("(MAX_PAGE_ORDER + PAGE_SHIFT) = %d", (MAX_PAGE_ORDER + PAGE_SHIFT));
 > 241		pr_info("SECTION_SIZE_BITS             = %d", SECTION_SIZE_BITS);
   242		pr_info("2 ^ SECTION_SIZE_BITS         = %d", (1 << SECTION_SIZE_BITS));
 > 243		pr_info("SUBSECTION_SIZE               = %ld", SUBSECTION_SIZE);
 > 244		pr_info("SUBSECTIONS_PER_SECTION       = %ld", SUBSECTIONS_PER_SECTION);
   245		pr_info("SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION = %ld = %ldMiB",
   246				SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION,
   247				SUBSECTION_SIZE * SUBSECTIONS_PER_SECTION / 1024 / 1024);
 > 248		pr_info("PAGES_PER_SUBSECTION    = %ld", PAGES_PER_SUBSECTION);
   249	
   250		phys_addr_t start_addr = memblock_start_of_DRAM();
   251		unsigned long start_pfn = PHYS_PFN(start_addr);
 > 252		struct mem_section *section = __pfn_to_section(start_pfn);
 > 253		struct page *page = __section_mem_map_addr(section);
   254	
   255		pr_info("Using struct mem_section");
   256		pr_info("    PFN: %10llu == %#010Lx  struct page[mem %#010Lx], PHYS[mem %#010Lx]",
   257				(u64)start_pfn,
   258				(u64)start_pfn,
   259				(u64) page,
   260				(u64)PFN_PHYS(start_pfn));
   261	}
   262	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
