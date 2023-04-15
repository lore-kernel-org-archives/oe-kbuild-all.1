Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C77E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 00:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681518782; x=1713054782;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=c4wsCdXbD03gOLdnUvhQkUKOUWjAiifmr0DCybRYOHc=;
  b=UbE8cHezoBvjCopxCqs7UrHUSNXBmgK39j/+Tn5CF7f39Ixt1hdUsabV
   15vobWBYOqD/OYKmkOMjAWreFByV8tc3AVuKH7xWsyXPlS+mdu5VX1DqS
   2wUBilfblzTLMwJ+zk2W69t3Tmw9xKmn5+J1lKyGG08yP5QXDTYAD3X4L
   pLvKxSSYaQlAZxRpgxtuW/Tn0Ou4gjPwlkCDRR+y4hj9r/zKl3nskNGHa
   /dpK8lsgzV2Hl+x9dR96pMfVPKoFoD188ljvbEgfL9ZP9wnYxKa27Wm6a
   bj/1PQS99sMN95+D3gzhGmwCSNRHeRYR29vqQpeuX+vG3Iw95V9nPUgiH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="430891684"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="430891684"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 17:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="814094403"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="814094403"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Apr 2023 17:32:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnTqc-000aAP-1a;
	Sat, 15 Apr 2023 00:32:58 +0000
Date: Sat, 15 Apr 2023 08:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dominik Behr <dbehr@chromium.org>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14 835/9354]
 drivers/gpu/drm/i915/intel_display.c:3656:19: warning: variable 'crtc' set
 but not used
Message-ID: <202304150819.HCpCS4IV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: 17de7cbd45ef192faed9f7f17ddc8fe9155645b4 [835/9354] UPSTREAM: drm/atomic: Make atomic iterators less surprising
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230415/202304150819.HCpCS4IV-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/17de7cbd45ef192faed9f7f17ddc8fe9155645b4
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14
        git checkout 17de7cbd45ef192faed9f7f17ddc8fe9155645b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/gpu/drm/i915/ fs/proc/ kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150819.HCpCS4IV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/intel_display.c: In function '__intel_display_resume':
>> drivers/gpu/drm/i915/intel_display.c:3656:19: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
     struct drm_crtc *crtc;
                      ^~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'intel_encoders_pre_pll_enable':
>> drivers/gpu/drm/i915/intel_display.c:5249:24: warning: variable 'conn' set but not used [-Wunused-but-set-variable]
     struct drm_connector *conn;
                           ^~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'intel_encoders_pre_enable':
   drivers/gpu/drm/i915/intel_display.c:5269:24: warning: variable 'conn' set but not used [-Wunused-but-set-variable]
     struct drm_connector *conn;
                           ^~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'intel_encoders_enable':
   drivers/gpu/drm/i915/intel_display.c:5289:24: warning: variable 'conn' set but not used [-Wunused-but-set-variable]
     struct drm_connector *conn;
                           ^~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'intel_encoders_disable':
   drivers/gpu/drm/i915/intel_display.c:5309:24: warning: variable 'conn' set but not used [-Wunused-but-set-variable]
     struct drm_connector *conn;
                           ^~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'intel_encoders_post_disable':
   drivers/gpu/drm/i915/intel_display.c:5329:24: warning: variable 'conn' set but not used [-Wunused-but-set-variable]
     struct drm_connector *conn;
                           ^~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'intel_encoders_post_pll_disable':
   drivers/gpu/drm/i915/intel_display.c:5349:24: warning: variable 'conn' set but not used [-Wunused-but-set-variable]
     struct drm_connector *conn;
                           ^~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'chv_prepare_pll':
   drivers/gpu/drm/i915/intel_display.c:6776:13: warning: variable 'bestm1' set but not used [-Wunused-but-set-variable]
     u32 bestn, bestm1, bestm2, bestp1, bestp2, bestm2_frac;
                ^~~~~~
   drivers/gpu/drm/i915/intel_display.c:6776:6: warning: variable 'bestn' set but not used [-Wunused-but-set-variable]
     u32 bestn, bestm1, bestm2, bestp1, bestp2, bestm2_frac;
         ^~~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'i9xx_get_initial_plane_config':
   drivers/gpu/drm/i915/intel_display.c:7500:17: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
     u32 val, base, offset;
                    ^~~~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'skylake_get_initial_plane_config':
   drivers/gpu/drm/i915/intel_display.c:8526:17: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
     u32 val, base, offset, stride_mult, tiling;
                    ^~~~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'ironlake_get_initial_plane_config':
   drivers/gpu/drm/i915/intel_display.c:8638:17: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
     u32 val, base, offset;
                    ^~~~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'check_single_encoder_cloning':
