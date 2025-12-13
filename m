Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9214742A82
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765611140; cv=none; b=hS6BX+XvnMyLypnBrTtJKaX6Z71ne8jWYG8d5mYdkLhUBPeMt7zSpACwpsoErxEoGPYZMN3HX5xPTuzJBRM1gT5uzlORGLC4zlIhbQSyPUejRtp8W5Oa/1Ey/bXcHZp8ya+X65CR3PrDW8eKzBr0mnqSF6EYgSxX7qRSY+Y+jnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765611140; c=relaxed/simple;
	bh=6NWvUR1FrivKMp67CbaxPjXBS3Ub7VLVdp8V9vPY/4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJ9UlAh79YOE2j4BcS3+3N9C1Dm5DNA6Tj26I6YEc3yAMhXjnyCr13hOpYKGnmLR/xeB31k72Q4R1DScHVFDBwvsyFvvSYjJPslF26bThff89Rh/VxpymU3bgPdQG33gdJPJvLQhS3iJ7L4j21BoU547dfHXougMkTR35vb01ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCqcVpiq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCqcVpiq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765611138; x=1797147138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6NWvUR1FrivKMp67CbaxPjXBS3Ub7VLVdp8V9vPY/4U=;
  b=mCqcVpiqwGKki/z0ghoyrAeqv0S3JPKnGnDXmN2ZObjIH0+ODvCDEM0r
   rsGEbjliXbWADtCqfS4wn7lSFr8l+b7CwaHL1OCZYaASkVoEUikUlbzcc
   TjSLpEJ7+k3eoUyQvFeEdUMSbeutvmPzG3HVqxSuxDy4gSwOVaQIYW06H
   veuFtNJdjCYdy+egX/qJNE+QxzWjEs/Y012CyuHnjhMUChcRMauFVcMfb
   VlIkT+h+/gCYWjCDJFMYP8kLU/T5VhSyrqjAk/g8W9K5AXEabeDyFzJ61
   PhGcMiM8uFhY2sHBdHBPKIb3kvn2AwZKPzeyanw0pWrexrZ0HA+mZentx
   g==;
X-CSE-ConnectionGUID: Z17VPPk5RpqPeQsjozHinw==
X-CSE-MsgGUID: 9EB6HhheSL2BnyFKm+oyww==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85197483"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85197483"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:32:14 -0800
X-CSE-ConnectionGUID: Mc6IsYboTKi+WZqgcQtH7A==
X-CSE-MsgGUID: SOAjDCxQTkuiCfT3c2BtPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197171715"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 23:32:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUK6s-000000007EX-2rFG;
	Sat, 13 Dec 2025 07:32:10 +0000
Date: Sat, 13 Dec 2025 15:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/gpu/drm/phytium/phytium_gem.c:170:6: warning: no previous prototype
 for 'phytium_gem_prime_vunmap'
