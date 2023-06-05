Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EC8804
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685955841; x=1717491841;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QJri0gAPXj7nHwQg/Jx95o9jF+cnEavV+cW9UPdZ1MU=;
  b=nHc0HNBQXXFKQTeSy4gohbpge6clM6sPJ9qOnns4jFFkRm1+JlAevhtM
   FaJjk+ocsqlz8QabIBGgMoLieicf2JTx3ps3h0Sy2bUIJuuX8iYkyAwwj
   V8Pw/5TDUt0Kud4t2tWb501ECreoALuxdfy2wH3WM5LQB0rr5d5hKwf7j
   97+nv9ZNq+PfIk3M8VkVTtLpqtpOWH1WFaUmoYwDulhUpNV1mDCDu8b8f
   l53BSNYtkT4Z5JI9XzD+RlUzlJuq8ISJCaRsAeO2/hbhgy7pww8H1L5sy
   XBO2jINfEbi9Espwf0oNmOhxatkWI4dvAIpNdlHXdav+XvxqsPemOWCQT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="384620305"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="384620305"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 02:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="686045897"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="686045897"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Jun 2023 02:03:56 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6683-00043X-2i;
	Mon, 05 Jun 2023 09:03:55 +0000
Date: Mon, 5 Jun 2023 17:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/exynos/exynos5433_drm_decon.c:380:1: warning: the
 frame size of 1032 bytes is larger than 1024 bytes
Message-ID: <202306051601.dq3gKsik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Pankaj,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core60-51
head:   79f190d7ae78b399a873f6814484a1854cb4ba31
commit: 40d65d2237f41db253b25fb9e8f9bd1ff68d5d20 UPSTREAM: BACKPORT: drm: Introduce plane and CRTC scaling filter properties
date:   2 years, 4 months ago
config: mips-randconfig-c004-20230604 (https://download.01.org/0day-ci/archive/20230605/202306051601.dq3gKsik-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=40d65d2237f41db253b25fb9e8f9bd1ff68d5d20
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core60-51
        git checkout 40d65d2237f41db253b25fb9e8f9bd1ff68d5d20
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/exynos/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051601.dq3gKsik-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/exynos/exynos5433_drm_decon.c: In function 'decon_win_set_pixfmt':
>> drivers/gpu/drm/exynos/exynos5433_drm_decon.c:380:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     380 | }
         | ^


vim +380 drivers/gpu/drm/exynos/exynos5433_drm_decon.c

