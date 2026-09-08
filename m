Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B883E21D3E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 01:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788829776; cv=none; b=scESLclXj3EtD3haFMc55/9iqPHarDnw+65L7u7D57AuftsXaSdRG9iY6USmkoUiGdKzapRB2bRLu0o+lshiwNDIMya4DFJvM6jyEJ0d7kxZbxAeg913uFWmkCf1VhOMlI/XKb58ikErRpJ+LD3jIIMIQKdogTz45Wr/doPqByw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788829776; c=relaxed/simple;
	bh=okbi4s8sAFtOelPXOVXVmFS5YR+gCmqNeOIDovfeQJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=utM6+LjTgVZmv8rkMhhPAZJ5H/srAptv/DoWsAv281uawOWF39ImiJ5hXIFSYhUrum1RnOnx8aKMeZJB4x4tJ+uZN+eM0GrqbvXKoNb2LpC3sp+4o3u6L90xLEWhOIkjhRrHpcg5HY0Ej5B1Bo9if3JmVANDgUrMDwg+cIV8LUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hqkjz9Ag; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hqkjz9Ag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788829773; x=1820365773;
  h=date:from:to:cc:subject:message-id;
  bh=okbi4s8sAFtOelPXOVXVmFS5YR+gCmqNeOIDovfeQJM=;
  b=Hqkjz9Ag2nqTozrfMJANLyXIZFIio5dcFTO/FEphM/c2UyYLGN/4wax1
   fv0M8Ok8LM7NOZ0ziX4uq4uJ7he8XxbNXIe3dEiBrqA2tlt6CLAYHLUHa
   W8d88/a/3LtYDB1BWpXmtn9nUSrO7+ZrM3Meq2B/6em/FdPOkJRYD9xXH
   0tABaD8Tzz0s8UjDSlmDzUgzATah0QA3R4ShhQetMLQycHJDJXELaMZbu
   ryXC4HS9Bhh0PwLksaooAY85RA1q3MMXDaWfvrq9l2+GySuZdDh9P1GaI
   QKpgt0FarELg/1btuWOEaF8l9tn5KVxHB6+prQqTOSJTrzn5vAJP34dCN
   Q==;
X-CSE-ConnectionGUID: 9a2g29USR4ebuVGKBnqaMw==
X-CSE-MsgGUID: vnqXhHDAR2q1b1QIbhCxew==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76784195"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="76784195"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 18:09:33 -0700
X-CSE-ConnectionGUID: 2CprOmOWSuqYsOK+8D3Irg==
X-CSE-MsgGUID: rHij2qMlT/KbYCskGfiQcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270319758"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Sep 2026 18:09:32 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3kL3-000000001Ul-1Fxm;
	Tue, 08 Sep 2026 01:09:29 +0000
Date: Tue, 08 Sep 2026 09:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 262/343]
 sound/soc/codecs/sn624x-sdca-sdw.c:1713:15: error: implicit declaration of
 function 'devm_snd_soc_register_component'; did you mean
 'devm_snd_soc_register_card'?
