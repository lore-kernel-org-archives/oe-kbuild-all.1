Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753F1257D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 03:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162308; cv=none; b=GMMwAOG99gttID1J00OGS0VdMRAuhs8Ysyixk+fHo/KeQkhFdfJJ7B+YseGpFwTY7aReHwz1bmv7GwOrg4fF8WFe5ED7DOS6UBI6BHMnPBr7w+KHuQKb6eEmA9B0RqBAzCmpgWyPBKxWaRP4VeHv8bB04TDpAm3/OITxPsDO5vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162308; c=relaxed/simple;
	bh=C9DVJf7reAGgEnAR9Yvex0LVWy2Hv3xdTTOxV0D2jD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fi8VC72Ap5Xby3ZmPlQNmTJ9wnv4t6SHmmm+xnZNw6bu25Tiws/v5cRZTnsJM1mXMsnZ3TyfVlO6ccf/VukCumJm3YhC4sC/kzI1YNO1u1XY1koW976Q2TJ5Dbm16Lm0wrDhXYbGi+1pDwTGPKxptmNX7qBl1tz4aGJHoGtis2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfscNmPi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfscNmPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718162306; x=1749698306;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C9DVJf7reAGgEnAR9Yvex0LVWy2Hv3xdTTOxV0D2jD0=;
  b=cfscNmPi6PYDjxFj81uGhMyMGPTgcQwnvU4rroixWTiYEGaM95jG3Ey3
   G/lOvcq+hJOxejlKx+gsKID0hZKaOwoWQlQ7NP7SnNt7EDMnav+ogCoz1
   pSH5hPM5jAzYo97KLPDXg8xctb9q80eKpNGki2FlraUIuI9qY/BerwqhN
   oVE7tJFN78SL7hZQkHXvG/Cxrn4Bu3moYzsBTA/ChmPg4we3gmauLqy65
   ATYtmxYgd9Ba686hlfoW9RCexMMjWNsbKRWJfkhHBgKOnAwrK8QyuNcVs
   P3Gfh42KKzBlS+aeJBVO6aU/SGtDF/k1H5G0bWR5X7SuL1/dHxq22I+rN
   A==;
X-CSE-ConnectionGUID: 8epY4Sc1S1CNfUYX/sqNnQ==
X-CSE-MsgGUID: GzJiVvi3QIqkHjC+EKioIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15076587"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="15076587"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 20:18:26 -0700
X-CSE-ConnectionGUID: s/s5tPVPSSyH4lBDAXLFgg==
X-CSE-MsgGUID: ZS4dp8CSSMq6oVF/sNgsZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40347398"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2024 20:18:24 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHEVC-00019m-1P;
	Wed, 12 Jun 2024 03:18:22 +0000
Date: Wed, 12 Jun 2024 11:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pci-regs 2/2]
 drivers/pci/controller/pcie-microchip-host.c:1204:25: error: invalid storage
 class for function 'mc_pcie_driver_init'
