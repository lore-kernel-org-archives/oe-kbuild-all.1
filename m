Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27247371
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675937755; x=1707473755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kk/ozyXnQbZ8e3RsrVY0WdDR2IRqfCYlc4pN/bSWmpg=;
  b=CugAaF7MPIqrEvhihusAMam0feHMRVyPNG9sd4sfj/cpXffoQPdY67+c
   1jTzCqCdmRaNOKR5LTsxJ3+oVClUFy755z+sfpW5qsBs06kUxC8Yv/LLT
   3lr2qJBTVKgMkUHGz7tyLPldIs6g1skrSUosF+q6X5jcQnEbPPDS9vSqV
   v1d3GfU/YQoEm9XDdJQA447wJ6nHXECenTjoxUiViocMbbZjChbmK+IkA
   WVxQLfVBy0oqYCaRDOV4NBDd94yNsDwAObov0IX8gIfPLY0IMlkB4lB4Q
   SEgZSL77pCmTFmhrWuvPgDMOjpDFIuRBP9dqdsvoXmN09Nyd7yO33lNxw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310423879"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="310423879"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 02:15:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="731205486"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="731205486"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2023 02:15:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ3xo-0004zy-1J;
	Thu, 09 Feb 2023 10:15:36 +0000
Date: Thu, 9 Feb 2023 18:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	George Shen <George.Shen@amd.com>
Subject: [agd5f:drm-next 43/60]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:889:33:
 warning: variable 'pre_connection_type' set but not used
Message-ID: <202302091845.EbCqtJ9Z-lkp@intel.com>
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
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230209/202302091845.EbCqtJ9Z-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 54618888d1ea7a26f8bccfb89e3c2420350c8047
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302091845.EbCqtJ9Z-lkp@intel.com

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c: In function 'query_hdcp_capability':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:497:42: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     497 |                 enum hdcp_message_status status = HDCP_MESSAGE_UNSUPPORTED;
         |                                          ^~~~~~
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


