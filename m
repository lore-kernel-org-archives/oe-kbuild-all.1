Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770573B9D9F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813824; cv=none; b=p8+IkK7aqaXvxKN/g0WLLMf4aS2QHi2l0OCnKC5JXoJ/tTg3ag/8XSHIlaZ+3TyWATdE7IHQd+gKebdRJsLVZOFCv3DmGHITCbjhhsJp5Lv/DuEWp7eLYLU7q+dDQ2iObNq8959qlGYZ/VQOe1zNGEcPJuRm3bAivOQw5KYd+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813824; c=relaxed/simple;
	bh=G2qct+Xk9WaVoDPTuNkQ0i1ZYnUYD9er1gSMJdInik8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lW5VZPYf5yIBAfij4gbDQdI0KSU4W50MbV/yB95081mT0sC8H60C45MlL7ccLvoSzRkMRkVE134x6UocaJBTrqKdMUV4xlYb0bqZ3Ed76WCfgDDRCUqjyxo5ij5Pwa4UThOst4sWAdtXQVqIcNTh/QvQh3+cFi2KNmR1jZGkkfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJiW2Hrr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJiW2Hrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788813822; x=1820349822;
  h=date:from:to:cc:subject:message-id;
  bh=G2qct+Xk9WaVoDPTuNkQ0i1ZYnUYD9er1gSMJdInik8=;
  b=BJiW2HrrCjp6jyR/paf30fogkO/1XDm/rOSjVR1cv3gUVv0XyGSttQ2D
   QnDFognjqEiH4JV1vCUH/+T7W7w+kj7G7UnbTQ/+ZSdBqK9AilbYjSc9f
   FQVk47ATDJBOMbgTO//GJRvu3BnJ54CRny0W9+Rl6NBDe+In5UW0TB5qJ
   xoiEvhNGw47qWv2NYiGfbQhKPv3gGRU1wbyfOTWijzR7iFYCid/GHBO1M
   4SMm/F9y2ysINPQGNFsvQAGuGHI+y5wNIJYQutb1ct3j2JtgUX8BZ8Wi5
   pNMMMpfiBB9l9yPCG+d4oIiLNDIsLsa6sH8webtW0Sx1t0I54VonCO6Ru
   g==;
X-CSE-ConnectionGUID: dsOiMnkUTr+pz5NoeF4gjg==
X-CSE-MsgGUID: 4x9JjPpORYm2sfG9UOAmRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="111989677"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="111989677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:43:41 -0700
X-CSE-ConnectionGUID: wzyTWXOtRE6nRzmo8V3YMQ==
X-CSE-MsgGUID: Ad4iqjtUT92bUix2Y82mCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267115147"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Sep 2026 13:43:39 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3gBk-000000001Jb-2r02;
	Mon, 07 Sep 2026 20:43:36 +0000
Date: Tue, 08 Sep 2026 04:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 260/343]
 sound/soc/codecs/sn624x-sdca-sdw.c:1443:50: error: invalid use of undefined
 type 'struct snd_soc_dai'