54947290ef6288 Christoph Manszewski 2018-10-25  317  
2eeb2e5e6634db Gustavo Padovan      2015-08-03  318  static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
2eeb2e5e6634db Gustavo Padovan      2015-08-03  319  				 struct drm_framebuffer *fb)
c8466a9166b00e Joonyoung Shim       2015-06-12  320  {
54947290ef6288 Christoph Manszewski 2018-10-25  321  	struct exynos_drm_plane plane = ctx->planes[win];
54947290ef6288 Christoph Manszewski 2018-10-25  322  	struct exynos_drm_plane_state *state =
54947290ef6288 Christoph Manszewski 2018-10-25  323  		to_exynos_plane_state(plane.base.state);
54947290ef6288 Christoph Manszewski 2018-10-25  324  	unsigned int alpha = state->base.alpha;
af130280c61321 Christoph Manszewski 2018-10-25  325  	unsigned int pixel_alpha;
c8466a9166b00e Joonyoung Shim       2015-06-12  326  	unsigned long val;
c8466a9166b00e Joonyoung Shim       2015-06-12  327  
af130280c61321 Christoph Manszewski 2018-10-25  328  	if (fb->format->has_alpha)
af130280c61321 Christoph Manszewski 2018-10-25  329  		pixel_alpha = state->base.pixel_blend_mode;
af130280c61321 Christoph Manszewski 2018-10-25  330  	else
af130280c61321 Christoph Manszewski 2018-10-25  331  		pixel_alpha = DRM_MODE_BLEND_PIXEL_NONE;
af130280c61321 Christoph Manszewski 2018-10-25  332  
c8466a9166b00e Joonyoung Shim       2015-06-12  333  	val = readl(ctx->addr + DECON_WINCONx(win));
7b7aa62c05eac9 Marek Szyprowski     2018-06-07  334  	val &= WINCONx_ENWIN_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  335  
438b74a5497c36 Ville Syrjälä        2016-12-14  336  	switch (fb->format->format) {
c8466a9166b00e Joonyoung Shim       2015-06-12  337  	case DRM_FORMAT_XRGB1555:
c8466a9166b00e Joonyoung Shim       2015-06-12  338  		val |= WINCONx_BPPMODE_16BPP_I1555;
c8466a9166b00e Joonyoung Shim       2015-06-12  339  		val |= WINCONx_HAWSWP_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  340  		val |= WINCONx_BURSTLEN_16WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  341  		break;
c8466a9166b00e Joonyoung Shim       2015-06-12  342  	case DRM_FORMAT_RGB565:
c8466a9166b00e Joonyoung Shim       2015-06-12  343  		val |= WINCONx_BPPMODE_16BPP_565;
c8466a9166b00e Joonyoung Shim       2015-06-12  344  		val |= WINCONx_HAWSWP_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  345  		val |= WINCONx_BURSTLEN_16WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  346  		break;
c8466a9166b00e Joonyoung Shim       2015-06-12  347  	case DRM_FORMAT_XRGB8888:
c8466a9166b00e Joonyoung Shim       2015-06-12  348  		val |= WINCONx_BPPMODE_24BPP_888;
c8466a9166b00e Joonyoung Shim       2015-06-12  349  		val |= WINCONx_WSWP_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  350  		val |= WINCONx_BURSTLEN_16WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  351  		break;
c8466a9166b00e Joonyoung Shim       2015-06-12  352  	case DRM_FORMAT_ARGB8888:
5b7b1b7fa10145 Tobias Jakobi        2017-08-22  353  	default:
c8466a9166b00e Joonyoung Shim       2015-06-12  354  		val |= WINCONx_BPPMODE_32BPP_A8888;
af130280c61321 Christoph Manszewski 2018-10-25  355  		val |= WINCONx_WSWP_F;
c8466a9166b00e Joonyoung Shim       2015-06-12  356  		val |= WINCONx_BURSTLEN_16WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  357  		break;
c8466a9166b00e Joonyoung Shim       2015-06-12  358  	}
c8466a9166b00e Joonyoung Shim       2015-06-12  359  
6be900563a9e74 Inki Dae             2019-04-15  360  	DRM_DEV_DEBUG_KMS(ctx->dev, "cpp = %u\n", fb->format->cpp[0]);
c8466a9166b00e Joonyoung Shim       2015-06-12  361  
c8466a9166b00e Joonyoung Shim       2015-06-12  362  	/*
c8466a9166b00e Joonyoung Shim       2015-06-12  363  	 * In case of exynos, setting dma-burst to 16Word causes permanent
c8466a9166b00e Joonyoung Shim       2015-06-12  364  	 * tearing for very small buffers, e.g. cursor buffer. Burst Mode
c8466a9166b00e Joonyoung Shim       2015-06-12  365  	 * switching which is based on plane size is not recommended as
c8466a9166b00e Joonyoung Shim       2015-06-12  366  	 * plane size varies a lot towards the end of the screen and rapid
c8466a9166b00e Joonyoung Shim       2015-06-12  367  	 * movement causes unstable DMA which results into iommu crash/tear.
c8466a9166b00e Joonyoung Shim       2015-06-12  368  	 */
c8466a9166b00e Joonyoung Shim       2015-06-12  369  
2eeb2e5e6634db Gustavo Padovan      2015-08-03  370  	if (fb->width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
c8466a9166b00e Joonyoung Shim       2015-06-12  371  		val &= ~WINCONx_BURSTLEN_MASK;
c8466a9166b00e Joonyoung Shim       2015-06-12  372  		val |= WINCONx_BURSTLEN_8WORD;
c8466a9166b00e Joonyoung Shim       2015-06-12  373  	}
af130280c61321 Christoph Manszewski 2018-10-25  374  	decon_set_bits(ctx, DECON_WINCONx(win), ~WINCONx_BLEND_MODE_MASK, val);
c8466a9166b00e Joonyoung Shim       2015-06-12  375  
af130280c61321 Christoph Manszewski 2018-10-25  376  	if (win > 0) {
af130280c61321 Christoph Manszewski 2018-10-25  377  		decon_win_set_bldmod(ctx, win, alpha, pixel_alpha);
af130280c61321 Christoph Manszewski 2018-10-25  378  		decon_win_set_bldeq(ctx, win, alpha, pixel_alpha);
af130280c61321 Christoph Manszewski 2018-10-25  379  	}
c8466a9166b00e Joonyoung Shim       2015-06-12 @380  }
c8466a9166b00e Joonyoung Shim       2015-06-12  381  

:::::: The code at line 380 was first introduced by commit
:::::: c8466a9166b00ecb0c6f768baf70636fe15f63ef drm/exynos: add Exynos5433 decon driver

:::::: TO: Joonyoung Shim <jy0922.shim@samsung.com>
:::::: CC: Inki Dae <inki.dae@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
