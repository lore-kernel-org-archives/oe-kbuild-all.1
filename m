Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68822F0680
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 20:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781726595; cv=none; b=B9Tmrn9F2U+2Mc4tdak3zP/EW2ygAhNbD+zTqscm8T+0t15wY8q8GpO5R6oFSUT214FvOzfAjw5Sxmi+mb+ES8u6R9VK5HK/Qm2b4m2cyjDr9AWo+VWjylG0BmfGgd62dci/l92GITIAX021Aqo34Jiz2ELhHpB4BPstt88y3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781726595; c=relaxed/simple;
	bh=6LWJuIofTui4T6ALMvFj9wpMKzi9ilmakS5yVeLmnR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KxlsyeGB7aWDdRSkw/mz7+xcSrt8zhtzq5j5Epl5Zxyn2yUAOVIFEM2ptSxT/nZMrBLMVZBRZ04u2akZXJIdKL5+ETcDL4IejoCv3ZktxjEKCbJrP3MXNdPdAUOzyr1LoXfR9zTU0s5EiZ1kj/OlE79ZAfYy2GHqkCG6YvLqAws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWonEkLW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWonEkLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781726594; x=1813262594;
  h=date:from:to:cc:subject:message-id;
  bh=6LWJuIofTui4T6ALMvFj9wpMKzi9ilmakS5yVeLmnR4=;
  b=AWonEkLWRK5AL+Y7HhP9fC14ptq9Rs9yulZ0inL2cJ8efqpZmTOb5Csn
   v6SKQ9djkvVCm2xSB0YoS+KgUZNaFLoq4n20I0k7y7wIV8bgBtdfgUApb
   WKueF05M+VpPaLG3Ys8gAYnkzB5/HBedNRkbCARnZxW12WsJdFhIR0Cgy
   x/JPegyBe8yDKIXebBAfizwwuFKBcUNkbyfTYZTcn6i1LVxLqjLsXzg6y
   ZMr0qVJECkvbztirnRSCxbKk6SSJRZF86WjZ7eEld1Anf/BV/XyubvueR
   GaGl+5w2tHmTXTYegRb+9DcycoNqJQrz/OxeX2DsUNSDQ6YmCph7j6tE3
   Q==;
X-CSE-ConnectionGUID: kpqulMfmSkOfCEszRHb17Q==
X-CSE-MsgGUID: Ok5KjhUqRjKaxIiVNRaokg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82435956"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82435956"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 13:03:14 -0700
X-CSE-ConnectionGUID: zlnkFvMYS66hhcXT0Tywrg==
X-CSE-MsgGUID: MKkWGeQoTd26CspRs/m4Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="286268571"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2026 13:03:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZwTc-00000000Uwi-41fO;
	Wed, 17 Jun 2026 20:03:08 +0000
Date: Thu, 18 Jun 2026 04:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/soc-card.c:1286:13: error: 'struct snd_soc_card' has no member
 named 'pci_subsystem_vendor'
