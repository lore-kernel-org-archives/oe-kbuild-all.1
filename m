Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442EA33B6FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970676; cv=none; b=EFeES2vBW5KEbGE0iaMsS4zvXghiTqfwIKE/2AEhdWQdL996WlTEHrI7Y+Vup++zd866SoTvFyFr2SPp5Rjf6MXrzByITaHeXbQboOrgiIDKENohs26u+C5EEoJf8+j13EpHIzGVFv+q9ZIIU2JoCKBUWW7MaM/Jkdhq8iyxTQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970676; c=relaxed/simple;
	bh=tjdYOxLNPcbkSG4jaU6r2CqKDJrdZjl4TuvNFiEX4pY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XAG3Z217ULDWZBA8RPO/8f9si6MGB18/mNZNdzseTPxJ42pGSHBG43Oe69y8YsnaF4qmKIshpKgkflwmS/TgklJzrQ06DGMfWW4Hd3aF9CUnBXDLSFwc6P6L1TVMI3nrbp9CdnPBnHzPDGge1FJJKkFswu6WjN3QjplwDekWRng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TK4eXyWN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TK4eXyWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765970674; x=1797506674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tjdYOxLNPcbkSG4jaU6r2CqKDJrdZjl4TuvNFiEX4pY=;
  b=TK4eXyWNFK2Qlmo/le7zKN/+B7XAyPZ9lM/Da2YkCfal+W2TFo3cbWMj
   XIhSakRmOVIBOjLriou/KjSRQqfshk5mBdrdMEG5I36WYWR4+zLPoo3Jz
   88cRy4Qf8Hi+rlRKAnkMM8dCmk14zFyN/zUkG6MRT2VmcmnJNOLZZzs5q
   4lvpZncHw2ZPI7Nba30/ofTMfcKvEB0TE1ThHz+frNNQv4Klg5LRd4/m7
   JqN6lOsC5JUZbDpHWWSdYhU4Vm/1djNJhHlHSkRK1gc+0P7tjDdO3PAQS
   jn5inS5yxRkrcV/6Kahc8rf4MSSnpwQc3TATFykvxbh65lDg8nIl6RWqR
   g==;
X-CSE-ConnectionGUID: p0ttIOkDSIK1rBjiny17pA==
X-CSE-MsgGUID: 6iLPzmgHT+ekyebB+bE8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70483304"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="70483304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:24:33 -0800
X-CSE-ConnectionGUID: nGLE5ZHrS9CcTGh5aJpusA==
X-CSE-MsgGUID: IIiW073HRz2wFcuaTLmjBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="199087064"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Dec 2025 03:24:32 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVpdu-000000000SN-1IrY;
	Wed, 17 Dec 2025 11:24:30 +0000
Date: Wed, 17 Dec 2025 19:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1944/1944]
 drivers/gpio/gpio-phytium-platform.c:111:2-3: Unneeded semicolon
Message-ID: <202512171920.uSjI3OL3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [1944/1944] gpio: add phytium gpio driver
config: arm64-randconfig-r052-20251217 (https://download.01.org/0day-ci/archive/20251217/202512171920.uSjI3OL3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171920.uSjI3OL3-lkp@intel.com/

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
