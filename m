Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9623507B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786827331; cv=none; b=T7Fb2PFvisXzb7YKndoGNccb/riMO30D3ua6KgJ0q6cI+Nse5CxEqQbyCl6o0bteg4o2wqJ4KgilsSHPONP+7zNN3EkoTOh+nshbWQSsefqP13TmKkFxnJbvdLclm6gF7Xo48aUL+lyA7xSlG60MIf714ADHMqPj7wnlFGmoDlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786827331; c=relaxed/simple;
	bh=KC+ANRdQ2FVC1HzPV7g/yeNw/06/xO5c3T1dnaZjBoQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EVcNg2iIj+SIBKs2I6jKaArJ86Szf8ZTGd5gy+d+060JBRAdemHVAAM6BDwr3HBMzLka73vS7kBn+97YCbv6usuN135hhT3wSG1Qy8WgWGsA/h34eqV7OzEy2TfNMEnTlfw91/xaaDlUhAvEN//IopG2PWRqO6PeQnAdCS0ZImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbWbeu/w; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbWbeu/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786827329; x=1818363329;
  h=date:from:to:cc:subject:message-id;
  bh=KC+ANRdQ2FVC1HzPV7g/yeNw/06/xO5c3T1dnaZjBoQ=;
  b=CbWbeu/w8qwimq/AyJTqWzg8lCvU5HE5cQ2i1HORSHj6uMWqRKx7LR+C
   jeyJeY53Zv6dAbBPASk4b5ILnkqx0/dpMgR0KNCk5aCJtmzKbDaIvP7xa
   wt0TMyz3iNvsBeY3Ak7ZXzcatdzg7iJl1zw+DPqT//uK5KtzDNg+W+ILG
   wmGS0dLm1FETwiLWUhvTUJe2Jh+tJgk7OQN+kIGxALZVHiO4Qjw6LSmc9
   opc3ztEN+KPgv0v6B2iZEGW9c3OUNBX8cWOlJqqVj9JPQSdTrFd9Do+rI
   4ihCti1at2b4+VjoD2vqq5D6+Dvyd6DJtOGgRYwyfnpthPD1Fu/JnfxDj
   w==;
X-CSE-ConnectionGUID: bRzZpoc4SH6UMPQHw4ZPYw==
X-CSE-MsgGUID: J0hRIxtUQUS8sKHQ/a+FXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87220650"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87220650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 13:55:29 -0700
X-CSE-ConnectionGUID: MEr/8C2qTnCK0ttjc9BpGw==
X-CSE-MsgGUID: 8ji2dVdDQGSEVKSqpONyOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="289342699"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2026 13:55:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvLPX-00000000cTw-3XUS;
	Sat, 15 Aug 2026 20:55:23 +0000
Date: Sun, 16 Aug 2026 04:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 114/217]
 drivers/regulator/da9055-regulator.c:417:33: warning: parameter 'id' set but
 not used
Message-ID: <202608160430.mij1LduH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 158b19afd623da6a93d8ac59dd4aeefe48fa2085 [114/217] mfd: da9055: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608160430.mij1LduH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160430.mij1LduH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160430.mij1LduH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/regulator/da9055-regulator.c:77:26: error: field 'reg_rselect' has incomplete type
      77 |         enum gpio_select reg_rselect;
         |                          ^~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_set_voltage_sel':
   drivers/regulator/da9055-regulator.c:208:39: error: 'NO_GPIO' undeclared (first use in this function)
     208 |         if (regulator->reg_rselect == NO_GPIO) {
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c:208:39: note: each undeclared identifier is reported only once for each function it appears in
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_set_suspend_voltage':
   drivers/regulator/da9055-regulator.c:248:39: error: 'NO_GPIO' undeclared (first use in this function)
     248 |         if (regulator->reg_rselect == NO_GPIO) {
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_enable':
   drivers/regulator/da9055-regulator.c:269:39: error: 'NO_GPIO' undeclared (first use in this function)
     269 |         if (regulator->reg_rselect == NO_GPIO)
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_disable':
   drivers/regulator/da9055-regulator.c:282:39: error: 'NO_GPIO' undeclared (first use in this function)
     282 |         if (regulator->reg_rselect == NO_GPIO)
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_gpio_init':
   drivers/regulator/da9055-regulator.c:466:42: error: 'pdata' undeclared (first use in this function); did you mean '_data'?
     466 |                 regulator->reg_rselect = pdata->reg_rsel[id];
         |                                          ^~~~~
         |                                          _data
>> drivers/regulator/da9055-regulator.c:417:33: warning: parameter 'id' set but not used [-Wunused-but-set-parameter=]
     417 |                             int id)
         |                             ~~~~^~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kcsan-checks.h:14,
                    from include/asm-generic/barrier.h:17,
                    from arch/alpha/include/asm/barrier.h:21,
                    from arch/alpha/include/asm/rwonce.h:10,
                    from include/linux/compiler.h:369,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/regulator/da9055-regulator.c:9:
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_probe':
   include/linux/stddef.h:8:14: error: passing argument 4 of 'da9055_gpio_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/regulator/da9055-regulator.c:534:64: note: in expansion of macro 'NULL'
     534 |         ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
         |                                                                ^~~~
   drivers/regulator/da9055-regulator.c:417:33: note: expected 'int' but argument is of type 'void *'
     417 |                             int id)
         |                             ~~~~^~
   drivers/regulator/da9055-regulator.c:534:15: error: too many arguments to function 'da9055_gpio_init'; expected 4, have 5
     534 |         ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
         |               ^~~~~~~~~~~~~~~~                                       ~~~~~~~~
   drivers/regulator/da9055-regulator.c:414:12: note: declared here
     414 | static int da9055_gpio_init(struct device *dev,
         |            ^~~~~~~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_disable':
>> drivers/regulator/da9055-regulator.c:287:1: warning: control reaches end of non-void function [-Wreturn-type]
     287 | }
         | ^
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_enable':
   drivers/regulator/da9055-regulator.c:274:1: warning: control reaches end of non-void function [-Wreturn-type]
     274 | }
         | ^


