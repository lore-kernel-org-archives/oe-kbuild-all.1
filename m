Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF2C33D4EC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419411; cv=none; b=rOoTS0I9DjPonKT8mkk/HHqChVjIuQ/pg5Fw5lOGhrJmATDw7LbFiHI6U/ilcm81rwC3bd1hWJ3PwBqRyVJ3WoJDM6lJY9QzO4oTCbDjf9BHOYMn9+ndCaCyhNwBR5FBueRkvWNQKp0XhNDuVFqDRRTiJ7XUxTTNP6dsOXdWaNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419411; c=relaxed/simple;
	bh=G31+BAmijKzkYxzVzPN77/gkXgW0ieJQR71FsjCSBow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cA7EQZQ2lrQwsX09VYm182Vn0wcfDDJ3XrOd/eDEbrF2Mq+B8Xvwx1FIxgC3b14WZHuw7j8d0i6Xo1SFpr18BzZqdSu5gHYSo9izojc6uG765DYScCObcbqHZCJE6c3rXo90X4QlDAU4/YAUxUppDB0JgpKiAFT9Gq3syAAWKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7WQtVuF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7WQtVuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780419410; x=1811955410;
  h=date:from:to:cc:subject:message-id;
  bh=G31+BAmijKzkYxzVzPN77/gkXgW0ieJQR71FsjCSBow=;
  b=W7WQtVuFo0BXJLu+qD5Sa93oo3q5YUV5NY5C9BoZEqfjp3USR7dn1Cwo
   TA8wl5pa+UFEuz5lZYRCjQGQCFXHlf1vOEjt3duc8o15MTx94Fcc5kJrA
   HTAXnUrMi7vdZF31yav8fwqa0jC7Iu+/goaNFENTvmbpSOUE/L+AzQqdl
   50X02HeeZubcBLk+4xKhe9iA/S71nTAudmwHWwUbBsFwOib0e+7XwzlFW
   kb07BvTQHrVuEAyMURhGQlwMjOfD9ETW7Ee1e316hDLjhHPiqjAnjyVwg
   pzvLIAoeI2ksgrjxS3xrEau+wNzKQKP9liKlbtk6UTLgP7agVw5zAyo5q
   A==;
X-CSE-ConnectionGUID: JRUgi2umS6C07Hpc83dF9w==
X-CSE-MsgGUID: BWfhXH0RRdenYshOUx/uCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92323853"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="92323853"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 09:56:49 -0700
X-CSE-ConnectionGUID: XNwKHaCPRLCFmDM2zlXuIA==
X-CSE-MsgGUID: lhdESXF5Q7WAUZv3+IWMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="247920783"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jun 2026 09:56:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUSQ0-00000000CJl-2Fe9;
	Tue, 02 Jun 2026 16:56:44 +0000
