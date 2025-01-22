Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1702714F115
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 19:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737572464; cv=none; b=Aufv2esP/TO9+lbP713GxFSqGT3TzPQGH/u2qEWKQE9CWvt370WaQvxV3qKcy2uiiI4t3UQa03nDiT1ipOoPIspzm9YojGd2lExyP/1OklbIMAKR/4kPZaw3QuJwT5GTUnFxpj9NAFdydWE9J7Hcjz5Cx4yo8JW+QhJ37EJ8x9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737572464; c=relaxed/simple;
	bh=DJ9HMEfk2iuHLQaSu7R9VTkmRpW+IfZvow7umYq5TO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qp/cEuR/0kUb68D9E7RJyM1wKX7iAZX3qcOge1B+upilpnX1k1GYyZ/DWFAIo+ooJ8e+EvPSOG0bOI+zA3NRP0Vba5Ig0dAUEYuIV9TYv4Q6TtOHRSPJiOaOE7hHFDeI941/0/wGpt28MYaXax/T6wSeXEKRSagW2Dt7kCFRQ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpuyo0OM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpuyo0OM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737572461; x=1769108461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJ9HMEfk2iuHLQaSu7R9VTkmRpW+IfZvow7umYq5TO8=;
  b=hpuyo0OMBY0ItGEx21HZS6Elgi2xA3glH3j/hryoAXHP5g6R/KDPGREI
   fZn2fw2+5a6ok7FdltvvXzziRPK6oA6pLlPpCAzkjWggtxuJwh7cWho5q
   5WhBYxUldbh7gPnyRniBw3v35f5Y+YcnweE3HYJ4yZ4WUmExYbEGhgJ6B
   KfDDXUlt0wm1cYghtNadCss36+cAFdB+GLCTtzVLEg1LwntfH8OjDyfDT
   SrGDyz4PocXPNB8ZwhICIZ+JU0yPviCg5UztNBae4cZG+AAUScq79jjha
   LvtOFUAV334Ou58yJKHzhiOBeT2o49yZ9120MYY7teJ7r3rqvGbxoC689
   w==;
X-CSE-ConnectionGUID: 40miHIqqRo2Ix6U5zO/o/w==
X-CSE-MsgGUID: URIn3DKDTtqwo3aNyCimtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="55462889"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="55462889"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 11:00:59 -0800
X-CSE-ConnectionGUID: CKvZ40dESFaCTT9CMVUtyA==
X-CSE-MsgGUID: xu7hFfgkQ2+cK8QdRWSoBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="107328284"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jan 2025 11:00:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tafy4-000aFX-05;
	Wed, 22 Jan 2025 19:00:48 +0000
Date: Thu, 23 Jan 2025 03:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1839/1839]
 drivers/gpu/drm/phytium/phytium_pci.c:236:9: error: call to undeclared
 function 'pci_enable_msi'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202501230201.ng7IvX9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd78f9c5f86e6865625e2d4640e63616a82fbd6c
