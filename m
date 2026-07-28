Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC06275AFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234697; cv=none; b=eoIm6SCgw0AwcQA+8eis1M1nC+mADp2RstthFAF4Pmfu+NFGa2SEWhinG+Y03SxU0EPbJA2+70DM0hk45aRP8ZIyTJu5dFsuc0UJDFGg40aPEr0uAVqc1wjFNcJ3fC7Simfgod04CUOzzgXlFUNKpKW/jK/kY6dEj9/43avuSgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234697; c=relaxed/simple;
	bh=GrFh5wOo67sdaPMHSi8bNxjXSGmeI5uHZr7upHVlgVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pC3bCe3NxSFWqg1CCy0hRFSaBBHMCvb0DRVktjDWGLNCaUEbAmAlG33rRRsN9TN6lkRsOibG4sLB0aN+bPQVvcP3+Tgz79hrhqVOcOAFNR7ZeVS/EiDkZs/+b6MNRe2OFNscOE+9Z/6IHdv8WXzjCMKHIDX2aqS/1rfBwC3cnz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJ7/kYiT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJ7/kYiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785234695; x=1816770695;
  h=date:from:to:cc:subject:message-id;
  bh=GrFh5wOo67sdaPMHSi8bNxjXSGmeI5uHZr7upHVlgVg=;
  b=CJ7/kYiTMEiBveE6zpZE8FwPJxRc0GTofS6cPt9I+oLbMORiE/k6fHzm
   r04p+uv/tIGflacRN3G5sb8SxD53nqRWu81FWCwFf9sEHZTNFye1x5JlC
   a5Fc2ouLtuTxapW+6wyNxNw3QMi8pTC1JuWPOFwMu8tpv2eueVp9ogdqA
   Pd+LWOATV5GyP+Vr7gb1KSV07gf0PkmrOciQPcWepQHt0GijJZgp1dzPZ
   wm/WIpVSZAPIqNxkhyIXmjpmBGJtRV+CTreM/fQ3v/+ByNGjkhoMTWKbN
   rz3o6ecz5kkIhVPNuHGFoCLEH0sMs8GpTWz8/7CxvL9LEhxgAJo8m1zHe
   A==;
X-CSE-ConnectionGUID: Oix1ORyAS0arPSiIglmE3A==
X-CSE-MsgGUID: gYH/A1wbQ72g5QphynqR2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85854886"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85854886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 03:31:34 -0700
X-CSE-ConnectionGUID: ZprX9Z00RVCDEE4dT4wtMA==
X-CSE-MsgGUID: tDfL6ox+T4Kz9uGgj9hMDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="257004594"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jul 2026 03:31:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wof5u-00000000eFT-3Ggh;
	Tue, 28 Jul 2026 10:31:30 +0000
Date: Tue, 28 Jul 2026 18:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 35/35]
 drivers/cma/mm/mem_phys_layout.c:252:39: warning: initialization of 'struct
 mem_section *' from 'int' makes pointer from integer without a cast
Message-ID: <202607281822.PQ5lousk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   d0ed0375a65ca817f907805e163e103822348f02
commit: 90b05bcbb174b28bb0bc20f6d7f68c092a66a64f [35/35] ANDROID: mm: Get Physical memory model for the system
config: i386-randconfig-005-20260728 (https://download.01.org/0day-ci/archive/20260728/202607281822.PQ5lousk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281822.PQ5lousk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281822.PQ5lousk-lkp@intel.com/

All warnings (new ones prefixed by >>):

     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:112:9: note: in expansion of macro 'pr_info'
     112 |         pr_info("    PFN: %10llu == %#010Lx  struct page[mem %#010Lx], PHYS[mem %#010Lx]",
         |         ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c: In function 'print_page_flags':
   drivers/cma/mm/mem_phys_layout.c:189:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     189 |                 struct page *page = pfn_to_page(pfn);
         |                 ^~~~~~
   drivers/cma/mm/mem_phys_layout.c: In function 'print_phys_memory_model':
   drivers/cma/mm/mem_phys_layout.c:237:55: error: 'MAX_PAGE_ORDER' undeclared (first use in this function)
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
>> drivers/cma/mm/mem_phys_layout.c:252:39: warning: initialization of 'struct mem_section *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/cma/mm/mem_phys_layout.c:253:29: error: implicit declaration of function '__section_mem_map_addr' [-Werror=implicit-function-declaration]
     253 |         struct page *page = __section_mem_map_addr(section);
         |                             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/cma/mm/mem_phys_layout.c:253:29: warning: initialization of 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   cc1: some warnings being treated as errors


vim +252 drivers/cma/mm/mem_phys_layout.c

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
