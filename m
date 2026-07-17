Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8183C4149
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300128; cv=none; b=FvOsEJy8EiqNfaNrb97LO1gHE3wnzwsVmQGec1nrDAJD+rBWwH/e80GfOhjVHlDlK2dVprH5ZYjeggpFnNYJgB4ZXeJNJ/pyOZbB5Ldimdfd+h16RfR3UgFrpBlujrRaxKLUFGaqjRF9Fx5LFm8pJZGueao8hC/TMY1izKbfYX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300128; c=relaxed/simple;
	bh=zvtxkKIcUIlbhoWNRk7QrHvcWpV6YddxO4qVOIwUhnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VTSnQx0Io2AZiOyHPXCkS+PZOLfd9mEWVdGMNoqlZVWPiNgqsycl1/eyEt7hdIAMVITOEGKQdH8/Lxyfp3xyCWTDGEX0MLVgTflafYwuvw5iqWjVbVzRKO2iMFMsfQJEIEzx8YDqYPuQbNRWlOY1w11DFUWaybI/IhZvMaA94RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CB0AwVHM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CB0AwVHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784300125; x=1815836125;
  h=date:from:to:cc:subject:message-id;
  bh=zvtxkKIcUIlbhoWNRk7QrHvcWpV6YddxO4qVOIwUhnQ=;
  b=CB0AwVHMl1v6XkHZkKc0byjd3C61nEvPQiIPAnwOsdWRIVzadbem8KFP
   mNUWNABqQtdIORkUkvxavgGjt4fDx0qhIfj3uHqwgThNjIzqxxpjbkNzz
   CeoanvDQNR7Ue837IPwR/8eVruuIt40/K2qFgHh1MsS+RiKziVyJwfblF
   gLFBnVDA3Z+OYyk+Cv18ImXYzB+yy+az6ofpX6sLFK2vKn0bi3uOrdn1a
   /B/1Le1Kq1usu8PVoQFw7ap6ew9DmC06B5hnwQ0lHVVFKgGsYK3EXg/YM
   kba4zytNCPFrgZJAiaYK5IED7dW53GwevE4lFBb0YVWvZghKG4TtQl1gy
   w==;
X-CSE-ConnectionGUID: C3geqIfKQPGDsZdj4BSLwA==
X-CSE-MsgGUID: Z5l40bUYRm2aKc8UeG5hLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="87518015"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="87518015"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 07:55:22 -0700
X-CSE-ConnectionGUID: Or9kP44sSpmUcqxrVMI3YQ==
X-CSE-MsgGUID: u1wZ0h39QW+VY94vBynv7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="281258790"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2026 07:55:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkjy9-00000000Sps-3U3O;
	Fri, 17 Jul 2026 14:55:17 +0000
Date: Fri, 17 Jul 2026 22:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 sound/soc/atmel/atmel-classd.c:475:35: warning: initialization of 'struct
 atmel_classd *' from 'int' makes pointer from integer without a cast
Message-ID: <202607172200.GUjbxJwn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: f582a99aba2473d5c49ad8088a35dda42539f6af [311/311] ASoC: soc-card.h: remove compatible definition
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607172200.GUjbxJwn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172200.GUjbxJwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172200.GUjbxJwn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/atmel/atmel-classd.c: In function 'atmel_classd_asoc_card_init':
   sound/soc/atmel/atmel-classd.c:475:35: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Werror=implicit-function-declaration]
     475 |         struct atmel_classd *dd = snd_soc_card_get_drvdata(card);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snd_soc_card_set_priv
>> sound/soc/atmel/atmel-classd.c:475:35: warning: initialization of 'struct atmel_classd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/atmel/atmel-classd.c: In function 'atmel_classd_probe':
   sound/soc/atmel/atmel-classd.c:605:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Werror=implicit-function-declaration]
     605 |         snd_soc_card_set_drvdata(card, dd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
   cc1: some warnings being treated as errors
--
   sound/soc/atmel/atmel-pdmic.c: In function 'atmel_pdmic_asoc_card_init':
   sound/soc/atmel/atmel-pdmic.c:492:34: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Werror=implicit-function-declaration]
     492 |         struct atmel_pdmic *dd = snd_soc_card_get_drvdata(card);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                  snd_soc_card_set_priv
>> sound/soc/atmel/atmel-pdmic.c:492:34: warning: initialization of 'struct atmel_pdmic *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/atmel/atmel-pdmic.c: In function 'atmel_pdmic_probe':
   sound/soc/atmel/atmel-pdmic.c:672:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Werror=implicit-function-declaration]
     672 |         snd_soc_card_set_drvdata(card, dd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
   cc1: some warnings being treated as errors
--
   sound/soc/loongson/loongson_card.c: In function 'loongson_card_parse_of':
   sound/soc/loongson/loongson_card.c:235:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Werror=implicit-function-declaration]
     235 |         struct loongson_card_data *data = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/loongson/loongson_card.c:235:43: warning: initialization of 'struct loongson_card_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/loongson/loongson_card.c: In function 'loongson_asoc_card_probe':
   sound/soc/loongson/loongson_card.c:327:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Werror=implicit-function-declaration]
     327 |         snd_soc_card_set_drvdata(card, ls_priv);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
   cc1: some warnings being treated as errors
