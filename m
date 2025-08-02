Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8D28F4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 02:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754102901; cv=none; b=eAoue4w++5NlRmlSQMQs/+ISNKzeJ8EsE8KaO9mPRugJqyRwO6ze7dw3wZ2RnL9e4sKbLIjzWFbQJkbInHsm5taEOQwzf+06UjtMBHOIrPJKMMV2VQ5xCj+CdKmECR9yH8hAGRKzHH39NMyjMW6Z9aTEkoXm4vfFw8DpZyiAAmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754102901; c=relaxed/simple;
	bh=VIqnb6u4OmWMv+llQ16ng00nYL2PcAa20AJMJE7g4+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YzfPqrhaVf6iABIhQbyuYjkLUytRsx9hSP3XHLXtVlYl4q9Vf6xspTq8pk/9A3FGBwpL81l9/enZawGnk3OWRAcziVx8lNsfULktmKLCUzXH+usC1LXfFc59kmm401XHmvgdEn9lFUCA3t0LyoZt3vRMqgyf+6mu4YEfO7+cE80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARccAfgQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARccAfgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754102899; x=1785638899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VIqnb6u4OmWMv+llQ16ng00nYL2PcAa20AJMJE7g4+g=;
  b=ARccAfgQ0kWhDLXRFMG+iiVLZKsFYX69NA8iHXDtz6lA7+0cwL4ILOhD
   AJKwqeZ4SgUSISbV4xKcbCADbo5TihcTggO3rmJPbiumA5p6DR1WCXf6E
   YdCNn8rhQjGKQAJobBVpiALvpd+u65iMjPcy2vHQeGknPzQIrGANUB4Jx
   B4NxnSPcU0X68eVqX5dNYBlf5Y6OMMrW/Rz5mw5ZiNArh/7vLi+qjG23b
   vuSeBWEcbrj9iFMnLC8qRTerXTjlahPGukcIAw4RXI23Y0RjTG/LjDxlG
   I4Trpz5OPTfL9ZOH57YIlaoF4rByxBgHu/6siZXuwaO5eg52qhzGOJVI6
   w==;
X-CSE-ConnectionGUID: D5AF9Ct4SP6FTdWH8vbPiw==
X-CSE-MsgGUID: D5OXLQvlQf25Pw6Uipez0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56534537"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56534537"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 19:48:19 -0700
X-CSE-ConnectionGUID: tnRaSbynQM+uYjKGxQTbTA==
X-CSE-MsgGUID: VDbEe2bfTl2L1MohqEz//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164171971"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Aug 2025 19:48:17 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui2IB-00057U-2C;
	Sat, 02 Aug 2025 02:48:15 +0000
Date: Sat, 2 Aug 2025 10:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 50/51]
 drivers/gpu/drm/tidss/tidss_crtc.c:477:3: error: 'tstate' undeclared; did
 you mean 'ct_state'?
Message-ID: <202508021011.gs0Qby3i-lkp@intel.com>
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
config: arm-randconfig-001-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021011.gs0Qby3i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021011.gs0Qby3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021011.gs0Qby3i-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tidss/tidss_crtc.c: In function 'tidss_crtc_readout_mode':
>> drivers/gpu/drm/tidss/tidss_crtc.c:477:3: error: 'tstate' undeclared (first use in this function); did you mean 'ct_state'?
     477 |   tstate->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
         |   ^~~~~~
         |   ct_state
   drivers/gpu/drm/tidss/tidss_crtc.c:477:3: note: each undeclared identifier is reported only once for each function it appears in


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
