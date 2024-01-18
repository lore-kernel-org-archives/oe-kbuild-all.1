Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229E02E41C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 19:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705605635; cv=none; b=sBC0BIQp5ek9hT2jPpa6JxrsE2iQ0ar+i7s6udYDBDwJKbt0nqYsoUkXWyiJpXCGrFj1rNw1ZppouhVlwJaK48wm5rHM3deL1X9z2eX7wCJNAedVpp6+gxKYNDBKDqCbF4ozxnzlvUMeN5YNN4U8mYjaasy6QXo8QW79Osf5HOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705605635; c=relaxed/simple;
	bh=fBRNgWsD5xzLoe5pnunCmiB7la1uTDpvhfZPNhlrh+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qj+afP/FzhwYku7HAmDirFShzNHmv2XZ8g/mm3o35hTrVZTtdE/eygUhpJ2YsLCY40POqmwxEjn7NcGTw8DHFqIxsWITZ+0TWd/S0p4AYtssnEIfbaCwkbuIcMnblq4ARkpfjAer2VyhSZZ+bpcqnRad7y2VB1H1FEwMwdgLQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMojPvn6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMojPvn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705605632; x=1737141632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBRNgWsD5xzLoe5pnunCmiB7la1uTDpvhfZPNhlrh+c=;
  b=PMojPvn6XMeWNbn6QWbn6lFuscjttlK6mwJsv2SogrfeCkxykaYRDaMe
   pZYNFcytV3EXfsUbpIMB2ix/IVkhq3ZaJ3OgZ0hSAxTZEqSQTOPO2wSOr
   QLA732/GLZdaoBzrUSBkwFLe8FoVDex/fQmHAic/4WpE7k9P4nNaoRaUv
   UakSJwY4CKmMNsXBKaQ/ZtiFjbq/QRIACyX1DzOqlg6a0eGf8CRdG2gUG
   TfiU+nyj/SPYxUv1f+csmFiGi3XANPiAgGvdEDoxqvpKqoKL8zFZVua1h
   YealMB4w/tXA550rWcsnw2ut+Ihp2WhSo2Wu0HMTwDxsyFG7C9MRLFpRV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13904419"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="13904419"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 11:20:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818865240"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="818865240"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Jan 2024 11:20:28 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQXwA-0003GI-18;
	Thu, 18 Jan 2024 19:20:26 +0000
Date: Fri, 19 Jan 2024 03:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21254/21559]
 drivers/gpu/drm/phytium/phytium_pci.c:23:6: warning: no previous prototype
 for 'phytium_pci_vram_hw_init'
