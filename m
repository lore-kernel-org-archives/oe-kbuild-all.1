Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DB91DFD96
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 23:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770332977; cv=none; b=kuNlf4RpvpyTJV4aidoxVmP9VzOg5uBsWKQjzBv1FjZe1mT/on64QQLxmLXdtLY0+auhZ55cO6hyrXsBG9G9YnGGg8QfcCwR4N+q6o3j3NyO4MBJQ/RK6NiSTV/bDwIYeQRQGrALp0T/d33C2NPEmWb/hrAXNrjOyInfuAcat6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770332977; c=relaxed/simple;
	bh=j0rru0JnswTlPRpG5ssuA++zqCaFY18hsA7edHs6+Tc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sRfTY14Wd5YdZHoW6l9Jdm8HS2pfYgWjhzFSxUT5ZGBytpJfQeX6ur8I9xb8PgYm7fYLqksT/3JdnFDRE4MCcCjmIbay+raq0ehsJbSCowopD2+Yr0uy5bOugGqqdyZOgralIHDBcpr+bWKyyCrfigXLhQMuGjOsgpxH5TYnWWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrLIcgLI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrLIcgLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770332977; x=1801868977;
  h=date:from:to:cc:subject:message-id;
  bh=j0rru0JnswTlPRpG5ssuA++zqCaFY18hsA7edHs6+Tc=;
  b=YrLIcgLIfHBHXm87+xdtYnBDE1m/Jg5IKAJZkDYqdUX9rouDeZbM3pON
   GEn8LrYZy38F3uRqs489ARVfuw333B9rHXEPbnKMIcUMm7H0ppT2e6YSh
   ZVy0CcrMt07ZkXc9pzf6BcyBd1GqJ8VlkGxGCBe547uzU51NvLk2GDQSB
   fYbwYlCOEFJJTPbH6/YQ0Qdmy6JjVweOEgsY5OyFeMvbxS3+iecn7ibI3
   U/clpBsDsU+hlu4bQlAD0FRao6Lu9ki9bJQkPj3lR2I7L23pCT6agwbKS
   qMXdiJDS54UgokllKxUae03kJ/9iUSsZbbKEtjkxFfxae9+aGVyUzgueV
   g==;
X-CSE-ConnectionGUID: lhNI7Dk5SriItjfEs4qm0Q==
X-CSE-MsgGUID: ifLmAuN1SpChVfbY+pz6OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71536482"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71536482"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 15:09:37 -0800
X-CSE-ConnectionGUID: THZcyvHtSbSnaQsxKwr63g==
X-CSE-MsgGUID: uBhEP59mSnK6YxFEC2E/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="215198412"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Feb 2026 15:09:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo8Td-00000000kHQ-0mWj;
	Thu, 05 Feb 2026 23:09:33 +0000
Date: Fri, 06 Feb 2026 07:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>
Subject: [andi-shyti:i2c/i2c-host-next 16/22]
 drivers/i2c/busses/i2c-tegra.c:1842:82: error: 'struct device' has no member
 named 'pins'
Message-ID: <202602060640.wIEJASR4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   9212e4556711551b00ff86b52f3c6059347ac410
commit: 63004d6fdd24e5df46aaf9a3248d4036a2f5c2be [16/22] i2c: tegra: Don't mark devices with pins as IRQ safe
config: sh-randconfig-r133-20260206 (https://download.01.org/0day-ci/archive/20260206/202602060640.wIEJASR4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060640.wIEJASR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060640.wIEJASR4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-tegra.c: In function 'tegra_i2c_probe':
>> drivers/i2c/busses/i2c-tegra.c:1842:82: error: 'struct device' has no member named 'pins'
    1842 |         if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev) && !i2c_dev->dev->pins)
         |                                                                                  ^~


