Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423493191CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 04:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784261470; cv=none; b=d4UZPsKcEXeTsgWdGAWf0LEVYMtUb0JaaxVY4AkyZSGBDDnFZYweLHGWG7rOPxdnYCjV6amfqhhhWNejd+s9nemIleW/WtiLiJW84eOsoQxJoa3PGYoa8ac7yfSMVe/qgWOe2F9i3/i9UJfAkwpnLFYb+4O/TwnbJDF7F5omdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784261470; c=relaxed/simple;
	bh=yR+nsOSeUxaw4zB5J5PCeSuOxmQMH2keQhoqVrWQryE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SZYpDp50G6p/Htz3OTnwisM3f4G9uz/sGO+3RPaopwmjQi5xR1cOoff+JBb6MrXmdXy+KLqUNc1YooU1SR5CGIitq2Nlu4qONXttTXxHYrozOM5ExgGU91sJjud0JNXjP+Pi7sBX6qLdAh2YYDzNwIHkh/xTC8kBVl4Z700lD/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aABztTUb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aABztTUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784261467; x=1815797467;
  h=date:from:to:cc:subject:message-id;
  bh=yR+nsOSeUxaw4zB5J5PCeSuOxmQMH2keQhoqVrWQryE=;
  b=aABztTUbYqFkW/7ihaZ3csoGTKYU33B+ysQXeYZyuke53w8Fbdi3L0UP
   zIuRBUQ4oOmiyVQi96mXHVoaGXVxaRQkEvnMB6Dlbp7/Z+7CmXOcRPDWF
   0mp9PmmSTM/h6gxCRQgykfyfuW2ktQjfuSqSgWsB0ox4Mz1fWucfDcHHI
   4mZW8K7p/czoK1LhwzrT3Ni3h20/F1lMVdhPUR84ckXgJhmBp0WEMhVxF
   yWs6bVWmadAsPxBLBx792dVAIaIZO5mJeduw4GopXDLAotBbb15AaxmCg
   DtDeEF+vc2LmG9Ei6XLmNckAeehQKF30sm2OvAhI7XA67sO4eAAlt1un8
   Q==;
X-CSE-ConnectionGUID: Tchn4AklTYe0NCc+TG1ndg==
X-CSE-MsgGUID: USVtb+N3TBKT7nrshwgfrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102354662"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="102354662"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 21:11:06 -0700
X-CSE-ConnectionGUID: Fkt9HXHZQCqLC8kedB87Mw==
X-CSE-MsgGUID: BmGuH2i0Rsq4um80466XEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="260970378"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2026 21:11:05 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkZuh-000000005Qv-19uH;
	Fri, 17 Jul 2026 04:11:03 +0000
Date: Fri, 17 Jul 2026 06:11:00 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 309/311]
 sound/soc/soc-card.c:1125:61: error: 'struct snd_soc_card' has no member
 named 'driver_name'
