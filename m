Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2929F372
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 02:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754101846; cv=none; b=Q++dJtfEoVocLutv8p0YmRH2gmchc/pyMb6tbLfatoT1KgdpxSW9Cr/oQAYSTEbtYNrdTtd7hZHyTMZo2f2o0JHFGPoviqdYPxxo/DG7HGyqDqE8YnEBbOzXAcVLdb1I9j5husnKD1yO4sxmFTItKI/HI3YQvaOirpAht/vV6X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754101846; c=relaxed/simple;
	bh=g2bubtYgoDKDTkRA9DaJr2DqSqM3/eX45OpWFo6/VZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDl3mS6bLP1MbecMwOkF7IJrhHf5BHJ2E0M1fcXL7wKOAiY+MhTTVJjfhQn+6KvSAHW/2Xe1EEqYKoWgDAVAIiX3CGUmRDhixbTcqwl/8kY9vxU1QknXjQl4iUCS57iRtT9v6yEFj++V4VCRS8MqEJcGYPPjbBrZjt6xL/KS3ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxqiegTh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxqiegTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754101845; x=1785637845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2bubtYgoDKDTkRA9DaJr2DqSqM3/eX45OpWFo6/VZA=;
  b=DxqiegThcpEe4L5J1DFxBMI2qRHUevEPZ8nzWckGyYGbQLU2OZzNKAxs
   /JHDugfMUHwJ0tL4MCIzcKpj0hLIo650lF7S3xk1GNLM9gQgLc2XqdPTO
   jkXikEpWmXTWF7xXoaQHZrHrFIPgzVxdHbFD7ONYLG2ib71D0Bp3dSBTT
   GC92FDZictr/hLVg/2mF7LBTU6W7tFRsYeNMF2iZj20gtGW7mI1dpZH67
   fKlgLMz58qfWPidMUgpJQrKQs4Ez4TCI2z9s56YWjhD0s0iOp7r6M0My1
   ajJaPL9uYqytvS4NkhR+F0DQevCt8KieqIW4g6Io1MzF1fvUky1mmaX/D
   Q==;
X-CSE-ConnectionGUID: D2/+MM5iThe0IpWhWdvgZA==
X-CSE-MsgGUID: FBgZxq2HSIucBVxvZgIjIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56534023"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56534023"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 19:30:44 -0700
X-CSE-ConnectionGUID: A4vh7oEvT6ittDVJAjXKpA==
X-CSE-MsgGUID: B4MnactRTHuDqwBtCYpkOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163723392"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 01 Aug 2025 19:30:42 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui21A-0001Kt-1R;
	Sat, 02 Aug 2025 02:30:40 +0000
Date: Sat, 2 Aug 2025 04:29:42 +0200
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 50/51]
 drivers/gpu/drm/tidss/tidss_crtc.c:477:17: error: 'tstate' undeclared; did
 you mean 'kstat'?
Message-ID: <202508020425.57h9R4Z6-lkp@intel.com>
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
commit: 0ff64938d92c7acca45728d5a3a409273a1eaa10 [50/51] fixup! tidss: Implement readout support
config: parisc-randconfig-2001-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020425.57h9R4Z6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020425.57h9R4Z6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020425.57h9R4Z6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tidss/tidss_crtc.c: In function 'tidss_crtc_readout_mode':
   drivers/gpu/drm/tidss/tidss_crtc.c:435:20: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     435 |         hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
         |                    ^~~~~~~~~
>> drivers/gpu/drm/tidss/tidss_crtc.c:477:17: error: 'tstate' undeclared (first use in this function); did you mean 'kstat'?
     477 |                 tstate->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
         |                 ^~~~~~
         |                 kstat
   drivers/gpu/drm/tidss/tidss_crtc.c:477:17: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +477 drivers/gpu/drm/tidss/tidss_crtc.c

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
   435		hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
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
   476		if (FIELD_GET(DISPC_VP_POL_FREQ_IPC_MASK, val))
 > 477			tstate->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
   478	
   479		if (FIELD_GET(DISPC_VP_POL_FREQ_IEO_MASK, val))
   480			tstate->bus_flags |= DRM_BUS_FLAG_DE_LOW;
   481	
   482		if (FIELD_GET(DISPC_VP_POL_FREQ_RF_MASK, val))
   483			tstate->bus_flags |= DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
   484	
   485		mode->type |= DRM_MODE_TYPE_DRIVER;
   486		drm_mode_set_name(mode);
   487		drm_mode_set_crtcinfo(mode, 0);
   488	
   489		return 0;
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
