Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7E91ADC97
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785601183; cv=none; b=QnhNMy8Cr3RB4xcQTzkl3Dn71E5qpoAt31iMKv+HClVJUi7ZWZGoM2ZdHiJrpThczxM2VKmCOGMuqMKrbiTTk6jS1EKSME0PqpQik7cDf6i1zxMzkZxyC9Uxv1XXovT15CCwxnSrfjMj5ntpVjL1noLVn0XLA/T12FdHwr2EkZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785601183; c=relaxed/simple;
	bh=NhB2VK1zlceR0xr6z5K5brc8gsub0Rci3q2B+HWaFBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RAzJm1+63LCj+3ITcFTIMPS41upO2eubW35ZUDmbifQYj+aAw33ifKPsYILDtZSuSjuvGHKHic+KQ2f3zpgu3DWr1skWsgEd5xTl4Z9qgE2DG3Up3d/5ugqd/u8mjpMmJcDfxOljqpMcf7krRn+jyVJVe8yuNh8aPTWj4emzDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rg8eT/T1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rg8eT/T1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785601180; x=1817137180;
  h=date:from:to:cc:subject:message-id;
  bh=NhB2VK1zlceR0xr6z5K5brc8gsub0Rci3q2B+HWaFBk=;
  b=Rg8eT/T1MNPnsuCdDcO9Kil/YJD58Hg6fkw18JnJQBzUo4En5piIGq6b
   YOQT1KtYK/xlGxuzt5KEeQwa9ZdbeBcTncBtnGqeWLu8na4RniunHyV45
   GVNEwHdfci6S1JWex8G/ktWROUq6Eco8wUK4aPk9QJiFdwH5a8RhZtGEv
   fISc+1zZX1u0fOKNFxgX9zFYOmQ72um4O5GL0Kddr8PjAhTE0RDyIYbyc
   pGnSyDuKV0wYAMQqic+CKNX2V3tzxftLrSEJYh7eLsYUBdhVoZ1Ld6pqF
   Ox0dOFXOKXXCAng/zt3NDuYazsRGo/6GnluyYRnWbU1CU4uk4XfJMFZiw
   g==;
X-CSE-ConnectionGUID: ZHmvuCraQIuW83QQnY7z9Q==
X-CSE-MsgGUID: Eo+Kc2pbSy2CWyjuqSjpKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86077509"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="86077509"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 09:19:40 -0700
X-CSE-ConnectionGUID: +bVlRvOqRzC/uF6E0FFF0g==
X-CSE-MsgGUID: vhbfCze3TTic17pnoq50yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="284202383"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Aug 2026 09:19:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqCQx-000000003aj-3qST;
	Sat, 01 Aug 2026 16:19:35 +0000
Date: Sun, 02 Aug 2026 00:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 344/700]
 drivers/iio/adc/msc313e_sar.c:595:78: warning: passing argument 3 of
 'pinctrl_generic_add_group' discards 'const' qualifier from pointer target
 type
Message-ID: <202608020000.M6LIwh29-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 88c3adc69c81ffc51dcc5902ec2f4b50e72ce948 [344/700] iio: adc: Add driver for mstar SAR
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260802/202608020000.M6LIwh29-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020000.M6LIwh29-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020000.M6LIwh29-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/adc/msc313e_sar.c: In function 'msc313e_sar_probe_pinctrl':
>> drivers/iio/adc/msc313e_sar.c:595:78: warning: passing argument 3 of 'pinctrl_generic_add_group' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     595 |                 ret = pinctrl_generic_add_group(sar->pinctrl_dev, grp->name, &grp->pin,
         |                                                                              ^~~~~~~~~
   In file included from drivers/iio/adc/msc313e_sar.c:25:
   drivers/iio/adc/../../pinctrl/core.h:225:36: note: expected 'int *' but argument is of type 'const int *'
     225 |                               int *gpins, int ngpins, void *data);
         |                               ~~~~~^~~~~
>> drivers/iio/adc/msc313e_sar.c:602:50: warning: passing argument 5 of 'pinmux_generic_add_function' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     602 |                                 &func->group, 1, func);
         |                                                  ^~~~
   In file included from drivers/iio/adc/msc313e_sar.c:27:
   drivers/iio/adc/../../pinctrl/pinmux.h:166:39: note: expected 'void *' but argument is of type 'const struct sar_pinctrl_function *'
     166 |                                 void *data);
         |                                 ~~~~~~^~~~
   drivers/iio/adc/msc313e_sar.c: In function 'msc313e_sar_probe':
