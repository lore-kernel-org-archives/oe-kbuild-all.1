Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132753F23D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781650330; cv=none; b=OO7Nf1/eQosws8Kj64kmYay7CBJ7UB8/BGJP1B/hjxPDxMolXui3AnAjOaobH6xE6NiD9ItK/XJcJA8O6Ng4g3l39o5ARq7/aDnl9veVK+paovkyVbTpHdfZvfP6hPUthUQe/He/FwKKMmXAfjUEu/nGmIHjcjUGQAYNmadyFV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781650330; c=relaxed/simple;
	bh=NI+lOlIiSQ0ae44zkPHqWzl6GbotHRt1ViJwE18XHow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R4jjCUaMJWrS2WoV94k9gK9AVi/VWJtEhrg9jdozTtyvVbi/2NVeOpjgRP7VMPIUAyRrk9VUgpH1JKerhy7jL0kW7FuhIjqNgaozHhvihIiUTAPRg3G0PM0i3J35xOJel6FyGUd3wL3fc2RB5xLI8P2WFX5U2p7oNPEcfaz5os8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbmgqmxH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbmgqmxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781650329; x=1813186329;
  h=date:from:to:cc:subject:message-id;
  bh=NI+lOlIiSQ0ae44zkPHqWzl6GbotHRt1ViJwE18XHow=;
  b=QbmgqmxH5XNe3VUV0ax/QofY4nX1EGAoSS6XwMeAhGWz3IVeuQhY+U+h
   FN8T5/FrJBn+Y8EsNzqj6LRjiZwnq5Xic9nQWnIO5AazzxLI9mBqvplNI
   xagjXqKC2ioqjIBR8SqdIHaoWuGNz4DKBQVA7A/oMwhiz378QDD9oMzq+
   QWpPNQMTOqNe9C2dTfSac6zYCpBKckbxBY6RuX6I+oLHy8xYJWWwRXs4D
   TfRIvUh1Y59X821mNXM652NyrzLpy4QTSEuk0xrOtBVMx93E05yRoV+nA
   EvSyiJtwOdut4hoYz2PQNQMP65jIemUXL9An47lXGOO9PtSo9ttAkuYk1
   w==;
X-CSE-ConnectionGUID: X5sp2twdSx+3dX7xb5AlDQ==
X-CSE-MsgGUID: nY6ycA6ARt+a+yTV3x6Vng==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82478833"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82478833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 15:52:06 -0700
X-CSE-ConnectionGUID: n6vkqTy7R6elwNFTasjO8Q==
X-CSE-MsgGUID: HxqbDu10QjyiEFCsVDJWbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="241550086"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jun 2026 15:52:05 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZcdX-000000005Ef-11gO;
	Tue, 16 Jun 2026 22:52:03 +0000
Date: Wed, 17 Jun 2026 00:51:09 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 325/326]
 sound/soc/soc-card.c:1337:14: error: 'card_driver' undeclared
