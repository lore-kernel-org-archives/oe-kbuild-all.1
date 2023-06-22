Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035FC1F182
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 18:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687457140; x=1718993140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hbB88ppCYthBXOuyGODZydVt2Xx3uID4S876mcH6Ryw=;
  b=VRy7UvYiywrZIJHEXv6ktVN23LRQXmLZ4bWFXgyF4PfML/NEmHmi9eqT
   zXrAHpM5uayWKKaceMEMgWVyWklt2/YM1qiE0GmfczLY0s4zE3rlMKQY/
   XyOIo+ZX0VM7NI8/rPmRceO0TAlF8Jp1tv4/UXOlSzq9bk1xUq26nUGZi
   9jqOIySkgmnvVAq/dLphqL/LDwlmzP8b5YROwIOZE2oJCME7WJQGvqqX1
   eioJSykyEVLCXFLdn57SJmrpEJnEwo1BZfqxmBuhmiftW1urEA1uxAf9S
   pkxtyP/OkRJHjAIk7KkEu15v0XudiNfEs+ZN/oT943kPFWAboN5oqI6uD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359432199"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="359432199"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 11:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="1045317942"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="1045317942"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2023 11:04:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCOfl-0007jH-00;
	Thu, 22 Jun 2023 18:04:45 +0000
Date: Fri, 23 Jun 2023 02:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2j 16/18]
 drivers/gpu/drm/logicvc/logicvc_layer.c:215:3: error: call to undeclared
 function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202306230141.VGVggfSt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-fix-2j
