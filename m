Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2D1E7C0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729858870; cv=none; b=SnATQ9VbwU5QkAXaRZaf95lQvNGtwwYjNkkyGWlT5Xc1bHCzz4yevVnNjI0fZ5u6TUMYHHUp6Js24fO0KKHn0E3L4JfSKvUK96BisMso0410PvKuGp3D0W0b0mrLbx7oLUVXIr2Y9E66QsHQOi9M84DvNZK3x15rPtvxBGT5KH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729858870; c=relaxed/simple;
	bh=m5jbqLVlVhiBJCCPOnpRpyOaUKkssLP5Kmzyt8ox1fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EioXbQ145Cn4L/zUNpeVBJURZRlrpSksC/1kVytig3cilICdKg/OUSiHYtDDX0m+otrOsyS6jVKfSQ5+Dlkt381P0hJ5/oBaSIWWc8PKNqJw8fWqzRc+pKIlE84s5D9cW3Is3F7C7IMsW73IsRFR7Mi5uJBjW/Mh48YyL3Ttczo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ns6RzgWQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ns6RzgWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729858868; x=1761394868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5jbqLVlVhiBJCCPOnpRpyOaUKkssLP5Kmzyt8ox1fQ=;
  b=ns6RzgWQVk3rTusbsHPmPLP7KtZqMPYGFsPq2eb2NaU1valpdwvEhw40
   6Q7ItPqNjPWuBXkdzlvvo0kaLq923EukjlEzTJDcuSz80s60abVo+SorP
   l35JqctelR1J2lzVY4LPRnUSlrNcVuih43SXFGfE/fHZOLfVjxJGM27qp
   sb20HEfQIAojSS5J/oL6XHseIE1+dZMug2dX9ZsrAxFJqcj5yJ7VyKhzU
   G4hOEYln6x0MjQ4bUKwe4gdvbg1GNo4kQ3w68OAAEvYNeSiPm6t76fHew
   1QEzxSumFDcI76IuvdMSj92oQ+ZNx4B2QxLFczLeZg89pUD/A4zj5sOi9
   A==;
X-CSE-ConnectionGUID: nzIIj2NQQi+9sO2XmS8Xuw==
X-CSE-MsgGUID: vxTY/A8dR16sVOwG1z1gVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33330258"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="33330258"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:21:07 -0700
X-CSE-ConnectionGUID: MrHepa2xS9W9AHCtxteJKg==
X-CSE-MsgGUID: dR0Uan8aQieBTS1/Urw8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85460862"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Oct 2024 05:21:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4JJN-000YDW-1c;
	Fri, 25 Oct 2024 12:21:01 +0000
Date: Fri, 25 Oct 2024 20:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6401/13046]
 drivers/gpu/drm/phytium/phytium_dp.c:2258:6: warning: no previous prototype
 for 'phytium_dp_encoder_destroy'
Message-ID: <202410252059.CcU6P5eP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 807eac186dc0a08a5518365494d4a216383909aa [6401/13046] DRM: Phytium display DRM driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410252059.CcU6P5eP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252059.CcU6P5eP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252059.CcU6P5eP-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/gpu/drm/phytium/phytium_dp.c:1224:6: warning: no previous prototype for 'phytium_dp_dpcd_sink_dpms' [-Wmissing-prototypes]
    1224 | void phytium_dp_dpcd_sink_dpms(struct phytium_dp_device *phytium_dp, int mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1449:5: warning: no previous prototype for 'phytium_dp_get_link_train_fallback_values' [-Wmissing-prototypes]
    1449 | int phytium_dp_get_link_train_fallback_values(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1498:5: warning: no previous prototype for 'phytium_dp_start_link_train' [-Wmissing-prototypes]
    1498 | int phytium_dp_start_link_train(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1803:6: warning: no previous prototype for 'phytium_dp_hpd_poll_handler' [-Wmissing-prototypes]
    1803 | void phytium_dp_hpd_poll_handler(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1950:6: warning: no previous prototype for 'phytium_dp_fast_link_train' [-Wmissing-prototypes]
    1950 | bool phytium_dp_fast_link_train(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2141:6: warning: no previous prototype for 'phytium_dp_adjust_link_train_parameter' [-Wmissing-prototypes]
    2141 | void phytium_dp_adjust_link_train_parameter(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2202:1: warning: no previous prototype for 'phytium_encoder_mode_valid' [-Wmissing-prototypes]
    2202 | phytium_encoder_mode_valid(struct drm_encoder *encoder, const struct drm_display_mode *mode)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_dp.c:2258:6: warning: no previous prototype for 'phytium_dp_encoder_destroy' [-Wmissing-prototypes]
    2258 | void phytium_dp_encoder_destroy(struct drm_encoder *encoder)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2471:5: warning: no previous prototype for 'phytium_get_encoder_crtc_mask' [-Wmissing-prototypes]
    2471 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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


vim +/phytium_dp_encoder_destroy +2258 drivers/gpu/drm/phytium/phytium_dp.c

  2257	
> 2258	void phytium_dp_encoder_destroy(struct drm_encoder *encoder)
  2259	{
  2260		struct phytium_dp_device *phytium_dp = encoder_to_dp_device(encoder);
  2261	
  2262		phytium_dp_audio_codec_fini(phytium_dp);
  2263		drm_encoder_cleanup(encoder);
  2264	}
  2265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