Message-ID: <202606170015.orKXCupV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: bcca3afbe4030eb595d239674303afc5fd051920 [325/326] ASoC: soc-card.h: remove compatible definition
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260617/202606170015.orKXCupV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170015.orKXCupV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170015.orKXCupV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/soc-card.c:42:6: warning: no previous prototype for 'snd_soc_card_attach_priv' [-Wmissing-prototypes]
      42 | void snd_soc_card_attach_priv(struct snd_soc_card *card, void *data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_remove':
   sound/soc/soc-card.c:886:27: error: 'struct snd_soc_card_driver' has no member named 'probed'; did you mean 'probe'?
     886 |         if (card->driver->probed &&
         |                           ^~~~~~
         |                           probe
   sound/soc/soc-card.c: At top level:
>> sound/soc/soc-card.c:1268:6: warning: no previous prototype for 'snd_soc_card_set_pci_ssid' [-Wmissing-prototypes]
    1268 | void snd_soc_card_set_pci_ssid(struct snd_soc_card *card,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_set_pci_ssid':
   sound/soc/soc-card.c:1272:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_vendor'
    1272 |         card->pci_subsystem_vendor = vendor;
         |             ^~
   sound/soc/soc-card.c:1273:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_device'
    1273 |         card->pci_subsystem_device = device;
         |             ^~
   sound/soc/soc-card.c:1274:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_set'
    1274 |         card->pci_subsystem_set = true;
         |             ^~
   sound/soc/soc-card.c: At top level:
>> sound/soc/soc-card.c:1293:5: warning: no previous prototype for 'snd_soc_card_get_pci_ssid' [-Wmissing-prototypes]
    1293 | int snd_soc_card_get_pci_ssid(struct snd_soc_card *card,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_get_pci_ssid':
   sound/soc/soc-card.c:1297:18: error: 'struct snd_soc_card' has no member named 'pci_subsystem_set'
    1297 |         if (!card->pci_subsystem_set)
         |                  ^~
   sound/soc/soc-card.c:1300:23: error: 'struct snd_soc_card' has no member named 'pci_subsystem_vendor'
    1300 |         *vendor = card->pci_subsystem_vendor;
         |                       ^~
   sound/soc/soc-card.c:1301:23: error: 'struct snd_soc_card' has no member named 'pci_subsystem_device'
    1301 |         *device = card->pci_subsystem_device;
         |                       ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_register3':
>> sound/soc/soc-card.c:1337:14: error: 'card_driver' undeclared (first use in this function)
    1337 |         if (!card_driver->name)
         |              ^~~~~~~~~~~
   sound/soc/soc-card.c:1337:14: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/soc-card.c:1351:24: error: returning 'int' from a function with return type 'struct snd_soc_card *' makes pointer from integer without a cast [-Wint-conversion]
    1351 |                 return -ENOMEM;
         |                        ^


vim +/card_driver +1337 sound/soc/soc-card.c

  1266	
  1267	/* REMOVE ME */
> 1268	void snd_soc_card_set_pci_ssid(struct snd_soc_card *card,
  1269				       unsigned short vendor,
  1270				       unsigned short device)
  1271	{
  1272		card->pci_subsystem_vendor = vendor;
  1273		card->pci_subsystem_device = device;
  1274		card->pci_subsystem_set = true;
  1275	}
  1276	EXPORT_SYMBOL_GPL(snd_soc_card_set_pci_ssid);
  1277	
  1278	int snd_soc_card_driver_get_pci_ssid(struct snd_soc_card_driver *card_driver,
  1279					     unsigned short *vendor,
  1280					     unsigned short *device)
  1281	{
  1282		if (!card_driver->pci_subsystem_set)
  1283			return -ENOENT;
  1284	
  1285		*vendor = card_driver->pci_subsystem_vendor;
  1286		*device = card_driver->pci_subsystem_device;
  1287	
  1288		return 0;
  1289	}
  1290	EXPORT_SYMBOL_GPL(snd_soc_card_driver_get_pci_ssid);
  1291	
  1292	/* REMOVE ME */
> 1293	int snd_soc_card_get_pci_ssid(struct snd_soc_card *card,
  1294				      unsigned short *vendor,
  1295				      unsigned short *device)
  1296	{
  1297		if (!card->pci_subsystem_set)
  1298			return -ENOENT;
  1299	
  1300		*vendor = card->pci_subsystem_vendor;
  1301		*device = card->pci_subsystem_device;
  1302	
  1303		return 0;
  1304	}
  1305	EXPORT_SYMBOL_GPL(snd_soc_card_get_pci_ssid);
  1306	#endif /* CONFIG_PCI */
  1307	
  1308	struct snd_soc_dai *snd_soc_card_get_codec_dai(struct snd_soc_card *card,
  1309						       const char *dai_name)
  1310	{
  1311		struct snd_soc_pcm_runtime *rtd;
  1312	
  1313		for_each_card_rtds(card, rtd) {
  1314			const struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
  1315	
  1316			if (!strcmp(snd_soc_dai_name(dai), dai_name))
  1317				return snd_soc_rtd_to_codec(rtd, 0);
  1318		}
  1319	
  1320		return NULL;
  1321	}
  1322	EXPORT_SYMBOL_GPL(snd_soc_card_get_codec_dai);
  1323	
  1324	void soc_card_flush_all_delayed_work(struct snd_soc_card *card)
  1325	{
  1326		struct snd_soc_pcm_runtime *rtd;
  1327	
  1328		for_each_card_rtds(card, rtd)
  1329			flush_delayed_work(&rtd->delayed_work);
  1330	}
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
