Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F38AFC3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681842098; x=1713378098;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kkVVCzrn7RxaoexFxnJzTlXefwIFTHyrClsErzlmY1w=;
  b=Q8IA7NADRc5ub6CAI8h0M37ibyFD3VTQDZ9yWRQah8H1MREB/tiDGoMd
   99ItMVRyZD1oYTYbmD6A+20NQf9RwihIX2xqDej1I+EH1twvDMlG/2NO9
   jIe20IhRCoHsV1YD4VNI2YCg7E8Dn322qt28WavRiJz5DVn4ivD+1aMwy
   pmtfg76nWlWdDriKDc8pkhpdPpt3v+lTNh7QZWWSNX/frZMbTcEKyVsBf
   ycdL7wIEtvPeLzln758IdT+Yym6hN8/o3g/AsfKzWV45oEOCOnFax+Ezk
   z3VB579uPfv567lSK9bFutlKaWLZ+m7qUrU0sqXJWbI3qYmIUT1b260cP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342737992"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="342737992"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 11:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="1020880797"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="1020880797"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Apr 2023 11:21:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1popwr-000dsV-0G;
	Tue, 18 Apr 2023 18:21:01 +0000
Date: Wed, 19 Apr 2023 02:20:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 1940/2236]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_training.c:1583:38:
 warning: variable 'result' set but not used
