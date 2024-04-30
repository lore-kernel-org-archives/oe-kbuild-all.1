Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B47DDA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 03:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714446370; cv=none; b=YPo89/rPPSOFg9zxTcjkF5qsRfCULwLxd8WdmMC5g0fZ/qPAxHgf467sm4LthawiWCX2BvKtyfha8KWMjO8HWsaJA0G63/AmuvoqsPL7ENWBQjUDrizy2/IfHlPzs3RcdIj0GX/EfWyCQGdmWP9YYf2tIS4Q6ho1zrEE2pRC778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714446370; c=relaxed/simple;
	bh=vJj7JnlLjU9mT4l8V/NYRqX/7DVhY4DcTrnitPKjibo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FnHYnWXkYQ2KWrnK60AB9SVsrpvoKuNhzYeiImRxXlOPmQdAnMLEfK1QdHItHSQTc1oDGPxQdVQUBCosPwIWBoCNNbbT8jOyGVEHTWk+ZziPtdtLYiTxYqtgfaPBkGyHckX8dGf3OmGRviOxXqYiB0d4vNoFWyYz+SIn0i4Palo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUVJU0lO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUVJU0lO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714446369; x=1745982369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJj7JnlLjU9mT4l8V/NYRqX/7DVhY4DcTrnitPKjibo=;
  b=GUVJU0lObd3SDtMEmDK99UfW06DzWxO7KWyLj4pCBATIaBt+WfezqSM/
   MrphZwdJwnKAPHNre3BLOfhlNifGtV6/XPFwbpaxE45dI4Fu0EBoO/AOq
   9UGmG6li9xkG/vWzMuL3QDWOwO8+PT7afyap+/RbScrDVowbBSSknCkv/
   NPrvD/U1B7+PctY93hsTcKM54dkCPgBy2l4dwJh1Ei62XEeR7p8KLwwIN
   Q8FCtlh1bINBfDFtFbF+0oESXGG1I4RGnNcSMMDlpHAOhg8515o/n3jLS
   tXWYVjgnCYJ2QB21mLWfJb/xikO5CneD3iT4/3QX6q90PWK05gyyLYnm8
   w==;
X-CSE-ConnectionGUID: fzM6YIjrTFCFCgV4fjv7ww==
X-CSE-MsgGUID: pQpFp2fvQj2VDCqAN799Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13957341"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13957341"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 20:06:08 -0700
X-CSE-ConnectionGUID: 8aGn4zL9SCSdwfHzVi6g/Q==
X-CSE-MsgGUID: a8ObQvR+QEqRrfo3xkn6zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="63790089"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2024 20:06:08 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1doi-0007f2-2Z;
	Tue, 30 Apr 2024 03:06:04 +0000
Date: Tue, 30 Apr 2024 11:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9291/9390]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:1762:undefined
 reference to `__aeabi_ul2d'
Message-ID: <202404301003.CUJr5aCS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b0a2c79c6f3590b74742cbbc76687014d47972d8
commit: 9be985f2c1ab8477cc28a0a28ab96e4c092df40e [9291/9390] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: arm-randconfig-r034-20230430 (https://download.01.org/0day-ci/archive/20240430/202404301003.CUJr5aCS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301003.CUJr5aCS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301003.CUJr5aCS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.o: in function `dcn20_populate_dml_pipes_from_context':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:1668:(.text+0x68ec): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:1669:(.text+0x693c): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:1670:(.text+0x6988): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:1671:(.text+0x69d4): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.o: in function `pipe_ctx_to_e2e_pipe_params':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.c:399:(.text+0x149c): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.o:drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.c:400: more undefined references to `__aeabi_l2d' follow
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.o: in function `optimize_configuration':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.c:140:(.text+0x198c): undefined reference to `__aeabi_d2ulz'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.o: in function `populate_dml_plane_cfg_from_plane_state':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.c:1046:(.text+0x2ebc): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.c:1047:(.text+0x2f10): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.c:1048:(.text+0x2f5c): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.c:1049:(.text+0x2fa8): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o: in function `CalculateVMAndRowBytes':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:1762:(.text+0x3e2d8): undefined reference to `__aeabi_ul2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o: in function `dml_core_mode_support':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:6448:(.text+0x5b324): undefined reference to `__aeabi_ul2d'
>> arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:6581:(.text+0x5b47c): undefined reference to `__aeabi_ul2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:6582:(.text+0x5b538): undefined reference to `__aeabi_ul2d'
>> arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:7770:(.text+0x71838): undefined reference to `__aeabi_d2ulz'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o: in function `dml_core_mode_programming':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:6448:(.text+0x808d8): undefined reference to `__aeabi_ul2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o: in function `CalculateVMAndRowBytes':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:4487:(.text+0x2080c): undefined reference to `__aeabi_ul2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o: in function `dml2_core_shared_mode_support':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:9022:(.text+0x5d4d0): undefined reference to `__aeabi_ul2d'
>> arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:784:(.text+0x5d620): undefined reference to `__aeabi_ul2d'
>> arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:1968:(.text+0x737ac): undefined reference to `__aeabi_d2ulz'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o: in function `dml2_core_shared_mode_programming':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:9022:(.text+0x81634): undefined reference to `__aeabi_ul2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o: in function `dram_bw_kbps_to_uclk_khz':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:18:(.text+0xd4): undefined reference to `__aeabi_ul2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o: in function `build_min_clock_table':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c:90:(.text+0xcb0): undefined reference to `__aeabi_ul2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.o: in function `populate_dml21_plane_config_from_plane_state':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.c:796:(.text+0x208c): undefined reference to `__aeabi_l2d'
>> arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.c:797:(.text+0x20e0): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.c:798:(.text+0x212c): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.c:799:(.text+0x217c): undefined reference to `__aeabi_l2d'


