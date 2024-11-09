Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C419F47E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 22:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731190446; cv=none; b=Lp+YQTR/To+FhQLUGCgGvrE3uVBkOvV4RSA2Rt9YGP57OBIBI6CVWN2swsYgREWO5JbwUCqq10rOdqMzKQtcY190Myc4TUSoN3lcrTEnmjsyDizd1XH7YlxOidQT5Pnc2bBm+8hIF33LUmoMWVIlUoIx/6AWUX52zRlzLVLYYWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731190446; c=relaxed/simple;
	bh=MJTZlKYAnCCCPVKnf2cD2ta+565CfLimxKCkMawUU2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/U8lCjtnRDbteYD5gh1YWwFvj+yHPUR5bQ2Q4XGiPrIbCi+rrtVdQRzXcp//c+l9SVatvE8Pw4YvcOrme6Hrf3keXOR8fxMD9sZKs/mRst1LBJb2iwFdZzgEG918G1SKUXalOykKS0xp3BJOqFNLRJLfbguYiiwzVLGWHwPjik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyPOVpgZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyPOVpgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731190444; x=1762726444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJTZlKYAnCCCPVKnf2cD2ta+565CfLimxKCkMawUU2g=;
  b=WyPOVpgZorcCMvWVZJdsPdyGcjl4wwK9VLeJyCEDeZiGtKusn+lObvGe
   w8L6uxSfHa894XkkTJ5XcrbwEtlzKLagfkY3rGz7seFh0iYLsf3WpDTtU
   oT9ZK7VSTG25iaT+TheqaNcJy+IfgUtkSaRwCmkJHBfUdkWVkVh6YDVf7
   0bDnG9EUrFkDp8YsTpWXUw8NIiAOxNzKB18QQ5PHzo/TPKVHEV3Fbgr8D
   6PTF/2UCcqDbOqHCMMakYNCa/86bRrQe68/fq39ElmgeGMns2mXNZ3RtT
   GZ8huFGbY8Ty7SpTzSHrxdCJ0Uih0U244N2dTj630fvNkNBbV5OX4U5GQ
   w==;
X-CSE-ConnectionGUID: XvGSnA6lTrmvfCc0GWh2YQ==
X-CSE-MsgGUID: 0O1UIXkoQUGPShwY7hFk8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="33904032"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="33904032"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 14:14:04 -0800
X-CSE-ConnectionGUID: L53iCD0tTYihz1Ij8cQ9dg==
X-CSE-MsgGUID: BRtujejmT0Ko0B6NTCOSLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86168251"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Nov 2024 14:14:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9tiR-000shT-1X;
	Sat, 09 Nov 2024 22:13:59 +0000
Date: Sun, 10 Nov 2024 06:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1235/1265]
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:994: warning: Function parameter or
 struct member 'inst' not described in 'vcn_v4_0_5_start'
Message-ID: <202411100611.w8JTQoGO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   51898784baa73c81c9401a271cf94e9ae1d026e1
commit: 9f226435a6846c8669d6dea57360cb5c9e0c3adf [1235/1265] drm/amdgpu: power vcn 4_0_5 by instance
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411100611.w8JTQoGO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100611.w8JTQoGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100611.w8JTQoGO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:994: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_5_start'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1203: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_5_stop'


vim +994 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c

