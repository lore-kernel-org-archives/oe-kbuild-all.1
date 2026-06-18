Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D674274FDF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 00:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781744303; cv=none; b=FbpcE5U0K23YqC5nj28o1f+p9D14BFPP1xjCNKXl5eUGqoT4mbzL/GG6s99I3t/9nvJjqb4fQfQpln3uRwqP2hwV5Eu3g4jMMdnHTdl9JtoCmcQXIWB7gSsbb7Fv3/OuQQzm8OXF1byfh3ez3qGML7tVjfJWhFjHAXucHWZsxe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781744303; c=relaxed/simple;
	bh=NG6VwlIPdBKCNmaO4ecFcnVc7fNPOHRqxGMjBmgLYn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ACYMLOVEFpSMx+jsdMn+Qu1d/6130qgxIm47QaxhVLw10TnhnL9MiuwlsqXSylK+KrxgmSdfIQ4aOaKWeZ9KKrPHFcIpcDIYNO9b2s6Y3G6w8j7Bvcqua4e7X45s/IDDrGTHf0AWyXkbXVF3ZKJ315lSzs63iXbskqTabHZATOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9pcZR0c; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9pcZR0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781744301; x=1813280301;
  h=date:from:to:cc:subject:message-id;
  bh=NG6VwlIPdBKCNmaO4ecFcnVc7fNPOHRqxGMjBmgLYn4=;
  b=X9pcZR0chFOMTcppZIntUEzPT4Nmgd8Ywz0aovEDAwaZIUFiX+cr/d+a
   fGbGqbUvm0Ahd7ajVh30MSLlcLSx2Lr74k8rj24vkv18yHF9CxAEpQl/c
   cvgosTSv63Xsj/Pc9OnCepXss7fpopalUeB0xG2MpLmjDm0SmXLoVeiK7
   DTxboyEDzBaaPYrXnHaprnC5ufQ0XE8L+6MUYW9Hm642dNsKpvFKdht0H
   ynKwozr0jQlVYiCfMpNT6I2QVZao4QpDJU7AVLzNxk8fAIfMJVxEGJryE
   NP5ZI/f5SkzBoIU7XQbLLt4Qpm4TO1gPEyNUYkq/pDU2F7hyTB356CdrB
   g==;
X-CSE-ConnectionGUID: V+/ljzrVR6mgKthlhjLkdg==
X-CSE-MsgGUID: dO5TUTGNTsePSEvnE/gGgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="85124873"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="85124873"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:20 -0700
X-CSE-ConnectionGUID: zm2syxlXQHOc3+kCHFexLg==
X-CSE-MsgGUID: rKWi6wbDR9uwrMqnl2cG5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="243864271"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2026 17:58:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa15F-00000000V8a-0Xq3;
	Thu, 18 Jun 2026 00:58:17 +0000
Date: Thu, 18 Jun 2026 08:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/soc-card.c:1337:14: error: 'card_driver' undeclared
Message-ID: <202606180809.rvSJ22YV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: bcca3afbe4030eb595d239674303afc5fd051920 [326/326] ASoC: soc-card.h: remove compatible definition
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260618/202606180809.rvSJ22YV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180809.rvSJ22YV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180809.rvSJ22YV-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-card.c:42:6: warning: no previous prototype for 'snd_soc_card_attach_priv' [-Wmissing-prototypes]
      42 | void snd_soc_card_attach_priv(struct snd_soc_card *card, void *data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_remove':
   sound/soc/soc-card.c:886:27: error: 'struct snd_soc_card_driver' has no member named 'probed'; did you mean 'probe'?
     886 |         if (card->driver->probed &&
         |                           ^~~~~~
         |                           probe
   sound/soc/soc-card.c: In function 'snd_soc_card_register3':
>> sound/soc/soc-card.c:1337:14: error: 'card_driver' undeclared (first use in this function)
    1337 |         if (!card_driver->name)
         |              ^~~~~~~~~~~
   sound/soc/soc-card.c:1337:14: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/soc-card.c:1351:24: error: returning 'int' from a function with return type 'struct snd_soc_card *' makes pointer from integer without a cast [-Wint-conversion]
    1351 |                 return -ENOMEM;
         |                        ^
--
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_system_name_from_ssid':
>> sound/soc/codecs/cs35l56-test.c:84:9: error: implicit declaration of function 'snd_soc_card_set_pci_ssid'; did you mean 'snd_soc_card_driver_set_pci_ssid'? [-Wimplicit-function-declaration]
      84 |         snd_soc_card_set_pci_ssid(card, 0x12b4, 0xa7c8);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_driver_set_pci_ssid
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_case_init_common':
   sound/soc/codecs/cs35l56-test.c:558:30: error: implicit declaration of function 'snd_soc_component_alloc'; did you mean 'snd_soc_component_close'? [-Wimplicit-function-declaration]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
         |                              snd_soc_component_close
   sound/soc/codecs/cs35l56-test.c:558:28: error: assignment to 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                            ^


vim +/card_driver +1337 sound/soc/soc-card.c

  1331	
  1332	struct snd_soc_card *snd_soc_card_register3(struct device *dev, struct snd_soc_card_driver *driver, void *priv)
  1333	{
  1334		struct snd_soc_card *card;
  1335		int ret;
  1336	
> 1337		if (!card_driver->name)
  1338	
  1339		card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
  1340		if (!card)
  1341			return NULL;
  1342	
  1343		card->dev	= dev;
  1344		card->devres_dev = dev;
  1345		card->priv	= priv;
  1346		card->driver	= driver;
  1347		card->instantiated = 0;
  1348	
  1349		card->dapm = snd_soc_dapm_alloc(card->dev);
  1350		if (!card->dapm)
> 1351			return -ENOMEM;
  1352	
  1353		dev_set_drvdata(card->dev, card);
  1354	
  1355		INIT_LIST_HEAD(&card->widget_list_head);
  1356		INIT_LIST_HEAD(&card->path_list_head);
  1357		INIT_LIST_HEAD(&card->dapm_list_head);
  1358		INIT_LIST_HEAD(&card->dapm_dirty_list_head);
  1359		INIT_LIST_HEAD(&card->aux_list_head);
  1360		INIT_LIST_HEAD(&card->component_list_head);
  1361		INIT_LIST_HEAD(&card->unbind_list);
  1362		INIT_LIST_HEAD(&card->rtd_list_head);
  1363	
  1364		mutex_init(&card->mutex);
  1365		mutex_init(&card->dapm_mutex);
  1366		mutex_init(&card->pcm_mutex);
  1367	
  1368		guard(mutex)(&client_mutex);
  1369	
  1370		ret = call_soc_bind_card(card);
  1371		if (ret < 0)
  1372			return NULL;
  1373	
  1374		return card;
  1375	}
  1376	EXPORT_SYMBOL_GPL(snd_soc_card_register3);
  1377	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
