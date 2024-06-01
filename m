Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6F0101CA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 04:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717217890; cv=none; b=Rq06T/ld8aVRVx3NfomSsHHDu4p+BVK08nAy3PWL/PKELlx0LhnTgVfIHVUjUAOiK9eCVW25AJ7C9QRhbNJCF+mYUX2+6M7oaBhVPrs0+hB13/gAXngI3WZdtcEwvxX2fqkMhX0Gx5cYeXaPHbSIs4w4AJ3CniWw3IPdx5Wbnn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717217890; c=relaxed/simple;
	bh=r25U9L0OR+jyAxREDz/RkcBit/n08qpYyAYgib3UY+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eug7Ne/L7EvubMZVV22lDW7x1SuaonulUgwlafVjG7RgqkPTuifl8iXihpV4hFkYBQHnRuTi4TWn5Jq7VhKUlCPqxc2EpC5Q4BpjUnZn/YUla8woSMgwhooSSz8f7NVt4cL+GjYUm8K70TgMclkxt2wdQWKWEyozC6sXR4Dcs+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWpmICAv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWpmICAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717217888; x=1748753888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r25U9L0OR+jyAxREDz/RkcBit/n08qpYyAYgib3UY+Y=;
  b=LWpmICAvzIpYolsR/Fu1ptrqhpwgShB1deQCoIVpoSMwlAJRC+eaBIjS
   HOkOiUYAuyKLDhbKL2xhhM0cXS1PGoiyt8ET0u5uQkDG4QaX1DKq2wmTf
   cOHCoRO8wcEFC4L+biIB7KJ9IgUOrHgW2tCRanvDBvKEmgd5npOczV33j
   YcLs+VhngKeNQVRZ15BTFIoF+xi3WdaGB3NOFnjgfgHged9E6PoHQeK8g
   9vZU1Xb8B1Vf+K+5Q2O3XVP8J99YnySfJcL555pMbu97QfRMYvPVWc4PV
   N+QMr1ARXolj/FwOugBhep9EqgQvo2kXUW4qoL1uC5eD1uVSxfi4Q2q9h
   g==;
X-CSE-ConnectionGUID: B2fqzKVyQPquz/bzurNFzQ==
X-CSE-MsgGUID: Kog+bArpRo65gUt6E/M35g==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13895889"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="13895889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 21:58:07 -0700
X-CSE-ConnectionGUID: mBU/Yy8mS6m0b802riBNCA==
X-CSE-MsgGUID: gpkPlOovQ3apPVNBqtsnmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="67546392"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 31 May 2024 21:58:05 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDGod-000IPV-1d;
	Sat, 01 Jun 2024 04:58:03 +0000
Date: Sat, 1 Jun 2024 12:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, wangzhimin <wangzhimin1179@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21354/22626]
 drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:157:29: sparse: sparse:
 incompatible types for operation (<):
