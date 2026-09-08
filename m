Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFF834041B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 03:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788839721; cv=none; b=dZdWS6UyIG0X3o+xhxf1QACug+/bMWFKSXmZvjLQ2LDKLgRkBFxbuj2y9R3yRSF2V3+6GhQnp3FZ/fRumBTuqKNL0EItyjbpRA7RcfyYxp4ogFiairj3WSrEOXL1nTauLUnNo72LkMgB/IvcryvicB/4tT4nXTKfkuz40Xc1078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788839721; c=relaxed/simple;
	bh=8DEc1sKfn8hTXfrK30XYBCR5m7sQPyTYcGE1Fg4pYmA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NE1LflPeMwSHn727wZAGz60wEymvBj1USW4UEC+uX0jbldGvX+Ym26he29Jz5ggdAuMqA9lfXZOL+/pEJoCl39M3cpaP0nBaLaxEQtT5Dgzbj/iUg9+m3/nYXBtanzr6J/o4cfA6UmxPt7DYGpMmYKnN8BjZ0gweUGRCB8tq51s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUMAOntA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUMAOntA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788839701; x=1820375701;
  h=date:from:to:cc:subject:message-id;
  bh=8DEc1sKfn8hTXfrK30XYBCR5m7sQPyTYcGE1Fg4pYmA=;
  b=LUMAOntAXNfzxEvyqgvGwmCeKDbxn8HgKMyjC7DCl9vdzgA8N1VU4R0w
   dhMNbKUwapd6NYQCZWZ+VBMjsdW/C0y78gMmXycPn7XjYJoO0vzjn4Vc5
   9TSmIHhHwyVizW9vK4FHlsBqMahaEUVFu0HACh5zDk1bl2oo6zJMB9J6l
   MZCEOa191/JtYLTKzxquxyHo0Td40jFU1ceLaGiDFMrFi6U3ZcX430DJ/
   StWn/d2c3Wok8uIh7FSae0eRnTmg1S82BkqaUgClfLdGPAb46r7xjJE/u
   5TwuBsxlYbcEpOkY2WcBHWOblrUxblxChpr9JQzLC2Jr3Zwf2rmJWZTix
   A==;
X-CSE-ConnectionGUID: ejlXNME/QyWjG2R/RMlB8g==
X-CSE-MsgGUID: 2sm/UqZySJ+3kn/xyaEG5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89265119"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89265119"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 20:54:54 -0700
X-CSE-ConnectionGUID: JkJCuSH8R2CgKOU3jb4H8g==
X-CSE-MsgGUID: N9x9G+1oTWiGhmtnu2+yGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269547204"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2026 20:54:51 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3mv2-000000001dd-3E3D;
	Tue, 08 Sep 2026 03:54:48 +0000
Date: Tue, 08 Sep 2026 11:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 263/343]
 sound/soc/codecs/sn624x-sdca-sdw.c:200:39: error: invalid use of undefined
 type 'struct snd_soc_component'
