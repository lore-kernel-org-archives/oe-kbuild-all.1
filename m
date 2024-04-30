Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D88E79DE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714452136; cv=none; b=blVxCkoF9kN0JjNBq0Z61kDQyi6NlSEZy9aRY0UY7agYK6TvqZK9TOvQprgSZ7jBV3meMPRj+5jKil9e+IFCXGqhzLWmiYVbgRfQLGR2hum1LL+lrQsdqqGOLpesWiSEdq/m6RcV20qqMdrVIisCA2hCI9dphiC44GHBDiJKkbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714452136; c=relaxed/simple;
	bh=z+WV9Xc1l1aVPk5yPh1yCl41Zaisfcqa+Op+uocbyZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o/FaXMIdDwCcxTevwlUHRUFqgtaUMXmN2YGiwkvCT2802EmDsaIynpFHMcQ6FM12TJ1tRSx1WsoMGrFRPRgpC23uYbrB+v8l5tdx0ZQZT9QVGRTLs2zLuXufQ1kuQMbBFhX9upnyP3mrXTmE813+SFd26NhaPfaEOj1hWNoCsRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dd5P6ysA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dd5P6ysA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714452134; x=1745988134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+WV9Xc1l1aVPk5yPh1yCl41Zaisfcqa+Op+uocbyZE=;
  b=dd5P6ysAJ6Rzc9A+PY3TgmB37qP3LIPzA0/Lse2oUjF1GfxUf06efjIr
   xe5kYBM5LzuQX8n+m2Bu9fqsumRB+mMy0wffNXxEtdeIhd8QAAkkP9ulO
   i66DTITxaBMp6kBd69JXiJamh2h8w3VMFXZqdwW5lOwrELISujkQIoWzS
   cYRVqFvVDaq+SB/Vr5LLXK5/Y8r4ykEW6Rncpqih+jZD7bt7jh8Rdg1o/
   dnzb1g4okftJfXDcfp/nkoYaXNq+WILwjW5LKCsfPK2VtAaHdWh7o5WmI
   jQwZ3R49tjH3fJqnT2WGke9OKQuIAftQF9evOjL073WW/MrJ0D5G2cn/R
   g==;
X-CSE-ConnectionGUID: NRtdRUSKQW6URMhTrdsCbQ==
X-CSE-MsgGUID: tWYPFzomRze30mxwODJwJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="32642695"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="32642695"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 21:42:11 -0700
X-CSE-ConnectionGUID: SSXra7wLSQCgwAK+mwOaHQ==
X-CSE-MsgGUID: A3tQfUshRne8oM2iDHNQ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="31031700"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2024 21:42:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1fJf-0007jm-1X;
	Tue, 30 Apr 2024 04:42:07 +0000
Date: Tue, 30 Apr 2024 12:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21355/22260]
 drivers/gpio/gpio-phytium-platform.c:111:2-3: Unneeded semicolon
Message-ID: <202404301203.LIsGwT62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   534530510857129d59e723e50cc93349b4a59fb2
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [21355/22260] gpio: add phytium gpio driver
config: arm64-randconfig-r054-20240430 (https://download.01.org/0day-ci/archive/20240430/202404301203.LIsGwT62-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301203.LIsGwT62-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-phytium-platform.c:111:2-3: Unneeded semicolon

vim +111 drivers/gpio/gpio-phytium-platform.c

    35	
    36	static int phytium_gpio_probe(struct platform_device *pdev)
    37	{
    38		struct device *dev = &pdev->dev;
    39		struct resource *res;
    40		struct phytium_gpio *gpio;
    41		struct gpio_irq_chip *girq;
    42		struct fwnode_handle *fwnode;
    43		int err, irq_count;
    44	
    45		gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
    46		if (!gpio)
    47			return -ENOMEM;
    48	
    49		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    50		gpio->regs = devm_ioremap_resource(&pdev->dev, res);
    51		if (IS_ERR(gpio->regs))
    52			return PTR_ERR(gpio->regs);
    53	
    54		if (!device_get_child_node_count(dev))
    55			return -ENODEV;
    56	
    57		device_for_each_child_node(dev, fwnode) {
    58			int idx;
    59	
    60			if (fwnode_property_read_u32(fwnode, "reg", &idx) ||
    61			    idx >= MAX_NPORTS) {
    62				dev_err(dev, "missing/invalid port index\n");
    63				fwnode_handle_put(fwnode);
    64				return -EINVAL;
    65			}
    66	
    67			if (fwnode_property_read_u32(fwnode, "nr-gpios",
    68						     &gpio->ngpio[idx])) {
    69				dev_info(dev,
    70					 "failed to get number of gpios for Port%c\n",
    71					 idx ? 'B' : 'A');
    72				gpio->ngpio[idx] = NGPIO_DEFAULT;
    73			}
    74		}
    75	
    76		/* irq_chip support */
    77		gpio->irq_chip.name = dev_name(dev);
    78		gpio->irq_chip.irq_ack = phytium_gpio_irq_ack;
    79		gpio->irq_chip.irq_mask = phytium_gpio_irq_mask;
    80		gpio->irq_chip.irq_unmask = phytium_gpio_irq_unmask;
    81		gpio->irq_chip.irq_set_type = phytium_gpio_irq_set_type;
    82		gpio->irq_chip.irq_enable = phytium_gpio_irq_enable;
    83		gpio->irq_chip.irq_disable = phytium_gpio_irq_disable;
    84	#ifdef CONFIG_SMP
    85		gpio->irq_chip.irq_set_affinity = phytium_gpio_irq_set_affinity;
    86	#endif
    87		raw_spin_lock_init(&gpio->lock);
    88	
    89		gpio->gc.base = -1;
    90		gpio->gc.get_direction = phytium_gpio_get_direction;
    91		gpio->gc.direction_input = phytium_gpio_direction_input;
    92		gpio->gc.direction_output = phytium_gpio_direction_output;
    93		gpio->gc.get = phytium_gpio_get;
    94		gpio->gc.set = phytium_gpio_set;
    95		gpio->gc.ngpio = gpio->ngpio[0] + gpio->ngpio[1];
    96		gpio->gc.label = dev_name(dev);
    97		gpio->gc.parent = dev;
    98		gpio->gc.owner = THIS_MODULE;
    99	
   100		girq = &gpio->gc.irq;
   101		girq->handler = handle_bad_irq;
   102		girq->default_type = IRQ_TYPE_NONE;
   103	
   104		for (irq_count = 0; irq_count < gpio->ngpio[0]; irq_count++) {
   105			gpio->irq[irq_count] = -ENXIO;
   106			gpio->irq[irq_count] = platform_get_irq(pdev, irq_count);
   107			if (gpio->irq[irq_count] < 0) {
   108				dev_warn(dev, "no irq is found.\n");
   109				break;
   110			}
 > 111		};
   112	
   113		girq->num_parents = irq_count;
   114		girq->parents = gpio->irq;
   115		girq->parent_handler = phytium_gpio_irq_handler;
   116	
   117		girq->chip = &gpio->irq_chip;
   118	
   119		err = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
   120		if (err)
   121			return err;
   122	
   123		platform_set_drvdata(pdev, gpio);
   124		dev_info(dev, "Phytium GPIO controller @%pa registered\n",
   125			&res->start);
   126	
   127		return 0;
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
