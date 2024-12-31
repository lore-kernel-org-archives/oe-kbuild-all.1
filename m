Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B718E756
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 10:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735641875; cv=none; b=fWYC1rbvjHJ9ldgiRmhy/ye4vTN2oCagzWyXp35Ya3x8yNWQjEqwPJ902EkYJNFJNlYhSsnYlN01aJXrR/0fNDIQLMWeHBKvG0y/6ewaxIlaVDW0p6H80/8+H1V6zmGHBWZWQsvyaIqFg6yvPgt9nlP6xchbjOhFQU0LpqlTpOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735641875; c=relaxed/simple;
	bh=dxzBz/KDJCkzopMWtwKZaTFHdbQWR7UXu06vn60pqC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hb5jHBjfI3F2xBrQ/VDF7E59i9rk/UuoFYvd4hcPH3uT+XssXF2R7JL6IXMh2T/y26Oz8dTK2P9+3WytDT62kpe2TTmVGABKeI54vX4l6xb3Ecvc068XB35cgBepj1VF2G3TPuluj1lBLLeXz807h7sl68lZGh1gezMQEcJsgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1pUWorM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1pUWorM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735641873; x=1767177873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxzBz/KDJCkzopMWtwKZaTFHdbQWR7UXu06vn60pqC4=;
  b=W1pUWorMqXJRtz5U6qMIYBgMQbPWbUYT8eDruAlx7bZJ6eZWvrM+Iwi7
   2buHedp9O0F2bduVSUIFGBpJO1v6JuZA7naENnWhJt2/uFYUKJkB6l21e
   k+ks10HMpFM/TdCLkYM84GCw08we0D/BU8vUU/bCGv9UV4tcx6muxlVi+
   cCziDKLYgcl4G4vAkmnwTizQyQd4ZLg7xurgnxMUJtASsGGnMzsUrlzW7
   ZmwYBv/yrqmukhjp+iaReo0avPHb677trS5d1hOd8yV7hclOVb5vhr8if
   bRVjJoG/gzdYp/GBsHs0tDK3DsvZgYXdw1t9Hq96Zmy0d1KNIYpLq0q4y
   Q==;
X-CSE-ConnectionGUID: i+eBBrR6Tdid5dqPSGa6Mg==
X-CSE-MsgGUID: bWIiw+PbTGmvDuJb17F7Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36080726"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="36080726"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 02:44:32 -0800
X-CSE-ConnectionGUID: voBVaqzqT7iXxyGwXJzpwA==
X-CSE-MsgGUID: OSyrwle3R4aE/Pg5wmfw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106022500"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Dec 2024 02:44:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSZjg-00074S-2i;
	Tue, 31 Dec 2024 10:44:28 +0000
Date: Tue, 31 Dec 2024 18:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>,
	Xiaoming Ren <xiaoming.ren@amd.com>
Subject: [linux-next:master 3630/5236]
 drivers/accel/amdxdna/npu6_regs.c:76:31: sparse: sparse: symbol
 'npu6_dev_priv' was not declared. Should it be static?
Message-ID: <202412311819.9mz11Uak-lkp@intel.com>
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
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311819.9mz11Uak-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311819.9mz11Uak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311819.9mz11Uak-lkp@intel.com/

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