--
   sound/soc/mediatek/mt8365/mt8365-mt6357.c: In function 'mt8365_mt6357_gpio_probe':
   sound/soc/mediatek/mt8365/mt8365-mt6357.c:248:51: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Werror=implicit-function-declaration]
     248 |         struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                                   snd_soc_card_set_priv
>> sound/soc/mediatek/mt8365/mt8365-mt6357.c:248:51: warning: initialization of 'struct mtk_soc_card_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8365/mt8365-mt6357.c: In function 'mt8365_mt6357_dev_probe':
   sound/soc/mediatek/mt8365/mt8365-mt6357.c:307:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Werror=implicit-function-declaration]
     307 |         snd_soc_card_set_drvdata(card, soc_card_data);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
   cc1: some warnings being treated as errors


vim +475 sound/soc/atmel/atmel-classd.c

e0a25b6d1862414 Songjun Wu        2015-10-08  469  
e0a25b6d1862414 Songjun Wu        2015-10-08  470  /* ASoC sound card */
3910bc3a08c297a Kuninori Morimoto 2026-04-20  471  static int atmel_classd_asoc_card_init(struct snd_soc_card *card,
3910bc3a08c297a Kuninori Morimoto 2026-04-20  472  				       struct snd_soc_card_driver *card_driver)
e0a25b6d1862414 Songjun Wu        2015-10-08  473  {
e0a25b6d1862414 Songjun Wu        2015-10-08  474  	struct snd_soc_dai_link *dai_link;
e0a25b6d1862414 Songjun Wu        2015-10-08 @475  	struct atmel_classd *dd = snd_soc_card_get_drvdata(card);
3d14a1df7d301eb Kuninori Morimoto 2019-06-06  476  	struct snd_soc_dai_link_component *comp;
3910bc3a08c297a Kuninori Morimoto 2026-04-20  477  	struct device *dev = snd_soc_card_to_dev(card);
e0a25b6d1862414 Songjun Wu        2015-10-08  478  
e0a25b6d1862414 Songjun Wu        2015-10-08  479  	dai_link = devm_kzalloc(dev, sizeof(*dai_link), GFP_KERNEL);
e0a25b6d1862414 Songjun Wu        2015-10-08  480  	if (!dai_link)
e0a25b6d1862414 Songjun Wu        2015-10-08  481  		return -ENOMEM;
e0a25b6d1862414 Songjun Wu        2015-10-08  482  
2ed22161b19b112 Andrei Simion     2024-06-04  483  	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
3d14a1df7d301eb Kuninori Morimoto 2019-06-06  484  	if (!comp)
3d14a1df7d301eb Kuninori Morimoto 2019-06-06  485  		return -ENOMEM;
3d14a1df7d301eb Kuninori Morimoto 2019-06-06  486  
2ed22161b19b112 Andrei Simion     2024-06-04  487  	dai_link->cpus		= &comp[0];
6547effc3aea50c Kuninori Morimoto 2023-09-11  488  	dai_link->codecs	= &snd_soc_dummy_dlc;
2ed22161b19b112 Andrei Simion     2024-06-04  489  	dai_link->platforms	= &comp[1];
3d14a1df7d301eb Kuninori Morimoto 2019-06-06  490  
3d14a1df7d301eb Kuninori Morimoto 2019-06-06  491  	dai_link->num_cpus	= 1;
3d14a1df7d301eb Kuninori Morimoto 2019-06-06  492  	dai_link->num_codecs	= 1;
2ed22161b19b112 Andrei Simion     2024-06-04  493  	dai_link->num_platforms = 1;
3d14a1df7d301eb Kuninori Morimoto 2019-06-06  494  
e0a25b6d1862414 Songjun Wu        2015-10-08  495  	dai_link->name			= "CLASSD";
e0a25b6d1862414 Songjun Wu        2015-10-08  496  	dai_link->stream_name		= "CLASSD PCM";
3d14a1df7d301eb Kuninori Morimoto 2019-06-06  497  	dai_link->cpus->dai_name	= dev_name(dev);
2ed22161b19b112 Andrei Simion     2024-06-04  498  	dai_link->platforms->name	= dev_name(dev);
e0a25b6d1862414 Songjun Wu        2015-10-08  499  
3910bc3a08c297a Kuninori Morimoto 2026-04-20  500  	card_driver->dai_link		= dai_link;
3910bc3a08c297a Kuninori Morimoto 2026-04-20  501  	card_driver->num_links		= 1;
3910bc3a08c297a Kuninori Morimoto 2026-04-20  502  	snd_soc_card_set_name(card, dd->pdata->card_name);
e0a25b6d1862414 Songjun Wu        2015-10-08  503  
e0a25b6d1862414 Songjun Wu        2015-10-08  504  	return 0;
e0a25b6d1862414 Songjun Wu        2015-10-08  505  };
e0a25b6d1862414 Songjun Wu        2015-10-08  506  

:::::: The code at line 475 was first introduced by commit
:::::: e0a25b6d18624140905d79775f9e1b05c12502f5 ASoC: atmel-classd: add the Audio Class D Amplifier

:::::: TO: Songjun Wu <songjun.wu@atmel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
