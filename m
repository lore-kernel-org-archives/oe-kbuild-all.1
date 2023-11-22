Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC448BF3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 03:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxbnX1UV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700624626; x=1732160626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWbajPRuQTWsC+MA8+nZpVsIfGJYF5TCx2bkaIsHwYU=;
  b=MxbnX1UV/PwtzEKe61mp49ivJamEX7d61mz0wMJ/kjQP9jt3LBbwUTIF
   WD/2Y6JILuqRF0SJrwPzKK7MPUtAqGZ2EBe/vyyX6MarbU7kJzn5caoCe
   hSQxfqeni5IkTdwJkM6F6Gc7hplSNN8tU2kJtsHKfmDUaAQpgjt6/RRBb
   TseeUC2WDeaPVrZgjbPs6EGHo7hidmXD5Da+5ZzE9l/KY5CoyG6flkddX
   YFcSCjlUmH9699kwQxhWfmlNzZJkJcbrEBG348jJA+tUdqw50CrbqtBk9
   tXoC/LQ24tGFM8HvE0sTioXSn6RjEaBaU9xnAqXIPE1D6uCbRzQIE2shG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="372148824"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="372148824"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 19:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1014108219"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="1014108219"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Nov 2023 19:43:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5e6t-0008cA-0e;
	Wed, 22 Nov 2023 03:42:13 +0000
Date: Wed, 22 Nov 2023 11:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/14]
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:508:48: error:
 member reference type 'struct _vcs_dpi_display_e2e_pipe_params_st *' is a
 pointer; did you mean to use '->'?
Message-ID: <202311221127.NFLWFbjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   4194727e2ccb81e9e43ff10b16f59fe5e4c34246
commit: 1b3cfadf63b5d793a2480689dcf38814178c4ea6 [2/14] BACKPORT: drm/amd/display: Allocate structs needed by dcn_bw_calc_rq_dlg_ttu in pipe_ctx
config: x86_64-buildonly-randconfig-001-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221127.NFLWFbjH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221127.NFLWFbjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221127.NFLWFbjH-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang-16: warning: argument unused during compilation: '-mhard-float' [-Wunused-command-line-argument]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:508:48: error: member reference type 'struct _vcs_dpi_display_e2e_pipe_params_st *' is a pointer; did you mean to use '->'?
           dml1_rq_dlg_get_rq_params(dml, rq_param, input.pipe.src);
                                                    ~~~~~^
                                                         ->
>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:509:37: error: passing 'struct _vcs_dpi_display_rq_params_st *' to parameter of incompatible type 'struct _vcs_dpi_display_rq_params_st'; dereference with *
           dml1_extract_rq_regs(dml, rq_regs, rq_param);
                                              ^~~~~~~~
                                              *
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.h:36:46: note: passing argument to parameter 'rq_param' here
                   const struct _vcs_dpi_display_rq_params_st rq_param);
                                                              ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:515:4: error: passing 'struct _vcs_dpi_display_dlg_sys_params_st *' to parameter of incompatible type 'struct _vcs_dpi_display_dlg_sys_params_st'; dereference with *
                           dlg_sys_param,
                           ^~~~~~~~~~~~~
                           *
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.h:59:51: note: passing argument to parameter 'dlg_sys_param' here
                   const struct _vcs_dpi_display_dlg_sys_params_st dlg_sys_param,
                                                                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:742:14: warning: no previous prototype for function 'get_highest_allowed_voltage_level' [-Wmissing-prototypes]
   unsigned int get_highest_allowed_voltage_level(uint32_t hw_internal_rev, uint32_t pci_revision_id)
                ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:742:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int get_highest_allowed_voltage_level(uint32_t hw_internal_rev, uint32_t pci_revision_id)
   ^
   static 
   1 warning and 3 errors generated.


