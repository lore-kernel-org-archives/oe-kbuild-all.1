Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455B93DFC9C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275481; cv=none; b=GOFyXWJAMPXLd6Jjw/xwOWSdxZF1rY/0Pv5FZ4q+iMqkocSv6GOHYlUpARF+s4+GZkSY+Rsgew3A9tpFKeO2gRXFoc2MzCb8fognaQ3T+TL0ssNkKxvRj88R/Msg9sEUTvRtkFhF/HH55paOWNMxzRdvI140Om+3IiXA/gVnqF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275481; c=relaxed/simple;
	bh=ZGE+tMUkMAoguDmD1y4UAdvAioTlQ6f1il3GXJdaURs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gqUUYh69G7ESLEMJZe+i9bvD0lwNzmU3y+vXzKH/osCwZAMNryVUWV9VLYXeU29ycD5KNuAZfWCc2uH7N3r60XmkqJIQk4awge6U0dnJKVI0pbMmtp+qgjtAYwzkL2b5tU5SxxQqnBCn/ZzWz5a/1JwWv6QgLOaaTVPRhKls48o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lm0YIaV6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lm0YIaV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784275477; x=1815811477;
  h=date:from:to:cc:subject:message-id;
  bh=ZGE+tMUkMAoguDmD1y4UAdvAioTlQ6f1il3GXJdaURs=;
  b=Lm0YIaV6z7A8qUgoDyLvCs9GJ54JwkQC5z3k3xtN+bKuaMZKjmaoXJxu
   ep1JhdMSlJ+CU0av1YDgZPmHfEOaVG9fizxgeCZswTXkjlInjBaC9wjN5
   LTLJG/8vdC/6IWFx/h/w9L7CvSU+iI5aFYgHjBTSeO9Efe8wQ0vQBo9as
   ur0tJ1D5jHglYZTqobo2pC8jy5OX0nhTaqK2TXvE9AoMfaOOyRRps8yk7
   zNyEpVwkpZIt/S4BwNz8vLQr295CJangm1crxf+nEvEIakkfIFINy76pO
   M0InYX6z2Wx/KOnxlQQGx3B/p9WdPepD4tDwkldRTsTIeEOeQ4NbkV0z2
   w==;
X-CSE-ConnectionGUID: nWt3CSGGRjKUpXc33as/Pw==
X-CSE-MsgGUID: XgY7Fr1cT9y+vGQZJed2aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="83927977"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="83927977"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 01:04:36 -0700
X-CSE-ConnectionGUID: nUaoYMGkRT6rOQBFqj2dwA==
X-CSE-MsgGUID: K2303ehzQsmC83OYTOQ3bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="254952859"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2026 01:04:35 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkdYd-000000005Tx-3eI3;
	Fri, 17 Jul 2026 08:04:31 +0000
Date: Fri, 17 Jul 2026 10:04:07 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 310/311]
 sound/soc/amd/vangogh/acp5x-mach.c:479:9: error: implicit declaration of
 function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'?
Message-ID: <202607170909.n7YYzrpQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: f582a99aba2473d5c49ad8088a35dda42539f6af [310/311] ASoC: soc-card.h: remove compatible definition
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260717/202607170909.n7YYzrpQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607170909.n7YYzrpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607170909.n7YYzrpQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/amd/vangogh/acp5x-mach.c: In function 'acp5x_probe':
>> sound/soc/amd/vangogh/acp5x-mach.c:479:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     479 |         snd_soc_card_set_drvdata(card, machine);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
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
--
   sound/soc/intel/boards/sof_wm8804.c: In function 'sof_wm8804_probe':
