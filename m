Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20AAECF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731173097; cv=none; b=bCIsyJncRk72zryKHYL+ZrXi7VuynUunicWdvkUJKSr7D7ArzN90L5w46m89MWoSHzuykAGP5T8gJC4p/HRnpVPbgVIHD1oY8EyN4/kX6/YLFS+sPIm5DAuvvAyisrGuJ+aUKmhkW91E3tIa5vjdiDT1+PwZkN2+lsMlV2gvFzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731173097; c=relaxed/simple;
	bh=8SJYGfPhVrQzFULZqqVMJ6MSwp3Tlz9Yp8up+YyMgpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdXbQ2TMc30pHJ79aSiJOT3FH/5mSsR9za8k4KI2zFbtKDFOVfwSrQlGMi4HGob/SQp2PS/DQna+yXyIiba9VdKq6a13ywtaOWnqRQ10fae9T8MpR9F+JbFQqbY4cUG5tLGVx0qv6W5XXP7XkUmEwIcPoPYA513/Tt8IfG/7VeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCWImX1j; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCWImX1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731173095; x=1762709095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8SJYGfPhVrQzFULZqqVMJ6MSwp3Tlz9Yp8up+YyMgpU=;
  b=VCWImX1jZaEBl8X40L+nRdmpTqhpGi04Al6KtwZzpuaB9VYrGJ3JyyK+
   9U2C4dgCGOs1u5aobfnAqOkd7F6Us6aYIyUNXj2M84NCmHHth6XbB1LUu
   8NNbQfIdRllMmT7vb0cGDpJxmDL0mwNj4fRhBl5gzgNgOacEexyrj3W2m
   pgvS8HcKaJezonaWfIUd3wXXhqnyKXMyEKXWMTwSW5bP6DYi5yT8AiAFD
   9Euf8zPhAGVEfxFoqs6Td39C6FmmmpzLldbAWsqjXzzC/6apPFdP9x4mF
   zml6ca7inu1HBd5gbQjYv6Rjv6oqdoeNCZDSxRHUmytNj4YIYrAL6+M2U
   A==;
X-CSE-ConnectionGUID: SZW3x9CSTheyDX9b73ZYXw==
X-CSE-MsgGUID: +Pte7YcrTcOO7qUQrJuIBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="31139172"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="31139172"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 09:24:54 -0800
X-CSE-ConnectionGUID: uHyCaYPoShyeIg4U0xhbiA==
X-CSE-MsgGUID: Ly+LGikyTc6U64mMeSuP7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86184078"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Nov 2024 09:24:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9pCc-000sVQ-1U;
	Sat, 09 Nov 2024 17:24:50 +0000
Date: Sun, 10 Nov 2024 01:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1230/1265]
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:1084: warning: Function parameter or
 struct member 'inst' not described in 'vcn_v4_0_start'
Message-ID: <202411100144.xYLeonWK-lkp@intel.com>
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
commit: d7cd13c444008fcb42597a901c8fe002781a36cb [1230/1265] drm/amdgpu: power vcn 4_0 by instance
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411100144.xYLeonWK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100144.xYLeonWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100144.xYLeonWK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:1084: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_start'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:1542: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_stop'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2003: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_set_clockgating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2003: warning: Excess function parameter 'handle' description in 'vcn_v4_0_set_clockgating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2034: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_set_powergating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2034: warning: Excess function parameter 'handle' description in 'vcn_v4_0_set_powergating_state'


vim +1084 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c

