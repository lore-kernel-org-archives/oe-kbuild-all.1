Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC113D967
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714976244; cv=none; b=UTq0IHDQTxoaLWfq2aIAtqLrdWcpqtElPqMmoOxuKN433b+sYTR7BrJ9kiKblBKqntzO9pj99k7Iy5AWtAqazd1PZ60lwTJ6OfnIjpdUfDoJf7Uk2wdy94cikDgcSjGaGJtCOx6EU1uF3sjUTKeyjPN52wNaPBuQ8SFpYcj1YFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714976244; c=relaxed/simple;
	bh=DS75kR6rvA6P03ay+HToIVPzYFK1TrZv0isR3R/fu4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n8bQRWFas0IsB0oqJPRx9DSAgkRb41itQTvTPk0kY+l4Y9/77GhfAmIbIhzI4UfrHjSSv0CK3Bw1tsnzZLJ8K1XwnsAkf86OlpkjdhhizvGFoXucX3mqQmwjnfVYLtMX03DxPiYGjWE9P0hQ4i3r9VyJbA5s1vS+YNwrhYWC320=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gn1DzL0J; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gn1DzL0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714976242; x=1746512242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DS75kR6rvA6P03ay+HToIVPzYFK1TrZv0isR3R/fu4U=;
  b=Gn1DzL0JH7u5HLDu0Kqnc5ST6h5rqBtFHghLRsRQ33X1LD5jWkvQoa98
   B2zMrJXi4oCn4f5sZl1Fp/x5Pf5KeaP8lhkqL2VY/QPknKWme6j3zmHsM
   mllxyIYYO6dp9rtFF0uzbpDzdHva7788BxoEZrlqJ0kf+z54Bo1Ige2WY
   2o35uw6FUzaqyHv1JKcLF+IXMB9YroWeUQ36q7VXr+P/w/Ux+BJpZhGTw
   XzteSpKv1R11qpTyAb7SToelHIUgROLzTZesE4vwjaTxFWGtrTi9vQ+EY
   QTyel1c8B+8HMs1OC7a4j1nr94RNyTUwWhbIQikLl2zurQpZnsiYuV046
   g==;
X-CSE-ConnectionGUID: k+IQtRmeT02ogVj9T+PPDA==
X-CSE-MsgGUID: OK3FuWUTSeuGF4mgX6pZIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14492751"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="14492751"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 23:17:21 -0700
X-CSE-ConnectionGUID: EsECcozQTVWhclR1Sci4kw==
X-CSE-MsgGUID: Ea8FpC9WQly65l7NxxqvxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="27946571"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 May 2024 23:17:20 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3rf3-0000VL-1R;
	Mon, 06 May 2024 06:17:17 +0000
