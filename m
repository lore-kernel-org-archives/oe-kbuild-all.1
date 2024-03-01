Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5E25EE78
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 23:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709335735; cv=none; b=de0WrRvlzrkbPgAJWcQwSZPiJc+hjJHD9X3UzFbd9llas7/KldlFh2mfk4+AwOUFEVHgpb9xaPPuTRQqBJ7j+gv72cUNwId0I+mH71UwvrgTdppoFJlBFkWN5bagDkZG75yZtTNroWnVYIrxL6y+ocDme/U+Iuz9Xb/TcOih1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709335735; c=relaxed/simple;
	bh=SNBOUsmMzUVv4agv2b8ZLESVr2yzK0I1EBH+ikBqbys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swfi1+bm7sFCdpUGWPLg38CpIbUkELDxHHEVc4g/BeEc78UlR5A83G74VRlTJ8iHbrjwTEFl5vy68mLmpYZukoG2GzG+ol7prJzadauWpuL6XH+Lgcg+t4ZsyBCdevxvtbsAr4DlkbBloCNocCiTJ0VjQN6ITBaIZGOFfyDI3hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CEOWdzoI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEOWdzoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709335733; x=1740871733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SNBOUsmMzUVv4agv2b8ZLESVr2yzK0I1EBH+ikBqbys=;
  b=CEOWdzoIwXegXLHocMCTWdzprK8irSKWaEr4/4EJWuN1JRLjNaxKrJ7o
   11fpL/eY5bg3Qx+/xcQPvNRI2/2I9eApdQp/dNgHb42uKEaEDYhwlZ3jS
   FquijEOJl/oFTJgAcgRkCwds41zW7uOBw3rc1cmeHlcpW3SS+pMeGKkqQ
   NhFaUPQRjvFcCEv8M0lTUonpmqI6t53sZtnnjMMlz4ViEbhUoD+WFe7gp
   WZqOLbfjUEtz/v0noCkXYlG/yrCfsy796djhEePG6U8eCYzB2FYaq+R2D
   A0Jg+VUoc1U3/NO/XfmLnRZ9GAtnRIqfulbC/mTjfyRukzHxMGb1BksM8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="14601033"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="14601033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 15:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8241629"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2024 15:28:51 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgCJ1-000EAp-1T;
	Fri, 01 Mar 2024 23:28:45 +0000
Date: Sat, 2 Mar 2024 07:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Yuting <liyuting2071@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3400/3767]
 drivers/gpu/drm/phytium/phytium_pci.c:236:23: error: implicit declaration of
 function 'pci_enable_msi'; did you mean 'pci_enable_sriov'?
