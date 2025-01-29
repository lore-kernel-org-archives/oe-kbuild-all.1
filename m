Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB712D627
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738142509; cv=none; b=dMrjLL+fM+DMf0tLHW8tdN8RLsugFp8bt4aN9Nz6jIfYAEbHFM9eJAMf+2m4UZ0AiWf0dq95leAhP3U2d9h1XYjzIlvfvJZPfUVY97ns8IbHRQHkJX92G0A9+1Hii3tZ3ECsMW70/WzUslrY0n85goo/sic80vtDbRtzipdOkZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738142509; c=relaxed/simple;
	bh=4Zfe+xk81gVPdpJJoFc216R1nJHu5ZSHh/ShR1p8ZtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVIHeXSKTXZmIUKsh+8bv1ZE8CbyRk66h258ZMF/Fn+y2UqwbCjqGjQvWm35/jpC7kM/zdrMzJBXQhrJOlxcqJaFnSCbMi7xzD58Ot/WiGP4a/qOvoxjtCTVbrMyTmSFQ/vzXciaJ4XLAEum9GD/CSfiEdHXCorSBOqB1ZGdvNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyDhj6Ly; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyDhj6Ly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738142507; x=1769678507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Zfe+xk81gVPdpJJoFc216R1nJHu5ZSHh/ShR1p8ZtA=;
  b=fyDhj6Lyafi8+GAwMJtSotRiTGnAKkjaCWBR/g8aiaHhWqzc/ZOs0Yef
   O7GIsLB/BvtDMXXM27GTJIc2EFZUi5g/1BhzfikExzw9FDtlCupdCzszN
   LweMgPH/7WdEWn1lgl7h6mIQOm8UhKsNHRSrD3ubq1L02xNqv+1V/7iFS
   F/L2rJSA6R/wNO3eFDszXpR9rVzQ5MYnixBnrM2lG0ortjpcJ0KR6gEfT
   2x/wF4dbFehZa6+xCbvIQykCAs7mFTKk8pT7oslJ5NfGPFRKzrIKaYGpm
   BHh2JxXBYpFX4GrStBRxnPfJ3+RYQqkyR15gnVAFWtGvsMhEuLVykKnw8
   w==;
X-CSE-ConnectionGUID: VfezI6NmRx6UTa8lyREFgA==
X-CSE-MsgGUID: ypCLcU5gSkG+MyrF5nsJQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42305397"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="42305397"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 01:21:46 -0800
X-CSE-ConnectionGUID: osFVEZx+TRCA5qLmMB0/Bg==
X-CSE-MsgGUID: EMZ0S6JyQgKsc1TlA40shw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109433459"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Jan 2025 01:21:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td4GO-000inL-0Y;
	Wed, 29 Jan 2025 09:21:36 +0000
Date: Wed, 29 Jan 2025 17:20:41 +0800
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
Subject: Re: [PATCH 09/14] drm/sti: move to devm_platform_ioremap_resource()
 usage
Message-ID: <202501291706.fN5l7Eii-lkp@intel.com>
References: <20250128-cocci-memory-api-v1-9-0d1609a29587@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-cocci-memory-api-v1-9-0d1609a29587@redhat.com>

Hi Anusha,

kernel test robot noticed the following build errors:

[auto build test ERROR on c4b9570cfb63501638db720f3bee9f6dfd044b82]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/drm-aspeed-move-to-devm_platform_ioremap_resource-usage/20250129-063524
base:   c4b9570cfb63501638db720f3bee9f6dfd044b82
patch link:    https://lore.kernel.org/r/20250128-cocci-memory-api-v1-9-0d1609a29587%40redhat.com
patch subject: [PATCH 09/14] drm/sti: move to devm_platform_ioremap_resource() usage
config: csky-randconfig-002-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291706.fN5l7Eii-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291706.fN5l7Eii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291706.fN5l7Eii-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/sti/sti_hda.c: In function 'sti_hda_probe':
>> drivers/gpu/drm/sti/sti_hda.c:756:9: error: 'res' undeclared (first use in this function)
     756 |         res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
         |         ^~~
   drivers/gpu/drm/sti/sti_hda.c:756:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/res +756 drivers/gpu/drm/sti/sti_hda.c

c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  739  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  740  static int sti_hda_probe(struct platform_device *pdev)
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  741  {
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  742  	struct device *dev = &pdev->dev;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  743  	struct sti_hda *hda;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  744  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  745  	DRM_INFO("%s\n", __func__);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  746  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  747  	hda = devm_kzalloc(dev, sizeof(*hda), GFP_KERNEL);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  748  	if (!hda)
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  749  		return -ENOMEM;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  750  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  751  	hda->dev = pdev->dev;
9235f657a03071 Anusha Srivatsa   2025-01-28  752  	hda->regs = devm_platform_ioremap_resource_byname(pdev, "hda-reg");
5024a2b7ae9a92 Wei Yongjun       2014-08-26  753  	if (!hda->regs)
5024a2b7ae9a92 Wei Yongjun       2014-08-26  754  		return -ENOMEM;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  755  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30 @756  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  757  			"video-dacs-ctrl");
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  758  	if (res) {
4bdc0d676a6431 Christoph Hellwig 2020-01-06  759  		hda->video_dacs_ctrl = devm_ioremap(dev, res->start,
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  760  				resource_size(res));
5024a2b7ae9a92 Wei Yongjun       2014-08-26  761  		if (!hda->video_dacs_ctrl)
5024a2b7ae9a92 Wei Yongjun       2014-08-26  762  			return -ENOMEM;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  763  	} else {
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  764  		/* If no existing video-dacs-ctrl resource continue the probe */
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  765  		DRM_DEBUG_DRIVER("No video-dacs-ctrl resource\n");
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  766  		hda->video_dacs_ctrl = NULL;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  767  	}
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  768  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  769  	/* Get clock resources */
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  770  	hda->clk_pix = devm_clk_get(dev, "pix");
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  771  	if (IS_ERR(hda->clk_pix)) {
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  772  		DRM_ERROR("Cannot get hda_pix clock\n");
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  773  		return PTR_ERR(hda->clk_pix);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  774  	}
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  775  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  776  	hda->clk_hddac = devm_clk_get(dev, "hddac");
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  777  	if (IS_ERR(hda->clk_hddac)) {
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  778  		DRM_ERROR("Cannot get hda_hddac clock\n");
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  779  		return PTR_ERR(hda->clk_hddac);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  780  	}
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  781  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  782  	platform_set_drvdata(pdev, hda);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  783  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  784  	return component_add(&pdev->dev, &sti_hda_ops);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  785  }
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  786  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
