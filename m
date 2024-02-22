Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123BD376ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592819; cv=none; b=euOPLRObtCdZQfpa1NKFEwN1kvUZGGFlm+RdTSwy/EiHP0my+JX8ehZQouyyaQhiD1kO9AMgolaxDZX8u6OUWukiAOXDQ1cLTLFGKNwI2YypUYTineZZrsQpX2lozvEsVfLONuT6XdQRuvaGXHBG0ABIQKCCAK63KR0tI8QWtl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592819; c=relaxed/simple;
	bh=1Zv8NpBWc6d50TGLt264vBt6sNEYC0liGXEXJIyiGAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sNtJbpsfFsru1cABsQC+auDqMWdFtQs1fk7kroSD4S44elltWQftG1QEKb5lX2Jc56hxqfnd3MFvb+6Zg2g2fA40MVTVHVo+eI/eUrPPWI5gqDLWaOylZ1SRHWeQr2b4D4NtluiF8eG4Wex8P/0C8g8QLOyIa/Bw07YtqAkX5y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTA3nlkx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTA3nlkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708592817; x=1740128817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Zv8NpBWc6d50TGLt264vBt6sNEYC0liGXEXJIyiGAw=;
  b=hTA3nlkxlQ7QmcFTKzUwS4NHgJ7PUc6bARmVP9S8s+Ty7rQoAYdGupQU
   lBGZWBN3MBUGSIsHTC7+noalVMVg7RnmOXFdjdsmrjAA20KhQCj19Ck/k
   W8+QbuBIastpp53on63jcKPOyT8rvKenEU/ba4nvi58xO4l4IjVXJVhFO
   LhuoSbODL0BQDf0hH92TzWhiQtDpJJMQV6lHepSixr1r/g9M5wwAQNavK
   6QSSbJ0JCyM8iNrHmSE+YwLaow/KPXS1r0KEEBPCviqZES7YysGjvXEMD
   qCgOnJBp1iRaGSg4tmwGwY1clKX11A3QR8nn790A307XaPItiIMFuL1l6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="25264904"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="25264904"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 01:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="42905977"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Feb 2024 01:06:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd52Y-00069w-2F;
	Thu, 22 Feb 2024 09:06:50 +0000
Date: Thu, 22 Feb 2024 17:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 9/41]
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:712:5: warning: no
 previous prototype for 'fw_get_phy_mode'
