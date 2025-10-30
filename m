Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7527B353
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 21:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761859094; cv=none; b=W5Eb0VbXsjT/b2GsRLLFHf0uF7q8t4G/f5gjfILFlsNSP3AqmHYY+O4V0MYqv5nZkJ219I7NEvzF8Ot+Z7DjE/AnyfDpybhTcJPHz1Q5N24OGwBprFFWsBmD/U6I/jA+gV/XkH/qI/iPl/SWH5aXCQ+gVHbkBvv3pkewcUKvVBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761859094; c=relaxed/simple;
	bh=qoHW61vO9hCCiPOOXY5lLy3ZGwCspZr8RyNiJ0zRFnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWvZMOHE2n2Ql047ptT/SX4cUZlu7Y4qrJz/qdtfG0iHOwsoIyXjOShnsFBo5SF6w4wEDSK5VVNciBQJEjXJ33if7zWD+iNWk9kQxqP6OczDbLQnCt8NrP0LjPPJnpqJXOAnfdNLdpxbPwFoo2yn4fv+xUuTjARmUgsmfv+PMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grLI0ZKu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grLI0ZKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761859092; x=1793395092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoHW61vO9hCCiPOOXY5lLy3ZGwCspZr8RyNiJ0zRFnI=;
  b=grLI0ZKuDTFT92uWtlYzdLGm6sxF8oKUm2Vaum5Pv2r/LhUtxh5yrlmE
   O+6WqiDWafEOn4BVcZG1y6+6HFID+C6RbLJZZVTRhQij+mbcm0aho9Lbl
   gX/fXRgzgA6HDViw2sTOQzTGF5aUeyB63fkTjiqqrVzblXW6zfkKbeaqP
   9oZxyA/g530SKng8bygq0f6U+b+RS+pSOs63tkcKMqzz574TSnBfuHGUU
   x4TSTAHh1egDCPTu4ii7iU3hVQJXsbVdvaG9hWvsSwkk5wMbQolVciNNx
   5wct/NMoY+68UHSfs1cWmqlq17P11wvhIBKi7d2qgoNIUBsFtHtMGLDbx
   g==;
X-CSE-ConnectionGUID: amXjPqJESpeBnEyIbdhFbw==
X-CSE-MsgGUID: 1nIXLIBUT1WOY/t0LisNaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63926877"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63926877"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 14:18:11 -0700
X-CSE-ConnectionGUID: 8JgEam/cRAGf+HKVJTJ8dA==
X-CSE-MsgGUID: fFol/7RiRPeOxZ0CE57OIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="209631623"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Oct 2025 14:18:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEa23-000MXk-2a;
	Thu, 30 Oct 2025 21:18:07 +0000
Date: Fri, 31 Oct 2025 05:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 23/23]
 drivers/cma/mm/mem_phys_layout.c:237:48: error: use of undeclared identifier
 'MAX_PAGE_ORDER'
Message-ID: <202510310512.Yd26zEby-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   90b05bcbb174b28bb0bc20f6d7f68c092a66a64f
commit: 90b05bcbb174b28bb0bc20f6d7f68c092a66a64f [23/23] ANDROID: mm: Get Physical memory model for the system
config: arm-randconfig-004-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310512.Yd26zEby-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310512.Yd26zEby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310512.Yd26zEby-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cma/mm/mem_phys_layout.c:189:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     189 |                 struct page *page = pfn_to_page(pfn);
         |                              ^
>> drivers/cma/mm/mem_phys_layout.c:237:48: error: use of undeclared identifier 'MAX_PAGE_ORDER'
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


vim +/MAX_PAGE_ORDER +237 drivers/cma/mm/mem_phys_layout.c

   234	
   235	static void print_phys_memory_model(void)
   236	{
 > 237		pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
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
