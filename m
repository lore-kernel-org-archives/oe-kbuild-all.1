Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C20F20125B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739446766; cv=none; b=smM+5/yYPg3tVJJjlo0wHR7b/Be2Vv4Prxd9QJf75ftTLD6E3iJfsh+Iic42i7nzPhede84SniQVP9etSRwPyBT3Z2+aiOtE2xxwA4yGisr3hkqdwpZYkAXDywy4Z8Mx74IWcQRZx/S806gxOtteiKUTuOc3WHiB+XIeK5AtQGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739446766; c=relaxed/simple;
	bh=E6s0mUYn6BnYrYtT+npFtyhZf3Vn1HQfGNHe5OKU5G0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JFjqQDZWGOMGAV7Q61p+y41Q8i1KwBrVDEg39J5GoXCD0H/Ate/ypahWHKDHLmhxM/7IDTZZq3PPuADWX8lCX6pZyhqeAeSozcHjglDUB33xKisdQJJbBWKYcgwkK/xyUhXaZ980PEDT3knGRVbHTcVsR9SX/U79fvPmnPQZ1jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhJ7CpfH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhJ7CpfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739446764; x=1770982764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E6s0mUYn6BnYrYtT+npFtyhZf3Vn1HQfGNHe5OKU5G0=;
  b=JhJ7CpfHg4QMH6J6RhJsejt8kwg5spjfeoxU0uwNmqZAq66M2jHusT+B
   xXyJayRyT7rJXpFamaRHHUqqvr/3uxWOYO9OgfcxQyQhQt6I6eH9285MJ
   YcZhhjJswR5lMnVZ4LNHnnDvzIUd7mVxkdZ+e+KsdhCgwsLSs475y5//U
   MrFptwt+D/CnPjUtJTpBaQud7i4sjoB2ynDE9Tjp8hIiO8b2HZnwDDTdc
   uLPCBskP6/QbPoE6Zs4732533OsfHDyUNamoXzrCMzOnW5LfD/kCDlVVa
   PEPAKW4WKcWbW86XVcM7M6g311D8d8YeQ9VbIU6COS8LfUwTaNJJkt4MC
   g==;
X-CSE-ConnectionGUID: Hb8L6BLRRUictmumEtUuAQ==
X-CSE-MsgGUID: JyZly6mvSci8qMWIGJKElQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40008146"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40008146"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 03:39:24 -0800
X-CSE-ConnectionGUID: yHl2ry7tQMOq1eUezaekNw==
X-CSE-MsgGUID: pn3v4fXyTEO6+mXbl01JIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113648994"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2025 03:39:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiXYu-0016yz-1j;
	Thu, 13 Feb 2025 11:39:20 +0000
Date: Thu, 13 Feb 2025 19:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Boyuan Zhang <Boyuan.Zhang@amd.com>
Subject: [agd5f:amd-staging-drm-next 2306/2320]
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:781: warning: expecting prototype for
 vcn_v2_5_enable_clock_gating_inst(). Prototype was for
 vcn_v2_5_enable_clock_gating() instead
Message-ID: <202502131948.uPfL1v3A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   f73e8ad616bce0bb1dfdedee4b871346a739b9c7
commit: 86d5e11eb3cfce62564272a8f0fb1c547cc0f8fe [2306/2320] drm/amdgpu/vcn2.5: split code along instances
config: x86_64-buildonly-randconfig-004-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131948.uPfL1v3A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131948.uPfL1v3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131948.uPfL1v3A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:781: warning: expecting prototype for vcn_v2_5_enable_clock_gating_inst(). Prototype was for vcn_v2_5_enable_clock_gating() instead


vim +781 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c

