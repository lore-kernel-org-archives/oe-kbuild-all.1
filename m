Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE1523ED75
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233999; cv=none; b=ecagFeK7s59A1R/u6RYnYt7i/u+SBLhwfvKd47b+8+lxHHBzQNy05ma67ijEE2CdfaTV8SiRuMGnrHkIzTtFNQUMo629Sqf+h1D6KDM9N07VGCQsFOZtukCPzbfiAoNx773W5nPQUzYdrGwsU76COYPaXeLx0ykCS3FRS2H/DDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233999; c=relaxed/simple;
	bh=orifKuegu5jc9e8ic5nkuQC0u6BHo3JCAhxzWIUAK18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B0MGtWx/MXOQGy08PURmBR2pDNaZ+aFEwIL4yrdw3GE5nsdOAQSFch7da/qFy/m29X+tYvdV6OiGgDebmnp7lcFhFfQWwck6qHQ1gaGtkamOFEJPm3N3kokHqY8Or86cgpK8rwDwnjMBFI+JjXqfDgOx3m+5pWKDJhpkwXTpFFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StJjadh7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StJjadh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768233997; x=1799769997;
  h=date:from:to:cc:subject:message-id;
  bh=orifKuegu5jc9e8ic5nkuQC0u6BHo3JCAhxzWIUAK18=;
  b=StJjadh7xQ/ov5hI36OV4rK32MWx3y8DX6DRI4s0bMCW/YRw8gLf/Csz
   QsjgugMwBdO6EqyRcxUWUDbSbQx7os/BiVjqNzy6FBoj2G1h3zXgFcUJS
   Oy3KwKfQeE9WjfJsIkZ3x+DIaa3kLW32aGsWg4/7KV6Xy+tr/0EXBU/h6
   9cFWAgDO0VxaX9DXz6VOLd3mvtgnEeZBkl5GJizcb6VCquTcekSnmFAU2
   /93rUGhJ9+EkC3rQuBe8GKXVnw2d5/YMjIg7pQpBE1ZBRFsPavJM/RQre
   3c7VrwRMkUJKoaAy0yE5+JtMWwfdZzuKMTI0osfJ/TTdw0fSpjpGvovY/
   w==;
X-CSE-ConnectionGUID: qUYi2k8gSb+0dK37C5l5vQ==
X-CSE-MsgGUID: FPtkSDvASxmzze8B+bnZ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69409629"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69409629"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 08:06:36 -0800
X-CSE-ConnectionGUID: dbYX72VfSeOP6Xoj1TK1Qw==
X-CSE-MsgGUID: yt5ze+s2TFKp5onaB4t4yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="241656825"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jan 2026 08:06:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfKR5-00000000DY3-3000;
	Mon, 12 Jan 2026 16:06:31 +0000
Date: Tue, 13 Jan 2026 00:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dinguyen:remove_ocp_v4 2/4]
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:625:16: error: 'struct
 socfpga_dwmac' has no member named 'stmmac_ocp_rst'; did you mean
 'stmmac_rst'?