Message-ID: <202607170603.6VjqqFUe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: 4658683b3370aaff3923e5a86dc7e81f3ea478f3 [309/311] ASoC: soc.h: remove compatible definition
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260717/202607170603.6VjqqFUe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607170603.6VjqqFUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607170603.6VjqqFUe-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                           ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_probe':
   sound/soc/soc-card.c:847:19: error: 'struct snd_soc_card' has no member named 'probe'; did you mean 'probed'?
     847 |         if (card->probe) {
         |                   ^~~~~
         |                   probed
   sound/soc/soc-card.c:848:33: error: 'struct snd_soc_card' has no member named 'probe'; did you mean 'probed'?
     848 |                 int ret = card->probe(card);
         |                                 ^~~~~
         |                                 probed
   sound/soc/soc-card.c: In function 'soc_card_late_probe':
   sound/soc/soc-card.c:870:17: error: 'struct snd_soc_card' has no member named 'late_probe'
     870 |         if (card->late_probe) {
         |                 ^~
   sound/soc/soc-card.c:871:31: error: 'struct snd_soc_card' has no member named 'late_probe'
     871 |                 int ret = card->late_probe(card);
         |                               ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_fixup_controls':
   sound/soc/soc-card.c:894:17: error: 'struct snd_soc_card' has no member named 'fixup_controls'
     894 |         if (card->fixup_controls)
         |                 ^~
   sound/soc/soc-card.c:895:21: error: 'struct snd_soc_card' has no member named 'fixup_controls'
     895 |                 card->fixup_controls(card);
         |                     ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_remove':
   sound/soc/soc-card.c:903:17: error: 'struct snd_soc_card' has no member named 'remove'
     903 |             card->remove)
         |                 ^~
   sound/soc/soc-card.c:904:27: error: 'struct snd_soc_card' has no member named 'remove'
     904 |                 ret = card->remove(card);
         |                           ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_set_bias_level':
   sound/soc/soc-card.c:917:17: error: 'struct snd_soc_card' has no member named 'set_bias_level'
     917 |         if (card->set_bias_level)
         |                 ^~
   sound/soc/soc-card.c:918:27: error: 'struct snd_soc_card' has no member named 'set_bias_level'
     918 |                 ret = card->set_bias_level(card, dapm, level);
         |                           ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_set_bias_level_post':
   sound/soc/soc-card.c:929:17: error: 'struct snd_soc_card' has no member named 'set_bias_level_post'
     929 |         if (card->set_bias_level_post)
         |                 ^~
   sound/soc/soc-card.c:930:27: error: 'struct snd_soc_card' has no member named 'set_bias_level_post'
     930 |                 ret = card->set_bias_level_post(card, dapm, level);
         |                           ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_add_dai_link':
   sound/soc/soc-card.c:940:17: error: 'struct snd_soc_card' has no member named 'add_dai_link'
     940 |         if (card->add_dai_link)
         |                 ^~
   sound/soc/soc-card.c:941:27: error: 'struct snd_soc_card' has no member named 'add_dai_link'
     941 |                 ret = card->add_dai_link(card, dai_link);
         |                           ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_remove_dai_link':
   sound/soc/soc-card.c:950:17: error: 'struct snd_soc_card' has no member named 'remove_dai_link'
     950 |         if (card->remove_dai_link)
         |                 ^~
   sound/soc/soc-card.c:951:21: error: 'struct snd_soc_card' has no member named 'remove_dai_link'
     951 |                 card->remove_dai_link(card, dai_link);
         |                     ^~
   sound/soc/soc-card.c: In function 'soc_card_bind':
   sound/soc/soc-card.c:1036:50: error: 'struct snd_soc_card' has no member named 'dai_link'
    1036 |         ret = snd_soc_add_pcm_runtimes(card, card->dai_link, card->num_links);
         |                                                  ^~
   sound/soc/soc-card.c:1036:66: error: 'struct snd_soc_card' has no member named 'num_links'
    1036 |         ret = snd_soc_add_pcm_runtimes(card, card->dai_link, card->num_links);
         |                                                                  ^~
   sound/soc/soc-card.c:1042:32: error: 'struct snd_soc_card' has no member named 'owner'
    1042 |                            card->owner, 0, &snd_card);
         |                                ^~
   sound/soc/soc-card.c:1055:51: error: 'struct snd_soc_card' has no member named 'dapm_widgets'
    1055 |         ret = snd_soc_dapm_new_controls(dapm, card->dapm_widgets,
         |                                                   ^~
   sound/soc/soc-card.c:1056:45: error: 'struct snd_soc_card' has no member named 'num_dapm_widgets'
    1056 |                                         card->num_dapm_widgets);
         |                                             ^~
   sound/soc/soc-card.c:1060:51: error: 'struct snd_soc_card' has no member named 'of_dapm_widgets'
    1060 |         ret = snd_soc_dapm_new_controls(dapm, card->of_dapm_widgets,
         |                                                   ^~
   sound/soc/soc-card.c:1061:45: error: 'struct snd_soc_card' has no member named 'num_of_dapm_widgets'
    1061 |                                         card->num_of_dapm_widgets);
         |                                             ^~
   sound/soc/soc-card.c:1105:51: error: 'struct snd_soc_card' has no member named 'controls'
    1105 |         ret = snd_soc_card_add_controls(card, card->controls,
         |                                                   ^~
   sound/soc/soc-card.c:1106:45: error: 'struct snd_soc_card' has no member named 'num_controls'
    1106 |                                         card->num_controls);
         |                                             ^~
   sound/soc/soc-card.c:1110:51: error: 'struct snd_soc_card' has no member named 'dapm_routes'; did you mean 'dapm_mutex'?
    1110 |         ret = snd_soc_dapm_add_routes(dapm, card->dapm_routes,
         |                                                   ^~~~~~~~~~~
         |                                                   dapm_mutex
   sound/soc/soc-card.c:1111:43: error: 'struct snd_soc_card' has no member named 'num_dapm_routes'
    1111 |                                       card->num_dapm_routes);
         |                                           ^~
   sound/soc/soc-card.c:1115:49: error: 'struct snd_soc_card' has no member named 'of_dapm_routes'
    1115 |         ret = snd_soc_dapm_add_routes(dapm, card->of_dapm_routes,
         |                                                 ^~
   sound/soc/soc-card.c:1116:43: error: 'struct snd_soc_card' has no member named 'num_of_dapm_routes'
    1116 |                                       card->num_of_dapm_routes);
         |                                           ^~
