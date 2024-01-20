Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E0F515
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705759124; cv=none; b=YC7ogj/6782l+G8IfR1O5zyUQMX3FuaHnhfbkXjC9v9JCzEb/6c4vYLdESW8u9ETJOR93U8j1mqPZcDETuxzPCvZkVo2izzw6LxPvxL4bFaigTkwvetLoZLsSbwBi0hljQbZo0b9A13cla+F1e/61SmCbIQz7+cNu6roN40TFrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705759124; c=relaxed/simple;
	bh=psdXtLVtAycfvfbsKwADXrIq5sgeShf4Ycfj0e9wKF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ms9oL+UqwbUXcw4u76HS7cKNAc+CFbY54hqUvVDm+0//OpwlqshepMi0+f6aSD2tvVFlNITUrPSD3mlVsaPcN6JYLxYrYW6i8l2lSwWLJtkSAPlQTg6DwxRdkxFZdgErTYDdNcfqoiua5i0bmr4v2yiJf+Y3QBRDAwh+cdF5XUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBZMOmXO; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBZMOmXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705759123; x=1737295123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=psdXtLVtAycfvfbsKwADXrIq5sgeShf4Ycfj0e9wKF4=;
  b=NBZMOmXONfpzbEMIGV2a0cQuApGCXfo3FvKqiqXPjFdvjH6xC9pN7SEq
   GSc3xCmilqfb3tMM/xar4OQiLfGOJX1PBuVC60WsEdj2LYjH68jHHLr/1
   LgqAmUco+CGTma8vJaf9nkts22KlT7I0k84ltIOj+q+uWPBX6SxAKQzvy
   BtM+HelHIFg7l0jQiAhfP090p/iNFOB0hbs2XVwPcdldhJciMbKyu48wJ
   ZYkQENfesKGaOsKkO+Cxo7fnfjkc/n8G1RIP/rRvS6SB2rcU1MBmd8vMK
   kLgWJjNrdtOpzNOcBZCoUkgd95OqLjJg3J5Ljf4Jkdl6qr2CJLbZixR0o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="432115014"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="432115014"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 05:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="778213703"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="778213703"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2024 05:58:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRBrp-000586-3A;
	Sat, 20 Jan 2024 13:58:37 +0000
Date: Sat, 20 Jan 2024 21:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21355/21561]
 drivers/gpio/gpio-phytium-pci.c:52:23: warning: ordered comparison of
 pointer with integer zero
Message-ID: <202401202135.1mqJsBua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d29fbb6f9321a629cbf0ca30f15ce6f333ed7b9
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [21355/21561] gpio: add phytium gpio driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401202135.1mqJsBua-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401202135.1mqJsBua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401202135.1mqJsBua-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-phytium-pci.c: In function 'phytium_gpio_pci_probe':
>> drivers/gpio/gpio-phytium-pci.c:52:23: warning: ordered comparison of pointer with integer zero [-Wextra]
      52 |         if (gpio->irq < 0)
         |                       ^


vim +52 drivers/gpio/gpio-phytium-pci.c

    15	
    16	static int phytium_gpio_pci_probe(struct pci_dev *pdev,
    17			const struct pci_device_id *id)
    18	{
    19		struct device *dev = &pdev->dev;
    20		struct phytium_gpio *gpio;
    21		struct gpio_irq_chip *girq;
    22		int err;
    23	
    24		gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
    25		if (!gpio)
    26			return -ENOMEM;
    27	
    28		err = pcim_enable_device(pdev);
    29		if (err) {
    30			dev_err(dev, "Failed to enable PCI device: err %d\n", err);
    31			goto out;
    32		}
    33	
    34		err = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
    35		if (err) {
    36			dev_err(dev, "Failed to iomap PCI device: err %d\n", err);
    37			goto out;
    38		}
    39	
    40		gpio->regs = pcim_iomap_table(pdev)[0];
    41		if (!gpio->regs) {
    42			dev_err(dev, "Cannot map PCI resource\n");
    43			err = -ENOMEM;
    44			goto out;
    45		}
    46	
    47		err = pci_enable_msi(pdev);
    48		if (err < 0)
    49			goto out;
    50	
    51		gpio->irq[0] = pdev->irq;
  > 52		if (gpio->irq < 0)
    53			dev_warn(dev, "no irq is found.\n");
    54	
    55		/* There is only one group of Pins at the moment. */
    56		gpio->ngpio[0] = NGPIO_MAX;
    57	
    58		/* irq_chip support */
    59		gpio->irq_chip.name = dev_name(dev);
    60		gpio->irq_chip.irq_ack = phytium_gpio_irq_ack;
    61		gpio->irq_chip.irq_mask = phytium_gpio_irq_mask;
    62		gpio->irq_chip.irq_unmask = phytium_gpio_irq_unmask;
    63		gpio->irq_chip.irq_set_type = phytium_gpio_irq_set_type;
    64		gpio->irq_chip.irq_enable = phytium_gpio_irq_enable;
    65		gpio->irq_chip.irq_disable = phytium_gpio_irq_disable;
    66	
    67		raw_spin_lock_init(&gpio->lock);
    68	
    69		gpio->gc.base = -1;
    70		gpio->gc.get_direction = phytium_gpio_get_direction;
    71		gpio->gc.direction_input = phytium_gpio_direction_input;
    72		gpio->gc.direction_output = phytium_gpio_direction_output;
    73		gpio->gc.get = phytium_gpio_get;
    74		gpio->gc.set = phytium_gpio_set;
    75		gpio->gc.ngpio = gpio->ngpio[0] + gpio->ngpio[1];
    76		gpio->gc.label = dev_name(dev);
    77		gpio->gc.parent = dev;
    78		gpio->gc.owner = THIS_MODULE;
    79	
    80		girq = &gpio->gc.irq;
    81		girq->handler = handle_bad_irq;
    82		girq->default_type = IRQ_TYPE_NONE;
    83	
    84		girq->num_parents = 1;
    85		girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
    86					     sizeof(*girq->parents), GFP_KERNEL);
    87		if (!girq->parents)
    88			return -ENOMEM;
    89		girq->parents[0] = gpio->irq[0];
    90		girq->parent_handler = phytium_gpio_irq_handler;
    91	
    92		girq->chip = &gpio->irq_chip;
    93	
    94		err = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
    95		if (err)
    96			goto out;
    97	
    98		dev_info(dev, "Phytium PCI GPIO controller @%pa registered\n",
    99			&gpio->regs);
   100	
   101		pci_set_drvdata(pdev, gpio);
   102	
   103	out:
   104		return err;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
