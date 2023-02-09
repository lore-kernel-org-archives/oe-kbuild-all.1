Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38BC33FF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 08:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675932216; x=1707468216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CAIay2v3446jrwLCqw3uFri1Zgy1cuchjiCfmhEBypM=;
  b=KczUe2uLP8bCSIZSG8Z5J2gEPCMJsIIVibibaz9IiMA7Yl+56Roh/pGT
   3coskoSnVu2iZ1Ejl7ClbqLuhBh6MimCfNqKRnXTBhzoIGP0iJ06kKucq
   tJQ2JEB/2l7k4zlCK49tAaAa2mRl7rByC8w1c1Q49Xox6bzqKHH3VtgIf
   +QQKDoyj9Gfng5nF+9UoO/hd4Mr8UZPLj4Fl0fb8LUCENzqjoroNLE4Eg
   2diZO+H38iKVQSPGKN5Dgtn7gIx+FD/YmqJH4/6auHG9tmDfpc7nrnxoG
   sKClhZlsQzmv5SysyGgUulJ99Cb9wdGXj6j64FPWKfdPuBhHXEtUdCRGI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="313686645"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="313686645"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 00:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="776391389"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="776391389"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Feb 2023 00:43:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ2Wi-0004wp-0h;
	Thu, 09 Feb 2023 08:43:32 +0000
Date: Thu, 9 Feb 2023 16:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	George Shen <George.Shen@amd.com>
Subject: [agd5f:drm-next 43/60]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:126:66:
 error: 'const struct dc_dsc_config' has no member named 'is_frl'
