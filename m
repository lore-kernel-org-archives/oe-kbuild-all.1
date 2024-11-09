Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A6C1A00E2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731181740; cv=none; b=oZmrQ5M0q7gj2x0d1yzPGSDlQde1GvHljbv4VyBDY7xFqSKdD5fK3lAor1aLbBFaeD72CfCcLun83L7zW91e86JOjSIuw40oPXZDVkSoCYNWIQWxzKgi1c0Avw7JKZ1QRt55qPXjz/t7wYCRiRJoMIVPy65w8Vc+AIcrY+QwUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731181740; c=relaxed/simple;
	bh=p+5hW/4XdczdspYWeJqLYvwJMRlBFzCYjH9685sQW9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rOBElHbR6jYLADGRIZ51Kdmdfqpj/T4ukHvyl8w+Ku5pH8xhNBiIBxOeUSwGhlWlsa5uTuKkwYttgs7K4NJjhWLRv61RAvxZ/WMuPuD+zjyp1n95iDoeB6u+ahIe7ZATwkayrFJoLIz4WRajqyvoVw5C79Up9SUvBhUcrSekBcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auu7dDtI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auu7dDtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731181738; x=1762717738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+5hW/4XdczdspYWeJqLYvwJMRlBFzCYjH9685sQW9I=;
  b=auu7dDtI2agl1/CHaopKShQeCj1NwZWN2hWabUIdZiPKHeypVDIF9IT4
   Ib+oHSJE56D54tQkWSAJLbvEBOT1COlVOmA+7xusZzKyLibPlXcDcloi8
   IrEBh1Iu7jrPNqFq/pUJOdy3X3wdDijJ+HvMVfCfz4/ApSXqVjdpAPCqi
   WmNIeCzxBaL9jaglccM76imId5Ws1jRn/Hkkz+xKgPt94WED9JF92h6S8
   3elg3lfGriCm8ItRZsy5Hie++I5On5VJUFAqvOT1gM2OFr1ccb0jNYbsK
   kl5FqwMnkG7WGQIw42JZjuxs2vpBJ0ND/WZa3wJWen3AihNmzGuLKJNrP
   A==;
X-CSE-ConnectionGUID: X/uEZ0qRTG+auMpxaxnv5w==
X-CSE-MsgGUID: vFsce1k3RhCQYo9cQNyX1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="41666565"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="41666565"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 11:48:57 -0800
X-CSE-ConnectionGUID: SdkwZ6L0T8W+NygATKQi6Q==
X-CSE-MsgGUID: Si9FxzVBSx2fnQy+fqzzJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="117007855"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2024 11:48:56 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9rS1-000saI-2E;
	Sat, 09 Nov 2024 19:48:53 +0000
Date: Sun, 10 Nov 2024 03:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1231/1265]
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1094: warning: Function parameter or
 struct member 'inst' not described in 'vcn_v4_0_3_start'
Message-ID: <202411100329.CZeyrW18-lkp@intel.com>
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
commit: 5e90b2e1bb11c259eaf7bf0be4b3669dd6295d74 [1231/1265] drm/amdgpu: power vcn 4_0_3 by instance
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411100329.CZeyrW18-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100329.CZeyrW18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100329.CZeyrW18-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1094: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_3_start'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1300: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_3_stop'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1626: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_3_set_powergating_state'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1626: warning: Excess function parameter 'handle' description in 'vcn_v4_0_3_set_powergating_state'


vim +1094 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c

