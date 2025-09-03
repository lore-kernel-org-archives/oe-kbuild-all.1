Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAB7292B4B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756915423; cv=none; b=OmnOnVsyaalnHr2pk/4oE/tbr7oWyoLg9hMu5XHbYtamajFVjyybcYKAGj9cjReZUBmjVHHIHS1rMvst4dAYBRnb3hu3mCLK0TryFSzTOoHhIuAoTHz5KOaW6xc9nHGsu8ZAo96eyr2iaePrYdMBczotEngMKsvzBB9aSzA6TtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756915423; c=relaxed/simple;
	bh=wkhP7pV3dqRhxx3EJElQgifFuS0YqJgJDKYyZYWbXs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WcOw4id09u/faCPICfIIdkWw+beBjCDL5TAyMfZcEhixXGtbvLEcUbuYwoKwV/dNuYzDaKpZvSYZFYnRoIP2PlJT5TwYRkx0FNl0LCSOtNoeaBKPW9cZdT8OWGZ+jOM6Gd0o67b2UQ+yoEsU7rUW/r2xnmbKLTdJOfrDzrMYr8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nH2gy1Hw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nH2gy1Hw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756915422; x=1788451422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wkhP7pV3dqRhxx3EJElQgifFuS0YqJgJDKYyZYWbXs4=;
  b=nH2gy1Hw6v8Fpb5doOkUZwswerjGOGcnI5xLME6+v/I6NkiG8xoenZg2
   q05L/L5YlQdJAe3cOyRcGq72qQu+tQoa2KS2kmvBNot37K1w4k/cA5yse
   nLEy6YeUIi2+BAGu4fo5cFl/hV8U7hJS5wgEK6Ts9wUz3b5AKx5y6wfyK
   74VmkvGC4Lzx5CHDXHQW/ZoYcCfMHR1RZjvMKTWElvbUKf3/jthvJI+LL
   XyzSoqY6/D46hVIYqxoU+QHD9kasMSPrUc7Bz52/NulwnF9ycV5xED3xD
   P/xDqY1yj2ptptaGeVtlrLDD7jX34/8gtImcUV9Qv+uejqiu6dXeNPdNc
   A==;
X-CSE-ConnectionGUID: IpgtyjVqTV6phJdwqt3QRg==
X-CSE-MsgGUID: L99Zm3zrQfO/EpfpZIRW6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59302859"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59302859"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 09:03:41 -0700
X-CSE-ConnectionGUID: O5r05jP1QjKxdCZJx8T6FQ==
X-CSE-MsgGUID: G4RLr6BCT560fWhTzLi7TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176908590"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Sep 2025 09:03:40 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utpxR-00046t-1J;
	Wed, 03 Sep 2025 16:03:37 +0000
Date: Thu, 4 Sep 2025 00:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Job Sava <jsava@criticallink.com>
Subject: [lee-mfd:ib-mfd-input-6.18 2/3] drivers/mfd/tps6594-core.c:753:7:
 error: implicit declaration of function 'FIELD_GET'
