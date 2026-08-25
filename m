Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7203157A5A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 00:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787617901; cv=none; b=fs3sXqMtttWscCY/+02h5rBTZfx2P4YoQCQ3CH+H3zv5QPq7YY+3SqV9CD/Dt5PP+tLOFbvE9zAz/2vRyHU+qEZtI/tBWJBD2a07tdGaqt0MpXCW5vc6IbJxATK95aFTVte3nZ+7JLk9EyCR3iErnDS5FFC9AZc8OaIRv96M//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787617901; c=relaxed/simple;
	bh=EZHLcsKMziLJt6quSGVpvJD4dGj1r1a421sTZH3Qzgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HXSViuZhTLxGaSWA0kiUDFq+rjGephETRVU5McgrsIICpwJSIrHkcpgnbH4L0TFpqAHJ/mNNAhTHc/AZ4ncdakUV7Fk2dmXKDxhLW9UF61kEJSfYjm0XjrLDvYe8/J5z3uhPhN71JDijdiQp0F6jpV8eiKfajAkt8cemiJyY4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bm6DDtib; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bm6DDtib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787617897; x=1819153897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZHLcsKMziLJt6quSGVpvJD4dGj1r1a421sTZH3Qzgc=;
  b=Bm6DDtib0ynbqDgw2BeYWIk8NEO6cSe+fzR1yFnv7l+Ji9InACTiqZlJ
   qg9OfNLFQWd77fFsfZkg1/bGBOdKBn5XcWRnFBs+DXGrtEnorB0JuiMa+
   EVyj3CtTZ4dZ0C8XUbHItFo9PjK4ftxL7MYXp3mUY5+MXNNnSHbBBPl0i
   74ZOM7JXUQTpX4KfEJBU97mBHEGVLc8SKx5ShGbnr0cULcJ6YyBM5YZ8o
   ahaDGRaILqpwxYKExGOULGg5spfkdjSzgiBULJxM41PqMZa8hdBPpvoqW
   4Dhj/ECxtiADkhfGeCQ9NHDUvugiXij0Jogv1LWnnGSqyLUxrGAUm3H3X
   Q==;
X-CSE-ConnectionGUID: 7Kgk6QTATEaV9EKjsjaFsA==
X-CSE-MsgGUID: zmi4swoBQZCQYUWDHQGPqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99603599"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="99603599"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 17:31:36 -0700
X-CSE-ConnectionGUID: 69zr6cw3TteJLu9DVUjHIg==
X-CSE-MsgGUID: AXmLnS2HSTqjAlraaYaH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="272353390"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Aug 2026 17:31:30 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyf4T-000000004g7-2t8Q;
	Tue, 25 Aug 2026 00:31:22 +0000
Date: Tue, 25 Aug 2026 08:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Gaghik Khachatrian <gaghik.khachatrian@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Subject: 
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/displ?=
 =?us-ascii?Q?ay=5Frq=5Fdlg=5Fcalc=5F20.c:1399?=
 dml20_rq_dlg_get_dlg_params() warn: inconsistent indenting