vim +508 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c

   451	
   452	static void dcn_bw_calc_rq_dlg_ttu(
   453			const struct dc *dc,
   454			const struct dcn_bw_internal_vars *v,
   455			struct pipe_ctx *pipe,
   456			int in_idx)
   457	{
   458		struct display_mode_lib *dml = (struct display_mode_lib *)(&dc->dml);
   459		struct _vcs_dpi_display_dlg_regs_st *dlg_regs = &pipe->dlg_regs;
   460		struct _vcs_dpi_display_ttu_regs_st *ttu_regs = &pipe->ttu_regs;
   461		struct _vcs_dpi_display_rq_regs_st *rq_regs = &pipe->rq_regs;
   462		struct _vcs_dpi_display_rq_params_st *rq_param = &pipe->dml_rq_param;
   463		struct _vcs_dpi_display_dlg_sys_params_st *dlg_sys_param = &pipe->dml_dlg_sys_param;
   464		struct _vcs_dpi_display_e2e_pipe_params_st *input = &pipe->dml_input;
   465		float total_active_bw = 0;
   466		float total_prefetch_bw = 0;
   467		int total_flip_bytes = 0;
   468		int i;
   469	
   470		memset(dlg_regs, 0, sizeof(*dlg_regs));
   471		memset(ttu_regs, 0, sizeof(*ttu_regs));
   472		memset(rq_regs, 0, sizeof(*rq_regs));
   473		memset(rq_param, 0, sizeof(*rq_param));
   474		memset(dlg_sys_param, 0, sizeof(*dlg_sys_param));
   475		memset(input, 0, sizeof(*input));
   476	
   477		for (i = 0; i < number_of_planes; i++) {
   478			total_active_bw += v->read_bandwidth[i];
   479			total_prefetch_bw += v->prefetch_bandwidth[i];
   480			total_flip_bytes += v->total_immediate_flip_bytes[i];
   481		}
   482		dlg_sys_param->total_flip_bw = v->return_bw - dcn_bw_max2(total_active_bw, total_prefetch_bw);
   483		if (dlg_sys_param->total_flip_bw < 0.0)
   484			dlg_sys_param->total_flip_bw = 0;
   485	
   486		dlg_sys_param->t_mclk_wm_us = v->dram_clock_change_watermark;
   487		dlg_sys_param->t_sr_wm_us = v->stutter_enter_plus_exit_watermark;
   488		dlg_sys_param->t_urg_wm_us = v->urgent_watermark;
   489		dlg_sys_param->t_extra_us = v->urgent_extra_latency;
   490		dlg_sys_param->deepsleep_dcfclk_mhz = v->dcf_clk_deep_sleep;
   491		dlg_sys_param->total_flip_bytes = total_flip_bytes;
   492	
   493		pipe_ctx_to_e2e_pipe_params(pipe, &input->pipe);
   494		input->clks_cfg.dcfclk_mhz = v->dcfclk;
   495		input->clks_cfg.dispclk_mhz = v->dispclk;
   496		input->clks_cfg.dppclk_mhz = v->dppclk;
   497		input->clks_cfg.refclk_mhz = dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000.0;
   498		input->clks_cfg.socclk_mhz = v->socclk;
   499		input->clks_cfg.voltage = v->voltage_level;
   500	//	dc->dml.logger = pool->base.logger;
   501		input->dout.output_format = (v->output_format[in_idx] == dcn_bw_420) ? dm_420 : dm_444;
   502		input->dout.output_type  = (v->output[in_idx] == dcn_bw_hdmi) ? dm_hdmi : dm_dp;
   503		//input[in_idx].dout.output_standard;
   504	
   505		/*todo: soc->sr_enter_plus_exit_time??*/
   506		dlg_sys_param->t_srx_delay_us = dc->dcn_ip->dcfclk_cstate_latency / v->dcf_clk_deep_sleep;
   507	
 > 508		dml1_rq_dlg_get_rq_params(dml, rq_param, input.pipe.src);
 > 509		dml1_extract_rq_regs(dml, rq_regs, rq_param);
   510		dml1_rq_dlg_get_dlg_params(
   511				dml,
   512				dlg_regs,
   513				ttu_regs,
   514				rq_param->dlg,
 > 515				dlg_sys_param,
   516				input,
   517				true,
   518				true,
   519				v->pte_enable == dcn_bw_yes,
   520				pipe->plane_state->flip_immediate);
   521	}
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
