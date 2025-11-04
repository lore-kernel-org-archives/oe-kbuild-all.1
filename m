Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4AA30AAB0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245074; cv=none; b=CbVwlnGy+aqomCIFLlwean69TKwjnLUxFdBdbm6h+g4e26GY9ud4HIY3XQy+mVDdZUHSFeO8f++CZstUu22k0L9pWY2KEH64yV2+nqTXXpHaPb4Ap1hZgzRVvnUPOgKZ8cj4o+OxlUiqGV/cF8WNs8p91Na+ccGpto0k4x69aZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245074; c=relaxed/simple;
	bh=vJ/VdVxrLyZv1AQD61YTdB67pdrAhRkuSw0VAa5WMLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qlkhIVx1Iag39ts4yurDq/SzUl7Z1N4JpMP/u2iGLkGQb7OF7Y9Ok1A1RXal5vG7Kogc2R/quWMFdk0AWTjRDPPv+4s1qP+z/nQ1L6qkflSAlOoxG5HNUP1xI8iWElfrEcuecLPW7NDtJhNuvItJCZ8yABrKkO6mRbFUaimXq1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m17Ke4+q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m17Ke4+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762245073; x=1793781073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJ/VdVxrLyZv1AQD61YTdB67pdrAhRkuSw0VAa5WMLA=;
  b=m17Ke4+qipAJJv9ZZPyarFg1hQtRaa7+WNQBjNROTflfRf5eMe+G/x1X
   uNfPUBr9O7aRXafik702QWLDk9HB9MQH+LcgH5i+mQCeybh53j1Atks8w
   aVe4vFmoXWP7Zuc9Asi4M5f5WAgsi/N2/jfcrrjD0AJR3hRhXkAS91QT9
   B7rckmtP3BPLqlyCC+2/kmkxOJMcdYLZHnNU28MJ147Secb71RrZF70xO
   +qj9DH5iA7w/IQACzGXRv8AaIkBGnlWPFA+jz//da73YrWwZr6SAs9y29
   pMTpyiYz0kIXwc3vvxqty33BDpxc9FfZXgDvMYR8nZEoEC0NBRt9Gtwhb
   w==;
X-CSE-ConnectionGUID: l2Xept7ySdCWbwvo9c0/yg==
X-CSE-MsgGUID: pqNPqwDsSFu5ejxQEfz5gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75444098"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="75444098"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:31:10 -0800
X-CSE-ConnectionGUID: hUT39WzhQCeTF+qbMN5Nvw==
X-CSE-MsgGUID: RDxgMTi/R4e/exjg32yh6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="191407992"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2025 00:31:06 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGCRS-000R8G-2X;
	Tue, 04 Nov 2025 08:31:02 +0000
Date: Tue, 4 Nov 2025 16:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 24/24]
 drivers/cma/mm/mem_phys_layout.c:275:7: error: use of undeclared identifier
 'MIGRATE_CMA'
Message-ID: <202511041632.c0XlIy1Z-lkp@intel.com>
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
config: arm-randconfig-003-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041632.c0XlIy1Z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041632.c0XlIy1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041632.c0XlIy1Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cma/mm/mem_phys_layout.c:189:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     189 |                 struct page *page = pfn_to_page(pfn);
         |                              ^
   drivers/cma/mm/mem_phys_layout.c:237:48: error: use of undeclared identifier 'MAX_PAGE_ORDER'
     237 |         pr_info("MAX_PAGE_ORDER                = %d", MAX_PAGE_ORDER);
         |                                                       ^~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:239:48: error: use of undeclared identifier 'PFN_SECTION_SHIFT'
     239 |         pr_info("PFN_SECTION_SHIFT             = %d", PFN_SECTION_SHIFT);
         |                                                       ^~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:240:49: error: use of undeclared identifier 'MAX_PAGE_ORDER'
     240 |         pr_info("(MAX_PAGE_ORDER + PAGE_SHIFT) = %d", (MAX_PAGE_ORDER + PAGE_SHIFT));
         |                                                        ^~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:241:48: error: use of undeclared identifier 'SECTION_SIZE_BITS'
     241 |         pr_info("SECTION_SIZE_BITS             = %d", SECTION_SIZE_BITS);
         |                                                       ^~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:242:54: error: use of undeclared identifier 'SECTION_SIZE_BITS'
     242 |         pr_info("2 ^ SECTION_SIZE_BITS         = %d", (1 << SECTION_SIZE_BITS));
         |                                                             ^~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:243:49: error: use of undeclared identifier 'SUBSECTION_SIZE'
     243 |         pr_info("SUBSECTION_SIZE               = %ld", SUBSECTION_SIZE);
         |                                                        ^~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:244:49: error: use of undeclared identifier 'SUBSECTIONS_PER_SECTION'
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
   drivers/cma/mm/mem_phys_layout.c:248:43: error: use of undeclared identifier 'PAGES_PER_SUBSECTION'
     248 |         pr_info("PAGES_PER_SUBSECTION    = %ld", PAGES_PER_SUBSECTION);
         |                                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:252:32: error: implicit declaration of function '__pfn_to_section' [-Werror,-Wimplicit-function-declaration]
     252 |         struct mem_section *section = __pfn_to_section(start_pfn);
         |                                       ^
   drivers/cma/mm/mem_phys_layout.c:252:22: error: incompatible integer to pointer conversion initializing 'struct mem_section *' with an expression of type 'int' [-Wint-conversion]
     252 |         struct mem_section *section = __pfn_to_section(start_pfn);
         |                             ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:253:22: error: implicit declaration of function '__section_mem_map_addr' [-Werror,-Wimplicit-function-declaration]
     253 |         struct page *page = __section_mem_map_addr(section);
         |                             ^
   drivers/cma/mm/mem_phys_layout.c:253:15: error: incompatible integer to pointer conversion initializing 'struct page *' with an expression of type 'int' [-Wint-conversion]
     253 |         struct page *page = __section_mem_map_addr(section);
         |                      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   4 warnings and 20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=m]


vim +/MIGRATE_CMA +275 drivers/cma/mm/mem_phys_layout.c

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
