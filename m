Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7786B1DC997
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563278; cv=none; b=ICxZdYB5CaqlX1Sz1Y0VgYEliIwfAtVfkpiaXQ5bfgZnpJJ2KeVJlI8ZmA68ltW3KgA4u//R8SBs4ryPReBqysbRO+pX4i6lTXqQw/aCl1CYyENeqhWdYD9AMJOuemNawz1TN2wOV2b83dkzAVjDiaJW+RQkM/tJpFVem5u3i2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563278; c=relaxed/simple;
	bh=+1ziNG8Se2JDgMG+fzZJ7VXQ18I7bsMUB0664INXqos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZxwlTzVAPIbQfwxPzXMiLr0kQOJ5phgAN7rL2T0vgnh0Fsz3O2LPJ3eFvcrfXJ3dYx5RH1FHbJHT5Ea5P7xvm7Tk+PRV6qWlmUD7OkNlSz9i4r58bzjzk1v+LznpvCSFc8FO0+/Rbb0B0HFXcosB4pk8wLheFzCewjINQZuaA4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSeJSVNt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSeJSVNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740563277; x=1772099277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+1ziNG8Se2JDgMG+fzZJ7VXQ18I7bsMUB0664INXqos=;
  b=LSeJSVNtUpuFvNV/Kja+/yXWkqNgPc+ms582J4Sxio6jdPdHZTqk6eFq
   nu7vVmsmCQlNJzslf28fGcEcfT1+ktp4tz7eOsD0mup8QaNFu9L2ElUm7
   FfBdIUKohJShKrLfWN/D4TKwg3vcJWDzDWHjhlQLtDWjabeCuKApoc7ry
   pS4hTtgazJcgweRhV7lKEUFtnrS/6voypUMTNxi+qwUq11ue6Nr9UxN5x
   8IuuHXj5vZCex1aJm4DGFWxIpWkYY7fLOF4+sL1s4xUt82tt7fX1UIOfk
   9r6XAS8CP1fiS96hl0UuwY87o/32Lg9/zCX+CIsipQfeEBKeRdxreHMt5
   g==;
X-CSE-ConnectionGUID: voE0yX81TTiamLmbbdnMRg==
X-CSE-MsgGUID: 4TpRMshERqe0676VtN+OOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52037191"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52037191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:47:55 -0800
X-CSE-ConnectionGUID: SXpOU9smTAWCt5nkb2q8PA==
X-CSE-MsgGUID: y2LkjtafSl6d1V33OoAXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121592491"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Feb 2025 01:47:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnE19-000BUJ-01;
	Wed, 26 Feb 2025 09:47:51 +0000
Date: Wed, 26 Feb 2025 17:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 6182/6583]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1200: warning: Function parameter or
 struct member 'ip_block' not described in 'vcn_v5_0_0_is_idle'
Message-ID: <202502261725.6cQIiIQk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sunil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: 7dc340540363a008cee1e160e8f2a4f034f196d4 [6182/6583] drm/amdgpu: update the handle ptr in is_idle
config: i386-buildonly-randconfig-003-20250226 (https://download.01.org/0day-ci/archive/20250226/202502261725.6cQIiIQk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261725.6cQIiIQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261725.6cQIiIQk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1200: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_is_idle'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1200: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_is_idle'


vim +1200 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c

b6d1a06320519a Sonny Jiang  2023-04-25  1191  
b6d1a06320519a Sonny Jiang  2023-04-25  1192  /**
b6d1a06320519a Sonny Jiang  2023-04-25  1193   * vcn_v5_0_0_is_idle - check VCN block is idle
b6d1a06320519a Sonny Jiang  2023-04-25  1194   *
b6d1a06320519a Sonny Jiang  2023-04-25  1195   * @handle: amdgpu_device pointer
b6d1a06320519a Sonny Jiang  2023-04-25  1196   *
b6d1a06320519a Sonny Jiang  2023-04-25  1197   * Check whether VCN block is idle
b6d1a06320519a Sonny Jiang  2023-04-25  1198   */
7dc340540363a0 Sunil Khatri 2025-02-19  1199  static bool vcn_v5_0_0_is_idle(struct amdgpu_ip_block *ip_block)
b6d1a06320519a Sonny Jiang  2023-04-25 @1200  {
7dc340540363a0 Sunil Khatri 2025-02-19  1201  	struct amdgpu_device *adev = ip_block->adev;
b6d1a06320519a Sonny Jiang  2023-04-25  1202  	int i, ret = 1;
b6d1a06320519a Sonny Jiang  2023-04-25  1203  
b6d1a06320519a Sonny Jiang  2023-04-25  1204  	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
b6d1a06320519a Sonny Jiang  2023-04-25  1205  		if (adev->vcn.harvest_config & (1 << i))
b6d1a06320519a Sonny Jiang  2023-04-25  1206  			continue;
b6d1a06320519a Sonny Jiang  2023-04-25  1207  
b6d1a06320519a Sonny Jiang  2023-04-25  1208  		ret &= (RREG32_SOC15(VCN, i, regUVD_STATUS) == UVD_STATUS__IDLE);
b6d1a06320519a Sonny Jiang  2023-04-25  1209  	}
b6d1a06320519a Sonny Jiang  2023-04-25  1210  
b6d1a06320519a Sonny Jiang  2023-04-25  1211  	return ret;
b6d1a06320519a Sonny Jiang  2023-04-25  1212  }
b6d1a06320519a Sonny Jiang  2023-04-25  1213  

:::::: The code at line 1200 was first introduced by commit
:::::: b6d1a06320519ac3bfda6ce81067a1bc409b9cff drm/amdgpu: add VCN_5_0_0 IP block support

:::::: TO: Sonny Jiang <sonny.jiang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
