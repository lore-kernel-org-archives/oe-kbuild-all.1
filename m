Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC0B16F0D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 06:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734504979; cv=none; b=KBQETptWnxtHD7xK+t68M+do6433k8TdRG0MD3e+cUoDi1aj/nixdPg7yHleFKNB/Ft7SeZ9+oNMVERWokafOIPJOJAAgwTqOM9YtgNvpceOxcFbMqaNl37RXmcoFMiuGgO0jbVuiHdC49dUyNWSsIv+l37UlLZuvyCtCoZLWeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734504979; c=relaxed/simple;
	bh=8vkF4d2uhpSYZf3ofeZ53bgbAMoceO87LnFriCQq318=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h887fu0yzLzN3eN+5c8AtGCTl7MP+IyBnaYde8ZYuyLBjF5ncyqW2veEqSxXPN4SeaoTAQa2YQUt39rBgYUa37mbTGMHc95vMzmq1/ge0fjLFYQ89iNuJNIvBVO9FkyiPUQ82puuaacFs1R+XvZEhQ+PcohetPPFqd6FNtFvpPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/euBuJ6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/euBuJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734504977; x=1766040977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8vkF4d2uhpSYZf3ofeZ53bgbAMoceO87LnFriCQq318=;
  b=K/euBuJ6TUinJfUQvdenAXUh3c0ecucy2C6B89rhc8TSboFTK3O8gEgt
   JtF1NT5QoebSoSD7fpYPEBnrlmo+ps2Ik0YcqXD3C2REA/sJOSzLEl9wF
   Go/kmxKR2OkiCQXaHA4Y1yWir2gc9iLRkToCmvtBFcrHBCSh9fawoK+TP
   vy0vK3INRkUF4wOhIIthTgNOAeuHa7EmLpuOcdCLcCbnKfgrnf2RiTxXA
   rHKFYJK2W0u4XNcyk1NX8c8OYLS0uJSLWsPYbs8YchC7PKNnY0TJHSCcY
   E1qvZR/j/UeIZHBz7bxZoZnfXr/zgkCYq1MpzGudR80djSDvZGQeQ8vOK
   g==;
X-CSE-ConnectionGUID: TZEqOGyWS7y8p/EfUqAaMQ==
X-CSE-MsgGUID: 4zju2QadSO2TdKtKTWNrnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="52486332"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="52486332"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 22:56:16 -0800
X-CSE-ConnectionGUID: qlG3oddwRmGJadiql6bk2g==
X-CSE-MsgGUID: U92A+9iSQz2UzkFHJSatjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="97627269"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2024 22:56:14 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNnye-000GAA-1Z;
	Wed, 18 Dec 2024 06:56:12 +0000
Date: Wed, 18 Dec 2024 14:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 37/59] drivers/acpi/riscv/rimt.c:506:
 warning: Function parameter or struct member 'ops' not described in
 'rimt_iommu_configure_id'
Message-ID: <202412181450.L9IbGU1X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   4fd509619498a267ba245e95fefba09eef65a97e
commit: 8e11faf4c7b05ad34749c2ae0c9db7ade99790f7 [37/59] IOMMU: RISC-V: ACPI: Register IOMMU
config: riscv-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181450.L9IbGU1X-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181450.L9IbGU1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181450.L9IbGU1X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/riscv/rimt.c:506: warning: Function parameter or struct member 'ops' not described in 'rimt_iommu_configure_id'


vim +506 drivers/acpi/riscv/rimt.c