Message-ID: <202302091644.ur4dWAb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   8e08e2d5d7c66e4267d84d9f6bc6c4eabd820ae3
commit: 54618888d1ea7a26f8bccfb89e3c2420350c8047 [43/60] drm/amd/display: break down dc_link.c
config: microblaze-randconfig-r013-20230209 (https://download.01.org/0day-ci/archive/20230209/202302091644.ur4dWAb1-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 54618888d1ea7a26f8bccfb89e3c2420350c8047
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302091644.ur4dWAb1-lkp@intel.com

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c: In function 'detect_link_and_local_sink':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:889:33: warning: variable 'pre_connection_type' set but not used [-Wunused-but-set-variable]
     889 |         enum dc_connection_type pre_connection_type = dc_connection_none;
         |                                 ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link.h:40,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:33:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:143:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     143 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:140:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     140 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:138:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     138 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:133:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     133 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c: In function 'dp_active_dongle_validate_timing':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:126:66: error: 'const struct dc_dsc_config' has no member named 'is_frl'
     126 |                         if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
         |                                                                  ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link.h:40,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:31:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:143:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     143 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:140:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     140 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:138:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     138 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:135:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     135 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:133:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     133 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +126 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c

    53	
    54	static bool dp_active_dongle_validate_timing(
    55			const struct dc_crtc_timing *timing,
    56			const struct dpcd_caps *dpcd_caps)
    57	{
    58		const struct dc_dongle_caps *dongle_caps = &dpcd_caps->dongle_caps;
    59	
    60		switch (dpcd_caps->dongle_type) {
    61		case DISPLAY_DONGLE_DP_VGA_CONVERTER:
    62		case DISPLAY_DONGLE_DP_DVI_CONVERTER:
    63		case DISPLAY_DONGLE_DP_DVI_DONGLE:
    64			if (timing->pixel_encoding == PIXEL_ENCODING_RGB)
    65				return true;
    66			else
    67				return false;
    68		default:
    69			break;
    70		}
    71	
    72		if (dpcd_caps->dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER &&
    73				dongle_caps->extendedCapValid == true) {
    74			/* Check Pixel Encoding */
    75			switch (timing->pixel_encoding) {
    76			case PIXEL_ENCODING_RGB:
    77			case PIXEL_ENCODING_YCBCR444:
    78				break;
    79			case PIXEL_ENCODING_YCBCR422:
    80				if (!dongle_caps->is_dp_hdmi_ycbcr422_pass_through)
    81					return false;
    82				break;
    83			case PIXEL_ENCODING_YCBCR420:
    84				if (!dongle_caps->is_dp_hdmi_ycbcr420_pass_through)
    85					return false;
    86				break;
    87			default:
    88				/* Invalid Pixel Encoding*/
    89				return false;
    90			}
    91	
    92			switch (timing->display_color_depth) {
    93			case COLOR_DEPTH_666:
    94			case COLOR_DEPTH_888:
    95				/*888 and 666 should always be supported*/
    96				break;
    97			case COLOR_DEPTH_101010:
    98				if (dongle_caps->dp_hdmi_max_bpc < 10)
    99					return false;
   100				break;
   101			case COLOR_DEPTH_121212:
   102				if (dongle_caps->dp_hdmi_max_bpc < 12)
   103					return false;
   104				break;
   105			case COLOR_DEPTH_141414:
   106			case COLOR_DEPTH_161616:
   107			default:
   108				/* These color depths are currently not supported */
   109				return false;
   110			}
   111	
   112			/* Check 3D format */
   113			switch (timing->timing_3d_format) {
   114			case TIMING_3D_FORMAT_NONE:
   115			case TIMING_3D_FORMAT_FRAME_ALTERNATE:
   116				/*Only frame alternate 3D is supported on active dongle*/
   117				break;
   118			default:
   119				/*other 3D formats are not supported due to bad infoframe translation */
   120				return false;
   121			}
   122	
   123			if (dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps > 0) { // DP to HDMI FRL converter
   124				struct dc_crtc_timing outputTiming = *timing;
   125	
 > 126				if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
   127					/* DP input has DSC, HDMI FRL output doesn't have DSC, remove DSC from output timing */
   128					outputTiming.flags.DSC = 0;
   129				if (dc_bandwidth_in_kbps_from_timing(&outputTiming) > dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps)
   130					return false;
   131			} else { // DP to HDMI TMDS converter
   132				if (get_tmds_output_pixel_clock_100hz(timing) > (dongle_caps->dp_hdmi_max_pixel_clk_in_khz * 10))
   133					return false;
   134			}
   135		}
   136	
   137		if (dpcd_caps->channel_coding_cap.bits.DP_128b_132b_SUPPORTED == 0 &&
   138				dpcd_caps->dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_PASSTHROUGH_SUPPORT == 0 &&
   139				dongle_caps->dfp_cap_ext.supported) {
   140	
   141			if (dongle_caps->dfp_cap_ext.max_pixel_rate_in_mps < (timing->pix_clk_100hz / 10000))
   142				return false;
   143	
   144			if (dongle_caps->dfp_cap_ext.max_video_h_active_width < timing->h_addressable)
   145				return false;
   146	
   147			if (dongle_caps->dfp_cap_ext.max_video_v_active_height < timing->v_addressable)
   148				return false;
   149	
   150			if (timing->pixel_encoding == PIXEL_ENCODING_RGB) {
   151				if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
   152					return false;
   153				if (timing->display_color_depth == COLOR_DEPTH_666 &&
   154						!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_6bpc)
   155					return false;
   156				else if (timing->display_color_depth == COLOR_DEPTH_888 &&
   157						!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_8bpc)
   158					return false;
   159				else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
   160						!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_10bpc)
   161					return false;
   162				else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
   163						!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_12bpc)
   164					return false;
   165				else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
   166						!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_16bpc)
   167					return false;
   168			} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR444) {
   169				if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
   170					return false;
   171				if (timing->display_color_depth == COLOR_DEPTH_888 &&
   172						!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_8bpc)
   173					return false;
   174				else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
   175						!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_10bpc)
   176					return false;
   177				else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
   178						!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_12bpc)
   179					return false;
   180				else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
   181						!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_16bpc)
   182					return false;
   183			} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422) {
   184				if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
   185					return false;
   186				if (timing->display_color_depth == COLOR_DEPTH_888 &&
   187						!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_8bpc)
   188					return false;
   189				else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
   190						!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_10bpc)
   191					return false;
   192				else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
   193						!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_12bpc)
   194					return false;
   195				else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
   196						!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_16bpc)
   197					return false;
   198			} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420) {
   199				if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
   200					return false;
   201				if (timing->display_color_depth == COLOR_DEPTH_888 &&
   202						!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_8bpc)
   203					return false;
   204				else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
   205						!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_10bpc)
   206					return false;
   207				else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
   208						!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_12bpc)
   209					return false;
   210				else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
   211						!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_16bpc)
   212					return false;
   213			}
   214		}
   215	
   216		return true;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
