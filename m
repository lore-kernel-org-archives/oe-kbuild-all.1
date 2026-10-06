Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A08433AD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 03:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791257845; cv=none; b=Zup4bUMl5Zk0P6g6O6pX5/2gN4RtvNjI3b1JWMaZtpzB109+xvu79M5ZtdTwCtG7BxbXNq60DHnGyKMlrjxKk0hZRDCgbHvRpzf4obU/kmgWWXJVvhnJ4BKuRkMfATsxX9wRtDxt0JqTk3MObvuUYc8cBsGmhbKk4wtzIAbA5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791257845; c=relaxed/simple;
	bh=bPLk6I7MKcO5ni0ZR3PPMYTGe3rtY0y97L1z5q8NugQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HHfQ4RT1O4eCs3JuJHyf8beXRLO1Aef0C/7NjpQwuazvwIp+7JbeMkS0jHnLov3UiRMdHLrOeWKfJaFfIBT9FEw+a63IurQTqaC4rIH0m6sd6mh89C58AjRQxV+tFDNuKi6njVnKzGip8eicra9a0J6b+lwfSQxiyAU9OwWuIkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/mqnC+2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/mqnC+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791257843; x=1822793843;
  h=date:from:to:cc:subject:message-id;
  bh=bPLk6I7MKcO5ni0ZR3PPMYTGe3rtY0y97L1z5q8NugQ=;
  b=H/mqnC+2nvojzlvWg/LUxSlX55we1AfkYepaoJocglWA4TKLzyJ57hpt
   ZigeE/fje6/nVaQKWvbLPRAdJc9uF8cOzSP1Ek1Bqx0l1kjnEjAuOExiu
   S9xWhFxX7lETM/CLn6qS5g65CBQE8DZqGSKzknBE8olN0LC7vDIhOL+IG
   0nUjoxAGZO6+i63knnMvLCtursSg9do3TAExNLTST/419/7SHvQmfVCXF
   n5MDngd5F14b0CXLUJdIo8moEDjFbTT3zRbOc80o2p7Izkc1BWLF8C9aH
   yugAejtGrkBnEUm1H1WKdR0c9cYQ/xRikd6jMed56/RDnsuLsHleJAcmZ
   A==;
X-CSE-ConnectionGUID: 8arfR8siRxO+TwQu3E3xXw==
X-CSE-MsgGUID: XttqvOBYQUi1iBY6E0H8MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94427431"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="94427431"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 20:37:22 -0700
X-CSE-ConnectionGUID: 3qlnA6flS7SieDWYqEvwIA==
X-CSE-MsgGUID: MZ7GOyrpQ4CesMZwdCU1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="273400996"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Oct 2026 20:37:20 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDvzS-000000000fH-3tDo;
	Tue, 06 Oct 2026 03:37:18 +0000
Date: Tue, 06 Oct 2026 05:36:42 +0200
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [linux-next:master 11695/14242]
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c:545 imx_lcdc_probe() warn: inconsistent
 indenting
