Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13A8BA3D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 17:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786297916; cv=none; b=E/LaWOY9hN31XyU288GWO61bJop2pnBLnA8pShp6HbyQl5INOYSupLDQh7j2ZFxTFsvQC8u46Qn2z7tcMCcbAp2Jrl+qhETkHInUVH0mZFixAesqK8E7/cvnY6aBlJDkmSZ1zNJMZo3LrKdxP3sjwIenW+BCOk+7ZhEaLjrTLjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786297916; c=relaxed/simple;
	bh=0NuFDEJPtVFeQFCIcVkK4+cythmobV6aPnFeug/RAfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RBp2o6nGgCadwZDg/+VaFvpWP3LlGWaPKe4FjEFGyH9pUPpl4yYWMu2zOoZ/2GwK6MpP5rKpuYCC2HVlsycY6v34vnsFpzEGJ9tzX5x78hJItKuFgkYNy1UDj4vQteau8MbuT3NaytUojgB+c0O06S5kwcSLJ0lY9Kz58fep4hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=az2TmWAH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="az2TmWAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786297909; x=1817833909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0NuFDEJPtVFeQFCIcVkK4+cythmobV6aPnFeug/RAfU=;
  b=az2TmWAH9pxUHCcZkYcedU4Y/aYdfGPgOdwa3ACl10UeCtg66XVQL1A1
   jELx6AD9CwphInmoje7k+wOKy4tMEY2Tm06iXWioHEI6A123CQgY5/tAa
   8fSFAI9B3pTA1dX8dcTTC/n1araZ1pnVDazCW7+cFhH+vm5cC9NLBDvz6
   Tti708nrRRAGcQSVQrHGtrW7YYgWj3Dz+UdI9bZJn2X2+i2Dul3E5ly6U
   e1HuZYFA66bxSMcK5loovDC2JQkrEAeOodUiiFPOYOA+Ms7uXeZUEMtgj
   +l30cFOEHzvXEj+PdoOYwR3CCZJ6OBGZcwvXEYUZN9jsyYJM2ooiCjWBF
   A==;
X-CSE-ConnectionGUID: uNORjhkURwmfsyIeCTvkug==
X-CSE-MsgGUID: 7WG3/a9bQPC4f3qJ6Nt3jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86760851"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="86760851"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 10:51:48 -0700
X-CSE-ConnectionGUID: IHUlO2HUSE2aafFdhCf40w==
X-CSE-MsgGUID: lEOnQjUkTzyN6IoZnhv4Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="266333898"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Aug 2026 10:51:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt7gV-00000000M9r-27N3;
	Sun, 09 Aug 2026 17:51:43 +0000
Date: Mon, 10 Aug 2026 01:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [agd5f:drm-next-7.3 244/308]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/dml2=5F0/dml21/sr?=
 =?us-ascii?Q?c/dml2=5Fcore/dml2=5Fcore=5Fdcn5=5Ffuncs=5Fmode=5Fprogrammin?=
 =?us-ascii?Q?g.c:1131:74:?= sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202608100151.0auRZyTk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   daaeec235e46b45a0dbd4facfb275cc43022028d
commit: 992694ad28584188725751f695a85661e8e3797a [244/308] drm/amd/display: Enable DCN6 sources compilation
config: riscv-randconfig-r111-20260807 (https://download.01.org/0day-ci/archive/20260810/202608100151.0auRZyTk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100151.0auRZyTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100151.0auRZyTk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   WARNING: invalid argument to '-march': '_zacas_zabha'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_programming.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/inc/dml2_internal_shared_types.h, ...):
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v3.h:53:45: sparse: sparse: no newline at end of file
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_programming.c:1131:74: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_programming.c:1132:70: sparse: sparse: Using plain integer as NULL pointer
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn60.c:586:9: sparse: sparse: static assertion failed: "DMUB command size mismatch"
   drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn60.c:662:9: sparse: sparse: static assertion failed: "DMUB command size mismatch"
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
   WARNING: invalid argument to '-march': '_zacas_zabha'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_pmo/dml2_pmo_dcn6_stage_optimizers.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/inc/dml2_internal_shared_types.h, ...):
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v3.h:53:45: sparse: sparse: no newline at end of file
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_pmo/dml2_pmo_dcn6_stage_optimizers.c:1417:87: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_pmo/dml2_pmo_dcn6_stage_optimizers.c:1417:90: sparse: sparse: Using plain integer as NULL pointer

vim +1131 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_programming.c

