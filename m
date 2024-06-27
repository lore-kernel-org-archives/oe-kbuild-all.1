Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADA54500C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719489955; cv=none; b=ACzILGIe78UZT0dBd+2H9G+WQlhefpwH9ssULLm7rY5BnlmrrCmKf0rvTl6RYwaiScOl5Tk4sW4ku70E9MWk/JGOSvvUrCxaKQXeePupID6upN0MRKKM0EgZs8eXuiy7u+8NSt+32TWAJJpO9dC3nfD7TpC/b8LnHOkv9/V8KVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719489955; c=relaxed/simple;
	bh=bo8StoNTV4fHTKEV+mWNUR5DPqXHwGzvTEujSt0UNNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ahd16l2PgVK5u0ySoVAM+HKaQFvWk6TwtNHk+0h2xbT0Msl56kZOn+u+dDb5QOzwHKPQ6bkTesABie4I501viFtvsw4qxlsF/siB4ev6MgddTcxDRCCfEce/hUmlJPUl6FHdvXhiXgUN8STSpbMy2YkiNwHoO6WfRqQt9tFvFqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSx1Qpjz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSx1Qpjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719489954; x=1751025954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bo8StoNTV4fHTKEV+mWNUR5DPqXHwGzvTEujSt0UNNo=;
  b=OSx1QpjzX5bAS4t25hYtDXgunRj5Yx/4wA+bTrDYfmaWPPgxMVhXfCIM
   /Gt4Dh5rJE0Nt8KiynHAH4SY3ihhCfsRso0B8Z6+o1jkfhF0XVImyb+Tb
   EdE8CkOkwMxHeOTMA0LewSmpOzUi6+I8pynMNgkrO8tvpgGRkN7ouBD+H
   QmIlHqRNvv/xVcGVQkVfPnkfh0gMfX0XXiSsgVaOF1Ur4Adgs5ObrKXLy
   PSwwN7uCwdfaZk7AAfMF+Q5crlH2nL3dNxR1Gxwd+SEs2v70Zu2bbjmx4
   RXLSxswQStOtz8Nw2sndRnMIuLR3Dp0pGGSCW3++oaxVcB5faMVDncDY2
   A==;
X-CSE-ConnectionGUID: VFkmWxDEQA+YHvlKnH8BIQ==
X-CSE-MsgGUID: k4dauUbASx6EBbf1tY6G9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16444991"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="16444991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 05:05:53 -0700
X-CSE-ConnectionGUID: zGuu4i7DQ8OgYaNGsgmtUg==
X-CSE-MsgGUID: ZeiHTXFrSk+d4GHheNIOcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="44765939"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2024 05:05:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMnsr-000GB0-1P;
	Thu, 27 Jun 2024 12:05:49 +0000