Message-ID: <202608250822.933GTnMQ-lkp@intel.com>
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
config: i386-randconfig-r073-20260821 (https://download.01.org/0day-ci/archive/20260825/202608250822.933GTnMQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1547752eea0f ("drm/amd/display: Fix narrowing boundaries in dml")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608250822.933GTnMQ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1399 dml20_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1400 dml20v2_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:196 _do_calc_rc_params() warn: impossible condition '(bpp >= 6) => (-340282346638528859811704183484-3402823466385288598117041834845 >= 6)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:196 _do_calc_rc_params() warn: impossible condition '(bpp > 4) => (4.000000-6.000000 > 4)'
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:4862 dml20_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:746 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:964 CalculateVMAndRowBytes() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:4982 dml20v2_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:464 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:468 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1430 dml20_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1460 dml20_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1468 dml20_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:464 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:468 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1431 dml20v2_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1461 dml20v2_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1469 dml20v2_rq_dlg_get_dlg_params() warn: inconsistent indenting
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1835 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2702 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5052 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5057 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5077 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:969 CalculateVMAndRowBytes() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1872 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:2655 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: impossible condition '(SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank > 0) => (-inf-999999.000000 > 0)'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:2776 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting

vim +1399 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c

728c06986a4f38 Harry Wentland     2019-02-22   995  
757af27b9fbbba Harry Wentland     2021-09-08   996  //    unsigned int swath_height_c                 = rq_dlg_param->rq_c.swath_height;
757af27b9fbbba Harry Wentland     2021-09-08   997  	swath_width_ub_c = rq_dlg_param->rq_c.swath_width_ub;
757af27b9fbbba Harry Wentland     2021-09-08   998  	//   dpte_bytes_per_row_ub_c        = rq_dlg_param->rq_c.dpte_bytes_per_row_ub;
757af27b9fbbba Harry Wentland     2021-09-08   999  	dpte_groups_per_row_ub_c = rq_dlg_param->rq_c.dpte_groups_per_row_ub;
728c06986a4f38 Harry Wentland     2019-02-22  1000  
757af27b9fbbba Harry Wentland     2021-09-08  1001  	meta_chunks_per_row_ub_l = rq_dlg_param->rq_l.meta_chunks_per_row_ub;
757af27b9fbbba Harry Wentland     2021-09-08  1002  	meta_chunks_per_row_ub_c = rq_dlg_param->rq_c.meta_chunks_per_row_ub;
728c06986a4f38 Harry Wentland     2019-02-22  1003  	vupdate_offset = dst->vupdate_offset;
728c06986a4f38 Harry Wentland     2019-02-22  1004  	vupdate_width = dst->vupdate_width;
728c06986a4f38 Harry Wentland     2019-02-22  1005  	vready_offset = dst->vready_offset;
728c06986a4f38 Harry Wentland     2019-02-22  1006  
728c06986a4f38 Harry Wentland     2019-02-22  1007  	dppclk_delay_subtotal = mode_lib->ip.dppclk_delay_subtotal;
728c06986a4f38 Harry Wentland     2019-02-22  1008  	dispclk_delay_subtotal = mode_lib->ip.dispclk_delay_subtotal;
728c06986a4f38 Harry Wentland     2019-02-22  1009  
728c06986a4f38 Harry Wentland     2019-02-22  1010  	if (scl_enable)
728c06986a4f38 Harry Wentland     2019-02-22  1011  		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl;
728c06986a4f38 Harry Wentland     2019-02-22  1012  	else
728c06986a4f38 Harry Wentland     2019-02-22  1013  		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl_lb_only;
728c06986a4f38 Harry Wentland     2019-02-22  1014  
728c06986a4f38 Harry Wentland     2019-02-22  1015  	dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_cnvc_formatter
728c06986a4f38 Harry Wentland     2019-02-22  1016  			+ src->num_cursors * mode_lib->ip.dppclk_delay_cnvc_cursor;
728c06986a4f38 Harry Wentland     2019-02-22  1017  
728c06986a4f38 Harry Wentland     2019-02-22  1018  	if (dout->dsc_enable) {
728c06986a4f38 Harry Wentland     2019-02-22  1019  		double dsc_delay = get_dsc_delay(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
728c06986a4f38 Harry Wentland     2019-02-22  1020  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1021  		dispclk_delay_subtotal += (unsigned int)dsc_delay;
728c06986a4f38 Harry Wentland     2019-02-22  1022  	}
728c06986a4f38 Harry Wentland     2019-02-22  1023  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1024  	pixel_rate_delay_subtotal = (unsigned int)(dppclk_delay_subtotal * pclk_freq_in_mhz / dppclk_freq_in_mhz
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1025  			+ dispclk_delay_subtotal * pclk_freq_in_mhz / dispclk_freq_in_mhz);
728c06986a4f38 Harry Wentland     2019-02-22  1026  
728c06986a4f38 Harry Wentland     2019-02-22  1027  	vstartup_start = dst->vstartup_start;
728c06986a4f38 Harry Wentland     2019-02-22  1028  	if (interlaced) {
728c06986a4f38 Harry Wentland     2019-02-22  1029  		if (vstartup_start / 2.0
728c06986a4f38 Harry Wentland     2019-02-22  1030  				- (double) (vready_offset + vupdate_width + vupdate_offset) / htotal
728c06986a4f38 Harry Wentland     2019-02-22  1031  				<= vblank_end / 2.0)
728c06986a4f38 Harry Wentland     2019-02-22  1032  			disp_dlg_regs->vready_after_vcount0 = 1;
728c06986a4f38 Harry Wentland     2019-02-22  1033  		else
728c06986a4f38 Harry Wentland     2019-02-22  1034  			disp_dlg_regs->vready_after_vcount0 = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1035  	} else {
728c06986a4f38 Harry Wentland     2019-02-22  1036  		if (vstartup_start
728c06986a4f38 Harry Wentland     2019-02-22  1037  				- (double) (vready_offset + vupdate_width + vupdate_offset) / htotal
728c06986a4f38 Harry Wentland     2019-02-22  1038  				<= vblank_end)
728c06986a4f38 Harry Wentland     2019-02-22  1039  			disp_dlg_regs->vready_after_vcount0 = 1;
728c06986a4f38 Harry Wentland     2019-02-22  1040  		else
728c06986a4f38 Harry Wentland     2019-02-22  1041  			disp_dlg_regs->vready_after_vcount0 = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1042  	}
728c06986a4f38 Harry Wentland     2019-02-22  1043  
728c06986a4f38 Harry Wentland     2019-02-22  1044  	// TODO: Where is this coming from?
728c06986a4f38 Harry Wentland     2019-02-22  1045  	if (interlaced)
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1046  		vstartup_start = (unsigned int)(vstartup_start / 2);
728c06986a4f38 Harry Wentland     2019-02-22  1047  
728c06986a4f38 Harry Wentland     2019-02-22  1048  	// TODO: What if this min_vblank doesn't match the value in the dml_config_settings.cpp?
728c06986a4f38 Harry Wentland     2019-02-22  1049  	if (vstartup_start >= min_vblank) {
728c06986a4f38 Harry Wentland     2019-02-22  1050  		dml_print("WARNING: DML_DLG: %s: vblank_start=%d vblank_end=%d\n",
728c06986a4f38 Harry Wentland     2019-02-22  1051  				__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1052  				vblank_start,
728c06986a4f38 Harry Wentland     2019-02-22  1053  				vblank_end);
728c06986a4f38 Harry Wentland     2019-02-22  1054  		dml_print("WARNING: DML_DLG: %s: vstartup_start=%d should be less than min_vblank=%d\n",
728c06986a4f38 Harry Wentland     2019-02-22  1055  				__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1056  				vstartup_start,
728c06986a4f38 Harry Wentland     2019-02-22  1057  				min_vblank);
728c06986a4f38 Harry Wentland     2019-02-22  1058  		min_vblank = vstartup_start + 1;
728c06986a4f38 Harry Wentland     2019-02-22  1059  		dml_print("WARNING: DML_DLG: %s: vstartup_start=%d should be less than min_vblank=%d\n",
728c06986a4f38 Harry Wentland     2019-02-22  1060  				__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1061  				vstartup_start,
728c06986a4f38 Harry Wentland     2019-02-22  1062  				min_vblank);
728c06986a4f38 Harry Wentland     2019-02-22  1063  	}
728c06986a4f38 Harry Wentland     2019-02-22  1064  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1065  	dst_x_after_scaler = (unsigned int)get_dst_x_after_scaler(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1066  	dst_y_after_scaler = (unsigned int)get_dst_y_after_scaler(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
728c06986a4f38 Harry Wentland     2019-02-22  1067  
728c06986a4f38 Harry Wentland     2019-02-22  1068  	dml_print("DML_DLG: %s: htotal                                 = %d\n", __func__, htotal);
728c06986a4f38 Harry Wentland     2019-02-22  1069  	dml_print("DML_DLG: %s: pixel_rate_delay_subtotal              = %d\n",
728c06986a4f38 Harry Wentland     2019-02-22  1070  			__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1071  			pixel_rate_delay_subtotal);
728c06986a4f38 Harry Wentland     2019-02-22  1072  	dml_print("DML_DLG: %s: dst_x_after_scaler                     = %d\n",
728c06986a4f38 Harry Wentland     2019-02-22  1073  			__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1074  			dst_x_after_scaler);
728c06986a4f38 Harry Wentland     2019-02-22  1075  	dml_print("DML_DLG: %s: dst_y_after_scaler                     = %d\n",
728c06986a4f38 Harry Wentland     2019-02-22  1076  			__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1077  			dst_y_after_scaler);
728c06986a4f38 Harry Wentland     2019-02-22  1078  
728c06986a4f38 Harry Wentland     2019-02-22  1079  	// Lwait
728c06986a4f38 Harry Wentland     2019-02-22  1080  	line_wait = mode_lib->soc.urgent_latency_us;
728c06986a4f38 Harry Wentland     2019-02-22  1081  	if (cstate_en)
728c06986a4f38 Harry Wentland     2019-02-22  1082  		line_wait = dml_max(mode_lib->soc.sr_enter_plus_exit_time_us, line_wait);
728c06986a4f38 Harry Wentland     2019-02-22  1083  	if (pstate_en)
728c06986a4f38 Harry Wentland     2019-02-22  1084  		line_wait = dml_max(mode_lib->soc.dram_clock_change_latency_us
728c06986a4f38 Harry Wentland     2019-02-22  1085  						+ mode_lib->soc.urgent_latency_us,
728c06986a4f38 Harry Wentland     2019-02-22  1086  				line_wait);
728c06986a4f38 Harry Wentland     2019-02-22  1087  	line_wait = line_wait / line_time_in_us;
728c06986a4f38 Harry Wentland     2019-02-22  1088  
728c06986a4f38 Harry Wentland     2019-02-22  1089  	dst_y_prefetch = get_dst_y_prefetch(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
728c06986a4f38 Harry Wentland     2019-02-22  1090  	dml_print("DML_DLG: %s: dst_y_prefetch (after rnd) = %3.2f\n", __func__, dst_y_prefetch);
728c06986a4f38 Harry Wentland     2019-02-22  1091  
728c06986a4f38 Harry Wentland     2019-02-22  1092  	dst_y_per_vm_vblank = get_dst_y_per_vm_vblank(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1093  			e2e_pipe_param,
728c06986a4f38 Harry Wentland     2019-02-22  1094  			num_pipes,
728c06986a4f38 Harry Wentland     2019-02-22  1095  			pipe_idx);
728c06986a4f38 Harry Wentland     2019-02-22  1096  	dst_y_per_row_vblank = get_dst_y_per_row_vblank(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1097  			e2e_pipe_param,
728c06986a4f38 Harry Wentland     2019-02-22  1098  			num_pipes,
728c06986a4f38 Harry Wentland     2019-02-22  1099  			pipe_idx);
728c06986a4f38 Harry Wentland     2019-02-22  1100  	dst_y_per_vm_flip = get_dst_y_per_vm_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
728c06986a4f38 Harry Wentland     2019-02-22  1101  	dst_y_per_row_flip = get_dst_y_per_row_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
728c06986a4f38 Harry Wentland     2019-02-22  1102  
728c06986a4f38 Harry Wentland     2019-02-22  1103  	min_dst_y_per_vm_vblank = 8.0;
728c06986a4f38 Harry Wentland     2019-02-22  1104  	min_dst_y_per_row_vblank = 16.0;
728c06986a4f38 Harry Wentland     2019-02-22  1105  
728c06986a4f38 Harry Wentland     2019-02-22  1106  	// magic!
728c06986a4f38 Harry Wentland     2019-02-22  1107  	if (htotal <= 75) {
728c06986a4f38 Harry Wentland     2019-02-22  1108  		min_vblank = 300;
728c06986a4f38 Harry Wentland     2019-02-22  1109  		min_dst_y_per_vm_vblank = 100.0;
728c06986a4f38 Harry Wentland     2019-02-22  1110  		min_dst_y_per_row_vblank = 100.0;
728c06986a4f38 Harry Wentland     2019-02-22  1111  	}
728c06986a4f38 Harry Wentland     2019-02-22  1112  
728c06986a4f38 Harry Wentland     2019-02-22  1113  	dml_print("DML_DLG: %s: dst_y_per_vm_vblank    = %3.2f\n", __func__, dst_y_per_vm_vblank);
728c06986a4f38 Harry Wentland     2019-02-22  1114  	dml_print("DML_DLG: %s: dst_y_per_row_vblank   = %3.2f\n", __func__, dst_y_per_row_vblank);
728c06986a4f38 Harry Wentland     2019-02-22  1115  
728c06986a4f38 Harry Wentland     2019-02-22  1116  	ASSERT(dst_y_per_vm_vblank < min_dst_y_per_vm_vblank);
728c06986a4f38 Harry Wentland     2019-02-22  1117  	ASSERT(dst_y_per_row_vblank < min_dst_y_per_row_vblank);
728c06986a4f38 Harry Wentland     2019-02-22  1118  
728c06986a4f38 Harry Wentland     2019-02-22  1119  	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
728c06986a4f38 Harry Wentland     2019-02-22  1120  	lsw = dst_y_prefetch - (dst_y_per_vm_vblank + dst_y_per_row_vblank);
728c06986a4f38 Harry Wentland     2019-02-22  1121  
728c06986a4f38 Harry Wentland     2019-02-22  1122  	dml_print("DML_DLG: %s: lsw = %3.2f\n", __func__, lsw);
728c06986a4f38 Harry Wentland     2019-02-22  1123  
728c06986a4f38 Harry Wentland     2019-02-22  1124  	vratio_pre_l = get_vratio_prefetch_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
728c06986a4f38 Harry Wentland     2019-02-22  1125  	vratio_pre_c = get_vratio_prefetch_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
728c06986a4f38 Harry Wentland     2019-02-22  1126  
728c06986a4f38 Harry Wentland     2019-02-22  1127  	dml_print("DML_DLG: %s: vratio_pre_l=%3.2f\n", __func__, vratio_pre_l);
728c06986a4f38 Harry Wentland     2019-02-22  1128  	dml_print("DML_DLG: %s: vratio_pre_c=%3.2f\n", __func__, vratio_pre_c);
728c06986a4f38 Harry Wentland     2019-02-22  1129  
728c06986a4f38 Harry Wentland     2019-02-22  1130  	// Active
757af27b9fbbba Harry Wentland     2021-09-08  1131  	req_per_swath_ub_l = rq_dlg_param->rq_l.req_per_swath_ub;
757af27b9fbbba Harry Wentland     2021-09-08  1132  	req_per_swath_ub_c = rq_dlg_param->rq_c.req_per_swath_ub;
757af27b9fbbba Harry Wentland     2021-09-08  1133  	meta_row_height_l = rq_dlg_param->rq_l.meta_row_height;
757af27b9fbbba Harry Wentland     2021-09-08  1134  	meta_row_height_c = rq_dlg_param->rq_c.meta_row_height;
728c06986a4f38 Harry Wentland     2019-02-22  1135  	swath_width_pixels_ub_l = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1136  	swath_width_pixels_ub_c = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1137  	scaler_rec_in_width_l = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1138  	scaler_rec_in_width_c = 0;
757af27b9fbbba Harry Wentland     2021-09-08  1139  	dpte_row_height_l = rq_dlg_param->rq_l.dpte_row_height;
757af27b9fbbba Harry Wentland     2021-09-08  1140  	dpte_row_height_c = rq_dlg_param->rq_c.dpte_row_height;
728c06986a4f38 Harry Wentland     2019-02-22  1141  
4fa0046f11d998 Ivan Lipski        2024-06-07  1142  	swath_width_pixels_ub_l = swath_width_ub_l;
4fa0046f11d998 Ivan Lipski        2024-06-07  1143  	swath_width_pixels_ub_c = swath_width_ub_c;
728c06986a4f38 Harry Wentland     2019-02-22  1144  
728c06986a4f38 Harry Wentland     2019-02-22  1145  	if (htaps_l <= 1)
728c06986a4f38 Harry Wentland     2019-02-22  1146  		min_hratio_fact_l = 2.0;
728c06986a4f38 Harry Wentland     2019-02-22  1147  	else if (htaps_l <= 6) {
728c06986a4f38 Harry Wentland     2019-02-22  1148  		if ((hratio_l * 2.0) > 4.0)
728c06986a4f38 Harry Wentland     2019-02-22  1149  			min_hratio_fact_l = 4.0;
728c06986a4f38 Harry Wentland     2019-02-22  1150  		else
728c06986a4f38 Harry Wentland     2019-02-22  1151  			min_hratio_fact_l = hratio_l * 2.0;
728c06986a4f38 Harry Wentland     2019-02-22  1152  	} else {
728c06986a4f38 Harry Wentland     2019-02-22  1153  		if (hratio_l > 4.0)
728c06986a4f38 Harry Wentland     2019-02-22  1154  			min_hratio_fact_l = 4.0;
728c06986a4f38 Harry Wentland     2019-02-22  1155  		else
728c06986a4f38 Harry Wentland     2019-02-22  1156  			min_hratio_fact_l = hratio_l;
728c06986a4f38 Harry Wentland     2019-02-22  1157  	}
728c06986a4f38 Harry Wentland     2019-02-22  1158  
728c06986a4f38 Harry Wentland     2019-02-22  1159  	hscale_pixel_rate_l = min_hratio_fact_l * dppclk_freq_in_mhz;
728c06986a4f38 Harry Wentland     2019-02-22  1160  
728c06986a4f38 Harry Wentland     2019-02-22  1161  	if (htaps_c <= 1)
728c06986a4f38 Harry Wentland     2019-02-22  1162  		min_hratio_fact_c = 2.0;
728c06986a4f38 Harry Wentland     2019-02-22  1163  	else if (htaps_c <= 6) {
728c06986a4f38 Harry Wentland     2019-02-22  1164  		if ((hratio_c * 2.0) > 4.0)
728c06986a4f38 Harry Wentland     2019-02-22  1165  			min_hratio_fact_c = 4.0;
728c06986a4f38 Harry Wentland     2019-02-22  1166  		else
728c06986a4f38 Harry Wentland     2019-02-22  1167  			min_hratio_fact_c = hratio_c * 2.0;
728c06986a4f38 Harry Wentland     2019-02-22  1168  	} else {
728c06986a4f38 Harry Wentland     2019-02-22  1169  		if (hratio_c > 4.0)
728c06986a4f38 Harry Wentland     2019-02-22  1170  			min_hratio_fact_c = 4.0;
728c06986a4f38 Harry Wentland     2019-02-22  1171  		else
728c06986a4f38 Harry Wentland     2019-02-22  1172  			min_hratio_fact_c = hratio_c;
728c06986a4f38 Harry Wentland     2019-02-22  1173  	}
728c06986a4f38 Harry Wentland     2019-02-22  1174  
728c06986a4f38 Harry Wentland     2019-02-22  1175  	hscale_pixel_rate_c = min_hratio_fact_c * dppclk_freq_in_mhz;
728c06986a4f38 Harry Wentland     2019-02-22  1176  
728c06986a4f38 Harry Wentland     2019-02-22  1177  	refcyc_per_line_delivery_pre_l = 0.;
728c06986a4f38 Harry Wentland     2019-02-22  1178  	refcyc_per_line_delivery_pre_c = 0.;
728c06986a4f38 Harry Wentland     2019-02-22  1179  	refcyc_per_line_delivery_l = 0.;
728c06986a4f38 Harry Wentland     2019-02-22  1180  	refcyc_per_line_delivery_c = 0.;
728c06986a4f38 Harry Wentland     2019-02-22  1181  
728c06986a4f38 Harry Wentland     2019-02-22  1182  	refcyc_per_req_delivery_pre_l = 0.;
728c06986a4f38 Harry Wentland     2019-02-22  1183  	refcyc_per_req_delivery_pre_c = 0.;
728c06986a4f38 Harry Wentland     2019-02-22  1184  	refcyc_per_req_delivery_l = 0.;
728c06986a4f38 Harry Wentland     2019-02-22  1185  	refcyc_per_req_delivery_c = 0.;
728c06986a4f38 Harry Wentland     2019-02-22  1186  
728c06986a4f38 Harry Wentland     2019-02-22  1187  	full_recout_width = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1188  	// In ODM
728c06986a4f38 Harry Wentland     2019-02-22  1189  	if (src->is_hsplit) {
728c06986a4f38 Harry Wentland     2019-02-22  1190  		// This "hack"  is only allowed (and valid) for MPC combine. In ODM
728c06986a4f38 Harry Wentland     2019-02-22  1191  		// combine, you MUST specify the full_recout_width...according to Oswin
728c06986a4f38 Harry Wentland     2019-02-22  1192  		if (dst->full_recout_width == 0 && !dst->odm_combine) {
728c06986a4f38 Harry Wentland     2019-02-22  1193  			dml_print("DML_DLG: %s: Warning: full_recout_width not set in hsplit mode\n",
728c06986a4f38 Harry Wentland     2019-02-22  1194  					__func__);
728c06986a4f38 Harry Wentland     2019-02-22  1195  			full_recout_width = dst->recout_width * 2; // assume half split for dcn1
728c06986a4f38 Harry Wentland     2019-02-22  1196  		} else
728c06986a4f38 Harry Wentland     2019-02-22  1197  			full_recout_width = dst->full_recout_width;
728c06986a4f38 Harry Wentland     2019-02-22  1198  	} else
728c06986a4f38 Harry Wentland     2019-02-22  1199  		full_recout_width = dst->recout_width;
728c06986a4f38 Harry Wentland     2019-02-22  1200  
728c06986a4f38 Harry Wentland     2019-02-22  1201  	// As of DCN2, mpc_combine and odm_combine are mutually exclusive
728c06986a4f38 Harry Wentland     2019-02-22  1202  	refcyc_per_line_delivery_pre_l = get_refcyc_per_delivery(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1203  			refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1204  			pclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1205  			dst->odm_combine,
728c06986a4f38 Harry Wentland     2019-02-22  1206  			full_recout_width,
728c06986a4f38 Harry Wentland     2019-02-22  1207  			dst->hactive,
728c06986a4f38 Harry Wentland     2019-02-22  1208  			vratio_pre_l,
728c06986a4f38 Harry Wentland     2019-02-22  1209  			hscale_pixel_rate_l,
728c06986a4f38 Harry Wentland     2019-02-22  1210  			swath_width_pixels_ub_l,
728c06986a4f38 Harry Wentland     2019-02-22  1211  			1); // per line
728c06986a4f38 Harry Wentland     2019-02-22  1212  
728c06986a4f38 Harry Wentland     2019-02-22  1213  	refcyc_per_line_delivery_l = get_refcyc_per_delivery(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1214  			refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1215  			pclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1216  			dst->odm_combine,
728c06986a4f38 Harry Wentland     2019-02-22  1217  			full_recout_width,
728c06986a4f38 Harry Wentland     2019-02-22  1218  			dst->hactive,
728c06986a4f38 Harry Wentland     2019-02-22  1219  			vratio_l,
728c06986a4f38 Harry Wentland     2019-02-22  1220  			hscale_pixel_rate_l,
728c06986a4f38 Harry Wentland     2019-02-22  1221  			swath_width_pixels_ub_l,
728c06986a4f38 Harry Wentland     2019-02-22  1222  			1); // per line
728c06986a4f38 Harry Wentland     2019-02-22  1223  
728c06986a4f38 Harry Wentland     2019-02-22  1224  	dml_print("DML_DLG: %s: full_recout_width              = %d\n",
728c06986a4f38 Harry Wentland     2019-02-22  1225  			__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1226  			full_recout_width);
728c06986a4f38 Harry Wentland     2019-02-22  1227  	dml_print("DML_DLG: %s: hscale_pixel_rate_l            = %3.2f\n",
728c06986a4f38 Harry Wentland     2019-02-22  1228  			__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1229  			hscale_pixel_rate_l);
728c06986a4f38 Harry Wentland     2019-02-22  1230  	dml_print("DML_DLG: %s: refcyc_per_line_delivery_pre_l = %3.2f\n",
728c06986a4f38 Harry Wentland     2019-02-22  1231  			__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1232  			refcyc_per_line_delivery_pre_l);
728c06986a4f38 Harry Wentland     2019-02-22  1233  	dml_print("DML_DLG: %s: refcyc_per_line_delivery_l     = %3.2f\n",
728c06986a4f38 Harry Wentland     2019-02-22  1234  			__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1235  			refcyc_per_line_delivery_l);
728c06986a4f38 Harry Wentland     2019-02-22  1236  
728c06986a4f38 Harry Wentland     2019-02-22  1237  	if (dual_plane) {
728c06986a4f38 Harry Wentland     2019-02-22  1238  		refcyc_per_line_delivery_pre_c = get_refcyc_per_delivery(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1239  				refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1240  				pclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1241  				dst->odm_combine,
728c06986a4f38 Harry Wentland     2019-02-22  1242  				full_recout_width,
728c06986a4f38 Harry Wentland     2019-02-22  1243  				dst->hactive,
728c06986a4f38 Harry Wentland     2019-02-22  1244  				vratio_pre_c,
728c06986a4f38 Harry Wentland     2019-02-22  1245  				hscale_pixel_rate_c,
728c06986a4f38 Harry Wentland     2019-02-22  1246  				swath_width_pixels_ub_c,
728c06986a4f38 Harry Wentland     2019-02-22  1247  				1); // per line
728c06986a4f38 Harry Wentland     2019-02-22  1248  
728c06986a4f38 Harry Wentland     2019-02-22  1249  		refcyc_per_line_delivery_c = get_refcyc_per_delivery(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1250  				refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1251  				pclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1252  				dst->odm_combine,
728c06986a4f38 Harry Wentland     2019-02-22  1253  				full_recout_width,
728c06986a4f38 Harry Wentland     2019-02-22  1254  				dst->hactive,
728c06986a4f38 Harry Wentland     2019-02-22  1255  				vratio_c,
728c06986a4f38 Harry Wentland     2019-02-22  1256  				hscale_pixel_rate_c,
728c06986a4f38 Harry Wentland     2019-02-22  1257  				swath_width_pixels_ub_c,
728c06986a4f38 Harry Wentland     2019-02-22  1258  				1);  // per line
728c06986a4f38 Harry Wentland     2019-02-22  1259  
728c06986a4f38 Harry Wentland     2019-02-22  1260  		dml_print("DML_DLG: %s: refcyc_per_line_delivery_pre_c = %3.2f\n",
728c06986a4f38 Harry Wentland     2019-02-22  1261  				__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1262  				refcyc_per_line_delivery_pre_c);
728c06986a4f38 Harry Wentland     2019-02-22  1263  		dml_print("DML_DLG: %s: refcyc_per_line_delivery_c     = %3.2f\n",
728c06986a4f38 Harry Wentland     2019-02-22  1264  				__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1265  				refcyc_per_line_delivery_c);
728c06986a4f38 Harry Wentland     2019-02-22  1266  	}
728c06986a4f38 Harry Wentland     2019-02-22  1267  
728c06986a4f38 Harry Wentland     2019-02-22  1268  	// TTU - Luma / Chroma
728c06986a4f38 Harry Wentland     2019-02-22  1269  	if (access_dir) {  // vertical access
728c06986a4f38 Harry Wentland     2019-02-22  1270  		scaler_rec_in_width_l = vp_height_l;
728c06986a4f38 Harry Wentland     2019-02-22  1271  		scaler_rec_in_width_c = vp_height_c;
728c06986a4f38 Harry Wentland     2019-02-22  1272  	} else {
728c06986a4f38 Harry Wentland     2019-02-22  1273  		scaler_rec_in_width_l = vp_width_l;
728c06986a4f38 Harry Wentland     2019-02-22  1274  		scaler_rec_in_width_c = vp_width_c;
728c06986a4f38 Harry Wentland     2019-02-22  1275  	}
728c06986a4f38 Harry Wentland     2019-02-22  1276  
728c06986a4f38 Harry Wentland     2019-02-22  1277  	refcyc_per_req_delivery_pre_l = get_refcyc_per_delivery(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1278  			refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1279  			pclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1280  			dst->odm_combine,
728c06986a4f38 Harry Wentland     2019-02-22  1281  			full_recout_width,
728c06986a4f38 Harry Wentland     2019-02-22  1282  			dst->hactive,
728c06986a4f38 Harry Wentland     2019-02-22  1283  			vratio_pre_l,
728c06986a4f38 Harry Wentland     2019-02-22  1284  			hscale_pixel_rate_l,
728c06986a4f38 Harry Wentland     2019-02-22  1285  			scaler_rec_in_width_l,
728c06986a4f38 Harry Wentland     2019-02-22  1286  			req_per_swath_ub_l);  // per req
728c06986a4f38 Harry Wentland     2019-02-22  1287  	refcyc_per_req_delivery_l = get_refcyc_per_delivery(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1288  			refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1289  			pclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1290  			dst->odm_combine,
728c06986a4f38 Harry Wentland     2019-02-22  1291  			full_recout_width,
728c06986a4f38 Harry Wentland     2019-02-22  1292  			dst->hactive,
728c06986a4f38 Harry Wentland     2019-02-22  1293  			vratio_l,
728c06986a4f38 Harry Wentland     2019-02-22  1294  			hscale_pixel_rate_l,
728c06986a4f38 Harry Wentland     2019-02-22  1295  			scaler_rec_in_width_l,
728c06986a4f38 Harry Wentland     2019-02-22  1296  			req_per_swath_ub_l);  // per req
728c06986a4f38 Harry Wentland     2019-02-22  1297  
728c06986a4f38 Harry Wentland     2019-02-22  1298  	dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_l = %3.2f\n",
728c06986a4f38 Harry Wentland     2019-02-22  1299  			__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1300  			refcyc_per_req_delivery_pre_l);
728c06986a4f38 Harry Wentland     2019-02-22  1301  	dml_print("DML_DLG: %s: refcyc_per_req_delivery_l     = %3.2f\n",
728c06986a4f38 Harry Wentland     2019-02-22  1302  			__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1303  			refcyc_per_req_delivery_l);
728c06986a4f38 Harry Wentland     2019-02-22  1304  
728c06986a4f38 Harry Wentland     2019-02-22  1305  	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1306  	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1307  
728c06986a4f38 Harry Wentland     2019-02-22  1308  	if (dual_plane) {
728c06986a4f38 Harry Wentland     2019-02-22  1309  		refcyc_per_req_delivery_pre_c = get_refcyc_per_delivery(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1310  				refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1311  				pclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1312  				dst->odm_combine,
728c06986a4f38 Harry Wentland     2019-02-22  1313  				full_recout_width,
728c06986a4f38 Harry Wentland     2019-02-22  1314  				dst->hactive,
728c06986a4f38 Harry Wentland     2019-02-22  1315  				vratio_pre_c,
728c06986a4f38 Harry Wentland     2019-02-22  1316  				hscale_pixel_rate_c,
728c06986a4f38 Harry Wentland     2019-02-22  1317  				scaler_rec_in_width_c,
728c06986a4f38 Harry Wentland     2019-02-22  1318  				req_per_swath_ub_c);  // per req
728c06986a4f38 Harry Wentland     2019-02-22  1319  		refcyc_per_req_delivery_c = get_refcyc_per_delivery(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1320  				refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1321  				pclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1322  				dst->odm_combine,
728c06986a4f38 Harry Wentland     2019-02-22  1323  				full_recout_width,
728c06986a4f38 Harry Wentland     2019-02-22  1324  				dst->hactive,
728c06986a4f38 Harry Wentland     2019-02-22  1325  				vratio_c,
728c06986a4f38 Harry Wentland     2019-02-22  1326  				hscale_pixel_rate_c,
728c06986a4f38 Harry Wentland     2019-02-22  1327  				scaler_rec_in_width_c,
728c06986a4f38 Harry Wentland     2019-02-22  1328  				req_per_swath_ub_c);  // per req
728c06986a4f38 Harry Wentland     2019-02-22  1329  
728c06986a4f38 Harry Wentland     2019-02-22  1330  		dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_c = %3.2f\n",
728c06986a4f38 Harry Wentland     2019-02-22  1331  				__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1332  				refcyc_per_req_delivery_pre_c);
728c06986a4f38 Harry Wentland     2019-02-22  1333  		dml_print("DML_DLG: %s: refcyc_per_req_delivery_c     = %3.2f\n",
728c06986a4f38 Harry Wentland     2019-02-22  1334  				__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1335  				refcyc_per_req_delivery_c);
728c06986a4f38 Harry Wentland     2019-02-22  1336  
728c06986a4f38 Harry Wentland     2019-02-22  1337  		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1338  		ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1339  	}
728c06986a4f38 Harry Wentland     2019-02-22  1340  
728c06986a4f38 Harry Wentland     2019-02-22  1341  	// TTU - Cursor
728c06986a4f38 Harry Wentland     2019-02-22  1342  	refcyc_per_req_delivery_pre_cur0 = 0.0;
728c06986a4f38 Harry Wentland     2019-02-22  1343  	refcyc_per_req_delivery_cur0 = 0.0;
728c06986a4f38 Harry Wentland     2019-02-22  1344  	if (src->num_cursors > 0) {
728c06986a4f38 Harry Wentland     2019-02-22  1345  		calculate_ttu_cursor(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1346  				&refcyc_per_req_delivery_pre_cur0,
728c06986a4f38 Harry Wentland     2019-02-22  1347  				&refcyc_per_req_delivery_cur0,
728c06986a4f38 Harry Wentland     2019-02-22  1348  				refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1349  				ref_freq_to_pix_freq,
728c06986a4f38 Harry Wentland     2019-02-22  1350  				hscale_pixel_rate_l,
728c06986a4f38 Harry Wentland     2019-02-22  1351  				scl->hscl_ratio,
728c06986a4f38 Harry Wentland     2019-02-22  1352  				vratio_pre_l,
728c06986a4f38 Harry Wentland     2019-02-22  1353  				vratio_l,
728c06986a4f38 Harry Wentland     2019-02-22  1354  				src->cur0_src_width,
728c06986a4f38 Harry Wentland     2019-02-22  1355  				(enum cursor_bpp)(src->cur0_bpp));
728c06986a4f38 Harry Wentland     2019-02-22  1356  	}
728c06986a4f38 Harry Wentland     2019-02-22  1357  
728c06986a4f38 Harry Wentland     2019-02-22  1358  	refcyc_per_req_delivery_pre_cur1 = 0.0;
728c06986a4f38 Harry Wentland     2019-02-22  1359  	refcyc_per_req_delivery_cur1 = 0.0;
728c06986a4f38 Harry Wentland     2019-02-22  1360  	if (src->num_cursors > 1) {
728c06986a4f38 Harry Wentland     2019-02-22  1361  		calculate_ttu_cursor(mode_lib,
728c06986a4f38 Harry Wentland     2019-02-22  1362  				&refcyc_per_req_delivery_pre_cur1,
728c06986a4f38 Harry Wentland     2019-02-22  1363  				&refcyc_per_req_delivery_cur1,
728c06986a4f38 Harry Wentland     2019-02-22  1364  				refclk_freq_in_mhz,
728c06986a4f38 Harry Wentland     2019-02-22  1365  				ref_freq_to_pix_freq,
728c06986a4f38 Harry Wentland     2019-02-22  1366  				hscale_pixel_rate_l,
728c06986a4f38 Harry Wentland     2019-02-22  1367  				scl->hscl_ratio,
728c06986a4f38 Harry Wentland     2019-02-22  1368  				vratio_pre_l,
728c06986a4f38 Harry Wentland     2019-02-22  1369  				vratio_l,
728c06986a4f38 Harry Wentland     2019-02-22  1370  				src->cur1_src_width,
728c06986a4f38 Harry Wentland     2019-02-22  1371  				(enum cursor_bpp)(src->cur1_bpp));
728c06986a4f38 Harry Wentland     2019-02-22  1372  	}
728c06986a4f38 Harry Wentland     2019-02-22  1373  
728c06986a4f38 Harry Wentland     2019-02-22  1374  	// TTU - Misc
728c06986a4f38 Harry Wentland     2019-02-22  1375  	// all hard-coded
728c06986a4f38 Harry Wentland     2019-02-22  1376  
728c06986a4f38 Harry Wentland     2019-02-22  1377  	// Assignment to register structures
728c06986a4f38 Harry Wentland     2019-02-22  1378  	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1379  	disp_dlg_regs->refcyc_x_after_scaler = (unsigned int)(dst_x_after_scaler * ref_freq_to_pix_freq); // in terms of refclk
728c06986a4f38 Harry Wentland     2019-02-22  1380  	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int) dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1381  	disp_dlg_regs->dst_y_prefetch = (unsigned int)(dst_y_prefetch * dml_pow(2, 2));
728c06986a4f38 Harry Wentland     2019-02-22  1382  	disp_dlg_regs->dst_y_per_vm_vblank = (unsigned int)(dst_y_per_vm_vblank * dml_pow(2, 2));
728c06986a4f38 Harry Wentland     2019-02-22  1383  	disp_dlg_regs->dst_y_per_row_vblank = (unsigned int)(dst_y_per_row_vblank * dml_pow(2, 2));
728c06986a4f38 Harry Wentland     2019-02-22  1384  	disp_dlg_regs->dst_y_per_vm_flip = (unsigned int)(dst_y_per_vm_flip * dml_pow(2, 2));
728c06986a4f38 Harry Wentland     2019-02-22  1385  	disp_dlg_regs->dst_y_per_row_flip = (unsigned int)(dst_y_per_row_flip * dml_pow(2, 2));
728c06986a4f38 Harry Wentland     2019-02-22  1386  
728c06986a4f38 Harry Wentland     2019-02-22  1387  	disp_dlg_regs->vratio_prefetch = (unsigned int)(vratio_pre_l * dml_pow(2, 19));
728c06986a4f38 Harry Wentland     2019-02-22  1388  	disp_dlg_regs->vratio_prefetch_c = (unsigned int)(vratio_pre_c * dml_pow(2, 19));
728c06986a4f38 Harry Wentland     2019-02-22  1389  
728c06986a4f38 Harry Wentland     2019-02-22  1390  	disp_dlg_regs->refcyc_per_pte_group_vblank_l =
728c06986a4f38 Harry Wentland     2019-02-22  1391  			  (unsigned int)(dst_y_per_row_vblank * (double) htotal
728c06986a4f38 Harry Wentland     2019-02-22  1392  					    * ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_l);
728c06986a4f38 Harry Wentland     2019-02-22  1393  	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int) dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1394  
728c06986a4f38 Harry Wentland     2019-02-22  1395  	if (dual_plane) {
728c06986a4f38 Harry Wentland     2019-02-22  1396  			   disp_dlg_regs->refcyc_per_pte_group_vblank_c = (unsigned int)(dst_y_per_row_vblank
728c06986a4f38 Harry Wentland     2019-02-22  1397  							   * (double) htotal * ref_freq_to_pix_freq
728c06986a4f38 Harry Wentland     2019-02-22  1398  							   / (double) dpte_groups_per_row_ub_c);
728c06986a4f38 Harry Wentland     2019-02-22 @1399  		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c
728c06986a4f38 Harry Wentland     2019-02-22  1400  						< (unsigned int) dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1401  	}
728c06986a4f38 Harry Wentland     2019-02-22  1402  
728c06986a4f38 Harry Wentland     2019-02-22  1403  	disp_dlg_regs->refcyc_per_meta_chunk_vblank_l =
728c06986a4f38 Harry Wentland     2019-02-22  1404  			  (unsigned int)(dst_y_per_row_vblank * (double) htotal
728c06986a4f38 Harry Wentland     2019-02-22  1405  					    * ref_freq_to_pix_freq / (double) meta_chunks_per_row_ub_l);
728c06986a4f38 Harry Wentland     2019-02-22  1406  	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int) dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1407  
728c06986a4f38 Harry Wentland     2019-02-22  1408  	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c =
728c06986a4f38 Harry Wentland     2019-02-22  1409  			disp_dlg_regs->refcyc_per_meta_chunk_vblank_l; // dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
728c06986a4f38 Harry Wentland     2019-02-22  1410  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1411  	disp_dlg_regs->refcyc_per_pte_group_flip_l = (unsigned int)((dst_y_per_row_flip * htotal
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1412  			  * ref_freq_to_pix_freq) / dpte_groups_per_row_ub_l);
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1413  	disp_dlg_regs->refcyc_per_meta_chunk_flip_l = (unsigned int)((dst_y_per_row_flip * htotal
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1414  			  * ref_freq_to_pix_freq) / meta_chunks_per_row_ub_l);
728c06986a4f38 Harry Wentland     2019-02-22  1415  
728c06986a4f38 Harry Wentland     2019-02-22  1416  	if (dual_plane) {
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1417  			   disp_dlg_regs->refcyc_per_pte_group_flip_c = (unsigned int)((dst_y_per_row_flip
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1418  							   * htotal * ref_freq_to_pix_freq) / dpte_groups_per_row_ub_c);
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1419  			   disp_dlg_regs->refcyc_per_meta_chunk_flip_c = (unsigned int)((dst_y_per_row_flip
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1420  							   * htotal * ref_freq_to_pix_freq) / meta_chunks_per_row_ub_c);
728c06986a4f38 Harry Wentland     2019-02-22  1421  	}
728c06986a4f38 Harry Wentland     2019-02-22  1422  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1423  	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int)(((double) dpte_row_height_l
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1424  			  / (double) vratio_l * dml_pow(2, 2)));
728c06986a4f38 Harry Wentland     2019-02-22  1425  	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int) dml_pow(2, 17));
728c06986a4f38 Harry Wentland     2019-02-22  1426  
728c06986a4f38 Harry Wentland     2019-02-22  1427  	if (dual_plane) {
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1428  			   disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int)(((double) dpte_row_height_c
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1429  							   / (double) vratio_c * dml_pow(2, 2)));
728c06986a4f38 Harry Wentland     2019-02-22  1430  		if (disp_dlg_regs->dst_y_per_pte_row_nom_c >= (unsigned int) dml_pow(2, 17)) {
728c06986a4f38 Harry Wentland     2019-02-22  1431  			dml_print("DML_DLG: %s: Warning dst_y_per_pte_row_nom_c %u larger than supported by register format U15.2 %u\n",
728c06986a4f38 Harry Wentland     2019-02-22  1432  					__func__,
728c06986a4f38 Harry Wentland     2019-02-22  1433  					disp_dlg_regs->dst_y_per_pte_row_nom_c,
728c06986a4f38 Harry Wentland     2019-02-22  1434  					(unsigned int) dml_pow(2, 17) - 1);
728c06986a4f38 Harry Wentland     2019-02-22  1435  		}
728c06986a4f38 Harry Wentland     2019-02-22  1436  	}
728c06986a4f38 Harry Wentland     2019-02-22  1437  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1438  	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int)(((double) meta_row_height_l
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1439  			  / (double) vratio_l * dml_pow(2, 2)));
728c06986a4f38 Harry Wentland     2019-02-22  1440  	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int) dml_pow(2, 17));
728c06986a4f38 Harry Wentland     2019-02-22  1441  
728c06986a4f38 Harry Wentland     2019-02-22  1442  	disp_dlg_regs->dst_y_per_meta_row_nom_c = disp_dlg_regs->dst_y_per_meta_row_nom_l; // TODO: dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
728c06986a4f38 Harry Wentland     2019-02-22  1443  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1444  	disp_dlg_regs->refcyc_per_pte_group_nom_l = (unsigned int)(((double) dpte_row_height_l
728c06986a4f38 Harry Wentland     2019-02-22  1445  			  / (double) vratio_l * (double) htotal * ref_freq_to_pix_freq
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1446  			  / (double) dpte_groups_per_row_ub_l));
728c06986a4f38 Harry Wentland     2019-02-22  1447  	if (disp_dlg_regs->refcyc_per_pte_group_nom_l >= (unsigned int) dml_pow(2, 23))
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1448  		disp_dlg_regs->refcyc_per_pte_group_nom_l = (unsigned int)(dml_pow(2, 23) - 1);
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1449  	disp_dlg_regs->refcyc_per_meta_chunk_nom_l = (unsigned int)(((double) meta_row_height_l
728c06986a4f38 Harry Wentland     2019-02-22  1450  			  / (double) vratio_l * (double) htotal * ref_freq_to_pix_freq
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1451  			  / (double) meta_chunks_per_row_ub_l));
728c06986a4f38 Harry Wentland     2019-02-22  1452  	if (disp_dlg_regs->refcyc_per_meta_chunk_nom_l >= (unsigned int) dml_pow(2, 23))
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1453  		disp_dlg_regs->refcyc_per_meta_chunk_nom_l = (unsigned int)(dml_pow(2, 23) - 1);
728c06986a4f38 Harry Wentland     2019-02-22  1454  
728c06986a4f38 Harry Wentland     2019-02-22  1455  	if (dual_plane) {
728c06986a4f38 Harry Wentland     2019-02-22  1456  			   disp_dlg_regs->refcyc_per_pte_group_nom_c =
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1457  							   (unsigned int)(((double) dpte_row_height_c / (double) vratio_c
728c06986a4f38 Harry Wentland     2019-02-22  1458  											   * (double) htotal * ref_freq_to_pix_freq
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1459  											   / (double) dpte_groups_per_row_ub_c));
728c06986a4f38 Harry Wentland     2019-02-22  1460  		if (disp_dlg_regs->refcyc_per_pte_group_nom_c >= (unsigned int) dml_pow(2, 23))
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1461  				disp_dlg_regs->refcyc_per_pte_group_nom_c = (unsigned int)(dml_pow(2, 23) - 1);
728c06986a4f38 Harry Wentland     2019-02-22  1462  
728c06986a4f38 Harry Wentland     2019-02-22  1463  		// TODO: Is this the right calculation? Does htotal need to be halved?
728c06986a4f38 Harry Wentland     2019-02-22  1464  			   disp_dlg_regs->refcyc_per_meta_chunk_nom_c =
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1465  							   (unsigned int)(((double) meta_row_height_c / (double) vratio_c
728c06986a4f38 Harry Wentland     2019-02-22  1466  											   * (double) htotal * ref_freq_to_pix_freq
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1467  											   / (double) meta_chunks_per_row_ub_c));
728c06986a4f38 Harry Wentland     2019-02-22  1468  		if (disp_dlg_regs->refcyc_per_meta_chunk_nom_c >= (unsigned int) dml_pow(2, 23))
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1469  				disp_dlg_regs->refcyc_per_meta_chunk_nom_c = (unsigned int)(dml_pow(2, 23) - 1);
728c06986a4f38 Harry Wentland     2019-02-22  1470  	}
728c06986a4f38 Harry Wentland     2019-02-22  1471  
728c06986a4f38 Harry Wentland     2019-02-22  1472  	disp_dlg_regs->refcyc_per_line_delivery_pre_l = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_l,
728c06986a4f38 Harry Wentland     2019-02-22  1473  			1);
728c06986a4f38 Harry Wentland     2019-02-22  1474  	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int) dml_floor(refcyc_per_line_delivery_l,
728c06986a4f38 Harry Wentland     2019-02-22  1475  			1);
728c06986a4f38 Harry Wentland     2019-02-22  1476  	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int) dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1477  	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int) dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1478  
728c06986a4f38 Harry Wentland     2019-02-22  1479  	disp_dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_c,
728c06986a4f38 Harry Wentland     2019-02-22  1480  			1);
728c06986a4f38 Harry Wentland     2019-02-22  1481  	disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int) dml_floor(refcyc_per_line_delivery_c,
728c06986a4f38 Harry Wentland     2019-02-22  1482  			1);
728c06986a4f38 Harry Wentland     2019-02-22  1483  	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int) dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1484  	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int) dml_pow(2, 13));
728c06986a4f38 Harry Wentland     2019-02-22  1485  
728c06986a4f38 Harry Wentland     2019-02-22  1486  	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
728c06986a4f38 Harry Wentland     2019-02-22  1487  	disp_dlg_regs->dst_y_offset_cur0 = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1488  	disp_dlg_regs->chunk_hdl_adjust_cur1 = 3;
728c06986a4f38 Harry Wentland     2019-02-22  1489  	disp_dlg_regs->dst_y_offset_cur1 = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1490  
728c06986a4f38 Harry Wentland     2019-02-22  1491  	disp_dlg_regs->dst_y_delta_drq_limit = 0x7fff; // off
728c06986a4f38 Harry Wentland     2019-02-22  1492  
728c06986a4f38 Harry Wentland     2019-02-22  1493  	disp_ttu_regs->refcyc_per_req_delivery_pre_l = (unsigned int)(refcyc_per_req_delivery_pre_l
728c06986a4f38 Harry Wentland     2019-02-22  1494  			  * dml_pow(2, 10));
728c06986a4f38 Harry Wentland     2019-02-22  1495  	disp_ttu_regs->refcyc_per_req_delivery_l = (unsigned int)(refcyc_per_req_delivery_l
728c06986a4f38 Harry Wentland     2019-02-22  1496  			  * dml_pow(2, 10));
728c06986a4f38 Harry Wentland     2019-02-22  1497  	disp_ttu_regs->refcyc_per_req_delivery_pre_c = (unsigned int)(refcyc_per_req_delivery_pre_c
728c06986a4f38 Harry Wentland     2019-02-22  1498  			  * dml_pow(2, 10));
728c06986a4f38 Harry Wentland     2019-02-22  1499  	disp_ttu_regs->refcyc_per_req_delivery_c = (unsigned int)(refcyc_per_req_delivery_c
728c06986a4f38 Harry Wentland     2019-02-22  1500  			  * dml_pow(2, 10));
728c06986a4f38 Harry Wentland     2019-02-22  1501  	disp_ttu_regs->refcyc_per_req_delivery_pre_cur0 =
728c06986a4f38 Harry Wentland     2019-02-22  1502  			  (unsigned int)(refcyc_per_req_delivery_pre_cur0 * dml_pow(2, 10));
728c06986a4f38 Harry Wentland     2019-02-22  1503  	disp_ttu_regs->refcyc_per_req_delivery_cur0 = (unsigned int)(refcyc_per_req_delivery_cur0
728c06986a4f38 Harry Wentland     2019-02-22  1504  			  * dml_pow(2, 10));
728c06986a4f38 Harry Wentland     2019-02-22  1505  	disp_ttu_regs->refcyc_per_req_delivery_pre_cur1 =
728c06986a4f38 Harry Wentland     2019-02-22  1506  			  (unsigned int)(refcyc_per_req_delivery_pre_cur1 * dml_pow(2, 10));
728c06986a4f38 Harry Wentland     2019-02-22  1507  	disp_ttu_regs->refcyc_per_req_delivery_cur1 = (unsigned int)(refcyc_per_req_delivery_cur1
728c06986a4f38 Harry Wentland     2019-02-22  1508  			  * dml_pow(2, 10));
728c06986a4f38 Harry Wentland     2019-02-22  1509  	disp_ttu_regs->qos_level_low_wm = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1510  	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
728c06986a4f38 Harry Wentland     2019-02-22  1511  	disp_ttu_regs->qos_level_high_wm = (unsigned int) (4.0 * (double) htotal
728c06986a4f38 Harry Wentland     2019-02-22  1512  			* ref_freq_to_pix_freq);
728c06986a4f38 Harry Wentland     2019-02-22  1513  	/*ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));*/
728c06986a4f38 Harry Wentland     2019-02-22  1514  
728c06986a4f38 Harry Wentland     2019-02-22  1515  	disp_ttu_regs->qos_level_flip = 14;
728c06986a4f38 Harry Wentland     2019-02-22  1516  	disp_ttu_regs->qos_level_fixed_l = 8;
728c06986a4f38 Harry Wentland     2019-02-22  1517  	disp_ttu_regs->qos_level_fixed_c = 8;
728c06986a4f38 Harry Wentland     2019-02-22  1518  	disp_ttu_regs->qos_level_fixed_cur0 = 8;
728c06986a4f38 Harry Wentland     2019-02-22  1519  	disp_ttu_regs->qos_ramp_disable_l = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1520  	disp_ttu_regs->qos_ramp_disable_c = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1521  	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
728c06986a4f38 Harry Wentland     2019-02-22  1522  
1547752eea0ff5 Gaghik Khachatrian 2026-04-14  1523  	disp_ttu_regs->min_ttu_vblank = (unsigned int)(min_ttu_vblank * refclk_freq_in_mhz);
728c06986a4f38 Harry Wentland     2019-02-22  1524  	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
728c06986a4f38 Harry Wentland     2019-02-22  1525  
4768349e8885a1 Harry Wentland     2021-09-08  1526  	print__ttu_regs_st(mode_lib, disp_ttu_regs);
4768349e8885a1 Harry Wentland     2021-09-08  1527  	print__dlg_regs_st(mode_lib, disp_dlg_regs);
728c06986a4f38 Harry Wentland     2019-02-22  1528  }
728c06986a4f38 Harry Wentland     2019-02-22  1529  

:::::: The code at line 1399 was first introduced by commit
:::::: 728c06986a4f386c7ec5e5170716e30b610c6d32 drm/amd/display: Add DCN2 changes to DML

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
