Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA00179FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 01:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732324731; cv=none; b=QfmQ2pvp7CK1tjYpF6XdlVjkLPwUrCBIwyyYc90ta9FBqHucABQ+1dZEXTRBtglXkYrMMPaO/KCBlTesr5RjYd3pZXXHgEgx6vGKo/ZeVgDL8wuokOyvvTKfersaU6GGwEM2O/4Lv37VMdbU+jvsQvRewgbTxKjKvsk1S/aiRlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732324731; c=relaxed/simple;
	bh=BpYxOESyvwD+PIZluqmBa+ea3ypBj9DNkB19TdxCScc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bzf3nqJumIm9BY+0HT+8VafIW1OMrBNwKECMLqvBcVRy5pUAKtNPDfrqQqu09qz4YK9mzlDxwPn5C1SJE+KltpetdLE5sAfO2PQRc+bRjAQcAfNFkW1VKDNQEfwBXiO9a/vS/bqGDNV5NrkG3QIRKFVqgIiRmKYeFhPFchfvBko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXbq3slM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXbq3slM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732324729; x=1763860729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BpYxOESyvwD+PIZluqmBa+ea3ypBj9DNkB19TdxCScc=;
  b=NXbq3slMOfo2xxVxBA8HhbfcJxoyyePoRM/glZImZtrYBUkTJQF5r4BH
   gFny/drk4nlj+NAFWl7Hd9sjnB3VjP9fziIXKlrnnyonR0KylEQvbcX7N
   mWLOYcOoka1xCnXoKB0d82f5BWOYqGadRIJQqJxExLk8uvyNMjzs5fukm
   +MzPl7t3Kfwq6NbigXe6iTCv0rE+NDycbwwC7FDEjgekEaDRR0kw9ApPw
   IxF3TpaPHJFVId6uNkpHGDuS2FOKl4lM+73d8ygFKuusJwnyHm9zCDlYv
   kNWwVpfPfLgNlqy3QdgxVNcvJgVmkFsNuVuDZdDjLZ6FsE64jo96a2EXO
   w==;
X-CSE-ConnectionGUID: OWUmv/sESvOivHK3zgUKfw==
X-CSE-MsgGUID: 8RGYhO7hQ8qpziVkjnh30Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="35350482"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="35350482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 17:18:48 -0800
X-CSE-ConnectionGUID: 8uIxijVaS72uGPwymgwneg==
X-CSE-MsgGUID: RKHGOZuyTsubpLRlmab+yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="91161385"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Nov 2024 17:18:47 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEenN-0004Kh-0L;
	Sat, 23 Nov 2024 01:18:45 +0000
Date: Sat, 23 Nov 2024 09:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Sunil Khatri <sunil.khatri@amd.com>
Subject: [agd5f:amd-staging-drm-next 1201/1393]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1263: warning: Function parameter or
 struct member 'ip_block' not described in 'vcn_v5_0_0_set_powergating_state'
Message-ID: <202411230934.sBNTi6Vm-lkp@intel.com>
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
head:   52a0eae4140af43141a217398938aaa26241fa39
commit: c9188ea9675f468076c72de18953e39cce688eef [1201/1393] drm/amdgpu: pass ip_block in set_powergating_state
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241123/202411230934.sBNTi6Vm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230934.sBNTi6Vm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230934.sBNTi6Vm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1263: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_set_powergating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1263: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1536: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_set_powergating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1536: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2042: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_set_powergating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2042: warning: Excess function parameter 'handle' description in 'vcn_v4_0_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1628: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_3_set_powergating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1628: warning: Excess function parameter 'handle' description in 'vcn_v4_0_3_set_powergating_state'


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
