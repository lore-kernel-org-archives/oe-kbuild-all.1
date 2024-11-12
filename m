Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9C5FEE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731417372; cv=none; b=rDX1SyWk8qV8zW/rELoF+gFISMZtOazHM/divsoxH0jzaATVztmn43zX3175O1rzWR1pJIi119F3cgCg+/TUvnhxjyYjmTUZ70wUZTOxn7lIqld+MO9rIUNwY9x1C8k3YCEPiFZIetw6mu9MF/6jX22J+k6Q/1rln6jp1w6KuPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731417372; c=relaxed/simple;
	bh=luKrNHQUh+ZPSAGUOQVmXYOuvon51Jx5IRG/q8n9W7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ra++63B5z8LRk3Qkvy8cOL3MlS63xHDukY+Vq3qdQSuzcdLR4Ibnw3xF8zanOvvJJgefq9zDnKISVUkOk/q6gNE9S9O2BvdTbpeXHoh7WyPncbagPP680Gn0bWoSs/I6JtkGySiXWqx8ZFObZ7a2QItGgJztfDGw0umToz+q0N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZ+g72U2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZ+g72U2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731417370; x=1762953370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=luKrNHQUh+ZPSAGUOQVmXYOuvon51Jx5IRG/q8n9W7U=;
  b=mZ+g72U2Hh0Aik/L/Q5e8tsDQW/Gulam460nCQiRHvHkjoqU2a1VaeH0
   S3fKb2Fk/5ponK+Y3DOC89jVcncNLqNKHTmFfscVycwm7jU3gJb97d6rb
   RdTk6mlNnjc3ZkxdserXhdayTUCJ7+cM072i9b3kvN+TiNQas2X5ciVHC
   55HW/f9QsJpHYWDJtkfEfXQdHWc7jYEr5pNK7uDdBT9RJEw4kPkjpYQu4
   2U9WPnZrTrqm6Fa2NasKz1mtkulZ6gh7JlclaL7wzcOlb7I4a63YYSXrO
   9ejLGhCrLd4EPd2wkmdc2u6pi8o03qOf8czpxKorKgPofl4VZxywOvUtz
   w==;
X-CSE-ConnectionGUID: DlEzKvNXTc+hL7gZRWAA6Q==
X-CSE-MsgGUID: t5KoDnTPRJuW/a+XjegUhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="41859144"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="41859144"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 05:16:05 -0800
X-CSE-ConnectionGUID: 8ugHWn5CSO6ye1cnLfyESA==
X-CSE-MsgGUID: hGTELuaVQ6+MQLHK9u9e4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="92421729"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Nov 2024 05:16:04 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAqkT-0001Kb-0B;
	Tue, 12 Nov 2024 13:16:01 +0000
Date: Tue, 12 Nov 2024 21:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1285/1302]
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:616: warning: Function parameter or
 struct member 'inst' not described in 'vcn_v2_5_disable_clock_gating'
Message-ID: <202411122127.yenazmHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   0bd74ab31ce2ca6e35c9f7f7c9b72bd9c78619ed
commit: 9623824f03f81a9110a9bf1e4da0f47dcecc6567 [1285/1302] drm/amdgpu: set_powergating for each vcn instance
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241112/202411122127.yenazmHT-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122127.yenazmHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122127.yenazmHT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:616: warning: Function parameter or struct member 'inst' not described in 'vcn_v2_5_disable_clock_gating'
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:778: warning: Function parameter or struct member 'inst' not described in 'vcn_v2_5_enable_clock_gating'


vim +616 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c

