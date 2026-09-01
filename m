Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783B2434406
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Sep 2026 15:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276600; cv=none; b=KO2Q6r6nBRNKN6p9wjjPMwtdf6ExIWMbp3W1op/my0/kg3MOfxji+x8OeGOiH6ReHqyVC8cD47yTSHpgpQ8KKZWl6b630YGxYs61iK4RwXimnoH4r1jSDzT/RSV9Ay8YYgV/UhzlC85Ps5N8TfMbjvtSy47NmL+X7wBRomdcRJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276600; c=relaxed/simple;
	bh=hQLT7NYZJDMYPagK5Smpz8D9yCExQDzLK6IUT3XCwp8=;
	h=Date:From:Cc:Subject:Message-ID; b=cuNfalGmkIGu/4hDXidBdAMPDf0aD01vmp6hULshUkx4OdGM5stsF3wT2p1KRo8XMH5AWAw7sd9ZKx0aOEinOG2MaeX6caX+EtwHEq9e63hc6DwfLloFUWHVuPgcnBay/7pMWce46y//bh5Ov1cyw//mLekRR2H7n1lNkUL2yBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVAbXtxK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVAbXtxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788276595; x=1819812595;
  h=date:from:cc:subject:message-id;
  bh=hQLT7NYZJDMYPagK5Smpz8D9yCExQDzLK6IUT3XCwp8=;
  b=mVAbXtxKbs1vvo+4V7gnMjSlNNf0qkYtBA4ZaixWFQoKYpuIRv/2lF+9
   zBOK2Cr6xsoAHR1AfR3sGUDBdGca7FEPPtGpb9XSIyHAepaZCaFId/Mn6
   o5JbYBGtuNtReJww3CeaANKgYXipblb8HqRM59E+Wgq1IWt9iDW5mu6/7
   SZ6EcQF9nSaThMJpvtueWtmjOpc54YiwHuT66i0C2A36NQHK93YiCHOF9
   52VZ/vOtC/nA3izL8Y993PUXkaiy9kRKkca8COm04ylXNfHKAidtdkYxC
   EVdBm/mifpUcRl0fQepkHE4cj2Yf9mDQXaUqf4RLBHIbgzVUAaZLVx8CE
   Q==;
X-CSE-ConnectionGUID: CEE1sQrdTxGrtl4q0Egp1g==
X-CSE-MsgGUID: eu1/hOEwQnigAL3ye1gV5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99871490"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="99871490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 08:29:49 -0700
X-CSE-ConnectionGUID: EJNYPOWYTSGOf+Y0ma85FA==
X-CSE-MsgGUID: 1Y2P2GAyQ2eGM9RHK2Ed1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="262991286"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2026 08:29:45 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1QQg-0000000013E-0nJv;
	Tue, 01 Sep 2026 15:29:42 +0000
Date: Tue, 01 Sep 2026 23:29:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:drm-misc-next 1/4] sound/soc/ti/omap-hdmi.c:408:6:
 error: no member named 'card' in 'struct hdmi_audio_data'
