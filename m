Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D8D249FE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 23:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSHqFjbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697065894; x=1728601894;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2ZAq2a9h6yhbg1tCyIpLltn1G9o/UhdN7NQbdOBCeuQ=;
  b=dSHqFjbh6HenfMXnxEO4vEMwfzqGGzGNtwyRLIqSp9NSKUu9n7yNb/Gu
   gaucq6m4ID3FhYujtJWUIR09/NuyWTPbPI7ehM/0XzTTF7l+IYn2/VsnY
   gHstUwn5TcL4uDas/Ff/bjlnT60PsnqKaUShSZGSqecxXNYrSbR4wjO+D
   kpqUVTqGSktoeaeMfSNb/6Sr36ZaDClXmlCzxxoKx3OQseEdNQyvtYeNZ
   bo8TOcF6TKvj5JozxljYr3bgB8lmEuBM3kui8J6UWn7S1HiMFaoxss8m6
   U13PmzU3PWjvke8SDRGdUMyhywOKF9O1/uNE+PQG/ncR2oyQEkzSGJuyh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471038770"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="471038770"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 16:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="757763484"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="757763484"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Oct 2023 16:11:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqiMT-0002pv-1w;
	Wed, 11 Oct 2023 23:11:29 +0000
Date: Thu, 12 Oct 2023 07:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 111/120]
 drivers/gpu/drm/exynos/exynos_drm_fimd.c:751:1: warning: the frame size of
 1036 bytes is larger than 1024 bytes
Message-ID: <202310120713.HdaLIBTe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   f4812c6864dce4c269f78ce3931fbee99515cbc8
commit: 8326170bb6a02c97289689a4efda7062e991285f [111/120] ANDROID: GKI: Add OEM data to mutex/rwsem
config: i386-buildonly-randconfig-002-20231012 (https://download.01.org/0day-ci/archive/20231012/202310120713.HdaLIBTe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120713.HdaLIBTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120713.HdaLIBTe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/exynos/exynos_drm_fimd.c: In function 'fimd_win_set_pixfmt.isra':
>> drivers/gpu/drm/exynos/exynos_drm_fimd.c:751:1: warning: the frame size of 1036 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     751 | }
         | ^


vim +751 drivers/gpu/drm/exynos/exynos_drm_fimd.c

