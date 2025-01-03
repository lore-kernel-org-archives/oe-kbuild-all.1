Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACA02594A0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 19:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735932903; cv=none; b=rxWDjCBQtOyb4oazTC9+oXYKvOOlTiiUJggbnbXl2NlLsilmEwWujeKe3Kyp2YBSN/tevCyrMilLq55nJNMiVcVbWXH1b4U1etDs7ibXV6MvVFQWbOnbPdM1TtoUzdINUUH2+NaRyK+H+zjR64L6g4jh3rFJg2x5x/o01UgxWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735932903; c=relaxed/simple;
	bh=VDYDDRquYPeZ8ytgkgQq8k1UMO7Reh4mBq/nxTXd27Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5HK/rTD0hxtzC3ffwXn4edWfi308KBfX1x55HFMWbXsGqEk1x2D/wrpFfvA9e1UomIHqBxGr3hsInNfujagy+GMwl18g8vCaIriibrzYG6HUCTrCszr6O08kDdOkq1nOYtlR3ItLGVceTJ/QWlzbKAYDuwY003tbH2Qk5beiAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMMDnPWv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMMDnPWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735932901; x=1767468901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VDYDDRquYPeZ8ytgkgQq8k1UMO7Reh4mBq/nxTXd27Q=;
  b=OMMDnPWv15EuGHnenxA6Kyn2DHHje5gXdoMMNwpK2mm5hNKvPTg1pm/k
   ThzR/u/HuRAJErJbtmV2ZcdKdUDXBf4+jSE+n2EpG0wuvRZk6rRYXoFTu
   vaxeCUOYOVkpX5MNTyvy5N1cf9/4q15I0bbvdwd9K791Cakk8TTHIm8+M
   4LAAEeoUgGzP8OU6CImUAFjexVt+qoWSXpdoDTtK8D2MyIpoq/uXkvYuV
   fUNi4YSG+aY1rMMk9UtcE100rqHX0F1pgyqkKsjNs/mcdPfMMMXDIg+im
   eWj+Ykhi9kG8toPCC4pUtfojbKRRhNAbG+uaxTxCE7tiC01XPGYg5RXuY
   g==;
X-CSE-ConnectionGUID: +XKJZWExSce4kbx1+IKkpQ==
X-CSE-MsgGUID: 7SgT0d+NTPuu2rAuRxy49Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36408802"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36408802"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 11:35:00 -0800
X-CSE-ConnectionGUID: rUa295YTS7WCne15oF+X2g==
X-CSE-MsgGUID: eGs3hNAARGO6J377z4Hr6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106908652"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2025 11:34:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTnRh-000ADz-0j;
	Fri, 03 Jan 2025 19:34:57 +0000
Date: Sat, 4 Jan 2025 03:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>,
	Xiaoming Ren <xiaoming.ren@amd.com>
Subject: [linux-next:master 3630/5236]
 drivers/accel/amdxdna/npu6_regs.c:76:31: sparse: sparse: symbol
 'npu6_dev_priv' was not declared. Should it be static?
Message-ID: <202501040316.PChncpYi-lkp@intel.com>
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
commit: 273b5176ac178d0d890cc1785d3688dc6f8adf37 [3630/5236] accel/amdxdna: Add RyzenAI-npu6 support
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20250104/202501040316.PChncpYi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040316.PChncpYi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040316.PChncpYi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/npu6_regs.c:76:31: sparse: sparse: symbol 'npu6_dev_priv' was not declared. Should it be static?

vim +/npu6_dev_priv +76 drivers/accel/amdxdna/npu6_regs.c

    75	
  > 76	const struct amdxdna_dev_priv npu6_dev_priv = {
    77		.fw_path        = "amdnpu/17f0_10/npu.sbin",
    78		.protocol_major = 0x6,
    79		.protocol_minor = 12,
    80		.rt_config	= {NPU6_RT_CFG_TYPE_PDI_LOAD, NPU6_RT_CFG_VAL_PDI_LOAD_APP},
    81		.col_align	= COL_ALIGN_NATURE,
    82		.mbox_dev_addr  = NPU6_MBOX_BAR_BASE,
    83		.mbox_size      = 0, /* Use BAR size */
    84		.sram_dev_addr  = NPU6_SRAM_BAR_BASE,
    85		.sram_offs      = {
    86			DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
    87			DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
    88		},
    89		.psp_regs_off   = {
    90			DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU6_PSP, MP0_C2PMSG_123),
    91			DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU6_REG, MPNPU_PUB_SCRATCH3),
    92			DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU6_REG, MPNPU_PUB_SCRATCH4),
    93			DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU6_REG, MPNPU_PUB_SCRATCH9),
    94			DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU6_PSP, MP0_C2PMSG_73),
    95			DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU6_PSP, MP0_C2PMSG_123),
    96			DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU6_REG, MPNPU_PUB_SCRATCH3),
    97		},
    98		.smu_regs_off   = {
    99			DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU6_SMU, MP1_C2PMSG_0),
   100			DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU6_SMU, MP1_C2PMSG_60),
   101			DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU6_SMU, MMNPU_APERTURE4_BASE),
   102			DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU6_SMU, MP1_C2PMSG_61),
   103			DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU6_SMU, MP1_C2PMSG_60),
   104		},
   105	};
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