commit: 792b82446538ed840a6e23b89673ce21564702bd [1839/1839] Fix gic support for Phytium S2500
config: arm64-randconfig-003-20250123 (https://download.01.org/0day-ci/archive/20250123/202501230201.ng7IvX9g-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230201.ng7IvX9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230201.ng7IvX9g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/phytium/phytium_pci.c:7:
   In file included from include/linux/pci.h:2106:
   In file included from arch/arm64/include/asm/pci.h:7:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:23:6: warning: no previous prototype for function 'phytium_pci_vram_hw_init' [-Wmissing-prototypes]
      23 | void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
         |      ^
   drivers/gpu/drm/phytium/phytium_pci.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      23 | void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_pci.c:30:5: warning: no previous prototype for function 'phytium_pci_vram_init' [-Wmissing-prototypes]
      30 | int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
         |     ^
   drivers/gpu/drm/phytium/phytium_pci.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_pci.c:68:6: warning: no previous prototype for function 'phytium_pci_vram_fini' [-Wmissing-prototypes]
      68 | void phytium_pci_vram_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
         |      ^
   drivers/gpu/drm/phytium/phytium_pci.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | void phytium_pci_vram_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_pci.c:89:5: warning: no previous prototype for function 'phytium_pci_dma_init' [-Wmissing-prototypes]
      89 | int phytium_pci_dma_init(struct phytium_display_private *priv)
         |     ^
   drivers/gpu/drm/phytium/phytium_pci.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      89 | int phytium_pci_dma_init(struct phytium_display_private *priv)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_pci.c:137:6: warning: no previous prototype for function 'phytium_pci_dma_fini' [-Wmissing-prototypes]
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         |      ^
   drivers/gpu/drm/phytium/phytium_pci.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_pci.c:236:9: error: call to undeclared function 'pci_enable_msi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     236 |                 ret = pci_enable_msi(pdev);
         |                       ^
>> drivers/gpu/drm/phytium/phytium_pci.c:271:3: error: call to undeclared function 'pci_disable_msi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     271 |                 pci_disable_msi(pdev);
         |                 ^
   drivers/gpu/drm/phytium/phytium_pci.c:271:3: note: did you mean 'pci_disable_sriov'?
   include/linux/pci.h:2437:20: note: 'pci_disable_sriov' declared here
    2437 | static inline void pci_disable_sriov(struct pci_dev *dev) { }
         |                    ^
   drivers/gpu/drm/phytium/phytium_pci.c:291:3: error: call to undeclared function 'pci_disable_msi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     291 |                 pci_disable_msi(pdev);
         |                 ^
   10 warnings and 3 errors generated.


vim +/pci_enable_msi +236 drivers/gpu/drm/phytium/phytium_pci.c

b80df10f845813 lishuo 2024-01-31  215  
b80df10f845813 lishuo 2024-01-31  216  static int phytium_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
b80df10f845813 lishuo 2024-01-31  217  {
b80df10f845813 lishuo 2024-01-31  218  	struct phytium_display_private *priv = NULL;
b80df10f845813 lishuo 2024-01-31  219  	struct drm_device *dev = NULL;
b80df10f845813 lishuo 2024-01-31  220  	int ret = 0;
b80df10f845813 lishuo 2024-01-31  221  
b80df10f845813 lishuo 2024-01-31  222  	dev = drm_dev_alloc(&phytium_display_drm_driver, &pdev->dev);
b80df10f845813 lishuo 2024-01-31  223  	if (IS_ERR(dev)) {
b80df10f845813 lishuo 2024-01-31  224  		DRM_ERROR("failed to allocate drm_device\n");
b80df10f845813 lishuo 2024-01-31  225  		return PTR_ERR(dev);
b80df10f845813 lishuo 2024-01-31  226  	}
b80df10f845813 lishuo 2024-01-31  227  	pci_set_drvdata(pdev, dev);
b80df10f845813 lishuo 2024-01-31  228  	pci_set_master(pdev);
b80df10f845813 lishuo 2024-01-31  229  	ret = pci_enable_device(pdev);
b80df10f845813 lishuo 2024-01-31  230  	if (ret) {
b80df10f845813 lishuo 2024-01-31  231  		DRM_ERROR("pci enable device fail\n");
b80df10f845813 lishuo 2024-01-31  232  		goto failed_enable_device;
b80df10f845813 lishuo 2024-01-31  233  	}
b80df10f845813 lishuo 2024-01-31  234  
b80df10f845813 lishuo 2024-01-31  235  	if (dc_msi_enable) {
b80df10f845813 lishuo 2024-01-31 @236  		ret = pci_enable_msi(pdev);
b80df10f845813 lishuo 2024-01-31  237  		if (ret)
b80df10f845813 lishuo 2024-01-31  238  			DRM_ERROR("pci enable msi fail\n");
b80df10f845813 lishuo 2024-01-31  239  	}
b80df10f845813 lishuo 2024-01-31  240  
b80df10f845813 lishuo 2024-01-31  241  	dma_set_mask(&pdev->dev, DMA_BIT_MASK(40));
b80df10f845813 lishuo 2024-01-31  242  
b80df10f845813 lishuo 2024-01-31  243  	priv = phytium_pci_private_init(pdev, ent);
b80df10f845813 lishuo 2024-01-31  244  	if (priv)
b80df10f845813 lishuo 2024-01-31  245  		dev->dev_private = priv;
b80df10f845813 lishuo 2024-01-31  246  	else
b80df10f845813 lishuo 2024-01-31  247  		goto failed_pci_private_init;
b80df10f845813 lishuo 2024-01-31  248  
b80df10f845813 lishuo 2024-01-31  249  	ret = phytium_pci_vram_init(pdev, priv);
b80df10f845813 lishuo 2024-01-31  250  	if (ret) {
b80df10f845813 lishuo 2024-01-31  251  		DRM_ERROR("failed to init pci vram\n");
b80df10f845813 lishuo 2024-01-31  252  		goto failed_pci_vram_init;
b80df10f845813 lishuo 2024-01-31  253  	}
b80df10f845813 lishuo 2024-01-31  254  
b80df10f845813 lishuo 2024-01-31  255  	ret = drm_dev_register(dev, 0);
b80df10f845813 lishuo 2024-01-31  256  	if (ret) {
b80df10f845813 lishuo 2024-01-31  257  		DRM_ERROR("failed to register drm dev\n");
b80df10f845813 lishuo 2024-01-31  258  		goto failed_register_drm;
b80df10f845813 lishuo 2024-01-31  259  	}
b80df10f845813 lishuo 2024-01-31  260  
b80df10f845813 lishuo 2024-01-31  261  	phytium_dp_hpd_irq_setup(dev, true);
b80df10f845813 lishuo 2024-01-31  262  
b80df10f845813 lishuo 2024-01-31  263  	return 0;
b80df10f845813 lishuo 2024-01-31  264  
b80df10f845813 lishuo 2024-01-31  265  failed_register_drm:
b80df10f845813 lishuo 2024-01-31  266  	phytium_pci_vram_fini(pdev, priv);
b80df10f845813 lishuo 2024-01-31  267  failed_pci_vram_init:
b80df10f845813 lishuo 2024-01-31  268  	phytium_pci_private_fini(pdev, priv);
b80df10f845813 lishuo 2024-01-31  269  failed_pci_private_init:
b80df10f845813 lishuo 2024-01-31  270  	if (pdev->msi_enabled)
b80df10f845813 lishuo 2024-01-31 @271  		pci_disable_msi(pdev);
b80df10f845813 lishuo 2024-01-31  272  	pci_disable_device(pdev);
b80df10f845813 lishuo 2024-01-31  273  failed_enable_device:
b80df10f845813 lishuo 2024-01-31  274  	pci_set_drvdata(pdev, NULL);
b80df10f845813 lishuo 2024-01-31  275  	drm_dev_put(dev);
b80df10f845813 lishuo 2024-01-31  276  
b80df10f845813 lishuo 2024-01-31  277  	return -1;
b80df10f845813 lishuo 2024-01-31  278  }
b80df10f845813 lishuo 2024-01-31  279  

:::::: The code at line 236 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
