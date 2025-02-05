Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FEA215175
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 06:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738735741; cv=none; b=q24uxQO/dEf72DeBxdMlbM/VofWG6MhrWp09Gcs7P2rTXmXby/FRkDi6vIA62gO5KjgJ5QbdlusOAkWqttTVV3qqrbU6pJDOi1vSRpXwjI1XvHeSpOcdKjLa9JxD7lSJ4PLrzDJePMEHkiU5gGc4p4m/Yb0afjNhPlRItWndkLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738735741; c=relaxed/simple;
	bh=etlCn4Z5x/QtifJCCLaI6wYD5+F7shplZfKhcuV17Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9rQ3ZHEuISyD9kO2HeLMAuk3z7jg/0MuIZm6HRyUAhYTNN6CW4YJbZaVrQdwEAxJFWvBb4BDw/2D0Q1bgeYSxoVNrS4Uv9TgeUqGCH7TmlGjYIP2dkRxvzmnb6yFGlX2bnh2swM6E/phrIgow0WkUgPgp7QbyESqNhFB4Vc+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcHsBWML; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcHsBWML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738735739; x=1770271739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=etlCn4Z5x/QtifJCCLaI6wYD5+F7shplZfKhcuV17Y0=;
  b=RcHsBWMLm4+nYjcl0WbpMIvuZVsbbDUwWkN8QszSKoqq8OEUv6Ppso0H
   GlI0Qd14yQlS+CgIta05CuwWcj7L+QU/pnwq8o4Q1600U/Uz+B/gQcGy8
   C6he5j2SRRzX/6oJj8L8gnQKF3UMkIVK4IjTai4zn3DHzuSo2njV113pE
   WTXC00wszAO7DPrJW/vDkUmd0GppB/ral/UlLkEuuRRreQZoRMC19A6g+
   Q/pXONdgr+/uT4Vh7aP5NiYcl5aVf56M+q5coOSQdDpoFo/dWEyYQpkib
   1CtIzuasrBuVs8u3yaRlsIyuqqWdT1TNrN98yjxSLET/EDtPPVrLLtwa0
   A==;
X-CSE-ConnectionGUID: NScyjrulRXSGrLQX1a8R7w==
X-CSE-MsgGUID: E5IUbBGpTj2hGGV6KU/KDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43038817"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="43038817"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 22:08:56 -0800
X-CSE-ConnectionGUID: PfNwvgM7R0WaMWWNQE1yNg==
X-CSE-MsgGUID: giV3/ryFRvGErQdnV8ThGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111251733"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Feb 2025 22:08:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfYai-000tW3-1a;
	Wed, 05 Feb 2025 06:08:52 +0000
Date: Wed, 5 Feb 2025 14:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:faux_bus 3/6] drivers/usb/musb/sunxi.c:764:23: error:
 assignment to 'struct platform_device *' from incompatible pointer type
 'struct faux_device *'
Message-ID: <202502051411.UbAAgX8D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git faux_bus
head:   f18e2d21ac0290209c516f14151bbb8df602b73f
commit: b9313848b0afacf2f24760d74b901f5895b13ea0 [3/6] USB: phy: convert usb_phy_generic logic to use a faux device
config: riscv-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051411.UbAAgX8D-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051411.UbAAgX8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051411.UbAAgX8D-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/musb/sunxi.c: In function 'sunxi_musb_probe':
>> drivers/usb/musb/sunxi.c:764:23: error: assignment to 'struct platform_device *' from incompatible pointer type 'struct faux_device *' [-Wincompatible-pointer-types]
     764 |         glue->usb_phy = usb_phy_generic_register();
         |                       ^
>> drivers/usb/musb/sunxi.c:801:40: error: passing argument 1 of 'usb_phy_generic_unregister' from incompatible pointer type [-Wincompatible-pointer-types]
     801 |         usb_phy_generic_unregister(glue->usb_phy);
         |                                    ~~~~^~~~~~~~~
         |                                        |
         |                                        struct platform_device *
   In file included from drivers/usb/musb/sunxi.c:24:
   include/linux/usb/usb_phy_generic.h:11:33: note: expected 'struct faux_device *' but argument is of type 'struct platform_device *'
      11 | void usb_phy_generic_unregister(struct faux_device *);
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/sunxi.c: In function 'sunxi_musb_remove':
   drivers/usb/musb/sunxi.c:811:36: error: passing argument 1 of 'usb_phy_generic_unregister' from incompatible pointer type [-Wincompatible-pointer-types]
     811 |         usb_phy_generic_unregister(usb_phy);
         |                                    ^~~~~~~
         |                                    |
         |                                    struct platform_device *
   include/linux/usb/usb_phy_generic.h:11:33: note: expected 'struct faux_device *' but argument is of type 'struct platform_device *'
      11 | void usb_phy_generic_unregister(struct faux_device *);
         |                                 ^~~~~~~~~~~~~~~~~~~~


