Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A4F611E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 00:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731198491; cv=none; b=s7koeTjZosL5OCkzFGo5y34aAHp2Yg8kfzPDY6qmhUWl2hLtxVUJ5bRsUvVY9lEGlgHyjRcgSbhOY2BEJaNBJfhaLOlP2N3zKKIIDhp4Io39V6kd8yuMcRTz9FXRWey662f3nQcNekKMk/N8FErfSGUzXuUQ7BnKdgqm6yhup8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731198491; c=relaxed/simple;
	bh=7QmZvafM+AE+o/4NldaaQ+akaJTXnldJqYO1k8am38U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZeYOBiSBbYLFig0BANPimmOsh2Z1A8A6ve/Wb9BfLo9Zc2a2B/XgrwEi74MhfqzjmIyzbBSDmsqGeZ8V14M7NjaShCnwV96Ix6BNzIdcIKjwPANLDZA/wThiLAmowCoC7c5M5KWqO3idA7L1x6QX0Ct7acSsi4xiA2luJMRwt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4g1U5Ri; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4g1U5Ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731198488; x=1762734488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QmZvafM+AE+o/4NldaaQ+akaJTXnldJqYO1k8am38U=;
  b=A4g1U5RigEkzxMVZCCJWmIa4WLt8sfn1O0CTXF+UGbZrsXCIQtVxeHg+
   9xAferTihLp/JCamj8RRPSKNnOCbERADfAFxUCu+gC1goSaaFEFxZlS22
   HHndpn2eYj1dGGFLSnZrQVW2qmPoj7M6PszK/o2p6VxlqWr0oci6BiBG5
   dtQN04HNUo0J95Vij5wpG2UJgoz+XPXogn8iaQMQ6m02R8n0wIV6JHu9C
   Cye8+rwirKPlIoQEPxYzEcWvyWlrA/2Zty2p4qLIRgyLsiU98DFsZ7QmQ
   h5OMvx1jr3tav8o9Si8+Mvc2fqVsPx4hhawGW7TFw54Td1D9Y3+z7vXyu
   A==;
X-CSE-ConnectionGUID: +GbGCtlyRQG0qp56jnX2Lg==
X-CSE-MsgGUID: mCvDRv3CR9exkYFEWNkSCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="33906888"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="33906888"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 16:28:07 -0800
X-CSE-ConnectionGUID: jxuIIxtSRwiW2qcCcU/RKQ==
X-CSE-MsgGUID: tnMwj+DsRHmqElSGq0IPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86141825"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2024 16:28:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9voB-000sn4-20;
	Sun, 10 Nov 2024 00:28:03 +0000
Date: Sun, 10 Nov 2024 08:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1239/1265]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:755: warning: Function parameter or
 struct member 'inst' not described in 'vcn_v5_0_0_start'
Message-ID: <202411100829.TC3hIEuD-lkp@intel.com>
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
commit: 125ac87dc334a061954596ccdbabcc86ec68f0b1 [1239/1265] drm/amdgpu: power vcn 5_0_0 by instance
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411100829.TC3hIEuD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100829.TC3hIEuD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100829.TC3hIEuD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:755: warning: Function parameter or struct member 'inst' not described in 'vcn_v5_0_0_start'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:937: warning: Function parameter or struct member 'inst' not described in 'vcn_v5_0_0_stop'


vim +755 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c