>> sound/soc/soc-card.c:1125:61: error: 'struct snd_soc_card' has no member named 'driver_name'
    1125 |         soc_card_setup_name(card, snd_card->driver,     card->driver_name,      card->name);
         |                                                             ^~
   sound/soc/soc-card.c:644:57: note: in definition of macro 'soc_card_setup_name'
     644 |         __soc_card_setup_name(card, name, sizeof(name), name1, name2)
         |                                                         ^~~~~
   sound/soc/soc-card.c: At top level:
   sound/soc/soc-card.c:1365:5: warning: no previous prototype for 'snd_soc_register_card' [-Wmissing-prototypes]
    1365 | int snd_soc_register_card(struct snd_soc_card *card)
         |     ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_register_c':
   sound/soc/soc-card.c:1412:13: error: 'struct snd_soc_card' has no member named 'driver_name'
    1412 |         card->driver_name                       = driver->driver_name;
         |             ^~
   sound/soc/soc-card.c:1414:13: error: 'struct snd_soc_card' has no member named 'dai_link'
    1414 |         card->dai_link                          = driver->dai_link;
         |             ^~
   sound/soc/soc-card.c:1415:13: error: 'struct snd_soc_card' has no member named 'num_links'
    1415 |         card->num_links                         = driver->num_links;
         |             ^~
   sound/soc/soc-card.c:1416:13: error: 'struct snd_soc_card' has no member named 'codec_conf'
    1416 |         card->codec_conf                        = driver->codec_conf;
         |             ^~
   sound/soc/soc-card.c:1417:13: error: 'struct snd_soc_card' has no member named 'num_configs'
    1417 |         card->num_configs                       = driver->num_configs;
         |             ^~
   sound/soc/soc-card.c:1418:13: error: 'struct snd_soc_card' has no member named 'aux_dev'
    1418 |         card->aux_dev                           = driver->aux_dev;
         |             ^~
   sound/soc/soc-card.c:1419:13: error: 'struct snd_soc_card' has no member named 'num_aux_devs'
    1419 |         card->num_aux_devs                      = driver->num_aux_devs;
         |             ^~
   sound/soc/soc-card.c:1420:13: error: 'struct snd_soc_card' has no member named 'controls'
    1420 |         card->controls                          = driver->controls;
         |             ^~
   sound/soc/soc-card.c:1421:13: error: 'struct snd_soc_card' has no member named 'num_controls'
    1421 |         card->num_controls                      = driver->num_controls;
         |             ^~
   sound/soc/soc-card.c:1422:13: error: 'struct snd_soc_card' has no member named 'dapm_widgets'
    1422 |         card->dapm_widgets                      = driver->dapm_widgets;
         |             ^~
   sound/soc/soc-card.c:1423:13: error: 'struct snd_soc_card' has no member named 'num_dapm_widgets'
    1423 |         card->num_dapm_widgets                  = driver->num_dapm_widgets;
         |             ^~
   sound/soc/soc-card.c:1424:15: error: 'struct snd_soc_card' has no member named 'dapm_routes'; did you mean 'dapm_mutex'?
    1424 |         card->dapm_routes                       = driver->dapm_routes;
         |               ^~~~~~~~~~~
         |               dapm_mutex
   sound/soc/soc-card.c:1425:13: error: 'struct snd_soc_card' has no member named 'num_dapm_routes'
    1425 |         card->num_dapm_routes                   = driver->num_dapm_routes;
         |             ^~
   sound/soc/soc-card.c:1426:13: error: 'struct snd_soc_card' has no member named 'of_dapm_widgets'
    1426 |         card->of_dapm_widgets                   = driver->of_dapm_widgets;
         |             ^~
   sound/soc/soc-card.c:1427:13: error: 'struct snd_soc_card' has no member named 'num_of_dapm_widgets'
    1427 |         card->num_of_dapm_widgets               = driver->num_of_dapm_widgets;
         |             ^~
   sound/soc/soc-card.c:1428:13: error: 'struct snd_soc_card' has no member named 'of_dapm_routes'
    1428 |         card->of_dapm_routes                    = driver->of_dapm_routes;
         |             ^~
   sound/soc/soc-card.c:1429:13: error: 'struct snd_soc_card' has no member named 'num_of_dapm_routes'
    1429 |         card->num_of_dapm_routes                = driver->num_of_dapm_routes;
         |             ^~
   sound/soc/soc-card.c:1430:13: error: 'struct snd_soc_card' has no member named 'of_ignore_suspend_widgets'
    1430 |         card->of_ignore_suspend_widgets         = driver->of_ignore_suspend_widgets;
         |             ^~
   sound/soc/soc-card.c:1431:13: error: 'struct snd_soc_card' has no member named 'num_of_ignore_suspend_widgets'
    1431 |         card->num_of_ignore_suspend_widgets     = driver->num_of_ignore_suspend_widgets;
         |             ^~
   sound/soc/soc-card.c:1432:13: error: 'struct snd_soc_card' has no member named 'fully_routed'
    1432 |         card->fully_routed                      = driver->fully_routed;
         |             ^~
   sound/soc/soc-card.c:1433:13: error: 'struct snd_soc_card' has no member named 'component_chaining'
    1433 |         card->component_chaining                = driver->component_chaining;
         |             ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_of_parse_simple_widgets':
   sound/soc/soc-card.c:1656:13: error: 'struct snd_soc_card' has no member named 'of_dapm_widgets'
    1656 |         card->of_dapm_widgets = widgets;
         |             ^~
   sound/soc/soc-card.c:1657:13: error: 'struct snd_soc_card' has no member named 'num_of_dapm_widgets'
    1657 |         card->num_of_dapm_widgets = num_widgets;
         |             ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_of_parse_pin_switches':
   sound/soc/soc-card.c:1788:13: error: 'struct snd_soc_card' has no member named 'controls'
    1788 |         card->controls = controls;
         |             ^~
   sound/soc/soc-card.c:1789:13: error: 'struct snd_soc_card' has no member named 'num_controls'
    1789 |         card->num_controls = nb_controls;
         |             ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_of_parse_audio_routing':
   sound/soc/soc-card.c:1886:13: error: 'struct snd_soc_card' has no member named 'num_of_dapm_routes'
    1886 |         card->num_of_dapm_routes = num_routes;
         |             ^~
   sound/soc/soc-card.c:1887:13: error: 'struct snd_soc_card' has no member named 'of_dapm_routes'
    1887 |         card->of_dapm_routes = routes;
         |             ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_of_parse_aux_devs':
   sound/soc/soc-card.c:1946:13: error: 'struct snd_soc_card' has no member named 'aux_dev'
    1946 |         card->aux_dev = aux;
         |             ^~
   sound/soc/soc-card.c:1947:13: error: 'struct snd_soc_card' has no member named 'num_aux_devs'


