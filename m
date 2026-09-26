Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1292D31A7E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790408520; cv=none; b=huSRmcFWElOVPHV/5sBpGOZ4ltfu0KocwiVDC60hCGdArrElNGK8Uu4TCfdCD3RqECQ3BB1q3e7Z1OwSaUZAx6OBi3Ti+8kGDjM571xYpJk2e2FajOjhrWtwECNQD0GSFTzjooGB2wXLCKnJeIbryLeRFOx94sy/TFOyBTz49kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790408520; c=relaxed/simple;
	bh=5DBa1UdU+aGyQThn69ChXZmXf+loGasl032kepwu0K4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VNxZ2jyu/68s2t28FEYmbQ90Y7XNy8/4wcIL0FC3/gnf2hXoR3u61I9ybVA8uMgJIghNCZRWcSGmKnwmSsipSdltQnvYhUjf+iz8H5L5a+ZOWFFlGrig/4gmqiNkyci1pW3jycMm+726kyckRxT63Ri3DQfgH/JJPPuz77zIocQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBu22OSr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBu22OSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790408517; x=1821944517;
  h=date:from:to:cc:subject:message-id;
  bh=5DBa1UdU+aGyQThn69ChXZmXf+loGasl032kepwu0K4=;
  b=PBu22OSrmbtGDWjUmB9U3cKo68pKGL9KwwfZqPO3TMBGy8WA2T5MKCUK
   AX2XCIQubTabT29tEYvKjt4S4Gaw0QhWi3BtbkDPI9KSg/gQD/mLoMg3t
   YFGgtkcatY5kfQ3O74AKMNjEjn20l3MdzoghEqGYxtARSc/fP23xJX3nG
   0zfxYqzSn3dEFHts1tHoyDSV30kcf/rPblm6ETLZshe+3WhuBPaYYg6pY
   THLFdietem5SRxPWZQ2S2f7YEWyOKyV6fJXHV3WW9UnceBPktO7K1uZ8V
   b4t7sHaC8xj7wE1hVxtvFgfWYI3kcZtheuFjxKw5Z7OM5WbSwiwGZX1xx
   A==;
X-CSE-ConnectionGUID: 0pM3dezrQdCuatP6WHMYLw==
X-CSE-MsgGUID: hoCkHQPmSq2h6Vf3xNehEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="95001142"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="95001142"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 00:41:56 -0700
X-CSE-ConnectionGUID: 8sMmF5fZSWGNRY2wYGin8w==
X-CSE-MsgGUID: urStrIErSGeA7jGZd7Yrwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="273736350"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Sep 2026 00:41:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAN2d-00000000LdF-30qR;
	Sat, 26 Sep 2026 07:41:51 +0000
Date: Sat, 26 Sep 2026 15:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gaghik Khachatrian <gaghik.khachatrian@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Subject: [linux-next:master 489/9480]
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3322:13:
 warning: 'program_output_csc' defined but not used
