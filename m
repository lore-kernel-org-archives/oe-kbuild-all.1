Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FB53955C4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 20:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781643008; cv=none; b=jVP4TqDwATE1cv93to0CBPt4X9am+YkhCpi5lzWQMfe+W2zdmi35WuxGvgZrNr+iDbo7yKOMQu4q3rsHvkP0aV7xo2qQ6+pBH/OL6QjDI9pxcJO6NR4hpG7jWy7Eo5jF7XBlK1cAZQ/uoO367OeDxlFn+Fr60qIFrp4KjaLFeTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781643008; c=relaxed/simple;
	bh=2o5LjGr11gUTUgB/5M8pnXpH7a5JwOReQHddMZuiWgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sx7PQBRKEKdzURRrQ05PsL4KC0gbydV/QP8qOPqf1Rr1QECCHjFweOKIl7VWk1A9EAO5R+nnaFraxCj9SUnSmiSBgCK8tIlAjz6pdJDC4dlMpcx313UmWb5InBKXWTCjMdqogHirFeY7tB5a7OFVpl4nGgDoVIaq8YQ9GnTsArU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkVsGEDJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkVsGEDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781643007; x=1813179007;
  h=date:from:to:cc:subject:message-id;
  bh=2o5LjGr11gUTUgB/5M8pnXpH7a5JwOReQHddMZuiWgU=;
  b=KkVsGEDJlMZc8pO+eN94SSTnZfH3fLEL48iVCrA2VKPE6tB923S7FfbE
   nJhC+qgU8877HMMTOP5We7F1IN+fsmMPXkzxk3J/4x/lKfCSdJhyChQO2
   QorAzgZXdE+/fBJhnNW8KZkb6WTLZ+HnZYGz1tDLmsofgg1VQDLefDI4V
   qofBdvYeYZ0omCQzO7Yc68FyzeERuGSVQD9RU67B1yuFUipfeG2VAeoyt
   EKx0ncCqr831iVu0lJ9QtQJH2J0uKBHeHYRof6CgoLECsk3VCXwtUm4ti
   UfLFuImbpfh6744q0sfoIEFDQejHDyhW0SUkB7Uw4kNsK+2HfEz2WBrCZ
   g==;
X-CSE-ConnectionGUID: yr4fdUtFSUOnjE5WOWz75w==
X-CSE-MsgGUID: Nz05uCwjROqsmCAkZLQaDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="105111403"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="105111403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 13:50:05 -0700
X-CSE-ConnectionGUID: WrJOYiYARfS7EjGvlWXEDg==
X-CSE-MsgGUID: wODicCeHQX20w66YYdwjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="241528260"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jun 2026 13:50:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZajQ-000000005BB-1dMl;
	Tue, 16 Jun 2026 20:50:00 +0000
Date: Tue, 16 Jun 2026 22:49:16 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 324/326]
 sound/soc/soc-card.c:1286:13: error: 'struct snd_soc_card' has no member
 named 'pci_subsystem_vendor'
Message-ID: <202606162245.0fDBnRze-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 347e73ad9dec0dbc10c4c7b5678981c7bf4cb422 [324/326] ASoC: soc.h: remove compatible definition
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260616/202606162245.0fDBnRze-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162245.0fDBnRze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606162245.0fDBnRze-lkp@intel.com/

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
   sound/soc/intel/boards/bytcht_da7213.c: In function 'bytcht_da7213_probe':
>> sound/soc/intel/boards/bytcht_da7213.c:269:19: error: implicit declaration of function 'snd_soc_fixup_dai_links_platform_name'; did you mean 'snd_soc_card_fixup_dai_links_platform_name'? [-Wimplicit-function-declaration]
     269 |         ret_val = snd_soc_fixup_dai_links_platform_name(card, platform_name);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   snd_soc_card_fixup_dai_links_platform_name


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
