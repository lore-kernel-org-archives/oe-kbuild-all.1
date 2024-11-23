Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485452309A9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 04:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732335249; cv=none; b=kN1GOpN1Oc0gOfFRd8wZYNtMTeP10x+d49f1wxmcOtprT62QoPU9i4jUVOOVi81T560kzIv90vfeyXl8S7ytTE/cDPdgQA2E1xPloDCwHeOUAtaCz5B+w8vedAarv686PCeW1L8YkwwtMJVZKaVc98TnEwIDtKi95LRx0kt3JIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732335249; c=relaxed/simple;
	bh=4N8JBSUr5bw98CboKTD9St9paU4Vcf6Jn8A4+ENYFKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CMDyvf4LBEfeXcrdxg4dPUim15EMS69cVh/Y/NHeGuvSaivm5WD0ESROLibgB3kmnVZ+Z2rSmK4DorMvILuUuXwnicte3sZFpibZ4dSkQmYOF0AnBS9+svu+3RYHPeKpg3I7qt0qyL20Ei4mG6StXFkJ2FciqNeMIo5PXO+vyjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjFKEd91; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjFKEd91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732335247; x=1763871247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4N8JBSUr5bw98CboKTD9St9paU4Vcf6Jn8A4+ENYFKw=;
  b=WjFKEd91uJW3HlKSm0PxyfJB2P2roaSfXppNSI2VLmtKQgILAKfeNJ0Z
   uH9PxUrB8AJwf9hdShhAiHfHyuBcXh5xR49uM1GyH3FnFJ5yJRXiCKV8i
   1QjEk+8wBW44s3TIJcI0QV71EGLkzdZOFxg1KMKsEEzYZeEh/ndT2MlQg
   qVI8stH5r7jKp/jYe6F1r6K5X+745Wcr9RvA0UowJvC7/ZmusCyzin9Sv
   YyuBzV2+XIA8IQoPG9je1/OqjNHI8Tu2yZ9L8t4bdKKRodawGJP5Ly+lE
   cMAvsmnuSaeC5z3DyqCNOktX4RJkiQi6/uPQWRhUiUXWRk4WntFz2RCKB
   w==;
X-CSE-ConnectionGUID: ZxCPYHPrR/2DjclZC7Z2eA==
X-CSE-MsgGUID: bE/uxwwRR3GcNv5Uwcay2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="35356129"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="35356129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 20:14:04 -0800
X-CSE-ConnectionGUID: VSFMw+EdTOqi5YLZIeosoA==
X-CSE-MsgGUID: pMojodSfTyOJI3AiChVKpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="114036851"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2024 20:14:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEhWy-0004Pv-2v;
	Sat, 23 Nov 2024 04:14:00 +0000
Date: Sat, 23 Nov 2024 12:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Sunil Khatri <sunil.khatri@amd.com>
Subject: [agd5f:amd-staging-drm-next 1202/1393]
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1506: warning: Function parameter or
 struct member 'ip_block' not described in 'vcn_v4_0_5_set_clockgating_state'
Message-ID: <202411231216.p1FD0BGI-lkp@intel.com>
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
commit: 12bdba8c6e0fec7de3b1567d4371cfc92d2c46b4 [1202/1393] drm/amdgpu: pass ip_block in set_clockgating_state
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241123/202411231216.p1FD0BGI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231216.p1FD0BGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231216.p1FD0BGI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1506: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_set_clockgating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1506: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_set_clockgating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1537: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_set_powergating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1537: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2012: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_set_clockgating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2012: warning: Excess function parameter 'handle' description in 'vcn_v4_0_set_clockgating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2043: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_set_powergating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2043: warning: Excess function parameter 'handle' description in 'vcn_v4_0_set_powergating_state'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1233: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_set_clockgating_state'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1233: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_set_clockgating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1264: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_set_powergating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1264: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_set_powergating_state'


vim +1506 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c

547aad32edac17a Saleemkhan Jamadar 2023-06-13  1495  
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1496  /**
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1497   * vcn_v4_0_5_set_clockgating_state - set VCN block clockgating state
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1498   *
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1499   * @handle: amdgpu_device pointer
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1500   * @state: clock gating state
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1501   *
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1502   * Set VCN block clockgating state
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1503   */
12bdba8c6e0fec7 Boyuan Zhang       2024-10-07  1504  static int vcn_v4_0_5_set_clockgating_state(struct amdgpu_ip_block *ip_block,
12bdba8c6e0fec7 Boyuan Zhang       2024-10-07  1505  					  enum amd_clockgating_state state)
547aad32edac17a Saleemkhan Jamadar 2023-06-13 @1506  {
12bdba8c6e0fec7 Boyuan Zhang       2024-10-07  1507  	struct amdgpu_device *adev = ip_block->adev;
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1508  	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1509  	int i;
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1510  
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1511  	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1512  		if (adev->vcn.harvest_config & (1 << i))
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1513  			continue;
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1514  
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1515  		if (enable) {
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1516  			if (RREG32_SOC15(VCN, i, regUVD_STATUS) != UVD_STATUS__IDLE)
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1517  				return -EBUSY;
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1518  			vcn_v4_0_5_enable_clock_gating(adev, i);
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1519  		} else {
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1520  			vcn_v4_0_5_disable_clock_gating(adev, i);
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1521  		}
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1522  	}
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1523  
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1524  	return 0;
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1525  }
547aad32edac17a Saleemkhan Jamadar 2023-06-13  1526  

:::::: The code at line 1506 was first introduced by commit
:::::: 547aad32edac17a3ec4989d8aad2426d0cbeb590 drm/amdgpu: add VCN4 ip block support

:::::: TO: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
