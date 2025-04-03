Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4652907
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 01:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743642890; cv=none; b=b8KodYQbnopqisoNe6J2DYx+nrt9IApoGqsQgd7dxAf8cuK4Ix+gLgRSCIFanY/SkXErryCFRyBcHS6DiTYCZQpgsele/fDTk0BRv3Y24xF+CM5kfpr98feZoIUbOdvKBO7g/V0FInA2HoSLlhoh0v5OMa6h2G90SKutyzpsaAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743642890; c=relaxed/simple;
	bh=RpRxriTg+WO/bYIJSGqr2pG8/5DItCiKD5iyzYQYGwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNga2qHl8KW70kOfcnqlovTB/kxEHYCBh4G2hoPQcbcK3Vgyvf2R4jegaKoEOTl6ZpwnEvqB405EI7+08R1PbMBrl2tn5BnASzSiOhLIU9gxM6N6sgt3mLiTskC5lVXUQ7HULaoboyVFwaWmJdivPJ6Cxc92NpQy1MJL1TmyHk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtKCXe3j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtKCXe3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743642888; x=1775178888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RpRxriTg+WO/bYIJSGqr2pG8/5DItCiKD5iyzYQYGwc=;
  b=LtKCXe3joJXkq9SZqD1btlnFG3MWzgbt2gyOKfZlSu3CgFptEBgXlOhT
   cjxs11OyewFlHdJXD8tRisb34DvYrB1kkLDAUOxiSm9crH3YgVZ4awBiN
   t/RDfcDxBhx/ZO0Vj0gvAsNZc7fnq0dCn1tyYVP6b+s2HC/QjY+trvxxu
   Lo0OLWagTNmL+VbwqLna+2vzzPwH/HU1Fjx2d71j3ybwTUiWpncLGv0iV
   fzem5E2ZYFV7YheMQlCyPJ+Q8Jo9m+5cedEj6vWUmTxBnpFCOMFkLjYos
   JR2KBrPrQYCjM/4oCJ2/UZrpjUwKaXOx7YTWqC/WG998Gl9apvN2lisUB
   Q==;
X-CSE-ConnectionGUID: fc3FMxcfTPqpPAFjnzMS8A==
X-CSE-MsgGUID: K6VprgXIQtiMduEZ8aFnJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44944924"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="44944924"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:14:47 -0700
X-CSE-ConnectionGUID: LGyvfFMjQUOMP5imLRFAPQ==
X-CSE-MsgGUID: t66YpmkfRROLvzClHOnErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="131718717"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Apr 2025 18:14:46 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u09AE-000B94-0r;
	Thu, 03 Apr 2025 01:14:39 +0000
Date: Thu, 3 Apr 2025 09:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 17/17]
 drivers/cma_test/cma_alloc_test_drv.c:122:8: warning: GCC does not allow
 variable declarations in for loop initializers before C99
Message-ID: <202504030921.pEzLz5mq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   f344ab3d86fe50dc56c87b7a96c07b8210635ec5
commit: 43b8bd1b3be373d3fd2e20886db6cb08d4081ad5 [17/17] ANDROID: cma: Allocate CMA memory at probing time
config: arm-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504030921.pEzLz5mq-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030921.pEzLz5mq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030921.pEzLz5mq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cma_test/cma_alloc_test_drv.c:104:24: error: no member named 'cma_area' in 'struct device'
     104 |         if (ret || !pdev->dev.cma_area) {
         |                     ~~~~~~~~~ ^
   drivers/cma_test/cma_alloc_test_drv.c:117:22: error: no member named 'cma_area' in 'struct device'
     117 |         cma_ptr = pdev->dev.cma_area;
         |                   ~~~~~~~~~ ^
>> drivers/cma_test/cma_alloc_test_drv.c:122:8: warning: GCC does not allow variable declarations in for loop initializers before C99 [-Wgcc-compat]
     122 |                 for (int i = 0; i < nr_pages; i++) {
         |                      ^
   drivers/cma_test/cma_alloc_test_drv.c:167:12: error: incompatible function pointer types initializing 'int (*)(struct platform_device *)' with an expression of type 'void (struct platform_device *)' [-Wincompatible-function-pointer-types]
     167 |         .remove = cma_test_remove,
         |                   ^~~~~~~~~~~~~~~
   1 warning and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
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
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +122 drivers/cma_test/cma_alloc_test_drv.c

    88	
    89	static int cma_test_probe(struct platform_device *pdev)
    90	{
    91		int ret;
    92		const struct of_device_id *of_id;
    93	
    94		pr_info("Probing device");
    95	
    96		buffer = NULL;
    97		of_id = of_match_device(cma_test_dt_ids, &pdev->dev);
    98		if (!of_id) {
    99			pr_info("The node was not found in DTB");
   100			return -ENODEV;
   101		}
   102	
   103		ret = of_reserved_mem_device_init(&pdev->dev);
 > 104		if (ret || !pdev->dev.cma_area) {
   105			dev_err(&pdev->dev,
   106				"The CMA reserved area is not assigned (ret %d)\n",
   107				ret);
   108			return -EINVAL;
   109		}
   110	
   111		ret = devm_add_action(&pdev->dev, rmem_remove_callback, &pdev->dev);
   112		if (ret) {
   113			of_reserved_mem_device_release(&pdev->dev);
   114			return ret;
   115		}
   116	
   117		cma_ptr = pdev->dev.cma_area;
   118		pages = cma_alloc(cma_ptr, nr_pages, get_order(PAGE_SIZE), false);
   119		if (pages) {
   120			pr_info("CMA allocation of %d pages was successful", nr_pages);
   121			buffer = kmap_local_page(pages);
 > 122			for (int i = 0; i < nr_pages; i++) {
   123				// Write one byte of every page.
   124				buffer[i * PAGE_SIZE] = 'A';
   125			}
   126	
   127		}
   128	
   129		return 0;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
