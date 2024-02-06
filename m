Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B15A56B65
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 02:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707186172; cv=none; b=GhixIalf+Q72DnVq5OtJqNqZCC8OISr+n+xGWollrDb06KkbnJYsxfQe9cnH+9K4F+GXv6nq5ydNUViId0c6CREhXF9qGgRZDz3Hn6jIKHa3KELlFEpRiX4GT+HhnAMmf7Z7hiHMUVRBGfURAuYGWqDtVWgmCHclDdRErJMf3Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707186172; c=relaxed/simple;
	bh=UiqIp27I158zlTdjyQz5V6nP63z5XvvZNA3R5NYJgg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URtHhF3dZbVrHawGl6ikwIMnGiN8ksTQ2V5fLvkHmv+wap8r5fVu2P/glUecCdgCqgiU2lVOWH3DJmjR5rQL4njD3AU2wLDlxYKZR73jo46QiupgHfvYfB5SRQSz6G5VY9TdtoCoS2BGwCQQ919fQcsZQSKLS1zy6r+KeqM3hC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxxHsV4B; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxxHsV4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707186170; x=1738722170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UiqIp27I158zlTdjyQz5V6nP63z5XvvZNA3R5NYJgg4=;
  b=hxxHsV4B753LmA18Cejns1eMcX29o9nnfK7VLPul5GNYLcCt4CUtiUHm
   EZ2S+r3V5zgIo80Ed3QUfxXwU4Adl+z7B2ypnBSCbu83DXNm4LyNQEsHQ
   ttl4LcFAxA7/eEFS8bUlV9ysNL2yeuBMwEPzbKAHhXvdt1PCooRqmPT3U
   XVeGAMDG/ggQ3t7NOzT00WEcLWVghIkqaoO9CoMiHCsmc1D3F519P/9JK
   yUTfViWezDQTjUXdAYhAZWnFDhEGsT5zHBhBG9yvVKSOU594565zRfqX/
   IsSt/cMP1qY49fYCbtlQxDoPI+84dkaic0r3vp9x5i8fnJYTH0c52MUEo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11295374"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11295374"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 18:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5495182"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2024 18:22:48 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXB6j-00010A-2g;
	Tue, 06 Feb 2024 02:22:45 +0000
Date: Tue, 6 Feb 2024 10:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishuo <lishuo@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2519/3004]
 drivers/gpu/drm/phytium/phytium_plane.c:30:6: warning: no previous prototype
 for function 'phytium_plane_destroy'
