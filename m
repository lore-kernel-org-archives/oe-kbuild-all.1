Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E381E487
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765629522; cv=none; b=BBYmgIQS2qLi+cRrjTZvA4hfD5Oa+kvpKhM75SI/mTT5cokQ0z4Xb/jKcRxV/kO2xqgFK1Vc/1glVyHkwvUz17gQbGWQwYZ4/WjRlg+8dRwJrVWu3JPB94dob+HRKJ1MqKmf348nyeP09YEQOMzp3rGV1jTpy4+Ubjg3C6nXWBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765629522; c=relaxed/simple;
	bh=cd6P3IXYshr+xutzZjJGYBkVGKqgZYdN2aSI9Iz1Cqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXvt1AqvTF4Bi3z7UrcBxUgpiQHNM5ILce8xBWPeH3bIVmRnNLyNBLJlyJuKIGCVUtU1rxqva/ersFdw+1cyg82A2lpycY8Y0DkUpsl+4U5mnmycYBvxMWWlM+xDX/de2WVaPclQUwfpi5AOTOaPZK1wHh10DLgE+jK7o3Gh7yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQjLBlW+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQjLBlW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765629521; x=1797165521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cd6P3IXYshr+xutzZjJGYBkVGKqgZYdN2aSI9Iz1Cqs=;
  b=TQjLBlW+B/qGJ3qjMeb3c+0q1aBvm7kpZgm5vccDXVlvDjvxzAF9mEx2
   epa5Wl+x3VLNnondP1gkDUX9fT7pu/cVPIkta9qLiFyIQfK5nC7efg4RE
   K0bsTeINbVO9bfxZSJMSOJCxyjDD0wDkjXXLh53gwGq73n45eX21HG9iv
   huSs7u5APcp4rNyuZqbKZQFwBWDZIIK2EaN0ZUZ+FUHFOHVcuDNIEbsIi
   Qmgz04OveX+sMBBIY89xBmJCz1Hxl6tFtwD2ciwtlajXLlU/sN44fbcx0
   leGNcKm1IzhRmh/vmNWJxUhSKXFQAAEVg32rz12d/KU2Rk5AGv7ws4Qsz
   g==;
X-CSE-ConnectionGUID: oeoaGuHPTHSAF0DRUcPIWw==
X-CSE-MsgGUID: wEKdm8JyQSC6o8c0dwS1sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85018031"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85018031"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:38:41 -0800
X-CSE-ConnectionGUID: Mis6fMyUS1K5d2tXuEJlEg==
X-CSE-MsgGUID: QZX5H3g9QrqLosYr3i0Yqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196591577"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 04:38:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOtR-000000007cd-0XQ4;
	Sat, 13 Dec 2025 12:38:37 +0000
Date: Sat, 13 Dec 2025 20:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 drivers/gpu/drm/phytium/phytium_display_drv.c:89:16: warning: variable
 'status' set but not used
Message-ID: <202512132013.dOzXok66-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi lishuo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: cad0702e5286d3cc80afe545de027858b855dd5a [1941/1941] DRM: Phytium display DRM driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512132013.dOzXok66-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132013.dOzXok66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132013.dOzXok66-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/phytium/phytium_display_drv.c: In function 'phytium_irq_preinstall':
>> drivers/gpu/drm/phytium/phytium_display_drv.c:89:16: warning: variable 'status' set but not used [-Wunused-but-set-variable]
      89 |         int i, status;
         |                ^~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c: In function 'phytium_irq_uninstall':
   drivers/gpu/drm/phytium/phytium_display_drv.c:100:16: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     100 |         int i, status;
         |                ^~~~~~
