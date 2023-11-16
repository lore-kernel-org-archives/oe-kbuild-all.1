Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F223158D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKp4hJ32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700143782; x=1731679782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jXPYao4+IoJGC+AdE8Lm1nlMDSDa7+s8H34/SC2pvEg=;
  b=YKp4hJ329SNU7fVqNsWn229Ig++h3d5DPLWxuVoqMVP/Bwr/xnU+Hwo3
   ECYuD61ETmJv8Hiq0LFS8Wzt1m4g/e7ixALNcCM70BmQQA+s8ePJvajq7
   X93wqZqGYAFvAFlLe3OyX+JkGg1HDXJHcq0cu+exsQWsCjPoIFg/xJJ3/
   +3oPh8DaWrbVLjUyJY8raRVGTcomSLOUwU4Z/Tg1CXWRgBwrrqnuGs9wL
   ENIgT4408GmpJ8CRZkzk4GmjUIh45mL99GUUuNe2/2kvNXbNWDMB7Url+
   N9Q708MBOpP+l59ybm48CKvL778SDc+vWEUmabng7Baz5ijFLcjGaIVLb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4174793"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="4174793"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 06:09:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="835754604"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="835754604"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Nov 2023 06:09:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3d3b-0001jt-0D;
	Thu, 16 Nov 2023 14:09:23 +0000
Date: Thu, 16 Nov 2023 22:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 1300/15770]
 drivers/video/fbdev/mxc/mipi_dsi.c:822: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311162200.r6aQYACl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: d368bdd73e55410f089fc065109f13953f409d88 [1300/15770] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231116/202311162200.r6aQYACl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311162200.r6aQYACl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311162200.r6aQYACl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/mxc/mipi_dsi.c:822: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is called by the driver framework to initialize the MIPI DSI


vim +822 drivers/video/fbdev/mxc/mipi_dsi.c