d2a2c64f53718a9 James Zhu         2019-12-18  607  
cbead2bdfcf1dda Leo Liu           2019-04-15  608  /**
cbead2bdfcf1dda Leo Liu           2019-04-15  609   * vcn_v2_5_disable_clock_gating - disable VCN clock gating
cbead2bdfcf1dda Leo Liu           2019-04-15  610   *
cbead2bdfcf1dda Leo Liu           2019-04-15  611   * @adev: amdgpu_device pointer
cbead2bdfcf1dda Leo Liu           2019-04-15  612   *
cbead2bdfcf1dda Leo Liu           2019-04-15  613   * Disable clock gating for VCN block
cbead2bdfcf1dda Leo Liu           2019-04-15  614   */
9623824f03f81a9 Boyuan Zhang      2024-10-08  615  static void vcn_v2_5_disable_clock_gating(struct amdgpu_device *adev, int inst)
cbead2bdfcf1dda Leo Liu           2019-04-15 @616  {
cbead2bdfcf1dda Leo Liu           2019-04-15  617  	uint32_t data;
cbead2bdfcf1dda Leo Liu           2019-04-15  618  
9623824f03f81a9 Boyuan Zhang      2024-10-08  619  	if (adev->vcn.harvest_config & (1 << inst))
9623824f03f81a9 Boyuan Zhang      2024-10-08  620  		return;
cbead2bdfcf1dda Leo Liu           2019-04-15  621  	/* UVD disable CGC */
9623824f03f81a9 Boyuan Zhang      2024-10-08  622  	data = RREG32_SOC15(VCN, inst, mmUVD_CGC_CTRL);
cbead2bdfcf1dda Leo Liu           2019-04-15  623  	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
cbead2bdfcf1dda Leo Liu           2019-04-15  624  		data |= 1 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
cbead2bdfcf1dda Leo Liu           2019-04-15  625  	else
cbead2bdfcf1dda Leo Liu           2019-04-15  626  		data &= ~UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK;
cbead2bdfcf1dda Leo Liu           2019-04-15  627  	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
cbead2bdfcf1dda Leo Liu           2019-04-15  628  	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
9623824f03f81a9 Boyuan Zhang      2024-10-08  629  	WREG32_SOC15(VCN, inst, mmUVD_CGC_CTRL, data);
cbead2bdfcf1dda Leo Liu           2019-04-15  630  
9623824f03f81a9 Boyuan Zhang      2024-10-08  631  	data = RREG32_SOC15(VCN, inst, mmUVD_CGC_GATE);
cbead2bdfcf1dda Leo Liu           2019-04-15  632  	data &= ~(UVD_CGC_GATE__SYS_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  633  		| UVD_CGC_GATE__UDEC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  634  		| UVD_CGC_GATE__MPEG2_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  635  		| UVD_CGC_GATE__REGS_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  636  		| UVD_CGC_GATE__RBC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  637  		| UVD_CGC_GATE__LMI_MC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  638  		| UVD_CGC_GATE__LMI_UMC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  639  		| UVD_CGC_GATE__IDCT_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  640  		| UVD_CGC_GATE__MPRD_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  641  		| UVD_CGC_GATE__MPC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  642  		| UVD_CGC_GATE__LBSI_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  643  		| UVD_CGC_GATE__LRBBM_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  644  		| UVD_CGC_GATE__UDEC_RE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  645  		| UVD_CGC_GATE__UDEC_CM_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  646  		| UVD_CGC_GATE__UDEC_IT_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  647  		| UVD_CGC_GATE__UDEC_DB_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  648  		| UVD_CGC_GATE__UDEC_MP_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  649  		| UVD_CGC_GATE__WCB_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  650  		| UVD_CGC_GATE__VCPU_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  651  		| UVD_CGC_GATE__MMSCH_MASK);
cbead2bdfcf1dda Leo Liu           2019-04-15  652  
9623824f03f81a9 Boyuan Zhang      2024-10-08  653  	WREG32_SOC15(VCN, inst, mmUVD_CGC_GATE, data);
cbead2bdfcf1dda Leo Liu           2019-04-15  654  
9623824f03f81a9 Boyuan Zhang      2024-10-08  655  	SOC15_WAIT_ON_RREG(VCN, inst, mmUVD_CGC_GATE, 0,  0xFFFFFFFF);
cbead2bdfcf1dda Leo Liu           2019-04-15  656  
9623824f03f81a9 Boyuan Zhang      2024-10-08  657  	data = RREG32_SOC15(VCN, inst, mmUVD_CGC_CTRL);
cbead2bdfcf1dda Leo Liu           2019-04-15  658  	data &= ~(UVD_CGC_CTRL__UDEC_RE_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  659  		| UVD_CGC_CTRL__UDEC_CM_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  660  		| UVD_CGC_CTRL__UDEC_IT_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  661  		| UVD_CGC_CTRL__UDEC_DB_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  662  		| UVD_CGC_CTRL__UDEC_MP_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  663  		| UVD_CGC_CTRL__SYS_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  664  		| UVD_CGC_CTRL__UDEC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  665  		| UVD_CGC_CTRL__MPEG2_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  666  		| UVD_CGC_CTRL__REGS_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  667  		| UVD_CGC_CTRL__RBC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  668  		| UVD_CGC_CTRL__LMI_MC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  669  		| UVD_CGC_CTRL__LMI_UMC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  670  		| UVD_CGC_CTRL__IDCT_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  671  		| UVD_CGC_CTRL__MPRD_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  672  		| UVD_CGC_CTRL__MPC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  673  		| UVD_CGC_CTRL__LBSI_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  674  		| UVD_CGC_CTRL__LRBBM_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  675  		| UVD_CGC_CTRL__WCB_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  676  		| UVD_CGC_CTRL__VCPU_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  677  		| UVD_CGC_CTRL__MMSCH_MODE_MASK);
9623824f03f81a9 Boyuan Zhang      2024-10-08  678  	WREG32_SOC15(VCN, inst, mmUVD_CGC_CTRL, data);
cbead2bdfcf1dda Leo Liu           2019-04-15  679  
cbead2bdfcf1dda Leo Liu           2019-04-15  680  	/* turn on */
9623824f03f81a9 Boyuan Zhang      2024-10-08  681  	data = RREG32_SOC15(VCN, inst, mmUVD_SUVD_CGC_GATE);
cbead2bdfcf1dda Leo Liu           2019-04-15  682  	data |= (UVD_SUVD_CGC_GATE__SRE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  683  		| UVD_SUVD_CGC_GATE__SIT_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  684  		| UVD_SUVD_CGC_GATE__SMP_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  685  		| UVD_SUVD_CGC_GATE__SCM_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  686  		| UVD_SUVD_CGC_GATE__SDB_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  687  		| UVD_SUVD_CGC_GATE__SRE_H264_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  688  		| UVD_SUVD_CGC_GATE__SRE_HEVC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  689  		| UVD_SUVD_CGC_GATE__SIT_H264_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  690  		| UVD_SUVD_CGC_GATE__SIT_HEVC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  691  		| UVD_SUVD_CGC_GATE__SCM_H264_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  692  		| UVD_SUVD_CGC_GATE__SCM_HEVC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  693  		| UVD_SUVD_CGC_GATE__SDB_H264_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  694  		| UVD_SUVD_CGC_GATE__SDB_HEVC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  695  		| UVD_SUVD_CGC_GATE__SCLR_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  696  		| UVD_SUVD_CGC_GATE__UVD_SC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  697  		| UVD_SUVD_CGC_GATE__ENT_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  698  		| UVD_SUVD_CGC_GATE__SIT_HEVC_DEC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  699  		| UVD_SUVD_CGC_GATE__SIT_HEVC_ENC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  700  		| UVD_SUVD_CGC_GATE__SITE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  701  		| UVD_SUVD_CGC_GATE__SRE_VP9_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  702  		| UVD_SUVD_CGC_GATE__SCM_VP9_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  703  		| UVD_SUVD_CGC_GATE__SIT_VP9_DEC_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  704  		| UVD_SUVD_CGC_GATE__SDB_VP9_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  705  		| UVD_SUVD_CGC_GATE__IME_HEVC_MASK);
9623824f03f81a9 Boyuan Zhang      2024-10-08  706  	WREG32_SOC15(VCN, inst, mmUVD_SUVD_CGC_GATE, data);
cbead2bdfcf1dda Leo Liu           2019-04-15  707  
9623824f03f81a9 Boyuan Zhang      2024-10-08  708  	data = RREG32_SOC15(VCN, inst, mmUVD_SUVD_CGC_CTRL);
cbead2bdfcf1dda Leo Liu           2019-04-15  709  	data &= ~(UVD_SUVD_CGC_CTRL__SRE_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  710  		| UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  711  		| UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  712  		| UVD_SUVD_CGC_CTRL__SCM_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  713  		| UVD_SUVD_CGC_CTRL__SDB_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  714  		| UVD_SUVD_CGC_CTRL__SCLR_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  715  		| UVD_SUVD_CGC_CTRL__UVD_SC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  716  		| UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  717  		| UVD_SUVD_CGC_CTRL__IME_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  718  		| UVD_SUVD_CGC_CTRL__SITE_MODE_MASK);
9623824f03f81a9 Boyuan Zhang      2024-10-08  719  	WREG32_SOC15(VCN, inst, mmUVD_SUVD_CGC_CTRL, data);
cbead2bdfcf1dda Leo Liu           2019-04-15  720  }
cbead2bdfcf1dda Leo Liu           2019-04-15  721  
db32fec96620b35 kernel test robot 2020-06-18  722  static void vcn_v2_5_clock_gating_dpg_mode(struct amdgpu_device *adev,
d2a2c64f53718a9 James Zhu         2019-12-18  723  		uint8_t sram_sel, int inst_idx, uint8_t indirect)
d2a2c64f53718a9 James Zhu         2019-12-18  724  {
d2a2c64f53718a9 James Zhu         2019-12-18  725  	uint32_t reg_data = 0;
d2a2c64f53718a9 James Zhu         2019-12-18  726  
d2a2c64f53718a9 James Zhu         2019-12-18  727  	/* enable sw clock gating control */
d2a2c64f53718a9 James Zhu         2019-12-18  728  	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
d2a2c64f53718a9 James Zhu         2019-12-18  729  		reg_data = 1 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
d2a2c64f53718a9 James Zhu         2019-12-18  730  	else
d2a2c64f53718a9 James Zhu         2019-12-18  731  		reg_data = 0 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
d2a2c64f53718a9 James Zhu         2019-12-18  732  	reg_data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
d2a2c64f53718a9 James Zhu         2019-12-18  733  	reg_data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
d2a2c64f53718a9 James Zhu         2019-12-18  734  	reg_data &= ~(UVD_CGC_CTRL__UDEC_RE_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  735  		 UVD_CGC_CTRL__UDEC_CM_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  736  		 UVD_CGC_CTRL__UDEC_IT_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  737  		 UVD_CGC_CTRL__UDEC_DB_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  738  		 UVD_CGC_CTRL__UDEC_MP_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  739  		 UVD_CGC_CTRL__SYS_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  740  		 UVD_CGC_CTRL__UDEC_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  741  		 UVD_CGC_CTRL__MPEG2_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  742  		 UVD_CGC_CTRL__REGS_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  743  		 UVD_CGC_CTRL__RBC_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  744  		 UVD_CGC_CTRL__LMI_MC_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  745  		 UVD_CGC_CTRL__LMI_UMC_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  746  		 UVD_CGC_CTRL__IDCT_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  747  		 UVD_CGC_CTRL__MPRD_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  748  		 UVD_CGC_CTRL__MPC_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  749  		 UVD_CGC_CTRL__LBSI_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  750  		 UVD_CGC_CTRL__LRBBM_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  751  		 UVD_CGC_CTRL__WCB_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  752  		 UVD_CGC_CTRL__VCPU_MODE_MASK |
d2a2c64f53718a9 James Zhu         2019-12-18  753  		 UVD_CGC_CTRL__MMSCH_MODE_MASK);
4d319ed6566e478 Boyuan Zhang      2020-03-30  754  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d24 Boyuan Zhang      2020-04-28  755  		VCN, 0, mmUVD_CGC_CTRL), reg_data, sram_sel, indirect);
d2a2c64f53718a9 James Zhu         2019-12-18  756  
d2a2c64f53718a9 James Zhu         2019-12-18  757  	/* turn off clock gating */
4d319ed6566e478 Boyuan Zhang      2020-03-30  758  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d24 Boyuan Zhang      2020-04-28  759  		VCN, 0, mmUVD_CGC_GATE), 0, sram_sel, indirect);
d2a2c64f53718a9 James Zhu         2019-12-18  760  
d2a2c64f53718a9 James Zhu         2019-12-18  761  	/* turn on SUVD clock gating */
4d319ed6566e478 Boyuan Zhang      2020-03-30  762  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d24 Boyuan Zhang      2020-04-28  763  		VCN, 0, mmUVD_SUVD_CGC_GATE), 1, sram_sel, indirect);
d2a2c64f53718a9 James Zhu         2019-12-18  764  
d2a2c64f53718a9 James Zhu         2019-12-18  765  	/* turn on sw mode in UVD_SUVD_CGC_CTRL */
4d319ed6566e478 Boyuan Zhang      2020-03-30  766  	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
68a9fb4d2980d24 Boyuan Zhang      2020-04-28  767  		VCN, 0, mmUVD_SUVD_CGC_CTRL), 0, sram_sel, indirect);
d2a2c64f53718a9 James Zhu         2019-12-18  768  }
d2a2c64f53718a9 James Zhu         2019-12-18  769  
cbead2bdfcf1dda Leo Liu           2019-04-15  770  /**
cbead2bdfcf1dda Leo Liu           2019-04-15  771   * vcn_v2_5_enable_clock_gating - enable VCN clock gating
cbead2bdfcf1dda Leo Liu           2019-04-15  772   *
cbead2bdfcf1dda Leo Liu           2019-04-15  773   * @adev: amdgpu_device pointer
cbead2bdfcf1dda Leo Liu           2019-04-15  774   *
cbead2bdfcf1dda Leo Liu           2019-04-15  775   * Enable clock gating for VCN block
cbead2bdfcf1dda Leo Liu           2019-04-15  776   */
9623824f03f81a9 Boyuan Zhang      2024-10-08  777  static void vcn_v2_5_enable_clock_gating(struct amdgpu_device *adev, int inst)
cbead2bdfcf1dda Leo Liu           2019-04-15 @778  {
cbead2bdfcf1dda Leo Liu           2019-04-15  779  	uint32_t data = 0;
cbead2bdfcf1dda Leo Liu           2019-04-15  780  
9623824f03f81a9 Boyuan Zhang      2024-10-08  781  	if (adev->vcn.harvest_config & (1 << inst))
9623824f03f81a9 Boyuan Zhang      2024-10-08  782  		return;
cbead2bdfcf1dda Leo Liu           2019-04-15  783  	/* enable UVD CGC */
9623824f03f81a9 Boyuan Zhang      2024-10-08  784  	data = RREG32_SOC15(VCN, inst, mmUVD_CGC_CTRL);
cbead2bdfcf1dda Leo Liu           2019-04-15  785  	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
cbead2bdfcf1dda Leo Liu           2019-04-15  786  		data |= 1 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
cbead2bdfcf1dda Leo Liu           2019-04-15  787  	else
cbead2bdfcf1dda Leo Liu           2019-04-15  788  		data |= 0 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
cbead2bdfcf1dda Leo Liu           2019-04-15  789  	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
cbead2bdfcf1dda Leo Liu           2019-04-15  790  	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
9623824f03f81a9 Boyuan Zhang      2024-10-08  791  	WREG32_SOC15(VCN, inst, mmUVD_CGC_CTRL, data);
cbead2bdfcf1dda Leo Liu           2019-04-15  792  
9623824f03f81a9 Boyuan Zhang      2024-10-08  793  	data = RREG32_SOC15(VCN, inst, mmUVD_CGC_CTRL);
cbead2bdfcf1dda Leo Liu           2019-04-15  794  	data |= (UVD_CGC_CTRL__UDEC_RE_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  795  		| UVD_CGC_CTRL__UDEC_CM_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  796  		| UVD_CGC_CTRL__UDEC_IT_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  797  		| UVD_CGC_CTRL__UDEC_DB_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  798  		| UVD_CGC_CTRL__UDEC_MP_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  799  		| UVD_CGC_CTRL__SYS_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  800  		| UVD_CGC_CTRL__UDEC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  801  		| UVD_CGC_CTRL__MPEG2_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  802  		| UVD_CGC_CTRL__REGS_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  803  		| UVD_CGC_CTRL__RBC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  804  		| UVD_CGC_CTRL__LMI_MC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  805  		| UVD_CGC_CTRL__LMI_UMC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  806  		| UVD_CGC_CTRL__IDCT_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  807  		| UVD_CGC_CTRL__MPRD_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  808  		| UVD_CGC_CTRL__MPC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  809  		| UVD_CGC_CTRL__LBSI_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  810  		| UVD_CGC_CTRL__LRBBM_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  811  		| UVD_CGC_CTRL__WCB_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  812  		| UVD_CGC_CTRL__VCPU_MODE_MASK);
9623824f03f81a9 Boyuan Zhang      2024-10-08  813  	WREG32_SOC15(VCN, inst, mmUVD_CGC_CTRL, data);
cbead2bdfcf1dda Leo Liu           2019-04-15  814  
9623824f03f81a9 Boyuan Zhang      2024-10-08  815  	data = RREG32_SOC15(VCN, inst, mmUVD_SUVD_CGC_CTRL);
cbead2bdfcf1dda Leo Liu           2019-04-15  816  	data |= (UVD_SUVD_CGC_CTRL__SRE_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  817  		| UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  818  		| UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  819  		| UVD_SUVD_CGC_CTRL__SCM_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  820  		| UVD_SUVD_CGC_CTRL__SDB_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  821  		| UVD_SUVD_CGC_CTRL__SCLR_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  822  		| UVD_SUVD_CGC_CTRL__UVD_SC_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  823  		| UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  824  		| UVD_SUVD_CGC_CTRL__IME_MODE_MASK
cbead2bdfcf1dda Leo Liu           2019-04-15  825  		| UVD_SUVD_CGC_CTRL__SITE_MODE_MASK);
9623824f03f81a9 Boyuan Zhang      2024-10-08  826  	WREG32_SOC15(VCN, inst, mmUVD_SUVD_CGC_CTRL, data);
cbead2bdfcf1dda Leo Liu           2019-04-15  827  }
cbead2bdfcf1dda Leo Liu           2019-04-15  828  

:::::: The code at line 616 was first introduced by commit
:::::: cbead2bdfcf1ddaa3e65de22a3f88034736a71fd drm/amdgpu: add VCN2.5 VCPU start and stop

:::::: TO: Leo Liu <leo.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
