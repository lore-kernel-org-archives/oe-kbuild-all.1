Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1879D0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 21:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675890925; x=1707426925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99ymiTw2hFUHw/DVx6ofHeTbUY2PsJ4KdTDCYu7f+eE=;
  b=XPZthinSJVvmqcOQIUqkBrWFe17YLj6J80f+lTeNIvJEFSTIchN9SnxM
   UfLvwbo3V7tyyagb8ClOdk8Oz1mz4B1S8K3rQEFoRQzs2hJYdvG/mAzeI
   3qO8vC42ODhM0JrYX0+cP2HoFhlDiOqS9B6IdZXvh6lUjXRV7OFqvWTvt
   KKi/ifsKsaJFT6l2+W86tiZFNfj9gtw/imigvreTDzkT6PzQEvrDDcJ8M
   x6IfwvW1vU6AwxbUqWgD5hDXPTk//lWZNgFOMUP3P8G3c1QDaXj4c+c3e
   AU+lKE+m0TJ5qgMuv+imk655jwoZWBrtZu2fVN9L53iwamFCsTsYlRO0/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="332052441"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="332052441"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 13:15:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="791358592"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="791358592"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2023 13:15:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPrmc-0004eo-1y;
	Wed, 08 Feb 2023 21:15:14 +0000
Date: Thu, 9 Feb 2023 05:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/exynos/exynos_drm_fimd.c:710:1: warning: the frame
 size of 1032 bytes is larger than 1024 bytes
Message-ID: <202302090508.6tHQSlfy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shashank,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 05aba0d48a134769ff68304f0291e63d31573cd1 ANDROID: include: drm: increase DRM max property count to 64
date:   2 years, 2 months ago
config: riscv-randconfig-r031-20230209 (https://download.01.org/0day-ci/archive/20230209/202302090508.6tHQSlfy-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=05aba0d48a134769ff68304f0291e63d31573cd1
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 05aba0d48a134769ff68304f0291e63d31573cd1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/exynos/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302090508.6tHQSlfy-lkp@intel.com

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/exynos/exynos_drm_fimd.c: In function 'fimd_win_set_pixfmt.isra':
>> drivers/gpu/drm/exynos/exynos_drm_fimd.c:710:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
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
https://github.com/intel/lkp-tests