d2a2c64f53718a James Zhu    2019-12-18  771  
cbead2bdfcf1dd Leo Liu      2019-04-15  772  /**
86d5e11eb3cfce Alex Deucher 2024-11-13  773   * vcn_v2_5_enable_clock_gating_inst - enable VCN clock gating
cbead2bdfcf1dd Leo Liu      2019-04-15  774   *
cbead2bdfcf1dd Leo Liu      2019-04-15  775   * @adev: amdgpu_device pointer
86d5e11eb3cfce Alex Deucher 2024-11-13  776   * @i: instance to enable clockgating on
cbead2bdfcf1dd Leo Liu      2019-04-15  777   *
cbead2bdfcf1dd Leo Liu      2019-04-15  778   * Enable clock gating for VCN block
cbead2bdfcf1dd Leo Liu      2019-04-15  779   */
86d5e11eb3cfce Alex Deucher 2024-11-13  780  static void vcn_v2_5_enable_clock_gating(struct amdgpu_device *adev, int i)
cbead2bdfcf1dd Leo Liu      2019-04-15 @781  {
cbead2bdfcf1dd Leo Liu      2019-04-15  782  	uint32_t data = 0;
cbead2bdfcf1dd Leo Liu      2019-04-15  783  
fba4761ca00f9e Alex Deucher 2024-11-20  784  	if (adev->vcn.harvest_config & (1 << i))
86d5e11eb3cfce Alex Deucher 2024-11-13  785  		return;
cbead2bdfcf1dd Leo Liu      2019-04-15  786  	/* enable UVD CGC */
fba4761ca00f9e Alex Deucher 2024-11-20  787  	data = RREG32_SOC15(VCN, i, mmUVD_CGC_CTRL);
cbead2bdfcf1dd Leo Liu      2019-04-15  788  	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
cbead2bdfcf1dd Leo Liu      2019-04-15  789  		data |= 1 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
cbead2bdfcf1dd Leo Liu      2019-04-15  790  	else
cbead2bdfcf1dd Leo Liu      2019-04-15  791  		data |= 0 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
cbead2bdfcf1dd Leo Liu      2019-04-15  792  	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
cbead2bdfcf1dd Leo Liu      2019-04-15  793  	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
fba4761ca00f9e Alex Deucher 2024-11-20  794  	WREG32_SOC15(VCN, i, mmUVD_CGC_CTRL, data);
cbead2bdfcf1dd Leo Liu      2019-04-15  795  
fba4761ca00f9e Alex Deucher 2024-11-20  796  	data = RREG32_SOC15(VCN, i, mmUVD_CGC_CTRL);
cbead2bdfcf1dd Leo Liu      2019-04-15  797  	data |= (UVD_CGC_CTRL__UDEC_RE_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  798  		 | UVD_CGC_CTRL__UDEC_CM_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  799  		 | UVD_CGC_CTRL__UDEC_IT_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  800  		 | UVD_CGC_CTRL__UDEC_DB_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  801  		 | UVD_CGC_CTRL__UDEC_MP_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  802  		 | UVD_CGC_CTRL__SYS_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  803  		 | UVD_CGC_CTRL__UDEC_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  804  		 | UVD_CGC_CTRL__MPEG2_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  805  		 | UVD_CGC_CTRL__REGS_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  806  		 | UVD_CGC_CTRL__RBC_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  807  		 | UVD_CGC_CTRL__LMI_MC_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  808  		 | UVD_CGC_CTRL__LMI_UMC_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  809  		 | UVD_CGC_CTRL__IDCT_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  810  		 | UVD_CGC_CTRL__MPRD_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  811  		 | UVD_CGC_CTRL__MPC_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  812  		 | UVD_CGC_CTRL__LBSI_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  813  		 | UVD_CGC_CTRL__LRBBM_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  814  		 | UVD_CGC_CTRL__WCB_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  815  		 | UVD_CGC_CTRL__VCPU_MODE_MASK);
fba4761ca00f9e Alex Deucher 2024-11-20  816  	WREG32_SOC15(VCN, i, mmUVD_CGC_CTRL, data);
cbead2bdfcf1dd Leo Liu      2019-04-15  817  
fba4761ca00f9e Alex Deucher 2024-11-20  818  	data = RREG32_SOC15(VCN, i, mmUVD_SUVD_CGC_CTRL);
cbead2bdfcf1dd Leo Liu      2019-04-15  819  	data |= (UVD_SUVD_CGC_CTRL__SRE_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  820  		 | UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  821  		 | UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  822  		 | UVD_SUVD_CGC_CTRL__SCM_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  823  		 | UVD_SUVD_CGC_CTRL__SDB_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  824  		 | UVD_SUVD_CGC_CTRL__SCLR_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  825  		 | UVD_SUVD_CGC_CTRL__UVD_SC_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  826  		 | UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  827  		 | UVD_SUVD_CGC_CTRL__IME_MODE_MASK
cbead2bdfcf1dd Leo Liu      2019-04-15  828  		 | UVD_SUVD_CGC_CTRL__SITE_MODE_MASK);
fba4761ca00f9e Alex Deucher 2024-11-20  829  	WREG32_SOC15(VCN, i, mmUVD_SUVD_CGC_CTRL, data);
fba4761ca00f9e Alex Deucher 2024-11-20  830  }
cbead2bdfcf1dd Leo Liu      2019-04-15  831  

:::::: The code at line 781 was first introduced by commit
:::::: cbead2bdfcf1ddaa3e65de22a3f88034736a71fd drm/amdgpu: add VCN2.5 VCPU start and stop

:::::: TO: Leo Liu <leo.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
