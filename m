Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BB815D4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnJmn06M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697338347; x=1728874347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4rtVH7u2yfvEeGlzGFXWAWUnqf/ZDumCz6IHJHbUiUM=;
  b=UnJmn06MdTH/Tj5grLSonhV8iRavGIuvpA76DlPZNAMOXVJK8zsIR9AW
   jMGLkxMIxuoOb3ejo6dABMYMFyTjMZOuI8XjV55lUQsAc0xPaDMsHRxlw
   jqezXSXxjBHxacCR+w2Lo3Kemzjm6nN+kEw6fQVq7gXqsRLpqXluGk8mB
   fqxWLQE6g8LiOxfHaAPaSzghh+naxSqcf6w+Am+FSu8n62a7VnYNqQNUf
   M9hfOBHeG6gRBsDT9KldmtYmcqV9wU9XEXwemdqo2pe2I2TRWKxDs2vm/
   eWAgj4T4N/NTH60LHvbjBIWF/T0IYIK+quW5xzyAery0UwAa7EqHT2MCM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389220936"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389220936"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705144337"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705144337"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Oct 2023 19:52:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrEn-0006xV-1T;
	Sun, 15 Oct 2023 02:52:17 +0000
Date: Sun, 15 Oct 2023 10:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4851/15768]
 drivers/mxc/mipi/mxc_mipi_csi2.c:358: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202310151031.cICQQmpx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/15768] Merge branch 'mxc/next' into next
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151031.cICQQmpx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151031.cICQQmpx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151031.cICQQmpx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mxc/mipi/mxc_mipi_csi2.c:358: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is called by the driver framework to initialize the MIPI CSI2


vim +358 drivers/mxc/mipi/mxc_mipi_csi2.c

