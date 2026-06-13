Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3678314AD20
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 03:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781320996; cv=none; b=gNWtGkBIbp6mKcEsZsd4S4EM5+98kTaKkrNcmxoKoWu7J+SkYvNrYsmJGCOfZ1VJ0ucSMbjt7C8JEO9oRUEwPg38EipnvudM506tt2Uz5CfuTj7NQ+DWauy2MoxqvGDbKHwBweiwpK12q6zvt9/Lo6Qa/KihGjKZumuxVPgJRIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781320996; c=relaxed/simple;
	bh=uNRbBgqNNcDusp6fQlw8V6U61SuESdm3LoJYK0wjbrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tfb5X9UI74kwwafMkUYZLw6dNEl+XCAInYSMF8cvyQzRH/ixtchayHphPr8hdKvL3LR2wOgcNkXskmbNNl26Q+uSZYXbfAs4hIROYY3OX8Ui0Pu4jsDQXFx/tbhN7Mx4tLKTgNIIuZAa3X9yigd9odKRKwnyhncGpCYwJIJSgUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMhyW6KO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMhyW6KO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781320994; x=1812856994;
  h=date:from:to:cc:subject:message-id;
  bh=uNRbBgqNNcDusp6fQlw8V6U61SuESdm3LoJYK0wjbrI=;
  b=fMhyW6KOkXFgt2wjabO656T50N5EVpq3cOxZGpH1QgpSw6u0FkbkMGPs
   0c3FAYb1gM1TYPMnC5bYfJEHXOCYoUffMTN4sSZFj3qeycgn7tNUE53FK
   fKIurHnRr0qLXtieNQ0Reh8l9muJMBVAGkzpwnv22cNLS3Ny6aHg2KvgB
   R2UlDtAxE8sEX/2ldPqQ8jqri/rfGwEw4o3RjedEJs3ugVSxasWR9osV3
   BzX13GKzVRND6w0sOCgiIIHaRsdOBZmqEoD+8vAcX5wIIsZl4PhGdF6nA
   k1qqO33+accQ9OQccEXbXMqf3hndi78vu39r7QJ7l5Jileu4CxzAZ0l30
   g==;
X-CSE-ConnectionGUID: zJBJeDA/SECn7ctMfvzwgw==
X-CSE-MsgGUID: Ud8NJtn4RAGHP2I2gr0i8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93268067"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="93268067"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 20:23:12 -0700
X-CSE-ConnectionGUID: UChkINdlTnGvm8Gq58azig==
X-CSE-MsgGUID: kaS6NuJHTFWAJ0yadrg/bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="244560391"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2026 20:23:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYExf-00000000PdG-19r2;
	Sat, 13 Jun 2026 03:23:07 +0000
Date: Sat, 13 Jun 2026 11:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Stewart <matthew.stewart2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Ray Wu <ray.wu@amd.com>
Subject: [linux-next:master 9942/13336]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c:444
 dcn42b_clk_mgr_construct() warn: inconsistent indenting
Message-ID: <202606131145.FcsBJeTH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
commit: 0a5e0416e191571de9362b769feb31b3e87a705e [9942/13336] drm/amd/display: Add DCN42B code to DC
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260613/202606131145.FcsBJeTH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131145.FcsBJeTH-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c:444 dcn42b_clk_mgr_construct() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn42b/hw_translate_dcn42b.c:151 id_to_offset() warn: inconsistent indenting

vim +444 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c

a3d3758b2ee159 Matthew Stewart 2026-05-17  414  
a3d3758b2ee159 Matthew Stewart 2026-05-17  415  void dcn42b_clk_mgr_construct(
a3d3758b2ee159 Matthew Stewart 2026-05-17  416  		struct dc_context *ctx,
a3d3758b2ee159 Matthew Stewart 2026-05-17  417  		struct clk_mgr_dcn42 *clk_mgr,
a3d3758b2ee159 Matthew Stewart 2026-05-17  418  		struct pp_smu_funcs *pp_smu,
a3d3758b2ee159 Matthew Stewart 2026-05-17  419  		struct dccg *dccg)
a3d3758b2ee159 Matthew Stewart 2026-05-17  420  {
a3d3758b2ee159 Matthew Stewart 2026-05-17  421  	clk_mgr->base.base.ctx = ctx;
a3d3758b2ee159 Matthew Stewart 2026-05-17  422  	clk_mgr->base.base.funcs = &dcn42b_funcs;
a3d3758b2ee159 Matthew Stewart 2026-05-17  423  	clk_mgr->base.regs = &clk_mgr_regs_dcn42b;
a3d3758b2ee159 Matthew Stewart 2026-05-17  424  	clk_mgr->base.clk_mgr_shift = &clk_mgr_shift_dcn42b;
a3d3758b2ee159 Matthew Stewart 2026-05-17  425  	clk_mgr->base.clk_mgr_mask = &clk_mgr_mask_dcn42b;
a3d3758b2ee159 Matthew Stewart 2026-05-17  426  
a3d3758b2ee159 Matthew Stewart 2026-05-17  427  	clk_mgr->base.pp_smu = pp_smu;
a3d3758b2ee159 Matthew Stewart 2026-05-17  428  
a3d3758b2ee159 Matthew Stewart 2026-05-17  429  	clk_mgr->base.dccg = dccg;
a3d3758b2ee159 Matthew Stewart 2026-05-17  430  	clk_mgr->base.dfs_bypass_disp_clk = 0;
a3d3758b2ee159 Matthew Stewart 2026-05-17  431  
a3d3758b2ee159 Matthew Stewart 2026-05-17  432  	clk_mgr->base.dprefclk_ss_percentage = 0;
a3d3758b2ee159 Matthew Stewart 2026-05-17  433  	clk_mgr->base.dprefclk_ss_divider = 1000;
a3d3758b2ee159 Matthew Stewart 2026-05-17  434  	clk_mgr->base.ss_on_dprefclk = false;
a3d3758b2ee159 Matthew Stewart 2026-05-17  435  	clk_mgr->base.dfs_ref_freq_khz = 48000; /*sync with pmfw*/
a3d3758b2ee159 Matthew Stewart 2026-05-17  436  	clk_mgr->base.base.clks.ref_dtbclk_khz = 0;
a3d3758b2ee159 Matthew Stewart 2026-05-17  437  
a3d3758b2ee159 Matthew Stewart 2026-05-17  438  	/* Changed from DCN3.2_clock_frequency doc to match
a3d3758b2ee159 Matthew Stewart 2026-05-17  439  	 * dcn32_dump_clk_registers from 4 * dentist_vco_freq_khz /
a3d3758b2ee159 Matthew Stewart 2026-05-17  440  	 * dprefclk DID divider
a3d3758b2ee159 Matthew Stewart 2026-05-17  441  	 */
a3d3758b2ee159 Matthew Stewart 2026-05-17  442  	clk_mgr->base.base.dprefclk_khz = 600000;
a3d3758b2ee159 Matthew Stewart 2026-05-17  443  
a3d3758b2ee159 Matthew Stewart 2026-05-17 @444  		clk_mgr->base.smu_present = false;

:::::: The code at line 444 was first introduced by commit
:::::: a3d3758b2ee159a0985bc2f973a892200c2ab62b drm/amd/display: Add DCN42B DC resource files

:::::: TO: Matthew Stewart <matthew.stewart2@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