>> drivers/iio/adc/msc313e_sar.c:624:20: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     624 |         match_data = of_device_get_match_data(&pdev->dev);
         |                    ^
>> drivers/iio/adc/msc313e_sar.c:737:1: warning: label 'out' defined but not used [-Wunused-label]
     737 | out:
         | ^~~


vim +595 drivers/iio/adc/msc313e_sar.c

   566	
   567	static int msc313e_sar_probe_pinctrl(struct platform_device *pdev,
   568			struct msc313e_sar *sar) {
   569		int i, ret;
   570	
   571		sar->gpio_range.name = "sar";
   572		sar->gpio_range.id = 0;
   573		sar->gpio_range.base = sar->gpiochip.base;
   574		sar->gpio_range.pins = sar->info->rangepins;
   575		sar->gpio_range.npins = sar->info->nrangepins;
   576		sar->gpio_range.gc = &sar->gpiochip;
   577	
   578		sar->pinctrl_desc.name = DRIVER_NAME;
   579		sar->pinctrl_desc.pctlops = &sar_pinctrl_ops;
   580		sar->pinctrl_desc.pmxops = &sar_pinmux_ops;
   581		sar->pinctrl_desc.owner = THIS_MODULE;
   582		sar->pinctrl_desc.pins = sar->info->pins;
   583		sar->pinctrl_desc.npins = sar->info->npins;
   584	
   585		ret = devm_pinctrl_register_and_init(&pdev->dev, &sar->pinctrl_desc, sar,
   586				&sar->pinctrl_dev);
   587	
   588		if (ret) {
   589			dev_err(&pdev->dev, "failed to register pinctrl\n");
   590			return ret;
   591		}
   592	
   593		for (i = 0; i < sar->info->ngroups; i++) {
   594			const struct sar_pinctrl_group *grp = &sar->info->groups[i];
 > 595			ret = pinctrl_generic_add_group(sar->pinctrl_dev, grp->name, &grp->pin,
   596					1, NULL);
   597		}
   598	
   599		for (i = 0; i < ARRAY_SIZE(sar_pinctrl_functions); i++) {
   600			const struct sar_pinctrl_function *func = &sar_pinctrl_functions[i];
   601			ret = pinmux_generic_add_function(sar->pinctrl_dev, func->name,
 > 602					&func->group, 1, func);
   603	
   604		}
   605	
   606		pinctrl_add_gpio_range(sar->pinctrl_dev, &sar->gpio_range);
   607	
   608		ret = pinctrl_enable(sar->pinctrl_dev);
   609		if (ret)
   610			dev_err(&pdev->dev, "failed to enable pinctrl\n");
   611	
   612		return ret;
   613	}
   614	
   615	static int msc313e_sar_probe(struct platform_device *pdev)
   616	{
   617		int ret = 0;
   618		struct mstar_sar_info *match_data;
   619		struct iio_dev *indio_dev;
   620		struct msc313e_sar *sar;
   621		__iomem void *base;
   622		int irq;
   623	
 > 624		match_data = of_device_get_match_data(&pdev->dev);
   625		if (!match_data)
   626			return -EINVAL;
   627	
   628		indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*sar));
   629		if(!indio_dev)
   630			return -ENOMEM;
   631	
   632		sar = iio_priv(indio_dev);
   633	
   634		sar->info = match_data;
   635	
   636		base = devm_platform_ioremap_resource(pdev, 0);
   637		if (IS_ERR(base))
   638			return PTR_ERR(base);
   639	
   640		sar->regmap = devm_regmap_init_mmio(&pdev->dev, base,
   641					&msc313_sar_regmap_config);
   642		if (IS_ERR(sar->regmap)) {
   643			dev_err(&pdev->dev, "failed to register regmap");
   644			return PTR_ERR(sar->regmap);
   645		}
   646	
   647		sar->pmsleep = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "mstar,pmsleep");
   648		if (IS_ERR(sar->pmsleep))
   649			return PTR_ERR(sar->pmsleep);
   650	
   651		sar->field_load = devm_regmap_field_alloc(&pdev->dev, sar->regmap, ctrl_load_field);
   652		sar->field_freerun = devm_regmap_field_alloc(&pdev->dev, sar->regmap, ctrl_freerun_field);
   653		sar->field_analogpd = devm_regmap_field_alloc(&pdev->dev, sar->regmap, ctrl_analogpd_field);
   654		sar->field_start = devm_regmap_field_alloc(&pdev->dev, sar->regmap, ctrl_start_field);
   655		sar->field_digitalpd = devm_regmap_field_alloc(&pdev->dev, sar->regmap, ctrl_digitalpd_field);
   656		sar->field_mode = devm_regmap_field_alloc(&pdev->dev, sar->regmap, ctrl_mode_field);
   657		sar->field_singlech = devm_regmap_field_alloc(&pdev->dev, sar->regmap, ctrl_singlech_field);
   658		sar->field_channel = devm_regmap_field_alloc(&pdev->dev, sar->regmap, ctrl_channel_field);
   659	
   660		sar->field_gpio_en = devm_regmap_field_alloc(&pdev->dev, sar->regmap, gpio_ctrl_en_field);
   661		sar->field_gpio_oen = devm_regmap_field_alloc(&pdev->dev, sar->regmap, gpio_ctrl_oen_field);
   662		sar->field_gpio_value = devm_regmap_field_alloc(&pdev->dev, sar->regmap, gpio_data_value_field);
   663		sar->field_gpio_in = devm_regmap_field_alloc(&pdev->dev, sar->regmap, gpio_data_in_field);
   664		sar->field_vref_ts = devm_regmap_field_alloc(&pdev->dev, sar->regmap, vref_ts_field);
   665	
   666		sar->clk = devm_clk_get(&pdev->dev, "sar_clk");
   667		if (IS_ERR(sar->clk)) {
   668			dev_err(&pdev->dev, "failed to get clk\n");
   669			return PTR_ERR(sar->clk);
   670		}
   671	
   672		irq = of_irq_get_byname(pdev->dev.of_node, "sar");
   673		if (!irq)
   674			return -EINVAL;
   675	
   676		ret = devm_request_irq(&pdev->dev, irq, msc313e_sar_irq, IRQF_SHARED,
   677				dev_name(&pdev->dev), indio_dev);
   678		if (ret)
   679			return ret;
   680	
   681		irq = of_irq_get_byname(pdev->dev.of_node, "wakeup");
   682		if (!irq)
   683			return -EINVAL;
   684	
   685		ret = devm_request_irq(&pdev->dev, irq, msc313e_sar_irq, IRQF_SHARED,
   686				dev_name(&pdev->dev), indio_dev);
   687		if (ret)
   688			return ret;
   689	
   690		sar->wakeirq_gpio = of_irq_get_byname(pdev->dev.of_node, "wakeup_gpio");
   691		if (!sar->wakeirq_gpio)
   692			return -EINVAL;
   693	
   694		ret = devm_request_irq(&pdev->dev, sar->wakeirq_gpio, msc313e_sar_irq, IRQF_SHARED,
   695				dev_name(&pdev->dev), indio_dev);
   696		if (ret)
   697			return ret;
   698	
   699		indio_dev->name = platform_get_device_id(pdev)->name;
   700		indio_dev->dev.parent = &pdev->dev;
   701		indio_dev->dev.of_node = pdev->dev.of_node;
   702		indio_dev->modes = INDIO_DIRECT_MODE;
   703		indio_dev->info = &msc313e_sar_iio_info;
   704		indio_dev->num_channels = ARRAY_SIZE(msc313e_sar_channels);
   705		indio_dev->channels = msc313e_sar_channels;
   706	
   707		platform_set_drvdata(pdev, indio_dev);
   708	
   709		ret = devm_iio_device_register(&pdev->dev, indio_dev);
   710		if (ret)
   711			return ret;
   712	
   713		ret = msc313e_sar_probe_gpio(pdev, sar);
   714		if (ret)
   715			return ret;
   716	
   717		ret = msc313e_sar_probe_pinctrl(pdev, sar);
   718		if (ret)
   719			return ret;
   720	
   721		clk_prepare_enable(sar->clk);
   722	
   723		regmap_write(sar->regmap, REG_SAMPLE_PERIOD, 0x0f);
   724	
   725		regmap_write(sar->regmap, REG_INT_CLR, ~0);
   726		regmap_write(sar->regmap, REG_INT_MASK, 0);
   727	
   728		/* turn the adc on */
   729		regmap_field_write(sar->field_analogpd, 0);
   730		regmap_field_write(sar->field_digitalpd, 0);
   731	
   732		/* set the temp sensor to 2.0v */
   733		regmap_field_write(sar->field_vref_ts, 0);
   734	
   735		device_init_wakeup(&pdev->dev, 1);
   736	
 > 737	out:
   738		return ret;
   739	}
   740	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