Message-ID: <202402061009.wXmMpBHa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fa30d756edd690da32744e72880e2ff10c01208f
commit: b80df10f845813bb4fc2002b5386ecdfa8be5f6c [2519/3004] DRM: Phytium display DRM driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240206/202402061009.wXmMpBHa-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402061009.wXmMpBHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402061009.wXmMpBHa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/phytium/phytium_plane.c:30:6: warning: no previous prototype for function 'phytium_plane_destroy' [-Wmissing-prototypes]
      30 | void phytium_plane_destroy(struct drm_plane *plane)
         |      ^
   drivers/gpu/drm/phytium/phytium_plane.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | void phytium_plane_destroy(struct drm_plane *plane)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_plane.c:72:1: warning: no previous prototype for function 'phytium_plane_atomic_set_property' [-Wmissing-prototypes]
      72 | phytium_plane_atomic_set_property(struct drm_plane *plane,
         | ^
   drivers/gpu/drm/phytium/phytium_plane.c:71:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      71 | int
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_plane.c:82:1: warning: no previous prototype for function 'phytium_plane_atomic_duplicate_state' [-Wmissing-prototypes]
      82 | phytium_plane_atomic_duplicate_state(struct drm_plane *plane)
         | ^
   drivers/gpu/drm/phytium/phytium_plane.c:81:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      81 | struct drm_plane_state *
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_plane.c:103:1: warning: no previous prototype for function 'phytium_plane_atomic_destroy_state' [-Wmissing-prototypes]
     103 | phytium_plane_atomic_destroy_state(struct drm_plane *plane, struct drm_plane_state *state)
         | ^
   drivers/gpu/drm/phytium/phytium_plane.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | void
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_plane.c:362:20: warning: variable 'crtc_x' set but not used [-Wunused-but-set-variable]
     362 |         int src_x, src_y, crtc_x, crtc_y, crtc_w, crtc_h;
         |                           ^
   drivers/gpu/drm/phytium/phytium_plane.c:362:28: warning: variable 'crtc_y' set but not used [-Wunused-but-set-variable]
     362 |         int src_x, src_y, crtc_x, crtc_y, crtc_w, crtc_h;
         |                                   ^
   6 warnings generated.
--
>> drivers/gpu/drm/phytium/phytium_crtc.c:380:1: warning: no previous prototype for function 'phytium_crtc_atomic_duplicate_state' [-Wmissing-prototypes]
     380 | phytium_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
         | ^
   drivers/gpu/drm/phytium/phytium_crtc.c:379:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     379 | struct drm_crtc_state *
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_crtc.c:395:1: warning: no previous prototype for function 'phytium_crtc_atomic_destroy_state' [-Wmissing-prototypes]
     395 | phytium_crtc_atomic_destroy_state(struct drm_crtc *crtc,
         | ^
   drivers/gpu/drm/phytium/phytium_crtc.c:394:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     394 | void
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_crtc.c:607:29: warning: variable 'phytium_crtc_state' set but not used [-Wunused-but-set-variable]
     607 |         struct phytium_crtc_state *phytium_crtc_state = NULL;
         |                                    ^
   3 warnings generated.
--
>> drivers/gpu/drm/phytium/phytium_dp.c:506:6: warning: no previous prototype for function 'phytium_dp_coding_8b10b_need_enable' [-Wmissing-prototypes]
     506 | bool phytium_dp_coding_8b10b_need_enable(unsigned char test_pattern)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:506:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     506 | bool phytium_dp_coding_8b10b_need_enable(unsigned char test_pattern)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:523:6: warning: no previous prototype for function 'phytium_dp_scrambled_need_enable' [-Wmissing-prototypes]
     523 | bool phytium_dp_scrambled_need_enable(unsigned char test_pattern)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:523:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     523 | bool phytium_dp_scrambled_need_enable(unsigned char test_pattern)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:656:6: warning: no previous prototype for function 'phytium_dp_hw_enable_audio' [-Wmissing-prototypes]
     656 | void phytium_dp_hw_enable_audio(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:656:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     656 | void phytium_dp_hw_enable_audio(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:825:6: warning: no previous prototype for function 'phytium_dp_hw_disable_video' [-Wmissing-prototypes]
     825 | void phytium_dp_hw_disable_video(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:825:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     825 | void phytium_dp_hw_disable_video(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:836:6: warning: no previous prototype for function 'phytium_dp_hw_video_is_enable' [-Wmissing-prototypes]
     836 | bool phytium_dp_hw_video_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:836:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     836 | bool phytium_dp_hw_video_is_enable(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:847:6: warning: no previous prototype for function 'phytium_dp_hw_enable_video' [-Wmissing-prototypes]
     847 | void phytium_dp_hw_enable_video(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:847:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     847 | void phytium_dp_hw_enable_video(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:859:6: warning: no previous prototype for function 'phytium_dp_hw_config_video' [-Wmissing-prototypes]
     859 | void phytium_dp_hw_config_video(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:859:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     859 | void phytium_dp_hw_config_video(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:948:6: warning: no previous prototype for function 'phytium_dp_hw_disable_output' [-Wmissing-prototypes]
     948 | void phytium_dp_hw_disable_output(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:948:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     948 | void phytium_dp_hw_disable_output(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:960:6: warning: no previous prototype for function 'phytium_dp_hw_enable_output' [-Wmissing-prototypes]
     960 | void phytium_dp_hw_enable_output(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:960:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     960 | void phytium_dp_hw_enable_output(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:972:6: warning: no previous prototype for function 'phytium_dp_hw_enable_input_source' [-Wmissing-prototypes]
     972 | void phytium_dp_hw_enable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:972:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     972 | void phytium_dp_hw_enable_input_source(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:983:6: warning: no previous prototype for function 'phytium_dp_hw_disable_input_source' [-Wmissing-prototypes]
     983 | void phytium_dp_hw_disable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:983:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     983 | void phytium_dp_hw_disable_input_source(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:993:6: warning: no previous prototype for function 'phytium_dp_hw_output_is_enable' [-Wmissing-prototypes]
     993 | bool phytium_dp_hw_output_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:993:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     993 | bool phytium_dp_hw_output_is_enable(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1030:6: warning: no previous prototype for function 'phytium_dp_hw_hpd_irq_setup' [-Wmissing-prototypes]
    1030 | void phytium_dp_hw_hpd_irq_setup(struct phytium_dp_device *phytium_dp, bool enable)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:1030:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1030 | void phytium_dp_hw_hpd_irq_setup(struct phytium_dp_device *phytium_dp, bool enable)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1045:5: warning: no previous prototype for function 'phytium_dp_hw_init' [-Wmissing-prototypes]
    1045 | int phytium_dp_hw_init(struct phytium_dp_device *phytium_dp)
         |     ^
   drivers/gpu/drm/phytium/phytium_dp.c:1045:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1045 | int phytium_dp_hw_init(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1223:6: warning: no previous prototype for function 'phytium_dp_dpcd_sink_dpms' [-Wmissing-prototypes]
    1223 | void phytium_dp_dpcd_sink_dpms(struct phytium_dp_device *phytium_dp, int mode)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:1223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1223 | void phytium_dp_dpcd_sink_dpms(struct phytium_dp_device *phytium_dp, int mode)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1448:5: warning: no previous prototype for function 'phytium_dp_get_link_train_fallback_values' [-Wmissing-prototypes]
    1448 | int phytium_dp_get_link_train_fallback_values(struct phytium_dp_device *phytium_dp)
         |     ^
   drivers/gpu/drm/phytium/phytium_dp.c:1448:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1448 | int phytium_dp_get_link_train_fallback_values(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1497:5: warning: no previous prototype for function 'phytium_dp_start_link_train' [-Wmissing-prototypes]
    1497 | int phytium_dp_start_link_train(struct phytium_dp_device *phytium_dp)
         |     ^
   drivers/gpu/drm/phytium/phytium_dp.c:1497:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1497 | int phytium_dp_start_link_train(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1802:6: warning: no previous prototype for function 'phytium_dp_hpd_poll_handler' [-Wmissing-prototypes]
    1802 | void phytium_dp_hpd_poll_handler(struct phytium_display_private *priv)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:1802:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1802 | void phytium_dp_hpd_poll_handler(struct phytium_display_private *priv)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1949:6: warning: no previous prototype for function 'phytium_dp_fast_link_train' [-Wmissing-prototypes]
    1949 | bool phytium_dp_fast_link_train(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:1949:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1949 | bool phytium_dp_fast_link_train(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:2140:6: warning: no previous prototype for function 'phytium_dp_adjust_link_train_parameter' [-Wmissing-prototypes]
    2140 | void phytium_dp_adjust_link_train_parameter(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:2140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2140 | void phytium_dp_adjust_link_train_parameter(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:2200:1: warning: no previous prototype for function 'phytium_encoder_mode_valid' [-Wmissing-prototypes]
    2200 | phytium_encoder_mode_valid(struct drm_encoder *encoder, const struct drm_display_mode *mode)
         | ^
   drivers/gpu/drm/phytium/phytium_dp.c:2199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2199 | enum drm_mode_status
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:2256:6: warning: no previous prototype for function 'phytium_dp_encoder_destroy' [-Wmissing-prototypes]
    2256 | void phytium_dp_encoder_destroy(struct drm_encoder *encoder)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:2256:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2256 | void phytium_dp_encoder_destroy(struct drm_encoder *encoder)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:2469:5: warning: no previous prototype for function 'phytium_get_encoder_crtc_mask' [-Wmissing-prototypes]
    2469 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         |     ^
   drivers/gpu/drm/phytium/phytium_dp.c:2469:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2469 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         | ^
         | static 
   23 warnings generated.
--
>> drivers/gpu/drm/phytium/phytium_gem.c:22:5: warning: no previous prototype for function 'phytium_memory_pool_alloc' [-Wmissing-prototypes]
      22 | int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
         |     ^
   drivers/gpu/drm/phytium/phytium_gem.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      22 | int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_gem.c:37:6: warning: no previous prototype for function 'phytium_memory_pool_free' [-Wmissing-prototypes]
      37 | void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         |      ^
   drivers/gpu/drm/phytium/phytium_gem.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_gem.c:160:5: warning: no previous prototype for function 'phytium_gem_prime_vmap' [-Wmissing-prototypes]
     160 | int phytium_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
         |     ^
   drivers/gpu/drm/phytium/phytium_gem.c:160:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     160 | int phytium_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_gem.c:169:6: warning: no previous prototype for function 'phytium_gem_prime_vunmap' [-Wmissing-prototypes]
     169 | void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
         |      ^
   drivers/gpu/drm/phytium/phytium_gem.c:169:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     169 | void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_gem.c:181:5: warning: no previous prototype for function 'phytium_dma_transfer' [-Wmissing-prototypes]
     181 | int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
         |     ^
   drivers/gpu/drm/phytium/phytium_gem.c:181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     181 | int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
         | ^
         | static 
   5 warnings generated.
--
>> drivers/gpu/drm/phytium/phytium_fbdev.c:117:5: warning: no previous prototype for function 'phytium_drm_fbdev_init' [-Wmissing-prototypes]
     117 | int phytium_drm_fbdev_init(struct drm_device *dev)
         |     ^
   drivers/gpu/drm/phytium/phytium_fbdev.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     117 | int phytium_drm_fbdev_init(struct drm_device *dev)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_fbdev.c:139:6: warning: no previous prototype for function 'phytium_drm_fbdev_fini' [-Wmissing-prototypes]
     139 | void phytium_drm_fbdev_fini(struct drm_device *dev)
         |      ^
   drivers/gpu/drm/phytium/phytium_fbdev.c:139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     139 | void phytium_drm_fbdev_fini(struct drm_device *dev)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/gpu/drm/phytium/phytium_debugfs.c:376:5: warning: no previous prototype for function 'phytium_debugfs_connector_add' [-Wmissing-prototypes]
     376 | int phytium_debugfs_connector_add(struct drm_connector *connector)
         |     ^
   drivers/gpu/drm/phytium/phytium_debugfs.c:376:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     376 | int phytium_debugfs_connector_add(struct drm_connector *connector)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_debugfs.c:438:5: warning: no previous prototype for function 'phytium_debugfs_display_register' [-Wmissing-prototypes]
     438 | int phytium_debugfs_display_register(struct phytium_display_private *priv)
         |     ^
   drivers/gpu/drm/phytium/phytium_debugfs.c:438:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     438 | int phytium_debugfs_display_register(struct phytium_display_private *priv)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/gpu/drm/phytium/px210_dp.c:852:6: warning: no previous prototype for function 'px210_dp_hw_spread_is_enable' [-Wmissing-prototypes]
     852 | bool px210_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/px210_dp.c:852:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     852 | bool px210_dp_hw_spread_is_enable(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/px210_dp.c:864:5: warning: no previous prototype for function 'px210_dp_hw_reset' [-Wmissing-prototypes]
     864 | int px210_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         |     ^
   drivers/gpu/drm/phytium/px210_dp.c:864:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     864 | int px210_dp_hw_reset(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/px210_dp.c:897:9: warning: no previous prototype for function 'px210_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     897 | uint8_t px210_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^
   drivers/gpu/drm/phytium/px210_dp.c:897:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     897 | uint8_t px210_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
   3 warnings generated.
..


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
    81	struct drm_plane_state *
  > 82	phytium_plane_atomic_duplicate_state(struct drm_plane *plane)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