Message-ID: <202606180318.eKxuroMU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 347e73ad9dec0dbc10c4c7b5678981c7bf4cb422 [326/326] ASoC: soc.h: remove compatible definition
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260618/202606180318.eKxuroMU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180318.eKxuroMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180318.eKxuroMU-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                     ^~
   sound/soc/soc-card.c:962:80: error: 'struct snd_soc_card' has no member named 'name'
     962 |                                                           "%s-%s", prefix, card->name);
         |                                                                                ^~
   sound/soc/soc-card.c:964:13: error: 'struct snd_soc_card' has no member named 'name'
     964 |         card->name = card->topology_shortname;
         |             ^~
   sound/soc/soc-card.c:964:26: error: 'struct snd_soc_card' has no member named 'topology_shortname'
     964 |         card->name = card->topology_shortname;
         |                          ^~
   sound/soc/soc-card.c: In function 'soc_card_bind':
   sound/soc/soc-card.c:1025:50: error: 'struct snd_soc_card' has no member named 'dai_link'
    1025 |         ret = snd_soc_add_pcm_runtimes(card, card->dai_link, card->num_links);
         |                                                  ^~
   sound/soc/soc-card.c:1025:66: error: 'struct snd_soc_card' has no member named 'num_links'
    1025 |         ret = snd_soc_add_pcm_runtimes(card, card->dai_link, card->num_links);
         |                                                                  ^~
   sound/soc/soc-card.c:1031:32: error: 'struct snd_soc_card' has no member named 'owner'
    1031 |                            card->owner, 0, &card->snd_card);
         |                                ^~
   sound/soc/soc-card.c:1043:51: error: 'struct snd_soc_card' has no member named 'dapm_widgets'
    1043 |         ret = snd_soc_dapm_new_controls(dapm, card->dapm_widgets,
         |                                                   ^~
   sound/soc/soc-card.c:1044:45: error: 'struct snd_soc_card' has no member named 'num_dapm_widgets'
    1044 |                                         card->num_dapm_widgets);
         |                                             ^~
   sound/soc/soc-card.c:1048:51: error: 'struct snd_soc_card' has no member named 'of_dapm_widgets'
    1048 |         ret = snd_soc_dapm_new_controls(dapm, card->of_dapm_widgets,
         |                                                   ^~
   sound/soc/soc-card.c:1049:45: error: 'struct snd_soc_card' has no member named 'num_of_dapm_widgets'
    1049 |                                         card->num_of_dapm_widgets);
         |                                             ^~
   sound/soc/soc-card.c:1093:51: error: 'struct snd_soc_card' has no member named 'controls'
    1093 |         ret = snd_soc_card_add_controls(card, card->controls,
         |                                                   ^~
   sound/soc/soc-card.c:1094:45: error: 'struct snd_soc_card' has no member named 'num_controls'
    1094 |                                         card->num_controls);
         |                                             ^~
   sound/soc/soc-card.c:1098:51: error: 'struct snd_soc_card' has no member named 'dapm_routes'; did you mean 'dapm_mutex'?
    1098 |         ret = snd_soc_dapm_add_routes(dapm, card->dapm_routes,
         |                                                   ^~~~~~~~~~~
         |                                                   dapm_mutex
   sound/soc/soc-card.c:1099:43: error: 'struct snd_soc_card' has no member named 'num_dapm_routes'
    1099 |                                       card->num_dapm_routes);
         |                                           ^~
   sound/soc/soc-card.c:1103:49: error: 'struct snd_soc_card' has no member named 'of_dapm_routes'
    1103 |         ret = snd_soc_dapm_add_routes(dapm, card->of_dapm_routes,
         |                                                 ^~
   sound/soc/soc-card.c:1104:43: error: 'struct snd_soc_card' has no member named 'num_of_dapm_routes'
    1104 |                                       card->num_of_dapm_routes);
         |                                           ^~
   sound/soc/soc-card.c:1111:69: error: 'struct snd_soc_card' has no member named 'name'
    1111 |         soc_card_setup_name(card, card->snd_card->shortname,    card->name,             NULL);
         |                                                                     ^~
   sound/soc/soc-card.c:628:57: note: in definition of macro 'soc_card_setup_name'
     628 |         __soc_card_setup_name(card, name, sizeof(name), name1, name2)
         |                                                         ^~~~~
   sound/soc/soc-card.c:1112:69: error: 'struct snd_soc_card' has no member named 'long_name'
    1112 |         soc_card_setup_name(card, card->snd_card->longname,     card->long_name,        card->name);
         |                                                                     ^~
   sound/soc/soc-card.c:628:57: note: in definition of macro 'soc_card_setup_name'
     628 |         __soc_card_setup_name(card, name, sizeof(name), name1, name2)
         |                                                         ^~~~~
   sound/soc/soc-card.c:1112:93: error: 'struct snd_soc_card' has no member named 'name'
    1112 |         soc_card_setup_name(card, card->snd_card->longname,     card->long_name,        card->name);
         |                                                                                             ^~
   sound/soc/soc-card.c:628:64: note: in definition of macro 'soc_card_setup_name'
     628 |         __soc_card_setup_name(card, name, sizeof(name), name1, name2)
         |                                                                ^~~~~
   sound/soc/soc-card.c:1113:69: error: 'struct snd_soc_card' has no member named 'driver_name'
    1113 |         soc_card_setup_name(card, card->snd_card->driver,       card->driver_name,      card->name);
         |                                                                     ^~
   sound/soc/soc-card.c:628:57: note: in definition of macro 'soc_card_setup_name'
     628 |         __soc_card_setup_name(card, name, sizeof(name), name1, name2)
         |                                                         ^~~~~
   sound/soc/soc-card.c:1113:93: error: 'struct snd_soc_card' has no member named 'name'
    1113 |         soc_card_setup_name(card, card->snd_card->driver,       card->driver_name,      card->name);
         |                                                                                             ^~
   sound/soc/soc-card.c:628:64: note: in definition of macro 'soc_card_setup_name'
     628 |         __soc_card_setup_name(card, name, sizeof(name), name1, name2)
         |                                                                ^~~~~
   sound/soc/soc-card.c:1115:17: error: 'struct snd_soc_card' has no member named 'components'
    1115 |         if (card->components) {
         |                 ^~
   sound/soc/soc-card.c:1120:61: error: 'struct snd_soc_card' has no member named 'components'
    1120 |                 ret = snd_component_add(card->snd_card, card->components);
         |                                                             ^~
   In file included from include/linux/device.h:15,
                    from include/sound/core.h:10,
                    from sound/soc/soc-card.c:14:
   sound/soc/soc-card.c:1123:37: error: 'struct snd_soc_card' has no member named 'name'
    1123 |                                 card->name, ret);
         |                                     ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/soc-card.c:1122:25: note: in expansion of macro 'dev_err'
    1122 |                         dev_err(card->dev, "ASoC: %s snd_component_add() failed: %d\n",
         |                         ^~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_set_pci_ssid':
>> sound/soc/soc-card.c:1286:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_vendor'
    1286 |         card->pci_subsystem_vendor = vendor;
         |             ^~
>> sound/soc/soc-card.c:1287:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_device'
    1287 |         card->pci_subsystem_device = device;
         |             ^~
>> sound/soc/soc-card.c:1288:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_set'
    1288 |         card->pci_subsystem_set = true;
         |             ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_get_pci_ssid':
   sound/soc/soc-card.c:1311:18: error: 'struct snd_soc_card' has no member named 'pci_subsystem_set'
    1311 |         if (!card->pci_subsystem_set)
         |                  ^~
   sound/soc/soc-card.c:1314:23: error: 'struct snd_soc_card' has no member named 'pci_subsystem_vendor'
    1314 |         *vendor = card->pci_subsystem_vendor;
         |                       ^~
   sound/soc/soc-card.c:1315:23: error: 'struct snd_soc_card' has no member named 'pci_subsystem_device'
    1315 |         *device = card->pci_subsystem_device;
         |                       ^~
   sound/soc/soc-card.c: At top level:
   sound/soc/soc-card.c:1352:5: warning: no previous prototype for 'snd_soc_register_card' [-Wmissing-prototypes]
    1352 | int snd_soc_register_card(struct snd_soc_card *card)
         |     ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_register_card':
   sound/soc/soc-card.c:1354:18: error: 'struct snd_soc_card' has no member named 'name'
    1354 |         if (!card->name || !card->dev)
         |                  ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_register3':
   sound/soc/soc-card.c:1402:13: error: 'struct snd_soc_card' has no member named 'name'
    1402 |         card->name                              = driver->name;
         |             ^~
   sound/soc/soc-card.c:1403:13: error: 'struct snd_soc_card' has no member named 'long_name'
    1403 |         card->long_name                         = driver->long_name;
         |             ^~
   sound/soc/soc-card.c:1404:13: error: 'struct snd_soc_card' has no member named 'driver_name'
    1404 |         card->driver_name                       = driver->driver_name;
         |             ^~
   sound/soc/soc-card.c:1405:13: error: 'struct snd_soc_card' has no member named 'components'
    1405 |         card->components                        = driver->components;
         |             ^~
   sound/soc/soc-card.c:1407:13: error: 'struct snd_soc_card' has no member named 'dai_link'
    1407 |         card->dai_link                          = driver->dai_link;
         |             ^~
   sound/soc/soc-card.c:1408:13: error: 'struct snd_soc_card' has no member named 'num_links'
    1408 |         card->num_links                         = driver->num_links;
         |             ^~
   sound/soc/soc-card.c:1409:13: error: 'struct snd_soc_card' has no member named 'codec_conf'
    1409 |         card->codec_conf                        = driver->codec_conf;
         |             ^~
   sound/soc/soc-card.c:1410:13: error: 'struct snd_soc_card' has no member named 'num_configs'
    1410 |         card->num_configs                       = driver->num_configs;
         |             ^~
   sound/soc/soc-card.c:1411:13: error: 'struct snd_soc_card' has no member named 'aux_dev'
    1411 |         card->aux_dev                           = driver->aux_dev;
         |             ^~
   sound/soc/soc-card.c:1412:13: error: 'struct snd_soc_card' has no member named 'num_aux_devs'
    1412 |         card->num_aux_devs                      = driver->num_aux_devs;
         |             ^~
   sound/soc/soc-card.c:1413:13: error: 'struct snd_soc_card' has no member named 'controls'
    1413 |         card->controls                          = driver->controls;
         |             ^~
   sound/soc/soc-card.c:1414:13: error: 'struct snd_soc_card' has no member named 'num_controls'
    1414 |         card->num_controls                      = driver->num_controls;
         |             ^~
   sound/soc/soc-card.c:1415:13: error: 'struct snd_soc_card' has no member named 'dapm_widgets'
    1415 |         card->dapm_widgets                      = driver->dapm_widgets;
         |             ^~
   sound/soc/soc-card.c:1416:13: error: 'struct snd_soc_card' has no member named 'num_dapm_widgets'
    1416 |         card->num_dapm_widgets                  = driver->num_dapm_widgets;
         |             ^~
   sound/soc/soc-card.c:1417:15: error: 'struct snd_soc_card' has no member named 'dapm_routes'; did you mean 'dapm_mutex'?
    1417 |         card->dapm_routes                       = driver->dapm_routes;
         |               ^~~~~~~~~~~
         |               dapm_mutex
   sound/soc/soc-card.c:1418:13: error: 'struct snd_soc_card' has no member named 'num_dapm_routes'
    1418 |         card->num_dapm_routes                   = driver->num_dapm_routes;
         |             ^~
   sound/soc/soc-card.c:1419:13: error: 'struct snd_soc_card' has no member named 'of_dapm_widgets'
    1419 |         card->of_dapm_widgets                   = driver->of_dapm_widgets;
         |             ^~
   sound/soc/soc-card.c:1420:13: error: 'struct snd_soc_card' has no member named 'num_of_dapm_widgets'
    1420 |         card->num_of_dapm_widgets               = driver->num_of_dapm_widgets;
         |             ^~
   sound/soc/soc-card.c:1421:13: error: 'struct snd_soc_card' has no member named 'of_dapm_routes'
    1421 |         card->of_dapm_routes                    = driver->of_dapm_routes;
         |             ^~
   sound/soc/soc-card.c:1422:13: error: 'struct snd_soc_card' has no member named 'num_of_dapm_routes'
    1422 |         card->num_of_dapm_routes                = driver->num_of_dapm_routes;
         |             ^~
   sound/soc/soc-card.c:1423:13: error: 'struct snd_soc_card' has no member named 'of_ignore_suspend_widgets'
    1423 |         card->of_ignore_suspend_widgets         = driver->of_ignore_suspend_widgets;
         |             ^~
   sound/soc/soc-card.c:1424:13: error: 'struct snd_soc_card' has no member named 'num_of_ignore_suspend_widgets'
    1424 |         card->num_of_ignore_suspend_widgets     = driver->num_of_ignore_suspend_widgets;
         |             ^~
   sound/soc/soc-card.c:1425:13: error: 'struct snd_soc_card' has no member named 'fully_routed'
    1425 |         card->fully_routed                      = driver->fully_routed;
         |             ^~
   sound/soc/soc-card.c:1426:13: error: 'struct snd_soc_card' has no member named 'component_chaining'
    1426 |         card->component_chaining                = driver->component_chaining;
         |             ^~
   sound/soc/soc-card.c:1428:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_vendor'
    1428 |         card->pci_subsystem_vendor              = driver->pci_subsystem_vendor;
         |             ^~
   sound/soc/soc-card.c:1429:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_device'
    1429 |         card->pci_subsystem_device              = driver->pci_subsystem_device;
         |             ^~
--
   sound/soc/samsung/snow.c: In function 'snow_late_probe':
   sound/soc/samsung/snow.c:109:46: error: 'struct snd_soc_card' has no member named 'dai_link'
     109 |         rtd = snd_soc_card_to_rtd(card, &card->dai_link[0]);
         |                                              ^~
   sound/soc/samsung/snow.c: In function 'snow_probe':
>> sound/soc/samsung/snow.c:209:9: error: implicit declaration of function 'snd_soc_of_parse_card_name'; did you mean 'snd_soc_of_get_dai_name'? [-Wimplicit-function-declaration]
     209 |         snd_soc_of_parse_card_name(card, "samsung,model");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_of_get_dai_name


vim +1286 sound/soc/soc-card.c

9666422c9fc116 Kuninori Morimoto 2026-06-10  1280  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1281  /* REMOVE ME */
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1282  void snd_soc_card_set_pci_ssid(struct snd_soc_card *card,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1283  			       unsigned short vendor,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1284  			       unsigned short device)
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1285  {
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1286  	card->pci_subsystem_vendor = vendor;
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1287  	card->pci_subsystem_device = device;
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1288  	card->pci_subsystem_set = true;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1289  }
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1290  EXPORT_SYMBOL_GPL(snd_soc_card_set_pci_ssid);
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1291  

:::::: The code at line 1286 was first introduced by commit
:::::: 789d6dc80311d84d93dd24b965cdd0319108562c ASoC: soc-card: move snd_soc_card_{set/get}_pci_ssid() to soc-card.c

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
