Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1BB3F9F3B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593199; cv=none; b=VTTyLkI8klskXfCDqqsGpE75Y/mtQwJYAJHW7FAPrNEEJrAKgi+om4aLs3Jezj3d91HBUbwVnFeX09i6AsMjun/Wl5iv4ui8hWsGFFDtyoFlWZDrIl0dFQ0k3Aac1sjDWXhiVpPc8fwAZaABEJwTuNjT7/9AKmUl870U7RytvCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593199; c=relaxed/simple;
	bh=+Yo47fh1J3LO6GTDyFTeudNbDyr+ExkxWYcD+MOFc00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jx5l+XPHc5hWaWzBxcVyGTmaQeJpXlQ+MRx1cAONrRtEU1g9pZyN1J+poSm22CwIz+Q7JY6YW8TgsRobeiqLkvxvooOtcJbsHbv2uijQCh4SGvPkGQ4ZrMfM8eIvgV+i8sAkGCJdtTtY4SnXE8OXWriogcL+eXf+PiD8YjYRxoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igIpmTQx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igIpmTQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783593197; x=1815129197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Yo47fh1J3LO6GTDyFTeudNbDyr+ExkxWYcD+MOFc00=;
  b=igIpmTQxN3s4RkqcHqjNoO1xPkehB8tyabJvVxHiG2FyZ4e9rE5qoQly
   KAebprLHu3rpwId9ELTcfcVSuzH6oQF/pr2cSnv+iOLzEI5oYyJLbctED
   lAT+uA9Y+FKONsgKoIkRt5/bFGWJJT9w5woV/umh3wCvN2K0a68oT3W86
   VTpU/XGckHEFqUyEVzufU5rB7JHtTy3hLpzhTGsfxxYSHPuP1uNpR4cfs
   zYr4sjQCOzIOsmGdBZuxRCmuWb9Zx/ulLOQQOnq/LZeaVFMkWJAhzRuLC
   4CqsHLrk7zWwwlzDj9+Mrfb0gzusW98fW3UrEZzEAVIbxQdHQecFm4kYe
   Q==;
X-CSE-ConnectionGUID: Sps2eul+RN+g4iS8c7viBw==
X-CSE-MsgGUID: ri2VIryWTf6ZS0KsBufzZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71790338"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71790338"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:33:16 -0700
X-CSE-ConnectionGUID: gvwfaPe3TiqXSbNNlQK5Pw==
X-CSE-MsgGUID: WKt9w5l4Tu62ymW6+miTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258855571"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2026 03:33:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whm3z-00000000HZ9-3f9g;
	Thu, 09 Jul 2026 10:33:05 +0000
Date: Thu, 09 Jul 2026 18:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: 
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/lin?=
 =?us-ascii?Q?k=5Fhdmi=5Ffrl.c:863:47:?= sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202607091839.VZNC9fHF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: cbb8e2044b9e936dfa66f1d4a2f835316c741a67 drm/amd/display: Add DC link support for FRL
date:   5 weeks ago
config: um-randconfig-r132-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091839.VZNC9fHF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091839.VZNC9fHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cbb8e2044b9e ("drm/amd/display: Add DC link support for FRL")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091839.VZNC9fHF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:863:47: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:864:38: sparse: sparse: Using plain integer as NULL pointer

