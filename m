Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6EC13CA96
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 06:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712817855; cv=none; b=l8vBWoS/ubwTGmL+q3SKBCYQDFT8QAyqH7vR1cnRZD7NhTeUJA7c1U0quIYA2md6Tzl27uBIcfRDTrJFkWFWMMKoO9EQUqAHNIZaJzSIbJzn/vWiEJSaMJhjwfbE/XQZr4uifcc4m/InTX/xZ39phU0JJAtL87JJtkJyq02XZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712817855; c=relaxed/simple;
	bh=klEdsQ/vWd3VgCniDG1haaPBYnZB+klnDi3yrFe6XCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=THdprIKzK5EKxFv1dQzrbCNWwmIApxF9K4jbGsL0wbdrS/6J/0ZkFY0btntKZkV15zXUbcTitSYmLgJSU0MwSNMQbQYulIDfGwfWr/kY8WXOZz5NAFf3WyW/pGQbx8XrkfgFPABzrfDHDIH08sBFvioKoG1A2qQCOLYvf3hI5R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1vz6SdE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1vz6SdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712817852; x=1744353852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=klEdsQ/vWd3VgCniDG1haaPBYnZB+klnDi3yrFe6XCE=;
  b=U1vz6SdEJRbKslB9NgYsvca9aFw+I6ErA4IlTzglMVFxtvkQLF7CfTtH
   6f/asdRxUxqUl/TjZOGSEqTjLLJKl6hkUCcKn3Eq6ApA7q/2WbjDH2Kaf
   qm80ZxM+IPL1Z4W1CwNlfzyuveg1WvqUv2rx5ADK4qclpKAB2p1Vrd2Bm
   gPEHF8t9QTgQjQ+l4M2TRLZgWi73Zx8s2LlIqOUJ2qOSYFnhxlT6yQL/C
   ZMgbTi9VVprxB6zJHiSzuKHLbp4TWcpl1SzX4qNWc0/mKpRGJo/VqK8z+
   DQTV62hHB6WoNkdBY1xWrGDbyDQjtM1LIulR9vCyTGy6Cxn+lFpXKdO6M
   g==;
X-CSE-ConnectionGUID: W7ae+Nd9SVKC1WfWoK1Pnw==
X-CSE-MsgGUID: wy5QeewHS8CaGhdivmy1NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8373861"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8373861"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 23:44:11 -0700
X-CSE-ConnectionGUID: XEghxKKyRQO7uYg85+/tDg==
X-CSE-MsgGUID: rtz69VBgQDOutXeWY0YuNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20863967"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2024 23:44:09 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruoAJ-0008JX-1y;
	Thu, 11 Apr 2024 06:44:07 +0000
Date: Thu, 11 Apr 2024 14:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Aric Cyr <aric.cyr@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Leo Li <sunpeng.li@amd.com>
Subject: [agd5f:drm-next 235/299]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.c:313:33:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202404111404.s4rQrI55-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   526b184e888371dd3fdb131961461a2f30cd0ae4
commit: aece2094e34e602f37403dda028f464bb41da50c [235/299] drm/amd/display: Fix compiler warnings on high compiler warning levels
config: i386-randconfig-062-20240411 (https://download.01.org/0day-ci/archive/20240411/202404111404.s4rQrI55-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111404.s4rQrI55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111404.s4rQrI55-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.c:36:30: sparse: sparse: symbol 'dcn3_14_ip' was not declared. Should it be static?
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.c:313:33: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn351/dcn351_fpu.c:477:33: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.c:442:33: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_cts.c:887:47: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn31/dcn31_resource.c:1647:33: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn316/dcn316_resource.c:1616:33: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:385:33: sparse: sparse: Using plain integer as NULL pointer

vim +313 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.c

   306	
   307	int dcn314_populate_dml_pipes_from_context_fpu(struct dc *dc, struct dc_state *context,
   308						       display_e2e_pipe_params_st *pipes,
   309						       bool fast_validate)
   310	{
   311		int i, pipe_cnt;
   312		struct resource_context *res_ctx = &context->res_ctx;
 > 313		struct pipe_ctx *pipe = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
