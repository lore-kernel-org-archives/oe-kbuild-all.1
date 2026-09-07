Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B11D2BDC1C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788822289; cv=none; b=sK4iA4+cjXieseCqQRi0ck/OYfI/ZEZugqH9jt/+OSlGBPRJ/ZANgWiIhRGoZLQhaUoW6+giaOT4eDMskjLVf42TAm8ASD6r+HoOGD2Olbdfz30F+gUcD5a/A33K0RgRiJd4ZTqPNER+bJJWx9k8Sn1fzaDfqXvpWTXwJpBVJW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788822289; c=relaxed/simple;
	bh=mCrN3wd+DMM8wO4wUsSS1/Q7TovWjenOP0MtnZR96uo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KxRuNnjk86NF+Q9kHlJNKYWge3VSRH+VP+BDM7PRBr++yTh25Fg95HV8in2NWSDufJb9UqJwLs+csq1L6QdeypfrUQUKAr6bclVl6n/+/H6SHtligdyIGrwkwBvjYS3Di+hJRdQjPIghpkrlP8YHaaDgFlEOnRLM4/WquF7MSqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7LMSPUY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7LMSPUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788822287; x=1820358287;
  h=date:from:to:cc:subject:message-id;
  bh=mCrN3wd+DMM8wO4wUsSS1/Q7TovWjenOP0MtnZR96uo=;
  b=B7LMSPUYEgeq0VKq/i1aFnsLr35i/HEnZagpi9/PRyQ0k6TxZ/EeytJz
   pzfTqoQu7SGaFJxTq+PcBCNX3dbmfhY1F4lA56r3Cw5lb1fBHd8IjGJMf
   dpauc+1qYtNa3HlBECpsmS4P7mQTl2f4upGq0Fs1Fd81EmOPOABYcvwHZ
   UCOlwXojvXSoVUPmbJCU0f5OYmATu084FVFaJ36A7h3cGAaPHzXnJCnzf
   9I+g9GLYbVeAnSXkyG1uiaOlvemolqBvhPyasEBZGAHszbaxNqnC0OkTa
   kRNhceqaIUDohwRjKQGTC+ZwSXjhqTCmi0kApFc3IVFSRzLTpPnVcFAfs
   Q==;
X-CSE-ConnectionGUID: 24xW+bpHSweZy85xcnrzuA==
X-CSE-MsgGUID: v4lWSv4NS5aOmVc1tWt0DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99878633"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="99878633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 16:04:46 -0700
X-CSE-ConnectionGUID: UZSkJnghR0yaCQSz4EYhrw==
X-CSE-MsgGUID: B+rdq4bzQU+gkmS6y3Ga9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274967236"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Sep 2026 16:04:45 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3iOH-000000001OB-3sZC;
	Mon, 07 Sep 2026 23:04:41 +0000
Date: Tue, 08 Sep 2026 07:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 261/343]
 sound/soc/codecs/sn624x-sdca-sdw.c:199:17: error: implicit declaration of
 function 'snd_soc_component_get_drvdata'; did you mean
 'snd_soc_component_set_jack'?
Message-ID: <202609080728.QmS2Lvh1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: 2ec5bcc4a0d57a7db5c121ab6e10d602373d1f0e [261/343] ASoC: soc-component: remove snd_soc_component_{set/get}_drvdata()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260908/202609080728.QmS2Lvh1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080728.QmS2Lvh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080728.QmS2Lvh1-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_dapm_pde_event':
>> sound/soc/codecs/sn624x-sdca-sdw.c:199:17: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     199 |                 snd_soc_component_get_drvdata(component);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 snd_soc_component_set_jack
>> sound/soc/codecs/sn624x-sdca-sdw.c:199:17: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_fu_mute_event':
   sound/soc/codecs/sn624x-sdca-sdw.c:270:17: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     270 |                 snd_soc_component_get_drvdata(component);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_fu_mic2_event':
   sound/soc/codecs/sn624x-sdca-sdw.c:346:17: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |                 snd_soc_component_get_drvdata(component);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_set_jack_detect':
   sound/soc/codecs/sn624x-sdca-sdw.c:981:43: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     981 |         struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_probe':
   sound/soc/codecs/sn624x-sdca-sdw.c:1424:43: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1424 |         struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sn624x-sdca-sdw.c: In function 'sn624x_sdca_pcm_hw_params':
   sound/soc/codecs/sn624x-sdca-sdw.c:1443:50: error: invalid use of undefined type 'struct snd_soc_dai'
    1443 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   sound/soc/codecs/sn624x-sdca-sdw.c:1444:43: error: initialization of 'struct sn624x_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1444 |         struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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


vim +199 sound/soc/codecs/sn624x-sdca-sdw.c

