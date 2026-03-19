Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3141319E97B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 00:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773879763; cv=none; b=PwmiHJ8QJg6X4jCFUu5JR3SQbuh+9cGwkyMSVGOaWpBGNVVttmUEcAVgP9DmHJqtsYzKJ5/iqfdbd5dGvKFZKUp34cz23hGQOWRPDRyU8+GbeqCavBKzr3k3zr0Jj1dTn2oS+5NPkXKpOVbts8bVUBJ+BfvQXYDFFoeiYIRSJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773879763; c=relaxed/simple;
	bh=BQcyHYifbfvGb+af3Nv6bJFBDYz8OjbbNXZ+MC9lmEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ualum95rMQS02NI7udn1GV4Pp6WZbNtLOsf7eyTnPmbQr6BBhRiY+Tf4Y6BrQEow9qpEhTCPcVzGcCVXJfRQg2A/nQWFKyC1MGKucrld9Aq3u65KafkAPLpK9pLUTgBkJCXyx2xNbbAIObic8eVhjibzakvkNh7BtDQrpgnW9W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4O6UgUc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4O6UgUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773879761; x=1805415761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQcyHYifbfvGb+af3Nv6bJFBDYz8OjbbNXZ+MC9lmEw=;
  b=J4O6UgUcM2kPw+dIXUP9YfurRHNzcBRRi66eDxDalhGspssXQeVdpre0
   JGW+B25GVjYUQ3Dxdeu1b8pGRhqed3HqG8q1m/cluWB914R42d1BxOces
   bjQcCVzpBPz8b3CFavkb0jDBcGvX2fHXMYBfHwA9o41lWKf83wRDUTX/g
   wptthp+Z5stWM7VTShFHV+DbMuf4TJq8iUs3n9SgVkC1XfIhPVOpFTU2W
   YfP491WDZDJGWcI5vNS1O3zfxASLZY/FO12/VXHUUTu5VG4T0muFis3gB
   C41RUWKa5vwQsjqfxjxO9bhJeYXbPmQAR6CCzqtqZG8G23AX5k5MqaIbO
   w==;
X-CSE-ConnectionGUID: aiav2HdLTc2DTwQjm1BaDg==
X-CSE-MsgGUID: aSFBy72+TSWhQeqVcHxWlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74835547"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74835547"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 17:22:41 -0700
X-CSE-ConnectionGUID: uWlu8RaoQtSA+GjbI5OP3A==
X-CSE-MsgGUID: jLw6YJu5QaeHjVuNRwF1fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="221904375"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Mar 2026 17:22:37 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3182-0000000007N-2HDT;
	Thu, 19 Mar 2026 00:21:13 +0000
