Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC33A168AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9IhQs7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697205080; x=1728741080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L9aBziVHRgPaOPYk4PkBDAGa8uOEzOAz90uMBEJ4ow8=;
  b=h9IhQs7fOb8s1KfnuPunAr9Dx8lQ7s0xqsr8bcYouJtbtpoICBrwgbLz
   eMkMxIoz0Z4htqdjQFL9eSo1Nnb78ZZn1/PM9TMfhSiuNFnH7sON2M+IE
   ffG5pmZNA/E97BiPg0QhjLB51qp9lwZZXB3Mtii6fRKjYYBHIcLE6yZEx
   YtM3behqxPOQid2HORqx6dqIrifbb7J/Lyn9TAeJJlbSmebl/11SvFs1M
   N+Wcb0jvgGseWbYAbhWkUWUGW9X4sBz7nKPy14f7fIIV/1+3c0p1ngnyZ
   3SCh958kUcA48xgxGKDAOyMZobCLtF3AgyXZEX5nn8bPunfJDC1u0DEfV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384046416"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="384046416"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 06:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086149356"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="1086149356"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 06:51:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrIZQ-0004pl-0C;
	Fri, 13 Oct 2023 13:51:16 +0000
Date: Fri, 13 Oct 2023 21:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 454/12130]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hwseq.c:159
 dcn35_init_hw() warn: inconsistent indenting