vim +1842 drivers/i2c/busses/i2c-tegra.c

  1778	
  1779	static int tegra_i2c_probe(struct platform_device *pdev)
  1780	{
  1781		struct tegra_i2c_dev *i2c_dev;
  1782		struct resource *res;
  1783		int err;
  1784	
  1785		i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
  1786		if (!i2c_dev)
  1787			return -ENOMEM;
  1788	
  1789		platform_set_drvdata(pdev, i2c_dev);
  1790	
  1791		init_completion(&i2c_dev->msg_complete);
  1792		init_completion(&i2c_dev->dma_complete);
  1793	
  1794		i2c_dev->hw = device_get_match_data(&pdev->dev);
  1795		i2c_dev->cont_id = pdev->id;
  1796		i2c_dev->dev = &pdev->dev;
  1797	
  1798		i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
  1799		if (IS_ERR(i2c_dev->base))
  1800			return PTR_ERR(i2c_dev->base);
  1801	
  1802		i2c_dev->base_phys = res->start;
  1803	
  1804		err = platform_get_irq(pdev, 0);
  1805		if (err < 0)
  1806			return err;
  1807	
  1808		i2c_dev->irq = err;
  1809	
  1810		/* interrupt will be enabled during of transfer time */
  1811		irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
  1812	
  1813		err = devm_request_threaded_irq(i2c_dev->dev, i2c_dev->irq,
  1814						NULL, tegra_i2c_isr,
  1815						IRQF_NO_SUSPEND | IRQF_ONESHOT,
  1816						dev_name(i2c_dev->dev), i2c_dev);
  1817		if (err)
  1818			return err;
  1819	
  1820		tegra_i2c_parse_dt(i2c_dev);
  1821	
  1822		err = tegra_i2c_init_clocks(i2c_dev);
  1823		if (err)
  1824			return err;
  1825	
  1826		err = tegra_i2c_init_dma(i2c_dev);
  1827		if (err)
  1828			goto release_clocks;
  1829	
  1830		/*
  1831		 * VI I2C is in VE power domain which is not always ON and not
  1832		 * IRQ-safe.  Thus, IRQ-safe device shouldn't be attached to a
  1833		 * non IRQ-safe domain because this prevents powering off the power
  1834		 * domain.
  1835		 *
  1836		 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
  1837		 * be used for atomic transfers. ACPI device is not IRQ safe also.
  1838		 *
  1839		 * Devices with pinctrl states cannot be marked IRQ-safe as the pinctrl
  1840		 * state transitions during runtime PM require mutexes.
  1841		 */
> 1842		if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev) && !i2c_dev->dev->pins)
  1843			pm_runtime_irq_safe(i2c_dev->dev);
  1844	
  1845		pm_runtime_enable(i2c_dev->dev);
  1846	
  1847		err = tegra_i2c_init_hardware(i2c_dev);
  1848		if (err)
  1849			goto release_rpm;
  1850	
  1851		i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
  1852		i2c_dev->adapter.dev.of_node = i2c_dev->dev->of_node;
  1853		i2c_dev->adapter.dev.parent = i2c_dev->dev;
  1854		i2c_dev->adapter.retries = 1;
  1855		i2c_dev->adapter.timeout = 6 * HZ;
  1856		i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
  1857		i2c_dev->adapter.owner = THIS_MODULE;
  1858		i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
  1859		i2c_dev->adapter.algo = &tegra_i2c_algo;
  1860		i2c_dev->adapter.nr = pdev->id;
  1861		ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
  1862	
  1863		if (i2c_dev->hw->supports_bus_clear)
  1864			i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
  1865	
  1866		strscpy(i2c_dev->adapter.name, dev_name(i2c_dev->dev),
  1867			sizeof(i2c_dev->adapter.name));
  1868	
  1869		err = i2c_add_numbered_adapter(&i2c_dev->adapter);
  1870		if (err)
  1871			goto release_rpm;
  1872	
  1873		return 0;
  1874	
  1875	release_rpm:
  1876		pm_runtime_disable(i2c_dev->dev);
  1877	
  1878		tegra_i2c_release_dma(i2c_dev);
  1879	release_clocks:
  1880		tegra_i2c_release_clocks(i2c_dev);
  1881	
  1882		return err;
  1883	}
  1884	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
