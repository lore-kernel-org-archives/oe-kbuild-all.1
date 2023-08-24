Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B339117F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 03:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692848306; x=1724384306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H5qWDika5+kVSdYuOdZeE3wQOwyiyzZ3JdqpT6/ViI0=;
  b=Y2ziYdNOZs6hpdlfbvj8KGdTU/TnMb6QimDiYyl/sOpLlpFBQ9oN4dnW
   cwkz8V8xpCLclEsH/P8Wa2GOdIsNei/Ahe16XOpiRzSKSF8QIEhhO3Hl9
   H4l2LerADz5OAecFLvuBPh91IacBtor/c9wLb/Q8rbA6ac0PFqbZYXp9E
   BT4eSZIO2eSX8VLY7dkOwQP0d6PKG5Sd3cSL9Sq75IuVYtcavR0TfTKgy
   qAe9MWZuuEuqOIg31uvO/ov0/C69pUy7+B9K2/t69E1gyShqhSC0bFODn
   D7Zt4Xdnve4VZi/zeVrB9eZDI2z8OsQdgGAVKviLdJVck4a2KbOWLngUA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374305492"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="374305492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 20:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910751228"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="910751228"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 23 Aug 2023 20:38:22 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ1Ar-0001jc-15;
	Thu, 24 Aug 2023 03:38:21 +0000
Date: Thu, 24 Aug 2023 11:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: Liangliang Li <liliangliang@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 2023/9999]
 drivers/gpu/drm/exynos/exynos_drm_fimd.c:710:1: warning: the frame size of
 1028 bytes is larger than 1024 bytes
Message-ID: <202308241135.PXTnFjYk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 372b24bad2a8e7994d0360c870f6e981e3f4bb8f [2023/9999] ANDROID: GKI: Add OEM data to mutex/rwsem
config: i386-buildonly-randconfig-004-20230824 (https://download.01.org/0day-ci/archive/20230824/202308241135.PXTnFjYk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241135.PXTnFjYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241135.PXTnFjYk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from drivers/gpu/drm/exynos/exynos_drm_fimd.c:14:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1275:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1275 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1261:27: note: 'mem_section' declared here
    1261 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_fimd.c: In function 'fimd_win_set_pixfmt.isra':
>> drivers/gpu/drm/exynos/exynos_drm_fimd.c:710:1: warning: the frame size of 1028 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     710 | }
         | ^


vim +710 drivers/gpu/drm/exynos/exynos_drm_fimd.c

