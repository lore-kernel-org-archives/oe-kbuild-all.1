Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347823F8886
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655710; cv=none; b=FjasfwxyztTlgWqxKPMEvGqN/RG+agQRiDtr91eB0u8AAg9rrX+yHNnyMVnUcjbbtJ89icUVGjl0loo0a7GefzNMYo6aw/GtF/jnW7fr2LaLrIfsUM3muEPjq+1NPa8+bT+1fVFJFjYVwbVXxRa70iMoBhNDPTtOlMLnQPsATbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655710; c=relaxed/simple;
	bh=p77NI1lBkk7iyYGx0YADlf/Ky5jloWdsSkLNKMPt6ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CH+bFzCXHPX8yHwBJ7gffsoa2iuALHAVjze0hW8jDaG7V11iF/x8+W5uWV2sTm66n/z5ar0Cjal4lm9c0lMMHgWVj08ejLi+8wfRmuidYAGzeKyjxu4Qsi1EBJgCToIp0n23Jxexivmzpe6cFnmkPIE+mcyeynQesTvlw2il0s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5+Xnr/T; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5+Xnr/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787655706; x=1819191706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p77NI1lBkk7iyYGx0YADlf/Ky5jloWdsSkLNKMPt6ts=;
  b=P5+Xnr/TVeSxFiz8i4gLi1aNUBg7bKw1ognjyLxJspGX/o+V1op2hYTv
   qBjQOaiHGBsDkq497w5ZGhzLfk4RL/TB8seGUrniimfwx2iZcdTrjA+sB
   WO48LFOrMaUV9QxbFWGMH75CwX6AKyf3LzGMJDTgmXF6yLKW2sd2Ue8uS
   DqLH2UCteUdez3NkmK9Id6yVCrEVVCh3DGGxl/bUV6JdyL3JQtDI/t8w8
   kaOJuVghE+p+AsDAx9JUaNGIypRfwOtr27hKC5bZ1S1xn4/uOE9knAiAU
   VKxDFsl7irCZ/ILchWbeRmxNGn7sBpKwCeLu+qpYgXZ4mhdNW5byb/4yG
   A==;
X-CSE-ConnectionGUID: pEX/cgHqQCG1C32Nmi7z+A==
X-CSE-MsgGUID: Dn4Xyn9qSL6a/Wn8uz579A==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105498399"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="105498399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 04:01:45 -0700
X-CSE-ConnectionGUID: wYH/4d78QkOKTmJ+sOof1A==
X-CSE-MsgGUID: sbtUqNimRSC2VW61uUDDPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="266705481"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Aug 2026 04:01:42 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyouQ-000000005kh-3vfR;
	Tue, 25 Aug 2026 11:01:38 +0000
Date: Tue, 25 Aug 2026 19:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Gaghik Khachatrian <gaghik.khachatrian@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Subject: 
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display?=
 =?us-ascii?Q?=5Frq=5Fdlg=5Fcalc=5F20v2.c:1400?=
 dml20v2_rq_dlg_get_dlg_params() warn: inconsistent indenting
