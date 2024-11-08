Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64231BD9DA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 04:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731040372; cv=none; b=grJcev3Z7P/me6o/QoXXQvJCeQtIJTSyy6TfYN0AtTI9cotuk4JyIFSWN3jzkas/uKWnjvwm4sG+plM+P+0g8QTG+Q0aOckbmff9W925dbvPi6AlTfk0fwQmX2kMc4TmJSuWkiiwgi0SfE5E4BXLdPmfyIgyXcc4yuUP5qIdmBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731040372; c=relaxed/simple;
	bh=AEHbpdT0SXhvQZRflgT4Yts7HsGZX7z+ymLsKXtlbgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X7bLrKui///oPx1Cw+5V79r6CtLyXJa9AR8i2T+cn4tr7oQAmdBfdnQgjwJDJH2at/Kd+2Lm1adm46lD6K5bGwi32jVFmhZG+E/dJFGrTndYNaZ/MzDn5SKaIYm6jkqHhGekNWy+2sPwsGflypG5ZUD51w+G7rb8Ha4mL3UaEPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0CnnSz1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0CnnSz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731040370; x=1762576370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AEHbpdT0SXhvQZRflgT4Yts7HsGZX7z+ymLsKXtlbgs=;
  b=m0CnnSz1NcKk1WCBO3oceXZlS9uWxW7HRTG+NCh7PAK/8IvMgnjh0Nar
   nUC7GcHyksEaUIjE2cTFbY6KJwiidR+Q+YoSSu7HPGr68PdilCP5mCuqy
   ja4+l8PMO6ZFhAMdLkO4kDnAe6ChM0fhQC2UdVRCjVdtlPg/Mf/HeZ45N
   Vm1EqDfAA4zN5az3E8JfNLmIPD0S5x7UD0DPGtLz5R91Zn7vxmzg2GVQu
   U9v1kHcgSiwD2bJuMERT6cfErEHRGBV/Wuf+SWfkl9fZ4VyTGaEyCR0WU
   JGbYhPhhr2/runLdapuS4Oby7zB+oOltDwUlTtjGJH9ByEcAQXnacHsUJ
   Q==;
X-CSE-ConnectionGUID: V8nLrlbLQ0m9nKd/sMNjKA==
X-CSE-MsgGUID: JGQe9cCRTai905J4UJSWYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48371592"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48371592"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 20:32:50 -0800
X-CSE-ConnectionGUID: CXxkPOVOQ+qkCwzrO9/3Tw==
X-CSE-MsgGUID: s6F0+xoHRgm8/dRoBqVtvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="86185771"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2024 20:32:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Gfv-000r27-0Y;
	Fri, 08 Nov 2024 04:32:47 +0000
Date: Fri, 8 Nov 2024 12:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Sunil Khatri <sunil.khatri@amd.com>
Subject: [agd5f:amd-staging-drm-next 1202/1211]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1233: warning: Function parameter or
 struct member 'ip_block' not described in 'vcn_v5_0_0_set_clockgating_state'
Message-ID: <202411081207.XAfKVL5k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Boyuan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   9308ad1c04a88cfd66c51071dcce0003379db00d
commit: 12bdba8c6e0fec7de3b1567d4371cfc92d2c46b4 [1202/1211] drm/amdgpu: pass ip_block in set_clockgating_state
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241108/202411081207.XAfKVL5k-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081207.XAfKVL5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081207.XAfKVL5k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1233: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_set_clockgating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1233: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_set_clockgating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1264: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_set_powergating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1264: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1506: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_set_clockgating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1506: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_set_clockgating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1537: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_set_powergating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1537: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2012: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_set_clockgating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2012: warning: Excess function parameter 'handle' description in 'vcn_v4_0_set_clockgating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2043: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_set_powergating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2043: warning: Excess function parameter 'handle' description in 'vcn_v4_0_set_powergating_state'


vim +1233 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c

b6d1a06320519a Sonny Jiang  2023-04-25  1222  
b6d1a06320519a Sonny Jiang  2023-04-25  1223  /**
b6d1a06320519a Sonny Jiang  2023-04-25  1224   * vcn_v5_0_0_set_clockgating_state - set VCN block clockgating state
b6d1a06320519a Sonny Jiang  2023-04-25  1225   *
b6d1a06320519a Sonny Jiang  2023-04-25  1226   * @handle: amdgpu_device pointer
b6d1a06320519a Sonny Jiang  2023-04-25  1227   * @state: clock gating state
b6d1a06320519a Sonny Jiang  2023-04-25  1228   *
b6d1a06320519a Sonny Jiang  2023-04-25  1229   * Set VCN block clockgating state
b6d1a06320519a Sonny Jiang  2023-04-25  1230   */
12bdba8c6e0fec Boyuan Zhang 2024-10-07  1231  static int vcn_v5_0_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
12bdba8c6e0fec Boyuan Zhang 2024-10-07  1232  					  enum amd_clockgating_state state)
b6d1a06320519a Sonny Jiang  2023-04-25 @1233  {
12bdba8c6e0fec Boyuan Zhang 2024-10-07  1234  	struct amdgpu_device *adev = ip_block->adev;
b6d1a06320519a Sonny Jiang  2023-04-25  1235  	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
b6d1a06320519a Sonny Jiang  2023-04-25  1236  	int i;
b6d1a06320519a Sonny Jiang  2023-04-25  1237  
b6d1a06320519a Sonny Jiang  2023-04-25  1238  	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
b6d1a06320519a Sonny Jiang  2023-04-25  1239  		if (adev->vcn.harvest_config & (1 << i))
b6d1a06320519a Sonny Jiang  2023-04-25  1240  			continue;
b6d1a06320519a Sonny Jiang  2023-04-25  1241  
b6d1a06320519a Sonny Jiang  2023-04-25  1242  		if (enable) {
b6d1a06320519a Sonny Jiang  2023-04-25  1243  			if (RREG32_SOC15(VCN, i, regUVD_STATUS) != UVD_STATUS__IDLE)
b6d1a06320519a Sonny Jiang  2023-04-25  1244  				return -EBUSY;
b6d1a06320519a Sonny Jiang  2023-04-25  1245  			vcn_v5_0_0_enable_clock_gating(adev, i);
b6d1a06320519a Sonny Jiang  2023-04-25  1246  		} else {
b6d1a06320519a Sonny Jiang  2023-04-25  1247  			vcn_v5_0_0_disable_clock_gating(adev, i);
b6d1a06320519a Sonny Jiang  2023-04-25  1248  		}
b6d1a06320519a Sonny Jiang  2023-04-25  1249  	}
b6d1a06320519a Sonny Jiang  2023-04-25  1250  
b6d1a06320519a Sonny Jiang  2023-04-25  1251  	return 0;
b6d1a06320519a Sonny Jiang  2023-04-25  1252  }
b6d1a06320519a Sonny Jiang  2023-04-25  1253  

:::::: The code at line 1233 was first introduced by commit
:::::: b6d1a06320519ac3bfda6ce81067a1bc409b9cff drm/amdgpu: add VCN_5_0_0 IP block support

:::::: TO: Sonny Jiang <sonny.jiang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
