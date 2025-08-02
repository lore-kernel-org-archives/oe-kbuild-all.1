Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF3BE4A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 00:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754095841; cv=none; b=nySBemGR2PxLspBNQOWFta4kec2Sh3wkm4kecIPFS8EcIBhn6Fa943KsKHpNLAb1k+pudm3CWdwaMNVu351F76YAtj91eosoLVuQsYH8+9mB+umgeIEvA06SvLZBIOMBaLEgB/8ZM8WVhzy7hp2hleSQ8y7b5NshBqxuUPCoTCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754095841; c=relaxed/simple;
	bh=/DH0O/DsHz2PT6av4RPZnwMnvebmHKWKzLaJvT2ULSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bhusn1yNae41O2idyMEhHJ2xoqAlFksv5mIsmLjLfaPHv4Aq9HggINHMfTf3vgQ6ulBZMr/0BRJsm7VylbsodOD9N8R+czkbD1pU7bC5yuajvgSEEVNhfAYi/aNF+i0dI2DTmgHhyAeCC7tm/tpub/pQalvmNgbQ/lFAGI469y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZPZD1Ri; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZPZD1Ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754095840; x=1785631840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/DH0O/DsHz2PT6av4RPZnwMnvebmHKWKzLaJvT2ULSs=;
  b=ZZPZD1RidIZAQrb2do0E5M98saioNkT+56KNwcBjydRIl6dGbeEHGNjC
   2Gv+VawG6hDNW77f4iUtcNEpWCf3KWSWGh/+ZhvpxiSkEIAt8K+TFXUou
   bOWWEuMI9rCGnwFFs3M3X6hI9efdNN2p0XjVJqmoxgjdAJXgW3FvcTzoy
   jHhCiLipG6TCtG2QwHBMv1zVRZl33O8lwJUnUHO4EX4nfcDUWevOmrycv
   FINDAsLJfdNtevtTMPtQh9aFVay6eG1Vet6tDSeVh/7r8Nm4GllCNNY+H
   t5b30tSAMKHkjpYs9gLeKXjQQAH6GeZsQGfNxekJbzVQGuJXqSNvLTRaU
   Q==;
X-CSE-ConnectionGUID: KQnh/4WJTEKaYmUPQS8MHQ==
X-CSE-MsgGUID: 8TBKpuJFTCS42EpFptZpsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60266122"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60266122"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 17:50:38 -0700
X-CSE-ConnectionGUID: ehL5Y/1HSQiwZydQIOOBqQ==
X-CSE-MsgGUID: 8yN2dKwDQRaBawI6zQ4fKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="162979543"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2025 17:50:38 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui0SI-0001KN-1t;
	Sat, 02 Aug 2025 00:50:34 +0000
Date: Sat, 2 Aug 2025 02:50:15 +0200
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 36/51]
 drivers/gpu/drm/tidss/tidss_crtc.c:435:20: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202508020258.g4ZUp9tE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/state-readout
head:   f8f58ab7e9eac7e5daa40ab3f03b67f54ee9e9a4
commit: 02000baf0a9e7210c4effb2d6c552fb93f4b2287 [36/51] tidss: Implement readout support
config: parisc-randconfig-2001-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020258.g4ZUp9tE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020258.g4ZUp9tE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020258.g4ZUp9tE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tidss/tidss_crtc.c: In function 'tidss_crtc_readout_mode':
>> drivers/gpu/drm/tidss/tidss_crtc.c:435:20: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     435 |         hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
         |                    ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/tidss/tidss_plane.c: In function 'tidss_plane_readout_fb':
>> drivers/gpu/drm/tidss/tidss_plane.c:211:53: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     211 |                 dispc_plane_find_fourcc_by_dss_code(FIELD_GET(DISPC_VID_ATTRIBUTES_FORMAT_MASK,
         |                                                     ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +435 drivers/gpu/drm/tidss/tidss_crtc.c

   420	
   421	static int tidss_crtc_readout_mode(struct dispc_device *dispc,
   422					   struct tidss_crtc *tcrtc,
   423					   struct drm_display_mode *mode)
   424	{
   425		struct tidss_device *tidss = dispc->tidss;
   426		struct drm_device *dev = &tidss->ddev;
   427		unsigned long pixel_clock;
   428		unsigned int refresh;
   429		u16 hdisplay, hfp, hsw, hbp;
   430		u16 vdisplay, vfp, vsw, vbp;
   431		u32 vp = tcrtc->hw_videoport;
   432		u32 val;
   433	
   434		val = dispc_vp_read(dispc, vp, DISPC_VP_SIZE_SCREEN);
 > 435		hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
   436		vdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK, val) + 1;
   437	
   438		mode->hdisplay = hdisplay;
   439		mode->vdisplay = vdisplay;
   440	
   441		val = dispc_vp_read(dispc, vp, DISPC_VP_TIMING_H);
   442		hsw = FIELD_GET(DISPC_VP_TIMING_H_SYNC_PULSE_MASK, val) + 1;
   443		hfp = FIELD_GET(DISPC_VP_TIMING_H_FRONT_PORCH_MASK, val) + 1;
   444		hbp = FIELD_GET(DISPC_VP_TIMING_H_BACK_PORCH_MASK, val) + 1;
   445	
   446		mode->hsync_start = hdisplay + hfp;
   447		mode->hsync_end = hdisplay + hfp + hsw;
   448		mode->htotal = hdisplay + hfp + hsw + hbp;
   449	
   450		val = dispc_vp_read(dispc, vp, DISPC_VP_TIMING_V);
   451		vsw = FIELD_GET(DISPC_VP_TIMING_V_SYNC_PULSE_MASK, val) + 1;
   452		vfp = FIELD_GET(DISPC_VP_TIMING_V_FRONT_PORCH_MASK, val);
   453		vbp = FIELD_GET(DISPC_VP_TIMING_V_BACK_PORCH_MASK, val);
   454	
   455		mode->vsync_start = vdisplay + vfp;
   456		mode->vsync_end = vdisplay + vfp + vsw;
   457		mode->vtotal = vdisplay + vfp + vsw + vbp;
   458	
   459		refresh = tidss_find_closest_refresh_rate_from_clk(dev,
   460								   dispc->vp_clk[vp],
   461								   mode->htotal,
   462								   mode->vtotal,
   463								   &pixel_clock);
   464		if (!refresh)
   465			return -EINVAL;
   466	
   467		mode->clock = pixel_clock / 1000;
   468	
   469		val = dispc_vp_read(dispc, vp, DISPC_VP_POL_FREQ);
   470		if (FIELD_GET(DISPC_VP_POL_FREQ_IVS_MASK, val))
   471			mode->flags |= DRM_MODE_FLAG_NVSYNC;
   472	
   473		if (FIELD_GET(DISPC_VP_POL_FREQ_IHS_MASK, val))
   474			mode->flags |= DRM_MODE_FLAG_NHSYNC;
   475	
   476		mode->type |= DRM_MODE_TYPE_DRIVER;
   477		drm_mode_set_name(mode);
   478		drm_mode_set_crtcinfo(mode, 0);
   479	
   480		return 0;
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