d117fd296456b0 Samir Dhume  2023-07-17  1085  
b889ef4ac98837 James Zhu    2022-05-24  1086  /**
b889ef4ac98837 James Zhu    2022-05-24  1087   * vcn_v4_0_3_start - VCN start
b889ef4ac98837 James Zhu    2022-05-24  1088   *
b889ef4ac98837 James Zhu    2022-05-24  1089   * @adev: amdgpu_device pointer
b889ef4ac98837 James Zhu    2022-05-24  1090   *
b889ef4ac98837 James Zhu    2022-05-24  1091   * Start VCN block
b889ef4ac98837 James Zhu    2022-05-24  1092   */
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1093  static int vcn_v4_0_3_start(struct amdgpu_device *adev, unsigned int inst)
b889ef4ac98837 James Zhu    2022-05-24 @1094  {
cf1f3737c2d336 James Zhu    2022-07-11  1095  	volatile struct amdgpu_vcn4_fw_shared *fw_shared;
b889ef4ac98837 James Zhu    2022-05-24  1096  	struct amdgpu_ring *ring;
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1097  	int j, k, r, vcn_inst;
b889ef4ac98837 James Zhu    2022-05-24  1098  	uint32_t tmp;
b889ef4ac98837 James Zhu    2022-05-24  1099  
b889ef4ac98837 James Zhu    2022-05-24  1100  	if (adev->pm.dpm_enabled)
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1101  		amdgpu_dpm_enable_vcn(adev, true, inst);
b889ef4ac98837 James Zhu    2022-05-24  1102  
762702ebd32459 James Zhu    2022-07-11  1103  	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1104  		r = vcn_v4_0_3_start_dpg_mode(adev, inst, adev->vcn.indirect_sram);
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1105  		return r;
762702ebd32459 James Zhu    2022-07-11  1106  	}
b889ef4ac98837 James Zhu    2022-05-24  1107  
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1108  	vcn_inst = GET_INST(VCN, inst);
b889ef4ac98837 James Zhu    2022-05-24  1109  	/* set VCN status busy */
fd91d38b527595 Lijo Lazar   2023-02-17  1110  	tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_STATUS) |
fd91d38b527595 Lijo Lazar   2023-02-17  1111  		  UVD_STATUS__UVD_BUSY;
fd91d38b527595 Lijo Lazar   2023-02-17  1112  	WREG32_SOC15(VCN, vcn_inst, regUVD_STATUS, tmp);
b889ef4ac98837 James Zhu    2022-05-24  1113  
b889ef4ac98837 James Zhu    2022-05-24  1114  	/*SW clock gating */
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1115  	vcn_v4_0_3_disable_clock_gating(adev, inst);
b889ef4ac98837 James Zhu    2022-05-24  1116  
b889ef4ac98837 James Zhu    2022-05-24  1117  	/* enable VCPU clock */
fd91d38b527595 Lijo Lazar   2023-02-17  1118  	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL),
fd91d38b527595 Lijo Lazar   2023-02-17  1119  		 UVD_VCPU_CNTL__CLK_EN_MASK,
fd91d38b527595 Lijo Lazar   2023-02-17  1120  		 ~UVD_VCPU_CNTL__CLK_EN_MASK);
b889ef4ac98837 James Zhu    2022-05-24  1121  
b889ef4ac98837 James Zhu    2022-05-24  1122  	/* disable master interrupt */
fd91d38b527595 Lijo Lazar   2023-02-17  1123  	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_MASTINT_EN), 0,
b889ef4ac98837 James Zhu    2022-05-24  1124  		 ~UVD_MASTINT_EN__VCPU_EN_MASK);
b889ef4ac98837 James Zhu    2022-05-24  1125  
b889ef4ac98837 James Zhu    2022-05-24  1126  	/* enable LMI MC and UMC channels */
fd91d38b527595 Lijo Lazar   2023-02-17  1127  	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_LMI_CTRL2), 0,
b889ef4ac98837 James Zhu    2022-05-24  1128  		 ~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
b889ef4ac98837 James Zhu    2022-05-24  1129  
fd91d38b527595 Lijo Lazar   2023-02-17  1130  	tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET);
b889ef4ac98837 James Zhu    2022-05-24  1131  	tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
b889ef4ac98837 James Zhu    2022-05-24  1132  	tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
fd91d38b527595 Lijo Lazar   2023-02-17  1133  	WREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET, tmp);
b889ef4ac98837 James Zhu    2022-05-24  1134  
b889ef4ac98837 James Zhu    2022-05-24  1135  	/* setup regUVD_LMI_CTRL */
fd91d38b527595 Lijo Lazar   2023-02-17  1136  	tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_LMI_CTRL);
fd91d38b527595 Lijo Lazar   2023-02-17  1137  	WREG32_SOC15(VCN, vcn_inst, regUVD_LMI_CTRL,
fd91d38b527595 Lijo Lazar   2023-02-17  1138  			 tmp | UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
b889ef4ac98837 James Zhu    2022-05-24  1139  				 UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
b889ef4ac98837 James Zhu    2022-05-24  1140  				 UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
b889ef4ac98837 James Zhu    2022-05-24  1141  				 UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
b889ef4ac98837 James Zhu    2022-05-24  1142  
b889ef4ac98837 James Zhu    2022-05-24  1143  	/* setup regUVD_MPC_CNTL */
fd91d38b527595 Lijo Lazar   2023-02-17  1144  	tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_MPC_CNTL);
b889ef4ac98837 James Zhu    2022-05-24  1145  	tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
b889ef4ac98837 James Zhu    2022-05-24  1146  	tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
fd91d38b527595 Lijo Lazar   2023-02-17  1147  	WREG32_SOC15(VCN, vcn_inst, regUVD_MPC_CNTL, tmp);
b889ef4ac98837 James Zhu    2022-05-24  1148  
b889ef4ac98837 James Zhu    2022-05-24  1149  	/* setup UVD_MPC_SET_MUXA0 */
fd91d38b527595 Lijo Lazar   2023-02-17  1150  	WREG32_SOC15(VCN, vcn_inst, regUVD_MPC_SET_MUXA0,
b889ef4ac98837 James Zhu    2022-05-24  1151  			 ((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
b889ef4ac98837 James Zhu    2022-05-24  1152  			  (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
b889ef4ac98837 James Zhu    2022-05-24  1153  			  (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
b889ef4ac98837 James Zhu    2022-05-24  1154  			  (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
b889ef4ac98837 James Zhu    2022-05-24  1155  
b889ef4ac98837 James Zhu    2022-05-24  1156  	/* setup UVD_MPC_SET_MUXB0 */
fd91d38b527595 Lijo Lazar   2023-02-17  1157  	WREG32_SOC15(VCN, vcn_inst, regUVD_MPC_SET_MUXB0,
b889ef4ac98837 James Zhu    2022-05-24  1158  			 ((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
b889ef4ac98837 James Zhu    2022-05-24  1159  			  (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
b889ef4ac98837 James Zhu    2022-05-24  1160  			  (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
b889ef4ac98837 James Zhu    2022-05-24  1161  			  (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
b889ef4ac98837 James Zhu    2022-05-24  1162  
b889ef4ac98837 James Zhu    2022-05-24  1163  	/* setup UVD_MPC_SET_MUX */
fd91d38b527595 Lijo Lazar   2023-02-17  1164  	WREG32_SOC15(VCN, vcn_inst, regUVD_MPC_SET_MUX,
b889ef4ac98837 James Zhu    2022-05-24  1165  			 ((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
b889ef4ac98837 James Zhu    2022-05-24  1166  			  (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
b889ef4ac98837 James Zhu    2022-05-24  1167  			  (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
b889ef4ac98837 James Zhu    2022-05-24  1168  
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1169  	vcn_v4_0_3_mc_resume(adev, inst);
b889ef4ac98837 James Zhu    2022-05-24  1170  
b889ef4ac98837 James Zhu    2022-05-24  1171  	/* VCN global tiling registers */
fd91d38b527595 Lijo Lazar   2023-02-17  1172  	WREG32_SOC15(VCN, vcn_inst, regUVD_GFX8_ADDR_CONFIG,
b889ef4ac98837 James Zhu    2022-05-24  1173  			 adev->gfx.config.gb_addr_config);
fd91d38b527595 Lijo Lazar   2023-02-17  1174  	WREG32_SOC15(VCN, vcn_inst, regUVD_GFX10_ADDR_CONFIG,
b889ef4ac98837 James Zhu    2022-05-24  1175  			 adev->gfx.config.gb_addr_config);
b889ef4ac98837 James Zhu    2022-05-24  1176  
b889ef4ac98837 James Zhu    2022-05-24  1177  	/* unblock VCPU register access */
fd91d38b527595 Lijo Lazar   2023-02-17  1178  	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_RB_ARB_CTRL), 0,
b889ef4ac98837 James Zhu    2022-05-24  1179  		 ~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
b889ef4ac98837 James Zhu    2022-05-24  1180  
b889ef4ac98837 James Zhu    2022-05-24  1181  	/* release VCPU reset to boot */
fd91d38b527595 Lijo Lazar   2023-02-17  1182  	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL), 0,
b889ef4ac98837 James Zhu    2022-05-24  1183  		 ~UVD_VCPU_CNTL__BLK_RST_MASK);
b889ef4ac98837 James Zhu    2022-05-24  1184  
b889ef4ac98837 James Zhu    2022-05-24  1185  	for (j = 0; j < 10; ++j) {
b889ef4ac98837 James Zhu    2022-05-24  1186  		uint32_t status;
b889ef4ac98837 James Zhu    2022-05-24  1187  
b889ef4ac98837 James Zhu    2022-05-24  1188  		for (k = 0; k < 100; ++k) {
fd91d38b527595 Lijo Lazar   2023-02-17  1189  			status = RREG32_SOC15(VCN, vcn_inst,
fd91d38b527595 Lijo Lazar   2023-02-17  1190  						  regUVD_STATUS);
b889ef4ac98837 James Zhu    2022-05-24  1191  			if (status & 2)
b889ef4ac98837 James Zhu    2022-05-24  1192  				break;
b889ef4ac98837 James Zhu    2022-05-24  1193  			mdelay(10);
b889ef4ac98837 James Zhu    2022-05-24  1194  		}
b889ef4ac98837 James Zhu    2022-05-24  1195  		r = 0;
b889ef4ac98837 James Zhu    2022-05-24  1196  		if (status & 2)
b889ef4ac98837 James Zhu    2022-05-24  1197  			break;
b889ef4ac98837 James Zhu    2022-05-24  1198  
b889ef4ac98837 James Zhu    2022-05-24  1199  		DRM_DEV_ERROR(adev->dev,
b889ef4ac98837 James Zhu    2022-05-24  1200  			"VCN decode not responding, trying to reset the VCPU!!!\n");
fd91d38b527595 Lijo Lazar   2023-02-17  1201  		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst,
fd91d38b527595 Lijo Lazar   2023-02-17  1202  					  regUVD_VCPU_CNTL),
b889ef4ac98837 James Zhu    2022-05-24  1203  			 UVD_VCPU_CNTL__BLK_RST_MASK,
b889ef4ac98837 James Zhu    2022-05-24  1204  			 ~UVD_VCPU_CNTL__BLK_RST_MASK);
b889ef4ac98837 James Zhu    2022-05-24  1205  		mdelay(10);
fd91d38b527595 Lijo Lazar   2023-02-17  1206  		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst,
fd91d38b527595 Lijo Lazar   2023-02-17  1207  					  regUVD_VCPU_CNTL),
fd91d38b527595 Lijo Lazar   2023-02-17  1208  			 0, ~UVD_VCPU_CNTL__BLK_RST_MASK);
b889ef4ac98837 James Zhu    2022-05-24  1209  
b889ef4ac98837 James Zhu    2022-05-24  1210  		mdelay(10);
b889ef4ac98837 James Zhu    2022-05-24  1211  		r = -1;
b889ef4ac98837 James Zhu    2022-05-24  1212  	}
b889ef4ac98837 James Zhu    2022-05-24  1213  
b889ef4ac98837 James Zhu    2022-05-24  1214  	if (r) {
b889ef4ac98837 James Zhu    2022-05-24  1215  		DRM_DEV_ERROR(adev->dev, "VCN decode not responding, giving up!!!\n");
b889ef4ac98837 James Zhu    2022-05-24  1216  		return r;
b889ef4ac98837 James Zhu    2022-05-24  1217  	}
b889ef4ac98837 James Zhu    2022-05-24  1218  
b889ef4ac98837 James Zhu    2022-05-24  1219  	/* enable master interrupt */
fd91d38b527595 Lijo Lazar   2023-02-17  1220  	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_MASTINT_EN),
b889ef4ac98837 James Zhu    2022-05-24  1221  		 UVD_MASTINT_EN__VCPU_EN_MASK,
b889ef4ac98837 James Zhu    2022-05-24  1222  		 ~UVD_MASTINT_EN__VCPU_EN_MASK);
b889ef4ac98837 James Zhu    2022-05-24  1223  
b889ef4ac98837 James Zhu    2022-05-24  1224  	/* clear the busy bit of VCN_STATUS */
fd91d38b527595 Lijo Lazar   2023-02-17  1225  	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_STATUS), 0,
b889ef4ac98837 James Zhu    2022-05-24  1226  		 ~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
b889ef4ac98837 James Zhu    2022-05-24  1227  
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1228  	ring = &adev->vcn.inst[inst].ring_enc[0];
5e90b2e1bb11c2 Boyuan Zhang 2024-10-01  1229  	fw_shared = adev->vcn.inst[inst].fw_shared.cpu_addr;
b889ef4ac98837 James Zhu    2022-05-24  1230  
b889ef4ac98837 James Zhu    2022-05-24  1231  	/* program the RB_BASE for ring buffer */
fd91d38b527595 Lijo Lazar   2023-02-17  1232  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_LO,
b889ef4ac98837 James Zhu    2022-05-24  1233  			 lower_32_bits(ring->gpu_addr));
fd91d38b527595 Lijo Lazar   2023-02-17  1234  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_HI,
b889ef4ac98837 James Zhu    2022-05-24  1235  			 upper_32_bits(ring->gpu_addr));
b889ef4ac98837 James Zhu    2022-05-24  1236  
fd91d38b527595 Lijo Lazar   2023-02-17  1237  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_SIZE,
fd91d38b527595 Lijo Lazar   2023-02-17  1238  			 ring->ring_size / sizeof(uint32_t));
b889ef4ac98837 James Zhu    2022-05-24  1239  
b889ef4ac98837 James Zhu    2022-05-24  1240  	/* resetting ring, fw should not check RB ring */
fd91d38b527595 Lijo Lazar   2023-02-17  1241  	tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
da044aaeb31ac1 James Zhu    2022-12-17  1242  	tmp &= ~(VCN_RB_ENABLE__RB_EN_MASK);
fd91d38b527595 Lijo Lazar   2023-02-17  1243  	WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
b889ef4ac98837 James Zhu    2022-05-24  1244  
b889ef4ac98837 James Zhu    2022-05-24  1245  	/* Initialize the ring buffer's read and write pointers */
fd91d38b527595 Lijo Lazar   2023-02-17  1246  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_RPTR, 0);
fd91d38b527595 Lijo Lazar   2023-02-17  1247  	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR, 0);
b889ef4ac98837 James Zhu    2022-05-24  1248  
fd91d38b527595 Lijo Lazar   2023-02-17  1249  	tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
da044aaeb31ac1 James Zhu    2022-12-17  1250  	tmp |= VCN_RB_ENABLE__RB_EN_MASK;
fd91d38b527595 Lijo Lazar   2023-02-17  1251  	WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
b889ef4ac98837 James Zhu    2022-05-24  1252  
fd91d38b527595 Lijo Lazar   2023-02-17  1253  	ring->wptr = RREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR);
762702ebd32459 James Zhu    2022-07-11  1254  	fw_shared->sq.queue_mode &=
762702ebd32459 James Zhu    2022-07-11  1255  		cpu_to_le32(~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF));
b889ef4ac98837 James Zhu    2022-05-24  1256  
b889ef4ac98837 James Zhu    2022-05-24  1257  	return 0;
b889ef4ac98837 James Zhu    2022-05-24  1258  }
b889ef4ac98837 James Zhu    2022-05-24  1259  

:::::: The code at line 1094 was first introduced by commit
:::::: b889ef4ac98837838c38f7b9f72bba2f33ee367d drm/amdgpu/vcn: add vcn support for VCN4_0_3

:::::: TO: James Zhu <James.Zhu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
