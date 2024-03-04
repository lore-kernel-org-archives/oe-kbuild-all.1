Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B078B69
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709588799; cv=none; b=piuPPn52APEmUdqCrYztFIgXm6YtFD1GOA4TegupodWWYdN6/g2plyM3t/zpSttfHSaDUjSW7CAVYOrrjpn2DnpKnr0BwNs+eS/NepEpumsnStWva2xxVEqJRz/lYCuEr1n/0cBl+Mbq2A+Rex+tm7mewim5x3zrYw7WbVQkw2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709588799; c=relaxed/simple;
	bh=fWAVNPRxYYqjd52lL0MBScQG4xchjjTpfOMUIzl+2sM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o9bJKgs4YnTn6VozvtxHhxyxBpBmci/4mMnqdBnsyGU7O1fHEwkPmEETK7JQddpHSIA6o4YGF6ILXUZnYvpCTZ+hHBmzfbUlwhdsaZgm2AsSA7EXOTVwneNp9yj+vF1VOyA9BOXaQB/omJRZ1d2THY0lyLJMVwd60uS5n30y3LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igro5O4+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igro5O4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709588798; x=1741124798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fWAVNPRxYYqjd52lL0MBScQG4xchjjTpfOMUIzl+2sM=;
  b=igro5O4+UZmh1IehtsWZzcuFswhVrz28y1R74v9SiKBPaNS06IayTHUf
   8TEnZ3g+hW/chQyQWh6yRTAycKmpP4xX5LP3quw7eMcfBRaQTMJ+6dg2B
   ceLhveNRSmp9CfhnS2sVnZr5xpYa/UPSqeXKtgHwhUFHv29BXlGd93pTS
   AN5ep/2Nok7jgGIcqG3lRPYnHqXLJrkuBsRpJxUW6iq6bdo7vluWkP6Ju
   bA7XLoC3uqLiqW9SxNg8KPYqgnZFfR1KrPoBg6weIVZ4D+0z+X5XLOHXd
   uXQX6PqGGxH7gVbV84YH/xjm0ItUluZqwt2L1/oDrfbzQ+GUoDcKVF8oQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7926356"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="7926356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 13:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13806646"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Mar 2024 13:46:24 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhG8b-0002nB-1N;
	Mon, 04 Mar 2024 21:46:21 +0000
Date: Tue, 5 Mar 2024 05:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 9/41]
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:838:17: error:
 implicit declaration of function 'dwmac1000_validate_ucast_entries'
