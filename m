Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB7433E0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 16:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685292741; x=1716828741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gv1dt599DAGp/aaEp+woHLu6GCMnWz5VEAjSP8hVzCo=;
  b=lIGsjN2RNtyl39XA7adZXXQl51o8ef2Tq/4W3IO7zFRPrAsg9Q7vo9EL
   Vfa4zdSz28EKboix8IHGLB04g7myDwO7fz9Yg2FbjCDJq2a5XHT90g39t
   KL/Ii6hZ8b8RkvMH0oh2TnLgmPRKKS27GSEzTeSzGHUC0WfTtfUG6eFVe
   2Qu4ZMuWgBWgpB8Iz7R33XCy4JuQcW6chCNUVcQJcyI/jcdlXpLghLeOp
   8+1pJnoG4tQY2Snjx9Y+FROjMMVVWf6EdjQ0rRWr81dG2qRvXUwMoC1d1
   B9H/sN56JK1f4elf8+lVS8lgCfVfWTiDqX3ikMsyQKkJyp5Ds6/ebGSHZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="353375591"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="353375591"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 09:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="708987194"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="708987194"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 May 2023 09:52:11 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Jco-000Kg8-1P;
	Sun, 28 May 2023 16:52:10 +0000
Date: Mon, 29 May 2023 00:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 1065/9879]
 drivers/gpu/drm/imx/dcss/dcss-plane.c:234:23: warning: variable 'vdisplay'
 set but not used
Message-ID: <202305290009.pJJeHDXR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: 42e55a1ee8798b19292c124d91b5959648c44fa4 [1065/9879] drm/imx/dcss: add support for tiled formats on overlay planes
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230529/202305290009.pJJeHDXR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/42e55a1ee8798b19292c124d91b5959648c44fa4
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 42e55a1ee8798b19292c124d91b5959648c44fa4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305290009.pJJeHDXR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imx/dcss/dcss-plane.c:50:9: error: 'DRM_FORMAT_NV12_10LE40' undeclared here (not in a function); did you mean 'DRM_FORMAT_XVYU2101010'?
      50 |         DRM_FORMAT_NV12_10LE40,
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_XVYU2101010
   drivers/gpu/drm/imx/dcss/dcss-plane.c:54:9: error: 'DRM_FORMAT_MOD_VSI_G1_TILED' undeclared here (not in a function); did you mean 'DRM_FORMAT_MOD_VIVANTE_TILED'?
      54 |         DRM_FORMAT_MOD_VSI_G1_TILED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_MOD_VIVANTE_TILED
   drivers/gpu/drm/imx/dcss/dcss-plane.c:55:9: error: 'DRM_FORMAT_MOD_VSI_G2_TILED' undeclared here (not in a function); did you mean 'DRM_FORMAT_MOD_VIVANTE_TILED'?
      55 |         DRM_FORMAT_MOD_VSI_G2_TILED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_MOD_VIVANTE_TILED
   drivers/gpu/drm/imx/dcss/dcss-plane.c:56:9: error: 'DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED' undeclared here (not in a function); did you mean 'DRM_FORMAT_MOD_QCOM_COMPRESSED'?
      56 |         DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_MOD_QCOM_COMPRESSED
   drivers/gpu/drm/imx/dcss/dcss-plane.c:64:9: error: 'DRM_FORMAT_MOD_VIVANTE_SUPER_TILED_FC' undeclared here (not in a function); did you mean 'DRM_FORMAT_MOD_VIVANTE_SUPER_TILED'?
      64 |         DRM_FORMAT_MOD_VIVANTE_SUPER_TILED_FC,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         DRM_FORMAT_MOD_VIVANTE_SUPER_TILED
   drivers/gpu/drm/imx/dcss/dcss-plane.c: In function 'dcss_plane_atomic_check':