Message-ID: <202509032356.LGa5hygM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/d7/d766ca01c208bdf0f36098607efe1e250ccf41c5-first_error_kconfig --flag create-dir

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-input-6.18
head:   2215a87b02ad8d353cd3edebd1bed01db2458986
commit: d766ca01c208bdf0f36098607efe1e250ccf41c5 [2/3] mfd: tps6594: Add power button functionality
config: arc-randconfig-002-20250903 (https://download.01.org/0day-ci/archive/20250903/202509032356.LGa5hygM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509032356.LGa5hygM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509032356.LGa5hygM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/tps6594-core.c: In function 'tps6594_device_init':
>> drivers/mfd/tps6594-core.c:753:7: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      if (FIELD_GET(TPS65224_MASK_EN_PB_VSENSE_CONFIG, pwr_on) == TPS65224_EN_SEL_PB ||
          ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +753 drivers/mfd/tps6594-core.c

   690	
   691	int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
   692	{
   693		struct device *dev = tps->dev;
   694		int ret;
   695		struct regmap_irq_chip *irq_chip;
   696		unsigned int pwr_on, gpio3_cfg;
   697		const struct mfd_cell *cells;
   698		int n_cells;
   699	
   700		if (enable_crc) {
   701			ret = tps6594_enable_crc(tps);
   702			if (ret)
   703				return dev_err_probe(dev, ret, "Failed to enable CRC\n");
   704		}
   705	
   706		/* Keep PMIC in ACTIVE state */
   707		ret = regmap_set_bits(tps->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
   708				      TPS6594_BIT_NSLEEP1B | TPS6594_BIT_NSLEEP2B);
   709		if (ret)
   710			return dev_err_probe(dev, ret, "Failed to set PMIC state\n");
   711	
   712		if (tps->chip_id == TPS65224) {
   713			irq_chip = &tps65224_irq_chip;
   714			n_cells = ARRAY_SIZE(tps65224_common_cells);
   715			cells = tps65224_common_cells;
   716		} else if (tps->chip_id == TPS652G1) {
   717			irq_chip = &tps652g1_irq_chip;
   718			n_cells = ARRAY_SIZE(tps652g1_common_cells);
   719			cells = tps652g1_common_cells;
   720		} else {
   721			irq_chip = &tps6594_irq_chip;
   722			n_cells = ARRAY_SIZE(tps6594_common_cells);
   723			cells = tps6594_common_cells;
   724		}
   725	
   726		irq_chip->irq_drv_data = tps;
   727		irq_chip->name = devm_kasprintf(dev, GFP_KERNEL, "%s-%ld-0x%02x",
   728						dev->driver->name, tps->chip_id, tps->reg);
   729	
   730		if (!irq_chip->name)
   731			return -ENOMEM;
   732	
   733		ret = devm_regmap_add_irq_chip(dev, tps->regmap, tps->irq, IRQF_SHARED | IRQF_ONESHOT,
   734					       0, irq_chip, &tps->irq_data);
   735		if (ret)
   736			return dev_err_probe(dev, ret, "Failed to add regmap IRQ\n");
   737	
   738		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, n_cells, NULL, 0,
   739					   regmap_irq_get_domain(tps->irq_data));
   740		if (ret)
   741			return dev_err_probe(dev, ret, "Failed to add common child devices\n");
   742	
   743		/* If either the PB/EN/VSENSE or GPIO3 is configured as PB, register a driver for it */
   744		if (tps->chip_id == TPS65224 || tps->chip_id == TPS652G1) {
   745			ret = regmap_read(tps->regmap, TPS6594_REG_NPWRON_CONF, &pwr_on);
   746			if (ret)
   747				return dev_err_probe(dev, ret, "Failed to read PB/EN/VSENSE config\n");
   748	
   749			ret = regmap_read(tps->regmap, TPS6594_REG_GPIOX_CONF(2), &gpio3_cfg);
   750			if (ret)
   751				return dev_err_probe(dev, ret, "Failed to read GPIO3 config\n");
   752	
 > 753			if (FIELD_GET(TPS65224_MASK_EN_PB_VSENSE_CONFIG, pwr_on) == TPS65224_EN_SEL_PB ||
   754			    FIELD_GET(TPS65224_MASK_GPIO_SEL, gpio3_cfg) == TPS65224_GPIO3_SEL_PB) {
   755				ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
   756							   &tps6594_pwrbutton_cell, 1, NULL, 0,
   757							   regmap_irq_get_domain(tps->irq_data));
   758				if (ret)
   759					return dev_err_probe(dev, ret,
   760							     "Failed to add power button device.\n");
   761			}
   762		}
   763	
   764		/* No RTC for LP8764, TPS65224 and TPS652G1 */
   765		if (tps->chip_id != LP8764 && tps->chip_id != TPS65224 && tps->chip_id != TPS652G1) {
   766			ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, tps6594_rtc_cells,
   767						   ARRAY_SIZE(tps6594_rtc_cells), NULL, 0,
   768						   regmap_irq_get_domain(tps->irq_data));
   769			if (ret)
   770				return dev_err_probe(dev, ret, "Failed to add RTC child device\n");
   771		}
   772	
   773		return 0;
   774	}
   775	EXPORT_SYMBOL_GPL(tps6594_device_init);
   776	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
