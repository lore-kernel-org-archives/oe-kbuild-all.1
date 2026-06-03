Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45617392C42
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780511640; cv=none; b=ia7YVDQTLVO1cK5iFYiz1Otew4WcJWTg0Su8iWPUUzbFpjRS9vhA2ry8iEuUIujMH/wLLMzDddRdpIum2oCPbE/CJ+HHzizsQe3kGbHlKX1dNOutoeZGoP0aleSv8lt7hhY2NBCMwRi10No68FfiUNeO2Z4D9uwRYSBUA5HKj/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780511640; c=relaxed/simple;
	bh=SQ/gZtG7gqKNVXAVOFgPAGB2aUkp/3Trhj0fWVkJvBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jzlngb3DITjr53Zk+t2F2UgBpLPN7fgsamN9ZqwNagy5RRiHdLUXDEMldgRs81TR3XVpAWRWIGW4ILBDTPkxr4sJRHrXNZLzN9zSHVfzjmG3puOnqL+xyGsSA3Njkr4rgnu1uZaGB5WRfg0VEo2USbleYngZ1+Op88rpKUhegfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xo93WC/j; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xo93WC/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780511637; x=1812047637;
  h=date:from:to:cc:subject:message-id;
  bh=SQ/gZtG7gqKNVXAVOFgPAGB2aUkp/3Trhj0fWVkJvBY=;
  b=Xo93WC/j6c8RFBth192EAyxEc6BBvCSKfIfvckfkS99M6HmhaQrpc4l0
   3Y6Gy4/FAOKe/TFHzhMlAH8p+Q6yBF4T6sMdefyN+P+dY1w+OCIODHPjj
   HaLTMqhwBTYZobr1SKwBaOEAZ7hqc0/YDlmctXqNlEk34aUad2yslX1Dk
   MbHJhsjzEYHuSxdGEjxtjO4PQdQD02AyhNBCoBeyCzOwd/w0JrvBiJc+o
   qk7eWeovy29odRL//JNJ5CnrwOqmuaMV5v6QeefRlE6kDyuSHrj+cEG1s
   GldSvrFhuddQpbYKqVbb0lmSm7D9rC/W/aJuIWiSybWRF5GSlyNSoEIWY
   g==;
X-CSE-ConnectionGUID: j0KLntS2SV6H1tJ1uq7KMQ==
X-CSE-MsgGUID: EGZbZYVNRdmnBgtt91JlaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81459591"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81459591"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 11:33:57 -0700
X-CSE-ConnectionGUID: 5iLWMBJAREuJgX6qhm23hg==
X-CSE-MsgGUID: fxXuUf0SQZSHFi0i4nh84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="244434163"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jun 2026 11:33:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUqPY-00000000Dlc-2hVi;
	Wed, 03 Jun 2026 18:33:52 +0000
Date: Thu, 04 Jun 2026 02:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt2701/mt2701-cs42448.c:305:15: error: variable
 'mt2701_cs42448_card_platform' has initializer but incomplete type
