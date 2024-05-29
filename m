Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0002181CFD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 17:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717005060; cv=none; b=l4mBelaBZhQq62P4/vg+UaRGI+qx2Py9KUWRDoYIW0n35tpxTJlEsfpP081K2/H2ilW1iCR1xq07B/s+hQEGN3jrUf4j/aDldKZJyr9L9yq6w83Rj3mTPFHmw2R01KbY3rwujmBYopuiPc1DwwIbhIT0cXjVKWxBxgyFt6GJG/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717005060; c=relaxed/simple;
	bh=6Aqtcfj0ZMNuIiD79O4Ym7KAJTGN5Xc5pGx7bvf5by0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ahxMehRWhHqwvRbrWuIVy3OEoer6bHoA6dnpZ8qeDXue9WiNn5MV+lFRuheZVLGRh+dGFy2YuajagxB1OuH1zr4cQvInHMfrhM2GO5Ueklu4YkQa6CGdUdZ1KADo3gxVkSdbfvSF/RbxQ5z9DDAGHjVmZ5zeLTdn782voAlTAXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNlCKhon; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNlCKhon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717005059; x=1748541059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Aqtcfj0ZMNuIiD79O4Ym7KAJTGN5Xc5pGx7bvf5by0=;
  b=kNlCKhonk2b1tcApfEnfo106hvi7NlE3kj4frxRT5eIKeVqlX15JAAMg
   tFJz0NUDhKqzDnxaOc2+oZ3cuVtj+sJaFKq7WMCDq+nEaroY6S3DGnS2J
   d1trXripp4+GJuCDSpnBa8avpNqy+tQ3M9gnVPy6+OhKTJGAdcCctrTbx
   TADKdD2PgboL/QalUfUKlObCMqsA1pLWZj2hkqrlmm+5ocnuuWdlhy2g5
   bhzwdtrR/mRcni2iQ+41dWjU41NBfOc2Q4TEmXR9jtLq1SMMA1cj3/y2N
   1N/PAEYYmXTQrPeDg+vBUfmxGYW1e2Y5BEFEi50hni9jxyR4IWw+tiI7B
   A==;
X-CSE-ConnectionGUID: ngiPge58QyODQDEqZ9CDWA==
X-CSE-MsgGUID: ajP0zs3iTjCB7p3s72uyfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13548527"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13548527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 10:50:58 -0700
X-CSE-ConnectionGUID: RhuVwr0yQPukxJTOwFF9HA==
X-CSE-MsgGUID: V1AOF95WT0moxq03D3izHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40039033"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 May 2024 10:50:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCNRu-000E2B-1U;
	Wed, 29 May 2024 17:50:54 +0000
Date: Thu, 30 May 2024 01:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Yuting <liyuting2071@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3405/9792]
 drivers/gpu/drm/phytium/phytium_pci.c:236:9: error: call to undeclared
 function 'pci_enable_msi'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202405300112.F3n9I6tZ-lkp@intel.com>
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
head:   c0b6b4438dc70167c4c16f6436499cde257f782a
commit: 792b82446538ed840a6e23b89673ce21564702bd [3405/9792] Fix gic support for Phytium S2500
config: arm64-randconfig-004-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300112.F3n9I6tZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300112.F3n9I6tZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300112.F3n9I6tZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/phytium/phytium_pci.c:7:
   In file included from include/linux/pci.h:2106:
   In file included from arch/arm64/include/asm/pci.h:7:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   6 warnings and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/pci_enable_msi +236 drivers/gpu/drm/phytium/phytium_pci.c

