Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487E3265CA2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283509; cv=none; b=uqhLfk/sY9bTRsjlf58zxY8ADLi7R4bsOm6YlalXWvV2Z6WkFBdeKqGie7wO9wndxvCMIdFdY8fdMMfpSPasMdA90iNIDgFXFaTyB5vW6OMFW3fylYFovxlfE7luO8HMy+J8DHsNTVd1XMSVqJSjMExfUzmkG3AHcHQ2ZjuptWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283509; c=relaxed/simple;
	bh=j0Bj9sY3eCfSSLIHE4eiMJ1PhvYBHZZuVzZcDePrUWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JYK03n16lZ2CYHuKcMAUoENvA3dklWpG+DnLDLgkzZb9oKTDug2LG3+TvS0yMGQ8XnvrTFKkwA9LAjy3hRiDhS2Yficn1BDdkRuxu9uWJHbz1yXfA3PosHlp+EeNalauc0Oi1kDz67KPWb3FQANp1visz62IxkZ04wdvhsFUYU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QC6jLdJc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QC6jLdJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784283507; x=1815819507;
  h=date:from:to:cc:subject:message-id;
  bh=j0Bj9sY3eCfSSLIHE4eiMJ1PhvYBHZZuVzZcDePrUWk=;
  b=QC6jLdJcP9V84ZDZxWncmT/WI+PtF0Us9nQFlMglRaBD69yfgLYx8Y7J
   CXO8V1W7ZPI9EdFTKKpP1OYUk6s1QJN5NsaIWC1SDF5AKCbkGxH9YjZwu
   zDbJA1+yfkvTLSdYVylK4UDhSmCKsY2DbrU+BAcF7pMIh/Iu4Thp3NvDN
   QJEfJVkPypEdmF3USx7Xftvs0rM1EDuXErJQWGHZ8AcKd/GeeHjHeCFDI
   /LALB+ISVHL3K+7nxzWt7EpTx5SfFErd6ZdMMZuSn575EqfRqcuBwEMyh
   Lar4jm0WRg4iToQ8sultErjv/x5zksiqCpDvkPw7a3XhdRiGgOn9EOorG
   A==;
X-CSE-ConnectionGUID: wjz8KzxtRs2+ABeJLZwC0w==
X-CSE-MsgGUID: F7uWd6ZZTKiwOh28f2PpZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96465901"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="96465901"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:18:27 -0700
X-CSE-ConnectionGUID: bs0bGDJtQSuTybd7DPLuBw==
X-CSE-MsgGUID: phzdTLwORHqWZ9Bw0qzlTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="261712865"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2026 03:18:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkfe0-00000000Sd9-14b7;
	Fri, 17 Jul 2026 10:18:15 +0000
Date: Fri, 17 Jul 2026 18:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 drivers/gpu/drm/vc4/vc4_hdmi.c:2430:9: error: implicit declaration of
 function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'?
Message-ID: <202607171824.jlu0D4Cg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: f582a99aba2473d5c49ad8088a35dda42539f6af [311/311] ASoC: soc-card.h: remove compatible definition
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607171824.jlu0D4Cg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171824.jlu0D4Cg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171824.jlu0D4Cg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_audio_init':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:2430:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
    2430 |         snd_soc_card_set_drvdata(card, vc4_hdmi);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv


vim +2430 drivers/gpu/drm/vc4/vc4_hdmi.c

