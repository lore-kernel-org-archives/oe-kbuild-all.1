Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19503859EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 23:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219404; cv=none; b=XoMHhk1R+PD0ftSdVCMiZsmylPwq6qj/M3et6W2nEz1HfF5Ef0Zk0oBQcRn9vOAlLULpJZURehOr4nDAH0GtB4RkW4jzRZXRrdzMlhWEp3hN6LTmTI6D8TmtLsIhSNVgcmEfUytClNIFq23zC4lO86S3InHryFIGi3K7g8tAK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219404; c=relaxed/simple;
	bh=k33w8kK3JxzS/TZGEzu4V0rWmgqRR2+xO0RtVX5v/wc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sdEAUKHRmd+LxgORc1j0eQLLLG+/hBKn3llM4gJfdyVB/drIioLN868jvqzWktWqgZoLcznb/6p1ssJ3Toab68JUSNzPWwzdx55kNwYC9M1hfXtRYzUxKUDQFxCmFo3nwxTGGgWvIkajdGYmQR54Qfg1NjMSq3Pp09r/FvIbKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx+KIEMc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx+KIEMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781219402; x=1812755402;
  h=date:from:to:cc:subject:message-id;
  bh=k33w8kK3JxzS/TZGEzu4V0rWmgqRR2+xO0RtVX5v/wc=;
  b=Wx+KIEMc5oKRwTAiwyyF9hq0aQwGVrUOKh7YgsShdgweAWsyw30QzyYN
   cu41qVs25VA1MlQUHrgLAvmFK0SR5QnBPIRlshBzzDz0Vc1BCq8rcpd6K
   L5UHY9gUmBygxI5fbbC3ZVRT7Wx9EWXwEXxd3KHEnIrz8WV9UWGz7HGAQ
   X06OnF37WFsQnmzdqOTvi/QaJ+tbKtz3jT//cdRJ1Eevc/N9JAuZgwzui
   L5wCCmwxr8ARPNAGs+P9vTmZaZQlmpS9wn0swQWWSr31jGYQG1adUEPQP
   CfNL0ZO9J880EhWVE/M18O0rpMt5xHIg4Zz9vNQKdiGH3bot62Fg6evFR
   A==;
X-CSE-ConnectionGUID: R5zFTa/HT7K9SP8Yt4QPDw==
X-CSE-MsgGUID: QT/0dbNXT+qQIDwrHU8HZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92727524"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92727524"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 16:09:59 -0700
X-CSE-ConnectionGUID: gFrqNGeHQZ6S34/+B3S5Gw==
X-CSE-MsgGUID: wbTO2dMJSDS3cdzU9Fj8EQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 16:09:57 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXoX4-00000000NzF-46cA;
	Thu, 11 Jun 2026 23:09:54 +0000
Date: Fri, 12 Jun 2026 07:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Stewart <matthew.stewart2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Ray Wu <ray.wu@amd.com>
Subject: [linux-next:master 9998/13002]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c:444
 dcn42b_clk_mgr_construct() warn: inconsistent indenting
Message-ID: <202606120757.Y9fZz3Ch-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: 0a5e0416e191571de9362b769feb31b3e87a705e [9998/13002] drm/amd/display: Add DCN42B code to DC
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120757.Y9fZz3Ch-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120757.Y9fZz3Ch-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c:444 dcn42b_clk_mgr_construct() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn42b/hw_translate_dcn42b.c:151 id_to_offset() warn: inconsistent indenting

vim +444 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c

a3d3758b2ee159a Matthew Stewart 2026-05-17  414  
a3d3758b2ee159a Matthew Stewart 2026-05-17  415  void dcn42b_clk_mgr_construct(
a3d3758b2ee159a Matthew Stewart 2026-05-17  416  		struct dc_context *ctx,
a3d3758b2ee159a Matthew Stewart 2026-05-17  417  		struct clk_mgr_dcn42 *clk_mgr,
a3d3758b2ee159a Matthew Stewart 2026-05-17  418  		struct pp_smu_funcs *pp_smu,
a3d3758b2ee159a Matthew Stewart 2026-05-17  419  		struct dccg *dccg)
a3d3758b2ee159a Matthew Stewart 2026-05-17  420  {
a3d3758b2ee159a Matthew Stewart 2026-05-17  421  	clk_mgr->base.base.ctx = ctx;
a3d3758b2ee159a Matthew Stewart 2026-05-17  422  	clk_mgr->base.base.funcs = &dcn42b_funcs;
a3d3758b2ee159a Matthew Stewart 2026-05-17  423  	clk_mgr->base.regs = &clk_mgr_regs_dcn42b;
a3d3758b2ee159a Matthew Stewart 2026-05-17  424  	clk_mgr->base.clk_mgr_shift = &clk_mgr_shift_dcn42b;
a3d3758b2ee159a Matthew Stewart 2026-05-17  425  	clk_mgr->base.clk_mgr_mask = &clk_mgr_mask_dcn42b;
a3d3758b2ee159a Matthew Stewart 2026-05-17  426  
a3d3758b2ee159a Matthew Stewart 2026-05-17  427  	clk_mgr->base.pp_smu = pp_smu;
a3d3758b2ee159a Matthew Stewart 2026-05-17  428  
a3d3758b2ee159a Matthew Stewart 2026-05-17  429  	clk_mgr->base.dccg = dccg;
a3d3758b2ee159a Matthew Stewart 2026-05-17  430  	clk_mgr->base.dfs_bypass_disp_clk = 0;
a3d3758b2ee159a Matthew Stewart 2026-05-17  431  
a3d3758b2ee159a Matthew Stewart 2026-05-17  432  	clk_mgr->base.dprefclk_ss_percentage = 0;
a3d3758b2ee159a Matthew Stewart 2026-05-17  433  	clk_mgr->base.dprefclk_ss_divider = 1000;
a3d3758b2ee159a Matthew Stewart 2026-05-17  434  	clk_mgr->base.ss_on_dprefclk = false;
a3d3758b2ee159a Matthew Stewart 2026-05-17  435  	clk_mgr->base.dfs_ref_freq_khz = 48000; /*sync with pmfw*/
a3d3758b2ee159a Matthew Stewart 2026-05-17  436  	clk_mgr->base.base.clks.ref_dtbclk_khz = 0;
a3d3758b2ee159a Matthew Stewart 2026-05-17  437  
a3d3758b2ee159a Matthew Stewart 2026-05-17  438  	/* Changed from DCN3.2_clock_frequency doc to match
a3d3758b2ee159a Matthew Stewart 2026-05-17  439  	 * dcn32_dump_clk_registers from 4 * dentist_vco_freq_khz /
a3d3758b2ee159a Matthew Stewart 2026-05-17  440  	 * dprefclk DID divider
a3d3758b2ee159a Matthew Stewart 2026-05-17  441  	 */
a3d3758b2ee159a Matthew Stewart 2026-05-17  442  	clk_mgr->base.base.dprefclk_khz = 600000;
a3d3758b2ee159a Matthew Stewart 2026-05-17  443  
a3d3758b2ee159a Matthew Stewart 2026-05-17 @444  		clk_mgr->base.smu_present = false;

:::::: The code at line 444 was first introduced by commit
:::::: a3d3758b2ee159a0985bc2f973a892200c2ab62b drm/amd/display: Add DCN42B DC resource files

:::::: TO: Matthew Stewart <matthew.stewart2@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
