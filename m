Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AB4DDB57
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160006; cv=none; b=a8w5WdggtUZNEIABCe54zGhuD63/BWh7pO2qeR0Q3TjCN/GGGtVK0rAllpncFng9s+pcD8exH0JeWe9KKAMUnr6kTvKADpG89AO8ECzx9bi2eLyj4r9l1nJUiJml3wXCXxsxkWyWaZQj030vw62oBtLTOL77a8hdtsVKUWQfmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160006; c=relaxed/simple;
	bh=OytrEK9N88PlpuH5AxwXUca8pCI9omWxJXBmIwELuec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oi42+VVAWKraNXYDF6jVa0l+VzK0vg8MXpo08omsnlzgMhBMEMJA5T1MyVGDG9uygXbgBuNL1utvqLYFbRh8uDzTor7v14q2mYhOqZB2y0e+r8a/Ogt+P1xVIQxXujxKsAyRzFTDfe90gLmBVIqZDoLT+h1y+omdXJwf2neCUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pfp3kB2n; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pfp3kB2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792159990; x=1823695990;
  h=date:from:to:cc:subject:message-id;
  bh=OytrEK9N88PlpuH5AxwXUca8pCI9omWxJXBmIwELuec=;
  b=Pfp3kB2n6gAbiViWfVn1BxI02euy20wcPzwEUdFmGjK84dJlsVpQiLuc
   dusx8Aw1qd4Jz8GOsBHzZVCzfRhimXMZL+/pUl5hEmfMqcv8U7m8F33U4
   BKyVw8l9awY76yhm2YKN79isI/kMOQ3zdEeyO5b7Y/P2VT+EIrLv4ri4G
   akJAAE9Pjzb8m09EoqM3ygHD2CMlUcynNoW1gbrHDcer0joPBUHloAATz
   hD5j3uLWRbLips06rA+1u3sYQeq0em22/U64uLdmQ0jORow2M5NOHQKv7
   pntqP3J3WbTQoHtGmkzRSi8HssDV79XZvlQ74bDEF8bxgEIEVoOcPDpJh
   g==;
X-CSE-ConnectionGUID: C5t44NQyQq2FgzkByGD5yg==
X-CSE-MsgGUID: ohKM16sKQB+bll4Pz9ZNUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="825379"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="825379"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:13:10 -0700
X-CSE-ConnectionGUID: mJJ3lDklRt2Hq9BrqeZ60A==
X-CSE-MsgGUID: 67Anj8CjS3Cy4BKDaTkVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3706334"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 16 Oct 2026 07:13:08 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHigD-00000000CFv-3aOp;
	Fri, 16 Oct 2026 14:13:05 +0000
Date: Fri, 16 Oct 2026 16:12:16 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-16-2 231/331]
 sound/soc/pxa/mmp-sspa.c:557:8: error: implicit declaration of function
 'devm_snd_soc_component_register'; did you mean 'snd_soc_component_register'?
Message-ID: <202610161648.UPtfPOgc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-16-2
head:   74808ab9efae9b3cfb9234516fbf8d3bc7f6b8b7
commit: 47cdfff731aaf82d9b36ad4dd43651e744e88d85 [231/331] dai
config: arm-randconfig-2001-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161648.UPtfPOgc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161648.UPtfPOgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161648.UPtfPOgc-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/pxa/mmp-sspa.c: In function 'asoc_mmp_sspa_probe':
>> sound/soc/pxa/mmp-sspa.c:557:8: error: implicit declaration of function 'devm_snd_soc_component_register'; did you mean 'snd_soc_component_register'? [-Werror=implicit-function-declaration]
     ret = devm_snd_soc_component_register(&pdev->dev, &mmp_sspa_component,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           snd_soc_component_register
   cc1: some warnings being treated as errors


vim +557 sound/soc/pxa/mmp-sspa.c

   485	
   486	static int asoc_mmp_sspa_probe(struct platform_device *pdev)
   487	{
   488		struct sspa_priv *sspa;
   489		int ret;
   490	
   491		sspa = devm_kzalloc(&pdev->dev,
   492					sizeof(struct sspa_priv), GFP_KERNEL);
   493		if (!sspa)
   494			return -ENOMEM;
   495	
   496		if (pdev->dev.of_node) {
   497			sspa->rx_base = devm_platform_ioremap_resource(pdev, 0);
   498			if (IS_ERR(sspa->rx_base))
   499				return PTR_ERR(sspa->rx_base);
   500	
   501			sspa->tx_base = devm_platform_ioremap_resource(pdev, 1);
   502			if (IS_ERR(sspa->tx_base))
   503				return PTR_ERR(sspa->tx_base);
   504	
   505			sspa->clk = devm_clk_get(&pdev->dev, "bitclk");
   506			if (IS_ERR(sspa->clk))
   507				return PTR_ERR(sspa->clk);
   508	
   509			sspa->audio_clk = devm_clk_get(&pdev->dev, "audio");
   510			if (IS_ERR(sspa->audio_clk))
   511				return PTR_ERR(sspa->audio_clk);
   512		} else {
   513			struct resource *res;
   514	
   515			res = platform_get_resource(pdev, IORESOURCE_IO, 0);
   516			if (res == NULL)
   517				return -ENODEV;
   518	
   519			sspa->rx_base = devm_ioremap(&pdev->dev, res->start, 0x30);
   520			if (!sspa->rx_base)
   521				return -ENOMEM;
   522	
   523			sspa->tx_base = devm_ioremap(&pdev->dev,
   524						     res->start + 0x80, 0x30);
   525			if (!sspa->tx_base)
   526				return -ENOMEM;
   527	
   528			sspa->clk = devm_clk_get(&pdev->dev, NULL);
   529			if (IS_ERR(sspa->clk))
   530				return PTR_ERR(sspa->clk);
   531	
   532			sspa->audio_clk = clk_get(NULL, "mmp-audio");
   533			if (IS_ERR(sspa->audio_clk))
   534				return PTR_ERR(sspa->audio_clk);
   535	
   536			sspa->sysclk = clk_get(NULL, "mmp-sysclk");
   537			if (IS_ERR(sspa->sysclk)) {
   538				clk_put(sspa->audio_clk);
   539				return PTR_ERR(sspa->sysclk);
   540			}
   541		}
   542		platform_set_drvdata(pdev, sspa);
   543	
   544		sspa->playback_dma_data.maxburst = 4;
   545		sspa->capture_dma_data.maxburst = 4;
   546		/* You know, these addresses are actually ignored. */
   547		sspa->capture_dma_data.addr = SSPA_D;
   548		sspa->playback_dma_data.addr = 0x80 + SSPA_D;
   549	
   550		if (pdev->dev.of_node) {
   551			ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
   552							      &mmp_pcm_config, 0);
   553			if (ret)
   554				return ret;
   555		}
   556	
 > 557		ret = devm_snd_soc_component_register(&pdev->dev, &mmp_sspa_component,
   558						      &mmp_sspa_dai, 1);
   559		if (ret)
   560			return ret;
   561	
   562		pm_runtime_enable(&pdev->dev);
   563		clk_prepare_enable(sspa->audio_clk);
   564	
   565		return 0;
   566	}
   567	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