2f9d51740cc30e David Turner           2025-03-17  2290  
3408cc23c9311f Maxime Ripard          2020-09-03  2291  static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
bb7d78568814a3 Eric Anholt            2017-02-27  2292  {
311e305fdb4e82 Maxime Ripard          2020-09-03  2293  	const struct vc4_hdmi_register *mai_data =
311e305fdb4e82 Maxime Ripard          2020-09-03  2294  		&vc4_hdmi->variant->registers[HDMI_MAI_DATA];
3408cc23c9311f Maxime Ripard          2020-09-03  2295  	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
2e9794035bd46b Kuninori Morimoto      2026-04-09  2296  	struct snd_soc_card *card;
2e9794035bd46b Kuninori Morimoto      2026-04-09  2297  	struct snd_soc_card_driver *card_driver = &vc4_hdmi->audio.card_driver;
3408cc23c9311f Maxime Ripard          2020-09-03  2298  	struct device *dev = &vc4_hdmi->pdev->dev;
bb7d78568814a3 Eric Anholt            2017-02-27  2299  	const __be32 *addr;
db2b927f8668ad Phil Elwell            2022-06-13  2300  	int index, len;
bb7d78568814a3 Eric Anholt            2017-02-27  2301  	int ret;
bb7d78568814a3 Eric Anholt            2017-02-27  2302  
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2303  	/*
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2304  	 * ASoC makes it a bit hard to retrieve a pointer to the
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2305  	 * vc4_hdmi structure. Registering the card will overwrite our
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2306  	 * device drvdata with a pointer to the snd_soc_card structure,
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2307  	 * which can then be used to retrieve whatever drvdata we want
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2308  	 * to associate.
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2309  	 *
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2310  	 * However, that doesn't fly in the case where we wouldn't
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2311  	 * register an ASoC card (because of an old DT that is missing
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2312  	 * the dmas properties for example), then the card isn't
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2313  	 * registered and the device drvdata wouldn't be set.
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2314  	 *
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2315  	 * We can deal with both cases by making sure a snd_soc_card
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2316  	 * pointer and a vc4_hdmi structure are pointing to the same
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2317  	 * memory address, so we can treat them indistinctly without any
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2318  	 * issue.
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2319  	 */
2e9794035bd46b Kuninori Morimoto      2026-04-09  2320  	BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card_driver) != 0);
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2321  	BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
0c9d0ddd9cf4b4 Maxime Ripard          2022-07-11  2322  
2e9794035bd46b Kuninori Morimoto      2026-04-09  2323  	card = snd_soc_card_alloc(dev);
2e9794035bd46b Kuninori Morimoto      2026-04-09  2324  	if (!card)
2e9794035bd46b Kuninori Morimoto      2026-04-09  2325  		return -ENOMEM;
2e9794035bd46b Kuninori Morimoto      2026-04-09  2326  
db2b927f8668ad Phil Elwell            2022-06-13  2327  	if (!of_find_property(dev->of_node, "dmas", &len) || !len) {
bb7d78568814a3 Eric Anholt            2017-02-27  2328  		dev_warn(dev,
db2b927f8668ad Phil Elwell            2022-06-13  2329  			 "'dmas' DT property is missing or empty, no HDMI audio\n");
bb7d78568814a3 Eric Anholt            2017-02-27  2330  		return 0;
bb7d78568814a3 Eric Anholt            2017-02-27  2331  	}
bb7d78568814a3 Eric Anholt            2017-02-27  2332  
311e305fdb4e82 Maxime Ripard          2020-09-03  2333  	if (mai_data->reg != VC4_HD) {
311e305fdb4e82 Maxime Ripard          2020-09-03  2334  		WARN_ONCE(true, "MAI isn't in the HD block\n");
311e305fdb4e82 Maxime Ripard          2020-09-03  2335  		return -EINVAL;
311e305fdb4e82 Maxime Ripard          2020-09-03  2336  	}
311e305fdb4e82 Maxime Ripard          2020-09-03  2337  
bb7d78568814a3 Eric Anholt            2017-02-27  2338  	/*
bb7d78568814a3 Eric Anholt            2017-02-27  2339  	 * Get the physical address of VC4_HD_MAI_DATA. We need to retrieve
bb7d78568814a3 Eric Anholt            2017-02-27  2340  	 * the bus address specified in the DT, because the physical address
bb7d78568814a3 Eric Anholt            2017-02-27  2341  	 * (the one returned by platform_get_resource()) is not appropriate
bb7d78568814a3 Eric Anholt            2017-02-27  2342  	 * for DMA transfers.
bb7d78568814a3 Eric Anholt            2017-02-27  2343  	 * This VC/MMU should probably be exposed to avoid this kind of hacks.
bb7d78568814a3 Eric Anholt            2017-02-27  2344  	 */
094864bd0054ea Dave Stevenson         2020-09-03  2345  	index = of_property_match_string(dev->of_node, "reg-names", "hd");
094864bd0054ea Dave Stevenson         2020-09-03  2346  	/* Before BCM2711, we don't have a named register range */
094864bd0054ea Dave Stevenson         2020-09-03  2347  	if (index < 0)
094864bd0054ea Dave Stevenson         2020-09-03  2348  		index = 1;
094864bd0054ea Dave Stevenson         2020-09-03  2349  
094864bd0054ea Dave Stevenson         2020-09-03  2350  	addr = of_get_address(dev->of_node, index, NULL, NULL);
c534b63bede6cb Aleksandr Mishin       2024-04-09  2351  	if (!addr)
c534b63bede6cb Aleksandr Mishin       2024-04-09  2352  		return -EINVAL;
094864bd0054ea Dave Stevenson         2020-09-03  2353  
311e305fdb4e82 Maxime Ripard          2020-09-03  2354  	vc4_hdmi->audio.dma_data.addr = be32_to_cpup(addr) + mai_data->offset;
3408cc23c9311f Maxime Ripard          2020-09-03  2355  	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
3408cc23c9311f Maxime Ripard          2020-09-03  2356  	vc4_hdmi->audio.dma_data.maxburst = 2;
bb7d78568814a3 Eric Anholt            2017-02-27  2357  
59f9d46af43c88 Maxime Ripard          2022-07-11  2358  	/*
59f9d46af43c88 Maxime Ripard          2022-07-11  2359  	 * NOTE: Strictly speaking, we should probably use a DRM-managed
59f9d46af43c88 Maxime Ripard          2022-07-11  2360  	 * registration there to avoid removing all the audio components
59f9d46af43c88 Maxime Ripard          2022-07-11  2361  	 * by the time the driver doesn't have any user anymore.
59f9d46af43c88 Maxime Ripard          2022-07-11  2362  	 *
59f9d46af43c88 Maxime Ripard          2022-07-11  2363  	 * However, the ASoC core uses a number of devm_kzalloc calls
59f9d46af43c88 Maxime Ripard          2022-07-11  2364  	 * when registering, even when using non-device-managed
35c6980018dd42 Kuninori Morimoto      2026-07-15  2365  	 * functions (such as in snd_soc_component_register()).
59f9d46af43c88 Maxime Ripard          2022-07-11  2366  	 *
35c6980018dd42 Kuninori Morimoto      2026-07-15  2367  	 * If we call snd_soc_component_unregister() in a DRM-managed
59f9d46af43c88 Maxime Ripard          2022-07-11  2368  	 * action, the device-managed actions have already been executed
59f9d46af43c88 Maxime Ripard          2022-07-11  2369  	 * and thus we would access memory that has been freed.
59f9d46af43c88 Maxime Ripard          2022-07-11  2370  	 *
59f9d46af43c88 Maxime Ripard          2022-07-11  2371  	 * Using device-managed hooks here probably leaves us open to a
59f9d46af43c88 Maxime Ripard          2022-07-11  2372  	 * bunch of issues if userspace still has a handle on the ALSA
59f9d46af43c88 Maxime Ripard          2022-07-11  2373  	 * device when the device is removed. However, this is mitigated
59f9d46af43c88 Maxime Ripard          2022-07-11  2374  	 * by the use of drm_dev_enter()/drm_dev_exit() in the audio
59f9d46af43c88 Maxime Ripard          2022-07-11  2375  	 * path to prevent the access to the device resources if it
59f9d46af43c88 Maxime Ripard          2022-07-11  2376  	 * isn't there anymore.
59f9d46af43c88 Maxime Ripard          2022-07-11  2377  	 *
59f9d46af43c88 Maxime Ripard          2022-07-11  2378  	 * Then, the vc4_hdmi structure is DRM-managed and thus only
59f9d46af43c88 Maxime Ripard          2022-07-11  2379  	 * freed whenever the last user has closed the DRM device file.
59f9d46af43c88 Maxime Ripard          2022-07-11  2380  	 * It should thus outlive ALSA in most situations.
59f9d46af43c88 Maxime Ripard          2022-07-11  2381  	 */
bb7d78568814a3 Eric Anholt            2017-02-27  2382  	ret = devm_snd_dmaengine_pcm_register(dev, &pcm_conf, 0);
bb7d78568814a3 Eric Anholt            2017-02-27  2383  	if (ret) {
bb7d78568814a3 Eric Anholt            2017-02-27  2384  		dev_err(dev, "Could not register PCM component: %d\n", ret);
bb7d78568814a3 Eric Anholt            2017-02-27  2385  		return ret;
bb7d78568814a3 Eric Anholt            2017-02-27  2386  	}
bb7d78568814a3 Eric Anholt            2017-02-27  2387  
35c6980018dd42 Kuninori Morimoto      2026-07-15  2388  	ret = devm_snd_soc_component_register(dev, &vc4_hdmi_audio_cpu_dai_comp,
bb7d78568814a3 Eric Anholt            2017-02-27  2389  					      &vc4_hdmi_audio_cpu_dai_drv, 1);
bb7d78568814a3 Eric Anholt            2017-02-27  2390  	if (ret) {
bb7d78568814a3 Eric Anholt            2017-02-27  2391  		dev_err(dev, "Could not register CPU DAI: %d\n", ret);
bb7d78568814a3 Eric Anholt            2017-02-27  2392  		return ret;
bb7d78568814a3 Eric Anholt            2017-02-27  2393  	}
bb7d78568814a3 Eric Anholt            2017-02-27  2394  
c0317ad44f45b3 Gabriel Dalimonte      2025-06-01  2395  	ret = drm_connector_hdmi_audio_init(&vc4_hdmi->connector, dev,
45215c589e7f22 Dave Airlie            2025-06-18  2396  					    &vc4_hdmi_audio_funcs, 8, 0, false,
c0317ad44f45b3 Gabriel Dalimonte      2025-06-01  2397  					    -1);
c0317ad44f45b3 Gabriel Dalimonte      2025-06-01  2398  	if (ret)
c0317ad44f45b3 Gabriel Dalimonte      2025-06-01  2399  		return ret;
c0317ad44f45b3 Gabriel Dalimonte      2025-06-01  2400  
3408cc23c9311f Maxime Ripard          2020-09-03  2401  	dai_link->cpus		= &vc4_hdmi->audio.cpu;
3408cc23c9311f Maxime Ripard          2020-09-03  2402  	dai_link->codecs	= &vc4_hdmi->audio.codec;
3408cc23c9311f Maxime Ripard          2020-09-03  2403  	dai_link->platforms	= &vc4_hdmi->audio.platform;
0467d8ef0f61c9 Kuninori Morimoto      2019-06-06  2404  
0467d8ef0f61c9 Kuninori Morimoto      2019-06-06  2405  	dai_link->num_cpus	= 1;
0467d8ef0f61c9 Kuninori Morimoto      2019-06-06  2406  	dai_link->num_codecs	= 1;
8a90efd15ef647 Kuninori Morimoto      2019-06-28  2407  	dai_link->num_platforms	= 1;
0467d8ef0f61c9 Kuninori Morimoto      2019-06-06  2408  
bb7d78568814a3 Eric Anholt            2017-02-27  2409  	dai_link->name = "MAI";
bb7d78568814a3 Eric Anholt            2017-02-27  2410  	dai_link->stream_name = "MAI PCM";
91e99e11392937 Maxime Ripard          2021-05-25  2411  	dai_link->codecs->dai_name = "i2s-hifi";
0467d8ef0f61c9 Kuninori Morimoto      2019-06-06  2412  	dai_link->cpus->dai_name = dev_name(dev);
9640f1437a88d8 Dmitry Baryshkov       2024-12-24  2413  	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_audio.codec_pdev->dev);
8a90efd15ef647 Kuninori Morimoto      2019-06-28  2414  	dai_link->platforms->name = dev_name(dev);
2f9d51740cc30e David Turner           2025-03-17  2415  	dai_link->init = vc4_hdmi_codec_init;
bb7d78568814a3 Eric Anholt            2017-02-27  2416  
2e9794035bd46b Kuninori Morimoto      2026-04-09  2417  	card_driver->dai_link = dai_link;
2e9794035bd46b Kuninori Morimoto      2026-04-09  2418  	card_driver->num_links = 1;
2e9794035bd46b Kuninori Morimoto      2026-04-09  2419  	card_driver->driver_name = "vc4-hdmi";
2e9794035bd46b Kuninori Morimoto      2026-04-09  2420  	card_driver->owner = THIS_MODULE;
2e9794035bd46b Kuninori Morimoto      2026-04-09  2421  	snd_soc_card_set_name(card, vc4_hdmi->variant->card_name);
bb7d78568814a3 Eric Anholt            2017-02-27  2422  
bb7d78568814a3 Eric Anholt            2017-02-27  2423  	/*
2e9794035bd46b Kuninori Morimoto      2026-04-09  2424  	 * Be careful, snd_soc_card_register() calls dev_set_drvdata() and
bb7d78568814a3 Eric Anholt            2017-02-27  2425  	 * stores a pointer to the snd card object in dev->driver_data. This
bb7d78568814a3 Eric Anholt            2017-02-27  2426  	 * means we cannot use it for something else. The hdmi back-pointer is
bb7d78568814a3 Eric Anholt            2017-02-27  2427  	 * now stored in card->drvdata and should be retrieved with
35c6980018dd42 Kuninori Morimoto      2026-07-15  2428  	 * snd_soc_card_to_priv() if needed.
bb7d78568814a3 Eric Anholt            2017-02-27  2429  	 */
3408cc23c9311f Maxime Ripard          2020-09-03 @2430  	snd_soc_card_set_drvdata(card, vc4_hdmi);
2e9794035bd46b Kuninori Morimoto      2026-04-09  2431  	ret = devm_snd_soc_card_register(card, card_driver);
635b1c185ee9ca Kuninori Morimoto      2018-01-29  2432  	if (ret)
9d9fb756b5391c Nicolas Saenz Julienne 2021-06-29  2433  		dev_err_probe(dev, ret, "Could not register sound card\n");
bb7d78568814a3 Eric Anholt            2017-02-27  2434  
bb7d78568814a3 Eric Anholt            2017-02-27  2435  	return ret;
bb7d78568814a3 Eric Anholt            2017-02-27  2436  

:::::: The code at line 2430 was first introduced by commit
:::::: 3408cc23c9311f45ca363112fa62e23846ffc499 drm/vc4: hdmi: Rename hdmi to vc4_hdmi

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Maxime Ripard <maxime@cerno.tech>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