>> drivers/gpu/drm/i915/intel_display.c:10472:24: warning: variable 'connector' set but not used [-Wunused-but-set-variable]
     struct drm_connector *connector;
                           ^~~~~~~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'intel_modeset_pipe_config':
   drivers/gpu/drm/i915/intel_display.c:10892:24: warning: variable 'connector' set but not used [-Wunused-but-set-variable]
     struct drm_connector *connector;
                           ^~~~~~~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'verify_encoder_state':
   drivers/gpu/drm/i915/intel_display.c:11520:24: warning: variable 'connector' set but not used [-Wunused-but-set-variable]
     struct drm_connector *connector;
                           ^~~~~~~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'sanitize_watermarks':
   drivers/gpu/drm/i915/intel_display.c:14419:19: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
     struct drm_crtc *crtc;
                      ^~~~
   In file included from include/uapi/linux/stddef.h:2:0,
                    from include/linux/stddef.h:5,
                    from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/list.h:5,
                    from include/linux/dmi.h:5,
                    from drivers/gpu/drm/i915/intel_display.c:27:
   drivers/gpu/drm/i915/intel_drv.h: In function 'enc_to_dig_port':
   include/linux/compiler.h:122:51: warning: this statement may fall through [-Wimplicit-fallthrough=]
    #define __branch_check__(x, expect, is_constant) ({   \
                                                      ^
   include/linux/compiler.h:147:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:2: note: in expansion of macro 'unlikely'
     unlikely(__ret_warn_on);     \
     ^~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:37:20: note: in expansion of macro 'WARN'
    #define WARN_ON(x) WARN((x), "%s", "WARN_ON(" __stringify(x) ")")
                       ^~~~
   drivers/gpu/drm/i915/intel_drv.h:1151:3: note: in expansion of macro 'WARN_ON'
      WARN_ON(!HAS_DDI(to_i915(encoder->dev)));
      ^~~~~~~
   In file included from drivers/gpu/drm/i915/intel_display.c:36:0:
   drivers/gpu/drm/i915/intel_drv.h:1152:2: note: here
     case INTEL_OUTPUT_DP:
     ^~~~
   In file included from include/uapi/linux/stddef.h:2:0,
                    from include/linux/stddef.h:5,
                    from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/list.h:5,
                    from include/linux/dmi.h:5,
                    from drivers/gpu/drm/i915/intel_display.c:27:
   drivers/gpu/drm/i915/intel_display.c: In function 'hsw_get_transcoder_state':
   include/linux/compiler.h:122:51: warning: this statement may fall through [-Wimplicit-fallthrough=]
    #define __branch_check__(x, expect, is_constant) ({   \
                                                      ^
   include/linux/compiler.h:147:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:2: note: in expansion of macro 'unlikely'
     unlikely(__ret_warn_on);     \
     ^~~~~~~~
   drivers/gpu/drm/i915/intel_display.c:9150:4: note: in expansion of macro 'WARN'
       WARN(1, "unknown pipe linked to edp transcoder\n");
       ^~~~
   drivers/gpu/drm/i915/intel_display.c:9151:3: note: here
      case TRANS_DDI_EDP_INPUT_A_ONOFF:
      ^~~~
   drivers/gpu/drm/i915/intel_display.c: In function 'check_digital_port_conflicts':
   drivers/gpu/drm/i915/intel_display.c:10818:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
       if (WARN_ON(!HAS_DDI(to_i915(dev))))
          ^
   drivers/gpu/drm/i915/intel_display.c:10820:3: note: here
      case INTEL_OUTPUT_DP:
      ^~~~
--
   drivers/gpu/drm/i915/intel_ddi.c: In function 'intel_ddi_get_crtc_new_encoder':
>> drivers/gpu/drm/i915/intel_ddi.c:988:24: warning: variable 'connector' set but not used [-Wunused-but-set-variable]
     struct drm_connector *connector;
                           ^~~~~~~~~
   In file included from include/uapi/linux/stddef.h:2:0,
                    from include/linux/stddef.h:5,
                    from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/uapi/drm/drm.h:41,
                    from include/uapi/drm/i915_drm.h:30,
                    from drivers/gpu/drm/i915/i915_drv.h:33,
                    from drivers/gpu/drm/i915/intel_ddi.c:28:
   drivers/gpu/drm/i915/intel_drv.h: In function 'enc_to_dig_port':
   include/linux/compiler.h:122:51: warning: this statement may fall through [-Wimplicit-fallthrough=]
    #define __branch_check__(x, expect, is_constant) ({   \
                                                      ^
   include/linux/compiler.h:147:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:2: note: in expansion of macro 'unlikely'
     unlikely(__ret_warn_on);     \
     ^~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:37:20: note: in expansion of macro 'WARN'
    #define WARN_ON(x) WARN((x), "%s", "WARN_ON(" __stringify(x) ")")
                       ^~~~
   drivers/gpu/drm/i915/intel_drv.h:1151:3: note: in expansion of macro 'WARN_ON'
      WARN_ON(!HAS_DDI(to_i915(encoder->dev)));
      ^~~~~~~
   In file included from drivers/gpu/drm/i915/i915_trace.h:11:0,
                    from drivers/gpu/drm/i915/i915_drv.h:3130,
                    from drivers/gpu/drm/i915/intel_ddi.c:28:
   drivers/gpu/drm/i915/intel_drv.h:1152:2: note: here
     case INTEL_OUTPUT_DP:
     ^~~~