b6d1a06320519a Sonny Jiang  2023-04-25   746  
b6d1a06320519a Sonny Jiang  2023-04-25   747  /**
b6d1a06320519a Sonny Jiang  2023-04-25   748   * vcn_v5_0_0_start - VCN start
b6d1a06320519a Sonny Jiang  2023-04-25   749   *
b6d1a06320519a Sonny Jiang  2023-04-25   750   * @adev: amdgpu_device pointer
b6d1a06320519a Sonny Jiang  2023-04-25   751   *
b6d1a06320519a Sonny Jiang  2023-04-25   752   * Start VCN block
b6d1a06320519a Sonny Jiang  2023-04-25   753   */
125ac87dc334a0 Boyuan Zhang 2024-10-01   754  static int vcn_v5_0_0_start(struct amdgpu_device *adev, unsigned int inst)
b6d1a06320519a Sonny Jiang  2023-04-25  @755  {
754c366e41d237 Sonny Jiang  2024-04-23   756  	volatile struct amdgpu_vcn5_fw_shared *fw_shared;
b6d1a06320519a Sonny Jiang  2023-04-25   757  	struct amdgpu_ring *ring;
b6d1a06320519a Sonny Jiang  2023-04-25   758  	uint32_t tmp;
125ac87dc334a0 Boyuan Zhang 2024-10-01   759  	int j, k, r;
b6d1a06320519a Sonny Jiang  2023-04-25   760  
b6d1a06320519a Sonny Jiang  2023-04-25   761  	if (adev->pm.dpm_enabled)
125ac87dc334a0 Boyuan Zhang 2024-10-01   762  		amdgpu_dpm_enable_vcn(adev, true, inst);
b6d1a06320519a Sonny Jiang  2023-04-25   763  
125ac87dc334a0 Boyuan Zhang 2024-10-01   764  	if (adev->vcn.harvest_config & (1 << inst))
125ac87dc334a0 Boyuan Zhang 2024-10-01   765  		return 0;
0b071245ddd985 Tim Huang    2024-07-23   766  
125ac87dc334a0 Boyuan Zhang 2024-10-01   767  	fw_shared = adev->vcn.inst[inst].fw_shared.cpu_addr;
b6d1a06320519a Sonny Jiang  2023-04-25   768  
b6d1a06320519a Sonny Jiang  2023-04-25   769  	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
125ac87dc334a0 Boyuan Zhang 2024-10-01   770  		r = vcn_v5_0_0_start_dpg_mode(adev, inst, adev->vcn.indirect_sram);
125ac87dc334a0 Boyuan Zhang 2024-10-01   771  		return r;
b6d1a06320519a Sonny Jiang  2023-04-25   772  	}
b6d1a06320519a Sonny Jiang  2023-04-25   773  
b6d1a06320519a Sonny Jiang  2023-04-25   774  	/* disable VCN power gating */
125ac87dc334a0 Boyuan Zhang 2024-10-01   775  	vcn_v5_0_0_disable_static_power_gating(adev, inst);
b6d1a06320519a Sonny Jiang  2023-04-25   776  
b6d1a06320519a Sonny Jiang  2023-04-25   777  	/* set VCN status busy */
125ac87dc334a0 Boyuan Zhang 2024-10-01   778  	tmp = RREG32_SOC15(VCN, inst, regUVD_STATUS) | UVD_STATUS__UVD_BUSY;
125ac87dc334a0 Boyuan Zhang 2024-10-01   779  	WREG32_SOC15(VCN, inst, regUVD_STATUS, tmp);
b6d1a06320519a Sonny Jiang  2023-04-25   780  
b6d1a06320519a Sonny Jiang  2023-04-25   781  	/* enable VCPU clock */
125ac87dc334a0 Boyuan Zhang 2024-10-01   782  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL),
b6d1a06320519a Sonny Jiang  2023-04-25   783  		UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   784  
b6d1a06320519a Sonny Jiang  2023-04-25   785  	/* disable master interrupt */
125ac87dc334a0 Boyuan Zhang 2024-10-01   786  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_MASTINT_EN), 0,
b6d1a06320519a Sonny Jiang  2023-04-25   787  		~UVD_MASTINT_EN__VCPU_EN_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   788  
b6d1a06320519a Sonny Jiang  2023-04-25   789  	/* enable LMI MC and UMC channels */
125ac87dc334a0 Boyuan Zhang 2024-10-01   790  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_LMI_CTRL2), 0,
b6d1a06320519a Sonny Jiang  2023-04-25   791  		~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   792  
125ac87dc334a0 Boyuan Zhang 2024-10-01   793  	tmp = RREG32_SOC15(VCN, inst, regUVD_SOFT_RESET);
b6d1a06320519a Sonny Jiang  2023-04-25   794  	tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
b6d1a06320519a Sonny Jiang  2023-04-25   795  	tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
125ac87dc334a0 Boyuan Zhang 2024-10-01   796  	WREG32_SOC15(VCN, inst, regUVD_SOFT_RESET, tmp);
b6d1a06320519a Sonny Jiang  2023-04-25   797  
b6d1a06320519a Sonny Jiang  2023-04-25   798  	/* setup regUVD_LMI_CTRL */
125ac87dc334a0 Boyuan Zhang 2024-10-01   799  	tmp = RREG32_SOC15(VCN, inst, regUVD_LMI_CTRL);
125ac87dc334a0 Boyuan Zhang 2024-10-01   800  	WREG32_SOC15(VCN, inst, regUVD_LMI_CTRL, tmp |
b6d1a06320519a Sonny Jiang  2023-04-25   801  		UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
b6d1a06320519a Sonny Jiang  2023-04-25   802  		UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
b6d1a06320519a Sonny Jiang  2023-04-25   803  		UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
b6d1a06320519a Sonny Jiang  2023-04-25   804  		UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   805  
125ac87dc334a0 Boyuan Zhang 2024-10-01   806  	vcn_v5_0_0_mc_resume(adev, inst);
b6d1a06320519a Sonny Jiang  2023-04-25   807  
b6d1a06320519a Sonny Jiang  2023-04-25   808  	/* VCN global tiling registers */
125ac87dc334a0 Boyuan Zhang 2024-10-01   809  	WREG32_SOC15(VCN, inst, regUVD_GFX10_ADDR_CONFIG,
b6d1a06320519a Sonny Jiang  2023-04-25   810  		adev->gfx.config.gb_addr_config);
b6d1a06320519a Sonny Jiang  2023-04-25   811  
b6d1a06320519a Sonny Jiang  2023-04-25   812  	/* unblock VCPU register access */
125ac87dc334a0 Boyuan Zhang 2024-10-01   813  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_RB_ARB_CTRL), 0,
b6d1a06320519a Sonny Jiang  2023-04-25   814  		~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   815  
b6d1a06320519a Sonny Jiang  2023-04-25   816  	/* release VCPU reset to boot */
125ac87dc334a0 Boyuan Zhang 2024-10-01   817  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL), 0,
b6d1a06320519a Sonny Jiang  2023-04-25   818  		~UVD_VCPU_CNTL__BLK_RST_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   819  
b6d1a06320519a Sonny Jiang  2023-04-25   820  	for (j = 0; j < 10; ++j) {
b6d1a06320519a Sonny Jiang  2023-04-25   821  		uint32_t status;
b6d1a06320519a Sonny Jiang  2023-04-25   822  
b6d1a06320519a Sonny Jiang  2023-04-25   823  		for (k = 0; k < 100; ++k) {
125ac87dc334a0 Boyuan Zhang 2024-10-01   824  			status = RREG32_SOC15(VCN, inst, regUVD_STATUS);
b6d1a06320519a Sonny Jiang  2023-04-25   825  			if (status & 2)
b6d1a06320519a Sonny Jiang  2023-04-25   826  				break;
b6d1a06320519a Sonny Jiang  2023-04-25   827  			mdelay(10);
b6d1a06320519a Sonny Jiang  2023-04-25   828  			if (amdgpu_emu_mode == 1)
b6d1a06320519a Sonny Jiang  2023-04-25   829  				msleep(1);
b6d1a06320519a Sonny Jiang  2023-04-25   830  		}
b6d1a06320519a Sonny Jiang  2023-04-25   831  
b6d1a06320519a Sonny Jiang  2023-04-25   832  		if (amdgpu_emu_mode == 1) {
b6d1a06320519a Sonny Jiang  2023-04-25   833  			r = -1;
b6d1a06320519a Sonny Jiang  2023-04-25   834  			if (status & 2) {
b6d1a06320519a Sonny Jiang  2023-04-25   835  				r = 0;
b6d1a06320519a Sonny Jiang  2023-04-25   836  				break;
b6d1a06320519a Sonny Jiang  2023-04-25   837  			}
b6d1a06320519a Sonny Jiang  2023-04-25   838  		} else {
b6d1a06320519a Sonny Jiang  2023-04-25   839  			r = 0;
b6d1a06320519a Sonny Jiang  2023-04-25   840  			if (status & 2)
b6d1a06320519a Sonny Jiang  2023-04-25   841  				break;
b6d1a06320519a Sonny Jiang  2023-04-25   842  
b6d1a06320519a Sonny Jiang  2023-04-25   843  			dev_err(adev->dev,
125ac87dc334a0 Boyuan Zhang 2024-10-01   844  				"VCN[%d] is not responding, trying to reset the VCPU!!!\n", inst);
125ac87dc334a0 Boyuan Zhang 2024-10-01   845  			WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL),
b6d1a06320519a Sonny Jiang  2023-04-25   846  						UVD_VCPU_CNTL__BLK_RST_MASK,
b6d1a06320519a Sonny Jiang  2023-04-25   847  						~UVD_VCPU_CNTL__BLK_RST_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   848  			mdelay(10);
125ac87dc334a0 Boyuan Zhang 2024-10-01   849  			WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL), 0,
b6d1a06320519a Sonny Jiang  2023-04-25   850  						~UVD_VCPU_CNTL__BLK_RST_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   851  
b6d1a06320519a Sonny Jiang  2023-04-25   852  			mdelay(10);
b6d1a06320519a Sonny Jiang  2023-04-25   853  			r = -1;
b6d1a06320519a Sonny Jiang  2023-04-25   854  		}
b6d1a06320519a Sonny Jiang  2023-04-25   855  	}
b6d1a06320519a Sonny Jiang  2023-04-25   856  
b6d1a06320519a Sonny Jiang  2023-04-25   857  	if (r) {
125ac87dc334a0 Boyuan Zhang 2024-10-01   858  		dev_err(adev->dev, "VCN[%d] is not responding, giving up!!!\n", inst);
b6d1a06320519a Sonny Jiang  2023-04-25   859  		return r;
b6d1a06320519a Sonny Jiang  2023-04-25   860  	}
b6d1a06320519a Sonny Jiang  2023-04-25   861  
b6d1a06320519a Sonny Jiang  2023-04-25   862  	/* enable master interrupt */
125ac87dc334a0 Boyuan Zhang 2024-10-01   863  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_MASTINT_EN),
b6d1a06320519a Sonny Jiang  2023-04-25   864  			UVD_MASTINT_EN__VCPU_EN_MASK,
b6d1a06320519a Sonny Jiang  2023-04-25   865  			~UVD_MASTINT_EN__VCPU_EN_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   866  
b6d1a06320519a Sonny Jiang  2023-04-25   867  	/* clear the busy bit of VCN_STATUS */
125ac87dc334a0 Boyuan Zhang 2024-10-01   868  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_STATUS), 0,
b6d1a06320519a Sonny Jiang  2023-04-25   869  		~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
b6d1a06320519a Sonny Jiang  2023-04-25   870  
125ac87dc334a0 Boyuan Zhang 2024-10-01   871  	ring = &adev->vcn.inst[inst].ring_enc[0];
125ac87dc334a0 Boyuan Zhang 2024-10-01   872  	WREG32_SOC15(VCN, inst, regVCN_RB1_DB_CTRL,
b6d1a06320519a Sonny Jiang  2023-04-25   873  		ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
b6d1a06320519a Sonny Jiang  2023-04-25   874  		VCN_RB1_DB_CTRL__EN_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   875  
125ac87dc334a0 Boyuan Zhang 2024-10-01   876  	WREG32_SOC15(VCN, inst, regUVD_RB_BASE_LO, ring->gpu_addr);
125ac87dc334a0 Boyuan Zhang 2024-10-01   877  	WREG32_SOC15(VCN, inst, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
125ac87dc334a0 Boyuan Zhang 2024-10-01   878  	WREG32_SOC15(VCN, inst, regUVD_RB_SIZE, ring->ring_size / 4);
b6d1a06320519a Sonny Jiang  2023-04-25   879  
125ac87dc334a0 Boyuan Zhang 2024-10-01   880  	tmp = RREG32_SOC15(VCN, inst, regVCN_RB_ENABLE);
b6d1a06320519a Sonny Jiang  2023-04-25   881  	tmp &= ~(VCN_RB_ENABLE__RB1_EN_MASK);
125ac87dc334a0 Boyuan Zhang 2024-10-01   882  	WREG32_SOC15(VCN, inst, regVCN_RB_ENABLE, tmp);
b6d1a06320519a Sonny Jiang  2023-04-25   883  	fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
125ac87dc334a0 Boyuan Zhang 2024-10-01   884  	WREG32_SOC15(VCN, inst, regUVD_RB_RPTR, 0);
125ac87dc334a0 Boyuan Zhang 2024-10-01   885  	WREG32_SOC15(VCN, inst, regUVD_RB_WPTR, 0);
b6d1a06320519a Sonny Jiang  2023-04-25   886  
125ac87dc334a0 Boyuan Zhang 2024-10-01   887  	tmp = RREG32_SOC15(VCN, inst, regUVD_RB_RPTR);
125ac87dc334a0 Boyuan Zhang 2024-10-01   888  	WREG32_SOC15(VCN, inst, regUVD_RB_WPTR, tmp);
125ac87dc334a0 Boyuan Zhang 2024-10-01   889  	ring->wptr = RREG32_SOC15(VCN, inst, regUVD_RB_WPTR);
b6d1a06320519a Sonny Jiang  2023-04-25   890  
125ac87dc334a0 Boyuan Zhang 2024-10-01   891  	tmp = RREG32_SOC15(VCN, inst, regVCN_RB_ENABLE);
b6d1a06320519a Sonny Jiang  2023-04-25   892  	tmp |= VCN_RB_ENABLE__RB1_EN_MASK;
125ac87dc334a0 Boyuan Zhang 2024-10-01   893  	WREG32_SOC15(VCN, inst, regVCN_RB_ENABLE, tmp);
b6d1a06320519a Sonny Jiang  2023-04-25   894  	fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
b6d1a06320519a Sonny Jiang  2023-04-25   895  
b6d1a06320519a Sonny Jiang  2023-04-25   896  	return 0;
b6d1a06320519a Sonny Jiang  2023-04-25   897  }
b6d1a06320519a Sonny Jiang  2023-04-25   898  
b6d1a06320519a Sonny Jiang  2023-04-25   899  /**
b6d1a06320519a Sonny Jiang  2023-04-25   900   * vcn_v5_0_0_stop_dpg_mode - VCN stop with dpg mode
b6d1a06320519a Sonny Jiang  2023-04-25   901   *
b6d1a06320519a Sonny Jiang  2023-04-25   902   * @adev: amdgpu_device pointer
b6d1a06320519a Sonny Jiang  2023-04-25   903   * @inst_idx: instance number index
b6d1a06320519a Sonny Jiang  2023-04-25   904   *
b6d1a06320519a Sonny Jiang  2023-04-25   905   * Stop VCN block with dpg mode
b6d1a06320519a Sonny Jiang  2023-04-25   906   */
b6d1a06320519a Sonny Jiang  2023-04-25   907  static void vcn_v5_0_0_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
b6d1a06320519a Sonny Jiang  2023-04-25   908  {
b6d1a06320519a Sonny Jiang  2023-04-25   909  	struct dpg_pause_state state = {.fw_based = VCN_DPG_STATE__UNPAUSE};
b6d1a06320519a Sonny Jiang  2023-04-25   910  	uint32_t tmp;
b6d1a06320519a Sonny Jiang  2023-04-25   911  
b6d1a06320519a Sonny Jiang  2023-04-25   912  	vcn_v5_0_0_pause_dpg_mode(adev, inst_idx, &state);
b6d1a06320519a Sonny Jiang  2023-04-25   913  
b6d1a06320519a Sonny Jiang  2023-04-25   914  	/* Wait for power status to be 1 */
b6d1a06320519a Sonny Jiang  2023-04-25   915  	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS, 1,
b6d1a06320519a Sonny Jiang  2023-04-25   916  		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   917  
b6d1a06320519a Sonny Jiang  2023-04-25   918  	/* wait for read ptr to be equal to write ptr */
b6d1a06320519a Sonny Jiang  2023-04-25   919  	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR);
b6d1a06320519a Sonny Jiang  2023-04-25   920  	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_RB_RPTR, tmp, 0xFFFFFFFF);
b6d1a06320519a Sonny Jiang  2023-04-25   921  
b6d1a06320519a Sonny Jiang  2023-04-25   922  	/* disable dynamic power gating mode */
b6d1a06320519a Sonny Jiang  2023-04-25   923  	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 0,
b6d1a06320519a Sonny Jiang  2023-04-25   924  		~UVD_POWER_STATUS__UVD_PG_MODE_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   925  
b6d1a06320519a Sonny Jiang  2023-04-25   926  	return;
b6d1a06320519a Sonny Jiang  2023-04-25   927  }
b6d1a06320519a Sonny Jiang  2023-04-25   928  
b6d1a06320519a Sonny Jiang  2023-04-25   929  /**
b6d1a06320519a Sonny Jiang  2023-04-25   930   * vcn_v5_0_0_stop - VCN stop
b6d1a06320519a Sonny Jiang  2023-04-25   931   *
b6d1a06320519a Sonny Jiang  2023-04-25   932   * @adev: amdgpu_device pointer
b6d1a06320519a Sonny Jiang  2023-04-25   933   *
b6d1a06320519a Sonny Jiang  2023-04-25   934   * Stop VCN block
b6d1a06320519a Sonny Jiang  2023-04-25   935   */
125ac87dc334a0 Boyuan Zhang 2024-10-01   936  static int vcn_v5_0_0_stop(struct amdgpu_device *adev, unsigned int inst)
b6d1a06320519a Sonny Jiang  2023-04-25  @937  {
754c366e41d237 Sonny Jiang  2024-04-23   938  	volatile struct amdgpu_vcn5_fw_shared *fw_shared;
b6d1a06320519a Sonny Jiang  2023-04-25   939  	uint32_t tmp;
125ac87dc334a0 Boyuan Zhang 2024-10-01   940  	int r = 0;
b6d1a06320519a Sonny Jiang  2023-04-25   941  
125ac87dc334a0 Boyuan Zhang 2024-10-01   942  	if (adev->vcn.harvest_config & (1 << inst))
125ac87dc334a0 Boyuan Zhang 2024-10-01   943  		goto done;
0b071245ddd985 Tim Huang    2024-07-23   944  
125ac87dc334a0 Boyuan Zhang 2024-10-01   945  	fw_shared = adev->vcn.inst[inst].fw_shared.cpu_addr;
b6d1a06320519a Sonny Jiang  2023-04-25   946  	fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
b6d1a06320519a Sonny Jiang  2023-04-25   947  
b6d1a06320519a Sonny Jiang  2023-04-25   948  	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
125ac87dc334a0 Boyuan Zhang 2024-10-01   949  		vcn_v5_0_0_stop_dpg_mode(adev, inst);
125ac87dc334a0 Boyuan Zhang 2024-10-01   950  		goto done;
b6d1a06320519a Sonny Jiang  2023-04-25   951  	}
b6d1a06320519a Sonny Jiang  2023-04-25   952  
b6d1a06320519a Sonny Jiang  2023-04-25   953  	/* wait for vcn idle */
125ac87dc334a0 Boyuan Zhang 2024-10-01   954  	r = SOC15_WAIT_ON_RREG(VCN, inst, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);
b6d1a06320519a Sonny Jiang  2023-04-25   955  	if (r)
b6d1a06320519a Sonny Jiang  2023-04-25   956  		return r;
b6d1a06320519a Sonny Jiang  2023-04-25   957  
b6d1a06320519a Sonny Jiang  2023-04-25   958  	tmp = UVD_LMI_STATUS__VCPU_LMI_WRITE_CLEAN_MASK |
b6d1a06320519a Sonny Jiang  2023-04-25   959  		  UVD_LMI_STATUS__READ_CLEAN_MASK |
b6d1a06320519a Sonny Jiang  2023-04-25   960  		  UVD_LMI_STATUS__WRITE_CLEAN_MASK |
b6d1a06320519a Sonny Jiang  2023-04-25   961  		  UVD_LMI_STATUS__WRITE_CLEAN_RAW_MASK;
125ac87dc334a0 Boyuan Zhang 2024-10-01   962  	r = SOC15_WAIT_ON_RREG(VCN, inst, regUVD_LMI_STATUS, tmp, tmp);
b6d1a06320519a Sonny Jiang  2023-04-25   963  	if (r)
b6d1a06320519a Sonny Jiang  2023-04-25   964  		return r;
b6d1a06320519a Sonny Jiang  2023-04-25   965  
b6d1a06320519a Sonny Jiang  2023-04-25   966  	/* disable LMI UMC channel */
125ac87dc334a0 Boyuan Zhang 2024-10-01   967  	tmp = RREG32_SOC15(VCN, inst, regUVD_LMI_CTRL2);
b6d1a06320519a Sonny Jiang  2023-04-25   968  	tmp |= UVD_LMI_CTRL2__STALL_ARB_UMC_MASK;
125ac87dc334a0 Boyuan Zhang 2024-10-01   969  	WREG32_SOC15(VCN, inst, regUVD_LMI_CTRL2, tmp);
b6d1a06320519a Sonny Jiang  2023-04-25   970  	tmp = UVD_LMI_STATUS__UMC_READ_CLEAN_RAW_MASK |
b6d1a06320519a Sonny Jiang  2023-04-25   971  		  UVD_LMI_STATUS__UMC_WRITE_CLEAN_RAW_MASK;
125ac87dc334a0 Boyuan Zhang 2024-10-01   972  	r = SOC15_WAIT_ON_RREG(VCN, inst, regUVD_LMI_STATUS, tmp, tmp);
b6d1a06320519a Sonny Jiang  2023-04-25   973  	if (r)
b6d1a06320519a Sonny Jiang  2023-04-25   974  		return r;
b6d1a06320519a Sonny Jiang  2023-04-25   975  
b6d1a06320519a Sonny Jiang  2023-04-25   976  	/* block VCPU register access */
125ac87dc334a0 Boyuan Zhang 2024-10-01   977  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_RB_ARB_CTRL),
b6d1a06320519a Sonny Jiang  2023-04-25   978  		UVD_RB_ARB_CTRL__VCPU_DIS_MASK,
b6d1a06320519a Sonny Jiang  2023-04-25   979  		~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   980  
b6d1a06320519a Sonny Jiang  2023-04-25   981  	/* reset VCPU */
125ac87dc334a0 Boyuan Zhang 2024-10-01   982  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL),
b6d1a06320519a Sonny Jiang  2023-04-25   983  		UVD_VCPU_CNTL__BLK_RST_MASK,
b6d1a06320519a Sonny Jiang  2023-04-25   984  		~UVD_VCPU_CNTL__BLK_RST_MASK);
b6d1a06320519a Sonny Jiang  2023-04-25   985  
b6d1a06320519a Sonny Jiang  2023-04-25   986  	/* disable VCPU clock */
125ac87dc334a0 Boyuan Zhang 2024-10-01   987  	WREG32_P(SOC15_REG_OFFSET(VCN, inst, regUVD_VCPU_CNTL), 0,
b6d1a06320519a Sonny Jiang  2023-04-25   988  		~(UVD_VCPU_CNTL__CLK_EN_MASK));
b6d1a06320519a Sonny Jiang  2023-04-25   989  
b6d1a06320519a Sonny Jiang  2023-04-25   990  	/* apply soft reset */
125ac87dc334a0 Boyuan Zhang 2024-10-01   991  	tmp = RREG32_SOC15(VCN, inst, regUVD_SOFT_RESET);
b6d1a06320519a Sonny Jiang  2023-04-25   992  	tmp |= UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
125ac87dc334a0 Boyuan Zhang 2024-10-01   993  	WREG32_SOC15(VCN, inst, regUVD_SOFT_RESET, tmp);
125ac87dc334a0 Boyuan Zhang 2024-10-01   994  	tmp = RREG32_SOC15(VCN, inst, regUVD_SOFT_RESET);
b6d1a06320519a Sonny Jiang  2023-04-25   995  	tmp |= UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
125ac87dc334a0 Boyuan Zhang 2024-10-01   996  	WREG32_SOC15(VCN, inst, regUVD_SOFT_RESET, tmp);
b6d1a06320519a Sonny Jiang  2023-04-25   997  
b6d1a06320519a Sonny Jiang  2023-04-25   998  	/* clear status */
125ac87dc334a0 Boyuan Zhang 2024-10-01   999  	WREG32_SOC15(VCN, inst, regUVD_STATUS, 0);
b6d1a06320519a Sonny Jiang  2023-04-25  1000  
b6d1a06320519a Sonny Jiang  2023-04-25  1001  	/* enable VCN power gating */
125ac87dc334a0 Boyuan Zhang 2024-10-01  1002  	vcn_v5_0_0_enable_static_power_gating(adev, inst);
125ac87dc334a0 Boyuan Zhang 2024-10-01  1003  done:
b6d1a06320519a Sonny Jiang  2023-04-25  1004  	if (adev->pm.dpm_enabled)
125ac87dc334a0 Boyuan Zhang 2024-10-01  1005  		amdgpu_dpm_enable_vcn(adev, false, inst);
b6d1a06320519a Sonny Jiang  2023-04-25  1006  
b6d1a06320519a Sonny Jiang  2023-04-25  1007  	return 0;
b6d1a06320519a Sonny Jiang  2023-04-25  1008  }
b6d1a06320519a Sonny Jiang  2023-04-25  1009  

:::::: The code at line 755 was first introduced by commit
:::::: b6d1a06320519ac3bfda6ce81067a1bc409b9cff drm/amdgpu: add VCN_5_0_0 IP block support

:::::: TO: Sonny Jiang <sonny.jiang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
