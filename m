Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C773D9DD4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291379; cv=none; b=sTxLVtrZ5hVEMSbu96JspIO5K5740F2JEXI9bkvIZSyJxa2k+kRoOhcH3dOEisoA0o9PpxosbEZR/1dTP1rfSzIsjS0PuKl+zVXkup2eQLt5m6xVcTLdcHndMIdlRNe9UzRIfwOGqOHEiria4wVfW02c3RVytG3X87oechrtJ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291379; c=relaxed/simple;
	bh=cxLvc/lueqq7hfW58eTf46Kkuc9rgF5X9KLKzvqHolc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k8/tnqlUtvux9UCEbWp5jxirhpLmVnRjHa1yuYANUptUarOk53r9S60i927CnK3Rjim5O11im+Dpko+RtKCIj+YShhd+HCxwfnlernlRisYCp6JPcIgiaa1PA/Md078v5MBbepKWWc1dkgV8xHA+JTrTH2w4PhPbjPv0JfMo8NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qo3puVGY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qo3puVGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784291377; x=1815827377;
  h=date:from:to:cc:subject:message-id;
  bh=cxLvc/lueqq7hfW58eTf46Kkuc9rgF5X9KLKzvqHolc=;
  b=Qo3puVGYdNy79ZRwRz8WoGcN2Fbd4JmkuqrXO7louXbyz2Np3NDtmlBL
   3BwBArc6dMLqxHMnJyTbKb/Ew8XL3swLN/1L8ieM1UuVENMjs+lsG/bCH
   mXgq5D+1FiJnQDFRG/SnizjbNb6f54/nRC4pQbHyrxjQ2g6eh1m+5/7ZG
   hpScxpNma19Aq64FmAdB5aYzMGjlZg6KDCE7s8SoTaqI/s95EkEM5Nq68
   vECQvGR7EUUFJn4KqIJbrO/PlWpmSVzyx0g2e2gR+AyN47h9jp9TCScPP
   KzDRDZC8cq1UAE4Sjipx556BpjPwj0FrRnwXb5//FdE7a5Po4UbpASxdJ
   A==;
X-CSE-ConnectionGUID: fMRx73RiQy60ycEmGtnsCA==
X-CSE-MsgGUID: Uj75E/2vTYy2Mi87tndYEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102514019"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="102514019"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:29:36 -0700
X-CSE-ConnectionGUID: 2kOG2d+WTyOhHJWt6/B0XA==
X-CSE-MsgGUID: wZLhLZcHQTKL69a+ZzRnHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="252796931"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2026 05:29:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkhh6-00000000SjU-0SuP;
	Fri, 17 Jul 2026 12:29:32 +0000
Date: Fri, 17 Jul 2026 20:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 sound/soc/amd/acp-da7219-max98357a.c:776:9: error: implicit declaration of
 function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'?
Message-ID: <202607172059.Juyh15ue-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: f582a99aba2473d5c49ad8088a35dda42539f6af [311/311] ASoC: soc-card.h: remove compatible definition
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607172059.Juyh15ue-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172059.Juyh15ue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172059.Juyh15ue-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/amd/acp-da7219-max98357a.c: In function 'cz_probe':
>> sound/soc/amd/acp-da7219-max98357a.c:776:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     776 |         snd_soc_card_set_drvdata(card, machine);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
--
   sound/soc/amd/acp-es8336.c: In function 'st_es8336_probe':
>> sound/soc/amd/acp-es8336.c:289:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     289 |         snd_soc_card_set_drvdata(card, machine);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
--
   sound/soc/amd/acp3x-rt5682-max9836.c: In function 'acp3x_probe':
>> sound/soc/amd/acp3x-rt5682-max9836.c:520:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     520 |         snd_soc_card_set_drvdata(card, machine);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
--
   sound/soc/sdw_utils/soc_sdw_utils.c: In function 'asoc_sdw_mc_dailink_exit_loop':
>> sound/soc/sdw_utils/soc_sdw_utils.c:1686:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
    1686 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/sdw_utils/soc_sdw_utils.c:1686:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   sound/soc/sdw_utils/soc_sdw_rt711.c: In function 'asoc_sdw_rt711_exit':
>> sound/soc/sdw_utils/soc_sdw_rt711.c:118:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     118 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/sdw_utils/soc_sdw_rt711.c:118:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/sdw_utils/soc_sdw_rt711.c: In function 'asoc_sdw_rt711_init':
   sound/soc/sdw_utils/soc_sdw_rt711.c:135:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     135 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c: In function 'asoc_sdw_rt_sdca_jack_exit':
>> sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c:178:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     178 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c:178:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c: In function 'asoc_sdw_rt_sdca_jack_init':
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c:199:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     199 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/sdw_utils/soc_sdw_rt_amp.c: In function 'asoc_sdw_rt_amp_exit':
>> sound/soc/sdw_utils/soc_sdw_rt_amp.c:254:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     254 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/sdw_utils/soc_sdw_rt_amp.c:254:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/sdw_utils/soc_sdw_rt_amp.c: In function 'asoc_sdw_rt_amp_init':
   sound/soc/sdw_utils/soc_sdw_rt_amp.c:275:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     275 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c: In function 'asoc_sdw_bridge_cs35l56_add_sidecar':
>> sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c:122:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     122 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c:122:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c: In function 'asoc_sdw_bridge_cs35l56_spk_init':
   sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c:145:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     145 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/sdw_utils/soc_sdw_es9356.c: In function 'asoc_sdw_es9356_exit':
>> sound/soc/sdw_utils/soc_sdw_es9356.c:175:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     175 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/sdw_utils/soc_sdw_es9356.c:175:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/sdw_utils/soc_sdw_es9356.c: In function 'asoc_sdw_es9356_init':
   sound/soc/sdw_utils/soc_sdw_es9356.c:192:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     192 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/intel/boards/sof_es8336.c: In function 'sof_es8336_probe':
>> sound/soc/intel/boards/sof_es8336.c:768:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     768 |         snd_soc_card_set_drvdata(card, priv);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
--
   sound/soc/intel/boards/sof_pcm512x.c: In function 'sof_audio_probe':
>> sound/soc/intel/boards/sof_pcm512x.c:414:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     414 |         snd_soc_card_set_drvdata(card, ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
..


vim +776 sound/soc/amd/acp-da7219-max98357a.c

c183fec10ae6b3 Akshu Agrawal        2018-07-25  746  
608a300fc1f0e0 Akshu Agrawal        2018-02-16  747  static int cz_probe(struct platform_device *pdev)
608a300fc1f0e0 Akshu Agrawal        2018-02-16  748  {
608a300fc1f0e0 Akshu Agrawal        2018-02-16  749  	int ret;
608a300fc1f0e0 Akshu Agrawal        2018-02-16  750  	struct snd_soc_card *card;
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  751  	struct snd_soc_card_driver *card_driver;
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  752  	struct acp_platform_info *machine;
c183fec10ae6b3 Akshu Agrawal        2018-07-25  753  	struct regulator_dev *rdev;
7e71b48f9e27e4 Vijendar Mukunda     2021-03-19  754  	struct device *dev = &pdev->dev;
c183fec10ae6b3 Akshu Agrawal        2018-07-25  755  
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  756  	card = snd_soc_card_alloc(&pdev->dev);
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  757  	card_driver = (struct snd_soc_card_driver *)acp_soc_is_rltk_max(dev);
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  758  	if (!card || !card_driver)
7e71b48f9e27e4 Vijendar Mukunda     2021-03-19  759  		return -ENODEV;
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  760  	if (!strcmp(card_driver->default_name, "acpd7219m98357")) {
c183fec10ae6b3 Akshu Agrawal        2018-07-25  761  		acp_da7219_cfg.dev = &pdev->dev;
c183fec10ae6b3 Akshu Agrawal        2018-07-25  762  		rdev = devm_regulator_register(&pdev->dev, &acp_da7219_desc,
c183fec10ae6b3 Akshu Agrawal        2018-07-25  763  					       &acp_da7219_cfg);
c183fec10ae6b3 Akshu Agrawal        2018-07-25  764  		if (IS_ERR(rdev)) {
c183fec10ae6b3 Akshu Agrawal        2018-07-25  765  			dev_err(&pdev->dev, "Failed to register regulator: %d\n",
7699676081ded2 Akshu Agrawal        2018-07-26  766  				(int)PTR_ERR(rdev));
c183fec10ae6b3 Akshu Agrawal        2018-07-25  767  			return -EINVAL;
c183fec10ae6b3 Akshu Agrawal        2018-07-25  768  		}
7e71b48f9e27e4 Vijendar Mukunda     2021-03-19  769  	}
608a300fc1f0e0 Akshu Agrawal        2018-02-16  770  
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  771  	machine = devm_kzalloc(&pdev->dev, sizeof(struct acp_platform_info),
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  772  			       GFP_KERNEL);
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  773  	if (!machine)
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  774  		return -ENOMEM;
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  775  
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08 @776  	snd_soc_card_set_drvdata(card, machine);
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  777  	ret = devm_snd_soc_card_register(card, card_driver);
608a300fc1f0e0 Akshu Agrawal        2018-02-16  778  	if (ret) {
718693352d8bce Mario Limonciello    2021-07-22  779  		return dev_err_probe(&pdev->dev, ret,
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  780  				"devm_snd_soc_card_register(%s) failed\n",
718693352d8bce Mario Limonciello    2021-07-22  781  				card->name);
608a300fc1f0e0 Akshu Agrawal        2018-02-16  782  	}
198433023ef962 Pierre-Louis Bossart 2021-09-07  783  	acp_bt_uart_enable = !device_property_read_bool(&pdev->dev,
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  784  							"bt-pad-enable");
608a300fc1f0e0 Akshu Agrawal        2018-02-16  785  	return 0;
608a300fc1f0e0 Akshu Agrawal        2018-02-16  786  }
608a300fc1f0e0 Akshu Agrawal        2018-02-16  787  

:::::: The code at line 776 was first introduced by commit
:::::: ccfbb4f5723736bb6f548a319ab97e4c4f8ff2b4 ASoC: amd: dma driver changes for bt i2s instance

:::::: TO: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