Date: Wed, 03 Jun 2026 00:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/meson/meson-card-utils.c:250:16: warning: unused variable 'j'
Message-ID: <202606030016.nit7N6KJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 9b07c6aa4c11e450c2f7f409b4a47925b85697c0 [290/290] ASoC: soc.h: remove compatible definition
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260603/202606030016.nit7N6KJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030016.nit7N6KJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030016.nit7N6KJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/meson/meson-card-utils.c: In function 'meson_card_clean_references':
   sound/soc/meson/meson-card-utils.c:253:17: error: implicit declaration of function 'for_each_card_prelinks'; did you mean 'for_each_card_rtds'? [-Wimplicit-function-declaration]
     253 |                 for_each_card_prelinks(card, i, link) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 for_each_card_rtds
   sound/soc/meson/meson-card-utils.c:253:54: error: expected ';' before '{' token
     253 |                 for_each_card_prelinks(card, i, link) {
         |                                                      ^~
         |                                                      ;
   sound/soc/meson/meson-card-utils.c:262:17: error: implicit declaration of function 'for_each_card_pre_auxs'; did you mean 'for_each_card_auxs'? [-Wimplicit-function-declaration]
     262 |                 for_each_card_pre_auxs(card, i, aux)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 for_each_card_auxs
   sound/soc/meson/meson-card-utils.c:262:53: error: expected ';' before 'of_node_put'
     262 |                 for_each_card_pre_auxs(card, i, aux)
         |                                                     ^
         |                                                     ;
     263 |                         of_node_put(aux->dlc.of_node);
         |                         ~~~~~~~~~~~                  
>> sound/soc/meson/meson-card-utils.c:250:16: warning: unused variable 'j' [-Wunused-variable]
     250 |         int i, j;
         |                ^
>> sound/soc/meson/meson-card-utils.c:248:44: warning: unused variable 'codec' [-Wunused-variable]
     248 |         struct snd_soc_dai_link_component *codec;
         |                                            ^~~~~
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
   sound/soc/meson/meson-card-utils.c:287:51: note: in expansion of macro 'THIS_MODULE'
     287 |         priv->card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &priv->card_driver,
         |                                                   ^~~~~~~~~~~
   In file included from include/sound/soc.h:1265,
                    from sound/soc/meson/meson-card-utils.c:8:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/meson/meson-card-utils.c:287:22: error: too many arguments to function 'devm_snd_soc_card_alloc'; expected 2, have 6
     287 |         priv->card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &priv->card_driver,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~                   ~~~~~~~~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/meson/meson-card-utils.c:297:15: error: implicit declaration of function 'snd_soc_card_of_parse_name'; did you mean 'snd_soc_card_driver_of_parse_name'? [-Wimplicit-function-declaration]
     297 |         ret = snd_soc_card_of_parse_name(priv->card, "model");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |               snd_soc_card_driver_of_parse_name
   sound/soc/meson/meson-card-utils.c:302:44: error: 'snd_soc_card_of_parse_audio_routing' undeclared (first use in this function); did you mean 'snd_soc_card_driver_of_parse_audio_routing'?
     302 |                                            snd_soc_card_of_parse_audio_routing);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            snd_soc_card_driver_of_parse_audio_routing
   sound/soc/meson/meson-card-utils.c:302:44: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/meson/meson-card-utils.c:309:44: error: 'snd_soc_card_of_parse_simple_widgets' undeclared (first use in this function); did you mean 'snd_soc_card_driver_of_parse_simple_widgets'?
     309 |                                            snd_soc_card_of_parse_simple_widgets);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            snd_soc_card_driver_of_parse_simple_widgets
   sound/soc/meson/meson-card-utils.c:319:15: error: implicit declaration of function 'snd_soc_card_of_parse_aux_devs'; did you mean 'snd_soc_card_driver_of_parse_aux_devs'? [-Wimplicit-function-declaration]
     319 |         ret = snd_soc_card_of_parse_aux_devs(priv->card, "audio-aux-devs");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               snd_soc_card_driver_of_parse_aux_devs