Message-ID: <202403050520.Wq7B7t0x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.phytium
head:   974a90e098c75ef0e62d4bbbde4535368a61f98b
commit: 7d9918e80df0d22c06e32eb6efcbd3d54368138f [9/41] This patch makes stmmac driver support SBSA compatible Phytium SoC's on-chip RGMII.
config: x86_64-randconfig-104-20240305 (https://download.01.org/0day-ci/archive/20240305/202403050520.Wq7B7t0x-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050520.Wq7B7t0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050520.Wq7B7t0x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/debug_locks.h:7,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from include/linux/mutex.h:16,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:11:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:712:5: warning: no previous prototype for 'fw_get_phy_mode' [-Wmissing-prototypes]
     712 | int fw_get_phy_mode(struct fwnode_handle *np)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:731:5: warning: no previous prototype for 'stmmac_acpi_clock_setup' [-Wmissing-prototypes]
     731 | int stmmac_acpi_clock_setup(struct plat_stmmacenet_data *plat,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c: In function 'stmmac_probe_config_acpi':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:838:17: error: implicit declaration of function 'dwmac1000_validate_ucast_entries' [-Werror=implicit-function-declaration]
     838 |                 dwmac1000_validate_ucast_entries(&pdev->dev,plat->unicast_filter_entries);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:840:17: error: implicit declaration of function 'dwmac1000_validate_mcast_bins' [-Werror=implicit-function-declaration]
     840 |                 dwmac1000_validate_mcast_bins(&pdev->dev,plat->multicast_filter_bins);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dwmac1000_validate_ucast_entries +838 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

   770	
   771	/**
   772	 * Parse ACPI driver parameters
   773	 */
   774	struct plat_stmmacenet_data *
   775	stmmac_probe_config_acpi(struct platform_device *pdev, const char **mac)
   776	{
   777		struct fwnode_handle *np;
   778		struct plat_stmmacenet_data *plat;
   779		struct stmmac_dma_cfg *dma_cfg;
   780	
   781		plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
   782		if (!plat)
   783			return ERR_PTR(-ENOMEM);
   784	
   785		np = dev_fwnode(&pdev->dev);
   786	
   787		plat->interface = fw_get_phy_mode(np);
   788	
   789		/* Get max speed of operation from device tree */
   790		if (fwnode_property_read_u32(np, "max-speed", &plat->max_speed))
   791			plat->max_speed = -1;
   792	
   793		if (fwnode_property_read_u32(np, "bus_id", &plat->bus_id))
   794			plat->bus_id = 2;
   795	
   796		/* Default to PHY auto-detection */
   797		plat->phy_addr = -1;
   798	
   799		/* "snps,phy-addr" is not a standard property. Mark it as deprecated
   800		 * and warn of its use. Remove this when PHY node support is added.
   801		 */
   802		if (fwnode_property_read_u32(np, "snps,phy-addr", &plat->phy_addr) == 0)
   803			dev_warn(&pdev->dev, "snps,phy-addr property is deprecated\n");
   804	
   805		if (stmmac_acpi_phy(plat, np, &pdev->dev))
   806			return ERR_PTR(-ENODEV);
   807	
   808		fwnode_property_read_u32(np, "tx-fifo-depth", &plat->tx_fifo_size);
   809		fwnode_property_read_u32(np, "rx-fifo-depth", &plat->rx_fifo_size);
   810		if (plat->tx_fifo_size == 0)
   811			plat->tx_fifo_size = 0x10000;
   812		if (plat->rx_fifo_size == 0)
   813			plat->rx_fifo_size = 0x10000;
   814	
   815		plat->force_sf_dma_mode =
   816			fwnode_property_read_bool(np, "snps,force_sf_dma_mode");
   817		plat->en_tx_lpi_clockgating =
   818			fwnode_property_read_bool(np, "snps,en-tx-lpi-clockgating");
   819	
   820		/* Set the maxmtu to a default of JUMBO_LEN in case the
   821		 * parameter is not present.
   822		 */
   823		plat->maxmtu = JUMBO_LEN;
   824	
   825		/* Set default value for multicast hash bins */
   826		plat->multicast_filter_bins = HASH_TABLE_SIZE;
   827	
   828		/* Set default value for unicast filter entries */
   829		plat->unicast_filter_entries = 1;
   830	
   831		/* Only to "snps,dwmac" */
   832		fwnode_property_read_u32(np, "max-frame-size", &plat->maxmtu);
   833		fwnode_property_read_u32(np, "snps,multicast-filter-bins",
   834					 &plat->multicast_filter_bins);
   835		fwnode_property_read_u32(np, "snps,perfect-filter-entries",
   836					 &plat->unicast_filter_entries);
   837		plat->unicast_filter_entries =
 > 838			dwmac1000_validate_ucast_entries(&pdev->dev,plat->unicast_filter_entries);
   839		plat->multicast_filter_bins =
 > 840			dwmac1000_validate_mcast_bins(&pdev->dev,plat->multicast_filter_bins);
   841		plat->has_gmac = 1;
   842		plat->pmt = 1;
   843	
   844		dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg), GFP_KERNEL);
   845		if (!dma_cfg)
   846			return ERR_PTR(-ENOMEM);
   847		plat->dma_cfg = dma_cfg;
   848	
   849		fwnode_property_read_u32(np, "snps,pbl", &dma_cfg->pbl);
   850		if (!dma_cfg->pbl)
   851			dma_cfg->pbl = DEFAULT_DMA_PBL;
   852	
   853		fwnode_property_read_u32(np, "snps,txpbl", &dma_cfg->txpbl);
   854		fwnode_property_read_u32(np, "snps,rxpbl", &dma_cfg->rxpbl);
   855		dma_cfg->pblx8 = !fwnode_property_read_bool(np, "snps,no-pbl-x8");
   856	
   857		dma_cfg->aal = fwnode_property_read_bool(np, "snps,aal");
   858		dma_cfg->fixed_burst = fwnode_property_read_bool(np, "snps,fixed-burst");
   859		dma_cfg->mixed_burst = fwnode_property_read_bool(np, "snps,mixed-burst");
   860	
   861		plat->force_thresh_dma_mode = fwnode_property_read_bool(np, "snps,force_thresh_dma_mode");
   862		if (plat->force_thresh_dma_mode)
   863			plat->force_sf_dma_mode = 0;
   864	
   865		fwnode_property_read_u32(np, "snps,ps-speed", &plat->mac_port_sel_speed);
   866	
   867		plat->axi = stmmac_axi_setup_acpi(pdev);
   868	
   869		stmmac_mtl_setup_acpi(pdev, plat);
   870	
   871		stmmac_acpi_clock_setup(plat, pdev);
   872	
   873		return plat;
   874	}
   875	#else
   876	struct plat_stmmacenet_data *
   877	stmmac_probe_config_acpi(struct platform_device *pdev, const char **mac)
   878	{
   879		return ERR_PTR(-EINVAL);
   880	}
   881	#endif /* CONFIG_ACPI */
   882	EXPORT_SYMBOL_GPL(stmmac_probe_config_acpi);
   883	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