>> drivers/gpu/drm/imx/dcss/dcss-plane.c:234:23: warning: variable 'vdisplay' set but not used [-Wunused-but-set-variable]
     234 |         int hdisplay, vdisplay;
         |                       ^~~~~~~~
>> drivers/gpu/drm/imx/dcss/dcss-plane.c:234:13: warning: variable 'hdisplay' set but not used [-Wunused-but-set-variable]
     234 |         int hdisplay, vdisplay;
         |             ^~~~~~~~
   drivers/gpu/drm/imx/dcss/dcss-plane.c: In function 'dcss_plane_setup_hdr10_pipes':
   drivers/gpu/drm/imx/dcss/dcss-plane.c:488:22: warning: implicit conversion from 'enum drm_color_range' to 'enum dcss_hdr10_pixel_range' [-Wenum-conversion]
     488 |         ipipe_cfg.pr = state->color_range;
         |                      ^
   drivers/gpu/drm/imx/dcss/dcss-plane.c: In function 'dcss_plane_use_dtrc':
   drivers/gpu/drm/imx/dcss/dcss-plane.c:221:1: error: control reaches end of non-void function [-Werror=return-type]
     221 | }
         | ^
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_irq_handler':
>> drivers/gpu/drm/imx/dcss/dcss-dtrc.c:119:21: warning: variable 'curr_bank' set but not used [-Wunused-but-set-variable]
     119 |         u32 b0, b1, curr_bank;
         |                     ^~~~~~~~~
>> drivers/gpu/drm/imx/dcss/dcss-dtrc.c:119:17: warning: variable 'b1' set but not used [-Wunused-but-set-variable]
     119 |         u32 b0, b1, curr_bank;
         |                 ^~