7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    10  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    11  static bool dcn5_mode_programming(struct dml2_core_calcs_mode_programming_ex *in_out_params)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    12  {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    13  	const struct dml2_display_cfg *display_cfg = in_out_params->in_display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    14  	const struct dml2_utm_soc_bb *utm_soc_bb = in_out_params->utm_soc_bb;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    15  	const struct dml2_sop_table *sop_table = &in_out_params->utm_soc_bb->sop_table;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    16  	const struct core_display_cfg_support_info *cfg_support_info = in_out_params->cfg_support_info;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    17  	struct dml2_core_internal_display_mode_lib *mode_lib = in_out_params->mode_lib;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    18  	const struct dml2_display_cfg_programming *programming = in_out_params->programming;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    19  	struct dml2_core_calcs_mode_programming_locals *s = &mode_lib->scratch.dml_core_mode_programming_locals;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    20  	struct dml2_core_calcs_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_params *CalculateWatermarks_params = &mode_lib->scratch.CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    21  	struct dml2_core_calcs_CalculateVMRowAndSwath_params *CalculateVMRowAndSwath_params = &mode_lib->scratch.CalculateVMRowAndSwath_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    22  	struct dml2_core_calcs_CalculateSwathAndDETConfiguration_params *CalculateSwathAndDETConfiguration_params = &mode_lib->scratch.CalculateSwathAndDETConfiguration_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    23  	struct dml2_core_calcs_CalculateStutterEfficiency_params *CalculateStutterEfficiency_params = &mode_lib->scratch.CalculateStutterEfficiency_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    24  	struct dml2_core_calcs_CalculatePrefetchSchedule_params *CalculatePrefetchSchedule_params = &mode_lib->scratch.CalculatePrefetchSchedule_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    25  	struct dml2_core_calcs_calculate_mcache_setting_params *calculate_mcache_setting_params = &mode_lib->scratch.calculate_mcache_setting_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    26  	struct dml2_core_calcs_calculate_tdlut_setting_params *calculate_tdlut_setting_params = &mode_lib->scratch.calculate_tdlut_setting_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    27  	struct dml2_core_shared_CalculateMetaAndPTETimes_params *CalculateMetaAndPTETimes_params = &mode_lib->scratch.CalculateMetaAndPTETimes_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    28  	struct dml2_core_calcs_calculate_peak_bandwidth_required_params *calculate_peak_bandwidth_params = &mode_lib->scratch.calculate_peak_bandwidth_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    29  	struct dml2_core_calcs_calculate_bytes_to_fetch_required_to_hide_latency_params *calculate_bytes_to_fetch_required_to_hide_latency_params = &mode_lib->scratch.calculate_bytes_to_fetch_required_to_hide_latency_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    30  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    31  	unsigned int k, j;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    32  	bool must_support_iflip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    33  	const long min_return_uclk_cycles = 83;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    34  	const long min_return_fclk_cycles = 75;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    35  	struct dml2_soc_operating_point max_sop;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    36  	struct dml2_soc_operating_point min_sop;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    37  	double min_return_latency_in_DCFCLK_cycles = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    38  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    39  	DML_LOG_VERBOSE("DML::%s: --- START --- \n", __func__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    40  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    41  	s->num_active_planes = display_cfg->num_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    42  	dml2_core_utils_get_stream_output_bpp(s->OutputBpp, display_cfg);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    43  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    44  	mode_lib->mp.num_active_pipes = dml2_core_util_get_num_active_pipes(display_cfg->num_planes, cfg_support_info);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    45  	dml2_core_utils_pipe_plane_mapping(cfg_support_info, mode_lib->mp.pipe_plane);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    46  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    47  	mode_lib->mp.GlobalDPPCLK = programming->min_clocks.dcn4x.dpprefclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    48  	sop_table->get_max_sop(sop_table, &max_sop);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    49  	sop_table->get_min_sop(sop_table, &min_sop);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    50  	s->SOCCLK = min_sop.socclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    51  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    52  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    53  		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    54  		DML_ASSERT(cfg_support_info->stream_support_info[stream_index].odms_used <= 4);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    55  		DML_ASSERT(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 4 ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    56  					cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 2 ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    57  					cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 1);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    58  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    59  		if (cfg_support_info->stream_support_info[stream_index].odms_used > 1)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    60  			DML_ASSERT(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 1);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    61  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    62  		switch (cfg_support_info->stream_support_info[stream_index].odms_used) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    63  		case (4):
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    64  			mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_4to1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    65  			break;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    66  		case (3):
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    67  			mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_3to1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    68  			break;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    69  		case (2):
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    70  			mode_lib->mp.ODMMode[k] = dml2_odm_mode_combine_2to1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    71  			break;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    72  		default:
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    73  			if (cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 4)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    74  				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to4;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    75  			else if (cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 2)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    76  				mode_lib->mp.ODMMode[k] = dml2_odm_mode_mso_1to2;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    77  			else
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    78  				mode_lib->mp.ODMMode[k] = dml2_odm_mode_bypass;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    79  			break;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    80  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    81  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    82  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    83  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    84  		mode_lib->mp.NoOfDPP[k] = cfg_support_info->plane_support_info[k].dpps_used;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    85  		mode_lib->mp.Dppclk[k] = programming->plane_programming[k].min_clocks.dcn4x.dppclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    86  		DML_ASSERT(mode_lib->mp.Dppclk[k] > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    87  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    88  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    89  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    90  		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    91  		mode_lib->mp.DSCCLK[k] = programming->stream_programming[stream_index].min_clocks.dcn4x.dscclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    92  		DML_LOG_VERBOSE("DML::%s: k=%d stream_index=%d, mode_lib->mp.DSCCLK = %f\n", __func__, k, stream_index, mode_lib->mp.DSCCLK[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    93  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    94  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    95  	mode_lib->mp.Dispclk = programming->min_clocks.dcn4x.dispclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    96  	mode_lib->mp.DCFCLKDeepSleep = programming->min_clocks.dcn4x.deepsleep_dcfclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    97  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    98  	memcpy(mode_lib->mp.uclk_pstate_switch_modes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    99  			in_out_params->uclk_params->pstate_switch_modes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   100  			sizeof(in_out_params->uclk_params->pstate_switch_modes));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   101  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   102  	DML_ASSERT(mode_lib->mp.Dcfclk > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   103  	DML_ASSERT(mode_lib->mp.FabricClock > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   104  	DML_ASSERT(mode_lib->mp.uclk_freq_mhz > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   105  	DML_ASSERT(mode_lib->mp.GlobalDPPCLK > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   106  	DML_ASSERT(mode_lib->mp.Dispclk > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   107  	DML_ASSERT(mode_lib->mp.DCFCLKDeepSleep > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   108  	DML_ASSERT(s->SOCCLK > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   109  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   110  	DML_LOG_VERBOSE("DML::%s: num_active_planes = %u\n", __func__, s->num_active_planes);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   111  	DML_LOG_VERBOSE("DML::%s: num_active_pipes = %u\n", __func__, mode_lib->mp.num_active_pipes);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   112  	DML_LOG_VERBOSE("DML::%s: Dcfclk = %f\n", __func__, mode_lib->mp.Dcfclk);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   113  	DML_LOG_VERBOSE("DML::%s: FabricClock = %f\n", __func__, mode_lib->mp.FabricClock);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   114  	DML_LOG_VERBOSE("DML::%s: uclk_freq_mhz = %f\n", __func__, mode_lib->mp.uclk_freq_mhz);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   115  	DML_LOG_VERBOSE("DML::%s: Dispclk = %f\n", __func__, mode_lib->mp.Dispclk);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   116  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   117  		DML_LOG_VERBOSE("DML::%s: Dppclk[%0d] = %f\n", __func__, k, mode_lib->mp.Dppclk[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   118  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   119  	DML_LOG_VERBOSE("DML::%s: GlobalDPPCLK = %f\n", __func__, mode_lib->mp.GlobalDPPCLK);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   120  	DML_LOG_VERBOSE("DML::%s: DCFCLKDeepSleep = %f\n", __func__, mode_lib->mp.DCFCLKDeepSleep);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   121  	DML_LOG_VERBOSE("DML::%s: SOCCLK = %f\n", __func__, s->SOCCLK);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   122  	for (k = 0; k < mode_lib->mp.num_active_pipes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   123  		DML_LOG_VERBOSE("DML::%s: pipe=%d is in plane=%d\n", __func__, k, mode_lib->mp.pipe_plane[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   124  		DML_LOG_VERBOSE("DML::%s: Per-plane DPPPerSurface[%0d] = %d\n", __func__, k, mode_lib->mp.NoOfDPP[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   125  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   126  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   127  	for (k = 0; k < s->num_active_planes; k++)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   128  		DML_LOG_VERBOSE("DML::%s: plane_%d: reserved_vblank_time_ns = %lu\n", __func__, k, display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   129  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   130  	dcn5_calculate_max_det_and_min_compressed_buffer_size(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   131  		mode_lib->ip.config_return_buffer_size_in_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   132  		mode_lib->ip.config_return_buffer_segment_size_in_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   133  		mode_lib->ip.rob_buffer_size_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   134  		mode_lib->ip.max_num_dpp,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   135  		display_cfg->overrides.hw.force_nom_det_size_kbytes.enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   136  		display_cfg->overrides.hw.force_nom_det_size_kbytes.value,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   137  		mode_lib->ip.dcn_mrq_present,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   138  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   139  		/* Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   140  		&s->MaxTotalDETInKByte,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   141  		&s->NomDETInKByte,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   142  		&s->MinCompressedBufferSizeInKByte);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   143  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   144  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   145  	dcn5_adjust_pixel_clock_for_progressive_to_interlace_unit(display_cfg, mode_lib->ip.ptoi_supported, s->PixelClockBackEnd);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   146  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   147  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   148  		dcn5_calculate_single_pipe_dppclk_and_scl_throughput(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   149  			display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   150  			display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   151  			display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   152  			display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   153  			mode_lib->ip.max_dchub_pscl_bw_pix_per_clk,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   154  			mode_lib->ip.max_pscl_lb_bw_pix_per_clk,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   155  			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   156  			display_cfg->plane_descriptors[k].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   157  			display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   158  			display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   159  			display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   160  			display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   161  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   162  			/* Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   163  			&mode_lib->mp.PSCL_THROUGHPUT[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   164  			&mode_lib->mp.PSCL_THROUGHPUT_CHROMA[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   165  			&mode_lib->mp.DPPCLKUsingSingleDPP[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   166  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   167  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   168  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   169  		dcn5_calculate_byte_per_pixel_and_block_sizes(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   170  			display_cfg->plane_descriptors[k].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   171  			display_cfg->plane_descriptors[k].surface.tiling,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   172  			display_cfg->plane_descriptors[k].surface.plane0.pitch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   173  			display_cfg->plane_descriptors[k].surface.plane1.pitch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   174  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   175  			// Output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   176  			&mode_lib->mp.BytePerPixelY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   177  			&mode_lib->mp.BytePerPixelC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   178  			&mode_lib->mp.BytePerPixelInDETY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   179  			&mode_lib->mp.BytePerPixelInDETC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   180  			&mode_lib->mp.Read256BlockHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   181  			&mode_lib->mp.Read256BlockHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   182  			&mode_lib->mp.Read256BlockWidthY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   183  			&mode_lib->mp.Read256BlockWidthC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   184  			&mode_lib->mp.MacroTileHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   185  			&mode_lib->mp.MacroTileHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   186  			&mode_lib->mp.MacroTileWidthY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   187  			&mode_lib->mp.MacroTileWidthC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   188  			&mode_lib->mp.surf_linear128_l[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   189  			&mode_lib->mp.surf_linear128_c[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   190  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   191  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   192  	dcn5_calculate_swath_width(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   193  		display_cfg,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   194  		false, // ForceSingleDPP
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   195  		s->num_active_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   196  		mode_lib->mp.ODMMode,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   197  		mode_lib->mp.BytePerPixelY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   198  		mode_lib->mp.BytePerPixelC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   199  		mode_lib->mp.Read256BlockHeightY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   200  		mode_lib->mp.Read256BlockHeightC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   201  		mode_lib->mp.Read256BlockWidthY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   202  		mode_lib->mp.Read256BlockWidthC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   203  		mode_lib->mp.surf_linear128_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   204  		mode_lib->mp.surf_linear128_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   205  		mode_lib->mp.NoOfDPP,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   206  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   207  		/* Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   208  		mode_lib->mp.req_per_swath_ub_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   209  		mode_lib->mp.req_per_swath_ub_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   210  		mode_lib->mp.SwathWidthSingleDPPY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   211  		mode_lib->mp.SwathWidthSingleDPPC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   212  		mode_lib->mp.SwathWidthY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   213  		mode_lib->mp.SwathWidthC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   214  		s->dummy_integer_array[0], // unsigned int MaximumSwathHeightY[]
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   215  		s->dummy_integer_array[1], // unsigned int MaximumSwathHeightC[]
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   216  		mode_lib->mp.swath_width_luma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   217  		mode_lib->mp.swath_width_chroma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   218  		s->dummy_integer_array[2],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   219  		s->dummy_integer_array[3]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   220  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   221  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   222  		mode_lib->mp.cursor_bw[k] = display_cfg->plane_descriptors[k].cursor.num_cursors * display_cfg->plane_descriptors[k].cursor.cursor_width * display_cfg->plane_descriptors[k].cursor.cursor_bpp / 8.0 /
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   223  			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   224  		mode_lib->mp.vactive_sw_bw_l[k] = mode_lib->mp.SwathWidthSingleDPPY[k] * mode_lib->mp.BytePerPixelY[k] / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   225  		mode_lib->mp.vactive_sw_bw_c[k] = mode_lib->mp.SwathWidthSingleDPPC[k] * mode_lib->mp.BytePerPixelC[k] / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   226  		DML_LOG_VERBOSE("DML::%s: vactive_sw_bw_l[%i] = %fBps\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   227  		DML_LOG_VERBOSE("DML::%s: vactive_sw_bw_c[%i] = %fBps\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   228  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   229  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   230  	CalculateSwathAndDETConfiguration_params->display_cfg = display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   231  	CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSizeInKByte = mode_lib->ip.config_return_buffer_size_in_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   232  	CalculateSwathAndDETConfiguration_params->MaxTotalDETInKByte = s->MaxTotalDETInKByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   233  	CalculateSwathAndDETConfiguration_params->MinCompressedBufferSizeInKByte = s->MinCompressedBufferSizeInKByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   234  	CalculateSwathAndDETConfiguration_params->rob_buffer_size_kbytes = mode_lib->ip.rob_buffer_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   235  	CalculateSwathAndDETConfiguration_params->pixel_chunk_size_kbytes = mode_lib->ip.pixel_chunk_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   236  	CalculateSwathAndDETConfiguration_params->rob_buffer_size_kbytes = mode_lib->ip.rob_buffer_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   237  	CalculateSwathAndDETConfiguration_params->pixel_chunk_size_kbytes = mode_lib->ip.pixel_chunk_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   238  	CalculateSwathAndDETConfiguration_params->ForceSingleDPP = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   239  	CalculateSwathAndDETConfiguration_params->NumberOfActiveSurfaces = s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   240  	CalculateSwathAndDETConfiguration_params->nomDETInKByte = s->NomDETInKByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   241  	CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSegmentSizeInkByte = mode_lib->ip.config_return_buffer_segment_size_in_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   242  	CalculateSwathAndDETConfiguration_params->CompressedBufferSegmentSizeInkByte = mode_lib->ip.compressed_buffer_segment_size_in_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   243  	CalculateSwathAndDETConfiguration_params->ReadBandwidthLuma = mode_lib->mp.vactive_sw_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   244  	CalculateSwathAndDETConfiguration_params->ReadBandwidthChroma = mode_lib->mp.vactive_sw_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   245  	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthLuma = s->dummy_single_array[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   246  	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthChroma = s->dummy_single_array[1];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   247  	CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightY = mode_lib->mp.Read256BlockHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   248  	CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightC = mode_lib->mp.Read256BlockHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   249  	CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthY = mode_lib->mp.Read256BlockWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   250  	CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthC = mode_lib->mp.Read256BlockWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   251  	CalculateSwathAndDETConfiguration_params->surf_linear128_l = mode_lib->mp.surf_linear128_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   252  	CalculateSwathAndDETConfiguration_params->surf_linear128_c = mode_lib->mp.surf_linear128_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   253  	CalculateSwathAndDETConfiguration_params->ODMMode = mode_lib->mp.ODMMode;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   254  	CalculateSwathAndDETConfiguration_params->DPPPerSurface = mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   255  	CalculateSwathAndDETConfiguration_params->BytePerPixY = mode_lib->mp.BytePerPixelY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   256  	CalculateSwathAndDETConfiguration_params->BytePerPixC = mode_lib->mp.BytePerPixelC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   257  	CalculateSwathAndDETConfiguration_params->BytePerPixDETY = mode_lib->mp.BytePerPixelInDETY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   258  	CalculateSwathAndDETConfiguration_params->BytePerPixDETC = mode_lib->mp.BytePerPixelInDETC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   259  	CalculateSwathAndDETConfiguration_params->mrq_present = mode_lib->ip.dcn_mrq_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   260  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   261  	// output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   262  	CalculateSwathAndDETConfiguration_params->req_per_swath_ub_l = mode_lib->mp.req_per_swath_ub_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   263  	CalculateSwathAndDETConfiguration_params->req_per_swath_ub_c = mode_lib->mp.req_per_swath_ub_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   264  	CalculateSwathAndDETConfiguration_params->swath_width_luma_ub = s->dummy_long_array[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   265  	CalculateSwathAndDETConfiguration_params->swath_width_chroma_ub = s->dummy_long_array[1];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   266  	CalculateSwathAndDETConfiguration_params->SwathWidth = s->dummy_long_array[2];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   267  	CalculateSwathAndDETConfiguration_params->SwathWidthChroma = s->dummy_long_array[3];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   268  	CalculateSwathAndDETConfiguration_params->SwathHeightY = mode_lib->mp.SwathHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   269  	CalculateSwathAndDETConfiguration_params->SwathHeightC = mode_lib->mp.SwathHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   270  	CalculateSwathAndDETConfiguration_params->request_size_bytes_luma = mode_lib->mp.request_size_bytes_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   271  	CalculateSwathAndDETConfiguration_params->request_size_bytes_chroma = mode_lib->mp.request_size_bytes_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   272  	CalculateSwathAndDETConfiguration_params->DETBufferSizeInKByte = mode_lib->mp.DETBufferSizeInKByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   273  	CalculateSwathAndDETConfiguration_params->DETBufferSizeY = mode_lib->mp.DETBufferSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   274  	CalculateSwathAndDETConfiguration_params->DETBufferSizeC = mode_lib->mp.DETBufferSizeC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   275  	CalculateSwathAndDETConfiguration_params->full_swath_bytes_l = s->full_swath_bytes_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   276  	CalculateSwathAndDETConfiguration_params->full_swath_bytes_c = s->full_swath_bytes_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   277  	CalculateSwathAndDETConfiguration_params->full_swath_bytes_single_dpp_l = s->dummy_long_array[4];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   278  	CalculateSwathAndDETConfiguration_params->full_swath_bytes_single_dpp_c = s->dummy_long_array[5];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   279  	CalculateSwathAndDETConfiguration_params->UnboundedRequestEnabled = &mode_lib->mp.UnboundedRequestEnabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   280  	CalculateSwathAndDETConfiguration_params->compbuf_reserved_space_64b = &mode_lib->mp.compbuf_reserved_space_64b;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   281  	CalculateSwathAndDETConfiguration_params->hw_debug5 = &mode_lib->mp.hw_debug5;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   282  	CalculateSwathAndDETConfiguration_params->CompressedBufferSizeInkByte = &mode_lib->mp.CompressedBufferSizeInkByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   283  	CalculateSwathAndDETConfiguration_params->ViewportSizeSupportPerSurface = &s->dummy_boolean_array[0][0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   284  	CalculateSwathAndDETConfiguration_params->ViewportSizeSupport = &s->dummy_boolean[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   285  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   286  	// Calculate DET size, swath height here.
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   287  	dcn5_calculate_swath_and_det_configuration(&mode_lib->scratch, CalculateSwathAndDETConfiguration_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   288  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   289  	// DSC Delay
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   290  	mode_lib->mp.use_legacy_dsc_delay_formula = mode_lib->ip.use_legacy_dsc_delay_formula;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   291  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   292  		mode_lib->mp.DSCDelay[k] = dcn5_calculate_dsc_delay_requirement(cfg_support_info->stream_support_info[display_cfg->plane_descriptors[k].stream_index].dsc_enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   293  			mode_lib->mp.ODMMode[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   294  			mode_lib->ip.maximum_dsc_bits_per_component,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   295  			s->OutputBpp[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   296  			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   297  			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   298  			cfg_support_info->stream_support_info[display_cfg->plane_descriptors[k].stream_index].num_dsc_slices,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   299  			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   300  			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_encoder,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   301  			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   302  			s->PixelClockBackEnd[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   303  			mode_lib->mp.use_legacy_dsc_delay_formula);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   304  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   305  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   306  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   307  		s->SurfaceParameters[k].PixelClock = ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   308  		s->SurfaceParameters[k].DPPPerSurface = mode_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   309  		s->SurfaceParameters[k].RotationAngle = display_cfg->plane_descriptors[k].composition.rotation_angle;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   310  		s->SurfaceParameters[k].ViewportHeight = display_cfg->plane_descriptors[k].composition.viewport.plane0.height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   311  		s->SurfaceParameters[k].ViewportHeightC = display_cfg->plane_descriptors[k].composition.viewport.plane1.height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   312  		s->SurfaceParameters[k].BlockWidth256BytesY = mode_lib->mp.Read256BlockWidthY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   313  		s->SurfaceParameters[k].BlockHeight256BytesY = mode_lib->mp.Read256BlockHeightY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   314  		s->SurfaceParameters[k].BlockWidth256BytesC = mode_lib->mp.Read256BlockWidthC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   315  		s->SurfaceParameters[k].BlockHeight256BytesC = mode_lib->mp.Read256BlockHeightC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   316  		s->SurfaceParameters[k].BlockWidthY = mode_lib->mp.MacroTileWidthY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   317  		s->SurfaceParameters[k].BlockHeightY = mode_lib->mp.MacroTileHeightY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   318  		s->SurfaceParameters[k].BlockWidthC = mode_lib->mp.MacroTileWidthC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   319  		s->SurfaceParameters[k].BlockHeightC = mode_lib->mp.MacroTileHeightC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   320  		s->SurfaceParameters[k].InterlaceEnable = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.interlaced;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   321  		s->SurfaceParameters[k].HTotal = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   322  		s->SurfaceParameters[k].DCCEnable = display_cfg->plane_descriptors[k].surface.dcc.enable;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   323  		s->SurfaceParameters[k].SourcePixelFormat = display_cfg->plane_descriptors[k].pixel_format;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   324  		s->SurfaceParameters[k].SurfaceTiling = display_cfg->plane_descriptors[k].surface.tiling;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   325  		s->SurfaceParameters[k].BytePerPixelY = mode_lib->mp.BytePerPixelY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   326  		s->SurfaceParameters[k].BytePerPixelC = mode_lib->mp.BytePerPixelC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   327  		s->SurfaceParameters[k].ProgressiveToInterlaceUnitInOPP = mode_lib->ip.ptoi_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   328  		s->SurfaceParameters[k].VRatio = display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   329  		s->SurfaceParameters[k].VRatioChroma = display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   330  		s->SurfaceParameters[k].VTaps = display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_taps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   331  		s->SurfaceParameters[k].VTapsChroma = display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_taps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   332  		s->SurfaceParameters[k].PitchY = display_cfg->plane_descriptors[k].surface.plane0.pitch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   333  		s->SurfaceParameters[k].PitchC = display_cfg->plane_descriptors[k].surface.plane1.pitch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   334  		s->SurfaceParameters[k].ViewportStationary = display_cfg->plane_descriptors[k].composition.viewport.stationary;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   335  		s->SurfaceParameters[k].ViewportXStart = display_cfg->plane_descriptors[k].composition.viewport.plane0.x_start;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   336  		s->SurfaceParameters[k].ViewportYStart = display_cfg->plane_descriptors[k].composition.viewport.plane0.y_start;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   337  		s->SurfaceParameters[k].ViewportXStartC = display_cfg->plane_descriptors[k].composition.viewport.plane1.y_start;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   338  		s->SurfaceParameters[k].ViewportYStartC = display_cfg->plane_descriptors[k].composition.viewport.plane1.y_start;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   339  		s->SurfaceParameters[k].FORCE_ONE_ROW_FOR_FRAME = display_cfg->plane_descriptors[k].overrides.hw.force_one_row_for_frame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   340  		s->SurfaceParameters[k].SwathHeightY = mode_lib->mp.SwathHeightY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   341  		s->SurfaceParameters[k].SwathHeightC = mode_lib->mp.SwathHeightC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   342  		s->SurfaceParameters[k].DCCMetaPitchY = display_cfg->plane_descriptors[k].surface.dcc.plane0.pitch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   343  		s->SurfaceParameters[k].DCCMetaPitchC = display_cfg->plane_descriptors[k].surface.dcc.plane1.pitch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   344  		s->SurfaceParameters[k].UPSPEnabled = display_cfg->plane_descriptors[k].composition.scaler_info.upsp_enabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   345  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   346  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   347  	CalculateVMRowAndSwath_params->display_cfg = display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   348  	CalculateVMRowAndSwath_params->uclk_pstate_switch_modes = mode_lib->ms.uclk_pstate_switch_modes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   349  	CalculateVMRowAndSwath_params->NumberOfActiveSurfaces = s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   350  	CalculateVMRowAndSwath_params->myPipe = s->SurfaceParameters;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   351  	CalculateVMRowAndSwath_params->PTEBufferSizeInRequestsLuma = mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   352  	CalculateVMRowAndSwath_params->PTEBufferSizeInRequestsChroma = mode_lib->ip.dpte_buffer_size_in_pte_reqs_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   353  	CalculateVMRowAndSwath_params->SwathWidthY = mode_lib->mp.SwathWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   354  	CalculateVMRowAndSwath_params->SwathWidthC = mode_lib->mp.SwathWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   355  	CalculateVMRowAndSwath_params->DCCMetaBufferSizeBytes = mode_lib->ip.dcc_meta_buffer_size_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   356  	CalculateVMRowAndSwath_params->mrq_present = mode_lib->ip.dcn_mrq_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   357  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   358  	// output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   359  	CalculateVMRowAndSwath_params->PTEBufferSizeNotExceeded = s->dummy_boolean_array[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   360  	CalculateVMRowAndSwath_params->dpte_row_width_luma_ub = mode_lib->mp.dpte_row_width_luma_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   361  	CalculateVMRowAndSwath_params->dpte_row_width_chroma_ub = mode_lib->mp.dpte_row_width_chroma_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   362  	CalculateVMRowAndSwath_params->dpte_row_height_luma = mode_lib->mp.dpte_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   363  	CalculateVMRowAndSwath_params->dpte_row_height_chroma = mode_lib->mp.dpte_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   364  	CalculateVMRowAndSwath_params->dpte_row_height_linear_luma = mode_lib->mp.dpte_row_height_linear;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   365  	CalculateVMRowAndSwath_params->dpte_row_height_linear_chroma = mode_lib->mp.dpte_row_height_linear_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   366  	CalculateVMRowAndSwath_params->vm_group_bytes = mode_lib->mp.vm_group_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   367  	CalculateVMRowAndSwath_params->dpte_group_bytes = mode_lib->mp.dpte_group_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   368  	CalculateVMRowAndSwath_params->PixelPTEReqWidthY = mode_lib->mp.PixelPTEReqWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   369  	CalculateVMRowAndSwath_params->PixelPTEReqHeightY = mode_lib->mp.PixelPTEReqHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   370  	CalculateVMRowAndSwath_params->PTERequestSizeY = mode_lib->mp.PTERequestSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   371  	CalculateVMRowAndSwath_params->PixelPTEReqWidthC = mode_lib->mp.PixelPTEReqWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   372  	CalculateVMRowAndSwath_params->PixelPTEReqHeightC = mode_lib->mp.PixelPTEReqHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   373  	CalculateVMRowAndSwath_params->PTERequestSizeC = mode_lib->mp.PTERequestSizeC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   374  	CalculateVMRowAndSwath_params->vmpg_width_y = s->vmpg_width_y;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   375  	CalculateVMRowAndSwath_params->vmpg_height_y = s->vmpg_height_y;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   376  	CalculateVMRowAndSwath_params->vmpg_width_c = s->vmpg_width_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   377  	CalculateVMRowAndSwath_params->vmpg_height_c = s->vmpg_height_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   378  	CalculateVMRowAndSwath_params->dpde0_bytes_per_frame_ub_l = mode_lib->mp.dpde0_bytes_per_frame_ub_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   379  	CalculateVMRowAndSwath_params->dpde0_bytes_per_frame_ub_c = mode_lib->mp.dpde0_bytes_per_frame_ub_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   380  	CalculateVMRowAndSwath_params->PrefetchSourceLinesY = mode_lib->mp.PrefetchSourceLinesY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   381  	CalculateVMRowAndSwath_params->PrefetchSourceLinesC = mode_lib->mp.PrefetchSourceLinesC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   382  	CalculateVMRowAndSwath_params->VInitPreFillY = mode_lib->mp.VInitPreFillY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   383  	CalculateVMRowAndSwath_params->VInitPreFillC = mode_lib->mp.VInitPreFillC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   384  	CalculateVMRowAndSwath_params->MaxNumSwathY = mode_lib->mp.MaxNumSwathY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   385  	CalculateVMRowAndSwath_params->MaxNumSwathC = mode_lib->mp.MaxNumSwathC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   386  	CalculateVMRowAndSwath_params->dpte_row_bw = mode_lib->mp.dpte_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   387  	CalculateVMRowAndSwath_params->PixelPTEBytesPerRow = mode_lib->mp.PixelPTEBytesPerRow;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   388  	CalculateVMRowAndSwath_params->dpte_row_bytes_per_row_l = s->dpte_row_bytes_per_row_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   389  	CalculateVMRowAndSwath_params->dpte_row_bytes_per_row_c = s->dpte_row_bytes_per_row_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   390  	CalculateVMRowAndSwath_params->vm_bytes = mode_lib->mp.vm_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   391  	CalculateVMRowAndSwath_params->use_one_row_for_frame = mode_lib->mp.use_one_row_for_frame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   392  	CalculateVMRowAndSwath_params->use_one_row_for_frame_flip = mode_lib->mp.use_one_row_for_frame_flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   393  	CalculateVMRowAndSwath_params->PTE_BUFFER_MODE = mode_lib->mp.PTE_BUFFER_MODE;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   394  	CalculateVMRowAndSwath_params->BIGK_FRAGMENT_SIZE = mode_lib->mp.BIGK_FRAGMENT_SIZE;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   395  	CalculateVMRowAndSwath_params->DCCMetaBufferSizeNotExceeded = s->dummy_boolean_array[1];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   396  	CalculateVMRowAndSwath_params->meta_row_bw = mode_lib->mp.meta_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   397  	CalculateVMRowAndSwath_params->meta_row_bytes = mode_lib->mp.meta_row_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   398  	CalculateVMRowAndSwath_params->meta_row_bytes_per_row_ub_l = s->meta_row_bytes_per_row_ub_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   399  	CalculateVMRowAndSwath_params->meta_row_bytes_per_row_ub_c = s->meta_row_bytes_per_row_ub_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   400  	CalculateVMRowAndSwath_params->meta_req_width_luma = mode_lib->mp.meta_req_width;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   401  	CalculateVMRowAndSwath_params->meta_req_height_luma = mode_lib->mp.meta_req_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   402  	CalculateVMRowAndSwath_params->meta_row_width_luma = mode_lib->mp.meta_row_width;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   403  	CalculateVMRowAndSwath_params->meta_row_height_luma = mode_lib->mp.meta_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   404  	CalculateVMRowAndSwath_params->meta_pte_bytes_per_frame_ub_l = mode_lib->mp.meta_pte_bytes_per_frame_ub_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   405  	CalculateVMRowAndSwath_params->meta_req_width_chroma = mode_lib->mp.meta_req_width_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   406  	CalculateVMRowAndSwath_params->meta_row_height_chroma = mode_lib->mp.meta_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   407  	CalculateVMRowAndSwath_params->meta_row_width_chroma = mode_lib->mp.meta_row_width_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   408  	CalculateVMRowAndSwath_params->meta_req_height_chroma = mode_lib->mp.meta_req_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   409  	CalculateVMRowAndSwath_params->meta_pte_bytes_per_frame_ub_c = mode_lib->mp.meta_pte_bytes_per_frame_ub_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   410  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   411  	dcn5_calculate_vm_row_and_swath(&mode_lib->scratch, CalculateVMRowAndSwath_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   412  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   413  	memset(calculate_mcache_setting_params, 0, sizeof(struct dml2_core_calcs_calculate_mcache_setting_params));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   414  	for (k = 0; k < s->num_active_planes; k++) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   415  		mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p0[k] = 1.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   416  		mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p0[k] = 1.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   417  		mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p1[k] = 1.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   418  		mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p1[k] = 1.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   419  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   420  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   421  	dcn5_calculate_hostvm_inefficiency_factor(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   422  		&s->HostVMInefficiencyFactor,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   423  		&s->HostVMInefficiencyFactorPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   424  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   425  		display_cfg->gpuvm_enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   426  		display_cfg->hostvm_enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   427  		mode_lib->ip.remote_iommu_outstanding_translations,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   428  		utm_soc_bb->max_outstanding_reqs,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   429  		1.0,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   430  		0.5);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   431  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   432  	s->TotalDCCActiveDPP = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   433  	s->TotalActiveDPP = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   434  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   435  		s->TotalActiveDPP = s->TotalActiveDPP + mode_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   436  		if (display_cfg->plane_descriptors[k].surface.dcc.enable)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   437  			s->TotalDCCActiveDPP = s->TotalDCCActiveDPP + mode_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   438  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   439  	// Calculate tdlut schedule related terms
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   440  	for (k = 0; k <= s->num_active_planes - 1; k++) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   441  		calculate_tdlut_setting_params->dispclk_mhz = mode_lib->mp.Dispclk;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   442  		calculate_tdlut_setting_params->setup_for_tdlut = display_cfg->plane_descriptors[k].tdlut.setup_for_tdlut;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   443  		calculate_tdlut_setting_params->tdlut_width_mode = display_cfg->plane_descriptors[k].tdlut.tdlut_width_mode;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   444  		calculate_tdlut_setting_params->tdlut_addressing_mode = display_cfg->plane_descriptors[k].tdlut.tdlut_addressing_mode;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   445  		calculate_tdlut_setting_params->cursor_buffer_size = mode_lib->ip.cursor_buffer_size;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   446  		calculate_tdlut_setting_params->gpuvm_enable = display_cfg->gpuvm_enable;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   447  		calculate_tdlut_setting_params->gpuvm_page_size_kbytes = display_cfg->plane_descriptors[k].overrides.gpuvm_min_page_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   448  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   449  		// output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   450  		calculate_tdlut_setting_params->tdlut_pte_bytes_per_frame = &s->tdlut_pte_bytes_per_frame[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   451  		calculate_tdlut_setting_params->tdlut_bytes_per_frame = &s->tdlut_bytes_per_frame[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   452  		calculate_tdlut_setting_params->tdlut_groups_per_2row_ub = &s->tdlut_groups_per_2row_ub[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   453  		calculate_tdlut_setting_params->tdlut_opt_time = &s->tdlut_opt_time[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   454  		calculate_tdlut_setting_params->tdlut_drain_time = &s->tdlut_drain_time[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   455  		calculate_tdlut_setting_params->tdlut_bytes_per_group = &s->tdlut_bytes_per_group[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   456  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   457  		dcn5_calculate_tdlut_setting(&mode_lib->scratch, calculate_tdlut_setting_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   458  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   459  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   460  	dcn5_calculate_extra_latency(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   461  		display_cfg,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   462  		mode_lib->ip.rob_buffer_size_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   463  		0,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   464  		s->ReorderingBytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   465  		mode_lib->mp.Dcfclk,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   466  		mode_lib->mp.FabricClock,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   467  		mode_lib->ip.pixel_chunk_size_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   468  		mode_lib->mp.dram_bw_mbps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   469  		s->num_active_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   470  		mode_lib->mp.NoOfDPP,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   471  		mode_lib->mp.dpte_group_bytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   472  		s->tdlut_bytes_per_group,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   473  		s->HostVMInefficiencyFactor,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   474  		s->HostVMInefficiencyFactorPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   475  		dml2_qos_param_type_dcn4x,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   476  		!(display_cfg->overrides.max_outstanding_when_urgent_expected_disable),
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   477  		utm_soc_bb->max_outstanding_reqs,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   478  		mode_lib->mp.request_size_bytes_luma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   479  		mode_lib->mp.request_size_bytes_chroma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   480  		mode_lib->ip.meta_chunk_size_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   481  		mode_lib->ip.dchub_arb_to_ret_delay,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   482  		mode_lib->mp.TripToMemory,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   483  		mode_lib->ip.hostvm_mode,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   484  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   485  		// output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   486  		&mode_lib->mp.ExtraLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   487  		&mode_lib->mp.ExtraLatency_sr,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   488  		&mode_lib->mp.ExtraLatencyPrefetch);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   489  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   490  	mode_lib->mp.TCalc = 24.0 / mode_lib->mp.DCFCLKDeepSleep;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   491  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   492  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   493  		mode_lib->mp.WritebackDelay[k] = 0.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   494  		for (j = 0; j < display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream; ++j) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   495  			mode_lib->mp.WritebackDelay[k] = math_max2(mode_lib->mp.WritebackDelay[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   496  					utm_soc_bb->writeback_base_latency_us
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   497  					+ dcn5_calculate_write_back_delay(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   498  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   499  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].h_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   500  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   501  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].v_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   502  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].v_taps_chroma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   503  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].output_width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   504  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].output_height,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   505  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].input_width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   506  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].input_height,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   507  						display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   508  						/ mode_lib->mp.Dispclk);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   509  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   510  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   511  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   512  	/* VActive bytes to fetch for UCLK P-State */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   513  	calculate_bytes_to_fetch_required_to_hide_latency_params->display_cfg = display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   514  	calculate_bytes_to_fetch_required_to_hide_latency_params->mrq_present = mode_lib->ip.dcn_mrq_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   515  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   516  	calculate_bytes_to_fetch_required_to_hide_latency_params->num_active_planes = s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   517  	calculate_bytes_to_fetch_required_to_hide_latency_params->num_of_dpp = mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   518  	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_height_l = mode_lib->mp.meta_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   519  	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_height_c = mode_lib->mp.meta_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   520  	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_bytes_per_row_ub_l = s->meta_row_bytes_per_row_ub_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   521  	calculate_bytes_to_fetch_required_to_hide_latency_params->meta_row_bytes_per_row_ub_c = s->meta_row_bytes_per_row_ub_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   522  	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_row_height_l = mode_lib->mp.dpte_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   523  	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_row_height_c = mode_lib->mp.dpte_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   524  	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_bytes_per_row_l = s->dpte_row_bytes_per_row_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   525  	calculate_bytes_to_fetch_required_to_hide_latency_params->dpte_bytes_per_row_c = s->dpte_row_bytes_per_row_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   526  	calculate_bytes_to_fetch_required_to_hide_latency_params->byte_per_pix_l = mode_lib->mp.BytePerPixelY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   527  	calculate_bytes_to_fetch_required_to_hide_latency_params->byte_per_pix_c = mode_lib->mp.BytePerPixelC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   528  	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_width_l = mode_lib->mp.SwathWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   529  	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_width_c = mode_lib->mp.SwathWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   530  	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_height_l = mode_lib->mp.SwathHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   531  	calculate_bytes_to_fetch_required_to_hide_latency_params->swath_height_c = mode_lib->mp.SwathHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   532  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   533  		calculate_bytes_to_fetch_required_to_hide_latency_params->latency_to_hide_us[k] = utm_soc_bb->power_management_parameters.dram_clk_change_blackout_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   534  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   535  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   536  	/* outputs */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   537  	calculate_bytes_to_fetch_required_to_hide_latency_params->bytes_required_l = s->pstate_bytes_required_l[dml2_pstate_type_uclk];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   538  	calculate_bytes_to_fetch_required_to_hide_latency_params->bytes_required_c = s->pstate_bytes_required_c[dml2_pstate_type_uclk];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   539  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   540  	dcn5_calculate_bytes_to_fetch_required_to_hide_latency(calculate_bytes_to_fetch_required_to_hide_latency_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   541  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   542  	/* Excess VActive bandwidth required to fill DET */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   543  	dcn5_calculate_excess_vactive_bandwidth_required(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   544  			display_cfg,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   545  			s->num_active_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   546  			s->pstate_bytes_required_l[dml2_pstate_type_uclk],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   547  			s->pstate_bytes_required_c[dml2_pstate_type_uclk],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   548  			/* outputs */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   549  			mode_lib->mp.excess_vactive_fill_bw_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   550  			mode_lib->mp.excess_vactive_fill_bw_c);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   551  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   552  	mode_lib->mp.TripToMemory = math_max2(mode_lib->mp.UrgentLatency, mode_lib->mp.TripToMemory);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   553  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   554  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   555  		bool cursor_not_enough_urgent_latency_hiding = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   556  		double line_time_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   557  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   558  		dcn5_calculate_cursor_req_attributes(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   559  			display_cfg->plane_descriptors[k].cursor.cursor_width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   560  			display_cfg->plane_descriptors[k].cursor.cursor_bpp,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   561  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   562  			// output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   563  			&s->cursor_lines_per_chunk[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   564  			&s->cursor_bytes_per_line[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   565  			&s->cursor_bytes_per_chunk[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   566  			&s->cursor_bytes[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   567  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   568  		line_time_us = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   569  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   570  		dcn5_calculate_cursor_urgent_burst_factor(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   571  			mode_lib->ip.cursor_buffer_size,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   572  			display_cfg->plane_descriptors[k].cursor.cursor_width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   573  			s->cursor_bytes_per_chunk[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   574  			s->cursor_lines_per_chunk[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   575  			line_time_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   576  			mode_lib->mp.UrgentLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   577  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   578  			// output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   579  			&mode_lib->mp.UrgentBurstFactorCursor[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   580  			&cursor_not_enough_urgent_latency_hiding);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   581  		mode_lib->mp.UrgentBurstFactorCursorPre[k] = mode_lib->mp.UrgentBurstFactorCursor[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   582  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   583  		dcn5_calculate_urgent_burst_factor(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   584  			&display_cfg->plane_descriptors[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   585  			mode_lib->mp.swath_width_luma_ub[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   586  			mode_lib->mp.swath_width_chroma_ub[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   587  			mode_lib->mp.SwathHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   588  			mode_lib->mp.SwathHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   589  			line_time_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   590  			mode_lib->mp.UrgentLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   591  			display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   592  			display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   593  			mode_lib->mp.BytePerPixelInDETY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   594  			mode_lib->mp.BytePerPixelInDETC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   595  			mode_lib->mp.DETBufferSizeY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   596  			mode_lib->mp.DETBufferSizeC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   597  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   598  			/* output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   599  			&mode_lib->mp.UrgentBurstFactorLuma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   600  			&mode_lib->mp.UrgentBurstFactorChroma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   601  			&mode_lib->mp.NotEnoughUrgentLatencyHiding[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   602  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   603  		mode_lib->mp.NotEnoughUrgentLatencyHiding[k] = mode_lib->mp.NotEnoughUrgentLatencyHiding[k] || cursor_not_enough_urgent_latency_hiding;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   604  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   605  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   606  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   607  		s->MaxVStartupLines[k] = dcn5_calculate_max_vstartup(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   608  			mode_lib->ip.ptoi_supported,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   609  			mode_lib->ip.vblank_nom_default_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   610  			&display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   611  			mode_lib->mp.WritebackDelay[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   612  		DML_LOG_VERBOSE("DML::%s: k=%u MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   613  		DML_LOG_VERBOSE("DML::%s: k=%u WritebackDelay = %f\n", __func__, k, mode_lib->mp.WritebackDelay[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   614  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   615  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   616  	s->immediate_flip_required = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   617  	for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   618  		s->immediate_flip_required = s->immediate_flip_required || display_cfg->plane_descriptors[k].immediate_flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   619  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   620  	DML_LOG_VERBOSE("DML::%s: immediate_flip_required = %u\n", __func__, s->immediate_flip_required);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   621  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   622  	{
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   623  		s->DestinationLineTimesForPrefetchLessThan2 = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   624  		s->VRatioPrefetchMoreThanMax = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   625  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   626  		DML_LOG_VERBOSE("DML::%s: Start one iteration of prefetch schedule evaluation\n", __func__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   627  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   628  		for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   629  			struct dml2_core_internal_DmlPipe *myPipe = &s->myPipe;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   630  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   631  			DML_LOG_VERBOSE("DML::%s: k=%d MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   632  			mode_lib->mp.TWait[k] = dcn5_calculate_t_wait(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   633  				display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   634  				mode_lib->mp.UrgentLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   635  				mode_lib->mp.TripToMemory,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   636  				utm_soc_bb->power_management_parameters.g7_ppt_blackout_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   637  				display_cfg->stream_descriptors->timing.drr_config.enabled);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   638  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   639  			myPipe->Dppclk = mode_lib->mp.Dppclk[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   640  			myPipe->Dispclk = mode_lib->mp.Dispclk;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   641  			myPipe->PixelClock = ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   642  			myPipe->DCFClkDeepSleep = mode_lib->mp.DCFCLKDeepSleep;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   643  			myPipe->DPPPerSurface = mode_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   644  			myPipe->ScalerEnabled = display_cfg->plane_descriptors[k].composition.scaler_info.enabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   645  			myPipe->VRatio = display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   646  			myPipe->VRatioChroma = display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   647  			myPipe->VTaps = display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_taps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   648  			myPipe->VTapsChroma = display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_taps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   649  			myPipe->RotationAngle = display_cfg->plane_descriptors[k].composition.rotation_angle;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   650  			myPipe->mirrored = display_cfg->plane_descriptors[k].composition.mirrored;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   651  			myPipe->BlockWidth256BytesY = mode_lib->mp.Read256BlockWidthY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   652  			myPipe->BlockHeight256BytesY = mode_lib->mp.Read256BlockHeightY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   653  			myPipe->BlockWidth256BytesC = mode_lib->mp.Read256BlockWidthC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   654  			myPipe->BlockHeight256BytesC = mode_lib->mp.Read256BlockHeightC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   655  			myPipe->InterlaceEnable = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.interlaced;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   656  			myPipe->NumberOfCursors = display_cfg->plane_descriptors[k].cursor.num_cursors;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   657  			myPipe->VBlank = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_active;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   658  			myPipe->HTotal = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   659  			myPipe->HActive = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   660  			myPipe->DCCEnable = display_cfg->plane_descriptors[k].surface.dcc.enable;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   661  			myPipe->ODMMode = mode_lib->mp.ODMMode[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   662  			myPipe->SourcePixelFormat = display_cfg->plane_descriptors[k].pixel_format;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   663  			myPipe->BytePerPixelY = mode_lib->mp.BytePerPixelY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   664  			myPipe->BytePerPixelC = mode_lib->mp.BytePerPixelC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   665  			myPipe->ProgressiveToInterlaceUnitInOPP = mode_lib->ip.ptoi_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   666  			DML_LOG_VERBOSE("DML::%s: Calling CalculatePrefetchSchedule for k=%u\n", __func__, k);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   667  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   668  			CalculatePrefetchSchedule_params->display_cfg = display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   669  			CalculatePrefetchSchedule_params->HostVMInefficiencyFactor = s->HostVMInefficiencyFactorPrefetch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   670  			CalculatePrefetchSchedule_params->myPipe = myPipe;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   671  			CalculatePrefetchSchedule_params->DSCDelay = mode_lib->mp.DSCDelay[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   672  			CalculatePrefetchSchedule_params->DPPCLKDelaySubtotalPlusCNVCFormater = mode_lib->ip.dppclk_delay_subtotal + mode_lib->ip.dppclk_delay_cnvc_formatter;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   673  			CalculatePrefetchSchedule_params->DPPCLKDelaySCL = mode_lib->ip.dppclk_delay_scl;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   674  			CalculatePrefetchSchedule_params->DPPCLKDelaySCLLBOnly = mode_lib->ip.dppclk_delay_scl_lb_only;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   675  			CalculatePrefetchSchedule_params->DPPCLKDelayCNVCCursor = mode_lib->ip.dppclk_delay_cnvc_cursor;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   676  			CalculatePrefetchSchedule_params->DISPCLKDelaySubtotal = mode_lib->ip.dispclk_delay_subtotal;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   677  			CalculatePrefetchSchedule_params->DPP_RECOUT_WIDTH = (unsigned int)(mode_lib->mp.SwathWidthY[k] / display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   678  			CalculatePrefetchSchedule_params->OutputFormat = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   679  			CalculatePrefetchSchedule_params->MaxInterDCNTileRepeaters = mode_lib->ip.max_inter_dcn_tile_repeaters;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   680  			CalculatePrefetchSchedule_params->VStartup = s->MaxVStartupLines[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   681  			CalculatePrefetchSchedule_params->HostVMMinPageSize = display_cfg->plane_descriptors[k].overrides.hostvm_min_page_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   682  			CalculatePrefetchSchedule_params->DynamicMetadataEnable = display_cfg->plane_descriptors[k].dynamic_meta_data.enable;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   683  			CalculatePrefetchSchedule_params->DynamicMetadataVMEnabled = mode_lib->ip.dynamic_metadata_vm_enabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   684  			CalculatePrefetchSchedule_params->DynamicMetadataLinesBeforeActiveRequired = display_cfg->plane_descriptors[k].dynamic_meta_data.lines_before_active_required;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   685  			CalculatePrefetchSchedule_params->DynamicMetadataTransmittedBytes = display_cfg->plane_descriptors[k].dynamic_meta_data.transmitted_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   686  			CalculatePrefetchSchedule_params->ExtraLatencyPrefetch = mode_lib->mp.ExtraLatencyPrefetch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   687  			CalculatePrefetchSchedule_params->TCalc = mode_lib->mp.TCalc;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   688  			CalculatePrefetchSchedule_params->vm_bytes = mode_lib->mp.vm_bytes[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   689  			CalculatePrefetchSchedule_params->PixelPTEBytesPerRow = mode_lib->mp.PixelPTEBytesPerRow[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   690  			CalculatePrefetchSchedule_params->PrefetchSourceLinesY = mode_lib->mp.PrefetchSourceLinesY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   691  			CalculatePrefetchSchedule_params->VInitPreFillY = mode_lib->mp.VInitPreFillY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   692  			CalculatePrefetchSchedule_params->MaxNumSwathY = mode_lib->mp.MaxNumSwathY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   693  			CalculatePrefetchSchedule_params->PrefetchSourceLinesC = mode_lib->mp.PrefetchSourceLinesC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   694  			CalculatePrefetchSchedule_params->VInitPreFillC = mode_lib->mp.VInitPreFillC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   695  			CalculatePrefetchSchedule_params->MaxNumSwathC = mode_lib->mp.MaxNumSwathC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   696  			CalculatePrefetchSchedule_params->swath_width_luma_ub = mode_lib->mp.swath_width_luma_ub[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   697  			CalculatePrefetchSchedule_params->swath_width_chroma_ub = mode_lib->mp.swath_width_chroma_ub[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   698  			CalculatePrefetchSchedule_params->SwathHeightY = mode_lib->mp.SwathHeightY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   699  			CalculatePrefetchSchedule_params->SwathHeightC = mode_lib->mp.SwathHeightC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   700  			CalculatePrefetchSchedule_params->TWait = mode_lib->mp.TWait[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   701  			CalculatePrefetchSchedule_params->Ttrip = mode_lib->mp.TripToMemory;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   702  			CalculatePrefetchSchedule_params->Turg = mode_lib->mp.UrgentLatency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   703  			CalculatePrefetchSchedule_params->setup_for_tdlut = display_cfg->plane_descriptors[k].tdlut.setup_for_tdlut;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   704  			CalculatePrefetchSchedule_params->tdlut_pte_bytes_per_frame = s->tdlut_pte_bytes_per_frame[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   705  			CalculatePrefetchSchedule_params->tdlut_bytes_per_frame = s->tdlut_bytes_per_frame[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   706  			CalculatePrefetchSchedule_params->tdlut_opt_time = s->tdlut_opt_time[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   707  			CalculatePrefetchSchedule_params->tdlut_drain_time = s->tdlut_drain_time[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   708  			CalculatePrefetchSchedule_params->num_cursors = (display_cfg->plane_descriptors[k].cursor.cursor_width > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   709  			CalculatePrefetchSchedule_params->cursor_bytes_per_chunk = s->cursor_bytes_per_chunk[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   710  			CalculatePrefetchSchedule_params->cursor_bytes_per_line = s->cursor_bytes_per_line[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   711  			CalculatePrefetchSchedule_params->dcc_enable = display_cfg->plane_descriptors[k].surface.dcc.enable;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   712  			CalculatePrefetchSchedule_params->mrq_present = mode_lib->ip.dcn_mrq_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   713  			CalculatePrefetchSchedule_params->meta_row_bytes = mode_lib->mp.meta_row_bytes[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   714  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   715  			// output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   716  			CalculatePrefetchSchedule_params->DSTXAfterScaler = &mode_lib->mp.DSTXAfterScaler[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   717  			CalculatePrefetchSchedule_params->DSTYAfterScaler = &mode_lib->mp.DSTYAfterScaler[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   718  			CalculatePrefetchSchedule_params->dst_y_prefetch = &mode_lib->mp.dst_y_prefetch[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   719  			CalculatePrefetchSchedule_params->dst_y_per_vm_vblank = &mode_lib->mp.dst_y_per_vm_vblank[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   720  			CalculatePrefetchSchedule_params->dst_y_per_row_vblank = &mode_lib->mp.dst_y_per_row_vblank[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   721  			CalculatePrefetchSchedule_params->VRatioPrefetchY = &mode_lib->mp.VRatioPrefetchY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   722  			CalculatePrefetchSchedule_params->VRatioPrefetchC = &mode_lib->mp.VRatioPrefetchC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   723  			CalculatePrefetchSchedule_params->RequiredPrefetchPixelDataBWLuma = &mode_lib->mp.RequiredPrefetchPixelDataBWLuma[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   724  			CalculatePrefetchSchedule_params->RequiredPrefetchPixelDataBWChroma = &mode_lib->mp.RequiredPrefetchPixelDataBWChroma[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   725  			CalculatePrefetchSchedule_params->NotEnoughTimeForDynamicMetadata = &mode_lib->mp.NotEnoughTimeForDynamicMetadata[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   726  			CalculatePrefetchSchedule_params->Tno_bw = &mode_lib->mp.Tno_bw[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   727  			CalculatePrefetchSchedule_params->Tno_bw_flip = &mode_lib->mp.Tno_bw_flip[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   728  			CalculatePrefetchSchedule_params->prefetch_vmrow_bw = &mode_lib->mp.prefetch_vmrow_bw[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   729  			CalculatePrefetchSchedule_params->Tdmdl_vm = &mode_lib->mp.Tdmdl_vm[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   730  			CalculatePrefetchSchedule_params->Tdmdl = &mode_lib->mp.Tdmdl[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   731  			CalculatePrefetchSchedule_params->TSetup = &mode_lib->mp.TSetup[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   732  			CalculatePrefetchSchedule_params->Tvm_trips = &s->Tvm_trips[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   733  			CalculatePrefetchSchedule_params->Tr0_trips = &s->Tr0_trips[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   734  			CalculatePrefetchSchedule_params->Tvm_trips_flip = &s->Tvm_trips_flip[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   735  			CalculatePrefetchSchedule_params->Tr0_trips_flip = &s->Tr0_trips_flip[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   736  			CalculatePrefetchSchedule_params->Tvm_trips_flip_rounded = &s->Tvm_trips_flip_rounded[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   737  			CalculatePrefetchSchedule_params->Tr0_trips_flip_rounded = &s->Tr0_trips_flip_rounded[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   738  			CalculatePrefetchSchedule_params->VUpdateOffsetPix = &mode_lib->mp.VUpdateOffsetPix[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   739  			CalculatePrefetchSchedule_params->VUpdateWidthPix = &mode_lib->mp.VUpdateWidthPix[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   740  			CalculatePrefetchSchedule_params->VReadyOffsetPix = &mode_lib->mp.VReadyOffsetPix[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   741  			CalculatePrefetchSchedule_params->prefetch_cursor_bw = &mode_lib->mp.prefetch_cursor_bw[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   742  			CalculatePrefetchSchedule_params->prefetch_sw_bytes = &s->prefetch_sw_bytes[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   743  			CalculatePrefetchSchedule_params->Tpre_rounded = &s->Tpre_rounded[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   744  			CalculatePrefetchSchedule_params->Tpre_oto = &s->Tpre_oto[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   745  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   746  			mode_lib->mp.NoTimeToPrefetch[k] = dcn5_calculate_prefetch_schedule(&mode_lib->scratch, CalculatePrefetchSchedule_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   747  			DML_LOG_VERBOSE("DML::%s: k=%0u NoTimeToPrefetch=%0d\n", __func__, k, mode_lib->mp.NoTimeToPrefetch[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   748  			mode_lib->mp.VStartupMin[k] = s->MaxVStartupLines[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   749  		} // for k
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   750  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   751  		mode_lib->mp.PrefetchModeSupported = true;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   752  		for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   753  			if (mode_lib->mp.NoTimeToPrefetch[k] == true ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   754  				mode_lib->mp.NotEnoughTimeForDynamicMetadata[k] ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   755  				mode_lib->mp.DSTYAfterScaler[k] > 8) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   756  				DML_LOG_VERBOSE("DML::%s: k=%u, NoTimeToPrefetch = %0d\n", __func__, k, mode_lib->mp.NoTimeToPrefetch[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   757  				DML_LOG_VERBOSE("DML::%s: k=%u, NotEnoughTimeForDynamicMetadata=%u\n", __func__, k, mode_lib->mp.NotEnoughTimeForDynamicMetadata[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   758  				DML_LOG_VERBOSE("DML::%s: k=%u, DSTYAfterScaler=%u (should be <= 0)\n", __func__, k, mode_lib->mp.DSTYAfterScaler[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   759  				mode_lib->mp.PrefetchModeSupported = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   760  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   761  			if (mode_lib->mp.dst_y_prefetch[k] < 2)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   762  				s->DestinationLineTimesForPrefetchLessThan2 = true;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   763  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   764  			if (mode_lib->mp.VRatioPrefetchY[k] > __DML2_CALCS_MAX_VRATIO_PRE__ ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   765  				mode_lib->mp.VRatioPrefetchC[k] > __DML2_CALCS_MAX_VRATIO_PRE__) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   766  				s->VRatioPrefetchMoreThanMax = true;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   767  				DML_LOG_VERBOSE("DML::%s: k=%d, VRatioPrefetchY=%f (should not be < %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchY[k], __DML2_CALCS_MAX_VRATIO_PRE__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   768  				DML_LOG_VERBOSE("DML::%s: k=%d, VRatioPrefetchC=%f (should not be < %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchC[k], __DML2_CALCS_MAX_VRATIO_PRE__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   769  				DML_LOG_VERBOSE("DML::%s: VRatioPrefetchMoreThanMax = %u\n", __func__, s->VRatioPrefetchMoreThanMax);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   770  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   771  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   772  			if (mode_lib->mp.NotEnoughUrgentLatencyHiding[k]) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   773  				DML_LOG_VERBOSE("DML::%s: k=%u, NotEnoughUrgentLatencyHiding = %u\n", __func__, k, mode_lib->mp.NotEnoughUrgentLatencyHiding[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   774  				mode_lib->mp.PrefetchModeSupported = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   775  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   776  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   777  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   778  		if (s->VRatioPrefetchMoreThanMax == true || s->DestinationLineTimesForPrefetchLessThan2 == true) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   779  			DML_LOG_VERBOSE("DML::%s: VRatioPrefetchMoreThanMax = %u\n", __func__, s->VRatioPrefetchMoreThanMax);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   780  			DML_LOG_VERBOSE("DML::%s: DestinationLineTimesForPrefetchLessThan2 = %u\n", __func__, s->DestinationLineTimesForPrefetchLessThan2);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   781  			mode_lib->mp.PrefetchModeSupported = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   782  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   783  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   784  		DML_LOG_VERBOSE("DML::%s: Prefetch schedule is %sOK at vstartup = %u\n", __func__,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   785  			mode_lib->mp.PrefetchModeSupported ? "" : "NOT ", CalculatePrefetchSchedule_params->VStartup);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   786  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   787  		// Prefetch schedule OK, now check prefetch bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   788  		if (mode_lib->mp.PrefetchModeSupported == true) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   789  			for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   790  				double line_time_us = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total /
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   791  					((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   792  				dcn5_calculate_urgent_burst_factor(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   793  					&display_cfg->plane_descriptors[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   794  					mode_lib->mp.swath_width_luma_ub[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   795  					mode_lib->mp.swath_width_chroma_ub[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   796  					mode_lib->mp.SwathHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   797  					mode_lib->mp.SwathHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   798  					line_time_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   799  					mode_lib->mp.UrgentLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   800  					mode_lib->mp.VRatioPrefetchY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   801  					mode_lib->mp.VRatioPrefetchC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   802  					mode_lib->mp.BytePerPixelInDETY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   803  					mode_lib->mp.BytePerPixelInDETC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   804  					mode_lib->mp.DETBufferSizeY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   805  					mode_lib->mp.DETBufferSizeC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   806  					/* Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   807  					&mode_lib->mp.UrgentBurstFactorLumaPre[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   808  					&mode_lib->mp.UrgentBurstFactorChromaPre[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   809  					&mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   810  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   811  				DML_LOG_VERBOSE("DML::%s: k=%0u DPPPerSurface=%u\n", __func__, k, mode_lib->mp.NoOfDPP[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   812  				DML_LOG_VERBOSE("DML::%s: k=%0u UrgentBurstFactorLuma=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorLuma[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   813  				DML_LOG_VERBOSE("DML::%s: k=%0u UrgentBurstFactorChroma=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorChroma[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   814  				DML_LOG_VERBOSE("DML::%s: k=%0u UrgentBurstFactorLumaPre=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorLumaPre[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   815  				DML_LOG_VERBOSE("DML::%s: k=%0u UrgentBurstFactorChromaPre=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorChromaPre[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   816  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   817  				DML_LOG_VERBOSE("DML::%s: k=%0u VRatioPrefetchY=%f\n", __func__, k, mode_lib->mp.VRatioPrefetchY[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   818  				DML_LOG_VERBOSE("DML::%s: k=%0u VRatioY=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   819  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   820  				DML_LOG_VERBOSE("DML::%s: k=%0u prefetch_vmrow_bw=%f\n", __func__, k, mode_lib->mp.prefetch_vmrow_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   821  				DML_LOG_VERBOSE("DML::%s: k=%0u vactive_sw_bw_l=%f\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   822  				DML_LOG_VERBOSE("DML::%s: k=%0u vactive_sw_bw_c=%f\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   823  				DML_LOG_VERBOSE("DML::%s: k=%0u cursor_bw=%f\n", __func__, k, mode_lib->mp.cursor_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   824  				DML_LOG_VERBOSE("DML::%s: k=%0u dpte_row_bw=%f\n", __func__, k, mode_lib->mp.dpte_row_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   825  				DML_LOG_VERBOSE("DML::%s: k=%0u meta_row_bw=%f\n", __func__, k, mode_lib->mp.meta_row_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   826  				DML_LOG_VERBOSE("DML::%s: k=%0u RequiredPrefetchPixelDataBWLuma=%f\n", __func__, k, mode_lib->mp.RequiredPrefetchPixelDataBWLuma[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   827  				DML_LOG_VERBOSE("DML::%s: k=%0u RequiredPrefetchPixelDataBWChroma=%f\n", __func__, k, mode_lib->mp.RequiredPrefetchPixelDataBWChroma[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   828  				DML_LOG_VERBOSE("DML::%s: k=%0u prefetch_cursor_bw=%f\n", __func__, k, mode_lib->mp.prefetch_cursor_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   829  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   830  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   831  			for (k = 0; k <= s->num_active_planes - 1; k++)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   832  				mode_lib->mp.final_flip_bw[k] = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   833  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   834  			calculate_peak_bandwidth_params->urg_vactive_bandwidth_required = mode_lib->mp.urg_vactive_bandwidth_required;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   835  			calculate_peak_bandwidth_params->urg_bandwidth_required = mode_lib->mp.urg_bandwidth_required;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   836  			calculate_peak_bandwidth_params->urg_bandwidth_required_qual = mode_lib->mp.urg_bandwidth_required_qual;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   837  			calculate_peak_bandwidth_params->non_urg_bandwidth_required = mode_lib->mp.non_urg_bandwidth_required;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   838  			calculate_peak_bandwidth_params->surface_avg_vactive_required_bw = s->surface_dummy_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   839  			calculate_peak_bandwidth_params->surface_peak_required_bw = s->surface_dummy_bw0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   840  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   841  			calculate_peak_bandwidth_params->display_cfg = display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   842  			calculate_peak_bandwidth_params->inc_flip_bw = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   843  			calculate_peak_bandwidth_params->num_active_planes = s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   844  			calculate_peak_bandwidth_params->num_of_dpp = mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   845  			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 = mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   846  			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 = mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   847  			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 = mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   848  			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 = mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   849  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   850  			calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->mp.vactive_sw_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   851  			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.vactive_sw_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   852  			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->mp.RequiredPrefetchPixelDataBWLuma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   853  			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->mp.RequiredPrefetchPixelDataBWChroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   854  			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->mp.excess_vactive_fill_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   855  			calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->mp.excess_vactive_fill_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   856  			calculate_peak_bandwidth_params->cursor_bw = mode_lib->mp.cursor_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   857  			calculate_peak_bandwidth_params->dpte_row_bw = mode_lib->mp.dpte_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   858  			calculate_peak_bandwidth_params->meta_row_bw = mode_lib->mp.meta_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   859  			calculate_peak_bandwidth_params->prefetch_cursor_bw = mode_lib->mp.prefetch_cursor_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   860  			calculate_peak_bandwidth_params->prefetch_vmrow_bw = mode_lib->mp.prefetch_vmrow_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   861  			calculate_peak_bandwidth_params->flip_bw = mode_lib->mp.final_flip_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   862  			calculate_peak_bandwidth_params->urgent_burst_factor_l = mode_lib->mp.UrgentBurstFactorLuma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   863  			calculate_peak_bandwidth_params->urgent_burst_factor_c = mode_lib->mp.UrgentBurstFactorChroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   864  			calculate_peak_bandwidth_params->urgent_burst_factor_cursor = mode_lib->mp.UrgentBurstFactorCursor;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   865  			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_l = mode_lib->mp.UrgentBurstFactorLumaPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   866  			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_c = mode_lib->mp.UrgentBurstFactorChromaPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   867  			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor = mode_lib->mp.UrgentBurstFactorCursorPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   868  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   869  			dcn5_calculate_peak_bandwidth_required(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   870  					&mode_lib->scratch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   871  					calculate_peak_bandwidth_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   872  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   873  			// Check urg peak bandwidth against available urg bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   874  			// check at SDP and DRAM, for all soc states (Sys Active)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   875  			dcn5_check_urgent_bandwidth_support(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   876  				&mode_lib->mp.FractionOfUrgentBandwidth, // double* frac_urg_bandwidth
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   877  				&mode_lib->mp.PrefetchModeSupported, // prefetch bw ok
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   878  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   879  				**mode_lib->mp.non_urg_bandwidth_required,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   880  				**mode_lib->mp.urg_bandwidth_required,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   881  				mode_lib->mp.dram_bw_mbps);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   882  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   883  			if (!mode_lib->mp.PrefetchModeSupported)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   884  				DML_LOG_VERBOSE("DML::%s: Bandwidth not sufficient for prefetch!\n", __func__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   885  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   886  			for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   887  				if (mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   888  					DML_LOG_VERBOSE("DML::%s: k=%u, NotEnoughUrgentLatencyHidingPre = %u\n", __func__, k, mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   889  					mode_lib->mp.PrefetchModeSupported = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   890  				}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   891  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   892  		} // prefetch schedule ok
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   893  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   894  		// Prefetch schedule and prefetch bw ok, now check flip bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   895  		if (mode_lib->mp.PrefetchModeSupported == true) { // prefetch schedule and prefetch bw ok, now check flip bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   896  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   897  			mode_lib->mp.BandwidthAvailableForImmediateFlip =
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   898  				dcn5_get_bandwidth_available_for_immediate_flip(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   899  					**mode_lib->mp.urg_bandwidth_required_qual, // no flip
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   900  					mode_lib->mp.dram_bw_mbps);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   901  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   902  			mode_lib->mp.TotImmediateFlipBytes = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   903  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   904  			for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   905  				if (display_cfg->plane_descriptors[k].immediate_flip) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   906  					s->per_pipe_flip_bytes[k] =  dcn5_get_pipe_flip_bytes(s->HostVMInefficiencyFactor,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   907  											mode_lib->mp.vm_bytes[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   908  											mode_lib->mp.PixelPTEBytesPerRow[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   909  											mode_lib->mp.meta_row_bytes[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   910  				} else {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   911  					s->per_pipe_flip_bytes[k] = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   912  				}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   913  				mode_lib->mp.TotImmediateFlipBytes += s->per_pipe_flip_bytes[k] * mode_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   914  				DML_LOG_VERBOSE("DML::%s: k = %u\n", __func__, k);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   915  				DML_LOG_VERBOSE("DML::%s: DPPPerSurface = %u\n", __func__, mode_lib->mp.NoOfDPP[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   916  				DML_LOG_VERBOSE("DML::%s: vm_bytes = %u\n", __func__, mode_lib->mp.vm_bytes[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   917  				DML_LOG_VERBOSE("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, mode_lib->mp.PixelPTEBytesPerRow[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   918  				DML_LOG_VERBOSE("DML::%s: meta_row_bytes = %u\n", __func__, mode_lib->mp.meta_row_bytes[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   919  				DML_LOG_VERBOSE("DML::%s: TotImmediateFlipBytes = %u\n", __func__, mode_lib->mp.TotImmediateFlipBytes);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   920  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   921  			for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   922  				dcn5_calculate_flip_schedule(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   923  					&mode_lib->scratch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   924  					display_cfg->plane_descriptors[k].immediate_flip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   925  					0, // use_lb_flip_bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   926  					s->HostVMInefficiencyFactor,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   927  					s->Tvm_trips_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   928  					s->Tr0_trips_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   929  					s->Tvm_trips_flip_rounded[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   930  					s->Tr0_trips_flip_rounded[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   931  					display_cfg->gpuvm_enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   932  					mode_lib->mp.vm_bytes[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   933  					mode_lib->mp.PixelPTEBytesPerRow[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   934  					mode_lib->mp.BandwidthAvailableForImmediateFlip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   935  					mode_lib->mp.TotImmediateFlipBytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   936  					display_cfg->plane_descriptors[k].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   937  					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   938  					display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   939  					display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   940  					mode_lib->mp.Tno_bw[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   941  					mode_lib->mp.dpte_row_height[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   942  					mode_lib->mp.dpte_row_height_chroma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   943  					mode_lib->mp.use_one_row_for_frame_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   944  					mode_lib->ip.max_flip_time_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   945  					mode_lib->ip.max_flip_time_lines,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   946  					s->per_pipe_flip_bytes[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   947  					mode_lib->mp.meta_row_bytes[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   948  					mode_lib->mp.meta_row_height[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   949  					mode_lib->mp.meta_row_height_chroma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   950  					mode_lib->ip.dcn_mrq_present && display_cfg->plane_descriptors[k].surface.dcc.enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   951  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   952  					// Output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   953  					&mode_lib->mp.dst_y_per_vm_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   954  					&mode_lib->mp.dst_y_per_row_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   955  					&mode_lib->mp.final_flip_bw[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   956  					&mode_lib->mp.ImmediateFlipSupportedForPipe[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   957  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   958  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   959  			calculate_peak_bandwidth_params->urg_vactive_bandwidth_required = s->dummy_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   960  			calculate_peak_bandwidth_params->urg_bandwidth_required = mode_lib->mp.urg_bandwidth_required_flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   961  			calculate_peak_bandwidth_params->urg_bandwidth_required_qual = s->dummy_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   962  			calculate_peak_bandwidth_params->non_urg_bandwidth_required = mode_lib->mp.non_urg_bandwidth_required_flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   963  			calculate_peak_bandwidth_params->surface_avg_vactive_required_bw = s->surface_dummy_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   964  			calculate_peak_bandwidth_params->surface_peak_required_bw = s->surface_dummy_bw0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   965  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   966  			calculate_peak_bandwidth_params->display_cfg = display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   967  			calculate_peak_bandwidth_params->inc_flip_bw = 1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   968  			calculate_peak_bandwidth_params->num_active_planes = s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   969  			calculate_peak_bandwidth_params->num_of_dpp = mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   970  			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 = mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   971  			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 = mode_lib->mp.dcc_dram_bw_nom_overhead_factor_p1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   972  			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 = mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   973  			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 = mode_lib->mp.dcc_dram_bw_pref_overhead_factor_p1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   974  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   975  			calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->mp.vactive_sw_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   976  			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.vactive_sw_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   977  			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->mp.RequiredPrefetchPixelDataBWLuma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   978  			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->mp.RequiredPrefetchPixelDataBWChroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   979  			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->mp.excess_vactive_fill_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   980  			calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->mp.excess_vactive_fill_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   981  			calculate_peak_bandwidth_params->cursor_bw = mode_lib->mp.cursor_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   982  			calculate_peak_bandwidth_params->dpte_row_bw = mode_lib->mp.dpte_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   983  			calculate_peak_bandwidth_params->meta_row_bw = mode_lib->mp.meta_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   984  			calculate_peak_bandwidth_params->prefetch_cursor_bw = mode_lib->mp.prefetch_cursor_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   985  			calculate_peak_bandwidth_params->prefetch_vmrow_bw = mode_lib->mp.prefetch_vmrow_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   986  			calculate_peak_bandwidth_params->flip_bw = mode_lib->mp.final_flip_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   987  			calculate_peak_bandwidth_params->urgent_burst_factor_l = mode_lib->mp.UrgentBurstFactorLuma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   988  			calculate_peak_bandwidth_params->urgent_burst_factor_c = mode_lib->mp.UrgentBurstFactorChroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   989  			calculate_peak_bandwidth_params->urgent_burst_factor_cursor = mode_lib->mp.UrgentBurstFactorCursor;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   990  			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_l = mode_lib->mp.UrgentBurstFactorLumaPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   991  			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_c = mode_lib->mp.UrgentBurstFactorChromaPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   992  			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor = mode_lib->mp.UrgentBurstFactorCursorPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   993  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   994  			dcn5_calculate_peak_bandwidth_required(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   995  					&mode_lib->scratch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   996  					calculate_peak_bandwidth_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   997  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   998  			dcn5_check_immediate_flip_bandwidth_support(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   999  				&mode_lib->mp.FractionOfUrgentBandwidthImmediateFlip, // double* frac_urg_bandwidth_flip
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1000  				&mode_lib->mp.ImmediateFlipSupported, // bool* flip_bandwidth_support_ok
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1001  				**mode_lib->mp.urg_bandwidth_required_flip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1002  				**mode_lib->mp.non_urg_bandwidth_required_flip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1003  				mode_lib->mp.dram_bw_mbps);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1004  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1005  			if (!mode_lib->mp.ImmediateFlipSupported)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1006  				DML_LOG_VERBOSE("DML::%s: Bandwidth not sufficient for flip!", __func__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1007  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1008  			for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1009  				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1010  					mode_lib->mp.ImmediateFlipSupported = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1011  					DML_LOG_VERBOSE("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1012  				}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1013  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1014  		} else { // flip or prefetch not support
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1015  			mode_lib->mp.ImmediateFlipSupported = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1016  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1017  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1018  		// consider flip support is okay if the flip bw is ok or (when user does't require a iflip and there is no host vm)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1019  		must_support_iflip = display_cfg->hostvm_enable || s->immediate_flip_required;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1020  		mode_lib->mp.PrefetchAndImmediateFlipSupported = (mode_lib->mp.PrefetchModeSupported == true && (!must_support_iflip || mode_lib->mp.ImmediateFlipSupported));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1021  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1022  		DML_LOG_VERBOSE("DML::%s: PrefetchModeSupported = %u\n", __func__, mode_lib->mp.PrefetchModeSupported);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1023  		for (k = 0; k < s->num_active_planes; ++k)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1024  			DML_LOG_VERBOSE("DML::%s: immediate_flip_required[%u] = %u\n", __func__, k, display_cfg->plane_descriptors[k].immediate_flip);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1025  		DML_LOG_VERBOSE("DML::%s: HostVMEnable = %u\n", __func__, display_cfg->hostvm_enable);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1026  		DML_LOG_VERBOSE("DML::%s: ImmediateFlipSupported = %u\n", __func__, mode_lib->mp.ImmediateFlipSupported);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1027  		DML_LOG_VERBOSE("DML::%s: PrefetchAndImmediateFlipSupported = %u\n", __func__, mode_lib->mp.PrefetchAndImmediateFlipSupported);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1028  		DML_LOG_VERBOSE("DML::%s: Done one iteration: k=%d, MaxVStartupLines=%u\n", __func__, k, s->MaxVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1029  	}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1030  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1031  	for (k = 0; k < s->num_active_planes; ++k)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1032  		DML_LOG_VERBOSE("DML::%s: k=%d MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1033  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1034  	if (!mode_lib->mp.PrefetchAndImmediateFlipSupported) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1035  		DML_LOG_VERBOSE("DML::%s: Bad, Prefetch and flip scheduling solution NOT found!\n", __func__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1036  	} else {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1037  		DML_LOG_VERBOSE("DML::%s: Good, Prefetch and flip scheduling solution found\n", __func__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1038  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1039  		// DCC Configuration
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1040  		for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1041  			DML_LOG_VERBOSE("DML::%s: Calculate DCC configuration for surface k=%u\n", __func__, k);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1042  			dcn5_calculate_dcc_configuration(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1043  				display_cfg->plane_descriptors[k].surface.dcc.enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1044  				display_cfg->overrides.dcc_programming_assumes_scan_direction_unknown,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1045  				display_cfg->plane_descriptors[k].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1046  				display_cfg->plane_descriptors[k].surface.plane0.width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1047  				display_cfg->plane_descriptors[k].surface.plane1.width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1048  				display_cfg->plane_descriptors[k].surface.plane0.height,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1049  				display_cfg->plane_descriptors[k].surface.plane1.height,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1050  				s->NomDETInKByte,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1051  				mode_lib->mp.Read256BlockHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1052  				mode_lib->mp.Read256BlockHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1053  				display_cfg->plane_descriptors[k].surface.tiling,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1054  				mode_lib->mp.BytePerPixelY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1055  				mode_lib->mp.BytePerPixelC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1056  				mode_lib->mp.BytePerPixelInDETY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1057  				mode_lib->mp.BytePerPixelInDETC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1058  				display_cfg->plane_descriptors[k].composition.rotation_angle,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1059  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1060  				/* Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1061  				&mode_lib->mp.RequestLuma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1062  				&mode_lib->mp.RequestChroma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1063  				&mode_lib->mp.DCCYMaxUncompressedBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1064  				&mode_lib->mp.DCCCMaxUncompressedBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1065  				&mode_lib->mp.DCCYMaxCompressedBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1066  				&mode_lib->mp.DCCCMaxCompressedBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1067  				&mode_lib->mp.DCCYIndependentBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1068  				&mode_lib->mp.DCCCIndependentBlock[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1069  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1070  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1071  		//Watermarks and NB P-State/DRAM Clock Change Support
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1072  		s->mmSOCParameters.UrgentLatency = mode_lib->mp.UrgentLatency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1073  		s->mmSOCParameters.ExtraLatency = mode_lib->mp.ExtraLatency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1074  		s->mmSOCParameters.ExtraLatency_sr = mode_lib->mp.ExtraLatency_sr;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1075  		s->mmSOCParameters.WritebackLatency = utm_soc_bb->writeback_base_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1076  		s->mmSOCParameters.DRAMClockChangeLatency = utm_soc_bb->power_management_parameters.dram_clk_change_blackout_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1077  		s->mmSOCParameters.FCLKChangeLatency = utm_soc_bb->power_management_parameters.fclk_change_blackout_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1078  		s->mmSOCParameters.SRExitTime = utm_soc_bb->power_management_parameters.stutter_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1079  		s->mmSOCParameters.SREnterPlusExitTime = utm_soc_bb->power_management_parameters.stutter_enter_plus_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1080  		s->mmSOCParameters.SRExitZ8Time = utm_soc_bb->power_management_parameters.z8_stutter_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1081  		s->mmSOCParameters.SREnterPlusExitZ8Time = utm_soc_bb->power_management_parameters.z8_stutter_enter_plus_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1082  		s->mmSOCParameters.USRRetrainingLatency = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1083  		s->mmSOCParameters.SMNLatency = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1084  		s->mmSOCParameters.temp_read_or_ppt_blackout_us = utm_soc_bb->power_management_parameters.g7_ppt_blackout_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1085  		s->mmSOCParameters.qos_type = dml2_qos_param_type_dcn4x;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1086  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1087  		CalculateWatermarks_params->display_cfg = display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1088  		CalculateWatermarks_params->USRRetrainingRequired = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1089  		CalculateWatermarks_params->NumberOfActiveSurfaces = s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1090  		CalculateWatermarks_params->MaxLineBufferLines = mode_lib->ip.max_line_buffer_lines;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1091  		CalculateWatermarks_params->LineBufferSize = mode_lib->ip.line_buffer_size_bits;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1092  		CalculateWatermarks_params->WritebackInterfaceBufferSize = mode_lib->ip.writeback_interface_buffer_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1093  		CalculateWatermarks_params->DCFCLK = mode_lib->mp.Dcfclk;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1094  		CalculateWatermarks_params->SynchronizeTimings = display_cfg->overrides.synchronize_timings;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1095  		CalculateWatermarks_params->SynchronizeDRRDisplaysForUCLKPStateChange = display_cfg->overrides.synchronize_ddr_displays_for_uclk_pstate_change;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1096  		CalculateWatermarks_params->dpte_group_bytes = mode_lib->mp.dpte_group_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1097  		CalculateWatermarks_params->mmSOCParameters = s->mmSOCParameters;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1098  		CalculateWatermarks_params->WritebackChunkSize = mode_lib->ip.writeback_chunk_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1099  		CalculateWatermarks_params->SOCCLK = s->SOCCLK;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1100  		CalculateWatermarks_params->DCFClkDeepSleep = mode_lib->mp.DCFCLKDeepSleep;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1101  		CalculateWatermarks_params->DETBufferSizeY = mode_lib->mp.DETBufferSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1102  		CalculateWatermarks_params->DETBufferSizeC = mode_lib->mp.DETBufferSizeC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1103  		CalculateWatermarks_params->SwathHeightY = mode_lib->mp.SwathHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1104  		CalculateWatermarks_params->SwathHeightC = mode_lib->mp.SwathHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1105  		//CalculateWatermarks_params->LBBitPerPixel = 57; //FIXME_STAGE2
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1106  		CalculateWatermarks_params->SwathWidthY = mode_lib->mp.SwathWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1107  		CalculateWatermarks_params->SwathWidthC = mode_lib->mp.SwathWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1108  		CalculateWatermarks_params->BytePerPixelDETY = mode_lib->mp.BytePerPixelInDETY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1109  		CalculateWatermarks_params->BytePerPixelDETC = mode_lib->mp.BytePerPixelInDETC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1110  		CalculateWatermarks_params->DSTXAfterScaler = mode_lib->mp.DSTXAfterScaler;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1111  		CalculateWatermarks_params->DSTYAfterScaler = mode_lib->mp.DSTYAfterScaler;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1112  		CalculateWatermarks_params->UnboundedRequestEnabled = mode_lib->mp.UnboundedRequestEnabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1113  		CalculateWatermarks_params->CompressedBufferSizeInkByte = mode_lib->mp.CompressedBufferSizeInkByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1114  		CalculateWatermarks_params->meta_row_height_l = mode_lib->mp.meta_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1115  		CalculateWatermarks_params->meta_row_height_c = mode_lib->mp.meta_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1116  		CalculateWatermarks_params->DPPPerSurface = mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1117  		CalculateWatermarks_params->uclk_pstate_switch_modes = mode_lib->mp.uclk_pstate_switch_modes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1118  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1119  		// Output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1120  		CalculateWatermarks_params->Watermark = &mode_lib->mp.Watermark;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1121  		CalculateWatermarks_params->DRAMClockChangeSupport = mode_lib->mp.DRAMClockChangeSupport;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1122  		CalculateWatermarks_params->global_dram_clock_change_support_required = &s->dummy_boolean[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1123  		CalculateWatermarks_params->global_dram_clock_change_supported = &mode_lib->mp.global_dram_clock_change_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1124  		CalculateWatermarks_params->MaxActiveDRAMClockChangeLatencySupported = mode_lib->mp.MaxActiveDRAMClockChangeLatencySupported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1125  		CalculateWatermarks_params->FCLKChangeSupport = mode_lib->mp.FCLKChangeSupport;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1126  		CalculateWatermarks_params->global_fclk_change_supported = &mode_lib->mp.global_fclk_change_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1127  		CalculateWatermarks_params->MaxActiveFCLKChangeLatencySupported = &mode_lib->mp.MaxActiveFCLKChangeLatencySupported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1128  		CalculateWatermarks_params->USRRetrainingSupport = &mode_lib->mp.USRRetrainingSupport;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1129  		CalculateWatermarks_params->temp_read_or_ppt_support = mode_lib->mp.temp_read_or_ppt_support;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1130  		CalculateWatermarks_params->global_temp_read_or_ppt_supported = &mode_lib->mp.global_temp_read_or_ppt_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22 @1131  		CalculateWatermarks_params->VActiveLatencyHidingMargin = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1132  		CalculateWatermarks_params->VActiveLatencyHidingUs = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1133  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1134  		dcn5_calculate_watermarks_and_dram_speed_change_support(&mode_lib->scratch, CalculateWatermarks_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1135  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1136  		for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1137  			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1138  				mode_lib->mp.WritebackAllowDRAMClockChangeEndPosition[k] = math_max2(0, mode_lib->mp.VStartupMin[k] * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total /
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1139  					((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000) - mode_lib->mp.Watermark.WritebackDRAMClockChangeWatermark);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1140  				mode_lib->mp.WritebackAllowFCLKChangeEndPosition[k] = math_max2(0, mode_lib->mp.VStartupMin[k] * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total /
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1141  					((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000) - mode_lib->mp.Watermark.WritebackFCLKChangeWatermark);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1142  			} else {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1143  				mode_lib->mp.WritebackAllowDRAMClockChangeEndPosition[k] = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1144  				mode_lib->mp.WritebackAllowFCLKChangeEndPosition[k] = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1145  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1146  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1147  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1148  		dcn5_calculate_pstate_keepout_dst_lines(display_cfg, &mode_lib->mp.Watermark, mode_lib->mp.pstate_keepout_dst_lines);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1149  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1150  		DML_LOG_VERBOSE("DML::%s: DEBUG stream_index = %0d\n", __func__, display_cfg->plane_descriptors[0].stream_index);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1151  		DML_LOG_VERBOSE("DML::%s: DEBUG PixelClock = %ld kHz\n", __func__, (display_cfg->stream_descriptors[display_cfg->plane_descriptors[0].stream_index].timing.pixel_clock_khz));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1152  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1153  		//Display Pipeline Delivery Time in Prefetch, Groups
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1154  		dcn5_calculate_pixel_delivery_times(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1155  			display_cfg,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1156  			mode_lib->mp.NoOfDPP,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1157  			s->num_active_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1158  			mode_lib->mp.VRatioPrefetchY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1159  			mode_lib->mp.VRatioPrefetchC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1160  			mode_lib->mp.swath_width_luma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1161  			mode_lib->mp.swath_width_chroma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1162  			mode_lib->mp.PSCL_THROUGHPUT,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1163  			mode_lib->mp.PSCL_THROUGHPUT_CHROMA,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1164  			mode_lib->mp.Dppclk,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1165  			mode_lib->mp.DCFCLKDeepSleep,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1166  			mode_lib->mp.BytePerPixelY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1167  			mode_lib->mp.BytePerPixelC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1168  			mode_lib->mp.req_per_swath_ub_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1169  			mode_lib->mp.req_per_swath_ub_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1170  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1171  			/* Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1172  			mode_lib->mp.DisplayPipeLineDeliveryTimeLuma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1173  			mode_lib->mp.DisplayPipeLineDeliveryTimeChroma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1174  			mode_lib->mp.DisplayPipeLineDeliveryTimeLumaPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1175  			mode_lib->mp.DisplayPipeLineDeliveryTimeChromaPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1176  			mode_lib->mp.DisplayPipeRequestDeliveryTimeLuma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1177  			mode_lib->mp.DisplayPipeRequestDeliveryTimeChroma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1178  			mode_lib->mp.DisplayPipeRequestDeliveryTimeLumaPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1179  			mode_lib->mp.DisplayPipeRequestDeliveryTimeChromaPrefetch);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1180  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1181  		CalculateMetaAndPTETimes_params->scratch = &mode_lib->scratch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1182  		CalculateMetaAndPTETimes_params->display_cfg = display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1183  		CalculateMetaAndPTETimes_params->NumberOfActiveSurfaces = s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1184  		CalculateMetaAndPTETimes_params->use_one_row_for_frame = mode_lib->mp.use_one_row_for_frame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1185  		CalculateMetaAndPTETimes_params->dst_y_per_row_vblank = mode_lib->mp.dst_y_per_row_vblank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1186  		CalculateMetaAndPTETimes_params->dst_y_per_row_flip = mode_lib->mp.dst_y_per_row_flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1187  		CalculateMetaAndPTETimes_params->BytePerPixelY = mode_lib->mp.BytePerPixelY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1188  		CalculateMetaAndPTETimes_params->BytePerPixelC = mode_lib->mp.BytePerPixelC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1189  		CalculateMetaAndPTETimes_params->dpte_row_height = mode_lib->mp.dpte_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1190  		CalculateMetaAndPTETimes_params->dpte_row_height_chroma = mode_lib->mp.dpte_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1191  		CalculateMetaAndPTETimes_params->dpte_group_bytes = mode_lib->mp.dpte_group_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1192  		CalculateMetaAndPTETimes_params->PTERequestSizeY = mode_lib->mp.PTERequestSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1193  		CalculateMetaAndPTETimes_params->PTERequestSizeC = mode_lib->mp.PTERequestSizeC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1194  		CalculateMetaAndPTETimes_params->PixelPTEReqWidthY = mode_lib->mp.PixelPTEReqWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1195  		CalculateMetaAndPTETimes_params->PixelPTEReqHeightY = mode_lib->mp.PixelPTEReqHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1196  		CalculateMetaAndPTETimes_params->PixelPTEReqWidthC = mode_lib->mp.PixelPTEReqWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1197  		CalculateMetaAndPTETimes_params->PixelPTEReqHeightC = mode_lib->mp.PixelPTEReqHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1198  		CalculateMetaAndPTETimes_params->dpte_row_width_luma_ub = mode_lib->mp.dpte_row_width_luma_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1199  		CalculateMetaAndPTETimes_params->dpte_row_width_chroma_ub = mode_lib->mp.dpte_row_width_chroma_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1200  		CalculateMetaAndPTETimes_params->tdlut_groups_per_2row_ub = s->tdlut_groups_per_2row_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1201  		CalculateMetaAndPTETimes_params->mrq_present = mode_lib->ip.dcn_mrq_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1202  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1203  		CalculateMetaAndPTETimes_params->MetaChunkSize = mode_lib->ip.meta_chunk_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1204  		CalculateMetaAndPTETimes_params->MinMetaChunkSizeBytes = mode_lib->ip.min_meta_chunk_size_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1205  		CalculateMetaAndPTETimes_params->meta_row_width = mode_lib->mp.meta_row_width;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1206  		CalculateMetaAndPTETimes_params->meta_row_width_chroma = mode_lib->mp.meta_row_width_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1207  		CalculateMetaAndPTETimes_params->meta_row_height = mode_lib->mp.meta_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1208  		CalculateMetaAndPTETimes_params->meta_row_height_chroma = mode_lib->mp.meta_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1209  		CalculateMetaAndPTETimes_params->meta_req_width = mode_lib->mp.meta_req_width;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1210  		CalculateMetaAndPTETimes_params->meta_req_width_chroma = mode_lib->mp.meta_req_width_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1211  		CalculateMetaAndPTETimes_params->meta_req_height = mode_lib->mp.meta_req_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1212  		CalculateMetaAndPTETimes_params->meta_req_height_chroma = mode_lib->mp.meta_req_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1213  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1214  		CalculateMetaAndPTETimes_params->time_per_tdlut_group = mode_lib->mp.time_per_tdlut_group;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1215  		CalculateMetaAndPTETimes_params->DST_Y_PER_PTE_ROW_NOM_L = mode_lib->mp.DST_Y_PER_PTE_ROW_NOM_L;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1216  		CalculateMetaAndPTETimes_params->DST_Y_PER_PTE_ROW_NOM_C = mode_lib->mp.DST_Y_PER_PTE_ROW_NOM_C;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1217  		CalculateMetaAndPTETimes_params->time_per_pte_group_nom_luma = mode_lib->mp.time_per_pte_group_nom_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1218  		CalculateMetaAndPTETimes_params->time_per_pte_group_vblank_luma = mode_lib->mp.time_per_pte_group_vblank_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1219  		CalculateMetaAndPTETimes_params->time_per_pte_group_flip_luma = mode_lib->mp.time_per_pte_group_flip_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1220  		CalculateMetaAndPTETimes_params->time_per_pte_group_nom_chroma = mode_lib->mp.time_per_pte_group_nom_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1221  		CalculateMetaAndPTETimes_params->time_per_pte_group_vblank_chroma = mode_lib->mp.time_per_pte_group_vblank_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1222  		CalculateMetaAndPTETimes_params->time_per_pte_group_flip_chroma = mode_lib->mp.time_per_pte_group_flip_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1223  		CalculateMetaAndPTETimes_params->DST_Y_PER_META_ROW_NOM_L = mode_lib->mp.DST_Y_PER_META_ROW_NOM_L;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1224  		CalculateMetaAndPTETimes_params->DST_Y_PER_META_ROW_NOM_C = mode_lib->mp.DST_Y_PER_META_ROW_NOM_C;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1225  		CalculateMetaAndPTETimes_params->TimePerMetaChunkNominal = mode_lib->mp.TimePerMetaChunkNominal;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1226  		CalculateMetaAndPTETimes_params->TimePerChromaMetaChunkNominal = mode_lib->mp.TimePerChromaMetaChunkNominal;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1227  		CalculateMetaAndPTETimes_params->TimePerMetaChunkVBlank = mode_lib->mp.TimePerMetaChunkVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1228  		CalculateMetaAndPTETimes_params->TimePerChromaMetaChunkVBlank = mode_lib->mp.TimePerChromaMetaChunkVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1229  		CalculateMetaAndPTETimes_params->TimePerMetaChunkFlip = mode_lib->mp.TimePerMetaChunkFlip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1230  		CalculateMetaAndPTETimes_params->TimePerChromaMetaChunkFlip = mode_lib->mp.TimePerChromaMetaChunkFlip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1231  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1232  		dcn5_calculate_meta_and_pte_times(CalculateMetaAndPTETimes_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1233  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1234  		dcn5_calculate_vm_group_and_request_times(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1235  			display_cfg,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1236  			s->num_active_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1237  			mode_lib->mp.BytePerPixelC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1238  			mode_lib->mp.dst_y_per_vm_vblank,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1239  			mode_lib->mp.dst_y_per_vm_flip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1240  			mode_lib->mp.dpte_row_width_luma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1241  			mode_lib->mp.dpte_row_width_chroma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1242  			mode_lib->mp.vm_group_bytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1243  			mode_lib->mp.dpde0_bytes_per_frame_ub_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1244  			mode_lib->mp.dpde0_bytes_per_frame_ub_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1245  			s->tdlut_pte_bytes_per_frame,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1246  			mode_lib->mp.meta_pte_bytes_per_frame_ub_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1247  			mode_lib->mp.meta_pte_bytes_per_frame_ub_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1248  			mode_lib->ip.dcn_mrq_present,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1249  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1250  			/* Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1251  			mode_lib->mp.TimePerVMGroupVBlank,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1252  			mode_lib->mp.TimePerVMGroupFlip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1253  			mode_lib->mp.TimePerVMRequestVBlank,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1254  			mode_lib->mp.TimePerVMRequestFlip);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1255  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1256  		// VStartup Adjustment
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1257  		for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1258  			bool isInterlaceTiming;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1259  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1260  			mode_lib->mp.MinTTUVBlank[k] = mode_lib->mp.TWait[k] + mode_lib->mp.ExtraLatency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1261  			if (!display_cfg->plane_descriptors[k].dynamic_meta_data.enable)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1262  				mode_lib->mp.MinTTUVBlank[k] = mode_lib->mp.TCalc + mode_lib->mp.MinTTUVBlank[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1263  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1264  			DML_LOG_VERBOSE("DML::%s: k=%u, MinTTUVBlank = %f (before vstartup margin)\n", __func__, k, mode_lib->mp.MinTTUVBlank[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1265  			s->Tvstartup_margin = (s->MaxVStartupLines[k] - mode_lib->mp.VStartupMin[k]) * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1266  			mode_lib->mp.MinTTUVBlank[k] = mode_lib->mp.MinTTUVBlank[k] + s->Tvstartup_margin;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1267  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1268  			DML_LOG_VERBOSE("DML::%s: k=%u, Tvstartup_margin = %f\n", __func__, k, s->Tvstartup_margin);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1269  			DML_LOG_VERBOSE("DML::%s: k=%u, MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1270  			DML_LOG_VERBOSE("DML::%s: k=%u, MinTTUVBlank = %f\n", __func__, k, mode_lib->mp.MinTTUVBlank[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1271  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1272  			mode_lib->mp.Tdmdl[k] = mode_lib->mp.Tdmdl[k] + s->Tvstartup_margin;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1273  			if (display_cfg->plane_descriptors[k].dynamic_meta_data.enable && mode_lib->ip.dynamic_metadata_vm_enabled) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1274  				mode_lib->mp.Tdmdl_vm[k] = mode_lib->mp.Tdmdl_vm[k] + s->Tvstartup_margin;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1275  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1276  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1277  			isInterlaceTiming = (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.interlaced && !mode_lib->ip.ptoi_supported);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1278  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1279  			// The actual positioning of the vstartup
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1280  			mode_lib->mp.VStartup[k] = (isInterlaceTiming ? (2 * s->MaxVStartupLines[k]) : s->MaxVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1281  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1282  			s->dlg_vblank_start = ((isInterlaceTiming ? math_floor2((display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_front_porch) / 2.0, 1.0) :
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1283  				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total) - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_front_porch);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1284  			s->LSetup = math_floor2(4.0 * mode_lib->mp.TSetup[k] / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)), 1.0) / 4.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1285  			s->blank_lines_remaining = (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_active) - mode_lib->mp.VStartup[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1286  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1287  			if (s->blank_lines_remaining < 0) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1288  				DML_LOG_VERBOSE("ERROR: Vstartup is larger than vblank!?\n");
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1289  				s->blank_lines_remaining = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1290  				DML_ASSERT(0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1291  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1292  			mode_lib->mp.MIN_DST_Y_NEXT_START[k] = s->dlg_vblank_start + s->blank_lines_remaining + s->LSetup;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1293  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1294  			// debug only
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1295  			if (((mode_lib->mp.VUpdateOffsetPix[k] + mode_lib->mp.VUpdateWidthPix[k] + mode_lib->mp.VReadyOffsetPix[k]) / (double) display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total) <=
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1296  				(isInterlaceTiming ?
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1297  					math_floor2((display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_active - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_front_porch - mode_lib->mp.VStartup[k]) / 2.0, 1.0) :
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1298  					(int)(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_active - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_front_porch - mode_lib->mp.VStartup[k]))) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1299  				mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[k] = true;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1300  			} else {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1301  				mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[k] = false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1302  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1303  			DML_LOG_VERBOSE("DML::%s: k=%u, VStartup = %u (max)\n", __func__, k, mode_lib->mp.VStartup[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1304  			DML_LOG_VERBOSE("DML::%s: k=%u, VStartupMin = %u (max)\n", __func__, k, mode_lib->mp.VStartupMin[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1305  			DML_LOG_VERBOSE("DML::%s: k=%u, VUpdateOffsetPix = %u\n", __func__, k, mode_lib->mp.VUpdateOffsetPix[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1306  			DML_LOG_VERBOSE("DML::%s: k=%u, VUpdateWidthPix = %u\n", __func__, k, mode_lib->mp.VUpdateWidthPix[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1307  			DML_LOG_VERBOSE("DML::%s: k=%u, VReadyOffsetPix = %u\n", __func__, k, mode_lib->mp.VReadyOffsetPix[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1308  			DML_LOG_VERBOSE("DML::%s: k=%u, HTotal = %lu\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1309  			DML_LOG_VERBOSE("DML::%s: k=%u, VTotal = %lu\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1310  			DML_LOG_VERBOSE("DML::%s: k=%u, VActive = %lu\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_active);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1311  			DML_LOG_VERBOSE("DML::%s: k=%u, VFrontPorch = %lu\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_front_porch);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1312  			DML_LOG_VERBOSE("DML::%s: k=%u, TSetup = %f\n", __func__, k, mode_lib->mp.TSetup[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1313  			DML_LOG_VERBOSE("DML::%s: k=%u, MIN_DST_Y_NEXT_START = %f\n", __func__, k, mode_lib->mp.MIN_DST_Y_NEXT_START[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1314  			DML_LOG_VERBOSE("DML::%s: k=%u, VREADY_AT_OR_AFTER_VSYNC = %u\n", __func__, k, mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1315  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1316  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1317  		//Maximum Bandwidth Used
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1318  		mode_lib->mp.TotalWRBandwidth = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1319  		for (k = 0; k < display_cfg->num_streams; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1320  			for (j = 0; j < display_cfg->stream_descriptors[k].writeback.active_writebacks_per_stream; ++j) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1321  				double writeback_bytes_per_pixel;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1322  				if (display_cfg->stream_descriptors[k].writeback.writeback_stream[j].pixel_format == dml2_444_64)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1323  					writeback_bytes_per_pixel = 8.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1324  				else if (display_cfg->stream_descriptors[k].writeback.writeback_stream[j].pixel_format == dml2_444_32)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1325  					writeback_bytes_per_pixel = 4.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1326  				else if (display_cfg->stream_descriptors[k].writeback.writeback_stream[j].pixel_format == dml2_420_8)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1327  					writeback_bytes_per_pixel = 1.5;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1328  				else if (display_cfg->stream_descriptors[k].writeback.writeback_stream[j].pixel_format == dml2_420_10)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1329  					writeback_bytes_per_pixel = 3.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1330  				else if (display_cfg->stream_descriptors[k].writeback.writeback_stream[j].pixel_format == dml2_422_packed_8)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1331  					writeback_bytes_per_pixel = 2.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1332  				else if (display_cfg->stream_descriptors[k].writeback.writeback_stream[j].pixel_format == dml2_422_packed_10)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1333  					writeback_bytes_per_pixel = 4.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1334  				else
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1335  					writeback_bytes_per_pixel = 0.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1336  				s->WRBandwidth = display_cfg->stream_descriptors[k].writeback.writeback_stream[j].output_height
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1337  					* display_cfg->stream_descriptors[k].writeback.writeback_stream[j].output_width
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1338  					/ (display_cfg->stream_descriptors[k].timing.h_total
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1339  					* display_cfg->stream_descriptors[k].writeback.writeback_stream[j].input_height
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1340  					/ ((double)display_cfg->stream_descriptors[k].timing.pixel_clock_khz / 1000)) * writeback_bytes_per_pixel;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1341  				mode_lib->mp.TotalWRBandwidth = mode_lib->mp.TotalWRBandwidth + s->WRBandwidth;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1342  			}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1343  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1344  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1345  		mode_lib->mp.TotalDataReadBandwidth = 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1346  		for (k = 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1347  			mode_lib->mp.TotalDataReadBandwidth = mode_lib->mp.TotalDataReadBandwidth + mode_lib->mp.vactive_sw_bw_l[k] + mode_lib->mp.vactive_sw_bw_c[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1348  			DML_LOG_VERBOSE("DML::%s: k=%u, TotalDataReadBandwidth = %f\n", __func__, k, mode_lib->mp.TotalDataReadBandwidth);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1349  			DML_LOG_VERBOSE("DML::%s: k=%u, vactive_sw_bw_l = %f\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1350  			DML_LOG_VERBOSE("DML::%s: k=%u, vactive_sw_bw_c = %f\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1351  		}
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1352  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1353  		CalculateStutterEfficiency_params->display_cfg = display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1354  		CalculateStutterEfficiency_params->CompressedBufferSizeInkByte = mode_lib->mp.CompressedBufferSizeInkByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1355  		CalculateStutterEfficiency_params->UnboundedRequestEnabled = mode_lib->mp.UnboundedRequestEnabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1356  		CalculateStutterEfficiency_params->MetaFIFOSizeInKEntries = mode_lib->ip.meta_fifo_size_in_kentries;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1357  		CalculateStutterEfficiency_params->ZeroSizeBufferEntries = mode_lib->ip.zero_size_buffer_entries;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1358  		CalculateStutterEfficiency_params->PixelChunkSizeInKByte = mode_lib->ip.pixel_chunk_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1359  		CalculateStutterEfficiency_params->NumberOfActiveSurfaces = s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1360  		CalculateStutterEfficiency_params->ROBBufferSizeInKByte = mode_lib->ip.rob_buffer_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1361  		CalculateStutterEfficiency_params->TotalDataReadBandwidth = mode_lib->mp.TotalDataReadBandwidth;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1362  		CalculateStutterEfficiency_params->DCFCLK = mode_lib->mp.Dcfclk;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1363  		CalculateStutterEfficiency_params->ReturnBW = mode_lib->mp.dram_bw_mbps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1364  		CalculateStutterEfficiency_params->CompbufReservedSpace64B = mode_lib->mp.compbuf_reserved_space_64b;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1365  		CalculateStutterEfficiency_params->CompbufReservedSpaceZs = mode_lib->ip.compbuf_reserved_space_zs;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1366  		CalculateStutterEfficiency_params->SRExitTime = utm_soc_bb->power_management_parameters.stutter_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1367  		CalculateStutterEfficiency_params->SRExitZ8Time = utm_soc_bb->power_management_parameters.z8_stutter_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1368  		CalculateStutterEfficiency_params->SynchronizeTimings = display_cfg->overrides.synchronize_timings;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1369  		CalculateStutterEfficiency_params->StutterEnterPlusExitWatermark = mode_lib->mp.Watermark.StutterEnterPlusExitWatermark;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1370  		CalculateStutterEfficiency_params->Z8StutterEnterPlusExitWatermark = mode_lib->mp.Watermark.Z8StutterEnterPlusExitWatermark;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1371  		CalculateStutterEfficiency_params->ProgressiveToInterlaceUnitInOPP = mode_lib->ip.ptoi_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1372  		CalculateStutterEfficiency_params->MinTTUVBlank = mode_lib->mp.MinTTUVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1373  		CalculateStutterEfficiency_params->DPPPerSurface = mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1374  		CalculateStutterEfficiency_params->DETBufferSizeY = mode_lib->mp.DETBufferSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1375  		CalculateStutterEfficiency_params->BytePerPixelY = mode_lib->mp.BytePerPixelY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1376  		CalculateStutterEfficiency_params->BytePerPixelDETY = mode_lib->mp.BytePerPixelInDETY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1377  		CalculateStutterEfficiency_params->SwathWidthY = mode_lib->mp.SwathWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1378  		CalculateStutterEfficiency_params->SwathHeightY = mode_lib->mp.SwathHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1379  		CalculateStutterEfficiency_params->SwathHeightC = mode_lib->mp.SwathHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1380  		CalculateStutterEfficiency_params->BlockHeight256BytesY = mode_lib->mp.Read256BlockHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1381  		CalculateStutterEfficiency_params->BlockWidth256BytesY = mode_lib->mp.Read256BlockWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1382  		CalculateStutterEfficiency_params->BlockHeight256BytesC = mode_lib->mp.Read256BlockHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1383  		CalculateStutterEfficiency_params->BlockWidth256BytesC = mode_lib->mp.Read256BlockWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1384  		CalculateStutterEfficiency_params->DCCYMaxUncompressedBlock = mode_lib->mp.DCCYMaxUncompressedBlock;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1385  		CalculateStutterEfficiency_params->DCCCMaxUncompressedBlock = mode_lib->mp.DCCCMaxUncompressedBlock;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1386  		CalculateStutterEfficiency_params->ReadBandwidthSurfaceLuma = mode_lib->mp.vactive_sw_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1387  		CalculateStutterEfficiency_params->ReadBandwidthSurfaceChroma = mode_lib->mp.vactive_sw_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1388  		CalculateStutterEfficiency_params->dpte_row_bw = mode_lib->mp.dpte_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1389  		CalculateStutterEfficiency_params->meta_row_bw = mode_lib->mp.meta_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1390  		CalculateStutterEfficiency_params->rob_alloc_compressed = mode_lib->ip.dcn_mrq_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1391  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1392  		// output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1393  		CalculateStutterEfficiency_params->StutterEfficiencyNotIncludingVBlank = &mode_lib->mp.StutterEfficiencyNotIncludingVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1394  		CalculateStutterEfficiency_params->StutterEfficiency = &mode_lib->mp.StutterEfficiency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1395  		CalculateStutterEfficiency_params->NumberOfStutterBurstsPerFrame = &mode_lib->mp.NumberOfStutterBurstsPerFrame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1396  		CalculateStutterEfficiency_params->Z8StutterEfficiencyNotIncludingVBlank = &mode_lib->mp.Z8StutterEfficiencyNotIncludingVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1397  		CalculateStutterEfficiency_params->Z8StutterEfficiency = &mode_lib->mp.Z8StutterEfficiency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1398  		CalculateStutterEfficiency_params->Z8NumberOfStutterBurstsPerFrame = &mode_lib->mp.Z8NumberOfStutterBurstsPerFrame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1399  		CalculateStutterEfficiency_params->StutterPeriod = &mode_lib->mp.StutterPeriod;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1400  		CalculateStutterEfficiency_params->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE = &mode_lib->mp.DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1401  
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1402  		// Stutter Efficiency
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1403  		dcn5_calculate_stutter_efficiency(&mode_lib->scratch, CalculateStutterEfficiency_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1404  

:::::: The code at line 1131 was first introduced by commit
:::::: 7f7d7ea1fa515157162d0d21245925551ed103a1 drm/amd/display: Add new sources for DCN6

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