Message-ID: <202406011246.c9Ab6NVD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d2901c3f0ff7d121adf97d64bd2cc3789821600d
commit: af48889301db8235deab66a8822e3e00195ca14b [21354/22626] dwmac:add phytium dwmac driver
config: arm64-randconfig-r122-20240531 (https://download.01.org/0day-ci/archive/20240601/202406011246.c9Ab6NVD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240601/202406011246.c9Ab6NVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011246.c9Ab6NVD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:157:29: sparse: sparse: incompatible types for operation (<):
   drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:157:29: sparse:    void [noderef] <asn:2> *[addressable] [assigned] addr
   drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:157:29: sparse:    int
>> drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:172:5: sparse: sparse: symbol 'phytium_dwmac_remove' was not declared. Should it be static?
   drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c: In function 'phytium_dwmac_probe':
   drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:157:29: warning: ordered comparison of pointer with integer zero [-Wextra]
     157 |         if (stmmac_res.addr < 0) {
         |                             ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:159:34: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     159 |                 return stmmac_res.addr;
         |                        ~~~~~~~~~~^~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c: At top level:
   drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:172:5: warning: no previous prototype for 'phytium_dwmac_remove' [-Wmissing-prototypes]
     172 | int phytium_dwmac_remove(struct platform_device *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~

vim +157 drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c

    32	
    33	static int phytium_dwmac_probe(struct platform_device *pdev)
    34	{
    35		struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
    36		struct plat_stmmacenet_data *plat;
    37		struct stmmac_resources stmmac_res;
    38		struct device_node *np = pdev->dev.of_node;
    39		struct resource *res;
    40		u64 clk_freq;
    41		char clk_name[20];
    42		int ret;
    43	
    44		plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
    45		if (!plat)
    46			return -ENOMEM;
    47	
    48		plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
    49					     GFP_KERNEL);
    50		if (!plat->dma_cfg)
    51			return -ENOMEM;
    52	
    53		plat->axi = devm_kzalloc(&pdev->dev, sizeof(*plat->axi), GFP_KERNEL);
    54		if (!plat->axi)
    55			return -ENOMEM;
    56	
    57		plat->interface = device_get_phy_mode(&pdev->dev);
    58		if (plat->interface < 0)
    59			return plat->interface;
    60	
    61		/* Configure PHY if using device-tree */
    62		if (pdev->dev.of_node)
    63			plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
    64	
    65		if (pdev->dev.of_node) {
    66			plat->bus_id = of_alias_get_id(np, "ethernet");
    67			if (plat->bus_id < 0)
    68				plat->bus_id = 0;
    69		} else if (fwnode_property_read_u32(fwnode, "bus_id", &plat->bus_id)) {
    70			plat->bus_id = 2;
    71		}
    72	
    73		plat->phy_addr = -1;
    74		plat->clk_csr = -1;
    75		plat->has_gmac = 1;
    76		plat->enh_desc = 1;
    77		plat->bugged_jumbo = 1;
    78		plat->pmt = 1;
    79		plat->force_sf_dma_mode = 1;
    80	
    81		if (fwnode_property_read_u32(fwnode, "max-speed", &plat->max_speed))
    82			plat->max_speed = -1;
    83	
    84		if (fwnode_property_read_u32(fwnode, "max-frame-size", &plat->maxmtu))
    85			plat->maxmtu = JUMBO_LEN;
    86	
    87		if (fwnode_property_read_u32(fwnode, "snps,multicast-filter-bins",
    88					     &plat->multicast_filter_bins))
    89			plat->multicast_filter_bins = HASH_TABLE_SIZE;
    90	
    91		if (fwnode_property_read_u32(fwnode, "snps,perfect-filter-entries",
    92					     &plat->unicast_filter_entries))
    93			plat->unicast_filter_entries = 1;
    94	
    95		if (fwnode_property_read_u32(fwnode, "tx-fifo-depth",
    96					     &plat->tx_fifo_size))
    97			plat->tx_fifo_size = 0x1000;
    98	
    99		if (fwnode_property_read_u32(fwnode, "rx-fifo-depth",
   100					     &plat->rx_fifo_size))
   101			plat->rx_fifo_size = 0x1000;
   102	
   103		if (phytium_dwmac_acpi_phy(plat, fwnode, &pdev->dev))
   104			return -ENODEV;
   105	
   106		plat->rx_queues_to_use = 1;
   107		plat->tx_queues_to_use = 1;
   108		plat->rx_queues_cfg[0].mode_to_use = MTL_QUEUE_DCB;
   109		plat->tx_queues_cfg[0].mode_to_use = MTL_QUEUE_DCB;
   110	
   111		if (fwnode_property_read_u64(fwnode, "clock-frequency", &clk_freq))
   112			clk_freq = 125000000;
   113	
   114		/* Set system clock */
   115		snprintf(clk_name, sizeof(clk_name), "%s-%d", "stmmaceth",
   116			 plat->bus_id);
   117	
   118		plat->stmmac_clk = clk_register_fixed_rate(&pdev->dev, clk_name,
   119							   NULL, 0, clk_freq);
   120		if (IS_ERR(plat->stmmac_clk)) {
   121			dev_warn(&pdev->dev, "Fail to register stmmac-clk\n");
   122			plat->stmmac_clk = NULL;
   123		}
   124	
   125		ret = clk_prepare_enable(plat->stmmac_clk);
   126		if (ret) {
   127			clk_unregister_fixed_rate(plat->stmmac_clk);
   128			return ret;
   129		}
   130	
   131		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
   132		plat->clk_ptp_ref = NULL;
   133	
   134		if (fwnode_property_read_u32(fwnode, "snps,pbl", &plat->dma_cfg->pbl))
   135			plat->dma_cfg->pbl = 16;
   136	
   137		fwnode_property_read_u32(fwnode, "snps,txpbl", &plat->dma_cfg->txpbl);
   138		fwnode_property_read_u32(fwnode, "snps,rxpbl", &plat->dma_cfg->rxpbl);
   139	
   140		plat->dma_cfg->pblx8 = !fwnode_property_read_bool(fwnode,
   141								  "snps,no-pbl-x8");
   142		plat->dma_cfg->aal = fwnode_property_read_bool(fwnode, "snps,aal");
   143		plat->dma_cfg->fixed_burst = fwnode_property_read_bool(fwnode,
   144								       "snps,fixed-burst");
   145		plat->dma_cfg->mixed_burst = fwnode_property_read_bool(fwnode,
   146								       "snps,mixed-burst");
   147	
   148		plat->axi->axi_lpi_en = false;
   149		plat->axi->axi_xit_frm = false;
   150		plat->axi->axi_wr_osr_lmt = 7;
   151		plat->axi->axi_rd_osr_lmt = 7;
   152		plat->axi->axi_blen[0] = 16;
   153	
   154		memset(&stmmac_res, 0, sizeof(stmmac_res));
   155		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   156		stmmac_res.addr = devm_ioremap_resource(&pdev->dev, res);
 > 157		if (stmmac_res.addr < 0) {
   158			dev_err(&pdev->dev, "resource map failed.\n");
   159			return stmmac_res.addr;
   160		}
   161		stmmac_res.irq = platform_get_irq(pdev, 0);
   162		if (stmmac_res.irq < 0) {
   163			dev_err(&pdev->dev, "IRQ not found.\n");
   164			return -ENXIO;
   165		}
   166		stmmac_res.wol_irq = stmmac_res.irq;
   167		stmmac_res.lpi_irq = -1;
   168	
   169		return  stmmac_dvr_probe(&pdev->dev, plat, &stmmac_res);
   170	}
   171	
 > 172	int phytium_dwmac_remove(struct platform_device *pdev)
   173	{
   174		int ret;
   175		struct net_device *ndev = platform_get_drvdata(pdev);
   176		struct stmmac_priv *priv = netdev_priv(ndev);
   177		struct plat_stmmacenet_data *plat = priv->plat;
   178	
   179		ret = stmmac_pltfr_remove(pdev);
   180		clk_unregister_fixed_rate(plat->stmmac_clk);
   181		return ret;
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
