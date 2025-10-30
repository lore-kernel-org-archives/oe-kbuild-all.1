Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144992F5465
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761859098; cv=none; b=ANZ6b+Sv4q3GdR8laS7viYElm7qJ+sWV3ypC9tbTD/kYhZayUXf43Ucyl6VQxKfAsa1+rUQxvD2ZqfTKzHQ6GbrQFYpJGW9d/dJ0RMNy4iJGVxqXRGdO/+rwsM5OvHpr2rOjtvCJTXXxyXSc3V483tgxpQGKJLD1mBpfhXKSBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761859098; c=relaxed/simple;
	bh=U9u58B/xuPVQeK5C9zqYUr0cvRXgZ9ggSgxrU+1T3ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPB+mh6sbcjaBjCd3uDRn62YQKiDpHCki1WypqtaArXkWxVSIAgUX/Sy8FDEYEyPXLfbn3XW39AIxT8VosY5vdGZuxZUbDytVkwD8P6YbLGRpvj+xHguak0vOADhecpOnPaLpDtyhaOhXkaS6lwXSrGkc8/95qg5X+jNgW01wV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0x+t73+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0x+t73+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761859096; x=1793395096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9u58B/xuPVQeK5C9zqYUr0cvRXgZ9ggSgxrU+1T3ss=;
  b=k0x+t73+SUQQY5XX1P4Rxla3mkvlkRpFxZ84h/hCwIrMUt3a6c03riLt
   KvxCPezN/47Z58AJZM+/24qtBB1cNWrkROLq3i7nMOHQ510SbA5U5wuL/
   aK/+RnafKomNO7rRDvqGrtgbAdzOGXf4Ozs0uy9Pn49rAJta/wYxT+QII
   nrgwxpFQe1tdzcq0oN7NxMAB+LA5mGTfhhzLtvgcXBzuSiVwD7F912c2H
   nJmuMiDuVuxFODfBgJMRe0Fn+w0i+n8kRgUPgjhTNGGCYjNERNPvNTi9D
   iPBCMxlKb3ANs/HuwAYAbIClWMqCmwQAi/GzwX9iZq8jvAPnpm4m1Hrnj
   A==;
X-CSE-ConnectionGUID: b2qeyX9cTRim9YLuFVsZ0g==
X-CSE-MsgGUID: SqJH1VUxTuiys8Ksg8IZHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74691644"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="74691644"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 14:18:15 -0700
X-CSE-ConnectionGUID: xKLJhEWGRy+bmvUSVmWSxQ==
X-CSE-MsgGUID: udlJc/f5RUGvZpAsrHLwWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="191212796"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2025 14:18:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEa23-000MXi-2W;
	Thu, 30 Oct 2025 21:18:07 +0000
Date: Fri, 31 Oct 2025 05:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 23/23]
 drivers/cma/mm/mem_phys_layout.c:252:39: warning: initialization of 'struct
 mem_section *' from 'int' makes pointer from integer without a cast
Message-ID: <202510310504.KXhramKw-lkp@intel.com>
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
config: arm-randconfig-001-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310504.KXhramKw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310504.KXhramKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310504.KXhramKw-lkp@intel.com/

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
