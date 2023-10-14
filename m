Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFFE12B9F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApA9cU+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697297103; x=1728833103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sux8mBeOoAl3QqekdiM/BxOPMz1oe9CdLdVy18y0Jpo=;
  b=ApA9cU+wmPNSSJ0b4DL1wS+Hmn8trw6i9njbHPVes3dFrDyBOU1UYjdH
   INw/xLR9LhcZSCyeCTc5iGKRgLMHwPc24g6WO2hqwSU3rsiUbspxmhw3A
   kIkHTlTU4CZOw8p6G22j51BWpoEcZ0sPMP6dcqpE2JelDJ0/MiAuGd35W
   jz9NTXPYYZr625RKDkRXhBCjBtoxLN3RtsD18Dw12Ve23mRVxTVVRA7Pc
   YG1Wo3uTnOn/BuIzfjZYKFCRmB4FTkrBQt741jHcWj1ckwxoxXSrYx2TC
   Rja1Wy1eWpB/V+iVkLEzHM2M9h9xbHEUmbK6C/2xmoCd6ra3VJSTD8Ton
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375683299"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375683299"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 08:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="731700774"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="731700774"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2023 08:25:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrgVa-0006JE-0S;
	Sat, 14 Oct 2023 15:24:54 +0000
Date: Sat, 14 Oct 2023 23:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1125/25021]
 drivers/gpu/drm/imx/dcss/dcss-plane.c:232:23: warning: variable 'vdisplay'
 set but not used
Message-ID: <202310142313.C5pSRleo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurentiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: afdfc6a3f9ef06b46338faa6d86c7ff87b288028 [1125/25021] drm/imx/dcss: add support for tiled formats on overlay planes
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231014/202310142313.C5pSRleo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142313.C5pSRleo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142313.C5pSRleo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imx/dcss/dcss-plane.c:48:9: error: 'DRM_FORMAT_NV12_10LE40' undeclared here (not in a function); did you mean 'DRM_FORMAT_XVYU2101010'?
      48 |         DRM_FORMAT_NV12_10LE40,
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_XVYU2101010
   drivers/gpu/drm/imx/dcss/dcss-plane.c:52:9: error: 'DRM_FORMAT_MOD_VSI_G1_TILED' undeclared here (not in a function); did you mean 'DRM_FORMAT_MOD_VIVANTE_TILED'?
      52 |         DRM_FORMAT_MOD_VSI_G1_TILED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_MOD_VIVANTE_TILED
   drivers/gpu/drm/imx/dcss/dcss-plane.c:53:9: error: 'DRM_FORMAT_MOD_VSI_G2_TILED' undeclared here (not in a function); did you mean 'DRM_FORMAT_MOD_VIVANTE_TILED'?
      53 |         DRM_FORMAT_MOD_VSI_G2_TILED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_MOD_VIVANTE_TILED
   drivers/gpu/drm/imx/dcss/dcss-plane.c:54:9: error: 'DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED' undeclared here (not in a function); did you mean 'DRM_FORMAT_MOD_QCOM_COMPRESSED'?
      54 |         DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_MOD_QCOM_COMPRESSED
   drivers/gpu/drm/imx/dcss/dcss-plane.c:62:9: error: 'DRM_FORMAT_MOD_VIVANTE_SUPER_TILED_FC' undeclared here (not in a function); did you mean 'DRM_FORMAT_MOD_VIVANTE_SUPER_TILED'?
      62 |         DRM_FORMAT_MOD_VIVANTE_SUPER_TILED_FC,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_MOD_VIVANTE_SUPER_TILED
   drivers/gpu/drm/imx/dcss/dcss-plane.c: In function 'dcss_plane_atomic_check':
>> drivers/gpu/drm/imx/dcss/dcss-plane.c:232:23: warning: variable 'vdisplay' set but not used [-Wunused-but-set-variable]
     232 |         int hdisplay, vdisplay;
         |                       ^~~~~~~~
>> drivers/gpu/drm/imx/dcss/dcss-plane.c:232:13: warning: variable 'hdisplay' set but not used [-Wunused-but-set-variable]
     232 |         int hdisplay, vdisplay;
         |             ^~~~~~~~
   drivers/gpu/drm/imx/dcss/dcss-plane.c: In function 'dcss_plane_setup_hdr10_pipes':
   drivers/gpu/drm/imx/dcss/dcss-plane.c:486:22: warning: implicit conversion from 'enum drm_color_range' to 'enum dcss_hdr10_pixel_range' [-Wenum-conversion]
     486 |         ipipe_cfg.pr = state->color_range;
         |                      ^
   drivers/gpu/drm/imx/dcss/dcss-plane.c: In function 'dcss_plane_use_dtrc':
   drivers/gpu/drm/imx/dcss/dcss-plane.c:219:1: error: control reaches end of non-void function [-Werror=return-type]
     219 | }
         | ^
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_irq_handler':
>> drivers/gpu/drm/imx/dcss/dcss-dtrc.c:118:21: warning: variable 'curr_bank' set but not used [-Wunused-but-set-variable]
     118 |         u32 b0, b1, curr_bank;
         |                     ^~~~~~~~~