vim +1762 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c

70839da6360500 Aurabindo Pillai 2024-04-19  1755  
70839da6360500 Aurabindo Pillai 2024-04-19  1756  	*p->dpte_row_height_one_row_per_frame = vp_height_dpte_ub;
70839da6360500 Aurabindo Pillai 2024-04-19  1757  	*p->dpte_row_width_ub_one_row_per_frame = (unsigned int)((math_ceil2(((double)p->Pitch * (double)*p->dpte_row_height_one_row_per_frame / (double)*p->PixelPTEReqHeight - 1) / (double)*p->PixelPTEReqWidth, 1) + 1) * (double)*p->PixelPTEReqWidth);
70839da6360500 Aurabindo Pillai 2024-04-19  1758  	*p->PixelPTEBytesPerRow_one_row_per_frame = (unsigned int)((double)*p->dpte_row_width_ub_one_row_per_frame / (double)*p->PixelPTEReqWidth * *p->PTERequestSize);
70839da6360500 Aurabindo Pillai 2024-04-19  1759  	*p->dpte_row_height_linear = 0;
70839da6360500 Aurabindo Pillai 2024-04-19  1760  
70839da6360500 Aurabindo Pillai 2024-04-19  1761  	if (p->SurfaceTiling == dml2_sw_linear) {
70839da6360500 Aurabindo Pillai 2024-04-19 @1762  		*p->dpte_row_height = (unsigned int)(math_min2(128, (double)(1ULL << (unsigned int)math_floor2(math_log((float)(p->PTEBufferSizeInRequests * *p->PixelPTEReqWidth / p->Pitch), 2.0), 1))));
70839da6360500 Aurabindo Pillai 2024-04-19  1763  		*p->dpte_row_width_ub = (unsigned int)(math_ceil2(((double)p->Pitch * (double)*p->dpte_row_height - 1), (double)*p->PixelPTEReqWidth) + *p->PixelPTEReqWidth);
70839da6360500 Aurabindo Pillai 2024-04-19  1764  		*p->PixelPTEBytesPerRow = (unsigned int)((double)*p->dpte_row_width_ub / (double)*p->PixelPTEReqWidth * *p->PTERequestSize);
70839da6360500 Aurabindo Pillai 2024-04-19  1765  
70839da6360500 Aurabindo Pillai 2024-04-19  1766  		// VBA_DELTA, VBA doesn't have programming value for pte row height linear.
70839da6360500 Aurabindo Pillai 2024-04-19  1767  		*p->dpte_row_height_linear = (unsigned int)1 << (unsigned int)math_floor2(math_log((float)(p->PTEBufferSizeInRequests * PixelPTEReqWidth_linear / p->Pitch), 2.0), 1);
70839da6360500 Aurabindo Pillai 2024-04-19  1768  		if (*p->dpte_row_height_linear > 128)
70839da6360500 Aurabindo Pillai 2024-04-19  1769  			*p->dpte_row_height_linear = 128;
70839da6360500 Aurabindo Pillai 2024-04-19  1770  

:::::: The code at line 1762 was first introduced by commit
:::::: 70839da6360500a82e4d5f78499284474cbed7c1 drm/amd/display: Add new DCN401 sources

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
