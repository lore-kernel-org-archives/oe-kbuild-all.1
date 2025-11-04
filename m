Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15C02C11C6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 06:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762238110; cv=none; b=MwHLNMu+LXZhs6+wLlAvdnNcRsILPq3nlP6bMmD1TnoSV/AU8rpVrBTLo9kRAKqduMZdt9EDOJukaBYGTeFmOfg88OdsDNhiDoMQP+4EeG5H8GzNrIc0gruKHmMlgEZFN76FbMitibkMtEXMtfl7Fddg7ji+SmKdQIs5lIPD6CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762238110; c=relaxed/simple;
	bh=KRf9KuvglChu9h4Gm+38JX21JU+T8onk5GP8MdN5r+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6wMrSS89pJuzebaZpYqN601xuP6sJ9LgPIqd+7PU0YcI3D1JEkGggyZ6dIscYbSlMujt3TWBDeocPjV5/ZbN7WGMEM0nRerryZscm9L5bKTNVhFG6aAoQWofIAVguuezWK9pLUg7QIij9f0rD4ArNZkzmVOnpX+e21iGicw01k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dF4WfgB6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dF4WfgB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762238108; x=1793774108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KRf9KuvglChu9h4Gm+38JX21JU+T8onk5GP8MdN5r+c=;
  b=dF4WfgB63ur9f6eXgly0/I1SwFeTKcm1H+kEXMMkiLd+hfeINAublYYk
   4PUIfEEKjazzPA7hyaHsPKw00s/jb6PSObiwwGYFXCZQF2FhLfka88kRb
   36g+2eX/AVqMkkiv9ssdTe5qm3j51u2GDhWaOK7oIlB7zJMPdNP7Anuat
   EIzjVa38IPXPt+old9aOUZX3FGdVguhvxQL/vqb+RwwOp4vn8FtCzvvqo
   6yaKeoeDbNoA2vjyTLTZSMe9J0UzeZUXvozsWxvJ/Wsh2ieJiDfFg3va8
   24qG/9lvEK71MZAborU077wpkadrFdcE34yAxuM9+jOX3UqiW7lZpdeET
   g==;
X-CSE-ConnectionGUID: uJOj+KqiQDSlAUCxCap3kg==
X-CSE-MsgGUID: Kg0jqsDWRNyZFNi/pJXg0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="67980122"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="67980122"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:35:04 -0800
X-CSE-ConnectionGUID: lHns11qqQAK3154BmZAMiw==
X-CSE-MsgGUID: +zMoVvxmQs+ohl68RUdiHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186365555"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Nov 2025 22:35:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGAd7-000R0S-1a;
	Tue, 04 Nov 2025 06:34:58 +0000
Date: Tue, 4 Nov 2025 14:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 24/24]
 drivers/cma/mm/mem_phys_layout.c:292:7: warning: GCC does not allow variable
 declarations in for loop initializers before C99
Message-ID: <202511041444.3dCxWk2u-lkp@intel.com>
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
config: arm-randconfig-003-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041444.3dCxWk2u-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041444.3dCxWk2u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041444.3dCxWk2u-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/cma/mm/mem_phys_layout.c:275:7: error: use of undeclared identifier 'MIGRATE_CMA'
     275 |         case MIGRATE_CMA:
         |              ^~~~~~~~~~~
   drivers/cma/mm/mem_phys_layout.c:277:7: error: use of undeclared identifier 'MIGRATE_ISOLATE'; did you mean 'MIGRATE_MOVABLE'?
     277 |         case MIGRATE_ISOLATE:
         |              ^~~~~~~~~~~~~~~
         |              MIGRATE_MOVABLE
   include/linux/mmzone.h:48:2: note: 'MIGRATE_MOVABLE' declared here
      48 |         MIGRATE_MOVABLE,
         |         ^
   drivers/cma/mm/mem_phys_layout.c:277:7: error: duplicate case value 'MIGRATE_MOVABLE'
     277 |         case MIGRATE_ISOLATE:
         |              ^
   drivers/cma/mm/mem_phys_layout.c:268:7: note: previous case defined here
     268 |         case MIGRATE_MOVABLE:
         |              ^
>> drivers/cma/mm/mem_phys_layout.c:292:7: warning: GCC does not allow variable declarations in for loop initializers before C99 [-Wgcc-compat]
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


vim +292 drivers/cma/mm/mem_phys_layout.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
