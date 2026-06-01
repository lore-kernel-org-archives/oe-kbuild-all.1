Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246A7371056
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 22:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780353013; cv=none; b=aiacHx57UJJMJo8LEtjwW57cX7LvMieUXNSqion5ijIGkuQ3tfgR/hzCwCZS6TJmvkyZeiQb0LfcGIx9qbx/8g1WY24MjmQy5IqATa9tkwMaC9yBLraCgTghE9ZdS/YP3h1YUSV2ZDQoFkYNKvmGwKEFwhGhIE5Wwj+aC4iRLPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780353013; c=relaxed/simple;
	bh=NnrwBH4TDYv7BfWB6evPHfxmZHL7OeZJHpmrJM/fOJQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uGrS9P+//Q7Y+iKI1rY6W9eqSQ3pNSZ7vsNXsZcOwemFHdekSM4BVO4bkDI/nC1GaICBvxVmFD/GmevcojxHHbB2nzJDO6r2Di8qNsZ5BfclB0LxB5wwSMsg/i3RK2iQ1pPDE3Yfr/TjTKadUPnYw9tLdGMheVXPDM70epAy4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXfOD6Jm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXfOD6Jm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780353010; x=1811889010;
  h=date:from:to:cc:subject:message-id;
  bh=NnrwBH4TDYv7BfWB6evPHfxmZHL7OeZJHpmrJM/fOJQ=;
  b=VXfOD6Jm4bPdzlmwaAN7aOckhXJixLaVIez74mBnAZNospXZJXdBrs0S
   VdvCxr6DsUNgANG1M/vAMZ7LVP2j3FaY96ux1xidzIPcFbNGJSj+PxEon
   Qh3yJ46RNg0OLwy0DR4yM8BmR7XWOnXq4cb2j4fzNMYLGy6EOcFZzMg2Q
   1UtJsiE5HC6Q04wsfPWkRD68JsIastOgkOeihkxtXGtGimihnAiVrgTmK
   WgATndnBjq76dhX07egvI9I4HRLsS44jgqz1IYWjYTXL34TqoV8MAoLlt
   cto3u7bAW3gVLIBBvsN2PWJrHTDQDY7ony/1Xcfe6tIDtJhi3uRPkrEYE
   Q==;
X-CSE-ConnectionGUID: HrHldvoaRz2fSDPb6XPo6g==
X-CSE-MsgGUID: fK+bIGbCSXmVpqK2h2BLgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81234512"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81234512"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 15:30:09 -0700
X-CSE-ConnectionGUID: hFy89jJyTrKEHSAWOQHRNQ==
X-CSE-MsgGUID: clqDxqG6TrKjVT3NeEABxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="241203633"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jun 2026 15:30:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUB93-00000000BAU-2dIv;
	Mon, 01 Jun 2026 22:30:05 +0000
Date: Tue, 02 Jun 2026 06:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:814:16: error:
 dereferencing pointer to incomplete type 'struct snd_soc_card_platform'