Message-ID: <202601130038.77oLYA8Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git remove_ocp_v4
head:   304fdccabcccbd3edc8e12cac67521f0513191e7
commit: 3d0a0b1aae1ed39b4334accb26a51adc839fc150 [2/4] net: stmmac: socfpga: add call to assert/deassert ahb reset line
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601130038.77oLYA8Y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130038.77oLYA8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130038.77oLYA8Y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c: In function 'socfpga_dwmac_probe':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:625:16: error: 'struct socfpga_dwmac' has no member named 'stmmac_ocp_rst'; did you mean 'stmmac_rst'?
     625 |         dwmac->stmmac_ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");
         |                ^~~~~~~~~~~~~~
         |                stmmac_rst
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:632:39: warning: missing terminating " character
     632 |                         dev_warn(dev, "ocp reset is deprecated, please update your
         |                                       ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:633:48: warning: missing terminating " character
     633 |                                  device tree.\n");
         |                                                ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:699:26: error: unterminated argument list invoking macro 'dev_warn'
     699 | MODULE_LICENSE("GPL v2");
         |                          ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:632:25: error: 'dev_warn' undeclared (first use in this function); did you mean '_dev_warn'?
     632 |                         dev_warn(dev, "ocp reset is deprecated, please update your
         |                         ^~~~~~~~
         |                         _dev_warn
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:632:25: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:632:33: error: expected ';' at end of input
     632 |                         dev_warn(dev, "ocp reset is deprecated, please update your
         |                                 ^
         |                                 ;
   ......
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:631:17: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     631 |                 if (ocp_rst)
         |                 ^~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:632:25: error: expected declaration or statement at end of input
     632 |                         dev_warn(dev, "ocp reset is deprecated, please update your
         |                         ^~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:632:25: error: expected declaration or statement at end of input
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c: At top level:
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:597:12: warning: 'socfpga_dwmac_probe' defined but not used [-Wunused-function]
     597 | static int socfpga_dwmac_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:570:13: warning: 'socfpga_agilex5_setup_plat_dat' defined but not used [-Wunused-function]
     570 | static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:560:13: warning: 'socfpga_gen5_setup_plat_dat' defined but not used [-Wunused-function]
     560 | static void socfpga_gen5_setup_plat_dat(struct socfpga_dwmac *dwmac)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:553:12: warning: 'socfpga_dwmac_init' defined but not used [-Wunused-function]
     553 | static int socfpga_dwmac_init(struct device *dev, void *bsp_priv)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:547:28: warning: 'socfpga_dwmac_select_pcs' defined but not used [-Wunused-function]
     547 | static struct phylink_pcs *socfpga_dwmac_select_pcs(struct stmmac_priv *priv,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:541:13: warning: 'socfpga_dwmac_pcs_exit' defined but not used [-Wunused-function]
     541 | static void socfpga_dwmac_pcs_exit(struct stmmac_priv *priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:497:12: warning: 'socfpga_dwmac_pcs_init' defined but not used [-Wunused-function]
     497 | static int socfpga_dwmac_pcs_init(struct stmmac_priv *priv)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:445:12: warning: 'socfpga_gen10_set_phy_mode' defined but not used [-Wunused-function]
     445 | static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:387:12: warning: 'socfpga_gen5_set_phy_mode' defined but not used [-Wunused-function]
     387 | static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:114:12: warning: 'socfpga_dwmac_parse_data' defined but not used [-Wunused-function]
     114 | static int socfpga_dwmac_parse_data(struct socfpga_dwmac *dwmac, struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:74:13: warning: 'socfpga_dwmac_fix_mac_speed' defined but not used [-Wunused-function]
      74 | static void socfpga_dwmac_fix_mac_speed(void *bsp_priv, int speed,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +625 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c

801d233b7302eea Dinh Nguyen           2014-03-26  444  
40ae25505fe8346 Dinh Nguyen           2019-06-05 @445  static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
40ae25505fe8346 Dinh Nguyen           2019-06-05  446  {
40ae25505fe8346 Dinh Nguyen           2019-06-05  447  	struct regmap *sys_mgr_base_addr = dwmac->sys_mgr_base_addr;
5f109d45a4768a4 Alexandru Ardelean    2019-09-16  448  	int phymode = socfpga_get_plat_phymode(dwmac);
40ae25505fe8346 Dinh Nguyen           2019-06-05  449  	u32 reg_offset = dwmac->reg_offset;
40ae25505fe8346 Dinh Nguyen           2019-06-05  450  	u32 reg_shift = dwmac->reg_shift;
40ae25505fe8346 Dinh Nguyen           2019-06-05  451  	u32 ctrl, val, module;
40ae25505fe8346 Dinh Nguyen           2019-06-05  452  
40ae25505fe8346 Dinh Nguyen           2019-06-05  453  	if (socfpga_set_phy_mode_common(phymode, &val))
40ae25505fe8346 Dinh Nguyen           2019-06-05  454  		return -EINVAL;
40ae25505fe8346 Dinh Nguyen           2019-06-05  455  
40ae25505fe8346 Dinh Nguyen           2019-06-05  456  	/* Overwrite val to GMII if splitter core is enabled. The phymode here
40ae25505fe8346 Dinh Nguyen           2019-06-05  457  	 * is the actual phy mode on phy hardware, but phy interface from
40ae25505fe8346 Dinh Nguyen           2019-06-05  458  	 * EMAC core is GMII.
40ae25505fe8346 Dinh Nguyen           2019-06-05  459  	 */
40ae25505fe8346 Dinh Nguyen           2019-06-05  460  	if (dwmac->splitter_base)
40ae25505fe8346 Dinh Nguyen           2019-06-05  461  		val = SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII;
40ae25505fe8346 Dinh Nguyen           2019-06-05  462  
40ae25505fe8346 Dinh Nguyen           2019-06-05  463  	/* Assert reset to the enet controller before changing the phy mode */
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  464  	reset_control_assert(dwmac->plat_dat->stmmac_ahb_rst);
40ae25505fe8346 Dinh Nguyen           2019-06-05  465  	reset_control_assert(dwmac->stmmac_rst);
40ae25505fe8346 Dinh Nguyen           2019-06-05  466  
40ae25505fe8346 Dinh Nguyen           2019-06-05  467  	regmap_read(sys_mgr_base_addr, reg_offset, &ctrl);
40ae25505fe8346 Dinh Nguyen           2019-06-05  468  	ctrl &= ~(SYSMGR_EMACGRP_CTRL_PHYSEL_MASK);
40ae25505fe8346 Dinh Nguyen           2019-06-05  469  	ctrl |= val;
40ae25505fe8346 Dinh Nguyen           2019-06-05  470  
40ae25505fe8346 Dinh Nguyen           2019-06-05  471  	if (dwmac->f2h_ptp_ref_clk ||
40ae25505fe8346 Dinh Nguyen           2019-06-05  472  	    phymode == PHY_INTERFACE_MODE_MII ||
40ae25505fe8346 Dinh Nguyen           2019-06-05  473  	    phymode == PHY_INTERFACE_MODE_GMII ||
40ae25505fe8346 Dinh Nguyen           2019-06-05  474  	    phymode == PHY_INTERFACE_MODE_SGMII) {
40ae25505fe8346 Dinh Nguyen           2019-06-05  475  		ctrl |= SYSMGR_GEN10_EMACGRP_CTRL_PTP_REF_CLK_MASK;
40ae25505fe8346 Dinh Nguyen           2019-06-05  476  		regmap_read(sys_mgr_base_addr, SYSMGR_FPGAINTF_EMAC_REG,
40ae25505fe8346 Dinh Nguyen           2019-06-05  477  			    &module);
40ae25505fe8346 Dinh Nguyen           2019-06-05  478  		module |= (SYSMGR_FPGAINTF_EMAC_BIT << reg_shift);
40ae25505fe8346 Dinh Nguyen           2019-06-05  479  		regmap_write(sys_mgr_base_addr, SYSMGR_FPGAINTF_EMAC_REG,
40ae25505fe8346 Dinh Nguyen           2019-06-05  480  			     module);
40ae25505fe8346 Dinh Nguyen           2019-06-05  481  	} else {
40ae25505fe8346 Dinh Nguyen           2019-06-05  482  		ctrl &= ~SYSMGR_GEN10_EMACGRP_CTRL_PTP_REF_CLK_MASK;
40ae25505fe8346 Dinh Nguyen           2019-06-05  483  	}
40ae25505fe8346 Dinh Nguyen           2019-06-05  484  
40ae25505fe8346 Dinh Nguyen           2019-06-05  485  	regmap_write(sys_mgr_base_addr, reg_offset, ctrl);
40ae25505fe8346 Dinh Nguyen           2019-06-05  486  
40ae25505fe8346 Dinh Nguyen           2019-06-05  487  	/* Deassert reset for the phy configuration to be sampled by
40ae25505fe8346 Dinh Nguyen           2019-06-05  488  	 * the enet controller, and operation to start in requested mode
40ae25505fe8346 Dinh Nguyen           2019-06-05  489  	 */
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  490  	reset_control_deassert(dwmac->plat_dat->stmmac_ahb_rst);
40ae25505fe8346 Dinh Nguyen           2019-06-05  491  	reset_control_deassert(dwmac->stmmac_rst);
5d1f3fe7d2d54d0 Maxime Chevallier     2023-06-01  492  	if (phymode == PHY_INTERFACE_MODE_SGMII)
5d1f3fe7d2d54d0 Maxime Chevallier     2023-06-01  493  		socfpga_sgmii_config(dwmac, true);
40ae25505fe8346 Dinh Nguyen           2019-06-05  494  	return 0;
40ae25505fe8346 Dinh Nguyen           2019-06-05  495  }
40ae25505fe8346 Dinh Nguyen           2019-06-05  496  
81b418a65657571 Russell King (Oracle  2024-05-13 @497) static int socfpga_dwmac_pcs_init(struct stmmac_priv *priv)
81b418a65657571 Russell King (Oracle  2024-05-13  498) {
81b418a65657571 Russell King (Oracle  2024-05-13  499) 	struct socfpga_dwmac *dwmac = priv->plat->bsp_priv;
81b418a65657571 Russell King (Oracle  2024-05-13  500) 	struct regmap_config pcs_regmap_cfg = {
81b418a65657571 Russell King (Oracle  2024-05-13  501) 		.reg_bits = 16,
81b418a65657571 Russell King (Oracle  2024-05-13  502) 		.val_bits = 16,
81b418a65657571 Russell King (Oracle  2024-05-13  503) 		.reg_shift = REGMAP_UPSHIFT(1),
81b418a65657571 Russell King (Oracle  2024-05-13  504) 	};
81b418a65657571 Russell King (Oracle  2024-05-13  505) 	struct mdio_regmap_config mrc;
81b418a65657571 Russell King (Oracle  2024-05-13  506) 	struct regmap *pcs_regmap;
81b418a65657571 Russell King (Oracle  2024-05-13  507) 	struct phylink_pcs *pcs;
81b418a65657571 Russell King (Oracle  2024-05-13  508) 	struct mii_bus *pcs_bus;
81b418a65657571 Russell King (Oracle  2024-05-13  509) 
81b418a65657571 Russell King (Oracle  2024-05-13  510) 	if (!dwmac->tse_pcs_base)
81b418a65657571 Russell King (Oracle  2024-05-13  511) 		return 0;
81b418a65657571 Russell King (Oracle  2024-05-13  512) 
81b418a65657571 Russell King (Oracle  2024-05-13  513) 	pcs_regmap = devm_regmap_init_mmio(priv->device, dwmac->tse_pcs_base,
81b418a65657571 Russell King (Oracle  2024-05-13  514) 					   &pcs_regmap_cfg);
81b418a65657571 Russell King (Oracle  2024-05-13  515) 	if (IS_ERR(pcs_regmap))
81b418a65657571 Russell King (Oracle  2024-05-13  516) 		return PTR_ERR(pcs_regmap);
81b418a65657571 Russell King (Oracle  2024-05-13  517) 
81b418a65657571 Russell King (Oracle  2024-05-13  518) 	memset(&mrc, 0, sizeof(mrc));
81b418a65657571 Russell King (Oracle  2024-05-13  519) 	mrc.regmap = pcs_regmap;
81b418a65657571 Russell King (Oracle  2024-05-13  520) 	mrc.parent = priv->device;
81b418a65657571 Russell King (Oracle  2024-05-13  521) 	mrc.valid_addr = 0x0;
81b418a65657571 Russell King (Oracle  2024-05-13  522) 	mrc.autoscan = false;
81b418a65657571 Russell King (Oracle  2024-05-13  523) 
81b418a65657571 Russell King (Oracle  2024-05-13  524) 	/* Can't use ndev->name here because it will not have been initialised,
81b418a65657571 Russell King (Oracle  2024-05-13  525) 	 * and in any case, the user can rename network interfaces at runtime.
81b418a65657571 Russell King (Oracle  2024-05-13  526) 	 */
81b418a65657571 Russell King (Oracle  2024-05-13  527) 	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii",
81b418a65657571 Russell King (Oracle  2024-05-13  528) 		 dev_name(priv->device));
81b418a65657571 Russell King (Oracle  2024-05-13  529) 	pcs_bus = devm_mdio_regmap_register(priv->device, &mrc);
81b418a65657571 Russell King (Oracle  2024-05-13  530) 	if (IS_ERR(pcs_bus))
81b418a65657571 Russell King (Oracle  2024-05-13  531) 		return PTR_ERR(pcs_bus);
81b418a65657571 Russell King (Oracle  2024-05-13  532) 
81b418a65657571 Russell King (Oracle  2024-05-13  533) 	pcs = lynx_pcs_create_mdiodev(pcs_bus, 0);
81b418a65657571 Russell King (Oracle  2024-05-13  534) 	if (IS_ERR(pcs))
81b418a65657571 Russell King (Oracle  2024-05-13  535) 		return PTR_ERR(pcs);
81b418a65657571 Russell King (Oracle  2024-05-13  536) 
81b418a65657571 Russell King (Oracle  2024-05-13  537) 	priv->hw->phylink_pcs = pcs;
81b418a65657571 Russell King (Oracle  2024-05-13  538) 	return 0;
81b418a65657571 Russell King (Oracle  2024-05-13  539) }
81b418a65657571 Russell King (Oracle  2024-05-13  540) 
81b418a65657571 Russell King (Oracle  2024-05-13 @541) static void socfpga_dwmac_pcs_exit(struct stmmac_priv *priv)
81b418a65657571 Russell King (Oracle  2024-05-13  542) {
81b418a65657571 Russell King (Oracle  2024-05-13  543) 	if (priv->hw->phylink_pcs)
81b418a65657571 Russell King (Oracle  2024-05-13  544) 		lynx_pcs_destroy(priv->hw->phylink_pcs);
81b418a65657571 Russell King (Oracle  2024-05-13  545) }
81b418a65657571 Russell King (Oracle  2024-05-13  546) 
98a6d9f192d3214 Russell King (Oracle  2024-06-13 @547) static struct phylink_pcs *socfpga_dwmac_select_pcs(struct stmmac_priv *priv,
98a6d9f192d3214 Russell King (Oracle  2024-06-13  548) 						    phy_interface_t interface)
98a6d9f192d3214 Russell King (Oracle  2024-06-13  549) {
98a6d9f192d3214 Russell King (Oracle  2024-06-13  550) 	return priv->hw->phylink_pcs;
98a6d9f192d3214 Russell King (Oracle  2024-06-13  551) }
98a6d9f192d3214 Russell King (Oracle  2024-06-13  552) 
85081acc6b1188f Russell King (Oracle  2025-11-19 @553) static int socfpga_dwmac_init(struct device *dev, void *bsp_priv)
0dbd4a6f57c29a6 Russell King (Oracle  2025-04-17  554) {
0dbd4a6f57c29a6 Russell King (Oracle  2025-04-17  555) 	struct socfpga_dwmac *dwmac = bsp_priv;
0dbd4a6f57c29a6 Russell King (Oracle  2025-04-17  556) 
0dbd4a6f57c29a6 Russell King (Oracle  2025-04-17  557) 	return dwmac->ops->set_phy_mode(dwmac);
0dbd4a6f57c29a6 Russell King (Oracle  2025-04-17  558) }
0dbd4a6f57c29a6 Russell King (Oracle  2025-04-17  559) 
93d46ea3e984323 Rohan G Thomas        2025-11-01 @560  static void socfpga_gen5_setup_plat_dat(struct socfpga_dwmac *dwmac)
93d46ea3e984323 Rohan G Thomas        2025-11-01  561  {
93d46ea3e984323 Rohan G Thomas        2025-11-01  562  	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
93d46ea3e984323 Rohan G Thomas        2025-11-01  563  
93d46ea3e984323 Rohan G Thomas        2025-11-01  564  	plat_dat->core_type = DWMAC_CORE_GMAC;
93d46ea3e984323 Rohan G Thomas        2025-11-01  565  
93d46ea3e984323 Rohan G Thomas        2025-11-01  566  	/* Rx watchdog timer in dwmac is buggy in this hw */
93d46ea3e984323 Rohan G Thomas        2025-11-01  567  	plat_dat->riwt_off = 1;
93d46ea3e984323 Rohan G Thomas        2025-11-01  568  }
93d46ea3e984323 Rohan G Thomas        2025-11-01  569  
93d46ea3e984323 Rohan G Thomas        2025-11-01 @570  static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
93d46ea3e984323 Rohan G Thomas        2025-11-01  571  {
93d46ea3e984323 Rohan G Thomas        2025-11-01  572  	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
93d46ea3e984323 Rohan G Thomas        2025-11-01  573  
93d46ea3e984323 Rohan G Thomas        2025-11-01  574  	plat_dat->core_type = DWMAC_CORE_XGMAC;
4c00476d44804db Rohan G Thomas        2025-11-01  575  
e28988aef70f8f9 Rohan G Thomas        2025-11-01  576  	/* Enable TSO */
e28988aef70f8f9 Rohan G Thomas        2025-11-01  577  	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
e28988aef70f8f9 Rohan G Thomas        2025-11-01  578  
4c00476d44804db Rohan G Thomas        2025-11-01  579  	/* Enable TBS */
4c00476d44804db Rohan G Thomas        2025-11-01  580  	switch (plat_dat->tx_queues_to_use) {
4c00476d44804db Rohan G Thomas        2025-11-01  581  	case 8:
4c00476d44804db Rohan G Thomas        2025-11-01  582  		plat_dat->tx_queues_cfg[7].tbs_en = true;
4c00476d44804db Rohan G Thomas        2025-11-01  583  		fallthrough;
4c00476d44804db Rohan G Thomas        2025-11-01  584  	case 7:
4c00476d44804db Rohan G Thomas        2025-11-01  585  		plat_dat->tx_queues_cfg[6].tbs_en = true;
4c00476d44804db Rohan G Thomas        2025-11-01  586  		break;
4c00476d44804db Rohan G Thomas        2025-11-01  587  	default:
4c00476d44804db Rohan G Thomas        2025-11-01  588  		/* Tx Queues 0 - 5 doesn't support TBS on Agilex5 */
4c00476d44804db Rohan G Thomas        2025-11-01  589  		break;
4c00476d44804db Rohan G Thomas        2025-11-01  590  	}
fd8c4f6454963aa Rohan G Thomas        2025-11-01  591  
fd8c4f6454963aa Rohan G Thomas        2025-11-01  592  	/* Hw supported cross-timestamp */
fd8c4f6454963aa Rohan G Thomas        2025-11-01  593  	plat_dat->int_snapshot_num = AUX_SNAPSHOT0;
fd8c4f6454963aa Rohan G Thomas        2025-11-01  594  	plat_dat->crosststamp = smtg_crosststamp;
93d46ea3e984323 Rohan G Thomas        2025-11-01  595  }
93d46ea3e984323 Rohan G Thomas        2025-11-01  596  
8880b6c849916a3 Joachim Eastwood      2015-07-29 @597  static int socfpga_dwmac_probe(struct platform_device *pdev)
82732789e8e7fb1 Joachim Eastwood      2015-07-29  598  {
8880b6c849916a3 Joachim Eastwood      2015-07-29  599  	struct plat_stmmacenet_data *plat_dat;
8880b6c849916a3 Joachim Eastwood      2015-07-29  600  	struct stmmac_resources stmmac_res;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  601  	struct device		*dev = &pdev->dev;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  602  	int			ret;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  603  	struct socfpga_dwmac	*dwmac;
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  604  	struct reset_control	*ocp_rst;
40ae25505fe8346 Dinh Nguyen           2019-06-05  605  	const struct socfpga_dwmac_ops *ops;
40ae25505fe8346 Dinh Nguyen           2019-06-05  606  
40ae25505fe8346 Dinh Nguyen           2019-06-05  607  	ops = device_get_match_data(&pdev->dev);
40ae25505fe8346 Dinh Nguyen           2019-06-05  608  	if (!ops) {
40ae25505fe8346 Dinh Nguyen           2019-06-05  609  		dev_err(&pdev->dev, "no of match data provided\n");
40ae25505fe8346 Dinh Nguyen           2019-06-05  610  		return -EINVAL;
40ae25505fe8346 Dinh Nguyen           2019-06-05  611  	}
82732789e8e7fb1 Joachim Eastwood      2015-07-29  612  
8880b6c849916a3 Joachim Eastwood      2015-07-29  613  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
8880b6c849916a3 Joachim Eastwood      2015-07-29  614  	if (ret)
8880b6c849916a3 Joachim Eastwood      2015-07-29  615  		return ret;
8880b6c849916a3 Joachim Eastwood      2015-07-29  616  
9086d3f2b5607f4 Jisheng Zhang         2023-09-16  617  	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
8880b6c849916a3 Joachim Eastwood      2015-07-29  618  	if (IS_ERR(plat_dat))
8880b6c849916a3 Joachim Eastwood      2015-07-29  619  		return PTR_ERR(plat_dat);
8880b6c849916a3 Joachim Eastwood      2015-07-29  620  
82732789e8e7fb1 Joachim Eastwood      2015-07-29  621  	dwmac = devm_kzalloc(dev, sizeof(*dwmac), GFP_KERNEL);
9086d3f2b5607f4 Jisheng Zhang         2023-09-16  622  	if (!dwmac)
9086d3f2b5607f4 Jisheng Zhang         2023-09-16  623  		return -ENOMEM;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  624  
bc8a2d9bcbf1ca5 Dinh Nguyen           2018-06-19 @625  	dwmac->stmmac_ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  626  	if (!plat_dat->stmmac_ahb_rst) {
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  627  		ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  628  		if (IS_ERR(ocp_rst))
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  629  			return dev_err_probe(dev, PTR_ERR(ocp_rst),
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  630  					     "failed to get ocp reset");
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  631  		if (ocp_rst)
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27 @632  			dev_warn(dev, "ocp reset is deprecated, please update your
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  633  				 device tree.\n");
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  634  		plat_dat->stmmac_ahb_rst = ocp_rst;
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  635  	}
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  636  
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  637  	reset_control_deassert(plat_dat->stmmac_ahb_rst = ocp_rst);
bc8a2d9bcbf1ca5 Dinh Nguyen           2018-06-19  638  
82732789e8e7fb1 Joachim Eastwood      2015-07-29  639  	ret = socfpga_dwmac_parse_data(dwmac, dev);
82732789e8e7fb1 Joachim Eastwood      2015-07-29  640  	if (ret) {
82732789e8e7fb1 Joachim Eastwood      2015-07-29  641  		dev_err(dev, "Unable to parse OF data\n");
9086d3f2b5607f4 Jisheng Zhang         2023-09-16  642  		return ret;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  643  	}
82732789e8e7fb1 Joachim Eastwood      2015-07-29  644  
9276bfc2df92c6c Russell King (Oracle  2025-04-17  645) 	/* The socfpga driver needs to control the stmmac reset to set the phy
9276bfc2df92c6c Russell King (Oracle  2025-04-17  646) 	 * mode. Create a copy of the core reset handle so it can be used by
9276bfc2df92c6c Russell King (Oracle  2025-04-17  647) 	 * the driver later.
9276bfc2df92c6c Russell King (Oracle  2025-04-17  648) 	 */
9276bfc2df92c6c Russell King (Oracle  2025-04-17  649) 	dwmac->stmmac_rst = plat_dat->stmmac_rst;
40ae25505fe8346 Dinh Nguyen           2019-06-05  650  	dwmac->ops = ops;
91255347bba9637 Russell King (Oracle  2025-04-17  651) 	dwmac->plat_dat = plat_dat;
9276bfc2df92c6c Russell King (Oracle  2025-04-17  652) 
8880b6c849916a3 Joachim Eastwood      2015-07-29  653  	plat_dat->bsp_priv = dwmac;
8880b6c849916a3 Joachim Eastwood      2015-07-29  654  	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
6bf70d999aa90bc Russell King (Oracle  2025-04-17  655) 	plat_dat->init = socfpga_dwmac_init;
81b418a65657571 Russell King (Oracle  2024-05-13  656) 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
81b418a65657571 Russell King (Oracle  2024-05-13  657) 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
98a6d9f192d3214 Russell King (Oracle  2024-06-13  658) 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  659  
93d46ea3e984323 Rohan G Thomas        2025-11-01  660  	ops->setup_plat_dat(dwmac);
407618d66dba55e Maxime Chevallier     2024-11-22  661  
1dbefd578d8bd3b Russell King (Oracle  2025-04-17  662) 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
8880b6c849916a3 Joachim Eastwood      2015-07-29  663  }
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  664  
40ae25505fe8346 Dinh Nguyen           2019-06-05  665  static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
40ae25505fe8346 Dinh Nguyen           2019-06-05  666  	.set_phy_mode = socfpga_gen5_set_phy_mode,
93d46ea3e984323 Rohan G Thomas        2025-11-01  667  	.setup_plat_dat = socfpga_gen5_setup_plat_dat,
40ae25505fe8346 Dinh Nguyen           2019-06-05  668  };
40ae25505fe8346 Dinh Nguyen           2019-06-05  669  
40ae25505fe8346 Dinh Nguyen           2019-06-05  670  static const struct socfpga_dwmac_ops socfpga_gen10_ops = {
40ae25505fe8346 Dinh Nguyen           2019-06-05  671  	.set_phy_mode = socfpga_gen10_set_phy_mode,
93d46ea3e984323 Rohan G Thomas        2025-11-01  672  	.setup_plat_dat = socfpga_gen5_setup_plat_dat,
93d46ea3e984323 Rohan G Thomas        2025-11-01  673  };
93d46ea3e984323 Rohan G Thomas        2025-11-01  674  
93d46ea3e984323 Rohan G Thomas        2025-11-01  675  static const struct socfpga_dwmac_ops socfpga_agilex5_ops = {
93d46ea3e984323 Rohan G Thomas        2025-11-01  676  	.set_phy_mode = socfpga_gen10_set_phy_mode,
93d46ea3e984323 Rohan G Thomas        2025-11-01  677  	.setup_plat_dat = socfpga_agilex5_setup_plat_dat,
40ae25505fe8346 Dinh Nguyen           2019-06-05  678  };
40ae25505fe8346 Dinh Nguyen           2019-06-05  679  
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  680  static const struct of_device_id socfpga_dwmac_match[] = {
40ae25505fe8346 Dinh Nguyen           2019-06-05  681  	{ .compatible = "altr,socfpga-stmmac", .data = &socfpga_gen5_ops },
40ae25505fe8346 Dinh Nguyen           2019-06-05  682  	{ .compatible = "altr,socfpga-stmmac-a10-s10", .data = &socfpga_gen10_ops },
93d46ea3e984323 Rohan G Thomas        2025-11-01  683  	{ .compatible = "altr,socfpga-stmmac-agilex5", .data = &socfpga_agilex5_ops },
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  684  	{ }
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  685  };
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  686  MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  687  
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  688  static struct platform_driver socfpga_dwmac_driver = {
8880b6c849916a3 Joachim Eastwood      2015-07-29  689  	.probe  = socfpga_dwmac_probe,
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  690  	.driver = {
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  691  		.name           = "socfpga-dwmac",
6bf70d999aa90bc Russell King (Oracle  2025-04-17  692) 		.pm		= &stmmac_pltfr_pm_ops,
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  693  		.of_match_table = socfpga_dwmac_match,
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  694  	},
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  695  };
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  696  module_platform_driver(socfpga_dwmac_driver);
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  697  
23f487f70c73e31 Breno Leitao          2024-01-25  698  MODULE_DESCRIPTION("Altera SOC DWMAC Specific Glue layer");
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14 @699  MODULE_LICENSE("GPL v2");

:::::: The code at line 625 was first introduced by commit
:::::: bc8a2d9bcbf1ca548b1deb315d14e1da81945bea net: stmmac: socfpga: add additional ocp reset line for Stratix10

:::::: TO: Dinh Nguyen <dinguyen@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
