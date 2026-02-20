Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E81FCFFC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601901; cv=none; b=aXjqEc35vy7RbjZBo/m5qZKCAiLIQCr9W90zAVTKgpTEM6IxOoXEM31XyjcCtM7IpMr79ErFAeczUj0WNh/IC0ZDfnQOTRfp/zPLJTLmKZ5ZXJ60BNHVO4fsySciHLqjWkmTjcbwr8Ai6UERnnzt1BmN9NBDxC5f9SDMP5PDbnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601901; c=relaxed/simple;
	bh=187nPbwHchM3FCp7UNFb3Zl2up/dUdgXeBYFteypWOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qdU7ZyYwcXLSw4+rWkxNPGTe4sR04jmc2wI01eSsFXuEfriyN0asFYW9FYLOaUm6FdcsA+Zc8pEm01RsG7Zzx6+rziPGFGbT7uhI4Rr0Z11IGBhY5GIOA2FERMBVcK5UIOtuQqq+IP/lILnCBaHvEHG4eqv9N0y3qX4JazDKXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akW2ALS0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akW2ALS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771601899; x=1803137899;
  h=date:from:to:cc:subject:message-id;
  bh=187nPbwHchM3FCp7UNFb3Zl2up/dUdgXeBYFteypWOs=;
  b=akW2ALS087k05feMAxvjNzS/uIl51zbjSMT3Vk24HsddjddVMLsLla5D
   LPbVIX1+bNw97RXJzr7edb8rmBqkYVR02NJ/aV2NGbvkAR23zC5np/T1g
   EO3mVTokjukL61c8O7x9Q+w1lfM8AIrZkreL7TFJIoqP6Kmt5q74JvrGU
   ytuZIFORbjdqwY4RxIXnhgwzYH/0ffQ3euZL4LsBMYtF7qOcz8PvSfviO
   681C6SE7kHJv2DfO1B6Xc6SpXKaom20ObOrFxjaqOH3NDCiKsdVaNSKJG
   iywinXfqYV26cdbPpMreaqi/PewDowGMLWNa9XuKN98Vis8y+dY7CbFAi
   A==;
X-CSE-ConnectionGUID: HQEOLYq8RyOcONhCGqNb/Q==
X-CSE-MsgGUID: l7Ofz3bdSEmA6Yk+0Wq2sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72872117"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72872117"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 07:38:18 -0800
X-CSE-ConnectionGUID: aAzTw/UyRW2ojLSsFOweCA==
X-CSE-MsgGUID: gRbEG+fAS3WwDLx/DCo6lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="252569041"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Feb 2026 07:38:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtSa5-000000014Cy-3LD2;
	Fri, 20 Feb 2026 15:38:13 +0000
Date: Fri, 20 Feb 2026 23:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-02-20 65/66]
 sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:186:34: error: implicit
 declaration of function 'snd_soc_dai_get_widget_playback'; did you mean
 'snd_soc_dai_stream_widget_set_playback'?
