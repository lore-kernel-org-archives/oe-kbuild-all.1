Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30558221281
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 21:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504001; cv=none; b=PBn3H/8scjH576kfVw1DYJr1pjwlaCC2ajikURQRlrEaMd+ITZGTr7few4owhB8vWxcCyDpXSOMc3Jxn3cYI94EFRT0AEaSkUgrohbJKxkA+N/+cnQZDsa6INPFxQsrQv7wlgt+ox0MZ/m8XLJP0QgwJS1ojjQqVQRrt3DBLvrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504001; c=relaxed/simple;
	bh=1W+V4T8c8GsNgU7MmQrCjoevhyqx6fEh5+Hq52RtM4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/C8zmTYQcqWeLlP6/mCVJILqsyd40DWmzDwSpVZ5lmwdPWTGfFOiNBgwhe7ayT1OvL1wNltdy0hbTH9eY/FCGaTDE/UR5wHbB+EbQZl8+jk4fhMzaUOZ6SzzAkSxF3uxdmbs+T3JmCjj5Bu4oKhvnCXcJw+2Jqd116q7/a59dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrbCGVx1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrbCGVx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749503999; x=1781039999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1W+V4T8c8GsNgU7MmQrCjoevhyqx6fEh5+Hq52RtM4E=;
  b=YrbCGVx1rW9XTjASuTBS5jthE04WvzNb70IWBbXqVkW3sL69cqsxXKBZ
   yipQt5JqhtxNyiKlbM45DTT4w5sOWnaMQfSdWd/2aTslwlp9tOuXdIor+
   QCXB/giuHanaSBJjGE87Bg663A/J4gUJltTSrxWTT+SifsmTDC3ZBOTUi
   ia4pG8CW4uEs9ZBxJoKwibhYB4sknAHsydq8gXhOWcs/lT/WbgToi5l2d
   yffQSutZnpyv966ECd3clMjgcJ+MRdc7TaI29rDEdRyKk15fAfDbkLSvF
   CVKnJqR1CWD3qpN3p0SeO5jS3VEWY9+gD8atHVmATxGGOEb736GdSp//0
   Q==;
X-CSE-ConnectionGUID: S1odfj32RS2/fH2solfBZg==
X-CSE-MsgGUID: oE+XE6CpQyiAca6OhSTHEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62999161"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="62999161"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 14:19:58 -0700
X-CSE-ConnectionGUID: 0zNqmjToSfuo1mB6bow36A==
X-CSE-MsgGUID: YosVp9fNTxaFhkggENavsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151427743"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2025 14:19:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOjuN-0007R1-0Y;
	Mon, 09 Jun 2025 21:19:55 +0000
Date: Tue, 10 Jun 2025 05:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2380/2380]
 drivers/gpu/drm/phytium/phytium_plane.c:30:6: sparse: sparse: symbol
 'phytium_plane_destroy' was not declared. Should it be static?
