Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B4A70836
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411151; cv=none; b=CYAwYlVLaMjXbGPTygFFQtxsvGuw0lZ4zZfQkIlTINP4V0Syck4LVIt7RNqbafS+ZfYBrRqkSHWnRkX01u+xIIWpoqcuHFRDllX73adY5qPvi5eb6CLRR/Pgv+LGACtPOo9iPDobzBodzB/EbW4jns0TtEitzhFTEuXD0NHujz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411151; c=relaxed/simple;
	bh=wTx+3Asbn4+BTD66M7g14RBN0YbOHx9fl0y3zl5TEm8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oeYt0kHP5c5COxwerBChMinRZSvAGLD57wKoU8FjCHzF5nv1yRftrIITNFyiulisSQzIADGi5CU3Y0fVK8x2cQAHkBikYWrHnks6Y+6XmgGuNoKwLDYvLpdH7y1KggSmDi5XwjJppH5XaHvJ3XgQPXjEgniwi46BJB39LFAwvgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRCABgUn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRCABgUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780411150; x=1811947150;
  h=date:from:to:cc:subject:message-id;
  bh=wTx+3Asbn4+BTD66M7g14RBN0YbOHx9fl0y3zl5TEm8=;
  b=bRCABgUnp/vL1tV5AOoxxAV+9H/OaqvQ51Lrd9vnIFPOQdqgP6boRsc0
   d4rkQTh5sOa0Lfv9Ke5TRE0rns8r7saYWh4RF85SA5PnnDVBgoYQLOo0I
   AJvdm5/u5Nz7+wQjM24LAM9ZxXmHqGg5A8aWLPUNrrSUBOMeHzm5xIDYE
   ENDQ+rAN8UjEPF84kxiSPJbT/O805gXdz0YvdSga+1QTqT9byP2CSlO2a
   /3AP3L9bf1WZfAtHyPuTJpex9+AaoSSDwdN/ZcehMq9yYRAsYwJysZc+U
   o1trgidrE5oWSawMHZzN+GLh9a5n5Lemyo8FLmGtCGeaVuB5wuF4XsWN/
   A==;
X-CSE-ConnectionGUID: +9D9p7PFQJym8hTeXhf4kQ==
X-CSE-MsgGUID: IfwHSWAGQaCMUXuLKwnDcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92308671"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="92308671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 07:39:09 -0700
X-CSE-ConnectionGUID: x0arvhAcQc6CHJ+S4hZ/Og==
X-CSE-MsgGUID: cdhCbPDxSRWevFnjnLA9fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237573133"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jun 2026 07:39:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUQGn-00000000C8G-3BDH;
	Tue, 02 Jun 2026 14:39:05 +0000
Date: Tue, 02 Jun 2026 22:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/soc-pcm.c:446:33: error: dereferencing pointer to incomplete type
 'struct snd_soc_dai'
