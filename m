Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B991415E5CA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 23:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732751936; cv=none; b=M4q+/dAHinwl0Cb5RQIXP4Ga6deXsJX2vC0Pzs8WAIKOg2WMz39qVVJkj7LEawlrsdTYmdV2xRwi9mhUxZv2RAcXX8sdbH6wYkIvHRfGqOHAtW0zknmY8RV3zAMHrca7WJ4PeMLa7stbrdBgt5HUU4rLsTJlwV/PjtyoE20EKTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732751936; c=relaxed/simple;
	bh=xlpoPUeqdpmYXlcNp3QTXZE1sFmz4sGd+XrxSEum1lM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X7GAnQ/oOWGwpkzKECcz9cbTdUmyhhF5qYZleAKfIRuN9mgcY+yE86jLw2EXEZAMkp3bV8WUlvZU8wOWPs424Hp2/pUsDYaHbplkvjVHmE46SxzWVxE9VMwnDZfewc+2okR7Q+nh/v3s3w27mwj2w32xDZpqeYckYOK8qFe7BPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgeQPho1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgeQPho1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732751934; x=1764287934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xlpoPUeqdpmYXlcNp3QTXZE1sFmz4sGd+XrxSEum1lM=;
  b=EgeQPho1brUadGhJ6XjlaNosEJ7xjKNQbH3JgCd3P+esEfb0scxTKZC+
   JV31/mwkgnMlWISTBJqPWKRfUCJaMRdg0K8TWFSKsTeITFy2VMatd3s9Y
   vSfytyvj9adNLpChgbFXiupDz3BkVoq2Fxr3dBZSLSvbrkuwSR0ADXkbR
   J00w0WQ7B5u6zbH+fK2nvFna6wFOaphFI0b+Ng2LWVvm7jmkq6TZq2RC2
   oQp5+5TQMjKPPw28ZKTH5xYf+a2Q0H+9WtnAiWH5G6IOz38ajsnMk+0rh
   VNreuGpCQ5o5/sKX+BgNz2CtZTK8knR7xZBou+4YD1yTp6vtJAd+YMyl8
   Q==;
X-CSE-ConnectionGUID: 7dGB/DBzT/iojgvmkWGmFw==
X-CSE-MsgGUID: FvL1b0LQT4Cfqr4egXSEpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33218520"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="33218520"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 15:58:53 -0800
X-CSE-ConnectionGUID: uH4wEifDSHWVvd9mXCiaAQ==
X-CSE-MsgGUID: O4UHCkWvQmCFRbJECw1fXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92171111"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Nov 2024 15:58:52 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGRvl-0008SU-0k;
	Wed, 27 Nov 2024 23:58:49 +0000
Date: Thu, 28 Nov 2024 07:57:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Yuting <liyuting2071@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540]
 drivers/gpu/drm/phytium/phytium_pci.c:328:12: warning:
 'phytium_pci_pm_resume' defined but not used
Message-ID: <202411280733.QY1sbhoZ-lkp@intel.com>
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
head:   4a0359af8c9d84ec3320a8a18f41c7fddf1f7a23
commit: 792b82446538ed840a6e23b89673ce21564702bd [1540/1540] Fix gic support for Phytium S2500
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411280733.QY1sbhoZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280733.QY1sbhoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280733.QY1sbhoZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> drivers/gpu/drm/phytium/phytium_pci.c:328:12: warning: 'phytium_pci_pm_resume' defined but not used [-Wunused-function]
     328 | static int phytium_pci_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_pci.c:305:12: warning: 'phytium_pci_pm_suspend' defined but not used [-Wunused-function]
     305 | static int phytium_pci_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/pe220x_dp.c:471:6: warning: no previous prototype for 'pe220x_dp_hw_spread_is_enable' [-Wmissing-prototypes]
     471 | bool pe220x_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dp.c:476:5: warning: no previous prototype for 'pe220x_dp_hw_reset' [-Wmissing-prototypes]
     476 | int pe220x_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dp.c:491:9: warning: no previous prototype for 'pe220x_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     491 | uint8_t pe220x_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
--
>> drivers/gpu/drm/phytium/px210_dc.c:69:6: warning: no previous prototype for 'px210_dc_hw_vram_init' [-Wmissing-prototypes]
      69 | void px210_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:101:6: warning: no previous prototype for 'px210_dc_hw_clear_msi_irq' [-Wmissing-prototypes]
     101 | void px210_dc_hw_clear_msi_irq(struct phytium_display_private *priv, uint32_t phys_pipe)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:106:6: warning: no previous prototype for 'px210_dc_hw_config_pix_clock' [-Wmissing-prototypes]
     106 | void px210_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:124:6: warning: no previous prototype for 'px210_dc_hw_disable' [-Wmissing-prototypes]
     124 | void px210_dc_hw_disable(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:172:5: warning: no previous prototype for 'px210_dc_hw_fb_format_check' [-Wmissing-prototypes]
     172 | int px210_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:242:6: warning: no previous prototype for 'px210_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     242 | void px210_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:251:6: warning: no previous prototype for 'px210_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     251 | void px210_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:260:6: warning: no previous prototype for 'px210_dc_hw_update_dcreq' [-Wmissing-prototypes]
     260 | void px210_dc_hw_update_dcreq(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:317:6: warning: no previous prototype for 'px210_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     317 | void px210_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
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
>> drivers/gpu/drm/phytium/px210_dp.c:852:6: warning: no previous prototype for 'px210_dp_hw_spread_is_enable' [-Wmissing-prototypes]
     852 | bool px210_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dp.c:864:5: warning: no previous prototype for 'px210_dp_hw_reset' [-Wmissing-prototypes]
     864 | int px210_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dp.c:897:9: warning: no previous prototype for 'px210_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     897 | uint8_t px210_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/gpu/drm/phytium/phytium_dp.c:2200:1: warning: no previous prototype for 'phytium_encoder_mode_valid' [-Wmissing-prototypes]
    2200 | phytium_encoder_mode_valid(struct drm_encoder *encoder, const struct drm_display_mode *mode)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:2256:6: warning: no previous prototype for 'phytium_dp_encoder_destroy' [-Wmissing-prototypes]
    2256 | void phytium_dp_encoder_destroy(struct drm_encoder *encoder)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2469:5: warning: no previous prototype for 'phytium_get_encoder_crtc_mask' [-Wmissing-prototypes]
    2469 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/pe220x_dc.c:73:6: warning: no previous prototype for 'pe220x_dc_hw_vram_init' [-Wmissing-prototypes]
      73 | void pe220x_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:87:6: warning: no previous prototype for 'pe220x_dc_hw_config_pix_clock' [-Wmissing-prototypes]
      87 | void pe220x_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:104:6: warning: no previous prototype for 'pe220x_dc_hw_reset' [-Wmissing-prototypes]
     104 | void pe220x_dc_hw_reset(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:198:5: warning: no previous prototype for 'pe220x_dc_hw_fb_format_check' [-Wmissing-prototypes]
     198 | int pe220x_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:210:6: warning: no previous prototype for 'pe220x_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     210 | void pe220x_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:219:6: warning: no previous prototype for 'pe220x_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     219 | void pe220x_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:228:6: warning: no previous prototype for 'pe220x_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     228 | void pe220x_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:245:6: warning: no previous prototype for 'pe220x_dc_hw_update_cursor_hi_addr' [-Wmissing-prototypes]
     245 | void pe220x_dc_hw_update_cursor_hi_addr(struct drm_plane *plane, uint64_t iova)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/phytium_pci_pm_resume +328 drivers/gpu/drm/phytium/phytium_pci.c

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

:::::: The code at line 328 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