Message-ID: <202606020607.FIA1pDWg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: ed28abbd2e6483a5c80db1c0d9685e5bc814a275 [290/290] ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: use snd_soc_card_register()
config: arm64-randconfig-002-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020607.FIA1pDWg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020607.FIA1pDWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020607.FIA1pDWg-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:650:10: note: (near initialization for 'mt8183_mt6358_ts3a227_rt1015_card_platform')
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:651:3: error: 'struct snd_soc_card_platform' has no member named 'owner'
     .owner = THIS_MODULE,
      ^~~~~
   In file included from arch/arm64/include/asm/alternative.h:9,
                    from arch/arm64/include/asm/lse.h:12,
                    from arch/arm64/include/asm/cmpxchg.h:14,
                    from arch/arm64/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:67,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from arch/arm64/include/asm/stat.h:12,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:9:
   include/linux/init.h:174:21: warning: excess elements in struct initializer
    #define THIS_MODULE (&__this_module)
                        ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:651:11: note: in expansion of macro 'THIS_MODULE'
     .owner = THIS_MODULE,
              ^~~~~~~~~~~
   include/linux/init.h:174:21: note: (near initialization for 'mt8183_mt6358_ts3a227_rt1015_card_platform')
    #define THIS_MODULE (&__this_module)
                        ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:651:11: note: in expansion of macro 'THIS_MODULE'
     .owner = THIS_MODULE,
              ^~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:652:3: error: 'struct snd_soc_card_platform' has no member named 'driver'
     .driver = {
      ^~~~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:652:12: error: extra brace group at end of initializer
     .driver = {
               ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:652:12: note: (near initialization for 'mt8183_mt6358_ts3a227_rt1015_card_platform')
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:652:12: warning: excess elements in struct initializer
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:652:12: note: (near initialization for 'mt8183_mt6358_ts3a227_rt1015_card_platform')
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:664:15: error: variable 'mt8183_mt6358_ts3a227_rt1015p_card_platform' has initializer but incomplete type
    static struct snd_soc_card_platform mt8183_mt6358_ts3a227_rt1015p_card_platform = {
                  ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:665:3: error: 'struct snd_soc_card_platform' has no member named 'name'
     .name = "mt8183_mt6358_ts3a227_rt1015p",
      ^~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:665:10: warning: excess elements in struct initializer
     .name = "mt8183_mt6358_ts3a227_rt1015p",
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:665:10: note: (near initialization for 'mt8183_mt6358_ts3a227_rt1015p_card_platform')
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:666:3: error: 'struct snd_soc_card_platform' has no member named 'owner'
     .owner = THIS_MODULE,
      ^~~~~
   In file included from arch/arm64/include/asm/alternative.h:9,
                    from arch/arm64/include/asm/lse.h:12,
                    from arch/arm64/include/asm/cmpxchg.h:14,
                    from arch/arm64/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:67,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from arch/arm64/include/asm/stat.h:12,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:9:
   include/linux/init.h:174:21: warning: excess elements in struct initializer
    #define THIS_MODULE (&__this_module)
                        ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:666:11: note: in expansion of macro 'THIS_MODULE'
     .owner = THIS_MODULE,
              ^~~~~~~~~~~
   include/linux/init.h:174:21: note: (near initialization for 'mt8183_mt6358_ts3a227_rt1015p_card_platform')
    #define THIS_MODULE (&__this_module)
                        ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:666:11: note: in expansion of macro 'THIS_MODULE'
     .owner = THIS_MODULE,
              ^~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:667:3: error: 'struct snd_soc_card_platform' has no member named 'driver'
     .driver = {
      ^~~~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:667:12: error: extra brace group at end of initializer
     .driver = {
               ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:667:12: note: (near initialization for 'mt8183_mt6358_ts3a227_rt1015p_card_platform')
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:667:12: warning: excess elements in struct initializer
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:667:12: note: (near initialization for 'mt8183_mt6358_ts3a227_rt1015p_card_platform')
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c: In function 'mt8183_mt6358_ts3a227_max98357_dev_probe':
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:729:45: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     card = devm_snd_soc_card_alloc(&pdev->dev, card_platform);
                                                ^~~~~~~~~~~~~
   In file included from include/sound/soc.h:1318,
                    from sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:14:
   include/sound/soc-card.h:90:22: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct snd_soc_card_platform *'
    struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
                         ^~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:814:16: error: dereferencing pointer to incomplete type 'struct snd_soc_card_platform'
      card_platform->driver.aux_dev = &mt8183_mt6358_ts3a227_max98357_headset_dev;
                   ^~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c: At top level:
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:612:37: error: storage size of 'mt8183_mt6358_ts3a227_max98357_card_platform' isn't known
    static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357_card_platform = {
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:625:37: error: storage size of 'mt8183_mt6358_ts3a227_max98357b_card_platform' isn't known
    static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357b_card_platform = {
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:649:37: error: storage size of 'mt8183_mt6358_ts3a227_rt1015_card_platform' isn't known
    static struct snd_soc_card_platform mt8183_mt6358_ts3a227_rt1015_card_platform = {
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:664:37: error: storage size of 'mt8183_mt6358_ts3a227_rt1015p_card_platform' isn't known
    static struct snd_soc_card_platform mt8183_mt6358_ts3a227_rt1015p_card_platform = {
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +814 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c

   705	
   706	static int
   707	mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
   708	{
   709		struct snd_soc_card *card;
   710		struct snd_soc_card_platform *card_platform;
   711		struct device_node *platform_node, *ec_codec, *hdmi_codec;
   712		struct snd_soc_dai_link *dai_link;
   713		struct mt8183_mt6358_ts3a227_max98357_priv *priv;
   714		int ret, i;
   715	
   716		platform_node = of_parse_phandle(pdev->dev.of_node,
   717						 "mediatek,platform", 0);
   718		if (!platform_node) {
   719			dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
   720			return -EINVAL;
   721		}
   722	
   723		card_platform = (struct snd_soc_card_platform *)of_device_get_match_data(&pdev->dev);
   724		if (!card_platform) {
   725			of_node_put(platform_node);
   726			return -EINVAL;
   727		}
   728	
   729		card = devm_snd_soc_card_alloc(&pdev->dev, card_platform);
   730		if (!card)
   731			return -ENOMEM;
   732	
   733		ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
   734		hdmi_codec = of_parse_phandle(pdev->dev.of_node,
   735					      "mediatek,hdmi-codec", 0);
   736	
   737		for_each_card_prelinks(card, i, dai_link) {
   738			if (ec_codec && strcmp(dai_link->name, "Wake on Voice") == 0) {
   739				dai_link->cpus[0].name = NULL;
   740				dai_link->cpus[0].of_node = ec_codec;
   741				dai_link->cpus[0].dai_name = NULL;
   742				dai_link->codecs[0].name = NULL;
   743				dai_link->codecs[0].of_node = ec_codec;
   744				dai_link->codecs[0].dai_name = "Wake on Voice";
   745				dai_link->platforms[0].of_node = ec_codec;
   746				dai_link->ignore = 0;
   747			}
   748	
   749			if (strcmp(dai_link->name, "I2S3") == 0) {
   750				if (card_platform == &mt8183_mt6358_ts3a227_max98357_card_platform ||
   751				    card_platform == &mt8183_mt6358_ts3a227_max98357b_card_platform) {
   752					dai_link->be_hw_params_fixup =
   753						mt8183_i2s_hw_params_fixup;
   754					dai_link->ops = &mt8183_mt6358_i2s_ops;
   755					dai_link->cpus = i2s3_max98357a_cpus;
   756					dai_link->num_cpus =
   757						ARRAY_SIZE(i2s3_max98357a_cpus);
   758					dai_link->codecs = i2s3_max98357a_codecs;
   759					dai_link->num_codecs =
   760						ARRAY_SIZE(i2s3_max98357a_codecs);
   761					dai_link->platforms = i2s3_max98357a_platforms;
   762					dai_link->num_platforms =
   763						ARRAY_SIZE(i2s3_max98357a_platforms);
   764				} else if (card_platform == &mt8183_mt6358_ts3a227_rt1015_card_platform) {
   765					dai_link->be_hw_params_fixup =
   766						mt8183_rt1015_i2s_hw_params_fixup;
   767					dai_link->ops = &mt8183_mt6358_rt1015_i2s_ops;
   768					dai_link->cpus = i2s3_rt1015_cpus;
   769					dai_link->num_cpus =
   770						ARRAY_SIZE(i2s3_rt1015_cpus);
   771					dai_link->codecs = i2s3_rt1015_codecs;
   772					dai_link->num_codecs =
   773						ARRAY_SIZE(i2s3_rt1015_codecs);
   774					dai_link->platforms = i2s3_rt1015_platforms;
   775					dai_link->num_platforms =
   776						ARRAY_SIZE(i2s3_rt1015_platforms);
   777				} else if (card_platform == &mt8183_mt6358_ts3a227_rt1015p_card_platform) {
   778					dai_link->be_hw_params_fixup =
   779						mt8183_rt1015_i2s_hw_params_fixup;
   780					dai_link->ops = &mt8183_mt6358_i2s_ops;
   781					dai_link->cpus = i2s3_rt1015p_cpus;
   782					dai_link->num_cpus =
   783						ARRAY_SIZE(i2s3_rt1015p_cpus);
   784					dai_link->codecs = i2s3_rt1015p_codecs;
   785					dai_link->num_codecs =
   786						ARRAY_SIZE(i2s3_rt1015p_codecs);
   787					dai_link->platforms = i2s3_rt1015p_platforms;
   788					dai_link->num_platforms =
   789						ARRAY_SIZE(i2s3_rt1015p_platforms);
   790				}
   791			}
   792	
   793			if (card_platform == &mt8183_mt6358_ts3a227_max98357b_card_platform) {
   794				if (strcmp(dai_link->name, "I2S2") == 0 ||
   795				    strcmp(dai_link->name, "I2S3") == 0)
   796					dai_link->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
   797							    SND_SOC_DAIFMT_NB_NF |
   798							    SND_SOC_DAIFMT_CBP_CFP;
   799			}
   800	
   801			if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
   802				dai_link->codecs->of_node = hdmi_codec;
   803				dai_link->ignore = 0;
   804			}
   805	
   806			if (!dai_link->platforms->name)
   807				dai_link->platforms->of_node = platform_node;
   808		}
   809	
   810		mt8183_mt6358_ts3a227_max98357_headset_dev.dlc.of_node =
   811			of_parse_phandle(pdev->dev.of_node,
   812					 "mediatek,headset-codec", 0);
   813		if (mt8183_mt6358_ts3a227_max98357_headset_dev.dlc.of_node) {
 > 814			card_platform->driver.aux_dev = &mt8183_mt6358_ts3a227_max98357_headset_dev;
   815			card_platform->driver.num_aux_devs = 1;
   816		}
   817	
   818		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   819		if (!priv) {
   820			ret = -ENOMEM;
   821			goto out;
   822		}
   823	
   824		snd_soc_card_set_drvdata(card, priv);
   825	
   826		priv->pinctrl = devm_pinctrl_get(&pdev->dev);
   827		if (IS_ERR(priv->pinctrl)) {
   828			dev_err(&pdev->dev, "%s devm_pinctrl_get failed\n",
   829				__func__);
   830			ret = PTR_ERR(priv->pinctrl);
   831			goto out;
   832		}
   833	
   834		for (i = 0; i < PIN_STATE_MAX; i++) {
   835			priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
   836								   mt8183_pin_str[i]);
   837			if (IS_ERR(priv->pin_states[i])) {
   838				ret = PTR_ERR(priv->pin_states[i]);
   839				dev_info(&pdev->dev, "%s Can't find pin state %s %d\n",
   840					 __func__, mt8183_pin_str[i], ret);
   841			}
   842		}
   843	
   844		if (!IS_ERR(priv->pin_states[PIN_TDM_OUT_OFF])) {
   845			ret = pinctrl_select_state(priv->pinctrl,
   846						   priv->pin_states[PIN_TDM_OUT_OFF]);
   847			if (ret)
   848				dev_info(&pdev->dev,
   849					 "%s failed to select state %d\n",
   850					 __func__, ret);
   851		}
   852	
   853		if (!IS_ERR(priv->pin_states[PIN_STATE_DEFAULT])) {
   854			ret = pinctrl_select_state(priv->pinctrl,
   855						   priv->pin_states[PIN_STATE_DEFAULT]);
   856			if (ret)
   857				dev_info(&pdev->dev,
   858					 "%s failed to select state %d\n",
   859					 __func__, ret);
   860		}
   861	
   862		ret = devm_snd_soc_card_register(card);
   863	
   864	out:
   865		of_node_put(platform_node);
   866		of_node_put(ec_codec);
   867		of_node_put(hdmi_codec);
   868		return ret;
   869	}
   870	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
