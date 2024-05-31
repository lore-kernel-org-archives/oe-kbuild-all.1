Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61F015DBB2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717176790; cv=none; b=Bgwizoya54rj4ThDUbNgHbkWch7AHlTyKPSORR/8t+F8Zib1bcjU/Z18KQTqnccWHdcRS+XFqEMdwtG5FfcT/4PaN4Qoo6bVRDjDj8X0AQ76jtfX6bbB4XSuERekjUKWf8aBqYnetAg6684InLsIa7bzIdgc7d9W7zKd9yLK69g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717176790; c=relaxed/simple;
	bh=j0XLgZ9jgHAOfa9TEEXfh1gtyEtj3qMc/GX0RWI3zMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QXVcE9Xjc2gdOdwgrNeaQm4fnpJSJaAKy6oCczyu5O1JpOgvFTESUQcOif95ycpqgPUwGTiBfkLR2RYMtvtJXO7XbcOg4tnqbS0YeUxOXlQP0Aq0PcgSm0a0j2umJVsH8Xn2ElO05A9gAva6QibRbm0lcfBtWHnM3iT0RZj2144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNkyWY8V; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNkyWY8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717176788; x=1748712788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0XLgZ9jgHAOfa9TEEXfh1gtyEtj3qMc/GX0RWI3zMg=;
  b=aNkyWY8VfkKWFrpUSMN3hcDBKOyKcntnuJ5ejkbbOtVkPHTMayVAT0E3
   21dzX3L+VXLNn/q/lBTAaN9mWZg8VemvSbCSgH6UaknLyi+BZQq8s3PMM
   cE5iRdoLrb8DSO+S6bakRW6FQkUrcKFy9/3GWx4JD1l+I7xE127IqVqlg
   KnlHnyXRWP6qbvUm5qKdKzBjBnT9R4KSY5e56g0/qNZW5u3Mh7/MTZ6Gn
   8KvmjXQf1Vck786RFyO3zaRb5uBzNLQ7SzF91ZPnpaxMuEK9UxmpG2DEs
   gwC9CJ9DrP+FRLfFQBhoO1yfMgsV/sji8sNW4fF/WCV/iVLVICghO18UF
   w==;
X-CSE-ConnectionGUID: 6YeZrjyyTWKnWPQjHTt85w==
X-CSE-MsgGUID: QLdfiUjkQtyH6/B49HJxMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24363495"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="24363495"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 10:33:07 -0700
X-CSE-ConnectionGUID: nXuM2UF1Rfuf4Z4CukQZVA==
X-CSE-MsgGUID: nVBTGfBgSCSbfCm6l2622w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="41144381"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2024 10:33:06 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD67j-000Ha3-10;
	Fri, 31 May 2024 17:33:03 +0000
Date: Sat, 1 Jun 2024 01:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pcie-fix-series 4/10]
 drivers/pci/controller/pcie-microchip-host.c:930:1: error: version control
 conflict marker in file
Message-ID: <202406010131.gAvNQphg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pcie-fix-series
head:   a331ca5a235fb88ab207b09471b40e082fea9912
commit: d7a38fae85af6ba9fa354c8cdaabf2dc51ef1b9b [4/10] PCI: microchip: rework reg region handing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240601/202406010131.gAvNQphg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010131.gAvNQphg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010131.gAvNQphg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-microchip-host.c: In function 'mc_pcie_setup_inbound_atr':
>> drivers/pci/controller/pcie-microchip-host.c:930:1: error: version control conflict marker in file
     930 | <<<<<<< HEAD
         | ^~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:934:1: error: expected expression before '||' token
     934 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         | ^~