Message-ID: <202304190246.x6ZPy7g4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   3fd2d2340000361c6df236099087eda85d92a97a
commit: e835c11dcd55269e6cfeb2915a6852e6b973348f [1940/2236] drm/amd/display: move dp link training logic to link_dp_training
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304190246.x6ZPy7g4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/e835c11dcd55269e6cfeb2915a6852e6b973348f
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 6.1/linux
        git checkout e835c11dcd55269e6cfeb2915a6852e6b973348f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190246.x6ZPy7g4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_training.c: In function 'perform_link_training_with_retries':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_training.c:1583:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
    1583 |                                 bool result;
         |                                      ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link.h:40,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_training.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_training.c:33:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:142:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     142 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:139:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     139 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:134:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     134 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:131:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     131 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/result +1583 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_training.c

  1519	
  1520	bool perform_link_training_with_retries(
  1521		const struct dc_link_settings *link_setting,
  1522		bool skip_video_pattern,
  1523		int attempts,
  1524		struct pipe_ctx *pipe_ctx,
  1525		enum signal_type signal,
  1526		bool do_fallback)
  1527	{
  1528		int j;
  1529		uint8_t delay_between_attempts = LINK_TRAINING_RETRY_DELAY;
  1530		struct dc_stream_state *stream = pipe_ctx->stream;
  1531		struct dc_link *link = stream->link;
  1532		enum dp_panel_mode panel_mode = dp_get_panel_mode(link);
  1533		enum link_training_result status = LINK_TRAINING_CR_FAIL_LANE0;
  1534		struct dc_link_settings cur_link_settings = *link_setting;
  1535		struct dc_link_settings max_link_settings = *link_setting;
  1536		const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
  1537		int fail_count = 0;
  1538		bool is_link_bw_low = false; /* link bandwidth < stream bandwidth */
  1539		bool is_link_bw_min = /* RBR x 1 */
  1540			(cur_link_settings.link_rate <= LINK_RATE_LOW) &&
  1541			(cur_link_settings.lane_count <= LANE_COUNT_ONE);
  1542	
  1543		dp_trace_commit_lt_init(link);
  1544	
  1545	
  1546		if (dp_get_link_encoding_format(&cur_link_settings) == DP_8b_10b_ENCODING)
  1547			/* We need to do this before the link training to ensure the idle
  1548			 * pattern in SST mode will be sent right after the link training
  1549			 */
  1550			link_hwss->setup_stream_encoder(pipe_ctx);
  1551	
  1552		dp_trace_set_lt_start_timestamp(link, false);
  1553		j = 0;
  1554		while (j < attempts && fail_count < (attempts * 10)) {
  1555	
  1556			DC_LOG_HW_LINK_TRAINING("%s: Beginning link(%d) training attempt %u of %d @ rate(%d) x lane(%d)\n",
  1557				__func__, link->link_index, (unsigned int)j + 1, attempts, cur_link_settings.link_rate,
  1558				cur_link_settings.lane_count);
  1559	
  1560			dp_enable_link_phy(
  1561				link,
  1562				&pipe_ctx->link_res,
  1563				signal,
  1564				pipe_ctx->clock_source->id,
  1565				&cur_link_settings);
  1566	
  1567			if (stream->sink_patches.dppowerup_delay > 0) {
  1568				int delay_dp_power_up_in_ms = stream->sink_patches.dppowerup_delay;
  1569	
  1570				msleep(delay_dp_power_up_in_ms);
  1571			}
  1572	
  1573	#ifdef CONFIG_DRM_AMD_DC_HDCP
  1574			if (panel_mode == DP_PANEL_MODE_EDP) {
  1575				struct cp_psp *cp_psp = &stream->ctx->cp_psp;
  1576	
  1577				if (cp_psp && cp_psp->funcs.enable_assr) {
  1578					/* ASSR is bound to fail with unsigned PSP
  1579					 * verstage used during devlopment phase.
  1580					 * Report and continue with eDP panel mode to
  1581					 * perform eDP link training with right settings
  1582					 */
> 1583					bool result;
  1584					result = cp_psp->funcs.enable_assr(cp_psp->handle, link);
  1585				}
  1586			}
  1587	#endif
  1588	
  1589			dp_set_panel_mode(link, panel_mode);
  1590	
  1591			if (link->aux_access_disabled) {
  1592				dc_link_dp_perform_link_training_skip_aux(link, &pipe_ctx->link_res, &cur_link_settings);
  1593				return true;
  1594			} else {
  1595				/** @todo Consolidate USB4 DP and DPx.x training. */
  1596				if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
  1597					status = dc_link_dpia_perform_link_training(
  1598							link,
  1599							&pipe_ctx->link_res,
  1600							&cur_link_settings,
  1601							skip_video_pattern);
  1602	
  1603					/* Transmit idle pattern once training successful. */
  1604					if (status == LINK_TRAINING_SUCCESS && !is_link_bw_low) {
  1605						dp_set_hw_test_pattern(link, &pipe_ctx->link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
  1606						// Update verified link settings to current one
  1607						// Because DPIA LT might fallback to lower link setting.
  1608						if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
  1609							link->verified_link_cap.link_rate = link->cur_link_settings.link_rate;
  1610							link->verified_link_cap.lane_count = link->cur_link_settings.lane_count;
  1611							dm_helpers_dp_mst_update_branch_bandwidth(link->ctx, link);
  1612						}
  1613					}
  1614				} else {
  1615					status = dp_perform_link_training(
  1616							link,
  1617							&pipe_ctx->link_res,
  1618							&cur_link_settings,
  1619							skip_video_pattern);
  1620				}
  1621	
  1622				dp_trace_lt_total_count_increment(link, false);
  1623				dp_trace_lt_result_update(link, status, false);
  1624				dp_trace_set_lt_end_timestamp(link, false);
  1625				if (status == LINK_TRAINING_SUCCESS && !is_link_bw_low)
  1626					return true;
  1627			}
  1628	
  1629			fail_count++;
  1630			dp_trace_lt_fail_count_update(link, fail_count, false);
  1631			if (link->ep_type == DISPLAY_ENDPOINT_PHY) {
  1632				/* latest link training still fail or link training is aborted
  1633				 * skip delay and keep PHY on
  1634				 */
  1635				if (j == (attempts - 1) || (status == LINK_TRAINING_ABORT))
  1636					break;
  1637			}
  1638	
  1639			DC_LOG_WARNING("%s: Link(%d) training attempt %u of %d failed @ rate(%d) x lane(%d) : fail reason:(%d)\n",
  1640				__func__, link->link_index, (unsigned int)j + 1, attempts, cur_link_settings.link_rate,
  1641				cur_link_settings.lane_count, status);
  1642	
  1643			dp_disable_link_phy(link, &pipe_ctx->link_res, signal);
  1644	
  1645			/* Abort link training if failure due to sink being unplugged. */
  1646			if (status == LINK_TRAINING_ABORT) {
  1647				enum dc_connection_type type = dc_connection_none;
  1648	
  1649				dc_link_detect_sink(link, &type);
  1650				if (type == dc_connection_none) {
  1651					DC_LOG_HW_LINK_TRAINING("%s: Aborting training because sink unplugged\n", __func__);
  1652					break;
  1653				}
  1654			}
  1655	
  1656			/* Try to train again at original settings if:
  1657			 * - not falling back between training attempts;
  1658			 * - aborted previous attempt due to reasons other than sink unplug;
  1659			 * - successfully trained but at a link rate lower than that required by stream;
  1660			 * - reached minimum link bandwidth.
  1661			 */
  1662			if (!do_fallback || (status == LINK_TRAINING_ABORT) ||
  1663					(status == LINK_TRAINING_SUCCESS && is_link_bw_low) ||
  1664					is_link_bw_min) {
  1665				j++;
  1666				cur_link_settings = *link_setting;
  1667				delay_between_attempts += LINK_TRAINING_RETRY_DELAY;
  1668				is_link_bw_low = false;
  1669				is_link_bw_min = (cur_link_settings.link_rate <= LINK_RATE_LOW) &&
  1670					(cur_link_settings.lane_count <= LANE_COUNT_ONE);
  1671	
  1672			} else if (do_fallback) { /* Try training at lower link bandwidth if doing fallback. */
  1673				uint32_t req_bw;
  1674				uint32_t link_bw;
  1675	
  1676				decide_fallback_link_setting(link, &max_link_settings,
  1677						&cur_link_settings, status);
  1678				/* Flag if reduced link bandwidth no longer meets stream requirements or fallen back to
  1679				 * minimum link bandwidth.
  1680				 */
  1681				req_bw = dc_bandwidth_in_kbps_from_timing(&stream->timing);
  1682				link_bw = dc_link_bandwidth_kbps(link, &cur_link_settings);
  1683				is_link_bw_low = (req_bw > link_bw);
  1684				is_link_bw_min = ((cur_link_settings.link_rate <= LINK_RATE_LOW) &&
  1685					(cur_link_settings.lane_count <= LANE_COUNT_ONE));
  1686	
  1687				if (is_link_bw_low)
  1688					DC_LOG_WARNING(
  1689						"%s: Link(%d) bandwidth too low after fallback req_bw(%d) > link_bw(%d)\n",
  1690						__func__, link->link_index, req_bw, link_bw);
  1691			}
  1692	
  1693			msleep(delay_between_attempts);
  1694		}
  1695	
  1696		return false;
  1697	}
  1698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