Message-ID: <202402221743.XqQ6ValW-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240222/202402221743.XqQ6ValW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221743.XqQ6ValW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221743.XqQ6ValW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:712:5: warning: no previous prototype for 'fw_get_phy_mode' [-Wmissing-prototypes]
     712 | int fw_get_phy_mode(struct fwnode_handle *np)
         |     ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:731:5: warning: no previous prototype for 'stmmac_acpi_clock_setup' [-Wmissing-prototypes]
     731 | int stmmac_acpi_clock_setup(struct plat_stmmacenet_data *plat,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:134: warning: Function parameter or member 'plat' not described in 'stmmac_mtl_setup'
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:374: warning: Function parameter or member 'np' not described in 'stmmac_of_get_mac_mode'
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:680: warning: Function parameter or member 'pdev' not described in 'stmmac_mtl_setup_acpi'
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:680: warning: Function parameter or member 'plat' not described in 'stmmac_mtl_setup_acpi'
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:776: warning: Function parameter or member 'pdev' not described in 'stmmac_probe_config_acpi'
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:776: warning: Function parameter or member 'mac' not described in 'stmmac_probe_config_acpi'


vim +/fw_get_phy_mode +712 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

   674	
   675	/**
   676	 * Parse ACPI _DSD parameters for multiple queues configuration
   677	 */
   678	static void stmmac_mtl_setup_acpi(struct platform_device *pdev,
   679					  struct plat_stmmacenet_data *plat)
 > 680	{
   681		plat->rx_queues_to_use = 1;
   682		plat->tx_queues_to_use = 1;
   683	
   684		/**
   685		 * First Queue must always be in DCB mode. As MTL_QUEUE_DCB=1 we need
   686		 * to always set this, otherwise Queue will be classified as AVB
   687		 * (because MTL_QUEUE_AVB = 0).
   688		 */
   689		plat->rx_queues_cfg[0].mode_to_use = MTL_QUEUE_DCB;
   690		plat->tx_queues_cfg[0].mode_to_use = MTL_QUEUE_DCB;
   691	
   692		plat->rx_queues_cfg[0].use_prio = true;
   693	
   694		plat->rx_queues_cfg[0].pkt_route = 0x0;
   695	
   696		plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
   697		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
   698	
   699		plat->tx_queues_cfg[0].use_prio = true;
   700	}
   701	
   702	static int stmmac_acpi_phy(struct plat_stmmacenet_data *plat,
   703				   struct fwnode_handle *np, struct device *dev)
   704	{
   705		plat->mdio_bus_data = devm_kzalloc(dev,
   706						   sizeof(struct stmmac_mdio_bus_data),
   707						   GFP_KERNEL);
   708	
   709		return 0;
   710	}
   711	
 > 712	int fw_get_phy_mode(struct fwnode_handle *np)
   713	{
   714		const char *pm;
   715		int err, i;
   716	
   717		err = fwnode_property_read_string(np, "phy-mode", &pm);
   718		if (err < 0)
   719			err = fwnode_property_read_string(np, "phy-connection-mode", &pm);
   720		if (err < 0)
   721			return err;
   722	
   723		for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++) {
   724			if (!strcasecmp(pm, phy_modes(i)))
   725				return i;
   726		}
   727	
   728		return -ENODEV;
   729	}
   730	
 > 731	int stmmac_acpi_clock_setup(struct plat_stmmacenet_data *plat,
   732				    struct platform_device *pdev)
   733	{
   734		struct fwnode_handle *np = dev_fwnode(&pdev->dev);
   735		struct device *dev = &pdev->dev;
   736		u64 clk_freq = 0;
   737		int err;
   738	
   739		err = fwnode_property_read_u64(np, "clock-frequency", &clk_freq);
   740		if (err < 0)
   741			clk_freq = 125000000; /* default to 125MHz */
   742	
   743		plat->stmmac_clk = clk_register_fixed_rate(dev, dev_name(dev),
   744							   NULL, 0, clk_freq);
   745		if (IS_ERR(plat->stmmac_clk)) {
   746			dev_warn(&pdev->dev, "Fail to register CSR clock\n");
   747			plat->stmmac_clk = NULL;
   748		}
   749		clk_prepare_enable(plat->stmmac_clk);
   750	
   751		plat->pclk = devm_clk_get(dev, "pclk");
   752		if (IS_ERR(plat->pclk))
   753			plat->pclk = NULL;
   754		clk_prepare_enable(plat->pclk);
   755	
   756		plat->clk_ptp_ref = devm_clk_get(dev, "ptp_ref");
   757		if (IS_ERR(plat->clk_ptp_ref)) {
   758			plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
   759			plat->clk_ptp_ref = NULL;
   760		}
   761	
   762		plat->stmmac_rst = devm_reset_control_get(dev, STMMAC_RESOURCE_NAME);
   763		if (IS_ERR(plat->stmmac_rst)) {
   764			dev_info(dev, "no reset control found\n");
   765			plat->stmmac_rst = NULL;
   766		}
   767	
   768		return 0;
   769	}
   770	
   771	/**
   772	 * Parse ACPI driver parameters
   773	 */
   774	struct plat_stmmacenet_data *
   775	stmmac_probe_config_acpi(struct platform_device *pdev, const char **mac)
 > 776	{
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
   838			dwmac1000_validate_ucast_entries(&pdev->dev,plat->unicast_filter_entries);
   839		plat->multicast_filter_bins =
   840			dwmac1000_validate_mcast_bins(&pdev->dev,plat->multicast_filter_bins);
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
