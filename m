Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB03F24BBEE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 14:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765637876; cv=none; b=TIbh9wZdca70lnbLc3szptaEeyhVwO+JYG8QijZ7b6KBFaMuWdQjHt5aNpCSu/+hx8tU8i0+g0k8k77gi6srCJMFS2PayXqhKh3F3QmL/uZ3TJSA6LY8nXoGWz2IZhR0ty5d+cSL6iZg7/pJVUueqrwCQt7vuWhSey5eVqZO9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765637876; c=relaxed/simple;
	bh=MjIop1/R8LxLjiX18+a1o6TiZYGW46oOWQRRHADni9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IESNWyI2YMsPOe9LosOswWXNr5pJCOEZ0yafrsGgDtM6KMk9ypWkcSdZ/J7T3EvurKTMNxT/3l7oK0ZFaF9fSJ+9mfnzjSuF4O0YCliFXDcLndjJi7J5+Mm2PrgqRuVRluLIz3UWbGUcGxWXDamtFVCE/npZwt3OW8dMU3wwpKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXdzteRI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXdzteRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765637874; x=1797173874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MjIop1/R8LxLjiX18+a1o6TiZYGW46oOWQRRHADni9w=;
  b=FXdzteRIdbIKY1ZQfX22b/YMsPvj+vF90Ch9/TJfi7pCOGceEvJsPqtO
   Beii4C450Qq+Voy+EUOopFdRtgS1Kmk8DZZEJnPb0D+PuzbbvE3JYs472
   KqkxEYoG6oPEJdIyqXqpZzfnJja43nQpyOnXyzxLETcRQzslI1sgF2O3s
   ynw5/SBel1K/tBb33PiOEfNrOtWGHWutr2ZYFwyn7Xk/hLWx4JxItjLPW
   4CJdnbqNNINMNXxWnEsICTiEoqrhMo/YQlbYJFGwHoxiI6e2pZOdfD4UF
   q2xwlDumOYu9hm2K22/4eNtklO7EyBxnnEQ2GmjsS6bXDVfLtsJkT32pH
   g==;
X-CSE-ConnectionGUID: PSMPDnMiS2aEFdQtpYC2Xg==
X-CSE-MsgGUID: hoz+vr50QDewcq+BI/NY0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78317177"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78317177"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:57:51 -0800
X-CSE-ConnectionGUID: e4IBhKVCQLW7skyCadsZIw==
X-CSE-MsgGUID: 8xorfRZGTpmK+66aN8Eqdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196400317"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Dec 2025 06:57:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUR47-000000007lf-0lyb;
	Sat, 13 Dec 2025 14:57:47 +0000
Date: Sat, 13 Dec 2025 22:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/gpu/drm/phytium/phytium_crtc.c:174:1: warning: no previous prototype
 for function 'phytium_crtc_atomic_duplicate_state'
Message-ID: <202512132253.yDHpZZhf-lkp@intel.com>
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
config: x86_64-randconfig-r134-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132253.yDHpZZhf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132253.yDHpZZhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132253.yDHpZZhf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/phytium/phytium_plane.c:30:6: warning: no previous prototype for function 'phytium_plane_destroy' [-Wmissing-prototypes]
      30 | void phytium_plane_destroy(struct drm_plane *plane)
         |      ^
   drivers/gpu/drm/phytium/phytium_plane.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | void phytium_plane_destroy(struct drm_plane *plane)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_plane.c:72:1: warning: no previous prototype for function 'phytium_plane_atomic_set_property' [-Wmissing-prototypes]
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
   drivers/gpu/drm/phytium/phytium_plane.c:103:1: warning: no previous prototype for function 'phytium_plane_atomic_destroy_state' [-Wmissing-prototypes]
     103 | phytium_plane_atomic_destroy_state(struct drm_plane *plane, struct drm_plane_state *state)
         | ^
   drivers/gpu/drm/phytium/phytium_plane.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | void
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_plane.c:392:20: warning: variable 'crtc_x' set but not used [-Wunused-but-set-variable]
     392 |         int src_x, src_y, crtc_x, crtc_y, crtc_w, crtc_h;
         |                           ^
   drivers/gpu/drm/phytium/phytium_plane.c:392:28: warning: variable 'crtc_y' set but not used [-Wunused-but-set-variable]
     392 |         int src_x, src_y, crtc_x, crtc_y, crtc_w, crtc_h;
         |                                   ^
   6 warnings generated.
