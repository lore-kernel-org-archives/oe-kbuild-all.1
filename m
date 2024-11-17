Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28716179BC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731869169; cv=none; b=Lwe1SRd6ziWHsawdklKnWzdlBQNdHm0fyQhzahzE6b1tDqKiGUGd8xMvD4PldVxw97fVPdc3/ZthYu70cI+J6LaLNjWa3DRl5h6AHbeqV77FjuJNOazUWAzRiPJ+8aWZ8JXz9Br63UCkphn06dTSNFqI0BHPtFLlJDh1vNGMVaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731869169; c=relaxed/simple;
	bh=3wflOag678taWKHyxDtcvPlsCsRGJAbmy2afEVeBWas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QzNA+Az7efDkdmD6YnNymUIliXfWPuLQHz7N9I0jjatXvoLrVB3kSSSB9we3FtlV3vdnCMb5NoPq+5CCKwjcRiC8c1ZcxCdZWWa8J+gORvG8i7tjoDFcFXnfurh2mHFfZG5vXv0xXywK+qlSi7W/brQ7vl4cAloHWWHTTmAlO5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjkqmNQl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjkqmNQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731869168; x=1763405168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3wflOag678taWKHyxDtcvPlsCsRGJAbmy2afEVeBWas=;
  b=UjkqmNQlMQ1ZSJctIC+Yz43OQkz1JYfcPOtdvwz8hm1gcJvlWQocs+W5
   4Z9CDk1/gpNXXF7bDB0ht2HooPlb8cS/nMD9+vJ5itKfukvz1k+0m/ISI
   eccj4slAZcx5NXq/TsN/37fLW8EAnI4A3W477istANUnXoiaU1qD3GgCM
   16ye7mO14R7JtUGqMYqW12Vb5Nv+gYCQTMnEJ9GeJPlWJ2FH+zkS3jSnp
   ZObq1tRP4lEPA3sZzD/8jDPTTt+Xa4PStV/bStEkc0sY8XJkgitkDEMWu
   SyRd0bF7EVdia7NaL6msLzP/fXUnBBrhISN7EX356Z66lMc8brHH5MBIS
   A==;
X-CSE-ConnectionGUID: LLCotv5sSrOG0O41pSh5BQ==
X-CSE-MsgGUID: nhuyZGMZQ9S0CIAkqI9fBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42449363"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="42449363"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 10:46:07 -0800
X-CSE-ConnectionGUID: MPuEKbijTGeuUgqlzEiFAw==
X-CSE-MsgGUID: BS+HC8YJTPao4UowgiWcgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="88792280"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2024 10:46:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCkHc-000207-0a;
	Sun, 17 Nov 2024 18:46:04 +0000
Date: Mon, 18 Nov 2024 02:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297]
 drivers/gpio/gpio-phytium-pci.c:52:23: sparse: sparse: incompatible types
 for operation (<):
Message-ID: <202411180247.fYG6VoE2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4c37b6449701a1fcb16050d4e517fa6d505673e1
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [1297/1297] gpio: add phytium gpio driver
config: x86_64-randconfig-r121-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180247.fYG6VoE2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180247.fYG6VoE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180247.fYG6VoE2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpio/gpio-phytium-pci.c: note: in included file (through include/linux/kernel.h, include/linux/interrupt.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/gpio/gpio-phytium-pci.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/interrupt.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/gpio/gpio-phytium-pci.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> drivers/gpio/gpio-phytium-pci.c:52:23: sparse: sparse: incompatible types for operation (<):
   drivers/gpio/gpio-phytium-pci.c:52:23: sparse:    int *
   drivers/gpio/gpio-phytium-pci.c:52:23: sparse:    int

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
