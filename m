Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07487BA4B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 01:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730509392; cv=none; b=kxQr71FnLNgzTPwCTvg638vYD3U20UA6R13+nnCX8WiogeZ1LlDTCOGtulP/JFbA2YQ/LBTpOR37+gAuzrMdE/kQxU7uixHSbp1tVvLuudPcC4WnPK3xChExm3/oLxvyPZhuvIQuvK8FjjBuIQRJxq0Z7x5fJtj/qUxE/NnqM08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730509392; c=relaxed/simple;
	bh=1RPbTVtZrNSH2J9kRLVfqqDfG67h+u69mXd0zc4zuto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3qic4/qRcZU4tUqr+pMiHf5tMgT1Z/Jx4IJkxVf83vbAeUowaNwUH0CvAlKvi1EUCD1RVWBDg0upkqakHZNeCbIlLc1RDZKEOVEk1HT7FC2r1XW8XMSkdk0szezKI9NiZcUQ5WvmA5EUjHQSzqmwlDGcVTGrMYmfA3adM76Ofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GATgM/pP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GATgM/pP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730509391; x=1762045391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1RPbTVtZrNSH2J9kRLVfqqDfG67h+u69mXd0zc4zuto=;
  b=GATgM/pPHiKRkBRpAU/MYPzySKvMyXnmzB0c+wJCoYnWCEKUZzkHi1fb
   NYKe5FK3Cmx8ehbWzryQxyfFlt5UMtfcVd94m/8PsczKgLrND03bepDR4
   A/EWoN6wkFTe18HiniHtpfSKhdH9088GzeetrhcllKz8vT7kEoNHm3AkP
   kxz2U2+E5lLJxr6JJ2105b7x8SkAxQEFi8/4+9RVGzAcOo/17008vS2RC
   hQsliceIlSfQXUG3MrCELVDIYHqY/6gg+45iaKWIglWszaCVD1rSItXS2
   Tu54NvEDtCMupf5xq8DIrwPPmXyeyzT9MXOIRqI7zB23m65UQjOUjYCHa
   A==;
X-CSE-ConnectionGUID: s5X+SsaSTZGltGxMHMTB/Q==
X-CSE-MsgGUID: 9yPdyNqQTgKLsBo3T3E7JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="34075523"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="34075523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 18:03:10 -0700
X-CSE-ConnectionGUID: gpFRMeBwRrm2FoiAl4BbUQ==
X-CSE-MsgGUID: X90N9N+iS3WtPcJrfymvwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="82649776"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2024 18:03:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t72Xh-000iFP-18;
	Sat, 02 Nov 2024 01:03:05 +0000
Date: Sat, 2 Nov 2024 09:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel@pengutronix.de,
	Rouven Czerwinski <r.czerwinski@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/3] drm/panel: add LXD M9189A panel driver
Message-ID: <202411020816.Nb9aEvtO-lkp@intel.com>
References: <20241025141130.3179166-3-r.czerwinski@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025141130.3179166-3-r.czerwinski@pengutronix.de>

Hi Rouven,

kernel test robot noticed the following build errors:

[auto build test ERROR on c2ee9f594da826bea183ed14f2cc029c719bf4da]

url:    https://github.com/intel-lab-lkp/linux/commits/Rouven-Czerwinski/dt-bindings-display-panel-add-YAML-schema-for-LXD-M9189A/20241025-221252
base:   c2ee9f594da826bea183ed14f2cc029c719bf4da
patch link:    https://lore.kernel.org/r/20241025141130.3179166-3-r.czerwinski%40pengutronix.de
patch subject: [PATCH v2 3/3] drm/panel: add LXD M9189A panel driver
config: arm-randconfig-r062-20241102 (https://download.01.org/0day-ci/archive/20241102/202411020816.Nb9aEvtO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020816.Nb9aEvtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020816.Nb9aEvtO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-lxd-m9189a.c:173:29: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
     173 |                 return dev_err_probe(dev, ret, "Failed to get regulator\n");
         |                                           ^~~
   drivers/gpu/drm/panel/panel-lxd-m9189a.c:165:9: note: initialize the variable 'ret' to silence this warning
     165 |         int ret;
         |                ^
         |                 = 0
   1 error generated.


vim +/ret +173 drivers/gpu/drm/panel/panel-lxd-m9189a.c

   160	
   161	static int lxd_m9189_probe(struct mipi_dsi_device *dsi)
   162	{
   163		struct device *dev = &dsi->dev;
   164		struct m9189_panel *m9189;
   165		int ret;
   166	
   167		m9189 = devm_kzalloc(dev, sizeof(*m9189), GFP_KERNEL);
   168		if (!m9189)
   169			return -ENOMEM;
   170	
   171		m9189->supply = devm_regulator_get(dev, "vdd");
   172		if (IS_ERR(m9189->supply))
 > 173			return dev_err_probe(dev, ret, "Failed to get regulator\n");
   174	
   175		m9189->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
   176		if (IS_ERR(m9189->reset_gpio))
   177			return dev_err_probe(dev, PTR_ERR(m9189->reset_gpio),
   178					     "Failed to get reset-gpios\n");
   179	
   180		m9189->standby_gpio = devm_gpiod_get(dev, "standby", GPIOD_OUT_LOW);
   181		if (IS_ERR(m9189->standby_gpio))
   182			return dev_err_probe(dev, PTR_ERR(m9189->standby_gpio),
   183					     "Failed to get standby-gpios\n");
   184	
   185		m9189->dsi = dsi;
   186		mipi_dsi_set_drvdata(dsi, m9189);
   187	
   188		dsi->lanes = 4;
   189		dsi->format = MIPI_DSI_FMT_RGB888;
   190		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
   191	
   192		drm_panel_init(&m9189->panel, dev, &m9189_panel_funcs,
   193			       DRM_MODE_CONNECTOR_DSI);
   194		m9189->panel.prepare_prev_first = true;
   195	
   196		ret = drm_panel_of_backlight(&m9189->panel);
   197		if (ret)
   198			return dev_err_probe(dev, ret, "Failed to get backlight\n");
   199	
   200		drm_panel_add(&m9189->panel);
   201	
   202		ret = mipi_dsi_attach(dsi);
   203		if (ret < 0) {
   204			dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
   205			drm_panel_remove(&m9189->panel);
   206			return ret;
   207		}
   208	
   209		return 0;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
