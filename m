Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613E41E32CF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 14:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772980664; cv=none; b=fKr9HaW7NPM1O3g+IcgsXu1yyZBF1sP6awoE5eJd/hKo1GD5ihtM99T8l8T9frNFeCClGPlW0bZ744vtFzOdckQrl4ZPvrhZpVpG5cxCNBj5u1aSvMJiDET2G1ZKUNORL865WDH4+mbB325l89al0cFcpNQWYoikE1tuYzM+zgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772980664; c=relaxed/simple;
	bh=texYecOx1G6VAtPnt/oo5M8yOZE/OMC31g9BmuVmDjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umYH6IDfQJGehMqy1x7Z/YXFGDuAcHFo8ttMQzZZHwcc8alRxLpEmNUBV5Fim7UFywBMHGLvm84+H/GC/uQzzgEjjZRuNDEPAaaLjrcrrDfh8omC74OaGrm30zFYg5RVmT7TB1m3PyxRqwhTDWLcpAjcHT/z2hzsk8zC1Jxi89A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GoWVOWpw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GoWVOWpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772980662; x=1804516662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=texYecOx1G6VAtPnt/oo5M8yOZE/OMC31g9BmuVmDjo=;
  b=GoWVOWpwg22BHqQyK9L0InPLAn2p1CSpIOQ0G6Eocm4XRDQm2rj4R9+Z
   PeYmkU21ovli0pGB9Cc54feF8XaLGjQUKgummBt/MdQE7in9Y52TzSdm9
   5Y9DoxMR5pmBkI0tNE/CAz/HMly9bALHO1yTLBJH9llnJ5Vd550G8yD3I
   86NI0E9DsSVVVLHQ/wKeG/3nxPmdpvI9SObtUxKCnVdjpCRd3t38BiHzS
   V4X0LfRvxqrfPVrCUQct3kuXZAR6P3z4QjLjWPsrImr8lPuc6zoUNsCjO
   rP+qCT4S4kDa8DdtzjGKYAAu5qx7LJ30P8eTi8YIx7lNkiZ5FYmVfSDuo
   w==;
X-CSE-ConnectionGUID: s8uGNRlNS5e8kxoVxmiBBQ==
X-CSE-MsgGUID: A9Oad3TWS/6elfg5sq6uNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77874576"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="77874576"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 07:37:42 -0700
X-CSE-ConnectionGUID: WQ/8v7cSQzGZqRBE+4dG4g==
X-CSE-MsgGUID: CT/JL0eFTuavVzxt61I/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="219455261"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2026 07:37:37 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzFGA-000000003Am-0sOb;
	Sun, 08 Mar 2026 14:37:34 +0000
Date: Sun, 8 Mar 2026 22:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Koskovich <AKoskovich@pm.me>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH 2/2] drm/panel: Add support for Tianma TA066VVHM03 panel
Message-ID: <202603082223.61KVemAP-lkp@intel.com>
References: <20260308-tianma-ta066vvhm03-v1-2-869fac443b20@pm.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-tianma-ta066vvhm03-v1-2-869fac443b20@pm.me>

Hi Alexander,

kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Koskovich/dt-bindings-display-panel-Document-Tianma-TA066VVHM03/20260308-140525
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260308-tianma-ta066vvhm03-v1-2-869fac443b20%40pm.me
patch subject: [PATCH 2/2] drm/panel: Add support for Tianma TA066VVHM03 panel
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603082223.61KVemAP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082223.61KVemAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082223.61KVemAP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c: In function 'tianma_ta066vvhm03_probe':
>> drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c:335:12: error: 'struct mipi_dsi_device' has no member named 'dsc_slice_per_pkt'
     335 |         dsi->dsc_slice_per_pkt = 2;
         |            ^~


vim +335 drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c

   286	
   287	static int tianma_ta066vvhm03_probe(struct mipi_dsi_device *dsi)
   288	{
   289		struct device *dev = &dsi->dev;
   290		struct tianma_ta066vvhm03 *ctx;
   291		int ret;
   292	
   293		ctx = devm_drm_panel_alloc(dev, struct tianma_ta066vvhm03, panel,
   294					   &tianma_ta066vvhm03_panel_funcs,
   295					   DRM_MODE_CONNECTOR_DSI);
   296		if (IS_ERR(ctx))
   297			return PTR_ERR(ctx);
   298	
   299		ret = devm_regulator_bulk_get_const(dev,
   300						    ARRAY_SIZE(tianma_ta066vvhm03_supplies),
   301						    tianma_ta066vvhm03_supplies,
   302						    &ctx->supplies);
   303		if (ret < 0)
   304			return ret;
   305	
   306		ctx->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
   307		if (IS_ERR(ctx->enable_gpio))
   308			return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
   309					     "Failed to get enable-gpios\n");
   310	
   311		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   312		if (IS_ERR(ctx->reset_gpio))
   313			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   314					     "Failed to get reset-gpios\n");
   315	
   316		ctx->dsi = dsi;
   317		mipi_dsi_set_drvdata(dsi, ctx);
   318	
   319		dsi->lanes = 4;
   320		dsi->format = MIPI_DSI_FMT_RGB888;
   321		dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
   322				  MIPI_DSI_CLOCK_NON_CONTINUOUS;
   323	
   324		ctx->panel.prepare_prev_first = true;
   325	
   326		ctx->panel.backlight = tianma_ta066vvhm03_create_backlight(dsi);
   327		if (IS_ERR(ctx->panel.backlight))
   328			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
   329					     "Failed to create backlight\n");
   330	
   331		drm_panel_add(&ctx->panel);
   332	
   333		/* This panel only supports DSC; unconditionally enable it */
   334		dsi->dsc = &ctx->dsc;
 > 335		dsi->dsc_slice_per_pkt = 2;
   336	
   337		ctx->dsc.dsc_version_major = 1;
   338		ctx->dsc.dsc_version_minor = 1;
   339	
   340		ctx->dsc.slice_height = 20;
   341		ctx->dsc.slice_width = 540;
   342		WARN_ON(1080 % ctx->dsc.slice_width);
   343		ctx->dsc.slice_count = 1080 / ctx->dsc.slice_width;
   344		ctx->dsc.bits_per_component = 10;
   345		ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
   346		ctx->dsc.block_pred_enable = true;
   347	
   348		ret = mipi_dsi_attach(dsi);
   349		if (ret < 0) {
   350			drm_panel_remove(&ctx->panel);
   351			return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
   352		}
   353	
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