vim +/pre_connection_type +889 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c

   865	
   866	/**
   867	 * detect_link_and_local_sink() - Detect if a sink is attached to a given link
   868	 *
   869	 * link->local_sink is created or destroyed as needed.
   870	 *
   871	 * This does not create remote sinks.
   872	 */
   873	static bool detect_link_and_local_sink(struct dc_link *link,
   874					  enum dc_detect_reason reason)
   875	{
   876		struct dc_sink_init_data sink_init_data = { 0 };
   877		struct display_sink_capability sink_caps = { 0 };
   878		uint32_t i;
   879		bool converter_disable_audio = false;
   880		struct audio_support *aud_support = &link->dc->res_pool->audio_support;
   881		bool same_edid = false;
   882		enum dc_edid_status edid_status;
   883		struct dc_context *dc_ctx = link->ctx;
   884		struct dc *dc = dc_ctx->dc;
   885		struct dc_sink *sink = NULL;
   886		struct dc_sink *prev_sink = NULL;
   887		struct dpcd_caps prev_dpcd_caps;
   888		enum dc_connection_type new_connection_type = dc_connection_none;
 > 889		enum dc_connection_type pre_connection_type = dc_connection_none;
   890		const uint32_t post_oui_delay = 30; // 30ms
   891	
   892		DC_LOGGER_INIT(link->ctx->logger);
   893	
   894		if (dc_is_virtual_signal(link->connector_signal))
   895			return false;
   896	
   897		if (((link->connector_signal == SIGNAL_TYPE_LVDS ||
   898			link->connector_signal == SIGNAL_TYPE_EDP) &&
   899			(!link->dc->config.allow_edp_hotplug_detection)) &&
   900			link->local_sink) {
   901			// need to re-write OUI and brightness in resume case
   902			if (link->connector_signal == SIGNAL_TYPE_EDP &&
   903				(link->dpcd_sink_ext_caps.bits.oled == 1)) {
   904				dpcd_set_source_specific_data(link);
   905				msleep(post_oui_delay);
   906				set_default_brightness_aux(link);
   907				//TODO: use cached
   908			}
   909	
   910			return true;
   911		}
   912	
   913		if (!dc_link_detect_connection_type(link, &new_connection_type)) {
   914			BREAK_TO_DEBUGGER();
   915			return false;
   916		}
   917	
   918		prev_sink = link->local_sink;
   919		if (prev_sink) {
   920			dc_sink_retain(prev_sink);
   921			memcpy(&prev_dpcd_caps, &link->dpcd_caps, sizeof(struct dpcd_caps));
   922		}
   923	
   924		link_disconnect_sink(link);
   925		if (new_connection_type != dc_connection_none) {
   926			pre_connection_type = link->type;
   927			link->type = new_connection_type;
   928			link->link_state_valid = false;
   929	
   930			/* From Disconnected-to-Connected. */
   931			switch (link->connector_signal) {
   932			case SIGNAL_TYPE_HDMI_TYPE_A: {
   933				sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
   934				if (aud_support->hdmi_audio_native)
   935					sink_caps.signal = SIGNAL_TYPE_HDMI_TYPE_A;
   936				else
   937					sink_caps.signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
   938				break;
   939			}
   940	
   941			case SIGNAL_TYPE_DVI_SINGLE_LINK: {
   942				sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
   943				sink_caps.signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
   944				break;
   945			}
   946	
   947			case SIGNAL_TYPE_DVI_DUAL_LINK: {
   948				sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
   949				sink_caps.signal = SIGNAL_TYPE_DVI_DUAL_LINK;
   950				break;
   951			}
   952	
   953			case SIGNAL_TYPE_LVDS: {
   954				sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
   955				sink_caps.signal = SIGNAL_TYPE_LVDS;
   956				break;
   957			}
   958	
   959			case SIGNAL_TYPE_EDP: {
   960				detect_edp_sink_caps(link);
   961				read_current_link_settings_on_detect(link);
   962	
   963				/* Disable power sequence on MIPI panel + converter
   964				 */
   965				if (dc->config.enable_mipi_converter_optimization &&
   966					dc_ctx->dce_version == DCN_VERSION_3_01 &&
   967					link->dpcd_caps.sink_dev_id == DP_BRANCH_DEVICE_ID_0022B9 &&
   968					memcmp(&link->dpcd_caps.branch_dev_name, DP_SINK_BRANCH_DEV_NAME_7580,
   969						sizeof(link->dpcd_caps.branch_dev_name)) == 0) {
   970					dc->config.edp_no_power_sequencing = true;
   971	
   972					if (!link->dpcd_caps.set_power_state_capable_edp)
   973						link->wa_flags.dp_keep_receiver_powered = true;
   974				}
   975	
   976				sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
   977				sink_caps.signal = SIGNAL_TYPE_EDP;
   978				break;
   979			}
   980	
   981			case SIGNAL_TYPE_DISPLAY_PORT: {
   982	
   983				/* wa HPD high coming too early*/
   984				if (link->ep_type == DISPLAY_ENDPOINT_PHY &&
   985				    link->link_enc->features.flags.bits.DP_IS_USB_C == 1) {
   986	
   987					/* if alt mode times out, return false */
   988					if (!wait_for_entering_dp_alt_mode(link))
   989						return false;
   990				}
   991	
   992				if (!detect_dp(link, &sink_caps, reason)) {
   993					if (prev_sink)
   994						dc_sink_release(prev_sink);
   995					return false;
   996				}
   997	
   998				/* Active SST downstream branch device unplug*/
   999				if (link->type == dc_connection_sst_branch &&
  1000				    link->dpcd_caps.sink_count.bits.SINK_COUNT == 0) {
  1001					if (prev_sink)
  1002						/* Downstream unplug */
  1003						dc_sink_release(prev_sink);
  1004					return true;
  1005				}
  1006	
  1007				/* disable audio for non DP to HDMI active sst converter */
  1008				if (link->type == dc_connection_sst_branch &&
  1009						is_dp_active_dongle(link) &&
  1010						(link->dpcd_caps.dongle_type !=
  1011								DISPLAY_DONGLE_DP_HDMI_CONVERTER))
  1012					converter_disable_audio = true;
  1013				break;
  1014			}
  1015	
  1016			default:
  1017				DC_ERROR("Invalid connector type! signal:%d\n",
  1018					 link->connector_signal);
  1019				if (prev_sink)
  1020					dc_sink_release(prev_sink);
  1021				return false;
  1022			} /* switch() */
  1023	
  1024			if (link->dpcd_caps.sink_count.bits.SINK_COUNT)
  1025				link->dpcd_sink_count =
  1026					link->dpcd_caps.sink_count.bits.SINK_COUNT;
  1027			else
  1028				link->dpcd_sink_count = 1;
  1029	
  1030			set_ddc_transaction_type(link->ddc,
  1031							     sink_caps.transaction_type);
  1032	
  1033			link->aux_mode =
  1034				link_is_in_aux_transaction_mode(link->ddc);
  1035	
  1036			sink_init_data.link = link;
  1037			sink_init_data.sink_signal = sink_caps.signal;
  1038	
  1039			sink = dc_sink_create(&sink_init_data);
  1040			if (!sink) {
  1041				DC_ERROR("Failed to create sink!\n");
  1042				if (prev_sink)
  1043					dc_sink_release(prev_sink);
  1044				return false;
  1045			}
  1046	
  1047			sink->link->dongle_max_pix_clk = sink_caps.max_hdmi_pixel_clock;
  1048			sink->converter_disable_audio = converter_disable_audio;
  1049	
  1050			/* dc_sink_create returns a new reference */
  1051			link->local_sink = sink;
  1052	
  1053			edid_status = dm_helpers_read_local_edid(link->ctx,
  1054								 link, sink);
  1055	
  1056			switch (edid_status) {
  1057			case EDID_BAD_CHECKSUM:
  1058				DC_LOG_ERROR("EDID checksum invalid.\n");
  1059				break;
  1060			case EDID_PARTIAL_VALID:
  1061				DC_LOG_ERROR("Partial EDID valid, abandon invalid blocks.\n");
  1062				break;
  1063			case EDID_NO_RESPONSE:
  1064				DC_LOG_ERROR("No EDID read.\n");
  1065				/*
  1066				 * Abort detection for non-DP connectors if we have
  1067				 * no EDID
  1068				 *
  1069				 * DP needs to report as connected if HDP is high
  1070				 * even if we have no EDID in order to go to
  1071				 * fail-safe mode
  1072				 */
  1073				if (dc_is_hdmi_signal(link->connector_signal) ||
  1074				    dc_is_dvi_signal(link->connector_signal)) {
  1075					if (prev_sink)
  1076						dc_sink_release(prev_sink);
  1077	
  1078					return false;
  1079				}
  1080	
  1081				if (link->type == dc_connection_sst_branch &&
  1082						link->dpcd_caps.dongle_type ==
  1083							DISPLAY_DONGLE_DP_VGA_CONVERTER &&
  1084						reason == DETECT_REASON_HPDRX) {
  1085					/* Abort detection for DP-VGA adapters when EDID
  1086					 * can't be read and detection reason is VGA-side
  1087					 * hotplug
  1088					 */
  1089					if (prev_sink)
  1090						dc_sink_release(prev_sink);
  1091					link_disconnect_sink(link);
  1092	
  1093					return true;
  1094				}
  1095	
  1096				break;
  1097			default:
  1098				break;
  1099			}
  1100	
  1101			// Check if edid is the same
  1102			if ((prev_sink) &&
  1103			    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
  1104				same_edid = is_same_edid(&prev_sink->dc_edid,
  1105							 &sink->dc_edid);
  1106	
  1107			if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
  1108				link->ctx->dc->debug.hdmi20_disable = true;
  1109	
  1110			if (dc_is_hdmi_signal(link->connector_signal))
  1111				read_scdc_caps(link->ddc, link->local_sink);
  1112	
  1113			if (link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT &&
  1114			    sink_caps.transaction_type ==
  1115			    DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
  1116				/*
  1117				 * TODO debug why certain monitors don't like
  1118				 *  two link trainings
  1119				 */
  1120	#if defined(CONFIG_DRM_AMD_DC_HDCP)
  1121				query_hdcp_capability(sink->sink_signal, link);
  1122	#endif
  1123			} else {
  1124				// If edid is the same, then discard new sink and revert back to original sink
  1125				if (same_edid) {
  1126					link_disconnect_remap(prev_sink, link);
  1127					sink = prev_sink;
  1128					prev_sink = NULL;
  1129				}
  1130	#if defined(CONFIG_DRM_AMD_DC_HDCP)
  1131				query_hdcp_capability(sink->sink_signal, link);
  1132	#endif
  1133			}
  1134	
  1135			/* HDMI-DVI Dongle */
  1136			if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A &&
  1137			    !sink->edid_caps.edid_hdmi)
  1138				sink->sink_signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
  1139	
  1140			if (link->local_sink && dc_is_dp_signal(sink_caps.signal))
  1141				dp_trace_init(link);
  1142	
  1143			/* Connectivity log: detection */
  1144			for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
  1145				CONN_DATA_DETECT(link,
  1146						 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
  1147						 DC_EDID_BLOCK_SIZE,
  1148						 "%s: [Block %d] ", sink->edid_caps.display_name, i);
  1149			}
  1150	
  1151			DC_LOG_DETECTION_EDID_PARSER("%s: "
  1152				"manufacturer_id = %X, "
  1153				"product_id = %X, "
  1154				"serial_number = %X, "
  1155				"manufacture_week = %d, "
  1156				"manufacture_year = %d, "
  1157				"display_name = %s, "
  1158				"speaker_flag = %d, "
  1159				"audio_mode_count = %d\n",
  1160				__func__,
  1161				sink->edid_caps.manufacturer_id,
  1162				sink->edid_caps.product_id,
  1163				sink->edid_caps.serial_number,
  1164				sink->edid_caps.manufacture_week,
  1165				sink->edid_caps.manufacture_year,
  1166				sink->edid_caps.display_name,
  1167				sink->edid_caps.speaker_flags,
  1168				sink->edid_caps.audio_mode_count);
  1169	
  1170			for (i = 0; i < sink->edid_caps.audio_mode_count; i++) {
  1171				DC_LOG_DETECTION_EDID_PARSER("%s: mode number = %d, "
  1172					"format_code = %d, "
  1173					"channel_count = %d, "
  1174					"sample_rate = %d, "
  1175					"sample_size = %d\n",
  1176					__func__,
  1177					i,
  1178					sink->edid_caps.audio_modes[i].format_code,
  1179					sink->edid_caps.audio_modes[i].channel_count,
  1180					sink->edid_caps.audio_modes[i].sample_rate,
  1181					sink->edid_caps.audio_modes[i].sample_size);
  1182			}
  1183	
  1184			if (link->connector_signal == SIGNAL_TYPE_EDP) {
  1185				// Init dc_panel_config by HW config
  1186				if (dc_ctx->dc->res_pool->funcs->get_panel_config_defaults)
  1187					dc_ctx->dc->res_pool->funcs->get_panel_config_defaults(&link->panel_config);
  1188				// Pickup base DM settings
  1189				dm_helpers_init_panel_settings(dc_ctx, &link->panel_config, sink);
  1190				// Override dc_panel_config if system has specific settings
  1191				dm_helpers_override_panel_settings(dc_ctx, &link->panel_config);
  1192			}
  1193	
  1194		} else {
  1195			/* From Connected-to-Disconnected. */
  1196			link->type = dc_connection_none;
  1197			sink_caps.signal = SIGNAL_TYPE_NONE;
  1198	#if defined(CONFIG_DRM_AMD_DC_HDCP)
  1199			memset(&link->hdcp_caps, 0, sizeof(struct hdcp_caps));
  1200	#endif
  1201			/* When we unplug a passive DP-HDMI dongle connection, dongle_max_pix_clk
  1202			 *  is not cleared. If we emulate a DP signal on this connection, it thinks
  1203			 *  the dongle is still there and limits the number of modes we can emulate.
  1204			 *  Clear dongle_max_pix_clk on disconnect to fix this
  1205			 */
  1206			link->dongle_max_pix_clk = 0;
  1207	
  1208			dc_link_clear_dprx_states(link);
  1209			dp_trace_reset(link);
  1210		}
  1211	
  1212		LINK_INFO("link=%d, dc_sink_in=%p is now %s prev_sink=%p edid same=%d\n",
  1213			  link->link_index, sink,
  1214			  (sink_caps.signal ==
  1215			   SIGNAL_TYPE_NONE ? "Disconnected" : "Connected"),
  1216			  prev_sink, same_edid);
  1217	
  1218		if (prev_sink)
  1219			dc_sink_release(prev_sink);
  1220	
  1221		return true;
  1222	}
  1223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
