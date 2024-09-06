Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F0A1CA68E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 11:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620794; cv=none; b=KAYrZq134lX9+KqBBqNKXYM/5k4uTtuLdGQRJ77DyL7eRiI1UDdkfA0Kxv/ZwrsH4tB36Knzd4T/kzV5smHSWjSFCC+wQ1hzwV/c+sSXkZWfMWqSJ62w1nDd6pVZx7IicUUYTwYxRDOSIxQQH9Wa3R6ktrGOl2C8PIKRG3Z6y28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620794; c=relaxed/simple;
	bh=8Y6hOTlG1uoRhdRZXfa8Wo5lLICZxnIeQIWmKcBde+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PJOHH8pVgHS2muqRmm+w7aU3BD6En6k7gQ+zcy79MST5n3oEKvSjmvdWkRpItzJ7gSZK1VFAnk0yNR4TUVv42qu6ylwE3ZICMq9Js42rLivccu/MJrdKbp5mG6xewR4ItVVcCKzcRzr7fDH8BGttyx4w2RF6jMQLruuXn8yaaoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXuFCgDt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXuFCgDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725620793; x=1757156793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Y6hOTlG1uoRhdRZXfa8Wo5lLICZxnIeQIWmKcBde+Q=;
  b=nXuFCgDtVcb1nXZ4ZkB5vvNQojhEn/z5s2cafdd+IPg96H5M9D5Qkvxa
   eZr7A+I26u2ZVQD77w3raDN8GynRsG76im3IyGJMyLrT4bSUP85W5z+M2
   B4BXsoFsYgQ0tZS/dkeSJt9vf2JGToXqH8/25ONQ+D8nM67dXgTukTiwu
   zYzZbI1SFqGPMxi3OZBvCxZh4AIo4c78lLhFsEI5SNKYBA8wAzUHJ8S3U
   VahFsGbCFZh2hx98Pufkmwg1SzRQx2mCgbdW5r9cM7aMErLnc2fyoth5y
   hWFLXWe0dKrJMPPLClE2t2/XKLF+9kwJnzoTZcMPpDEEPqJLyZrZHXWwT
   w==;
X-CSE-ConnectionGUID: SkAH9VUtQ8iza6Ah9rYYdg==
X-CSE-MsgGUID: 6N20Za3NRVe+KT7deJC6Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35727766"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="35727766"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:05:50 -0700
X-CSE-ConnectionGUID: lN9ONwQ4RECLB2yS0wx/nQ==
X-CSE-MsgGUID: wt/1+5TBRFuRYBdzgXYjCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65625864"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Sep 2024 04:05:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smWmf-000B4Z-2r;
	Fri, 06 Sep 2024 11:05:45 +0000
Date: Fri, 6 Sep 2024 19:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [linux-next:master 6215/10296]
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:173:15: error: implicit
 declaration of function 'devm_regulator_bulk_get_const'; did you mean
 'devm_regulator_bulk_get_enable'?
Message-ID: <202409061909.YZYMDyw6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: aec8485f226c36eb4eea1d489772cd6f2c40144d [6215/10296] drm/panel: add BOE tv101wum-ll2 panel driver
config: parisc-randconfig-r123-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061909.YZYMDyw6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240906/202409061909.YZYMDyw6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061909.YZYMDyw6-lkp@intel.com/

Note: the linux-next/master HEAD 9aaeb87ce1e966169a57f53a02ba05b30880ffb8 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c: In function 'boe_tv101wum_ll2_probe':
>> drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:173:15: error: implicit declaration of function 'devm_regulator_bulk_get_const'; did you mean 'devm_regulator_bulk_get_enable'? [-Wimplicit-function-declaration]
     173 |         ret = devm_regulator_bulk_get_const(&dsi->dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               devm_regulator_bulk_get_enable


vim +173 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c

   162	
   163	static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
   164	{
   165		struct device *dev = &dsi->dev;
   166		struct boe_tv101wum_ll2 *ctx;
   167		int ret;
   168	
   169		ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
   170		if (!ctx)
   171			return -ENOMEM;
   172	
 > 173		ret = devm_regulator_bulk_get_const(&dsi->dev,
   174						ARRAY_SIZE(boe_tv101wum_ll2_supplies),
   175						boe_tv101wum_ll2_supplies,
   176						&ctx->supplies);
   177		if (ret < 0)
   178			return ret;
   179	
   180		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
   181		if (IS_ERR(ctx->reset_gpio))
   182			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   183					     "Failed to get reset-gpios\n");
   184	
   185		ctx->dsi = dsi;
   186		mipi_dsi_set_drvdata(dsi, ctx);
   187	
   188		dsi->lanes = 4;
   189		dsi->format = MIPI_DSI_FMT_RGB888;
   190		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
   191				  MIPI_DSI_MODE_VIDEO_HSE;
   192	
   193		drm_panel_init(&ctx->panel, dev, &boe_tv101wum_ll2_panel_funcs,
   194			       DRM_MODE_CONNECTOR_DSI);
   195		ctx->panel.prepare_prev_first = true;
   196	
   197		ret = drm_panel_of_backlight(&ctx->panel);
   198		if (ret)
   199			return dev_err_probe(dev, ret, "Failed to get backlight\n");
   200	
   201		drm_panel_add(&ctx->panel);
   202	
   203		ret = mipi_dsi_attach(dsi);
   204		if (ret < 0) {
   205			drm_panel_remove(&ctx->panel);
   206			return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
   207		}
   208	
   209		return 0;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