Date: Mon, 6 May 2024 14:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [linux-next:master 10340/10967]
 drivers/gpu/drm/panel/panel-lg-sw43408.c:106:undefined reference to
 `drm_dsc_pps_payload_pack'
Message-ID: <202405061441.2d9bfNRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9221b2819b8a4196eecf5476d66201be60fbcf29
commit: 7fe302ae198a35ac071d3a9e78ebd8e14b0958eb [10340/10967] Revert "drm: Switch DRM_DISPLAY_DP_HELPER to depends on"
config: i386-randconfig-012-20240506 (https://download.01.org/0day-ci/archive/20240506/202405061441.2d9bfNRP-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061441.2d9bfNRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405061441.2d9bfNRP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/panel/panel-lg-sw43408.o: in function `sw43408_program':
>> drivers/gpu/drm/panel/panel-lg-sw43408.c:106:(.text+0x35c): undefined reference to `drm_dsc_pps_payload_pack'


vim +106 drivers/gpu/drm/panel/panel-lg-sw43408.c

069a6c0e94f994 Sumit Semwal 2024-04-08   60  
069a6c0e94f994 Sumit Semwal 2024-04-08   61  static int sw43408_program(struct drm_panel *panel)
069a6c0e94f994 Sumit Semwal 2024-04-08   62  {
069a6c0e94f994 Sumit Semwal 2024-04-08   63  	struct sw43408_panel *ctx = to_panel_info(panel);
069a6c0e94f994 Sumit Semwal 2024-04-08   64  	struct drm_dsc_picture_parameter_set pps;
069a6c0e94f994 Sumit Semwal 2024-04-08   65  
069a6c0e94f994 Sumit Semwal 2024-04-08   66  	mipi_dsi_dcs_write_seq(ctx->link, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
069a6c0e94f994 Sumit Semwal 2024-04-08   67  
069a6c0e94f994 Sumit Semwal 2024-04-08   68  	mipi_dsi_dcs_set_tear_on(ctx->link, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
069a6c0e94f994 Sumit Semwal 2024-04-08   69  
069a6c0e94f994 Sumit Semwal 2024-04-08   70  	mipi_dsi_dcs_write_seq(ctx->link, 0x53, 0x0c, 0x30);
069a6c0e94f994 Sumit Semwal 2024-04-08   71  	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x00, 0x70, 0xdf, 0x00, 0x70, 0xdf);
069a6c0e94f994 Sumit Semwal 2024-04-08   72  	mipi_dsi_dcs_write_seq(ctx->link, 0xf7, 0x01, 0x49, 0x0c);
069a6c0e94f994 Sumit Semwal 2024-04-08   73  
069a6c0e94f994 Sumit Semwal 2024-04-08   74  	mipi_dsi_dcs_exit_sleep_mode(ctx->link);
069a6c0e94f994 Sumit Semwal 2024-04-08   75  
069a6c0e94f994 Sumit Semwal 2024-04-08   76  	msleep(135);
069a6c0e94f994 Sumit Semwal 2024-04-08   77  
069a6c0e94f994 Sumit Semwal 2024-04-08   78  	/* COMPRESSION_MODE moved after setting the PPS */
069a6c0e94f994 Sumit Semwal 2024-04-08   79  
069a6c0e94f994 Sumit Semwal 2024-04-08   80  	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xac);
069a6c0e94f994 Sumit Semwal 2024-04-08   81  	mipi_dsi_dcs_write_seq(ctx->link, 0xe5,
069a6c0e94f994 Sumit Semwal 2024-04-08   82  			       0x00, 0x3a, 0x00, 0x3a, 0x00, 0x0e, 0x10);
069a6c0e94f994 Sumit Semwal 2024-04-08   83  	mipi_dsi_dcs_write_seq(ctx->link, 0xb5,
069a6c0e94f994 Sumit Semwal 2024-04-08   84  			       0x75, 0x60, 0x2d, 0x5d, 0x80, 0x00, 0x0a, 0x0b,
069a6c0e94f994 Sumit Semwal 2024-04-08   85  			       0x00, 0x05, 0x0b, 0x00, 0x80, 0x0d, 0x0e, 0x40,
069a6c0e94f994 Sumit Semwal 2024-04-08   86  			       0x00, 0x0c, 0x00, 0x16, 0x00, 0xb8, 0x00, 0x80,
069a6c0e94f994 Sumit Semwal 2024-04-08   87  			       0x0d, 0x0e, 0x40, 0x00, 0x0c, 0x00, 0x16, 0x00,
069a6c0e94f994 Sumit Semwal 2024-04-08   88  			       0xb8, 0x00, 0x81, 0x00, 0x03, 0x03, 0x03, 0x01,
069a6c0e94f994 Sumit Semwal 2024-04-08   89  			       0x01);
069a6c0e94f994 Sumit Semwal 2024-04-08   90  	msleep(85);
069a6c0e94f994 Sumit Semwal 2024-04-08   91  	mipi_dsi_dcs_write_seq(ctx->link, 0xcd,
069a6c0e94f994 Sumit Semwal 2024-04-08   92  			       0x00, 0x00, 0x00, 0x19, 0x19, 0x19, 0x19, 0x19,
069a6c0e94f994 Sumit Semwal 2024-04-08   93  			       0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19,
069a6c0e94f994 Sumit Semwal 2024-04-08   94  			       0x16, 0x16);
069a6c0e94f994 Sumit Semwal 2024-04-08   95  	mipi_dsi_dcs_write_seq(ctx->link, 0xcb, 0x80, 0x5c, 0x07, 0x03, 0x28);
069a6c0e94f994 Sumit Semwal 2024-04-08   96  	mipi_dsi_dcs_write_seq(ctx->link, 0xc0, 0x02, 0x02, 0x0f);
069a6c0e94f994 Sumit Semwal 2024-04-08   97  	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
069a6c0e94f994 Sumit Semwal 2024-04-08   98  	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xca);
069a6c0e94f994 Sumit Semwal 2024-04-08   99  
069a6c0e94f994 Sumit Semwal 2024-04-08  100  	mipi_dsi_dcs_set_display_on(ctx->link);
069a6c0e94f994 Sumit Semwal 2024-04-08  101  
069a6c0e94f994 Sumit Semwal 2024-04-08  102  	msleep(50);
069a6c0e94f994 Sumit Semwal 2024-04-08  103  
069a6c0e94f994 Sumit Semwal 2024-04-08  104  	ctx->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
069a6c0e94f994 Sumit Semwal 2024-04-08  105  
069a6c0e94f994 Sumit Semwal 2024-04-08 @106  	drm_dsc_pps_payload_pack(&pps, ctx->link->dsc);
069a6c0e94f994 Sumit Semwal 2024-04-08  107  	mipi_dsi_picture_parameter_set(ctx->link, &pps);
069a6c0e94f994 Sumit Semwal 2024-04-08  108  
069a6c0e94f994 Sumit Semwal 2024-04-08  109  	ctx->link->mode_flags |= MIPI_DSI_MODE_LPM;
069a6c0e94f994 Sumit Semwal 2024-04-08  110  
069a6c0e94f994 Sumit Semwal 2024-04-08  111  	/*
069a6c0e94f994 Sumit Semwal 2024-04-08  112  	 * This panel uses PPS selectors with offset:
069a6c0e94f994 Sumit Semwal 2024-04-08  113  	 * PPS 1 if pps_identifier is 0
069a6c0e94f994 Sumit Semwal 2024-04-08  114  	 * PPS 2 if pps_identifier is 1
069a6c0e94f994 Sumit Semwal 2024-04-08  115  	 */
069a6c0e94f994 Sumit Semwal 2024-04-08  116  	mipi_dsi_compression_mode_ext(ctx->link, true,
069a6c0e94f994 Sumit Semwal 2024-04-08  117  				      MIPI_DSI_COMPRESSION_DSC, 1);
069a6c0e94f994 Sumit Semwal 2024-04-08  118  
069a6c0e94f994 Sumit Semwal 2024-04-08  119  	return 0;
069a6c0e94f994 Sumit Semwal 2024-04-08  120  }
069a6c0e94f994 Sumit Semwal 2024-04-08  121  

:::::: The code at line 106 was first introduced by commit
:::::: 069a6c0e94f99437652dbb7229a56233c7d39968 drm: panel: Add LG sw43408 panel driver

:::::: TO: Sumit Semwal <sumit.semwal@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
