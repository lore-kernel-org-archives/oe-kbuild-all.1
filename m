Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357A733987
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 13:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771595597; cv=none; b=VHaQjw6i1cyGmqPoZXh8QBCtgWqfSJH2nYTKOJyIaRQKhzl7cNLpe4OU3ADfUIVWp0XoB3ELYc9SavF7g2/QjIlizYGiKVveEtmFQzUcDOZM6YrHBeqfrLENgOy90Y7hLo+iov8HcNC084qU+7Tn/S+dKiALlqKK6Sc4ReQRxys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771595597; c=relaxed/simple;
	bh=whk+jlzXKJn8vbZe4HvOOoXxUoefdgkfl7/x5ixzt6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mq0mvqqHjEubzfKol2ty7M5qziqx+d1qYHcghvYLIMvJwchDIp5Y/yEGe5s166YCargS46Ghe/xwViTiDTQLl77MxpyKhZNeQmqEIQJ4U3v6+W7rkwGX0ojkMC8+i8/jknaMegYSCzlaaegMvtf0Vb1J7yvXMYBVBxkkbgYhOD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ5i4gJk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ5i4gJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771595596; x=1803131596;
  h=date:from:to:cc:subject:message-id;
  bh=whk+jlzXKJn8vbZe4HvOOoXxUoefdgkfl7/x5ixzt6s=;
  b=jZ5i4gJkhr6eWpSMXsaKB3577nUZC761IPKhgWjV55bMgDfBzKMjonqJ
   O0B+M2sQ8ojdxE1qOU8kJIvUqi5GVy+A6HBvFTheK+1oGuYOva1M8rmgN
   J9VdNuzTsOlxReujVSUf4+ybCEiE7I27mGXnK6f++DL/w9D26Gvk71fYT
   VUUY5OQ0DCBvj1n5RSo7MZJ7zjQB9tlk0AbUhwa/Pf+hq0LO4txIP3hwk
   OJ8ktBpfnr81U2G8niHIDPsdZfFMQQf8mgYO2t4j/Z4xH6ASkh5K09Cep
   NhyDodRRFXjROUc+WSEx2cpWcGVLQyAUueRE4Vg0msKd6ExlEB3P7Bf3x
   w==;
X-CSE-ConnectionGUID: RpsmL3zzR6GePLNN7MviSQ==
X-CSE-MsgGUID: 2m72zOHZSB2F+UAzo8Vx3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60260997"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="60260997"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 05:53:15 -0800
X-CSE-ConnectionGUID: +YTw4QarQb2U1nRgjCvV9g==
X-CSE-MsgGUID: IiWjHiaFTSuSAiDntoI6sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214863252"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Feb 2026 05:53:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtQwR-00000001496-2Xur;
	Fri, 20 Feb 2026 13:53:11 +0000
Date: Fri, 20 Feb 2026 21:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-02-20 64/66]
 sound/soc/pxa/mmp-sspa.c:110:30: error: invalid use of undefined type 'struct
 snd_soc_dai'