547aad32edac17 Saleemkhan Jamadar 2023-06-13   984  
547aad32edac17 Saleemkhan Jamadar 2023-06-13   985  
547aad32edac17 Saleemkhan Jamadar 2023-06-13   986  /**
547aad32edac17 Saleemkhan Jamadar 2023-06-13   987   * vcn_v4_0_5_start - VCN start
547aad32edac17 Saleemkhan Jamadar 2023-06-13   988   *
547aad32edac17 Saleemkhan Jamadar 2023-06-13   989   * @adev: amdgpu_device pointer
547aad32edac17 Saleemkhan Jamadar 2023-06-13   990   *
547aad32edac17 Saleemkhan Jamadar 2023-06-13   991   * Start VCN block
547aad32edac17 Saleemkhan Jamadar 2023-06-13   992   */
9f226435a6846c Boyuan Zhang       2024-10-01   993  static int vcn_v4_0_5_start(struct amdgpu_device *adev, unsigned int inst)
547aad32edac17 Saleemkhan Jamadar 2023-06-13  @994  {
547aad32edac17 Saleemkhan Jamadar 2023-06-13   995  	volatile struct amdgpu_vcn4_fw_shared *fw_shared;
547aad32edac17 Saleemkhan Jamadar 2023-06-13   996  	struct amdgpu_ring *ring;
547aad32edac17 Saleemkhan Jamadar 2023-06-13   997  	uint32_t tmp;
9f226435a6846c Boyuan Zhang       2024-10-01   998  	int j, k, r;
547aad32edac17 Saleemkhan Jamadar 2023-06-13   999  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1000  	if (adev->pm.dpm_enabled)
9f226435a6846c Boyuan Zhang       2024-10-01  1001  		amdgpu_dpm_enable_vcn(adev, true, inst);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1002  
9f226435a6846c Boyuan Zhang       2024-10-01  1003  	if (adev->vcn.harvest_config & (1 << inst))
9f226435a6846c Boyuan Zhang       2024-10-01  1004  		return 0;
0b071245ddd985 Tim Huang          2024-07-23  1005  
9f226435a6846c Boyuan Zhang       2024-10-01  1006  	fw_shared = adev->vcn.inst[inst].fw_shared.cpu_addr;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1007  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1008  	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
9f226435a6846c Boyuan Zhang       2024-10-01  1009  		r = vcn_v4_0_5_start_dpg_mode(adev, inst, adev->vcn.indirect_sram);
9f226435a6846c Boyuan Zhang       2024-10-01  1010  		return r;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1011  	}
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1012  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1013  	/* disable VCN power gating */
9f226435a6846c Boyuan Zhang       2024-10-01  1014  	vcn_v4_0_5_disable_static_power_gating(adev, inst);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1015  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1016  	/* set VCN status busy */
9f226435a6846c Boyuan Zhang       2024-10-01  1017  	tmp = RREG32_SOC15(VCN, inst, regUVD_STATUS) | UVD_STATUS__UVD_BUSY;
9f226435a6846c Boyuan Zhang       2024-10-01  1018  	WREG32_SOC15(VCN, inst, regUVD_STATUS, tmp);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1019  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1020  	/*SW clock gating */
9f226435a6846c Boyuan Zhang       2024-10-01  1021  	vcn_v4_0_5_disable_clock_gating(adev, inst);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1022  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1023  	/* enable VCPU clock */
9f226435a6846c Boyuan Zhang       2024-10-01  1024  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL),
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1025  			UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1026  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1027  	/* disable master interrupt */
9f226435a6846c Boyuan Zhang       2024-10-01  1028  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_MASTINT_EN), 0,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1029  			~UVD_MASTINT_EN__VCPU_EN_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1030  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1031  	/* enable LMI MC and UMC channels */
9f226435a6846c Boyuan Zhang       2024-10-01  1032  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_LMI_CTRL2), 0,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1033  			~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1034  
9f226435a6846c Boyuan Zhang       2024-10-01  1035  	tmp = RREG32_SOC15(VCN, inst, regUVD_SOFT_RESET);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1036  	tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1037  	tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
9f226435a6846c Boyuan Zhang       2024-10-01  1038  	WREG32_SOC15(VCN, inst, regUVD_SOFT_RESET, tmp);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1039  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1040  	/* setup regUVD_LMI_CTRL */
9f226435a6846c Boyuan Zhang       2024-10-01  1041  	tmp = RREG32_SOC15(VCN, inst, regUVD_LMI_CTRL);
9f226435a6846c Boyuan Zhang       2024-10-01  1042  	WREG32_SOC15(VCN, inst, regUVD_LMI_CTRL, tmp |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1043  			UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1044  			UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1045  			UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1046  			UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1047  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1048  	/* setup regUVD_MPC_CNTL */
9f226435a6846c Boyuan Zhang       2024-10-01  1049  	tmp = RREG32_SOC15(VCN, inst, regUVD_MPC_CNTL);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1050  	tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1051  	tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
9f226435a6846c Boyuan Zhang       2024-10-01  1052  	WREG32_SOC15(VCN, inst, regUVD_MPC_CNTL, tmp);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1053  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1054  	/* setup UVD_MPC_SET_MUXA0 */
9f226435a6846c Boyuan Zhang       2024-10-01  1055  	WREG32_SOC15(VCN, inst, regUVD_MPC_SET_MUXA0,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1056  			((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1057  			 (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1058  			 (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1059  			 (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1060  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1061  	/* setup UVD_MPC_SET_MUXB0 */
9f226435a6846c Boyuan Zhang       2024-10-01  1062  	WREG32_SOC15(VCN, inst, regUVD_MPC_SET_MUXB0,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1063  			((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1064  			 (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1065  			 (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1066  			 (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1067  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1068  	/* setup UVD_MPC_SET_MUX */
9f226435a6846c Boyuan Zhang       2024-10-01  1069  	WREG32_SOC15(VCN, inst, regUVD_MPC_SET_MUX,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1070  			((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1071  			 (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1072  			 (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1073  
9f226435a6846c Boyuan Zhang       2024-10-01  1074  	vcn_v4_0_5_mc_resume(adev, inst);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1075  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1076  	/* VCN global tiling registers */
9f226435a6846c Boyuan Zhang       2024-10-01  1077  	WREG32_SOC15(VCN, inst, regUVD_GFX10_ADDR_CONFIG,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1078  			adev->gfx.config.gb_addr_config);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1079  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1080  	/* unblock VCPU register access */
9f226435a6846c Boyuan Zhang       2024-10-01  1081  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_RB_ARB_CTRL), 0,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1082  			~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1083  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1084  	/* release VCPU reset to boot */
9f226435a6846c Boyuan Zhang       2024-10-01  1085  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL), 0,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1086  			~UVD_VCPU_CNTL__BLK_RST_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1087  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1088  	for (j = 0; j < 10; ++j) {
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1089  		uint32_t status;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1090  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1091  		for (k = 0; k < 100; ++k) {
9f226435a6846c Boyuan Zhang       2024-10-01  1092  			status = RREG32_SOC15(VCN, inst, regUVD_STATUS);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1093  			if (status & 2)
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1094  				break;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1095  			mdelay(10);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1096  			if (amdgpu_emu_mode == 1)
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1097  				msleep(1);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1098  		}
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1099  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1100  		if (amdgpu_emu_mode == 1) {
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1101  			r = -1;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1102  			if (status & 2) {
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1103  				r = 0;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1104  				break;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1105  			}
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1106  		} else {
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1107  			r = 0;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1108  			if (status & 2)
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1109  				break;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1110  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1111  			dev_err(adev->dev,
9f226435a6846c Boyuan Zhang       2024-10-01  1112  				"VCN[%d] is not responding, trying to reset VCPU!!!\n", inst);
9f226435a6846c Boyuan Zhang       2024-10-01  1113  			WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL),
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1114  						UVD_VCPU_CNTL__BLK_RST_MASK,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1115  						~UVD_VCPU_CNTL__BLK_RST_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1116  			mdelay(10);
9f226435a6846c Boyuan Zhang       2024-10-01  1117  			WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL), 0,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1118  					~UVD_VCPU_CNTL__BLK_RST_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1119  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1120  			mdelay(10);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1121  			r = -1;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1122  		}
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1123  	}
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1124  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1125  	if (r) {
9f226435a6846c Boyuan Zhang       2024-10-01  1126  		dev_err(adev->dev, "VCN[%d] is not responding, giving up!!!\n", inst);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1127  		return r;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1128  	}
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1129  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1130  	/* enable master interrupt */
9f226435a6846c Boyuan Zhang       2024-10-01  1131  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_MASTINT_EN),
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1132  			UVD_MASTINT_EN__VCPU_EN_MASK,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1133  			~UVD_MASTINT_EN__VCPU_EN_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1134  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1135  	/* clear the busy bit of VCN_STATUS */
9f226435a6846c Boyuan Zhang       2024-10-01  1136  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_STATUS), 0,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1137  			~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1138  
9f226435a6846c Boyuan Zhang       2024-10-01  1139  	ring = &adev->vcn.inst[inst].ring_enc[0];
9f226435a6846c Boyuan Zhang       2024-10-01  1140  	WREG32_SOC15(VCN, inst, regVCN_RB1_DB_CTRL,
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1141  			ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1142  			VCN_RB1_DB_CTRL__EN_MASK);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1143  
9f226435a6846c Boyuan Zhang       2024-10-01  1144  	WREG32_SOC15(VCN, inst, regUVD_RB_BASE_LO, ring->gpu_addr);
9f226435a6846c Boyuan Zhang       2024-10-01  1145  	WREG32_SOC15(VCN, inst, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
9f226435a6846c Boyuan Zhang       2024-10-01  1146  	WREG32_SOC15(VCN, inst, regUVD_RB_SIZE, ring->ring_size / 4);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1147  
9f226435a6846c Boyuan Zhang       2024-10-01  1148  	tmp = RREG32_SOC15(VCN, inst, regVCN_RB_ENABLE);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1149  	tmp &= ~(VCN_RB_ENABLE__RB1_EN_MASK);
9f226435a6846c Boyuan Zhang       2024-10-01  1150  	WREG32_SOC15(VCN, inst, regVCN_RB_ENABLE, tmp);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1151  	fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
9f226435a6846c Boyuan Zhang       2024-10-01  1152  	WREG32_SOC15(VCN, inst, regUVD_RB_RPTR, 0);
9f226435a6846c Boyuan Zhang       2024-10-01  1153  	WREG32_SOC15(VCN, inst, regUVD_RB_WPTR, 0);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1154  
9f226435a6846c Boyuan Zhang       2024-10-01  1155  	tmp = RREG32_SOC15(VCN, inst, regUVD_RB_RPTR);
9f226435a6846c Boyuan Zhang       2024-10-01  1156  	WREG32_SOC15(VCN, inst, regUVD_RB_WPTR, tmp);
9f226435a6846c Boyuan Zhang       2024-10-01  1157  	ring->wptr = RREG32_SOC15(VCN, inst, regUVD_RB_WPTR);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1158  
9f226435a6846c Boyuan Zhang       2024-10-01  1159  	tmp = RREG32_SOC15(VCN, inst, regVCN_RB_ENABLE);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1160  	tmp |= VCN_RB_ENABLE__RB1_EN_MASK;
9f226435a6846c Boyuan Zhang       2024-10-01  1161  	WREG32_SOC15(VCN, inst, regVCN_RB_ENABLE, tmp);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1162  	fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1163  
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1164  	return 0;
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1165  }
547aad32edac17 Saleemkhan Jamadar 2023-06-13  1166  

:::::: The code at line 994 was first introduced by commit
:::::: 547aad32edac17a3ec4989d8aad2426d0cbeb590 drm/amdgpu: add VCN4 ip block support

:::::: TO: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