Message-ID: <202401190336.094mkGRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8135318753544d6f8afa1f01a47c81fbccb59e39
commit: cad0702e5286d3cc80afe545de027858b855dd5a [21254/21559] DRM: Phytium display DRM driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240119/202401190336.094mkGRK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190336.094mkGRK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190336.094mkGRK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/phytium/phytium_pci.c:23:6: warning: no previous prototype for 'phytium_pci_vram_hw_init' [-Wmissing-prototypes]
      23 | void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_pci.c:30:5: warning: no previous prototype for 'phytium_pci_vram_init' [-Wmissing-prototypes]
      30 | int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_pci.c:68:6: warning: no previous prototype for 'phytium_pci_vram_fini' [-Wmissing-prototypes]
      68 | void phytium_pci_vram_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_pci.c:89:5: warning: no previous prototype for 'phytium_pci_dma_init' [-Wmissing-prototypes]
      89 | int phytium_pci_dma_init(struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c: In function 'phytium_pci_dma_init':
   drivers/gpu/drm/phytium/phytium_pci.c:99:34: error: 'PCI_VENDOR_ID_PHYTIUM' undeclared (first use in this function); did you mean 'PCI_VENDOR_ID_PHILIPS'?
      99 |         gpu_dev = pci_get_device(PCI_VENDOR_ID_PHYTIUM, 0xdc20, NULL);
         |                                  ^~~~~~~~~~~~~~~~~~~~~
         |                                  PCI_VENDOR_ID_PHILIPS
   drivers/gpu/drm/phytium/phytium_pci.c:99:34: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/phytium/phytium_pci.c: At top level:
>> drivers/gpu/drm/phytium/phytium_pci.c:137:6: warning: no previous prototype for 'phytium_pci_dma_fini' [-Wmissing-prototypes]
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/phytium/phytium_pci.c:7:
   include/linux/pci.h:888:19: error: 'PCI_VENDOR_ID_PHYTIUM' undeclared here (not in a function); did you mean 'PCI_VENDOR_ID_PHILIPS'?
     888 |         .vendor = PCI_VENDOR_ID_##vend, .device = (dev), \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:375:11: note: in expansion of macro 'PCI_VDEVICE'
     375 |         { PCI_VDEVICE(PHYTIUM, 0xdc22), (kernel_ulong_t)&x100_info },
         |           ^~~~~~~~~~~
--
   drivers/gpu/drm/phytium/phytium_display_drv.c: In function 'phytium_irq_preinstall':
>> drivers/gpu/drm/phytium/phytium_display_drv.c:89:16: warning: variable 'status' set but not used [-Wunused-but-set-variable]
      89 |         int i, status;
         |                ^~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c: In function 'phytium_irq_uninstall':
   drivers/gpu/drm/phytium/phytium_display_drv.c:100:16: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     100 |         int i, status;
         |                ^~~~~~
--
>> drivers/gpu/drm/phytium/phytium_plane.c:25:6: warning: no previous prototype for 'phytium_plane_destroy' [-Wmissing-prototypes]
      25 | void phytium_plane_destroy(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_plane.c:67:1: warning: no previous prototype for 'phytium_plane_atomic_set_property' [-Wmissing-prototypes]
      67 | phytium_plane_atomic_set_property(struct drm_plane *plane,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_plane.c:77:1: warning: no previous prototype for 'phytium_plane_atomic_duplicate_state' [-Wmissing-prototypes]
      77 | phytium_plane_atomic_duplicate_state(struct drm_plane *plane)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_plane.c:98:1: warning: no previous prototype for 'phytium_plane_atomic_destroy_state' [-Wmissing-prototypes]
      98 | phytium_plane_atomic_destroy_state(struct drm_plane *plane, struct drm_plane_state *state)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_plane.c: In function 'phytium_dc_primary_plane_update':
>> drivers/gpu/drm/phytium/phytium_plane.c:372:35: warning: variable 'crtc_y' set but not used [-Wunused-but-set-variable]
     372 |         int src_x, src_y, crtc_x, crtc_y, crtc_w, crtc_h;
         |                                   ^~~~~~
>> drivers/gpu/drm/phytium/phytium_plane.c:372:27: warning: variable 'crtc_x' set but not used [-Wunused-but-set-variable]
     372 |         int src_x, src_y, crtc_x, crtc_y, crtc_w, crtc_h;
         |                           ^~~~~~
--
>> drivers/gpu/drm/phytium/phytium_crtc.c:104:1: warning: no previous prototype for 'phytium_crtc_atomic_duplicate_state' [-Wmissing-prototypes]
     104 | phytium_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_crtc.c:119:1: warning: no previous prototype for 'phytium_crtc_atomic_destroy_state' [-Wmissing-prototypes]
     119 | phytium_crtc_atomic_destroy_state(struct drm_crtc *crtc,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_crtc.c: In function 'phytium_crtc_atomic_flush':
>> drivers/gpu/drm/phytium/phytium_crtc.c:303:36: warning: variable 'phytium_crtc_state' set but not used [-Wunused-but-set-variable]
     303 |         struct phytium_crtc_state *phytium_crtc_state = NULL;
         |                                    ^~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/phytium_dp.c:542:6: warning: no previous prototype for 'phytium_dp_coding_8b10b_need_enable' [-Wmissing-prototypes]
     542 | bool phytium_dp_coding_8b10b_need_enable(unsigned char test_pattern)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:559:6: warning: no previous prototype for 'phytium_dp_scrambled_need_enable' [-Wmissing-prototypes]
     559 | bool phytium_dp_scrambled_need_enable(unsigned char test_pattern)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:692:6: warning: no previous prototype for 'phytium_dp_hw_enable_audio' [-Wmissing-prototypes]
     692 | void phytium_dp_hw_enable_audio(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:861:6: warning: no previous prototype for 'phytium_dp_hw_disable_video' [-Wmissing-prototypes]
     861 | void phytium_dp_hw_disable_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:872:6: warning: no previous prototype for 'phytium_dp_hw_video_is_enable' [-Wmissing-prototypes]
     872 | bool phytium_dp_hw_video_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:883:6: warning: no previous prototype for 'phytium_dp_hw_enable_video' [-Wmissing-prototypes]
     883 | void phytium_dp_hw_enable_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:895:6: warning: no previous prototype for 'phytium_dp_hw_config_video' [-Wmissing-prototypes]
     895 | void phytium_dp_hw_config_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:984:6: warning: no previous prototype for 'phytium_dp_hw_disable_output' [-Wmissing-prototypes]
     984 | void phytium_dp_hw_disable_output(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:996:6: warning: no previous prototype for 'phytium_dp_hw_enable_output' [-Wmissing-prototypes]
     996 | void phytium_dp_hw_enable_output(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1008:6: warning: no previous prototype for 'phytium_dp_hw_enable_input_source' [-Wmissing-prototypes]
    1008 | void phytium_dp_hw_enable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1019:6: warning: no previous prototype for 'phytium_dp_hw_disable_input_source' [-Wmissing-prototypes]
    1019 | void phytium_dp_hw_disable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1029:6: warning: no previous prototype for 'phytium_dp_hw_output_is_enable' [-Wmissing-prototypes]
    1029 | bool phytium_dp_hw_output_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1066:6: warning: no previous prototype for 'phytium_dp_hw_hpd_irq_setup' [-Wmissing-prototypes]
    1066 | void phytium_dp_hw_hpd_irq_setup(struct phytium_dp_device *phytium_dp, bool enable)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1081:5: warning: no previous prototype for 'phytium_dp_hw_init' [-Wmissing-prototypes]
    1081 | int phytium_dp_hw_init(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1260:6: warning: no previous prototype for 'phytium_dp_dpcd_sink_dpms' [-Wmissing-prototypes]
    1260 | void phytium_dp_dpcd_sink_dpms(struct phytium_dp_device *phytium_dp, int mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1486:5: warning: no previous prototype for 'phytium_dp_get_link_train_fallback_values' [-Wmissing-prototypes]
    1486 | int phytium_dp_get_link_train_fallback_values(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1535:5: warning: no previous prototype for 'phytium_dp_start_link_train' [-Wmissing-prototypes]
    1535 | int phytium_dp_start_link_train(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1840:6: warning: no previous prototype for 'phytium_dp_hpd_poll_handler' [-Wmissing-prototypes]
    1840 | void phytium_dp_hpd_poll_handler(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1987:6: warning: no previous prototype for 'phytium_dp_fast_link_train' [-Wmissing-prototypes]
    1987 | bool phytium_dp_fast_link_train(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:2178:6: warning: no previous prototype for 'phytium_dp_adjust_link_train_parameter' [-Wmissing-prototypes]
    2178 | void phytium_dp_adjust_link_train_parameter(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2438:5: warning: no previous prototype for 'phytium_get_encoder_crtc_mask' [-Wmissing-prototypes]
    2438 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/phytium_fb.c: In function 'phytium_fb_create':
>> drivers/gpu/drm/phytium/phytium_fb.c:81:22: warning: variable 'hsub' set but not used [-Wunused-but-set-variable]
      81 |         unsigned int hsub, vsub, size;
         |                      ^~~~
--
>> drivers/gpu/drm/phytium/phytium_gem.c:21:5: warning: no previous prototype for 'phytium_memory_pool_alloc' [-Wmissing-prototypes]
      21 | int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_gem.c:36:6: warning: no previous prototype for 'phytium_memory_pool_free' [-Wmissing-prototypes]
      36 | void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_gem.c:188:5: warning: no previous prototype for 'phytium_dma_transfer' [-Wmissing-prototypes]
     188 | int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/phytium_fbdev.c:113:5: warning: no previous prototype for 'phytium_drm_fbdev_init' [-Wmissing-prototypes]
     113 | int phytium_drm_fbdev_init(struct drm_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_fbdev.c:144:6: warning: no previous prototype for 'phytium_drm_fbdev_fini' [-Wmissing-prototypes]
     144 | void phytium_drm_fbdev_fini(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/phytium_debugfs.c:375:5: warning: no previous prototype for 'phytium_debugfs_connector_add' [-Wmissing-prototypes]
     375 | int phytium_debugfs_connector_add(struct drm_connector *connector)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_debugfs.c:437:5: warning: no previous prototype for 'phytium_debugfs_display_register' [-Wmissing-prototypes]
     437 | int phytium_debugfs_display_register(struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/x100_dp.c:852:6: warning: no previous prototype for 'x100_dp_hw_spread_is_enable' [-Wmissing-prototypes]
     852 | bool x100_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dp.c:864:5: warning: no previous prototype for 'x100_dp_hw_reset' [-Wmissing-prototypes]
     864 | int x100_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dp.c:897:9: warning: no previous prototype for 'x100_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     897 | uint8_t x100_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/phytium_panel.c:234:6: warning: no previous prototype for 'phytium_dp_panel_release_backlight_funcs' [-Wmissing-prototypes]
     234 | void phytium_dp_panel_release_backlight_funcs(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +/phytium_pci_vram_hw_init +23 drivers/gpu/drm/phytium/phytium_pci.c

    22	
  > 23	void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
    24	{
    25		struct phytium_pci_private *pci_priv = to_pci_priv(priv);
    26	
    27		pci_priv->dc_hw_vram_init(priv, priv->pool_phys_addr, priv->pool_size);
    28	}
    29	
  > 30	int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
    31	{
    32		int ret = 0;
    33	
    34		priv->pool_phys_addr = pci_resource_start(pdev, 2);
    35		priv->pool_size = pci_resource_len(pdev, 2);
    36		if ((priv->pool_phys_addr != 0) && (priv->pool_size != 0)) {
    37			priv->pool_virt_addr = devm_ioremap_wc(&pdev->dev, priv->pool_phys_addr,
    38							       priv->pool_size);
    39			if (priv->pool_virt_addr == NULL) {
    40				DRM_ERROR("pci vram ioremap fail, addr:0x%llx, size:0x%llx\n",
    41					   priv->pool_phys_addr, priv->pool_size);
    42				ret = -EINVAL;
    43				goto failed_ioremap;
    44			}
    45			ret = phytium_memory_pool_init(&pdev->dev, priv);
    46			if (ret)
    47				goto failed_init_memory_pool;
    48	
    49			priv->mem_state[PHYTIUM_MEM_VRAM_TOTAL] = priv->pool_size;
    50			priv->support_memory_type = MEMORY_TYPE_VRAM;
    51			priv->vram_hw_init = phytium_pci_vram_hw_init;
    52		} else {
    53			DRM_DEBUG_KMS("not support vram\n");
    54			priv->pool_virt_addr = NULL;
    55			priv->mem_state[PHYTIUM_MEM_VRAM_TOTAL] = 0;
    56			priv->support_memory_type = MEMORY_TYPE_SYSTEM_UNIFIED;
    57			priv->vram_hw_init = NULL;
    58		}
    59	
    60		return 0;
    61	
    62	failed_init_memory_pool:
    63		devm_iounmap(&pdev->dev, priv->pool_virt_addr);
    64	failed_ioremap:
    65		return ret;
    66	}
    67	
  > 68	void phytium_pci_vram_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
    69	{
    70		if (priv->support_memory_type == MEMORY_TYPE_VRAM) {
    71			phytium_memory_pool_fini(&pdev->dev, priv);
    72			devm_iounmap(&pdev->dev, priv->pool_virt_addr);
    73		}
    74	}
    75	
    76	static bool phytium_pci_dma_chan_filter(struct dma_chan *chan, void *param)
    77	{
    78		struct phytium_dma_slave *s = param;
    79	
    80		if (s->dma_dev != chan->device->dev)
    81			return false;
    82	
    83		if (s->chan_id ==  chan->chan_id)
    84			return true;
    85		else
    86			return false;
    87	}
    88	
  > 89	int phytium_pci_dma_init(struct phytium_display_private *priv)
    90	{
    91		struct pci_dev *dma_dev, *gpu_dev;
    92		struct drm_device *drm_dev =  priv->dev;
    93		dma_cap_mask_t mask;
    94		struct phytium_dma_slave s;
    95		int ret = 0;
    96		u16 cmd;
    97	
    98		/* check x100 gpu enable */
  > 99		gpu_dev = pci_get_device(PCI_VENDOR_ID_PHYTIUM, 0xdc20, NULL);
   100		if (!gpu_dev) {
   101			DRM_INFO("failed to get gpu_dev\n");
   102			ret = -ENODEV;
   103			goto failed;
   104		}
   105	
   106		pci_read_config_word(gpu_dev, PCI_COMMAND, &cmd);
   107		if (!(cmd & PCI_COMMAND_MASTER)) {
   108			DRM_INFO("gpu_dev master is disabled\n");
   109			ret = -ENODEV;
   110			goto failed;
   111		}
   112	
   113		dma_dev = pci_get_device(PCI_VENDOR_ID_PHYTIUM, 0xdc3c, NULL);
   114		if (!dma_dev) {
   115			DRM_INFO("failed to get dma_dev\n");
   116			ret = -ENODEV;
   117			goto failed;
   118		}
   119	
   120		dma_cap_zero(mask);
   121		dma_cap_set(DMA_SLAVE, mask);
   122	
   123		s.dma_dev = &dma_dev->dev;
   124		s.chan_id = 2;
   125		priv->dma_chan = dma_request_channel(mask, phytium_pci_dma_chan_filter, &s);
   126		if (!priv->dma_chan) {
   127			DRM_DEV_ERROR(drm_dev->dev, "failed to request dma chan\n");
   128			ret = -EBUSY;
   129			goto failed;
   130		}
   131		priv->dma_inited = 1;
   132	
   133	failed:
   134		return ret;
   135	}
   136	
 > 137	void phytium_pci_dma_fini(struct phytium_display_private *priv)
   138	{
   139		if (priv->dma_inited)
   140			dma_release_channel(priv->dma_chan);
   141		priv->dma_inited = 0;
   142		priv->dma_chan =  NULL;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