>> drivers/gpu/drm/imx/dcss/dcss-dtrc.c:119:13: warning: variable 'b0' set but not used [-Wunused-but-set-variable]
     119 |         u32 b0, b1, curr_bank;
         |             ^~
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_addr_set':
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:291:36: error: 'DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED' undeclared (first use in this function); did you mean 'DRM_FORMAT_MOD_QCOM_COMPRESSED'?
     291 |         if (ch->format_modifier == DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED) {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_MOD_QCOM_COMPRESSED
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:291:36: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_set_res':
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:332:39: error: 'DRM_FORMAT_NV12_10LE40' undeclared (first use in this function); did you mean 'DRM_FORMAT_XVYU2101010'?
     332 |         pix_depth = ch->pix_format == DRM_FORMAT_NV12_10LE40 ? 10 : 8;
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                       DRM_FORMAT_XVYU2101010
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:368:36: error: 'DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED' undeclared (first use in this function); did you mean 'DRM_FORMAT_MOD_QCOM_COMPRESSED'?
     368 |         if (ch->format_modifier == DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED && x1)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_MOD_QCOM_COMPRESSED
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_enable':
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:455:36: error: 'DRM_FORMAT_MOD_VSI_G1_TILED' undeclared (first use in this function); did you mean 'DRM_FORMAT_MOD_VIVANTE_TILED'?
     455 |         if (ch->format_modifier == DRM_FORMAT_MOD_VSI_G1_TILED)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_MOD_VIVANTE_TILED
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:464:36: error: 'DRM_FORMAT_NV12_10LE40' undeclared (first use in this function); did you mean 'DRM_FORMAT_XVYU2101010'?
     464 |         fdctl |= ch->pix_format == DRM_FORMAT_NV12_10LE40 ? 0 : PIX_DEPTH_8BIT_EN;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_XVYU2101010
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:466:36: error: 'DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED' undeclared (first use in this function); did you mean 'DRM_FORMAT_MOD_QCOM_COMPRESSED'?
     466 |         if (ch->format_modifier != DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    DRM_FORMAT_MOD_QCOM_COMPRESSED
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c: In function 'dcss_dtrc_ch_switch_banks':
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:499:17: warning: variable 'b1' set but not used [-Wunused-but-set-variable]
     499 |         u32 b0, b1;
         |                 ^~
   drivers/gpu/drm/imx/dcss/dcss-dtrc.c:499:13: warning: variable 'b0' set but not used [-Wunused-but-set-variable]
     499 |         u32 b0, b1;
         |             ^~


vim +/vdisplay +234 drivers/gpu/drm/imx/dcss/dcss-plane.c

42e55a1ee8798b Laurentiu Palcu  2019-11-22  222  
9021c317b77024 Laurentiu Palcu  2020-07-31  223  static int dcss_plane_atomic_check(struct drm_plane *plane,
7c11b99a8e58c0 Maxime Ripard    2021-02-19  224  				   struct drm_atomic_state *state)
9021c317b77024 Laurentiu Palcu  2020-07-31  225  {
7c11b99a8e58c0 Maxime Ripard    2021-02-19  226  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
7c11b99a8e58c0 Maxime Ripard    2021-02-19  227  										 plane);
9021c317b77024 Laurentiu Palcu  2020-07-31  228  	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
9021c317b77024 Laurentiu Palcu  2020-07-31  229  	struct dcss_dev *dcss = plane->dev->dev_private;
ba5c1649465d40 Maxime Ripard    2021-02-19  230  	struct drm_framebuffer *fb = new_plane_state->fb;
9021c317b77024 Laurentiu Palcu  2020-07-31  231  	bool is_primary_plane = plane->type == DRM_PLANE_TYPE_PRIMARY;
4a83c26a1d8702 Danilo Krummrich 2022-08-02  232  	struct drm_gem_dma_object *dma_obj;
9021c317b77024 Laurentiu Palcu  2020-07-31  233  	struct drm_crtc_state *crtc_state;
9021c317b77024 Laurentiu Palcu  2020-07-31 @234  	int hdisplay, vdisplay;
9021c317b77024 Laurentiu Palcu  2020-07-31  235  	int min, max;
9021c317b77024 Laurentiu Palcu  2020-07-31  236  	int ret;
9021c317b77024 Laurentiu Palcu  2020-07-31  237  
ba5c1649465d40 Maxime Ripard    2021-02-19  238  	if (!fb || !new_plane_state->crtc)
9021c317b77024 Laurentiu Palcu  2020-07-31  239  		return 0;
9021c317b77024 Laurentiu Palcu  2020-07-31  240  
4a83c26a1d8702 Danilo Krummrich 2022-08-02  241  	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
4a83c26a1d8702 Danilo Krummrich 2022-08-02  242  	WARN_ON(!dma_obj);
9021c317b77024 Laurentiu Palcu  2020-07-31  243  
dec92020671c48 Maxime Ripard    2021-02-19  244  	crtc_state = drm_atomic_get_existing_crtc_state(state,
ba5c1649465d40 Maxime Ripard    2021-02-19  245  							new_plane_state->crtc);
9021c317b77024 Laurentiu Palcu  2020-07-31  246  
9021c317b77024 Laurentiu Palcu  2020-07-31  247  	hdisplay = crtc_state->adjusted_mode.hdisplay;
9021c317b77024 Laurentiu Palcu  2020-07-31  248  	vdisplay = crtc_state->adjusted_mode.vdisplay;
9021c317b77024 Laurentiu Palcu  2020-07-31  249  
ba5c1649465d40 Maxime Ripard    2021-02-19  250  	if (!dcss_plane_is_source_size_allowed(new_plane_state->src_w >> 16,
ba5c1649465d40 Maxime Ripard    2021-02-19  251  					       new_plane_state->src_h >> 16,
9021c317b77024 Laurentiu Palcu  2020-07-31  252  					       fb->format->format)) {
9021c317b77024 Laurentiu Palcu  2020-07-31  253  		DRM_DEBUG_KMS("Source plane size is not allowed!\n");
9021c317b77024 Laurentiu Palcu  2020-07-31  254  		return -EINVAL;
9021c317b77024 Laurentiu Palcu  2020-07-31  255  	}
9021c317b77024 Laurentiu Palcu  2020-07-31  256  
9021c317b77024 Laurentiu Palcu  2020-07-31  257  	dcss_scaler_get_min_max_ratios(dcss->scaler, dcss_plane->ch_num,
9021c317b77024 Laurentiu Palcu  2020-07-31  258  				       &min, &max);
9021c317b77024 Laurentiu Palcu  2020-07-31  259  
ba5c1649465d40 Maxime Ripard    2021-02-19  260  	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
9021c317b77024 Laurentiu Palcu  2020-07-31  261  						  min, max, !is_primary_plane,
9021c317b77024 Laurentiu Palcu  2020-07-31  262  						  false);
9021c317b77024 Laurentiu Palcu  2020-07-31  263  	if (ret)
9021c317b77024 Laurentiu Palcu  2020-07-31  264  		return ret;
9021c317b77024 Laurentiu Palcu  2020-07-31  265  
ba5c1649465d40 Maxime Ripard    2021-02-19  266  	if (!new_plane_state->visible)
9021c317b77024 Laurentiu Palcu  2020-07-31  267  		return 0;
9021c317b77024 Laurentiu Palcu  2020-07-31  268  
9021c317b77024 Laurentiu Palcu  2020-07-31  269  	if (!dcss_plane_can_rotate(fb->format,
9021c317b77024 Laurentiu Palcu  2020-07-31  270  				   !!(fb->flags & DRM_MODE_FB_MODIFIERS),
9021c317b77024 Laurentiu Palcu  2020-07-31  271  				   fb->modifier,
ba5c1649465d40 Maxime Ripard    2021-02-19  272  				   new_plane_state->rotation)) {
9021c317b77024 Laurentiu Palcu  2020-07-31  273  		DRM_DEBUG_KMS("requested rotation is not allowed!\n");
9021c317b77024 Laurentiu Palcu  2020-07-31  274  		return -EINVAL;
9021c317b77024 Laurentiu Palcu  2020-07-31  275  	}
9021c317b77024 Laurentiu Palcu  2020-07-31  276  
9021c317b77024 Laurentiu Palcu  2020-07-31  277  	if ((fb->flags & DRM_MODE_FB_MODIFIERS) &&
9021c317b77024 Laurentiu Palcu  2020-07-31  278  	    !plane->funcs->format_mod_supported(plane,
9021c317b77024 Laurentiu Palcu  2020-07-31  279  				fb->format->format,
9021c317b77024 Laurentiu Palcu  2020-07-31  280  				fb->modifier)) {
9021c317b77024 Laurentiu Palcu  2020-07-31  281  		DRM_DEBUG_KMS("Invalid modifier: %llx", fb->modifier);
9021c317b77024 Laurentiu Palcu  2020-07-31  282  		return -EINVAL;
9021c317b77024 Laurentiu Palcu  2020-07-31  283  	}
9021c317b77024 Laurentiu Palcu  2020-07-31  284  
42e55a1ee8798b Laurentiu Palcu  2019-11-22  285  	dcss_plane->use_dtrc = dcss_plane_use_dtrc(fb, plane->type);
42e55a1ee8798b Laurentiu Palcu  2019-11-22  286  
9021c317b77024 Laurentiu Palcu  2020-07-31  287  	return 0;
9021c317b77024 Laurentiu Palcu  2020-07-31  288  }
9021c317b77024 Laurentiu Palcu  2020-07-31  289  

:::::: The code at line 234 was first introduced by commit
:::::: 9021c317b77024fb2642af7e84ad944769ae0949 drm/imx: Add initial support for DCSS on iMX8MQ

:::::: TO: Laurentiu Palcu <laurentiu.palcu@nxp.com>
:::::: CC: Lucas Stach <l.stach@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