Message-ID: <202609081134.hEnq4nHM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: 39822a6ef2f5c6b15b01c08c9a6c70b57d7134fd [263/343] ASoC: soc-component: capsuling Component
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260908/202609081134.hEnq4nHM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081134.hEnq4nHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081134.hEnq4nHM-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_dapm_pde_event':
   sound/soc/codecs/sn624x-sdca-sdw.c:199:17: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     199 |                 snd_soc_component_get_drvdata(component);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 snd_soc_component_set_jack
   sound/soc/codecs/sn624x-sdca-sdw.c:199:17: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> sound/soc/codecs/sn624x-sdca-sdw.c:200:39: error: invalid use of undefined type 'struct snd_soc_component'
     200 |         struct device *dev = component->dev;
         |                                       ^~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_fu_mute_event':
   sound/soc/codecs/sn624x-sdca-sdw.c:270:17: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     270 |                 snd_soc_component_get_drvdata(component);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:271:39: error: invalid use of undefined type 'struct snd_soc_component'
     271 |         struct device *dev = component->dev;
         |                                       ^~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_fu_mic2_event':
   sound/soc/codecs/sn624x-sdca-sdw.c:346:17: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |                 snd_soc_component_get_drvdata(component);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:350:62: error: invalid use of undefined type 'struct snd_soc_component'
     350 |                 sn624x_uaj_ge35_apply_detected_mode(component->dev, sn624x);
         |                                                              ^~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_jack_rpm_get':
   sound/soc/codecs/sn624x-sdca-sdw.c:870:32: error: invalid use of undefined type 'struct snd_soc_component'
     870 |         dev = sn624x->component->dev;
         |                                ^~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_jack_rpm_put':
   sound/soc/codecs/sn624x-sdca-sdw.c:890:52: error: invalid use of undefined type 'struct snd_soc_component'
     890 |         pm_runtime_mark_last_busy(sn624x->component->dev);
         |                                                    ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:891:53: error: invalid use of undefined type 'struct snd_soc_component'
     891 |         pm_runtime_put_autosuspend(sn624x->component->dev);
         |                                                     ^~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_set_jack_detect':
   sound/soc/codecs/sn624x-sdca-sdw.c:981:43: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     981 |         struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from sound/soc/codecs/sn624x-sdca-sdw.c:8:
   sound/soc/codecs/sn624x-sdca-sdw.c:984:26: error: invalid use of undefined type 'struct snd_soc_component'
     984 |         dev_dbg(component->dev,
         |                          ^~
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
   sound/soc/codecs/sn624x-sdca-sdw.c:984:9: note: in expansion of macro 'dev_dbg'
     984 |         dev_dbg(component->dev,
         |         ^~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_probe':
   sound/soc/codecs/sn624x-sdca-sdw.c:1424:43: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1424 |         struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c:1432:42: error: invalid use of undefined type 'struct snd_soc_component'
    1432 |         ret = pm_runtime_resume(component->dev);
         |                                          ^~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_pcm_hw_params':
   sound/soc/codecs/sn624x-sdca-sdw.c:1443:50: error: invalid use of undefined type 'struct snd_soc_dai'
    1443 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:1444:43: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1444 |         struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
--
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c: In function 'asoc_sdw_senary_sdca_jack_rtd_init':
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:85:24: error: invalid use of undefined type 'struct snd_soc_dai'
      85 |         component = dai->component;
         |                        ^~
>> sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:88:70: error: invalid use of undefined type 'struct snd_soc_component'
      88 |                                           card->components, component->name_prefix);
         |                                                                      ^~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:93:38: error: invalid use of undefined type 'struct snd_soc_component'
      93 |                 if (!strstr(component->name_prefix, need_sdca_suffix[i]))
         |                                      ^~
   In file included from include/linux/device.h:15,
                    from sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:6:
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:112:70: error: invalid use of undefined type 'struct snd_soc_component'
     112 |                 dev_err(card->dev, "%s is not supported\n", component->name_prefix);
         |                                                                      ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:112:17: note: in expansion of macro 'dev_err'
     112 |                 dev_err(card->dev, "%s is not supported\n", component->name_prefix);
         |                 ^~~~~~~
--
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c: In function 'asoc_sdw_senary_dmic_rtd_init':
   sound/soc/sdw_utils/soc_sdw_senary_dmic.c:26:24: error: invalid use of undefined type 'struct snd_soc_dai'
      26 |         component = dai->component;
         |                        ^~
>> sound/soc/sdw_utils/soc_sdw_senary_dmic.c:35:73: error: invalid use of undefined type 'struct snd_soc_component'
      35 |         mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);
         |                                                                         ^~


vim +200 sound/soc/codecs/sn624x-sdca-sdw.c

