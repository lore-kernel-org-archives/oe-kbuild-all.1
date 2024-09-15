Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AAA125DB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726406808; cv=none; b=lEJgMX/sxLiQ+6jEz+x5JVgOWnsxdu92yqN3wdHjUle2axSUrbUfecIghZlLVQGEbKw2YLUllnVMBb4H4YtQoiz2Qwhp91R46nP8gFkGYS+HSDf0uoxZu6v79EKQwJK+4E8odGQ29nnRz3S3qpkaabeG77Y/DWKPRsetQdLv9UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726406808; c=relaxed/simple;
	bh=ob6sJjE0U93QlTjTUP6HJrIGWLQvNuNxzvb15UesbKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aycgiDcIADaYBu/s7uykTPczG5L6uHbKkLjXVQ4Z/isTDVj2ns9Ix18P+2t4qhpWVNkqFRuPrrGEVuCV1BdA5KEAriKUN0X3S5E3B5RRFQ+0KJsvrWub1dqFQWxNU+f3+Zgua7LsqFbIBYqTs0+kS9GUofz7dNUlFCQ8CEjZbTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/qCUU9T; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/qCUU9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726406806; x=1757942806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ob6sJjE0U93QlTjTUP6HJrIGWLQvNuNxzvb15UesbKo=;
  b=Z/qCUU9TMAtxml4dCgJByPOqnL8BQbtZflH5feKmgKXMM7xCt5kiRGfE
   dZxy+cRcHvJAW6JqKkBtsl0QxMXZwCLzQ/TrVZmjIf0M0DB5FVvrV334G
   goXINzC01riYjz0mdXj42eQ492JTckNJdJcBhtSyO5k98z+p2U4OwYeJz
   W1Cf6tAvVgMSffZBqj/q4JNEHA7PIgUbTgwsuodTvWwmyWZh80kFzGo+t
   gAixVTN1JxorNJHH2pbWTIWBSZ1kh9BGH0NJgVaQcTT6QwnUOtYB346EP
   A6UINPFHHcVbzEE6DYygYjIUyb7pHRt9KjS2tnMyBPHEncRcoXHHhG676
   Q==;
X-CSE-ConnectionGUID: X9b4rtJ4QJmJrqFieR9P7g==
X-CSE-MsgGUID: 3k5cd7UNQlyNwYUfA1iQ8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25190041"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25190041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 06:26:45 -0700
X-CSE-ConnectionGUID: JHxlw1AyQSmH3yAg+mxGqA==
X-CSE-MsgGUID: nJCDdE82TvC8qEp7vNME8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="99301105"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Sep 2024 06:26:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sppH0-0008he-1h;
	Sun, 15 Sep 2024 13:26:42 +0000
Date: Sun, 15 Sep 2024 21:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21355/23714]
 drivers/gpio/gpio-phytium-platform.c:30:36: warning:
 'phytium_gpio_acpi_match' defined but not used
Message-ID: <202409152152.KNtItlJj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [21355/23714] gpio: add phytium gpio driver
config: arm64-randconfig-r051-20240915 (https://download.01.org/0day-ci/archive/20240915/202409152152.KNtItlJj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409152152.KNtItlJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409152152.KNtItlJj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-phytium-platform.c:30:36: warning: 'phytium_gpio_acpi_match' defined but not used [-Wunused-const-variable=]
      30 | static const struct acpi_device_id phytium_gpio_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-phytium-platform.c:111:2-3: Unneeded semicolon

vim +/phytium_gpio_acpi_match +30 drivers/gpio/gpio-phytium-platform.c

    29	
  > 30	static const struct acpi_device_id phytium_gpio_acpi_match[] = {
    31		{ "PHYT0001", 0 },
    32		{ }
    33	};
    34	MODULE_DEVICE_TABLE(acpi, phytium_gpio_acpi_match);
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
