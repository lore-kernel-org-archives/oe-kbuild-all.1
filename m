Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAD51B4248
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 18:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753554960; cv=none; b=K015oePgODTq/4OVDzYSZ5jDkgqgcYVLy8pDCMpYGSBlTEkkIwFII0vN32CYYOgIfbb920AVInMMb9ocUA93RUThwAHbp8dl4Ehdj6dpmRrbjBpQkc/s1Z54ozEfxfc7VKa6xwKZ/xcdDR+twuWwgARVd6xCCmj/ugCDS4wN2cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753554960; c=relaxed/simple;
	bh=VgUS/GqpKnwCNmwwp5J4ex/u2L0bz/4BMQyWjWZ9uY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U2oSJ/YAfW3M4/wtp0JmTds+uLDVIBiPVJt6FYzBjDnZYLbZaynQ+3+20whEOcVi3p+TwRKml2k6giqckL8zbYPA9A2F2SZ3Bf6rjjYLVDW4+r6o0ZCnRgGBhLfznsl3+pLEZCeO71D73HrM6DmQMB9EWL9OdzB27sS9Z96pKvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kf0rvfBS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kf0rvfBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753554957; x=1785090957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VgUS/GqpKnwCNmwwp5J4ex/u2L0bz/4BMQyWjWZ9uY0=;
  b=kf0rvfBShJ218pznhCbm2wBjGdrWhpYewuhsyLIxXWlNJ7YLvaauYRqY
   1eULj+T4T4jgsg9iYuaSQpG2C2W16+cKlcBot72n0IjKrJAEJ3sv4Npt0
   Kf6HB43x7orFizvB8BzSUQFQ8eDLn0C/E4uTR8DpLSVDBXDgCq9VqgrSu
   2tppnVyG8QuXmX2pGFTttH6d/Xsqr8JwGqckc65Q7IeggIYLcYA0yOXmF
   CNOdEQRqca6shCa2kvHvV16aWpba/P64WRRyUj10b5F9+TUnouf91ATNS
   yKj8tBSsdJvkmW1SOCRwsFQKFcgsA9Q8bSK8mv5QE1f7Yo4O8Aq8w4ct0
   w==;
X-CSE-ConnectionGUID: w9JlIBeTR+CZcvf9YpwnxQ==
X-CSE-MsgGUID: YLKPFgvwRFiPghmnguTxXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66428467"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66428467"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 11:35:56 -0700
X-CSE-ConnectionGUID: R5mVm39OSaK+kh4bQghc3A==
X-CSE-MsgGUID: 2H8MBAJ2TOWYvIgrw/8YDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192620151"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 26 Jul 2025 11:35:55 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufjkO-0000Jj-3B;
	Sat, 26 Jul 2025 18:35:52 +0000
Date: Sat, 26 Jul 2025 20:35:16 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2024-09 0/4]
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:509:44: error:
 incompatible type for argument 3 of 'dml1_extract_rq_regs'