12d9c9f8679c56 Qianghua Wang 2026-09-01  174  
12d9c9f8679c56 Qianghua Wang 2026-09-01  175  #define SN624X_REG_DMIC_FUN_STATUS_CTL \
12d9c9f8679c56 Qianghua Wang 2026-09-01  176  	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_ENTITY0, \
12d9c9f8679c56 Qianghua Wang 2026-09-01  177  		     SN624X_SDCA_CTL_FUNCTION_STATUS, 0)
12d9c9f8679c56 Qianghua Wang 2026-09-01  178  
12d9c9f8679c56 Qianghua Wang 2026-09-01  179  /*
12d9c9f8679c56 Qianghua Wang 2026-09-01  180   * Write REQUESTED_PS then poll ACTUAL_PS with the shared SDCA helper
12d9c9f8679c56 Qianghua Wang 2026-09-01  181   * (sdca_asoc_pde_poll_actual_ps). Caller must not hand-roll ACTUAL_PS waits.
12d9c9f8679c56 Qianghua Wang 2026-09-01  182   */
12d9c9f8679c56 Qianghua Wang 2026-09-01  183  static int sn624x_pde_request_ps(struct device *dev, struct regmap *regmap,
12d9c9f8679c56 Qianghua Wang 2026-09-01  184  				 unsigned int fun, unsigned int ent,
12d9c9f8679c56 Qianghua Wang 2026-09-01  185  				 unsigned int ps);
12d9c9f8679c56 Qianghua Wang 2026-09-01  186  
12d9c9f8679c56 Qianghua Wang 2026-09-01  187  /*
12d9c9f8679c56 Qianghua Wang 2026-09-01  188   * DAPM PDE supplies (rt711/rt712 style): write REQUESTED_PS then poll ACTUAL_PS.
12d9c9f8679c56 Qianghua Wang 2026-09-01  189   * Mute-before-D3 is handled by FU widget PRE_PMD, which runs before SUPPLY PRE_PMD
12d9c9f8679c56 Qianghua Wang 2026-09-01  190   * when the FU lists the PDE as a dependency.
12d9c9f8679c56 Qianghua Wang 2026-09-01  191   */
12d9c9f8679c56 Qianghua Wang 2026-09-01  192  static int sn624x_dapm_pde_event(struct snd_soc_dapm_widget *w,
12d9c9f8679c56 Qianghua Wang 2026-09-01  193  				 struct snd_kcontrol *kcontrol, int event,
12d9c9f8679c56 Qianghua Wang 2026-09-01  194  				 unsigned int fun, unsigned int ent)
12d9c9f8679c56 Qianghua Wang 2026-09-01  195  {
12d9c9f8679c56 Qianghua Wang 2026-09-01  196  	struct snd_soc_component *component =
12d9c9f8679c56 Qianghua Wang 2026-09-01  197  		snd_soc_dapm_to_component(w->dapm);
12d9c9f8679c56 Qianghua Wang 2026-09-01  198  	struct sn624x_sdca_priv *sn624x =
12d9c9f8679c56 Qianghua Wang 2026-09-01 @199  		snd_soc_component_get_drvdata(component);
12d9c9f8679c56 Qianghua Wang 2026-09-01  200  	struct device *dev = component->dev;
12d9c9f8679c56 Qianghua Wang 2026-09-01  201  	int ret;
12d9c9f8679c56 Qianghua Wang 2026-09-01  202  
12d9c9f8679c56 Qianghua Wang 2026-09-01  203  	if (!sn624x || !sn624x->regmap)
12d9c9f8679c56 Qianghua Wang 2026-09-01  204  		return -ENODEV;
12d9c9f8679c56 Qianghua Wang 2026-09-01  205  
12d9c9f8679c56 Qianghua Wang 2026-09-01  206  	switch (event) {
12d9c9f8679c56 Qianghua Wang 2026-09-01  207  	case SND_SOC_DAPM_POST_PMU:
12d9c9f8679c56 Qianghua Wang 2026-09-01  208  		ret = sn624x_pde_request_ps(dev, sn624x->regmap, fun, ent,
12d9c9f8679c56 Qianghua Wang 2026-09-01  209  					    SN624X_PWR_D0);
12d9c9f8679c56 Qianghua Wang 2026-09-01  210  		if (ret < 0)
12d9c9f8679c56 Qianghua Wang 2026-09-01  211  			dev_warn(dev,
12d9c9f8679c56 Qianghua Wang 2026-09-01  212  				 "sn624x: DAPM %s PDE fun=%u ent=0x%x -> PS0 failed (%d)\n",
12d9c9f8679c56 Qianghua Wang 2026-09-01  213  				 w->name, fun, ent, ret);
12d9c9f8679c56 Qianghua Wang 2026-09-01  214  		break;
12d9c9f8679c56 Qianghua Wang 2026-09-01  215  	case SND_SOC_DAPM_PRE_PMD:
12d9c9f8679c56 Qianghua Wang 2026-09-01  216  		ret = sn624x_pde_request_ps(dev, sn624x->regmap, fun, ent,
12d9c9f8679c56 Qianghua Wang 2026-09-01  217  					    SN624X_PWR_D3);
12d9c9f8679c56 Qianghua Wang 2026-09-01  218  		if (ret < 0)
12d9c9f8679c56 Qianghua Wang 2026-09-01  219  			dev_warn(dev,
12d9c9f8679c56 Qianghua Wang 2026-09-01  220  				 "sn624x: DAPM %s PDE fun=%u ent=0x%x -> PS3 failed (%d)\n",
12d9c9f8679c56 Qianghua Wang 2026-09-01  221  				 w->name, fun, ent, ret);
12d9c9f8679c56 Qianghua Wang 2026-09-01  222  		break;
12d9c9f8679c56 Qianghua Wang 2026-09-01  223  	default:
12d9c9f8679c56 Qianghua Wang 2026-09-01  224  		return 0;
12d9c9f8679c56 Qianghua Wang 2026-09-01  225  	}
12d9c9f8679c56 Qianghua Wang 2026-09-01  226  	return ret;
12d9c9f8679c56 Qianghua Wang 2026-09-01  227  }
12d9c9f8679c56 Qianghua Wang 2026-09-01  228  

:::::: The code at line 199 was first introduced by commit
:::::: 12d9c9f8679c56e8c131dc2d8985c350ece7c4c3 ASoC: codecs: add SN624x SDCA SoundWire driver

:::::: TO: Qianghua Wang <qianghua.wang@senarytech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