a217045c7efa91 Robby Cai 2019-09-27  356  
a217045c7efa91 Robby Cai 2019-09-27  357  /**
a217045c7efa91 Robby Cai 2019-09-27 @358   * This function is called by the driver framework to initialize the MIPI CSI2
a217045c7efa91 Robby Cai 2019-09-27  359   * device.
a217045c7efa91 Robby Cai 2019-09-27  360   *
a217045c7efa91 Robby Cai 2019-09-27  361   * @param	pdev	The device structure for the MIPI CSI2 passed in by the
a217045c7efa91 Robby Cai 2019-09-27  362   *			driver framework.
a217045c7efa91 Robby Cai 2019-09-27  363   *
a217045c7efa91 Robby Cai 2019-09-27  364   * @return      Returns 0 on success or negative error code on error
a217045c7efa91 Robby Cai 2019-09-27  365   */
a217045c7efa91 Robby Cai 2019-09-27  366  static int mipi_csi2_probe(struct platform_device *pdev)
a217045c7efa91 Robby Cai 2019-09-27  367  {
a217045c7efa91 Robby Cai 2019-09-27  368  	struct device *dev = &pdev->dev;
a217045c7efa91 Robby Cai 2019-09-27  369  	struct device_node *np = pdev->dev.of_node;
a217045c7efa91 Robby Cai 2019-09-27  370  	struct resource *res;
a217045c7efa91 Robby Cai 2019-09-27  371  	u32 mipi_csi2_dphy_ver;
a217045c7efa91 Robby Cai 2019-09-27  372  	int ret;
a217045c7efa91 Robby Cai 2019-09-27  373  
a217045c7efa91 Robby Cai 2019-09-27  374  	gmipi_csi2 = kmalloc(sizeof(struct mipi_csi2_info), GFP_KERNEL);
a217045c7efa91 Robby Cai 2019-09-27  375  	if (!gmipi_csi2) {
a217045c7efa91 Robby Cai 2019-09-27  376  		ret = -ENOMEM;
a217045c7efa91 Robby Cai 2019-09-27  377  		goto alloc_failed;
a217045c7efa91 Robby Cai 2019-09-27  378  	}
a217045c7efa91 Robby Cai 2019-09-27  379  
a217045c7efa91 Robby Cai 2019-09-27  380  	ret = of_property_read_u32(np, "ipu_id", &(gmipi_csi2->ipu_id));
a217045c7efa91 Robby Cai 2019-09-27  381  	if (ret) {
a217045c7efa91 Robby Cai 2019-09-27  382  		dev_err(&pdev->dev, "ipu_id missing or invalid\n");
a217045c7efa91 Robby Cai 2019-09-27  383  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  384  	}
a217045c7efa91 Robby Cai 2019-09-27  385  
a217045c7efa91 Robby Cai 2019-09-27  386  	ret = of_property_read_u32(np, "csi_id", &(gmipi_csi2->csi_id));
a217045c7efa91 Robby Cai 2019-09-27  387  	if (ret) {
a217045c7efa91 Robby Cai 2019-09-27  388  		dev_err(&pdev->dev, "csi_id missing or invalid\n");
a217045c7efa91 Robby Cai 2019-09-27  389  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  390  	}
a217045c7efa91 Robby Cai 2019-09-27  391  
a217045c7efa91 Robby Cai 2019-09-27  392  	ret = of_property_read_u32(np, "v_channel", &(gmipi_csi2->v_channel));
a217045c7efa91 Robby Cai 2019-09-27  393  	if (ret) {
a217045c7efa91 Robby Cai 2019-09-27  394  		dev_err(&pdev->dev, "v_channel missing or invalid\n");
a217045c7efa91 Robby Cai 2019-09-27  395  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  396  	}
a217045c7efa91 Robby Cai 2019-09-27  397  
a217045c7efa91 Robby Cai 2019-09-27  398  	ret = of_property_read_u32(np, "lanes", &(gmipi_csi2->lanes));
a217045c7efa91 Robby Cai 2019-09-27  399  	if (ret) {
a217045c7efa91 Robby Cai 2019-09-27  400  		dev_err(&pdev->dev, "lanes missing or invalid\n");
a217045c7efa91 Robby Cai 2019-09-27  401  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  402  	}
a217045c7efa91 Robby Cai 2019-09-27  403  
a217045c7efa91 Robby Cai 2019-09-27  404  	if ((gmipi_csi2->ipu_id < 0) || (gmipi_csi2->ipu_id > 1) ||
a217045c7efa91 Robby Cai 2019-09-27  405  		(gmipi_csi2->csi_id > 1) || (gmipi_csi2->v_channel > 3) ||
a217045c7efa91 Robby Cai 2019-09-27  406  		(gmipi_csi2->lanes > 4)) {
a217045c7efa91 Robby Cai 2019-09-27  407  		dev_err(&pdev->dev, "invalid param for mipi csi2!\n");
a217045c7efa91 Robby Cai 2019-09-27  408  		ret = -EINVAL;
a217045c7efa91 Robby Cai 2019-09-27  409  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  410  	}
a217045c7efa91 Robby Cai 2019-09-27  411  
a217045c7efa91 Robby Cai 2019-09-27  412  	/* initialize mutex */
a217045c7efa91 Robby Cai 2019-09-27  413  	mutex_init(&gmipi_csi2->mutex_lock);
a217045c7efa91 Robby Cai 2019-09-27  414  
a217045c7efa91 Robby Cai 2019-09-27  415  	/* get mipi csi2 informaiton */
a217045c7efa91 Robby Cai 2019-09-27  416  	gmipi_csi2->pdev = pdev;
a217045c7efa91 Robby Cai 2019-09-27  417  	gmipi_csi2->mipi_en = false;
a217045c7efa91 Robby Cai 2019-09-27  418  
a217045c7efa91 Robby Cai 2019-09-27  419  	gmipi_csi2->cfg_clk = devm_clk_get(dev, "cfg_clk");
a217045c7efa91 Robby Cai 2019-09-27  420  	if (IS_ERR(gmipi_csi2->cfg_clk)) {
a217045c7efa91 Robby Cai 2019-09-27  421  		dev_err(&pdev->dev, "failed to get cfg_clk\n");
a217045c7efa91 Robby Cai 2019-09-27  422  		ret = PTR_ERR(gmipi_csi2->cfg_clk);
a217045c7efa91 Robby Cai 2019-09-27  423  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  424  	}
a217045c7efa91 Robby Cai 2019-09-27  425  
a217045c7efa91 Robby Cai 2019-09-27  426  	/* get mipi dphy clk */
a217045c7efa91 Robby Cai 2019-09-27  427  	gmipi_csi2->dphy_clk = devm_clk_get(dev, "dphy_clk");
a217045c7efa91 Robby Cai 2019-09-27  428  	if (IS_ERR(gmipi_csi2->dphy_clk)) {
a217045c7efa91 Robby Cai 2019-09-27  429  		dev_err(&pdev->dev, "failed to get dphy pll_ref_clk\n");
a217045c7efa91 Robby Cai 2019-09-27  430  		ret = PTR_ERR(gmipi_csi2->dphy_clk);
a217045c7efa91 Robby Cai 2019-09-27  431  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  432  	}
a217045c7efa91 Robby Cai 2019-09-27  433  
a217045c7efa91 Robby Cai 2019-09-27  434  	/* get mipi to ipu pixel clk */
a217045c7efa91 Robby Cai 2019-09-27  435  	gmipi_csi2->pixel_clk = devm_clk_get(dev, "pixel_clk");
a217045c7efa91 Robby Cai 2019-09-27  436  	if (IS_ERR(gmipi_csi2->pixel_clk)) {
a217045c7efa91 Robby Cai 2019-09-27  437  		dev_err(&pdev->dev, "failed to get mipi pixel clk\n");
a217045c7efa91 Robby Cai 2019-09-27  438  		ret = PTR_ERR(gmipi_csi2->pixel_clk);
a217045c7efa91 Robby Cai 2019-09-27  439  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  440  	}
a217045c7efa91 Robby Cai 2019-09-27  441  
a217045c7efa91 Robby Cai 2019-09-27  442  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
a217045c7efa91 Robby Cai 2019-09-27  443  	if (!res) {
a217045c7efa91 Robby Cai 2019-09-27  444  		ret = -ENODEV;
a217045c7efa91 Robby Cai 2019-09-27  445  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  446  	}
a217045c7efa91 Robby Cai 2019-09-27  447  
a217045c7efa91 Robby Cai 2019-09-27  448  	/* mipi register mapping */
a217045c7efa91 Robby Cai 2019-09-27  449  	gmipi_csi2->mipi_csi2_base = ioremap(res->start, PAGE_SIZE);
a217045c7efa91 Robby Cai 2019-09-27  450  	if (!gmipi_csi2->mipi_csi2_base) {
a217045c7efa91 Robby Cai 2019-09-27  451  		ret = -ENOMEM;
a217045c7efa91 Robby Cai 2019-09-27  452  		goto err;
a217045c7efa91 Robby Cai 2019-09-27  453  	}
a217045c7efa91 Robby Cai 2019-09-27  454  
a217045c7efa91 Robby Cai 2019-09-27  455  	/* mipi dphy clk enable for register access */
a217045c7efa91 Robby Cai 2019-09-27  456  	clk_prepare_enable(gmipi_csi2->dphy_clk);
a217045c7efa91 Robby Cai 2019-09-27  457  	/* get mipi csi2 dphy version */
a217045c7efa91 Robby Cai 2019-09-27  458  	mipi_csi2_dphy_ver = mipi_csi2_read(gmipi_csi2, MIPI_CSI2_VERSION);
a217045c7efa91 Robby Cai 2019-09-27  459  
a217045c7efa91 Robby Cai 2019-09-27  460  	clk_disable_unprepare(gmipi_csi2->dphy_clk);
a217045c7efa91 Robby Cai 2019-09-27  461  
a217045c7efa91 Robby Cai 2019-09-27  462  	platform_set_drvdata(pdev, gmipi_csi2);
a217045c7efa91 Robby Cai 2019-09-27  463  
a217045c7efa91 Robby Cai 2019-09-27  464  	dev_info(&pdev->dev, "i.MX MIPI CSI2 driver probed\n");
a217045c7efa91 Robby Cai 2019-09-27  465  	dev_info(&pdev->dev, "i.MX MIPI CSI2 dphy version is 0x%x\n",
a217045c7efa91 Robby Cai 2019-09-27  466  						mipi_csi2_dphy_ver);
a217045c7efa91 Robby Cai 2019-09-27  467  
a217045c7efa91 Robby Cai 2019-09-27  468  	return 0;
a217045c7efa91 Robby Cai 2019-09-27  469  
a217045c7efa91 Robby Cai 2019-09-27  470  err:
a217045c7efa91 Robby Cai 2019-09-27  471  	kfree(gmipi_csi2);
a217045c7efa91 Robby Cai 2019-09-27  472  alloc_failed:
a217045c7efa91 Robby Cai 2019-09-27  473  	dev_err(&pdev->dev, "i.MX MIPI CSI2 driver probed -  error\n");
a217045c7efa91 Robby Cai 2019-09-27  474  	return ret;
a217045c7efa91 Robby Cai 2019-09-27  475  }
a217045c7efa91 Robby Cai 2019-09-27  476  

:::::: The code at line 358 was first introduced by commit
:::::: a217045c7efa914ddab33b617aa67ddb1a1c4c4e media: mipi csi: add IPU CSI driver

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
