Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45F81E0B9C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740924507; cv=none; b=ncAvE0Dn8vLJBSOUNd/vyJHT8ojxWfFmTCi0dimYBtthSzCoWP7HfcyU1+lPT0BHkXFQpjuoZV9zN58mesnOwa63v/B9kFuIaoihgbXuev6B8Rp8KdnQbHfN/cEogeLCvJ0ujxfHlTPvKuyQc6RtPMKWlbx3FB3WGq5eFBNp+VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740924507; c=relaxed/simple;
	bh=oCyr+D5Blas8C+KLmqrJU17YKLr/+xJXZkHcNZU+LVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YUNjDXd2qkHfVQOBnWR6svZKtNTkI3yof0ZCkUBT2QYHCmfYktpUeOwdvQkrglomSp97S3Gxw8/tBF/+AwO+cKApbFgkT1zp8Nj4BAtjh3Mbhy3PC4QpuHA/ftubMdVDVPt090qHdT/LifhF8rLtUbn5uWEEilnvXW5P35XvJl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BobkPRpi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BobkPRpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740924506; x=1772460506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oCyr+D5Blas8C+KLmqrJU17YKLr/+xJXZkHcNZU+LVE=;
  b=BobkPRpi3sosYnMdOxh7wxBCXcZRIR2xBfwIA8VuwXrUsCknpBCymyKY
   3MrQ6rOH/ccf3TQLbJfyFfdlGpFsHXLl0h+Tkx0/4754JHFyn37DBbYou
   QtY3ZkUyyuwBiZgoE6U4aAwQAAtSLhgVG9Eb+T2UMRa9vghHlG4iS8KJ/
   af3AnKrumuJTDLvWjenkNuFQI44pqCfgVzlIJjhyK843gKIz44q9tXHLL
   OBjx6Q4f3/7iLb5rMjF3YYI6b0C6TDs/XgJzr2K0MdgbBh9QO1D5Ta+FM
   6KmYFQ68DwFk6B3NYVHrHeJaM/kkV7+imyVbTnNweeE2HfHoC5V9VqWfr
   Q==;
X-CSE-ConnectionGUID: lPG5Sl0mTg+BJyb9D757lQ==
X-CSE-MsgGUID: Tk9zMo9qQNu1Q4sumdrlCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="29389121"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="29389121"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 06:08:25 -0800
X-CSE-ConnectionGUID: uAodgfEOSPqDcnnZ1xrBNA==
X-CSE-MsgGUID: /VFYMCalS72M+0O4mOrVUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121903863"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2025 06:08:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tojzM-000HMI-3C;
	Sun, 02 Mar 2025 14:08:18 +0000
Date: Sun, 2 Mar 2025 22:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	CK Hu <ck.hu@mediatek.com>
Subject: [chunkuang-hu:mediatek-drm-next 18/18]
 drivers/gpu/drm/mediatek/mtk_dpi.c:662:52: error: 'DPI_OUTPUT_1T1P_EN'
 undeclared
Message-ID: <202503022243.w1kEmvNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-drm-next
head:   3b746eb11a87018ef92a292bba63921edb4e85fd
commit: 3b746eb11a87018ef92a292bba63921edb4e85fd [18/18] drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
config: arm-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503022243.w1kEmvNM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503022243.w1kEmvNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503022243.w1kEmvNM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dpi.c: In function 'mtk_dpi_set_display_mode':
>> drivers/gpu/drm/mediatek/mtk_dpi.c:662:52: error: 'DPI_OUTPUT_1T1P_EN' undeclared (first use in this function)
     662 |                         mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, DPI_OUTPUT_1T1P_EN);
         |                                                    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dpi.c:662:52: note: each undeclared identifier is reported only once for each function it appears in