Date: Thu, 27 Jun 2024 20:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/qcom-audio-wsa-second-speaker 9/10]
 sound/soc/codecs/lpass-wsa-macro.c:2488:undefined reference to
 `lpass_macro_get_codec_version'
Message-ID: <202406272231.th1LtuLk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/qcom-audio-wsa-second-speaker
head:   c35e67b6ff23e63ae09b9a646451564ba5f813ef
commit: b27895f445fc9f200663b4134586b96575b70ec0 [9/10] ASoC: codecs: lpass-wsa-macro: Prepare to accommodate new codec versions
config: x86_64-randconfig-072-20240627 (https://download.01.org/0day-ci/archive/20240627/202406272231.th1LtuLk-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406272231.th1LtuLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406272231.th1LtuLk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/codecs/lpass-wsa-macro.o: in function `wsa_macro_probe':
>> sound/soc/codecs/lpass-wsa-macro.c:2488:(.text+0x244f): undefined reference to `lpass_macro_get_codec_version'


vim +2488 sound/soc/codecs/lpass-wsa-macro.c

  2445	
  2446	static int wsa_macro_probe(struct platform_device *pdev)
  2447	{
  2448		struct device *dev = &pdev->dev;
  2449		struct reg_default *reg_defaults;
  2450		struct regmap_config *reg_config;
  2451		struct wsa_macro *wsa;
  2452		kernel_ulong_t flags;
  2453		void __iomem *base;
  2454		int ret, def_count;
  2455	
  2456		flags = (kernel_ulong_t)device_get_match_data(dev);
  2457	
  2458		wsa = devm_kzalloc(dev, sizeof(*wsa), GFP_KERNEL);
  2459		if (!wsa)
  2460			return -ENOMEM;
  2461	
  2462		wsa->macro = devm_clk_get_optional(dev, "macro");
  2463		if (IS_ERR(wsa->macro))
  2464			return dev_err_probe(dev, PTR_ERR(wsa->macro), "unable to get macro clock\n");
  2465	
  2466		wsa->dcodec = devm_clk_get_optional(dev, "dcodec");
  2467		if (IS_ERR(wsa->dcodec))
  2468			return dev_err_probe(dev, PTR_ERR(wsa->dcodec), "unable to get dcodec clock\n");
  2469	
  2470		wsa->mclk = devm_clk_get(dev, "mclk");
  2471		if (IS_ERR(wsa->mclk))
  2472			return dev_err_probe(dev, PTR_ERR(wsa->mclk), "unable to get mclk clock\n");
  2473	
  2474		if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
  2475			wsa->npl = devm_clk_get(dev, "npl");
  2476			if (IS_ERR(wsa->npl))
  2477				return dev_err_probe(dev, PTR_ERR(wsa->npl), "unable to get npl clock\n");
  2478		}
  2479	
  2480		wsa->fsgen = devm_clk_get(dev, "fsgen");
  2481		if (IS_ERR(wsa->fsgen))
  2482			return dev_err_probe(dev, PTR_ERR(wsa->fsgen), "unable to get fsgen clock\n");
  2483	
  2484		base = devm_platform_ioremap_resource(pdev, 0);
  2485		if (IS_ERR(base))
  2486			return PTR_ERR(base);
  2487	
> 2488		wsa->codec_version = lpass_macro_get_codec_version();
  2489		switch (wsa->codec_version) {
  2490		default:
  2491			wsa->reg_layout = &wsa_codec_v2_1;
  2492			def_count = ARRAY_SIZE(wsa_defaults) + ARRAY_SIZE(wsa_defaults_v2_1);
  2493			reg_defaults = devm_kmalloc_array(dev, def_count,
  2494							  sizeof(*reg_defaults),
  2495							  GFP_KERNEL);
  2496			if (!reg_defaults)
  2497				return -ENOMEM;
  2498			memcpy(&reg_defaults[0], wsa_defaults, sizeof(wsa_defaults));
  2499			memcpy(&reg_defaults[ARRAY_SIZE(wsa_defaults)],
  2500			       wsa_defaults_v2_1, sizeof(wsa_defaults_v2_1));
  2501			break;
  2502		}
  2503	
  2504		reg_config = devm_kmemdup(dev, &wsa_regmap_config,
  2505					  sizeof(*reg_config), GFP_KERNEL);
  2506		if (!reg_config)
  2507			return -ENOMEM;
  2508	
  2509		reg_config->reg_defaults = reg_defaults;
  2510		reg_config->num_reg_defaults = def_count;
  2511	
  2512		wsa->regmap = devm_regmap_init_mmio(dev, base, reg_config);
  2513		if (IS_ERR(wsa->regmap))
  2514			return PTR_ERR(wsa->regmap);
  2515	
  2516		devm_kfree(dev, reg_config);
  2517		devm_kfree(dev, reg_defaults);
  2518		dev_set_drvdata(dev, wsa);
  2519	
  2520		wsa->dev = dev;
  2521	
  2522		/* set MCLK and NPL rates */
  2523		clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
  2524		clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
  2525	
  2526		ret = clk_prepare_enable(wsa->macro);
  2527		if (ret)
  2528			goto err;
  2529	
  2530		ret = clk_prepare_enable(wsa->dcodec);
  2531		if (ret)
  2532			goto err_dcodec;
  2533	
  2534		ret = clk_prepare_enable(wsa->mclk);
  2535		if (ret)
  2536			goto err_mclk;
  2537	
  2538		ret = clk_prepare_enable(wsa->npl);
  2539		if (ret)
  2540			goto err_npl;
  2541	
  2542		ret = clk_prepare_enable(wsa->fsgen);
  2543		if (ret)
  2544			goto err_fsgen;
  2545	
  2546		/* reset swr ip */
  2547		regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
  2548				   CDC_WSA_SWR_RST_EN_MASK, CDC_WSA_SWR_RST_ENABLE);
  2549	
  2550		regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
  2551				   CDC_WSA_SWR_CLK_EN_MASK, CDC_WSA_SWR_CLK_ENABLE);
  2552	
  2553		/* Bring out of reset */
  2554		regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
  2555				   CDC_WSA_SWR_RST_EN_MASK, CDC_WSA_SWR_RST_DISABLE);
  2556	
  2557		ret = devm_snd_soc_register_component(dev, &wsa_macro_component_drv,
  2558						      wsa_macro_dai,
  2559						      ARRAY_SIZE(wsa_macro_dai));
  2560		if (ret)
  2561			goto err_clkout;
  2562	
  2563		pm_runtime_set_autosuspend_delay(dev, 3000);
  2564		pm_runtime_use_autosuspend(dev);
  2565		pm_runtime_mark_last_busy(dev);
  2566		pm_runtime_set_active(dev);
  2567		pm_runtime_enable(dev);
  2568	
  2569		ret = wsa_macro_register_mclk_output(wsa);
  2570		if (ret)
  2571			goto err_clkout;
  2572	
  2573		return 0;
  2574	
  2575	err_clkout:
  2576		clk_disable_unprepare(wsa->fsgen);
  2577	err_fsgen:
  2578		clk_disable_unprepare(wsa->npl);
  2579	err_npl:
  2580		clk_disable_unprepare(wsa->mclk);
  2581	err_mclk:
  2582		clk_disable_unprepare(wsa->dcodec);
  2583	err_dcodec:
  2584		clk_disable_unprepare(wsa->macro);
  2585	err:
  2586		return ret;
  2587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