Message-ID: <202310132104.O9S9Fdpn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qingqing,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3b18f7200f45d66f7141136c25554ac1e82009b
commit: 1cb87e048975ce59dd2dcadff47002df64f95f72 [454/12130] drm/amd/display: Add DCN35 blocks to Makefile
config: i386-randconfig-141-20230905 (https://download.01.org/0day-ci/archive/20231013/202310132104.O9S9Fdpn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310132104.O9S9Fdpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132104.O9S9Fdpn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hwseq.c:159 dcn35_init_hw() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hwseq.c:159 dcn35_init_hw() warn: variable dereferenced before check 'res_pool->dccg' (see line 150)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hwseq.c:206 dcn35_init_hw() error: we previously assumed 'res_pool->hubbub' could be null (see line 159)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hwseq.c:285 dcn35_init_hw() error: we previously assumed 'dc->clk_mgr' could be null (see line 136)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hwseq.c:977 dcn35_calc_blocks_to_gate() error: we previously assumed 'pipe_ctx->plane_res.hubp' could be null (see line 973)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hwseq.c:980 dcn35_calc_blocks_to_gate() warn: always true condition '(pipe_ctx->plane_res.mpcc_inst >= 0) => (0-255 >= 0)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_resource.c:1877 dcn35_resource_construct() warn: inconsistent indenting

vim +159 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hwseq.c

6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  126  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  127  void dcn35_init_hw(struct dc *dc)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  128  {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  129  	struct abm **abms = dc->res_pool->multiple_abms;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  130  	struct dce_hwseq *hws = dc->hwseq;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  131  	struct dc_bios *dcb = dc->ctx->dc_bios;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  132  	struct resource_pool *res_pool = dc->res_pool;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  133  	uint32_t backlight = MAX_BACKLIGHT_LEVEL;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  134  	int i;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  135  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03 @136  	if (dc->clk_mgr && dc->clk_mgr->funcs->init_clocks)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  137  		dc->clk_mgr->funcs->init_clocks(dc->clk_mgr);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  138  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  139  	REG_WRITE(DCCG_GATE_DISABLE_CNTL, 0);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  140  	REG_WRITE(DCCG_GATE_DISABLE_CNTL2, 0x3F000000);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  141  	REG_WRITE(DCCG_GATE_DISABLE_CNTL5, 0x1f7c3fcf);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  142  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  143  	//dcn35_set_dmu_fgcg(hws, dc->debug.enable_fine_grain_clock_gating.bits.dmu);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  144  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  145  	if (!dcb->funcs->is_accelerated_mode(dcb)) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  146  		/*this calls into dmubfw to do the init*/
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  147  		hws->funcs.bios_golden_init(dc);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  148  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  149  	// Initialize the dccg
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03 @150  	if (res_pool->dccg->funcs->dccg_init)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  151  		res_pool->dccg->funcs->dccg_init(res_pool->dccg);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  152  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  153  	//enable_memory_low_power(dc);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  154  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  155  	if (dc->ctx->dc_bios->fw_info_valid) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  156  		res_pool->ref_clocks.xtalin_clock_inKhz =
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  157  				dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  158  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03 @159  			if (res_pool->dccg && res_pool->hubbub) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  160  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  161  				(res_pool->dccg->funcs->get_dccg_ref_freq)(res_pool->dccg,
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  162  						dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency,
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  163  						&res_pool->ref_clocks.dccg_ref_clock_inKhz);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  164  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  165  				(res_pool->hubbub->funcs->get_dchub_ref_freq)(res_pool->hubbub,
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  166  						res_pool->ref_clocks.dccg_ref_clock_inKhz,
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  167  						&res_pool->ref_clocks.dchub_ref_clock_inKhz);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  168  			} else {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  169  				// Not all ASICs have DCCG sw component
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  170  				res_pool->ref_clocks.dccg_ref_clock_inKhz =
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  171  						res_pool->ref_clocks.xtalin_clock_inKhz;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  172  				res_pool->ref_clocks.dchub_ref_clock_inKhz =
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  173  						res_pool->ref_clocks.xtalin_clock_inKhz;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  174  			}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  175  	} else
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  176  		ASSERT_CRITICAL(false);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  177  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  178  	for (i = 0; i < dc->link_count; i++) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  179  		/* Power up AND update implementation according to the
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  180  		 * required signal (which may be different from the
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  181  		 * default signal on connector).
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  182  		 */
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  183  		struct dc_link *link = dc->links[i];
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  184  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  185  		if (link->ep_type != DISPLAY_ENDPOINT_PHY)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  186  			continue;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  187  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  188  		link->link_enc->funcs->hw_init(link->link_enc);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  189  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  190  		/* Check for enabled DIG to identify enabled display */
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  191  		if (link->link_enc->funcs->is_dig_enabled &&
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  192  			link->link_enc->funcs->is_dig_enabled(link->link_enc)) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  193  			link->link_status.link_active = true;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  194  			if (link->link_enc->funcs->fec_is_active &&
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  195  					link->link_enc->funcs->fec_is_active(link->link_enc))
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  196  				link->fec_state = dc_link_fec_enabled;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  197  		}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  198  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  199  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  200  	/* we want to turn off all dp displays before doing detection */
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  201  	dc->link_srv->blank_all_dp_displays(dc);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  202  /*
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  203  	if (hws->funcs.enable_power_gating_plane)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  204  		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  205  */
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03 @206  	if (res_pool->hubbub->funcs->dchubbub_init)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  207  		res_pool->hubbub->funcs->dchubbub_init(dc->res_pool->hubbub);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  208  	/* If taking control over from VBIOS, we may want to optimize our first
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  209  	 * mode set, so we need to skip powering down pipes until we know which
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  210  	 * pipes we want to use.
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  211  	 * Otherwise, if taking control is not possible, we need to power
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  212  	 * everything down.
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  213  	 */
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  214  	if (dcb->funcs->is_accelerated_mode(dcb) || !dc->config.seamless_boot_edp_requested) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  215  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  216  		// we want to turn off edp displays if odm is enabled and no seamless boot
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  217  		if (!dc->caps.seamless_odm) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  218  			for (i = 0; i < dc->res_pool->timing_generator_count; i++) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  219  				struct timing_generator *tg = dc->res_pool->timing_generators[i];
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  220  				uint32_t num_opps, opp_id_src0, opp_id_src1;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  221  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  222  				num_opps = 1;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  223  				if (tg) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  224  					if (tg->funcs->is_tg_enabled(tg) && tg->funcs->get_optc_source) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  225  						tg->funcs->get_optc_source(tg, &num_opps,
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  226  								&opp_id_src0, &opp_id_src1);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  227  					}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  228  				}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  229  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  230  				if (num_opps > 1) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  231  					dc->link_srv->blank_all_edp_displays(dc);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  232  					break;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  233  				}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  234  			}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  235  		}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  236  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  237  		hws->funcs.init_pipes(dc, dc->current_state);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  238  		if (dc->res_pool->hubbub->funcs->allow_self_refresh_control)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  239  			dc->res_pool->hubbub->funcs->allow_self_refresh_control(dc->res_pool->hubbub,
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  240  					!dc->res_pool->hubbub->ctx->dc->debug.disable_stutter);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  241  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  242  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  243  	for (i = 0; i < res_pool->audio_count; i++) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  244  		struct audio *audio = res_pool->audios[i];
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  245  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  246  		audio->funcs->hw_init(audio);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  247  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  248  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  249  	for (i = 0; i < dc->link_count; i++) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  250  		struct dc_link *link = dc->links[i];
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  251  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  252  		if (link->panel_cntl)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  253  			backlight = link->panel_cntl->funcs->hw_init(link->panel_cntl);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  254  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  255  	if (dc->ctx->dmub_srv) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  256  	for (i = 0; i < dc->res_pool->pipe_count; i++) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  257  		if (abms[i] != NULL && abms[i]->funcs != NULL)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  258  			abms[i]->funcs->abm_init(abms[i], backlight);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  259  		}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  260  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  261  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  262  	/* power AFMT HDMI memory TODO: may move to dis/en output save power*/
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  263  	REG_WRITE(DIO_MEM_PWR_CTRL, 0);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  264  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  265  	// Set i2c to light sleep until engine is setup
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  266  	if (dc->debug.enable_mem_low_power.bits.i2c)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  267  		REG_UPDATE(DIO_MEM_PWR_CTRL, I2C_LIGHT_SLEEP_FORCE, 0);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  268  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  269  	if (hws->funcs.setup_hpo_hw_control)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  270  		hws->funcs.setup_hpo_hw_control(hws, false);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  271  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  272  	if (!dc->debug.disable_clock_gate) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  273  		/* enable all DCN clock gating */
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  274  		REG_WRITE(DCCG_GATE_DISABLE_CNTL, 0);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  275  		REG_WRITE(DCCG_GATE_DISABLE_CNTL2, 0);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  276  		REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  277  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  278  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  279  	if (dc->debug.disable_mem_low_power) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  280  		REG_UPDATE(DC_MEM_GLOBAL_PWR_REQ_CNTL, DC_MEM_GLOBAL_PWR_REQ_DIS, 1);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  281  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  282  	if (!dcb->funcs->is_accelerated_mode(dcb) && dc->res_pool->hubbub->funcs->init_watermarks)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  283  		dc->res_pool->hubbub->funcs->init_watermarks(dc->res_pool->hubbub);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  284  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03 @285  	if (dc->clk_mgr->funcs->notify_wm_ranges)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  286  		dc->clk_mgr->funcs->notify_wm_ranges(dc->clk_mgr);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  287  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  288  	if (dc->clk_mgr->funcs->set_hard_max_memclk && !dc->clk_mgr->dc_mode_softmax_enabled)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  289  		dc->clk_mgr->funcs->set_hard_max_memclk(dc->clk_mgr);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  290  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  291  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  292  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  293  	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  294  		dc->res_pool->hubbub->funcs->force_pstate_change_control(
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  295  				dc->res_pool->hubbub, false, false);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  296  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  297  	if (dc->res_pool->hubbub->funcs->init_crb)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  298  		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  299  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  300  	if (dc->res_pool->hubbub->funcs->set_request_limit && dc->config.sdpif_request_limit_words_per_umc > 0)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  301  		dc->res_pool->hubbub->funcs->set_request_limit(dc->res_pool->hubbub, dc->ctx->dc_bios->vram_info.num_chans, dc->config.sdpif_request_limit_words_per_umc);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  302  	// Get DMCUB capabilities
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  303  	if (dc->ctx->dmub_srv) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  304  		dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  305  		dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  306  		dc->caps.dmub_caps.mclk_sw = dc->ctx->dmub_srv->dmub->feature_caps.fw_assisted_mclk_switch;
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  307  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  308  
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  309  	if (dc->res_pool->pg_cntl) {
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  310  		if (dc->res_pool->pg_cntl->funcs->init_pg_status)
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  311  			dc->res_pool->pg_cntl->funcs->init_pg_status(dc->res_pool->pg_cntl);
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  312  	}
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  313  }
6f8b7565cca4b7 Qingqing Zhuo 2023-08-03  314  

:::::: The code at line 159 was first introduced by commit
:::::: 6f8b7565cca4b745da54b7d5f26b7b9265a5f330 drm/amd/display: Add DCN35 HWSEQ

:::::: TO: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
