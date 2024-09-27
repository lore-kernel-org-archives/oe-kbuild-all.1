Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF78182481
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727450195; cv=none; b=n24hZBaBjAPMHnawHb/up2IRVUeWLkhJ1G38kqFGJF5t48U+l7uCiWcRhMQ8XKAE4HlueJ8kIcJXYpQE+boBQEj1JV5uSHWzABLU6QvcuzDodCvKtweQE02r28BaJKvKq///Dlo/rjaftsQN/IkllHX7QBoNq4m3rZeHZ59Xh9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727450195; c=relaxed/simple;
	bh=3U8z1IH15p/Y42Cu9JflSRvgYOQv6q5CQmnWSG3UTys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oXBZ5ww7SYLH9mWurGLeYB7rendK+KiagJhBG4oJCFQJeYaid0NfuVOxO1H9eSqE7dYY5egh9hLqao5zjTYyyXaC9n4O3uOoRAe4MyEfVXAllyCdGNd5RVVRIIWRxJxUGzzuJ+4qUYRIF2PK57v8YrHjKhYOCOB3+rx+yRfik80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIuyfnJr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIuyfnJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727450192; x=1758986192;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3U8z1IH15p/Y42Cu9JflSRvgYOQv6q5CQmnWSG3UTys=;
  b=UIuyfnJrfHgy+gGUdFzE1HblLDdWHCA2JvVItWTFptw86++rWC6t7B7R
   TbXjx+zQpJNndFjYJPIQYMUypEfMmOrHa3kJE4nKwSm3qq5hPl1aVoNU0
   CYRJBYfqnG+144rU5+U+yHEg/JpuP3WBKXzcNeu2aKRmZj/7PTRfCzbRu
   1u9oNOPhOcQT0u8uvbQqLKPmHxthXrBM+cTUZ8yixZ2daTNk15oa/bivp
   FhTLofVPjxcenQ8RWoJyOBYLQIQZPYXRUnLkDpNtGoT6Bos96amS0Utsu
   SaH8iaxfIIfm+Y+83h77CjZcnz04XRiLE1hBGpkJV+Fb7VW+lDshyQAiG
   g==;
X-CSE-ConnectionGUID: pjMSwRIRRDGlETwSs3EGiQ==
X-CSE-MsgGUID: hIJ5bGadT8+guCmnTITGGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26468751"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26468751"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 08:16:30 -0700
X-CSE-ConnectionGUID: OVKz77OuRbi6M0AR3vI91A==
X-CSE-MsgGUID: JqWXDqQDTAqSg2J2Tz9z7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="77393838"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Sep 2024 08:16:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suChl-000MHt-1K;
	Fri, 27 Sep 2024 15:16:25 +0000