>> sound/soc/intel/boards/sof_wm8804.c:279:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     279 |         snd_soc_card_set_drvdata(card, ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
--
   sound/soc/intel/boards/cht_bsw_rt5645.c: In function 'snd_cht_mc_probe':
>> sound/soc/intel/boards/cht_bsw_rt5645.c:683:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     683 |         snd_soc_card_set_drvdata(card, drv);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
--
   sound/soc/intel/boards/skl_hda_dsp_generic.c: In function 'skl_hda_audio_probe':
>> sound/soc/intel/boards/skl_hda_dsp_generic.c:163:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     163 |         snd_soc_card_set_drvdata(card, ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
--
   sound/soc/intel/boards/ehl_rt5660.c: In function 'snd_ehl_rt5660_probe':
>> sound/soc/intel/boards/ehl_rt5660.c:282:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     282 |         snd_soc_card_set_drvdata(card, ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
--
   sound/soc/intel/boards/sof_sdw.c: In function 'create_sdw_dailink':
>> sound/soc/intel/boards/sof_sdw.c:891:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     891 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/intel/boards/sof_sdw.c:891:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/intel/boards/sof_sdw.c: In function 'create_sdw_dailinks':
   sound/soc/intel/boards/sof_sdw.c:1037:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1037 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_sdw.c: In function 'create_hdmi_dailinks':
   sound/soc/intel/boards/sof_sdw.c:1136:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1136 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_sdw.c: In function 'sof_card_dai_links_create':
   sound/soc/intel/boards/sof_sdw.c:1240:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1240 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
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
..


vim +479 sound/soc/amd/vangogh/acp5x-mach.c

34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  459  
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  460  static int acp5x_probe(struct platform_device *pdev)
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  461  {
3dd26e27ccb4f1 Cristian Ciocaltea 2023-07-06  462  	const struct dmi_system_id *dmi_id;
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  463  	struct acp5x_platform_info *machine;
ddd42a12a33eb4 Lucas Tanure       2023-02-17  464  	struct device *dev = &pdev->dev;
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  465  	struct snd_soc_card *card;
ffd8dcfcd05c65 Kuninori Morimoto  2026-04-20  466  	struct snd_soc_card_driver *card_driver;
ddd42a12a33eb4 Lucas Tanure       2023-02-17  467  	int ret;
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  468  
3dd26e27ccb4f1 Cristian Ciocaltea 2023-07-06  469  	dmi_id = dmi_first_match(acp5x_vg_quirk_table);
ddd1ee12a8fb6e Cristian Ciocaltea 2023-12-09  470  	if (!dmi_id || !dmi_id->driver_data)
3dd26e27ccb4f1 Cristian Ciocaltea 2023-07-06  471  		return -ENODEV;
3dd26e27ccb4f1 Cristian Ciocaltea 2023-07-06  472  
ffd8dcfcd05c65 Kuninori Morimoto  2026-04-20  473  	card = snd_soc_card_alloc(dev);
50e81116ef576b Lucas Tanure       2023-02-17  474  	machine = devm_kzalloc(dev, sizeof(*machine), GFP_KERNEL);
ffd8dcfcd05c65 Kuninori Morimoto  2026-04-20  475  	if (!card || !machine)
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  476  		return -ENOMEM;
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  477  
ffd8dcfcd05c65 Kuninori Morimoto  2026-04-20  478  	card_driver = dmi_id->driver_data;
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14 @479  	snd_soc_card_set_drvdata(card, machine);
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  480  
ffd8dcfcd05c65 Kuninori Morimoto  2026-04-20  481  	ret = devm_snd_soc_card_register(card, card_driver);
ddd42a12a33eb4 Lucas Tanure       2023-02-17  482  	if (ret)
ddd42a12a33eb4 Lucas Tanure       2023-02-17  483  		return dev_err_probe(dev, ret, "Register card (%s) failed\n", card->name);
ddd42a12a33eb4 Lucas Tanure       2023-02-17  484  
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  485  	return 0;
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  486  }
34a0094b9ff7b7 Vijendar Mukunda   2021-10-14  487  

:::::: The code at line 479 was first introduced by commit
:::::: 34a0094b9ff7b7544591a6841f9b61747033f292 ASoC: amd: add vangogh machine driver

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
