Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9518A6DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738143769; cv=none; b=sUsXOz+Uu6l0wyzSWT8kNQsI2ZDk/I99QUuPyeGM3QgTaxcUZb5m+rzSPnnL9ffPHAE2pjofXEpob5ip5gUQHp/nSlIn7UOb38TdvzDZ1iroeQj4qBNJKKLsTmKIMxKH1LqgVylimZ1YV1ukesqJUC4QrGp6II3ycM/9rfernKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738143769; c=relaxed/simple;
	bh=0i5qekh+bMYbJpIrHFkieXTNHYG/CGwTEgO5X3rin2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgbtWEvBNmWwn8w7VNzJp/jk3x7MWgxAB7h2T+IkPAk//wzfIkgHMg8Qn2AFh3OoquBAhJE2XbFy4sY8prkfVhmCHslXz1Hc2sxVg12e9ZNU6pz7o73FUdykIepzK/rrjGFp5J2JGl7fwi/2ZZC9DifUgl6/WThXfQL9od4Ef4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MM1J4ASf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MM1J4ASf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738143768; x=1769679768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0i5qekh+bMYbJpIrHFkieXTNHYG/CGwTEgO5X3rin2s=;
  b=MM1J4ASfc1IAwWYbHKaptEJDrBFlnWa1xju7VDq9n2c1kra/dWdeDaWz
   jMVcDq95iM5xKSpdbuwPJuHHxR6Cgud0Hy0LtdTHR/dI8zlw96YMYT+sS
   LW3e/EsEwZtl708KxKbOvQSlO7f4z42u0DzbHvJrwgx2rl/09dUYzYUBX
   YYw58meGFuQMDe0W5TjFFvZLFU1RMwXr8svDw3DtRgwSVC9MIliM8A3fp
   lHECQM3s44p7fVW+jog692UV+dtoD8j8fszH7dWVQtJcWtd4AAp880cuO
   Jp65QbWV5TbUfmgR3dwZnQRWIj3nePTrbsKUim92Bq7yUzTC7XrxCRUgw
   g==;
X-CSE-ConnectionGUID: tTIAW39wQHaCuSqp5MzGIQ==
X-CSE-MsgGUID: bAx5ZZe7RCqeP6TsyASeyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="56185356"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="56185356"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 01:42:47 -0800
X-CSE-ConnectionGUID: npbIwedVQlyhHqIi0jjcGw==
X-CSE-MsgGUID: fSSzpNr4TLGbV3TSshUSuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146180461"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2025 01:42:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td4aj-000inz-27;
	Wed, 29 Jan 2025 09:42:37 +0000
Date: Wed, 29 Jan 2025 17:41:58 +0800
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
Subject: Re: [PATCH 07/14] drm/rockchip: move to
 devm_platform_ioremap_resource() usage
Message-ID: <202501291738.7DMUdSBJ-lkp@intel.com>
References: <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>

Hi Anusha,

kernel test robot noticed the following build errors:

[auto build test ERROR on c4b9570cfb63501638db720f3bee9f6dfd044b82]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/drm-aspeed-move-to-devm_platform_ioremap_resource-usage/20250129-063524
base:   c4b9570cfb63501638db720f3bee9f6dfd044b82
patch link:    https://lore.kernel.org/r/20250128-cocci-memory-api-v1-7-0d1609a29587%40redhat.com
patch subject: [PATCH 07/14] drm/rockchip: move to devm_platform_ioremap_resource() usage
config: loongarch-randconfig-001-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291738.7DMUdSBJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291738.7DMUdSBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291738.7DMUdSBJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/rockchip_drm_vop.c: In function 'vop_bind':
>> drivers/gpu/drm/rockchip/rockchip_drm_vop.c:2212:34: error: 'res' undeclared (first use in this function); did you mean 'ret'?
    2212 |         vop->len = resource_size(res);
         |                                  ^~~
         |                                  ret
   drivers/gpu/drm/rockchip/rockchip_drm_vop.c:2212:34: note: each undeclared identifier is reported only once for each function it appears in


vim +2212 drivers/gpu/drm/rockchip/rockchip_drm_vop.c