1c248b7d2960fa Inki Dae             2011-10-04  636  
2eeb2e5e6634db Gustavo Padovan      2015-08-03  637  static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  638  				struct drm_framebuffer *fb, int width)
1c248b7d2960fa Inki Dae             2011-10-04  639  {
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  640  	struct exynos_drm_plane plane = ctx->planes[win];
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  641  	struct exynos_drm_plane_state *state =
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  642  		to_exynos_plane_state(plane.base.state);
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  643  	uint32_t pixel_format = fb->format->format;
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  644  	unsigned int alpha = state->base.alpha;
6f8ee5c21722f9 Christoph Manszewski 2018-10-25  645  	u32 val = WINCONx_ENWIN;
3b5129b3a7c62f Christoph Manszewski 2018-10-25  646  	unsigned int pixel_alpha;
3b5129b3a7c62f Christoph Manszewski 2018-10-25  647  
3b5129b3a7c62f Christoph Manszewski 2018-10-25  648  	if (fb->format->has_alpha)
3b5129b3a7c62f Christoph Manszewski 2018-10-25  649  		pixel_alpha = state->base.pixel_blend_mode;
3b5129b3a7c62f Christoph Manszewski 2018-10-25  650  	else
3b5129b3a7c62f Christoph Manszewski 2018-10-25  651  		pixel_alpha = DRM_MODE_BLEND_PIXEL_NONE;
1c248b7d2960fa Inki Dae             2011-10-04  652  
5cc4621a17b1e6 Inki Dae             2013-08-20  653  	/*
5cc4621a17b1e6 Inki Dae             2013-08-20  654  	 * In case of s3c64xx, window 0 doesn't support alpha channel.
5cc4621a17b1e6 Inki Dae             2013-08-20  655  	 * So the request format is ARGB8888 then change it to XRGB8888.
5cc4621a17b1e6 Inki Dae             2013-08-20  656  	 */
5cc4621a17b1e6 Inki Dae             2013-08-20  657  	if (ctx->driver_data->has_limited_fmt && !win) {
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  658  		if (pixel_format == DRM_FORMAT_ARGB8888)
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  659  			pixel_format = DRM_FORMAT_XRGB8888;
5cc4621a17b1e6 Inki Dae             2013-08-20  660  	}
5cc4621a17b1e6 Inki Dae             2013-08-20  661  
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  662  	switch (pixel_format) {
a4f38a80f62bb6 Inki Dae             2013-08-20  663  	case DRM_FORMAT_C8:
1c248b7d2960fa Inki Dae             2011-10-04  664  		val |= WINCON0_BPPMODE_8BPP_PALETTE;
1c248b7d2960fa Inki Dae             2011-10-04  665  		val |= WINCONx_BURSTLEN_8WORD;
1c248b7d2960fa Inki Dae             2011-10-04  666  		val |= WINCONx_BYTSWP;
1c248b7d2960fa Inki Dae             2011-10-04  667  		break;
a4f38a80f62bb6 Inki Dae             2013-08-20  668  	case DRM_FORMAT_XRGB1555:
a4f38a80f62bb6 Inki Dae             2013-08-20  669  		val |= WINCON0_BPPMODE_16BPP_1555;
a4f38a80f62bb6 Inki Dae             2013-08-20  670  		val |= WINCONx_HAWSWP;
a4f38a80f62bb6 Inki Dae             2013-08-20  671  		val |= WINCONx_BURSTLEN_16WORD;
a4f38a80f62bb6 Inki Dae             2013-08-20  672  		break;
a4f38a80f62bb6 Inki Dae             2013-08-20  673  	case DRM_FORMAT_RGB565:
1c248b7d2960fa Inki Dae             2011-10-04  674  		val |= WINCON0_BPPMODE_16BPP_565;
1c248b7d2960fa Inki Dae             2011-10-04  675  		val |= WINCONx_HAWSWP;
1c248b7d2960fa Inki Dae             2011-10-04  676  		val |= WINCONx_BURSTLEN_16WORD;
1c248b7d2960fa Inki Dae             2011-10-04  677  		break;
a4f38a80f62bb6 Inki Dae             2013-08-20  678  	case DRM_FORMAT_XRGB8888:
1c248b7d2960fa Inki Dae             2011-10-04  679  		val |= WINCON0_BPPMODE_24BPP_888;
1c248b7d2960fa Inki Dae             2011-10-04  680  		val |= WINCONx_WSWP;
1c248b7d2960fa Inki Dae             2011-10-04  681  		val |= WINCONx_BURSTLEN_16WORD;
1c248b7d2960fa Inki Dae             2011-10-04  682  		break;
a4f38a80f62bb6 Inki Dae             2013-08-20  683  	case DRM_FORMAT_ARGB8888:
5b7b1b7fa10145 Tobias Jakobi        2017-08-22  684  	default:
3b5129b3a7c62f Christoph Manszewski 2018-10-25  685  		val |= WINCON1_BPPMODE_25BPP_A1888;
1c248b7d2960fa Inki Dae             2011-10-04  686  		val |= WINCONx_WSWP;
1c248b7d2960fa Inki Dae             2011-10-04  687  		val |= WINCONx_BURSTLEN_16WORD;
1c248b7d2960fa Inki Dae             2011-10-04  688  		break;
1c248b7d2960fa Inki Dae             2011-10-04  689  	}
1c248b7d2960fa Inki Dae             2011-10-04  690  
66367461e57332 Rahul Sharma         2014-05-07  691  	/*
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  692  	 * Setting dma-burst to 16Word causes permanent tearing for very small
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  693  	 * buffers, e.g. cursor buffer. Burst Mode switching which based on
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  694  	 * plane size is not recommended as plane size varies alot towards the
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  695  	 * end of the screen and rapid movement causes unstable DMA, but it is
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  696  	 * still better to change dma-burst than displaying garbage.
66367461e57332 Rahul Sharma         2014-05-07  697  	 */
66367461e57332 Rahul Sharma         2014-05-07  698  
8b704d8a3f5c9a Marek Szyprowski     2015-11-30  699  	if (width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
66367461e57332 Rahul Sharma         2014-05-07  700  		val &= ~WINCONx_BURSTLEN_MASK;
66367461e57332 Rahul Sharma         2014-05-07  701  		val |= WINCONx_BURSTLEN_4WORD;
66367461e57332 Rahul Sharma         2014-05-07  702  	}
3b5129b3a7c62f Christoph Manszewski 2018-10-25  703  	fimd_set_bits(ctx, WINCON(win), ~WINCONx_BLEND_MODE_MASK, val);
453b44a3f6f3f4 Gustavo Padovan      2015-04-01  704  
453b44a3f6f3f4 Gustavo Padovan      2015-04-01  705  	/* hardware window 0 doesn't support alpha channel. */
3b5129b3a7c62f Christoph Manszewski 2018-10-25  706  	if (win != 0) {
3b5129b3a7c62f Christoph Manszewski 2018-10-25  707  		fimd_win_set_bldmod(ctx, win, alpha, pixel_alpha);
3b5129b3a7c62f Christoph Manszewski 2018-10-25  708  		fimd_win_set_bldeq(ctx, win, alpha, pixel_alpha);
3b5129b3a7c62f Christoph Manszewski 2018-10-25  709  	}
1c248b7d2960fa Inki Dae             2011-10-04 @710  }
1c248b7d2960fa Inki Dae             2011-10-04  711  

:::::: The code at line 710 was first introduced by commit
:::::: 1c248b7d2960faec3e1b8f3f9c5d9d0df28e0a3c DRM: add DRM Driver for Samsung SoC EXYNOS4210.

:::::: TO: Inki Dae <inki.dae@samsung.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