vim +1125 sound/soc/soc-card.c

d192dd4abdd21a Kuninori Morimoto 2026-06-26  1011  
96b47be0838670 Kuninori Morimoto 2026-06-26  1012  int soc_card_bind(struct snd_soc_card *card)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1013  {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1014  	struct snd_soc_pcm_runtime *rtd;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1015  	struct snd_soc_component *component;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1016  	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
fa417b021b0e61 Kuninori Morimoto 2026-06-18  1017  	struct snd_card *snd_card;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1018  	int ret;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1019  
e12c6b034d1d21 Kuninori Morimoto 2026-03-26  1020  	soc_card_mutex_lock_root(card);
96b47be0838670 Kuninori Morimoto 2026-06-26  1021  	soc_card_fill_dummy_dai(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1022  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1023  	snd_soc_dapm_init(dapm, card, NULL);
94c3e060a43641 Kuninori Morimoto 2026-05-27  1024  	list_del_init(&card->unbind_list);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1025  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1026  	/* check whether any platform is ignore machine FE and using topology */
96b47be0838670 Kuninori Morimoto 2026-06-26  1027  	soc_card_check_tplg_fes(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1028  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1029  	/* bind aux_devs too */
96b47be0838670 Kuninori Morimoto 2026-06-26  1030  	ret = soc_card_aux_bind(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1031  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1032  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1033  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1034  	/* add predefined DAI links to the list */
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1035  	card->num_rtd = 0;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1036  	ret = snd_soc_add_pcm_runtimes(card, card->dai_link, card->num_links);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1037  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1038  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1039  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1040  	/* card bind complete so register a sound card */
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1041  	ret = snd_card_new(card->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
fa417b021b0e61 Kuninori Morimoto 2026-06-18  1042  			   card->owner, 0, &snd_card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1043  	if (ret < 0) {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1044  		dev_err(card->dev,
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1045  			"ASoC: can't create sound card for card %s: %d\n",
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1046  			card->name, ret);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1047  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1048  	}
fa417b021b0e61 Kuninori Morimoto 2026-06-18  1049  	card->snd_card = snd_card;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1050  
96b47be0838670 Kuninori Morimoto 2026-06-26  1051  	soc_card_debugfs_init(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1052  
96b47be0838670 Kuninori Morimoto 2026-06-26  1053  	soc_card_resume_init(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1054  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1055  	ret = snd_soc_dapm_new_controls(dapm, card->dapm_widgets,
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1056  					card->num_dapm_widgets);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1057  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1058  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1059  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1060  	ret = snd_soc_dapm_new_controls(dapm, card->of_dapm_widgets,
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1061  					card->num_of_dapm_widgets);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1062  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1063  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1064  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1065  	/* initialise the sound card only once */
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1066  	ret = snd_soc_card_probe(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1067  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1068  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1069  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1070  	/* probe all components used by DAI links on this card */
96b47be0838670 Kuninori Morimoto 2026-06-26  1071  	ret = soc_card_link_components_probe(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1072  	if (ret < 0) {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1073  		if (ret != -EPROBE_DEFER) {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1074  			dev_err(card->dev,
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1075  				"ASoC: failed to instantiate card %d\n", ret);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1076  		}
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1077  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1078  	}
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1079  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1080  	/* probe auxiliary components */
96b47be0838670 Kuninori Morimoto 2026-06-26  1081  	ret = soc_card_aux_probe(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1082  	if (ret < 0) {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1083  		dev_err(card->dev,
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1084  			"ASoC: failed to probe aux component %d\n", ret);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1085  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1086  	}
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1087  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1088  	/* probe all DAI links on this card */
96b47be0838670 Kuninori Morimoto 2026-06-26  1089  	ret = soc_card_link_dais_probe(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1090  	if (ret < 0) {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1091  		dev_err(card->dev,
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1092  			"ASoC: failed to instantiate card %d\n", ret);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1093  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1094  	}
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1095  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1096  	for_each_card_rtds(card, rtd) {
96b47be0838670 Kuninori Morimoto 2026-06-26  1097  		ret = soc_card_init_pcm_runtime(card, rtd);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1098  		if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1099  			goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1100  	}
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1101  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1102  	snd_soc_dapm_link_dai_widgets(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1103  	snd_soc_dapm_connect_dai_link_widgets(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1104  
35c6980018dd42 Kuninori Morimoto 2026-07-15  1105  	ret = snd_soc_card_add_controls(card, card->controls,
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1106  					card->num_controls);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1107  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1108  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1109  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1110  	ret = snd_soc_dapm_add_routes(dapm, card->dapm_routes,
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1111  				      card->num_dapm_routes);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1112  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1113  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1114  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1115  	ret = snd_soc_dapm_add_routes(dapm, card->of_dapm_routes,
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1116  				      card->num_of_dapm_routes);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1117  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1118  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1119  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1120  	/* try to set some sane longname if DMI is available */
96b47be0838670 Kuninori Morimoto 2026-06-26  1121  	soc_card_set_dmi_name(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1122  
fa417b021b0e61 Kuninori Morimoto 2026-06-18  1123  	soc_card_setup_name(card, snd_card->shortname,	card->name,		NULL);
fa417b021b0e61 Kuninori Morimoto 2026-06-18  1124  	soc_card_setup_name(card, snd_card->longname,	card->long_name,	card->name);
fa417b021b0e61 Kuninori Morimoto 2026-06-18 @1125  	soc_card_setup_name(card, snd_card->driver,	card->driver_name,	card->name);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1126  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1127  	if (card->components) {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1128  		/* the current implementation of snd_component_add() accepts */
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1129  		/* multiple components in the string separated by space, */
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1130  		/* but the string collision (identical string) check might */
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1131  		/* not work correctly */
fa417b021b0e61 Kuninori Morimoto 2026-06-18  1132  		ret = snd_component_add(snd_card, card->components);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1133  		if (ret < 0) {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1134  			dev_err(card->dev, "ASoC: %s snd_component_add() failed: %d\n",
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1135  				card->name, ret);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1136  			goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1137  		}
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1138  	}
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1139  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1140  	/*
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1141  	 * Add device_link from card to component so that system_suspend
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1142  	 * will be done in the correct order. The card must suspend first
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1143  	 * to stop audio activity before the components suspend.
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1144  	 *
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1145  	 * If a driver pair already have a link in the opposite direction
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1146  	 * they must manage their own suspend order.
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1147  	 */
9d967b4b5508f1 Kuninori Morimoto 2026-06-26  1148  	for_each_card_components(card, component)
9d967b4b5508f1 Kuninori Morimoto 2026-06-26  1149  		soc_component_device_link_add(component);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1150  
96b47be0838670 Kuninori Morimoto 2026-06-26  1151  	ret = soc_card_late_probe(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1152  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1153  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1154  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1155  	ret = snd_soc_dapm_ignore_suspend_widgets(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1156  	if (ret < 0)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1157  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1158  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1159  	snd_soc_dapm_new_widgets(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1160  	snd_soc_card_fixup_controls(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1161  
fa417b021b0e61 Kuninori Morimoto 2026-06-18  1162  	ret = snd_card_register(snd_card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1163  	if (ret < 0) {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1164  		dev_err(card->dev, "ASoC: failed to register soundcard %d\n",
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1165  			ret);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1166  		goto probe_end;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1167  	}
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1168  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1169  	card->instantiated = 1;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1170  	snd_soc_dapm_mark_endpoints_dirty(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1171  	snd_soc_dapm_sync(dapm);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1172  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1173  	/* deactivate pins to sleep state */
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1174  	for_each_card_components(card, component)
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1175  		if (!snd_soc_component_active(component))
35c6980018dd42 Kuninori Morimoto 2026-07-15  1176  			pinctrl_pm_select_sleep_state(snd_soc_component_to_dev(component));
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1177  probe_end:
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1178  	if (ret < 0) {
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1179  		snd_soc_remove_device_links(card);
96b47be0838670 Kuninori Morimoto 2026-06-26  1180  		soc_card_cleanup_resources(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1181  	}
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1182  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1183  	if (ret == -EPROBE_DEFER) {
94c3e060a43641 Kuninori Morimoto 2026-05-27  1184  		list_add(&card->unbind_list, &unbind_list_head);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1185  		ret = 0;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1186  	}
e12c6b034d1d21 Kuninori Morimoto 2026-03-26  1187  	soc_card_mutex_unlock(card);
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1188  
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1189  	return ret;
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1190  }
d192dd4abdd21a Kuninori Morimoto 2026-06-26  1191  

:::::: The code at line 1125 was first introduced by commit
:::::: fa417b021b0e61192d84c1869b0be85de553f6e6 ASoC: soc-card: use local struct snd_card variable

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