69c34e41f5d4e8 Yakir Yang          2016-07-24  2183  
2048e3286f347d Mark Yao            2014-08-22  2184  static int vop_bind(struct device *dev, struct device *master, void *data)
2048e3286f347d Mark Yao            2014-08-22  2185  {
2048e3286f347d Mark Yao            2014-08-22  2186  	struct platform_device *pdev = to_platform_device(dev);
2048e3286f347d Mark Yao            2014-08-22  2187  	const struct vop_data *vop_data;
2048e3286f347d Mark Yao            2014-08-22  2188  	struct drm_device *drm_dev = data;
2048e3286f347d Mark Yao            2014-08-22  2189  	struct vop *vop;
3ea68922fc4148 Heiko Stuebner      2015-04-20  2190  	int ret, irq;
2048e3286f347d Mark Yao            2014-08-22  2191  
a67719d182291b Mark Yao            2015-12-15  2192  	vop_data = of_device_get_match_data(dev);
2048e3286f347d Mark Yao            2014-08-22  2193  	if (!vop_data)
2048e3286f347d Mark Yao            2014-08-22  2194  		return -ENODEV;
2048e3286f347d Mark Yao            2014-08-22  2195  
2048e3286f347d Mark Yao            2014-08-22  2196  	/* Allocate vop struct and its vop_win array */
29adeb4f954b2e Gustavo A. R. Silva 2018-08-26  2197  	vop = devm_kzalloc(dev, struct_size(vop, win, vop_data->win_size),
29adeb4f954b2e Gustavo A. R. Silva 2018-08-26  2198  			   GFP_KERNEL);
2048e3286f347d Mark Yao            2014-08-22  2199  	if (!vop)
2048e3286f347d Mark Yao            2014-08-22  2200  		return -ENOMEM;
2048e3286f347d Mark Yao            2014-08-22  2201  
2048e3286f347d Mark Yao            2014-08-22  2202  	vop->dev = dev;
2048e3286f347d Mark Yao            2014-08-22  2203  	vop->data = vop_data;
2048e3286f347d Mark Yao            2014-08-22  2204  	vop->drm_dev = drm_dev;
2048e3286f347d Mark Yao            2014-08-22  2205  	dev_set_drvdata(dev, vop);
2048e3286f347d Mark Yao            2014-08-22  2206  
2048e3286f347d Mark Yao            2014-08-22  2207  	vop_win_init(vop);
2048e3286f347d Mark Yao            2014-08-22  2208  
a9f1c21b76a84b Anusha Srivatsa     2025-01-28  2209  	vop->regs = devm_platform_ioremap_resource(pdev, 0);
2048e3286f347d Mark Yao            2014-08-22  2210  	if (IS_ERR(vop->regs))
2048e3286f347d Mark Yao            2014-08-22  2211  		return PTR_ERR(vop->regs);
f8c242908ad15b Yang Yingliang      2022-04-22 @2212  	vop->len = resource_size(res);
2048e3286f347d Mark Yao            2014-08-22  2213  
b23ab6ac6d768f Ezequiel Garcia     2019-10-10  2214  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
b23ab6ac6d768f Ezequiel Garcia     2019-10-10  2215  	if (res) {
7ae7a6211fe725 Hugh Cole-Baker     2021-10-19  2216  		if (vop_data->lut_size != 1024 && vop_data->lut_size != 256) {
7ae7a6211fe725 Hugh Cole-Baker     2021-10-19  2217  			DRM_DEV_ERROR(dev, "unsupported gamma LUT size %d\n", vop_data->lut_size);
b23ab6ac6d768f Ezequiel Garcia     2019-10-10  2218  			return -EINVAL;
b23ab6ac6d768f Ezequiel Garcia     2019-10-10  2219  		}
b23ab6ac6d768f Ezequiel Garcia     2019-10-10  2220  		vop->lut_regs = devm_ioremap_resource(dev, res);
b23ab6ac6d768f Ezequiel Garcia     2019-10-10  2221  		if (IS_ERR(vop->lut_regs))
b23ab6ac6d768f Ezequiel Garcia     2019-10-10  2222  			return PTR_ERR(vop->lut_regs);
b23ab6ac6d768f Ezequiel Garcia     2019-10-10  2223  	}
b23ab6ac6d768f Ezequiel Garcia     2019-10-10  2224  
2048e3286f347d Mark Yao            2014-08-22  2225  	vop->regsbak = devm_kzalloc(dev, vop->len, GFP_KERNEL);
2048e3286f347d Mark Yao            2014-08-22  2226  	if (!vop->regsbak)
2048e3286f347d Mark Yao            2014-08-22  2227  		return -ENOMEM;
2048e3286f347d Mark Yao            2014-08-22  2228  
3ea68922fc4148 Heiko Stuebner      2015-04-20  2229  	irq = platform_get_irq(pdev, 0);
3ea68922fc4148 Heiko Stuebner      2015-04-20  2230  	if (irq < 0) {
d8dd68045c5879 Haneen Mohammed     2017-09-15  2231  		DRM_DEV_ERROR(dev, "cannot find irq for vop\n");
3ea68922fc4148 Heiko Stuebner      2015-04-20  2232  		return irq;
2048e3286f347d Mark Yao            2014-08-22  2233  	}
3ea68922fc4148 Heiko Stuebner      2015-04-20  2234  	vop->irq = (unsigned int)irq;
2048e3286f347d Mark Yao            2014-08-22  2235  
2048e3286f347d Mark Yao            2014-08-22  2236  	spin_lock_init(&vop->reg_lock);
2048e3286f347d Mark Yao            2014-08-22  2237  	spin_lock_init(&vop->irq_lock);
e334d48b2cd4aa zain wang           2018-03-09  2238  	mutex_init(&vop->vop_lock);
2048e3286f347d Mark Yao            2014-08-22  2239  
2048e3286f347d Mark Yao            2014-08-22  2240  	ret = vop_create_crtc(vop);
2048e3286f347d Mark Yao            2014-08-22  2241  	if (ret)
5f9e93fed4d45e Marc Zyngier        2018-02-20  2242  		return ret;
2048e3286f347d Mark Yao            2014-08-22  2243  
2048e3286f347d Mark Yao            2014-08-22  2244  	pm_runtime_enable(&pdev->dev);
5182c1a556d7ff Yakir Yang          2016-07-24  2245  
5e570373c015b6 Jeffy Chen          2017-04-06  2246  	ret = vop_initial(vop);
5e570373c015b6 Jeffy Chen          2017-04-06  2247  	if (ret < 0) {
d8dd68045c5879 Haneen Mohammed     2017-09-15  2248  		DRM_DEV_ERROR(&pdev->dev,
d8dd68045c5879 Haneen Mohammed     2017-09-15  2249  			      "cannot initial vop dev - err %d\n", ret);
5e570373c015b6 Jeffy Chen          2017-04-06  2250  		goto err_disable_pm_runtime;
5e570373c015b6 Jeffy Chen          2017-04-06  2251  	}
5e570373c015b6 Jeffy Chen          2017-04-06  2252  
5f9e93fed4d45e Marc Zyngier        2018-02-20  2253  	ret = devm_request_irq(dev, vop->irq, vop_isr,
5f9e93fed4d45e Marc Zyngier        2018-02-20  2254  			       IRQF_SHARED, dev_name(dev), vop);
5f9e93fed4d45e Marc Zyngier        2018-02-20  2255  	if (ret)
5f9e93fed4d45e Marc Zyngier        2018-02-20  2256  		goto err_disable_pm_runtime;
5f9e93fed4d45e Marc Zyngier        2018-02-20  2257  
1f0f0151517278 Sandy Huang         2018-08-30  2258  	if (vop->data->feature & VOP_FEATURE_INTERNAL_RGB) {
03db8f25cf16c5 Michael Riesch      2023-01-24  2259  		vop->rgb = rockchip_rgb_init(dev, &vop->crtc, vop->drm_dev, 0);
1f0f0151517278 Sandy Huang         2018-08-30  2260  		if (IS_ERR(vop->rgb)) {
1f0f0151517278 Sandy Huang         2018-08-30  2261  			ret = PTR_ERR(vop->rgb);
1f0f0151517278 Sandy Huang         2018-08-30  2262  			goto err_disable_pm_runtime;
1f0f0151517278 Sandy Huang         2018-08-30  2263  		}
1f0f0151517278 Sandy Huang         2018-08-30  2264  	}
1f0f0151517278 Sandy Huang         2018-08-30  2265  
421be3ee36a497 Robin Murphy        2022-04-05  2266  	rockchip_drm_dma_init_device(drm_dev, dev);
421be3ee36a497 Robin Murphy        2022-04-05  2267  
2048e3286f347d Mark Yao            2014-08-22  2268  	return 0;
8c763c9b1072c9 Sean Paul           2016-09-16  2269  
5e570373c015b6 Jeffy Chen          2017-04-06  2270  err_disable_pm_runtime:
5e570373c015b6 Jeffy Chen          2017-04-06  2271  	pm_runtime_disable(&pdev->dev);
5e570373c015b6 Jeffy Chen          2017-04-06  2272  	vop_destroy_crtc(vop);
8c763c9b1072c9 Sean Paul           2016-09-16  2273  	return ret;
2048e3286f347d Mark Yao            2014-08-22  2274  }
2048e3286f347d Mark Yao            2014-08-22  2275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
