Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F1C134
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 05:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ykp1oFXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698298864; x=1729834864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuY+1xoxxL7wFV9SrPhcra8LfV7KV5Jmlmi+iCDUKwQ=;
  b=Ykp1oFXwvE/CbuTm+RRDOdqruxfcysn/wP12ui5xRL67ritEqShN/2/C
   E3fe76DExGkBikiJnSPOllUnjEODqsSO170PCi6Vorz+QX3Sh2wu2I8iB
   fKE9sFRx43TprOLJ6ZSOvxjK6PAscifsvigrrf5Ipyrm5w46dxQAQa9EX
   QTXe/eA7VY77TQDnEYsy+tHFPPV98Fj2mylhZfwHJQ2tBdCo6dQZpdIe1
   PBlgqs9BVpiItWCL9BkcpHZvAQFYGO6Fh4J0fZRH6j4jAU5TB0rhzjDe0
   PlyDefefVNdTBmz5GHyrhtYlTAa+IB8ppqAlRD1hFqFdsQ1Ln26KgRVAL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="453932538"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="453932538"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 22:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762701654"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="762701654"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Oct 2023 22:41:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvt76-0009Vn-0y;
	Thu, 26 Oct 2023 05:41:00 +0000
Date: Thu, 26 Oct 2023 13:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 18091/19133]
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c:411:9: warning: assignment makes pointer
 from integer without a cast
Message-ID: <202310261336.3PWmEvtK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   d9298e491a8881d9c736daf6b775dd0820570ad8
commit: 7f9a27710bf93d2ea46419283a1d272b355356b1 [18091/19133] UPSTREAM: drm/imx/lcdc: Implement DRM driver for imx25
config: i386-buildonly-randconfig-006-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261336.3PWmEvtK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261336.3PWmEvtK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261336.3PWmEvtK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imx/lcdc/imx-lcdc.c: In function 'imx_lcdc_probe':
   drivers/gpu/drm/imx/lcdc/imx-lcdc.c:411:11: error: implicit declaration of function 'devm_drm_of_get_bridge'; did you mean 'drm_of_get_dsi_bus'? [-Werror=implicit-function-declaration]
     bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
              ^~~~~~~~~~~~~~~~~~~~~~
              drm_of_get_dsi_bus
>> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:411:9: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
            ^
   drivers/gpu/drm/imx/lcdc/imx-lcdc.c:449:8: error: implicit declaration of function 'drm_bridge_attach'; did you mean 'dma_buf_attach'? [-Werror=implicit-function-declaration]
     ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
           ^~~~~~~~~~~~~~~~~
           dma_buf_attach
   drivers/gpu/drm/imx/lcdc/imx-lcdc.c:449:61: error: 'DRM_BRIDGE_ATTACH_NO_CONNECTOR' undeclared (first use in this function); did you mean 'DRM_MODE_OBJECT_CONNECTOR'?
     ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                                DRM_MODE_OBJECT_CONNECTOR
   drivers/gpu/drm/imx/lcdc/imx-lcdc.c:449:61: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +411 drivers/gpu/drm/imx/lcdc/imx-lcdc.c

   390	
   391	static int imx_lcdc_probe(struct platform_device *pdev)
   392	{
   393		struct imx_lcdc *lcdc;
   394		struct drm_device *drm;
   395		struct drm_bridge *bridge;
   396		int irq;
   397		int ret;
   398		struct device *dev = &pdev->dev;
   399	
   400		lcdc = devm_drm_dev_alloc(dev, &imx_lcdc_drm_driver,
   401					  struct imx_lcdc, drm);
   402		if (!lcdc)
   403			return -ENOMEM;
   404	
   405		drm = &lcdc->drm;
   406	
   407		lcdc->base = devm_platform_ioremap_resource(pdev, 0);
   408		if (IS_ERR(lcdc->base))
   409			return dev_err_probe(dev, PTR_ERR(lcdc->base), "Cannot get IO memory\n");
   410	
 > 411		bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
   412		if (IS_ERR(bridge))
   413			return dev_err_probe(dev, PTR_ERR(bridge), "Failed to find bridge\n");
   414	
   415		/* Get Clocks */
   416		lcdc->clk_ipg = devm_clk_get(dev, "ipg");
   417		if (IS_ERR(lcdc->clk_ipg))
   418			return dev_err_probe(dev, PTR_ERR(lcdc->clk_ipg), "Failed to get %s clk\n", "ipg");
   419	
   420		lcdc->clk_ahb = devm_clk_get(dev, "ahb");
   421		if (IS_ERR(lcdc->clk_ahb))
   422			return dev_err_probe(dev, PTR_ERR(lcdc->clk_ahb), "Failed to get %s clk\n", "ahb");
   423	
   424		lcdc->clk_per = devm_clk_get(dev, "per");
   425		if (IS_ERR(lcdc->clk_per))
   426			return dev_err_probe(dev, PTR_ERR(lcdc->clk_per), "Failed to get %s clk\n", "per");
   427	
   428		ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
   429		if (ret)
   430			return dev_err_probe(dev, ret, "Cannot set DMA Mask\n");
   431	
   432		/* Modeset init */
   433		ret = drmm_mode_config_init(drm);
   434		if (ret)
   435			return dev_err_probe(dev, ret, "Cannot initialize mode configuration structure\n");
   436	
   437		/* CRTC, Plane, Encoder */
   438		ret = drm_simple_display_pipe_init(drm, &lcdc->pipe,
   439						   &imx_lcdc_pipe_funcs,
   440						   imx_lcdc_formats,
   441						   ARRAY_SIZE(imx_lcdc_formats), NULL, NULL);
   442		if (ret < 0)
   443			return dev_err_probe(drm->dev, ret, "Cannot setup simple display pipe\n");
   444	
   445		ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
   446		if (ret < 0)
   447			return dev_err_probe(drm->dev, ret, "Failed to initialize vblank\n");
   448	
   449		ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
   450		if (ret)
   451			return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");
   452	
   453		lcdc->connector = drm_bridge_connector_init(drm, &lcdc->pipe.encoder);
   454		if (IS_ERR(lcdc->connector))
   455			return dev_err_probe(drm->dev, PTR_ERR(lcdc->connector), "Cannot init bridge connector\n");
   456	
   457		drm_connector_attach_encoder(lcdc->connector, &lcdc->pipe.encoder);
   458	
   459		/*
   460		 * The LCDC controller does not have an enable bit. The
   461		 * controller starts directly when the clocks are enabled.
   462		 * If the clocks are enabled when the controller is not yet
   463		 * programmed with proper register values (enabled at the
   464		 * bootloader, for example) then it just goes into some undefined
   465		 * state.
   466		 * To avoid this issue, let's enable and disable LCDC IPG,
   467		 * PER and AHB clock so that we force some kind of 'reset'
   468		 * to the LCDC block.
   469		 */
   470	
   471		ret = clk_prepare_enable(lcdc->clk_ipg);
   472		if (ret)
   473			return dev_err_probe(dev, ret, "Cannot enable ipg clock\n");
   474		clk_disable_unprepare(lcdc->clk_ipg);
   475	
   476		ret = clk_prepare_enable(lcdc->clk_per);
   477		if (ret)
   478			return dev_err_probe(dev, ret, "Cannot enable per clock\n");
   479		clk_disable_unprepare(lcdc->clk_per);
   480	
   481		ret = clk_prepare_enable(lcdc->clk_ahb);
   482		if (ret)
   483			return dev_err_probe(dev, ret, "Cannot enable ahb clock\n");
   484		clk_disable_unprepare(lcdc->clk_ahb);
   485	
   486		drm->mode_config.min_width = LCDC_MIN_XRES;
   487		drm->mode_config.max_width = LCDC_MAX_XRES;
   488		drm->mode_config.min_height = LCDC_MIN_YRES;
   489		drm->mode_config.max_height = LCDC_MAX_YRES;
   490		drm->mode_config.preferred_depth = 16;
   491		drm->mode_config.funcs = &imx_lcdc_mode_config_funcs;
   492		drm->mode_config.helper_private = &imx_lcdc_mode_config_helpers;
   493	
   494		drm_mode_config_reset(drm);
   495	
   496		irq = platform_get_irq(pdev, 0);
   497		if (irq < 0) {
   498			ret = irq;
   499			return ret;
   500		}
   501	
   502		ret = devm_request_irq(dev, irq, imx_lcdc_irq_handler, 0, "imx-lcdc", lcdc);
   503		if (ret < 0)
   504			return dev_err_probe(drm->dev, ret, "Failed to install IRQ handler\n");
   505	
   506		platform_set_drvdata(pdev, drm);
   507	
   508		ret = drm_dev_register(&lcdc->drm, 0);
   509		if (ret)
   510			return dev_err_probe(dev, ret, "Cannot register device\n");
   511	
   512		drm_fbdev_generic_setup(drm, 0);
   513	
   514		return 0;
   515	}
   516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
