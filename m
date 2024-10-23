Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8840216F8E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 23:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729727307; cv=none; b=DFNpPuYqIL6OWxGNvxDjC1Hn3DL6nLw4HJJ6r2UZs51Z/KuY7SywoB6s8jbTMxiudxutzSF7ZcUQFznNxo+jyds67BLSx0iWnXf3O7lrfikOA+sxPF63BmW8i5q9ridBPbbvZ+y+xqVvzynqPq8sHt/QXmbcLxcWTIWCyZ8lmNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729727307; c=relaxed/simple;
	bh=y63XEFdjY+TcJNmOtHzbIKOQO821oraPpluJZsLd+Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a5w9dKdlcy9tnGfNPk+GwzHlzF7jawoUEcz2WGEMJTGBMilLT8DSmp4o3tsmZRCcgNp3MZQSzGJl/b7SJuioyY4oxL0/tbkZM5R0POLko3aodq9ExjWYmVXjDM5ocG7KwAuQ828a9fsE+hIls9EiwBpciXyZTRIFC4PFAvB9Kb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCyS/74r; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCyS/74r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729727305; x=1761263305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y63XEFdjY+TcJNmOtHzbIKOQO821oraPpluJZsLd+Tw=;
  b=ZCyS/74rh0Pi36rFue8WZm983zLkmj9m3sCMq2TOeTZ9VRiTagqCvVar
   6LiWeH+A94d6e8VZYIcPRX5LuZgFN5W95U4LH3nezNFoojbNpq6DrC94a
   3siCMlGuWu6cmMCPRP7PxQOPyNPXHAgLF5BZE/B3cMOyEDvz+ZGSMGvho
   bebqBRbS/52gJrHd5A79LDl2eEbZ4DCv1idl4PHjrPQEK85XuhpWu7xrQ
   ugd0jHQGGoGAHlkBRILcdJEAJs00iPYB0OK1/nRQ2HB6Nxhu9YB31a9wc
   ntP0hTQ0p97uSan2ObylHzpbo1V15pVKhGw+SzCGncCwJAEi24o2nUK3m
   w==;
X-CSE-ConnectionGUID: x8KNKj8mTReFae8szzs8TQ==
X-CSE-MsgGUID: oQmLzKgGST6uFH+ZYdMTIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51882457"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51882457"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 16:48:24 -0700
X-CSE-ConnectionGUID: yudnGd3dT4OmsEeAbzGKeQ==
X-CSE-MsgGUID: kP6CwpBtTne4lDxPeWbs8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="103744762"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Oct 2024 16:48:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3l5Q-000Via-2B;
	Wed, 23 Oct 2024 23:48:20 +0000
Date: Thu, 24 Oct 2024 07:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:gpio-no-irq-core 2/3] drivers/gpio/gpio-mpfs.c:49:45: error:
 duplicate member 'regs'
Message-ID: <202410240701.18mxAzZa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-no-irq-core
head:   56933542ce1c4bc98ea9e701609ac91333414944
commit: 2c03ad1dfd8418ab768c325b93217bb7ef70d7ce [2/3] gpio: mpfs: add CoreGPIO support
config: loongarch-randconfig-r073-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240701.18mxAzZa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240701.18mxAzZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240701.18mxAzZa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-mpfs.c:49:45: error: duplicate member 'regs'
      49 |         const struct mpfs_gpio_reg_offsets *regs;
         |                                             ^~~~
   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_direction_output':
>> drivers/gpio/gpio-mpfs.c:75:60: error: invalid use of undefined type 'struct regmap'
      75 |         regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->regs->outp, BIT(gpio_index),
         |                                                            ^~
   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_get':
   drivers/gpio/gpio-mpfs.c:99:73: error: invalid use of undefined type 'struct regmap'
      99 |                 return regmap_test_bits(mpfs_gpio->regs, mpfs_gpio->regs->outp, BIT(gpio_index));
         |                                                                         ^~
   drivers/gpio/gpio-mpfs.c:101:73: error: invalid use of undefined type 'struct regmap'
     101 |                 return regmap_test_bits(mpfs_gpio->regs, mpfs_gpio->regs->inp, BIT(gpio_index));
         |                                                                         ^~
   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_set':
   drivers/gpio/gpio-mpfs.c:110:60: error: invalid use of undefined type 'struct regmap'
     110 |         regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->regs->outp, BIT(gpio_index),
         |                                                            ^~
   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_probe':
>> drivers/gpio/gpio-mpfs.c:128:25: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     128 |         mpfs_gpio->regs = of_device_get_match_data(&pdev->dev);
         |                         ^
   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_get':