Message-ID: <202512131516.QU7kM0te-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi xuyan,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 3b4a5906fa714bdc9a15fc04374942888737eb4c [3541/3541] drm/phytium: Fix Phytium DRM build fail
config: x86_64-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131516.QU7kM0te-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131516.QU7kM0te-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131516.QU7kM0te-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/phytium/phytium_gem.c:22:5: warning: no previous prototype for 'phytium_memory_pool_alloc' [-Wmissing-prototypes]
      22 | int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:37:6: warning: no previous prototype for 'phytium_memory_pool_free' [-Wmissing-prototypes]
      37 | void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:161:5: warning: no previous prototype for 'phytium_gem_prime_vmap' [-Wmissing-prototypes]
     161 | int phytium_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_gem.c:170:6: warning: no previous prototype for 'phytium_gem_prime_vunmap' [-Wmissing-prototypes]
     170 | void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:174:5: warning: no previous prototype for 'phytium_gem_prime_mmap' [-Wmissing-prototypes]
     174 | int phytium_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:186:5: warning: no previous prototype for 'phytium_dma_transfer' [-Wmissing-prototypes]
     186 | int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/phytium/px210_dp.c:852:6: warning: no previous prototype for 'px210_dp_hw_spread_is_enable' [-Wmissing-prototypes]
     852 | bool px210_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/px210_dp.c:864:5: warning: no previous prototype for 'px210_dp_hw_reset' [-Wmissing-prototypes]
     864 | int px210_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dp.c:897:9: warning: no previous prototype for 'px210_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     897 | uint8_t px210_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/px210_dc.c:71:6: warning: no previous prototype for 'px210_dc_hw_vram_init' [-Wmissing-prototypes]
      71 | void px210_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:103:6: warning: no previous prototype for 'px210_dc_hw_clear_msi_irq' [-Wmissing-prototypes]
     103 | void px210_dc_hw_clear_msi_irq(struct phytium_display_private *priv, uint32_t phys_pipe)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:108:6: warning: no previous prototype for 'px210_dc_hw_config_pix_clock' [-Wmissing-prototypes]
     108 | void px210_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/px210_dc.c:126:6: warning: no previous prototype for 'px210_dc_hw_disable' [-Wmissing-prototypes]
     126 | void px210_dc_hw_disable(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/px210_dc.c:174:5: warning: no previous prototype for 'px210_dc_hw_fb_format_check' [-Wmissing-prototypes]
     174 | int px210_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:244:6: warning: no previous prototype for 'px210_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     244 | void px210_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/px210_dc.c:253:6: warning: no previous prototype for 'px210_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     253 | void px210_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:262:6: warning: no previous prototype for 'px210_dc_hw_update_dcreq' [-Wmissing-prototypes]
     262 | void px210_dc_hw_update_dcreq(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/px210_dc.c:319:6: warning: no previous prototype for 'px210_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     319 | void px210_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/pe220x_dp.c:465:6: warning: no previous prototype for 'pe220x_dp_hw_spread_is_enable' [-Wmissing-prototypes]
     465 | bool pe220x_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dp.c:470:5: warning: no previous prototype for 'pe220x_dp_hw_reset' [-Wmissing-prototypes]
     470 | int pe220x_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dp.c:485:9: warning: no previous prototype for 'pe220x_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     485 | uint8_t pe220x_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/pe220x_dc.c:79:6: warning: no previous prototype for 'pe220x_dc_hw_vram_init' [-Wmissing-prototypes]
      79 | void pe220x_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:93:6: warning: no previous prototype for 'pe220x_dc_hw_config_pix_clock' [-Wmissing-prototypes]
      93 | void pe220x_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:110:6: warning: no previous prototype for 'pe220x_dc_hw_reset' [-Wmissing-prototypes]
     110 | void pe220x_dc_hw_reset(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:231:5: warning: no previous prototype for 'pe220x_dc_hw_fb_format_check' [-Wmissing-prototypes]
     231 | int pe220x_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:243:6: warning: no previous prototype for 'pe220x_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     243 | void pe220x_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:252:6: warning: no previous prototype for 'pe220x_dc_bmc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     252 | void pe220x_dc_bmc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:261:6: warning: no previous prototype for 'pe220x_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     261 | void pe220x_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:270:6: warning: no previous prototype for 'pe220x_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     270 | void pe220x_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:287:6: warning: no previous prototype for 'pe220x_dc_hw_update_cursor_hi_addr' [-Wmissing-prototypes]
     287 | void pe220x_dc_hw_update_cursor_hi_addr(struct drm_plane *plane, uint64_t iova)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/phytium_platform.c:22:5: warning: no previous prototype for 'phytium_platform_carveout_mem_init' [-Wmissing-prototypes]
      22 | int phytium_platform_carveout_mem_init(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_platform.c:63:6: warning: no previous prototype for 'phytium_platform_carveout_mem_fini' [-Wmissing-prototypes]
      63 | void phytium_platform_carveout_mem_fini(struct platform_device *pdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_platform.c:348:34: warning: 'display_of_match' defined but not used [-Wunused-const-variable=]
     348 | static const struct of_device_id display_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/phytium_gem_prime_vunmap +170 drivers/gpu/drm/phytium/phytium_gem.c

b80df10f845813 lishuo 2024-01-31  169  
b80df10f845813 lishuo 2024-01-31 @170  void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
b80df10f845813 lishuo 2024-01-31  171  {
e2cdf30a3e12bb XuYan  2025-04-09  172  }
b80df10f845813 lishuo 2024-01-31  173  

:::::: The code at line 170 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