>> drivers/pci/controller/pcie-microchip-host.c:934:19: error: invalid suffix "d38787a63db5" on integer constant
     934 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |                   ^~~~~~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:936:21: error: 'pcie_addr' redeclared as different kind of symbol
     936 |         phys_addr_t pcie_addr;
         |                     ^~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:928:75: note: previous definition of 'pcie_addr' with type 'u64' {aka 'long long unsigned int'}
     928 | static void mc_pcie_setup_inbound_atr(int window_index, u64 axi_addr, u64 pcie_addr, size_t size)
         |                                                                       ~~~~^~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:937:21: error: 'axi_addr' redeclared as different kind of symbol
     937 |         phys_addr_t axi_addr;
         |                     ^~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:928:61: note: previous definition of 'axi_addr' with type 'u64' {aka 'long long unsigned int'}
     928 | static void mc_pcie_setup_inbound_atr(int window_index, u64 axi_addr, u64 pcie_addr, size_t size)
         |                                                         ~~~~^~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:939:1: error: version control conflict marker in file
     939 | =======
         | ^~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:941:21: error: redeclaration of 'axi_addr' with no linkage
     941 |         phys_addr_t axi_addr;
         |                     ^~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:937:21: note: previous declaration of 'axi_addr' with type 'phys_addr_t' {aka 'long long unsigned int'}
     937 |         phys_addr_t axi_addr;
         |                     ^~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:942:13: error: redeclaration of 'atr_size' with no linkage
     942 |         u32 atr_size;
         |             ^~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:938:13: note: previous declaration of 'atr_size' with type 'u32' {aka 'unsigned int'}
     938 |         u32 atr_size;
         |             ^~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:943:1: error: version control conflict marker in file
     943 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:943:9: error: invalid suffix "d38787a63db5" on integer constant
     943 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |         ^~~~~~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:949:9: error: 'val' undeclared (first use in this function)
     949 |         val = lower_32_bits(pcie_addr) & GENMASK(31, 12);
         |         ^~~
   drivers/pci/controller/pcie-microchip-host.c:949:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/pci/controller/pcie-microchip-host.c:952:21: error: 'bridge_base_addr' undeclared (first use in this function); did you mean 'pcpu_base_addr'?
     952 |         writel(val, bridge_base_addr + table_offset + ATR0_PCIE_WIN0_SRCADDR_PARAM);
         |                     ^~~~~~~~~~~~~~~~
         |                     pcpu_base_addr
   drivers/pci/controller/pcie-microchip-host.c:954:1: error: version control conflict marker in file
     954 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:957:1: error: expected expression before '||' token
     957 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         | ^~
   drivers/pci/controller/pcie-microchip-host.c:957:19: error: invalid suffix "d38787a63db5" on integer constant
     957 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |                   ^~~~~~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:962:56: error: 'i' undeclared (first use in this function)
     962 |                        ATR0_PCIE_WIN0_SRCADDR_PARAM + (i * ATR_WINDOW_DESC_SIZE));
         |                                                        ^
>> drivers/pci/controller/pcie-microchip-host.c:962:60: error: 'ATR_WINDOW_DESC_SIZE' undeclared (first use in this function)
     962 |                        ATR0_PCIE_WIN0_SRCADDR_PARAM + (i * ATR_WINDOW_DESC_SIZE));
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:965:1: error: version control conflict marker in file
     965 | =======
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:973:1: error: version control conflict marker in file
     973 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:973:9: error: invalid suffix "d38787a63db5" on integer constant
     973 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |         ^~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:980:1: error: version control conflict marker in file
     980 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c: At top level:
>> drivers/pci/controller/pcie-microchip-host.c:984:1: error: expected identifier or '(' before '||' token
     984 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         | ^~
   drivers/pci/controller/pcie-microchip-host.c:984:19: error: invalid suffix "d38787a63db5" on integer constant
     984 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |                   ^~~~~~~~~~~~~
   In file included from include/linux/kernel.h:36,
                    from include/linux/clk.h:13,
                    from drivers/pci/controller/pcie-microchip-host.c:11:
>> include/linux/wordpart.h:14:26: error: expected declaration specifiers or '...' before '(' token
      14 | #define upper_32_bits(n) ((u32)(((n) >> 16) >> 16))
         |                          ^
   drivers/pci/controller/pcie-microchip-host.c:987:24: note: in expansion of macro 'upper_32_bits'
     987 |                 writel(upper_32_bits(axi_addr), bridge_base_addr +
         |                        ^~~~~~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:987:49: error: unknown type name 'bridge_base_addr'
     987 |                 writel(upper_32_bits(axi_addr), bridge_base_addr +
         |                                                 ^~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:989:1: error: version control conflict marker in file
     989 | =======
         | ^~~~~~~
>> include/linux/wordpart.h:14:26: error: expected declaration specifiers or '...' before '(' token
      14 | #define upper_32_bits(n) ((u32)(((n) >> 16) >> 16))
         |                          ^
   drivers/pci/controller/pcie-microchip-host.c:992:24: note: in expansion of macro 'upper_32_bits'
     992 |                 writel(upper_32_bits(axi_addr), port->bridge_base_addr +
         |                        ^~~~~~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:992:49: error: expected declaration specifiers or '...' before 'port'
     992 |                 writel(upper_32_bits(axi_addr), port->bridge_base_addr +
         |                                                 ^~~~
   drivers/pci/controller/pcie-microchip-host.c:994:1: error: version control conflict marker in file
     994 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:994:9: error: invalid suffix "d38787a63db5" on integer constant
     994 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |         ^~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1048:19: error: invalid suffix "d38787a63db5" on integer constant
    1048 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |                   ^~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1054:9: error: invalid suffix "d38787a63db5" on integer constant
    1054 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |         ^~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c: In function 'mc_pcie_setup_windows':
   drivers/pci/controller/pcie-microchip-host.c:1104:1: error: version control conflict marker in file
    1104 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1109:1: error: expected expression before '||' token
    1109 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         | ^~
   drivers/pci/controller/pcie-microchip-host.c:1109:19: error: invalid suffix "d38787a63db5" on integer constant
    1109 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |                   ^~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1113:1: error: version control conflict marker in file
    1113 | =======
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1117:1: error: version control conflict marker in file
    1117 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1117:9: error: invalid suffix "d38787a63db5" on integer constant
    1117 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |         ^~~~~~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:1099:13: warning: unused variable 'index' [-Wunused-variable]
    1099 |         u32 index = 1;
         |             ^~~~~
>> drivers/pci/controller/pcie-microchip-host.c:1098:13: warning: variable 'pci_addr' set but not used [-Wunused-but-set-variable]
    1098 |         u64 pci_addr;
         |             ^~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c: In function 'mc_platform_init':
   drivers/pci/controller/pcie-microchip-host.c:1242:1: error: version control conflict marker in file
    1242 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1245:19: error: invalid suffix "d38787a63db5" on integer constant
    1245 | ||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |                   ^~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1252:9: error: invalid suffix "d38787a63db5" on integer constant
    1252 | >>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
         |         ^~~~~~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:1368:1: error: expected declaration or statement at end of input
    1368 | MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
         | ^~~~~~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:1239:13: warning: unused variable 'ret' [-Wunused-variable]
    1239 |         int ret;
         |             ^~~
   drivers/pci/controller/pcie-microchip-host.c:1238:33: warning: unused variable 'pdev' [-Wunused-variable]
    1238 |         struct platform_device *pdev = to_platform_device(dev);
         |                                 ^~~~
   drivers/pci/controller/pcie-microchip-host.c:1368:1: warning: no return statement in function returning non-void [-Wreturn-type]
    1368 | MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
         | ^~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c: At top level:
   drivers/pci/controller/pcie-microchip-host.c:1235:12: warning: 'mc_platform_init' defined but not used [-Wunused-function]
    1235 | static int mc_platform_init(struct pci_config_window *cfg)
         |            ^~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1179:12: warning: 'mc_init_interrupts' defined but not used [-Wunused-function]
    1179 | static int mc_init_interrupts(struct platform_device *pdev, struct mc_pcie *port)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1139:13: warning: 'mc_disable_interrupts' defined but not used [-Wunused-function]
    1139 | static void mc_disable_interrupts(struct mc_pcie *port)
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1093:12: warning: 'mc_pcie_setup_windows' defined but not used [-Wunused-function]
    1093 | static int mc_pcie_setup_windows(struct platform_device *pdev,
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:1060:13: warning: 'mc_pcie_setup_window' defined but not used [-Wunused-function]
    1060 | static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:928:13: warning: 'mc_pcie_setup_inbound_atr' defined but not used [-Wunused-function]
     928 | static void mc_pcie_setup_inbound_atr(int window_index, u64 axi_addr, u64 pcie_addr, size_t size)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:871:12: warning: 'mc_pcie_init_clks' defined but not used [-Wunused-function]
     871 | static int mc_pcie_init_clks(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:386:13: warning: 'mc_pcie_enable_msi' defined but not used [-Wunused-function]
     386 | static void mc_pcie_enable_msi(struct mc_pcie *port, void __iomem *ecam)
         |             ^~~~~~~~~~~~~~~~~~


vim +930 drivers/pci/controller/pcie-microchip-host.c

   870	
 > 871	static int mc_pcie_init_clks(struct device *dev)
   872	{
   873		int i;
   874		struct clk *fic;
   875	
   876		/*
   877		 * PCIe may be clocked via Fabric Interface using between 1 and 4
   878		 * clocks. Scan DT for clocks and enable them if present
   879		 */
   880		for (i = 0; i < ARRAY_SIZE(poss_clks); i++) {
   881			fic = mc_pcie_init_clk(dev, poss_clks[i]);
   882			if (IS_ERR(fic))
   883				return PTR_ERR(fic);
   884		}
   885	
   886		return 0;
   887	}
   888	
   889	static int mc_pcie_init_irq_domains(struct mc_pcie *port)
   890	{
   891		struct device *dev = port->dev;
   892		struct device_node *node = dev->of_node;
   893		struct device_node *pcie_intc_node;
   894	
   895		/* Setup INTx */
   896		pcie_intc_node = of_get_next_child(node, NULL);
   897		if (!pcie_intc_node) {
   898			dev_err(dev, "failed to find PCIe Intc node\n");
   899			return -EINVAL;
   900		}
   901	
   902		port->event_domain = irq_domain_add_linear(pcie_intc_node, NUM_EVENTS,
   903							   &event_domain_ops, port);
   904		if (!port->event_domain) {
   905			dev_err(dev, "failed to get event domain\n");
   906			of_node_put(pcie_intc_node);
   907			return -ENOMEM;
   908		}
   909	
   910		irq_domain_update_bus_token(port->event_domain, DOMAIN_BUS_NEXUS);
   911	
   912		port->intx_domain = irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
   913							  &intx_domain_ops, port);
   914		if (!port->intx_domain) {
   915			dev_err(dev, "failed to get an INTx IRQ domain\n");
   916			of_node_put(pcie_intc_node);
   917			return -ENOMEM;
   918		}
   919	
   920		irq_domain_update_bus_token(port->intx_domain, DOMAIN_BUS_WIRED);
   921	
   922		of_node_put(pcie_intc_node);
   923		raw_spin_lock_init(&port->lock);
   924	
   925		return mc_allocate_msi_domains(port);
   926	}
   927	
 > 928	static void mc_pcie_setup_inbound_atr(int window_index, u64 axi_addr, u64 pcie_addr, size_t size)
   929	{
 > 930	<<<<<<< HEAD
   931		void __iomem *bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
   932		u32 table_offset = window_index * ATR_ENTRY_SIZE;
   933		u32 atr_sz;
 > 934	||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
   935		void __iomem *bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
 > 936		phys_addr_t pcie_addr;
 > 937		phys_addr_t axi_addr;
   938		u32 atr_size;
   939	=======
   940		phys_addr_t pcie_addr;
 > 941		phys_addr_t axi_addr;
 > 942		u32 atr_size;
   943	>>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
   944		u32 val;
   945	
   946		atr_sz = ilog2(size) - 1;
   947		atr_sz &= GENMASK(5, 0);
   948	
 > 949		val = lower_32_bits(pcie_addr) & GENMASK(31, 12);
   950		val |= (atr_sz << ATR_SIZE_SHIFT);
   951		val |= ATR_IMPL_ENABLE;
 > 952		writel(val, bridge_base_addr + table_offset + ATR0_PCIE_WIN0_SRCADDR_PARAM);
   953	
   954	<<<<<<< HEAD
   955		writel(upper_32_bits(pcie_addr), bridge_base_addr + table_offset +
   956		       ATR0_PCIE_WIN0_SRC_ADDR);
   957	||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
   958			val = lower_32_bits(pcie_addr) & GENMASK(31, 12);
   959			val |= (atr_size << ATR_SIZE_SHIFT);
   960			val |= ATR_IMPL_ENABLE;
   961			writel(val, bridge_base_addr +
 > 962			       ATR0_PCIE_WIN0_SRCADDR_PARAM + (i * ATR_WINDOW_DESC_SIZE));
   963			writel(upper_32_bits(pcie_addr), bridge_base_addr +
   964			       ATR0_PCIE_WIN0_SRC_ADDR + (i * ATR_WINDOW_DESC_SIZE));
   965	=======
   966			val = lower_32_bits(pcie_addr) & GENMASK(31, 12);
   967			val |= (atr_size << ATR_SIZE_SHIFT);
   968			val |= ATR_IMPL_ENABLE;
   969			writel(val, port->bridge_base_addr +
   970			       ATR0_PCIE_WIN0_SRCADDR_PARAM + (i * ATR_WINDOW_DESC_SIZE));
   971			writel(upper_32_bits(pcie_addr), port->bridge_base_addr +
   972			       ATR0_PCIE_WIN0_SRC_ADDR + (i * ATR_WINDOW_DESC_SIZE));
   973	>>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
   974	
   975		writel(lower_32_bits(axi_addr), bridge_base_addr + table_offset +
   976		       ATR0_PCIE_WIN0_TRSL_ADDR_LSB);
   977		writel(upper_32_bits(axi_addr), bridge_base_addr + table_offset +
   978		       ATR0_PCIE_WIN0_TRSL_ADDR_UDW);
   979	
   980	<<<<<<< HEAD
   981		writel(TRSL_ID_AXI4_MASTER_0, bridge_base_addr + table_offset +
   982		       ATR0_PCIE_WIN0_TRSL_PARAM);
   983	}
 > 984	||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
   985			writel(lower_32_bits(axi_addr), bridge_base_addr +
   986			       ATR0_PCIE_WIN0_TRSL_ADDR_LSB + (i * ATR_WINDOW_DESC_SIZE));
 > 987			writel(upper_32_bits(axi_addr), bridge_base_addr +
   988			       ATR0_PCIE_WIN0_TRSL_ADDR_UDW + (i * ATR_WINDOW_DESC_SIZE));
   989	=======
   990			writel(lower_32_bits(axi_addr), port->bridge_base_addr +
   991			       ATR0_PCIE_WIN0_TRSL_ADDR_LSB + (i * ATR_WINDOW_DESC_SIZE));
 > 992			writel(upper_32_bits(axi_addr), port->bridge_base_addr +
   993			       ATR0_PCIE_WIN0_TRSL_ADDR_UDW + (i * ATR_WINDOW_DESC_SIZE));
   994	>>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
   995	
   996	<<<<<<< HEAD
   997	static int mc_pcie_setup_inbound_ranges(struct platform_device *pdev, struct mc_pcie *port)
   998	{
   999		struct device *dev = &pdev->dev;
  1000		struct device_node *dn = dev->of_node;
  1001		struct of_range_parser parser;
  1002		struct of_range range;
  1003		int atr_index = 0;
  1004	
  1005		/*
  1006		 * MPFS PCIe root port is 32-bit only, behind a Fabric Interface
  1007		 * Controller FPGA logic block which contains the AXI-S interface.
  1008		 *
  1009		 * From the point of view of the PCIe root port, There are only
  1010		 * two supported Root Port configurations
  1011		 *
  1012		 * Configuration 1: for use with fully coherent designs; supports a
  1013		 * window from 0x0 (CPU space) to specified PCIe space.
  1014		 *
  1015		 * Configuration 2: for use with non-coherent designs; supports two
  1016		 * 1 Gb wide windows to CPU space; one mapping cpu space 0 to pcie
  1017		 * space 0x80000000 and mapping cpu space 0x40000000 to pcie
  1018		 * space 0xc0000000. This cfg needs two windows because of how
  1019		 * the MSI space is allocated in the AXI-S range on MPFS.
  1020		 *
  1021		 * The FIC interface outside the PCIe block *must* complete the inbound
  1022		 * address translation as per MCHP MPFS FPGA design guidelines.
  1023		 */
  1024		if (device_property_read_bool(dev, "dma-noncoherent")) {
  1025			/*
  1026			 * Always need same two tables in this case.  Need two tables
  1027			 * due to hardware interactions between address and size.
  1028			 */
  1029			mc_pcie_setup_inbound_atr(0, 0, MPFS_NC_BOUNCE_ADDR, SZ_1G);
  1030			mc_pcie_setup_inbound_atr(1, SZ_1G, MPFS_NC_BOUNCE_ADDR + SZ_1G, SZ_1G);
  1031		} else {
  1032			/* Find any dma-ranges */
  1033			if (of_pci_dma_range_parser_init(&parser, dn)) {
  1034				/* No dma-range property - setup default */
  1035				mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
  1036				return 0;
  1037			}
  1038	
  1039			for_each_of_range(&parser, &range) {
  1040				if (atr_index >= MC_MAX_NUM_INBOUND_WINDOWS) {
  1041					dev_err(dev, "too many inbound ranges; %d available tables\n",
  1042						MC_MAX_NUM_INBOUND_WINDOWS);
  1043					return -EINVAL;
  1044				}
  1045				mc_pcie_setup_inbound_atr(atr_index, 0, range.pci_addr, range.size);
  1046				atr_index++;
  1047			}
  1048	||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
  1049			writel(TRSL_ID_AXI4_MASTER_0, bridge_base_addr +
  1050			       ATR0_PCIE_WIN0_TRSL_PARAM + (i * ATR_WINDOW_DESC_SIZE));
  1051	=======
  1052			writel(TRSL_ID_AXI4_MASTER_0, port->bridge_base_addr +
  1053			       ATR0_PCIE_WIN0_TRSL_PARAM + (i * ATR_WINDOW_DESC_SIZE));
  1054	>>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
  1055		}
  1056	
  1057		return 0;
  1058	}
  1059	
> 1060	static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
  1061					 phys_addr_t axi_addr, phys_addr_t pci_addr,
  1062					 size_t size)
  1063	{
  1064		u32 atr_sz = ilog2(size) - 1;
  1065		u32 val;
  1066	
  1067		if (index == 0)
  1068			val = PCIE_CONFIG_INTERFACE;
  1069		else
  1070			val = PCIE_TX_RX_INTERFACE;
  1071	
  1072		writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
  1073		       ATR0_AXI4_SLV0_TRSL_PARAM);
  1074	
  1075		val = lower_32_bits(axi_addr) | (atr_sz << ATR_SIZE_SHIFT) |
  1076				    ATR_IMPL_ENABLE;
  1077		writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
  1078		       ATR0_AXI4_SLV0_SRCADDR_PARAM);
  1079	
  1080		val = upper_32_bits(axi_addr);
  1081		writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
  1082		       ATR0_AXI4_SLV0_SRC_ADDR);
  1083	
  1084		val = lower_32_bits(pci_addr);
  1085		writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
  1086		       ATR0_AXI4_SLV0_TRSL_ADDR_LSB);
  1087	
  1088		val = upper_32_bits(pci_addr);
  1089		writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
  1090		       ATR0_AXI4_SLV0_TRSL_ADDR_UDW);
  1091	}
  1092	
