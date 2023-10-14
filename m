Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27971C2A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYzsm0AL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697304549; x=1728840549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fOPEk1MwpYW1s3yQW2fxLBg58dnc9JWQ6xe/n4rqBvg=;
  b=HYzsm0ALd9jTVvAt4xJFY9G1+VTnhn8fv843d08xzPEJqDECQFXnECkY
   LpWHCI3EmsNWoa9TbQIDRJ26UpBH2aLp3CeWK7jf0A/Z6Ak5Dnyi5nSa3
   XJ7ShW9xSY3DGgyvy4ublfSRTSLeDq4kdaQdiezW5CGbV/LuAg4b1ezR0
   8AOj8E0NIx6UVOHh0WCX4T3nzZ8ZLr6QJTQimjzLDIpW40rii+einWY06
   kHtcwcyEylqBIHW1kDKAMR38nZxSsflNh+hJmBVZlDCA941eRfhUWeejE
   whldFa4YGWZY3kmEZ/kZ1ymnP8mwB1m8xJEuElxUXNaeL02HSafo9bUa2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389197965"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389197965"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 10:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="878866451"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="878866451"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Oct 2023 10:29:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qriRi-0006Rf-2x;
	Sat, 14 Oct 2023 17:29:02 +0000
Date: Sun, 15 Oct 2023 01:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2214/30000]
 drivers/staging/media/imx/imx8-isi-core.c:294:18: warning: variable 'len'
 set but not used
Message-ID: <202310150143.l6rNic17-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 9c17c116048937e39bbfb8ac97d5c1e5c4d095bf [2214/30000] Merge remote-tracking branch 'origin/capture/media-dev' into capture/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150143.l6rNic17-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150143.l6rNic17-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150143.l6rNic17-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-isi-core.c: In function 'mxc_isi_of_parse_resets':
>> drivers/staging/media/imx/imx8-isi-core.c:294:18: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     294 |         uint32_t len, rstc_num = 0;
         |                  ^~~
   drivers/staging/media/imx/imx8-isi-core.c: At top level:
>> drivers/staging/media/imx/imx8-isi-core.c:470:12: warning: 'mxc_isi_runtime_resume' defined but not used [-Wunused-function]
     470 | static int mxc_isi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-core.c:460:12: warning: 'mxc_isi_runtime_suspend' defined but not used [-Wunused-function]
     460 | static int mxc_isi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-core.c:455:12: warning: 'mxc_isi_pm_resume' defined but not used [-Wunused-function]
     455 | static int mxc_isi_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-core.c:443:12: warning: 'mxc_isi_pm_suspend' defined but not used [-Wunused-function]
     443 | static int mxc_isi_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