vim +764 drivers/usb/musb/sunxi.c

c1fce66ecd271de Icenowy Zheng   2017-02-01  676  
744543c599c420b Hans de Goede   2015-07-08  677  static int sunxi_musb_probe(struct platform_device *pdev)
744543c599c420b Hans de Goede   2015-07-08  678  {
744543c599c420b Hans de Goede   2015-07-08  679  	struct musb_hdrc_platform_data	pdata;
744543c599c420b Hans de Goede   2015-07-08  680  	struct platform_device_info	pinfo;
744543c599c420b Hans de Goede   2015-07-08  681  	struct sunxi_glue		*glue;
744543c599c420b Hans de Goede   2015-07-08  682  	struct device_node		*np = pdev->dev.of_node;
196774960ba176f Andre Przywara  2023-02-01  683  	const struct sunxi_musb_cfg	*cfg;
744543c599c420b Hans de Goede   2015-07-08  684  	int ret;
744543c599c420b Hans de Goede   2015-07-08  685  
744543c599c420b Hans de Goede   2015-07-08  686  	if (!np) {
744543c599c420b Hans de Goede   2015-07-08  687  		dev_err(&pdev->dev, "Error no device tree node found\n");
744543c599c420b Hans de Goede   2015-07-08  688  		return -EINVAL;
744543c599c420b Hans de Goede   2015-07-08  689  	}
744543c599c420b Hans de Goede   2015-07-08  690  
7cba17ec9adc8cf Hans de Goede   2016-09-12  691  	glue = devm_kzalloc(&pdev->dev, sizeof(*glue), GFP_KERNEL);
7cba17ec9adc8cf Hans de Goede   2016-09-12  692  	if (!glue)
7cba17ec9adc8cf Hans de Goede   2016-09-12  693  		return -ENOMEM;
7cba17ec9adc8cf Hans de Goede   2016-09-12  694  
744543c599c420b Hans de Goede   2015-07-08  695  	memset(&pdata, 0, sizeof(pdata));
06e7114f0d82972 Heikki Krogerus 2015-09-21  696  	switch (usb_get_dr_mode(&pdev->dev)) {
744543c599c420b Hans de Goede   2015-07-08  697  #if defined CONFIG_USB_MUSB_DUAL_ROLE || defined CONFIG_USB_MUSB_HOST
744543c599c420b Hans de Goede   2015-07-08  698  	case USB_DR_MODE_HOST:
7ad76955c67b705 Bin Liu         2018-05-21  699  		pdata.mode = MUSB_HOST;
7cba17ec9adc8cf Hans de Goede   2016-09-12  700  		glue->phy_mode = PHY_MODE_USB_HOST;
744543c599c420b Hans de Goede   2015-07-08  701  		break;
744543c599c420b Hans de Goede   2015-07-08  702  #endif
a1ca2c6b2924a60 Hans de Goede   2016-06-30  703  #if defined CONFIG_USB_MUSB_DUAL_ROLE || defined CONFIG_USB_MUSB_GADGET
a1ca2c6b2924a60 Hans de Goede   2016-06-30  704  	case USB_DR_MODE_PERIPHERAL:
7ad76955c67b705 Bin Liu         2018-05-21  705  		pdata.mode = MUSB_PERIPHERAL;
7cba17ec9adc8cf Hans de Goede   2016-09-12  706  		glue->phy_mode = PHY_MODE_USB_DEVICE;
a1ca2c6b2924a60 Hans de Goede   2016-06-30  707  		break;
a1ca2c6b2924a60 Hans de Goede   2016-06-30  708  #endif
744543c599c420b Hans de Goede   2015-07-08  709  #ifdef CONFIG_USB_MUSB_DUAL_ROLE
744543c599c420b Hans de Goede   2015-07-08  710  	case USB_DR_MODE_OTG:
7ad76955c67b705 Bin Liu         2018-05-21  711  		pdata.mode = MUSB_OTG;
7cba17ec9adc8cf Hans de Goede   2016-09-12  712  		glue->phy_mode = PHY_MODE_USB_OTG;
744543c599c420b Hans de Goede   2015-07-08  713  		break;
744543c599c420b Hans de Goede   2015-07-08  714  #endif
744543c599c420b Hans de Goede   2015-07-08  715  	default:
744543c599c420b Hans de Goede   2015-07-08  716  		dev_err(&pdev->dev, "Invalid or missing 'dr_mode' property\n");
744543c599c420b Hans de Goede   2015-07-08  717  		return -EINVAL;
744543c599c420b Hans de Goede   2015-07-08  718  	}
744543c599c420b Hans de Goede   2015-07-08  719  	pdata.platform_ops	= &sunxi_musb_ops;
196774960ba176f Andre Przywara  2023-02-01  720  
196774960ba176f Andre Przywara  2023-02-01  721  	cfg = of_device_get_match_data(&pdev->dev);
196774960ba176f Andre Przywara  2023-02-01  722  	if (!cfg)
196774960ba176f Andre Przywara  2023-02-01  723  		return -EINVAL;
196774960ba176f Andre Przywara  2023-02-01  724  
196774960ba176f Andre Przywara  2023-02-01  725  	pdata.config = cfg->hdrc_config;
744543c599c420b Hans de Goede   2015-07-08  726  
744543c599c420b Hans de Goede   2015-07-08  727  	glue->dev = &pdev->dev;
744543c599c420b Hans de Goede   2015-07-08  728  	INIT_WORK(&glue->work, sunxi_musb_work);
744543c599c420b Hans de Goede   2015-07-08  729  	glue->host_nb.notifier_call = sunxi_musb_host_notifier;
744543c599c420b Hans de Goede   2015-07-08  730  
196774960ba176f Andre Przywara  2023-02-01  731  	if (cfg->has_sram)
132e23775779cc8 Hans de Goede   2015-07-08  732  		set_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags);
132e23775779cc8 Hans de Goede   2015-07-08  733  
196774960ba176f Andre Przywara  2023-02-01  734  	if (cfg->has_reset)
132e23775779cc8 Hans de Goede   2015-07-08  735  		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
132e23775779cc8 Hans de Goede   2015-07-08  736  
196774960ba176f Andre Przywara  2023-02-01  737  	if (cfg->no_configdata)
d91de093d94eca6 Hans de Goede   2015-07-08  738  		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
d91de093d94eca6 Hans de Goede   2015-07-08  739  
744543c599c420b Hans de Goede   2015-07-08  740  	glue->clk = devm_clk_get(&pdev->dev, NULL);
744543c599c420b Hans de Goede   2015-07-08  741  	if (IS_ERR(glue->clk)) {
744543c599c420b Hans de Goede   2015-07-08  742  		dev_err(&pdev->dev, "Error getting clock: %ld\n",
744543c599c420b Hans de Goede   2015-07-08  743  			PTR_ERR(glue->clk));
744543c599c420b Hans de Goede   2015-07-08  744  		return PTR_ERR(glue->clk);
744543c599c420b Hans de Goede   2015-07-08  745  	}
744543c599c420b Hans de Goede   2015-07-08  746  
132e23775779cc8 Hans de Goede   2015-07-08  747  	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
132e23775779cc8 Hans de Goede   2015-07-08  748  		glue->rst = devm_reset_control_get(&pdev->dev, NULL);
7a8275099361e24 Yang Yingliang  2022-09-27  749  		if (IS_ERR(glue->rst))
7a8275099361e24 Yang Yingliang  2022-09-27  750  			return dev_err_probe(&pdev->dev, PTR_ERR(glue->rst),
7a8275099361e24 Yang Yingliang  2022-09-27  751  					     "Error getting reset\n");
132e23775779cc8 Hans de Goede   2015-07-08  752  	}
132e23775779cc8 Hans de Goede   2015-07-08  753  
a1ca2c6b2924a60 Hans de Goede   2016-06-30  754  	glue->extcon = extcon_get_edev_by_phandle(&pdev->dev, 0);
7a8275099361e24 Yang Yingliang  2022-09-27  755  	if (IS_ERR(glue->extcon))
7a8275099361e24 Yang Yingliang  2022-09-27  756  		return dev_err_probe(&pdev->dev, PTR_ERR(glue->extcon),
7a8275099361e24 Yang Yingliang  2022-09-27  757  				     "Invalid or missing extcon\n");
a1ca2c6b2924a60 Hans de Goede   2016-06-30  758  
744543c599c420b Hans de Goede   2015-07-08  759  	glue->phy = devm_phy_get(&pdev->dev, "usb");
7a8275099361e24 Yang Yingliang  2022-09-27  760  	if (IS_ERR(glue->phy))
7a8275099361e24 Yang Yingliang  2022-09-27  761  		return dev_err_probe(&pdev->dev, PTR_ERR(glue->phy),
7a8275099361e24 Yang Yingliang  2022-09-27  762  				     "Error getting phy\n");
744543c599c420b Hans de Goede   2015-07-08  763  
744543c599c420b Hans de Goede   2015-07-08 @764  	glue->usb_phy = usb_phy_generic_register();
744543c599c420b Hans de Goede   2015-07-08  765  	if (IS_ERR(glue->usb_phy)) {
744543c599c420b Hans de Goede   2015-07-08  766  		dev_err(&pdev->dev, "Error registering usb-phy %ld\n",
744543c599c420b Hans de Goede   2015-07-08  767  			PTR_ERR(glue->usb_phy));
744543c599c420b Hans de Goede   2015-07-08  768  		return PTR_ERR(glue->usb_phy);
744543c599c420b Hans de Goede   2015-07-08  769  	}
744543c599c420b Hans de Goede   2015-07-08  770  
744543c599c420b Hans de Goede   2015-07-08  771  	glue->xceiv = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
744543c599c420b Hans de Goede   2015-07-08  772  	if (IS_ERR(glue->xceiv)) {
744543c599c420b Hans de Goede   2015-07-08  773  		ret = PTR_ERR(glue->xceiv);
744543c599c420b Hans de Goede   2015-07-08  774  		dev_err(&pdev->dev, "Error getting usb-phy %d\n", ret);
744543c599c420b Hans de Goede   2015-07-08  775  		goto err_unregister_usb_phy;
744543c599c420b Hans de Goede   2015-07-08  776  	}
744543c599c420b Hans de Goede   2015-07-08  777  
744543c599c420b Hans de Goede   2015-07-08  778  	platform_set_drvdata(pdev, glue);
744543c599c420b Hans de Goede   2015-07-08  779  
744543c599c420b Hans de Goede   2015-07-08  780  	memset(&pinfo, 0, sizeof(pinfo));
744543c599c420b Hans de Goede   2015-07-08  781  	pinfo.name	 = "musb-hdrc";
744543c599c420b Hans de Goede   2015-07-08  782  	pinfo.id	= PLATFORM_DEVID_AUTO;
744543c599c420b Hans de Goede   2015-07-08  783  	pinfo.parent	= &pdev->dev;
908f6fc3a140509 Mans Rullgard   2020-01-15  784  	pinfo.fwnode	= of_fwnode_handle(pdev->dev.of_node);
908f6fc3a140509 Mans Rullgard   2020-01-15  785  	pinfo.of_node_reused = true;
744543c599c420b Hans de Goede   2015-07-08  786  	pinfo.res	= pdev->resource;
744543c599c420b Hans de Goede   2015-07-08  787  	pinfo.num_res	= pdev->num_resources;
744543c599c420b Hans de Goede   2015-07-08  788  	pinfo.data	= &pdata;
744543c599c420b Hans de Goede   2015-07-08  789  	pinfo.size_data = sizeof(pdata);
744543c599c420b Hans de Goede   2015-07-08  790  
969a132723434f3 Hans de Goede   2016-06-14  791  	glue->musb_pdev = platform_device_register_full(&pinfo);
969a132723434f3 Hans de Goede   2016-06-14  792  	if (IS_ERR(glue->musb_pdev)) {
969a132723434f3 Hans de Goede   2016-06-14  793  		ret = PTR_ERR(glue->musb_pdev);
744543c599c420b Hans de Goede   2015-07-08  794  		dev_err(&pdev->dev, "Error registering musb dev: %d\n", ret);
744543c599c420b Hans de Goede   2015-07-08  795  		goto err_unregister_usb_phy;
744543c599c420b Hans de Goede   2015-07-08  796  	}
744543c599c420b Hans de Goede   2015-07-08  797  
744543c599c420b Hans de Goede   2015-07-08  798  	return 0;
744543c599c420b Hans de Goede   2015-07-08  799  
744543c599c420b Hans de Goede   2015-07-08  800  err_unregister_usb_phy:
744543c599c420b Hans de Goede   2015-07-08 @801  	usb_phy_generic_unregister(glue->usb_phy);
744543c599c420b Hans de Goede   2015-07-08  802  	return ret;
744543c599c420b Hans de Goede   2015-07-08  803  }
744543c599c420b Hans de Goede   2015-07-08  804  

:::::: The code at line 764 was first introduced by commit
:::::: 744543c599c420bcddca08cd2e2713b82a008328 usb: musb: sunxi: Add support for the Allwinner sunxi musb controller

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Felipe Balbi <balbi@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
