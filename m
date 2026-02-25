Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4153D9031
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036307; cv=none; b=kpNxVACVLfiNAK4l+8+oKZkPoHmNvK7/o+7GJZ/Xc44Ha+oUsMKr+XINKRCRiOE65+wqykHQ6KvseGs9ggr+FPVZ6WTe75ancjpsEzb8m3HF2ryyvKikotwCsE8qkt/UptkjPAhyMBKn8p5aRJ0uex3qDBfn80fcrd+SxqYBT7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036307; c=relaxed/simple;
	bh=JLEqX35eSzgUvwlB7czCbqDrrubv3/c8JCFU6EJoNdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B9VufmBwgZA+dXItH/FK8EiluOtP+VmehMYDTWCffLj1XVUPcQNIlbZJfhmPBycYpkp69ode13A4WmgjRagMrsnu0Ssf09BR7E43a92mJP+T/2P0G+x2K4OHn7Taag4IhpoBETkhylwwO3xAJRIcT7BmEJmzYBcpDVEuY6Hr/Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uzt0p+Xb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uzt0p+Xb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772036301; x=1803572301;
  h=date:from:to:cc:subject:message-id;
  bh=JLEqX35eSzgUvwlB7czCbqDrrubv3/c8JCFU6EJoNdY=;
  b=Uzt0p+Xbtmo9Nm0ahRbuGfAFO89n9yaGVUM0WG29JuSsIhGcUcZa3z2x
   gNipb/c74lH9Iw8iIAqvE5aI92oacxKwuVAF7PL57Z8Z5R9kgHnhsnYbo
   1PWIaONLT5bid55GB1mIoEQ7zdjTv1DV4YMtA0MAOtkdW8ukigIXrDJo2
   x6RdtptT5qd08bfJvBQBZs3wY0cmySpZOVUS41hGjwoWiAVHljiuzA8AE
   muEghZzVsbQFG2Ql4H+rg2pxRA6OlxLj72WRsUYFZnf1tJtIeddtee5gd
   cSSS5gPw1EHVasIBcTLiRWBw/U4rtuncobSOiVn3KhO26XLUKmLrTzplE
   w==;
X-CSE-ConnectionGUID: U0arXyDpRnmevCsv2M0sPg==
X-CSE-MsgGUID: bf4nN7rGTB2UXcLRs7ae7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="75685428"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="75685428"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:18:20 -0800
X-CSE-ConnectionGUID: 4T2xy9pnQVKfs2+TMxY/0A==
X-CSE-MsgGUID: ZFruX4BsS3WG1LOYUFL9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="216162376"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Feb 2026 08:18:14 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvHaV-000000006OV-0YZJ;
	Wed, 25 Feb 2026 16:18:11 +0000
Date: Thu, 26 Feb 2026 00:10:54 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 23/28]
 drivers/gpu/drm/tidss/tidss_crtc.c:445:20: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202602252320.jHzCsBb1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/state-readout
head:   c9f24e410ebb9f3bade012825d8cfd87915e9d4d
commit: bd325f6eb5f08e76ae51b78f9646ac6763156adb [23/28] drm/tidss: Implement readout support
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260225/202602252320.jHzCsBb1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602252320.jHzCsBb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602252320.jHzCsBb1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tidss/tidss_crtc.c: In function 'tidss_crtc_readout_mode':
>> drivers/gpu/drm/tidss/tidss_crtc.c:445:20: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     445 |         hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
         |                    ^~~~~~~~~
--
   drivers/gpu/drm/tidss/tidss_plane.c: In function 'tidss_plane_readout_fb':
>> drivers/gpu/drm/tidss/tidss_plane.c:203:53: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     203 |                 dispc_plane_find_fourcc_by_dss_code(FIELD_GET(DISPC_VID_ATTRIBUTES_FORMAT_MASK,
         |                                                     ^~~~~~~~~


vim +/FIELD_GET +445 drivers/gpu/drm/tidss/tidss_crtc.c

   430	
   431	static int tidss_crtc_readout_mode(struct dispc_device *dispc,
   432					   struct tidss_crtc *tcrtc,
   433					   struct drm_display_mode *mode)
   434	{
   435		struct tidss_device *tidss = dispc->tidss;
   436		struct drm_device *dev = &tidss->ddev;
   437		unsigned long pixel_clock;
   438		unsigned int refresh;
   439		u16 hdisplay, hfp, hsw, hbp;
   440		u16 vdisplay, vfp, vsw, vbp;
   441		u32 vp = tcrtc->hw_videoport;
   442		u32 val;
   443	
   444		val = dispc_vp_read(dispc, vp, DISPC_VP_SIZE_SCREEN);
 > 445		hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
   446		vdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK, val) + 1;
   447	
   448		mode->hdisplay = hdisplay;
   449		mode->vdisplay = vdisplay;
   450	
   451		val = dispc_vp_read(dispc, vp, DISPC_VP_TIMING_H);
   452		hsw = FIELD_GET(DISPC_VP_TIMING_H_SYNC_PULSE_MASK, val) + 1;
   453		hfp = FIELD_GET(DISPC_VP_TIMING_H_FRONT_PORCH_MASK, val) + 1;
   454		hbp = FIELD_GET(DISPC_VP_TIMING_H_BACK_PORCH_MASK, val) + 1;
   455	
   456		mode->hsync_start = hdisplay + hfp;
   457		mode->hsync_end = hdisplay + hfp + hsw;
   458		mode->htotal = hdisplay + hfp + hsw + hbp;
   459	
   460		val = dispc_vp_read(dispc, vp, DISPC_VP_TIMING_V);
   461		vsw = FIELD_GET(DISPC_VP_TIMING_V_SYNC_PULSE_MASK, val) + 1;
   462		vfp = FIELD_GET(DISPC_VP_TIMING_V_FRONT_PORCH_MASK, val);
   463		vbp = FIELD_GET(DISPC_VP_TIMING_V_BACK_PORCH_MASK, val);
   464	
   465		mode->vsync_start = vdisplay + vfp;
   466		mode->vsync_end = vdisplay + vfp + vsw;
   467		mode->vtotal = vdisplay + vfp + vsw + vbp;
   468	
   469		refresh = tidss_find_closest_refresh_rate_from_clk(dev,
   470								   dispc->vp_clk[vp],
   471								   mode->htotal,
   472								   mode->vtotal,
   473								   &pixel_clock);
   474		if (!refresh)
   475			return -EINVAL;
   476	
   477		mode->clock = pixel_clock / 1000;
   478	
   479		val = dispc_vp_read(dispc, vp, DISPC_VP_POL_FREQ);
   480		if (FIELD_GET(DISPC_VP_POL_FREQ_IVS_MASK, val))
   481			mode->flags |= DRM_MODE_FLAG_NVSYNC;
   482		else
   483			mode->flags |= DRM_MODE_FLAG_PVSYNC;
   484	
   485		if (FIELD_GET(DISPC_VP_POL_FREQ_IHS_MASK, val))
   486			mode->flags |= DRM_MODE_FLAG_NHSYNC;
   487		else
   488			mode->flags |= DRM_MODE_FLAG_PHSYNC;
   489	
   490		mode->type |= DRM_MODE_TYPE_DRIVER;
   491		drm_mode_set_name(mode);
   492		drm_mode_set_crtcinfo(mode, 0);
   493	
   494		return 0;
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
