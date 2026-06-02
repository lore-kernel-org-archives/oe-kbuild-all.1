Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817F381B0F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780393750; cv=none; b=uouzsknq0nCIpx2pfjOFll0fT4woNIp54pARn0ZYYaz17HOqB3VQgc+c0owIBHPQdBFnUnp6l8TaZYkdjGnah24G/EcX98Kw//b5CxbChWYxp04iC67ydTkRJTUzuc+EaFxwD+1f/ya85if8SWDGm8Qew0Az4tgRh5wVehvQCtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780393750; c=relaxed/simple;
	bh=rWfjMV5HOoInH3jE944+MRPEPESC4CaptqJzIK6zdgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WGpMVbH/qI1SC6nQUNevEjo1FMSnMF+Lc0Rm40FbnsMJEXFY1J+fIoFqrFdQNIif5zcHzMjSeee81FZyHvOKlivTLng7SuK3+1nA01VKg/e7wSupjfgQ3DhOo/jb7sdIRItAMA4TDRmn6ysoXbk8YUy/ptJo4vFGfBW9L16eRw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFhEVod1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFhEVod1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780393748; x=1811929748;
  h=date:from:to:cc:subject:message-id;
  bh=rWfjMV5HOoInH3jE944+MRPEPESC4CaptqJzIK6zdgQ=;
  b=iFhEVod1AjncL4UcCsvSr71fZtejyODNZJt8MVYFC7QcBxB9Oy4sncPd
   8BNwBP5PuF7x8MxeEbypol/1z3Oc/ORkWH20S4y1P3dN8Idvj6jfsUxll
   Pc+wPGGNi2SwI6urBqAIaEgXBGMezpEt1AcZQBxSRtGXNAiVz1+RghQLw
   4qSp6seO6NmI5ZgLQzqdYLHt/d/4T57IEoxzkLYZMsr1w1jWbFaro7rwB
   ZpWu15D5qg9R0AbyJkV0Q8EFh6NeLs4qPy+2iw7VQEiclFF1P/dLV7cW8
   RwXSUIeNTm6fT0nSkP+I3TtbPBqHbq/xsjv29cLfGBaIdu/+6zR/zPrPo
   g==;
X-CSE-ConnectionGUID: aZiEgcnKQRqQsFAZQM2cPA==
X-CSE-MsgGUID: YMsmY7+sSsGnn9EdzxTg4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106621205"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="106621205"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:49:07 -0700
X-CSE-ConnectionGUID: EMPwhP6GTQ+lo/BPfdhL1A==
X-CSE-MsgGUID: u0NGn2bQQbe0zMuBvKSzbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="243961441"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jun 2026 02:49:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wULk7-00000000BpJ-3mIw;
	Tue, 02 Jun 2026 09:49:03 +0000
Date: Tue, 02 Jun 2026 17:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:593:29: warning: initialization of
 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast
Message-ID: <202606021747.m3ukSsR4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 8be84f679bd497ac2dabc87df9f9a4737f841c0d [290/290] ASoC: soc-dai: remove snd_soc_dai_{set/get}_drvdata()
config: arm64-randconfig-002-20260601 (https://download.01.org/0day-ci/archive/20260602/202606021747.m3ukSsR4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021747.m3ukSsR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021747.m3ukSsR4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_hdmi_startup':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:593:29: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Werror=implicit-function-declaration]
     struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
                                ^~~~~~~~~~~~~~~~~~~~~~~
                                snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:593:29: warning: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_hdmi_shutdown':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:644:29: warning: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
                                ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_hdmi_hw_params':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:660:29: warning: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
                                ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_hdmi_trigger':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:748:29: warning: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
                                ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_hdmi_hw_free':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:773:29: warning: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
                                ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +593 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c

0e2f1d39c2bf68 Daniel Golle 2026-04-24  589  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  590  static int mt2701_afe_hdmi_startup(struct snd_pcm_substream *substream,
0e2f1d39c2bf68 Daniel Golle 2026-04-24  591  				   struct snd_soc_dai *dai)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  592  {
0e2f1d39c2bf68 Daniel Golle 2026-04-24 @593  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  594  	struct mt2701_afe_private *afe_priv = afe->platform_priv;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  595  	int ret;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  596  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  597  	if (!afe_priv->hadds2pll_ck || !afe_priv->audio_hdmi_ck) {
0e2f1d39c2bf68 Daniel Golle 2026-04-24  598  		dev_err(afe->dev, "HDMI audio clocks not available\n");
0e2f1d39c2bf68 Daniel Golle 2026-04-24  599  		return -ENODEV;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  600  	}
0e2f1d39c2bf68 Daniel Golle 2026-04-24  601  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  602  	ret = clk_prepare_enable(afe_priv->hadds2pll_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  603  	if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  604  		return ret;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  605  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  606  	ret = clk_prepare_enable(afe_priv->audio_hdmi_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  607  	if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  608  		goto err_hdmi;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  609  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  610  	if (afe_priv->audio_spdf_ck) {
0e2f1d39c2bf68 Daniel Golle 2026-04-24  611  		ret = clk_prepare_enable(afe_priv->audio_spdf_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  612  		if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  613  			goto err_spdf;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  614  	}
0e2f1d39c2bf68 Daniel Golle 2026-04-24  615  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  616  	if (afe_priv->audio_apll_ck) {
0e2f1d39c2bf68 Daniel Golle 2026-04-24  617  		ret = clk_prepare_enable(afe_priv->audio_apll_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  618  		if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  619  			goto err_apll;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  620  	}
0e2f1d39c2bf68 Daniel Golle 2026-04-24  621  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  622  	ret = mt2701_afe_enable_mclk(afe, MT2701_HDMI_I2S_PATH);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  623  	if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  624  		goto err_mclk;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  625  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  626  	return 0;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  627  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  628  err_mclk:
0e2f1d39c2bf68 Daniel Golle 2026-04-24  629  	if (afe_priv->audio_apll_ck)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  630  		clk_disable_unprepare(afe_priv->audio_apll_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  631  err_apll:
0e2f1d39c2bf68 Daniel Golle 2026-04-24  632  	if (afe_priv->audio_spdf_ck)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  633  		clk_disable_unprepare(afe_priv->audio_spdf_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  634  err_spdf:
0e2f1d39c2bf68 Daniel Golle 2026-04-24  635  	clk_disable_unprepare(afe_priv->audio_hdmi_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  636  err_hdmi:
0e2f1d39c2bf68 Daniel Golle 2026-04-24  637  	clk_disable_unprepare(afe_priv->hadds2pll_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  638  	return ret;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  639  }
0e2f1d39c2bf68 Daniel Golle 2026-04-24  640  

:::::: The code at line 593 was first introduced by commit
:::::: 0e2f1d39c2bf68d181b72ea51ef1e778c04140e4 ASoC: mediatek: mt2701: add HDMI audio memif, FE and BE DAIs

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
