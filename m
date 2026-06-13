Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B0239E6C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 07:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781334439; cv=none; b=TLnGJoZyMDyirUqZEWtI2PXfHIxfcUUUhg5xDGmHoqKV9iYJBcjISzXWdZI0zLChbo2Bmw9jwvu665PfV1A0RbbGbczxGngqt+kvPYTwmVWjULEUohmAu/dUfYngeZ2T3tO1iAxxI+X3xTc1o6up0c/bxyyaGgSY+Iep6uRP+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781334439; c=relaxed/simple;
	bh=d9nHdzqlII05tBwcOJ8/lINqUBNHiei0qWbDdJfU15A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lhNIHAGu5XsFJ1UnqbMNG/ufiICIQpbsruBpCLhGjqqIh0u4pTXcXEI2/u2D7OQA6NHI/pAA8CWafP4qQ0z/mElMPGABCHl5Nv0PZZR9vY5xs86x9Szjd3Gsx0Ym2bXxYyd/CA7W+7YyNiYumaetsBYIA1xW14MMLezmVmUeJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEdeDGEZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEdeDGEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781334437; x=1812870437;
  h=date:from:to:cc:subject:message-id;
  bh=d9nHdzqlII05tBwcOJ8/lINqUBNHiei0qWbDdJfU15A=;
  b=OEdeDGEZ03yHiNAzVOfCpjucrDz4DLqOtI326M9Cjz0b/IagEQlcuVhD
   po3k1hZ95WXVcWBSolqLLkbKquOXagC+0fbLmlpDeazodRDllKMvcwkEp
   N7m6cO+6rLQLDhUFP2ncUr2PhBvishN1QJBmnQ7wXBH5oNSRvOsD4gUKB
   uhiJYm2mVsudCOXlnlWyz/BG/VTSA6MqierisHsl+GWk4K2sRMtOjn9hk
   eh5cCksJSwFT5s07jaFRYfs9hVprtgH6Rd63frOinbrJPmtre6eaEd8et
   jWkszY+NpLdqXqOgcSakwwvSsr/6/bYQX3HqfXkbXzbEJvbbvseWQniRo
   w==;
X-CSE-ConnectionGUID: 2GW4MKGWRbSFoDWf8m5WQg==
X-CSE-MsgGUID: uqUo0bg9TceYyPpU/Cl1mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="107593783"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="107593783"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 00:07:15 -0700
X-CSE-ConnectionGUID: 7VFqcieOS96Qiug5KP7JXA==
X-CSE-MsgGUID: egYdp688RRCOpdq9/w68CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="252109949"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2026 00:07:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYISV-00000000PlS-0ZJI;
	Sat, 13 Jun 2026 07:07:11 +0000
Date: Sat, 13 Jun 2026 15:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: KancyJoe <kancy2333@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/pmos-v4 17/31]
 drivers/gpu/drm/panel/panel-renesas-r63419.c:320:15: error: implicit
 declaration of function 'devm_drm_panel_add'; did you mean
 'devm_drm_panel_alloc'?
Message-ID: <202606131400.MLdoHY5J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/pmos-v4
head:   2990bb85e68d401720ce49038f3e512d7eb1a389
commit: 243e24384aa0b82af24b385485d2ce228b8a4660 [17/31] drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606131400.MLdoHY5J-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131400.MLdoHY5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131400.MLdoHY5J-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-renesas-r63419.c: In function 'renesas_r63419_probe':
>> drivers/gpu/drm/panel/panel-renesas-r63419.c:320:15: error: implicit declaration of function 'devm_drm_panel_add'; did you mean 'devm_drm_panel_alloc'? [-Wimplicit-function-declaration]
     320 |         ret = devm_drm_panel_add(dev, &ctx->panel);
         |               ^~~~~~~~~~~~~~~~~~
         |               devm_drm_panel_alloc


vim +320 drivers/gpu/drm/panel/panel-renesas-r63419.c

   246	
   247	static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
   248	{
   249		struct mipi_dsi_device_info info = { };
   250		struct device *dev = &dsi->dev;
   251		struct renesas_r63419_panel *ctx;
   252		struct device_node *dsi1_node;
   253		struct mipi_dsi_host *dsi1_host;
   254		int ret, i;
   255	
   256		ctx = devm_drm_panel_alloc(dev, struct renesas_r63419_panel, panel,
   257					   &renesas_r63419_panel_funcs, DRM_MODE_CONNECTOR_DSI);
   258		if (IS_ERR(ctx))
   259			return PTR_ERR(ctx);
   260	
   261		ctx->desc = of_device_get_match_data(dev);
   262		if (!ctx->desc)
   263			return dev_err_probe(dev, -ENODEV,
   264					     "Failed to get panel description\n");
   265	
   266		ret = devm_regulator_bulk_get_const(&dsi->dev,
   267						    ARRAY_SIZE(renesas_r63419_vdd_supplies),
   268						    renesas_r63419_vdd_supplies, &ctx->vdd_supplies);
   269		if (ret < 0)
   270			return ret;
   271	
   272		ret = devm_regulator_bulk_get_const(&dsi->dev,
   273						    ARRAY_SIZE(renesas_r63419_vcc_supplies),
   274						    renesas_r63419_vcc_supplies, &ctx->vcc_supplies);
   275		if (ret < 0)
   276			return ret;
   277	
   278		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   279		if (IS_ERR(ctx->reset_gpio))
   280			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   281					     "Failed to get reset gpio\n");
   282	
   283		/* Get second DSI host */
   284		dsi1_node = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
   285		if (!dsi1_node)
   286			return dev_err_probe(dev, -ENODEV,
   287					     "Failed to get remote node for second DSI\n");
   288	
   289		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1_node);
   290		of_node_put(dsi1_node);
   291		if (!dsi1_host)
   292			return dev_err_probe(dev, -EPROBE_DEFER,
   293					     "Failed to find second DSI host\n");
   294	
   295		/* Copy current DSI info, do not provide OF node since no driver needs to be attached */
   296		strscpy(info.type, dsi->name, sizeof(info.type));
   297		info.channel = dsi->channel;
   298	
   299		/* Register the second DSI device */
   300		ctx->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host, &info);
   301		if (IS_ERR(ctx->dsi[1]))
   302			return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
   303					     "Failed to register second DSI device\n");
   304	
   305		ctx->dsi[0] = dsi;
   306		mipi_dsi_set_drvdata(dsi, ctx);
   307	
   308		/* Get panel orientation */
   309		ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
   310		if (ret < 0 && ret != -ENODEV)
   311			return dev_err_probe(dev, ret,
   312					     "Failed to get panel orientation\n");
   313	
   314		ctx->panel.prepare_prev_first = true;
   315	
   316		ret = drm_panel_of_backlight(&ctx->panel);
   317		if (ret)
   318			return dev_err_probe(dev, ret, "Failed to get backlight\n");
   319	
 > 320		ret = devm_drm_panel_add(dev, &ctx->panel);
   321		if (ret)
   322			return dev_err_probe(dev, ret, "Failed to add panel\n");
   323	
   324		/* Configure and attach both DSI devices */
   325		for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++) {
   326			ctx->dsi[i]->lanes = ctx->desc->lanes;
   327			ctx->dsi[i]->format = ctx->desc->format;
   328			ctx->dsi[i]->mode_flags = ctx->desc->mode_flags;
   329	
   330			ret = devm_mipi_dsi_attach(dev, ctx->dsi[i]);
   331			if (ret < 0)
   332				return dev_err_probe(dev, ret,
   333						     "Failed to attach DSI device %d\n", i);
   334		}
   335	
   336		return 0;
   337	}
   338	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