Message-ID: <202406121143.rC64CceH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pci-regs
head:   18208f6cde334a1011ed8e9c94b7aeb2b18582bf
commit: 18208f6cde334a1011ed8e9c94b7aeb2b18582bf [2/2] PCI: microchip: rework reg region handing to support using either instance 1 or 2
config: arm64-randconfig-001-20240612 (https://download.01.org/0day-ci/archive/20240612/202406121143.rC64CceH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121143.rC64CceH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121143.rC64CceH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-microchip-host.c: In function 'mc_host_probe':
>> drivers/pci/controller/pcie-microchip-host.c:1193:1: warning: 'alias' attribute ignored [-Wattributes]
    1193 | MODULE_DEVICE_TABLE(of, mc_pcie_of_match);
         | ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:32,
                    from include/linux/pci.h:37,
                    from include/linux/pci-ecam.h:8,
                    from drivers/pci/controller/pcie-microchip-host.c:18:
>> drivers/pci/controller/pcie-microchip-host.c:1204:25: error: invalid storage class for function 'mc_pcie_driver_init'
    1204 | builtin_platform_driver(mc_pcie_driver);
         |                         ^~~~~~~~~~~~~~
   include/linux/device/driver.h:285:19: note: in definition of macro 'builtin_driver'
     285 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1204:1: note: in expansion of macro 'builtin_platform_driver'
    1204 | builtin_platform_driver(mc_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/controller/pcie-microchip-host.c:14:
   include/linux/module.h:131:49: error: invalid storage class for function '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/module.h:122:41: note: in expansion of macro 'module_init'
     122 | #define device_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   include/linux/device/driver.h:289:1: note: in expansion of macro 'device_initcall'
     289 | device_initcall(__driver##_init);
         | ^~~~~~~~~~~~~~~
   include/linux/platform_device.h:313:9: note: in expansion of macro 'builtin_driver'
     313 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1204:1: note: in expansion of macro 'builtin_platform_driver'
    1204 | builtin_platform_driver(mc_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1204:1: warning: 'alias' attribute ignored [-Wattributes]
   drivers/pci/controller/pcie-microchip-host.c:1207:1: error: expected declaration or statement at end of input
    1207 | MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
         | ^~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c: At top level:
>> drivers/pci/controller/pcie-microchip-host.c:1119:12: warning: 'mc_host_probe' defined but not used [-Wunused-function]
    1119 | static int mc_host_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~


vim +/mc_pcie_driver_init +1204 drivers/pci/controller/pcie-microchip-host.c

bac406c34fbc90 Daire McNamara   2023-07-28  1118  
bac406c34fbc90 Daire McNamara   2023-07-28 @1119  static int mc_host_probe(struct platform_device *pdev)
bac406c34fbc90 Daire McNamara   2023-07-28  1120  {
bac406c34fbc90 Daire McNamara   2023-07-28  1121  	struct device *dev = &pdev->dev;
18208f6cde334a Conor Dooley     2024-05-27  1122  	void __iomem *axi_base_addr;
4f0b91247f78cc Daire McNamara   2023-07-28  1123  	int ret;
1abb722888fda4 Daire McNamara   2023-07-28  1124  	u32 val;
6f15a9c9f94133 Daire McNamara   2021-01-25  1125  
4f0b91247f78cc Daire McNamara   2023-07-28  1126  	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
4f0b91247f78cc Daire McNamara   2023-07-28  1127  	if (!port)
4f0b91247f78cc Daire McNamara   2023-07-28  1128  		return -ENOMEM;
6f15a9c9f94133 Daire McNamara   2021-01-25  1129  
bac406c34fbc90 Daire McNamara   2023-07-28  1130  	port->dev = dev;
6f15a9c9f94133 Daire McNamara   2021-01-25  1131  
18208f6cde334a Conor Dooley     2024-05-27  1132  	port->bridge_base_addr = devm_platform_ioremap_resource_byname(pdev, "bridge");
18208f6cde334a Conor Dooley     2024-05-27  1133  	port->ctrl_base_addr = devm_platform_ioremap_resource_byname(pdev, "ctrl");
18208f6cde334a Conor Dooley     2024-05-27  1134  	if(!IS_ERR(port->bridge_base_addr) && !IS_ERR(port->ctrl_base_addr))
18208f6cde334a Conor Dooley     2024-05-27  1135  		goto addrs_set;
6f15a9c9f94133 Daire McNamara   2021-01-25  1136  
18208f6cde334a Conor Dooley     2024-05-27  1137  	/*
18208f6cde334a Conor Dooley     2024-05-27  1138  	 * The original, incorrect, binding that lumped the control and
18208f6cde334a Conor Dooley     2024-05-27  1139  	 * bridge addresses together still needs to be handled by the driver.
18208f6cde334a Conor Dooley     2024-05-27  1140  	 */
18208f6cde334a Conor Dooley     2024-05-27  1141  	axi_base_addr = devm_platform_ioremap_resource_byname(pdev, "apb");
18208f6cde334a Conor Dooley     2024-05-27  1142  	if (IS_ERR(axi_base_addr)) {
18208f6cde334a Conor Dooley     2024-05-27  1143  		return dev_err_probe(dev, PTR_ERR(port->bridge_base_addr),
18208f6cde334a Conor Dooley     2024-05-27  1144  				     "both legacy apb register and ctrl/bridge regions missing");
6f15a9c9f94133 Daire McNamara   2021-01-25  1145  
18208f6cde334a Conor Dooley     2024-05-27  1146  	port->bridge_base_addr = axi_base_addr + MC_PCIE1_BRIDGE_ADDR;
18208f6cde334a Conor Dooley     2024-05-27  1147  	port->ctrl_base_addr = axi_base_addr + MC_PCIE1_CTRL_ADDR;
18208f6cde334a Conor Dooley     2024-05-27  1148  
18208f6cde334a Conor Dooley     2024-05-27  1149  addrs_set:
18208f6cde334a Conor Dooley     2024-05-27  1150  	mc_disable_interrupts(port);
4f0b91247f78cc Daire McNamara   2023-07-28  1151  
1abb722888fda4 Daire McNamara   2023-07-28  1152  	/* Allow enabling MSI by disabling MSI-X */
18208f6cde334a Conor Dooley     2024-05-27  1153  	val = readl(port->bridge_base_addr + PCIE_PCI_IRQ_DW0);
1abb722888fda4 Daire McNamara   2023-07-28  1154  	val &= ~MSIX_CAP_MASK;
18208f6cde334a Conor Dooley     2024-05-27  1155  	writel(val, port->bridge_base_addr + PCIE_PCI_IRQ_DW0);
4f0b91247f78cc Daire McNamara   2023-07-28  1156  
1abb722888fda4 Daire McNamara   2023-07-28  1157  	/* Pick num vectors from bitfile programmed onto FPGA fabric */
18208f6cde334a Conor Dooley     2024-05-27  1158  	val = readl(port->bridge_base_addr + PCIE_PCI_IRQ_DW0);
1abb722888fda4 Daire McNamara   2023-07-28  1159  	val &= NUM_MSI_MSGS_MASK;
1abb722888fda4 Daire McNamara   2023-07-28  1160  	val >>= NUM_MSI_MSGS_SHIFT;
1abb722888fda4 Daire McNamara   2023-07-28  1161  
1abb722888fda4 Daire McNamara   2023-07-28  1162  	port->msi.num_vectors = 1 << val;
1abb722888fda4 Daire McNamara   2023-07-28  1163  
1abb722888fda4 Daire McNamara   2023-07-28  1164  	/* Pick vector address from design */
18208f6cde334a Conor Dooley     2024-05-27  1165  	port->msi.vector_phy = readl_relaxed(port->bridge_base_addr + IMSI_ADDR);
1abb722888fda4 Daire McNamara   2023-07-28  1166  
bac406c34fbc90 Daire McNamara   2023-07-28  1167  	ret = mc_pcie_init_clks(dev);
bac406c34fbc90 Daire McNamara   2023-07-28  1168  	if (ret) {
bac406c34fbc90 Daire McNamara   2023-07-28  1169  		dev_err(dev, "failed to get clock resources, error %d\n", ret);
bac406c34fbc90 Daire McNamara   2023-07-28  1170  		return -ENODEV;
bac406c34fbc90 Daire McNamara   2023-07-28  1171  	}
4f0b91247f78cc Daire McNamara   2023-07-28  1172  
bac406c34fbc90 Daire McNamara   2023-07-28  1173  	return pci_host_common_probe(pdev);
6f15a9c9f94133 Daire McNamara   2021-01-25  1174  }
6f15a9c9f94133 Daire McNamara   2021-01-25  1175  
6f15a9c9f94133 Daire McNamara   2021-01-25  1176  static const struct pci_ecam_ops mc_ecam_ops = {
6f15a9c9f94133 Daire McNamara   2021-01-25  1177  	.init = mc_platform_init,
6f15a9c9f94133 Daire McNamara   2021-01-25  1178  	.pci_ops = {
6f15a9c9f94133 Daire McNamara   2021-01-25  1179  		.map_bus = pci_ecam_map_bus,
6f15a9c9f94133 Daire McNamara   2021-01-25  1180  		.read = pci_generic_config_read,
6f15a9c9f94133 Daire McNamara   2021-01-25  1181  		.write = pci_generic_config_write,
6f15a9c9f94133 Daire McNamara   2021-01-25  1182  	}
6f15a9c9f94133 Daire McNamara   2021-01-25  1183  };
6f15a9c9f94133 Daire McNamara   2021-01-25  1184  
6f15a9c9f94133 Daire McNamara   2021-01-25  1185  static const struct of_device_id mc_pcie_of_match[] = {
6f15a9c9f94133 Daire McNamara   2021-01-25  1186  	{
6f15a9c9f94133 Daire McNamara   2021-01-25  1187  		.compatible = "microchip,pcie-host-1.0",
6f15a9c9f94133 Daire McNamara   2021-01-25  1188  		.data = &mc_ecam_ops,
6f15a9c9f94133 Daire McNamara   2021-01-25  1189  	},
6f15a9c9f94133 Daire McNamara   2021-01-25  1190  	{},
6f15a9c9f94133 Daire McNamara   2021-01-25  1191  };
6f15a9c9f94133 Daire McNamara   2021-01-25  1192  
c049b4b37685ff Uwe Kleine-König 2022-04-20 @1193  MODULE_DEVICE_TABLE(of, mc_pcie_of_match);
6f15a9c9f94133 Daire McNamara   2021-01-25  1194  
6f15a9c9f94133 Daire McNamara   2021-01-25  1195  static struct platform_driver mc_pcie_driver = {
bac406c34fbc90 Daire McNamara   2023-07-28  1196  	.probe = mc_host_probe,
6f15a9c9f94133 Daire McNamara   2021-01-25  1197  	.driver = {
6f15a9c9f94133 Daire McNamara   2021-01-25  1198  		.name = "microchip-pcie",
6f15a9c9f94133 Daire McNamara   2021-01-25  1199  		.of_match_table = mc_pcie_of_match,
6f15a9c9f94133 Daire McNamara   2021-01-25  1200  		.suppress_bind_attrs = true,
6f15a9c9f94133 Daire McNamara   2021-01-25  1201  	},
6f15a9c9f94133 Daire McNamara   2021-01-25  1202  };
6f15a9c9f94133 Daire McNamara   2021-01-25  1203  
6f15a9c9f94133 Daire McNamara   2021-01-25 @1204  builtin_platform_driver(mc_pcie_driver);

:::::: The code at line 1204 was first introduced by commit
:::::: 6f15a9c9f94133bee0d861a4bf25e10aaa95219d PCI: microchip: Add Microchip PolarFire PCIe controller driver

:::::: TO: Daire McNamara <daire.mcnamara@microchip.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
