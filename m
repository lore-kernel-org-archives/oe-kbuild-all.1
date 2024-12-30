Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F69198A37
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 22:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735598461; cv=none; b=mJNTHN10NRbQB2hoLwpEygkjTUJ9Myl/pFoOk1ZtQ0daQXzVCFqjcSoGdjm6PBNxZMbBowq9REfVZEyPh5aIoW9lZ0wObKL76vE3S1GB+mvYKRfE2iaDO/SSZHWRIAdcV8x0a7Mw3Mxvvq0poIxTuL+sBjK7BV+D6kAryPcQ6R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735598461; c=relaxed/simple;
	bh=eCHJjI6/m5OE/F6bwzh9Xp/sb1Jj+zPiM0t0by94l9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CuwrU31458YebUrSNTfBPKhaQ2gjg+wftxm1+YtFbt6mjoBH5lAbQ/zpwSoyQUgcIUpRdgRr2kw9zi53KL/9RMtXnJpKh7TmLvcXXfdfSrW5dNLQ3KFgz8Ig6uH0Wuvi8PbQcMEX2avR9d/zNUt/ZH88nVRrnjy2dWj+eEhBgn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CebNJRCm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CebNJRCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735598459; x=1767134459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eCHJjI6/m5OE/F6bwzh9Xp/sb1Jj+zPiM0t0by94l9g=;
  b=CebNJRCmljV7yjBX/GHBunzIIlRbyrCW2djek8GgcgLOvmnjcZJjjIR7
   3G8uASRG58/70iQqgke4DyCORSmUG6fPfaPNU3cKN1fB9G9zffvUrcxjR
   Mb5vZupNTYF2tVeYGsydvFgI/VtPIH3FFatxxEXOuKs3gGv8mItZqZ5/4
   blqsEXrfoavVNEaJGUdfhtA7Uk6EevLUMZCTF+pIhtqsUyOCOk9jEQrku
   gDlByC6vp2+hvuLvtT+KxVztd2idCGD7kiMp3vaRRR5n2Ti1/XOxZw+9d
   NVS5iN22Ce1jZsJWE2RICpONNgvVl78Y9xT50S2OXj+F8ON0x8/tmGZne
   g==;
X-CSE-ConnectionGUID: BgIb3x7eQaq9euv7ZPtiPw==
X-CSE-MsgGUID: tGmCHSKrR6y4WBabc0OPLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35139200"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35139200"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 14:40:56 -0800
X-CSE-ConnectionGUID: 14iD+KyPQUKVMj3ZU/WMNQ==
X-CSE-MsgGUID: JRezBVn/QQaOOghs6el42Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="105879115"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Dec 2024 14:40:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSORQ-0006Rr-0g;
	Mon, 30 Dec 2024 22:40:52 +0000
Date: Tue, 31 Dec 2024 06:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
	George Yang <George.Yang@amd.com>, Min Ma <min.ma@amd.com>
Subject: [linux-next:master 475/5236]
 drivers/accel/amdxdna/npu5_regs.c:69:31: sparse: sparse: symbol
 'npu5_dev_priv' was not declared. Should it be static?
Message-ID: <202412310648.dtMHgGem-lkp@intel.com>
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
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310648.dtMHgGem-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310648.dtMHgGem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310648.dtMHgGem-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/npu5_regs.c:69:31: sparse: sparse: symbol 'npu5_dev_priv' was not declared. Should it be static?
--
>> drivers/accel/amdxdna/npu1_regs.c:52:31: sparse: sparse: symbol 'npu1_dev_priv' was not declared. Should it be static?
--
>> drivers/accel/amdxdna/npu4_regs.c:69:31: sparse: sparse: symbol 'npu4_dev_priv' was not declared. Should it be static?
--
>> drivers/accel/amdxdna/npu2_regs.c:69:31: sparse: sparse: symbol 'npu2_dev_priv' was not declared. Should it be static?

vim +/npu5_dev_priv +69 drivers/accel/amdxdna/npu5_regs.c

    68	
  > 69	const struct amdxdna_dev_priv npu5_dev_priv = {
    70		.fw_path        = "amdnpu/17f0_11/npu.sbin",
    71		.protocol_major = 0x6,
    72		.protocol_minor = 0x1,
    73		.rt_config	= {NPU5_RT_CFG_TYPE_PDI_LOAD, NPU5_RT_CFG_VAL_PDI_LOAD_APP},
    74		.col_align	= COL_ALIGN_NATURE,
    75		.mbox_dev_addr  = NPU5_MBOX_BAR_BASE,
    76		.mbox_size      = 0, /* Use BAR size */
    77		.sram_dev_addr  = NPU5_SRAM_BAR_BASE,
    78		.sram_offs      = {
    79			DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
    80			DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
    81		},
    82		.psp_regs_off   = {
    83			DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU5_PSP, MP0_C2PMSG_123),
    84			DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU5_REG, MPNPU_PUB_SCRATCH3),
    85			DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU5_REG, MPNPU_PUB_SCRATCH4),
    86			DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU5_REG, MPNPU_PUB_SCRATCH9),
    87			DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU5_PSP, MP0_C2PMSG_73),
    88			DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU5_PSP, MP0_C2PMSG_123),
    89			DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU5_REG, MPNPU_PUB_SCRATCH3),
    90		},
    91		.smu_regs_off   = {
    92			DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU5_SMU, MP1_C2PMSG_0),
    93			DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU5_SMU, MP1_C2PMSG_60),
    94			DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU5_SMU, MMNPU_APERTURE4_BASE),
    95			DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU5_SMU, MP1_C2PMSG_61),
    96			DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU5_SMU, MP1_C2PMSG_60),
    97		},
    98		.smu_mpnpuclk_freq_max = NPU5_MPNPUCLK_FREQ_MAX,
    99		.smu_hclk_freq_max     = NPU5_HCLK_FREQ_MAX,
   100	};
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