Message-ID: <202606022250.9pj4Up6O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 61940afff67a6c8e813921b69dbef7e26112dccf [290/290] ASoC: soc-dai: move struct snd_soc_dai to soc-dai.c
config: arm64-randconfig-002-20260601 (https://download.01.org/0day-ci/archive/20260602/202606022250.9pj4Up6O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022250.9pj4Up6O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606022250.9pj4Up6O-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-pcm.c: In function 'soc_pcm_shared_bclk_rule_rate':
>> sound/soc/soc-pcm.c:446:33: error: dereferencing pointer to incomplete type 'struct snd_soc_dai'
     struct snd_soc_card *card = dai->component->card;
                                    ^~


vim +446 sound/soc/soc-pcm.c

01d7584cd2e5a9 Liam Girdwood 2012-04-25  435  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  436  /*
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  437   * Shared BCLK constraint: when multiple DAIs share the same physical BCLK,
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  438   * constrain hw_params so that the BCLK rate (rate * channels * sample_bits,
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  439   * or rate * slots * slot_width for TDM) remains consistent.
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  440   */
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  441  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  442  static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  443  					 struct snd_pcm_hw_rule *rule)
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  444  {
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  445  	struct snd_soc_dai *dai = rule->private;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22 @446  	struct snd_soc_card *card = dai->component->card;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  447  	struct snd_soc_pcm_runtime *rtd;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  448  	struct snd_soc_dai *other_dai;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  449  	unsigned long active_bclk_rate = 0;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  450  	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  451  	struct snd_interval constraint = { .empty = 1 };
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  452  	unsigned int target_rate;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  453  	int i;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  454  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  455  	/* Protect the rtd list traversal with the ASoC card mutex helper. */
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  456  	guard(snd_soc_card_mutex)(card);
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  457  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  458  	/* Scan all DAIs on the card for an active peer sharing the same BCLK */
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  459  	for_each_card_rtds(card, rtd) {
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  460  		for_each_rtd_cpu_dais(rtd, i, other_dai) {
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  461  			if (other_dai == dai)
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  462  				continue;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  463  			if (!other_dai->bclk)
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  464  				continue;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  465  			if (!snd_soc_dai_active(other_dai))
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  466  				continue;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  467  			/*
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  468  			 * Skip peers whose hw_params hasn't run yet.
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  469  			 * symmetric_rate is set by soc_pcm_set_dai_params()
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  470  			 * after snd_soc_dai_hw_params(), so non-zero means
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  471  			 * the DAI's clk_set_rate() has already executed.
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  472  			 */
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  473  			if (!other_dai->symmetric_rate)
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  474  				continue;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  475  			if (!clk_is_match(dai->bclk, other_dai->bclk))
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  476  				continue;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  477  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  478  			active_bclk_rate = clk_get_rate(other_dai->bclk);
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  479  			if (active_bclk_rate)
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  480  				goto found;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  481  		}
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  482  	}
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  483  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  484  	return 0;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  485  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  486  found:
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  487  	if (dai->bclk_ratio) {
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  488  		/*
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  489  		 * Driver has set an explicit BCLK ratio (e.g. for TDM where
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  490  		 * BCLK = rate * slots * slot_width). The only valid rate is
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  491  		 * active_bclk_rate / bclk_ratio.
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  492  		 */
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  493  		target_rate = active_bclk_rate / dai->bclk_ratio;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  494  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  495  		constraint.min = target_rate;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  496  		constraint.max = target_rate;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  497  	} else {
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  498  		struct snd_interval *channels = hw_param_interval(params,
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  499  						SNDRV_PCM_HW_PARAM_CHANNELS);
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  500  		struct snd_interval *sample_bits = hw_param_interval(params,
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  501  						SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  502  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  503  		/*
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  504  		 * Default: BCLK = rate * channels * sample_bits.
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  505  		 * Calculate the range of valid rates given the current
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  506  		 * channel and sample_bits intervals.
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  507  		 */
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  508  		if (!channels->min || !sample_bits->min)
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  509  			return 0;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  510  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  511  		constraint.max = active_bclk_rate /
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  512  				 ((unsigned long)channels->min * sample_bits->min);
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  513  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  514  		if (channels->max && sample_bits->max)
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  515  			constraint.min = active_bclk_rate /
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  516  					 ((unsigned long)channels->max * sample_bits->max);
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  517  		else
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  518  			constraint.min = constraint.max;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  519  	}
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  520  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  521  	constraint.integer = 1;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  522  	constraint.empty = 0;
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  523  
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  524  	return snd_interval_refine(rate, &constraint);
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  525  }
c8c2ffd722a6e4 Troy Mitchell 2026-05-22  526  

:::::: The code at line 446 was first introduced by commit
:::::: c8c2ffd722a6e497b9c6bb9961a7afb6ee5e2c28 ASoC: soc-pcm: constrain hw_params when DAIs share the same BCLK

:::::: TO: Troy Mitchell <troy.mitchell@linux.spacemit.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