--
   drivers/gpu/drm/phytium/phytium_plane.c:25:6: warning: no previous prototype for 'phytium_plane_destroy' [-Wmissing-prototypes]
      25 | void phytium_plane_destroy(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_plane.c:67:1: warning: no previous prototype for 'phytium_plane_atomic_set_property' [-Wmissing-prototypes]
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
   drivers/gpu/drm/phytium/phytium_crtc.c:303:36: warning: variable 'phytium_crtc_state' set but not used [-Wunused-but-set-variable]
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
   drivers/gpu/drm/phytium/phytium_dp.c:872:6: warning: no previous prototype for 'phytium_dp_hw_video_is_enable' [-Wmissing-prototypes]
     872 | bool phytium_dp_hw_video_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:883:6: warning: no previous prototype for 'phytium_dp_hw_enable_video' [-Wmissing-prototypes]
     883 | void phytium_dp_hw_enable_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:895:6: warning: no previous prototype for 'phytium_dp_hw_config_video' [-Wmissing-prototypes]
     895 | void phytium_dp_hw_config_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:984:6: warning: no previous prototype for 'phytium_dp_hw_disable_output' [-Wmissing-prototypes]
     984 | void phytium_dp_hw_disable_output(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:996:6: warning: no previous prototype for 'phytium_dp_hw_enable_output' [-Wmissing-prototypes]
     996 | void phytium_dp_hw_enable_output(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1008:6: warning: no previous prototype for 'phytium_dp_hw_enable_input_source' [-Wmissing-prototypes]
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
   drivers/gpu/drm/phytium/phytium_dp.c:1260:6: warning: no previous prototype for 'phytium_dp_dpcd_sink_dpms' [-Wmissing-prototypes]
    1260 | void phytium_dp_dpcd_sink_dpms(struct phytium_dp_device *phytium_dp, int mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1486:5: warning: no previous prototype for 'phytium_dp_get_link_train_fallback_values' [-Wmissing-prototypes]
    1486 | int phytium_dp_get_link_train_fallback_values(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1535:5: warning: no previous prototype for 'phytium_dp_start_link_train' [-Wmissing-prototypes]
    1535 | int phytium_dp_start_link_train(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:1840:6: warning: no previous prototype for 'phytium_dp_hpd_poll_handler' [-Wmissing-prototypes]
    1840 | void phytium_dp_hpd_poll_handler(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1987:6: warning: no previous prototype for 'phytium_dp_fast_link_train' [-Wmissing-prototypes]
    1987 | bool phytium_dp_fast_link_train(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2178:6: warning: no previous prototype for 'phytium_dp_adjust_link_train_parameter' [-Wmissing-prototypes]
    2178 | void phytium_dp_adjust_link_train_parameter(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:2438:5: warning: no previous prototype for 'phytium_get_encoder_crtc_mask' [-Wmissing-prototypes]
    2438 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/phytium_gem.c:21:5: warning: no previous prototype for 'phytium_memory_pool_alloc' [-Wmissing-prototypes]
      21 | int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_gem.c:36:6: warning: no previous prototype for 'phytium_memory_pool_free' [-Wmissing-prototypes]
      36 | void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_gem.c:188:5: warning: no previous prototype for 'phytium_dma_transfer' [-Wmissing-prototypes]
     188 | int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
         |     ^~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/x100_dp.c:852:6: warning: no previous prototype for 'x100_dp_hw_spread_is_enable' [-Wmissing-prototypes]
     852 | bool x100_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dp.c:864:5: warning: no previous prototype for 'x100_dp_hw_reset' [-Wmissing-prototypes]
     864 | int x100_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dp.c:897:9: warning: no previous prototype for 'x100_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     897 | uint8_t x100_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/x100_dc.c:64:6: warning: no previous prototype for 'x100_dc_hw_vram_init' [-Wmissing-prototypes]
      64 | void x100_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/x100_dc.c:96:6: warning: no previous prototype for 'x100_dc_hw_clear_msi_irq' [-Wmissing-prototypes]
      96 | void x100_dc_hw_clear_msi_irq(struct phytium_display_private *priv, uint32_t phys_pipe)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/x100_dc.c:101:6: warning: no previous prototype for 'x100_dc_hw_config_pix_clock' [-Wmissing-prototypes]
     101 | void x100_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:119:6: warning: no previous prototype for 'x100_dc_hw_disable' [-Wmissing-prototypes]
     119 | void x100_dc_hw_disable(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:167:5: warning: no previous prototype for 'x100_dc_hw_fb_format_check' [-Wmissing-prototypes]
     167 | int x100_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/x100_dc.c:237:6: warning: no previous prototype for 'x100_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     237 | void x100_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:246:6: warning: no previous prototype for 'x100_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     246 | void x100_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/x100_dc.c:255:6: warning: no previous prototype for 'x100_dc_hw_update_dcreq' [-Wmissing-prototypes]
     255 | void x100_dc_hw_update_dcreq(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/x100_dc.c:312:6: warning: no previous prototype for 'x100_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     312 | void x100_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/phytium_pci.c:23:6: warning: no previous prototype for 'phytium_pci_vram_hw_init' [-Wmissing-prototypes]
      23 | void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_pci.c:30:5: warning: no previous prototype for 'phytium_pci_vram_init' [-Wmissing-prototypes]
      30 | int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:68:6: warning: no previous prototype for 'phytium_pci_vram_fini' [-Wmissing-prototypes]
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
   drivers/gpu/drm/phytium/e2000_dc.c:68:6: warning: no previous prototype for 'e2000_dc_hw_vram_init' [-Wmissing-prototypes]
      68 | void e2000_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/e2000_dc.c:82:6: warning: no previous prototype for 'e2000_dc_hw_config_pix_clock' [-Wmissing-prototypes]
      82 | void e2000_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/e2000_dc.c:99:6: warning: no previous prototype for 'e2000_dc_hw_reset' [-Wmissing-prototypes]
      99 | void e2000_dc_hw_reset(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/e2000_dc.c:193:5: warning: no previous prototype for 'e2000_dc_hw_fb_format_check' [-Wmissing-prototypes]
     193 | int e2000_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/e2000_dc.c:205:6: warning: no previous prototype for 'e2000_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     205 | void e2000_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/e2000_dc.c:214:6: warning: no previous prototype for 'e2000_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     214 | void e2000_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/e2000_dc.c:223:6: warning: no previous prototype for 'e2000_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     223 | void e2000_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/e2000_dc.c:240:6: warning: no previous prototype for 'e2000_dc_hw_update_cursor_hi_addr' [-Wmissing-prototypes]
     240 | void e2000_dc_hw_update_cursor_hi_addr(struct drm_plane *plane, uint64_t iova)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/phytium_platform.c:19:5: warning: no previous prototype for 'phytium_platform_carveout_mem_init' [-Wmissing-prototypes]
      19 | int phytium_platform_carveout_mem_init(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_platform.c:60:6: warning: no previous prototype for 'phytium_platform_carveout_mem_fini' [-Wmissing-prototypes]
      60 | void phytium_platform_carveout_mem_fini(struct platform_device *pdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/status +89 drivers/gpu/drm/phytium/phytium_display_drv.c

    85	
    86	static void phytium_irq_preinstall(struct drm_device *dev)
    87	{
    88		struct phytium_display_private *priv = dev->dev_private;
  > 89		int i, status;
    90	
    91		for_each_pipe_masked(priv, i) {
    92			status = phytium_readl_reg(priv, priv->dc_reg_base[i], PHYTIUM_DC_INT_STATUS);
    93			phytium_writel_reg(priv, INT_DISABLE, priv->dc_reg_base[i], PHYTIUM_DC_INT_ENABLE);
    94		}
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
