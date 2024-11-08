Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353F71BD9E0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 01:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731030958; cv=none; b=brQ9k14E/Bv8+HmUVWJbDY5iVGL/zltGIQcYdBZ9NRevMbvq/rJNbeWl518i5KNEmaf3Jl++CmBARS/eu/ep7bUbGe2FMbRIJQuHhjypf+zH85uSNU7aYIzWV1ID/FsOKqfk8iv5nLtDw4n9Ky9nORitd7SzU37XjGXQvqEJRDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731030958; c=relaxed/simple;
	bh=DSStQB9JP0w9rTK+OD3/QZX+JAxMy2nDD84N5OuH3l4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cfez1CGqfD56rgcppBqvX/voOmTUOzYDqJY5OynGV057bXsPrWBTy/a+35Yk2xYYcvq8BI2OfKdfE+G09T2pwreJHRYkcO+dB8NIa9LPhmgG7QYEqct1yqZF678K4gP0Ghwg4MicW1wEbRosN+8ZMhxxGsqMTwJ4qItlS4cHxO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhSW0nZC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhSW0nZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731030957; x=1762566957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DSStQB9JP0w9rTK+OD3/QZX+JAxMy2nDD84N5OuH3l4=;
  b=MhSW0nZC6zXE3Y24+UZA0ULgefA/KDDEXiWO6sqKJ3kmpxLlzhyrTM9K
   kXY4GGZNWRTAbVxPw5JsclUPUWe5acp1Yi4EFVRYWYUfYtDXoy6tqVXm0
   VtJfES5OOS8LRwHUbbri920VrhzfeRjjjhv91XwxKUQzOJrsnG+vpGE9G
   GHfsjM63NvL0OcIUzMn9aoepS7y0mbHe9fhKDdz8RKZQJ1UtpQ5tuGB2L
   OFn91MPcnjYPovRGEjxCYtU484ZeHzbaHzPT+/c1bXnGTxiNSbcho/ghS
   WQ608pxffuySKcWk3Zs0daH0wlRlVo85VdHQoNoowd0q/MTlR2PXPdhhV
   w==;
X-CSE-ConnectionGUID: g894La5SRfSH2JWXbXj6eQ==
X-CSE-MsgGUID: 66z6pepeTtGF+9DSQyXoFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33753699"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="33753699"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 17:55:57 -0800
X-CSE-ConnectionGUID: 9gOZGW4FSx27TpFurBWW2Q==
X-CSE-MsgGUID: 1kD6VBkuTWSYV9iEVoUWlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="85650554"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Nov 2024 17:55:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9EDr-000qtS-0Z;
	Fri, 08 Nov 2024 01:55:39 +0000
Date: Fri, 8 Nov 2024 09:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Sunil Khatri <sunil.khatri@amd.com>
Subject: [agd5f:amd-staging-drm-next 1201/1211]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1263: warning: Function parameter or
 struct member 'ip_block' not described in 'vcn_v5_0_0_set_powergating_state'
Message-ID: <202411080944.4WfApnj6-lkp@intel.com>
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
commit: c9188ea9675f468076c72de18953e39cce688eef [1201/1211] drm/amdgpu: pass ip_block in set_powergating_state
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241108/202411080944.4WfApnj6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080944.4WfApnj6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080944.4WfApnj6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1263: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_set_powergating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1263: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1536: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_set_powergating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1536: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1628: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_3_set_powergating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1628: warning: Excess function parameter 'handle' description in 'vcn_v4_0_3_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2042: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_set_powergating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2042: warning: Excess function parameter 'handle' description in 'vcn_v4_0_set_powergating_state'


vim +1263 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c

b6d1a06320519a Sonny Jiang  2023-04-25  1252  
b6d1a06320519a Sonny Jiang  2023-04-25  1253  /**
b6d1a06320519a Sonny Jiang  2023-04-25  1254   * vcn_v5_0_0_set_powergating_state - set VCN block powergating state
b6d1a06320519a Sonny Jiang  2023-04-25  1255   *
b6d1a06320519a Sonny Jiang  2023-04-25  1256   * @handle: amdgpu_device pointer
b6d1a06320519a Sonny Jiang  2023-04-25  1257   * @state: power gating state
b6d1a06320519a Sonny Jiang  2023-04-25  1258   *
b6d1a06320519a Sonny Jiang  2023-04-25  1259   * Set VCN block powergating state
b6d1a06320519a Sonny Jiang  2023-04-25  1260   */
c9188ea9675f46 Boyuan Zhang 2024-09-29  1261  static int vcn_v5_0_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
c9188ea9675f46 Boyuan Zhang 2024-09-29  1262  		enum amd_powergating_state state)
b6d1a06320519a Sonny Jiang  2023-04-25 @1263  {
c9188ea9675f46 Boyuan Zhang 2024-09-29  1264  	struct amdgpu_device *adev = ip_block->adev;
b6d1a06320519a Sonny Jiang  2023-04-25  1265  	int ret;
b6d1a06320519a Sonny Jiang  2023-04-25  1266  
b6d1a06320519a Sonny Jiang  2023-04-25  1267  	if (state == adev->vcn.cur_state)
b6d1a06320519a Sonny Jiang  2023-04-25  1268  		return 0;
b6d1a06320519a Sonny Jiang  2023-04-25  1269  
b6d1a06320519a Sonny Jiang  2023-04-25  1270  	if (state == AMD_PG_STATE_GATE)
b6d1a06320519a Sonny Jiang  2023-04-25  1271  		ret = vcn_v5_0_0_stop(adev);
b6d1a06320519a Sonny Jiang  2023-04-25  1272  	else
b6d1a06320519a Sonny Jiang  2023-04-25  1273  		ret = vcn_v5_0_0_start(adev);
b6d1a06320519a Sonny Jiang  2023-04-25  1274  
b6d1a06320519a Sonny Jiang  2023-04-25  1275  	if (!ret)
b6d1a06320519a Sonny Jiang  2023-04-25  1276  		adev->vcn.cur_state = state;
b6d1a06320519a Sonny Jiang  2023-04-25  1277  
b6d1a06320519a Sonny Jiang  2023-04-25  1278  	return ret;
b6d1a06320519a Sonny Jiang  2023-04-25  1279  }
b6d1a06320519a Sonny Jiang  2023-04-25  1280  

:::::: The code at line 1263 was first introduced by commit
:::::: b6d1a06320519ac3bfda6ce81067a1bc409b9cff drm/amdgpu: add VCN_5_0_0 IP block support

:::::: TO: Sonny Jiang <sonny.jiang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
