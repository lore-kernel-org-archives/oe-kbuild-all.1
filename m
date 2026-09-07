Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BCF4F55A2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 18:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806237; cv=none; b=pIdc8Mew7BUJ8MFD5+9GdJwmJj957k+RdtuTuk5G7CT3uifYOvaBsD9ZcHS3UCHVBd8ftZufTrF6fJj2cXx/KwXbuEAnPL8bYbYFlBc8m3KO/XczGxnSh4azoJ/1X2NYBAP3Bsbj/DZmLkwyeAIii24z0wNcLI7cfTImf6qJEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806237; c=relaxed/simple;
	bh=3KzEUF6Uzce4JQVrUJX4QoEQ4V7CL6qm2C0ByqlzBTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KKs3OZ11m1TJn/xBNoj3DXcT2uMJ5mwkb6z/EKB/ckvr3S2hxTqyaCSFdOgCEMkmZojZ+RBP2bXwltFWrxYUO4rlsT28e6KCPa8eoUGBCe3kRbc9GW/mRC7e66eE5cFtPACE7z+hT9EU0GN9F+vHjIhsQWX2lYl0oZbSsMIjK74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVjZsk48; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVjZsk48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788806235; x=1820342235;
  h=date:from:to:cc:subject:message-id;
  bh=3KzEUF6Uzce4JQVrUJX4QoEQ4V7CL6qm2C0ByqlzBTw=;
  b=LVjZsk48ig33WG2kmMMSYD4mGd6EDOWSB0zqAynRtJrABeyxBMwuF5Um
   b9/M8OB1qm3RuBoM79bsXiiZGBAO1n9whAvPHz52bBI0KgQ5cUW/GOzjJ
   3TDk0uM3tLSPKb4sUfm7S1nxF3lCpMeDb+vzEMPkGZk0htBNwD94Yulw6
   UibmxGdt8IX/6hPrbK7z2rtVqME0D2Hi6x2HkdvW2NauOWW8kq0z1Z3aR
   aPM6TcwjJ6GCgWcMwn9vk32Qy8U9n0NR1i8TiKrRcI8tm27H8hAjNb5hq
   gAy6H1WyOMiLYt4oIjgoHFXIAJKZRu7BR2wsN4J5EMXTdY+8q1UEIkMEH
   w==;
X-CSE-ConnectionGUID: fu70X5ITTzeZO0Q4h+fVQQ==
X-CSE-MsgGUID: bDuKYtt5TcSFTgszD2fRyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89243276"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89243276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 11:37:15 -0700
X-CSE-ConnectionGUID: t55nzQjKTiWkJx3OSX8tnA==
X-CSE-MsgGUID: HBN6sl7GSHSQWg5WHn3r2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="272715591"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2026 11:37:13 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3eDO-000000001ER-2ei0;
	Mon, 07 Sep 2026 18:37:10 +0000
Date: Tue, 08 Sep 2026 02:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 259/343]
 sound/soc/codecs/sn624x-sdca-sdw.c:1456:22: error: implicit declaration of
 function 'snd_soc_dai_get_dma_data'; did you mean 'snd_soc_card_get_drvdata'?
Message-ID: <202609080245.KEp3nwVb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: a7a06cf364b8e47e448915cbebda2c6b4a70ac0b [259/343] ASoC: soc-dai: remove compatible definition
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260908/202609080245.KEp3nwVb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080245.KEp3nwVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080245.KEp3nwVb-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_pcm_hw_params':
>> sound/soc/codecs/sn624x-sdca-sdw.c:1456:22: error: implicit declaration of function 'snd_soc_dai_get_dma_data'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
    1456 |         sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
         |                      snd_soc_card_get_drvdata