> 1093	static int mc_pcie_setup_windows(struct platform_device *pdev,
  1094					 struct mc_pcie *port)
  1095	{
  1096		struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
  1097		struct resource_entry *entry;
> 1098		u64 pci_addr;
> 1099		u32 index = 1;
  1100	
  1101		resource_list_for_each_entry(entry, &bridge->windows) {
  1102			if (resource_type(entry->res) == IORESOURCE_MEM) {
  1103				pci_addr = entry->res->start - entry->offset;
  1104	<<<<<<< HEAD
  1105				mc_pcie_setup_window(bridge_base_addr, index,
  1106						     entry->res->start & 0xffffffff,
  1107						     pci_addr & 0xffffffff,
  1108						     resource_size(entry->res));
  1109	||||||| parent of 8d38787a63db5 (PCI: microchip: rework reg region handing)
  1110				mc_pcie_setup_window(bridge_base_addr, index,
  1111						     entry->res->start - port->outbound_range_offset,
  1112						     pci_addr, resource_size(entry->res));
  1113	=======
  1114				mc_pcie_setup_window(port->bridge_base_addr, index,
  1115						     entry->res->start - port->outbound_range_offset,
  1116						     pci_addr, resource_size(entry->res));
  1117	>>>>>>> 8d38787a63db5 (PCI: microchip: rework reg region handing)
  1118				index++;
  1119			}
  1120		}
  1121	
  1122		return 0;
  1123	}
  1124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