--
   sound/soc/qcom/apq8096.c: In function 'apq8096_add_be_ops':
   sound/soc/qcom/apq8096.c:97:9: error: implicit declaration of function 'for_each_card_prelinks'; did you mean 'for_each_card_rtds'? [-Wimplicit-function-declaration]
      97 |         for_each_card_prelinks(card, i, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_card_rtds
   sound/soc/qcom/apq8096.c:97:46: error: expected ';' before '{' token
      97 |         for_each_card_prelinks(card, i, link) {
         |                                              ^~
         |                                              ;
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from sound/soc/qcom/apq8096.c:5:
   sound/soc/qcom/apq8096.c: In function 'apq8096_platform_probe':
   include/linux/init.h:176:21: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     struct module *
   sound/soc/qcom/apq8096.c:119:45: note: in expansion of macro 'THIS_MODULE'
     119 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                                             ^~~~~~~~~~~
   In file included from include/sound/soc.h:1265,
                    from sound/soc/qcom/apq8096.c:7:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/qcom/apq8096.c:119:16: error: too many arguments to function 'devm_snd_soc_card_alloc'; expected 2, have 6
     119 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                ^~~~~~~~~~~~~~~~~~~~~~~                   ~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/apq8096.c: At top level:
>> sound/soc/qcom/apq8096.c:67:12: warning: 'apq8096_init' defined but not used [-Wunused-function]
      67 | static int apq8096_init(struct snd_soc_pcm_runtime *rtd)
         |            ^~~~~~~~~~~~
>> sound/soc/qcom/apq8096.c:63:33: warning: 'apq8096_ops' defined but not used [-Wunused-const-variable=]
      63 | static const struct snd_soc_ops apq8096_ops = {
         |                                 ^~~~~~~~~~~
>> sound/soc/qcom/apq8096.c:16:12: warning: 'apq8096_be_hw_params_fixup' defined but not used [-Wunused-function]
      16 | static int apq8096_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/qcom/sc8280xp.c: In function 'sc8280xp_add_be_ops':
   sound/soc/qcom/sc8280xp.c:130:9: error: implicit declaration of function 'for_each_card_prelinks'; did you mean 'for_each_card_rtds'? [-Wimplicit-function-declaration]
     130 |         for_each_card_prelinks(card, i, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_card_rtds
   sound/soc/qcom/sc8280xp.c:130:46: error: expected ';' before '{' token
     130 |         for_each_card_prelinks(card, i, link) {
         |                                              ^~
         |                                              ;
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from sound/soc/qcom/sc8280xp.c:5:
   sound/soc/qcom/sc8280xp.c: In function 'sc8280xp_platform_probe':
   include/linux/init.h:176:21: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     struct module *
   sound/soc/qcom/sc8280xp.c:156:45: note: in expansion of macro 'THIS_MODULE'
     156 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                                             ^~~~~~~~~~~
   In file included from include/sound/soc.h:1265,
                    from sound/soc/qcom/sc8280xp.c:7:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/qcom/sc8280xp.c:156:16: error: too many arguments to function 'devm_snd_soc_card_alloc'; expected 2, have 6
     156 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                ^~~~~~~~~~~~~~~~~~~~~~~                   ~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/sc8280xp.c: At top level:
>> sound/soc/qcom/sc8280xp.c:118:33: warning: 'sc8280xp_be_ops' defined but not used [-Wunused-const-variable=]
     118 | static const struct snd_soc_ops sc8280xp_be_ops = {
         |                                 ^~~~~~~~~~~~~~~
>> sound/soc/qcom/sc8280xp.c:71:12: warning: 'sc8280xp_be_hw_params_fixup' defined but not used [-Wunused-function]
      71 | static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/qcom/sc8280xp.c:26:12: warning: 'sc8280xp_snd_init' defined but not used [-Wunused-function]
      26 | static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
         |            ^~~~~~~~~~~~~~~~~
--
   sound/soc/qcom/sdm845.c: In function 'sdm845_add_ops':
   sound/soc/qcom/sdm845.c:542:9: error: implicit declaration of function 'for_each_card_prelinks'; did you mean 'for_each_card_rtds'? [-Wimplicit-function-declaration]
     542 |         for_each_card_prelinks(card, i, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_card_rtds
   sound/soc/qcom/sdm845.c:542:46: error: expected ';' before '{' token
     542 |         for_each_card_prelinks(card, i, link) {
         |                                              ^~
         |                                              ;
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from sound/soc/qcom/sdm845.c:7:
   sound/soc/qcom/sdm845.c: In function 'sdm845_snd_platform_probe':
   include/linux/init.h:176:21: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     struct module *
   sound/soc/qcom/sdm845.c:574:45: note: in expansion of macro 'THIS_MODULE'
     574 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                                             ^~~~~~~~~~~
   In file included from include/sound/soc.h:1265,
                    from sound/soc/qcom/sdm845.c:13:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/qcom/sdm845.c:574:16: error: too many arguments to function 'devm_snd_soc_card_alloc'; expected 2, have 6
     574 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                ^~~~~~~~~~~~~~~~~~~~~~~                   ~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/sdm845.c: At top level:
>> sound/soc/qcom/sdm845.c:508:12: warning: 'sdm845_be_hw_params_fixup' defined but not used [-Wunused-function]
     508 | static int sdm845_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/qcom/sdm845.c:500:33: warning: 'sdm845_be_ops' defined but not used [-Wunused-const-variable=]
     500 | static const struct snd_soc_ops sdm845_be_ops = {
         |                                 ^~~~~~~~~~~~~
>> sound/soc/qcom/sdm845.c:236:12: warning: 'sdm845_dai_init' defined but not used [-Wunused-function]
     236 | static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
         |            ^~~~~~~~~~~~~~~
--
   sound/soc/qcom/sm8250.c: In function 'sm8250_add_be_ops':
   sound/soc/qcom/sm8250.c:152:9: error: implicit declaration of function 'for_each_card_prelinks'; did you mean 'for_each_card_rtds'? [-Wimplicit-function-declaration]
     152 |         for_each_card_prelinks(card, i, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_card_rtds
   sound/soc/qcom/sm8250.c:152:46: error: expected ';' before '{' token
     152 |         for_each_card_prelinks(card, i, link) {
         |                                              ^~
         |                                              ;
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from sound/soc/qcom/sm8250.c:5:
   sound/soc/qcom/sm8250.c: In function 'sm8250_platform_probe':
   include/linux/init.h:176:21: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     struct module *
   sound/soc/qcom/sm8250.c:179:45: note: in expansion of macro 'THIS_MODULE'
     179 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                                             ^~~~~~~~~~~
   In file included from include/sound/soc.h:1265,
                    from sound/soc/qcom/sm8250.c:7:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/qcom/sm8250.c:179:16: error: too many arguments to function 'devm_snd_soc_card_alloc'; expected 2, have 6
     179 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                ^~~~~~~~~~~~~~~~~~~~~~~                   ~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/sm8250.c:190:13: error: 'struct snd_soc_card' has no member named 'driver_name'
     190 |         card->driver_name = of_device_get_match_data(dev);
         |             ^~
   sound/soc/qcom/sm8250.c: At top level:
>> sound/soc/qcom/sm8250.c:140:33: warning: 'sm8250_be_ops' defined but not used [-Wunused-const-variable=]
     140 | static const struct snd_soc_ops sm8250_be_ops = {
         |                                 ^~~~~~~~~~~~~
>> sound/soc/qcom/sm8250.c:58:12: warning: 'sm8250_be_hw_params_fixup' defined but not used [-Wunused-function]
      58 | static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/qcom/sm8250.c:47:13: warning: 'sm8250_snd_exit' defined but not used [-Wunused-function]
      47 | static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
         |             ^~~~~~~~~~~~~~~
>> sound/soc/qcom/sm8250.c:31:12: warning: 'sm8250_snd_init' defined but not used [-Wunused-function]
      31 | static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
         |            ^~~~~~~~~~~~~~~
--
   sound/soc/qcom/x1e80100.c: In function 'x1e80100_add_be_ops':
   sound/soc/qcom/x1e80100.c:176:9: error: implicit declaration of function 'for_each_card_prelinks'; did you mean 'for_each_card_rtds'? [-Wimplicit-function-declaration]
     176 |         for_each_card_prelinks(card, i, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_card_rtds
   sound/soc/qcom/x1e80100.c:176:46: error: expected ';' before '{' token
     176 |         for_each_card_prelinks(card, i, link) {
         |                                              ^~
         |                                              ;
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from sound/soc/qcom/x1e80100.c:5:
   sound/soc/qcom/x1e80100.c: In function 'x1e80100_platform_probe':
   include/linux/init.h:176:21: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     struct module *
   sound/soc/qcom/x1e80100.c:201:45: note: in expansion of macro 'THIS_MODULE'
     201 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                                             ^~~~~~~~~~~
   In file included from include/sound/soc.h:1265,
                    from sound/soc/qcom/x1e80100.c:10:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/qcom/x1e80100.c:201:16: error: too many arguments to function 'devm_snd_soc_card_alloc'; expected 2, have 6
     201 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                ^~~~~~~~~~~~~~~~~~~~~~~                   ~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/x1e80100.c:213:13: error: 'struct snd_soc_card' has no member named 'driver_name'
     213 |         card->driver_name = of_device_get_match_data(dev);
         |             ^~
   sound/soc/qcom/x1e80100.c: At top level:
>> sound/soc/qcom/x1e80100.c:164:33: warning: 'x1e80100_be_ops' defined but not used [-Wunused-const-variable=]
     164 | static const struct snd_soc_ops x1e80100_be_ops = {
         |                                 ^~~~~~~~~~~~~~~
>> sound/soc/qcom/x1e80100.c:72:12: warning: 'x1e80100_be_hw_params_fixup' defined but not used [-Wunused-function]
      72 | static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/qcom/x1e80100.c:26:12: warning: 'x1e80100_snd_init' defined but not used [-Wunused-function]
      26 | static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
         |            ^~~~~~~~~~~~~~~~~
..


vim +/j +250 sound/soc/meson/meson-card-utils.c

aa9c3b7273a58b Jerome Brunet     2020-02-13  242  
aa9c3b7273a58b Jerome Brunet     2020-02-13  243  static void meson_card_clean_references(struct meson_card *priv)
aa9c3b7273a58b Jerome Brunet     2020-02-13  244  {
ba5577652c6a70 Kuninori Morimoto 2026-05-20  245  	struct snd_soc_card *card = priv->card;
ba5577652c6a70 Kuninori Morimoto 2026-05-20  246  	struct snd_soc_card_driver *card_driver = snd_soc_card_to_driver(card);
aa9c3b7273a58b Jerome Brunet     2020-02-13  247  	struct snd_soc_dai_link *link;
aa9c3b7273a58b Jerome Brunet     2020-02-13 @248  	struct snd_soc_dai_link_component *codec;
aa9c3b7273a58b Jerome Brunet     2020-02-13  249  	struct snd_soc_aux_dev *aux;
aa9c3b7273a58b Jerome Brunet     2020-02-13 @250  	int i, j;
aa9c3b7273a58b Jerome Brunet     2020-02-13  251  
ba5577652c6a70 Kuninori Morimoto 2026-05-20  252  	if (card_driver->dai_link) {
aa9c3b7273a58b Jerome Brunet     2020-02-13  253  		for_each_card_prelinks(card, i, link) {
aa9c3b7273a58b Jerome Brunet     2020-02-13  254  			if (link->cpus)
aa9c3b7273a58b Jerome Brunet     2020-02-13  255  				of_node_put(link->cpus->of_node);
aa9c3b7273a58b Jerome Brunet     2020-02-13  256  			for_each_link_codecs(link, j, codec)
aa9c3b7273a58b Jerome Brunet     2020-02-13  257  				of_node_put(codec->of_node);
aa9c3b7273a58b Jerome Brunet     2020-02-13  258  		}
aa9c3b7273a58b Jerome Brunet     2020-02-13  259  	}
aa9c3b7273a58b Jerome Brunet     2020-02-13  260  
ba5577652c6a70 Kuninori Morimoto 2026-05-20  261  	if (card_driver->aux_dev) {
aa9c3b7273a58b Jerome Brunet     2020-02-13  262  		for_each_card_pre_auxs(card, i, aux)
aa9c3b7273a58b Jerome Brunet     2020-02-13  263  			of_node_put(aux->dlc.of_node);
aa9c3b7273a58b Jerome Brunet     2020-02-13  264  	}
aa9c3b7273a58b Jerome Brunet     2020-02-13  265  
ba5577652c6a70 Kuninori Morimoto 2026-05-20  266  	kfree(card_driver->dai_link);
aa9c3b7273a58b Jerome Brunet     2020-02-13  267  	kfree(priv->link_data);
aa9c3b7273a58b Jerome Brunet     2020-02-13  268  }
aa9c3b7273a58b Jerome Brunet     2020-02-13  269  

:::::: The code at line 250 was first introduced by commit
:::::: aa9c3b7273a58b5d9b2c1161b76b5fc8ea8c159b ASoC: meson: axg: extract sound card utils

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
