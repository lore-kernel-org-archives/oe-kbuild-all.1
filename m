Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E7F1DF73C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 00:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780447117; cv=none; b=sytbISIwiheBkBFinZpZ4aUYuMCf2pbL1cdjdfjS7RnT3L9ouYL6PexWW4Bgb0xA/xXs4D5KyXjVhFJVnZvt1Bsf0oTMIKqoaUAGaVrP0QUvzbvtY9T8nXOpmIspgjxatcVpPH4hEALjCbNmpDGQ9q6IskTK6qxUtTJYZD584H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780447117; c=relaxed/simple;
	bh=nPGV6z2LmWVCM1DMnj+USXl0NgnVRkyL7IZiHT89v74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TH8QNaapDwrODXdef7c1SnXmllp9Hgy72hruWDHYNmszqLlkgE8TGl59vV284tHBioyGkq7aLksLBq2HqXjRmtV7ykC/kLjkBgcjqRHVtm5ccSyvhQ2ZTq3yOvQEPl9WptYTIBp81NuWg1gPamyPbOP90Abj02qsThFkJMIBGF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMReD4vC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMReD4vC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780447116; x=1811983116;
  h=date:from:to:cc:subject:message-id;
  bh=nPGV6z2LmWVCM1DMnj+USXl0NgnVRkyL7IZiHT89v74=;
  b=kMReD4vCcBnHxl/OYke54U+N7J+R8gNTIB3PYC5Jcky87YGz38rMbPgi
   6wtia50/+nFN4N4MKOpyG3xf+OUVzrQi4tCVhgxhI5/O4uGcXPqbx6vBx
   9rE7wLPxzPTPDr9EfpBlQ8h9Po37FkUcjSQdfRGlr/5FGE+DjVKWIuRbe
   ybML9h+6m+b+WS2933JF/iIQGELf6hOlFeV0vQdaaFEgXTTe7+4Lh/T9v
   DZCojwBhKMu0W089G3hHaiaVhZbo9XakMl5xxQUemcT5wvUuJZm4iIX99
   SwmGpsczSd6Cs14ehzgFV0nI5j4Enk+SN7fMvefwKwiwE4I2XnihER1d8
   Q==;
X-CSE-ConnectionGUID: sCLANoxdQjWt9tF1dNrs9A==
X-CSE-MsgGUID: skZMdUMIRLaWlz3sUdhvHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92354758"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92354758"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:38:36 -0700
X-CSE-ConnectionGUID: vsbrfE09Re+PzIIFxo/8jQ==
X-CSE-MsgGUID: i6QSugMAQ1SYgFsxpTBBUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239905497"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 17:38:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUZct-00000000Cim-2YKQ;
	Wed, 03 Jun 2026 00:38:31 +0000
Date: Wed, 03 Jun 2026 08:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/meson/meson-card-utils.c:280:22: error: too many arguments to
 function 'devm_snd_soc_card_alloc'; expected 2, have 6
Message-ID: <202606030833.5tu0NsiD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: ba5577652c6a70b474f502c8026d61c78664c85f [290/290] ASoC: meson: meson-card-utils: use snd_soc_card_register()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260603/202606030833.5tu0NsiD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030833.5tu0NsiD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030833.5tu0NsiD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from sound/soc/meson/meson-card-utils.c:6:
   sound/soc/meson/meson-card-utils.c: In function 'meson_card_probe':
   include/linux/init.h:176:21: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     struct module *
   sound/soc/meson/meson-card-utils.c:280:51: note: in expansion of macro 'THIS_MODULE'
     280 |         priv->card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &priv->card_driver,
         |                                                   ^~~~~~~~~~~
   In file included from include/sound/soc.h:1318,
                    from sound/soc/meson/meson-card-utils.c:8:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> sound/soc/meson/meson-card-utils.c:280:22: error: too many arguments to function 'devm_snd_soc_card_alloc'; expected 2, have 6
     280 |         priv->card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &priv->card_driver,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~                   ~~~~~~~~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/devm_snd_soc_card_alloc +280 sound/soc/meson/meson-card-utils.c

   262	
   263	int meson_card_probe(struct platform_device *pdev)
   264	{
   265		const struct meson_card_match_data *data;
   266		struct device *dev = &pdev->dev;
   267		struct meson_card *priv;
   268		int ret;
   269	
   270		data = of_device_get_match_data(dev);
   271		if (!data) {
   272			dev_err(dev, "failed to match device\n");
   273			return -ENODEV;
   274		}
   275	
   276		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   277		if (!priv)
   278			return -ENOMEM;
   279	
 > 280		priv->card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &priv->card_driver,
   281						     NULL, NULL, NULL);
   282		if (!priv->card)
   283			return -ENOMEM;
   284	
   285		snd_soc_card_set_drvdata(priv->card, priv);
   286	
   287		priv->card_driver.name = dev->driver->name;
   288		priv->match_data = data;
   289	
   290		ret = snd_soc_of_parse_card_name(priv->card, "model");
   291		if (ret < 0)
   292			return ret;
   293	
   294		ret = meson_card_parse_of_optional(priv->card, "audio-routing",
   295						   snd_soc_of_parse_audio_routing);
   296		if (ret) {
   297			dev_err(dev, "error while parsing routing\n");
   298			return ret;
   299		}
   300	
   301		ret = meson_card_parse_of_optional(priv->card, "audio-widgets",
   302						   snd_soc_of_parse_audio_simple_widgets);
   303		if (ret) {
   304			dev_err(dev, "error while parsing widgets\n");
   305			return ret;
   306		}
   307	
   308		ret = meson_card_add_links(priv->card);
   309		if (ret)
   310			goto out_err;
   311	
   312		ret = snd_soc_of_parse_aux_devs(priv->card, "audio-aux-devs");
   313		if (ret)
   314			goto out_err;
   315	
   316		ret = devm_snd_soc_card_register(priv->card);
   317		if (ret)
   318			goto out_err;
   319	
   320		return 0;
   321	
   322	out_err:
   323		meson_card_clean_references(priv);
   324		return ret;
   325	}
   326	EXPORT_SYMBOL_GPL(meson_card_probe);
   327	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