--
>> drivers/staging/media/imx/imx8-mipi-csi2.c:1117:13: warning: 'mipi_csi2_runtime_resume' defined but not used [-Wunused-function]
    1117 | static int  mipi_csi2_runtime_resume(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2.c:1109:13: warning: 'mipi_csi2_runtime_suspend' defined but not used [-Wunused-function]
    1109 | static int  mipi_csi2_runtime_suspend(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2.c:1104:13: warning: 'mipi_csi2_pm_resume' defined but not used [-Wunused-function]
    1104 | static int  mipi_csi2_pm_resume(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2.c:1091:13: warning: 'mipi_csi2_pm_suspend' defined but not used [-Wunused-function]
    1091 | static int  mipi_csi2_pm_suspend(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2.c:940:46: warning: 'mipi_csi2_sd_internal_ops' defined but not used [-Wunused-const-variable=]
     940 | static const struct v4l2_subdev_internal_ops mipi_csi2_sd_internal_ops = {
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/len +294 drivers/staging/media/imx/imx8-isi-core.c

f093fe32626a9a Guoniu.zhou 2019-10-25  284  
f093fe32626a9a Guoniu.zhou 2019-10-25  285  static int mxc_isi_of_parse_resets(struct mxc_isi_dev *mxc_isi)
f093fe32626a9a Guoniu.zhou 2019-10-25  286  {
f093fe32626a9a Guoniu.zhou 2019-10-25  287  	int ret;
f093fe32626a9a Guoniu.zhou 2019-10-25  288  	struct device *dev = &mxc_isi->pdev->dev;
f093fe32626a9a Guoniu.zhou 2019-10-25  289  	struct device_node *np = dev->of_node;
f093fe32626a9a Guoniu.zhou 2019-10-25  290  	struct device_node *parent, *child;
f093fe32626a9a Guoniu.zhou 2019-10-25  291  	struct of_phandle_args args;
f093fe32626a9a Guoniu.zhou 2019-10-25  292  	struct reset_control *rstc;
f093fe32626a9a Guoniu.zhou 2019-10-25  293  	const char *compat;
f093fe32626a9a Guoniu.zhou 2019-10-25 @294  	uint32_t len, rstc_num = 0;
f093fe32626a9a Guoniu.zhou 2019-10-25  295  
f093fe32626a9a Guoniu.zhou 2019-10-25  296  	ret = of_parse_phandle_with_args(np, "resets", "#reset-cells",
f093fe32626a9a Guoniu.zhou 2019-10-25  297  					 0, &args);
f093fe32626a9a Guoniu.zhou 2019-10-25  298  	if (ret)
f093fe32626a9a Guoniu.zhou 2019-10-25  299  		return ret;
f093fe32626a9a Guoniu.zhou 2019-10-25  300  
f093fe32626a9a Guoniu.zhou 2019-10-25  301  	parent = args.np;
f093fe32626a9a Guoniu.zhou 2019-10-25  302  	for_each_child_of_node(parent, child) {
f093fe32626a9a Guoniu.zhou 2019-10-25  303  		compat = of_get_property(child, "compatible", NULL);
f093fe32626a9a Guoniu.zhou 2019-10-25  304  		if (!compat)
f093fe32626a9a Guoniu.zhou 2019-10-25  305  			continue;
f093fe32626a9a Guoniu.zhou 2019-10-25  306  
f093fe32626a9a Guoniu.zhou 2019-10-25  307  		rstc = of_reset_control_array_get(child, false, false, true);
f093fe32626a9a Guoniu.zhou 2019-10-25  308  		if (IS_ERR(rstc))
f093fe32626a9a Guoniu.zhou 2019-10-25  309  			continue;
f093fe32626a9a Guoniu.zhou 2019-10-25  310  
f093fe32626a9a Guoniu.zhou 2019-10-25  311  		len = strlen(compat);
f093fe32626a9a Guoniu.zhou 2019-10-25  312  		if (!of_compat_cmp("isi,soft-resetn", compat, len)) {
f093fe32626a9a Guoniu.zhou 2019-10-25  313  			mxc_isi->soft_resetn = rstc;
f093fe32626a9a Guoniu.zhou 2019-10-25  314  			rstc_num++;
f093fe32626a9a Guoniu.zhou 2019-10-25  315  		} else if (!of_compat_cmp("isi,clk-enable", compat, len)) {
f093fe32626a9a Guoniu.zhou 2019-10-25  316  			mxc_isi->clk_enable = rstc;
f093fe32626a9a Guoniu.zhou 2019-10-25  317  			rstc_num++;
f093fe32626a9a Guoniu.zhou 2019-10-25  318  		} else {
f093fe32626a9a Guoniu.zhou 2019-10-25  319  			dev_warn(dev, "invalid isi reset node: %s\n", compat);
f093fe32626a9a Guoniu.zhou 2019-10-25  320  		}
f093fe32626a9a Guoniu.zhou 2019-10-25  321  	}
f093fe32626a9a Guoniu.zhou 2019-10-25  322  
f093fe32626a9a Guoniu.zhou 2019-10-25  323  	if (!rstc_num) {
f093fe32626a9a Guoniu.zhou 2019-10-25  324  		dev_err(dev, "no invalid reset control exists\n");
f093fe32626a9a Guoniu.zhou 2019-10-25  325  		return -EINVAL;
f093fe32626a9a Guoniu.zhou 2019-10-25  326  	}
f093fe32626a9a Guoniu.zhou 2019-10-25  327  
f093fe32626a9a Guoniu.zhou 2019-10-25  328  	of_node_put(parent);
f093fe32626a9a Guoniu.zhou 2019-10-25  329  	return 0;
f093fe32626a9a Guoniu.zhou 2019-10-25  330  }
f093fe32626a9a Guoniu.zhou 2019-10-25  331  
ade11ee3836976 Guoniu.zhou 2019-01-21  332  static int mxc_isi_probe(struct platform_device *pdev)
ade11ee3836976 Guoniu.zhou 2019-01-21  333  {
ade11ee3836976 Guoniu.zhou 2019-01-21  334  	struct device *dev = &pdev->dev;
ade11ee3836976 Guoniu.zhou 2019-01-21  335  	struct mxc_isi_dev *mxc_isi;
ade11ee3836976 Guoniu.zhou 2019-01-21  336  	struct resource *res;
f093fe32626a9a Guoniu.zhou 2019-10-25  337  	const struct of_device_id *of_id;
ade11ee3836976 Guoniu.zhou 2019-01-21  338  	int ret = 0;
ade11ee3836976 Guoniu.zhou 2019-01-21  339  
f093fe32626a9a Guoniu.zhou 2019-10-25  340  
ade11ee3836976 Guoniu.zhou 2019-01-21  341  	mxc_isi = devm_kzalloc(dev, sizeof(*mxc_isi), GFP_KERNEL);
ade11ee3836976 Guoniu.zhou 2019-01-21  342  	if (!mxc_isi)
ade11ee3836976 Guoniu.zhou 2019-01-21  343  		return -ENOMEM;
ade11ee3836976 Guoniu.zhou 2019-01-21  344  
ade11ee3836976 Guoniu.zhou 2019-01-21  345  	mxc_isi->pdev = pdev;
f093fe32626a9a Guoniu.zhou 2019-10-25  346  	of_id = of_match_node(mxc_isi_of_match, dev->of_node);
f093fe32626a9a Guoniu.zhou 2019-10-25  347  	if (!of_id)
f093fe32626a9a Guoniu.zhou 2019-10-25  348  		return -EINVAL;
f093fe32626a9a Guoniu.zhou 2019-10-25  349  
f093fe32626a9a Guoniu.zhou 2019-10-25  350  	mxc_isi->ops = of_id->data;
f093fe32626a9a Guoniu.zhou 2019-10-25  351  	if (!mxc_isi->ops) {
f093fe32626a9a Guoniu.zhou 2019-10-25  352  		dev_err(dev, "Can't get platform device data\n");
f093fe32626a9a Guoniu.zhou 2019-10-25  353  		return -EINVAL;
f093fe32626a9a Guoniu.zhou 2019-10-25  354  	}
ade11ee3836976 Guoniu.zhou 2019-01-21  355  
ade11ee3836976 Guoniu.zhou 2019-01-21  356  	ret = mxc_isi_parse_dt(mxc_isi);
ade11ee3836976 Guoniu.zhou 2019-01-21  357  	if (ret < 0)
ade11ee3836976 Guoniu.zhou 2019-01-21  358  		return ret;
ade11ee3836976 Guoniu.zhou 2019-01-21  359  
ade11ee3836976 Guoniu.zhou 2019-01-21  360  	if (mxc_isi->id >= MXC_ISI_MAX_DEVS || mxc_isi->id < 0) {
f093fe32626a9a Guoniu.zhou 2019-10-25  361  		dev_err(dev, "Invalid driver data or device id (%d)\n",
f093fe32626a9a Guoniu.zhou 2019-10-25  362  			mxc_isi->id);
ade11ee3836976 Guoniu.zhou 2019-01-21  363  		return -EINVAL;
ade11ee3836976 Guoniu.zhou 2019-01-21  364  	}
ade11ee3836976 Guoniu.zhou 2019-01-21  365  
ade11ee3836976 Guoniu.zhou 2019-01-21  366  	spin_lock_init(&mxc_isi->slock);
ade11ee3836976 Guoniu.zhou 2019-01-21  367  	mutex_init(&mxc_isi->lock);
4b44b37dab4d99 Guoniu.zhou 2019-10-17  368  	atomic_set(&mxc_isi->usage_count, 0);
ade11ee3836976 Guoniu.zhou 2019-01-21  369  
f093fe32626a9a Guoniu.zhou 2019-10-25  370  	if (of_device_is_compatible(dev->of_node, "fsl,imx8mn-isi")) {
f093fe32626a9a Guoniu.zhou 2019-10-25  371  		ret = mxc_isi_of_parse_resets(mxc_isi);
f093fe32626a9a Guoniu.zhou 2019-10-25  372  		if (ret) {
f093fe32626a9a Guoniu.zhou 2019-10-25  373  			dev_warn(dev, "Can not parse reset control\n");
f093fe32626a9a Guoniu.zhou 2019-10-25  374  			return ret;
f093fe32626a9a Guoniu.zhou 2019-10-25  375  		}
ade11ee3836976 Guoniu.zhou 2019-01-21  376  	}
ade11ee3836976 Guoniu.zhou 2019-01-21  377  
f093fe32626a9a Guoniu.zhou 2019-10-25  378  	ret = mxc_isi_clk_get(mxc_isi);
ade11ee3836976 Guoniu.zhou 2019-01-21  379  	if (ret < 0) {
f093fe32626a9a Guoniu.zhou 2019-10-25  380  		dev_err(dev, "ISI_%d get clocks fail\n", mxc_isi->id);
f093fe32626a9a Guoniu.zhou 2019-10-25  381  		return ret;
ade11ee3836976 Guoniu.zhou 2019-01-21  382  	}
ade11ee3836976 Guoniu.zhou 2019-01-21  383  
ade11ee3836976 Guoniu.zhou 2019-01-21  384  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
ade11ee3836976 Guoniu.zhou 2019-01-21  385  	mxc_isi->regs = devm_ioremap_resource(dev, res);
ade11ee3836976 Guoniu.zhou 2019-01-21  386  	if (IS_ERR(mxc_isi->regs)) {
ade11ee3836976 Guoniu.zhou 2019-01-21  387  		dev_err(dev, "Failed to get ISI register map\n");
ade11ee3836976 Guoniu.zhou 2019-01-21  388  		return PTR_ERR(mxc_isi->regs);
ade11ee3836976 Guoniu.zhou 2019-01-21  389  	}
ade11ee3836976 Guoniu.zhou 2019-01-21  390  
f093fe32626a9a Guoniu.zhou 2019-10-25  391  	ret = mxc_isi_clk_enable(mxc_isi);
f093fe32626a9a Guoniu.zhou 2019-10-25  392  	if (ret < 0) {
f093fe32626a9a Guoniu.zhou 2019-10-25  393  		dev_err(dev, "ISI_%d enable clocks fail\n", mxc_isi->id);
f093fe32626a9a Guoniu.zhou 2019-10-25  394  		return ret;
f093fe32626a9a Guoniu.zhou 2019-10-25  395  	}
f093fe32626a9a Guoniu.zhou 2019-10-25  396  	disp_mix_sft_rstn(mxc_isi->soft_resetn, false);
f093fe32626a9a Guoniu.zhou 2019-10-25  397  	disp_mix_clks_enable(mxc_isi->clk_enable, true);
f093fe32626a9a Guoniu.zhou 2019-10-25  398  
ade11ee3836976 Guoniu.zhou 2019-01-21  399  	mxc_isi_clean_registers(mxc_isi);
ade11ee3836976 Guoniu.zhou 2019-01-21  400  
ade11ee3836976 Guoniu.zhou 2019-01-21  401  	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
ade11ee3836976 Guoniu.zhou 2019-01-21  402  	if (!res) {
ade11ee3836976 Guoniu.zhou 2019-01-21  403  		dev_err(dev, "Failed to get IRQ resource\n");
f093fe32626a9a Guoniu.zhou 2019-10-25  404  		goto err;
ade11ee3836976 Guoniu.zhou 2019-01-21  405  	}
ade11ee3836976 Guoniu.zhou 2019-01-21  406  	ret = devm_request_irq(dev, res->start, mxc_isi_irq_handler,
ade11ee3836976 Guoniu.zhou 2019-01-21  407  			       0, dev_name(dev), mxc_isi);
ade11ee3836976 Guoniu.zhou 2019-01-21  408  	if (ret < 0) {
ade11ee3836976 Guoniu.zhou 2019-01-21  409  		dev_err(dev, "failed to install irq (%d)\n", ret);
f093fe32626a9a Guoniu.zhou 2019-10-25  410  		goto err;
ade11ee3836976 Guoniu.zhou 2019-01-21  411  	}
ade11ee3836976 Guoniu.zhou 2019-01-21  412  
ade11ee3836976 Guoniu.zhou 2019-01-21  413  	mxc_isi_channel_set_chain_buf(mxc_isi);
ade11ee3836976 Guoniu.zhou 2019-01-21  414  
4b44b37dab4d99 Guoniu.zhou 2019-10-17  415  	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
4b44b37dab4d99 Guoniu.zhou 2019-10-17  416  	if (ret < 0)
4b44b37dab4d99 Guoniu.zhou 2019-10-17  417  		dev_warn(dev, "Populate child platform device fail\n");
4b44b37dab4d99 Guoniu.zhou 2019-10-17  418  
f093fe32626a9a Guoniu.zhou 2019-10-25  419  	mxc_isi_clk_disable(mxc_isi);
4b44b37dab4d99 Guoniu.zhou 2019-10-17  420  
4b44b37dab4d99 Guoniu.zhou 2019-10-17  421  	platform_set_drvdata(pdev, mxc_isi);
ade11ee3836976 Guoniu.zhou 2019-01-21  422  	pm_runtime_enable(dev);
ade11ee3836976 Guoniu.zhou 2019-01-21  423  
ade11ee3836976 Guoniu.zhou 2019-01-21  424  	dev_info(dev, "mxc_isi.%d registered successfully\n", mxc_isi->id);
ade11ee3836976 Guoniu.zhou 2019-01-21  425  	return 0;
f093fe32626a9a Guoniu.zhou 2019-10-25  426  
f093fe32626a9a Guoniu.zhou 2019-10-25  427  err:
f093fe32626a9a Guoniu.zhou 2019-10-25  428  	disp_mix_clks_enable(mxc_isi->clk_enable, false);
f093fe32626a9a Guoniu.zhou 2019-10-25  429  	disp_mix_sft_rstn(mxc_isi->soft_resetn, true);
f093fe32626a9a Guoniu.zhou 2019-10-25  430  	mxc_isi_clk_disable(mxc_isi);
f093fe32626a9a Guoniu.zhou 2019-10-25  431  	return -ENXIO;
ade11ee3836976 Guoniu.zhou 2019-01-21  432  }
ade11ee3836976 Guoniu.zhou 2019-01-21  433  
ade11ee3836976 Guoniu.zhou 2019-01-21  434  static int mxc_isi_remove(struct platform_device *pdev)
ade11ee3836976 Guoniu.zhou 2019-01-21  435  {
ade11ee3836976 Guoniu.zhou 2019-01-21  436  	struct device *dev = &pdev->dev;
ade11ee3836976 Guoniu.zhou 2019-01-21  437  
ade11ee3836976 Guoniu.zhou 2019-01-21  438  	pm_runtime_disable(dev);
ade11ee3836976 Guoniu.zhou 2019-01-21  439  
ade11ee3836976 Guoniu.zhou 2019-01-21  440  	return 0;
ade11ee3836976 Guoniu.zhou 2019-01-21  441  }
ade11ee3836976 Guoniu.zhou 2019-01-21  442  
ade11ee3836976 Guoniu.zhou 2019-01-21 @443  static int mxc_isi_pm_suspend(struct device *dev)
ade11ee3836976 Guoniu.zhou 2019-01-21  444  {
ade11ee3836976 Guoniu.zhou 2019-01-21  445  	struct mxc_isi_dev *mxc_isi = dev_get_drvdata(dev);
ade11ee3836976 Guoniu.zhou 2019-01-21  446  
ade11ee3836976 Guoniu.zhou 2019-01-21  447  	if (mxc_isi->is_streaming) {
ade11ee3836976 Guoniu.zhou 2019-01-21  448  		dev_warn(dev, "running, prevent entering suspend.\n");
ade11ee3836976 Guoniu.zhou 2019-01-21  449  		return -EAGAIN;
ade11ee3836976 Guoniu.zhou 2019-01-21  450  	}
ade11ee3836976 Guoniu.zhou 2019-01-21  451  
ade11ee3836976 Guoniu.zhou 2019-01-21  452  	return pm_runtime_force_suspend(dev);
ade11ee3836976 Guoniu.zhou 2019-01-21  453  }
ade11ee3836976 Guoniu.zhou 2019-01-21  454  
ade11ee3836976 Guoniu.zhou 2019-01-21 @455  static int mxc_isi_pm_resume(struct device *dev)
ade11ee3836976 Guoniu.zhou 2019-01-21  456  {
ade11ee3836976 Guoniu.zhou 2019-01-21  457  	return pm_runtime_force_resume(dev);
ade11ee3836976 Guoniu.zhou 2019-01-21  458  }
ade11ee3836976 Guoniu.zhou 2019-01-21  459  
ade11ee3836976 Guoniu.zhou 2019-01-21 @460  static int mxc_isi_runtime_suspend(struct device *dev)
ade11ee3836976 Guoniu.zhou 2019-01-21  461  {
ade11ee3836976 Guoniu.zhou 2019-01-21  462  	struct mxc_isi_dev *mxc_isi = dev_get_drvdata(dev);
ade11ee3836976 Guoniu.zhou 2019-01-21  463  
f093fe32626a9a Guoniu.zhou 2019-10-25  464  	disp_mix_clks_enable(mxc_isi->clk_enable, false);
f093fe32626a9a Guoniu.zhou 2019-10-25  465  	mxc_isi_clk_disable(mxc_isi);
f093fe32626a9a Guoniu.zhou 2019-10-25  466  
ade11ee3836976 Guoniu.zhou 2019-01-21  467  	return 0;
ade11ee3836976 Guoniu.zhou 2019-01-21  468  }
ade11ee3836976 Guoniu.zhou 2019-01-21  469  
ade11ee3836976 Guoniu.zhou 2019-01-21 @470  static int mxc_isi_runtime_resume(struct device *dev)
ade11ee3836976 Guoniu.zhou 2019-01-21  471  {
ade11ee3836976 Guoniu.zhou 2019-01-21  472  	struct mxc_isi_dev *mxc_isi = dev_get_drvdata(dev);
ade11ee3836976 Guoniu.zhou 2019-01-21  473  	int ret;
ade11ee3836976 Guoniu.zhou 2019-01-21  474  
f093fe32626a9a Guoniu.zhou 2019-10-25  475  	ret = mxc_isi_clk_enable(mxc_isi);
f093fe32626a9a Guoniu.zhou 2019-10-25  476  	if (ret) {
ade11ee3836976 Guoniu.zhou 2019-01-21  477  		dev_err(dev, "%s clk enable fail\n", __func__);
f093fe32626a9a Guoniu.zhou 2019-10-25  478  		return ret;
f093fe32626a9a Guoniu.zhou 2019-10-25  479  	}
f093fe32626a9a Guoniu.zhou 2019-10-25  480  	disp_mix_sft_rstn(mxc_isi->soft_resetn, false);
f093fe32626a9a Guoniu.zhou 2019-10-25  481  	disp_mix_clks_enable(mxc_isi->clk_enable, true);
ade11ee3836976 Guoniu.zhou 2019-01-21  482  
f093fe32626a9a Guoniu.zhou 2019-10-25  483  	return 0;
ade11ee3836976 Guoniu.zhou 2019-01-21  484  }
ade11ee3836976 Guoniu.zhou 2019-01-21  485  

:::::: The code at line 294 was first introduced by commit
:::::: f093fe32626a9a4486d0849c85723c8bd2db8cd8 staging: media: imx: enable ISI for imx8mn platform

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Guoniu.zhou <guoniu.zhou@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