Message-ID: <202602202153.9al5bRRw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-02-20
head:   e7fa84e2f755a12d6e0312da700bb8f6038c035c
commit: c93b222fd35b0bc4dd175afaaf9ce4a08dc2b8d4 [64/66] move struct dai
config: arm-randconfig-r051-20260220 (https://download.01.org/0day-ci/archive/20260220/202602202153.9al5bRRw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602202153.9al5bRRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602202153.9al5bRRw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_sysclk':
>> sound/soc/pxa/mmp-sspa.c:110:30: error: invalid use of undefined type 'struct snd_soc_dai'
     110 |  struct device *dev = cpu_dai->component->dev;
         |                              ^~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_pll':
   sound/soc/pxa/mmp-sspa.c:138:30: error: invalid use of undefined type 'struct snd_soc_dai'
     138 |  struct device *dev = cpu_dai->component->dev;
         |                              ^~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_hw_params':
   sound/soc/pxa/mmp-sspa.c:216:26: error: invalid use of undefined type 'struct snd_soc_dai'
     216 |  struct device *dev = dai->component->dev;
         |                          ^~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_probe':
   sound/soc/pxa/mmp-sspa.c:327:46: error: invalid use of undefined type 'struct snd_soc_dai'
     327 |  struct sspa_priv *sspa = dev_get_drvdata(dai->dev);
         |                                              ^~
--
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_startup':
>> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:111:46: error: invalid use of undefined type 'struct snd_soc_dai'
     111 |  int i2s_num = mt2701_dai_num_to_i2s(afe, dai->id);
         |                                              ^~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_shutdown':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:146:46: error: invalid use of undefined type 'struct snd_soc_dai'
     146 |  int i2s_num = mt2701_dai_num_to_i2s(afe, dai->id);
         |                                              ^~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_prepare':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:234:51: error: invalid use of undefined type 'struct snd_soc_dai'
     234 |  int ret, i2s_num = mt2701_dai_num_to_i2s(afe, dai->id);
         |                                                   ^~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_set_sysclk':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:268:46: error: invalid use of undefined type 'struct snd_soc_dai'
     268 |  int i2s_num = mt2701_dai_num_to_i2s(afe, dai->id);
         |                                              ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_runtime.h:11,
                    from sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:15:
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:276:15: error: invalid use of undefined type 'struct snd_soc_dai'
     276 |   dev_warn(dai->dev, "The SoCs doesn't support mclk input\n");
         |               ^~
   include/linux/dev_printk.h:110:11: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |           ^~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:276:3: note: in expansion of macro 'dev_warn'
     276 |   dev_warn(dai->dev, "The SoCs doesn't support mclk input\n");
         |   ^~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_memif_fs':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:498:32: error: invalid use of undefined type 'struct snd_soc_dai'
     498 |  if (snd_soc_rtd_to_cpu(rtd, 0)->id != MT2701_MEMIF_ULBT)
         |                                ^~
--
   sound/soc/mediatek/mt6797/mt6797-afe-pcm.c: In function 'mt6797_memif_fs':
>> sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:146:37: error: invalid use of undefined type 'struct snd_soc_dai'
     146 |  int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
         |                                     ^~
--
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c: In function 'mtk_dai_pcm_hw_params':
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:189:67: error: invalid use of undefined type 'struct snd_soc_dai'
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
--
   In file included from include/linux/device.h:15,
                    from include/sound/soc.h:15,
                    from sound/soc/mediatek/mt6797/mt6797-afe-common.h:12,
                    from sound/soc/mediatek/mt6797/mt6797-dai-adda.c:10:
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c: In function 'mtk_dai_adda_hw_params':
>> sound/soc/mediatek/mt6797/mt6797-dai-adda.c:159:16: error: invalid use of undefined type 'struct snd_soc_dai'
     159 |   __func__, dai->id, substream->stream, rate);
         |                ^~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
     139 |    _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
         |                                   ^~~~~~~~~~~
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:158:2: note: in expansion of macro 'dev_dbg'
     158 |  dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d\n",
         |  ^~~~~~~
