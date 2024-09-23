Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D624C38394
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727098472; cv=none; b=RYXK/bNpju9W3zLS3kmnOlxdAFULKEO3VI69l5ipf0OH384K941RCwu9vnb60C+2H1u7ZAr/E1YK3Mz3TKkmUvc9vYQTDsM+0REx4+LeYXapr+0lwBaYtFDHVIdEtxc2HIjbn6z9GwdsW98AxiuK6tfrgl0B3NNIKUViD+5LxqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727098472; c=relaxed/simple;
	bh=AZGA4lxFc3FqJY5ZuHSKOo2+cOtBgZGkP+eaFIwlRAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bb5uI6TcRBqTR4FtEVXBK4Ga+Zxtz0TP2Q3Q4cWZCr7N3y1qf+/lnEPJQtWEb+K+ZuTVGFXaxArFkEAFMhbuOuJwtRTUkflTJaiRIdv0swhyWWJbxucK7wSf10pc9wNMTbyvaJwbcQBV8DjyXgbJ91kAFLpDrFcsdCIRaUmhAbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0wUMtGe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0wUMtGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727098470; x=1758634470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZGA4lxFc3FqJY5ZuHSKOo2+cOtBgZGkP+eaFIwlRAc=;
  b=C0wUMtGeRKMLfRV/92WrAI7SQ6/kdltf69utAjkD9WZM4emE9YNefM3z
   ijmhedN1g/9MX4utuIuM/u/+FQj+7Up/6qYYWWll1JhBZGYAAKjWFys3F
   hKxQIFQarjKM6ujrIZDUSWaksJb2DGAcn/288bN5P0BQFLKj1ypER4r5P
   u/QvbCDH1BZOQ3Mr5BqubSVnAEl0jfEAyw7HtT1jjuIvHiPh2lJEBjxgj
   xv0yjo6Y8E25U7pA5MRqHxh3TO7tCJwhMZ1NksYeqOUYLKEhzK0LCUxUj
   WAgqmTAH/9hTJjnkSaNm/wlRzxwgKvW9ryavmmbuJG6ipt3OVgtbSaeWF
   g==;
X-CSE-ConnectionGUID: 8dYgAn3kQ0yfMGztsy2g2g==
X-CSE-MsgGUID: t/kq93dgRoCnpTEZkEk2RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26199666"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="26199666"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 06:34:29 -0700
X-CSE-ConnectionGUID: O9cxZkDhTRSlXf+O2cpt/A==
X-CSE-MsgGUID: 8K0jJVgFT7SlrxWuqXITOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="70965698"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Sep 2024 06:34:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssjCp-000HEU-1t;
	Mon, 23 Sep 2024 13:34:23 +0000
Date: Mon, 23 Sep 2024 21:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2175/2441]
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:838:17: error:
 implicit declaration of function 'dwmac1000_validate_ucast_entries'
Message-ID: <202409232143.zQjGAaC2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: b4e38c43b99cfb600a24d434a655508c34ebbb0d [2175/2441] This patch makes stmmac driver support SBSA compatible Phytium SoC's on-chip RGMII.
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240923/202409232143.zQjGAaC2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409232143.zQjGAaC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409232143.zQjGAaC2-lkp@intel.com/

All errors (new ones prefixed by >>):

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
