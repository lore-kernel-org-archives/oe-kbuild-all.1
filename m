Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813692FE566
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 19:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761506908; cv=none; b=j4+a5H/Tths2Fchb8diKdhgjVlMrvovWOr8x6rcUPyF9pT8QcWnp1tF+rqQyizLXOOg2TPRgXNzp297jPATh7Ee+HoDUBbtEXx2BUxoR/M44Y7E06kRB4bpRA3BCNNbIXvMw+9lt2A/7NdJ/K4TPeFa/cNJidZN13FnNqYvLTBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761506908; c=relaxed/simple;
	bh=PC+8iFtbgvrKLDsWE005Ej9U3kfitfr6o88DIGnYHyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8RiQF+KxjEa+s6QoaPkLmq1BePbsNGD+uWCba0qS5gBovw01Jj68WRWtoqwc+/0TRFKzpxN8ngwJNcvuX0fuMFjVtSw5RgkDl3EbyGJbZC8vMuo1+VJb5vYHEBYgZdg/Vtw6oJwHmCTrizG1RXhR+o+hkOzrlVcVKXWuZgIbiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eU+nxAvf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eU+nxAvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761506906; x=1793042906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PC+8iFtbgvrKLDsWE005Ej9U3kfitfr6o88DIGnYHyY=;
  b=eU+nxAvfV65t1JKh+/YjhX6U8ZCWNVVVxr8N59el6ti0KjOu+7+tLfja
   mXXgio2xD2GXPYZhzXxAZ/EeouLrTLKFD4RNZDJczrcMg73MSjrlVGpQI
   IsuXdw9nYVkVvuOkG7ovgzNVHxHIXS4K7Jb2nt2D+JgWRyEYaljj/LrkA
   Gqc5udo3pAeNOSvI6fB3R4djpxq+C3bPZZdBEZ9xdcl5fIA3r/wIy57zh
   9SdkAcl2pjg/7ytu4zSdc7VLWCP2fVQAbIcMpWYhMoIF1XuEoZ+60iIy0
   ar+ZY34eM29YpwovCrRhg/StmgLI9lyFIYN0B3T9ya8X8QUaDSYF3NfSe
   A==;
X-CSE-ConnectionGUID: fOD0eBG9RRuKi/HMbhNQ9w==
X-CSE-MsgGUID: bhLYRcQ1R3qEyBoMCckK0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81228734"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="81228734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 12:28:25 -0700
X-CSE-ConnectionGUID: G6Uk1+QdSjOh0l0A142O5g==
X-CSE-MsgGUID: FwgAR3TyR6Sz1AX09sHtEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184488231"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Oct 2025 12:28:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD6Pe-000GJh-0J;
	Sun, 26 Oct 2025 19:28:22 +0000
Date: Mon, 27 Oct 2025 03:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jon Hunter <jonathanh@nvidia.com>
Subject: [jonhunter:tegra/next-fixes 14/16]
 drivers/i2c/busses/i2c-tegra.c:201:36: warning: unused variable
 'tegra20_i2c_regs_dvc'
Message-ID: <202510270305.XFdpTKMp-lkp@intel.com>
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
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251027/202510270305.XFdpTKMp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270305.XFdpTKMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270305.XFdpTKMp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-tegra.c:201:36: warning: unused variable 'tegra20_i2c_regs_dvc' [-Wunused-const-variable]
     201 | static const struct tegra_i2c_regs tegra20_i2c_regs_dvc = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-tegra.c:233:36: warning: unused variable 'tegra20_i2c_regs_vi' [-Wunused-const-variable]
     233 | static const struct tegra_i2c_regs tegra20_i2c_regs_vi = {
         |                                    ^~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/tegra20_i2c_regs_dvc +201 drivers/i2c/busses/i2c-tegra.c

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