>> drivers/gpio/gpio-mpfs.c:102:1: warning: control reaches end of non-void function [-Wreturn-type]
     102 | }
         | ^


vim +/regs +49 drivers/gpio/gpio-mpfs.c

    45	
    46	struct mpfs_gpio_chip {
    47		struct clk *clk;
    48		struct regmap *regs;
  > 49		const struct mpfs_gpio_reg_offsets *regs;
    50		struct gpio_chip gc;
    51	};
    52	
    53	static const struct regmap_config mpfs_gpio_regmap_config = {
    54		.reg_bits = 32,
    55		.reg_stride = 4,
    56		.val_bits = 32,
    57	};
    58	
    59	static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio_index)
    60	{
    61		struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
    62	
    63		regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
    64				   MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_IN);
    65	
    66		return 0;
    67	}
    68	
    69	static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio_index, int value)
    70	{
    71		struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
    72	
    73		regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
    74				   MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_IN);
  > 75		regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->regs->outp, BIT(gpio_index),
    76				   value << gpio_index);
    77	
    78		return 0;
    79	}
    80	
    81	static int mpfs_gpio_get_direction(struct gpio_chip *gc,
    82					   unsigned int gpio_index)
    83	{
    84		struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
    85		unsigned int gpio_cfg;
    86	
    87		regmap_read(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index), &gpio_cfg);
    88		if (gpio_cfg & MPFS_GPIO_EN_IN)
    89			return GPIO_LINE_DIRECTION_IN;
    90	
    91		return GPIO_LINE_DIRECTION_OUT;
    92	}
    93	
    94	static int mpfs_gpio_get(struct gpio_chip *gc, unsigned int gpio_index)
    95	{
    96		struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
    97	
    98		if (mpfs_gpio_get_direction(gc, gpio_index) == GPIO_LINE_DIRECTION_OUT)
    99			return regmap_test_bits(mpfs_gpio->regs, mpfs_gpio->regs->outp, BIT(gpio_index));
   100		else
   101			return regmap_test_bits(mpfs_gpio->regs, mpfs_gpio->regs->inp, BIT(gpio_index));
 > 102	}
   103	
   104	static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
   105	{
   106		struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
   107	
   108		mpfs_gpio_get(gc, gpio_index);
   109	
   110		regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->regs->outp, BIT(gpio_index),
   111				   value << gpio_index);
   112	
   113		mpfs_gpio_get(gc, gpio_index);
   114	}
   115	
   116	static int mpfs_gpio_probe(struct platform_device *pdev)
   117	{
   118		struct device *dev = &pdev->dev;
   119		struct mpfs_gpio_chip *mpfs_gpio;
   120		struct clk *clk;
   121		void __iomem *base;
   122		int ret, ngpios;
   123	
   124		mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
   125		if (!mpfs_gpio)
   126			return -ENOMEM;
   127	
 > 128		mpfs_gpio->regs = of_device_get_match_data(&pdev->dev);
   129	
   130		base = devm_platform_ioremap_resource(pdev, 0);
   131		if (IS_ERR(base))
   132			return dev_err_probe(dev, PTR_ERR(base), "failed to ioremap memory resource\n");
   133	
   134		mpfs_gpio->regs = devm_regmap_init_mmio(dev, base, &mpfs_gpio_regmap_config);
   135		if (IS_ERR(mpfs_gpio->regs))
   136			return dev_err_probe(dev, PTR_ERR(mpfs_gpio->regs), "failed to initialise regmap\n");
   137	
   138		clk = devm_clk_get_enabled(dev, NULL);
   139		if (IS_ERR(clk))
   140			return dev_err_probe(dev, PTR_ERR(clk), "failed to get and enable clock\n");
   141	
   142		mpfs_gpio->clk = clk;
   143	
   144		ngpios = MAX_NUM_GPIO;
   145		device_property_read_u32(dev, "ngpios", &ngpios);
   146		if (ngpios > MAX_NUM_GPIO)
   147			ngpios = MAX_NUM_GPIO;
   148	
   149		mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
   150		mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
   151		mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
   152		mpfs_gpio->gc.get = mpfs_gpio_get;
   153		mpfs_gpio->gc.set = mpfs_gpio_set;
   154		mpfs_gpio->gc.base = -1;
   155		mpfs_gpio->gc.ngpio = ngpios;
   156		mpfs_gpio->gc.label = dev_name(dev);
   157		mpfs_gpio->gc.parent = dev;
   158		mpfs_gpio->gc.owner = THIS_MODULE;
   159	
   160		ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
   161		if (ret)
   162			return ret;
   163	
   164		platform_set_drvdata(pdev, mpfs_gpio);
   165	
   166		return 0;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
