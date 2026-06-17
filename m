Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D873806C2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781724924; cv=none; b=iryETL/mQD09I6NS7/w7tFUTscJe+0ug71SBsCYAEpmcWZgwetVf39PkVey+GONzSak3ryR4UzPzj3SEwB96Z6WhlnBDE4HMiYd0kT98oJYvDCVlbL/is5nKjz5IXMSdoQjEx9wTW9AbM63vA5U3G20V/ycIIGJkMRkoDdmxSkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781724924; c=relaxed/simple;
	bh=45jLsk7F8vodz1zu5VW6s2CjU2xHCW2/l3d2iECJIDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C3euV12NiVh88cGkyFqXx5OQMynKOSUNucAh8BXNBw4rt3X7xutdQJiImenIGuPGBYeSJFWIZFDqZy0EDnprnUmTyoGXsC8kPcue/yTUpYF0B82cxgek8flXQlbfAL+Tus89zRSMgcR3ELjrRt5iMc6GK2srYcZtV8j1rchHnXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBPNNAoW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBPNNAoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781724923; x=1813260923;
  h=date:from:to:cc:subject:message-id;
  bh=45jLsk7F8vodz1zu5VW6s2CjU2xHCW2/l3d2iECJIDE=;
  b=GBPNNAoWMFv+MNYD0Bq6/Os33VkBxh4DYZXm8MxmERLNuQZ/LTVO2ucg
   UYi7HF72ZGe0cX77f3LK/+IbfmYGrvclDkfVFJ7zdJWi8Ib0j4enSVFqq
   ihxSzdvDxp352F3FzLBnNGEsXqSSfw/6hUO8I08YcmG4f0g0glVEZC4rP
   gMO37N89UkXZAedYM9rUkyc1aStGr9DZ04jqsUJKhdQPq0NmKGce7XRgJ
   LolIG5yNjDr/KODc0Udg8DXkGmmTg9m6dond86GeRA/pE4GFeHozr9knu
   Iuhwo5ipF1uPJOmCW/PWieDn2L+Udk5cIEXsJKTXjptiHPNpZOktSWT6G
   g==;
X-CSE-ConnectionGUID: MibOUxqsR/O0tXH+I2DZbA==
X-CSE-MsgGUID: Ib45vo3cTuC9ziXRiFa7cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82419277"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82419277"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 12:35:18 -0700
X-CSE-ConnectionGUID: SoVTndPnRlmYtna92qIbbw==
X-CSE-MsgGUID: HBxtYKZJQ5KBGavgdJ57kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="247013933"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jun 2026 12:35:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZw2W-00000000Uvi-2kpa;
	Wed, 17 Jun 2026 19:35:08 +0000
Date: Thu, 18 Jun 2026 03:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Stewart <matthew.stewart2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Ray Wu <ray.wu@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c:444
 dcn42b_clk_mgr_construct() warn: inconsistent indenting
Message-ID: <202606180337.8r6lHQqA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66affa37cfac0aec061cc4bcf4a065b0c52f7e19
commit: 0a5e0416e191571de9362b769feb31b3e87a705e drm/amd/display: Add DCN42B code to DC
date:   2 weeks ago
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260618/202606180337.8r6lHQqA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0a5e0416e191 ("drm/amd/display: Add DCN42B code to DC")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180337.8r6lHQqA-lkp@intel.com/

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