Message-ID: <202602202313.FWmeCroF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-02-20
head:   e7fa84e2f755a12d6e0312da700bb8f6038c035c
commit: d7a632d3e1073660fc408d04ffbfaa71447def6c [65/66] remove define
config: arm-randconfig-r051-20260220 (https://download.01.org/0day-ci/archive/20260220/202602202313.FWmeCroF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602202313.FWmeCroF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602202313.FWmeCroF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c: In function 'mtk_dai_pcm_hw_params':
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:186:34: error: implicit declaration of function 'snd_soc_dai_get_widget_playback'; did you mean 'snd_soc_dai_stream_widget_set_playback'? [-Werror=implicit-function-declaration]
     186 |  struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  snd_soc_dai_stream_widget_set_playback
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:186:34: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:187:34: error: implicit declaration of function 'snd_soc_dai_get_widget_capture'; did you mean 'snd_soc_dai_stream_widget_set_capture'? [-Werror=implicit-function-declaration]
     187 |  struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  snd_soc_dai_stream_widget_set_capture
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:187:34: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:189:67: error: invalid use of undefined type 'struct snd_soc_dai'
     189 |  unsigned int rate_reg = mt6797_rate_transform(afe->dev, rate, dai->id);
         |                                                                   ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:9:
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:194:6: error: invalid use of undefined type 'struct snd_soc_dai'
     194 |   dai->id,
         |      ^~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
     139 |    _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
         |                                   ^~~~~~~~~~~
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:192:2: note: in expansion of macro 'dev_dbg'
     192 |  dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d, rate_reg %d, widget active p %d, c %d\n",
         |  ^~~~~~~
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:204:13: error: invalid use of undefined type 'struct snd_soc_dai'
     204 |  switch (dai->id) {
         |             ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:9:
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:235:18: error: invalid use of undefined type 'struct snd_soc_dai'
     235 |     __func__, dai->id);
         |                  ^~
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                       ^~~~~~~~~~~
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:234:3: note: in expansion of macro 'dev_warn'
     234 |   dev_warn(afe->dev, "%s(), id %d not support\n",
         |   ^~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c: In function 'mtk_dai_pcm_hw_params':
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:186:34: error: implicit declaration of function 'snd_soc_dai_get_widget_playback'; did you mean 'snd_soc_dai_stream_widget_set_playback'? [-Werror=implicit-function-declaration]
     186 |  struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  snd_soc_dai_stream_widget_set_playback
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:186:34: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:187:34: error: implicit declaration of function 'snd_soc_dai_get_widget_capture'; did you mean 'snd_soc_dai_stream_widget_set_capture'? [-Werror=implicit-function-declaration]
     187 |  struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  snd_soc_dai_stream_widget_set_capture
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:187:34: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:189:67: error: invalid use of undefined type 'struct snd_soc_dai'
     189 |  unsigned int rate_reg = mt8183_rate_transform(afe->dev, rate, dai->id);
         |                                                                   ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:9:
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:194:6: error: invalid use of undefined type 'struct snd_soc_dai'
     194 |   dai->id,
         |      ^~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
     139 |    _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
         |                                   ^~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:192:2: note: in expansion of macro 'dev_dbg'
     192 |  dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d, rate_reg %d, widget active p %d, c %d\n",
         |  ^~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:203:13: error: invalid use of undefined type 'struct snd_soc_dai'
     203 |  switch (dai->id) {
         |             ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:9:
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:234:18: error: invalid use of undefined type 'struct snd_soc_dai'
     234 |     __func__, dai->id);
         |                  ^~
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                       ^~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:233:3: note: in expansion of macro 'dev_warn'
     233 |   dev_warn(afe->dev, "%s(), id %d not support\n",
         |   ^~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c: In function 'mtk_dai_pcm_hw_params':
>> sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:276:34: error: implicit declaration of function 'snd_soc_dai_get_widget_playback'; did you mean 'snd_soc_dai_stream_widget_set_playback'? [-Werror=implicit-function-declaration]
     276 |  struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  snd_soc_dai_stream_widget_set_playback
>> sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:276:34: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:277:34: error: implicit declaration of function 'snd_soc_dai_get_widget_capture'; did you mean 'snd_soc_dai_stream_widget_set_capture'? [-Werror=implicit-function-declaration]
     277 |  struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  snd_soc_dai_stream_widget_set_capture
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:277:34: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:279:67: error: invalid use of undefined type 'struct snd_soc_dai'
     279 |  unsigned int rate_reg = mt8192_rate_transform(afe->dev, rate, dai->id);
         |                                                                   ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:10:
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:284:7: error: invalid use of undefined type 'struct snd_soc_dai'
     284 |    dai->id,
         |       ^~
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                       ^~~~~~~~~~~
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:282:2: note: in expansion of macro 'dev_info'
     282 |  dev_info(afe->dev, "%s(), id %d, stream %d, rate %d, rate_reg %d, widget active p %d, c %d\n",
         |  ^~~~~~~~
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:294:13: error: invalid use of undefined type 'struct snd_soc_dai'
     294 |  switch (dai->id) {
         |             ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:10:
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:325:18: error: invalid use of undefined type 'struct snd_soc_dai'
     325 |     __func__, dai->id);
         |                  ^~
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                       ^~~~~~~~~~~
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:324:3: note: in expansion of macro 'dev_warn'
     324 |   dev_warn(afe->dev, "%s(), id %d not support\n",
         |   ^~~~~~~~
   cc1: some warnings being treated as errors


vim +186 sound/soc/mediatek/mt6797/mt6797-dai-pcm.c

314b355f55b53b Kai Chieh Chuang  2018-05-31  179  
314b355f55b53b Kai Chieh Chuang  2018-05-31  180  /* dai ops */
314b355f55b53b Kai Chieh Chuang  2018-05-31  181  static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
314b355f55b53b Kai Chieh Chuang  2018-05-31  182  				 struct snd_pcm_hw_params *params,
314b355f55b53b Kai Chieh Chuang  2018-05-31  183  				 struct snd_soc_dai *dai)
314b355f55b53b Kai Chieh Chuang  2018-05-31  184  {
314b355f55b53b Kai Chieh Chuang  2018-05-31  185  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
0df2ec8e4706a6 Kuninori Morimoto 2023-01-31 @186  	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
0df2ec8e4706a6 Kuninori Morimoto 2023-01-31 @187  	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
314b355f55b53b Kai Chieh Chuang  2018-05-31  188  	unsigned int rate = params_rate(params);
314b355f55b53b Kai Chieh Chuang  2018-05-31  189  	unsigned int rate_reg = mt6797_rate_transform(afe->dev, rate, dai->id);
314b355f55b53b Kai Chieh Chuang  2018-05-31  190  	unsigned int pcm_con = 0;
314b355f55b53b Kai Chieh Chuang  2018-05-31  191  
314b355f55b53b Kai Chieh Chuang  2018-05-31  192  	dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d, rate_reg %d, widget active p %d, c %d\n",
314b355f55b53b Kai Chieh Chuang  2018-05-31  193  		__func__,
314b355f55b53b Kai Chieh Chuang  2018-05-31  194  		dai->id,
314b355f55b53b Kai Chieh Chuang  2018-05-31  195  		substream->stream,
314b355f55b53b Kai Chieh Chuang  2018-05-31  196  		rate,
314b355f55b53b Kai Chieh Chuang  2018-05-31  197  		rate_reg,
0df2ec8e4706a6 Kuninori Morimoto 2023-01-31  198  		p->active,
0df2ec8e4706a6 Kuninori Morimoto 2023-01-31  199  		c->active);
314b355f55b53b Kai Chieh Chuang  2018-05-31  200  
0df2ec8e4706a6 Kuninori Morimoto 2023-01-31  201  	if (p->active || c->active)
314b355f55b53b Kai Chieh Chuang  2018-05-31  202  		return 0;
314b355f55b53b Kai Chieh Chuang  2018-05-31  203  
314b355f55b53b Kai Chieh Chuang  2018-05-31  204  	switch (dai->id) {
314b355f55b53b Kai Chieh Chuang  2018-05-31  205  	case MT6797_DAI_PCM_1:
314b355f55b53b Kai Chieh Chuang  2018-05-31  206  		pcm_con |= AUD_BCLK_OUT_INV_NO_INVERSE << PCM_BCLK_OUT_INV_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  207  		pcm_con |= AUD_TX_LCH_RPT_NO_REPEAT << PCM_TX_LCH_RPT_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  208  		pcm_con |= AUD_VBT_16K_MODE_DISABLE << PCM_VBT_16K_MODE_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  209  		pcm_con |= AUD_EXT_MODEM_SELECT_INTERNAL << PCM_EXT_MODEM_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  210  		pcm_con |= 0 << PCM_SYNC_LENGTH_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  211  		pcm_con |= AUD_PCM_ONE_BCK_CYCLE_SYNC << PCM_SYNC_TYPE_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  212  		pcm_con |= AUD_BT_MODE_DUAL_MIC_ON_TX << PCM_BT_MODE_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  213  		pcm_con |= AUD_PCM_AFIFO_AFIFO << PCM_BYP_ASRC_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  214  		pcm_con |= AUD_PCM_CLOCK_SLAVE_MODE << PCM_SLAVE_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  215  		pcm_con |= rate_reg << PCM_MODE_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  216  		pcm_con |= AUD_PCM_FMT_PCM_MODE_B << PCM_FMT_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  217  
314b355f55b53b Kai Chieh Chuang  2018-05-31  218  		regmap_update_bits(afe->regmap, PCM_INTF_CON1,
314b355f55b53b Kai Chieh Chuang  2018-05-31  219  				   0xfffffffe, pcm_con);
314b355f55b53b Kai Chieh Chuang  2018-05-31  220  		break;
314b355f55b53b Kai Chieh Chuang  2018-05-31  221  	case MT6797_DAI_PCM_2:
314b355f55b53b Kai Chieh Chuang  2018-05-31  222  		pcm_con |= AUD_TX_LCH_RPT_NO_REPEAT << PCM2_TX_LCH_RPT_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  223  		pcm_con |= AUD_VBT_16K_MODE_DISABLE << PCM2_VBT_16K_MODE_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  224  		pcm_con |= AUD_BT_MODE_DUAL_MIC_ON_TX << PCM2_BT_MODE_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  225  		pcm_con |= AUD_PCM_AFIFO_AFIFO << PCM2_AFIFO_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  226  		pcm_con |= AUD_PCM_WLEN_PCM_32_BCK_CYCLES << PCM2_WLEN_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  227  		pcm_con |= rate_reg << PCM2_MODE_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  228  		pcm_con |= AUD_PCM_FMT_PCM_MODE_B << PCM2_FMT_SFT;
314b355f55b53b Kai Chieh Chuang  2018-05-31  229  
314b355f55b53b Kai Chieh Chuang  2018-05-31  230  		regmap_update_bits(afe->regmap, PCM2_INTF_CON,
314b355f55b53b Kai Chieh Chuang  2018-05-31  231  				   0xfffffffe, pcm_con);
314b355f55b53b Kai Chieh Chuang  2018-05-31  232  		break;
314b355f55b53b Kai Chieh Chuang  2018-05-31  233  	default:
314b355f55b53b Kai Chieh Chuang  2018-05-31  234  		dev_warn(afe->dev, "%s(), id %d not support\n",
314b355f55b53b Kai Chieh Chuang  2018-05-31  235  			 __func__, dai->id);
314b355f55b53b Kai Chieh Chuang  2018-05-31  236  		return -EINVAL;
314b355f55b53b Kai Chieh Chuang  2018-05-31  237  	}
314b355f55b53b Kai Chieh Chuang  2018-05-31  238  
314b355f55b53b Kai Chieh Chuang  2018-05-31  239  	return 0;
314b355f55b53b Kai Chieh Chuang  2018-05-31  240  }
314b355f55b53b Kai Chieh Chuang  2018-05-31  241  

:::::: The code at line 186 was first introduced by commit
:::::: 0df2ec8e4706a6adc36d12cc5cf8e1fa7485fbf5 ASoC: mediatek: use helper function

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