8da1170a16e4d4 Leo Liu      2022-04-13  1074  
8da1170a16e4d4 Leo Liu      2022-04-13  1075  
8da1170a16e4d4 Leo Liu      2022-04-13  1076  /**
8da1170a16e4d4 Leo Liu      2022-04-13  1077   * vcn_v4_0_start - VCN start
8da1170a16e4d4 Leo Liu      2022-04-13  1078   *
8da1170a16e4d4 Leo Liu      2022-04-13  1079   * @adev: amdgpu_device pointer
8da1170a16e4d4 Leo Liu      2022-04-13  1080   *
8da1170a16e4d4 Leo Liu      2022-04-13  1081   * Start VCN block
8da1170a16e4d4 Leo Liu      2022-04-13  1082   */
d7cd13c444008f Boyuan Zhang 2024-10-01  1083  static int vcn_v4_0_start(struct amdgpu_device *adev, unsigned int inst)
8da1170a16e4d4 Leo Liu      2022-04-13 @1084  {
8da1170a16e4d4 Leo Liu      2022-04-13  1085  	volatile struct amdgpu_vcn4_fw_shared *fw_shared;
8da1170a16e4d4 Leo Liu      2022-04-13  1086  	struct amdgpu_ring *ring;
8da1170a16e4d4 Leo Liu      2022-04-13  1087  	uint32_t tmp;
d7cd13c444008f Boyuan Zhang 2024-10-01  1088  	int j, k, r;
8da1170a16e4d4 Leo Liu      2022-04-13  1089  
8da1170a16e4d4 Leo Liu      2022-04-13  1090  	if (adev->pm.dpm_enabled)
d7cd13c444008f Boyuan Zhang 2024-10-01  1091  		amdgpu_dpm_enable_vcn(adev, true, inst);
8da1170a16e4d4 Leo Liu      2022-04-13  1092  
d7cd13c444008f Boyuan Zhang 2024-10-01  1093  	if (adev->vcn.harvest_config & (1 << inst))
d7cd13c444008f Boyuan Zhang 2024-10-01  1094  		return 0;
0b071245ddd985 Tim Huang    2024-07-23  1095  
d7cd13c444008f Boyuan Zhang 2024-10-01  1096  	fw_shared = adev->vcn.inst[inst].fw_shared.cpu_addr;
bb4f196b47b655 Ruijing Dong 2022-05-31  1097  
8da1170a16e4d4 Leo Liu      2022-04-13  1098  	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
d7cd13c444008f Boyuan Zhang 2024-10-01  1099  		r = vcn_v4_0_start_dpg_mode(adev, inst, adev->vcn.indirect_sram);
d7cd13c444008f Boyuan Zhang 2024-10-01  1100  		return r;
8da1170a16e4d4 Leo Liu      2022-04-13  1101  	}
8da1170a16e4d4 Leo Liu      2022-04-13  1102  
8da1170a16e4d4 Leo Liu      2022-04-13  1103  	/* disable VCN power gating */
d7cd13c444008f Boyuan Zhang 2024-10-01  1104  	vcn_v4_0_disable_static_power_gating(adev, inst);
8da1170a16e4d4 Leo Liu      2022-04-13  1105  
8da1170a16e4d4 Leo Liu      2022-04-13  1106  	/* set VCN status busy */
d7cd13c444008f Boyuan Zhang 2024-10-01  1107  	tmp = RREG32_SOC15(VCN, inst, regUVD_STATUS) | UVD_STATUS__UVD_BUSY;
d7cd13c444008f Boyuan Zhang 2024-10-01  1108  	WREG32_SOC15(VCN, inst, regUVD_STATUS, tmp);
8da1170a16e4d4 Leo Liu      2022-04-13  1109  
8da1170a16e4d4 Leo Liu      2022-04-13  1110  	/*SW clock gating */
d7cd13c444008f Boyuan Zhang 2024-10-01  1111  	vcn_v4_0_disable_clock_gating(adev, inst);
8da1170a16e4d4 Leo Liu      2022-04-13  1112  
8da1170a16e4d4 Leo Liu      2022-04-13  1113  	/* enable VCPU clock */
d7cd13c444008f Boyuan Zhang 2024-10-01  1114  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL),
8da1170a16e4d4 Leo Liu      2022-04-13  1115  			UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1116  
8da1170a16e4d4 Leo Liu      2022-04-13  1117  	/* disable master interrupt */
d7cd13c444008f Boyuan Zhang 2024-10-01  1118  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_MASTINT_EN), 0,
8da1170a16e4d4 Leo Liu      2022-04-13  1119  			~UVD_MASTINT_EN__VCPU_EN_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1120  
8da1170a16e4d4 Leo Liu      2022-04-13  1121  	/* enable LMI MC and UMC channels */
d7cd13c444008f Boyuan Zhang 2024-10-01  1122  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_LMI_CTRL2), 0,
8da1170a16e4d4 Leo Liu      2022-04-13  1123  			~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1124  
d7cd13c444008f Boyuan Zhang 2024-10-01  1125  	tmp = RREG32_SOC15(VCN, inst, regUVD_SOFT_RESET);
8da1170a16e4d4 Leo Liu      2022-04-13  1126  	tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
8da1170a16e4d4 Leo Liu      2022-04-13  1127  	tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
d7cd13c444008f Boyuan Zhang 2024-10-01  1128  	WREG32_SOC15(VCN, inst, regUVD_SOFT_RESET, tmp);
8da1170a16e4d4 Leo Liu      2022-04-13  1129  
8da1170a16e4d4 Leo Liu      2022-04-13  1130  	/* setup regUVD_LMI_CTRL */
d7cd13c444008f Boyuan Zhang 2024-10-01  1131  	tmp = RREG32_SOC15(VCN, inst, regUVD_LMI_CTRL);
d7cd13c444008f Boyuan Zhang 2024-10-01  1132  	WREG32_SOC15(VCN, inst, regUVD_LMI_CTRL, tmp |
8da1170a16e4d4 Leo Liu      2022-04-13  1133  			UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
8da1170a16e4d4 Leo Liu      2022-04-13  1134  			UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
8da1170a16e4d4 Leo Liu      2022-04-13  1135  			UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
8da1170a16e4d4 Leo Liu      2022-04-13  1136  			UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1137  
8da1170a16e4d4 Leo Liu      2022-04-13  1138  	/* setup regUVD_MPC_CNTL */
d7cd13c444008f Boyuan Zhang 2024-10-01  1139  	tmp = RREG32_SOC15(VCN, inst, regUVD_MPC_CNTL);
8da1170a16e4d4 Leo Liu      2022-04-13  1140  	tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
8da1170a16e4d4 Leo Liu      2022-04-13  1141  	tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
d7cd13c444008f Boyuan Zhang 2024-10-01  1142  	WREG32_SOC15(VCN, inst, regUVD_MPC_CNTL, tmp);
8da1170a16e4d4 Leo Liu      2022-04-13  1143  
8da1170a16e4d4 Leo Liu      2022-04-13  1144  	/* setup UVD_MPC_SET_MUXA0 */
d7cd13c444008f Boyuan Zhang 2024-10-01  1145  	WREG32_SOC15(VCN, inst, regUVD_MPC_SET_MUXA0,
8da1170a16e4d4 Leo Liu      2022-04-13  1146  			((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13  1147  			 (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13  1148  			 (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13  1149  			 (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
8da1170a16e4d4 Leo Liu      2022-04-13  1150  
8da1170a16e4d4 Leo Liu      2022-04-13  1151  	/* setup UVD_MPC_SET_MUXB0 */
d7cd13c444008f Boyuan Zhang 2024-10-01  1152  	WREG32_SOC15(VCN, inst, regUVD_MPC_SET_MUXB0,
8da1170a16e4d4 Leo Liu      2022-04-13  1153  			((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13  1154  			 (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13  1155  			 (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13  1156  			 (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
8da1170a16e4d4 Leo Liu      2022-04-13  1157  
8da1170a16e4d4 Leo Liu      2022-04-13  1158  	/* setup UVD_MPC_SET_MUX */
d7cd13c444008f Boyuan Zhang 2024-10-01  1159  	WREG32_SOC15(VCN, inst, regUVD_MPC_SET_MUX,
8da1170a16e4d4 Leo Liu      2022-04-13  1160  			((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13  1161  			 (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
8da1170a16e4d4 Leo Liu      2022-04-13  1162  			 (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
8da1170a16e4d4 Leo Liu      2022-04-13  1163  
d7cd13c444008f Boyuan Zhang 2024-10-01  1164  	vcn_v4_0_mc_resume(adev, inst);
8da1170a16e4d4 Leo Liu      2022-04-13  1165  
8da1170a16e4d4 Leo Liu      2022-04-13  1166  	/* VCN global tiling registers */
d7cd13c444008f Boyuan Zhang 2024-10-01  1167  	WREG32_SOC15(VCN, inst, regUVD_GFX10_ADDR_CONFIG,
8da1170a16e4d4 Leo Liu      2022-04-13  1168  			adev->gfx.config.gb_addr_config);
8da1170a16e4d4 Leo Liu      2022-04-13  1169  
8da1170a16e4d4 Leo Liu      2022-04-13  1170  	/* unblock VCPU register access */
d7cd13c444008f Boyuan Zhang 2024-10-01  1171  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_RB_ARB_CTRL), 0,
8da1170a16e4d4 Leo Liu      2022-04-13  1172  			~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1173  
8da1170a16e4d4 Leo Liu      2022-04-13  1174  	/* release VCPU reset to boot */
d7cd13c444008f Boyuan Zhang 2024-10-01  1175  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL), 0,
8da1170a16e4d4 Leo Liu      2022-04-13  1176  			~UVD_VCPU_CNTL__BLK_RST_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1177  
8da1170a16e4d4 Leo Liu      2022-04-13  1178  	for (j = 0; j < 10; ++j) {
8da1170a16e4d4 Leo Liu      2022-04-13  1179  		uint32_t status;
8da1170a16e4d4 Leo Liu      2022-04-13  1180  
8da1170a16e4d4 Leo Liu      2022-04-13  1181  		for (k = 0; k < 100; ++k) {
d7cd13c444008f Boyuan Zhang 2024-10-01  1182  			status = RREG32_SOC15(VCN, inst, regUVD_STATUS);
8da1170a16e4d4 Leo Liu      2022-04-13  1183  			if (status & 2)
8da1170a16e4d4 Leo Liu      2022-04-13  1184  				break;
8da1170a16e4d4 Leo Liu      2022-04-13  1185  			mdelay(10);
8da1170a16e4d4 Leo Liu      2022-04-13  1186  			if (amdgpu_emu_mode == 1)
8da1170a16e4d4 Leo Liu      2022-04-13  1187  				msleep(1);
8da1170a16e4d4 Leo Liu      2022-04-13  1188  		}
8da1170a16e4d4 Leo Liu      2022-04-13  1189  
8da1170a16e4d4 Leo Liu      2022-04-13  1190  		if (amdgpu_emu_mode == 1) {
736f7308d3e620 Sonny Jiang  2022-07-21  1191  			r = -1;
8da1170a16e4d4 Leo Liu      2022-04-13  1192  			if (status & 2) {
8da1170a16e4d4 Leo Liu      2022-04-13  1193  				r = 0;
8da1170a16e4d4 Leo Liu      2022-04-13  1194  				break;
8da1170a16e4d4 Leo Liu      2022-04-13  1195  			}
8da1170a16e4d4 Leo Liu      2022-04-13  1196  		} else {
8da1170a16e4d4 Leo Liu      2022-04-13  1197  			r = 0;
8da1170a16e4d4 Leo Liu      2022-04-13  1198  			if (status & 2)
8da1170a16e4d4 Leo Liu      2022-04-13  1199  				break;
8da1170a16e4d4 Leo Liu      2022-04-13  1200  
d7cd13c444008f Boyuan Zhang 2024-10-01  1201  			dev_err(adev->dev, "VCN[%d] is not responding, trying to reset the VCPU!!!\n", inst);
d7cd13c444008f Boyuan Zhang 2024-10-01  1202  			WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL),
8da1170a16e4d4 Leo Liu      2022-04-13  1203  						UVD_VCPU_CNTL__BLK_RST_MASK,
8da1170a16e4d4 Leo Liu      2022-04-13  1204  						~UVD_VCPU_CNTL__BLK_RST_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1205  			mdelay(10);
d7cd13c444008f Boyuan Zhang 2024-10-01  1206  			WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL), 0,
8da1170a16e4d4 Leo Liu      2022-04-13  1207  					~UVD_VCPU_CNTL__BLK_RST_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1208  
8da1170a16e4d4 Leo Liu      2022-04-13  1209  			mdelay(10);
8da1170a16e4d4 Leo Liu      2022-04-13  1210  			r = -1;
8da1170a16e4d4 Leo Liu      2022-04-13  1211  		}
8da1170a16e4d4 Leo Liu      2022-04-13  1212  	}
8da1170a16e4d4 Leo Liu      2022-04-13  1213  
8da1170a16e4d4 Leo Liu      2022-04-13  1214  	if (r) {
d7cd13c444008f Boyuan Zhang 2024-10-01  1215  		dev_err(adev->dev, "VCN[%d] is not responding, giving up!!!\n", inst);
8da1170a16e4d4 Leo Liu      2022-04-13  1216  		return r;
8da1170a16e4d4 Leo Liu      2022-04-13  1217  	}
8da1170a16e4d4 Leo Liu      2022-04-13  1218  
8da1170a16e4d4 Leo Liu      2022-04-13  1219  	/* enable master interrupt */
d7cd13c444008f Boyuan Zhang 2024-10-01  1220  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_MASTINT_EN),
8da1170a16e4d4 Leo Liu      2022-04-13  1221  			UVD_MASTINT_EN__VCPU_EN_MASK,
8da1170a16e4d4 Leo Liu      2022-04-13  1222  			~UVD_MASTINT_EN__VCPU_EN_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1223  
8da1170a16e4d4 Leo Liu      2022-04-13  1224  	/* clear the busy bit of VCN_STATUS */
d7cd13c444008f Boyuan Zhang 2024-10-01  1225  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_STATUS), 0,
8da1170a16e4d4 Leo Liu      2022-04-13  1226  			~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
8da1170a16e4d4 Leo Liu      2022-04-13  1227  
d7cd13c444008f Boyuan Zhang 2024-10-01  1228  	ring = &adev->vcn.inst[inst].ring_enc[0];
d7cd13c444008f Boyuan Zhang 2024-10-01  1229  	WREG32_SOC15(VCN, inst, regVCN_RB1_DB_CTRL,
bb4f196b47b655 Ruijing Dong 2022-05-31  1230  			ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
bb4f196b47b655 Ruijing Dong 2022-05-31  1231  			VCN_RB1_DB_CTRL__EN_MASK);
8da1170a16e4d4 Leo Liu      2022-04-13  1232  
d7cd13c444008f Boyuan Zhang 2024-10-01  1233  	WREG32_SOC15(VCN, inst, regUVD_RB_BASE_LO, ring->gpu_addr);
d7cd13c444008f Boyuan Zhang 2024-10-01  1234  	WREG32_SOC15(VCN, inst, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
d7cd13c444008f Boyuan Zhang 2024-10-01  1235  	WREG32_SOC15(VCN, inst, regUVD_RB_SIZE, ring->ring_size / 4);
8da1170a16e4d4 Leo Liu      2022-04-13  1236  
d7cd13c444008f Boyuan Zhang 2024-10-01  1237  	tmp = RREG32_SOC15(VCN, inst, regVCN_RB_ENABLE);
bb4f196b47b655 Ruijing Dong 2022-05-31  1238  	tmp &= ~(VCN_RB_ENABLE__RB1_EN_MASK);
d7cd13c444008f Boyuan Zhang 2024-10-01  1239  	WREG32_SOC15(VCN, inst, regVCN_RB_ENABLE, tmp);
bb4f196b47b655 Ruijing Dong 2022-05-31  1240  	fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
d7cd13c444008f Boyuan Zhang 2024-10-01  1241  	WREG32_SOC15(VCN, inst, regUVD_RB_RPTR, 0);
d7cd13c444008f Boyuan Zhang 2024-10-01  1242  	WREG32_SOC15(VCN, inst, regUVD_RB_WPTR, 0);
8da1170a16e4d4 Leo Liu      2022-04-13  1243  
d7cd13c444008f Boyuan Zhang 2024-10-01  1244  	tmp = RREG32_SOC15(VCN, inst, regUVD_RB_RPTR);
d7cd13c444008f Boyuan Zhang 2024-10-01  1245  	WREG32_SOC15(VCN, inst, regUVD_RB_WPTR, tmp);
d7cd13c444008f Boyuan Zhang 2024-10-01  1246  	ring->wptr = RREG32_SOC15(VCN, inst, regUVD_RB_WPTR);
bb4f196b47b655 Ruijing Dong 2022-05-31  1247  
d7cd13c444008f Boyuan Zhang 2024-10-01  1248  	tmp = RREG32_SOC15(VCN, inst, regVCN_RB_ENABLE);
bb4f196b47b655 Ruijing Dong 2022-05-31  1249  	tmp |= VCN_RB_ENABLE__RB1_EN_MASK;
d7cd13c444008f Boyuan Zhang 2024-10-01  1250  	WREG32_SOC15(VCN, inst, regVCN_RB_ENABLE, tmp);
8da1170a16e4d4 Leo Liu      2022-04-13  1251  	fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
8da1170a16e4d4 Leo Liu      2022-04-13  1252  
8da1170a16e4d4 Leo Liu      2022-04-13  1253  	return 0;
8da1170a16e4d4 Leo Liu      2022-04-13  1254  }
8da1170a16e4d4 Leo Liu      2022-04-13  1255  

:::::: The code at line 1084 was first introduced by commit
:::::: 8da1170a16e4d4b49fa07d1f75ad480847ff7eca drm/amdgpu: add VCN4 ip block support

:::::: TO: Leo Liu <leo.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