Message-ID: <202609012352.GcRJ83AM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   0116f19db5931348c937eafa1f76a9a19bf82c81
commit: 1ae7fe832c2d3ecc75815eed037a07290586b6be [1/4] Merge drm/drm-next into drm-misc-next
config: powerpc-randconfig-r071-20260901 (https://download.01.org/0day-ci/archive/20260901/202609012352.GcRJ83AM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609012352.GcRJ83AM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609012352.GcRJ83AM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/ti/omap-hdmi.c:408:6: error: no member named 'card' in 'struct hdmi_audio_data'
     408 |         ad->card = card;
         |         ~~  ^
   1 error generated.


vim +408 sound/soc/ti/omap-hdmi.c

50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  333  
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  334  static int omap_hdmi_audio_probe(struct platform_device *pdev)
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  335  {
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  336  	struct omap_hdmi_audio_pdata *ha = pdev->dev.platform_data;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  337  	struct device *dev = &pdev->dev;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  338  	struct hdmi_audio_data *ad;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  339  	struct snd_soc_dai_driver *dai_drv;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  340  	struct snd_soc_card *card;
3b785a63ee3d2bc sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2019-06-06  341  	struct snd_soc_dai_link_component *compnent;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  342  	int ret;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  343  
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  344  	if (!ha) {
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  345  		dev_err(dev, "No platform data\n");
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  346  		return -EINVAL;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  347  	}
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  348  
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  349  	ad = devm_kzalloc(dev, sizeof(*ad), GFP_KERNEL);
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  350  	if (!ad)
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  351  		return -ENOMEM;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  352  	ad->dssdev = ha->dev;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  353  	ad->ops = ha->ops;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  354  	ad->dma_data.addr = ha->audio_dma_addr;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  355  	ad->dma_data.filter_data = "audio_tx";
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  356  	ad->dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  357  	mutex_init(&ad->current_stream_lock);
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  358  
d20fa5a06d7bddb sound/soc/omap/omap-hdmi-audio.c Laurent Pinchart  2017-08-11  359  	switch (ha->version) {
d20fa5a06d7bddb sound/soc/omap/omap-hdmi-audio.c Laurent Pinchart  2017-08-11  360  	case 4:
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  361  		dai_drv = &omap4_hdmi_dai;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  362  		break;
d20fa5a06d7bddb sound/soc/omap/omap-hdmi-audio.c Laurent Pinchart  2017-08-11  363  	case 5:
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  364  		dai_drv = &omap5_hdmi_dai;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  365  		break;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  366  	default:
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  367  		return -EINVAL;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  368  	}
642a722d3116fbd sound/soc/omap/omap-hdmi-audio.c Kuninori Morimoto 2018-09-07  369  	ret = devm_snd_soc_register_component(ad->dssdev, &omap_hdmi_component,
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  370  					 dai_drv, 1);
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  371  	if (ret)
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  372  		return ret;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  373  
b1a549c6be09243 sound/soc/omap/omap-hdmi-audio.c Peter Ujfalusi    2018-05-07  374  	ret = sdma_pcm_platform_register(ad->dssdev, "audio_tx", NULL);
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  375  	if (ret)
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  376  		return ret;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  377  
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  378  	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
fb5ab7296a2bea1 sound/soc/omap/omap-hdmi-audio.c Kiran Padwal      2015-02-12  379  	if (!card)
fb5ab7296a2bea1 sound/soc/omap/omap-hdmi-audio.c Kiran Padwal      2015-02-12  380  		return -ENOMEM;
fb5ab7296a2bea1 sound/soc/omap/omap-hdmi-audio.c Kiran Padwal      2015-02-12  381  
524d3f126362b60 sound/soc/ti/omap-hdmi.c         Primoz Fiser      2024-06-10  382  	card->name = "HDMI";
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  383  	card->owner = THIS_MODULE;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  384  	card->dai_link =
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  385  		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);
18c94a043d6a466 sound/soc/omap/omap-hdmi-audio.c Julia Lawall      2015-12-20  386  	if (!card->dai_link)
18c94a043d6a466 sound/soc/omap/omap-hdmi-audio.c Julia Lawall      2015-12-20  387  		return -ENOMEM;
3b785a63ee3d2bc sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2019-06-06  388  
bae071aa7bcd034 sound/soc/ti/omap-hdmi.c         Yuuki NAGAO       2025-05-31  389  	compnent = devm_kzalloc(dev, 2 * sizeof(*compnent), GFP_KERNEL);
3b785a63ee3d2bc sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2019-06-06  390  	if (!compnent)
3b785a63ee3d2bc sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2019-06-06  391  		return -ENOMEM;
bae071aa7bcd034 sound/soc/ti/omap-hdmi.c         Yuuki NAGAO       2025-05-31  392  	card->dai_link->cpus		= &compnent[0];
3b785a63ee3d2bc sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2019-06-06  393  	card->dai_link->num_cpus	= 1;
1af529320d56e99 sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2023-09-11  394  	card->dai_link->codecs		= &snd_soc_dummy_dlc;
3b785a63ee3d2bc sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2019-06-06  395  	card->dai_link->num_codecs	= 1;
bae071aa7bcd034 sound/soc/ti/omap-hdmi.c         Yuuki NAGAO       2025-05-31  396  	card->dai_link->platforms	= &compnent[1];
bae071aa7bcd034 sound/soc/ti/omap-hdmi.c         Yuuki NAGAO       2025-05-31  397  	card->dai_link->num_platforms	= 1;
3b785a63ee3d2bc sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2019-06-06  398  
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  399  	card->dai_link->name = card->name;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  400  	card->dai_link->stream_name = card->name;
3b785a63ee3d2bc sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2019-06-06  401  	card->dai_link->cpus->dai_name = dev_name(ad->dssdev);
bae071aa7bcd034 sound/soc/ti/omap-hdmi.c         Yuuki NAGAO       2025-05-31  402  	card->dai_link->platforms->name = dev_name(ad->dssdev);
699e5975e2a5382 sound/soc/ti/omap-hdmi.c         Ivaylo Dimitrov   2026-08-19  403  	card->dai_link->init = hdmi_audio_dai_init;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  404  	card->num_links = 1;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  405  	card->dev = dev;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  406  
699e5975e2a5382 sound/soc/ti/omap-hdmi.c         Ivaylo Dimitrov   2026-08-19  407  	atomic_set(&ad->jack_state, -1);
699e5975e2a5382 sound/soc/ti/omap-hdmi.c         Ivaylo Dimitrov   2026-08-19 @408  	ad->card = card;
699e5975e2a5382 sound/soc/ti/omap-hdmi.c         Ivaylo Dimitrov   2026-08-19  409  
699e5975e2a5382 sound/soc/ti/omap-hdmi.c         Ivaylo Dimitrov   2026-08-19  410  	snd_soc_card_set_drvdata(card, ad);
98e9645a35993f8 sound/soc/ti/omap-hdmi.c         Kuninori Morimoto 2024-01-11  411  	ret = devm_snd_soc_register_card(dev, card);
492a53506ab27d5 sound/soc/ti/omap-hdmi.c         bui duc phuc      2026-07-16  412  	if (ret)
492a53506ab27d5 sound/soc/ti/omap-hdmi.c         bui duc phuc      2026-07-16  413  		return dev_err_probe(dev, ret, "snd_soc_register_card() failed\n");
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  414  
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  415  	dev_set_drvdata(dev, ad);
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  416  
699e5975e2a5382 sound/soc/ti/omap-hdmi.c         Ivaylo Dimitrov   2026-08-19  417  	ha->audio_hpd = hdmi_audio_hpd;
699e5975e2a5382 sound/soc/ti/omap-hdmi.c         Ivaylo Dimitrov   2026-08-19  418  
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  419  	return 0;
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  420  }
50211be80290b06 sound/soc/omap/omap-hdmi-audio.c Jyri Sarha        2014-08-15  421  

:::::: The code at line 408 was first introduced by commit
:::::: 699e5975e2a53820d8248e4e69e3645d8fa3eff8 drm/omap: Report HDMI hotplug events to the ASoC HDMI codec

:::::: TO: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