--
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c: In function 'mtk_dai_etdm_config':
>> sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:169:62: error: invalid use of undefined type 'struct snd_soc_dai'
     169 |  struct mtk_dai_etdm_priv *etdm_data = afe_priv->dai_priv[dai->id];
         |                                                              ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:13:
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c: In function 'mtk_dai_etdm_trigger':
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:268:67: error: invalid use of undefined type 'struct snd_soc_dai'
     268 |  dev_dbg(afe->dev, "%s(), cmd %d, dai id %d\n", __func__, cmd, dai->id);
         |                                                                   ^~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
     139 |    _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
         |                                   ^~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:268:2: note: in expansion of macro 'dev_dbg'
     268 |  dev_dbg(afe->dev, "%s(), cmd %d, dai id %d\n", __func__, cmd, dai->id);
         |  ^~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c: In function 'mtk_dai_etdm_set_fmt':
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:298:13: error: invalid use of undefined type 'struct snd_soc_dai'
     298 |  switch (dai->id) {
         |             ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:13:
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:303:18: error: invalid use of undefined type 'struct snd_soc_dai'
     303 |     __func__, dai->id);
         |                  ^~
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                       ^~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:302:3: note: in expansion of macro 'dev_warn'
     302 |   dev_warn(afe->dev, "%s(), id %d not support\n",
         |   ^~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:312:24: error: invalid use of undefined type 'struct snd_soc_dai'
     312 |  afe_priv->dai_priv[dai->id] = priv_data;
         |                        ^~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:313:36: error: invalid use of undefined type 'struct snd_soc_dai'
     313 |  etdm_data = afe_priv->dai_priv[dai->id];
         |                                    ^~
--
   In file included from include/linux/device.h:15,
                    from include/linux/of_reserved_mem.h:5,
                    from sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:16:
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_trigger':
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:438:57: error: invalid use of undefined type 'struct snd_soc_dai'
     438 |  dev_info(afe->dev, "%s cmd=%d %s\n", __func__, cmd, dai->name);
         |                                                         ^~
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                       ^~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:438:2: note: in expansion of macro 'dev_info'
     438 |  dev_info(afe->dev, "%s cmd=%d %s\n", __func__, cmd, dai->name);
         |  ^~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_memif_fs':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:487:75: error: invalid use of undefined type 'struct snd_soc_dai'
     487 |  struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
         |                                                                           ^~
--
   sound/soc/mediatek/mt8173/mt8173-max98090.c: In function 'mt8173_max98090_init':
>> sound/soc/mediatek/mt8173/mt8173-max98090.c:69:72: error: invalid use of undefined type 'struct snd_soc_dai'
      69 |  struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
         |                                                                        ^~
--
   sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c: In function 'mt8173_rt5650_rt5676_init':
>> sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c:89:72: error: invalid use of undefined type 'struct snd_soc_dai'
      89 |  struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
         |                                                                        ^~
   sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c:90:76: error: invalid use of undefined type 'struct snd_soc_dai'
      90 |  struct snd_soc_component *component_sub = snd_soc_rtd_to_codec(runtime, 1)->component;
         |                                                                            ^~
--
   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c: In function 'mt8183_memif_fs':
>> sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:151:37: error: invalid use of undefined type 'struct snd_soc_dai'
     151 |  int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
         |                                     ^~
--
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_dai_i2s_hw_params':
>> sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:778:44: error: invalid use of undefined type 'struct snd_soc_dai'
     778 |  return mtk_dai_i2s_config(afe, params, dai->id);
         |                                            ^~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_dai_i2s_set_sysclk':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:784:48: error: invalid use of undefined type 'struct snd_soc_dai'
     784 |  struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
         |                                                ^~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:786:60: error: invalid use of undefined type 'struct snd_soc_dai'
     786 |  struct mtk_afe_i2s_priv *i2s_priv = afe_priv->dai_priv[dai->id];
         |                                                            ^~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_dai_i2s_set_fmt':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:840:13: error: invalid use of undefined type 'struct snd_soc_dai'
     840 |  switch (dai->id) {
         |             ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:10:
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:849:18: error: invalid use of undefined type 'struct snd_soc_dai'
     849 |     __func__, dai->id);
         |                  ^~
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                       ^~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:848:3: note: in expansion of macro 'dev_warn'
     848 |   dev_warn(afe->dev, "%s(), id %d not support\n",
         |   ^~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:852:35: error: invalid use of undefined type 'struct snd_soc_dai'
     852 |  i2s_priv = afe_priv->dai_priv[dai->id];
         |                                   ^~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_dai_i2s_hw_params':
>> sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:779:1: warning: control reaches end of non-void function [-Wreturn-type]
     779 | }
         | ^
..


vim +110 sound/soc/pxa/mmp-sspa.c

fa375d42f0e531 Zhangfei Gao   2012-06-11  102  
fa375d42f0e531 Zhangfei Gao   2012-06-11  103  /*
fa375d42f0e531 Zhangfei Gao   2012-06-11  104   * Set the SSP ports SYSCLK.
fa375d42f0e531 Zhangfei Gao   2012-06-11  105   */
fa375d42f0e531 Zhangfei Gao   2012-06-11  106  static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
fa375d42f0e531 Zhangfei Gao   2012-06-11  107  				    int clk_id, unsigned int freq, int dir)
fa375d42f0e531 Zhangfei Gao   2012-06-11  108  {
3c4e89df3b4534 Lubomir Rintel 2020-05-11  109  	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
a97e384ba78fd8 Lubomir Rintel 2020-05-11 @110  	struct device *dev = cpu_dai->component->dev;
fa375d42f0e531 Zhangfei Gao   2012-06-11  111  	int ret = 0;
fa375d42f0e531 Zhangfei Gao   2012-06-11  112  
a97e384ba78fd8 Lubomir Rintel 2020-05-11  113  	if (dev->of_node)
a97e384ba78fd8 Lubomir Rintel 2020-05-11  114  		return -ENOTSUPP;
a97e384ba78fd8 Lubomir Rintel 2020-05-11  115  
fa375d42f0e531 Zhangfei Gao   2012-06-11  116  	switch (clk_id) {
fa375d42f0e531 Zhangfei Gao   2012-06-11  117  	case MMP_SSPA_CLK_AUDIO:
3c4e89df3b4534 Lubomir Rintel 2020-05-11  118  		ret = clk_set_rate(sspa->audio_clk, freq);
fa375d42f0e531 Zhangfei Gao   2012-06-11  119  		if (ret)
fa375d42f0e531 Zhangfei Gao   2012-06-11  120  			return ret;
fa375d42f0e531 Zhangfei Gao   2012-06-11  121  		break;
fa375d42f0e531 Zhangfei Gao   2012-06-11  122  	case MMP_SSPA_CLK_PLL:
fa375d42f0e531 Zhangfei Gao   2012-06-11  123  	case MMP_SSPA_CLK_VCXO:
fa375d42f0e531 Zhangfei Gao   2012-06-11  124  		/* not support yet */
fa375d42f0e531 Zhangfei Gao   2012-06-11  125  		return -EINVAL;
fa375d42f0e531 Zhangfei Gao   2012-06-11  126  	default:
fa375d42f0e531 Zhangfei Gao   2012-06-11  127  		return -EINVAL;
fa375d42f0e531 Zhangfei Gao   2012-06-11  128  	}
fa375d42f0e531 Zhangfei Gao   2012-06-11  129  
fa375d42f0e531 Zhangfei Gao   2012-06-11  130  	return 0;
fa375d42f0e531 Zhangfei Gao   2012-06-11  131  }
fa375d42f0e531 Zhangfei Gao   2012-06-11  132  

:::::: The code at line 110 was first introduced by commit
:::::: a97e384ba78fd8bf7ba8c32718424d8a7536416e ASoC: mmp-sspa: Add Device Tree support

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
