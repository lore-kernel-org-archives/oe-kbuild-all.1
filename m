Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3234A78E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328824; cv=none; b=tQbqvu8V8kpHvTRJFjK6f6vwxJIeo7aSSI9TjumPhCyFN1zpujLYxaJib7LlC4TpYjj20N532OQzTmKFy74ljjI4Wib1vgEBuQchja5r2oyBHdpVRRsLTZuZ+631oOGynWcan/tg6NQ3iQsXb0zoSDP6IesnXg8aiDx6z56Rug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328824; c=relaxed/simple;
	bh=L9ptgWMKdF9clEGjm+eLWytpT08sJO4eJ+AHkhKinV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IW0uHDX3kXukSep4l/mHEtdXYNXkvonTUb5YxQSz0+BRDiPGuZLgxRSf5yw9BoBZnkosN8zQnVzNIk3p5ly4wP23A+IeowoTJNNIJHF4syGxcTJxNjEVNqH2VPeX6G4bI1n2a3NQj3F1SCQ+Lk34BRg5JoXL9CExfILC5FppdsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guAE6zYj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guAE6zYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789328822; x=1820864822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L9ptgWMKdF9clEGjm+eLWytpT08sJO4eJ+AHkhKinV4=;
  b=guAE6zYjYQvIW+RkfNrUbOrgkDyWW3OWKKc5fEX0+/pRnpMZUgT+xt2X
   kRaYJt59tWF2QSrLYKVrQd7ngVzfARlOhD08TDlhVg/pEweP7Piq9456A
   jvCYYXi85X69tmqlX7xXsU63LRIs5FXV04pj/GARjfUL+YvPlEy9bLf+H
   VV3NxUB61F0tUmbxV3Bxey5jpY2guwxkilO6ZY1toSDx+P6IilecmaHQT
   EEfz6GnEfnkYNbR4XGexQT2FTIEc5Plo/slkxzkVudX2pUzzTABdvQPZv
   /NbxisSvfEpZdngLGtMJ+3uYtpZxJA/G4fP/kfaaKp6WR1nUAoHtjm1+J
   A==;
X-CSE-ConnectionGUID: dLwQIFCGSjOUZnRRaEoyGg==
X-CSE-MsgGUID: jWo5lzZWRPGJ1TWD3LXCaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93394377"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="93394377"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 12:47:02 -0700
X-CSE-ConnectionGUID: IuxGWnPnRMesp44EnmZauA==
X-CSE-MsgGUID: qz51yXVzRleYGI+WAU+5DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="270660574"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Sep 2026 12:46:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5qAC-000000001Gj-1fzV;
	Sun, 13 Sep 2026 19:46:56 +0000
Date: Mon, 14 Sep 2026 03:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linusw@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: fix panel cleanup on attach
 failure
Message-ID: <202609140335.bubtlivW-lkp@intel.com>
References: <20260913102608.1526916-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913102608.1526916-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.3-rc2]
[cannot apply to drm-misc/drm-misc-next next-20260911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/drm-panel-ilitek-ili9881c-fix-panel-cleanup-on-attach-failure/20260913-182608
base:   linus/master
patch link:    https://lore.kernel.org/r/20260913102608.1526916-1-lgs201920130244%40gmail.com
patch subject: [PATCH] drm/panel: ilitek-ili9881c: fix panel cleanup on attach failure
config: parisc-randconfig-002-20260914 (https://download.01.org/0day-ci/archive/20260914/202609140335.bubtlivW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140335.bubtlivW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140335.bubtlivW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c: In function 'ili9881c_dsi_probe':
>> drivers/gpu/drm/panel/panel-ilitek-ili9881c.c:2599:78: error: expected ';' before 'dsi'
    2599 |                 return dev_err_probe(&dsi->dev, ret, "Failed to add panel\n")
         |                                                                              ^
         |                                                                              ;
    2600 | 
    2601 |         dsi->mode_flags = ctx->desc->mode_flags;
         |         ~~~                                                                   


vim +2599 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c

  2545	
  2546	static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
  2547	{
  2548		struct ili9881c *ctx;
  2549		int ret;
  2550	
  2551		ctx = devm_drm_panel_alloc(&dsi->dev, struct ili9881c, panel, &ili9881c_funcs,
  2552					   DRM_MODE_CONNECTOR_DSI);
  2553		if (IS_ERR(ctx))
  2554			return PTR_ERR(ctx);
  2555	
  2556		mipi_dsi_set_drvdata(dsi, ctx);
  2557		ctx->dsi = dsi;
  2558		ctx->desc = of_device_get_match_data(&dsi->dev);
  2559	
  2560		ctx->power = devm_regulator_get(&dsi->dev, "power");
  2561		if (IS_ERR(ctx->power))
  2562			return dev_err_probe(&dsi->dev, PTR_ERR(ctx->power),
  2563					     "Couldn't get our power regulator\n");
  2564	
  2565		ctx->iovcc = devm_regulator_get_optional(&dsi->dev, "iovcc");
  2566		if (IS_ERR(ctx->iovcc)) {
  2567			if (PTR_ERR(ctx->iovcc) != -ENODEV)
  2568				return dev_err_probe(&dsi->dev, PTR_ERR(ctx->iovcc),
  2569					     "Couldn't get our iovcc regulator\n");
  2570			ctx->iovcc = NULL;
  2571		}
  2572	
  2573		ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_LOW);
  2574		if (IS_ERR(ctx->reset))
  2575			return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
  2576					     "Couldn't get our reset GPIO\n");
  2577	
  2578		ret = drm_of_get_panel_orientation(dsi->dev.of_node, &ctx->orientation);
  2579		if (ret) {
  2580			dev_err(&dsi->dev, "%pOF: failed to get orientation: %d\n",
  2581				dsi->dev.of_node, ret);
  2582			return ret;
  2583		}
  2584	
  2585		ctx->address_mode = ctx->desc->default_address_mode;
  2586		if (ctx->orientation == DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP) {
  2587			ctx->address_mode ^= 0x03;
  2588			ctx->orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
  2589		}
  2590	
  2591		ctx->panel.prepare_prev_first = true;
  2592	
  2593		ret = drm_panel_of_backlight(&ctx->panel);
  2594		if (ret)
  2595			return ret;
  2596	
  2597		ret = devm_drm_panel_add(&dsi->dev, &ctx->panel);
  2598		if (ret)
> 2599			return dev_err_probe(&dsi->dev, ret, "Failed to add panel\n")
  2600	
  2601		dsi->mode_flags = ctx->desc->mode_flags;
  2602		dsi->format = MIPI_DSI_FMT_RGB888;
  2603		dsi->lanes = ctx->desc->lanes;
  2604	
  2605		return mipi_dsi_attach(dsi);
  2606	}
  2607	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
