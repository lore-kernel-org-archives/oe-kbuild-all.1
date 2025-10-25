Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21B2343C0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761382630; cv=none; b=WFGcTclt5MV1u8ajX3SCBTER89SYbXIMWvq+L1UDuFTUSk0XCXrRJdMekXj/yptcdrJBtpjYclC43BAUgsXMLuKTWGEWvjQa9Lx5gESkM1zUe08CNKBsDPR/xsnTp/CtGqn1l1So5qW7PPCY5qtUUC4szUI49HxztYpXJd7FwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761382630; c=relaxed/simple;
	bh=1CIAtxrINCs/9maJ7yYTsEZjCiTNddRUmZIQjgR3Ze0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dYPz8VuPJURCe+6MMNykDCwOBvXDQGm7PpxOqx01TUvGUIeXOpX5gBRZ+G7q1/qXjesVJuJLNOCKdfO/bqZhLXvU1OwZPmdx6RVkyQpXbEbejvT6aQLaKO/lr7thHUDlsA/G3vnnG5cYM3FVkIMMeoCTfkCk9OAUDQsI4sWLHvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6xgUWaq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6xgUWaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761382629; x=1792918629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1CIAtxrINCs/9maJ7yYTsEZjCiTNddRUmZIQjgR3Ze0=;
  b=H6xgUWaqqXm16Gqr08pYr//f0VgTopRe17PSNEDnPjXeHcCAh1B/Q/Bo
   AgI6sL0PHJdo84QRSk5UnSWZr7inB7DHo7PXgD4Ay1aJHdXgeYlxBboiO
   ynn1CY72UB+y9BuHduNwD/jn+2aWEfyOwTI+yTEDVac3kwgjPXbS9KhvK
   xcWa6C7meMyYysBwlqhEkgxEKUlug9c7Fz4L75IQvWJhwJkbSgqzNPyGH
   54kJDCRMcBdKBR4o0ordInPT2aa7AFmDH3pBQ6QZbIZxQ4fXeOjvpUhdU
   5DS913LpzTvgoW5fLuaJ32PI+Ly5XhH79fXJ1Z9EjUHbVaZPtQ8PAPr5/
   A==;
X-CSE-ConnectionGUID: bYF+eOEjSH+A2MIcPcfA7A==
X-CSE-MsgGUID: SFlQw39CTN+rcBMgmk9NSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63248266"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63248266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 01:57:06 -0700
X-CSE-ConnectionGUID: PSeD/ZF6QTCAYAUSbV+tlw==
X-CSE-MsgGUID: WlSXxoZcQUCDJtoWEAh6kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184316642"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2025 01:57:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCa4w-000FCr-0E;
	Sat, 25 Oct 2025 08:57:00 +0000
Date: Sat, 25 Oct 2025 16:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jon Hunter <jonathanh@nvidia.com>
Subject: [jonhunter:tegra/next-fixes 14/16]
 drivers/i2c/busses/i2c-tegra.c:233:36: warning: 'tegra20_i2c_regs_vi'
 defined but not used
