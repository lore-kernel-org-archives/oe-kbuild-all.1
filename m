Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3429170A13
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 21:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743629256; cv=none; b=J8nFulpqzXNNUVWfdMIFtgJZYaFDJBBdRbMmJ7MPxZ81GMggOhkcYU/U7z5SWQ8jIo/oP+gIg/13Wt+pWUG1lqEruJJ8d3NjiJcJoaGoJTY/1jYCcvUcw36GbvjuNPCkmJSvtDoqlhHwqtYWOyZAiE9ZsBGnWQDh59rnlikssCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743629256; c=relaxed/simple;
	bh=0QbUWhxduTpQ5Mz5PYdM2BDwqnrVQ0hNVn012N13Ra8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xi5omQE83J01bPUsIdp1miQbtA9KOs2vRuWx2Sqk1um8uEy8TrnQNTeMTzjdUzjAmBULuTkPBnksuy7/sctDvOB7R4CR85eUB37zxE17RJsXQFR3PjZVHAIDzULwfa1LQNJCe/d/833WtXbyfrmapK2v7VUytdIoxv+oXyBQajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYiYf0Mf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYiYf0Mf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743629254; x=1775165254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QbUWhxduTpQ5Mz5PYdM2BDwqnrVQ0hNVn012N13Ra8=;
  b=BYiYf0MfliJ3YWH7uMix4FUD3zERSCk8eJkj3bkl0c9Xu6q40nKp2tHI
   Bh9ZpP2NbpslhlYfyVh1iHOT3qXepsI4pDu0D1+VzDvpNaIp/nmSZnCok
   IvlKaYYeyKVGdPZm1MrbFITJ+kT5Zbh4f6NAwXcAeoBGNz9NRkJNdwUiS
   TB18F3SMszlSdwGCcx2XLT/5/rLXFUJ3oQmzzVMVB/HSb5IguJv7hKQ3g
   wPy2S2QYDTG5dJYrIemoqOwCWhwegSWdFApcX3Umwyvbcpcy7LpjpFGdc
   LVaqybG4eHaSDsR7KBXWPL1DDgI2lMp7zrOM4dYztxeTaoDARv7fmUPFe
   A==;
X-CSE-ConnectionGUID: cmWofFW3TViD1OTFCqPE5Q==
X-CSE-MsgGUID: gMiOhDEFThiSMnrbsmvOFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55681591"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="55681591"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 14:27:33 -0700
X-CSE-ConnectionGUID: 6DmHcGNQRDCxJ3HQk5EQbg==
X-CSE-MsgGUID: y3IS+XKbTnmzw7xgcqz/3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="127669159"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2025 14:27:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u05cQ-000B2A-18;
	Wed, 02 Apr 2025 21:27:30 +0000
Date: Thu, 3 Apr 2025 05:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 17/17]
 drivers/cma_test/cma_alloc_test_drv.c:75:12: error: incompatible function
 pointer types initializing 'int (*)(struct platform_device *)' with an
 expression of type 'void (struct platform_device *)'
Message-ID: <202504030514.6neJhbTL-lkp@intel.com>
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
commit: 15432ccf862045408c00db1c2d0ee04fdc415ac6 [17/17] ANDROID: cma: Skeleton for CMA alloc test driver
config: arm-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504030514.6neJhbTL-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030514.6neJhbTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030514.6neJhbTL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cma_test/cma_alloc_test_drv.c:75:12: error: incompatible function pointer types initializing 'int (*)(struct platform_device *)' with an expression of type 'void (struct platform_device *)' [-Wincompatible-function-pointer-types]
      75 |         .remove = cma_test_remove,
         |                   ^~~~~~~~~~~~~~~
   1 error generated.

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


vim +75 drivers/cma_test/cma_alloc_test_drv.c

    67	
    68	static struct platform_driver cma_test_driver = {
    69		.driver = {
    70			.name = "cma_alloc_test",
    71			.owner = THIS_MODULE,
    72			.of_match_table = of_match_ptr(cma_test_dt_ids),
    73		},
    74		.probe = cma_test_probe,
  > 75		.remove = cma_test_remove,
    76		.suspend = cma_test_suspend,
    77		.shutdown = cma_test_shutdown,
    78		.resume = cma_test_resume,
    79		.id_table = cma_test_id_table,
    80	};
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
