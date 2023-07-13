Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9F963B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 02:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689217116; x=1720753116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+c6wscr22KV/RVhf2arcl2TjNFk0j01Zqzwlyg6gPjM=;
  b=kDrHYmqWvyEtt2ot0zf4S2gEDWOJ+zK1CuZu8cwdRmmz1dNw9HIxoS6c
   pAfGLKUs/Zor581vNQBxDYaA/bmSEEQZv8fAfbHD/omf9ZKuK3yuruTEQ
   dTArBlFThxNvJVmZBeofxTEr5KZRMEOe0CvyRqtREY4toopcNPAAwpw8Z
   NwVeToI0KQ0kMBzynDQUkKuw42uxkN1otnyov/UVDYoNnU27ohf7elAhC
   eLIELlSftapcMp+4HPY1mFqYWTK7zGSsI7/0RLXpEsMuuSHsdZj+86YBo
   EPnkuwdrvMdkgAX9TRccLmZWxVufU0HNK3ZSpommazWCmLI5mbG6zrwWK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="365096486"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="365096486"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 19:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="721753000"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="721753000"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jul 2023 19:58:32 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJmXH-0006A5-0r;
	Thu, 13 Jul 2023 02:58:31 +0000
Date: Thu, 13 Jul 2023 10:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 101/101]
 drivers/power/supply/twl4030_charger.c:1021:68: error: invalid use of
 undefined type 'struct device_node'