Message-ID: <202403020732.hTv9Hv4c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   236cb940335e3542c9d5ac16b5d8546a0cbbdfc1
commit: 792b82446538ed840a6e23b89673ce21564702bd [3400/3767] Fix gic support for Phytium S2500
config: arm64-randconfig-004-20240302 (https://download.01.org/0day-ci/archive/20240302/202403020732.hTv9Hv4c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020732.hTv9Hv4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020732.hTv9Hv4c-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
   drivers/gpu/drm/phytium/phytium_dp.c:506:6: warning: no previous prototype for 'phytium_dp_coding_8b10b_need_enable' [-Wmissing-prototypes]
     506 | bool phytium_dp_coding_8b10b_need_enable(unsigned char test_pattern)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:523:6: warning: no previous prototype for 'phytium_dp_scrambled_need_enable' [-Wmissing-prototypes]
     523 | bool phytium_dp_scrambled_need_enable(unsigned char test_pattern)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:656:6: warning: no previous prototype for 'phytium_dp_hw_enable_audio' [-Wmissing-prototypes]
     656 | void phytium_dp_hw_enable_audio(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:825:6: warning: no previous prototype for 'phytium_dp_hw_disable_video' [-Wmissing-prototypes]
     825 | void phytium_dp_hw_disable_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:836:6: warning: no previous prototype for 'phytium_dp_hw_video_is_enable' [-Wmissing-prototypes]
     836 | bool phytium_dp_hw_video_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:847:6: warning: no previous prototype for 'phytium_dp_hw_enable_video' [-Wmissing-prototypes]
     847 | void phytium_dp_hw_enable_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:859:6: warning: no previous prototype for 'phytium_dp_hw_config_video' [-Wmissing-prototypes]
     859 | void phytium_dp_hw_config_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:948:6: warning: no previous prototype for 'phytium_dp_hw_disable_output' [-Wmissing-prototypes]
     948 | void phytium_dp_hw_disable_output(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:960:6: warning: no previous prototype for 'phytium_dp_hw_enable_output' [-Wmissing-prototypes]
     960 | void phytium_dp_hw_enable_output(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:972:6: warning: no previous prototype for 'phytium_dp_hw_enable_input_source' [-Wmissing-prototypes]
     972 | void phytium_dp_hw_enable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:983:6: warning: no previous prototype for 'phytium_dp_hw_disable_input_source' [-Wmissing-prototypes]
     983 | void phytium_dp_hw_disable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:993:6: warning: no previous prototype for 'phytium_dp_hw_output_is_enable' [-Wmissing-prototypes]
     993 | bool phytium_dp_hw_output_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1030:6: warning: no previous prototype for 'phytium_dp_hw_hpd_irq_setup' [-Wmissing-prototypes]
    1030 | void phytium_dp_hw_hpd_irq_setup(struct phytium_dp_device *phytium_dp, bool enable)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1045:5: warning: no previous prototype for 'phytium_dp_hw_init' [-Wmissing-prototypes]
    1045 | int phytium_dp_hw_init(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1223:6: warning: no previous prototype for 'phytium_dp_dpcd_sink_dpms' [-Wmissing-prototypes]
    1223 | void phytium_dp_dpcd_sink_dpms(struct phytium_dp_device *phytium_dp, int mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1448:5: warning: no previous prototype for 'phytium_dp_get_link_train_fallback_values' [-Wmissing-prototypes]
    1448 | int phytium_dp_get_link_train_fallback_values(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1497:5: warning: no previous prototype for 'phytium_dp_start_link_train' [-Wmissing-prototypes]
    1497 | int phytium_dp_start_link_train(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1802:6: warning: no previous prototype for 'phytium_dp_hpd_poll_handler' [-Wmissing-prototypes]
    1802 | void phytium_dp_hpd_poll_handler(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1949:6: warning: no previous prototype for 'phytium_dp_fast_link_train' [-Wmissing-prototypes]
    1949 | bool phytium_dp_fast_link_train(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2140:6: warning: no previous prototype for 'phytium_dp_adjust_link_train_parameter' [-Wmissing-prototypes]
    2140 | void phytium_dp_adjust_link_train_parameter(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2200:1: warning: no previous prototype for 'phytium_encoder_mode_valid' [-Wmissing-prototypes]
    2200 | phytium_encoder_mode_valid(struct drm_encoder *encoder, const struct drm_display_mode *mode)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:2256:6: warning: no previous prototype for 'phytium_dp_encoder_destroy' [-Wmissing-prototypes]
    2256 | void phytium_dp_encoder_destroy(struct drm_encoder *encoder)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2469:5: warning: no previous prototype for 'phytium_get_encoder_crtc_mask' [-Wmissing-prototypes]
    2469 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/gpu/drm/phytium/phytium_pci.c:236:23: error: implicit declaration of function 'pci_enable_msi'; did you mean 'pci_enable_sriov'? [-Werror=implicit-function-declaration]
     236 |                 ret = pci_enable_msi(pdev);
         |                       ^~~~~~~~~~~~~~
         |                       pci_enable_sriov
>> drivers/gpu/drm/phytium/phytium_pci.c:271:17: error: implicit declaration of function 'pci_disable_msi'; did you mean 'pci_disable_sriov'? [-Werror=implicit-function-declaration]
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
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/phytium/phytium_gem.c:22:5: warning: no previous prototype for 'phytium_memory_pool_alloc' [-Wmissing-prototypes]
      22 | int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:37:6: warning: no previous prototype for 'phytium_memory_pool_free' [-Wmissing-prototypes]
      37 | void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_gem.c:160:5: warning: no previous prototype for 'phytium_gem_prime_vmap' [-Wmissing-prototypes]
     160 | int phytium_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_gem.c:169:6: warning: no previous prototype for 'phytium_gem_prime_vunmap' [-Wmissing-prototypes]
     169 | void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:181:5: warning: no previous prototype for 'phytium_dma_transfer' [-Wmissing-prototypes]
     181 | int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +236 drivers/gpu/drm/phytium/phytium_pci.c

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
b80df10f845813 lishuo 2024-01-31  280  static void phytium_pci_remove(struct pci_dev *pdev)
b80df10f845813 lishuo 2024-01-31  281  {
b80df10f845813 lishuo 2024-01-31  282  	struct drm_device *dev = pci_get_drvdata(pdev);
b80df10f845813 lishuo 2024-01-31  283  	struct phytium_display_private *priv = dev->dev_private;
b80df10f845813 lishuo 2024-01-31  284  
b80df10f845813 lishuo 2024-01-31  285  	phytium_dp_hpd_irq_setup(dev, false);
b80df10f845813 lishuo 2024-01-31  286  	cancel_work_sync(&priv->hotplug_work);
b80df10f845813 lishuo 2024-01-31  287  	drm_dev_unregister(dev);
b80df10f845813 lishuo 2024-01-31  288  	phytium_pci_vram_fini(pdev, priv);
b80df10f845813 lishuo 2024-01-31  289  	phytium_pci_private_fini(pdev, priv);
b80df10f845813 lishuo 2024-01-31  290  	if (pdev->msi_enabled)
b80df10f845813 lishuo 2024-01-31  291  		pci_disable_msi(pdev);
b80df10f845813 lishuo 2024-01-31  292  	pci_disable_device(pdev);
b80df10f845813 lishuo 2024-01-31  293  	pci_set_drvdata(pdev, NULL);
b80df10f845813 lishuo 2024-01-31  294  	drm_dev_put(dev);
b80df10f845813 lishuo 2024-01-31  295  }
b80df10f845813 lishuo 2024-01-31  296  
b80df10f845813 lishuo 2024-01-31  297  static void phytium_pci_shutdown(struct pci_dev *pdev)
b80df10f845813 lishuo 2024-01-31  298  {
b80df10f845813 lishuo 2024-01-31  299  	struct drm_device *dev = pci_get_drvdata(pdev);
b80df10f845813 lishuo 2024-01-31  300  	struct phytium_display_private *priv = dev->dev_private;
b80df10f845813 lishuo 2024-01-31  301  
b80df10f845813 lishuo 2024-01-31  302  	priv->display_shutdown(dev);
b80df10f845813 lishuo 2024-01-31  303  }
b80df10f845813 lishuo 2024-01-31  304  
b80df10f845813 lishuo 2024-01-31 @305  static int phytium_pci_pm_suspend(struct device *dev)
b80df10f845813 lishuo 2024-01-31  306  {
b80df10f845813 lishuo 2024-01-31  307  	struct pci_dev *pdev = to_pci_dev(dev);
b80df10f845813 lishuo 2024-01-31  308  	struct drm_device *drm_dev = pci_get_drvdata(pdev);
b80df10f845813 lishuo 2024-01-31  309  	struct phytium_display_private *priv = drm_dev->dev_private;
b80df10f845813 lishuo 2024-01-31  310  	int ret = 0;
b80df10f845813 lishuo 2024-01-31  311  
b80df10f845813 lishuo 2024-01-31  312  	if (IS_PX210(priv))
b80df10f845813 lishuo 2024-01-31  313  		phytium_pci_dma_init(priv);
b80df10f845813 lishuo 2024-01-31  314  
b80df10f845813 lishuo 2024-01-31  315  	ret = priv->display_pm_suspend(drm_dev);
b80df10f845813 lishuo 2024-01-31  316  	if (ret < 0)
b80df10f845813 lishuo 2024-01-31  317  		goto out;
b80df10f845813 lishuo 2024-01-31  318  
b80df10f845813 lishuo 2024-01-31  319  	pci_save_state(pdev);
b80df10f845813 lishuo 2024-01-31  320  	pci_disable_device(pdev);
b80df10f845813 lishuo 2024-01-31  321  	pci_set_power_state(pdev, PCI_D3hot);
b80df10f845813 lishuo 2024-01-31  322  	udelay(200);
b80df10f845813 lishuo 2024-01-31  323  
b80df10f845813 lishuo 2024-01-31  324  out:
b80df10f845813 lishuo 2024-01-31  325  	return ret;
b80df10f845813 lishuo 2024-01-31  326  }
b80df10f845813 lishuo 2024-01-31  327  
b80df10f845813 lishuo 2024-01-31 @328  static int phytium_pci_pm_resume(struct device *dev)
b80df10f845813 lishuo 2024-01-31  329  {
b80df10f845813 lishuo 2024-01-31  330  	struct pci_dev *pdev = to_pci_dev(dev);
b80df10f845813 lishuo 2024-01-31  331  	struct drm_device *drm_dev = pci_get_drvdata(pdev);
b80df10f845813 lishuo 2024-01-31  332  	struct phytium_display_private *priv = drm_dev->dev_private;
b80df10f845813 lishuo 2024-01-31  333  	int ret = 0;
b80df10f845813 lishuo 2024-01-31  334  
b80df10f845813 lishuo 2024-01-31  335  	pci_set_power_state(pdev, PCI_D0);
b80df10f845813 lishuo 2024-01-31  336  	pci_restore_state(pdev);
b80df10f845813 lishuo 2024-01-31  337  	ret = pci_enable_device(pdev);
b80df10f845813 lishuo 2024-01-31  338  	if (ret)
b80df10f845813 lishuo 2024-01-31  339  		return ret;
b80df10f845813 lishuo 2024-01-31  340  	pci_set_master(pdev);
b80df10f845813 lishuo 2024-01-31  341  
b80df10f845813 lishuo 2024-01-31  342  	ret = priv->display_pm_resume(drm_dev);
b80df10f845813 lishuo 2024-01-31  343  	if (IS_PX210(priv))
b80df10f845813 lishuo 2024-01-31  344  		phytium_pci_dma_fini(priv);
b80df10f845813 lishuo 2024-01-31  345  
b80df10f845813 lishuo 2024-01-31  346  	return ret;
b80df10f845813 lishuo 2024-01-31  347  }
b80df10f845813 lishuo 2024-01-31  348  

:::::: The code at line 236 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
