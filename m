Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB6127E3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715346151; cv=none; b=fpZloRQWNOKSLeqltgvCajGTxwBAZ3KrtjSdAhvVJaU38E75F9w+DKlOIoJ2rMiHLlFop6ue1gMKBM05ne6Gm0b4/qM9BEjFclgGTmsW3IyO19BWpQF9MiRX9G21BYTmSeYMSMyWmsT2p5dOmDNkG99yOiVvaU0JqPzE43+6/h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715346151; c=relaxed/simple;
	bh=ETm8Zorh0cZFJ3946t76LP9adujqszHCfe8gQJtGerE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ak4dHGOmZgL8E5xeCIQJc43D8/gRgHNG5YkUXjb0ygIHsesMS7PdDZw1O4TJHepy3a24OaQqZr3Arn4yR/+GM+zR8lbicZxKfz+qViAsQxMM8HZ3PXhp3Z7BLtcLES/A8qduoe4XIztjKxo/E3ge+SJW4E/xAHkhZaz4uf1MqPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMuK710S; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMuK710S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715346150; x=1746882150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ETm8Zorh0cZFJ3946t76LP9adujqszHCfe8gQJtGerE=;
  b=MMuK710S+SawgMD8DEPYO01n0X7M8DYBe+XUOkMnR5kPylNwTD9h1UfU
   WEI4HK5Gd37KFr4YzNTCcmwauJhllBYIZ+ebZ9ki63yGum6wTrLFTD46z
   yx8iuaHSUHZnLziT9IanPqA1tMmyFy4Zt1apA5uO+lOvhPZ+CwS08BzQT
   +2HwY3I6pR7e5SKL+iGaRFJrapZ0o0TUsm0aJE3D9QfXB/yXrfEL1ElA9
   FE2LeI62GUVxF4+q0cky/08IbvAXFVhKSXy6mQi0cHo/3Rxhq7JZSgaqM
   IS8Hgn29MRpdzbA7N5xBoPIqPQEy6ohehdNFUMfh/eDz1/ZKAIGPlylu/
   A==;
X-CSE-ConnectionGUID: gzgjq+Y/QfmGNlV5RPmwag==
X-CSE-MsgGUID: ibEDSsOiSwK++Cto97NNAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22731532"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="22731532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 06:02:10 -0700
X-CSE-ConnectionGUID: tKEa2VeYTnyJRszhPoMldw==
X-CSE-MsgGUID: 3eXbBualROaRIDjD3sykug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34046632"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 May 2024 06:02:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Psz-0006A7-2P;
	Fri, 10 May 2024 13:02:05 +0000
Date: Fri, 10 May 2024 21:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:pci-mbox 2/9] drivers/pci/mrb.c:55: warning: Function
 parameter or struct member 'dev_type' not described in
 'mmio_find_regblock_instance'
Message-ID: <202405102051.D264as1O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git pci-mbox
head:   9c38a15525283584d0d49404c11c397fe71ba1e8
commit: a08c6a2a48f9dea06ca214c1d3cd9c199098e25b [2/9] PCI: Add discovery of MMIO register block common helpers
config: x86_64-buildonly-randconfig-001-20240510 (https://download.01.org/0day-ci/archive/20240510/202405102051.D264as1O-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405102051.D264as1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405102051.D264as1O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/mrb.c:55: warning: Function parameter or struct member 'dev_type' not described in 'mmio_find_regblock_instance'
>> drivers/pci/mrb.c:55: warning: Function parameter or struct member 'index' not described in 'mmio_find_regblock_instance'
>> drivers/pci/mrb.c:55: warning: expecting prototype for mmio_find_regblock(). Prototype was for mmio_find_regblock_instance() instead
--
>> drivers/cxl/core/regs.c:599: warning: expecting prototype for cxl_find_regblock_instance(). Prototype was for cxl_find_dvsec_regblock_instance() instead


vim +55 drivers/pci/mrb.c

    40	
    41	/**
    42	 * mmio_find_regblock() - Locate MMIO register blocks by type
    43	 * @pdev: The PCI device to enumerate
    44	 * @type: Register Block ID
    45	 * @map: Enumeration output, clobbered on error
    46	 *
    47	 * Return: 0 if register block enumerated, negative error code otherwise
    48	 *
    49	 * One or more register blocks may exist, search for them by @type.
    50	 */
    51	int mmio_find_regblock_instance(struct pci_dev *pdev,
    52					enum mrb_dev_type dev_type, int type,
    53					struct mmio_register_map *map,
    54					int index)
  > 55	{
    56		u32 mrbl_size, mrbl_blocks;
    57		int instance = 0;
    58		int mloc, i;
    59	
    60		*map = (struct mmio_register_map) {
    61			.dev_type = dev_type,
    62			.host = &pdev->dev,
    63			.resource = MMIO_RESOURCE_NONE,
    64		};
    65	
    66		switch (dev_type) {
    67		case DEV_TYPE_PCI:
    68			mloc = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_MRBL);
    69			pci_read_config_dword(pdev, mloc + PCI_MRBL_CAP, &mrbl_size);
    70			mrbl_size = PCI_MRBL_LEN(mrbl_size);
    71			mloc += PCI_MRBL_REG_LOCATOR_BLOCK1_OFFSET;
    72			mrbl_blocks = (mrbl_size - PCI_MRBL_REG_LOCATOR_BLOCK1_OFFSET) / 8;
    73			break;
    74		case DEV_TYPE_CXL:
    75			mloc = pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_CXL,
    76							 CXL_DVSEC_REG_LOCATOR);
    77			pci_read_config_dword(pdev, mloc + PCI_DVSEC_HEADER1, &mrbl_size);
    78			mrbl_size = PCI_DVSEC_HEADER1_LEN(mrbl_size);
    79			mloc += CXL_DVSEC_REG_LOCATOR_BLOCK1_OFFSET;
    80			mrbl_blocks = (mrbl_size - CXL_DVSEC_REG_LOCATOR_BLOCK1_OFFSET) / 8;
    81			break;
    82		default:
    83			return -EINVAL;
    84		}
    85	
    86		if (!mloc)
    87			return -ENXIO;
    88	
    89		for (i = 0; i < mrbl_blocks; i++, mloc += 8) {
    90			u32 reg_lo, reg_hi;
    91	
    92			pci_read_config_dword(pdev, mloc, &reg_lo);
    93			pci_read_config_dword(pdev, mloc + 4, &reg_hi);
    94	
    95			if (!decode_regblock(pdev, reg_lo, reg_hi, map))
    96				continue;
    97	
    98			if (map->reg_type == type) {
    99				if (index == instance)
   100					return 0;
   101				instance++;
   102			}
   103		}
   104	
   105		map->resource = MMIO_RESOURCE_NONE;
   106	
   107		return -ENODEV;
   108	}
   109	EXPORT_SYMBOL_GPL(mmio_find_regblock_instance);
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
