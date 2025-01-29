Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D447F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738155010; cv=none; b=oLHoWw8WECDAXBsbBe11bZJmKF9+ILilr1fSUjFJyHp/1eP/dcyhZewi6fUW7NHL3RlyIlo8bw0KtJWZtS4QEZROzWzHrG0e3+hhhVwJyqirPaeoLWt9+Qr4XbcawsP3/zWLiee6G9y6EUVnfwqIJLij69rfa4IlZ7fiGNm8cfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738155010; c=relaxed/simple;
	bh=Hvls+t1an8xgeTnez/jI49vR8oq5E3BKaPA5Uo+WQtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3hJDTa+s2pGms3vp9tWT9lH2qQr9G2ddFW4f8+R76ua7/LrK98lD3eUdgYfO2+uKVQBoLTouQzbdYdHtmb6Y5Qkj+ZpoTy4uUChWhn/hRxsAOqRlangNJ4EMlbcBVm2/GEEqrKuwNEzold07D8GUDWHgQkRRKsRWZ/lXfhsdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1xEFjqf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1xEFjqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738155009; x=1769691009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hvls+t1an8xgeTnez/jI49vR8oq5E3BKaPA5Uo+WQtM=;
  b=B1xEFjqfC36q7dZ4fC4f1+ClhidakdBv1P08aZ4LB7PI1wkx7UnZBy3N
   xP9MaiEqo42PXEWnwxH65vww6poHxCCuguPA2IqTSD6RaFcfBLgBVRHhF
   ICmd5rv8nWcuwH7EgfNhbOyvel0Wox4ccksBMslP+4D+Zg4a5ynew0mq4
   CtBOHdxV6HoyF8XIcLKDa/RawubZdUZ/4dpTylefbTAntxMzqMSpX7+sI
   l36COirnmqYxm0EIubh1rQ9/swkq0X5uC0P8grTP0gJnjRMK7d6zieV7+
   GG/swSKouebfhMo++TD1TVvH3XfTWPmB2izPak0CeUEZ5xFtLhsVyJIRl
   w==;
X-CSE-ConnectionGUID: JZl8J3VbR5SvCfBJ3NIKaA==
X-CSE-MsgGUID: LlqeaVuRRzm7wd9Sg/8P3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38549065"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38549065"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 04:50:04 -0800
X-CSE-ConnectionGUID: QDP1rAoNR9mLhdSii6zoZA==
X-CSE-MsgGUID: WdtmpqTNT4GX8xXKCienFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132296951"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jan 2025 04:49:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td7Vy-000ixD-0B;
	Wed, 29 Jan 2025 12:49:54 +0000
Date: Wed, 29 Jan 2025 20:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/14] drm/vc4: move to devm_platform_ioremap_resource()
 usage
Message-ID: <202501292034.DuYmkVfS-lkp@intel.com>
References: <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>

Hi Anusha,

kernel test robot noticed the following build errors:

