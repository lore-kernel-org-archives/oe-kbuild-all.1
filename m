Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A823E3DA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760580; cv=none; b=EgTQkn88al3rMeh7nsTIsk4lzPDHRAhf6/uua5SnMiQ1ig8AZZcUEgxsc6VRZYZzlHeUVzw1MS9yaDEiiRDVdwlbhlq9UTPP3fwT8FHpFTDtMvwnIkrDrTO7sscPydI3n2mbviVzWJTjrJQGfHFEFidljqaJip0DV09s87SlPro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760580; c=relaxed/simple;
	bh=veClZdafdAS965t5QMkX+ISiMDxu0kr8+AOdt6bF4Ak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tl3ZE9WBkOMMxrU7Ym4wkzz0d/QhBz9dDIritCvs9Z5Sy1fxWXAL5aa6vYj0rK6KvdN6uUif8p6zRAPdv4V0V++2YmXxbCUqd/UafdUoX5h0P8J+6pRMOF576BEuY4p1A1WrVZWXmJNE7ku2pvYCXudb23gfBzNjrvqlbvvkwQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4CeSxv+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4CeSxv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773760579; x=1805296579;
  h=date:from:to:cc:subject:message-id;
  bh=veClZdafdAS965t5QMkX+ISiMDxu0kr8+AOdt6bF4Ak=;
  b=L4CeSxv+EVEWv65/+h2OAmXrP97zYJV3bLorOQh8TmXdITX8tMjZcjIg
   OjO4LIsvSfjKwbqUs3r7jgzqBPTvGlFtqwlQ9LiokxwHWcGWz0CXjyOEd
   j6fNm4j3eA0ya5rfOie/IMh2gw3LWAplZLBz4fO68MHm/naMooyEFF0II
   O+Ko30mAcXgJePyUPOqNo62sikdFc6KSWbX93BQzfxUvFx9S+m1h3RLjy
   xHHf9BRq/my0KvJm1DH28xEIzTVCNlumPgn+GeBD8BNXqUk68NKWQIsmk
   xucDSLwckMkRg+IkIJAfN2uDxivBRnVvriJV1qICNRFf9l+mNcO+8njFf
   Q==;
X-CSE-ConnectionGUID: pWBM3mpQQYiXyv/7GV/FmQ==
X-CSE-MsgGUID: mQ1Hl3viQgSRBKvjrVZd6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74683425"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74683425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:16:16 -0700
X-CSE-ConnectionGUID: WsR/71yKSJ+BLTdOo+Fwdg==
X-CSE-MsgGUID: tX48uTeZSiiPovVBSkw33Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226985453"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 08:16:14 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2W9T-000000000bp-3DE6;
	Tue, 17 Mar 2026 15:16:11 +0000
Date: Tue, 17 Mar 2026 23:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 drivers/cma/mm/mem_phys_layout.c:239:48: error: use of undeclared identifier
 'PFN_SECTION_SHIFT'
Message-ID: <202603172357.MTc4iNq5-lkp@intel.com>
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
commit: 90b05bcbb174b28bb0bc20f6d7f68c092a66a64f [30/30] ANDROID: mm: Get Physical memory model for the system
config: i386-buildonly-randconfig-002-20260317 (https://download.01.org/0day-ci/archive/20260317/202603172357.MTc4iNq5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172357.MTc4iNq5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172357.MTc4iNq5-lkp@intel.com/

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