Message-ID: <202608251845.acOvbKV0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a0d1d55dad570724bf8c7ea83409639cfb4be9b
commit: 1547752eea0ff53fc6e25f6bbee3ee235676a93c drm/amd/display: Fix narrowing boundaries in dml
date:   4 months ago
config: i386-randconfig-r073-20260821 (https://download.01.org/0day-ci/archive/20260825/202608251845.acOvbKV0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1547752eea0f ("drm/amd/display: Fix narrowing boundaries in dml")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251845.acOvbKV0-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1400 dml20v2_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1399 dml20_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:196 _do_calc_rc_params() warn: impossible condition '(bpp >= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 >= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:196 _do_calc_rc_params() warn: impossible condition '(bpp > 4) => (4.000000-6.000000 > 4)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:964 CalculateVMAndRowBytes() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:4982 dml20v2_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:4862 dml20_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:60 scaler_settings_calculation() warn: impossible condition '(v->interlace_output[k] == 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 == 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:63 scaler_settings_calculation() warn: impossible condition '(v->underscan_output[k] == 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 == 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:71 scaler_settings_calculation() warn: impossible condition '(v->h_ratio[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:73 scaler_settings_calculation() warn: always true condition '(v->h_ratio[k] < 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:83 scaler_settings_calculation() warn: impossible condition '(v->v_ratio[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:198 mode_support_and_system_configuration() warn: impossible condition '(v->critical_point > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:198 mode_support_and_system_configuration() warn: always true condition '(v->critical_point < 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:273 mode_support_and_system_configuration() warn: impossible condition '(v->required_phyclk[k] > 600.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 600.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:294 mode_support_and_system_configuration() warn: impossible condition '(v->h_ratio[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:303 mode_support_and_system_configuration() warn: impossible condition '(v->h_ratio[k] / 2.000000 > 1.000000) => (0 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:403 mode_support_and_system_configuration() warn: always true condition '(v->number_of_dpp_required_for_det_and_lb_size[k] <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:449 mode_support_and_system_configuration() warn: impossible condition '(v->number_of_dpp_required_for_det_and_lb_size[k] > 2.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 2.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:475 mode_support_and_system_configuration() warn: impossible condition '(v->max_swath_height_c[k] > 0.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:539 mode_support_and_system_configuration() warn: always true condition '(v->v_ratio[k] <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:550 mode_support_and_system_configuration() warn: always true condition '(v->v_ratio[k] / 2.000000 <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:591 mode_support_and_system_configuration() warn: always true condition '(v->macro_tile_block_size_bytes_y <= 65536.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 65536.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:642 mode_support_and_system_configuration() warn: always true condition '(v->macro_tile_block_size_bytes_c <= 65536.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 65536.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:669 mode_support_and_system_configuration() warn: impossible condition '(v->prefill_y[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:680 mode_support_and_system_configuration() warn: impossible condition '(v->prefill_c[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:691 mode_support_and_system_configuration() warn: impossible condition '(v->no_of_dpp[i][j][k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:744 mode_support_and_system_configuration() warn: always true condition '(v->lines_for_meta_pte_without_immediate_flip[k] < 32.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 32.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:744 mode_support_and_system_configuration() warn: always true condition '(v->lines_for_meta_and_dpte_row_without_immediate_flip[k] < 16.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 16.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:774 mode_support_and_system_configuration() warn: impossible condition '(v->line_times_to_request_prefetch_pixel_data_with_immediate_flip > 0.000000) => (0.000000 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:776 mode_support_and_system_configuration() warn: impossible condition '(v->swath_height_yper_state[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:777 mode_support_and_system_configuration() warn: impossible condition '(v->line_times_to_request_prefetch_pixel_data_with_immediate_flip - (v->prefill_y[k] - 3.000000) / 2.000000 > 0.000000) => (1 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:784 mode_support_and_system_configuration() warn: impossible condition '(v->swath_height_cper_state[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:797 mode_support_and_system_configuration() warn: impossible condition '(v->line_times_to_request_prefetch_pixel_data_without_immediate_flip > 0.000000) => (0.000000 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:838 mode_support_and_system_configuration() warn: always true condition '(v->line_times_for_prefetch[k] < 2.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 2.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:838 mode_support_and_system_configuration() warn: impossible condition '(v->lines_for_meta_pte_with_immediate_flip[k] >= 8.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 >= 8.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:838 mode_support_and_system_configuration() warn: impossible condition '(v->lines_for_meta_and_dpte_row_with_immediate_flip[k] >= 16.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 >= 16.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:847 mode_support_and_system_configuration() warn: impossible condition '(v->lines_for_meta_pte_without_immediate_flip[k] >= 8.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 >= 8.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:847 mode_support_and_system_configuration() warn: impossible condition '(v->lines_for_meta_and_dpte_row_without_immediate_flip[k] >= 16.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 >= 16.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:857 mode_support_and_system_configuration() warn: impossible condition '(v->v_ratio_pre_ywith_immediate_flip[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:857 mode_support_and_system_configuration() warn: impossible condition '(v->v_ratio_pre_cwith_immediate_flip[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:857 mode_support_and_system_configuration() warn: impossible condition '(v->v_ratio_pre_ywithout_immediate_flip[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:857 mode_support_and_system_configuration() warn: impossible condition '(v->v_ratio_pre_cwithout_immediate_flip[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1029 display_pipe_configuration() warn: impossible condition '(v->maximum_swath_height_c > 0.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1063 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->h_ratio[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1111 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->critical_compression > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1111 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->critical_compression < 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1164 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->v_ratio[k] <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1198 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->total_active_writeback <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1209 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->byte_per_pixel_detc[k] > 0.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1355 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->macro_tile_size_byte_y <= 65536.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 65536.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1430 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->v_init_pre_fill_y[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1472 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->dpp_per_plane[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1488 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->prefetch_mode == 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 == 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1494 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->destination_lines_for_prefetch[k] > 0.000000) => (0.000000 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1533 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->lines_to_request_prefetch_pixel_data > 0.000000) => (0.000000 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1535 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->swath_height_y[k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1568 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->v_ratio_prefetch_y[k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1571 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->destination_lines_for_prefetch[k] < 2.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 2.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1596 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->v_ratio_prefetch_y[k] <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1656 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->active_dp_ps > 1.000000) => (0.000000 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1711 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->min_active_dram_clock_change_margin > 0.000000) => (-340282346638528859811704183484-999999.000000 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1713 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->dram_clock_change_margin > 0.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:746 CalculatePrefetchSchedule() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:464 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:468 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1431 dml20v2_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1461 dml20v2_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1469 dml20v2_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:464 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:468 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1430 dml20_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1460 dml20_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1468 dml20_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:115 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:116 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:117 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:118 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:119 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:120 get_ofs_set() warn: always true condition '(bpp <= 12) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 12)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:121 get_ofs_set() warn: always true condition '(bpp <= 12) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 12)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:122 get_ofs_set() warn: always true condition '(bpp <= 12) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 12)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:123 get_ofs_set() warn: always true condition '(bpp <= 12) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 12)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:124 get_ofs_set() warn: always true condition '(bpp <= 12) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 12)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:126 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:131 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:132 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:133 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:134 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:135 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:136 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:137 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:138 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:139 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:140 get_ofs_set() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:142 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:142 get_ofs_set() warn: impossible condition '(bpp >= 7) => (6.000000-8.000000 >= 7)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:147 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:148 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:149 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:150 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:151 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:152 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:153 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:154 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:155 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:156 get_ofs_set() warn: always true condition '(bpp <= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:158 get_ofs_set() warn: always true condition '(bpp <= 4) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 4)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:158 get_ofs_set() warn: impossible condition '(bpp >= 5) => (4.000000-6.000000 >= 5)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:196 _do_calc_rc_params() warn: always true condition '(bpp <= 4) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 4)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:196 _do_calc_rc_params() warn: always true condition '(bpp <= 5) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 5)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:201 _do_calc_rc_params() warn: impossible condition '(bpp >= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 >= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:201 _do_calc_rc_params() warn: always true condition '(bpp <= 7) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 7)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:207 _do_calc_rc_params() warn: impossible condition '(bpp >= 12) => (-340282346638528859811704183484-3402823466385288598117041834845 >= 12)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:207 _do_calc_rc_params() warn: always true condition '(bpp <= 8) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:207 _do_calc_rc_params() warn: impossible condition '(bpp > 8) => (8.000001-11.999999 > 8)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:207 _do_calc_rc_params() warn: always true condition '(bpp <= 10) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 10)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:969 CalculateVMAndRowBytes() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1872 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:2655 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: impossible condition '(SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank > 0) => (-inf-999999.000000 > 0)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:2776 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1835 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2702 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:85 scaler_settings_calculation() warn: always true condition '(v->v_ratio[k] < 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:206 mode_support_and_system_configuration() warn: impossible condition '(v->critical_point > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:206 mode_support_and_system_configuration() warn: always true condition '(v->critical_point < 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:427 mode_support_and_system_configuration() warn: always true condition '(v->number_of_dpp_required_for_det_and_lb_size[k] <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:545 mode_support_and_system_configuration() warn: always true condition '(v->v_ratio[k] <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:785 mode_support_and_system_configuration() warn: impossible condition '(v->line_times_to_request_prefetch_pixel_data_with_immediate_flip - (v->prefill_c[k] - 3.000000) / 2.000000 > 0.000000) => (1 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:799 mode_support_and_system_configuration() warn: impossible condition '(v->swath_height_yper_state[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:800 mode_support_and_system_configuration() warn: impossible condition '(v->line_times_to_request_prefetch_pixel_data_without_immediate_flip - (v->prefill_y[k] - 3.000000) / 2.000000 > 0.000000) => (1 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:807 mode_support_and_system_configuration() warn: impossible condition '(v->swath_height_cper_state[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:808 mode_support_and_system_configuration() warn: impossible condition '(v->line_times_to_request_prefetch_pixel_data_without_immediate_flip - (v->prefill_c[k] - 3.000000) / 2.000000 > 0.000000) => (1 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:847 mode_support_and_system_configuration() warn: always true condition '(v->line_times_for_prefetch[k] < 2.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 2.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:863 mode_support_and_system_configuration() warn: impossible condition '(v->v_ratio_pre_ywithout_immediate_flip[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:863 mode_support_and_system_configuration() warn: impossible condition '(v->v_ratio_pre_cwithout_immediate_flip[i][j][k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:900 mode_support_and_system_configuration() warn: impossible condition '(v->voltage_level_with_immediate_flip == 5) => (-340282346638528859811704183484-3402823466385288598117041834845 == 5)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1073 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->h_ratio[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1119 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->critical_compression > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1119 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->critical_compression < 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1174 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->v_ratio[k] / 2.000000 <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1264 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->byte_per_pixel_detc[k] > 0.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1284 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->byte_per_pixel_detc[k] > 0.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1404 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->macro_tile_size_bytes_c <= 65536.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 65536.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1440 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->v_init_pre_fill_c[k] > 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1546 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->lines_to_request_prefetch_pixel_data > 0.000000) => (0.000000 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1548 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->swath_height_c[k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1559 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->lines_to_request_prefetch_pixel_data > 0.000000) => (0.000000 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1568 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->v_ratio_prefetch_c[k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1578 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->v_ratio_prefetch_y[k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1578 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->v_ratio_prefetch_c[k] > 4.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 4.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1581 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->destination_lines_for_prefetch[k] < 2.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 < 2.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1594 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->prefetch_mode == 2.000000) => (0.000000 == 2.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1604 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: always true condition '(v->v_ratio_prefetch_c[k] <= 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 <= 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1618 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->prefetch_mode == 1.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 == 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1659 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->byte_per_pixel_detc[k] > 0.000000) => (-340282346638528859811704183484-3402823466385288598117041834845 > 0.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:1663 dispclkdppclkdcfclk_deep_sleep_prefetch_parameters_watermarks_and_performance_calculation() warn: impossible condition '(v->active_dp_ps > 1.000000) => (0.000000 > 1.000000)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5052 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5057 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5077 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting

vim +1400 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c

057fc695e934a7 Jun Lei            2019-07-08   996  
757af27b9fbbba Harry Wentland     2021-09-08   997  //    unsigned int swath_height_c                 = rq_dlg_param->rq_c.swath_height;
757af27b9fbbba Harry Wentland     2021-09-08   998  	swath_width_ub_c = rq_dlg_param->rq_c.swath_width_ub;
757af27b9fbbba Harry Wentland     2021-09-08   999  	//   dpte_bytes_per_row_ub_c        = rq_dlg_param->rq_c.dpte_bytes_per_row_ub;
757af27b9fbbba Harry Wentland     2021-09-08  1000  	dpte_groups_per_row_ub_c = rq_dlg_param->rq_c.dpte_groups_per_row_ub;
057fc695e934a7 Jun Lei            2019-07-08  1001  
757af27b9fbbba Harry Wentland     2021-09-08  1002  	meta_chunks_per_row_ub_l = rq_dlg_param->rq_l.meta_chunks_per_row_ub;
757af27b9fbbba Harry Wentland     2021-09-08  1003  	meta_chunks_per_row_ub_c = rq_dlg_param->rq_c.meta_chunks_per_row_ub;
057fc695e934a7 Jun Lei            2019-07-08  1004  	vupdate_offset = dst->vupdate_offset;
057fc695e934a7 Jun Lei            2019-07-08  1005  	vupdate_width = dst->vupdate_width;
057fc695e934a7 Jun Lei            2019-07-08  1006  	vready_offset = dst->vready_offset;
057fc695e934a7 Jun Lei            2019-07-08  1007  
057fc695e934a7 Jun Lei            2019-07-08  1008  	dppclk_delay_subtotal = mode_lib->ip.dppclk_delay_subtotal;
057fc695e934a7 Jun Lei            2019-07-08  1009  	dispclk_delay_subtotal = mode_lib->ip.dispclk_delay_subtotal;
057fc695e934a7 Jun Lei            2019-07-08  1010  
057fc695e934a7 Jun Lei            2019-07-08  1011  	if (scl_enable)
057fc695e934a7 Jun Lei            2019-07-08  1012  		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl;
057fc695e934a7 Jun Lei            2019-07-08  1013  	else
057fc695e934a7 Jun Lei            2019-07-08  1014  		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl_lb_only;
057fc695e934a7 Jun Lei            2019-07-08  1015  
057fc695e934a7 Jun Lei            2019-07-08  1016  	dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_cnvc_formatter
057fc695e934a7 Jun Lei            2019-07-08  1017  			+ src->num_cursors * mode_lib->ip.dppclk_delay_cnvc_cursor;
057fc695e934a7 Jun Lei            2019-07-08  1018  
057fc695e934a7 Jun Lei            2019-07-08  1019  	if (dout->dsc_enable) {
057fc695e934a7 Jun Lei            2019-07-08  1020  		double dsc_delay = get_dsc_delay(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
057fc695e934a7 Jun Lei            2019-07-08  1021  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1022  		dispclk_delay_subtotal += (unsigned int)dsc_delay;
057fc695e934a7 Jun Lei            2019-07-08  1023  	}
057fc695e934a7 Jun Lei            2019-07-08  1024  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1025  	pixel_rate_delay_subtotal = (unsigned int)(dppclk_delay_subtotal * pclk_freq_in_mhz / dppclk_freq_in_mhz
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1026  			+ dispclk_delay_subtotal * pclk_freq_in_mhz / dispclk_freq_in_mhz);
057fc695e934a7 Jun Lei            2019-07-08  1027  
057fc695e934a7 Jun Lei            2019-07-08  1028  	vstartup_start = dst->vstartup_start;
057fc695e934a7 Jun Lei            2019-07-08  1029  	if (interlaced) {
057fc695e934a7 Jun Lei            2019-07-08  1030  		if (vstartup_start / 2.0
057fc695e934a7 Jun Lei            2019-07-08  1031  				- (double) (vready_offset + vupdate_width + vupdate_offset) / htotal
057fc695e934a7 Jun Lei            2019-07-08  1032  				<= vblank_end / 2.0)
057fc695e934a7 Jun Lei            2019-07-08  1033  			disp_dlg_regs->vready_after_vcount0 = 1;
057fc695e934a7 Jun Lei            2019-07-08  1034  		else
057fc695e934a7 Jun Lei            2019-07-08  1035  			disp_dlg_regs->vready_after_vcount0 = 0;
057fc695e934a7 Jun Lei            2019-07-08  1036  	} else {
057fc695e934a7 Jun Lei            2019-07-08  1037  		if (vstartup_start
057fc695e934a7 Jun Lei            2019-07-08  1038  				- (double) (vready_offset + vupdate_width + vupdate_offset) / htotal
057fc695e934a7 Jun Lei            2019-07-08  1039  				<= vblank_end)
057fc695e934a7 Jun Lei            2019-07-08  1040  			disp_dlg_regs->vready_after_vcount0 = 1;
057fc695e934a7 Jun Lei            2019-07-08  1041  		else
057fc695e934a7 Jun Lei            2019-07-08  1042  			disp_dlg_regs->vready_after_vcount0 = 0;
057fc695e934a7 Jun Lei            2019-07-08  1043  	}
057fc695e934a7 Jun Lei            2019-07-08  1044  
057fc695e934a7 Jun Lei            2019-07-08  1045  	// TODO: Where is this coming from?
057fc695e934a7 Jun Lei            2019-07-08  1046  	if (interlaced)
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1047  		vstartup_start = (unsigned int)(vstartup_start / 2);
057fc695e934a7 Jun Lei            2019-07-08  1048  
057fc695e934a7 Jun Lei            2019-07-08  1049  	// TODO: What if this min_vblank doesn't match the value in the dml_config_settings.cpp?
057fc695e934a7 Jun Lei            2019-07-08  1050  	if (vstartup_start >= min_vblank) {
057fc695e934a7 Jun Lei            2019-07-08  1051  		dml_print("WARNING: DML_DLG: %s: vblank_start=%d vblank_end=%d\n",
057fc695e934a7 Jun Lei            2019-07-08  1052  				__func__,
057fc695e934a7 Jun Lei            2019-07-08  1053  				vblank_start,
057fc695e934a7 Jun Lei            2019-07-08  1054  				vblank_end);
057fc695e934a7 Jun Lei            2019-07-08  1055  		dml_print("WARNING: DML_DLG: %s: vstartup_start=%d should be less than min_vblank=%d\n",
057fc695e934a7 Jun Lei            2019-07-08  1056  				__func__,
057fc695e934a7 Jun Lei            2019-07-08  1057  				vstartup_start,
057fc695e934a7 Jun Lei            2019-07-08  1058  				min_vblank);
057fc695e934a7 Jun Lei            2019-07-08  1059  		min_vblank = vstartup_start + 1;
057fc695e934a7 Jun Lei            2019-07-08  1060  		dml_print("WARNING: DML_DLG: %s: vstartup_start=%d should be less than min_vblank=%d\n",
057fc695e934a7 Jun Lei            2019-07-08  1061  				__func__,
057fc695e934a7 Jun Lei            2019-07-08  1062  				vstartup_start,
057fc695e934a7 Jun Lei            2019-07-08  1063  				min_vblank);
057fc695e934a7 Jun Lei            2019-07-08  1064  	}
057fc695e934a7 Jun Lei            2019-07-08  1065  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1066  	dst_x_after_scaler = (unsigned int)get_dst_x_after_scaler(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1067  	dst_y_after_scaler = (unsigned int)get_dst_y_after_scaler(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
057fc695e934a7 Jun Lei            2019-07-08  1068  
057fc695e934a7 Jun Lei            2019-07-08  1069  	dml_print("DML_DLG: %s: htotal                                 = %d\n", __func__, htotal);
057fc695e934a7 Jun Lei            2019-07-08  1070  	dml_print("DML_DLG: %s: pixel_rate_delay_subtotal              = %d\n",
057fc695e934a7 Jun Lei            2019-07-08  1071  			__func__,
057fc695e934a7 Jun Lei            2019-07-08  1072  			pixel_rate_delay_subtotal);
057fc695e934a7 Jun Lei            2019-07-08  1073  	dml_print("DML_DLG: %s: dst_x_after_scaler                     = %d\n",
057fc695e934a7 Jun Lei            2019-07-08  1074  			__func__,
057fc695e934a7 Jun Lei            2019-07-08  1075  			dst_x_after_scaler);
057fc695e934a7 Jun Lei            2019-07-08  1076  	dml_print("DML_DLG: %s: dst_y_after_scaler                     = %d\n",
057fc695e934a7 Jun Lei            2019-07-08  1077  			__func__,
057fc695e934a7 Jun Lei            2019-07-08  1078  			dst_y_after_scaler);
057fc695e934a7 Jun Lei            2019-07-08  1079  
057fc695e934a7 Jun Lei            2019-07-08  1080  	// Lwait
057fc695e934a7 Jun Lei            2019-07-08  1081  	line_wait = mode_lib->soc.urgent_latency_us;
057fc695e934a7 Jun Lei            2019-07-08  1082  	if (cstate_en)
057fc695e934a7 Jun Lei            2019-07-08  1083  		line_wait = dml_max(mode_lib->soc.sr_enter_plus_exit_time_us, line_wait);
057fc695e934a7 Jun Lei            2019-07-08  1084  	if (pstate_en)
057fc695e934a7 Jun Lei            2019-07-08  1085  		line_wait = dml_max(mode_lib->soc.dram_clock_change_latency_us
057fc695e934a7 Jun Lei            2019-07-08  1086  						+ mode_lib->soc.urgent_latency_us,
057fc695e934a7 Jun Lei            2019-07-08  1087  				line_wait);
057fc695e934a7 Jun Lei            2019-07-08  1088  	line_wait = line_wait / line_time_in_us;
057fc695e934a7 Jun Lei            2019-07-08  1089  
057fc695e934a7 Jun Lei            2019-07-08  1090  	dst_y_prefetch = get_dst_y_prefetch(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
057fc695e934a7 Jun Lei            2019-07-08  1091  	dml_print("DML_DLG: %s: dst_y_prefetch (after rnd) = %3.2f\n", __func__, dst_y_prefetch);
057fc695e934a7 Jun Lei            2019-07-08  1092  
057fc695e934a7 Jun Lei            2019-07-08  1093  	dst_y_per_vm_vblank = get_dst_y_per_vm_vblank(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1094  			e2e_pipe_param,
057fc695e934a7 Jun Lei            2019-07-08  1095  			num_pipes,
057fc695e934a7 Jun Lei            2019-07-08  1096  			pipe_idx);
057fc695e934a7 Jun Lei            2019-07-08  1097  	dst_y_per_row_vblank = get_dst_y_per_row_vblank(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1098  			e2e_pipe_param,
057fc695e934a7 Jun Lei            2019-07-08  1099  			num_pipes,
057fc695e934a7 Jun Lei            2019-07-08  1100  			pipe_idx);
057fc695e934a7 Jun Lei            2019-07-08  1101  	dst_y_per_vm_flip = get_dst_y_per_vm_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
057fc695e934a7 Jun Lei            2019-07-08  1102  	dst_y_per_row_flip = get_dst_y_per_row_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
057fc695e934a7 Jun Lei            2019-07-08  1103  
057fc695e934a7 Jun Lei            2019-07-08  1104  	min_dst_y_per_vm_vblank = 8.0;
057fc695e934a7 Jun Lei            2019-07-08  1105  	min_dst_y_per_row_vblank = 16.0;
057fc695e934a7 Jun Lei            2019-07-08  1106  
057fc695e934a7 Jun Lei            2019-07-08  1107  	// magic!
057fc695e934a7 Jun Lei            2019-07-08  1108  	if (htotal <= 75) {
057fc695e934a7 Jun Lei            2019-07-08  1109  		min_vblank = 300;
057fc695e934a7 Jun Lei            2019-07-08  1110  		min_dst_y_per_vm_vblank = 100.0;
057fc695e934a7 Jun Lei            2019-07-08  1111  		min_dst_y_per_row_vblank = 100.0;
057fc695e934a7 Jun Lei            2019-07-08  1112  	}
057fc695e934a7 Jun Lei            2019-07-08  1113  
057fc695e934a7 Jun Lei            2019-07-08  1114  	dml_print("DML_DLG: %s: dst_y_per_vm_vblank    = %3.2f\n", __func__, dst_y_per_vm_vblank);
057fc695e934a7 Jun Lei            2019-07-08  1115  	dml_print("DML_DLG: %s: dst_y_per_row_vblank   = %3.2f\n", __func__, dst_y_per_row_vblank);
057fc695e934a7 Jun Lei            2019-07-08  1116  
057fc695e934a7 Jun Lei            2019-07-08  1117  	ASSERT(dst_y_per_vm_vblank < min_dst_y_per_vm_vblank);
057fc695e934a7 Jun Lei            2019-07-08  1118  	ASSERT(dst_y_per_row_vblank < min_dst_y_per_row_vblank);
057fc695e934a7 Jun Lei            2019-07-08  1119  
057fc695e934a7 Jun Lei            2019-07-08  1120  	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
057fc695e934a7 Jun Lei            2019-07-08  1121  	lsw = dst_y_prefetch - (dst_y_per_vm_vblank + dst_y_per_row_vblank);
057fc695e934a7 Jun Lei            2019-07-08  1122  
057fc695e934a7 Jun Lei            2019-07-08  1123  	dml_print("DML_DLG: %s: lsw = %3.2f\n", __func__, lsw);
057fc695e934a7 Jun Lei            2019-07-08  1124  
057fc695e934a7 Jun Lei            2019-07-08  1125  	vratio_pre_l = get_vratio_prefetch_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
057fc695e934a7 Jun Lei            2019-07-08  1126  	vratio_pre_c = get_vratio_prefetch_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
057fc695e934a7 Jun Lei            2019-07-08  1127  
057fc695e934a7 Jun Lei            2019-07-08  1128  	dml_print("DML_DLG: %s: vratio_pre_l=%3.2f\n", __func__, vratio_pre_l);
057fc695e934a7 Jun Lei            2019-07-08  1129  	dml_print("DML_DLG: %s: vratio_pre_c=%3.2f\n", __func__, vratio_pre_c);
057fc695e934a7 Jun Lei            2019-07-08  1130  
057fc695e934a7 Jun Lei            2019-07-08  1131  	// Active
757af27b9fbbba Harry Wentland     2021-09-08  1132  	req_per_swath_ub_l = rq_dlg_param->rq_l.req_per_swath_ub;
757af27b9fbbba Harry Wentland     2021-09-08  1133  	req_per_swath_ub_c = rq_dlg_param->rq_c.req_per_swath_ub;
757af27b9fbbba Harry Wentland     2021-09-08  1134  	meta_row_height_l = rq_dlg_param->rq_l.meta_row_height;
757af27b9fbbba Harry Wentland     2021-09-08  1135  	meta_row_height_c = rq_dlg_param->rq_c.meta_row_height;
057fc695e934a7 Jun Lei            2019-07-08  1136  	swath_width_pixels_ub_l = 0;
057fc695e934a7 Jun Lei            2019-07-08  1137  	swath_width_pixels_ub_c = 0;
057fc695e934a7 Jun Lei            2019-07-08  1138  	scaler_rec_in_width_l = 0;
057fc695e934a7 Jun Lei            2019-07-08  1139  	scaler_rec_in_width_c = 0;
757af27b9fbbba Harry Wentland     2021-09-08  1140  	dpte_row_height_l = rq_dlg_param->rq_l.dpte_row_height;
757af27b9fbbba Harry Wentland     2021-09-08  1141  	dpte_row_height_c = rq_dlg_param->rq_c.dpte_row_height;
057fc695e934a7 Jun Lei            2019-07-08  1142  
4fa0046f11d998 Ivan Lipski        2024-06-07  1143  	swath_width_pixels_ub_l = swath_width_ub_l;
4fa0046f11d998 Ivan Lipski        2024-06-07  1144  	swath_width_pixels_ub_c = swath_width_ub_c;
057fc695e934a7 Jun Lei            2019-07-08  1145  
057fc695e934a7 Jun Lei            2019-07-08  1146  	if (htaps_l <= 1)
057fc695e934a7 Jun Lei            2019-07-08  1147  		min_hratio_fact_l = 2.0;
057fc695e934a7 Jun Lei            2019-07-08  1148  	else if (htaps_l <= 6) {
057fc695e934a7 Jun Lei            2019-07-08  1149  		if ((hratio_l * 2.0) > 4.0)
057fc695e934a7 Jun Lei            2019-07-08  1150  			min_hratio_fact_l = 4.0;
057fc695e934a7 Jun Lei            2019-07-08  1151  		else
057fc695e934a7 Jun Lei            2019-07-08  1152  			min_hratio_fact_l = hratio_l * 2.0;
057fc695e934a7 Jun Lei            2019-07-08  1153  	} else {
057fc695e934a7 Jun Lei            2019-07-08  1154  		if (hratio_l > 4.0)
057fc695e934a7 Jun Lei            2019-07-08  1155  			min_hratio_fact_l = 4.0;
057fc695e934a7 Jun Lei            2019-07-08  1156  		else
057fc695e934a7 Jun Lei            2019-07-08  1157  			min_hratio_fact_l = hratio_l;
057fc695e934a7 Jun Lei            2019-07-08  1158  	}
057fc695e934a7 Jun Lei            2019-07-08  1159  
057fc695e934a7 Jun Lei            2019-07-08  1160  	hscale_pixel_rate_l = min_hratio_fact_l * dppclk_freq_in_mhz;
057fc695e934a7 Jun Lei            2019-07-08  1161  
057fc695e934a7 Jun Lei            2019-07-08  1162  	if (htaps_c <= 1)
057fc695e934a7 Jun Lei            2019-07-08  1163  		min_hratio_fact_c = 2.0;
057fc695e934a7 Jun Lei            2019-07-08  1164  	else if (htaps_c <= 6) {
057fc695e934a7 Jun Lei            2019-07-08  1165  		if ((hratio_c * 2.0) > 4.0)
057fc695e934a7 Jun Lei            2019-07-08  1166  			min_hratio_fact_c = 4.0;
057fc695e934a7 Jun Lei            2019-07-08  1167  		else
057fc695e934a7 Jun Lei            2019-07-08  1168  			min_hratio_fact_c = hratio_c * 2.0;
057fc695e934a7 Jun Lei            2019-07-08  1169  	} else {
057fc695e934a7 Jun Lei            2019-07-08  1170  		if (hratio_c > 4.0)
057fc695e934a7 Jun Lei            2019-07-08  1171  			min_hratio_fact_c = 4.0;
057fc695e934a7 Jun Lei            2019-07-08  1172  		else
057fc695e934a7 Jun Lei            2019-07-08  1173  			min_hratio_fact_c = hratio_c;
057fc695e934a7 Jun Lei            2019-07-08  1174  	}
057fc695e934a7 Jun Lei            2019-07-08  1175  
057fc695e934a7 Jun Lei            2019-07-08  1176  	hscale_pixel_rate_c = min_hratio_fact_c * dppclk_freq_in_mhz;
057fc695e934a7 Jun Lei            2019-07-08  1177  
057fc695e934a7 Jun Lei            2019-07-08  1178  	refcyc_per_line_delivery_pre_l = 0.;
057fc695e934a7 Jun Lei            2019-07-08  1179  	refcyc_per_line_delivery_pre_c = 0.;
057fc695e934a7 Jun Lei            2019-07-08  1180  	refcyc_per_line_delivery_l = 0.;
057fc695e934a7 Jun Lei            2019-07-08  1181  	refcyc_per_line_delivery_c = 0.;
057fc695e934a7 Jun Lei            2019-07-08  1182  
057fc695e934a7 Jun Lei            2019-07-08  1183  	refcyc_per_req_delivery_pre_l = 0.;
057fc695e934a7 Jun Lei            2019-07-08  1184  	refcyc_per_req_delivery_pre_c = 0.;
057fc695e934a7 Jun Lei            2019-07-08  1185  	refcyc_per_req_delivery_l = 0.;
057fc695e934a7 Jun Lei            2019-07-08  1186  	refcyc_per_req_delivery_c = 0.;
057fc695e934a7 Jun Lei            2019-07-08  1187  
057fc695e934a7 Jun Lei            2019-07-08  1188  	full_recout_width = 0;
057fc695e934a7 Jun Lei            2019-07-08  1189  	// In ODM
057fc695e934a7 Jun Lei            2019-07-08  1190  	if (src->is_hsplit) {
057fc695e934a7 Jun Lei            2019-07-08  1191  		// This "hack"  is only allowed (and valid) for MPC combine. In ODM
057fc695e934a7 Jun Lei            2019-07-08  1192  		// combine, you MUST specify the full_recout_width...according to Oswin
057fc695e934a7 Jun Lei            2019-07-08  1193  		if (dst->full_recout_width == 0 && !dst->odm_combine) {
057fc695e934a7 Jun Lei            2019-07-08  1194  			dml_print("DML_DLG: %s: Warning: full_recout_width not set in hsplit mode\n",
057fc695e934a7 Jun Lei            2019-07-08  1195  					__func__);
057fc695e934a7 Jun Lei            2019-07-08  1196  			full_recout_width = dst->recout_width * 2; // assume half split for dcn1
057fc695e934a7 Jun Lei            2019-07-08  1197  		} else
057fc695e934a7 Jun Lei            2019-07-08  1198  			full_recout_width = dst->full_recout_width;
057fc695e934a7 Jun Lei            2019-07-08  1199  	} else
057fc695e934a7 Jun Lei            2019-07-08  1200  		full_recout_width = dst->recout_width;
057fc695e934a7 Jun Lei            2019-07-08  1201  
057fc695e934a7 Jun Lei            2019-07-08  1202  	// As of DCN2, mpc_combine and odm_combine are mutually exclusive
057fc695e934a7 Jun Lei            2019-07-08  1203  	refcyc_per_line_delivery_pre_l = get_refcyc_per_delivery(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1204  			refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1205  			pclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1206  			dst->odm_combine,
057fc695e934a7 Jun Lei            2019-07-08  1207  			full_recout_width,
057fc695e934a7 Jun Lei            2019-07-08  1208  			dst->hactive,
057fc695e934a7 Jun Lei            2019-07-08  1209  			vratio_pre_l,
057fc695e934a7 Jun Lei            2019-07-08  1210  			hscale_pixel_rate_l,
057fc695e934a7 Jun Lei            2019-07-08  1211  			swath_width_pixels_ub_l,
057fc695e934a7 Jun Lei            2019-07-08  1212  			1); // per line
057fc695e934a7 Jun Lei            2019-07-08  1213  
057fc695e934a7 Jun Lei            2019-07-08  1214  	refcyc_per_line_delivery_l = get_refcyc_per_delivery(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1215  			refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1216  			pclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1217  			dst->odm_combine,
057fc695e934a7 Jun Lei            2019-07-08  1218  			full_recout_width,
057fc695e934a7 Jun Lei            2019-07-08  1219  			dst->hactive,
057fc695e934a7 Jun Lei            2019-07-08  1220  			vratio_l,
057fc695e934a7 Jun Lei            2019-07-08  1221  			hscale_pixel_rate_l,
057fc695e934a7 Jun Lei            2019-07-08  1222  			swath_width_pixels_ub_l,
057fc695e934a7 Jun Lei            2019-07-08  1223  			1); // per line
057fc695e934a7 Jun Lei            2019-07-08  1224  
057fc695e934a7 Jun Lei            2019-07-08  1225  	dml_print("DML_DLG: %s: full_recout_width              = %d\n",
057fc695e934a7 Jun Lei            2019-07-08  1226  			__func__,
057fc695e934a7 Jun Lei            2019-07-08  1227  			full_recout_width);
057fc695e934a7 Jun Lei            2019-07-08  1228  	dml_print("DML_DLG: %s: hscale_pixel_rate_l            = %3.2f\n",
057fc695e934a7 Jun Lei            2019-07-08  1229  			__func__,
057fc695e934a7 Jun Lei            2019-07-08  1230  			hscale_pixel_rate_l);
057fc695e934a7 Jun Lei            2019-07-08  1231  	dml_print("DML_DLG: %s: refcyc_per_line_delivery_pre_l = %3.2f\n",
057fc695e934a7 Jun Lei            2019-07-08  1232  			__func__,
057fc695e934a7 Jun Lei            2019-07-08  1233  			refcyc_per_line_delivery_pre_l);
057fc695e934a7 Jun Lei            2019-07-08  1234  	dml_print("DML_DLG: %s: refcyc_per_line_delivery_l     = %3.2f\n",
057fc695e934a7 Jun Lei            2019-07-08  1235  			__func__,
057fc695e934a7 Jun Lei            2019-07-08  1236  			refcyc_per_line_delivery_l);
057fc695e934a7 Jun Lei            2019-07-08  1237  
057fc695e934a7 Jun Lei            2019-07-08  1238  	if (dual_plane) {
057fc695e934a7 Jun Lei            2019-07-08  1239  		refcyc_per_line_delivery_pre_c = get_refcyc_per_delivery(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1240  				refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1241  				pclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1242  				dst->odm_combine,
057fc695e934a7 Jun Lei            2019-07-08  1243  				full_recout_width,
057fc695e934a7 Jun Lei            2019-07-08  1244  				dst->hactive,
057fc695e934a7 Jun Lei            2019-07-08  1245  				vratio_pre_c,
057fc695e934a7 Jun Lei            2019-07-08  1246  				hscale_pixel_rate_c,
057fc695e934a7 Jun Lei            2019-07-08  1247  				swath_width_pixels_ub_c,
057fc695e934a7 Jun Lei            2019-07-08  1248  				1); // per line
057fc695e934a7 Jun Lei            2019-07-08  1249  
057fc695e934a7 Jun Lei            2019-07-08  1250  		refcyc_per_line_delivery_c = get_refcyc_per_delivery(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1251  				refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1252  				pclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1253  				dst->odm_combine,
057fc695e934a7 Jun Lei            2019-07-08  1254  				full_recout_width,
057fc695e934a7 Jun Lei            2019-07-08  1255  				dst->hactive,
057fc695e934a7 Jun Lei            2019-07-08  1256  				vratio_c,
057fc695e934a7 Jun Lei            2019-07-08  1257  				hscale_pixel_rate_c,
057fc695e934a7 Jun Lei            2019-07-08  1258  				swath_width_pixels_ub_c,
057fc695e934a7 Jun Lei            2019-07-08  1259  				1);  // per line
057fc695e934a7 Jun Lei            2019-07-08  1260  
057fc695e934a7 Jun Lei            2019-07-08  1261  		dml_print("DML_DLG: %s: refcyc_per_line_delivery_pre_c = %3.2f\n",
057fc695e934a7 Jun Lei            2019-07-08  1262  				__func__,
057fc695e934a7 Jun Lei            2019-07-08  1263  				refcyc_per_line_delivery_pre_c);
057fc695e934a7 Jun Lei            2019-07-08  1264  		dml_print("DML_DLG: %s: refcyc_per_line_delivery_c     = %3.2f\n",
057fc695e934a7 Jun Lei            2019-07-08  1265  				__func__,
057fc695e934a7 Jun Lei            2019-07-08  1266  				refcyc_per_line_delivery_c);
057fc695e934a7 Jun Lei            2019-07-08  1267  	}
057fc695e934a7 Jun Lei            2019-07-08  1268  
057fc695e934a7 Jun Lei            2019-07-08  1269  	// TTU - Luma / Chroma
057fc695e934a7 Jun Lei            2019-07-08  1270  	if (access_dir) {  // vertical access
057fc695e934a7 Jun Lei            2019-07-08  1271  		scaler_rec_in_width_l = vp_height_l;
057fc695e934a7 Jun Lei            2019-07-08  1272  		scaler_rec_in_width_c = vp_height_c;
057fc695e934a7 Jun Lei            2019-07-08  1273  	} else {
057fc695e934a7 Jun Lei            2019-07-08  1274  		scaler_rec_in_width_l = vp_width_l;
057fc695e934a7 Jun Lei            2019-07-08  1275  		scaler_rec_in_width_c = vp_width_c;
057fc695e934a7 Jun Lei            2019-07-08  1276  	}
057fc695e934a7 Jun Lei            2019-07-08  1277  
057fc695e934a7 Jun Lei            2019-07-08  1278  	refcyc_per_req_delivery_pre_l = get_refcyc_per_delivery(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1279  			refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1280  			pclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1281  			dst->odm_combine,
057fc695e934a7 Jun Lei            2019-07-08  1282  			full_recout_width,
057fc695e934a7 Jun Lei            2019-07-08  1283  			dst->hactive,
057fc695e934a7 Jun Lei            2019-07-08  1284  			vratio_pre_l,
057fc695e934a7 Jun Lei            2019-07-08  1285  			hscale_pixel_rate_l,
057fc695e934a7 Jun Lei            2019-07-08  1286  			scaler_rec_in_width_l,
057fc695e934a7 Jun Lei            2019-07-08  1287  			req_per_swath_ub_l);  // per req
057fc695e934a7 Jun Lei            2019-07-08  1288  	refcyc_per_req_delivery_l = get_refcyc_per_delivery(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1289  			refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1290  			pclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1291  			dst->odm_combine,
057fc695e934a7 Jun Lei            2019-07-08  1292  			full_recout_width,
057fc695e934a7 Jun Lei            2019-07-08  1293  			dst->hactive,
057fc695e934a7 Jun Lei            2019-07-08  1294  			vratio_l,
057fc695e934a7 Jun Lei            2019-07-08  1295  			hscale_pixel_rate_l,
057fc695e934a7 Jun Lei            2019-07-08  1296  			scaler_rec_in_width_l,
057fc695e934a7 Jun Lei            2019-07-08  1297  			req_per_swath_ub_l);  // per req
057fc695e934a7 Jun Lei            2019-07-08  1298  
057fc695e934a7 Jun Lei            2019-07-08  1299  	dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_l = %3.2f\n",
057fc695e934a7 Jun Lei            2019-07-08  1300  			__func__,
057fc695e934a7 Jun Lei            2019-07-08  1301  			refcyc_per_req_delivery_pre_l);
057fc695e934a7 Jun Lei            2019-07-08  1302  	dml_print("DML_DLG: %s: refcyc_per_req_delivery_l     = %3.2f\n",
057fc695e934a7 Jun Lei            2019-07-08  1303  			__func__,
057fc695e934a7 Jun Lei            2019-07-08  1304  			refcyc_per_req_delivery_l);
057fc695e934a7 Jun Lei            2019-07-08  1305  
057fc695e934a7 Jun Lei            2019-07-08  1306  	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1307  	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1308  
057fc695e934a7 Jun Lei            2019-07-08  1309  	if (dual_plane) {
057fc695e934a7 Jun Lei            2019-07-08  1310  		refcyc_per_req_delivery_pre_c = get_refcyc_per_delivery(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1311  				refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1312  				pclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1313  				dst->odm_combine,
057fc695e934a7 Jun Lei            2019-07-08  1314  				full_recout_width,
057fc695e934a7 Jun Lei            2019-07-08  1315  				dst->hactive,
057fc695e934a7 Jun Lei            2019-07-08  1316  				vratio_pre_c,
057fc695e934a7 Jun Lei            2019-07-08  1317  				hscale_pixel_rate_c,
057fc695e934a7 Jun Lei            2019-07-08  1318  				scaler_rec_in_width_c,
057fc695e934a7 Jun Lei            2019-07-08  1319  				req_per_swath_ub_c);  // per req
057fc695e934a7 Jun Lei            2019-07-08  1320  		refcyc_per_req_delivery_c = get_refcyc_per_delivery(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1321  				refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1322  				pclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1323  				dst->odm_combine,
057fc695e934a7 Jun Lei            2019-07-08  1324  				full_recout_width,
057fc695e934a7 Jun Lei            2019-07-08  1325  				dst->hactive,
057fc695e934a7 Jun Lei            2019-07-08  1326  				vratio_c,
057fc695e934a7 Jun Lei            2019-07-08  1327  				hscale_pixel_rate_c,
057fc695e934a7 Jun Lei            2019-07-08  1328  				scaler_rec_in_width_c,
057fc695e934a7 Jun Lei            2019-07-08  1329  				req_per_swath_ub_c);  // per req
057fc695e934a7 Jun Lei            2019-07-08  1330  
057fc695e934a7 Jun Lei            2019-07-08  1331  		dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_c = %3.2f\n",
057fc695e934a7 Jun Lei            2019-07-08  1332  				__func__,
057fc695e934a7 Jun Lei            2019-07-08  1333  				refcyc_per_req_delivery_pre_c);
057fc695e934a7 Jun Lei            2019-07-08  1334  		dml_print("DML_DLG: %s: refcyc_per_req_delivery_c     = %3.2f\n",
057fc695e934a7 Jun Lei            2019-07-08  1335  				__func__,
057fc695e934a7 Jun Lei            2019-07-08  1336  				refcyc_per_req_delivery_c);
057fc695e934a7 Jun Lei            2019-07-08  1337  
057fc695e934a7 Jun Lei            2019-07-08  1338  		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1339  		ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1340  	}
057fc695e934a7 Jun Lei            2019-07-08  1341  
057fc695e934a7 Jun Lei            2019-07-08  1342  	// TTU - Cursor
057fc695e934a7 Jun Lei            2019-07-08  1343  	refcyc_per_req_delivery_pre_cur0 = 0.0;
057fc695e934a7 Jun Lei            2019-07-08  1344  	refcyc_per_req_delivery_cur0 = 0.0;
057fc695e934a7 Jun Lei            2019-07-08  1345  	if (src->num_cursors > 0) {
057fc695e934a7 Jun Lei            2019-07-08  1346  		calculate_ttu_cursor(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1347  				&refcyc_per_req_delivery_pre_cur0,
057fc695e934a7 Jun Lei            2019-07-08  1348  				&refcyc_per_req_delivery_cur0,
057fc695e934a7 Jun Lei            2019-07-08  1349  				refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1350  				ref_freq_to_pix_freq,
057fc695e934a7 Jun Lei            2019-07-08  1351  				hscale_pixel_rate_l,
057fc695e934a7 Jun Lei            2019-07-08  1352  				scl->hscl_ratio,
057fc695e934a7 Jun Lei            2019-07-08  1353  				vratio_pre_l,
057fc695e934a7 Jun Lei            2019-07-08  1354  				vratio_l,
057fc695e934a7 Jun Lei            2019-07-08  1355  				src->cur0_src_width,
057fc695e934a7 Jun Lei            2019-07-08  1356  				(enum cursor_bpp)(src->cur0_bpp));
057fc695e934a7 Jun Lei            2019-07-08  1357  	}
057fc695e934a7 Jun Lei            2019-07-08  1358  
057fc695e934a7 Jun Lei            2019-07-08  1359  	refcyc_per_req_delivery_pre_cur1 = 0.0;
057fc695e934a7 Jun Lei            2019-07-08  1360  	refcyc_per_req_delivery_cur1 = 0.0;
057fc695e934a7 Jun Lei            2019-07-08  1361  	if (src->num_cursors > 1) {
057fc695e934a7 Jun Lei            2019-07-08  1362  		calculate_ttu_cursor(mode_lib,
057fc695e934a7 Jun Lei            2019-07-08  1363  				&refcyc_per_req_delivery_pre_cur1,
057fc695e934a7 Jun Lei            2019-07-08  1364  				&refcyc_per_req_delivery_cur1,
057fc695e934a7 Jun Lei            2019-07-08  1365  				refclk_freq_in_mhz,
057fc695e934a7 Jun Lei            2019-07-08  1366  				ref_freq_to_pix_freq,
057fc695e934a7 Jun Lei            2019-07-08  1367  				hscale_pixel_rate_l,
057fc695e934a7 Jun Lei            2019-07-08  1368  				scl->hscl_ratio,
057fc695e934a7 Jun Lei            2019-07-08  1369  				vratio_pre_l,
057fc695e934a7 Jun Lei            2019-07-08  1370  				vratio_l,
057fc695e934a7 Jun Lei            2019-07-08  1371  				src->cur1_src_width,
057fc695e934a7 Jun Lei            2019-07-08  1372  				(enum cursor_bpp)(src->cur1_bpp));
057fc695e934a7 Jun Lei            2019-07-08  1373  	}
057fc695e934a7 Jun Lei            2019-07-08  1374  
057fc695e934a7 Jun Lei            2019-07-08  1375  	// TTU - Misc
057fc695e934a7 Jun Lei            2019-07-08  1376  	// all hard-coded
057fc695e934a7 Jun Lei            2019-07-08  1377  
057fc695e934a7 Jun Lei            2019-07-08  1378  	// Assignment to register structures
057fc695e934a7 Jun Lei            2019-07-08  1379  	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1380  	disp_dlg_regs->refcyc_x_after_scaler = (unsigned int)(dst_x_after_scaler * ref_freq_to_pix_freq); // in terms of refclk
057fc695e934a7 Jun Lei            2019-07-08  1381  	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int) dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1382  	disp_dlg_regs->dst_y_prefetch = (unsigned int)(dst_y_prefetch * dml_pow(2, 2));
057fc695e934a7 Jun Lei            2019-07-08  1383  	disp_dlg_regs->dst_y_per_vm_vblank = (unsigned int)(dst_y_per_vm_vblank * dml_pow(2, 2));
057fc695e934a7 Jun Lei            2019-07-08  1384  	disp_dlg_regs->dst_y_per_row_vblank = (unsigned int)(dst_y_per_row_vblank * dml_pow(2, 2));
057fc695e934a7 Jun Lei            2019-07-08  1385  	disp_dlg_regs->dst_y_per_vm_flip = (unsigned int)(dst_y_per_vm_flip * dml_pow(2, 2));
057fc695e934a7 Jun Lei            2019-07-08  1386  	disp_dlg_regs->dst_y_per_row_flip = (unsigned int)(dst_y_per_row_flip * dml_pow(2, 2));
057fc695e934a7 Jun Lei            2019-07-08  1387  
057fc695e934a7 Jun Lei            2019-07-08  1388  	disp_dlg_regs->vratio_prefetch = (unsigned int)(vratio_pre_l * dml_pow(2, 19));
057fc695e934a7 Jun Lei            2019-07-08  1389  	disp_dlg_regs->vratio_prefetch_c = (unsigned int)(vratio_pre_c * dml_pow(2, 19));
057fc695e934a7 Jun Lei            2019-07-08  1390  
057fc695e934a7 Jun Lei            2019-07-08  1391  	disp_dlg_regs->refcyc_per_pte_group_vblank_l =
057fc695e934a7 Jun Lei            2019-07-08  1392  			  (unsigned int)(dst_y_per_row_vblank * (double) htotal
057fc695e934a7 Jun Lei            2019-07-08  1393  					    * ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_l);
057fc695e934a7 Jun Lei            2019-07-08  1394  	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int) dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1395  
057fc695e934a7 Jun Lei            2019-07-08  1396  	if (dual_plane) {
057fc695e934a7 Jun Lei            2019-07-08  1397  			   disp_dlg_regs->refcyc_per_pte_group_vblank_c = (unsigned int)(dst_y_per_row_vblank
057fc695e934a7 Jun Lei            2019-07-08  1398  							   * (double) htotal * ref_freq_to_pix_freq
057fc695e934a7 Jun Lei            2019-07-08  1399  							   / (double) dpte_groups_per_row_ub_c);
057fc695e934a7 Jun Lei            2019-07-08 @1400  		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c
057fc695e934a7 Jun Lei            2019-07-08  1401  						< (unsigned int) dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1402  	}
057fc695e934a7 Jun Lei            2019-07-08  1403  
057fc695e934a7 Jun Lei            2019-07-08  1404  	disp_dlg_regs->refcyc_per_meta_chunk_vblank_l =
057fc695e934a7 Jun Lei            2019-07-08  1405  			  (unsigned int)(dst_y_per_row_vblank * (double) htotal
057fc695e934a7 Jun Lei            2019-07-08  1406  					    * ref_freq_to_pix_freq / (double) meta_chunks_per_row_ub_l);
057fc695e934a7 Jun Lei            2019-07-08  1407  	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int) dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1408  
057fc695e934a7 Jun Lei            2019-07-08  1409  	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c =
057fc695e934a7 Jun Lei            2019-07-08  1410  			disp_dlg_regs->refcyc_per_meta_chunk_vblank_l; // dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
057fc695e934a7 Jun Lei            2019-07-08  1411  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1412  	disp_dlg_regs->refcyc_per_pte_group_flip_l = (unsigned int)((dst_y_per_row_flip * htotal
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1413  			  * ref_freq_to_pix_freq) / dpte_groups_per_row_ub_l);
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1414  	disp_dlg_regs->refcyc_per_meta_chunk_flip_l = (unsigned int)((dst_y_per_row_flip * htotal
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1415  			  * ref_freq_to_pix_freq) / meta_chunks_per_row_ub_l);
057fc695e934a7 Jun Lei            2019-07-08  1416  
057fc695e934a7 Jun Lei            2019-07-08  1417  	if (dual_plane) {
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1418  			   disp_dlg_regs->refcyc_per_pte_group_flip_c = (unsigned int)((dst_y_per_row_flip
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1419  							   * htotal * ref_freq_to_pix_freq) / dpte_groups_per_row_ub_c);
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1420  			   disp_dlg_regs->refcyc_per_meta_chunk_flip_c = (unsigned int)((dst_y_per_row_flip
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1421  							   * htotal * ref_freq_to_pix_freq) / meta_chunks_per_row_ub_c);
057fc695e934a7 Jun Lei            2019-07-08  1422  	}
057fc695e934a7 Jun Lei            2019-07-08  1423  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1424  	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int)(((double) dpte_row_height_l
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1425  			  / (double) vratio_l * dml_pow(2, 2)));
057fc695e934a7 Jun Lei            2019-07-08  1426  	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int) dml_pow(2, 17));
057fc695e934a7 Jun Lei            2019-07-08  1427  
057fc695e934a7 Jun Lei            2019-07-08  1428  	if (dual_plane) {
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1429  			   disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int)(((double) dpte_row_height_c
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1430  							   / (double) vratio_c * dml_pow(2, 2)));
057fc695e934a7 Jun Lei            2019-07-08  1431  		if (disp_dlg_regs->dst_y_per_pte_row_nom_c >= (unsigned int) dml_pow(2, 17)) {
057fc695e934a7 Jun Lei            2019-07-08  1432  			dml_print("DML_DLG: %s: Warning dst_y_per_pte_row_nom_c %u larger than supported by register format U15.2 %u\n",
057fc695e934a7 Jun Lei            2019-07-08  1433  					__func__,
057fc695e934a7 Jun Lei            2019-07-08  1434  					disp_dlg_regs->dst_y_per_pte_row_nom_c,
057fc695e934a7 Jun Lei            2019-07-08  1435  					(unsigned int) dml_pow(2, 17) - 1);
057fc695e934a7 Jun Lei            2019-07-08  1436  		}
057fc695e934a7 Jun Lei            2019-07-08  1437  	}
057fc695e934a7 Jun Lei            2019-07-08  1438  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1439  	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int)(((double) meta_row_height_l
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1440  			  / (double) vratio_l * dml_pow(2, 2)));
057fc695e934a7 Jun Lei            2019-07-08  1441  	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int) dml_pow(2, 17));
057fc695e934a7 Jun Lei            2019-07-08  1442  
057fc695e934a7 Jun Lei            2019-07-08  1443  	disp_dlg_regs->dst_y_per_meta_row_nom_c = disp_dlg_regs->dst_y_per_meta_row_nom_l; // TODO: dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
057fc695e934a7 Jun Lei            2019-07-08  1444  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1445  	disp_dlg_regs->refcyc_per_pte_group_nom_l = (unsigned int)(((double) dpte_row_height_l
057fc695e934a7 Jun Lei            2019-07-08  1446  			  / (double) vratio_l * (double) htotal * ref_freq_to_pix_freq
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1447  			  / (double) dpte_groups_per_row_ub_l));
057fc695e934a7 Jun Lei            2019-07-08  1448  	if (disp_dlg_regs->refcyc_per_pte_group_nom_l >= (unsigned int) dml_pow(2, 23))
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1449  		disp_dlg_regs->refcyc_per_pte_group_nom_l = (unsigned int)(dml_pow(2, 23) - 1);
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1450  	disp_dlg_regs->refcyc_per_meta_chunk_nom_l = (unsigned int)(((double) meta_row_height_l
057fc695e934a7 Jun Lei            2019-07-08  1451  			  / (double) vratio_l * (double) htotal * ref_freq_to_pix_freq
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1452  			  / (double) meta_chunks_per_row_ub_l));
057fc695e934a7 Jun Lei            2019-07-08  1453  	if (disp_dlg_regs->refcyc_per_meta_chunk_nom_l >= (unsigned int) dml_pow(2, 23))
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1454  		disp_dlg_regs->refcyc_per_meta_chunk_nom_l = (unsigned int)(dml_pow(2, 23) - 1);
057fc695e934a7 Jun Lei            2019-07-08  1455  
057fc695e934a7 Jun Lei            2019-07-08  1456  	if (dual_plane) {
057fc695e934a7 Jun Lei            2019-07-08  1457  			   disp_dlg_regs->refcyc_per_pte_group_nom_c =
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1458  							   (unsigned int)(((double) dpte_row_height_c / (double) vratio_c
057fc695e934a7 Jun Lei            2019-07-08  1459  											   * (double) htotal * ref_freq_to_pix_freq
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1460  											   / (double) dpte_groups_per_row_ub_c));
057fc695e934a7 Jun Lei            2019-07-08  1461  		if (disp_dlg_regs->refcyc_per_pte_group_nom_c >= (unsigned int) dml_pow(2, 23))
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1462  				disp_dlg_regs->refcyc_per_pte_group_nom_c = (unsigned int)(dml_pow(2, 23) - 1);
057fc695e934a7 Jun Lei            2019-07-08  1463  
057fc695e934a7 Jun Lei            2019-07-08  1464  		// TODO: Is this the right calculation? Does htotal need to be halved?
057fc695e934a7 Jun Lei            2019-07-08  1465  			   disp_dlg_regs->refcyc_per_meta_chunk_nom_c =
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1466  							   (unsigned int)(((double) meta_row_height_c / (double) vratio_c
057fc695e934a7 Jun Lei            2019-07-08  1467  											   * (double) htotal * ref_freq_to_pix_freq
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1468  											   / (double) meta_chunks_per_row_ub_c));
057fc695e934a7 Jun Lei            2019-07-08  1469  		if (disp_dlg_regs->refcyc_per_meta_chunk_nom_c >= (unsigned int) dml_pow(2, 23))
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1470  				disp_dlg_regs->refcyc_per_meta_chunk_nom_c = (unsigned int)(dml_pow(2, 23) - 1);
057fc695e934a7 Jun Lei            2019-07-08  1471  	}
057fc695e934a7 Jun Lei            2019-07-08  1472  
057fc695e934a7 Jun Lei            2019-07-08  1473  	disp_dlg_regs->refcyc_per_line_delivery_pre_l = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_l,
057fc695e934a7 Jun Lei            2019-07-08  1474  			1);
057fc695e934a7 Jun Lei            2019-07-08  1475  	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int) dml_floor(refcyc_per_line_delivery_l,
057fc695e934a7 Jun Lei            2019-07-08  1476  			1);
057fc695e934a7 Jun Lei            2019-07-08  1477  	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int) dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1478  	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int) dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1479  
057fc695e934a7 Jun Lei            2019-07-08  1480  	disp_dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_c,
057fc695e934a7 Jun Lei            2019-07-08  1481  			1);
057fc695e934a7 Jun Lei            2019-07-08  1482  	disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int) dml_floor(refcyc_per_line_delivery_c,
057fc695e934a7 Jun Lei            2019-07-08  1483  			1);
057fc695e934a7 Jun Lei            2019-07-08  1484  	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int) dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1485  	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int) dml_pow(2, 13));
057fc695e934a7 Jun Lei            2019-07-08  1486  
057fc695e934a7 Jun Lei            2019-07-08  1487  	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
057fc695e934a7 Jun Lei            2019-07-08  1488  	disp_dlg_regs->dst_y_offset_cur0 = 0;
057fc695e934a7 Jun Lei            2019-07-08  1489  	disp_dlg_regs->chunk_hdl_adjust_cur1 = 3;
057fc695e934a7 Jun Lei            2019-07-08  1490  	disp_dlg_regs->dst_y_offset_cur1 = 0;
057fc695e934a7 Jun Lei            2019-07-08  1491  
057fc695e934a7 Jun Lei            2019-07-08  1492  	disp_dlg_regs->dst_y_delta_drq_limit = 0x7fff; // off
057fc695e934a7 Jun Lei            2019-07-08  1493  
057fc695e934a7 Jun Lei            2019-07-08  1494  	disp_ttu_regs->refcyc_per_req_delivery_pre_l = (unsigned int)(refcyc_per_req_delivery_pre_l
057fc695e934a7 Jun Lei            2019-07-08  1495  			  * dml_pow(2, 10));
057fc695e934a7 Jun Lei            2019-07-08  1496  	disp_ttu_regs->refcyc_per_req_delivery_l = (unsigned int)(refcyc_per_req_delivery_l
057fc695e934a7 Jun Lei            2019-07-08  1497  			  * dml_pow(2, 10));
057fc695e934a7 Jun Lei            2019-07-08  1498  	disp_ttu_regs->refcyc_per_req_delivery_pre_c = (unsigned int)(refcyc_per_req_delivery_pre_c
057fc695e934a7 Jun Lei            2019-07-08  1499  			  * dml_pow(2, 10));
057fc695e934a7 Jun Lei            2019-07-08  1500  	disp_ttu_regs->refcyc_per_req_delivery_c = (unsigned int)(refcyc_per_req_delivery_c
057fc695e934a7 Jun Lei            2019-07-08  1501  			  * dml_pow(2, 10));
057fc695e934a7 Jun Lei            2019-07-08  1502  	disp_ttu_regs->refcyc_per_req_delivery_pre_cur0 =
057fc695e934a7 Jun Lei            2019-07-08  1503  			  (unsigned int)(refcyc_per_req_delivery_pre_cur0 * dml_pow(2, 10));
057fc695e934a7 Jun Lei            2019-07-08  1504  	disp_ttu_regs->refcyc_per_req_delivery_cur0 = (unsigned int)(refcyc_per_req_delivery_cur0
057fc695e934a7 Jun Lei            2019-07-08  1505  			  * dml_pow(2, 10));
057fc695e934a7 Jun Lei            2019-07-08  1506  	disp_ttu_regs->refcyc_per_req_delivery_pre_cur1 =
057fc695e934a7 Jun Lei            2019-07-08  1507  			  (unsigned int)(refcyc_per_req_delivery_pre_cur1 * dml_pow(2, 10));
057fc695e934a7 Jun Lei            2019-07-08  1508  	disp_ttu_regs->refcyc_per_req_delivery_cur1 = (unsigned int)(refcyc_per_req_delivery_cur1
057fc695e934a7 Jun Lei            2019-07-08  1509  			  * dml_pow(2, 10));
057fc695e934a7 Jun Lei            2019-07-08  1510  	disp_ttu_regs->qos_level_low_wm = 0;
057fc695e934a7 Jun Lei            2019-07-08  1511  	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
057fc695e934a7 Jun Lei            2019-07-08  1512  	disp_ttu_regs->qos_level_high_wm = (unsigned int) (4.0 * (double) htotal
057fc695e934a7 Jun Lei            2019-07-08  1513  			* ref_freq_to_pix_freq);
057fc695e934a7 Jun Lei            2019-07-08  1514  	/*ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));*/
057fc695e934a7 Jun Lei            2019-07-08  1515  
057fc695e934a7 Jun Lei            2019-07-08  1516  	disp_ttu_regs->qos_level_flip = 14;
057fc695e934a7 Jun Lei            2019-07-08  1517  	disp_ttu_regs->qos_level_fixed_l = 8;
057fc695e934a7 Jun Lei            2019-07-08  1518  	disp_ttu_regs->qos_level_fixed_c = 8;
057fc695e934a7 Jun Lei            2019-07-08  1519  	disp_ttu_regs->qos_level_fixed_cur0 = 8;
057fc695e934a7 Jun Lei            2019-07-08  1520  	disp_ttu_regs->qos_ramp_disable_l = 0;
057fc695e934a7 Jun Lei            2019-07-08  1521  	disp_ttu_regs->qos_ramp_disable_c = 0;
057fc695e934a7 Jun Lei            2019-07-08  1522  	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
057fc695e934a7 Jun Lei            2019-07-08  1523  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1524  	disp_ttu_regs->min_ttu_vblank = (unsigned int)(min_ttu_vblank * refclk_freq_in_mhz);
057fc695e934a7 Jun Lei            2019-07-08  1525  	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
057fc695e934a7 Jun Lei            2019-07-08  1526  
4768349e8885a1 Harry Wentland     2021-09-08  1527  	print__ttu_regs_st(mode_lib, disp_ttu_regs);
4768349e8885a1 Harry Wentland     2021-09-08  1528  	print__dlg_regs_st(mode_lib, disp_dlg_regs);
057fc695e934a7 Jun Lei            2019-07-08  1529  }
057fc695e934a7 Jun Lei            2019-07-08  1530  

:::::: The code at line 1400 was first introduced by commit
:::::: 057fc695e934a77bae0c6c7f3be01251774b61cf drm/amd/display: support "dummy pstate"

:::::: TO: Jun Lei <Jun.Lei@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