92e54add84ea713 Sunil V L 2024-08-16  496  
92e54add84ea713 Sunil V L 2024-08-16  497  /**
92e54add84ea713 Sunil V L 2024-08-16  498   * rimt_iommu_configure_id - Set-up IOMMU configuration for a device.
92e54add84ea713 Sunil V L 2024-08-16  499   *
92e54add84ea713 Sunil V L 2024-08-16  500   * @dev: device to configure
92e54add84ea713 Sunil V L 2024-08-16  501   * @id_in: optional input id const value pointer
92e54add84ea713 Sunil V L 2024-08-16  502   *
92e54add84ea713 Sunil V L 2024-08-16  503   * Returns: 0 on success, <0 on failure
92e54add84ea713 Sunil V L 2024-08-16  504   */
92e54add84ea713 Sunil V L 2024-08-16  505  int rimt_iommu_configure_id(struct device *dev, const u32 *id_in, const struct iommu_ops *ops)
92e54add84ea713 Sunil V L 2024-08-16 @506  {
92e54add84ea713 Sunil V L 2024-08-16  507  	struct acpi_rimt_node *node;
92e54add84ea713 Sunil V L 2024-08-16  508  	int err = -ENODEV;
92e54add84ea713 Sunil V L 2024-08-16  509  
92e54add84ea713 Sunil V L 2024-08-16  510  	if (dev_is_pci(dev)) {
92e54add84ea713 Sunil V L 2024-08-16  511  		struct iommu_fwspec *fwspec;
92e54add84ea713 Sunil V L 2024-08-16  512  		struct pci_bus *bus = to_pci_dev(dev)->bus;
92e54add84ea713 Sunil V L 2024-08-16  513  		struct rimt_pci_alias_info info = { .dev = dev };
92e54add84ea713 Sunil V L 2024-08-16  514  
92e54add84ea713 Sunil V L 2024-08-16  515  		node = rimt_scan_node(ACPI_RIMT_NODE_PCI_ROOT_COMPLEX,
92e54add84ea713 Sunil V L 2024-08-16  516  				      rimt_match_node_callback, &bus->dev);
92e54add84ea713 Sunil V L 2024-08-16  517  		if (!node)
92e54add84ea713 Sunil V L 2024-08-16  518  			return -ENODEV;
92e54add84ea713 Sunil V L 2024-08-16  519  
92e54add84ea713 Sunil V L 2024-08-16  520  		info.node = node;
92e54add84ea713 Sunil V L 2024-08-16  521  		info.ops = ops;
92e54add84ea713 Sunil V L 2024-08-16  522  		err = pci_for_each_dma_alias(to_pci_dev(dev),
92e54add84ea713 Sunil V L 2024-08-16  523  					     rimt_pci_iommu_init, &info);
92e54add84ea713 Sunil V L 2024-08-16  524  
92e54add84ea713 Sunil V L 2024-08-16  525  		fwspec = dev_iommu_fwspec_get(dev);
92e54add84ea713 Sunil V L 2024-08-16  526  	} else {
92e54add84ea713 Sunil V L 2024-08-16  527  		node = rimt_scan_node(ACPI_RIMT_NODE_PLAT_DEVICE,
92e54add84ea713 Sunil V L 2024-08-16  528  				      rimt_match_node_callback, dev);
92e54add84ea713 Sunil V L 2024-08-16  529  		if (!node)
92e54add84ea713 Sunil V L 2024-08-16  530  			return -ENODEV;
92e54add84ea713 Sunil V L 2024-08-16  531  
92e54add84ea713 Sunil V L 2024-08-16  532  		err = id_in ? rimt_nc_iommu_map_id(dev, node, id_in) :
92e54add84ea713 Sunil V L 2024-08-16  533  			      rimt_nc_iommu_map(dev, node);
92e54add84ea713 Sunil V L 2024-08-16  534  	}
92e54add84ea713 Sunil V L 2024-08-16  535  
92e54add84ea713 Sunil V L 2024-08-16  536  	return err;
92e54add84ea713 Sunil V L 2024-08-16  537  }
92e54add84ea713 Sunil V L 2024-08-16  538  

:::::: The code at line 506 was first introduced by commit
:::::: 92e54add84ea71310bc3c9e2afa25b7721b18c54 RISC-V: IOMMU: Add ACPI support using RIMT

:::::: TO: Sunil V L <sunilvl@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
