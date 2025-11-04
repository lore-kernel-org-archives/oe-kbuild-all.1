Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F50189BB0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 06:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762236845; cv=none; b=Ws8UnpqodH+qoXDKd7wLd5gfm2wuTlf2q2GYYQnTxgznoAu+oCGVuLxGHWPLjYAAncg4cFiQMfXatPR4satS5gDM9idGMfnUf4RsWsx8B9mmzlriIHHXK0Cio8LmHy5FaqP43AXh+mpvnptrXmunewPBF5dKk2XUQN6yjPkyinY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762236845; c=relaxed/simple;
	bh=FmFUeqYriTtKskal/GSNCSz86dO8bk/T+EePTm4ZcaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M9sbJ/kcEnPKTsBqL1K2f2T7O0005lcg8+Mzrz0zsGu+gp/tEHomHNEFDdbTImIDsnR8eUhx1Qnpws5bwYXk24c++IPCizhRmgoPe14jOSSRygffr1dmmTndWXpj6MYJ4ykk1V1StP0vlBqPrarXovd7louoe/CCssQRn8v/Hso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itUTix72; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itUTix72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762236844; x=1793772844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FmFUeqYriTtKskal/GSNCSz86dO8bk/T+EePTm4ZcaU=;
  b=itUTix72MjbPJudPzeYki3r7ksf9+55Oym5EEd2Snv4iwUinaPftj1/L
   5ZsAx7p0ejXV1+o4W3nmjs/pefvtynYOPMXXS/DIk6pw5N4u/jWHIcgjB
   SbqiojgntcTiio9Xj9spBTdJrlMb99rk4m5aDnF6+23rtqZH9fVf+9hzl
   JKxXpdeRS9X9slfK5ZfuMfJzaIA0Yt853Pl5DlzjJvLK7z4ghQ+Ql9/h5
   WpjZxGbAUwRwmJT4peg7imzuSmi3RrIvKECDKSd+tMfN6dxYBzC4FoBSc
   pt/9hf4gK6MOhjFG+6a6yF6BQGE2QgSflkf0LWbzngJ9cjWelNfF1Puq0
   A==;
X-CSE-ConnectionGUID: lwkmw4g8TI2rdnyPCUvrqw==
X-CSE-MsgGUID: VEZNmjFLSfWiXfvlpw8yDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68161224"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68161224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:14:03 -0800
X-CSE-ConnectionGUID: jQi8YzRMR4WbMiI8V3O/lQ==
X-CSE-MsgGUID: X4ZiJn1mTcmxjJWtSaJ9Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="217711594"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Nov 2025 22:14:02 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGAIa-000QzA-0U;
	Tue, 04 Nov 2025 06:13:52 +0000
Date: Tue, 4 Nov 2025 14:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 24/24]
 drivers/cma/mm/mem_phys_layout.c:252:32: warning: initialization makes
 pointer from integer without a cast
Message-ID: <202511041448.Mng7BJHY-lkp@intel.com>
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
commit: 90b05bcbb174b28bb0bc20f6d7f68c092a66a64f [24/24] ANDROID: mm: Get Physical memory model for the system
config: arm-randconfig-004-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041448.Mng7BJHY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041448.Mng7BJHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041448.Mng7BJHY-lkp@intel.com/

All warnings (new ones prefixed by >>):

      ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/linux/memblock.h:13,
                    from drivers/cma/mm/mem_phys_layout.c:14:
   drivers/cma/mm/mem_phys_layout.c: In function 'print_phys_memory_model':
   drivers/cma/mm/mem_phys_layout.c:237:48: error: 'MAX_PAGE_ORDER' undeclared (first use in this function); did you mean 'XA_STATE_ORDER'?
     pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
                                                   ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:237:2: note: in expansion of macro 'pr_info'
     pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
     ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c:237:48: note: each undeclared identifier is reported only once for each function it appears in
     pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
                                                   ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
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
>> drivers/cma/mm/mem_phys_layout.c:252:32: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
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
 > 250		phys_addr_t start_addr = memblock_start_of_DRAM();
   251		unsigned long start_pfn = PHYS_PFN(start_addr);
 > 252		struct mem_section *section = __pfn_to_section(start_pfn);
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
