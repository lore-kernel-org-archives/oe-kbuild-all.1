Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA63A453F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753607; cv=none; b=jXRtjaD/ubEv7H5RW3RueUQiOmxX+JHUB+rOE93DJU1PLZUoe+0G5L47m+zmPXD2Ge+FhmFUNcv1ThALR6KqKEN0Qd/a2Q7ycuWSJQTRIWrrGu4hDoY/Opph40MHUEqM/mGf4hTLBrWGamZzZcV8XfygSyutwniv41djl5p0bDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753607; c=relaxed/simple;
	bh=1NIx5365wokfUEAdBLlPKCEergXLfmLEmFYf+eMfAoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h5pV5+7/DGGdCemQdp/QAC/YT+XllWA/8YxYL79JcSXvIA4fpL72m/bZ0LeeUMCFcs3wA7aYK73ZKi/HQBCJI4UAK9j1sMeglxzcEdD8UsPQXTMC6E/YJj4bDRHf6LCfybU7cRDhTVFiPFJjtErE4c6vkB7c2ZbYgLEVqKyXs8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fwsz2wPY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fwsz2wPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753605; x=1805289605;
  h=date:from:to:cc:subject:message-id;
  bh=1NIx5365wokfUEAdBLlPKCEergXLfmLEmFYf+eMfAoo=;
  b=Fwsz2wPYdmCS2ycA1PmDXzlUBqmnEoOnrpr7H5fE2ihg0mH8GGoVWzPt
   S4yna0VoyWfjiXVVGR7y5TqrQjh7LbYUwUTEYYkSLEnJmQPk0KTq2wDcu
   oQxpCE4b7Yn25FvD15sfDE9v6g+SoOUumsXMe16fNWNaewCxVbxy0yzt1
   A6dTfF87Re2R0WzgJOr+455vbzmc+IPSrzqs47jfiQnCoADFKmfmyE+qH
   pCvJ0LQJVOAwaIp59VJzzf59ZVYxCoEqDCP6q2bdVrfgyHVtcatUC8Pgg
   +H3zI23CGb/NGxSx+REZLeqOpWyOi0bEd9YIpNuHd5uuz35TPyp7obcFQ
   g==;
X-CSE-ConnectionGUID: sH96chPcQUytQfgSF4OZcg==
X-CSE-MsgGUID: NNzWJu9zQTGP8K7fl5MONQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85411396"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85411396"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:20:03 -0700
X-CSE-ConnectionGUID: A8GKsEVzTDujneOkkanWJw==
X-CSE-MsgGUID: Bzs7/1nHSoqyyDDeR4dnHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221495553"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 06:20:02 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2UL0-000000000SD-2xL5;
	Tue, 17 Mar 2026 13:19:58 +0000
Date: Tue, 17 Mar 2026 21:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 drivers/cma/mm/mem_phys_layout.c:275:7: error: use of undeclared identifier
 'MIGRATE_CMA'
Message-ID: <202603172127.OheNukmP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Juan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   339bea17e1ccb695cddcbc39f88955c85e45d97a
commit: b696261dbf8a4b298226981a96af8587dc5f5558 [30/30] ANDROID: mm: Get number free pages per node, zone, order and migrate type
config: x86_64-buildonly-randconfig-001-20260317 (https://download.01.org/0day-ci/archive/20260317/202603172127.OheNukmP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172127.OheNukmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172127.OheNukmP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/cma/mm/mem_phys_layout.c:153:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     153 |         unsigned long last_pfn = pfn - 1;
         |                       ^
   drivers/cma/mm/mem_phys_layout.c:189:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     189 |                 struct page *page = pfn_to_page(pfn);
         |                              ^
   drivers/cma/mm/mem_phys_layout.c:237:48: error: use of undeclared identifier 'MAX_PAGE_ORDER'
     237 |         pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
         |                                                       ^~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:240:49: error: use of undeclared identifier 'MAX_PAGE_ORDER'
     240 |         pr_info("(MAX_PAGE_ORDER + PAGE_SHIFT) = %d", (MAX_PAGE_ORDER + PAGE_SHIFT));
         |                                                        ^~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:250:14: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     250 |         phys_addr_t start_addr = memblock_start_of_DRAM();
         |                     ^
>> drivers/cma/mm/mem_phys_layout.c:275:7: error: use of undeclared identifier 'MIGRATE_CMA'
     275 |         case MIGRATE_CMA:
         |              ^~~~~~~~~~~
>> drivers/cma/mm/mem_phys_layout.c:277:7: error: use of undeclared identifier 'MIGRATE_ISOLATE'; did you mean 'MIGRATE_MOVABLE'?
     277 |         case MIGRATE_ISOLATE:
         |              ^~~~~~~~~~~~~~~
         |              MIGRATE_MOVABLE
   include/linux/mmzone.h:48:2: note: 'MIGRATE_MOVABLE' declared here
      48 |         MIGRATE_MOVABLE,
         |         ^
>> drivers/cma/mm/mem_phys_layout.c:277:7: error: duplicate case value 'MIGRATE_MOVABLE'
     277 |         case MIGRATE_ISOLATE:
         |              ^
   drivers/cma/mm/mem_phys_layout.c:268:7: note: previous case defined here
     268 |         case MIGRATE_MOVABLE:
         |              ^
   drivers/cma/mm/mem_phys_layout.c:292:7: warning: GCC does not allow variable declarations in for loop initializers before C99 [-Wgcc-compat]
     292 |         for (int migrate_type = 0; migrate_type < MIGRATE_TYPES; migrate_type++) {
         |              ^
   drivers/cma/mm/mem_phys_layout.c:326:7: warning: GCC does not allow variable declarations in for loop initializers before C99 [-Wgcc-compat]
     326 |         for (int current_order = 0; current_order < NR_PAGE_ORDERS; current_order++) {
         |              ^
   drivers/cma/mm/mem_phys_layout.c:326:46: error: use of undeclared identifier 'NR_PAGE_ORDERS'
     326 |         for (int current_order = 0; current_order < NR_PAGE_ORDERS; current_order++) {
         |                                                     ^~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:346:8: warning: GCC does not allow variable declarations in for loop initializers before C99 [-Wgcc-compat]
     346 |                 for (int i = 0; i < node->nr_zones; i++) {
         |                      ^
   7 warnings and 6 errors generated.


vim +/MIGRATE_CMA +275 drivers/cma/mm/mem_phys_layout.c

   234	
   235	static void print_phys_memory_model(void)
   236	{
 > 237		pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
   238		pr_info("pageblock_order               = %d", pageblock_order);
   239		pr_info("PFN_SECTION_SHIFT             = %d", PFN_SECTION_SHIFT);
 > 240		pr_info("(MAX_PAGE_ORDER + PAGE_SHIFT) = %d", (MAX_PAGE_ORDER + PAGE_SHIFT));
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
   256		pr_info("    PFN: %10llu == %#010Lx  struct page[mem %#010Lx], PHYS[mem %#010Lx]",
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