Message-ID: <202510251627.E59q8ko8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   fc452f6e234fe2d8079f35f2de995ff31ec8e8d7
commit: 9442fdbb46601ae02008cc458349792a5361ff20 [14/16] i2c: tegra: Add logic to support different register offsets
config: sparc-randconfig-002-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251627.E59q8ko8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251627.E59q8ko8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251627.E59q8ko8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-tegra.c:233:36: warning: 'tegra20_i2c_regs_vi' defined but not used [-Wunused-const-variable=]
     233 | static const struct tegra_i2c_regs tegra20_i2c_regs_vi = {
         |                                    ^~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-tegra.c:201:36: warning: 'tegra20_i2c_regs_dvc' defined but not used [-Wunused-const-variable=]
     201 | static const struct tegra_i2c_regs tegra20_i2c_regs_dvc = {
         |                                    ^~~~~~~~~~~~~~~~~~~~


vim +/tegra20_i2c_regs_vi +233 drivers/i2c/busses/i2c-tegra.c

   200	
 > 201	static const struct tegra_i2c_regs tegra20_i2c_regs_dvc = {
   202		.cnfg = 0x000 + 0x40,
   203		.status = 0x01c + 0x40,
   204		.sl_cnfg = 0x020 + 0x40,
   205		.sl_addr1 = 0x02c + 0x40,
   206		.sl_addr2 = 0x030 + 0x40,
   207		.tlow_sext = 0x034 + 0x40,
   208		.tx_fifo = 0x050 + 0x10,
   209		.rx_fifo = 0x054 + 0x10,
   210		.packet_transfer_status = 0x058 + 0x10,
   211		.fifo_control = 0x05c + 0x10,
   212		.fifo_status = 0x060 + 0x10,
   213		.int_mask = 0x064 + 0x10,
   214		.int_status = 0x068 + 0x10,
   215		.clk_divisor = 0x06c + 0x10,
   216		.bus_clear_cnfg = 0x084 + 0x40,
   217		.bus_clear_status = 0x088 + 0x40,
   218		.config_load = 0x08c + 0x40,
   219		.clken_override = 0x090 + 0x40,
   220		.interface_timing_0 = 0x094 + 0x40,
   221		.interface_timing_1 = 0x098 + 0x40,
   222		.hs_interface_timing_0 = 0x09c + 0x40,
   223		.hs_interface_timing_1 = 0x0a0 + 0x40,
   224		.master_reset_cntrl = 0x0a8 + 0x40,
   225		.mst_fifo_control = 0x0b4 + 0x10,
   226		.mst_fifo_status = 0x0b8 + 0x10,
   227		.sw_mutex = 0x0ec + 0x40,
   228		.dvc_ctrl_reg1 = 0x000,
   229		.dvc_ctrl_reg3 = 0x008,
   230		.dvc_status = 0x00c,
   231	};
   232	
 > 233	static const struct tegra_i2c_regs tegra20_i2c_regs_vi = {
   234		.cnfg = 0x0c00 + (0x000 << 2),
   235		.status = 0x0c00 + (0x01c << 2),
   236		.sl_cnfg = 0x0c00 + (0x020 << 2),
   237		.sl_addr1 = 0x0c00 + (0x02c << 2),
   238		.sl_addr2 = 0x0c00 + (0x030 << 2),
   239		.tlow_sext = 0x0c00 + (0x034 << 2),
   240		.tx_fifo = 0x0c00 + (0x050 << 2),
   241		.rx_fifo = 0x0c00 + (0x054 << 2),
   242		.packet_transfer_status = 0x0c00 + (0x058 << 2),
   243		.fifo_control = 0x0c00 + (0x05c << 2),
   244		.fifo_status = 0x0c00 + (0x060 << 2),
   245		.int_mask = 0x0c00 + (0x064 << 2),
   246		.int_status = 0x0c00 + (0x068 << 2),
   247		.clk_divisor = 0x0c00 + (0x06c << 2),
   248		.bus_clear_cnfg = 0x0c00 + (0x084 << 2),
   249		.bus_clear_status = 0x0c00 + (0x088 << 2),
   250		.config_load = 0x0c00 + (0x08c << 2),
   251		.clken_override = 0x0c00 + (0x090 << 2),
   252		.interface_timing_0 = 0x0c00 + (0x094 << 2),
   253		.interface_timing_1 = 0x0c00 + (0x098 << 2),
   254		.hs_interface_timing_0 = 0x0c00 + (0x09c << 2),
   255		.hs_interface_timing_1 = 0x0c00 + (0x0a0 << 2),
   256		.master_reset_cntrl = 0x0c00 + (0x0a8 << 2),
   257		.mst_fifo_control = 0x0c00 + (0x0b4 << 2),
   258		.mst_fifo_status = 0x0c00 + (0x0b8 << 2),
   259		.sw_mutex = 0x0c00 + (0x0ec << 2),
   260		.dvc_ctrl_reg1 = 0x000,
   261		.dvc_ctrl_reg3 = 0x008,
   262		.dvc_status = 0x00c,
   263	};
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
