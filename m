Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7952701CB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765487816; cv=none; b=l0dXYGAXraHHA3UOe6Ynf1rVQHdrtUnJ6FNpvl3Y+f3vpVQJGFjDFDO3h/sowwy5FlVIeh7Ox98MAe9t4XevgPOlYpFUZBm6JL+ZpaapvtPcklXBP7iXF4RDqxJdxJIyyKMLBE9ejct7FzuhW3dygkr+bVqhJASuZlcHrvsoUJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765487816; c=relaxed/simple;
	bh=IGknT/Xysz7UyltrA/1yJcGKiwYR2HhJ+J914Gd3yLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=koBuf6mxisAWnBKOebbIVqEkfdN1/U50KWP/N9z66Jwxt1/4Fy66l65Q2R9f/kuOsH5Li+QrLVC5LWreAbfM1WUZtM0YZTaSCbQj/lc9wTUTLRdCed8D1g2AvCPeaew7VhnEEi/H8SNXIn7i4lyPFZlAaaPoryzhzBG+d4WH1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7UKFURH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7UKFURH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765487814; x=1797023814;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IGknT/Xysz7UyltrA/1yJcGKiwYR2HhJ+J914Gd3yLM=;
  b=B7UKFURHCNSbPzn+XNxW5qWXaSAyHwdeE82id9AWUNY9tV24+vWO5q/u
   zQrL6Bb5uWMvJQvtdJjtzEUkLA894aPrj6YGuhWp8wAYB8StL9MPbAp8N
   Nh/J8L8A8QRw92Xmv//JbEy9ihLv0TCAUJMCUpD3BcD8rHi8qRMvXHbao
   VvLDJifz8Nfzzg5ZnOgPXK8FxkCOonlC7dPPGkPE6B9BFerTQfIRgpBl1
   5XVYowHAF1nmfPq0tT77gnk3Wt76vQ0yecmYt3Z7OGEmYF7fHfkfbB100
   78fCPYp1FFPYY8Gqp7rLQZbUUinOCzUMtTyij75EEJ0LPS02fZ2g3DZes
   g==;
X-CSE-ConnectionGUID: gYIZEKznSD6Rd313oofPpQ==
X-CSE-MsgGUID: NWDcifnJT2S4Snp92wUqPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="77794348"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="77794348"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 13:16:53 -0800
X-CSE-ConnectionGUID: 4oYUzmNmTUmpc1vRjphjaw==
X-CSE-MsgGUID: o/NIggJpSQmCVBygpL3DuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197719150"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 13:16:52 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTo1q-000000001Ca-0YOB;
	Thu, 11 Dec 2025 21:16:50 +0000
Date: Thu, 11 Dec 2025 22:15:55 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lin Yujun <linyujun809@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs:
 ./include/drm/drm_fourcc.h:149: warning: Function parameter or member
 'KABI_RESERVE(1' not described in 'drm_format_info'
Message-ID: <202512112225.hE3xUWyq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 2ca47cd62ebb51e337e558943c1d23e4a5f2fbcf [3508/3508] drm: drm_fourcc.h: Add kabi_reserve
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512112225.hE3xUWyq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112225.hE3xUWyq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/drm/drm_client.h:163: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_client_buffer'
   ./include/drm/drm_atomic.h:246: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state_funcs'
   ./include/drm/drm_atomic.h:347: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state'
   ./include/drm/drm_crtc.h:392: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_crtc_state'
   ./include/drm/drm_crtc.h:1185: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_crtc'
>> ./include/drm/drm_fourcc.h:149: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_format_info'
   ./include/drm/drm_connector.h:328: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_hdmi_info'
   ./include/drm/drm_connector.h:531: warning: Enum value 'DRM_MODE_COLORIMETRY_COUNT' not described in enum 'drm_colorspace'
   ./include/drm/drm_connector.h:826: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_display_info'
   ./include/drm/drm_connector.h:888: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_tv_connector_state'
   ./include/drm/drm_connector.h:1350: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_connector_funcs'


vim +149 ./include/drm/drm_fourcc.h

