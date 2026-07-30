Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EFD3431E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 19:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440032; cv=none; b=m6XCYtbvaKqa6Hc5xNbyDvMIc/ONjnvcVvxrp5hR1irTWH6Qtsx7XAnO2Bax7hL2cUOI2ryLlaD9aBaJtfl5YwFLbWV6yF/Fx+SnhKTe50UbguE+BKr6LOQz6mO4XzHZDGtli6+g2B2opVw8R1ijXMxD1vTYUlD7jimLRjJtDPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440032; c=relaxed/simple;
	bh=lEWZ8zev1WzzCQnjfXCIcy1wQx2qiCZNoE9US96LpLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MDynlN84R4igUmDHnI6wam/Xb99eAlXhiHH3pYQnAhA2WPWLBEWlOQJfwZ95slMuNjb9WKk3TRaNXKymirLS28mXxjCG4+M0CJvygTKRG8Bazg+7emWFUyOKlRexF4JG1vfY9ABE6p0tf9eawscywK1tWBSjTC+87snDOCSlK5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3Hm+W61; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3Hm+W61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785440029; x=1816976029;
  h=date:from:to:cc:subject:message-id;
  bh=lEWZ8zev1WzzCQnjfXCIcy1wQx2qiCZNoE9US96LpLI=;
  b=X3Hm+W61KYKHAWk3Em53Femc/lB6GH4f9kbmWi6YJYNzm3dv9D3zMmEg
   PciK9tls3KB6mOpyJIKR3/7CuDtB3E3sBF5tElsSQq6v3TmuEO9QkguKC
   wA398sMuf+WtxhVqUnY940Y3oviEnOhEPJYvUbtW02WxWfduly8+gjOzy
   c9Mu1brw7SRnI8ZXXtbyOZNDvPrOkTbMI5yoEzri/WqeLHGtbb+nXl23K
   O6rvukK7NdxszLMtp+zRIxvSN8CpVDiINGkaKonT1yyYmojOa8bmiMmSt
   dxCOSfWQx+KMNMLbSkGdwKi38AC6heowDACQ1p/Mz5LpfYr8wnOCvFQkZ
   g==;
X-CSE-ConnectionGUID: fc2K3IXlQb2l0iFuxfmiZw==
X-CSE-MsgGUID: 7Amnk/ExSUGUf1gk64CdwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103477831"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="103477831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:33:48 -0700
X-CSE-ConnectionGUID: WOkn82WrQLWaVuDdBWW/vw==
X-CSE-MsgGUID: VbfKLn52SBCvnQzHHElSWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="254063796"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2026 12:33:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpWVg-00000000hWD-0vNT;
	Thu, 30 Jul 2026 19:33:41 +0000
Date: Fri, 31 Jul 2026 03:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhankar Milind Sardeshpande <Shubhankar.MilindSardeshpande@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [agd5f:drm-fixes-7.2 14/28]
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c:149 psp_v15_0_0_ring_create() warn:
 inconsistent indenting
Message-ID: <202607310338.dhtAssro-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-fixes-7.2
head:   114b42507b6a23d9d24e24e4ef165233332c64d4
commit: a8d234a1133f02bfbbdaac18b889219949f28108 [14/28] drm/amdgpu: Enable support for PSP 15_0_5
config: x86_64-randconfig-161-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310338.dhtAssro-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310338.dhtAssro-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/psp_v15_0.c:149 psp_v15_0_0_ring_create() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/psp_v15_0.c:184 psp_v15_0_0_ring_create() warn: inconsistent indenting