Message-ID: <202609261508.2qIhWjuX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: cd2cfe4d1504342b37c3170d290aa8168deff6d7 [489/9480] drm/amd/display: gate DCE ASIC code behind CONFIG_DRM_AMD_DC_DCE
config: um-randconfig-1000-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261508.2qIhWjuX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261508.2qIhWjuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261508.2qIhWjuX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3512:13: warning: 'dce110_enable_analog_link_output' defined but not used [-Wunused-function]
    3512 | static void dce110_enable_analog_link_output(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3393:13: warning: 'dce110_set_cursor_attribute' defined but not used [-Wunused-function]
    3393 | static void dce110_set_cursor_attribute(struct pipe_ctx *pipe_ctx)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3348:13: warning: 'dce110_set_cursor_position' defined but not used [-Wunused-function]
    3348 | static void dce110_set_cursor_position(struct pipe_ctx *pipe_ctx)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3322:13: warning: 'program_output_csc' defined but not used [-Wunused-function]
    3322 | static void program_output_csc(struct dc *dc,
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3311:13: warning: 'dce110_wait_for_mpcc_disconnect' defined but not used [-Wunused-function]
    3311 | static void dce110_wait_for_mpcc_disconnect(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3293:13: warning: 'dce110_power_down_fe' defined but not used [-Wunused-function]
    3293 | static void dce110_power_down_fe(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx)
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3285:13: warning: 'dce110_post_unlock_program_front_end' defined but not used [-Wunused-function]
    3285 | static void dce110_post_unlock_program_front_end(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3245:13: warning: 'dce110_apply_ctx_for_surface' defined but not used [-Wunused-function]
    3245 | static void dce110_apply_ctx_for_surface(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3027:13: warning: 'dce110_init_hw' defined but not used [-Wunused-function]
    3027 | static void dce110_init_hw(struct dc *dc)
         |             ^~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3020:13: warning: 'dce110_init_pipes' defined but not used [-Wunused-function]
    3020 | static void dce110_init_pipes(struct dc *dc, struct dc_state *context)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:2987:13: warning: 'dce110_enable_per_frame_crtc_position_reset' defined but not used [-Wunused-function]
    2987 | static void dce110_enable_per_frame_crtc_position_reset(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:2938:13: warning: 'dce110_enable_timing_synchronization' defined but not used [-Wunused-function]
    2938 | static void dce110_enable_timing_synchronization(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:2872:13: warning: 'dce110_update_pending_status' defined but not used [-Wunused-function]
    2872 | static void dce110_update_pending_status(struct pipe_ctx *pipe_ctx)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:2855:13: warning: 'update_plane_addr' defined but not used [-Wunused-function]
    2855 | static void update_plane_addr(const struct dc *dc,
         |             ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:2834:13: warning: 'program_gamut_remap' defined but not used [-Wunused-function]
    2834 | static void program_gamut_remap(struct program_gamut_remap_params *params)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:2451:13: warning: 'dce110_reset_hw_ctx_wrap' defined but not used [-Wunused-function]
    2451 | static void dce110_reset_hw_ctx_wrap(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:2331:13: warning: 'set_static_screen_control' defined but not used [-Wunused-function]
    2331 | static void set_static_screen_control(struct pipe_ctx **pipe_ctx,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:2319:13: warning: 'get_position' defined but not used [-Wunused-function]
    2319 | static void get_position(struct pipe_ctx **pipe_ctx,
         |             ^~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:2285:13: warning: 'set_drr' defined but not used [-Wunused-function]
    2285 | static void set_drr(struct pipe_ctx **pipe_ctx,
         |             ^~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:1633:23: warning: 'dce110_enable_stream_timing' defined but not used [-Wunused-function]
    1633 | static enum dc_status dce110_enable_stream_timing(
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:709:1: warning: 'dce110_dac_load_detect' defined but not used [-Wunused-function]
     709 | dce110_dac_load_detect(struct dc_link *link)
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:702:1: warning: 'dce110_prepare_ddc' defined but not used [-Wunused-function]
     702 | dce110_prepare_ddc(struct dc_link *link)
         | ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:610:1: warning: 'dce110_set_output_transfer_func' defined but not used [-Wunused-function]
     610 | dce110_set_output_transfer_func(struct set_output_transfer_func_params *params)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:286:1: warning: 'dce110_set_input_transfer_func' defined but not used [-Wunused-function]
     286 | dce110_set_input_transfer_func(struct dc *dc, struct pipe_ctx *pipe_ctx,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:209:13: warning: 'dce110_enable_display_power_gating' defined but not used [-Wunused-function]
     209 | static bool dce110_enable_display_power_gating(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/program_output_csc +3322 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c

4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3244  
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12 @3245  static void dce110_apply_ctx_for_surface(
fb3466a450cc468 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Bhawanpreet Lakha   2017-08-01  3246  		struct dc *dc,
3e9ad6164b98f82 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-08-03  3247  		const struct dc_stream_state *stream,
3e9ad6164b98f82 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-08-03  3248  		int num_planes,
608ac7bb3924178 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jerry Zuo           2017-08-25  3249  		struct dc_state *context)
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3250  {
64b4c4cdfddd31d drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-04-21  3251  	unsigned int i;
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3252  
3e9ad6164b98f82 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-08-03  3253  	if (num_planes == 0)
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3254  		return;
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3255  
65d38262b3e82fc drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c hersen wu           2018-10-30  3256  	if (dc->fbc_compressor)
65d38262b3e82fc drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c hersen wu           2018-10-30  3257  		dc->fbc_compressor->funcs->disable_fbc(dc->fbc_compressor);
65d38262b3e82fc drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c hersen wu           2018-10-30  3258  
a2b8659db9b4358 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Tony Cheng          2017-04-22  3259  	for (i = 0; i < dc->res_pool->pipe_count; i++) {
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3260  		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3261  
a2607aef3d02108 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-08-08  3262  		if (pipe_ctx->stream != stream)
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3263  			continue;
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3264  
3b21b6d239f43c0 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jerry Zuo           2017-10-17  3265  		/* Need to allocate mem before program front end for Fiji */
3b21b6d239f43c0 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jerry Zuo           2017-10-17  3266  		pipe_ctx->plane_res.mi->funcs->allocate_mem_input(
3b21b6d239f43c0 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jerry Zuo           2017-10-17  3267  				pipe_ctx->plane_res.mi,
3b21b6d239f43c0 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jerry Zuo           2017-10-17  3268  				pipe_ctx->stream->timing.h_total,
3b21b6d239f43c0 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jerry Zuo           2017-10-17  3269  				pipe_ctx->stream->timing.v_total,
380604e27bc9c26 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Ken Chalmers        2018-11-06  3270  				pipe_ctx->stream->timing.pix_clk_100hz / 10,
3b21b6d239f43c0 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jerry Zuo           2017-10-17  3271  				context->stream_count);
3b21b6d239f43c0 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jerry Zuo           2017-10-17  3272  
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3273  		dce110_program_front_end_for_pipe(dc, pipe_ctx);
4f804817d5cfb4b drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2017-11-09  3274  
4f804817d5cfb4b drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2017-11-09  3275  		dc->hwss.update_plane_addr(dc, pipe_ctx);
4f804817d5cfb4b drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2017-11-09  3276  
b06b7680e341151 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Leon Elazar         2017-01-05  3277  		program_surface_visibility(dc, pipe_ctx);
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3278  
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3279  	}
3dc780ec3473200 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2017-10-17  3280  
65d38262b3e82fc drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c hersen wu           2018-10-30  3281  	if (dc->fbc_compressor)
12a8bd8862ebd7d drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Shirish S           2019-02-04  3282  		enable_fbc(dc, context);
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3283  }
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3284  
bbf5f6c3f83bedd drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Anthony Koo         2020-01-14 @3285  static void dce110_post_unlock_program_front_end(
bbf5f6c3f83bedd drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Anthony Koo         2020-01-14  3286  		struct dc *dc,
bbf5f6c3f83bedd drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Anthony Koo         2020-01-14  3287  		struct dc_state *context)
bbf5f6c3f83bedd drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Anthony Koo         2020-01-14  3288  {
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3289  	(void)dc;
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3290  	(void)context;
bbf5f6c3f83bedd drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Anthony Koo         2020-01-14  3291  }
009114f6df84150 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Anthony Koo         2020-01-14  3292  
012a04b1d6af629 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Dillon Varone       2023-11-21 @3293  static void dce110_power_down_fe(struct dc *dc, struct dc_state *state, struct pipe_ctx *pipe_ctx)
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3294  {
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3295  	(void)state;
f42ea55be111476 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Anthony Koo         2019-11-05  3296  	struct dce_hwseq *hws = dc->hwseq;
bc373a890f14958 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Roman Li            2017-12-29  3297  	int fe_idx = pipe_ctx->plane_res.mi ?
bc373a890f14958 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Roman Li            2017-12-29  3298  		pipe_ctx->plane_res.mi->inst : pipe_ctx->pipe_idx;
e6c258cb4e6fbc7 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2017-10-30  3299  
7950f0f9815a2dc drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Dmytro Laktyushkin  2017-06-13  3300  	/* Do not power down fe when stream is active on dce*/
608ac7bb3924178 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jerry Zuo           2017-08-25  3301  	if (dc->current_state->res_ctx.pipe_ctx[fe_idx].stream)
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3302  		return;
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3303  
f42ea55be111476 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Anthony Koo         2019-11-05  3304  	hws->funcs.enable_display_power_gating(
f4cdbb5d5405783 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-31  3305  		dc, (uint8_t)fe_idx, dc->ctx->dc_bios, PIPE_GATING_CONTROL_ENABLE);
cfe4645e17f8dbe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Dmytro Laktyushkin  2017-06-14  3306  
cfe4645e17f8dbe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Dmytro Laktyushkin  2017-06-14  3307  	dc->res_pool->transforms[fe_idx]->funcs->transform_reset(
cfe4645e17f8dbe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Dmytro Laktyushkin  2017-06-14  3308  				dc->res_pool->transforms[fe_idx]);
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3309  }
4562236b3bc0a28 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2017-09-12  3310  
6be425f3dc16bac drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-07-24 @3311  static void dce110_wait_for_mpcc_disconnect(
fb3466a450cc468 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Bhawanpreet Lakha   2017-08-01  3312  		struct dc *dc,
6be425f3dc16bac drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-07-24  3313  		struct resource_pool *res_pool,
6be425f3dc16bac drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-07-24  3314  		struct pipe_ctx *pipe_ctx)
b6762f0c16a43c3 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-07-24  3315  {
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3316  	(void)dc;
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3317  	(void)res_pool;
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3318  	(void)pipe_ctx;
b6762f0c16a43c3 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-07-24  3319  	/* do nothing*/
b6762f0c16a43c3 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-07-24  3320  }
b6762f0c16a43c3 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2017-07-24  3321  
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10 @3322  static void program_output_csc(struct dc *dc,
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3323  		struct pipe_ctx *pipe_ctx,
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3324  		enum dc_color_space colorspace,
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3325  		uint16_t *matrix,
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3326  		int opp_id)
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3327  {
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3328  	(void)dc;
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3329  	(void)colorspace;
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3330  	(void)matrix;
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3331  	(void)opp_id;
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3332  	int i;
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3333  	struct out_csc_color_matrix tbl_entry;
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3334  
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3335  	if (pipe_ctx->stream->csc_color_matrix.enable_adjustment == true) {
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3336  		enum dc_color_space color_space = pipe_ctx->stream->output_color_space;
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3337  
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3338  		for (i = 0; i < 12; i++)
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3339  			tbl_entry.regval[i] = pipe_ctx->stream->csc_color_matrix.matrix[i];
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3340  
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3341  		tbl_entry.color_space = color_space;
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3342  
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3343  		pipe_ctx->plane_res.xfm->funcs->opp_set_csc_adjustment(
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3344  				pipe_ctx->plane_res.xfm, &tbl_entry);
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3345  	}
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3346  }
4bd0dc68fd00f41 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Joshua Aberback     2018-12-10  3347  
faf0389f1e4004b drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jason Yan           2020-09-28 @3348  static void dce110_set_cursor_position(struct pipe_ctx *pipe_ctx)
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3349  {
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3350  	struct dc_cursor_position pos_cpy = pipe_ctx->stream->cursor_position;
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3351  	struct input_pixel_processor *ipp = pipe_ctx->plane_res.ipp;
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3352  	struct mem_input *mi = pipe_ctx->plane_res.mi;
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3353  	struct dc_cursor_mi_param param = {
380604e27bc9c26 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Ken Chalmers        2018-11-06  3354  		.pixel_clk_khz = pipe_ctx->stream->timing.pix_clk_100hz / 10,
33d7598d7022eac drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jun Lei             2019-02-22  3355  		.ref_clk_khz = pipe_ctx->stream->ctx->dc->res_pool->ref_clocks.xtalin_clock_inKhz,
39a9f4d89e123b6 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Dmytro Laktyushkin  2018-06-19  3356  		.viewport = pipe_ctx->plane_res.scl_data.viewport,
39a9f4d89e123b6 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Dmytro Laktyushkin  2018-06-19  3357  		.h_scale_ratio = pipe_ctx->plane_res.scl_data.ratios.horz,
39a9f4d89e123b6 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Dmytro Laktyushkin  2018-06-19  3358  		.v_scale_ratio = pipe_ctx->plane_res.scl_data.ratios.vert,
08ed681c8453c29 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Dmytro Laktyushkin  2018-06-21  3359  		.rotation = pipe_ctx->plane_state->rotation,
08ed681c8453c29 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Dmytro Laktyushkin  2018-06-21  3360  		.mirror = pipe_ctx->plane_state->horizontal_mirror
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3361  	};
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3362  
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3363  	/**
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3364  	 * If the cursor's source viewport is clipped then we need to
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3365  	 * translate the cursor to appear in the correct position on
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3366  	 * the screen.
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3367  	 *
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3368  	 * This translation isn't affected by scaling so it needs to be
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3369  	 * done *after* we adjust the position for the scale factor.
033baeeefbf0884 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3370  	 *
033baeeefbf0884 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3371  	 * This is only done by opt-in for now since there are still
033baeeefbf0884 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3372  	 * some usecases like tiled display that might enable the
033baeeefbf0884 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3373  	 * cursor on both streams while expecting dc to clip it.
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3374  	 */
033baeeefbf0884 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3375  	if (pos_cpy.translate_by_source) {
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3376  		pos_cpy.x += pipe_ctx->plane_state->src_rect.x;
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3377  		pos_cpy.y += pipe_ctx->plane_state->src_rect.y;
033baeeefbf0884 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3378  	}
03a4059b8dddf6a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Nicholas Kazlauskas 2020-04-05  3379  
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3380  	if (pipe_ctx->plane_state->address.type
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3381  			== PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3382  		pos_cpy.enable = false;
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3383  
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3384  	if (pipe_ctx->top_pipe && pipe_ctx->plane_state != pipe_ctx->top_pipe->plane_state)
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3385  		pos_cpy.enable = false;
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3386  
dc75dd707cb558b drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Roman Li            2018-01-23  3387  	if (ipp->funcs->ipp_cursor_set_position)
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3388  		ipp->funcs->ipp_cursor_set_position(ipp, &pos_cpy, &param);
dc75dd707cb558b drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Roman Li            2018-01-23  3389  	if (mi->funcs->set_cursor_position)
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3390  		mi->funcs->set_cursor_position(mi, &pos_cpy, &param);
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3391  }
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3392  
faf0389f1e4004b drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Jason Yan           2020-09-28 @3393  static void dce110_set_cursor_attribute(struct pipe_ctx *pipe_ctx)
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3394  {
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3395  	struct dc_cursor_attributes *attributes = &pipe_ctx->stream->cursor_attributes;
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3396  
d1aaad05d0c39c8 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2018-03-02  3397  	if (pipe_ctx->plane_res.ipp &&
d1aaad05d0c39c8 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2018-03-02  3398  	    pipe_ctx->plane_res.ipp->funcs->ipp_cursor_set_attributes)
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3399  		pipe_ctx->plane_res.ipp->funcs->ipp_cursor_set_attributes(
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3400  				pipe_ctx->plane_res.ipp, attributes);
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3401  
d1aaad05d0c39c8 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2018-03-02  3402  	if (pipe_ctx->plane_res.mi &&
d1aaad05d0c39c8 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2018-03-02  3403  	    pipe_ctx->plane_res.mi->funcs->set_cursor_attributes)
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3404  		pipe_ctx->plane_res.mi->funcs->set_cursor_attributes(
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3405  				pipe_ctx->plane_res.mi, attributes);
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3406  
d1aaad05d0c39c8 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2018-03-02  3407  	if (pipe_ctx->plane_res.xfm &&
d1aaad05d0c39c8 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Harry Wentland      2018-03-02  3408  	    pipe_ctx->plane_res.xfm->funcs->set_cursor_attributes)
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3409  		pipe_ctx->plane_res.xfm->funcs->set_cursor_attributes(
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3410  				pipe_ctx->plane_res.xfm, attributes);
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3411  }
33fd17d9125c008 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Eric Yang           2018-01-18  3412  
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3413  bool dce110_set_backlight_level(struct pipe_ctx *pipe_ctx,
38077562e0594a2 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Kaitlyn Tse         2024-10-03  3414  	struct set_backlight_level_params *backlight_level_params)
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3415  {
38077562e0594a2 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Kaitlyn Tse         2024-10-03  3416  	uint32_t backlight_pwm_u16_16 = backlight_level_params->backlight_pwm_u16_16;
38077562e0594a2 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Kaitlyn Tse         2024-10-03  3417  	uint32_t frame_ramp = backlight_level_params->frame_ramp;
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3418  	struct dc_link *link = pipe_ctx->stream->link;
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3419  	struct dc  *dc = link->ctx->dc;
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3420  	struct abm *abm = pipe_ctx->stream_res.abm;
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3421  	struct panel_cntl *panel_cntl = link->panel_cntl;
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3422  	struct dmcu *dmcu = dc->res_pool->dmcu;
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3423  	bool fw_set_brightness = true;
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3424  	/* DMCU -1 for all controller id values,
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3425  	 * therefore +1 here
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3426  	 */
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3427  	uint32_t controller_id = pipe_ctx->stream_res.tg->inst + 1;
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3428  
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3429  	if (abm == NULL || panel_cntl == NULL || (abm->funcs->set_backlight_level_pwm == NULL))
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3430  		return false;
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3431  
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3432  	if (dmcu)
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3433  		fw_set_brightness = dmcu->funcs->is_dmcu_initialized(dmcu);
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3434  
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3435  	if (!fw_set_brightness && panel_cntl->funcs->driver_set_backlight)
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3436  		panel_cntl->funcs->driver_set_backlight(panel_cntl, backlight_pwm_u16_16);
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3437  	else
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3438  		abm->funcs->set_backlight_level_pwm(
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3439  				abm,
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3440  				backlight_pwm_u16_16,
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3441  				frame_ramp,
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3442  				controller_id,
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3443  				link->panel_cntl->inst);
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3444  
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3445  	return true;
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3446  }
4b0e95d1838f0e1 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-22  3447  
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3448  void dce110_set_abm_immediate_disable(struct pipe_ctx *pipe_ctx)
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3449  {
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3450  	struct abm *abm = pipe_ctx->stream_res.abm;
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3451  	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3452  
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3453  	if (abm)
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3454  		abm->funcs->set_abm_immediate_disable(abm,
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3455  				pipe_ctx->stream->link->panel_cntl->inst);
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3456  
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3457  	if (panel_cntl)
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3458  		panel_cntl->funcs->store_backlight_level(panel_cntl);
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3459  }
3ba01817365c5a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-18  3460  
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3461  void dce110_set_pipe(struct pipe_ctx *pipe_ctx)
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3462  {
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3463  	struct abm *abm = pipe_ctx->stream_res.abm;
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3464  	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3465  	uint32_t otg_inst = pipe_ctx->stream_res.tg->inst + 1;
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3466  
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3467  	if (abm && panel_cntl)
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3468  		abm->funcs->set_pipe(abm, otg_inst, panel_cntl->inst);
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3469  }
474ac4a875ca6fe drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Yongqiang Sun       2020-04-27  3470  
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3471  void dce110_enable_lvds_link_output(struct dc_link *link,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3472  		const struct link_resource *link_res,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3473  		enum clock_source_id clock_source,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3474  		uint32_t pixel_clock)
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3475  {
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3476  	(void)link_res;
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3477  	link->link_enc->funcs->enable_lvds_output(
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3478  			link->link_enc,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3479  			clock_source,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3480  			pixel_clock);
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3481  	link->phy_state.symclk_state = SYMCLK_ON_TX_ON;
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3482  }
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3483  
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3484  void dce110_enable_tmds_link_output(struct dc_link *link,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3485  		const struct link_resource *link_res,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3486  		enum signal_type signal,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3487  		enum clock_source_id clock_source,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3488  		enum dc_color_depth color_depth,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3489  		uint32_t pixel_clock)
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3490  {
f82480fafedf622 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Gaghik Khachatrian  2026-03-09  3491  	(void)link_res;
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3492  	link->link_enc->funcs->enable_tmds_output(
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3493  			link->link_enc,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3494  			clock_source,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3495  			color_depth,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3496  			signal,
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3497  			pixel_clock);
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3498  	link->phy_state.symclk_state = SYMCLK_ON_TX_ON;
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3499  
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3500  	// For dongle Type 2 with no I2C support on board, setup sw mode of Ri/Pj check with proper aux instance
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3501  	if (link->force_to_use_aux) {
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3502  		if (link->link_enc && link->link_enc->funcs->setup_ri_pj_check_in_sw_or_hw_mode)
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3503  			link->link_enc->funcs->setup_ri_pj_check_in_sw_or_hw_mode(link->link_enc,
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3504  				link->aux_hw_inst, true);
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3505  	} else
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3506  		// For HDMI setup hw mode of Ri/Pj check with proper ddc pin instance
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3507  		if (link->link_enc && link->link_enc->funcs->setup_ri_pj_check_in_sw_or_hw_mode)
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3508  			link->link_enc->funcs->setup_ri_pj_check_in_sw_or_hw_mode(link->link_enc,
992694ad2858418 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Aurabindo Pillai    2026-07-21  3509  				link->ddc_hw_inst, false);
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3510  }
9c75891feef0f9f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c Wenjing Liu         2022-08-31  3511  
cea8349e4494d28 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Roman Li            2026-04-15 @3512  static void dce110_enable_analog_link_output(
cea8349e4494d28 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Roman Li            2026-04-15  3513  		struct dc_link *link,
cea8349e4494d28 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Roman Li            2026-04-15  3514  		uint32_t pix_clk_100hz)
cea8349e4494d28 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Roman Li            2026-04-15  3515  {
cea8349e4494d28 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Roman Li            2026-04-15  3516  	link->link_enc->funcs->enable_analog_output(
cea8349e4494d28 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Roman Li            2026-04-15  3517  			link->link_enc,
cea8349e4494d28 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Roman Li            2026-04-15  3518  			pix_clk_100hz);
cea8349e4494d28 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Roman Li            2026-04-15  3519  }
cea8349e4494d28 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   Roman Li            2026-04-15  3520  

:::::: The code at line 3322 was first introduced by commit
:::::: 4bd0dc68fd00f41ed64fbcfe7b7afe93763b04ad drm/amd/display: Fix missing hwss function for dce

:::::: TO: Joshua Aberback <joshua.aberback@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