Message-ID: <202506100507.lISyTw9e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a7f4bf73c34996ee6cdda292e8f906a9c30879de
commit: b80df10f845813bb4fc2002b5386ecdfa8be5f6c [2380/2380] DRM: Phytium display DRM driver
config: arm64-randconfig-r112-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100507.lISyTw9e-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250610/202506100507.lISyTw9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100507.lISyTw9e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/phytium/phytium_plane.c:30:6: sparse: sparse: symbol 'phytium_plane_destroy' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:72:1: sparse: sparse: symbol 'phytium_plane_atomic_set_property' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:81:24: sparse: sparse: symbol 'phytium_plane_atomic_duplicate_state' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:103:1: sparse: sparse: symbol 'phytium_plane_atomic_destroy_state' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:111:30: sparse: sparse: symbol 'phytium_plane_funcs' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:503:37: sparse: sparse: symbol 'phytium_plane_helper_funcs' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_gem.c:22:5: sparse: sparse: symbol 'phytium_memory_pool_alloc' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_gem.c:37:6: sparse: sparse: symbol 'phytium_memory_pool_free' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_gem.c:160:5: sparse: sparse: symbol 'phytium_gem_prime_vmap' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_gem.c:169:6: sparse: sparse: symbol 'phytium_gem_prime_vunmap' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_gem.c:181:5: sparse: sparse: symbol 'phytium_dma_transfer' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_crtc.c:379:23: sparse: sparse: symbol 'phytium_crtc_atomic_duplicate_state' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_crtc.c:395:1: sparse: sparse: symbol 'phytium_crtc_atomic_destroy_state' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_dp.c:506:6: sparse: sparse: symbol 'phytium_dp_coding_8b10b_need_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:523:6: sparse: sparse: symbol 'phytium_dp_scrambled_need_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:656:6: sparse: sparse: symbol 'phytium_dp_hw_enable_audio' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:825:6: sparse: sparse: symbol 'phytium_dp_hw_disable_video' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:836:6: sparse: sparse: symbol 'phytium_dp_hw_video_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:847:6: sparse: sparse: symbol 'phytium_dp_hw_enable_video' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:859:6: sparse: sparse: symbol 'phytium_dp_hw_config_video' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:948:6: sparse: sparse: symbol 'phytium_dp_hw_disable_output' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:960:6: sparse: sparse: symbol 'phytium_dp_hw_enable_output' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:972:6: sparse: sparse: symbol 'phytium_dp_hw_enable_input_source' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:983:6: sparse: sparse: symbol 'phytium_dp_hw_disable_input_source' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:993:6: sparse: sparse: symbol 'phytium_dp_hw_output_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1030:6: sparse: sparse: symbol 'phytium_dp_hw_hpd_irq_setup' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1045:5: sparse: sparse: symbol 'phytium_dp_hw_init' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1223:6: sparse: sparse: symbol 'phytium_dp_dpcd_sink_dpms' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1448:5: sparse: sparse: symbol 'phytium_dp_get_link_train_fallback_values' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1497:5: sparse: sparse: symbol 'phytium_dp_start_link_train' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1802:6: sparse: sparse: symbol 'phytium_dp_hpd_poll_handler' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1949:6: sparse: sparse: symbol 'phytium_dp_fast_link_train' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:2140:6: sparse: sparse: symbol 'phytium_dp_adjust_link_train_parameter' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:2200:1: sparse: sparse: symbol 'phytium_encoder_mode_valid' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:2256:6: sparse: sparse: symbol 'phytium_dp_encoder_destroy' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:2469:5: sparse: sparse: symbol 'phytium_get_encoder_crtc_mask' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_fbdev.c:100:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void * @@
   drivers/gpu/drm/phytium/phytium_fbdev.c:100:26: sparse:     expected char [noderef] __iomem *screen_base
   drivers/gpu/drm/phytium/phytium_fbdev.c:100:26: sparse:     got void *
>> drivers/gpu/drm/phytium/phytium_fbdev.c:38:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/phytium/phytium_fbdev.c:39:10: sparse:   also defined here
--
>> drivers/gpu/drm/phytium/px210_dp.c:852:6: sparse: sparse: symbol 'px210_dp_hw_spread_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/px210_dp.c:864:5: sparse: sparse: symbol 'px210_dp_hw_reset' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/px210_dp.c:897:9: sparse: sparse: symbol 'px210_dp_hw_get_source_lane_count' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_panel.c:234:6: sparse: sparse: symbol 'phytium_dp_panel_release_backlight_funcs' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_platform.c:32:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/phytium/phytium_platform.c:32:38: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_platform.c:32:38: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/phytium/phytium_platform.c:55:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_platform.c:55:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_platform.c:55:21: sparse:     got void *pool_virt_addr
>> drivers/gpu/drm/phytium/phytium_platform.c:19:5: sparse: sparse: symbol 'phytium_platform_carveout_mem_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_platform.c:65:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_platform.c:65:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_platform.c:65:29: sparse:     got void *pool_virt_addr
>> drivers/gpu/drm/phytium/phytium_platform.c:60:6: sparse: sparse: symbol 'phytium_platform_carveout_mem_fini' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_platform.c:298:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/phytium/phytium_platform.c:306:10: sparse:   also defined here
--
>> drivers/gpu/drm/phytium/phytium_pci.c:19:5: sparse: sparse: symbol 'dc_msi_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_pci.c:23:6: sparse: sparse: symbol 'phytium_pci_vram_hw_init' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_pci.c:37:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/phytium/phytium_pci.c:37:38: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:37:38: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/phytium/phytium_pci.c:63:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_pci.c:63:38: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_pci.c:63:38: sparse:     got void *pool_virt_addr
>> drivers/gpu/drm/phytium/phytium_pci.c:30:5: sparse: sparse: symbol 'phytium_pci_vram_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:72:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_pci.c:72:46: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_pci.c:72:46: sparse:     got void *pool_virt_addr
>> drivers/gpu/drm/phytium/phytium_pci.c:68:6: sparse: sparse: symbol 'phytium_pci_vram_fini' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_pci.c:89:5: sparse: sparse: symbol 'phytium_pci_dma_init' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_pci.c:137:6: sparse: sparse: symbol 'phytium_pci_dma_fini' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/pe220x_dp.c:471:6: sparse: sparse: symbol 'pe220x_dp_hw_spread_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/pe220x_dp.c:476:5: sparse: sparse: symbol 'pe220x_dp_hw_reset' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/pe220x_dp.c:491:9: sparse: sparse: symbol 'pe220x_dp_hw_get_source_lane_count' was not declared. Should it be static?