vim +863 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c

   855	
   856	void hdmi_frl_set_preferred_link_settings(struct dc *dc,
   857			struct dc_hdmi_frl_link_settings *link_setting,
   858			struct dc_hdmi_frl_link_training_overrides *lt_overrides,
   859			struct dc_link *link)
   860	{
   861		int i;
   862		struct pipe_ctx *pipe;
 > 863		struct dc_stream_state *link_stream = 0;
   864		struct pipe_ctx *link_pipe = 0;
   865		struct pipe_ctx *odm_pipe;
   866		int opp_cnt = 1;
   867		enum link_result link_stat = LINK_RESULT_UNKNOWN;
   868		enum clock_source_id frl_phy_clock_source_id;
   869		struct dc_stream_state *temp_stream = &dc->scratch.temp_stream;
   870	
   871		DC_LOGGER_INIT(link->ctx->logger);
   872	
   873		for (i = 0; i < MAX_PIPES; i++) {
   874			pipe = &dc->current_state->res_ctx.pipe_ctx[i];
   875			if (pipe->stream && pipe->stream->link) {
   876				if (pipe->stream->link == link) {
   877					link_stream = pipe->stream;
   878					link_pipe = pipe;
   879					break;
   880				}
   881			}
   882		}
   883	
   884		/* Stream not found */
   885		if (i == MAX_PIPES)
   886			return;
   887	
   888		FRL_INFO("FRL LINK TRAINING:  Preferred link Update = %d.\n", link_setting->frl_link_rate);
   889	
   890		frl_validate_mode_timing(link, &link_stream->timing, link_setting);
   891	
   892		if (lt_overrides)
   893			link->preferred_hdmi_frl_settings = *lt_overrides;
   894		else
   895			memset(&link->preferred_hdmi_frl_settings, 0, sizeof(link->preferred_hdmi_frl_settings));
   896	
   897		link_stream->link->frl_link_settings = *link_setting;
   898		link_stream->link->frl_verified_link_cap = *link_setting;
   899	
   900		while (link_stat != LINK_RESULT_SUCCESS) {
   901			link_set_dpms_off(pipe);
   902			/* For DCN3.0, can also have 4:1 combine mode.
   903			 * TODO: Add function get_odm_combine_mode that has different
   904			 *       implementation for DCN2/DCN3AG and DCN3.0
   905			 */
   906			for (odm_pipe = pipe->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
   907				opp_cnt++;
   908	
   909			memcpy(temp_stream, link_stream, sizeof(struct dc_stream_state));
   910			/* Modify patched_crtc_timing as required for padding */
   911			if (link_pipe->dsc_padding_params.dsc_hactive_padding) {
   912				temp_stream->timing.h_addressable = link_stream->timing.h_addressable + link_pipe->dsc_padding_params.dsc_hactive_padding;
   913				temp_stream->timing.h_total = link_stream->timing.h_total + link_pipe->dsc_padding_params.dsc_htotal_padding;
   914			}
   915	
   916			pipe->stream_res.hpo_frl_stream_enc->funcs->hdmi_frl_set_stream_attribute(
   917				pipe->stream_res.hpo_frl_stream_enc,
   918				&temp_stream->timing,
   919				&link_stream->link->frl_link_settings.borrow_params,
   920				opp_cnt);
   921	
   922			if (pipe->stream_res.tg->funcs->set_out_mux)
   923				pipe->stream_res.tg->funcs->set_out_mux(pipe->stream_res.tg, OUT_MUX_HPO_FRL);
   924	
   925			if ((!link_stream->link->link_enc) ||
   926					(!link_stream->link->hpo_frl_link_enc) ||
   927					(!link_stream->ctx->dc->res_pool->dccg->funcs->enable_hdmicharclk) ||
   928					(!(pipe->stream_res.hpo_frl_stream_enc)))
   929				return;
   930	
   931			switch (link_stream->link->frl_link_settings.frl_link_rate) {
   932			case HDMI_FRL_LINK_RATE_3GBPS:
   933				pipe->stream_res.pix_clk_params.requested_sym_clk = 166667;
   934				break;
   935			case HDMI_FRL_LINK_RATE_6GBPS:
   936			case HDMI_FRL_LINK_RATE_6GBPS_4LANE:
   937				pipe->stream_res.pix_clk_params.requested_sym_clk = 333333;
   938				break;
   939			case HDMI_FRL_LINK_RATE_8GBPS:
   940				pipe->stream_res.pix_clk_params.requested_sym_clk = 444444;
   941				break;
   942			case HDMI_FRL_LINK_RATE_10GBPS:
   943				pipe->stream_res.pix_clk_params.requested_sym_clk = 555555;
   944				break;
   945			case HDMI_FRL_LINK_RATE_12GBPS:
   946				pipe->stream_res.pix_clk_params.requested_sym_clk = 666667;
   947				break;
   948			case HDMI_FRL_LINK_RATE_16GBPS:
   949				pipe->stream_res.pix_clk_params.requested_sym_clk = 888889;
   950				break;
   951			case HDMI_FRL_LINK_RATE_20GBPS:
   952				pipe->stream_res.pix_clk_params.requested_sym_clk = 1111111;
   953				break;
   954			case HDMI_FRL_LINK_RATE_24GBPS:
   955				pipe->stream_res.pix_clk_params.requested_sym_clk = 1333333;
   956				break;
   957			default:
   958				break;
   959			}
   960	
   961			link_stream->phy_pix_clk = pipe->stream_res.pix_clk_params.requested_sym_clk;
   962	
   963			memset(&link_stream->link->cur_link_settings, 0,
   964					sizeof(struct dc_link_settings));
   965	
   966			/* Find proper clock source in HDMI FRL mode for phy used for DCCG */
   967			frl_phy_clock_source_id = hdmi_frl_find_matching_phypll(link);
   968	
   969			dc->hwss.setup_hdmi_frl_link(link,
   970					(pipe->stream_res.hpo_frl_stream_enc->id - ENGINE_ID_HPO_0),
   971					frl_phy_clock_source_id);
   972	
   973			FRL_INFO("FRL LINK TRAINING:  Start forced link training at %d. \n",
   974					link_stream->link->frl_link_settings.frl_link_rate);
   975			link_stat = hdmi_frl_perform_link_training_with_retries(link_stream->link);
   976	
   977			/* Enable FRL packet transmission */
   978			if (link_stat == LINK_RESULT_SUCCESS) {
   979				link_stream->link->hpo_frl_link_enc->funcs->enable_output(
   980						link_stream->link->hpo_frl_link_enc);
   981				if (link_stream->link->frl_flags.apply_vsdb_rcc_wa)
   982					link_stream->link->hpo_frl_link_enc->funcs->apply_vsdb_rcc_wa(link_stream->link->hpo_frl_link_enc);
   983				hdmi_frl_poll_start(link_stream->link->ddc);
   984	
   985				/* Set HDMISTREAMCLK source to DTBCLK0 and bypass DTO */
   986				if (dc->res_pool->dccg->funcs->set_hdmistreamclk) {
   987					dc->res_pool->dccg->funcs->set_hdmistreamclk(
   988							dc->res_pool->dccg,
   989							DTBCLK0,
   990							pipe->stream_res.tg->inst);
   991				}
   992	
   993				pipe->stream_res.hpo_frl_stream_enc->funcs->hdmi_frl_enable(
   994					pipe->stream_res.hpo_frl_stream_enc,
   995					pipe->stream_res.tg->inst);
   996				resource_build_info_frame(pipe);
   997				link_stream->ctx->dc->hwss.update_info_frame(pipe);
   998	
   999				link_stream->ctx->dc->hwss.enable_audio_stream(pipe);
  1000				link_stream->ctx->dc->hwss.enable_stream(pipe);
  1001				link_stream->ctx->dc->hwss.unblank_stream(pipe,
  1002					&pipe->stream->link->cur_link_settings);
  1003				FRL_INFO("FRL LINK TRAINING:  Forced link training successful. \n");
  1004			}
  1005			if (link_stat == LINK_RESULT_LOWER_LINKRATE) {
  1006				link_stream->link->frl_link_settings.frl_link_rate--;
  1007				if (link_stream->link->frl_link_settings.frl_link_rate >
  1008					 HDMI_FRL_LINK_RATE_6GBPS)
  1009					link_stream->link->frl_link_settings.frl_num_lanes = 4;
  1010				else
  1011					link_stream->link->frl_link_settings.frl_num_lanes = 3;
  1012				FRL_INFO("FRL LINK TRAINING:  Lower link rate = %d.\n",
  1013					link_stream->link->frl_link_settings.frl_link_rate);
  1014			}
  1015			if (link_stat == LINK_RESULT_FALLBACK) {
  1016				FRL_INFO("FRL LINK TRAINING: Forced Link Training failed.  Fallback to TMDS. \n");
  1017				break;
  1018			}
  1019		}
  1020	}
  1021	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