vim +149 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c

   110	
   111	static int psp_v15_0_0_ring_create(struct psp_context *psp,
   112					 enum psp_ring_type ring_type)
   113	{
   114		int ret = 0;
   115		unsigned int psp_ring_reg = 0;
   116		struct psp_ring *ring = &psp->km_ring;
   117		struct amdgpu_device *adev = psp->adev;
   118	
   119		if (amdgpu_sriov_vf(adev)) {
   120			ret = psp_v15_0_0_ring_stop(psp, ring_type);
   121			if (ret) {
   122				DRM_ERROR("psp_v14_0_ring_stop_sriov failed!\n");
   123				return ret;
   124			}
   125	
   126			/* Write low address of the ring to C2PMSG_102 */
   127			psp_ring_reg = lower_32_bits(ring->ring_mem_mc_addr);
   128			WREG32_SOC15(MP0, 0, regMPASP_SMN_C2PMSG_102, psp_ring_reg);
   129			/* Write high address of the ring to C2PMSG_103 */
   130			psp_ring_reg = upper_32_bits(ring->ring_mem_mc_addr);
   131			WREG32_SOC15(MP0, 0, regMPASP_SMN_C2PMSG_103, psp_ring_reg);
   132	
   133			/* Write the ring initialization command to C2PMSG_101 */
   134			WREG32_SOC15(MP0, 0, regMPASP_SMN_C2PMSG_101,
   135				     GFX_CTRL_CMD_ID_INIT_GPCOM_RING);
   136	
   137			/* there might be handshake issue with hardware which needs delay */
   138			mdelay(20);
   139	
   140			/* Wait for response flag (bit 31) in C2PMSG_101 */
   141			ret = psp_wait_for(psp, SOC15_REG_OFFSET(MP0, 0, regMPASP_SMN_C2PMSG_101),
   142					   0x80000000, 0x8000FFFF, false);
   143	
   144		} else {
   145			if (amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(15, 0, 5)) {
   146				/* Wait for sOS ready for ring creation */
   147				ret = psp_wait_for(psp, SOC15_REG_OFFSET(MP0, 0, regMPASP_PCRU0_MPASP_C2PMSG_64),
   148						0x80000000, 0x80000000, false);
 > 149			if (ret) {
   150				DRM_ERROR("Failed to wait for trust OS ready for ring creation\n");
   151				return ret;
   152			}
   153	
   154			/* Write low address of the ring to C2PMSG_69 */
   155			psp_ring_reg = lower_32_bits(ring->ring_mem_mc_addr);
   156			WREG32_SOC15(MP0, 0, regMPASP_PCRU0_MPASP_C2PMSG_69, psp_ring_reg);
   157			/* Write high address of the ring to C2PMSG_70 */
   158			psp_ring_reg = upper_32_bits(ring->ring_mem_mc_addr);
   159			WREG32_SOC15(MP0, 0, regMPASP_PCRU0_MPASP_C2PMSG_70, psp_ring_reg);
   160			/* Write size of ring to C2PMSG_71 */
   161			psp_ring_reg = ring->ring_size;
   162			WREG32_SOC15(MP0, 0, regMPASP_PCRU0_MPASP_C2PMSG_71, psp_ring_reg);
   163			/* Write the ring initialization command to C2PMSG_64 */
   164			psp_ring_reg = ring_type;
   165			psp_ring_reg = psp_ring_reg << 16;
   166			WREG32_SOC15(MP0, 0, regMPASP_PCRU0_MPASP_C2PMSG_64, psp_ring_reg);
   167	
   168			/* there might be handshake issue with hardware which needs delay */
   169			mdelay(20);
   170	
   171			/* Wait for response flag (bit 31) in C2PMSG_64 */
   172			ret = psp_wait_for(psp, SOC15_REG_OFFSET(MP0, 0, regMPASP_PCRU0_MPASP_C2PMSG_64),
   173					   0x80000000, 0x8000FFFF, false);
   174			} else {
   175				/* Wait for sOS ready for ring creation */
   176				ret = psp_wait_for(psp, SOC15_REG_OFFSET(MP0, 0, regMPASP_PCRU1_MPASP_C2PMSG_64),
   177						   0x80000000, 0x80000000, false);
   178				if (ret) {
   179					DRM_ERROR("Failed to wait for trust OS ready for ring creation\n");
   180					return ret;
   181				}
   182	
   183			/* Write low address of the ring to C2PMSG_69 */
   184			psp_ring_reg = lower_32_bits(ring->ring_mem_mc_addr);
   185			WREG32_SOC15(MP0, 0, regMPASP_PCRU1_MPASP_C2PMSG_69, psp_ring_reg);
   186			/* Write high address of the ring to C2PMSG_70 */
   187			psp_ring_reg = upper_32_bits(ring->ring_mem_mc_addr);
   188			WREG32_SOC15(MP0, 0, regMPASP_PCRU1_MPASP_C2PMSG_70, psp_ring_reg);
   189			/* Write size of ring to C2PMSG_71 */
   190			psp_ring_reg = ring->ring_size;
   191			WREG32_SOC15(MP0, 0, regMPASP_PCRU1_MPASP_C2PMSG_71, psp_ring_reg);
   192			/* Write the ring initialization command to C2PMSG_64 */
   193			psp_ring_reg = ring_type;
   194			psp_ring_reg = psp_ring_reg << 16;
   195			WREG32_SOC15(MP0, 0, regMPASP_PCRU1_MPASP_C2PMSG_64, psp_ring_reg);
   196	
   197			/* there might be handshake issue with hardware which needs delay */
   198			mdelay(20);
   199	
   200			/* Wait for response flag (bit 31) in C2PMSG_64 */
   201			ret = psp_wait_for(psp, SOC15_REG_OFFSET(MP0, 0, regMPASP_PCRU1_MPASP_C2PMSG_64),
   202					   0x80000000, 0x8000FFFF, false);
   203			}
   204		}
   205	
   206		return ret;
   207	}
   208	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
