Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4472D0622
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768956858; cv=none; b=je5EPmpt/KdBMerBm2mjDp5VU45MTB6rN1vsnNDQ/gB1crpVeGFfbwNKfub6WOjyM8r813PVYpBFiPjYOq7tOl8jkvfcW6dlMv+INWgtg6dd+JvDMyep2bGJMCi16VeIxUwFOwhMQTzzZGNRJgSWx/ekf1JaFXcyOq2bOigh0PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768956858; c=relaxed/simple;
	bh=KPG/dS8KFcF8NI29VJ53nZJ4CLHR7WQZZuX8zpUwjyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iyWkfgsLzZJd5fSVarDvXF4vCChZGtmBpsbvJrXVoTeu4EQvHgrtkvj9u+4suVwFCztKm0Ls0Zzbkb4GmsGxy7OnUnrO1vY6DbLgtogVulAYD/j+YSfz+WILqPtN2sZTAgj+t147gEqZ4ZSdCg+LLcEH8L3bOHVh1T7PzXsMhKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Em5xphqp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Em5xphqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768956856; x=1800492856;
  h=date:from:to:cc:subject:message-id;
  bh=KPG/dS8KFcF8NI29VJ53nZJ4CLHR7WQZZuX8zpUwjyY=;
  b=Em5xphqpegYI65heGcXPUvldDCn7873IVcIBX4wXTn620ic+Q7SS4lf1
   0kbwONFjyS6X1nh0DEfN1E3n4/aa7/0pnFzlKSYic9iVXkwuLae9uBW9M
   yFGwOIVHiPY7yYFpC0Pm5KGDfzYr+bW6bDmeOPmP0Ivi9oMugJwtGLelk
   z5M9QnK4puB4K9KCBipQIoYNuS9jirP2O8wekZN/dy3BgTnkkO3QjB97R
   1F9eNo+zhR8UM5qtQhs0pOANA0b0BlPkvpRsF3P598OIhbPGvw/ijQEi4
   0kGp7BKBAMKMRsp1U3EWMGrHLeznT/gykCfn3C5Oz55sYnX0qjeqldd3T
   A==;
X-CSE-ConnectionGUID: MiSJsSVVQkWbLq9/Rk10FA==
X-CSE-MsgGUID: UMYc2M6ESkefIUqG0rUCTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70232461"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70232461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 16:54:16 -0800
X-CSE-ConnectionGUID: wPDjY6SJSIWm1t5nXfrPkQ==
X-CSE-MsgGUID: W5YmjicCSjOUFcX+azQmdA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2026 16:54:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viMU7-00000000Pmz-2R3E;
	Wed, 21 Jan 2026 00:54:11 +0000
Date: Wed, 21 Jan 2026 08:53:52 +0800
From: kernel test robot <lkp@intel.com>
To: Roy Luo <royluo@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Joy Chakraborty <joychakr@google.com>,
 Naveen Kumar <mnkumar@google.com>
Subject: [linux-next:master 5777/8302]
 drivers/phy/phy-google-usb.c:273:undefined reference to
 `typec_switch_unregister'
Message-ID: <202601210825.ELrpQeED-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: cbce66669c82ee9ae0e26523c0fcd3c721fcfe85 [5777/8302] phy: Add Google Tensor SoC USB PHY driver
config: um-randconfig-001-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210825.ELrpQeED-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210825.ELrpQeED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/phy/phy-google-usb.o: in function `google_usb_phy_remove':
>> drivers/phy/phy-google-usb.c:273:(.text+0x11): undefined reference to `typec_switch_unregister'
   /usr/bin/ld: drivers/phy/phy-google-usb.o: in function `google_usb_set_orientation':
>> drivers/phy/phy-google-usb.c:82:(.text+0x102): undefined reference to `typec_switch_get_drvdata'
   /usr/bin/ld: drivers/phy/phy-google-usb.o: in function `google_usb_phy_probe':
