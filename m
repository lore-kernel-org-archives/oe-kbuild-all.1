Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B648C4A03
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 01:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707181671; cv=none; b=fZiZC3DoVsTrLGFi9fZM/cqwAgmZrqNxXF+cTcmbjj+SBpKV9rEnBjJirvyM7sjCj+GoaMufZTqNw8p5WX67N59rhZr8iR3YLdmsSHuB/QkSKOBz+mz5jCxAiBcAzLl3OlXPKtyTAXs+yGQgJ5p2WlErIPjGeEbByCInRsyH6mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707181671; c=relaxed/simple;
	bh=ea+JE6CKgIN89jGBtU/Ifrz8Ngn/6Fl4dGvsZHZWO8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=juPSxnBvkg/eFIK3KFLRVt7qPVzRP0FwrdHjAeN06KAnNVs8YpK/2jDUSuPllhmCEfC9uE2vNCK5eCJ15oiPsLvv8mMHKMmHInaoFnL3fqkHBdIEv8V4sVVIu3aY463P/xP0tCc1414brvV2FICDSmWw6/VPERQYfpeC+0K7UME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcdN+h5Z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcdN+h5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707181669; x=1738717669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ea+JE6CKgIN89jGBtU/Ifrz8Ngn/6Fl4dGvsZHZWO8s=;
  b=AcdN+h5ZU7dR0h+NX5rWc8Rvotz5Tjad3W2TZQ7ca4bTjW//IUyPVoc+
   e+Yd/diQs6aWARV+I2JopwWjiPJQYd8TKnmVb2O6eWF86a8m8U3Xi1qjs
   oh0aBKFLzPfbk+tsldjagUJi9VHLeS3mfIw95OYLAX/xxHtWjIAzJnNPT
   aqNkmd6oi+HYTyHCkxbMnk2LHOg9PhjefbTi1osziuLHF+Hm9YA+bux+0
   emFt2YZfHoqwx+w8IGLXHUulcGXTPvUORx9j5nyo8QaibpyeClX696dVx
   dVu1Y019shYFfuW4ILJ73NE8S5mifhzv1WpxnadxvI5R7ZYsPYjuh4/41
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="806295"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="806295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 17:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1143855"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2024 17:07:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX9w8-0000xG-1B;
	Tue, 06 Feb 2024 01:07:44 +0000
Date: Tue, 6 Feb 2024 09:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishuo <lishuo@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21254/21616]
 drivers/gpu/drm/phytium/phytium_display_drv.c:89:16: warning: variable
 'status' set but not used
Message-ID: <202402060915.ltYJWMoP-lkp@intel.com>
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
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: cad0702e5286d3cc80afe545de027858b855dd5a [21254/21616] DRM: Phytium display DRM driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240206/202402060915.ltYJWMoP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060915.ltYJWMoP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060915.ltYJWMoP-lkp@intel.com/

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
--
>> drivers/gpu/drm/phytium/x100_dc.c:64:6: warning: no previous prototype for 'x100_dc_hw_vram_init' [-Wmissing-prototypes]
      64 | void x100_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:96:6: warning: no previous prototype for 'x100_dc_hw_clear_msi_irq' [-Wmissing-prototypes]
      96 | void x100_dc_hw_clear_msi_irq(struct phytium_display_private *priv, uint32_t phys_pipe)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:101:6: warning: no previous prototype for 'x100_dc_hw_config_pix_clock' [-Wmissing-prototypes]
     101 | void x100_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:119:6: warning: no previous prototype for 'x100_dc_hw_disable' [-Wmissing-prototypes]
     119 | void x100_dc_hw_disable(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:167:5: warning: no previous prototype for 'x100_dc_hw_fb_format_check' [-Wmissing-prototypes]
     167 | int x100_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:237:6: warning: no previous prototype for 'x100_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     237 | void x100_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:246:6: warning: no previous prototype for 'x100_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     246 | void x100_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:255:6: warning: no previous prototype for 'x100_dc_hw_update_dcreq' [-Wmissing-prototypes]
     255 | void x100_dc_hw_update_dcreq(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/x100_dc.c:312:6: warning: no previous prototype for 'x100_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     312 | void x100_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


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