vim +/phytium_plane_destroy +30 drivers/gpu/drm/phytium/phytium_plane.c

    29	
  > 30	void phytium_plane_destroy(struct drm_plane *plane)
    31	{
    32		struct phytium_plane *phytium_plane = to_phytium_plane(plane);
    33	
    34		drm_plane_cleanup(plane);
    35		kfree(phytium_plane);
    36	}
    37	
    38	/**
    39	 * phytium_plane_atomic_get_property - fetch plane property value
    40	 * @plane: plane to fetch property for
    41	 * @state: state containing the property value
    42	 * @property: property to look up
    43	 * @val: pointer to write property value into
    44	 *
    45	 * The DRM core does not store shadow copies of properties for
    46	 * atomic-capable drivers.  This entrypoint is used to fetch
    47	 * the current value of a driver-specific plane property.
    48	 */
    49	static int
    50	phytium_plane_atomic_get_property(struct drm_plane *plane,
    51						const struct drm_plane_state *state,
    52						struct drm_property *property,
    53						uint64_t *val)
    54	{
    55		DRM_DEBUG_KMS("Unknown plane property [PROP:%d:%s]\n", property->base.id, property->name);
    56		return -EINVAL;
    57	}
    58	
    59	/**
    60	 * phytium_plane_atomic_set_property - set plane property value
    61	 * @plane: plane to set property for
    62	 * @state: state to update property value in
    63	 * @property: property to set
    64	 * @val: value to set property to
    65	 *
    66	 * Writes the specified property value for a plane into the provided atomic
    67	 * state object.
    68	 *
    69	 * Returns 0 on success, -EINVAL on unrecognized properties
    70	 */
    71	int
  > 72	phytium_plane_atomic_set_property(struct drm_plane *plane,
    73						struct drm_plane_state *state,
    74						struct drm_property *property,
    75						uint64_t val)
    76	{
    77		DRM_DEBUG_KMS("Unknown plane property [PROP:%d:%s]\n", property->base.id, property->name);
    78		return -EINVAL;
    79	}
    80	
  > 81	struct drm_plane_state *
    82	phytium_plane_atomic_duplicate_state(struct drm_plane *plane)
    83	{
    84		struct drm_plane_state *state = NULL;
    85		struct phytium_plane_state *phytium_state = NULL;
    86	
    87		phytium_state = kmemdup(plane->state, sizeof(*phytium_state), GFP_KERNEL);
    88	
    89		if (!phytium_state)
    90			return NULL;
    91	
    92		state = &phytium_state->base;
    93		if (state->fb)
    94			drm_framebuffer_get(state->fb);
    95	
    96		state->fence = NULL;
    97		state->commit = NULL;
    98	
    99		return state;
   100	}
   101	
   102	void
 > 103	phytium_plane_atomic_destroy_state(struct drm_plane *plane, struct drm_plane_state *state)
   104	{
   105		struct phytium_plane_state *phytium_state = to_phytium_plane_state(state);
   106	
   107		__drm_atomic_helper_plane_destroy_state(state);
   108		kfree(phytium_state);
   109	}
   110	
 > 111	const struct drm_plane_funcs phytium_plane_funcs = {
   112		.update_plane		= drm_atomic_helper_update_plane,
   113		.disable_plane		= drm_atomic_helper_disable_plane,
   114		.destroy		= phytium_plane_destroy,
   115		.reset			= drm_atomic_helper_plane_reset,
   116		.atomic_get_property	= phytium_plane_atomic_get_property,
   117		.atomic_set_property	= phytium_plane_atomic_set_property,
   118		.atomic_duplicate_state	= phytium_plane_atomic_duplicate_state,
   119		.atomic_destroy_state	= phytium_plane_atomic_destroy_state,
   120	};
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
