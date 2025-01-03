Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3361E49F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 04:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735879932; cv=none; b=L8X6bTq08nm68svgISHITb1/8tsyNwXAxl6+3QqhxM758t3xgnlTfnShTgcBZAxoi30R4ic01KOPL3FojJsRCkWEVUfo1H9qj0dHXWi2/sDT8Oa2SOOxmyw0tLLOeedu1YwfpSGaD+Alnl+BLjuQYuJ9acbkIF+zpfQXhSwr5Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735879932; c=relaxed/simple;
	bh=AEta1aeazsDFyrXTT2GXYHIbKIinrUDU9vP9/r2yKnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kYTIZhC93NA9jd6cgwH+iXojU0TyBROeg6ImV56JnzrA+48uTwdFKXmQwi/6SbBYil39Vt+oEwtS6A8orPDHDVSmGI0FQe0qj3p/1oKiHaA7XSS/n9M05VZErFQEsJZxop7R9SZeTFPs+9Y6odQaDzr6vQQ8mXVJS5aXB+5mBNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgtcGb6H; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgtcGb6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735879931; x=1767415931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AEta1aeazsDFyrXTT2GXYHIbKIinrUDU9vP9/r2yKnw=;
  b=EgtcGb6H4h02LxyPm4BPLbcik8OSrTZWjVw/yfUXaSkqZRB9keEfbquZ
   DJ/Kk3oTS66GO+FSFjgS/VKV12wjxbnraGTZ8gs/JqIbBA9W6tv4WPrW1
   k/N2qDfVBkpOQRufXnKTHlSn0Y/0Nvf+oogrhrxUW588rqRVhJf/6hEww
   xIKcd/On9Je1vCIy8ITK4+R4fcKKD2umeHbmHIpv8WGPnM8gEHdZ1/Ucl
   RQqYeE2R6lv5ZhXH3xNigkbIA8GwGOyls3UMRMI+A+6JzmZenFiUcvc0r
   yzcgMR5K2TZB6kxn4fFd3YPy0pnIbBnga05HowwttlnNVWIS/DyxHnyEp
   w==;
X-CSE-ConnectionGUID: f4hiQgWAT4mmc1o/RLB/cQ==
X-CSE-MsgGUID: B0JSYnGZQ4+7RWUlOT6Z0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36031098"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36031098"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 20:52:10 -0800
X-CSE-ConnectionGUID: 46TBn1taSo6FTwePIvg+Rg==
X-CSE-MsgGUID: M3qPjKNGRJ6xof9c6Ff8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="132546777"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jan 2025 20:52:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTZfJ-0009EB-2P;
	Fri, 03 Jan 2025 04:52:05 +0000
Date: Fri, 3 Jan 2025 12:51:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
	George Yang <George.Yang@amd.com>, Min Ma <min.ma@amd.com>
Subject: [linux-next:master 475/5236]
 drivers/accel/amdxdna/npu1_regs.c:52:31: sparse: sparse: symbol
 'npu1_dev_priv' was not declared. Should it be static?
Message-ID: <202501031251.niHzOGln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 8c9ff1b181ba3d31d6b4a48606248b52180a7046 [475/5236] accel/amdxdna: Add a new driver for AMD AI Engine
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20250103/202501031251.niHzOGln-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031251.niHzOGln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031251.niHzOGln-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/npu1_regs.c:52:31: sparse: sparse: symbol 'npu1_dev_priv' was not declared. Should it be static?
--
>> drivers/accel/amdxdna/npu5_regs.c:69:31: sparse: sparse: symbol 'npu5_dev_priv' was not declared. Should it be static?
--
>> drivers/accel/amdxdna/npu2_regs.c:69:31: sparse: sparse: symbol 'npu2_dev_priv' was not declared. Should it be static?
--
>> drivers/accel/amdxdna/npu4_regs.c:69:31: sparse: sparse: symbol 'npu4_dev_priv' was not declared. Should it be static?

vim +/npu1_dev_priv +52 drivers/accel/amdxdna/npu1_regs.c

    51	
  > 52	const struct amdxdna_dev_priv npu1_dev_priv = {
    53		.fw_path        = "amdnpu/1502_00/npu.sbin",
    54		.protocol_major = 0x5,
    55		.protocol_minor = 0x1,
    56		.rt_config	= {NPU1_RT_CFG_TYPE_PDI_LOAD, NPU1_RT_CFG_VAL_PDI_LOAD_APP},
    57		.col_align	= COL_ALIGN_NONE,
    58		.mbox_dev_addr  = NPU1_MBOX_BAR_BASE,
    59		.mbox_size      = 0, /* Use BAR size */
    60		.sram_dev_addr  = NPU1_SRAM_BAR_BASE,
    61		.sram_offs      = {
    62			DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU1_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
    63			DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU1_SRAM, MPNPU_SRAM_I2X_MAILBOX_15),
    64		},
    65		.psp_regs_off   = {
    66			DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU1_PSP, MPNPU_PUB_SCRATCH2),
    67			DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH3),
    68			DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH4),
    69			DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH9),
    70			DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU1_PSP, MPNPU_PUB_SEC_INTR),
    71			DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU1_PSP, MPNPU_PUB_SCRATCH2),
    72			DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH3),
    73		},
    74		.smu_regs_off   = {
    75			DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH5),
    76			DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH7),
    77			DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU1_SMU, MPNPU_PUB_PWRMGMT_INTR),
    78			DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU1_SMU, MPNPU_PUB_SCRATCH6),
    79			DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH7),
    80		},
    81		.smu_mpnpuclk_freq_max = NPU1_MPNPUCLK_FREQ_MAX,
    82		.smu_hclk_freq_max     = NPU1_HCLK_FREQ_MAX,
    83	};
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
