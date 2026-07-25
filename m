Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE792E62AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 07:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784963028; cv=none; b=SZnPgYLSbL8tKDXF+F9ToypyzmUYUlShJrZIfbgEy2G4B2F3XopOCzh6x41ciRPUAmk2n11T8e+YJyoORuWddPWgocnDkGherq1Zi+PkbhMPpMKTMtq0JN2vx+HOBS8lpv91It5zI9ItBVIFS2OjqTmgoI556aQ/yPUGFN/4Qsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784963028; c=relaxed/simple;
	bh=UfddePFXhW7soqYeXUkp65K1ybmE66PWtEgtFwDOvgA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DRGMZpiBBn7mMLdkiJwnExaCfzsf4htc+KbXVGcuhBTOg5vhhw85D8tNPk8k4OPlCv3N4wccfPjOiwKBjNS+60sawwMCVUBHr6L7IWIb7dd/CBu0G2KmH/uYzRzmyJp129hPqthYNGiz53pogXsNpHxYLX66JOOOgLX2X0UjPSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbLfNCoh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbLfNCoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784963024; x=1816499024;
  h=date:from:to:cc:subject:message-id;
  bh=UfddePFXhW7soqYeXUkp65K1ybmE66PWtEgtFwDOvgA=;
  b=QbLfNCohby0L+ujqviGjZpsjiAt1GqpmRLPpE/oJkhS+Cs7giLlKwl8n
   euciPYneuX1/WlCx4g1+3m+lxVVZrGk9IYnAJomm3i9J+my9KSt+0cOW5
   sKgYPzKgehWxh08rCE1qbaN4iKTgp5veedUix6imPtX/MdatYulJXrp+R
   XjcZB7bDofWMR4jTiu4FnPoC0P/BNO02HeMddJFzI0y+eoeJNzQC0+TGn
   X2vQIGlwaircmbpdL7RxUT+Qzb4QuYjdilHVucAK711xffMw9ZzKlXm+P
   ofKV1rJmc29/QPI02DzwPkgs/4fL5u4cnpHX7LXCQZEqTHK8UIF8H2+T/
   g==;
X-CSE-ConnectionGUID: TzMrhlsrQoKvDk+WxP72PQ==
X-CSE-MsgGUID: BH0WQkT1QCG6J1wBJQDpPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="108415539"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="108415539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 00:03:44 -0700
X-CSE-ConnectionGUID: RY/MXSLqSnqLLXEbFIvksg==
X-CSE-MsgGUID: jUUrgcchSmCBLzwFgbVfLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="257144024"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Jul 2026 00:03:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnWPg-00000000bXC-3y0d;
	Sat, 25 Jul 2026 07:03:20 +0000
Date: Sat, 25 Jul 2026 15:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Austin Zheng <Austin.Zheng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, waynelin <Wayne.Lin@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_policy.c:208
 dml2_policy_build_synthetic_soc_states() warn: inconsistent indenting