>> drivers/gpu/drm/imx/dcss/dcss-dtrc.c:118:17: warning: variable 'b1' set but not used [-Wunused-but-set-variable]
     118 |         u32 b0, b1, curr_bank;
         |                 ^~
>> drivers/gpu/drm/imx/dcss/dcss-dtrc.c:118:13: warning: variable 'b0' set but not used [-Wunused-but-set-variable]
     118 |         u32 b0, b1, curr_bank;
         |             ^~
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_addr_set':
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:290:36: error: 'DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED' undeclared (first use in this function); did you mean 'DRM_FORMAT_MOD_QCOM_COMPRESSED'?
     290 |         if (ch->format_modifier == DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED) {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_MOD_QCOM_COMPRESSED
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:290:36: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_set_res':
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:331:39: error: 'DRM_FORMAT_NV12_10LE40' undeclared (first use in this function); did you mean 'DRM_FORMAT_XVYU2101010'?
     331 |         pix_depth = ch->pix_format == DRM_FORMAT_NV12_10LE40 ? 10 : 8;
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                       DRM_FORMAT_XVYU2101010
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:367:36: error: 'DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED' undeclared (first use in this function); did you mean 'DRM_FORMAT_MOD_QCOM_COMPRESSED'?
     367 |         if (ch->format_modifier == DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED && x1)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_MOD_QCOM_COMPRESSED
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_enable':
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:454:36: error: 'DRM_FORMAT_MOD_VSI_G1_TILED' undeclared (first use in this function); did you mean 'DRM_FORMAT_MOD_VIVANTE_TILED'?
     454 |         if (ch->format_modifier == DRM_FORMAT_MOD_VSI_G1_TILED)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_MOD_VIVANTE_TILED
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:463:36: error: 'DRM_FORMAT_NV12_10LE40' undeclared (first use in this function); did you mean 'DRM_FORMAT_XVYU2101010'?
     463 |         fdctl |= ch->pix_format == DRM_FORMAT_NV12_10LE40 ? 0 : PIX_DEPTH_8BIT_EN;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_XVYU2101010
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:465:36: error: 'DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED' undeclared (first use in this function); did you mean 'DRM_FORMAT_MOD_QCOM_COMPRESSED'?
     465 |         if (ch->format_modifier != DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_MOD_QCOM_COMPRESSED
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_ch_switch_banks':
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:498:17: warning: variable 'b1' set but not used [-Wunused-but-set-variable]
     498 |         u32 b0, b1;
         |                 ^~
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:498:13: warning: variable 'b0' set but not used [-Wunused-but-set-variable]
     498 |         u32 b0, b1;
         |             ^~


vim +/vdisplay +232 drivers/gpu/drm/imx/dcss/dcss-plane.c

afdfc6a3f9ef06 Laurentiu Palcu 2019-11-22  220  
9021c317b77024 Laurentiu Palcu 2020-07-31  221  static int dcss_plane_atomic_check(struct drm_plane *plane,
7c11b99a8e58c0 Maxime Ripard   2021-02-19  222  				   struct drm_atomic_state *state)
9021c317b77024 Laurentiu Palcu 2020-07-31  223  {
7c11b99a8e58c0 Maxime Ripard   2021-02-19  224  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
7c11b99a8e58c0 Maxime Ripard   2021-02-19  225  										 plane);
9021c317b77024 Laurentiu Palcu 2020-07-31  226  	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
9021c317b77024 Laurentiu Palcu 2020-07-31  227  	struct dcss_dev *dcss = plane->dev->dev_private;
ba5c1649465d40 Maxime Ripard   2021-02-19  228  	struct drm_framebuffer *fb = new_plane_state->fb;
9021c317b77024 Laurentiu Palcu 2020-07-31  229  	bool is_primary_plane = plane->type == DRM_PLANE_TYPE_PRIMARY;
9021c317b77024 Laurentiu Palcu 2020-07-31  230  	struct drm_gem_cma_object *cma_obj;
9021c317b77024 Laurentiu Palcu 2020-07-31  231  	struct drm_crtc_state *crtc_state;
9021c317b77024 Laurentiu Palcu 2020-07-31 @232  	int hdisplay, vdisplay;
9021c317b77024 Laurentiu Palcu 2020-07-31  233  	int min, max;
9021c317b77024 Laurentiu Palcu 2020-07-31  234  	int ret;
9021c317b77024 Laurentiu Palcu 2020-07-31  235  
ba5c1649465d40 Maxime Ripard   2021-02-19  236  	if (!fb || !new_plane_state->crtc)
9021c317b77024 Laurentiu Palcu 2020-07-31  237  		return 0;
9021c317b77024 Laurentiu Palcu 2020-07-31  238  
9021c317b77024 Laurentiu Palcu 2020-07-31  239  	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
9021c317b77024 Laurentiu Palcu 2020-07-31  240  	WARN_ON(!cma_obj);
9021c317b77024 Laurentiu Palcu 2020-07-31  241  
dec92020671c48 Maxime Ripard   2021-02-19  242  	crtc_state = drm_atomic_get_existing_crtc_state(state,
ba5c1649465d40 Maxime Ripard   2021-02-19  243  							new_plane_state->crtc);
9021c317b77024 Laurentiu Palcu 2020-07-31  244  
9021c317b77024 Laurentiu Palcu 2020-07-31  245  	hdisplay = crtc_state->adjusted_mode.hdisplay;
9021c317b77024 Laurentiu Palcu 2020-07-31  246  	vdisplay = crtc_state->adjusted_mode.vdisplay;
9021c317b77024 Laurentiu Palcu 2020-07-31  247  
ba5c1649465d40 Maxime Ripard   2021-02-19  248  	if (!dcss_plane_is_source_size_allowed(new_plane_state->src_w >> 16,
ba5c1649465d40 Maxime Ripard   2021-02-19  249  					       new_plane_state->src_h >> 16,
9021c317b77024 Laurentiu Palcu 2020-07-31  250  					       fb->format->format)) {
9021c317b77024 Laurentiu Palcu 2020-07-31  251  		DRM_DEBUG_KMS("Source plane size is not allowed!\n");
9021c317b77024 Laurentiu Palcu 2020-07-31  252  		return -EINVAL;
9021c317b77024 Laurentiu Palcu 2020-07-31  253  	}
9021c317b77024 Laurentiu Palcu 2020-07-31  254  
9021c317b77024 Laurentiu Palcu 2020-07-31  255  	dcss_scaler_get_min_max_ratios(dcss->scaler, dcss_plane->ch_num,
9021c317b77024 Laurentiu Palcu 2020-07-31  256  				       &min, &max);
9021c317b77024 Laurentiu Palcu 2020-07-31  257  
ba5c1649465d40 Maxime Ripard   2021-02-19  258  	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
9021c317b77024 Laurentiu Palcu 2020-07-31  259  						  min, max, !is_primary_plane,
9021c317b77024 Laurentiu Palcu 2020-07-31  260  						  false);
9021c317b77024 Laurentiu Palcu 2020-07-31  261  	if (ret)
9021c317b77024 Laurentiu Palcu 2020-07-31  262  		return ret;
9021c317b77024 Laurentiu Palcu 2020-07-31  263  
ba5c1649465d40 Maxime Ripard   2021-02-19  264  	if (!new_plane_state->visible)
9021c317b77024 Laurentiu Palcu 2020-07-31  265  		return 0;
9021c317b77024 Laurentiu Palcu 2020-07-31  266  
9021c317b77024 Laurentiu Palcu 2020-07-31  267  	if (!dcss_plane_can_rotate(fb->format,
9021c317b77024 Laurentiu Palcu 2020-07-31  268  				   !!(fb->flags & DRM_MODE_FB_MODIFIERS),
9021c317b77024 Laurentiu Palcu 2020-07-31  269  				   fb->modifier,
ba5c1649465d40 Maxime Ripard   2021-02-19  270  				   new_plane_state->rotation)) {
9021c317b77024 Laurentiu Palcu 2020-07-31  271  		DRM_DEBUG_KMS("requested rotation is not allowed!\n");
9021c317b77024 Laurentiu Palcu 2020-07-31  272  		return -EINVAL;
9021c317b77024 Laurentiu Palcu 2020-07-31  273  	}
9021c317b77024 Laurentiu Palcu 2020-07-31  274  
9021c317b77024 Laurentiu Palcu 2020-07-31  275  	if ((fb->flags & DRM_MODE_FB_MODIFIERS) &&
9021c317b77024 Laurentiu Palcu 2020-07-31  276  	    !plane->funcs->format_mod_supported(plane,
9021c317b77024 Laurentiu Palcu 2020-07-31  277  				fb->format->format,
9021c317b77024 Laurentiu Palcu 2020-07-31  278  				fb->modifier)) {
9021c317b77024 Laurentiu Palcu 2020-07-31  279  		DRM_DEBUG_KMS("Invalid modifier: %llx", fb->modifier);
9021c317b77024 Laurentiu Palcu 2020-07-31  280  		return -EINVAL;
9021c317b77024 Laurentiu Palcu 2020-07-31  281  	}
9021c317b77024 Laurentiu Palcu 2020-07-31  282  
afdfc6a3f9ef06 Laurentiu Palcu 2019-11-22  283  	dcss_plane->use_dtrc = dcss_plane_use_dtrc(fb, plane->type);
afdfc6a3f9ef06 Laurentiu Palcu 2019-11-22  284  
9021c317b77024 Laurentiu Palcu 2020-07-31  285  	return 0;
9021c317b77024 Laurentiu Palcu 2020-07-31  286  }
9021c317b77024 Laurentiu Palcu 2020-07-31  287  

:::::: The code at line 232 was first introduced by commit
:::::: 9021c317b77024fb2642af7e84ad944769ae0949 drm/imx: Add initial support for DCSS on iMX8MQ

:::::: TO: Laurentiu Palcu <laurentiu.palcu@nxp.com>
:::::: CC: Lucas Stach <l.stach@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