b80df10f845813 lishuo 2024-01-31  136  
b80df10f845813 lishuo 2024-01-31 @137  void phytium_pci_dma_fini(struct phytium_display_private *priv)
b80df10f845813 lishuo 2024-01-31  138  {
b80df10f845813 lishuo 2024-01-31  139  	if (priv->dma_inited)
b80df10f845813 lishuo 2024-01-31  140  		dma_release_channel(priv->dma_chan);
b80df10f845813 lishuo 2024-01-31  141  	priv->dma_inited = 0;
b80df10f845813 lishuo 2024-01-31  142  	priv->dma_chan =  NULL;
b80df10f845813 lishuo 2024-01-31  143  }
b80df10f845813 lishuo 2024-01-31  144  
b80df10f845813 lishuo 2024-01-31  145  static struct phytium_display_private*
b80df10f845813 lishuo 2024-01-31  146  phytium_pci_private_init(struct pci_dev *pdev, const struct pci_device_id *ent)
b80df10f845813 lishuo 2024-01-31  147  {
b80df10f845813 lishuo 2024-01-31  148  	struct drm_device *dev = pci_get_drvdata(pdev);
b80df10f845813 lishuo 2024-01-31  149  	struct phytium_display_private *priv = NULL;
b80df10f845813 lishuo 2024-01-31  150  	struct phytium_pci_private *pci_priv = NULL;
b80df10f845813 lishuo 2024-01-31  151  	struct phytium_device_info *phytium_info = (struct phytium_device_info *)ent->driver_data;
b80df10f845813 lishuo 2024-01-31  152  	int i = 0;
b80df10f845813 lishuo 2024-01-31  153  	resource_size_t io_addr, io_size;
b80df10f845813 lishuo 2024-01-31  154  
b80df10f845813 lishuo 2024-01-31  155  	pci_priv = devm_kzalloc(&pdev->dev, sizeof(*pci_priv), GFP_KERNEL);
b80df10f845813 lishuo 2024-01-31  156  	if (!pci_priv) {
b80df10f845813 lishuo 2024-01-31  157  		DRM_ERROR("no memory to allocate for drm_display_private\n");
b80df10f845813 lishuo 2024-01-31  158  		goto failed_malloc_priv;
b80df10f845813 lishuo 2024-01-31  159  	}
b80df10f845813 lishuo 2024-01-31  160  
b80df10f845813 lishuo 2024-01-31  161  	memset(pci_priv, 0, sizeof(*pci_priv));
b80df10f845813 lishuo 2024-01-31  162  	priv = &pci_priv->base;
b80df10f845813 lishuo 2024-01-31  163  	phytium_display_private_init(priv, dev);
b80df10f845813 lishuo 2024-01-31  164  
b80df10f845813 lishuo 2024-01-31  165  	memcpy(&(priv->info), phytium_info, sizeof(struct phytium_device_info));
b80df10f845813 lishuo 2024-01-31  166  	DRM_DEBUG_KMS("priv->info.num_pipes :%d\n", priv->info.num_pipes);
b80df10f845813 lishuo 2024-01-31  167  	priv->info.pipe_mask = ((pdev->subsystem_device >> PIPE_MASK_SHIFT) & PIPE_MASK_MASK);
b80df10f845813 lishuo 2024-01-31  168  	priv->info.edp_mask = ((pdev->subsystem_device >> EDP_MASK_SHIFT) & EDP_MASK_MASK);
b80df10f845813 lishuo 2024-01-31  169  	priv->info.num_pipes = 0;
b80df10f845813 lishuo 2024-01-31  170  	for_each_pipe_masked(priv, i)
b80df10f845813 lishuo 2024-01-31  171  		priv->info.num_pipes++;
b80df10f845813 lishuo 2024-01-31  172  	if (priv->info.num_pipes == 0) {
b80df10f845813 lishuo 2024-01-31  173  		DRM_ERROR("num_pipes is zero, so exit init\n");
b80df10f845813 lishuo 2024-01-31  174  		goto failed_init_numpipe;
b80df10f845813 lishuo 2024-01-31  175  	}
b80df10f845813 lishuo 2024-01-31  176  
b80df10f845813 lishuo 2024-01-31  177  	io_addr = pci_resource_start(pdev, 0);
b80df10f845813 lishuo 2024-01-31  178  	io_size = pci_resource_len(pdev, 0);
b80df10f845813 lishuo 2024-01-31  179  	priv->regs = ioremap(io_addr, io_size);
b80df10f845813 lishuo 2024-01-31  180  	if (priv->regs == NULL) {
b80df10f845813 lishuo 2024-01-31  181  		DRM_ERROR("pci bar0 ioremap fail, addr:0x%llx, size:0x%llx\n", io_addr, io_size);
b80df10f845813 lishuo 2024-01-31  182  		goto failed_ioremap;
b80df10f845813 lishuo 2024-01-31  183  	}
b80df10f845813 lishuo 2024-01-31  184  
b80df10f845813 lishuo 2024-01-31  185  	priv->irq = pdev->irq;
b80df10f845813 lishuo 2024-01-31  186  	if (IS_PX210(priv)) {
b80df10f845813 lishuo 2024-01-31  187  		pci_priv->dc_hw_vram_init = px210_dc_hw_vram_init;
b80df10f845813 lishuo 2024-01-31  188  		priv->dc_hw_clear_msi_irq = px210_dc_hw_clear_msi_irq;
b80df10f845813 lishuo 2024-01-31  189  		priv->dc_hw_fb_format_check = px210_dc_hw_fb_format_check;
b80df10f845813 lishuo 2024-01-31  190  	} else if (IS_PE220X(priv)) {
b80df10f845813 lishuo 2024-01-31  191  		pci_priv->dc_hw_vram_init = pe220x_dc_hw_vram_init;
b80df10f845813 lishuo 2024-01-31  192  		priv->dc_hw_clear_msi_irq = NULL;
b80df10f845813 lishuo 2024-01-31  193  		priv->dc_hw_fb_format_check = pe220x_dc_hw_fb_format_check;
b80df10f845813 lishuo 2024-01-31  194  	}
b80df10f845813 lishuo 2024-01-31  195  
b80df10f845813 lishuo 2024-01-31  196  	return priv;
b80df10f845813 lishuo 2024-01-31  197  
b80df10f845813 lishuo 2024-01-31  198  failed_ioremap:
b80df10f845813 lishuo 2024-01-31  199  failed_init_numpipe:
b80df10f845813 lishuo 2024-01-31  200  	devm_kfree(&pdev->dev, pci_priv);
b80df10f845813 lishuo 2024-01-31  201  failed_malloc_priv:
b80df10f845813 lishuo 2024-01-31  202  	return NULL;
b80df10f845813 lishuo 2024-01-31  203  }
b80df10f845813 lishuo 2024-01-31  204  
b80df10f845813 lishuo 2024-01-31  205  static void
b80df10f845813 lishuo 2024-01-31  206  phytium_pci_private_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
b80df10f845813 lishuo 2024-01-31  207  {
b80df10f845813 lishuo 2024-01-31  208  	struct phytium_pci_private *pci_priv = to_pci_priv(priv);
b80df10f845813 lishuo 2024-01-31  209  
b80df10f845813 lishuo 2024-01-31  210  	if (priv->regs)
b80df10f845813 lishuo 2024-01-31  211  		iounmap(priv->regs);
b80df10f845813 lishuo 2024-01-31  212  
b80df10f845813 lishuo 2024-01-31  213  	devm_kfree(&pdev->dev, pci_priv);
b80df10f845813 lishuo 2024-01-31  214  }
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