Message-ID: <202606040227.mmpkV4jW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: ceb4319f163402090427779b85c1ddb46b89fb90 [290/290] ASoC: mediatek: mt2701-cs42448: use snd_soc_card_register()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260604/202606040227.mmpkV4jW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040227.mmpkV4jW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040227.mmpkV4jW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:305:15: error: variable 'mt2701_cs42448_card_platform' has initializer but incomplete type
     305 | static struct snd_soc_card_platform mt2701_cs42448_card_platform = {
         |               ^~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:306:10: error: 'struct snd_soc_card_platform' has no member named 'name'
     306 |         .name = "mt2701-cs42448",
         |          ^~~~
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:306:17: warning: excess elements in struct initializer
     306 |         .name = "mt2701-cs42448",
         |                 ^~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:306:17: note: (near initialization for 'mt2701_cs42448_card_platform')
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:307:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
     307 |         .owner = THIS_MODULE,
         |          ^~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:245,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:114,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from sound/soc/mediatek/mt2701/mt2701-cs42448.c:10:
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:307:18: note: in expansion of macro 'THIS_MODULE'
     307 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'mt2701_cs42448_card_platform')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:307:18: note: in expansion of macro 'THIS_MODULE'
     307 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:308:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
     308 |         .driver = {
         |          ^~~~~~
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:308:19: error: extra brace group at end of initializer
     308 |         .driver = {
         |                   ^
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:308:19: note: (near initialization for 'mt2701_cs42448_card_platform')
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:308:19: warning: excess elements in struct initializer
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:308:19: note: (near initialization for 'mt2701_cs42448_card_platform')
   sound/soc/mediatek/mt2701/mt2701-cs42448.c: In function 'mt2701_cs42448_machine_probe':
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:333:45: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     333 |         card = devm_snd_soc_card_alloc(dev, &mt2701_cs42448_card_platform);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             struct snd_soc_card_platform *
   In file included from include/sound/soc.h:1318,
                    from sound/soc/mediatek/mt2701/mt2701-cs42448.c:11:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct snd_soc_card_platform *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/mediatek/mt2701/mt2701-cs42448.c: At top level:
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:305:37: error: storage size of 'mt2701_cs42448_card_platform' isn't known
     305 | static struct snd_soc_card_platform mt2701_cs42448_card_platform = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mt2701_cs42448_card_platform +305 sound/soc/mediatek/mt2701/mt2701-cs42448.c

   304	
 > 305	static struct snd_soc_card_platform mt2701_cs42448_card_platform = {
 > 306		.name = "mt2701-cs42448",
 > 307		.owner = THIS_MODULE,
 > 308		.driver = {
   309			.dai_link = mt2701_cs42448_dai_links,
   310			.num_links = ARRAY_SIZE(mt2701_cs42448_dai_links),
   311			.controls = mt2701_cs42448_controls,
   312			.num_controls = ARRAY_SIZE(mt2701_cs42448_controls),
   313			.dapm_widgets = mt2701_cs42448_asoc_card_dapm_widgets,
   314			.num_dapm_widgets = ARRAY_SIZE(mt2701_cs42448_asoc_card_dapm_widgets),
   315		},
   316	};
   317	
   318	static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
   319	{
   320		struct snd_soc_card *card;
   321		int ret;
   322		int i;
   323		struct device_node *platform_node, *codec_node, *codec_node_bt_mrg;
   324		struct device *dev = &pdev->dev;
   325		struct mt2701_cs42448_private *priv =
   326			devm_kzalloc(dev, sizeof(struct mt2701_cs42448_private),
   327				     GFP_KERNEL);
   328		struct snd_soc_dai_link *dai_link;
   329	
   330		if (!priv)
   331			return -ENOMEM;
   332	
 > 333		card = devm_snd_soc_card_alloc(dev, &mt2701_cs42448_card_platform);
   334		if (!card)
   335			return -ENOMEM;
   336	
   337		platform_node = of_parse_phandle(pdev->dev.of_node,
   338						 "mediatek,platform", 0);
   339		if (!platform_node) {
   340			dev_err(dev, "Property 'platform' missing or invalid\n");
   341			return -EINVAL;
   342		}
   343		for_each_card_prelinks(card, i, dai_link) {
   344			if (dai_link->platforms->name)
   345				continue;
   346			dai_link->platforms->of_node = platform_node;
   347		}
   348	
   349		codec_node = of_parse_phandle(pdev->dev.of_node,
   350					      "mediatek,audio-codec", 0);
   351		if (!codec_node) {
   352			dev_err(dev,
   353				"Property 'audio-codec' missing or invalid\n");
   354			return -EINVAL;
   355		}
   356		for_each_card_prelinks(card, i, dai_link) {
   357			if (dai_link->codecs->name)
   358				continue;
   359			dai_link->codecs->of_node = codec_node;
   360		}
   361	
   362		codec_node_bt_mrg = of_parse_phandle(pdev->dev.of_node,
   363						     "mediatek,audio-codec-bt-mrg", 0);
   364		if (!codec_node_bt_mrg) {
   365			dev_err(dev,
   366				"Property 'audio-codec-bt-mrg' missing or invalid\n");
   367			return -EINVAL;
   368		}
   369		mt2701_cs42448_dai_links[DAI_LINK_BE_MRG_BT].codecs->of_node
   370								= codec_node_bt_mrg;
   371	
   372		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
   373		if (ret) {
   374			dev_err(dev, "failed to parse audio-routing: %d\n", ret);
   375			return ret;
   376		}
   377	
   378		priv->i2s1_in_mux_sel_1 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio1",
   379								  GPIOD_OUT_LOW);
   380		if (IS_ERR(priv->i2s1_in_mux_sel_1))
   381			return dev_err_probe(dev, PTR_ERR(priv->i2s1_in_mux_sel_1),
   382					     "error getting mux 1 selector\n");
   383	
   384		priv->i2s1_in_mux_sel_2 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio2",
   385								  GPIOD_OUT_LOW);
   386		if (IS_ERR(priv->i2s1_in_mux_sel_2))
   387			return dev_err_probe(dev, PTR_ERR(priv->i2s1_in_mux_sel_2),
   388					     "error getting mux 2 selector\n");
   389	
   390		snd_soc_card_set_drvdata(card, priv);
   391	
   392		ret = devm_snd_soc_card_register(card);
   393	
   394		if (ret)
   395			dev_err(dev, "%s snd_soc_card_register() fail %d\n",
   396				__func__, ret);
   397		return ret;
   398	}
   399	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