Message-ID: <202307131003.oYFn3AFH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: ac7a2a5947cf0a60d9614031b509c5b65e99f87a [101/101] WIP: Remove of.h include from headers
config: arc-randconfig-r043-20230712 (https://download.01.org/0day-ci/archive/20230713/202307131003.oYFn3AFH-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131003.oYFn3AFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131003.oYFn3AFH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/supply/twl4030_charger.c: In function 'twl4030_bci_parse_dt':
>> drivers/power/supply/twl4030_charger.c:940:13: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
     940 |         if (of_property_read_u32(np, "ti,bb-uvolt", &num) == 0)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c: In function 'twl4030_bci_probe':
>> drivers/power/supply/twl4030_charger.c:1021:27: error: implicit declaration of function 'of_get_compatible_child' [-Werror=implicit-function-declaration]
    1021 |                 phynode = of_get_compatible_child(bci->dev->of_node->parent,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/supply/twl4030_charger.c:1021:68: error: invalid use of undefined type 'struct device_node'
    1021 |                 phynode = of_get_compatible_child(bci->dev->of_node->parent,
         |                                                                    ^~
>> drivers/power/supply/twl4030_charger.c:1027:25: error: implicit declaration of function 'of_node_put' [-Werror=implicit-function-declaration]
    1027 |                         of_node_put(phynode);
         |                         ^~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c: At top level:
>> drivers/power/supply/twl4030_charger.c:1140:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
    1140 |                 .of_match_table = of_match_ptr(twl_bci_of_match),
         |                                   ^~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:1140:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/power/supply/twl4030_charger.c:1140:35: note: (near initialization for 'twl4030_bci_driver.driver.of_match_table')
>> drivers/power/supply/twl4030_charger.c:1140:35: error: initializer element is not constant
   drivers/power/supply/twl4030_charger.c:1140:35: note: (near initialization for 'twl4030_bci_driver.driver.of_match_table')
   cc1: some warnings being treated as errors


vim +1021 drivers/power/supply/twl4030_charger.c

2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   925  
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   926  #ifdef CONFIG_OF
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   927  static const struct twl4030_bci_platform_data *
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   928  twl4030_bci_parse_dt(struct device *dev)
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   929  {
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   930  	struct device_node *np = dev->of_node;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   931  	struct twl4030_bci_platform_data *pdata;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   932  	u32 num;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   933  
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   934  	if (!np)
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   935  		return NULL;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   936  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   937  	if (!pdata)
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   938  		return pdata;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   939  
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  @940  	if (of_property_read_u32(np, "ti,bb-uvolt", &num) == 0)
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   941  		pdata->bb_uvolt = num;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   942  	if (of_property_read_u32(np, "ti,bb-uamp", &num) == 0)
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   943  		pdata->bb_uamp = num;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   944  	return pdata;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   945  }
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   946  #else
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   947  static inline const struct twl4030_bci_platform_data *
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   948  twl4030_bci_parse_dt(struct device *dev)
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   949  {
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   950  	return NULL;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   951  }
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   952  #endif
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   953  
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   954  static const struct power_supply_desc twl4030_bci_ac_desc = {
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   955  	.name		= "twl4030_ac",
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   956  	.type		= POWER_SUPPLY_TYPE_MAINS,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   957  	.properties	= twl4030_charger_props,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   958  	.num_properties	= ARRAY_SIZE(twl4030_charger_props),
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   959  	.get_property	= twl4030_bci_get_property,
3fb319c2cdcd10f drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-04-14   960  	.set_property	= twl4030_bci_set_property,
3fb319c2cdcd10f drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-04-14   961  	.property_is_writeable	= twl4030_bci_property_is_writeable,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   962  };
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   963  
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   964  static const struct power_supply_desc twl4030_bci_usb_desc = {
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   965  	.name		= "twl4030_usb",
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   966  	.type		= POWER_SUPPLY_TYPE_USB,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   967  	.properties	= twl4030_charger_props,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   968  	.num_properties	= ARRAY_SIZE(twl4030_charger_props),
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   969  	.get_property	= twl4030_bci_get_property,
3fb319c2cdcd10f drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-04-14   970  	.set_property	= twl4030_bci_set_property,
3fb319c2cdcd10f drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-04-14   971  	.property_is_writeable	= twl4030_bci_property_is_writeable,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   972  };
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   973  
7396f708b9f1d88 drivers/power/twl4030_charger.c        Pavel Machek         2015-07-30   974  static int twl4030_bci_probe(struct platform_device *pdev)
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   975  {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   976  	struct twl4030_bci *bci;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   977  	const struct twl4030_bci_platform_data *pdata = pdev->dev.platform_data;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   978  	int ret;
28d48f04ead4143 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2011-06-03   979  	u32 reg;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   980  
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23   981  	bci = devm_kzalloc(&pdev->dev, sizeof(*bci), GFP_KERNEL);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   982  	if (bci == NULL)
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   983  		return -ENOMEM;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   984  
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   985  	if (!pdata)
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   986  		pdata = twl4030_bci_parse_dt(&pdev->dev);
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   987  
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   988  	bci->ichg_eoc = 80100; /* Stop charging when current drops to here */
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   989  	bci->ichg_lo = 241000; /* Low threshold */
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   990  	bci->ichg_hi = 500000; /* High threshold */
e4ae537e0482e99 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   991  	bci->ac_cur = 500000; /* 500mA */
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   992  	if (allow_usb)
21ae40404f3ca66 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   993  		bci->usb_cur_target = 500000;  /* 500mA */
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   994  	else
21ae40404f3ca66 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   995  		bci->usb_cur_target = 100000;  /* 100mA */
22d4c33f7335ddf drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   996  	bci->usb_mode = CHARGE_AUTO;
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   997  	bci->ac_mode = CHARGE_AUTO;
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   998  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   999  	bci->dev = &pdev->dev;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1000  	bci->irq_chg = platform_get_irq(pdev, 0);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1001  	bci->irq_bci = platform_get_irq(pdev, 1);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1002  
61a7784efd3c89f drivers/power/twl4030_charger.c        Nishanth Menon       2014-05-28  1003  	platform_set_drvdata(pdev, bci);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1004  
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1005  	INIT_WORK(&bci->work, twl4030_bci_usb_work);
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1006  	INIT_DELAYED_WORK(&bci->current_worker, twl4030_current_worker);
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1007  
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1008  	bci->channel_vac = devm_iio_channel_get(&pdev->dev, "vac");
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1009  	if (IS_ERR(bci->channel_vac)) {
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1010  		ret = PTR_ERR(bci->channel_vac);
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1011  		if (ret == -EPROBE_DEFER)
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1012  			return ret;	/* iio not ready */
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1013  		dev_warn(&pdev->dev, "could not request vac iio channel (%d)",
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1014  			ret);
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1015  		bci->channel_vac = NULL;
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1016  	}
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1017  
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1018  	if (bci->dev->of_node) {
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1019  		struct device_node *phynode;
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1020  
9844fb2e3513112 drivers/power/supply/twl4030_charger.c Johan Hovold         2018-08-27 @1021  		phynode = of_get_compatible_child(bci->dev->of_node->parent,
9844fb2e3513112 drivers/power/supply/twl4030_charger.c Johan Hovold         2018-08-27  1022  						  "ti,twl4030-usb");
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1023  		if (phynode) {
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1024  			bci->usb_nb.notifier_call = twl4030_bci_usb_ncb;
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1025  			bci->transceiver = devm_usb_get_phy_by_node(
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1026  				bci->dev, phynode, &bci->usb_nb);
9844fb2e3513112 drivers/power/supply/twl4030_charger.c Johan Hovold         2018-08-27 @1027  			of_node_put(phynode);
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1028  			if (IS_ERR(bci->transceiver)) {
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1029  				ret = PTR_ERR(bci->transceiver);
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1030  				if (ret == -EPROBE_DEFER)
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1031  					return ret;	/* phy not ready */
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1032  				dev_warn(&pdev->dev, "could not request transceiver (%d)",
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1033  					ret);
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1034  				bci->transceiver = NULL;
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1035  			}
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1036  		}
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1037  	}
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1038  
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1039  	bci->ac = devm_power_supply_register(&pdev->dev, &twl4030_bci_ac_desc,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1040  					     NULL);
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1041  	if (IS_ERR(bci->ac)) {
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1042  		ret = PTR_ERR(bci->ac);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1043  		dev_err(&pdev->dev, "failed to register ac: %d\n", ret);
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1044  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1045  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1046  
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1047  	bci->usb = devm_power_supply_register(&pdev->dev, &twl4030_bci_usb_desc,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1048  					      NULL);
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1049  	if (IS_ERR(bci->usb)) {
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1050  		ret = PTR_ERR(bci->usb);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1051  		dev_err(&pdev->dev, "failed to register usb: %d\n", ret);
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1052  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1053  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1054  
1b7cac23419e139 drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1055  	ret = devm_request_threaded_irq(&pdev->dev, bci->irq_chg, NULL,
a2778b0fe15d7ad drivers/power/twl4030_charger.c        Fengguang Wu         2012-08-23  1056  			twl4030_charger_interrupt, IRQF_ONESHOT, pdev->name,
a2778b0fe15d7ad drivers/power/twl4030_charger.c        Fengguang Wu         2012-08-23  1057  			bci);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1058  	if (ret < 0) {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1059  		dev_err(&pdev->dev, "could not request irq %d, status %d\n",
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1060  			bci->irq_chg, ret);
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1061  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1062  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1063  
1b7cac23419e139 drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1064  	ret = devm_request_threaded_irq(&pdev->dev, bci->irq_bci, NULL,
a2778b0fe15d7ad drivers/power/twl4030_charger.c        Fengguang Wu         2012-08-23  1065  			twl4030_bci_interrupt, IRQF_ONESHOT, pdev->name, bci);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1066  	if (ret < 0) {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1067  		dev_err(&pdev->dev, "could not request irq %d, status %d\n",
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1068  			bci->irq_bci, ret);
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1069  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1070  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1071  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1072  	/* Enable interrupts now. */
28d48f04ead4143 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2011-06-03  1073  	reg = ~(u32)(TWL4030_ICHGLOW | TWL4030_ICHGEOC | TWL4030_TBATOR2 |
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1074  		TWL4030_TBATOR1 | TWL4030_BATSTS);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1075  	ret = twl_i2c_write_u8(TWL4030_MODULE_INTERRUPTS, reg,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1076  			       TWL4030_INTERRUPTS_BCIIMR1A);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1077  	if (ret < 0) {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1078  		dev_err(&pdev->dev, "failed to unmask interrupts: %d\n", ret);
e8847c565421f1c drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1079  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1080  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1081  
28d48f04ead4143 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2011-06-03  1082  	reg = ~(u32)(TWL4030_VBATOV | TWL4030_VBUSOV | TWL4030_ACCHGOV);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1083  	ret = twl_i2c_write_u8(TWL4030_MODULE_INTERRUPTS, reg,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1084  			       TWL4030_INTERRUPTS_BCIIMR2A);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1085  	if (ret < 0)
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1086  		dev_warn(&pdev->dev, "failed to unmask interrupts: %d\n", ret);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1087  
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1088  	twl4030_charger_update_current(bci);
22d4c33f7335ddf drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1089  	if (device_create_file(&bci->usb->dev, &dev_attr_mode))
22d4c33f7335ddf drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1090  		dev_warn(&pdev->dev, "could not create sysfs file\n");
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1091  	if (device_create_file(&bci->ac->dev, &dev_attr_mode))
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1092  		dev_warn(&pdev->dev, "could not create sysfs file\n");
aca3c3546396b30 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1093  
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1094  	twl4030_charger_enable_ac(bci, true);
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1095  	if (!IS_ERR_OR_NULL(bci->transceiver))
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1096  		twl4030_bci_usb_ncb(&bci->usb_nb,
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1097  				    bci->transceiver->last_event,
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1098  				    NULL);
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1099  	else
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1100  		twl4030_charger_enable_usb(bci, false);
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1101  	if (pdata)
210d4bc8a3128e3 drivers/power/twl4030_charger.c        NeilBrown            2012-05-09  1102  		twl4030_charger_enable_backup(pdata->bb_uvolt,
210d4bc8a3128e3 drivers/power/twl4030_charger.c        NeilBrown            2012-05-09  1103  					      pdata->bb_uamp);
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1104  	else
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1105  		twl4030_charger_enable_backup(0, 0);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1106  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1107  	return 0;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1108  }
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1109  
420b2d443b7ee2a drivers/power/supply/twl4030_charger.c Dmitry Torokhov      2017-03-01  1110  static int twl4030_bci_remove(struct platform_device *pdev)
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1111  {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1112  	struct twl4030_bci *bci = platform_get_drvdata(pdev);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1113  
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1114  	twl4030_charger_enable_ac(bci, false);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1115  	twl4030_charger_enable_usb(bci, false);
210d4bc8a3128e3 drivers/power/twl4030_charger.c        NeilBrown            2012-05-09  1116  	twl4030_charger_enable_backup(0, 0);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1117  
22d4c33f7335ddf drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1118  	device_remove_file(&bci->usb->dev, &dev_attr_mode);
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1119  	device_remove_file(&bci->ac->dev, &dev_attr_mode);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1120  	/* mask interrupts */
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1121  	twl_i2c_write_u8(TWL4030_MODULE_INTERRUPTS, 0xff,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1122  			 TWL4030_INTERRUPTS_BCIIMR1A);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1123  	twl_i2c_write_u8(TWL4030_MODULE_INTERRUPTS, 0xff,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1124  			 TWL4030_INTERRUPTS_BCIIMR2A);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1125  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1126  	return 0;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1127  }
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1128  
9e2480d437f99aa drivers/power/supply/twl4030_charger.c Krzysztof Kozlowski  2023-03-11  1129  static const struct of_device_id twl_bci_of_match[] __maybe_unused = {
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1130  	{.compatible = "ti,twl4030-bci", },
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1131  	{ }
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1132  };
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1133  MODULE_DEVICE_TABLE(of, twl_bci_of_match);
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1134  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1135  static struct platform_driver twl4030_bci_driver = {
7396f708b9f1d88 drivers/power/twl4030_charger.c        Pavel Machek         2015-07-30  1136  	.probe = twl4030_bci_probe,
420b2d443b7ee2a drivers/power/supply/twl4030_charger.c Dmitry Torokhov      2017-03-01  1137  	.remove	= twl4030_bci_remove,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1138  	.driver	= {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1139  		.name	= "twl4030_bci",
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31 @1140  		.of_match_table = of_match_ptr(twl_bci_of_match),
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1141  	},
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1142  };
7396f708b9f1d88 drivers/power/twl4030_charger.c        Pavel Machek         2015-07-30  1143  module_platform_driver(twl4030_bci_driver);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1144  

:::::: The code at line 1021 was first introduced by commit
:::::: 9844fb2e351311210e6660a9a1c62d17424a6145 power: supply: twl4030-charger: fix OF sibling-node lookup

:::::: TO: Johan Hovold <johan@kernel.org>
:::::: CC: Rob Herring <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
