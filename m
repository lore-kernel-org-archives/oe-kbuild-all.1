Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E651D174C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689714702; x=1721250702;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=peihEsIm9dIz5k288cGp0/SKGGEO6DFlL93Cp2wUTAc=;
  b=LVNit7miiP2SWAicTrcTstNKnYz5qYes7sIZU4uItk2Z7BM8mTS7yvex
   GMGERs6jV0/Jv1SqPuYttD5+Qnam4p+5ZnNkq7eetJgUsC6TK/R7W9zD0
   ameJo/wbV6OBMKYyqJqfLLBVt5xFMvx6rthlcR2PtUfi/M5VbJp8FXYx1
   3/CkrJRTn7XcgP1dwQ/2r525edX/FtRxaxpTRxS2+vZuqhm5wqOwyfoPP
   3M84dGKIX4jZsAdL751wy2Cv7Nt8w6pt+73F6nzW732qH8gRFGt5dd1hj
   S5B2qgw4ZvCI7CrwjK441mV7eq5XOg4KDRm+xEVP57zk8LJOgeSAWStLJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369872701"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="369872701"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 14:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="813898392"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="813898392"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jul 2023 14:11:41 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLryb-0003tP-0H;
	Tue, 18 Jul 2023 21:11:25 +0000
Date: Wed, 19 Jul 2023 05:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 111/120]
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:1: warning: the frame size
 of 1040 bytes is larger than 1024 bytes
Message-ID: <202307190554.aesjunvB-lkp@intel.com>
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
head:   6c695fad68dc262b1d1d2f37d3f443f0a4038605
commit: 8326170bb6a02c97289689a4efda7062e991285f [111/120] ANDROID: GKI: Add OEM data to mutex/rwsem
config: arm-randconfig-r015-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190554.aesjunvB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190554.aesjunvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190554.aesjunvB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/exynos/exynos5433_drm_decon.c: In function 'decon_win_set_pixfmt':
>> drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     381 | }
         | ^


vim +381 drivers/gpu/drm/exynos/exynos5433_drm_decon.c