vim +/id +417 drivers/regulator/da9055-regulator.c

   275	
   276	static int da9055_suspend_disable(struct regulator_dev *rdev)
   277	{
   278		struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
   279		const struct da9055_regulator_info *info = regulator->info;
   280	
   281		/* Diselect register set B. */
   282		if (regulator->reg_rselect == NO_GPIO)
   283			return da9055_reg_update(regulator->da9055, info->conf.reg,
   284						info->conf.sel_mask, DA9055_SEL_REG_A);
   285		else
   286			return 0;
 > 287	}
   288	
   289	static const struct regulator_ops da9055_buck_ops = {
   290		.get_mode = da9055_buck_get_mode,
   291		.set_mode = da9055_buck_set_mode,
   292	
   293		.get_current_limit = regulator_get_current_limit_regmap,
   294		.set_current_limit = regulator_set_current_limit_regmap,
   295	
   296		.get_voltage_sel = da9055_regulator_get_voltage_sel,
   297		.set_voltage_sel = da9055_regulator_set_voltage_sel,
   298		.list_voltage = regulator_list_voltage_linear,
   299		.map_voltage = regulator_map_voltage_linear,
   300		.is_enabled = regulator_is_enabled_regmap,
   301		.enable = regulator_enable_regmap,
   302		.disable = regulator_disable_regmap,
   303	
   304		.set_suspend_voltage = da9055_regulator_set_suspend_voltage,
   305		.set_suspend_enable = da9055_suspend_enable,
   306		.set_suspend_disable = da9055_suspend_disable,
   307		.set_suspend_mode = da9055_buck_set_mode,
   308	};
   309	
   310	static const struct regulator_ops da9055_ldo_ops = {
   311		.get_mode = da9055_ldo_get_mode,
   312		.set_mode = da9055_ldo_set_mode,
   313	
   314		.get_voltage_sel = da9055_regulator_get_voltage_sel,
   315		.set_voltage_sel = da9055_regulator_set_voltage_sel,
   316		.list_voltage = regulator_list_voltage_linear,
   317		.map_voltage = regulator_map_voltage_linear,
   318		.is_enabled = regulator_is_enabled_regmap,
   319		.enable = regulator_enable_regmap,
   320		.disable = regulator_disable_regmap,
   321	
   322		.set_suspend_voltage = da9055_regulator_set_suspend_voltage,
   323		.set_suspend_enable = da9055_suspend_enable,
   324		.set_suspend_disable = da9055_suspend_disable,
   325		.set_suspend_mode = da9055_ldo_set_mode,
   326	
   327	};
   328	
   329	#define DA9055_LDO(_id, step, min, max, vbits, voffset) \
   330	{\
   331		.reg_desc = {\
   332			.name = #_id,\
   333			.of_match = of_match_ptr(#_id),\
   334			.regulators_node = of_match_ptr("regulators"),\
   335			.ops = &da9055_ldo_ops,\
   336			.type = REGULATOR_VOLTAGE,\
   337			.id = DA9055_ID_##_id,\
   338			.n_voltages = (max - min) / step + 1 + (voffset), \
   339			.enable_reg = DA9055_REG_BCORE_CONT + DA9055_ID_##_id, \
   340			.enable_mask = 1, \
   341			.min_uV = (min) * 1000,\
   342			.uV_step = (step) * 1000,\
   343			.linear_min_sel = (voffset),\
   344			.owner = THIS_MODULE,\
   345		},\
   346		.conf = {\
   347			.reg = DA9055_REG_BCORE_CONT + DA9055_ID_##_id, \
   348			.sel_mask = (1 << 4),\
   349			.en_mask = 1,\
   350		},\
   351		.volt = {\
   352			.reg_a = DA9055_REG_VBCORE_A + DA9055_ID_##_id, \
   353			.reg_b = DA9055_REG_VBCORE_B + DA9055_ID_##_id, \
   354			.sl_shift = 7,\
   355			.v_mask = (1 << (vbits)) - 1,\
   356		},\
   357	}
   358	
   359	#define DA9055_BUCK(_id, step, min, max, vbits, voffset, mbits, sbits) \
   360	{\
   361		.reg_desc = {\
   362			.name = #_id,\
   363			.of_match = of_match_ptr(#_id),\
   364			.regulators_node = of_match_ptr("regulators"),\
   365			.ops = &da9055_buck_ops,\
   366			.type = REGULATOR_VOLTAGE,\
   367			.id = DA9055_ID_##_id,\
   368			.n_voltages = (max - min) / step + 1 + (voffset), \
   369			.enable_reg = DA9055_REG_BCORE_CONT + DA9055_ID_##_id, \
   370			.enable_mask = 1,\
   371			.min_uV = (min) * 1000,\
   372			.uV_step = (step) * 1000,\
   373			.linear_min_sel = (voffset),\
   374			.owner = THIS_MODULE,\
   375			.curr_table = da9055_current_limits,\
   376			.n_current_limits = ARRAY_SIZE(da9055_current_limits),\
   377			.csel_reg = DA9055_REG_BUCK_LIM,\
   378			.csel_mask = (mbits),\
   379		},\
   380		.conf = {\
   381			.reg = DA9055_REG_BCORE_CONT + DA9055_ID_##_id, \
   382			.sel_mask = (1 << 4),\
   383			.en_mask = 1,\
   384		},\
   385		.volt = {\
   386			.reg_a = DA9055_REG_VBCORE_A + DA9055_ID_##_id, \
   387			.reg_b = DA9055_REG_VBCORE_B + DA9055_ID_##_id, \
   388			.sl_shift = 7,\
   389			.v_mask = (1 << (vbits)) - 1,\
   390		},\
   391		.mode = {\
   392			.reg = DA9055_REG_BCORE_MODE,\
   393			.mask = (mbits),\
   394			.shift = (sbits),\
   395		},\
   396	}
   397	
   398	static const struct da9055_regulator_info da9055_regulator_info[] = {
   399		DA9055_BUCK(BUCK1, 25, 725, 2075, 6, 9, 0xc, 2),
   400		DA9055_BUCK(BUCK2, 25, 925, 2500, 6, 0, 3, 0),
   401		DA9055_LDO(LDO1, 50, 900, 3300, 6, 2),
   402		DA9055_LDO(LDO2, 50, 900, 3300, 6, 3),
   403		DA9055_LDO(LDO3, 50, 900, 3300, 6, 2),
   404		DA9055_LDO(LDO4, 50, 900, 3300, 6, 2),
   405		DA9055_LDO(LDO5, 50, 900, 2750, 6, 2),
   406		DA9055_LDO(LDO6, 20, 900, 3300, 7, 0),
   407	};
   408	
   409	/*
   410	 * Configures regulator to be controlled either through GPIO 1 or 2.
   411	 * GPIO can control regulator state and/or select the regulator register
   412	 * set A/B for voltage ramping.
   413	 */
   414	static int da9055_gpio_init(struct device *dev,
   415				    struct da9055_regulator *regulator,
   416				    struct regulator_config *config,
 > 417				    int id)
   418	{
   419		const struct da9055_regulator_info *info = regulator->info;
   420		struct gpio_desc *ren;
   421		struct gpio_desc *ena;
   422		struct gpio_desc *rsel;
   423		int ret = 0;
   424	
   425		/* Look for "regulator-enable-gpios" GPIOs in the regulator node */
   426		ren = devm_gpiod_get_optional(dev, "regulator-enable", GPIOD_IN);
   427		if (IS_ERR(ren))
   428			return PTR_ERR(ren);
   429	
   430		if (ren) {
   431			/* This GPIO is not optional at this point */
   432			ena = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
   433			if (IS_ERR(ena))
   434				return PTR_ERR(ena);
   435	
   436			config->ena_gpiod = ena;
   437	
   438			/*
   439			 * GPI pin is muxed with regulator to control the
   440			 * regulator state.
   441			 */
   442			gpiod_set_consumer_name(ren, "DA9055 ren GPI");
   443	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
