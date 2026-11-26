Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654038;
	b=rA5+VcyliMsiVZ75yuDi77dMG6artg68l7tHEoO0Xcry7MOpLWnBzLSvO0JALtRAlyR0
	 RrbGVIqLsfDf24uNxtajgnq9bYpsgPIAQmYxoFDafoLN7ojPX99Mr/UJzz/9HKTeeFO3w
	 M+u9QD9FC74eawev3UL7szGom1Y+R+iq0Sh+s9g23++eaPiCm9TLz8VBdHLU4a2bkbu9Q
	 8TKxtbPg+bY6z1x9OWVqKfQGJVd7qnvmgZRDI6GXdtC49mrzJbcUzRU8WNnrLo3EJq+m0
	 6hImFZ8754DVW8tRSjX22UuIS/tdMyNefPGE58oi16jpDvubTTpWJSGbpZ9hd5LGYzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654038;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JDwc4oyg8HCAMO2ZnyFUg2rF1sZ5bBUo79/5YZtawdI=;
	b=mHimdbwOKMDNWAnwwmDW+VtA1/d1+rtXUbGnGa2PqmfF+zdRlIFDxJ6u+rK2rF/HjF0C
	 xf+pUoZ1XTxMKxq8Q2wZcvpO0QwlLP4U6TGAzLNdZYPIedKPFeg+jKgpSf8gRx2QCMKIw
	 /cOPtYOnorK2HwUqSTK+j5ToGmMT0qzi9mPozbsVA9+u+4jHRIIyg0772ZOtLiSE+vfhs
	 h5Gvj7MpOXfsAqD6AEByLwqFtOyBf2fwaV8e6hmwV3vDcfAhNPsyTbT8so3HLrs15Tpiy
	 pbM9ODuA3JxUn9tvBJG1echc18mKjM8s7rAjkxCGQpugGFUWeUE2Z5hSBnuas09eycg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WuNjXUM4;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAAA606A321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 00:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAAA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WuNjXUM4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795654038; x=1827190038;
  h=date:from:to:cc:subject:message-id;
  bh=pcTJ0+ZrWqTCGaNajF355rdWsB8+wPRjDaA92pdh8vU=;
  b=WuNjXUM4ynjrvy6sy2/wiXI2Q6eCeme2qbQwND99NOvfU7MDSQkvVv4B
   xDB4egBu3FTLwudtVHBoNNXbHw80b8lo7jou2FET/Zw2xUNFQl8MGETXS
   qCZZcg0EOKOvZwBIgbzhOrTPJoaye+x0icTlRUyILPFc1/xZfHJintMhW
   O5fVZ2PQSuvPv9Olgi4NELhRrjWZ4vOmZQ5alsajaD0J1LhaUGrjCUnvm
   DIAF1VKx/KBF9i3YO+4Pz3sHzADnF0E7o5XL8G+3TvuWBg2LSciOWyZvz
   IpHk6mgrX3KlIwa6wGNrFTciXcjLgdjmezoU6vrjS2KkyDbJvbxVybTrJ
   Q==;
X-CSE-ConnectionGUID: k4sp0LRUT72dfJuroDrGQg==
X-CSE-MsgGUID: qkEQqjhrRaqK/ENY3VsLmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4616050"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4616050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:47:17 -0800
X-CSE-ConnectionGUID: pwZVS9abSqKerQFJkR8woQ==
X-CSE-MsgGUID: lamCwpmuTd6Tg1BwC+LDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11994793"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 25 Nov 2026 16:47:16 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWNdo-000000000BH-3c43;
	Thu, 26 Nov 2026 00:47:12 +0000
Date: Thu, 26 Nov 2026 01:47:02 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Min <Frank.Min@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Likun Gao <Likun.Gao@amd.com>
Subject: [agd5f:drm-next 241/243]
 drivers/gpu/drm/amd/amdgpu/imu_v13_0.c:264:30: warning: variable 'data' is
 uninitialized when used here
Message-ID: <20261126014511.ZZhOMtHO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   fc652f23f1c3c727e561ca66bafd58000208e3a9
commit: 9caddf5f7de76161aaa834f9e10fc5d9df76ad81 [241/243] drm/amdgpu: Add imu v13 ip block v2
config: mips-randconfig-2200-20261125 (https://download.01.org/0day-ci/archive/20261126/20261126014511.ZZhOMtHO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126014511.ZZhOMtHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126014511.ZZhOMtHO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/imu_v13_0.c:264:30: warning: variable 'data' is uninitialized when used here [-Wuninitialized]
     264 |                         program_imu_rlc_ram(adev, data, (const u32)size);
         |                                                   ^~~~
   drivers/gpu/drm/amd/amdgpu/imu_v13_0.c:256:17: note: initialize the variable 'data' to silence this warning
     256 |         const u32 *data;
         |                        ^
         |                         = NULL
   1 warning generated.


vim +/data +264 drivers/gpu/drm/amd/amdgpu/imu_v13_0.c

   252	
   253	static void imu_v13_0_program_rlc_ram(struct amdgpu_device *adev)
   254	{
   255		u32 reg_data, size = 0;
   256		const u32 *data;
   257		int r = -EINVAL;
   258	
   259		WREG32_SOC15(GC, 0, regGFX_IMU_RLC_RAM_INDEX, 0x2);
   260	
   261		switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
   262		case IP_VERSION(13, 0, 1):
   263			if (!r)
 > 264				program_imu_rlc_ram(adev, data, (const u32)size);
   265			break;
   266		default:
   267			BUG();
   268			break;
   269		}
   270	
   271		//Indicate the latest entry
   272		WREG32_SOC15(GC, 0, regGFX_IMU_RLC_RAM_ADDR_HIGH, 0);
   273		WREG32_SOC15(GC, 0, regGFX_IMU_RLC_RAM_ADDR_LOW, 0);
   274		WREG32_SOC15(GC, 0, regGFX_IMU_RLC_RAM_DATA, 0);
   275	
   276		reg_data = RREG32_SOC15(GC, 0, regGFX_IMU_RLC_RAM_INDEX);
   277		reg_data |= GFX_IMU_RLC_RAM_INDEX__RAM_VALID_MASK;
   278		WREG32_SOC15(GC, 0, regGFX_IMU_RLC_RAM_INDEX, reg_data);
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