Message-ID: <202607251401.W80dF3AC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Austin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48a5a7ab8d6ab7090564339e039c421f315de912
commit: e6a8a000cfe6a1106c17ab4a47eb6dd21596968c drm/amd/display: Rename dml2 to dml2_0 folder
date:   9 months ago
config: arm64-randconfig-r072-20260724 (https://download.01.org/0day-ci/archive/20260725/202607251401.W80dF3AC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6a8a000cfe6 ("drm/amd/display: Rename dml2 to dml2_0 folder")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607251401.W80dF3AC-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_policy.c:208 dml2_policy_build_synthetic_soc_states() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:118 dml_floor() warn: if statement not indented
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:152 dml_max() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:733 dml_get_num_active_planes() warn: if statement not indented
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:2755 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:3176 CalculateDCFCLKDeepSleep() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:3754 CalculateVMGroupAndRequestTimes() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4056 CalculateStutterEfficiency() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4206 CalculateSwathAndDETConfiguration() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4789 CalculateSurfaceSizeInMall() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:5201 CalculateVMRowAndSwath() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:6019 CalculatePrefetchBandwithSupport() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:6201 CalculateMaxVStartup() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:6923 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:8380 dml_core_mode_programming() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:9362 dml_core_mode_programming() warn: for statement not indented

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1213 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1295 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1462 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1565 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:2757 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4252 CalculateSwathAndDETConfiguration() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4794 CalculateSurfaceSizeInMall() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7220 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7469 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7883 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7954 dml_core_mode_support() warn: inconsistent indenting

vim +208 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_policy.c

7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  121  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  122  int dml2_policy_build_synthetic_soc_states(struct dml2_policy_build_synthetic_soc_states_scratch *s,
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  123  	struct dml2_policy_build_synthetic_soc_states_params *p)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  124  {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  125  	int i, j;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  126  	unsigned int min_fclk_mhz = p->in_states->state_array[0].fabricclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  127  	unsigned int min_dcfclk_mhz = p->in_states->state_array[0].dcfclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  128  	unsigned int min_socclk_mhz = p->in_states->state_array[0].socclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  129  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  130  	int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0,
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  131  		max_phyclk_mhz = 0, max_dtbclk_mhz = 0, max_fclk_mhz = 0,
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  132  		max_uclk_mhz = 0, max_socclk_mhz = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  133  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  134  	int num_uclk_dpms = 0, num_fclk_dpms = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  135  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  136  	for (i = 0; i < __DML_MAX_STATE_ARRAY_SIZE__; i++) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  137  		if (p->in_states->state_array[i].dcfclk_mhz > max_dcfclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  138  			max_dcfclk_mhz = (int) p->in_states->state_array[i].dcfclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  139  		if (p->in_states->state_array[i].fabricclk_mhz > max_fclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  140  			max_fclk_mhz = (int) p->in_states->state_array[i].fabricclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  141  		if (p->in_states->state_array[i].socclk_mhz > max_socclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  142  			max_socclk_mhz = (int) p->in_states->state_array[i].socclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  143  		if (p->in_states->state_array[i].dram_speed_mts > max_uclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  144  			max_uclk_mhz = (int) p->in_states->state_array[i].dram_speed_mts;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  145  		if (p->in_states->state_array[i].dispclk_mhz > max_dispclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  146  			max_dispclk_mhz = (int) p->in_states->state_array[i].dispclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  147  		if (p->in_states->state_array[i].dppclk_mhz > max_dppclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  148  			max_dppclk_mhz = (int) p->in_states->state_array[i].dppclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  149  		if (p->in_states->state_array[i].phyclk_mhz > max_phyclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  150  			max_phyclk_mhz = (int)p->in_states->state_array[i].phyclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  151  		if (p->in_states->state_array[i].dtbclk_mhz > max_dtbclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  152  			max_dtbclk_mhz = (int)p->in_states->state_array[i].dtbclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  153  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  154  		if (p->in_states->state_array[i].fabricclk_mhz > 0)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  155  			num_fclk_dpms++;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  156  		if (p->in_states->state_array[i].dram_speed_mts > 0)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  157  			num_uclk_dpms++;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  158  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  159  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  160  	if (!max_dcfclk_mhz || !max_dispclk_mhz || !max_dppclk_mhz || !max_phyclk_mhz || !max_dtbclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  161  		return -1;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  162  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  163  	p->out_states->num_states = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  164  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  165  	s->entry = p->in_states->state_array[0];
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  166  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  167  	s->entry.dispclk_mhz = max_dispclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  168  	s->entry.dppclk_mhz = max_dppclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  169  	s->entry.dtbclk_mhz = max_dtbclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  170  	s->entry.phyclk_mhz = max_phyclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  171  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  172  	s->entry.dscclk_mhz = max_dispclk_mhz / 3;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  173  	s->entry.phyclk_mhz = max_phyclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  174  	s->entry.dtbclk_mhz = max_dtbclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  175  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  176  	// Insert all the DCFCLK STAs first
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  177  	for (i = 0; i < p->num_dcfclk_stas; i++) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  178  		s->entry.dcfclk_mhz = p->dcfclk_stas_mhz[i];
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  179  		s->entry.fabricclk_mhz = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  180  		s->entry.dram_speed_mts = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  181  		if (i > 0)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  182  			s->entry.socclk_mhz = max_socclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  183  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  184  		insert_entry_into_table_sorted(p->in_bbox, p->out_states, &s->entry);
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  185  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  186  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  187  	// Insert the UCLK DPMS
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  188  	for (i = 0; i < num_uclk_dpms; i++) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  189  		s->entry.dcfclk_mhz = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  190  		s->entry.fabricclk_mhz = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  191  		s->entry.dram_speed_mts = p->in_states->state_array[i].dram_speed_mts;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  192  		if (i == 0) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  193  			s->entry.socclk_mhz = min_socclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  194  		} else {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  195  			s->entry.socclk_mhz = max_socclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  196  		}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  197  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  198  		insert_entry_into_table_sorted(p->in_bbox, p->out_states, &s->entry);
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  199  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  200  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  201  	// Insert FCLK DPMs (if present)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  202  	if (num_fclk_dpms > 2) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  203  		for (i = 0; i < num_fclk_dpms; i++) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  204  			s->entry.dcfclk_mhz = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  205  			s->entry.fabricclk_mhz = p->in_states->state_array[i].fabricclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  206  			s->entry.dram_speed_mts = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  207  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28 @208  		insert_entry_into_table_sorted(p->in_bbox, p->out_states, &s->entry);
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  209  		}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  210  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  211  	// Add max FCLK
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  212  	else {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  213  		s->entry.dcfclk_mhz = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  214  		s->entry.fabricclk_mhz = p->in_states->state_array[num_fclk_dpms - 1].fabricclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  215  		s->entry.dram_speed_mts = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  216  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  217  		insert_entry_into_table_sorted(p->in_bbox, p->out_states, &s->entry);
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  218  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  219  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  220  	// Remove states that require higher clocks than are supported
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  221  	for (i = p->out_states->num_states - 1; i >= 0; i--) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  222  		if (p->out_states->state_array[i].dcfclk_mhz > max_dcfclk_mhz ||
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  223  			p->out_states->state_array[i].fabricclk_mhz > max_fclk_mhz ||
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  224  			p->out_states->state_array[i].dram_speed_mts > max_uclk_mhz)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  225  			remove_entry_from_table_at_index(p->out_states, i);
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  226  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  227  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  228  	// At this point, the table contains all "points of interest" based on
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  229  	// DPMs from PMFW, and STAs. Table is sorted by BW, and all clock
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  230  	// ratios (by derate, are exact).
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  231  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  232  	// Round up UCLK to DPMs
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  233  	for (i = p->out_states->num_states - 1; i >= 0; i--) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  234  		for (j = 0; j < num_uclk_dpms; j++) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  235  			if (p->in_states->state_array[j].dram_speed_mts >= p->out_states->state_array[i].dram_speed_mts) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  236  				p->out_states->state_array[i].dram_speed_mts = p->in_states->state_array[j].dram_speed_mts;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  237  				break;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  238  			}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  239  		}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  240  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  241  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  242  	// If FCLK is coarse grained, round up to next DPMs
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  243  	if (num_fclk_dpms > 2) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  244  		for (i = p->out_states->num_states - 1; i >= 0; i--) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  245  			for (j = 0; j < num_fclk_dpms; j++) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  246  				if (p->in_states->state_array[j].fabricclk_mhz >= p->out_states->state_array[i].fabricclk_mhz) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  247  					p->out_states->state_array[i].fabricclk_mhz = p->in_states->state_array[j].fabricclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  248  					break;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  249  				}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  250  			}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  251  		}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  252  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  253  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  254  	// Clamp to min FCLK/DCFCLK
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  255  	for (i = p->out_states->num_states - 1; i >= 0; i--) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  256  		if (p->out_states->state_array[i].fabricclk_mhz < min_fclk_mhz) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  257  			p->out_states->state_array[i].fabricclk_mhz = min_fclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  258  		}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  259  		if (p->out_states->state_array[i].dcfclk_mhz < min_dcfclk_mhz) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  260  			p->out_states->state_array[i].dcfclk_mhz = min_dcfclk_mhz;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  261  		}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  262  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  263  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  264  	// Remove duplicate states, note duplicate states are always neighbouring since table is sorted.
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  265  	i = 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  266  	while (i < (int) p->out_states->num_states - 1) {
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  267  		if (p->out_states->state_array[i].dcfclk_mhz == p->out_states->state_array[i + 1].dcfclk_mhz &&
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  268  			p->out_states->state_array[i].fabricclk_mhz == p->out_states->state_array[i + 1].fabricclk_mhz &&
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  269  			p->out_states->state_array[i].dram_speed_mts == p->out_states->state_array[i + 1].dram_speed_mts)
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  270  			remove_entry_from_table_at_index(p->out_states, i);
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  271  	else
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  272  		i++;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  273  	}
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  274  
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  275  	return 0;
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  276  }
7966f319c66d946 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c Qingqing Zhuo 2023-07-28  277  

:::::: The code at line 208 was first introduced by commit
:::::: 7966f319c66d9468623c6a6a017ecbc0dd79be75 drm/amd/display: Introduce DML2

:::::: TO: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
