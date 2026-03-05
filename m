Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA2221F20
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702388; cv=none; b=O9wqUxiG6a839dutx2CaUkWHtU5LgCTVLp73tEf0aYUlfAX+U2QEk/Q+Yis9aUIe7IE2OdcUNX8rHhYlpnt5wBoUtNerUZqlyxb3uxJ0WxpU6dYorfGlbAebfJuywDO7dzqkDiFd3BqDUWaWN7FUSB7JuGFC7ajXbwzEeEoAsvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702388; c=relaxed/simple;
	bh=yVVOJTE/zUJqhnidUw+HOA7ZyLMPee+UqnKATnAGtjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDOa5fBc4+ndSGJ6mWMBMB1oOn8O3XzFrGepTpnBspc5ZaWXAySHdXdw/yHo6MTjO6ZypVnGiMwD7q8DutJ8IzcEkSO2Ff4Q6fACHbRZA6VZuZpwcei5Rq1PBYrs2LW8pdWYF7ALdiT7KOhcYN106UXzHDNj7Se826i+Rt1Xfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJRjmJRT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJRjmJRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772702386; x=1804238386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yVVOJTE/zUJqhnidUw+HOA7ZyLMPee+UqnKATnAGtjc=;
  b=gJRjmJRT2eGlb1hE/xYqr5hp42ntuqMFrbEO2KFDsRbA7HrbN93dxckt
   ok0BfScce3YxijthRoCRnqVnWWg29LTqWCBSgWBHoM5o2b1YLGHvZ3/s8
   RRF9V/rZjlF8DQ4Joi9A8TaW+egXDgpXAEyTAhw0vCd5qWnR5QaAV5H0p
   XI+Q5zv2upDAW04Bkmx1adbZpxOXKXCJHCZNLvs9WHDhX05xueyesykE3
   Ki9dEifEM63nRbVKdCS0724vgmFcGgzRNGbrKHmCvHxfknt2cQSpioM+t
   Bhra67JYMj+NV/JKQegcuMWbQlr3tbDT9vMZwd7zFnFknpXgKYkNFMZAv
   A==;
X-CSE-ConnectionGUID: f+3kIWNMTWi0tFkSh95Drw==
X-CSE-MsgGUID: izx3fpmeTTK+3gcRx5+s4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91172599"
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; 
   d="scan'208";a="91172599"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 01:19:46 -0800
X-CSE-ConnectionGUID: 3dYZ3uZqRW2W1VQJXXPtuQ==
X-CSE-MsgGUID: oj9nWylPSQyWZXvbMNo52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; 
   d="scan'208";a="245123518"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Mar 2026 01:19:43 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy4rs-000000000Ow-1L25;
	Thu, 05 Mar 2026 09:19:40 +0000
Date: Thu, 5 Mar 2026 17:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 4/4] phy: airoha: Add support for Airoha AN7581 USB PHY
Message-ID: <202603051725.x2cR2ynI-lkp@intel.com>
References: <20260304005843.2680-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304005843.2680-5-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260303]
[cannot apply to robh/for-next linus/master v7.0-rc2 v7.0-rc1 v6.19 v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-soc-Add-bindings-for-Airoha-SCU-Serdes-lines/20260304-090107
base:   next-20260303
patch link:    https://lore.kernel.org/r/20260304005843.2680-5-ansuelsmth%40gmail.com
patch subject: [PATCH v5 4/4] phy: airoha: Add support for Airoha AN7581 USB PHY
config: powerpc64-randconfig-r131-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051725.x2cR2ynI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051725.x2cR2ynI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051725.x2cR2ynI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/airoha/phy-an7581-usb.c:569:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/phy/airoha/phy-an7581-usb.c:569:14: sparse:     expected void *base
   drivers/phy/airoha/phy-an7581-usb.c:569:14: sparse:     got void [noderef] __iomem *
>> drivers/phy/airoha/phy-an7581-usb.c:573:24: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *regs @@     got void *base @@
   drivers/phy/airoha/phy-an7581-usb.c:573:24: sparse:     expected void [noderef] __iomem *regs
   drivers/phy/airoha/phy-an7581-usb.c:573:24: sparse:     got void *base

vim +569 drivers/phy/airoha/phy-an7581-usb.c

   545	
   546	static int an7581_usb_phy_probe(struct platform_device *pdev)
   547	{
   548		struct phy_provider *phy_provider;
   549		struct an7581_usb_phy_priv *priv;
   550		struct device *dev = &pdev->dev;
   551		unsigned int index;
   552		void *base;
   553		int ret;
   554	
   555		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   556		if (!priv)
   557			return -ENOMEM;
   558	
   559		priv->dev = dev;
   560	
   561		ret = of_property_read_u32(dev->of_node, "airoha,usb2-monitor-clk-sel",
   562					   &priv->monclk_sel);
   563		if (ret)
   564			return dev_err_probe(dev, ret, "Monitor clock selection is mandatory for USB PHY calibration\n");
   565	
   566		if (priv->monclk_sel > 3)
   567			return dev_err_probe(dev, -EINVAL, "only 4 Monitor clock are selectable on the SoC\n");
   568	
 > 569		base = devm_platform_ioremap_resource(pdev, 0);
   570		if (IS_ERR(base))
   571			return PTR_ERR(base);
   572	
 > 573		priv->regmap = devm_regmap_init_mmio(dev, base, &an7581_usb_phy_regmap_config);
   574		if (IS_ERR(priv->regmap))
   575			return PTR_ERR(priv->regmap);
   576	
   577		platform_set_drvdata(pdev, priv);
   578	
   579		for (index = 0; index < AIROHA_PHY_USB_MAX; index++) {
   580			enum an7581_usb_phy_instance_type phy_type;
   581			struct an7581_usb_phy_instance *instance;
   582	
   583			switch (index) {
   584			case AIROHA_PHY_USB2:
   585				phy_type = PHY_TYPE_USB2;
   586				break;
   587			case AIROHA_PHY_USB3:
   588				phy_type = PHY_TYPE_USB3;
   589				break;
   590			}
   591	
   592			if (phy_type == PHY_TYPE_USB3) {
   593				ret = of_property_read_u32(dev->of_node, "airoha,usb3-serdes",
   594							   &priv->serdes_port);
   595				if (ret)
   596					return dev_err_probe(dev, ret, "missing serdes line for USB 3.0\n");
   597	
   598				priv->scu = syscon_regmap_lookup_by_compatible("airoha,en7581-scu");
   599				if (IS_ERR(priv->scu))
   600					return dev_err_probe(dev, PTR_ERR(priv->scu), "failed to get SCU syscon\n");
   601			}
   602	
   603			instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
   604			if (!instance)
   605				return -ENOMEM;
   606	
   607			instance->type = phy_type;
   608			priv->phys[index] = instance;
   609	
   610			instance->phy = devm_phy_create(dev, NULL, &airoha_phy);
   611			if (IS_ERR(instance->phy))
   612				return dev_err_probe(dev, PTR_ERR(instance->phy), "failed to create phy\n");
   613	
   614			phy_set_drvdata(instance->phy, instance);
   615		}
   616	
   617		phy_provider = devm_of_phy_provider_register(&pdev->dev, an7581_usb_phy_xlate);
   618	
   619		return PTR_ERR_OR_ZERO(phy_provider);
   620	}
   621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