Message-ID: <202610060513.s5yUX86m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
commit: 4136a58ced8e4000f1a76d8f71b6b62c03b6c3d5 [11695/14242] drm/imx/lcdc: stop using deprecated devm_drm_of_get_bridge()
config: alpha-randconfig-r2200-20261005 (https://download.01.org/0day-ci/archive/20261006/202610060513.s5yUX86m-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610060513.s5yUX86m-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/imx/lcdc/imx-lcdc.c:545 imx_lcdc_probe() warn: inconsistent indenting

vim +545 drivers/gpu/drm/imx/lcdc/imx-lcdc.c

c87e859cdeb5d10 Marian Cichy      2023-03-06  462  
c87e859cdeb5d10 Marian Cichy      2023-03-06  463  static int imx_lcdc_probe(struct platform_device *pdev)
c87e859cdeb5d10 Marian Cichy      2023-03-06  464  {
c87e859cdeb5d10 Marian Cichy      2023-03-06  465  	struct imx_lcdc *lcdc;
c87e859cdeb5d10 Marian Cichy      2023-03-06  466  	struct drm_device *drm;
25854efccd6a866 Ze Huang          2026-09-19  467  	struct drm_plane *plane;
25854efccd6a866 Ze Huang          2026-09-19  468  	struct drm_crtc *crtc;
25854efccd6a866 Ze Huang          2026-09-19  469  	struct drm_encoder *encoder;
c87e859cdeb5d10 Marian Cichy      2023-03-06  470  	int irq;
c87e859cdeb5d10 Marian Cichy      2023-03-06  471  	int ret;
c87e859cdeb5d10 Marian Cichy      2023-03-06  472  	struct device *dev = &pdev->dev;
c87e859cdeb5d10 Marian Cichy      2023-03-06  473  
c87e859cdeb5d10 Marian Cichy      2023-03-06  474  	lcdc = devm_drm_dev_alloc(dev, &imx_lcdc_drm_driver,
c87e859cdeb5d10 Marian Cichy      2023-03-06  475  				  struct imx_lcdc, drm);
dae2f7b89a84363 Dan Carpenter     2023-03-22  476  	if (IS_ERR(lcdc))
dae2f7b89a84363 Dan Carpenter     2023-03-22  477  		return PTR_ERR(lcdc);
c87e859cdeb5d10 Marian Cichy      2023-03-06  478  
c87e859cdeb5d10 Marian Cichy      2023-03-06  479  	drm = &lcdc->drm;
c87e859cdeb5d10 Marian Cichy      2023-03-06  480  
c87e859cdeb5d10 Marian Cichy      2023-03-06  481  	lcdc->base = devm_platform_ioremap_resource(pdev, 0);
c87e859cdeb5d10 Marian Cichy      2023-03-06  482  	if (IS_ERR(lcdc->base))
c87e859cdeb5d10 Marian Cichy      2023-03-06  483  		return dev_err_probe(dev, PTR_ERR(lcdc->base), "Cannot get IO memory\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  484  
4136a58ced8e400 Luca Ceresoli     2026-09-29  485  	struct drm_bridge *bridge __free(drm_bridge_put) =
4136a58ced8e400 Luca Ceresoli     2026-09-29  486  		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
c87e859cdeb5d10 Marian Cichy      2023-03-06  487  	if (IS_ERR(bridge))
c87e859cdeb5d10 Marian Cichy      2023-03-06  488  		return dev_err_probe(dev, PTR_ERR(bridge), "Failed to find bridge\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  489  
c87e859cdeb5d10 Marian Cichy      2023-03-06  490  	/* Get Clocks */
c87e859cdeb5d10 Marian Cichy      2023-03-06  491  	lcdc->clk_ipg = devm_clk_get(dev, "ipg");
c87e859cdeb5d10 Marian Cichy      2023-03-06  492  	if (IS_ERR(lcdc->clk_ipg))
c87e859cdeb5d10 Marian Cichy      2023-03-06  493  		return dev_err_probe(dev, PTR_ERR(lcdc->clk_ipg), "Failed to get %s clk\n", "ipg");
c87e859cdeb5d10 Marian Cichy      2023-03-06  494  
c87e859cdeb5d10 Marian Cichy      2023-03-06  495  	lcdc->clk_ahb = devm_clk_get(dev, "ahb");
c87e859cdeb5d10 Marian Cichy      2023-03-06  496  	if (IS_ERR(lcdc->clk_ahb))
c87e859cdeb5d10 Marian Cichy      2023-03-06  497  		return dev_err_probe(dev, PTR_ERR(lcdc->clk_ahb), "Failed to get %s clk\n", "ahb");
c87e859cdeb5d10 Marian Cichy      2023-03-06  498  
c87e859cdeb5d10 Marian Cichy      2023-03-06  499  	lcdc->clk_per = devm_clk_get(dev, "per");
c87e859cdeb5d10 Marian Cichy      2023-03-06  500  	if (IS_ERR(lcdc->clk_per))
c87e859cdeb5d10 Marian Cichy      2023-03-06  501  		return dev_err_probe(dev, PTR_ERR(lcdc->clk_per), "Failed to get %s clk\n", "per");
c87e859cdeb5d10 Marian Cichy      2023-03-06  502  
c87e859cdeb5d10 Marian Cichy      2023-03-06  503  	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
c87e859cdeb5d10 Marian Cichy      2023-03-06  504  	if (ret)
c87e859cdeb5d10 Marian Cichy      2023-03-06  505  		return dev_err_probe(dev, ret, "Cannot set DMA Mask\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  506  
c87e859cdeb5d10 Marian Cichy      2023-03-06  507  	/* Modeset init */
c87e859cdeb5d10 Marian Cichy      2023-03-06  508  	ret = drmm_mode_config_init(drm);
c87e859cdeb5d10 Marian Cichy      2023-03-06  509  	if (ret)
c87e859cdeb5d10 Marian Cichy      2023-03-06  510  		return dev_err_probe(dev, ret, "Cannot initialize mode configuration structure\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  511  
25854efccd6a866 Ze Huang          2026-09-19  512  	plane = &lcdc->plane;
25854efccd6a866 Ze Huang          2026-09-19  513  	ret = drm_universal_plane_init(drm, plane, 0,
25854efccd6a866 Ze Huang          2026-09-19  514  				       &imx_lcdc_plane_funcs,
c87e859cdeb5d10 Marian Cichy      2023-03-06  515  				       imx_lcdc_formats,
25854efccd6a866 Ze Huang          2026-09-19  516  				       ARRAY_SIZE(imx_lcdc_formats),
25854efccd6a866 Ze Huang          2026-09-19  517  				       NULL,
25854efccd6a866 Ze Huang          2026-09-19  518  				       DRM_PLANE_TYPE_PRIMARY, NULL);
c87e859cdeb5d10 Marian Cichy      2023-03-06  519  	if (ret < 0)
25854efccd6a866 Ze Huang          2026-09-19  520  		return dev_err_probe(drm->dev, ret, "Cannot initialize primary plane\n");
25854efccd6a866 Ze Huang          2026-09-19  521  	drm_plane_helper_add(plane, &imx_lcdc_plane_helper_funcs);
25854efccd6a866 Ze Huang          2026-09-19  522  
25854efccd6a866 Ze Huang          2026-09-19  523  	crtc = &lcdc->crtc;
25854efccd6a866 Ze Huang          2026-09-19  524  	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
25854efccd6a866 Ze Huang          2026-09-19  525  					&imx_lcdc_crtc_funcs, NULL);
25854efccd6a866 Ze Huang          2026-09-19  526  	if (ret < 0)
25854efccd6a866 Ze Huang          2026-09-19  527  		return dev_err_probe(drm->dev, ret, "Cannot initialize CRTC\n");
25854efccd6a866 Ze Huang          2026-09-19  528  	drm_crtc_helper_add(crtc, &imx_lcdc_crtc_helper_funcs);
25854efccd6a866 Ze Huang          2026-09-19  529  
25854efccd6a866 Ze Huang          2026-09-19  530  	encoder = &lcdc->encoder;
25854efccd6a866 Ze Huang          2026-09-19  531  	ret = drm_encoder_init(drm, encoder, &imx_lcdc_encoder_funcs,
25854efccd6a866 Ze Huang          2026-09-19  532  			       DRM_MODE_ENCODER_NONE, NULL);
25854efccd6a866 Ze Huang          2026-09-19  533  	if (ret < 0)
25854efccd6a866 Ze Huang          2026-09-19  534  		return dev_err_probe(drm->dev, ret, "Cannot initialize encoder\n");
25854efccd6a866 Ze Huang          2026-09-19  535  	encoder->possible_crtcs = drm_crtc_mask(crtc);
c87e859cdeb5d10 Marian Cichy      2023-03-06  536  
c87e859cdeb5d10 Marian Cichy      2023-03-06  537  	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
c87e859cdeb5d10 Marian Cichy      2023-03-06  538  	if (ret < 0)
c87e859cdeb5d10 Marian Cichy      2023-03-06  539  		return dev_err_probe(drm->dev, ret, "Failed to initialize vblank\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  540  
25854efccd6a866 Ze Huang          2026-09-19  541  	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
c87e859cdeb5d10 Marian Cichy      2023-03-06  542  	if (ret)
c87e859cdeb5d10 Marian Cichy      2023-03-06  543  		return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  544  
25854efccd6a866 Ze Huang          2026-09-19 @545  lcdc->connector = drm_bridge_connector_init(drm, encoder);
c87e859cdeb5d10 Marian Cichy      2023-03-06  546  	if (IS_ERR(lcdc->connector))
c87e859cdeb5d10 Marian Cichy      2023-03-06  547  		return dev_err_probe(drm->dev, PTR_ERR(lcdc->connector), "Cannot init bridge connector\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  548  
c87e859cdeb5d10 Marian Cichy      2023-03-06  549  	/*
c87e859cdeb5d10 Marian Cichy      2023-03-06  550  	 * The LCDC controller does not have an enable bit. The
c87e859cdeb5d10 Marian Cichy      2023-03-06  551  	 * controller starts directly when the clocks are enabled.
c87e859cdeb5d10 Marian Cichy      2023-03-06  552  	 * If the clocks are enabled when the controller is not yet
c87e859cdeb5d10 Marian Cichy      2023-03-06  553  	 * programmed with proper register values (enabled at the
c87e859cdeb5d10 Marian Cichy      2023-03-06  554  	 * bootloader, for example) then it just goes into some undefined
c87e859cdeb5d10 Marian Cichy      2023-03-06  555  	 * state.
c87e859cdeb5d10 Marian Cichy      2023-03-06  556  	 * To avoid this issue, let's enable and disable LCDC IPG,
c87e859cdeb5d10 Marian Cichy      2023-03-06  557  	 * PER and AHB clock so that we force some kind of 'reset'
c87e859cdeb5d10 Marian Cichy      2023-03-06  558  	 * to the LCDC block.
c87e859cdeb5d10 Marian Cichy      2023-03-06  559  	 */
c87e859cdeb5d10 Marian Cichy      2023-03-06  560  
c87e859cdeb5d10 Marian Cichy      2023-03-06  561  	ret = clk_prepare_enable(lcdc->clk_ipg);
c87e859cdeb5d10 Marian Cichy      2023-03-06  562  	if (ret)
c87e859cdeb5d10 Marian Cichy      2023-03-06  563  		return dev_err_probe(dev, ret, "Cannot enable ipg clock\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  564  	clk_disable_unprepare(lcdc->clk_ipg);
c87e859cdeb5d10 Marian Cichy      2023-03-06  565  
c87e859cdeb5d10 Marian Cichy      2023-03-06  566  	ret = clk_prepare_enable(lcdc->clk_per);
c87e859cdeb5d10 Marian Cichy      2023-03-06  567  	if (ret)
c87e859cdeb5d10 Marian Cichy      2023-03-06  568  		return dev_err_probe(dev, ret, "Cannot enable per clock\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  569  	clk_disable_unprepare(lcdc->clk_per);
c87e859cdeb5d10 Marian Cichy      2023-03-06  570  
c87e859cdeb5d10 Marian Cichy      2023-03-06  571  	ret = clk_prepare_enable(lcdc->clk_ahb);
c87e859cdeb5d10 Marian Cichy      2023-03-06  572  	if (ret)
c87e859cdeb5d10 Marian Cichy      2023-03-06  573  		return dev_err_probe(dev, ret, "Cannot enable ahb clock\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  574  	clk_disable_unprepare(lcdc->clk_ahb);
c87e859cdeb5d10 Marian Cichy      2023-03-06  575  
c87e859cdeb5d10 Marian Cichy      2023-03-06  576  	drm->mode_config.min_width = LCDC_MIN_XRES;
c87e859cdeb5d10 Marian Cichy      2023-03-06  577  	drm->mode_config.max_width = LCDC_MAX_XRES;
c87e859cdeb5d10 Marian Cichy      2023-03-06  578  	drm->mode_config.min_height = LCDC_MIN_YRES;
c87e859cdeb5d10 Marian Cichy      2023-03-06  579  	drm->mode_config.max_height = LCDC_MAX_YRES;
c87e859cdeb5d10 Marian Cichy      2023-03-06  580  	drm->mode_config.preferred_depth = 16;
c87e859cdeb5d10 Marian Cichy      2023-03-06  581  	drm->mode_config.funcs = &imx_lcdc_mode_config_funcs;
c87e859cdeb5d10 Marian Cichy      2023-03-06  582  	drm->mode_config.helper_private = &imx_lcdc_mode_config_helpers;
c87e859cdeb5d10 Marian Cichy      2023-03-06  583  
25854efccd6a866 Ze Huang          2026-09-19  584  	ret = drm_mode_config_create_initial_state(drm);
25854efccd6a866 Ze Huang          2026-09-19  585  	if (ret)
25854efccd6a866 Ze Huang          2026-09-19  586  		return dev_err_probe(dev, ret, "Cannot create initial state\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  587  
c87e859cdeb5d10 Marian Cichy      2023-03-06  588  	irq = platform_get_irq(pdev, 0);
c87e859cdeb5d10 Marian Cichy      2023-03-06  589  	if (irq < 0) {
c87e859cdeb5d10 Marian Cichy      2023-03-06  590  		ret = irq;
c87e859cdeb5d10 Marian Cichy      2023-03-06  591  		return ret;
c87e859cdeb5d10 Marian Cichy      2023-03-06  592  	}
c87e859cdeb5d10 Marian Cichy      2023-03-06  593  
c87e859cdeb5d10 Marian Cichy      2023-03-06  594  	ret = devm_request_irq(dev, irq, imx_lcdc_irq_handler, 0, "imx-lcdc", lcdc);
c87e859cdeb5d10 Marian Cichy      2023-03-06  595  	if (ret < 0)
c87e859cdeb5d10 Marian Cichy      2023-03-06  596  		return dev_err_probe(drm->dev, ret, "Failed to install IRQ handler\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  597  
c87e859cdeb5d10 Marian Cichy      2023-03-06  598  	platform_set_drvdata(pdev, drm);
c87e859cdeb5d10 Marian Cichy      2023-03-06  599  
c87e859cdeb5d10 Marian Cichy      2023-03-06  600  	ret = drm_dev_register(&lcdc->drm, 0);
c87e859cdeb5d10 Marian Cichy      2023-03-06  601  	if (ret)
c87e859cdeb5d10 Marian Cichy      2023-03-06  602  		return dev_err_probe(dev, ret, "Cannot register device\n");
c87e859cdeb5d10 Marian Cichy      2023-03-06  603  
b9a14d54ab2bf0c Thomas Zimmermann 2024-09-24  604  	drm_client_setup(drm, NULL);
c87e859cdeb5d10 Marian Cichy      2023-03-06  605  
c87e859cdeb5d10 Marian Cichy      2023-03-06  606  	return 0;
c87e859cdeb5d10 Marian Cichy      2023-03-06  607  }
c87e859cdeb5d10 Marian Cichy      2023-03-06  608  

:::::: The code at line 545 was first introduced by commit
:::::: 25854efccd6a86654583a5a3b15342e59783564b drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers

:::::: TO: Ze Huang <ze.huang@oss.qualcomm.com>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