--
>> drivers/gpu/drm/phytium/phytium_crtc.c:174:1: warning: no previous prototype for function 'phytium_crtc_atomic_duplicate_state' [-Wmissing-prototypes]
     174 | phytium_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
         | ^
   drivers/gpu/drm/phytium/phytium_crtc.c:173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     173 | struct drm_crtc_state *
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_crtc.c:189:1: warning: no previous prototype for function 'phytium_crtc_atomic_destroy_state' [-Wmissing-prototypes]
     189 | phytium_crtc_atomic_destroy_state(struct drm_crtc *crtc,
         | ^
   drivers/gpu/drm/phytium/phytium_crtc.c:188:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     188 | void
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_crtc.c:402:29: warning: variable 'phytium_crtc_state' set but not used [-Wunused-but-set-variable]
     402 |         struct phytium_crtc_state *phytium_crtc_state = NULL;
         |                                    ^
   3 warnings generated.
--
   drivers/gpu/drm/phytium/phytium_dp.c:506:6: warning: no previous prototype for function 'phytium_dp_coding_8b10b_need_enable' [-Wmissing-prototypes]
     506 | bool phytium_dp_coding_8b10b_need_enable(unsigned char test_pattern)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:506:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     506 | bool phytium_dp_coding_8b10b_need_enable(unsigned char test_pattern)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:523:6: warning: no previous prototype for function 'phytium_dp_scrambled_need_enable' [-Wmissing-prototypes]
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
   drivers/gpu/drm/phytium/phytium_dp.c:836:6: warning: no previous prototype for function 'phytium_dp_hw_video_is_enable' [-Wmissing-prototypes]
     836 | bool phytium_dp_hw_video_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:836:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     836 | bool phytium_dp_hw_video_is_enable(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:847:6: warning: no previous prototype for function 'phytium_dp_hw_enable_video' [-Wmissing-prototypes]
     847 | void phytium_dp_hw_enable_video(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:847:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     847 | void phytium_dp_hw_enable_video(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:859:6: warning: no previous prototype for function 'phytium_dp_hw_config_video' [-Wmissing-prototypes]
     859 | void phytium_dp_hw_config_video(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:859:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     859 | void phytium_dp_hw_config_video(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:951:6: warning: no previous prototype for function 'phytium_dp_hw_disable_output' [-Wmissing-prototypes]
     951 | void phytium_dp_hw_disable_output(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:951:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     951 | void phytium_dp_hw_disable_output(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:963:6: warning: no previous prototype for function 'phytium_dp_hw_enable_output' [-Wmissing-prototypes]
     963 | void phytium_dp_hw_enable_output(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:963:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     963 | void phytium_dp_hw_enable_output(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:975:6: warning: no previous prototype for function 'phytium_dp_hw_enable_input_source' [-Wmissing-prototypes]
     975 | void phytium_dp_hw_enable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:975:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     975 | void phytium_dp_hw_enable_input_source(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:986:6: warning: no previous prototype for function 'phytium_dp_hw_disable_input_source' [-Wmissing-prototypes]
     986 | void phytium_dp_hw_disable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:986:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     986 | void phytium_dp_hw_disable_input_source(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:996:6: warning: no previous prototype for function 'phytium_dp_hw_output_is_enable' [-Wmissing-prototypes]
     996 | bool phytium_dp_hw_output_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:996:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     996 | bool phytium_dp_hw_output_is_enable(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1033:6: warning: no previous prototype for function 'phytium_dp_hw_hpd_irq_setup' [-Wmissing-prototypes]
    1033 | void phytium_dp_hw_hpd_irq_setup(struct phytium_dp_device *phytium_dp, bool enable)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:1033:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1033 | void phytium_dp_hw_hpd_irq_setup(struct phytium_dp_device *phytium_dp, bool enable)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:1048:5: warning: no previous prototype for function 'phytium_dp_hw_init' [-Wmissing-prototypes]
    1048 | int phytium_dp_hw_init(struct phytium_dp_device *phytium_dp)
         |     ^
   drivers/gpu/drm/phytium/phytium_dp.c:1048:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1048 | int phytium_dp_hw_init(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:1226:6: warning: no previous prototype for function 'phytium_dp_dpcd_sink_dpms' [-Wmissing-prototypes]
    1226 | void phytium_dp_dpcd_sink_dpms(struct phytium_dp_device *phytium_dp, int mode)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:1226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1226 | void phytium_dp_dpcd_sink_dpms(struct phytium_dp_device *phytium_dp, int mode)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1451:5: warning: no previous prototype for function 'phytium_dp_get_link_train_fallback_values' [-Wmissing-prototypes]
    1451 | int phytium_dp_get_link_train_fallback_values(struct phytium_dp_device *phytium_dp)
         |     ^
   drivers/gpu/drm/phytium/phytium_dp.c:1451:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1451 | int phytium_dp_get_link_train_fallback_values(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1500:5: warning: no previous prototype for function 'phytium_dp_start_link_train' [-Wmissing-prototypes]
    1500 | int phytium_dp_start_link_train(struct phytium_dp_device *phytium_dp)
         |     ^
   drivers/gpu/drm/phytium/phytium_dp.c:1500:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1500 | int phytium_dp_start_link_train(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1815:6: warning: no previous prototype for function 'phytium_dp_hpd_poll_handler' [-Wmissing-prototypes]
    1815 | void phytium_dp_hpd_poll_handler(struct phytium_display_private *priv)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:1815:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1815 | void phytium_dp_hpd_poll_handler(struct phytium_display_private *priv)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:1962:6: warning: no previous prototype for function 'phytium_dp_fast_link_train' [-Wmissing-prototypes]
    1962 | bool phytium_dp_fast_link_train(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:1962:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1962 | bool phytium_dp_fast_link_train(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:2153:6: warning: no previous prototype for function 'phytium_dp_adjust_link_train_parameter' [-Wmissing-prototypes]
    2153 | void phytium_dp_adjust_link_train_parameter(struct phytium_dp_device *phytium_dp)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:2153:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2153 | void phytium_dp_adjust_link_train_parameter(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:2213:1: warning: no previous prototype for function 'phytium_encoder_mode_valid' [-Wmissing-prototypes]
    2213 | phytium_encoder_mode_valid(struct drm_encoder *encoder, const struct drm_display_mode *mode)
         | ^
   drivers/gpu/drm/phytium/phytium_dp.c:2212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2212 | enum drm_mode_status
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_dp.c:2269:6: warning: no previous prototype for function 'phytium_dp_encoder_destroy' [-Wmissing-prototypes]
    2269 | void phytium_dp_encoder_destroy(struct drm_encoder *encoder)
         |      ^
   drivers/gpu/drm/phytium/phytium_dp.c:2269:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2269 | void phytium_dp_encoder_destroy(struct drm_encoder *encoder)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_dp.c:2482:5: warning: no previous prototype for function 'phytium_get_encoder_crtc_mask' [-Wmissing-prototypes]
    2482 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         |     ^
   drivers/gpu/drm/phytium/phytium_dp.c:2482:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2482 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         | ^
         | static 
   23 warnings generated.
--
   drivers/gpu/drm/phytium/phytium_gem.c:22:5: warning: no previous prototype for function 'phytium_memory_pool_alloc' [-Wmissing-prototypes]
      22 | int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
         |     ^
   drivers/gpu/drm/phytium/phytium_gem.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      22 | int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_gem.c:37:6: warning: no previous prototype for function 'phytium_memory_pool_free' [-Wmissing-prototypes]
      37 | void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         |      ^
   drivers/gpu/drm/phytium/phytium_gem.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_gem.c:161:5: warning: no previous prototype for function 'phytium_gem_prime_vmap' [-Wmissing-prototypes]
     161 | int phytium_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
         |     ^
   drivers/gpu/drm/phytium/phytium_gem.c:161:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     161 | int phytium_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_gem.c:170:6: warning: no previous prototype for function 'phytium_gem_prime_vunmap' [-Wmissing-prototypes]
     170 | void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
         |      ^
   drivers/gpu/drm/phytium/phytium_gem.c:170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     170 | void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_gem.c:174:5: warning: no previous prototype for function 'phytium_gem_prime_mmap' [-Wmissing-prototypes]
     174 | int phytium_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
         |     ^
   drivers/gpu/drm/phytium/phytium_gem.c:174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     174 | int phytium_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_gem.c:186:5: warning: no previous prototype for function 'phytium_dma_transfer' [-Wmissing-prototypes]
     186 | int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
         |     ^
   drivers/gpu/drm/phytium/phytium_gem.c:186:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     186 | int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
         | ^
         | static 
   6 warnings generated.
--
>> drivers/gpu/drm/phytium/phytium_fbdev.c:108:5: warning: no previous prototype for function 'phytium_drm_fbdev_init' [-Wmissing-prototypes]
     108 | int phytium_drm_fbdev_init(struct drm_device *dev)
         |     ^
   drivers/gpu/drm/phytium/phytium_fbdev.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     108 | int phytium_drm_fbdev_init(struct drm_device *dev)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_fbdev.c:130:6: warning: no previous prototype for function 'phytium_drm_fbdev_fini' [-Wmissing-prototypes]
     130 | void phytium_drm_fbdev_fini(struct drm_device *dev)
         |      ^
   drivers/gpu/drm/phytium/phytium_fbdev.c:130:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     130 | void phytium_drm_fbdev_fini(struct drm_device *dev)
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
   drivers/gpu/drm/phytium/phytium_debugfs.c:438:5: warning: no previous prototype for function 'phytium_debugfs_display_register' [-Wmissing-prototypes]
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
   drivers/gpu/drm/phytium/px210_dp.c:897:9: warning: no previous prototype for function 'px210_dp_hw_get_source_lane_count' [-Wmissing-prototypes]
     897 | uint8_t px210_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         |         ^
   drivers/gpu/drm/phytium/px210_dp.c:897:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     897 | uint8_t px210_dp_hw_get_source_lane_count(struct phytium_dp_device *phytium_dp)
         | ^
         | static 
   3 warnings generated.
..

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/phytium/pe220x_dp.c:465:6: sparse: sparse: symbol 'pe220x_dp_hw_spread_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/pe220x_dp.c:470:5: sparse: sparse: symbol 'pe220x_dp_hw_reset' was not declared. Should it be static?
   drivers/gpu/drm/phytium/pe220x_dp.c:485:9: sparse: sparse: symbol 'pe220x_dp_hw_get_source_lane_count' was not declared. Should it be static?
--
   drivers/gpu/drm/phytium/phytium_pci.c:20:5: sparse: sparse: symbol 'dc_msi_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_pci.c:24:6: sparse: sparse: symbol 'phytium_pci_vram_hw_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:57:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/phytium/phytium_pci.c:57:46: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:57:46: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/phytium/phytium_pci.c:61:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/phytium/phytium_pci.c:61:46: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:61:46: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/phytium/phytium_pci.c:88:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_pci.c:88:38: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_pci.c:88:38: sparse:     got void *pool_virt_addr
>> drivers/gpu/drm/phytium/phytium_pci.c:49:5: sparse: sparse: symbol 'phytium_pci_vram_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:98:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_pci.c:98:46: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_pci.c:98:46: sparse:     got void *pool_virt_addr
>> drivers/gpu/drm/phytium/phytium_pci.c:93:6: sparse: sparse: symbol 'phytium_pci_vram_fini' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:115:5: sparse: sparse: symbol 'phytium_pci_dma_init' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_pci.c:163:6: sparse: sparse: symbol 'phytium_pci_dma_fini' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_panel.c:234:6: sparse: sparse: symbol 'phytium_dp_panel_release_backlight_funcs' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_fbdev.c:91:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void * @@
   drivers/gpu/drm/phytium/phytium_fbdev.c:91:26: sparse:     expected char [noderef] __iomem *screen_base
   drivers/gpu/drm/phytium/phytium_fbdev.c:91:26: sparse:     got void *
>> drivers/gpu/drm/phytium/phytium_fbdev.c:29:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/phytium/phytium_fbdev.c:31:10: sparse:   also defined here
--
>> drivers/gpu/drm/phytium/phytium_plane.c:30:6: sparse: sparse: symbol 'phytium_plane_destroy' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_plane.c:72:1: sparse: sparse: symbol 'phytium_plane_atomic_set_property' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_plane.c:81:24: sparse: sparse: symbol 'phytium_plane_atomic_duplicate_state' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:103:1: sparse: sparse: symbol 'phytium_plane_atomic_destroy_state' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:140:30: sparse: sparse: symbol 'phytium_plane_funcs' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_plane.c:543:37: sparse: sparse: symbol 'phytium_plane_helper_funcs' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_gem.c:22:5: sparse: sparse: symbol 'phytium_memory_pool_alloc' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_gem.c:37:6: sparse: sparse: symbol 'phytium_memory_pool_free' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_gem.c:161:5: sparse: sparse: symbol 'phytium_gem_prime_vmap' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_gem.c:170:6: sparse: sparse: symbol 'phytium_gem_prime_vunmap' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_gem.c:174:5: sparse: sparse: symbol 'phytium_gem_prime_mmap' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_gem.c:186:5: sparse: sparse: symbol 'phytium_dma_transfer' was not declared. Should it be static?
--
   drivers/gpu/drm/phytium/phytium_platform.c:35:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/phytium/phytium_platform.c:35:38: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_platform.c:35:38: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/phytium/phytium_platform.c:58:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_platform.c:58:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_platform.c:58:21: sparse:     got void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_platform.c:22:5: sparse: sparse: symbol 'phytium_platform_carveout_mem_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_platform.c:68:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_platform.c:68:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_platform.c:68:29: sparse:     got void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_platform.c:63:6: sparse: sparse: symbol 'phytium_platform_carveout_mem_fini' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_platform.c:372:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/phytium/phytium_platform.c:380:10: sparse:   also defined here
--
>> drivers/gpu/drm/phytium/phytium_crtc.c:173:23: sparse: sparse: symbol 'phytium_crtc_atomic_duplicate_state' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_crtc.c:189:1: sparse: sparse: symbol 'phytium_crtc_atomic_destroy_state' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/px210_dp.c:852:6: sparse: sparse: symbol 'px210_dp_hw_spread_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/px210_dp.c:864:5: sparse: sparse: symbol 'px210_dp_hw_reset' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/px210_dp.c:897:9: sparse: sparse: symbol 'px210_dp_hw_get_source_lane_count' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_dp.c:506:6: sparse: sparse: symbol 'phytium_dp_coding_8b10b_need_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:523:6: sparse: sparse: symbol 'phytium_dp_scrambled_need_enable' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:656:6: sparse: sparse: symbol 'phytium_dp_hw_enable_audio' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:825:6: sparse: sparse: symbol 'phytium_dp_hw_disable_video' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:836:6: sparse: sparse: symbol 'phytium_dp_hw_video_is_enable' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:847:6: sparse: sparse: symbol 'phytium_dp_hw_enable_video' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:859:6: sparse: sparse: symbol 'phytium_dp_hw_config_video' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:951:6: sparse: sparse: symbol 'phytium_dp_hw_disable_output' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:963:6: sparse: sparse: symbol 'phytium_dp_hw_enable_output' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:975:6: sparse: sparse: symbol 'phytium_dp_hw_enable_input_source' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:986:6: sparse: sparse: symbol 'phytium_dp_hw_disable_input_source' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:996:6: sparse: sparse: symbol 'phytium_dp_hw_output_is_enable' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:1033:6: sparse: sparse: symbol 'phytium_dp_hw_hpd_irq_setup' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1048:5: sparse: sparse: symbol 'phytium_dp_hw_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:1226:6: sparse: sparse: symbol 'phytium_dp_dpcd_sink_dpms' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:1451:5: sparse: sparse: symbol 'phytium_dp_get_link_train_fallback_values' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1500:5: sparse: sparse: symbol 'phytium_dp_start_link_train' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1815:6: sparse: sparse: symbol 'phytium_dp_hpd_poll_handler' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1962:6: sparse: sparse: symbol 'phytium_dp_fast_link_train' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:2153:6: sparse: sparse: symbol 'phytium_dp_adjust_link_train_parameter' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:2213:1: sparse: sparse: symbol 'phytium_encoder_mode_valid' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:2269:6: sparse: sparse: symbol 'phytium_dp_encoder_destroy' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:2482:5: sparse: sparse: symbol 'phytium_get_encoder_crtc_mask' was not declared. Should it be static?

vim +/phytium_crtc_atomic_duplicate_state +174 drivers/gpu/drm/phytium/phytium_crtc.c

b80df10f845813 lishuo 2024-01-31  172  
b80df10f845813 lishuo 2024-01-31 @173  struct drm_crtc_state *
b80df10f845813 lishuo 2024-01-31 @174  phytium_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
b80df10f845813 lishuo 2024-01-31  175  {
b80df10f845813 lishuo 2024-01-31  176  	struct phytium_crtc_state *phytium_crtc_state = NULL;
b80df10f845813 lishuo 2024-01-31  177  
b80df10f845813 lishuo 2024-01-31  178  	phytium_crtc_state = kmemdup(crtc->state, sizeof(*phytium_crtc_state),
b80df10f845813 lishuo 2024-01-31  179  				     GFP_KERNEL);
b80df10f845813 lishuo 2024-01-31  180  	if (!phytium_crtc_state)
b80df10f845813 lishuo 2024-01-31  181  		return NULL;
b80df10f845813 lishuo 2024-01-31  182  	__drm_atomic_helper_crtc_duplicate_state(crtc,
b80df10f845813 lishuo 2024-01-31  183  						 &phytium_crtc_state->base);
b80df10f845813 lishuo 2024-01-31  184  
b80df10f845813 lishuo 2024-01-31  185  	return &phytium_crtc_state->base;
b80df10f845813 lishuo 2024-01-31  186  }
b80df10f845813 lishuo 2024-01-31  187  
b80df10f845813 lishuo 2024-01-31  188  void
b80df10f845813 lishuo 2024-01-31 @189  phytium_crtc_atomic_destroy_state(struct drm_crtc *crtc,
b80df10f845813 lishuo 2024-01-31  190  					       struct drm_crtc_state *state)
b80df10f845813 lishuo 2024-01-31  191  {
b80df10f845813 lishuo 2024-01-31  192  	struct phytium_crtc_state *phytium_crtc_state =
b80df10f845813 lishuo 2024-01-31  193  					to_phytium_crtc_state(state);
b80df10f845813 lishuo 2024-01-31  194  
b80df10f845813 lishuo 2024-01-31  195  	phytium_crtc_state = to_phytium_crtc_state(state);
b80df10f845813 lishuo 2024-01-31  196  	__drm_atomic_helper_crtc_destroy_state(state);
b80df10f845813 lishuo 2024-01-31  197  	kfree(phytium_crtc_state);
b80df10f845813 lishuo 2024-01-31  198  }
b80df10f845813 lishuo 2024-01-31  199  

:::::: The code at line 174 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