vim +/crtc +3656 drivers/gpu/drm/i915/intel_display.c

29b9bde6f44ef0 Daniel Vetter     2014-04-24  3649  
73974893997479 Maarten Lankhorst 2016-08-05  3650  static int
73974893997479 Maarten Lankhorst 2016-08-05  3651  __intel_display_resume(struct drm_device *dev,
581e49fe6b411f Maarten Lankhorst 2017-01-16  3652  		       struct drm_atomic_state *state,
581e49fe6b411f Maarten Lankhorst 2017-01-16  3653  		       struct drm_modeset_acquire_ctx *ctx)
73974893997479 Maarten Lankhorst 2016-08-05  3654  {
73974893997479 Maarten Lankhorst 2016-08-05  3655  	struct drm_crtc_state *crtc_state;
73974893997479 Maarten Lankhorst 2016-08-05 @3656  	struct drm_crtc *crtc;
73974893997479 Maarten Lankhorst 2016-08-05  3657  	int i, ret;
73974893997479 Maarten Lankhorst 2016-08-05  3658  
aecd36b8a16b23 Ville Syrjälä     2017-06-01  3659  	intel_modeset_setup_hw_state(dev, ctx);
29b74b7f17ab23 Tvrtko Ursulin    2016-11-16  3660  	i915_redisable_vga(to_i915(dev));
11c22da619101a Maarten Lankhorst 2015-09-10  3661  
73974893997479 Maarten Lankhorst 2016-08-05  3662  	if (!state)
73974893997479 Maarten Lankhorst 2016-08-05  3663  		return 0;
73974893997479 Maarten Lankhorst 2016-08-05  3664  
aa5e9b47b90156 Maarten Lankhorst 2017-03-09  3665  	/*
aa5e9b47b90156 Maarten Lankhorst 2017-03-09  3666  	 * We've duplicated the state, pointers to the old state are invalid.
aa5e9b47b90156 Maarten Lankhorst 2017-03-09  3667  	 *
aa5e9b47b90156 Maarten Lankhorst 2017-03-09  3668  	 * Don't attempt to use the old state until we commit the duplicated state.
aa5e9b47b90156 Maarten Lankhorst 2017-03-09  3669  	 */
aa5e9b47b90156 Maarten Lankhorst 2017-03-09  3670  	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
73974893997479 Maarten Lankhorst 2016-08-05  3671  		/*
73974893997479 Maarten Lankhorst 2016-08-05  3672  		 * Force recalculation even if we restore
73974893997479 Maarten Lankhorst 2016-08-05  3673  		 * current state. With fast modeset this may not result
73974893997479 Maarten Lankhorst 2016-08-05  3674  		 * in a modeset when the state is compatible.
73974893997479 Maarten Lankhorst 2016-08-05  3675  		 */
73974893997479 Maarten Lankhorst 2016-08-05  3676  		crtc_state->mode_changed = true;
96a02917a0131e Ville Syrjälä     2013-02-18  3677  	}
73974893997479 Maarten Lankhorst 2016-08-05  3678  
73974893997479 Maarten Lankhorst 2016-08-05  3679  	/* ignore any reset values/BIOS leftovers in the WM registers */
602ae835505603 Ville Syrjälä     2017-03-02  3680  	if (!HAS_GMCH_DISPLAY(to_i915(dev)))
73974893997479 Maarten Lankhorst 2016-08-05  3681  		to_intel_atomic_state(state)->skip_intermediate_wm = true;
73974893997479 Maarten Lankhorst 2016-08-05  3682  
581e49fe6b411f Maarten Lankhorst 2017-01-16  3683  	ret = drm_atomic_helper_commit_duplicated_state(state, ctx);
73974893997479 Maarten Lankhorst 2016-08-05  3684  
73974893997479 Maarten Lankhorst 2016-08-05  3685  	WARN_ON(ret == -EDEADLK);
73974893997479 Maarten Lankhorst 2016-08-05  3686  	return ret;
96a02917a0131e Ville Syrjälä     2013-02-18  3687  }
96a02917a0131e Ville Syrjälä     2013-02-18  3688  

:::::: The code at line 3656 was first introduced by commit
:::::: 739748939974791b84629a8790527a16f76873a4 drm/i915: Fix modeset handling during gpu reset, v5.

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