>> drivers/phy/phy-google-usb.c:261:(.text+0x6b2): undefined reference to `typec_switch_register'
   collect2: error: ld returned 1 exit status


vim +273 drivers/phy/phy-google-usb.c

    78	
    79	static int google_usb_set_orientation(struct typec_switch_dev *sw,
    80					      enum typec_orientation orientation)
    81	{
  > 82		struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
    83	
    84		dev_dbg(gphy->dev, "set orientation %d\n", orientation);
    85	
    86		gphy->orientation = orientation;
    87	
    88		if (pm_runtime_suspended(gphy->dev))
    89			return 0;
    90	
    91		guard(mutex)(&gphy->phy_mutex);
    92	
    93		set_vbus_valid(gphy);
    94	
    95		return 0;
    96	}
    97	
    98	static int google_usb2_phy_init(struct phy *_phy)
    99	{
   100		struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
   101		struct google_usb_phy *gphy = inst->parent;
   102		u32 reg;
   103		int ret;
   104	
   105		dev_dbg(gphy->dev, "initializing usb2 phy\n");
   106	
   107		guard(mutex)(&gphy->phy_mutex);
   108	
   109		regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
   110		reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
   111		reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
   112		reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
   113		regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
   114	
   115		regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, &reg);
   116		reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
   117		reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
   118		regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, reg);
   119	
   120		set_vbus_valid(gphy);
   121	
   122		ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
   123		if (ret)
   124			return ret;
   125	
   126		ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
   127		if (ret) {
   128			clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
   129			return ret;
   130		}
   131	
   132		regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
   133		reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
   134		regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
   135	
   136		return 0;
   137	}
   138	
   139	static int google_usb2_phy_exit(struct phy *_phy)
   140	{
   141		struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
   142		struct google_usb_phy *gphy = inst->parent;
   143		u32 reg;
   144	
   145		dev_dbg(gphy->dev, "exiting usb2 phy\n");
   146	
   147		guard(mutex)(&gphy->phy_mutex);
   148	
   149		regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
   150		reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
   151		regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
   152	
   153		reset_control_bulk_assert(inst->num_rsts, inst->rsts);
   154		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
   155	
   156		return 0;
   157	}
   158	
   159	static const struct phy_ops google_usb2_phy_ops = {
   160		.init		= google_usb2_phy_init,
   161		.exit		= google_usb2_phy_exit,
   162	};
   163	
   164	static struct phy *google_usb_phy_xlate(struct device *dev,
   165						const struct of_phandle_args *args)
   166	{
   167		struct google_usb_phy *gphy = dev_get_drvdata(dev);
   168	
   169		if (args->args[0] >= GOOGLE_USB_PHY_NUM) {
   170			dev_err(dev, "invalid PHY index requested from DT\n");
   171			return ERR_PTR(-ENODEV);
   172		}
   173		return gphy->insts[args->args[0]].phy;
   174	}
   175	
   176	static int google_usb_phy_probe(struct platform_device *pdev)
   177	{
   178		struct typec_switch_desc sw_desc = { };
   179		struct google_usb_phy_instance *inst;
   180		struct phy_provider *phy_provider;
   181		struct device *dev = &pdev->dev;
   182		struct google_usb_phy *gphy;
   183		struct phy *phy;
   184		u32 args[1];
   185		int ret;
   186	
   187		gphy = devm_kzalloc(dev, sizeof(*gphy), GFP_KERNEL);
   188		if (!gphy)
   189			return -ENOMEM;
   190	
   191		dev_set_drvdata(dev, gphy);
   192		gphy->dev = dev;
   193	
   194		ret = devm_mutex_init(dev, &gphy->phy_mutex);
   195		if (ret)
   196			return ret;
   197	
   198		gphy->usb_cfg_regmap =
   199			syscon_regmap_lookup_by_phandle_args(dev->of_node,
   200							     "google,usb-cfg-csr",
   201							     ARRAY_SIZE(args), args);
   202		if (IS_ERR(gphy->usb_cfg_regmap)) {
   203			return dev_err_probe(dev, PTR_ERR(gphy->usb_cfg_regmap),
   204					     "invalid usb cfg csr\n");
   205		}
   206	
   207		gphy->usb2_cfg_offset = args[0];
   208	
   209		gphy->usbdp_top_base = devm_platform_ioremap_resource_byname(pdev,
   210									     "usbdp_top");
   211		if (IS_ERR(gphy->usbdp_top_base))
   212			return dev_err_probe(dev, PTR_ERR(gphy->usbdp_top_base),
   213					    "invalid usbdp top\n");
   214	
   215		gphy->insts = devm_kcalloc(dev, GOOGLE_USB_PHY_NUM, sizeof(*gphy->insts), GFP_KERNEL);
   216		if (!gphy->insts)
   217			return -ENOMEM;
   218	
   219		inst = &gphy->insts[GOOGLE_USB2_PHY];
   220		inst->parent = gphy;
   221		inst->index = GOOGLE_USB2_PHY;
   222		phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
   223		if (IS_ERR(phy))
   224			return dev_err_probe(dev, PTR_ERR(phy),
   225					     "failed to create usb2 phy instance\n");
   226		inst->phy = phy;
   227		phy_set_drvdata(phy, inst);
   228	
   229		inst->num_clks = 2;
   230		inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
   231		if (!inst->clks)
   232			return -ENOMEM;
   233		inst->clks[0].id = "usb2";
   234		inst->clks[1].id = "usb2_apb";
   235		ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
   236		if (ret)
   237			return dev_err_probe(dev, ret, "failed to get u2 phy clks\n");
   238	
   239		inst->num_rsts = 2;
   240		inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
   241		if (!inst->rsts)
   242			return -ENOMEM;
   243		inst->rsts[0].id = "usb2";
   244		inst->rsts[1].id = "usb2_apb";
   245		ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
   246		if (ret)
   247			return dev_err_probe(dev, ret, "failed to get u2 phy resets\n");
   248	
   249		phy_provider = devm_of_phy_provider_register(dev, google_usb_phy_xlate);
   250		if (IS_ERR(phy_provider))
   251			return dev_err_probe(dev, PTR_ERR(phy_provider),
   252					     "failed to register phy provider\n");
   253	
   254		pm_runtime_enable(dev);
   255	
   256		sw_desc.fwnode = dev_fwnode(dev);
   257		sw_desc.drvdata = gphy;
   258		sw_desc.name = fwnode_get_name(dev_fwnode(dev));
   259		sw_desc.set = google_usb_set_orientation;
   260	
 > 261		gphy->sw = typec_switch_register(dev, &sw_desc);
   262		if (IS_ERR(gphy->sw))
   263			return dev_err_probe(dev, PTR_ERR(gphy->sw),
   264					     "failed to register typec switch\n");
   265	
   266		return 0;
   267	}
   268	
   269	static void google_usb_phy_remove(struct platform_device *pdev)
   270	{
   271		struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
   272	
 > 273		typec_switch_unregister(gphy->sw);
   274		pm_runtime_disable(&pdev->dev);
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