[auto build test ERROR on c4b9570cfb63501638db720f3bee9f6dfd044b82]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/drm-aspeed-move-to-devm_platform_ioremap_resource-usage/20250129-063524
base:   c4b9570cfb63501638db720f3bee9f6dfd044b82
patch link:    https://lore.kernel.org/r/20250128-cocci-memory-api-v1-13-0d1609a29587%40redhat.com
patch subject: [PATCH 13/14] drm/vc4: move to devm_platform_ioremap_resource() usage
config: i386-buildonly-randconfig-006-20250129 (https://download.01.org/0day-ci/archive/20250129/202501292034.DuYmkVfS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501292034.DuYmkVfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501292034.DuYmkVfS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc5_hdmi_init_resources':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:2961:9: error: 'res' undeclared (first use in this function); did you mean 'ret'?
    2961 |         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
         |         ^~~
         |         ret
   drivers/gpu/drm/vc4/vc4_hdmi.c:2961:9: note: each undeclared identifier is reported only once for each function it appears in


vim +2961 drivers/gpu/drm/vc4/vc4_hdmi.c

33c773eb62eaa1 Maxime Ripard   2020-09-03  2948  
a3dbb1c0165768 Maxime Ripard   2022-07-11  2949  static int vc5_hdmi_init_resources(struct drm_device *drm,
a3dbb1c0165768 Maxime Ripard   2022-07-11  2950  				   struct vc4_hdmi *vc4_hdmi)
8323989140f3e5 Maxime Ripard   2020-09-03  2951  {
8323989140f3e5 Maxime Ripard   2020-09-03  2952  	struct platform_device *pdev = vc4_hdmi->pdev;
8323989140f3e5 Maxime Ripard   2020-09-03  2953  	struct device *dev = &pdev->dev;
25eb441d55d479 Dave Stevenson  2022-06-13  2954  	int ret;
8323989140f3e5 Maxime Ripard   2020-09-03  2955  
6b3da32a2befda Anusha Srivatsa 2025-01-28  2956  	vc4_hdmi->hdmicore_regs = devm_platform_ioremap_resource_byname(pdev,
6b3da32a2befda Anusha Srivatsa 2025-01-28  2957  									"hdmi");
14929c5ae8b6dc Dan Carpenter   2020-09-10  2958  	if (!vc4_hdmi->hdmicore_regs)
14929c5ae8b6dc Dan Carpenter   2020-09-10  2959  		return -ENOMEM;
8323989140f3e5 Maxime Ripard   2020-09-03  2960  
8323989140f3e5 Maxime Ripard   2020-09-03 @2961  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
8323989140f3e5 Maxime Ripard   2020-09-03  2962  	if (!res)
8323989140f3e5 Maxime Ripard   2020-09-03  2963  		return -ENODEV;
8323989140f3e5 Maxime Ripard   2020-09-03  2964  
8323989140f3e5 Maxime Ripard   2020-09-03  2965  	vc4_hdmi->hd_regs = devm_ioremap(dev, res->start, resource_size(res));
14929c5ae8b6dc Dan Carpenter   2020-09-10  2966  	if (!vc4_hdmi->hd_regs)
14929c5ae8b6dc Dan Carpenter   2020-09-10  2967  		return -ENOMEM;
8323989140f3e5 Maxime Ripard   2020-09-03  2968  
8323989140f3e5 Maxime Ripard   2020-09-03  2969  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cec");
8323989140f3e5 Maxime Ripard   2020-09-03  2970  	if (!res)
8323989140f3e5 Maxime Ripard   2020-09-03  2971  		return -ENODEV;
8323989140f3e5 Maxime Ripard   2020-09-03  2972  
8323989140f3e5 Maxime Ripard   2020-09-03  2973  	vc4_hdmi->cec_regs = devm_ioremap(dev, res->start, resource_size(res));
14929c5ae8b6dc Dan Carpenter   2020-09-10  2974  	if (!vc4_hdmi->cec_regs)
14929c5ae8b6dc Dan Carpenter   2020-09-10  2975  		return -ENOMEM;
8323989140f3e5 Maxime Ripard   2020-09-03  2976  
8323989140f3e5 Maxime Ripard   2020-09-03  2977  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "csc");
8323989140f3e5 Maxime Ripard   2020-09-03  2978  	if (!res)
8323989140f3e5 Maxime Ripard   2020-09-03  2979  		return -ENODEV;
8323989140f3e5 Maxime Ripard   2020-09-03  2980  
8323989140f3e5 Maxime Ripard   2020-09-03  2981  	vc4_hdmi->csc_regs = devm_ioremap(dev, res->start, resource_size(res));
14929c5ae8b6dc Dan Carpenter   2020-09-10  2982  	if (!vc4_hdmi->csc_regs)
14929c5ae8b6dc Dan Carpenter   2020-09-10  2983  		return -ENOMEM;
8323989140f3e5 Maxime Ripard   2020-09-03  2984  
8323989140f3e5 Maxime Ripard   2020-09-03  2985  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dvp");
8323989140f3e5 Maxime Ripard   2020-09-03  2986  	if (!res)
8323989140f3e5 Maxime Ripard   2020-09-03  2987  		return -ENODEV;
8323989140f3e5 Maxime Ripard   2020-09-03  2988  
8323989140f3e5 Maxime Ripard   2020-09-03  2989  	vc4_hdmi->dvp_regs = devm_ioremap(dev, res->start, resource_size(res));
14929c5ae8b6dc Dan Carpenter   2020-09-10  2990  	if (!vc4_hdmi->dvp_regs)
14929c5ae8b6dc Dan Carpenter   2020-09-10  2991  		return -ENOMEM;
8323989140f3e5 Maxime Ripard   2020-09-03  2992  
8323989140f3e5 Maxime Ripard   2020-09-03  2993  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
8323989140f3e5 Maxime Ripard   2020-09-03  2994  	if (!res)
8323989140f3e5 Maxime Ripard   2020-09-03  2995  		return -ENODEV;
8323989140f3e5 Maxime Ripard   2020-09-03  2996  
8323989140f3e5 Maxime Ripard   2020-09-03  2997  	vc4_hdmi->phy_regs = devm_ioremap(dev, res->start, resource_size(res));
14929c5ae8b6dc Dan Carpenter   2020-09-10  2998  	if (!vc4_hdmi->phy_regs)
14929c5ae8b6dc Dan Carpenter   2020-09-10  2999  		return -ENOMEM;
8323989140f3e5 Maxime Ripard   2020-09-03  3000  
8323989140f3e5 Maxime Ripard   2020-09-03  3001  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "packet");
8323989140f3e5 Maxime Ripard   2020-09-03  3002  	if (!res)
8323989140f3e5 Maxime Ripard   2020-09-03  3003  		return -ENODEV;
8323989140f3e5 Maxime Ripard   2020-09-03  3004  
8323989140f3e5 Maxime Ripard   2020-09-03  3005  	vc4_hdmi->ram_regs = devm_ioremap(dev, res->start, resource_size(res));
14929c5ae8b6dc Dan Carpenter   2020-09-10  3006  	if (!vc4_hdmi->ram_regs)
14929c5ae8b6dc Dan Carpenter   2020-09-10  3007  		return -ENOMEM;
8323989140f3e5 Maxime Ripard   2020-09-03  3008  
8323989140f3e5 Maxime Ripard   2020-09-03  3009  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rm");
8323989140f3e5 Maxime Ripard   2020-09-03  3010  	if (!res)
8323989140f3e5 Maxime Ripard   2020-09-03  3011  		return -ENODEV;
8323989140f3e5 Maxime Ripard   2020-09-03  3012  
8323989140f3e5 Maxime Ripard   2020-09-03  3013  	vc4_hdmi->rm_regs = devm_ioremap(dev, res->start, resource_size(res));
14929c5ae8b6dc Dan Carpenter   2020-09-10  3014  	if (!vc4_hdmi->rm_regs)
14929c5ae8b6dc Dan Carpenter   2020-09-10  3015  		return -ENOMEM;
8323989140f3e5 Maxime Ripard   2020-09-03  3016  
8323989140f3e5 Maxime Ripard   2020-09-03  3017  	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
8323989140f3e5 Maxime Ripard   2020-09-03  3018  	if (IS_ERR(vc4_hdmi->hsm_clock)) {
59ac702a932028 Stefan Wahren   2024-08-21  3019  		drm_err(drm, "Failed to get HDMI state machine clock\n");
8323989140f3e5 Maxime Ripard   2020-09-03  3020  		return PTR_ERR(vc4_hdmi->hsm_clock);
8323989140f3e5 Maxime Ripard   2020-09-03  3021  	}
8323989140f3e5 Maxime Ripard   2020-09-03  3022  
8323989140f3e5 Maxime Ripard   2020-09-03  3023  	vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
8323989140f3e5 Maxime Ripard   2020-09-03  3024  	if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
59ac702a932028 Stefan Wahren   2024-08-21  3025  		drm_err(drm, "Failed to get pixel bvb clock\n");
8323989140f3e5 Maxime Ripard   2020-09-03  3026  		return PTR_ERR(vc4_hdmi->pixel_bvb_clock);
8323989140f3e5 Maxime Ripard   2020-09-03  3027  	}
8323989140f3e5 Maxime Ripard   2020-09-03  3028  
8323989140f3e5 Maxime Ripard   2020-09-03  3029  	vc4_hdmi->audio_clock = devm_clk_get(dev, "audio");
8323989140f3e5 Maxime Ripard   2020-09-03  3030  	if (IS_ERR(vc4_hdmi->audio_clock)) {
59ac702a932028 Stefan Wahren   2024-08-21  3031  		drm_err(drm, "Failed to get audio clock\n");
8323989140f3e5 Maxime Ripard   2020-09-03  3032  		return PTR_ERR(vc4_hdmi->audio_clock);
8323989140f3e5 Maxime Ripard   2020-09-03  3033  	}
8323989140f3e5 Maxime Ripard   2020-09-03  3034  
23b7eb5c12b359 Maxime Ripard   2021-01-11  3035  	vc4_hdmi->cec_clock = devm_clk_get(dev, "cec");
23b7eb5c12b359 Maxime Ripard   2021-01-11  3036  	if (IS_ERR(vc4_hdmi->cec_clock)) {
59ac702a932028 Stefan Wahren   2024-08-21  3037  		drm_err(drm, "Failed to get CEC clock\n");
23b7eb5c12b359 Maxime Ripard   2021-01-11  3038  		return PTR_ERR(vc4_hdmi->cec_clock);
23b7eb5c12b359 Maxime Ripard   2021-01-11  3039  	}
23b7eb5c12b359 Maxime Ripard   2021-01-11  3040  
8323989140f3e5 Maxime Ripard   2020-09-03  3041  	vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
8323989140f3e5 Maxime Ripard   2020-09-03  3042  	if (IS_ERR(vc4_hdmi->reset)) {
59ac702a932028 Stefan Wahren   2024-08-21  3043  		drm_err(drm, "Failed to get HDMI reset line\n");
8323989140f3e5 Maxime Ripard   2020-09-03  3044  		return PTR_ERR(vc4_hdmi->reset);
8323989140f3e5 Maxime Ripard   2020-09-03  3045  	}
8323989140f3e5 Maxime Ripard   2020-09-03  3046  
a3dbb1c0165768 Maxime Ripard   2022-07-11  3047  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hdmi_regset, VC4_HDMI);
25eb441d55d479 Dave Stevenson  2022-06-13  3048  	if (ret)
25eb441d55d479 Dave Stevenson  2022-06-13  3049  		return ret;
25eb441d55d479 Dave Stevenson  2022-06-13  3050  
a3dbb1c0165768 Maxime Ripard   2022-07-11  3051  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hd_regset, VC4_HD);
25eb441d55d479 Dave Stevenson  2022-06-13  3052  	if (ret)
25eb441d55d479 Dave Stevenson  2022-06-13  3053  		return ret;
25eb441d55d479 Dave Stevenson  2022-06-13  3054  
a3dbb1c0165768 Maxime Ripard   2022-07-11  3055  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->cec_regset, VC5_CEC);
25eb441d55d479 Dave Stevenson  2022-06-13  3056  	if (ret)
25eb441d55d479 Dave Stevenson  2022-06-13  3057  		return ret;
25eb441d55d479 Dave Stevenson  2022-06-13  3058  
a3dbb1c0165768 Maxime Ripard   2022-07-11  3059  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->csc_regset, VC5_CSC);
25eb441d55d479 Dave Stevenson  2022-06-13  3060  	if (ret)
25eb441d55d479 Dave Stevenson  2022-06-13  3061  		return ret;
25eb441d55d479 Dave Stevenson  2022-06-13  3062  
a3dbb1c0165768 Maxime Ripard   2022-07-11  3063  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->dvp_regset, VC5_DVP);
25eb441d55d479 Dave Stevenson  2022-06-13  3064  	if (ret)
25eb441d55d479 Dave Stevenson  2022-06-13  3065  		return ret;
25eb441d55d479 Dave Stevenson  2022-06-13  3066  
a3dbb1c0165768 Maxime Ripard   2022-07-11  3067  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->phy_regset, VC5_PHY);
25eb441d55d479 Dave Stevenson  2022-06-13  3068  	if (ret)
25eb441d55d479 Dave Stevenson  2022-06-13  3069  		return ret;
25eb441d55d479 Dave Stevenson  2022-06-13  3070  
a3dbb1c0165768 Maxime Ripard   2022-07-11  3071  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->ram_regset, VC5_RAM);
25eb441d55d479 Dave Stevenson  2022-06-13  3072  	if (ret)
25eb441d55d479 Dave Stevenson  2022-06-13  3073  		return ret;
25eb441d55d479 Dave Stevenson  2022-06-13  3074  
a3dbb1c0165768 Maxime Ripard   2022-07-11  3075  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->rm_regset, VC5_RM);
25eb441d55d479 Dave Stevenson  2022-06-13  3076  	if (ret)
25eb441d55d479 Dave Stevenson  2022-06-13  3077  		return ret;
25eb441d55d479 Dave Stevenson  2022-06-13  3078  
8323989140f3e5 Maxime Ripard   2020-09-03  3079  	return 0;
c8b75bca92cbf0 Eric Anholt     2015-03-02  3080  }
c8b75bca92cbf0 Eric Anholt     2015-03-02  3081  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