vim +/DPI_OUTPUT_1T1P_EN +662 drivers/gpu/drm/mediatek/mtk_dpi.c

   581	
   582	static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
   583					    struct drm_display_mode *mode)
   584	{
   585		struct mtk_dpi_polarities dpi_pol;
   586		struct mtk_dpi_sync_param hsync;
   587		struct mtk_dpi_sync_param vsync_lodd = { 0 };
   588		struct mtk_dpi_sync_param vsync_leven = { 0 };
   589		struct mtk_dpi_sync_param vsync_rodd = { 0 };
   590		struct mtk_dpi_sync_param vsync_reven = { 0 };
   591		struct videomode vm = { 0 };
   592	
   593		drm_display_mode_to_videomode(mode, &vm);
   594	
   595		if (!dpi->conf->clocked_by_hdmi)
   596			mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
   597	
   598		dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
   599		dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
   600		dpi_pol.hsync_pol = vm.flags & DISPLAY_FLAGS_HSYNC_HIGH ?
   601				    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
   602		dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
   603				    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
   604	
   605		/*
   606		 * Depending on the IP version, we may output a different amount of
   607		 * pixels for each iteration: divide the clock by this number and
   608		 * adjust the display porches accordingly.
   609		 */
   610		hsync.sync_width = vm.hsync_len / dpi->conf->pixels_per_iter;
   611		hsync.back_porch = vm.hback_porch / dpi->conf->pixels_per_iter;
   612		hsync.front_porch = vm.hfront_porch / dpi->conf->pixels_per_iter;
   613	
   614		hsync.shift_half_line = false;
   615		vsync_lodd.sync_width = vm.vsync_len;
   616		vsync_lodd.back_porch = vm.vback_porch;
   617		vsync_lodd.front_porch = vm.vfront_porch;
   618		vsync_lodd.shift_half_line = false;
   619	
   620		if (vm.flags & DISPLAY_FLAGS_INTERLACED &&
   621		    mode->flags & DRM_MODE_FLAG_3D_MASK) {
   622			vsync_leven = vsync_lodd;
   623			vsync_rodd = vsync_lodd;
   624			vsync_reven = vsync_lodd;
   625			vsync_leven.shift_half_line = true;
   626			vsync_reven.shift_half_line = true;
   627		} else if (vm.flags & DISPLAY_FLAGS_INTERLACED &&
   628			   !(mode->flags & DRM_MODE_FLAG_3D_MASK)) {
   629			vsync_leven = vsync_lodd;
   630			vsync_leven.shift_half_line = true;
   631		} else if (!(vm.flags & DISPLAY_FLAGS_INTERLACED) &&
   632			   mode->flags & DRM_MODE_FLAG_3D_MASK) {
   633			vsync_rodd = vsync_lodd;
   634		}
   635		mtk_dpi_sw_reset(dpi, true);
   636		mtk_dpi_config_pol(dpi, &dpi_pol);
   637	
   638		mtk_dpi_config_hsync(dpi, &hsync);
   639		mtk_dpi_config_vsync_lodd(dpi, &vsync_lodd);
   640		mtk_dpi_config_vsync_rodd(dpi, &vsync_rodd);
   641		mtk_dpi_config_vsync_leven(dpi, &vsync_leven);
   642		mtk_dpi_config_vsync_reven(dpi, &vsync_reven);
   643	
   644		mtk_dpi_config_3d(dpi, !!(mode->flags & DRM_MODE_FLAG_3D_MASK));
   645		mtk_dpi_config_interface(dpi, !!(vm.flags &
   646						 DISPLAY_FLAGS_INTERLACED));
   647		if (vm.flags & DISPLAY_FLAGS_INTERLACED)
   648			mtk_dpi_config_fb_size(dpi, vm.hactive, vm.vactive >> 1);
   649		else
   650			mtk_dpi_config_fb_size(dpi, vm.hactive, vm.vactive);
   651	
   652		mtk_dpi_config_channel_limit(dpi);
   653		mtk_dpi_config_bit_num(dpi, dpi->bit_num);
   654		mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
   655		mtk_dpi_config_color_format(dpi, dpi->color_format);
   656		if (dpi->conf->support_direct_pin) {
   657			mtk_dpi_config_yc_map(dpi, dpi->yc_map);
   658			mtk_dpi_config_2n_h_fre(dpi);
   659	
   660			/* DPI can connect to either an external bridge or the internal HDMI encoder */
   661			if (dpi->conf->output_1pixel)
 > 662				mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, DPI_OUTPUT_1T1P_EN);
   663			else
   664				mtk_dpi_dual_edge(dpi);
   665	
   666			mtk_dpi_config_disable_edge(dpi);
   667		}
   668		if (dpi->conf->input_2p_en_bit) {
   669			mtk_dpi_mask(dpi, DPI_CON, dpi->conf->input_2p_en_bit,
   670				     dpi->conf->input_2p_en_bit);
   671		}
   672		mtk_dpi_sw_reset(dpi, false);
   673	
   674		return 0;
   675	}
   676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
