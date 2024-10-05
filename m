Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C147D4C7E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 00:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728089572; cv=none; b=j5UhXrV1we0mZypVKMseKouGlIRe/iEudPPddptpLdF/DAIpB1z3Cbq9acpG8EghHjIXnAOnAW+bg4ZFKY+hYEYCB2EloOsdM1ghUBvAIKbuT8MzRCqCT5iP8E4nwxAlARtDt4n77dAOIadUcEHlmEnnKd8t0PznqlVJzZGnIvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728089572; c=relaxed/simple;
	bh=PhPC8XopNox91epSPgf1AiWpjWGzbYIztveNMv5akNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFfEpaybXttU1nMD1O9EfAQmwk8Iodwby7s0+KYK9nA7EafwvKjYZZv8ldh8Cqv2wN3pawhr5ieEHAHHej2hql2WyI7xr6Z2vbm3DsQBIL6ca5725Whwl3ytebDoAejaAYFEqv1W7xMj4rDFpw0nwihbYwo3ausbjneNcrNdtL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bw1d4+58; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bw1d4+58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728089571; x=1759625571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PhPC8XopNox91epSPgf1AiWpjWGzbYIztveNMv5akNI=;
  b=Bw1d4+58ld033xkxerQzc3G7dStHPHjcvbplPEPQxIGvHNt91F0K6kwS
   HKb7GpieE5MIM9ki3nx67mClo6nDQ/Pe8OYaPJgY88QWffkefkVoucdIn
   gWFzqaMbDq6mkQkXWna1RORnEb7m9zt9AKSSLcYFwJ/ekgjZxybRbB1YS
   KaGETsDNoy0QLaKpUXD0qxq/Jy19C60Br5b7KXe5kO/kiiHSbwnWl2uz4
   PcXt+H1emUtiIsHj/z/XVr/QRaqtkqsJVnC1+y1w/VULunCkmq/ptl1g4
   E6LXJfhkd7AmGntY/o9ncfY4doraRJBPrttUF7lzypOnSpMo0YzDZbh34
   w==;
X-CSE-ConnectionGUID: UZIpADU2RHSI1jqJ47cIJA==
X-CSE-MsgGUID: NqA1F0OPS9unqhwqlWKZhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26827857"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="26827857"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 17:52:49 -0700
X-CSE-ConnectionGUID: kTgB74QiSwa4Objpi0GQ+A==
X-CSE-MsgGUID: qkmLuQ8RSjGgdL2u2rodRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="75205821"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Oct 2024 17:52:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swt2L-0002OK-0s;
	Sat, 05 Oct 2024 00:52:45 +0000
Date: Sat, 5 Oct 2024 08:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c:134
 core_dcn4_initialize() warn: inconsistent indenting
Message-ID: <202410050813.ukNdcvDS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac308609567d31fe44be80ab757a5ddf062362ef
commit: 00c391102abc13763e2bfc90e05503109b19f074 drm/amd/display: Add misc DC changes for DCN401
date:   5 months ago
config: loongarch-randconfig-r071-20241003 (https://download.01.org/0day-ci/archive/20241005/202410050813.ukNdcvDS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050813.ukNdcvDS-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c:134 core_dcn4_initialize() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c:553 core_dcn4_mode_programming() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c:568 core_dcn4_mode_programming() warn: curly braces intended?

vim +134 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c

70839da6360500 Aurabindo Pillai 2024-04-19  112  
70839da6360500 Aurabindo Pillai 2024-04-19  113  bool core_dcn4_initialize(struct dml2_core_initialize_in_out *in_out)
70839da6360500 Aurabindo Pillai 2024-04-19  114  {
70839da6360500 Aurabindo Pillai 2024-04-19  115  	struct dml2_core_instance *core = in_out->instance;
70839da6360500 Aurabindo Pillai 2024-04-19  116  
70839da6360500 Aurabindo Pillai 2024-04-19  117  	if (!in_out->minimum_clock_table)
70839da6360500 Aurabindo Pillai 2024-04-19  118  		return false;
70839da6360500 Aurabindo Pillai 2024-04-19  119  	else
70839da6360500 Aurabindo Pillai 2024-04-19  120  		core->minimum_clock_table = in_out->minimum_clock_table;
70839da6360500 Aurabindo Pillai 2024-04-19  121  
70839da6360500 Aurabindo Pillai 2024-04-19  122  	if (in_out->explicit_ip_bb && in_out->explicit_ip_bb_size > 0) {
70839da6360500 Aurabindo Pillai 2024-04-19  123  		memcpy(&core->clean_me_up.mode_lib.ip, in_out->explicit_ip_bb, in_out->explicit_ip_bb_size);
70839da6360500 Aurabindo Pillai 2024-04-19  124  
70839da6360500 Aurabindo Pillai 2024-04-19  125  		// FIXME_STAGE2:
70839da6360500 Aurabindo Pillai 2024-04-19  126  		// DV still uses stage1 ip_param_st for each variant, need to patch the ip_caps with ip_param info
70839da6360500 Aurabindo Pillai 2024-04-19  127  		// Should move DV to use ip_caps but need move more overrides to ip_caps
70839da6360500 Aurabindo Pillai 2024-04-19  128  		patch_ip_caps_with_explicit_ip_params(in_out->ip_caps, in_out->explicit_ip_bb);
70839da6360500 Aurabindo Pillai 2024-04-19  129  		core->clean_me_up.mode_lib.ip.subvp_pstate_allow_width_us = core_dcn4_ip_caps_base.subvp_pstate_allow_width_us;
70839da6360500 Aurabindo Pillai 2024-04-19  130  		core->clean_me_up.mode_lib.ip.subvp_fw_processing_delay_us = core_dcn4_ip_caps_base.subvp_pstate_allow_width_us;
70839da6360500 Aurabindo Pillai 2024-04-19  131  		core->clean_me_up.mode_lib.ip.subvp_swath_height_margin_lines = core_dcn4_ip_caps_base.subvp_swath_height_margin_lines;
70839da6360500 Aurabindo Pillai 2024-04-19  132  	} else {
70839da6360500 Aurabindo Pillai 2024-04-19  133  			memcpy(&core->clean_me_up.mode_lib.ip, &core_dcn4_ip_caps_base, sizeof(struct dml2_core_ip_params));
70839da6360500 Aurabindo Pillai 2024-04-19 @134  		patch_ip_params_with_ip_caps(&core->clean_me_up.mode_lib.ip, in_out->ip_caps);
70839da6360500 Aurabindo Pillai 2024-04-19  135  
70839da6360500 Aurabindo Pillai 2024-04-19  136  		core->clean_me_up.mode_lib.ip.imall_supported = false;
70839da6360500 Aurabindo Pillai 2024-04-19  137  	}
70839da6360500 Aurabindo Pillai 2024-04-19  138  
70839da6360500 Aurabindo Pillai 2024-04-19  139  	memcpy(&core->clean_me_up.mode_lib.soc, in_out->soc_bb, sizeof(struct dml2_soc_bb));
70839da6360500 Aurabindo Pillai 2024-04-19  140  
70839da6360500 Aurabindo Pillai 2024-04-19  141  	return true;
70839da6360500 Aurabindo Pillai 2024-04-19  142  }
70839da6360500 Aurabindo Pillai 2024-04-19  143  

:::::: The code at line 134 was first introduced by commit
:::::: 70839da6360500a82e4d5f78499284474cbed7c1 drm/amd/display: Add new DCN401 sources

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
