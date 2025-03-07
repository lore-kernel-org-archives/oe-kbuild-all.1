Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D52189B94
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 15:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741359890; cv=none; b=H4ssIfHwjzlvWYANn2UoxD3SNho6vex2GhGnLSkSlhJ6UoizzxiTcnd2bpjmqWv8RS7wDPStTeLcabcwHJ7Wbeue5buIIvP16hYMR/M5W26PonboQJZRVZJJFHUSSv5b0za7ZEvQqINGm09JbaoqnAFo0nPpfMmzjr37obYOhhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741359890; c=relaxed/simple;
	bh=lfcnz1ElvWdVOWae/D5/jVRDDgHiTzQ0PDbx0YTZMgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPKHwGsK45kagwLy8OGg3PwoMnge+Y8MPqxMY787MOIGBHTueRTA9UZldd+G5X+68IDTE7Lo7+shZybmQ4barpkxbT+4ApeoGx7LV96HSbyF2dZfrKgWcawB3UblzGkK/Nz9rnz7j9rSmMYVp/8h7PFEZFXZMzlIxMEbKgY3Z2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMzpNlWh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMzpNlWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741359888; x=1772895888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lfcnz1ElvWdVOWae/D5/jVRDDgHiTzQ0PDbx0YTZMgw=;
  b=QMzpNlWhJFM7xjM0BXDKEB06r91RzjzsHVA46WogoYpDuSHox+samEJ9
   IW+1oa7jo+LGJS2jFOfNjL+VcsHUPoOI17bXcSjUXBDSD3jCro6JGHNUQ
   MjwHxbR12by47C1QY1DGbPOOS9LSyp9xUlOb4iqvx4KNPMdb+TUVlRvHS
   qcWf99tbjVpccfR8M4c+W21lIFDbQmKtmAocjg0+kQ1lkwdxJMvvq2cNf
   jEVHFy1rJIjcBnClAaNYxw/iMb1w/dzGOSPrSG/CPy7RCUDkiMpfwQ7H8
   eysMelcprjn4WqY6mIKdxCSaskjkk38rh7StfdRUOSbA0Il1Ie+Dj4Ac+
   Q==;
X-CSE-ConnectionGUID: ZGwOhBXOSpqFWVoFbQQipw==
X-CSE-MsgGUID: TS1ipMfbQ5axq0Jena54JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42608974"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42608974"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 07:04:32 -0800
X-CSE-ConnectionGUID: 5KOrXPo2R/SferjIQaw/+Q==
X-CSE-MsgGUID: kzPU3mWcRaO+ZIRAaZ84sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119283165"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2025 07:04:31 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqZFU-0000cA-2Y;
	Fri, 07 Mar 2025 15:04:28 +0000
Date: Fri, 7 Mar 2025 23:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superm1:superm1/brightness-changes-6.15 3/7]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4694:13: error:
 'caps' undeclared
Message-ID: <202503072204.9LZTFcpb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/brightness-changes-6.15
head:   e1a5d02a5851574c4f09e3d483c473555e69a453
commit: 88e76b926b193764694367e3411d004d5db78ccb [3/7] drm/amd/display: Avoid operating on copies of backlight caps
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250307/202503072204.9LZTFcpb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072204.9LZTFcpb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072204.9LZTFcpb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_update_backlight_caps':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4694:13: error: 'caps' undeclared (first use in this function)
    4694 |         if (caps->aux_support)
         |             ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4694:13: note: each undeclared identifier is reported only once for each function it appears in


vim +/caps +4694 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  4662	
  4663	static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
  4664						    int bl_idx)
  4665	{
  4666	#if defined(CONFIG_ACPI)
  4667		struct amdgpu_dm_backlight_caps *caps = &dm->backlight_caps[bl_idx];
  4668	
  4669		if (caps->caps_valid)
  4670			return;
  4671	
  4672		amdgpu_acpi_get_backlight_caps(caps);
  4673	
  4674		/* validate the firmware value is sane */
  4675		if (caps->caps_valid) {
  4676			int spread = caps->max_input_signal - caps->min_input_signal;
  4677	
  4678			if (caps->max_input_signal > AMDGPU_DM_DEFAULT_MAX_BACKLIGHT ||
  4679			    caps->min_input_signal < 0 ||
  4680			    spread > AMDGPU_DM_DEFAULT_MAX_BACKLIGHT ||
  4681			    spread < AMDGPU_DM_MIN_SPREAD) {
  4682				DRM_DEBUG_KMS("DM: Invalid backlight caps: min=%d, max=%d\n",
  4683					      caps->min_input_signal, caps->max_input_signal);
  4684				caps->caps_valid = false;
  4685			}
  4686		}
  4687	
  4688		if (!caps->caps_valid) {
  4689			caps->min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
  4690			caps->max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
  4691			caps->caps_valid = true;
  4692		}
  4693	#else
> 4694		if (caps->aux_support)
  4695			return;
  4696	
  4697		caps->min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
  4698		caps->max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
  4699		caps->caps_valid = true;
  4700	#endif
  4701	}
  4702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