Message-ID: <202609080914.pQEpFUsA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: ee124ecd0cb27953c01b601bcb3e15734358af1c [262/343] ASoC: soc-component: remove compatible definition
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260908/202609080914.pQEpFUsA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080914.pQEpFUsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080914.pQEpFUsA-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1452:9: note: in expansion of macro 'dev_dbg'
    1452 |         dev_dbg(dai->dev,
         |         ^~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1456:22: error: implicit declaration of function 'snd_soc_dai_get_dma_data'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
    1456 |         sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
         |                      snd_soc_card_get_drvdata
   sound/soc/codecs/sn624x-sdca-sdw.c:1456:20: error: assignment to 'struct sdw_stream_runtime *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1456 |         sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
         |                    ^
   In file included from include/linux/device.h:15,
                    from sound/soc/codecs/sn624x-sdca-sdw.c:11:
   sound/soc/codecs/sn624x-sdca-sdw.c:1458:29: error: invalid use of undefined type 'struct snd_soc_dai'
    1458 |                 dev_warn(dai->dev,
         |                             ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1458:17: note: in expansion of macro 'dev_warn'
    1458 |                 dev_warn(dai->dev,
         |                 ^~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1463:29: error: invalid use of undefined type 'struct snd_soc_dai'
    1463 |                 dev_warn(dai->dev, "sn624x: hw_params: slave NULL\n");
         |                             ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1463:17: note: in expansion of macro 'dev_warn'
    1463 |                 dev_warn(dai->dev, "sn624x: hw_params: slave NULL\n");
         |                 ^~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1469:28: error: invalid use of undefined type 'struct snd_soc_dai'
    1469 |                 dev_err(dai->dev,
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1469:17: note: in expansion of macro 'dev_err'
    1469 |                 dev_err(dai->dev,
         |                 ^~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1477:24: error: invalid use of undefined type 'struct snd_soc_dai'
    1477 |                 if (dai->id == SN624X_DAI_JACK)
         |                        ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:1479:29: error: invalid use of undefined type 'struct snd_soc_dai'
    1479 |                 else if (dai->id == SN624X_DAI_SPEAKER)
         |                             ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:1484:24: error: invalid use of undefined type 'struct snd_soc_dai'
    1484 |                 if (dai->id == SN624X_DAI_JACK)
         |                        ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:1486:29: error: invalid use of undefined type 'struct snd_soc_dai'
    1486 |                 else if (dai->id == SN624X_DAI_DMIC)
         |                             ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:1496:28: error: invalid use of undefined type 'struct snd_soc_dai'
    1496 |                 dev_err(dai->dev, "%s: sdw_stream_add_slave port %d failed: %d\n",
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1496:17: note: in expansion of macro 'dev_err'
    1496 |                 dev_err(dai->dev, "%s: sdw_stream_add_slave port %d failed: %d\n",
         |                 ^~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1516:28: error: invalid use of undefined type 'struct snd_soc_dai'
    1516 |                 dev_err(dai->dev, "%s: Rate %d is not supported\n",
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1516:17: note: in expansion of macro 'dev_err'
    1516 |                 dev_err(dai->dev, "%s: Rate %d is not supported\n",
         |                 ^~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1521:16: error: invalid use of undefined type 'struct snd_soc_dai'
    1521 |         if (dai->id == SN624X_DAI_JACK) {
         |                ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:1530:23: error: invalid use of undefined type 'struct snd_soc_dai'
    1530 |         } else if (dai->id == SN624X_DAI_SPEAKER) {
         |                       ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:1533:23: error: invalid use of undefined type 'struct snd_soc_dai'
    1533 |         } else if (dai->id == SN624X_DAI_DMIC) {
         |                       ^~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_pcm_hw_free':
   sound/soc/codecs/sn624x-sdca-sdw.c:1546:76: error: invalid use of undefined type 'struct snd_soc_dai'
    1546 |         struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(dai->component);
         |                                                                            ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:1548:17: error: initialization of 'struct sdw_stream_runtime *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1548 |                 snd_soc_dai_get_dma_data(dai, substream);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_set_sdw_stream':
   sound/soc/codecs/sn624x-sdca-sdw.c:1559:9: error: implicit declaration of function 'snd_soc_dai_dma_data_set'; did you mean 'snd_soc_dai_stream_dma_data_set'? [-Wimplicit-function-declaration]
    1559 |         snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_dai_stream_dma_data_set
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_shutdown':
   sound/soc/codecs/sn624x-sdca-sdw.c:1566:9: error: implicit declaration of function 'snd_soc_dai_set_dma_data'; did you mean 'snd_soc_dai_set_tristate'? [-Wimplicit-function-declaration]
    1566 |         snd_soc_dai_set_dma_data(dai, substream, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_dai_set_tristate
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_init':
>> sound/soc/codecs/sn624x-sdca-sdw.c:1713:15: error: implicit declaration of function 'devm_snd_soc_register_component'; did you mean 'devm_snd_soc_register_card'? [-Wimplicit-function-declaration]
    1713 |         ret = devm_snd_soc_register_component(dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               devm_snd_soc_register_card


vim +1713 sound/soc/codecs/sn624x-sdca-sdw.c

12d9c9f8679c56 Qianghua Wang 2026-09-01  1689  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1690  int sn624x_sdca_init(struct device *dev, struct regmap *regmap,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1691  		      struct sdw_slave *slave)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1692  {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1693  	struct sn624x_sdca_priv *sn624x;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1694  	int ret;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1695  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1696  	sn624x = devm_kzalloc(dev, sizeof(*sn624x), GFP_KERNEL);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1697  	if (!sn624x)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1698  		return -ENOMEM;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1699  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1700  	dev_set_drvdata(dev, sn624x);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1701  	sn624x->slave = slave;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1702  	sn624x->regmap = regmap;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1703  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1704  	ret = sn624x_parse_sdca_functions(sn624x);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1705  	if (ret < 0)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1706  		return ret;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1707  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1708  	mutex_init(&sn624x->disable_irq_lock);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1709  	INIT_DELAYED_WORK(&sn624x->jack_detect_work, sn624x_sdca_jack_detect_handler);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1710  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1711  	regcache_cache_only(sn624x->regmap, true);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1712  
12d9c9f8679c56 Qianghua Wang 2026-09-01 @1713  	ret = devm_snd_soc_register_component(dev,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1714  					      &soc_sdca_dev_sn624x, sn624x_sdca_dai,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1715  					      ARRAY_SIZE(sn624x_sdca_dai));
12d9c9f8679c56 Qianghua Wang 2026-09-01  1716  	if (ret < 0)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1717  		return ret;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1718  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1719  	/*
12d9c9f8679c56 Qianghua Wang 2026-09-01  1720  	 * Do not enable runtime PM here. SoundWire slaves are only powered /
12d9c9f8679c56 Qianghua Wang 2026-09-01  1721  	 * accessible after ATTACHED; enable RPM from io_init() then.
12d9c9f8679c56 Qianghua Wang 2026-09-01  1722  	 */
12d9c9f8679c56 Qianghua Wang 2026-09-01  1723  	SN624X_DBG(dev, "snd_soc_register_component OK (DAI sn624x-sdca-aif)\n");
12d9c9f8679c56 Qianghua Wang 2026-09-01  1724  	return 0;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1725  }
12d9c9f8679c56 Qianghua Wang 2026-09-01  1726  

:::::: The code at line 1713 was first introduced by commit
:::::: 12d9c9f8679c56e8c131dc2d8985c350ece7c4c3 ASoC: codecs: add SN624x SDCA SoundWire driver

:::::: TO: Qianghua Wang <qianghua.wang@senarytech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