5670f5b5c73057 Fancy Fang 2019-08-21  820  
5670f5b5c73057 Fancy Fang 2019-08-21  821  /**
5670f5b5c73057 Fancy Fang 2019-08-21 @822   * This function is called by the driver framework to initialize the MIPI DSI
5670f5b5c73057 Fancy Fang 2019-08-21  823   * device.
5670f5b5c73057 Fancy Fang 2019-08-21  824   *
5670f5b5c73057 Fancy Fang 2019-08-21  825   * @param	pdev	The device structure for the MIPI DSI passed in by the
5670f5b5c73057 Fancy Fang 2019-08-21  826   *			driver framework.
5670f5b5c73057 Fancy Fang 2019-08-21  827   *
5670f5b5c73057 Fancy Fang 2019-08-21  828   * @return      Returns 0 on success or negative error code on error
5670f5b5c73057 Fancy Fang 2019-08-21  829   */
5670f5b5c73057 Fancy Fang 2019-08-21  830  static int mipi_dsi_probe(struct platform_device *pdev)
5670f5b5c73057 Fancy Fang 2019-08-21  831  {
5670f5b5c73057 Fancy Fang 2019-08-21  832  	struct device_node *np = pdev->dev.of_node;
5670f5b5c73057 Fancy Fang 2019-08-21  833  	const struct of_device_id *of_id =
5670f5b5c73057 Fancy Fang 2019-08-21  834  			of_match_device(of_match_ptr(imx_mipi_dsi_dt_ids),
5670f5b5c73057 Fancy Fang 2019-08-21  835  					&pdev->dev);
5670f5b5c73057 Fancy Fang 2019-08-21  836  	struct mipi_dsi_info *mipi_dsi;
5670f5b5c73057 Fancy Fang 2019-08-21  837  	struct resource *res;
5670f5b5c73057 Fancy Fang 2019-08-21  838  	u32 dev_id, disp_id;
5670f5b5c73057 Fancy Fang 2019-08-21  839  	const char *lcd_panel;
5670f5b5c73057 Fancy Fang 2019-08-21  840  	int mux;
5670f5b5c73057 Fancy Fang 2019-08-21  841  	int ret = 0;
5670f5b5c73057 Fancy Fang 2019-08-21  842  
5670f5b5c73057 Fancy Fang 2019-08-21  843  	if (!np) {
5670f5b5c73057 Fancy Fang 2019-08-21  844  		dev_err(&pdev->dev, "failed to find device tree node\n");
5670f5b5c73057 Fancy Fang 2019-08-21  845  		return -ENODEV;
5670f5b5c73057 Fancy Fang 2019-08-21  846  	}
5670f5b5c73057 Fancy Fang 2019-08-21  847  
5670f5b5c73057 Fancy Fang 2019-08-21  848  	mipi_dsi = devm_kzalloc(&pdev->dev, sizeof(*mipi_dsi), GFP_KERNEL);
5670f5b5c73057 Fancy Fang 2019-08-21  849  	if (!mipi_dsi)
5670f5b5c73057 Fancy Fang 2019-08-21  850  		return -ENOMEM;
5670f5b5c73057 Fancy Fang 2019-08-21  851  
5670f5b5c73057 Fancy Fang 2019-08-21  852  	ret = of_property_read_string(np, "lcd_panel", &lcd_panel);
5670f5b5c73057 Fancy Fang 2019-08-21  853  	if (ret) {
5670f5b5c73057 Fancy Fang 2019-08-21  854  		dev_err(&pdev->dev, "failed to read of property lcd_panel\n");
5670f5b5c73057 Fancy Fang 2019-08-21  855  		return ret;
5670f5b5c73057 Fancy Fang 2019-08-21  856  	}
5670f5b5c73057 Fancy Fang 2019-08-21  857  
5670f5b5c73057 Fancy Fang 2019-08-21  858  	ret = of_property_read_u32(np, "dev_id", &dev_id);
5670f5b5c73057 Fancy Fang 2019-08-21  859  	if (ret) {
5670f5b5c73057 Fancy Fang 2019-08-21  860  		dev_err(&pdev->dev, "failed to read of property dev_id\n");
5670f5b5c73057 Fancy Fang 2019-08-21  861  		return ret;
5670f5b5c73057 Fancy Fang 2019-08-21  862  	}
5670f5b5c73057 Fancy Fang 2019-08-21  863  	ret = of_property_read_u32(np, "disp_id", &disp_id);
5670f5b5c73057 Fancy Fang 2019-08-21  864  	if (ret) {
5670f5b5c73057 Fancy Fang 2019-08-21  865  		dev_err(&pdev->dev, "failed to read of property disp_id\n");
5670f5b5c73057 Fancy Fang 2019-08-21  866  		return ret;
5670f5b5c73057 Fancy Fang 2019-08-21  867  	}
5670f5b5c73057 Fancy Fang 2019-08-21  868  	mipi_dsi->dev_id = dev_id;
5670f5b5c73057 Fancy Fang 2019-08-21  869  	mipi_dsi->disp_id = disp_id;
5670f5b5c73057 Fancy Fang 2019-08-21  870  
5670f5b5c73057 Fancy Fang 2019-08-21  871  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
5670f5b5c73057 Fancy Fang 2019-08-21  872  	if (!res) {
5670f5b5c73057 Fancy Fang 2019-08-21  873  		dev_err(&pdev->dev, "failed to get platform resource 0\n");
5670f5b5c73057 Fancy Fang 2019-08-21  874  		return -ENODEV;
5670f5b5c73057 Fancy Fang 2019-08-21  875  	}
5670f5b5c73057 Fancy Fang 2019-08-21  876  
5670f5b5c73057 Fancy Fang 2019-08-21  877  	if (!devm_request_mem_region(&pdev->dev, res->start,
5670f5b5c73057 Fancy Fang 2019-08-21  878  				resource_size(res), pdev->name))
5670f5b5c73057 Fancy Fang 2019-08-21  879  		return -EBUSY;
5670f5b5c73057 Fancy Fang 2019-08-21  880  
5670f5b5c73057 Fancy Fang 2019-08-21  881  	mipi_dsi->mmio_base = devm_ioremap(&pdev->dev, res->start,
5670f5b5c73057 Fancy Fang 2019-08-21  882  				   resource_size(res));
5670f5b5c73057 Fancy Fang 2019-08-21  883  	if (!mipi_dsi->mmio_base)
5670f5b5c73057 Fancy Fang 2019-08-21  884  		return -EBUSY;
5670f5b5c73057 Fancy Fang 2019-08-21  885  
5670f5b5c73057 Fancy Fang 2019-08-21  886  	mipi_dsi->irq = platform_get_irq(pdev, 0);
5670f5b5c73057 Fancy Fang 2019-08-21  887  	if (mipi_dsi->irq < 0) {
5670f5b5c73057 Fancy Fang 2019-08-21  888  		dev_err(&pdev->dev, "failed get device irq\n");
5670f5b5c73057 Fancy Fang 2019-08-21  889  		return -ENODEV;
5670f5b5c73057 Fancy Fang 2019-08-21  890  	}
5670f5b5c73057 Fancy Fang 2019-08-21  891  
5670f5b5c73057 Fancy Fang 2019-08-21  892  	ret = devm_request_irq(&pdev->dev, mipi_dsi->irq,
5670f5b5c73057 Fancy Fang 2019-08-21  893  				mipi_dsi_irq_handler,
5670f5b5c73057 Fancy Fang 2019-08-21  894  				0, "mipi_dsi", mipi_dsi);
5670f5b5c73057 Fancy Fang 2019-08-21  895  	if (ret) {
5670f5b5c73057 Fancy Fang 2019-08-21  896  		dev_err(&pdev->dev, "failed to request irq\n");
5670f5b5c73057 Fancy Fang 2019-08-21  897  		return ret;
5670f5b5c73057 Fancy Fang 2019-08-21  898  	}
5670f5b5c73057 Fancy Fang 2019-08-21  899  
5670f5b5c73057 Fancy Fang 2019-08-21  900  	mipi_dsi->dphy_clk = devm_clk_get(&pdev->dev, "mipi_pllref_clk");
5670f5b5c73057 Fancy Fang 2019-08-21  901  	if (IS_ERR(mipi_dsi->dphy_clk)) {
5670f5b5c73057 Fancy Fang 2019-08-21  902  		dev_err(&pdev->dev, "failed to get dphy pll_ref_clk\n");
5670f5b5c73057 Fancy Fang 2019-08-21  903  		return PTR_ERR(mipi_dsi->dphy_clk);
5670f5b5c73057 Fancy Fang 2019-08-21  904  	}
5670f5b5c73057 Fancy Fang 2019-08-21  905  
5670f5b5c73057 Fancy Fang 2019-08-21  906  	mipi_dsi->cfg_clk = devm_clk_get(&pdev->dev, "mipi_cfg_clk");
5670f5b5c73057 Fancy Fang 2019-08-21  907  	if (IS_ERR(mipi_dsi->cfg_clk)) {
5670f5b5c73057 Fancy Fang 2019-08-21  908  		dev_err(&pdev->dev, "failed to get cfg_clk\n");
5670f5b5c73057 Fancy Fang 2019-08-21  909  		return PTR_ERR(mipi_dsi->cfg_clk);
5670f5b5c73057 Fancy Fang 2019-08-21  910  	}
5670f5b5c73057 Fancy Fang 2019-08-21  911  
5670f5b5c73057 Fancy Fang 2019-08-21  912  	mipi_dsi->disp_power_on = devm_regulator_get(&pdev->dev,
5670f5b5c73057 Fancy Fang 2019-08-21  913  							"disp-power-on");
5670f5b5c73057 Fancy Fang 2019-08-21  914  	if (!IS_ERR(mipi_dsi->disp_power_on)) {
5670f5b5c73057 Fancy Fang 2019-08-21  915  		ret = regulator_enable(mipi_dsi->disp_power_on);
5670f5b5c73057 Fancy Fang 2019-08-21  916  		if (ret) {
5670f5b5c73057 Fancy Fang 2019-08-21  917  			dev_err(&pdev->dev, "failed to enable display "
5670f5b5c73057 Fancy Fang 2019-08-21  918  				"power regulator, err=%d\n", ret);
5670f5b5c73057 Fancy Fang 2019-08-21  919  			return ret;
5670f5b5c73057 Fancy Fang 2019-08-21  920  		}
5670f5b5c73057 Fancy Fang 2019-08-21  921  	} else {
5670f5b5c73057 Fancy Fang 2019-08-21  922  		mipi_dsi->disp_power_on = NULL;
5670f5b5c73057 Fancy Fang 2019-08-21  923  	}
5670f5b5c73057 Fancy Fang 2019-08-21  924  
5670f5b5c73057 Fancy Fang 2019-08-21  925  	ret = device_reset(&pdev->dev);
5670f5b5c73057 Fancy Fang 2019-08-21  926  	if (ret) {
5670f5b5c73057 Fancy Fang 2019-08-21  927  		if (ret != -EPROBE_DEFER)
5670f5b5c73057 Fancy Fang 2019-08-21  928  			dev_err(&pdev->dev, "failed to reset: %d\n", ret);
5670f5b5c73057 Fancy Fang 2019-08-21  929  		goto dev_reset_fail;
5670f5b5c73057 Fancy Fang 2019-08-21  930  	}
5670f5b5c73057 Fancy Fang 2019-08-21  931  
5670f5b5c73057 Fancy Fang 2019-08-21  932  	if (of_id)
5670f5b5c73057 Fancy Fang 2019-08-21  933  		mipi_dsi->bus_mux = of_id->data;
5670f5b5c73057 Fancy Fang 2019-08-21  934  
5670f5b5c73057 Fancy Fang 2019-08-21  935  	mipi_dsi->regmap = syscon_regmap_lookup_by_phandle(np, "gpr");
5670f5b5c73057 Fancy Fang 2019-08-21  936  	if (IS_ERR(mipi_dsi->regmap)) {
5670f5b5c73057 Fancy Fang 2019-08-21  937  		dev_err(&pdev->dev, "failed to get parent regmap\n");
5670f5b5c73057 Fancy Fang 2019-08-21  938  		ret = PTR_ERR(mipi_dsi->regmap);
5670f5b5c73057 Fancy Fang 2019-08-21  939  		goto get_parent_regmap_fail;
5670f5b5c73057 Fancy Fang 2019-08-21  940  	}
5670f5b5c73057 Fancy Fang 2019-08-21  941  
5670f5b5c73057 Fancy Fang 2019-08-21  942  	mux = mipi_dsi->bus_mux->get_mux(dev_id, disp_id);
5670f5b5c73057 Fancy Fang 2019-08-21  943  	if (mux >= 0)
5670f5b5c73057 Fancy Fang 2019-08-21  944  		regmap_update_bits(mipi_dsi->regmap, mipi_dsi->bus_mux->reg,
5670f5b5c73057 Fancy Fang 2019-08-21  945  				   mipi_dsi->bus_mux->mask, (unsigned int)mux);
5670f5b5c73057 Fancy Fang 2019-08-21  946  	else
5670f5b5c73057 Fancy Fang 2019-08-21  947  		dev_warn(&pdev->dev, "invalid dev_id or disp_id muxing\n");
5670f5b5c73057 Fancy Fang 2019-08-21  948  
5670f5b5c73057 Fancy Fang 2019-08-21  949  	mipi_dsi->lcd_panel = kstrdup(lcd_panel, GFP_KERNEL);
5670f5b5c73057 Fancy Fang 2019-08-21  950  	if (!mipi_dsi->lcd_panel) {
5670f5b5c73057 Fancy Fang 2019-08-21  951  		dev_err(&pdev->dev, "failed to allocate lcd panel name\n");
5670f5b5c73057 Fancy Fang 2019-08-21  952  		ret = -ENOMEM;
5670f5b5c73057 Fancy Fang 2019-08-21  953  		goto kstrdup_fail;
5670f5b5c73057 Fancy Fang 2019-08-21  954  	}
5670f5b5c73057 Fancy Fang 2019-08-21  955  
5670f5b5c73057 Fancy Fang 2019-08-21  956  	mipi_dsi->pdev = pdev;
5670f5b5c73057 Fancy Fang 2019-08-21  957  	mipi_dsi->disp_mipi = mxc_dispdrv_register(&mipi_dsi_drv);
5670f5b5c73057 Fancy Fang 2019-08-21  958  	if (IS_ERR(mipi_dsi->disp_mipi)) {
5670f5b5c73057 Fancy Fang 2019-08-21  959  		dev_err(&pdev->dev, "mxc_dispdrv_register error\n");
5670f5b5c73057 Fancy Fang 2019-08-21  960  		ret = PTR_ERR(mipi_dsi->disp_mipi);
5670f5b5c73057 Fancy Fang 2019-08-21  961  		goto dispdrv_reg_fail;
5670f5b5c73057 Fancy Fang 2019-08-21  962  	}
5670f5b5c73057 Fancy Fang 2019-08-21  963  
5670f5b5c73057 Fancy Fang 2019-08-21  964  	mipi_dsi->mipi_dsi_pkt_read  = mipi_dsi_pkt_read;
5670f5b5c73057 Fancy Fang 2019-08-21  965  	mipi_dsi->mipi_dsi_pkt_write = mipi_dsi_pkt_write;
5670f5b5c73057 Fancy Fang 2019-08-21  966  	mipi_dsi->mipi_dsi_dcs_cmd   = mipi_dsi_dcs_cmd;
5670f5b5c73057 Fancy Fang 2019-08-21  967  
5670f5b5c73057 Fancy Fang 2019-08-21  968  	mxc_dispdrv_setdata(mipi_dsi->disp_mipi, mipi_dsi);
5670f5b5c73057 Fancy Fang 2019-08-21  969  	dev_set_drvdata(&pdev->dev, mipi_dsi);
5670f5b5c73057 Fancy Fang 2019-08-21  970  
5670f5b5c73057 Fancy Fang 2019-08-21  971  	dev_info(&pdev->dev, "i.MX MIPI DSI driver probed\n");
5670f5b5c73057 Fancy Fang 2019-08-21  972  	return ret;
5670f5b5c73057 Fancy Fang 2019-08-21  973  
5670f5b5c73057 Fancy Fang 2019-08-21  974  dispdrv_reg_fail:
5670f5b5c73057 Fancy Fang 2019-08-21  975  	kfree(mipi_dsi->lcd_panel);
5670f5b5c73057 Fancy Fang 2019-08-21  976  kstrdup_fail:
5670f5b5c73057 Fancy Fang 2019-08-21  977  get_parent_regmap_fail:
5670f5b5c73057 Fancy Fang 2019-08-21  978  dev_reset_fail:
5670f5b5c73057 Fancy Fang 2019-08-21  979  	if (mipi_dsi->disp_power_on)
5670f5b5c73057 Fancy Fang 2019-08-21  980  		regulator_disable(mipi_dsi->disp_power_on);
5670f5b5c73057 Fancy Fang 2019-08-21  981  	return ret;
5670f5b5c73057 Fancy Fang 2019-08-21  982  }
5670f5b5c73057 Fancy Fang 2019-08-21  983  

:::::: The code at line 822 was first introduced by commit
:::::: 5670f5b5c73057aa4cede54a4d8e415e8d302283 video: fbdev: mxc: add NXP MIPI DSI driver support

:::::: TO: Fancy Fang <chen.fang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