6a0f9ebfc5e753 Ville Syrjälä      2017-03-21   59  
84770cc24f3a51 Laurent Pinchart   2016-10-18   60  /**
84770cc24f3a51 Laurent Pinchart   2016-10-18   61   * struct drm_format_info - information about a DRM format
84770cc24f3a51 Laurent Pinchart   2016-10-18   62   */
84770cc24f3a51 Laurent Pinchart   2016-10-18   63  struct drm_format_info {
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   64  	/** @format: 4CC format identifier (DRM_FORMAT_*) */
84770cc24f3a51 Laurent Pinchart   2016-10-18   65  	u32 format;
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   66  
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   67  	/**
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   68  	 * @depth:
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   69  	 *
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   70  	 * Color depth (number of bits per pixel excluding padding bits),
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   71  	 * valid for a subset of RGB formats only. This is a legacy field, do
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   72  	 * not use in new code and set to 0 for new formats.
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   73  	 */
84770cc24f3a51 Laurent Pinchart   2016-10-18   74  	u8 depth;
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   75  
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   76  	/** @num_planes: Number of color planes (1 to 3) */
84770cc24f3a51 Laurent Pinchart   2016-10-18   77  	u8 num_planes;
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   78  
042bf753842ddb Alexandru Gheorghe 2018-11-01   79  	union {
042bf753842ddb Alexandru Gheorghe 2018-11-01   80  		/**
042bf753842ddb Alexandru Gheorghe 2018-11-01   81  		 * @cpp:
042bf753842ddb Alexandru Gheorghe 2018-11-01   82  		 *
042bf753842ddb Alexandru Gheorghe 2018-11-01   83  		 * Number of bytes per pixel (per plane), this is aliased with
042bf753842ddb Alexandru Gheorghe 2018-11-01   84  		 * @char_per_block. It is deprecated in favour of using the
042bf753842ddb Alexandru Gheorghe 2018-11-01   85  		 * triplet @char_per_block, @block_w, @block_h for better
042bf753842ddb Alexandru Gheorghe 2018-11-01   86  		 * describing the pixel format.
042bf753842ddb Alexandru Gheorghe 2018-11-01   87  		 */
279cc2e9543eb3 Thomas Zimmermann  2021-07-30   88  		u8 cpp[DRM_FORMAT_MAX_PLANES];
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19   89  
042bf753842ddb Alexandru Gheorghe 2018-11-01   90  		/**
042bf753842ddb Alexandru Gheorghe 2018-11-01   91  		 * @char_per_block:
042bf753842ddb Alexandru Gheorghe 2018-11-01   92  		 *
042bf753842ddb Alexandru Gheorghe 2018-11-01   93  		 * Number of bytes per block (per plane), where blocks are
042bf753842ddb Alexandru Gheorghe 2018-11-01   94  		 * defined as a rectangle of pixels which are stored next to
042bf753842ddb Alexandru Gheorghe 2018-11-01   95  		 * each other in a byte aligned memory region. Together with
042bf753842ddb Alexandru Gheorghe 2018-11-01   96  		 * @block_w and @block_h this is used to properly describe tiles
042bf753842ddb Alexandru Gheorghe 2018-11-01   97  		 * in tiled formats or to describe groups of pixels in packed
042bf753842ddb Alexandru Gheorghe 2018-11-01   98  		 * formats for which the memory needed for a single pixel is not
042bf753842ddb Alexandru Gheorghe 2018-11-01   99  		 * byte aligned.
042bf753842ddb Alexandru Gheorghe 2018-11-01  100  		 *
042bf753842ddb Alexandru Gheorghe 2018-11-01  101  		 * @cpp has been kept for historical reasons because there are
042bf753842ddb Alexandru Gheorghe 2018-11-01  102  		 * a lot of places in drivers where it's used. In drm core for
042bf753842ddb Alexandru Gheorghe 2018-11-01  103  		 * generic code paths the preferred way is to use
042bf753842ddb Alexandru Gheorghe 2018-11-01  104  		 * @char_per_block, drm_format_info_block_width() and
042bf753842ddb Alexandru Gheorghe 2018-11-01  105  		 * drm_format_info_block_height() which allows handling both
042bf753842ddb Alexandru Gheorghe 2018-11-01  106  		 * block and non-block formats in the same way.
042bf753842ddb Alexandru Gheorghe 2018-11-01  107  		 *
042bf753842ddb Alexandru Gheorghe 2018-11-01  108  		 * For formats that are intended to be used only with non-linear
042bf753842ddb Alexandru Gheorghe 2018-11-01  109  		 * modifiers both @cpp and @char_per_block must be 0 in the
042bf753842ddb Alexandru Gheorghe 2018-11-01  110  		 * generic format table. Drivers could supply accurate
042bf753842ddb Alexandru Gheorghe 2018-11-01  111  		 * information from their drm_mode_config.get_format_info hook
042bf753842ddb Alexandru Gheorghe 2018-11-01  112  		 * if they want the core to be validating the pitch.
042bf753842ddb Alexandru Gheorghe 2018-11-01  113  		 */
279cc2e9543eb3 Thomas Zimmermann  2021-07-30  114  		u8 char_per_block[DRM_FORMAT_MAX_PLANES];
042bf753842ddb Alexandru Gheorghe 2018-11-01  115  	};
042bf753842ddb Alexandru Gheorghe 2018-11-01  116  
042bf753842ddb Alexandru Gheorghe 2018-11-01  117  	/**
042bf753842ddb Alexandru Gheorghe 2018-11-01  118  	 * @block_w:
042bf753842ddb Alexandru Gheorghe 2018-11-01  119  	 *
042bf753842ddb Alexandru Gheorghe 2018-11-01  120  	 * Block width in pixels, this is intended to be accessed through
042bf753842ddb Alexandru Gheorghe 2018-11-01  121  	 * drm_format_info_block_width()
042bf753842ddb Alexandru Gheorghe 2018-11-01  122  	 */
279cc2e9543eb3 Thomas Zimmermann  2021-07-30  123  	u8 block_w[DRM_FORMAT_MAX_PLANES];
042bf753842ddb Alexandru Gheorghe 2018-11-01  124  
042bf753842ddb Alexandru Gheorghe 2018-11-01  125  	/**
042bf753842ddb Alexandru Gheorghe 2018-11-01  126  	 * @block_h:
042bf753842ddb Alexandru Gheorghe 2018-11-01  127  	 *
042bf753842ddb Alexandru Gheorghe 2018-11-01  128  	 * Block height in pixels, this is intended to be accessed through
042bf753842ddb Alexandru Gheorghe 2018-11-01  129  	 * drm_format_info_block_height()
042bf753842ddb Alexandru Gheorghe 2018-11-01  130  	 */
279cc2e9543eb3 Thomas Zimmermann  2021-07-30  131  	u8 block_h[DRM_FORMAT_MAX_PLANES];
042bf753842ddb Alexandru Gheorghe 2018-11-01  132  
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19  133  	/** @hsub: Horizontal chroma subsampling factor */
84770cc24f3a51 Laurent Pinchart   2016-10-18  134  	u8 hsub;
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19  135  	/** @vsub: Vertical chroma subsampling factor */
84770cc24f3a51 Laurent Pinchart   2016-10-18  136  	u8 vsub;
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19  137  
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19  138  	/** @has_alpha: Does the format embeds an alpha component? */
4cc4e1b40f3ff5 Maxime Ripard      2017-12-22  139  	bool has_alpha;
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19  140  
9c71a6686bfa4b Alexandru Gheorghe 2018-10-19  141  	/** @is_yuv: Is it a YUV format? */
ce2d54619a1078 Ayan Kumar Halder  2018-07-17  142  	bool is_yuv;
dc1dc76bd9a48c Geert Uytterhoeven 2022-07-08  143  
dc1dc76bd9a48c Geert Uytterhoeven 2022-07-08  144  	/** @is_color_indexed: Is it a color-indexed format? */
dc1dc76bd9a48c Geert Uytterhoeven 2022-07-08  145  	bool is_color_indexed;
2ca47cd62ebb51 Lin Yujun          2024-02-04  146  
2ca47cd62ebb51 Lin Yujun          2024-02-04  147  	KABI_RESERVE(1)
2ca47cd62ebb51 Lin Yujun          2024-02-04  148  	KABI_RESERVE(2)
84770cc24f3a51 Laurent Pinchart   2016-10-18 @149  };
84770cc24f3a51 Laurent Pinchart   2016-10-18  150  

:::::: The code at line 149 was first introduced by commit
:::::: 84770cc24f3a51c05055665feeac1dcf22119d69 drm: Centralize format information

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Archit Taneja <architt@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