1c248b7d2960fa Inki Dae             2011-10-04  661  
2eeb2e5e6634db Gustavo Padovan      2015-08-03  662  static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  663  				struct drm_framebuffer *fb, int width)
1c248b7d2960fa Inki Dae             2011-10-04  664  {
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  665  	struct exynos_drm_plane plane = ctx->planes[win];
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  666  	struct exynos_drm_plane_state *state =
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  667  		to_exynos_plane_state(plane.base.state);
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  668  	uint32_t pixel_format = fb->format->format;
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  669  	unsigned int alpha = state->base.alpha;
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  670  	u32 val = WINCONx_ENWIN;
3b5129b3a7c62f Christoph Manszewski 2018-10-25  671  	unsigned int pixel_alpha;
3b5129b3a7c62f Christoph Manszewski 2018-10-25  672  
3b5129b3a7c62f Christoph Manszewski 2018-10-25  673  	if (fb->format->has_alpha)
3b5129b3a7c62f Christoph Manszewski 2018-10-25  674  		pixel_alpha = state->base.pixel_blend_mode;
3b5129b3a7c62f Christoph Manszewski 2018-10-25  675  	else
3b5129b3a7c62f Christoph Manszewski 2018-10-25  676  		pixel_alpha = DRM_MODE_BLEND_PIXEL_NONE;
1c248b7d2960fa Inki Dae             2011-10-04  677  
5cc4621a17b1e6 Inki Dae             2013-08-20  678  	/*
5cc4621a17b1e6 Inki Dae             2013-08-20  679  	 * In case of s3c64xx, window 0 doesn't support alpha channel.
5cc4621a17b1e6 Inki Dae             2013-08-20  680  	 * So the request format is ARGB8888 then change it to XRGB8888.
5cc4621a17b1e6 Inki Dae             2013-08-20  681  	 */
5cc4621a17b1e6 Inki Dae             2013-08-20  682  	if (ctx->driver_data->has_limited_fmt && !win) {
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  683  		if (pixel_format == DRM_FORMAT_ARGB8888)
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  684  			pixel_format = DRM_FORMAT_XRGB8888;
5cc4621a17b1e6 Inki Dae             2013-08-20  685  	}
5cc4621a17b1e6 Inki Dae             2013-08-20  686  
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  687  	switch (pixel_format) {
a4f38a80f62bb6 Inki Dae             2013-08-20  688  	case DRM_FORMAT_C8:
1c248b7d2960fa Inki Dae             2011-10-04  689  		val |= WINCON0_BPPMODE_8BPP_PALETTE;
1c248b7d2960fa Inki Dae             2011-10-04  690  		val |= WINCONx_BURSTLEN_8WORD;
1c248b7d2960fa Inki Dae             2011-10-04  691  		val |= WINCONx_BYTSWP;
1c248b7d2960fa Inki Dae             2011-10-04  692  		break;
a4f38a80f62bb6 Inki Dae             2013-08-20  693  	case DRM_FORMAT_XRGB1555:
2d684f4e155c1e Martin Jücker        2022-01-29  694  	case DRM_FORMAT_XBGR1555:
a4f38a80f62bb6 Inki Dae             2013-08-20  695  		val |= WINCON0_BPPMODE_16BPP_1555;
a4f38a80f62bb6 Inki Dae             2013-08-20  696  		val |= WINCONx_HAWSWP;
a4f38a80f62bb6 Inki Dae             2013-08-20  697  		val |= WINCONx_BURSTLEN_16WORD;
a4f38a80f62bb6 Inki Dae             2013-08-20  698  		break;
a4f38a80f62bb6 Inki Dae             2013-08-20  699  	case DRM_FORMAT_RGB565:
2d684f4e155c1e Martin Jücker        2022-01-29  700  	case DRM_FORMAT_BGR565:
1c248b7d2960fa Inki Dae             2011-10-04  701  		val |= WINCON0_BPPMODE_16BPP_565;
1c248b7d2960fa Inki Dae             2011-10-04  702  		val |= WINCONx_HAWSWP;
1c248b7d2960fa Inki Dae             2011-10-04  703  		val |= WINCONx_BURSTLEN_16WORD;
1c248b7d2960fa Inki Dae             2011-10-04  704  		break;
a4f38a80f62bb6 Inki Dae             2013-08-20  705  	case DRM_FORMAT_XRGB8888:
2d684f4e155c1e Martin Jücker        2022-01-29  706  	case DRM_FORMAT_XBGR8888:
1c248b7d2960fa Inki Dae             2011-10-04  707  		val |= WINCON0_BPPMODE_24BPP_888;
1c248b7d2960fa Inki Dae             2011-10-04  708  		val |= WINCONx_WSWP;
1c248b7d2960fa Inki Dae             2011-10-04  709  		val |= WINCONx_BURSTLEN_16WORD;
1c248b7d2960fa Inki Dae             2011-10-04  710  		break;
a4f38a80f62bb6 Inki Dae             2013-08-20  711  	case DRM_FORMAT_ARGB8888:
2d684f4e155c1e Martin Jücker        2022-01-29  712  	case DRM_FORMAT_ABGR8888:
5b7b1b7fa10145 Tobias Jakobi        2017-08-22  713  	default:
3b5129b3a7c62f Christoph Manszewski 2018-10-25  714  		val |= WINCON1_BPPMODE_25BPP_A1888;
1c248b7d2960fa Inki Dae             2011-10-04  715  		val |= WINCONx_WSWP;
1c248b7d2960fa Inki Dae             2011-10-04  716  		val |= WINCONx_BURSTLEN_16WORD;
1c248b7d2960fa Inki Dae             2011-10-04  717  		break;
1c248b7d2960fa Inki Dae             2011-10-04  718  	}
1c248b7d2960fa Inki Dae             2011-10-04  719  
2d684f4e155c1e Martin Jücker        2022-01-29  720  	switch (pixel_format) {
2d684f4e155c1e Martin Jücker        2022-01-29  721  	case DRM_FORMAT_XBGR1555:
2d684f4e155c1e Martin Jücker        2022-01-29  722  	case DRM_FORMAT_XBGR8888:
2d684f4e155c1e Martin Jücker        2022-01-29  723  	case DRM_FORMAT_ABGR8888:
2d684f4e155c1e Martin Jücker        2022-01-29  724  	case DRM_FORMAT_BGR565:
2d684f4e155c1e Martin Jücker        2022-01-29  725  		writel(WIN_RGB_ORDER_REVERSE, ctx->regs + WIN_RGB_ORDER(win));
2d684f4e155c1e Martin Jücker        2022-01-29  726  		break;
2d684f4e155c1e Martin Jücker        2022-01-29  727  	default:
2d684f4e155c1e Martin Jücker        2022-01-29  728  		writel(WIN_RGB_ORDER_FORWARD, ctx->regs + WIN_RGB_ORDER(win));
2d684f4e155c1e Martin Jücker        2022-01-29  729  		break;
2d684f4e155c1e Martin Jücker        2022-01-29  730  	}
2d684f4e155c1e Martin Jücker        2022-01-29  731  
66367461e57332 Rahul Sharma         2014-05-07  732  	/*
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  733  	 * Setting dma-burst to 16Word causes permanent tearing for very small
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  734  	 * buffers, e.g. cursor buffer. Burst Mode switching which based on
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  735  	 * plane size is not recommended as plane size varies alot towards the
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  736  	 * end of the screen and rapid movement causes unstable DMA, but it is
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  737  	 * still better to change dma-burst than displaying garbage.
66367461e57332 Rahul Sharma         2014-05-07  738  	 */
66367461e57332 Rahul Sharma         2014-05-07  739  
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  740  	if (width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
66367461e57332 Rahul Sharma         2014-05-07  741  		val &= ~WINCONx_BURSTLEN_MASK;
66367461e57332 Rahul Sharma         2014-05-07  742  		val |= WINCONx_BURSTLEN_4WORD;
66367461e57332 Rahul Sharma         2014-05-07  743  	}
3b5129b3a7c62f Christoph Manszewski 2018-10-25  744  	fimd_set_bits(ctx, WINCON(win), ~WINCONx_BLEND_MODE_MASK, val);
453b44a3f6f3f4 Gustavo Padovan      2015-04-01  745  
453b44a3f6f3f4 Gustavo Padovan      2015-04-01  746  	/* hardware window 0 doesn't support alpha channel. */
3b5129b3a7c62f Christoph Manszewski 2018-10-25  747  	if (win != 0) {
3b5129b3a7c62f Christoph Manszewski 2018-10-25  748  		fimd_win_set_bldmod(ctx, win, alpha, pixel_alpha);
3b5129b3a7c62f Christoph Manszewski 2018-10-25  749  		fimd_win_set_bldeq(ctx, win, alpha, pixel_alpha);
3b5129b3a7c62f Christoph Manszewski 2018-10-25  750  	}
1c248b7d2960fa Inki Dae             2011-10-04 @751  }
1c248b7d2960fa Inki Dae             2011-10-04  752  

:::::: The code at line 751 was first introduced by commit
:::::: 1c248b7d2960faec3e1b8f3f9c5d9d0df28e0a3c DRM: add DRM Driver for Samsung SoC EXYNOS4210.

:::::: TO: Inki Dae <inki.dae@samsung.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