Date: Thu, 19 Mar 2026 08:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Koskovich <akoskovich@pm.me>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH 1/3] drm/mipi-dsi: add RGB101010 pixel format
Message-ID: <202603190805.7UiuBASq-lkp@intel.com>
References: <20260318-dsi-rgb101010-support-v1-1-6021eb79e796@pm.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-dsi-rgb101010-support-v1-1-6021eb79e796@pm.me>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f338e77383789c0cae23ca3d48adcc5e9e137e3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Koskovich/drm-mipi-dsi-add-RGB101010-pixel-format/20260318-220726
base:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
patch link:    https://lore.kernel.org/r/20260318-dsi-rgb101010-support-v1-1-6021eb79e796%40pm.me
patch subject: [PATCH 1/3] drm/mipi-dsi: add RGB101010 pixel format
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603190805.7UiuBASq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190805.7UiuBASq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190805.7UiuBASq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c: In function 'dw_mipi_dsi_phy_init':
>> drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:113:9: warning: enumeration value 'MIPI_DSI_FMT_RGB101010' not handled in switch [-Wswitch]
     113 |         switch (mipi_dsi->dsi_device->format) {
         |         ^~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c: In function 'meson_dw_mipi_dsi_host_attach':
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:230:9: warning: enumeration value 'MIPI_DSI_FMT_RGB101010' not handled in switch [-Wswitch]
     230 |         switch (device->format) {
         |         ^~~~~~


vim +/MIPI_DSI_FMT_RGB101010 +113 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c

77d9e1e6b8468f Neil Armstrong 2023-05-30   74  
77d9e1e6b8468f Neil Armstrong 2023-05-30   75  static int dw_mipi_dsi_phy_init(void *priv_data)
77d9e1e6b8468f Neil Armstrong 2023-05-30   76  {
77d9e1e6b8468f Neil Armstrong 2023-05-30   77  	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
77d9e1e6b8468f Neil Armstrong 2023-05-30   78  	unsigned int dpi_data_format, venc_data_width;
77d9e1e6b8468f Neil Armstrong 2023-05-30   79  	int ret;
77d9e1e6b8468f Neil Armstrong 2023-05-30   80  
77d9e1e6b8468f Neil Armstrong 2023-05-30   81  	/* Set the bit clock rate to hs_clk_rate */
77d9e1e6b8468f Neil Armstrong 2023-05-30   82  	ret = clk_set_rate(mipi_dsi->bit_clk,
77d9e1e6b8468f Neil Armstrong 2023-05-30   83  			   mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate);
77d9e1e6b8468f Neil Armstrong 2023-05-30   84  	if (ret) {
77d9e1e6b8468f Neil Armstrong 2023-05-30   85  		dev_err(mipi_dsi->dev, "Failed to set DSI Bit clock rate %lu (ret %d)\n",
77d9e1e6b8468f Neil Armstrong 2023-05-30   86  			mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate, ret);
77d9e1e6b8468f Neil Armstrong 2023-05-30   87  		return ret;
77d9e1e6b8468f Neil Armstrong 2023-05-30   88  	}
77d9e1e6b8468f Neil Armstrong 2023-05-30   89  
77d9e1e6b8468f Neil Armstrong 2023-05-30   90  	/* Make sure the rate of the bit clock is not modified by someone else */
77d9e1e6b8468f Neil Armstrong 2023-05-30   91  	ret = clk_rate_exclusive_get(mipi_dsi->bit_clk);
77d9e1e6b8468f Neil Armstrong 2023-05-30   92  	if (ret) {
77d9e1e6b8468f Neil Armstrong 2023-05-30   93  		dev_err(mipi_dsi->dev,
77d9e1e6b8468f Neil Armstrong 2023-05-30   94  			"Failed to set the exclusivity on the bit clock rate (ret %d)\n", ret);
77d9e1e6b8468f Neil Armstrong 2023-05-30   95  		return ret;
77d9e1e6b8468f Neil Armstrong 2023-05-30   96  	}
77d9e1e6b8468f Neil Armstrong 2023-05-30   97  
5c9837374ecf55 Neil Armstrong 2024-04-03   98  	clk_disable_unprepare(mipi_dsi->px_clk);
77d9e1e6b8468f Neil Armstrong 2023-05-30   99  	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
77d9e1e6b8468f Neil Armstrong 2023-05-30  100  
77d9e1e6b8468f Neil Armstrong 2023-05-30  101  	if (ret) {
77d9e1e6b8468f Neil Armstrong 2023-05-30  102  		dev_err(mipi_dsi->dev, "Failed to set DSI Pixel clock rate %u (%d)\n",
77d9e1e6b8468f Neil Armstrong 2023-05-30  103  			mipi_dsi->mode->clock * 1000, ret);
77d9e1e6b8468f Neil Armstrong 2023-05-30  104  		return ret;
77d9e1e6b8468f Neil Armstrong 2023-05-30  105  	}
77d9e1e6b8468f Neil Armstrong 2023-05-30  106  
5c9837374ecf55 Neil Armstrong 2024-04-03  107  	ret = clk_prepare_enable(mipi_dsi->px_clk);
5c9837374ecf55 Neil Armstrong 2024-04-03  108  	if (ret) {
5c9837374ecf55 Neil Armstrong 2024-04-03  109  		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
5c9837374ecf55 Neil Armstrong 2024-04-03  110  		return ret;
5c9837374ecf55 Neil Armstrong 2024-04-03  111  	}
5c9837374ecf55 Neil Armstrong 2024-04-03  112  
77d9e1e6b8468f Neil Armstrong 2023-05-30 @113  	switch (mipi_dsi->dsi_device->format) {
77d9e1e6b8468f Neil Armstrong 2023-05-30  114  	case MIPI_DSI_FMT_RGB888:
77d9e1e6b8468f Neil Armstrong 2023-05-30  115  		dpi_data_format = DPI_COLOR_24BIT;
77d9e1e6b8468f Neil Armstrong 2023-05-30  116  		venc_data_width = VENC_IN_COLOR_24B;
77d9e1e6b8468f Neil Armstrong 2023-05-30  117  		break;
77d9e1e6b8468f Neil Armstrong 2023-05-30  118  	case MIPI_DSI_FMT_RGB666:
77d9e1e6b8468f Neil Armstrong 2023-05-30  119  		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
77d9e1e6b8468f Neil Armstrong 2023-05-30  120  		venc_data_width = VENC_IN_COLOR_18B;
77d9e1e6b8468f Neil Armstrong 2023-05-30  121  		break;
77d9e1e6b8468f Neil Armstrong 2023-05-30  122  	case MIPI_DSI_FMT_RGB666_PACKED:
77d9e1e6b8468f Neil Armstrong 2023-05-30  123  	case MIPI_DSI_FMT_RGB565:
77d9e1e6b8468f Neil Armstrong 2023-05-30  124  		return -EINVAL;
e96f099c8544a5 Yang Li        2023-06-02  125  	}
77d9e1e6b8468f Neil Armstrong 2023-05-30  126  
77d9e1e6b8468f Neil Armstrong 2023-05-30  127  	/* Configure color format for DPI register */
77d9e1e6b8468f Neil Armstrong 2023-05-30  128  	writel_relaxed(FIELD_PREP(MIPI_DSI_TOP_DPI_COLOR_MODE, dpi_data_format) |
77d9e1e6b8468f Neil Armstrong 2023-05-30  129  		       FIELD_PREP(MIPI_DSI_TOP_IN_COLOR_MODE, venc_data_width) |
77d9e1e6b8468f Neil Armstrong 2023-05-30  130  		       FIELD_PREP(MIPI_DSI_TOP_COMP2_SEL, 2) |
77d9e1e6b8468f Neil Armstrong 2023-05-30  131  		       FIELD_PREP(MIPI_DSI_TOP_COMP1_SEL, 1) |
77d9e1e6b8468f Neil Armstrong 2023-05-30  132  		       FIELD_PREP(MIPI_DSI_TOP_COMP0_SEL, 0),
77d9e1e6b8468f Neil Armstrong 2023-05-30  133  			mipi_dsi->base + MIPI_DSI_TOP_CNTL);
77d9e1e6b8468f Neil Armstrong 2023-05-30  134  
77d9e1e6b8468f Neil Armstrong 2023-05-30  135  	return phy_configure(mipi_dsi->phy, &mipi_dsi->phy_opts);
77d9e1e6b8468f Neil Armstrong 2023-05-30  136  }
77d9e1e6b8468f Neil Armstrong 2023-05-30  137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
