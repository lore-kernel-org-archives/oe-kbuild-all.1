Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1AF16F0EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 18:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731523813; cv=none; b=AHAaTDFnjhpNyBWu8gsgfFxAbS1HV6SmycgTdjWVK4EIcLRSP8lCp7m9/0cv/e8IW/D0/SsSsxSBbzIBVctJYYXn5yBpJKH9KeQI0EUwwthVqm0bY3aFxDSvy2hn1IUCGuGQizpHHUzGi5lCb7J1PQ3VOQ5AtXVO6/uYs5Vzj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731523813; c=relaxed/simple;
	bh=c9Vineuroz5cBCScxeM4PdHHKqjVfs4C0VvZP5hUYyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCmpGby0loLMNc1hqoL9UfgH43j2rHDsb6LLEKK2VcvHae1RRpOShSl+btErKRCbKpaXWbzcyRIlS3N0wmY3hxMNIzWKpK5XVoAZ77Oz1xgcZG0FsYuJoTJwLIN2y/Nxgju4gIGlWNEYXlM7pOnC76lelAYZJoATjls35WhFfJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+kNJUUf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+kNJUUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731523812; x=1763059812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9Vineuroz5cBCScxeM4PdHHKqjVfs4C0VvZP5hUYyw=;
  b=S+kNJUUfxH3U2Gw9CRb+XYAbBPC9GFp0a5L3TqcLvjDYB1JkGQuehECY
   XWzHnt6/66VBp3McpDZX7UVjfYibh3hc6xNNfy7gXFb3pX2Zf9gjVYNSv
   ymPZBV/neGBPdr9CndJRS6UBTXpFV001egyneht/ocRC9y/ge08UW2A3o
   +4rtOEGyIyz0R8U9RgToPMxUAAfH/rVE2XGj4LqW3aqNgj4YTJDGQytW0
   +MmAk0Lu064sr2yyU5BxEZRavlcubSD2bYGBO+Lpb3dczYfskE/uhCAip
   JezDCYStILYgD/MP8gGJj77vghhepROjItFazncmCJG8usCxYJp7rh3LG
   w==;
X-CSE-ConnectionGUID: XgfQ+QFcS2qrLYv/jOaq0A==
X-CSE-MsgGUID: QitIm2F5S9GtuvoGjTCTLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35225758"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="35225758"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 10:50:11 -0800
X-CSE-ConnectionGUID: zZR54mRBRN6lb37k2WDWuQ==
X-CSE-MsgGUID: ch1SO5lhTTWfg2oWch2l/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="87849787"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Nov 2024 10:50:10 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBIRL-0000dH-1P;
	Wed, 13 Nov 2024 18:50:07 +0000
Date: Thu, 14 Nov 2024 02:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Yuting <liyuting2071@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1466/1466]
 drivers/gpu/drm/phytium/phytium_platform.c:253:12: warning:
 'phytium_platform_pm_resume' defined but not used
Message-ID: <202411140250.sY9gSIIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   19640fb08a2ccfb131121859517dfdbc6a04ccb6
commit: 792b82446538ed840a6e23b89673ce21564702bd [1466/1466] Fix gic support for Phytium S2500
config: arm64-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140250.sY9gSIIA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140250.sY9gSIIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140250.sY9gSIIA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/phytium/phytium_platform.c:19:5: warning: no previous prototype for 'phytium_platform_carveout_mem_init' [-Wmissing-prototypes]
      19 | int phytium_platform_carveout_mem_init(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_platform.c:60:6: warning: no previous prototype for 'phytium_platform_carveout_mem_fini' [-Wmissing-prototypes]
      60 | void phytium_platform_carveout_mem_fini(struct platform_device *pdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_platform.c:253:12: warning: 'phytium_platform_pm_resume' defined but not used [-Wunused-function]
     253 | static int phytium_platform_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_platform.c:245:12: warning: 'phytium_platform_pm_suspend' defined but not used [-Wunused-function]
     245 | static int phytium_platform_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/phytium_pci.c:23:6: warning: no previous prototype for 'phytium_pci_vram_hw_init' [-Wmissing-prototypes]
      23 | void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:30:5: warning: no previous prototype for 'phytium_pci_vram_init' [-Wmissing-prototypes]
      30 | int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:68:6: warning: no previous prototype for 'phytium_pci_vram_fini' [-Wmissing-prototypes]
      68 | void phytium_pci_vram_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:89:5: warning: no previous prototype for 'phytium_pci_dma_init' [-Wmissing-prototypes]
      89 | int phytium_pci_dma_init(struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:137:6: warning: no previous prototype for 'phytium_pci_dma_fini' [-Wmissing-prototypes]
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c: In function 'phytium_pci_probe':
   drivers/gpu/drm/phytium/phytium_pci.c:236:23: error: implicit declaration of function 'pci_enable_msi'; did you mean 'pci_enable_sriov'? [-Wimplicit-function-declaration]
     236 |                 ret = pci_enable_msi(pdev);
         |                       ^~~~~~~~~~~~~~
         |                       pci_enable_sriov
   drivers/gpu/drm/phytium/phytium_pci.c:271:17: error: implicit declaration of function 'pci_disable_msi'; did you mean 'pci_disable_sriov'? [-Wimplicit-function-declaration]
     271 |                 pci_disable_msi(pdev);
         |                 ^~~~~~~~~~~~~~~
         |                 pci_disable_sriov
   drivers/gpu/drm/phytium/phytium_pci.c: At top level:
>> drivers/gpu/drm/phytium/phytium_pci.c:328:12: warning: 'phytium_pci_pm_resume' defined but not used [-Wunused-function]
     328 | static int phytium_pci_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_pci.c:305:12: warning: 'phytium_pci_pm_suspend' defined but not used [-Wunused-function]
     305 | static int phytium_pci_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/phytium_platform_pm_resume +253 drivers/gpu/drm/phytium/phytium_platform.c

b80df10f845813 lishuo 2024-01-31  244  
b80df10f845813 lishuo 2024-01-31 @245  static int phytium_platform_pm_suspend(struct device *dev)
b80df10f845813 lishuo 2024-01-31  246  {
b80df10f845813 lishuo 2024-01-31  247  	struct drm_device *drm_dev = dev_get_drvdata(dev);
b80df10f845813 lishuo 2024-01-31  248  	struct phytium_display_private *priv = drm_dev->dev_private;
b80df10f845813 lishuo 2024-01-31  249  
b80df10f845813 lishuo 2024-01-31  250  	return priv->display_pm_suspend(drm_dev);
b80df10f845813 lishuo 2024-01-31  251  }
b80df10f845813 lishuo 2024-01-31  252  
b80df10f845813 lishuo 2024-01-31 @253  static int phytium_platform_pm_resume(struct device *dev)
b80df10f845813 lishuo 2024-01-31  254  {
b80df10f845813 lishuo 2024-01-31  255  	struct drm_device *drm_dev = dev_get_drvdata(dev);
b80df10f845813 lishuo 2024-01-31  256  	struct phytium_display_private *priv = drm_dev->dev_private;
b80df10f845813 lishuo 2024-01-31  257  
b80df10f845813 lishuo 2024-01-31  258  	return priv->display_pm_resume(drm_dev);
b80df10f845813 lishuo 2024-01-31  259  }
b80df10f845813 lishuo 2024-01-31  260  

:::::: The code at line 253 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