head:   ebf0b59160bae027e4baca427ca5997c916b10b5
commit: 479cb141e36f15a0a9a39b570b4525ee4bd1ae9f [16/18] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: i386-randconfig-i003-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230141.VGVggfSt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230141.VGVggfSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230141.VGVggfSt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/logicvc/logicvc_layer.c:215:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   drm_dbg_kms(drm_dev, "Setting layer %d alpha to %d/%d\n", index,
                   ^
   include/drm/drm_print.h:504:2: note: expanded from macro 'drm_dbg_kms'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/logicvc/logicvc_layer.c:334:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           drm_dbg_kms(drm_dev, "Found layer %d buffer setup for 0x%x byte gap:\n",
           ^
   include/drm/drm_print.h:504:2: note: expanded from macro 'drm_dbg_kms'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/logicvc/logicvc_layer.c:508:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   drm_dbg_kms(drm_dev, "Using layer #%d as background layer\n",
                   ^
   include/drm/drm_print.h:504:2: note: expanded from macro 'drm_dbg_kms'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/logicvc/logicvc_layer.c:535:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           drm_dbg_kms(drm_dev, "Giving layer #%d zpos %d\n", index, zpos);
           ^
   include/drm/drm_print.h:504:2: note: expanded from macro 'drm_dbg_kms'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   4 errors generated.
--
>> drivers/gpu/drm/display/drm_dp_aux_dev.c:299:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG("drm_dp_aux_dev: aux [%s] unregistering\n", aux->name);
           ^
   include/drm/drm_print.h:576:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/display/drm_dp_aux_dev.c:321:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG("drm_dp_aux_dev: aux [%s] registered as minor %d\n",
           ^
   include/drm/drm_print.h:576:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   2 errors generated.
--
>> drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:118:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("DP bandwidth (%#02x) not supported\n", dp_bw);
                   ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:183:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG("Enable downspread on the sink\n");
                   ^
   include/drm/drm_print.h:576:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:719:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG("No panel found\n");
                   ^
   include/drm/drm_print.h:576:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   3 errors generated.


vim +/_dynamic_func_call_cls +215 drivers/gpu/drm/logicvc/logicvc_layer.c

efeeaefe9be56e Paul Kocialkowski 2022-05-20  136  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  137  static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  138  					struct drm_atomic_state *state)
efeeaefe9be56e Paul Kocialkowski 2022-05-20  139  {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  140  	struct logicvc_layer *layer = logicvc_layer(drm_plane);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  141  	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  142  	struct drm_device *drm_dev = &logicvc->drm_dev;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  143  	struct drm_plane_state *new_state =
efeeaefe9be56e Paul Kocialkowski 2022-05-20  144  		drm_atomic_get_new_plane_state(state, drm_plane);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  145  	struct drm_crtc *drm_crtc = &logicvc->crtc->drm_crtc;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  146  	struct drm_display_mode *mode = &drm_crtc->state->adjusted_mode;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  147  	struct drm_framebuffer *fb = new_state->fb;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  148  	struct logicvc_layer_buffer_setup setup = {};
efeeaefe9be56e Paul Kocialkowski 2022-05-20  149  	u32 index = layer->index;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  150  	u32 reg;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  151  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  152  	/* Layer dimensions */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  153  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  154  	regmap_write(logicvc->regmap, LOGICVC_LAYER_WIDTH_REG(index),
efeeaefe9be56e Paul Kocialkowski 2022-05-20  155  		     new_state->crtc_w - 1);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  156  	regmap_write(logicvc->regmap, LOGICVC_LAYER_HEIGHT_REG(index),
efeeaefe9be56e Paul Kocialkowski 2022-05-20  157  		     new_state->crtc_h - 1);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  158  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  159  	if (logicvc->caps->layer_address) {
6bcfe8eaeef01f Danilo Krummrich  2022-08-02  160  		phys_addr_t fb_addr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  161  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  162  		regmap_write(logicvc->regmap, LOGICVC_LAYER_ADDRESS_REG(index),
efeeaefe9be56e Paul Kocialkowski 2022-05-20  163  			     fb_addr);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  164  	} else {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  165  		/* Rely on offsets to configure the address. */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  166  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  167  		logicvc_layer_buffer_find_setup(logicvc, layer, new_state,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  168  						&setup);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  169  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  170  		/* Layer memory offsets */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  171  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  172  		regmap_write(logicvc->regmap, LOGICVC_BUFFER_SEL_REG,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  173  			     LOGICVC_BUFFER_SEL_VALUE(index, setup.buffer_sel));
efeeaefe9be56e Paul Kocialkowski 2022-05-20  174  		regmap_write(logicvc->regmap, LOGICVC_LAYER_HOFFSET_REG(index),
efeeaefe9be56e Paul Kocialkowski 2022-05-20  175  			     setup.hoffset);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  176  		regmap_write(logicvc->regmap, LOGICVC_LAYER_VOFFSET_REG(index),
efeeaefe9be56e Paul Kocialkowski 2022-05-20  177  			     setup.voffset);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  178  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  179  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  180  	/* Layer position */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  181  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  182  	regmap_write(logicvc->regmap, LOGICVC_LAYER_HPOSITION_REG(index),
efeeaefe9be56e Paul Kocialkowski 2022-05-20  183  		     mode->hdisplay - 1 - new_state->crtc_x);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  184  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  185  	/* Vertical position must be set last to sync layer register changes. */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  186  	regmap_write(logicvc->regmap, LOGICVC_LAYER_VPOSITION_REG(index),
efeeaefe9be56e Paul Kocialkowski 2022-05-20  187  		     mode->vdisplay - 1 - new_state->crtc_y);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  188  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  189  	/* Layer alpha */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  190  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  191  	if (layer->config.alpha_mode == LOGICVC_LAYER_ALPHA_LAYER) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  192  		u32 alpha_bits;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  193  		u32 alpha_max;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  194  		u32 alpha;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  195  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  196  		switch (layer->config.depth) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  197  		case 8:
efeeaefe9be56e Paul Kocialkowski 2022-05-20  198  			alpha_bits = 3;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  199  			break;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  200  		case 16:
efeeaefe9be56e Paul Kocialkowski 2022-05-20  201  			if (layer->config.colorspace ==
efeeaefe9be56e Paul Kocialkowski 2022-05-20  202  			    LOGICVC_LAYER_COLORSPACE_YUV)
efeeaefe9be56e Paul Kocialkowski 2022-05-20  203  				alpha_bits = 8;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  204  			else
efeeaefe9be56e Paul Kocialkowski 2022-05-20  205  				alpha_bits = 6;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  206  			break;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  207  		default:
efeeaefe9be56e Paul Kocialkowski 2022-05-20  208  			alpha_bits = 8;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  209  			break;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  210  		}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  211  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  212  		alpha_max = BIT(alpha_bits) - 1;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  213  		alpha = new_state->alpha * alpha_max / DRM_BLEND_ALPHA_OPAQUE;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  214  
efeeaefe9be56e Paul Kocialkowski 2022-05-20 @215  		drm_dbg_kms(drm_dev, "Setting layer %d alpha to %d/%d\n", index,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  216  			    alpha, alpha_max);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  217  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  218  		regmap_write(logicvc->regmap, LOGICVC_LAYER_ALPHA_REG(index),
efeeaefe9be56e Paul Kocialkowski 2022-05-20  219  			     alpha);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  220  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  221  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  222  	/* Layer control */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  223  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  224  	reg = LOGICVC_LAYER_CTRL_ENABLE;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  225  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  226  	if (logicvc_layer_format_inverted(fb->format->format))
efeeaefe9be56e Paul Kocialkowski 2022-05-20  227  		reg |= LOGICVC_LAYER_CTRL_PIXEL_FORMAT_INVERT;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  228  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  229  	reg |= LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  230  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  231  	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), reg);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  232  }
efeeaefe9be56e Paul Kocialkowski 2022-05-20  233  

:::::: The code at line 215 was first introduced by commit
:::::: efeeaefe9be56e8ae5e5b4e9ff6d2275ec977ec5 drm: Add support for the LogiCVC display controller

:::::: TO: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
:::::: CC: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
