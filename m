Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417A6FC8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689332498; x=1720868498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7fWpbX8nWADCF3j7Zx6niwdTjpho4ca6p6cvCFBwLE=;
  b=oKw08uIpygAGJIsTTq/lPCrvLvJdDU45QG3rDZXV3Ziv4W6fPIYaXHT7
   EYGKEF8xXSwnyvCTBnE8eDgkeD62xagqINc2Ac7MZ2scZeA9+TqadZl/q
   7WA2hOTiwL32yvLneldZWe7cpc27YfGyucCs2O6veIv2DRWh2q2fwYuOk
   lSiQDZaTZng2j63i3pYZkvSZRtuJWXn14ad6F4RuzL2cw+MfZTf1ErUwC
   8PSctOMEvwOecDkTwezGRW/v48zPmo2mK6lVTmznFvZ0hVdv4Wp12pu+u
   2+F756sIM7iWHumTaP9TzsCAmixYmk0d89P0xv3P7sE0GO+qRVfAm1Zwm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362913373"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="362913373"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 04:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1053018603"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="1053018603"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 04:01:30 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKGYE-0007O5-00;
	Fri, 14 Jul 2023 11:01:30 +0000
Date: Fri, 14 Jul 2023 19:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:asahi-6.5-rc1-wip 343/386]
 drivers/gpu/drm/apple/apple_drv.c:424:15: error: too many arguments to
 function 'drm_aperture_remove_conflicting_framebuffers'
Message-ID: <202307141824.kfrwj9ag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-6.5-rc1-wip
head:   1bc0a30b4215e66744ba912b219282d204a28748
commit: 9b412489a1ebb68eab2106c3b7e38dc4777d84df [343/386] gpu: drm: apple: Use drm_aperture_remove_conflicting_framebuffers
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230714/202307141824.kfrwj9ag-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141824.kfrwj9ag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141824.kfrwj9ag-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/apple/apple_drv.c: In function 'apple_platform_probe':
>> drivers/gpu/drm/apple/apple_drv.c:424:15: error: too many arguments to function 'drm_aperture_remove_conflicting_framebuffers'
     424 |         ret = drm_aperture_remove_conflicting_framebuffers(fb_r.start, fb_size,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/apple/apple_drv.c:15:
   include/drm/drm_aperture.h:15:5: note: declared here
      15 | int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_aperture_remove_conflicting_framebuffers +424 drivers/gpu/drm/apple/apple_drv.c

   374	
   375	
   376	static int apple_platform_probe(struct platform_device *pdev)
   377	{
   378		struct device *dev = &pdev->dev;
   379		struct apple_drm_private *apple;
   380		struct resource fb_r;
   381		resource_size_t fb_size;
   382		struct platform_device *dcp[MAX_COPROCESSORS];
   383		int ret, nr_dcp, i;
   384	
   385		for (nr_dcp = 0; nr_dcp < MAX_COPROCESSORS; ++nr_dcp) {
   386			struct device_node *np;
   387			struct device_link *dcp_link;
   388	
   389			np = of_parse_phandle(dev->of_node, "apple,coprocessors",
   390					      nr_dcp);
   391	
   392			if (!np)
   393				break;
   394	
   395			dcp[nr_dcp] = of_find_device_by_node(np);
   396	
   397			if (!dcp[nr_dcp])
   398				return -ENODEV;
   399	
   400			dcp_link = device_link_add(dev, &dcp[nr_dcp]->dev,
   401						   DL_FLAG_AUTOREMOVE_CONSUMER);
   402			if (!dcp_link) {
   403				dev_err(dev, "Failed to link to DCP %d device", nr_dcp);
   404				return -EINVAL;
   405			}
   406	
   407			if (dcp_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
   408				return -EPROBE_DEFER;
   409		}
   410	
   411		/* Need at least 1 DCP for a display subsystem */
   412		if (nr_dcp < 1)
   413			return -ENODEV;
   414	
   415		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
   416		if (ret)
   417			return ret;
   418	
   419		ret = apple_get_fb_resource(dev, "framebuffer", &fb_r);
   420		if (ret)
   421			return ret;
   422	
   423		fb_size = fb_r.end - fb_r.start + 1;
 > 424		ret = drm_aperture_remove_conflicting_framebuffers(fb_r.start, fb_size,
   425							false, &apple_drm_driver);
   426		if (ret) {
   427			dev_err(dev, "Failed remove fb: %d\n", ret);
   428			return ret;
   429		}
   430	
   431		apple = devm_drm_dev_alloc(dev, &apple_drm_driver,
   432					   struct apple_drm_private, drm);
   433		if (IS_ERR(apple))
   434			return PTR_ERR(apple);
   435	
   436		dev_set_drvdata(dev, apple);
   437	
   438		ret = drmm_mode_config_init(&apple->drm);
   439		if (ret)
   440			goto err_unload;
   441	
   442		/*
   443		 * IOMFB::UPPipeDCP_H13P::verify_surfaces produces the error "plane
   444		 * requires a minimum of 32x32 for the source buffer" if smaller
   445		 */
   446		apple->drm.mode_config.min_width = 32;
   447		apple->drm.mode_config.min_height = 32;
   448	
   449		/*
   450		 * TODO: this is the max framebuffer size not the maximal supported
   451		 * output resolution. DCP reports the maximal framebuffer size take it
   452		 * from there.
   453		 * Hardcode it for now to the M1 Max DCP reported 'MaxSrcBufferWidth'
   454		 * and 'MaxSrcBufferHeight' of 16384.
   455		 */
   456		apple->drm.mode_config.max_width = 16384;
   457		apple->drm.mode_config.max_height = 16384;
   458	
   459		apple->drm.mode_config.funcs = &apple_mode_config_funcs;
   460		apple->drm.mode_config.helper_private = &apple_mode_config_helpers;
   461	
   462		for (i = 0; i < nr_dcp; ++i) {
   463			ret = apple_probe_per_dcp(dev, &apple->drm, dcp[i], i);
   464	
   465			if (ret)
   466				goto err_unload;
   467	
   468			ret = dcp_start(dcp[i]);
   469	
   470			if (ret)
   471				goto err_unload;
   472		}
   473	
   474		drm_mode_config_reset(&apple->drm);
   475	
   476		ret = drm_dev_register(&apple->drm, 0);
   477		if (ret)
   478			goto err_unload;
   479	
   480		drm_fbdev_generic_setup(&apple->drm, 32);
   481	
   482		return 0;
   483	
   484	err_unload:
   485		drm_dev_put(&apple->drm);
   486		return ret;
   487	}
   488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
