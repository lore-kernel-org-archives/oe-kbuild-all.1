Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069543750AC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534012; cv=none; b=pCTWjTxuk4aZjDlwo2tU4elAXRVbzvQDRZhOuqmNkZfry1CSpEI9rfYQxCxOZjk1xug6pK2duOALC3iL2TUx699u0gVgxDfpIYKfWuwTfqv7AZqOSddBpD+zfk/zbq7ggfQVEU3xbBNsKx52UltJtR12Xf1Z/7i4GiTMOcvqzA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534012; c=relaxed/simple;
	bh=f29gH3noLv86pXyMLDYKCOc3ZxZxsshh2nIImT8wHw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R0t1HGrxX8PpHG+8zetdWLv6IiNM2K83/i/+cVnGfH2q3PwLLYFKtFu+KSN9YQx3bJw15lRgBQ0Feg7cO8jyQoc5jTBv5Dcqq8RLPMd3Yf0qHyaLo1v0yErUwbYCKIA94aOIRCAq2oPALftEVYjbVcfN3gM59q/JFgG8yTj4B7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jH1uHqK+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jH1uHqK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534011; x=1807070011;
  h=date:from:to:cc:subject:message-id;
  bh=f29gH3noLv86pXyMLDYKCOc3ZxZxsshh2nIImT8wHw4=;
  b=jH1uHqK+nA3SEKb99+M+ZLdDfimX+aqyiEgKmAkGULN+sCREt3T66zcz
   6lAlmKK5C6t5sJyagB5rX5ogSTW1wfXZZhD/f83BViRVMyDzvW0HxXvei
   cGYnnCqg0NahHeVAx/LbO8hoFAow7jYlWg5KZTHStuLwiSjm/Inhno2lF
   i2sLO0OV9QXJBG0eNOou+a1G3fCQLiD75Ln9RQqiEu31e11OQdAGwP2TY
   8JpPye+pqIFAdYViSP8F8xk/NQ/9Kr6RMIlaV7kWjhd92fvr+irkPAos8
   CsPBYJPpRciKsGcP7p2wtzRITyq1HI6UdkSsegIK4lT/o4kTkm8VxkKNN
   g==;
X-CSE-ConnectionGUID: jXYZZ4GfSvqzHyNs1Tr8WA==
X-CSE-MsgGUID: 8rHWh965RWCiuQ18lEVzIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781630"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781630"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:53:26 -0700
X-CSE-ConnectionGUID: YfNc26RCSRmwkYR1XNozGw==
X-CSE-MsgGUID: MMmvadAZS/yXZUcroIGF0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225303589"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:53:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xVB-0000000003P-3DaZ;
	Tue, 07 Apr 2026 03:53:21 +0000
Date: Tue, 07 Apr 2026 11:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 104/106]
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:957:36: error: implicit
 declaration of function 'snd_soc_component_get_drvdata'; did you mean
 'snd_soc_component_set_jack'?
Message-ID: <202604040911.9yS9qJoC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 55f784e93bd97f195076c74fbd15fcb7dfa4a435 [104/106] ASoC: soc-component: remove snd_soc_component_{set/get}_drvdata()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260404/202604040911.9yS9qJoC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040911.9yS9qJoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040911.9yS9qJoC-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_startup':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:109:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     109 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:109:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:111:53: error: invalid use of undefined type 'struct snd_soc_dai'
     111 |         int i2s_num = mt2701_dai_num_to_i2s(afe, dai->id);
         |                                                     ^~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_shutdown':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:144:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     144 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:146:53: error: invalid use of undefined type 'struct snd_soc_dai'
     146 |         int i2s_num = mt2701_dai_num_to_i2s(afe, dai->id);
         |                                                     ^~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_prepare':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:232:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     232 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:234:58: error: invalid use of undefined type 'struct snd_soc_dai'
     234 |         int ret, i2s_num = mt2701_dai_num_to_i2s(afe, dai->id);
         |                                                          ^~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_set_sysclk':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:266:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     266 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:268:53: error: invalid use of undefined type 'struct snd_soc_dai'
     268 |         int i2s_num = mt2701_dai_num_to_i2s(afe, dai->id);
         |                                                     ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_runtime.h:11,
                    from sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:15:
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:276:29: error: invalid use of undefined type 'struct snd_soc_dai'
     276 |                 dev_warn(dai->dev, "The SoCs doesn't support mclk input\n");
         |                             ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:276:17: note: in expansion of macro 'dev_warn'
     276 |                 dev_warn(dai->dev, "The SoCs doesn't support mclk input\n");
         |                 ^~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_btmrg_startup':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:288:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     288 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_btmrg_hw_params':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:305:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     305 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_btmrg_shutdown':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:346:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_simple_fe_startup':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:366:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     366 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_simple_fe_hw_params':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:386:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     386 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_dlm_fe_startup':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:402:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     402 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_dlm_fe_shutdown':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:428:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     428 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_dlm_fe_hw_params':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:447:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     447 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_dlm_fe_trigger':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:469:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     469 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_memif_fs':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:498:39: error: invalid use of undefined type 'struct snd_soc_dai'
     498 |         if (snd_soc_rtd_to_cpu(rtd, 0)->id != MT2701_MEMIF_ULBT)
         |                                       ^~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_pcm_probe':
>> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:957:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     957 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:957:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   sound/soc/mediatek/mt6797/mt6797-afe-pcm.c: In function 'mt6797_memif_fs':
>> sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:145:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     145 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
>> sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:145:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:146:44: error: invalid use of undefined type 'struct snd_soc_dai'
     146 |         int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
         |                                            ^~
   sound/soc/mediatek/mt6797/mt6797-afe-pcm.c: In function 'mt6797_irq_fs':
   sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:156:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     156 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c: In function 'mtk_adda_ul_event':
>> sound/soc/mediatek/mt6797/mt6797-dai-adda.c:56:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
      56 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:56:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c: In function 'mtk_dai_adda_hw_params':
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:155:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     155 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:155:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rbtree.h:24,
                    from include/linux/regmap.h:14,
                    from sound/soc/mediatek/mt6797/mt6797-dai-adda.c:8:
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:159:30: error: invalid use of undefined type 'struct snd_soc_dai'
     159 |                 __func__, dai->id, substream->stream, rate);
         |                              ^~
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
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:158:9: note: in expansion of macro 'dev_dbg'
     158 |         dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d\n",
         |         ^~~~~~~
--
   sound/soc/mediatek/mt7986/mt7986-afe-pcm.c: In function 'mt7986_memif_fs':
>> sound/soc/mediatek/mt7986/mt7986-afe-pcm.c:111:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     111 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
>> sound/soc/mediatek/mt7986/mt7986-afe-pcm.c:111:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt7986/mt7986-afe-pcm.c: In function 'mt7986_irq_fs':
   sound/soc/mediatek/mt7986/mt7986-afe-pcm.c:121:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     121 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_i2s_startup':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     297 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_i2s_shutdown':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:310:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     310 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_i2s_prepare':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:325:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_startup':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:346:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_shutdown':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:360:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     360 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_prepare':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:374:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     374 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_trigger':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:436:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     436 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/of_reserved_mem.h:5,
                    from sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:16:
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:438:64: error: invalid use of undefined type 'struct snd_soc_dai'
     438 |         dev_info(afe->dev, "%s cmd=%d %s\n", __func__, cmd, dai->name);
         |                                                                ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:438:9: note: in expansion of macro 'dev_info'
     438 |         dev_info(afe->dev, "%s cmd=%d %s\n", __func__, cmd, dai->name);
         |         ^~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_memif_fs':
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:486:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     486 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:486:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:487:82: error: invalid use of undefined type 'struct snd_soc_dai'
     487 |         struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
         |                                                                                  ^~
--
   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c: In function 'mt8183_memif_fs':
>> sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:150:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     150 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
>> sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:150:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:151:44: error: invalid use of undefined type 'struct snd_soc_dai'
     151 |         int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
         |                                            ^~
   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c: In function 'mt8183_irq_fs':
   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:161:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     161 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mt8183_i2s_hd_get':
>> sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:122:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     122 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:122:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mt8183_i2s_hd_set':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:141:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     141 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_apll_event':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:275:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     275 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_mclk_en_event':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:302:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     302 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_afe_i2s_share_connect':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:420:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     420 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_afe_i2s_hd_connect':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:441:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     441 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_afe_i2s_apll_connect':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:470:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     470 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_afe_i2s_mclk_connect':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:496:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     496 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_afe_mclk_apll_connect':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:525:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     525 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_dai_i2s_hw_params':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:776:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     776 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:776:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:778:51: error: invalid use of undefined type 'struct snd_soc_dai'
     778 |         return mtk_dai_i2s_config(afe, params, dai->id);
         |                                                   ^~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_dai_i2s_set_sysclk':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:784:55: error: invalid use of undefined type 'struct snd_soc_dai'
     784 |         struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
         |                                                       ^~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:786:67: error: invalid use of undefined type 'struct snd_soc_dai'
     786 |         struct mtk_afe_i2s_priv *i2s_priv = afe_priv->dai_priv[dai->id];
         |                                                                   ^~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_dai_i2s_set_fmt':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:836:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     836 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:840:20: error: invalid use of undefined type 'struct snd_soc_dai'
     840 |         switch (dai->id) {
         |                    ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:10:
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:849:39: error: invalid use of undefined type 'struct snd_soc_dai'
     849 |                          __func__, dai->id);
         |                                       ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:848:17: note: in expansion of macro 'dev_warn'
     848 |                 dev_warn(afe->dev, "%s(), id %d not support\n",
         |                 ^~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:852:42: error: invalid use of undefined type 'struct snd_soc_dai'
     852 |         i2s_priv = afe_priv->dai_priv[dai->id];
         |                                          ^~
..


vim +957 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c

43a6a7e71063ef Garlic Tseng 2016-07-04  954  
10abdc7c149a05 Ryder Lee    2018-04-30  955  static int mt2701_afe_pcm_probe(struct snd_soc_component *component)
10abdc7c149a05 Ryder Lee    2018-04-30  956  {
10abdc7c149a05 Ryder Lee    2018-04-30 @957  	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
10abdc7c149a05 Ryder Lee    2018-04-30  958  
10abdc7c149a05 Ryder Lee    2018-04-30  959  	snd_soc_component_init_regmap(component, afe->regmap);
10abdc7c149a05 Ryder Lee    2018-04-30  960  
10abdc7c149a05 Ryder Lee    2018-04-30  961  	return 0;
10abdc7c149a05 Ryder Lee    2018-04-30  962  }
10abdc7c149a05 Ryder Lee    2018-04-30  963  

:::::: The code at line 957 was first introduced by commit
:::::: 10abdc7c149a058c74be803f33c9ffb1080ad07e ASoC: mediatek: add the .probe() callback in mt2701_afe_pcm_dai_component

:::::: TO: Ryder Lee <ryder.lee@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