Date: Fri, 27 Sep 2024 23:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 636/1001]
 drivers/usb/host/xhci-plat.c:244:(.text.xhci_plat_probe+0x220): undefined
 reference to `dwc3_host_wakeup_capable'
Message-ID: <202409272351.plUaYfNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 2790ed87f0ae567824335f9e27bdf0da380bb305 [636/1001] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: riscv-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272351.plUaYfNo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272351.plUaYfNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272351.plUaYfNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/usb/host/xhci-plat.o: in function `xhci_plat_probe':
>> drivers/usb/host/xhci-plat.c:244:(.text.xhci_plat_probe+0x220): undefined reference to `dwc3_host_wakeup_capable'


vim +244 drivers/usb/host/xhci-plat.c

4efb2f69411456 Yoshihiro Shimoda         2015-11-24  153  
ec5499d338ece9 Arnd Bergmann             2023-01-31  154  int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const struct xhci_plat_priv *priv_match)
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  155  {
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  156  	const struct hc_driver	*driver;
ec5499d338ece9 Arnd Bergmann             2023-01-31  157  	struct device		*tmpdev;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  158  	struct xhci_hcd		*xhci;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  159  	struct resource         *res;
e0fe986972f5b6 Heiner Kallweit           2022-05-12  160  	struct usb_hcd		*hcd, *usb3_hcd;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  161  	int			ret;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  162  	int			irq;
f768e718911e03 Peter Chen                2020-09-18  163  	struct xhci_plat_priv	*priv = NULL;
f768e718911e03 Peter Chen                2020-09-18  164  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  165  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  166  	if (usb_disabled())
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  167  		return -ENODEV;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  168  
1885d9a33753b7 Andrew Bresticker         2014-10-03  169  	driver = &xhci_plat_hc_driver;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  170  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  171  	irq = platform_get_irq(pdev, 0);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  172  	if (irq < 0)
4b148d5144d64e Thomas Petazzoni          2017-05-17  173  		return irq;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  174  
c6b8e79306f515 Adam Wallis               2017-09-18  175  	if (!sysdev)
c6b8e79306f515 Adam Wallis               2017-09-18  176  		sysdev = &pdev->dev;
4c39d4b949d36f Arnd Bergmann             2017-03-13  177  
4c39d4b949d36f Arnd Bergmann             2017-03-13  178  	ret = dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  179  	if (ret)
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  180  		return ret;
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  181  
2790ed87f0ae56 Manish Narani             2023-12-12  182  	/* Set the controller as wakeup capable */
2790ed87f0ae56 Manish Narani             2023-12-12  183  	device_set_wakeup_capable(&pdev->dev, true);
2790ed87f0ae56 Manish Narani             2023-12-12  184  
b0c69b4bace370 Baolin Wang               2017-04-19  185  	pm_runtime_set_active(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  186  	pm_runtime_enable(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  187  	pm_runtime_get_noresume(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  188  
4c39d4b949d36f Arnd Bergmann             2017-03-13  189  	hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
4c39d4b949d36f Arnd Bergmann             2017-03-13  190  			       dev_name(&pdev->dev), NULL);
b0c69b4bace370 Baolin Wang               2017-04-19  191  	if (!hcd) {
b0c69b4bace370 Baolin Wang               2017-04-19  192  		ret = -ENOMEM;
b0c69b4bace370 Baolin Wang               2017-04-19  193  		goto disable_runtime;
b0c69b4bace370 Baolin Wang               2017-04-19  194  	}
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  195  
fb222273a2159a Dejin Zheng               2020-03-24  196  	hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
fd666348c51f6a Himangi Saraogi           2014-06-20  197  	if (IS_ERR(hcd->regs)) {
fd666348c51f6a Himangi Saraogi           2014-06-20  198  		ret = PTR_ERR(hcd->regs);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  199  		goto put_hcd;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  200  	}
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  201  
e7020f193a3d13 Varka Bhadram             2014-11-04  202  	hcd->rsrc_start = res->start;
e7020f193a3d13 Varka Bhadram             2014-11-04  203  	hcd->rsrc_len = resource_size(res);
e7020f193a3d13 Varka Bhadram             2014-11-04  204  
08048c04cc6f75 Chunfeng Yun              2019-04-17  205  	xhci = hcd_to_xhci(hcd);
08048c04cc6f75 Chunfeng Yun              2019-04-17  206  
4736ebd7fcaff1 Heiner Kallweit           2022-05-12  207  	xhci->allow_single_roothub = 1;
4736ebd7fcaff1 Heiner Kallweit           2022-05-12  208  
4718c177405112 Gregory CLEMENT           2014-05-15  209  	/*
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  210  	 * Not all platforms have clks so it is not an error if the
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  211  	 * clock do not exist.
4718c177405112 Gregory CLEMENT           2014-05-15  212  	 */
08048c04cc6f75 Chunfeng Yun              2019-04-17  213  	xhci->reg_clk = devm_clk_get_optional(&pdev->dev, "reg");
08048c04cc6f75 Chunfeng Yun              2019-04-17  214  	if (IS_ERR(xhci->reg_clk)) {
08048c04cc6f75 Chunfeng Yun              2019-04-17  215  		ret = PTR_ERR(xhci->reg_clk);
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  216  		goto put_hcd;
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  217  	}
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  218  
08048c04cc6f75 Chunfeng Yun              2019-04-17  219  	xhci->clk = devm_clk_get_optional(&pdev->dev, NULL);
08048c04cc6f75 Chunfeng Yun              2019-04-17  220  	if (IS_ERR(xhci->clk)) {
08048c04cc6f75 Chunfeng Yun              2019-04-17  221  		ret = PTR_ERR(xhci->clk);
8c6e8b09617915 Biju Das                  2023-01-21  222  		goto put_hcd;
4718c177405112 Gregory CLEMENT           2014-05-15  223  	}
4718c177405112 Gregory CLEMENT           2014-05-15  224  
224eb5311d6a8c Biju Das                  2023-01-21  225  	xhci->reset = devm_reset_control_array_get_optional_shared(&pdev->dev);
224eb5311d6a8c Biju Das                  2023-01-21  226  	if (IS_ERR(xhci->reset)) {
224eb5311d6a8c Biju Das                  2023-01-21  227  		ret = PTR_ERR(xhci->reset);
224eb5311d6a8c Biju Das                  2023-01-21  228  		goto put_hcd;
224eb5311d6a8c Biju Das                  2023-01-21  229  	}
224eb5311d6a8c Biju Das                  2023-01-21  230  
224eb5311d6a8c Biju Das                  2023-01-21  231  	ret = reset_control_deassert(xhci->reset);
8c6e8b09617915 Biju Das                  2023-01-21  232  	if (ret)
8c6e8b09617915 Biju Das                  2023-01-21  233  		goto put_hcd;
8c6e8b09617915 Biju Das                  2023-01-21  234  
224eb5311d6a8c Biju Das                  2023-01-21  235  	ret = clk_prepare_enable(xhci->reg_clk);
224eb5311d6a8c Biju Das                  2023-01-21  236  	if (ret)
224eb5311d6a8c Biju Das                  2023-01-21  237  		goto err_reset;
224eb5311d6a8c Biju Das                  2023-01-21  238  
08048c04cc6f75 Chunfeng Yun              2019-04-17  239  	ret = clk_prepare_enable(xhci->clk);
08048c04cc6f75 Chunfeng Yun              2019-04-17  240  	if (ret)
08048c04cc6f75 Chunfeng Yun              2019-04-17  241  		goto disable_reg_clk;
08048c04cc6f75 Chunfeng Yun              2019-04-17  242  
2847d242a1e48c Geert Uytterhoeven        2017-10-05  243  	if (priv_match) {
f768e718911e03 Peter Chen                2020-09-18 @244  		priv = hcd_to_xhci_priv(hcd);
4efb2f69411456 Yoshihiro Shimoda         2015-11-24  245  		/* Just copy data for now */
4efb2f69411456 Yoshihiro Shimoda         2015-11-24  246  		*priv = *priv_match;
4efb2f69411456 Yoshihiro Shimoda         2015-11-24  247  	}
4efb2f69411456 Yoshihiro Shimoda         2015-11-24  248  
4bb4fc0dbfa23a Peter Chen                2020-09-18  249  	device_set_wakeup_capable(&pdev->dev, true);
2790ed87f0ae56 Manish Narani             2023-12-12  250  	host_wakeup_register(dwc3_host_wakeup_capable);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  251  
9fa733f24bb54d Roger Quadros             2015-05-29  252  	xhci->main_hcd = hcd;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  253  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  254  	/* imod_interval is the interrupt moderation value in nanoseconds. */
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  255  	xhci->imod_interval = 40000;
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  256  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  257  	/* Iterate over all parent nodes for finding quirks */
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  258  	for (tmpdev = &pdev->dev; tmpdev; tmpdev = tmpdev->parent) {
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  259  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  260  		if (device_property_read_bool(tmpdev, "usb2-lpm-disable"))
4750bc78efdb12 Thang Q. Nguyen           2017-10-05  261  			xhci->quirks |= XHCI_HW_LPM_DISABLE;
4750bc78efdb12 Thang Q. Nguyen           2017-10-05  262  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  263  		if (device_property_read_bool(tmpdev, "usb3-lpm-capable"))
20f6fdd01c2c0d Pratyush Anand            2014-07-04  264  			xhci->quirks |= XHCI_LPM_SUPPORT;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  265  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  266  		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
21939f003ad093 Felipe Balbi              2017-01-23  267  			xhci->quirks |= XHCI_BROKEN_PORT_PED;
21939f003ad093 Felipe Balbi              2017-01-23  268  
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  269  		device_property_read_u32(tmpdev, "imod-interval-ns",
ab725cbec3e83d Adam Wallis               2017-12-08  270  					 &xhci->imod_interval);
222471f7640d97 Anurag Kumar Vulisha      2018-08-31  271  	}
ab725cbec3e83d Adam Wallis               2017-12-08  272  
4c39d4b949d36f Arnd Bergmann             2017-03-13  273  	hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev, "usb-phy", 0);
7b8ef22ea547b8 Maxime Ripard             2015-03-17  274  	if (IS_ERR(hcd->usb_phy)) {
7b8ef22ea547b8 Maxime Ripard             2015-03-17  275  		ret = PTR_ERR(hcd->usb_phy);
7b8ef22ea547b8 Maxime Ripard             2015-03-17  276  		if (ret == -EPROBE_DEFER)
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  277  			goto disable_clk;
7b8ef22ea547b8 Maxime Ripard             2015-03-17  278  		hcd->usb_phy = NULL;
7b8ef22ea547b8 Maxime Ripard             2015-03-17  279  	} else {
7b8ef22ea547b8 Maxime Ripard             2015-03-17  280  		ret = usb_phy_init(hcd->usb_phy);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  281  		if (ret)
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  282  			goto disable_clk;
7b8ef22ea547b8 Maxime Ripard             2015-03-17  283  	}
7b8ef22ea547b8 Maxime Ripard             2015-03-17  284  
c94d41e9dd1ba3 Peter Chen                2018-09-20  285  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  286  
8e10548f7f4814 Pali Rohár                2022-02-03  287  	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
f768e718911e03 Peter Chen                2020-09-18  288  		hcd->skip_phy_initialization = 1;
f768e718911e03 Peter Chen                2020-09-18  289  
bac1ec55143469 Tejas Joglekar            2020-12-08  290  	if (priv && (priv->quirks & XHCI_SG_TRB_CACHE_SIZE_QUIRK))
bac1ec55143469 Tejas Joglekar            2020-12-08  291  		xhci->quirks |= XHCI_SG_TRB_CACHE_SIZE_QUIRK;
bac1ec55143469 Tejas Joglekar            2020-12-08  292  
4ac53087d6d48e Roger Quadros             2015-05-29  293  	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
7b8ef22ea547b8 Maxime Ripard             2015-03-17  294  	if (ret)
7b8ef22ea547b8 Maxime Ripard             2015-03-17  295  		goto disable_usb_phy;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  296  
e0fe986972f5b6 Heiner Kallweit           2022-05-12  297  	if (!xhci_has_one_roothub(xhci)) {
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  298  		xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  299  						    dev_name(&pdev->dev), hcd);
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  300  		if (!xhci->shared_hcd) {
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  301  			ret = -ENOMEM;
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  302  			goto dealloc_usb2_hcd;
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  303  		}
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  304  
9134c1fd05034d Stanley Chang             2023-04-07  305  		xhci->shared_hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev,
9134c1fd05034d Stanley Chang             2023-04-07  306  			    "usb-phy", 1);
9134c1fd05034d Stanley Chang             2023-04-07  307  		if (IS_ERR(xhci->shared_hcd->usb_phy)) {
9134c1fd05034d Stanley Chang             2023-04-07  308  			xhci->shared_hcd->usb_phy = NULL;
9134c1fd05034d Stanley Chang             2023-04-07  309  		} else {
9134c1fd05034d Stanley Chang             2023-04-07  310  			ret = usb_phy_init(xhci->shared_hcd->usb_phy);
9134c1fd05034d Stanley Chang             2023-04-07  311  			if (ret)
9134c1fd05034d Stanley Chang             2023-04-07  312  				dev_err(sysdev, "%s init usb3phy fail (ret=%d)\n",
9134c1fd05034d Stanley Chang             2023-04-07  313  					    __func__, ret);
9134c1fd05034d Stanley Chang             2023-04-07  314  		}
9134c1fd05034d Stanley Chang             2023-04-07  315  
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  316  		xhci->shared_hcd->tpl_support = hcd->tpl_support;
e0fe986972f5b6 Heiner Kallweit           2022-05-12  317  	}
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  318  
e0fe986972f5b6 Heiner Kallweit           2022-05-12  319  	usb3_hcd = xhci_get_usb3_hcd(xhci);
e0fe986972f5b6 Heiner Kallweit           2022-05-12  320  	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
e0fe986972f5b6 Heiner Kallweit           2022-05-12  321  		usb3_hcd->can_do_streams = 1;
5de4e1ea9a731c William wu                2017-01-17  322  
e0fe986972f5b6 Heiner Kallweit           2022-05-12  323  	if (xhci->shared_hcd) {
4ac53087d6d48e Roger Quadros             2015-05-29  324  		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
4ac53087d6d48e Roger Quadros             2015-05-29  325  		if (ret)
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  326  			goto put_usb3_hcd;
e0fe986972f5b6 Heiner Kallweit           2022-05-12  327  	}
4ac53087d6d48e Roger Quadros             2015-05-29  328  
c70a1529b29cb1 Andrew Bresticker         2017-04-07  329  	device_enable_async_suspend(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  330  	pm_runtime_put_noidle(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  331  
b0c69b4bace370 Baolin Wang               2017-04-19  332  	/*
b0c69b4bace370 Baolin Wang               2017-04-19  333  	 * Prevent runtime pm from being on as default, users should enable
b0c69b4bace370 Baolin Wang               2017-04-19  334  	 * runtime pm using power/control in sysfs.
b0c69b4bace370 Baolin Wang               2017-04-19  335  	 */
b0c69b4bace370 Baolin Wang               2017-04-19  336  	pm_runtime_forbid(&pdev->dev);
c70a1529b29cb1 Andrew Bresticker         2017-04-07  337  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  338  	return 0;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  339  
4ac53087d6d48e Roger Quadros             2015-05-29  340  
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  341  put_usb3_hcd:
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  342  	usb_put_hcd(xhci->shared_hcd);
0cf1ea040a7e2c Heiner Kallweit           2022-05-12  343  
4ac53087d6d48e Roger Quadros             2015-05-29  344  dealloc_usb2_hcd:
4ac53087d6d48e Roger Quadros             2015-05-29  345  	usb_remove_hcd(hcd);
4ac53087d6d48e Roger Quadros             2015-05-29  346  
7b8ef22ea547b8 Maxime Ripard             2015-03-17  347  disable_usb_phy:
7b8ef22ea547b8 Maxime Ripard             2015-03-17  348  	usb_phy_shutdown(hcd->usb_phy);
7b8ef22ea547b8 Maxime Ripard             2015-03-17  349  
4718c177405112 Gregory CLEMENT           2014-05-15  350  disable_clk:
08048c04cc6f75 Chunfeng Yun              2019-04-17  351  	clk_disable_unprepare(xhci->clk);
4718c177405112 Gregory CLEMENT           2014-05-15  352  
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  353  disable_reg_clk:
08048c04cc6f75 Chunfeng Yun              2019-04-17  354  	clk_disable_unprepare(xhci->reg_clk);
3ae2da7b28b393 Gregory CLEMENT           2018-04-20  355  
224eb5311d6a8c Biju Das                  2023-01-21  356  err_reset:
224eb5311d6a8c Biju Das                  2023-01-21  357  	reset_control_assert(xhci->reset);
224eb5311d6a8c Biju Das                  2023-01-21  358  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  359  put_hcd:
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  360  	usb_put_hcd(hcd);
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  361  
b0c69b4bace370 Baolin Wang               2017-04-19  362  disable_runtime:
b0c69b4bace370 Baolin Wang               2017-04-19  363  	pm_runtime_put_noidle(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  364  	pm_runtime_disable(&pdev->dev);
b0c69b4bace370 Baolin Wang               2017-04-19  365  
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  366  	return ret;
3429e91a661e1f Sebastian Andrzej Siewior 2012-03-13  367  }
ec5499d338ece9 Arnd Bergmann             2023-01-31  368  EXPORT_SYMBOL_GPL(xhci_plat_probe);
ec5499d338ece9 Arnd Bergmann             2023-01-31  369  

:::::: The code at line 244 was first introduced by commit
:::::: f768e718911e03a4a20b65f984eaa9b09045e4cd usb: host: xhci-plat: add priv quirk for skip PHY initialization

:::::: TO: Peter Chen <peter.chen@nxp.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
