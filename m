Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7D718E361
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731788049; cv=none; b=I+AycjsLz441xW6kZmRiGCOOCOf1hFsriDaDciTIBYfCNyb9MBHTBITi9EnZ/mt4mIqys1yFoG+m5D8//bVbo21K9kczvRrt1VlVIDxqy9hVIpb8XhF+VxlwQsP6jIXpScFinJ3TSVmUTYHn+0W0OgOylBj3rv63YsT/vukvpRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731788049; c=relaxed/simple;
	bh=7WsO+/RZ4dCe5fM69XmXkoDYIR8mySL8QHXZo6HlId4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nO58dXYq55bkxnRV5novQOELBIAHAl1heuxlev2TlAVIilHgkqhuo/KZfH/J+j2JA4G7yxs9xpwpZ/+l9ABcmpivjrsdMr2/jlGXi0T3iqfZrwpGNMsDIirZmRs3C0GFL5sn8fxWeq/oYkdAfrg3GN0BmU6j/lIkXwrp8TQGu54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYgBCHHr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYgBCHHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731788047; x=1763324047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WsO+/RZ4dCe5fM69XmXkoDYIR8mySL8QHXZo6HlId4=;
  b=VYgBCHHrgiy5llcJeCqoYgyy6K6r7NcjJk012/UoP/igcQe0wXqwvSn2
   L3Vk4/jY65uzMw2ehUQ5j8XUTqvaS692qjpZQVPje0RKvBGyIxrK/DbKe
   UYcJMfWVSFUJDflCxS5r9rrq+cr2MZ6p14bvX7iwzknkcBIJonttWSnoO
   ROufJa4f1RIb0zZPdlZy242PGtOcKu5zZJOKc5sNPDUefnuTWDMFqX+fp
   BZC8NpeuqJTg8JADFGNllZCzgbw+kJtbUJYisPXx/1yJW30IUZuyasAHx
   kFgPpGpBMyg7BkNLVu7Kg+puYtTkrMH86BqQJmeAhi436qPeSJFhWiuEO
   g==;
X-CSE-ConnectionGUID: CAWnMUisTWmMpO0gjDn3Jw==
X-CSE-MsgGUID: YstVXrf7RtS/cIFqEokebg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42303755"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42303755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 12:14:07 -0800
X-CSE-ConnectionGUID: MSrmFLQVS/CgXrX93h+bvw==
X-CSE-MsgGUID: 19+XMzdfR8aqMGBVahK9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89017110"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Nov 2024 12:14:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCPBD-00016h-0a;
	Sat, 16 Nov 2024 20:14:03 +0000
Date: Sun, 17 Nov 2024 04:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, wangzhimin <wangzhimin1179@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297]
 drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:159:10: error:
 incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'int'
Message-ID: <202411170420.h6IZ44TN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi wangzhimin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4c37b6449701a1fcb16050d4e517fa6d505673e1
commit: af48889301db8235deab66a8822e3e00195ca14b [1297/1297] dwmac:add phytium dwmac driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241117/202411170420.h6IZ44TN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170420.h6IZ44TN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170420.h6IZ44TN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:159:10: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
     159 |                 return stmmac_res.addr;
         |                        ^~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:172:5: warning: no previous prototype for function 'phytium_dwmac_remove' [-Wmissing-prototypes]
     172 | int phytium_dwmac_remove(struct platform_device *pdev)
         |     ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c:172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     172 | int phytium_dwmac_remove(struct platform_device *pdev)
         | ^
         | static 
   1 warning and 1 error generated.


vim +159 drivers/net/ethernet/stmicro/stmmac/dwmac-phytium.c

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
   157		if (stmmac_res.addr < 0) {
   158			dev_err(&pdev->dev, "resource map failed.\n");
 > 159			return stmmac_res.addr;
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
