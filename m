Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CACE610B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 00:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743639188; cv=none; b=H7XdRGICIoZVkyUvsDulAdu/L63z7s+bj8+MZy+YCSyTkbUbU1BmLnWwGxDEtjHUMwvOeDnscuEADUOoxBp20adK3yJS3JSOU6DBYaIJ1xTo63NALkG5cmZ0Aoy4HrSqYYJ9JNFLdfxEsXUOPTyQj27rawBTTct9pUuv3oZjKP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743639188; c=relaxed/simple;
	bh=vGpWq7EjgfAHpuJsZtQ5vfD4ZxQJBCO93sSz4EMQUZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SCzHPfz6oSUySkby09vXDNU0/ZQA08PMYS4AUbyHjoa3rHRFjP9r0GJaVmu7wU4QA+foLgc9eUjpjWTfPmmhU5PnZf494mLwGMxShvI2U0qcWU11ipLzZKe0k9OX3inINUGLoOTGfQwOJrzl8wdU2K4rDbB298Bj4zT28URybe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4OIssu6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4OIssu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743639183; x=1775175183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vGpWq7EjgfAHpuJsZtQ5vfD4ZxQJBCO93sSz4EMQUZ0=;
  b=R4OIssu6U0gVeCCH1oACcWA6wkcpWmuk7sDeq1b+3WNVKDU2yXeKHqJq
   IhcFxOrAkEeASq/+XZbHLTSllH/MF3BLzXB2Kvs3klVf4GvqNdh6F9iak
   QlaMyw+gyG7D/t53/go5TDaWfxDC7eKXyX5Waq/pHM1UU5zQzuAPxysWM
   FQbrh2YNPBuDjLprhr9XCkM6QUY7G4V48OPlhDq9x0ghI3RJLZ6VtQiBS
   NO0r/ObYuf6HIcnD+vLfGyLApVij/ZjcxJerc83IA+195Uz3XdmtDSSn3
   wJfJatDAkEajUydTlt/4hKQTCkg1DwcJEzT0+FpjJa+tZ3POJ/oBMg5hV
   Q==;
X-CSE-ConnectionGUID: mGFyIPyERcieO+VsSjvf8w==
X-CSE-MsgGUID: 6NrmjljITPuYEItSvUWWIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56394354"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="56394354"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 17:13:03 -0700
X-CSE-ConnectionGUID: hPWT7FdnTZyQSaRJ+f5izw==
X-CSE-MsgGUID: lsSqM0G6TGq/t0bvj5gHEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="126613706"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Apr 2025 17:13:01 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u08CU-000B7C-1Z;
	Thu, 03 Apr 2025 00:12:55 +0000
Date: Thu, 3 Apr 2025 08:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 17/17]
 drivers/cma_test/cma_alloc_test_drv.c:93:24: error: no member named
 'cma_area' in 'struct device'
Message-ID: <202504030806.vva3HEtW-lkp@intel.com>
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
commit: f13d84382b42c33d4a27e09136721a997da6b225 [17/17] ANDROID: cma: Init the CMA reserved memory during probing
config: arm-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504030806.vva3HEtW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030806.vva3HEtW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030806.vva3HEtW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cma_test/cma_alloc_test_drv.c:93:24: error: no member named 'cma_area' in 'struct device'
      93 |         if (ret || !pdev->dev.cma_area) {
         |                     ~~~~~~~~~ ^
   drivers/cma_test/cma_alloc_test_drv.c:140:12: error: incompatible function pointer types initializing 'int (*)(struct platform_device *)' with an expression of type 'void (struct platform_device *)' [-Wincompatible-function-pointer-types]
     140 |         .remove = cma_test_remove,
         |                   ^~~~~~~~~~~~~~~
   2 errors generated.

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


vim +93 drivers/cma_test/cma_alloc_test_drv.c

    78	
    79	static int cma_test_probe(struct platform_device *pdev)
    80	{
    81		int ret;
    82		const struct of_device_id *of_id;
    83	
    84		pr_info("Probing device");
    85	
    86		of_id = of_match_device(cma_test_dt_ids, &pdev->dev);
    87		if (!of_id) {
    88			pr_info("The node was not found in DTB");
    89			return -ENODEV;
    90		}
    91	
    92		ret = of_reserved_mem_device_init(&pdev->dev);
  > 93		if (ret || !pdev->dev.cma_area) {
    94			dev_err(&pdev->dev,
    95				"The CMA reserved area is not assigned (ret %d)\n",
    96				ret);
    97			return -EINVAL;
    98		}
    99	
   100		ret = devm_add_action(&pdev->dev, rmem_remove_callback, &pdev->dev);
   101		if (ret) {
   102			of_reserved_mem_device_release(&pdev->dev);
   103			return ret;
   104		}
   105	
   106		return 0;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