Message-ID: <202609080402.a8f5yu7s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: 4f2f1933fcf300aec135d095ab4fc78c3ed70962 [260/343] ASoC: soc-dai: move struct snd_soc_dai to soc-dai.c
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260908/202609080402.a8f5yu7s-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080402.a8f5yu7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080402.a8f5yu7s-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_pcm_hw_params':
>> sound/soc/codecs/sn624x-sdca-sdw.c:1443:50: error: invalid use of undefined type 'struct snd_soc_dai'
    1443 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from sound/soc/codecs/sn624x-sdca-sdw.c:8:
   sound/soc/codecs/sn624x-sdca-sdw.c:1452:20: error: invalid use of undefined type 'struct snd_soc_dai'
    1452 |         dev_dbg(dai->dev,
         |                    ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1452:9: note: in expansion of macro 'dev_dbg'
    1452 |         dev_dbg(dai->dev,
         |         ^~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1454:21: error: invalid use of undefined type 'struct snd_soc_dai'
    1454 |                  dai->name, dai->id, snd_pcm_stream_str(substream));
         |                     ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1452:9: note: in expansion of macro 'dev_dbg'
    1452 |         dev_dbg(dai->dev,
         |         ^~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1454:32: error: invalid use of undefined type 'struct snd_soc_dai'
    1454 |                  dai->name, dai->id, snd_pcm_stream_str(substream));
         |                                ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
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
--
   sound/soc/sdw_utils/soc_sdw_senary_sdca.c: In function 'asoc_sdw_senary_sdca_spk_rtd_init':
>> sound/soc/sdw_utils/soc_sdw_senary_sdca.c:49:74: error: invalid use of undefined type 'struct snd_soc_dai'
      49 |         const struct codec_route_map *route_map = get_codec_route_map(dai->name);
         |                                                                          ^~
--
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c: In function 'asoc_sdw_senary_sdca_jack_rtd_init':
>> sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:85:24: error: invalid use of undefined type 'struct snd_soc_dai'
      85 |         component = dai->component;
         |                        ^~
--
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c: In function 'asoc_sdw_senary_dmic_rtd_init':
>> sound/soc/sdw_utils/soc_sdw_senary_dmic.c:26:24: error: invalid use of undefined type 'struct snd_soc_dai'
      26 |         component = dai->component;
         |                        ^~


vim +1443 sound/soc/codecs/sn624x-sdca-sdw.c

12d9c9f8679c56 Qianghua Wang 2026-09-01  1438  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1439  static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1440  				     struct snd_pcm_hw_params *params,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1441  				     struct snd_soc_dai *dai)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1442  {
12d9c9f8679c56 Qianghua Wang 2026-09-01 @1443  	struct snd_soc_component *component = dai->component;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1444  	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1445  	struct sdw_stream_config stream_config = {};
12d9c9f8679c56 Qianghua Wang 2026-09-01  1446  	struct sdw_port_config port_config = {};
12d9c9f8679c56 Qianghua Wang 2026-09-01  1447  	struct sdw_stream_runtime *sdw_stream;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1448  	unsigned int sampling_rate;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1449  	int port;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1450  	int ret;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1451  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1452  	dev_dbg(dai->dev,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1453  		 "sn624x: hw_params: entered dai=%s id=%d stream=%s\n",
12d9c9f8679c56 Qianghua Wang 2026-09-01  1454  		 dai->name, dai->id, snd_pcm_stream_str(substream));
12d9c9f8679c56 Qianghua Wang 2026-09-01  1455  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1456  	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1457  	if (!sdw_stream) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1458  		dev_warn(dai->dev,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1459  			 "sn624x: hw_params: no SDW stream (set_stream not run yet?)\n");
12d9c9f8679c56 Qianghua Wang 2026-09-01  1460  		return -EINVAL;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1461  	}
12d9c9f8679c56 Qianghua Wang 2026-09-01  1462  	if (!sn624x->slave) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1463  		dev_warn(dai->dev, "sn624x: hw_params: slave NULL\n");
12d9c9f8679c56 Qianghua Wang 2026-09-01  1464  		return -EINVAL;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1465  	}
12d9c9f8679c56 Qianghua Wang 2026-09-01  1466  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1467  	ret = pm_runtime_resume(component->dev);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1468  	if (ret < 0 && ret != -EACCES) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1469  		dev_err(dai->dev,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1470  			"sn624x: hw_params: pm_runtime_resume failed (%d)\n", ret);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1471  		return ret;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1472  	}
12d9c9f8679c56 Qianghua Wang 2026-09-01  1473  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1474  	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1475  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1476  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1477  		if (dai->id == SN624X_DAI_JACK)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1478  			port = SN624X_PORT_JACK_PLAYBACK;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1479  		else if (dai->id == SN624X_DAI_SPEAKER)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1480  			port = SN624X_PORT_SPEAKER_PLAYBACK;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1481  		else
12d9c9f8679c56 Qianghua Wang 2026-09-01  1482  			return -EINVAL;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1483  	} else {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1484  		if (dai->id == SN624X_DAI_JACK)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1485  			port = SN624X_PORT_JACK_CAPTURE;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1486  		else if (dai->id == SN624X_DAI_DMIC)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1487  			port = SN624X_PORT_DMIC_CAPTURE;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1488  		else
12d9c9f8679c56 Qianghua Wang 2026-09-01  1489  			return -EINVAL;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1490  	}
12d9c9f8679c56 Qianghua Wang 2026-09-01  1491  	port_config.num = port;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1492  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1493  	ret = sdw_stream_add_slave(sn624x->slave, &stream_config,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1494  				   &port_config, 1, sdw_stream);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1495  	if (ret) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1496  		dev_err(dai->dev, "%s: sdw_stream_add_slave port %d failed: %d\n",
12d9c9f8679c56 Qianghua Wang 2026-09-01  1497  			__func__, port, ret);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1498  		return ret;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1499  	}
12d9c9f8679c56 Qianghua Wang 2026-09-01  1500  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1501  	/* SDCA SampleFreqIndex (same encoding as other SDCA codecs) */
12d9c9f8679c56 Qianghua Wang 2026-09-01  1502  	switch (params_rate(params)) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1503  	case 44100:
12d9c9f8679c56 Qianghua Wang 2026-09-01  1504  		sampling_rate = SN624X_SDCA_RATE_44100HZ;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1505  		break;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1506  	case 48000:
12d9c9f8679c56 Qianghua Wang 2026-09-01  1507  		sampling_rate = SN624X_SDCA_RATE_48000HZ;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1508  		break;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1509  	case 96000:
12d9c9f8679c56 Qianghua Wang 2026-09-01  1510  		sampling_rate = SN624X_SDCA_RATE_96000HZ;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1511  		break;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1512  	case 192000:
12d9c9f8679c56 Qianghua Wang 2026-09-01  1513  		sampling_rate = SN624X_SDCA_RATE_192000HZ;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1514  		break;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1515  	default:
12d9c9f8679c56 Qianghua Wang 2026-09-01  1516  		dev_err(dai->dev, "%s: Rate %d is not supported\n",
12d9c9f8679c56 Qianghua Wang 2026-09-01  1517  			__func__, params_rate(params));
12d9c9f8679c56 Qianghua Wang 2026-09-01  1518  		return -EINVAL;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1519  	}
12d9c9f8679c56 Qianghua Wang 2026-09-01  1520  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1521  	if (dai->id == SN624X_DAI_JACK) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1522  		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
12d9c9f8679c56 Qianghua Wang 2026-09-01  1523  			ret = regmap_write(sn624x->regmap,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1524  					   SN624X_REG_JACK_OUT_RATE_SEL,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1525  					   sampling_rate);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1526  		else
12d9c9f8679c56 Qianghua Wang 2026-09-01  1527  			ret = regmap_write(sn624x->regmap,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1528  					   SN624X_REG_JACK_CAP_RATE_SEL,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1529  					   sampling_rate);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1530  	} else if (dai->id == SN624X_DAI_SPEAKER) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1531  		ret = regmap_write(sn624x->regmap, SN624X_REG_RATE_SEL,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1532  				   sampling_rate);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1533  	} else if (dai->id == SN624X_DAI_DMIC) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1534  		ret = regmap_write(sn624x->regmap, SN624X_REG_DMIC_CAP_RATE_SEL,
12d9c9f8679c56 Qianghua Wang 2026-09-01  1535  				   sampling_rate);
12d9c9f8679c56 Qianghua Wang 2026-09-01  1536  	} else {
12d9c9f8679c56 Qianghua Wang 2026-09-01  1537  		return -EINVAL;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1538  	}
12d9c9f8679c56 Qianghua Wang 2026-09-01  1539  
12d9c9f8679c56 Qianghua Wang 2026-09-01  1540  	return ret;
12d9c9f8679c56 Qianghua Wang 2026-09-01  1541  }
12d9c9f8679c56 Qianghua Wang 2026-09-01  1542  

:::::: The code at line 1443 was first introduced by commit
:::::: 12d9c9f8679c56e8c131dc2d8985c350ece7c4c3 ASoC: codecs: add SN624x SDCA SoundWire driver

:::::: TO: Qianghua Wang <qianghua.wang@senarytech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