>> sound/soc/codecs/sn624x-sdca-sdw.c:1456:20: error: assignment to 'struct sdw_stream_runtime *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1456 |         sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
         |                    ^
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_pcm_hw_free':
>> sound/soc/codecs/sn624x-sdca-sdw.c:1548:17: error: initialization of 'struct sdw_stream_runtime *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1548 |                 snd_soc_dai_get_dma_data(dai, substream);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_set_sdw_stream':
>> sound/soc/codecs/sn624x-sdca-sdw.c:1559:9: error: implicit declaration of function 'snd_soc_dai_dma_data_set'; did you mean 'snd_soc_dai_stream_dma_data_set'? [-Wimplicit-function-declaration]
    1559 |         snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_dai_stream_dma_data_set
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_shutdown':
>> sound/soc/codecs/sn624x-sdca-sdw.c:1566:9: error: implicit declaration of function 'snd_soc_dai_set_dma_data'; did you mean 'snd_soc_dai_set_tristate'? [-Wimplicit-function-declaration]
    1566 |         snd_soc_dai_set_dma_data(dai, substream, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_dai_set_tristate


vim +1456 sound/soc/codecs/sn624x-sdca-sdw.c

12d9c9f8679c56e Qianghua Wang 2026-09-01  1438  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1439  static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1440  				     struct snd_pcm_hw_params *params,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1441  				     struct snd_soc_dai *dai)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1442  {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1443  	struct snd_soc_component *component = dai->component;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1444  	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1445  	struct sdw_stream_config stream_config = {};
12d9c9f8679c56e Qianghua Wang 2026-09-01  1446  	struct sdw_port_config port_config = {};
12d9c9f8679c56e Qianghua Wang 2026-09-01  1447  	struct sdw_stream_runtime *sdw_stream;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1448  	unsigned int sampling_rate;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1449  	int port;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1450  	int ret;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1451  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1452  	dev_dbg(dai->dev,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1453  		 "sn624x: hw_params: entered dai=%s id=%d stream=%s\n",
12d9c9f8679c56e Qianghua Wang 2026-09-01  1454  		 dai->name, dai->id, snd_pcm_stream_str(substream));
12d9c9f8679c56e Qianghua Wang 2026-09-01  1455  
12d9c9f8679c56e Qianghua Wang 2026-09-01 @1456  	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1457  	if (!sdw_stream) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1458  		dev_warn(dai->dev,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1459  			 "sn624x: hw_params: no SDW stream (set_stream not run yet?)\n");
12d9c9f8679c56e Qianghua Wang 2026-09-01  1460  		return -EINVAL;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1461  	}
12d9c9f8679c56e Qianghua Wang 2026-09-01  1462  	if (!sn624x->slave) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1463  		dev_warn(dai->dev, "sn624x: hw_params: slave NULL\n");
12d9c9f8679c56e Qianghua Wang 2026-09-01  1464  		return -EINVAL;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1465  	}
12d9c9f8679c56e Qianghua Wang 2026-09-01  1466  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1467  	ret = pm_runtime_resume(component->dev);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1468  	if (ret < 0 && ret != -EACCES) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1469  		dev_err(dai->dev,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1470  			"sn624x: hw_params: pm_runtime_resume failed (%d)\n", ret);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1471  		return ret;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1472  	}
12d9c9f8679c56e Qianghua Wang 2026-09-01  1473  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1474  	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1475  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1476  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1477  		if (dai->id == SN624X_DAI_JACK)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1478  			port = SN624X_PORT_JACK_PLAYBACK;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1479  		else if (dai->id == SN624X_DAI_SPEAKER)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1480  			port = SN624X_PORT_SPEAKER_PLAYBACK;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1481  		else
12d9c9f8679c56e Qianghua Wang 2026-09-01  1482  			return -EINVAL;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1483  	} else {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1484  		if (dai->id == SN624X_DAI_JACK)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1485  			port = SN624X_PORT_JACK_CAPTURE;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1486  		else if (dai->id == SN624X_DAI_DMIC)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1487  			port = SN624X_PORT_DMIC_CAPTURE;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1488  		else
12d9c9f8679c56e Qianghua Wang 2026-09-01  1489  			return -EINVAL;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1490  	}
12d9c9f8679c56e Qianghua Wang 2026-09-01  1491  	port_config.num = port;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1492  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1493  	ret = sdw_stream_add_slave(sn624x->slave, &stream_config,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1494  				   &port_config, 1, sdw_stream);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1495  	if (ret) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1496  		dev_err(dai->dev, "%s: sdw_stream_add_slave port %d failed: %d\n",
12d9c9f8679c56e Qianghua Wang 2026-09-01  1497  			__func__, port, ret);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1498  		return ret;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1499  	}
12d9c9f8679c56e Qianghua Wang 2026-09-01  1500  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1501  	/* SDCA SampleFreqIndex (same encoding as other SDCA codecs) */
12d9c9f8679c56e Qianghua Wang 2026-09-01  1502  	switch (params_rate(params)) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1503  	case 44100:
12d9c9f8679c56e Qianghua Wang 2026-09-01  1504  		sampling_rate = SN624X_SDCA_RATE_44100HZ;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1505  		break;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1506  	case 48000:
12d9c9f8679c56e Qianghua Wang 2026-09-01  1507  		sampling_rate = SN624X_SDCA_RATE_48000HZ;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1508  		break;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1509  	case 96000:
12d9c9f8679c56e Qianghua Wang 2026-09-01  1510  		sampling_rate = SN624X_SDCA_RATE_96000HZ;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1511  		break;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1512  	case 192000:
12d9c9f8679c56e Qianghua Wang 2026-09-01  1513  		sampling_rate = SN624X_SDCA_RATE_192000HZ;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1514  		break;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1515  	default:
12d9c9f8679c56e Qianghua Wang 2026-09-01  1516  		dev_err(dai->dev, "%s: Rate %d is not supported\n",
12d9c9f8679c56e Qianghua Wang 2026-09-01  1517  			__func__, params_rate(params));
12d9c9f8679c56e Qianghua Wang 2026-09-01  1518  		return -EINVAL;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1519  	}
12d9c9f8679c56e Qianghua Wang 2026-09-01  1520  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1521  	if (dai->id == SN624X_DAI_JACK) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1522  		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1523  			ret = regmap_write(sn624x->regmap,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1524  					   SN624X_REG_JACK_OUT_RATE_SEL,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1525  					   sampling_rate);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1526  		else
12d9c9f8679c56e Qianghua Wang 2026-09-01  1527  			ret = regmap_write(sn624x->regmap,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1528  					   SN624X_REG_JACK_CAP_RATE_SEL,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1529  					   sampling_rate);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1530  	} else if (dai->id == SN624X_DAI_SPEAKER) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1531  		ret = regmap_write(sn624x->regmap, SN624X_REG_RATE_SEL,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1532  				   sampling_rate);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1533  	} else if (dai->id == SN624X_DAI_DMIC) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1534  		ret = regmap_write(sn624x->regmap, SN624X_REG_DMIC_CAP_RATE_SEL,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1535  				   sampling_rate);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1536  	} else {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1537  		return -EINVAL;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1538  	}
12d9c9f8679c56e Qianghua Wang 2026-09-01  1539  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1540  	return ret;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1541  }
12d9c9f8679c56e Qianghua Wang 2026-09-01  1542  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1543  static int sn624x_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1544  				   struct snd_soc_dai *dai)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1545  {
12d9c9f8679c56e Qianghua Wang 2026-09-01  1546  	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(dai->component);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1547  	struct sdw_stream_runtime *sdw_stream =
12d9c9f8679c56e Qianghua Wang 2026-09-01 @1548  		snd_soc_dai_get_dma_data(dai, substream);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1549  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1550  	if (!sn624x->slave)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1551  		return -EINVAL;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1552  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1553  	return sdw_stream_remove_slave(sn624x->slave, sdw_stream);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1554  }
12d9c9f8679c56e Qianghua Wang 2026-09-01  1555  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1556  static int sn624x_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1557  				      int direction)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1558  {
12d9c9f8679c56e Qianghua Wang 2026-09-01 @1559  	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1560  	return 0;
12d9c9f8679c56e Qianghua Wang 2026-09-01  1561  }
12d9c9f8679c56e Qianghua Wang 2026-09-01  1562  
12d9c9f8679c56e Qianghua Wang 2026-09-01  1563  static void sn624x_sdca_shutdown(struct snd_pcm_substream *substream,
12d9c9f8679c56e Qianghua Wang 2026-09-01  1564  				 struct snd_soc_dai *dai)
12d9c9f8679c56e Qianghua Wang 2026-09-01  1565  {
12d9c9f8679c56e Qianghua Wang 2026-09-01 @1566  	snd_soc_dai_set_dma_data(dai, substream, NULL);
12d9c9f8679c56e Qianghua Wang 2026-09-01  1567  }
12d9c9f8679c56e Qianghua Wang 2026-09-01  1568  

:::::: The code at line 1456 was first introduced by commit
:::::: 12d9c9f8679c56e8c131dc2d8985c350ece7c4c3 ASoC: codecs: add SN624x SDCA SoundWire driver

:::::: TO: Qianghua Wang <qianghua.wang@senarytech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