Message-ID: <202507262056.vASMr04f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10-2024-09
head:   b0853d92666feef1a47255a6662977726e2b4056
commit: 14d0c7d2237c534cf90d906566e0acb5edbfb0bc [0/4] BACKPORT: drm/amd/display: Allocate structs needed by dcn_bw_calc_rq_dlg_ttu in pipe_ctx
config: i386-buildonly-randconfig-2002-20250719 (https://download.01.org/0day-ci/archive/20250726/202507262056.vASMr04f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507262056.vASMr04f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507262056.vASMr04f-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: In function 'dcn_bw_calc_rq_dlg_ttu':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:508:55: error: 'input' is a pointer; did you mean to use '->'?
     508 |         dml1_rq_dlg_get_rq_params(dml, rq_param, input.pipe.src);
         |                                                       ^
         |                                                       ->
>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:509:44: error: incompatible type for argument 3 of 'dml1_extract_rq_regs'
     509 |         dml1_extract_rq_regs(dml, rq_regs, rq_param);
         |                                            ^~~~~~~~
         |                                            |
         |                                            struct _vcs_dpi_display_rq_params_st *
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:35:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.h:36:60: note: expected 'const struct _vcs_dpi_display_rq_params_st' but argument is of type 'struct _vcs_dpi_display_rq_params_st *'
      36 |                 const struct _vcs_dpi_display_rq_params_st rq_param);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:515:25: error: incompatible type for argument 5 of 'dml1_rq_dlg_get_dlg_params'
     515 |                         dlg_sys_param,
         |                         ^~~~~~~~~~~~~
         |                         |
         |                         struct _vcs_dpi_display_dlg_sys_params_st *
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.h:59:65: note: expected 'const struct _vcs_dpi_display_dlg_sys_params_st' but argument is of type 'struct _vcs_dpi_display_dlg_sys_params_st *'
      59 |                 const struct _vcs_dpi_display_dlg_sys_params_st dlg_sys_param,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:516:25: error: incompatible type for argument 6 of 'dml1_rq_dlg_get_dlg_params'
     516 |                         input,
         |                         ^~~~~
         |                         |
         |                         struct _vcs_dpi_display_e2e_pipe_params_st *
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.h:60:66: note: expected 'const struct _vcs_dpi_display_e2e_pipe_params_st' but argument is of type 'struct _vcs_dpi_display_e2e_pipe_params_st *'
      60 |                 const struct _vcs_dpi_display_e2e_pipe_params_st e2e_pipe_param,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:742:14: warning: no previous prototype for 'get_highest_allowed_voltage_level' [-Wmissing-prototypes]
     742 | unsigned int get_highest_allowed_voltage_level(uint32_t hw_internal_rev, uint32_t pci_revision_id)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:86,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/resource.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:32:
   drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw/dpp.h:50:42: warning: 'dpp_input_csc_matrix' defined but not used [-Wunused-const-variable=]
      50 | static const struct dpp_input_csc_matrix dpp_input_csc_matrix[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:124:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     124 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:122:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     122 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:120:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~


vim +/dml1_extract_rq_regs +509 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c

74c49c7ac14f3a Harry Wentland     2017-05-08  451  
74c49c7ac14f3a Harry Wentland     2017-05-08  452  static void dcn_bw_calc_rq_dlg_ttu(
fb3466a450cc46 Bhawanpreet Lakha  2017-08-01  453  		const struct dc *dc,
74c49c7ac14f3a Harry Wentland     2017-05-08  454  		const struct dcn_bw_internal_vars *v,
0d18d7bb801324 Charlene Liu       2017-08-01  455  		struct pipe_ctx *pipe,
0d18d7bb801324 Charlene Liu       2017-08-01  456  		int in_idx)
74c49c7ac14f3a Harry Wentland     2017-05-08  457  {
74c49c7ac14f3a Harry Wentland     2017-05-08  458  	struct display_mode_lib *dml = (struct display_mode_lib *)(&dc->dml);
74c49c7ac14f3a Harry Wentland     2017-05-08  459  	struct _vcs_dpi_display_dlg_regs_st *dlg_regs = &pipe->dlg_regs;
74c49c7ac14f3a Harry Wentland     2017-05-08  460  	struct _vcs_dpi_display_ttu_regs_st *ttu_regs = &pipe->ttu_regs;
74c49c7ac14f3a Harry Wentland     2017-05-08  461  	struct _vcs_dpi_display_rq_regs_st *rq_regs = &pipe->rq_regs;
14d0c7d2237c53 Harry Wentland     2021-09-07  462  	struct _vcs_dpi_display_rq_params_st *rq_param = &pipe->dml_rq_param;
14d0c7d2237c53 Harry Wentland     2021-09-07  463  	struct _vcs_dpi_display_dlg_sys_params_st *dlg_sys_param = &pipe->dml_dlg_sys_param;
14d0c7d2237c53 Harry Wentland     2021-09-07  464  	struct _vcs_dpi_display_e2e_pipe_params_st *input = &pipe->dml_input;
74c49c7ac14f3a Harry Wentland     2017-05-08  465  	float total_active_bw = 0;
74c49c7ac14f3a Harry Wentland     2017-05-08  466  	float total_prefetch_bw = 0;
74c49c7ac14f3a Harry Wentland     2017-05-08  467  	int total_flip_bytes = 0;
74c49c7ac14f3a Harry Wentland     2017-05-08  468  	int i;
74c49c7ac14f3a Harry Wentland     2017-05-08  469  
b9c1c67aeb8805 Dmytro Laktyushkin 2018-06-05  470  	memset(dlg_regs, 0, sizeof(*dlg_regs));
b9c1c67aeb8805 Dmytro Laktyushkin 2018-06-05  471  	memset(ttu_regs, 0, sizeof(*ttu_regs));
b9c1c67aeb8805 Dmytro Laktyushkin 2018-06-05  472  	memset(rq_regs, 0, sizeof(*rq_regs));
14d0c7d2237c53 Harry Wentland     2021-09-07  473  	memset(rq_param, 0, sizeof(*rq_param));
14d0c7d2237c53 Harry Wentland     2021-09-07  474  	memset(dlg_sys_param, 0, sizeof(*dlg_sys_param));
14d0c7d2237c53 Harry Wentland     2021-09-07  475  	memset(input, 0, sizeof(*input));
b9c1c67aeb8805 Dmytro Laktyushkin 2018-06-05  476  
74c49c7ac14f3a Harry Wentland     2017-05-08  477  	for (i = 0; i < number_of_planes; i++) {
74c49c7ac14f3a Harry Wentland     2017-05-08  478  		total_active_bw += v->read_bandwidth[i];
74c49c7ac14f3a Harry Wentland     2017-05-08  479  		total_prefetch_bw += v->prefetch_bandwidth[i];
74c49c7ac14f3a Harry Wentland     2017-05-08  480  		total_flip_bytes += v->total_immediate_flip_bytes[i];
74c49c7ac14f3a Harry Wentland     2017-05-08  481  	}
14d0c7d2237c53 Harry Wentland     2021-09-07  482  	dlg_sys_param->total_flip_bw = v->return_bw - dcn_bw_max2(total_active_bw, total_prefetch_bw);
14d0c7d2237c53 Harry Wentland     2021-09-07  483  	if (dlg_sys_param->total_flip_bw < 0.0)
14d0c7d2237c53 Harry Wentland     2021-09-07  484  		dlg_sys_param->total_flip_bw = 0;
14d0c7d2237c53 Harry Wentland     2021-09-07  485  
14d0c7d2237c53 Harry Wentland     2021-09-07  486  	dlg_sys_param->t_mclk_wm_us = v->dram_clock_change_watermark;
14d0c7d2237c53 Harry Wentland     2021-09-07  487  	dlg_sys_param->t_sr_wm_us = v->stutter_enter_plus_exit_watermark;
14d0c7d2237c53 Harry Wentland     2021-09-07  488  	dlg_sys_param->t_urg_wm_us = v->urgent_watermark;
14d0c7d2237c53 Harry Wentland     2021-09-07  489  	dlg_sys_param->t_extra_us = v->urgent_extra_latency;
14d0c7d2237c53 Harry Wentland     2021-09-07  490  	dlg_sys_param->deepsleep_dcfclk_mhz = v->dcf_clk_deep_sleep;
14d0c7d2237c53 Harry Wentland     2021-09-07  491  	dlg_sys_param->total_flip_bytes = total_flip_bytes;
14d0c7d2237c53 Harry Wentland     2021-09-07  492  
14d0c7d2237c53 Harry Wentland     2021-09-07  493  	pipe_ctx_to_e2e_pipe_params(pipe, &input->pipe);
14d0c7d2237c53 Harry Wentland     2021-09-07  494  	input->clks_cfg.dcfclk_mhz = v->dcfclk;
14d0c7d2237c53 Harry Wentland     2021-09-07  495  	input->clks_cfg.dispclk_mhz = v->dispclk;
14d0c7d2237c53 Harry Wentland     2021-09-07  496  	input->clks_cfg.dppclk_mhz = v->dppclk;
14d0c7d2237c53 Harry Wentland     2021-09-07  497  	input->clks_cfg.refclk_mhz = dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000.0;
14d0c7d2237c53 Harry Wentland     2021-09-07  498  	input->clks_cfg.socclk_mhz = v->socclk;
14d0c7d2237c53 Harry Wentland     2021-09-07  499  	input->clks_cfg.voltage = v->voltage_level;
74c49c7ac14f3a Harry Wentland     2017-05-08  500  //	dc->dml.logger = pool->base.logger;
14d0c7d2237c53 Harry Wentland     2021-09-07  501  	input->dout.output_format = (v->output_format[in_idx] == dcn_bw_420) ? dm_420 : dm_444;
14d0c7d2237c53 Harry Wentland     2021-09-07  502  	input->dout.output_type  = (v->output[in_idx] == dcn_bw_hdmi) ? dm_hdmi : dm_dp;
0d18d7bb801324 Charlene Liu       2017-08-01  503  	//input[in_idx].dout.output_standard;
74c49c7ac14f3a Harry Wentland     2017-05-08  504  
74c49c7ac14f3a Harry Wentland     2017-05-08  505  	/*todo: soc->sr_enter_plus_exit_time??*/
14d0c7d2237c53 Harry Wentland     2021-09-07  506  	dlg_sys_param->t_srx_delay_us = dc->dcn_ip->dcfclk_cstate_latency / v->dcf_clk_deep_sleep;
74c49c7ac14f3a Harry Wentland     2017-05-08  507  
14d0c7d2237c53 Harry Wentland     2021-09-07 @508  	dml1_rq_dlg_get_rq_params(dml, rq_param, input.pipe.src);
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23 @509  	dml1_extract_rq_regs(dml, rq_regs, rq_param);
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  510  	dml1_rq_dlg_get_dlg_params(
74c49c7ac14f3a Harry Wentland     2017-05-08  511  			dml,
74c49c7ac14f3a Harry Wentland     2017-05-08  512  			dlg_regs,
74c49c7ac14f3a Harry Wentland     2017-05-08  513  			ttu_regs,
14d0c7d2237c53 Harry Wentland     2021-09-07  514  			rq_param->dlg,
74c49c7ac14f3a Harry Wentland     2017-05-08 @515  			dlg_sys_param,
74c49c7ac14f3a Harry Wentland     2017-05-08  516  			input,
74c49c7ac14f3a Harry Wentland     2017-05-08  517  			true,
74c49c7ac14f3a Harry Wentland     2017-05-08  518  			true,
74c49c7ac14f3a Harry Wentland     2017-05-08  519  			v->pte_enable == dcn_bw_yes,
3be5262e353b8a Harry Wentland     2017-07-27  520  			pipe->plane_state->flip_immediate);
74c49c7ac14f3a Harry Wentland     2017-05-08  521  }
74c49c7ac14f3a Harry Wentland     2017-05-08  522  

:::::: The code at line 509 was first introduced by commit
:::::: 6d04ee9dc10149db842d41de66eca201c9d91b60 drm/amd/display: Restructuring and cleaning up DML

:::::: TO: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