12d9c9f8679c56e Qianghua Wang 2026-09-01  174  
12d9c9f8679c56e Qianghua Wang 2026-09-01  175  #define SN624X_REG_DMIC_FUN_STATUS_CTL \
12d9c9f8679c56e Qianghua Wang 2026-09-01  176  	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_ENTITY0, \
12d9c9f8679c56e Qianghua Wang 2026-09-01  177  		     SN624X_SDCA_CTL_FUNCTION_STATUS, 0)
12d9c9f8679c56e Qianghua Wang 2026-09-01  178  
12d9c9f8679c56e Qianghua Wang 2026-09-01  179  /*
12d9c9f8679c56e Qianghua Wang 2026-09-01  180   * Write REQUESTED_PS then poll ACTUAL_PS with the shared SDCA helper
12d9c9f8679c56e Qianghua Wang 2026-09-01  181   * (sdca_asoc_pde_poll_actual_ps). Caller must not hand-roll ACTUAL_PS waits.
12d9c9f8679c56e Qianghua Wang 2026-09-01  182   */
12d9c9f8679c56e Qianghua Wang 2026-09-01  183  static int sn624x_pde_request_ps(struct device *dev, struct regmap *regmap,
12d9c9f8679c56e Qianghua Wang 2026-09-01  184  				 unsigned int fun, unsigned int ent,
12d9c9f8679c56e Qianghua Wang 2026-09-01  185  				 unsigned int ps);
12d9c9f8679c56e Qianghua Wang 2026-09-01  186  
12d9c9f8679c56e Qianghua Wang 2026-09-01  187  /*
12d9c9f8679c56e Qianghua Wang 2026-09-01  188   * DAPM PDE supplies (rt711/rt712 style): write REQUESTED_PS then poll ACTUAL_PS.
12d9c9f8679c56e Qianghua Wang 2026-09-01  189   * Mute-before-D3 is handled by FU widget PRE_PMD, which runs before SUPPLY PRE_PMD
12d9c9f8679c56e Qianghua Wang 2026-09-01  190   * when the FU lists the PDE as a dependency.
12d9c9f8679c56e Qianghua Wang 2026-09-01  191   */
12d9c9f8679c56e Qianghua Wang 2026-09-01  192  static int sn624x_dapm_pde_event(struct snd_soc_dapm_widget *w,
12d9c9f8679c56e Qianghua Wang 2026-09-01  193  				 struct snd_kcontrol *kcontrol, int event,
12d9c9f8679c56e Qianghua Wang 2026-09-01  194  				 unsigned int fun, unsigned int ent)
12d9c9f8679c56e Qianghua Wang 2026-09-01  195  {
12d9c9f8679c56e Qianghua Wang 2026-09-01  196  	struct snd_soc_component *component =
12d9c9f8679c56e Qianghua Wang 2026-09-01  197  		snd_soc_dapm_to_component(w->dapm);
12d9c9f8679c56e Qianghua Wang 2026-09-01  198  	struct sn624x_sdca_priv *sn624x =
12d9c9f8679c56e Qianghua Wang 2026-09-01  199  		snd_soc_component_get_drvdata(component);
12d9c9f8679c56e Qianghua Wang 2026-09-01 @200  	struct device *dev = component->dev;
12d9c9f8679c56e Qianghua Wang 2026-09-01  201  	int ret;
12d9c9f8679c56e Qianghua Wang 2026-09-01  202  
12d9c9f8679c56e Qianghua Wang 2026-09-01  203  	if (!sn624x || !sn624x->regmap)
12d9c9f8679c56e Qianghua Wang 2026-09-01  204  		return -ENODEV;
12d9c9f8679c56e Qianghua Wang 2026-09-01  205  
12d9c9f8679c56e Qianghua Wang 2026-09-01  206  	switch (event) {
12d9c9f8679c56e Qianghua Wang 2026-09-01  207  	case SND_SOC_DAPM_POST_PMU:
12d9c9f8679c56e Qianghua Wang 2026-09-01  208  		ret = sn624x_pde_request_ps(dev, sn624x->regmap, fun, ent,
12d9c9f8679c56e Qianghua Wang 2026-09-01  209  					    SN624X_PWR_D0);
12d9c9f8679c56e Qianghua Wang 2026-09-01  210  		if (ret < 0)
12d9c9f8679c56e Qianghua Wang 2026-09-01  211  			dev_warn(dev,
12d9c9f8679c56e Qianghua Wang 2026-09-01  212  				 "sn624x: DAPM %s PDE fun=%u ent=0x%x -> PS0 failed (%d)\n",
12d9c9f8679c56e Qianghua Wang 2026-09-01  213  				 w->name, fun, ent, ret);
12d9c9f8679c56e Qianghua Wang 2026-09-01  214  		break;
12d9c9f8679c56e Qianghua Wang 2026-09-01  215  	case SND_SOC_DAPM_PRE_PMD:
12d9c9f8679c56e Qianghua Wang 2026-09-01  216  		ret = sn624x_pde_request_ps(dev, sn624x->regmap, fun, ent,
12d9c9f8679c56e Qianghua Wang 2026-09-01  217  					    SN624X_PWR_D3);
12d9c9f8679c56e Qianghua Wang 2026-09-01  218  		if (ret < 0)
12d9c9f8679c56e Qianghua Wang 2026-09-01  219  			dev_warn(dev,
12d9c9f8679c56e Qianghua Wang 2026-09-01  220  				 "sn624x: DAPM %s PDE fun=%u ent=0x%x -> PS3 failed (%d)\n",
12d9c9f8679c56e Qianghua Wang 2026-09-01  221  				 w->name, fun, ent, ret);
12d9c9f8679c56e Qianghua Wang 2026-09-01  222  		break;
12d9c9f8679c56e Qianghua Wang 2026-09-01  223  	default:
12d9c9f8679c56e Qianghua Wang 2026-09-01  224  		return 0;
12d9c9f8679c56e Qianghua Wang 2026-09-01  225  	}
12d9c9f8679c56e Qianghua Wang 2026-09-01  226  	return ret;
12d9c9f8679c56e Qianghua Wang 2026-09-01  227  }
12d9c9f8679c56e Qianghua Wang 2026-09-01  228  

:::::: The code at line 200 was first introduced by commit
:::::: 12d9c9f8679c56e8c131dc2d8985c350ece7c4c3 ASoC: codecs: add SN624x SDCA SoundWire driver

:::::: TO: Qianghua Wang <qianghua.wang@senarytech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