54947290ef6288 Christoph Manszewski 2018-10-25  318  
2eeb2e5e6634db Gustavo Padovan      2015-08-03  319  static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
2eeb2e5e6634db Gustavo Padovan      2015-08-03  320  				 struct drm_framebuffer *fb)
c8466a9166b00e Joonyoung Shim       2015-06-12  321  {
54947290ef6288 Christoph Manszewski 2018-10-25  322  	struct exynos_drm_plane plane = ctx->planes[win];
54947290ef6288 Christoph Manszewski 2018-10-25  323  	struct exynos_drm_plane_state *state =
54947290ef6288 Christoph Manszewski 2018-10-25  324  		to_exynos_plane_state(plane.base.state);
54947290ef6288 Christoph Manszewski 2018-10-25  325  	unsigned int alpha = state->base.alpha;
af130280c61321 Christoph Manszewski 2018-10-25  326  	unsigned int pixel_alpha;
c8466a9166b00e Joonyoung Shim       2015-06-12  327  	unsigned long val;
c8466a9166b00e Joonyoung Shim       2015-06-12  328  
af130280c61321 Christoph Manszewski 2018-10-25  329  	if (fb->format->has_alpha)
af130280c61321 Christoph Manszewski 2018-10-25  330  		pixel_alpha = state->base.pixel_blend_mode;
af130280c61321 Christoph Manszewski 2018-10-25  331  	else
af130280c61321 Christoph Manszewski 2018-10-25  332  		pixel_alpha = DRM_MODE_BLEND_PIXEL_NONE;
af130280c61321 Christoph Manszewski 2018-10-25  333  
c8466a9166b00e Joonyoung Shim       2015-06-12  334  	val = readl(ctx->addr + DECON_WINCONx(win));
7b7aa62c05eac9 Marek Szyprowski     2018-06-07  335  	val &= WINCONx_ENWIN_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  336  
438b74a5497c36 Ville Syrjälä        2016-12-14  337  	switch (fb->format->format) {
c8466a9166b00e Joonyoung Shim       2015-06-12  338  	case DRM_FORMAT_XRGB1555:
c8466a9166b00e Joonyoung Shim       2015-06-12  339  		val |= WINCONx_BPPMODE_16BPP_I1555;
c8466a9166b00e Joonyoung Shim       2015-06-12  340  		val |= WINCONx_HAWSWP_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  341  		val |= WINCONx_BURSTLEN_16WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  342  		break;
c8466a9166b00e Joonyoung Shim       2015-06-12  343  	case DRM_FORMAT_RGB565:
c8466a9166b00e Joonyoung Shim       2015-06-12  344  		val |= WINCONx_BPPMODE_16BPP_565;
c8466a9166b00e Joonyoung Shim       2015-06-12  345  		val |= WINCONx_HAWSWP_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  346  		val |= WINCONx_BURSTLEN_16WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  347  		break;
c8466a9166b00e Joonyoung Shim       2015-06-12  348  	case DRM_FORMAT_XRGB8888:
c8466a9166b00e Joonyoung Shim       2015-06-12  349  		val |= WINCONx_BPPMODE_24BPP_888;
c8466a9166b00e Joonyoung Shim       2015-06-12  350  		val |= WINCONx_WSWP_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  351  		val |= WINCONx_BURSTLEN_16WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  352  		break;
c8466a9166b00e Joonyoung Shim       2015-06-12  353  	case DRM_FORMAT_ARGB8888:
5b7b1b7fa10145 Tobias Jakobi        2017-08-22  354  	default:
c8466a9166b00e Joonyoung Shim       2015-06-12  355  		val |= WINCONx_BPPMODE_32BPP_A8888;
af130280c61321 Christoph Manszewski 2018-10-25  356  		val |= WINCONx_WSWP_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  357  		val |= WINCONx_BURSTLEN_16WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  358  		break;
c8466a9166b00e Joonyoung Shim       2015-06-12  359  	}
c8466a9166b00e Joonyoung Shim       2015-06-12  360  
6be900563a9e74 Inki Dae             2019-04-15  361  	DRM_DEV_DEBUG_KMS(ctx->dev, "cpp = %u\n", fb->format->cpp[0]);
c8466a9166b00e Joonyoung Shim       2015-06-12  362  
c8466a9166b00e Joonyoung Shim       2015-06-12  363  	/*
c8466a9166b00e Joonyoung Shim       2015-06-12  364  	 * In case of exynos, setting dma-burst to 16Word causes permanent
c8466a9166b00e Joonyoung Shim       2015-06-12  365  	 * tearing for very small buffers, e.g. cursor buffer. Burst Mode
c8466a9166b00e Joonyoung Shim       2015-06-12  366  	 * switching which is based on plane size is not recommended as
c8466a9166b00e Joonyoung Shim       2015-06-12  367  	 * plane size varies a lot towards the end of the screen and rapid
c8466a9166b00e Joonyoung Shim       2015-06-12  368  	 * movement causes unstable DMA which results into iommu crash/tear.
c8466a9166b00e Joonyoung Shim       2015-06-12  369  	 */
c8466a9166b00e Joonyoung Shim       2015-06-12  370  
2eeb2e5e6634db Gustavo Padovan      2015-08-03  371  	if (fb->width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
c8466a9166b00e Joonyoung Shim       2015-06-12  372  		val &= ~WINCONx_BURSTLEN_MASK;
c8466a9166b00e Joonyoung Shim       2015-06-12  373  		val |= WINCONx_BURSTLEN_8WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  374  	}
af130280c61321 Christoph Manszewski 2018-10-25  375  	decon_set_bits(ctx, DECON_WINCONx(win), ~WINCONx_BLEND_MODE_MASK, val);
c8466a9166b00e Joonyoung Shim       2015-06-12  376  
af130280c61321 Christoph Manszewski 2018-10-25  377  	if (win > 0) {
af130280c61321 Christoph Manszewski 2018-10-25  378  		decon_win_set_bldmod(ctx, win, alpha, pixel_alpha);
af130280c61321 Christoph Manszewski 2018-10-25  379  		decon_win_set_bldeq(ctx, win, alpha, pixel_alpha);
af130280c61321 Christoph Manszewski 2018-10-25  380  	}
c8466a9166b00e Joonyoung Shim       2015-06-12 @381  }
c8466a9166b00e Joonyoung Shim       2015-06-12  382  

:::::: The code at line 381 was first introduced by commit
:::::: c8466a9166b00ecb0c6f768baf70636fe15f63ef drm/exynos: add Exynos5433 decon driver

:::::: TO: Joonyoung Shim <jy0922.shim@samsung.com>
:::::: CC: Inki Dae <inki.dae@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
