Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132E1B3B19
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765445627; cv=none; b=D/u++PUtUmsgvnitNuH1SUeb5CSxjVnC5OnhVCkzIQ+s7NdLOAmRGn4o2B5RYFOQr9p48aunpGg1c/lPs+ULFGIXSAfXly49wuHOP0po78xrg5eBBUKO4CTOvl1v6t8sjzkJh3PJQ/sBj+/9J3UHbdAGAIqYU9fQmTdRhX8ihJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765445627; c=relaxed/simple;
	bh=tZUXtev9dGaX+I5I9o/qUdxbW2awOgqJLOX9faaMkQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pFulcPaWa8h7PDhGTq589gEax5+Ds/SzQrfsYxPYVCZxTxT7rie5BnI+zJaDQuIloC7e/L92/3qiYO0dVffEaEqQjLKcDOPA9Y4gsM88QLd1ChTnvLVr2uW6AstJh87WOZCp3nSxiImbRaEOj+4tgZstAWA4aaLYxFx21yTB4cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeXC6Exy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeXC6Exy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765445625; x=1796981625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZUXtev9dGaX+I5I9o/qUdxbW2awOgqJLOX9faaMkQY=;
  b=jeXC6ExyG0uGo4wNUpyjoYUzpCFlRascBANpzPyJ2gyE75oHnLMAcdCy
   0zyw++GS3lNsrX5ijdEP+RsX3Ptt/cA2TDfnggh4igGHolZz344SD820m
   KtST11yiSrr4hnUY3sV5TWQLDpei1Oh08IruTcwJmIVqwx2JisJCzkNXe
   tZR8yhlHxRrsT5srhkHY0OMpc4ISTMK5Ea1KV1q+ixyHZE5V0pm1RZ17P
   ijy9T2KiaLNOwA9w/f5XSEkfRhNrhI1iN6PV8S4zZ2ap7Scj2W0Zc6vSq
   BSdbPUJGey+Vmh3dsSocxN3D2ucnFxafqyjeTBnyprRXQuFwPyvuYM5Ko
   g==;
X-CSE-ConnectionGUID: bTFXVe6WSM2p23YT7pOC0g==
X-CSE-MsgGUID: kpjD1bl3QUOFn8RkYDs1vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="90071487"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="90071487"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:33:44 -0800
X-CSE-ConnectionGUID: M7g+U7C8TUW+dQgr+jnerA==
X-CSE-MsgGUID: THXC53O1RHSjxGNpDc9eBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201175464"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 01:33:42 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTd3M-000000000zE-0TjO;
	Thu, 11 Dec 2025 09:33:40 +0000
Date: Thu, 11 Dec 2025 10:33:19 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lin Yujun <linyujun809@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs:
 ./include/drm/drm_connector.h:328: warning: Function parameter or member
 'KABI_RESERVE(1' not described in 'drm_hdmi_info'
Message-ID: <202512111048.rwyzTlEH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: d67d4ba70c215e955e6a657b6142645719e7fd34 [3508/3508] drm: drm_connector.h: Add kabi_reserve
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512111048.rwyzTlEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111048.rwyzTlEH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/backlight.h
   ./include/drm/drm_client.h:121: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_client_dev'
   ./include/drm/drm_client.h:163: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_client_buffer'
   ./include/drm/drm_atomic.h:246: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state_funcs'
   ./include/drm/drm_atomic.h:347: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state'
>> ./include/drm/drm_connector.h:328: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_hdmi_info'
   ./include/drm/drm_connector.h:531: warning: Enum value 'DRM_MODE_COLORIMETRY_COUNT' not described in enum 'drm_colorspace'
>> ./include/drm/drm_connector.h:826: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_display_info'
>> ./include/drm/drm_connector.h:888: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_tv_connector_state'
>> ./include/drm/drm_connector.h:1350: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_connector_funcs'
>> ./include/drm/drm_connector.h:1499: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_cmdline_mode'
>> ./include/drm/drm_connector.h:1897: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_connector'
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/host1x.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h


vim +328 ./include/drm/drm_connector.h

62c58af32c935a Shashank Sharma 2017-03-13  287  
afa1c763653e0f Shashank Sharma 2017-03-13  288  /**
afa1c763653e0f Shashank Sharma 2017-03-13  289   * struct drm_hdmi_info - runtime information about the connected HDMI sink
afa1c763653e0f Shashank Sharma 2017-03-13  290   *
afa1c763653e0f Shashank Sharma 2017-03-13  291   * Describes if a given display supports advanced HDMI 2.0 features.
afa1c763653e0f Shashank Sharma 2017-03-13  292   * This information is available in CEA-861-F extension blocks (like HF-VSDB).
afa1c763653e0f Shashank Sharma 2017-03-13  293   */
afa1c763653e0f Shashank Sharma 2017-03-13  294  struct drm_hdmi_info {
86cc921cb4aa8f Shashank Sharma 2017-03-28  295  	/** @scdc: sink's scdc support and capabilities */
afa1c763653e0f Shashank Sharma 2017-03-13  296  	struct drm_scdc scdc;
d85231530b0719 Shashank Sharma 2017-07-13  297  
d85231530b0719 Shashank Sharma 2017-07-13  298  	/**
d85231530b0719 Shashank Sharma 2017-07-13  299  	 * @y420_vdb_modes: bitmap of modes which can support ycbcr420
919dfb7830568f Thomas Anderson 2019-12-10  300  	 * output only (not normal RGB/YCBCR444/422 outputs). The max VIC
919dfb7830568f Thomas Anderson 2019-12-10  301  	 * defined by the CEA-861-G spec is 219, so the size is 256 bits to map
919dfb7830568f Thomas Anderson 2019-12-10  302  	 * up to 256 VICs.
d85231530b0719 Shashank Sharma 2017-07-13  303  	 */
919dfb7830568f Thomas Anderson 2019-12-10  304  	unsigned long y420_vdb_modes[BITS_TO_LONGS(256)];
832d4f2f417d17 Shashank Sharma 2017-07-14  305  
832d4f2f417d17 Shashank Sharma 2017-07-14  306  	/**
832d4f2f417d17 Shashank Sharma 2017-07-14  307  	 * @y420_cmdb_modes: bitmap of modes which can support ycbcr420
919dfb7830568f Thomas Anderson 2019-12-10  308  	 * output also, along with normal HDMI outputs. The max VIC defined by
919dfb7830568f Thomas Anderson 2019-12-10  309  	 * the CEA-861-G spec is 219, so the size is 256 bits to map up to 256
919dfb7830568f Thomas Anderson 2019-12-10  310  	 * VICs.
832d4f2f417d17 Shashank Sharma 2017-07-14  311  	 */
919dfb7830568f Thomas Anderson 2019-12-10  312  	unsigned long y420_cmdb_modes[BITS_TO_LONGS(256)];
832d4f2f417d17 Shashank Sharma 2017-07-14  313  
e6a9a2c3dc4377 Shashank Sharma 2017-07-13  314  	/** @y420_dc_modes: bitmap of deep color support index */
e6a9a2c3dc4377 Shashank Sharma 2017-07-13  315  	u8 y420_dc_modes;
4499d488f6eeb1 Swati Sharma    2020-12-18  316  
4499d488f6eeb1 Swati Sharma    2020-12-18  317  	/** @max_frl_rate_per_lane: support fixed rate link */
4499d488f6eeb1 Swati Sharma    2020-12-18  318  	u8 max_frl_rate_per_lane;
4499d488f6eeb1 Swati Sharma    2020-12-18  319  
4499d488f6eeb1 Swati Sharma    2020-12-18  320  	/** @max_lanes: supported by sink */
4499d488f6eeb1 Swati Sharma    2020-12-18  321  	u8 max_lanes;
76ee7b905678f4 Ankit Nautiyal  2020-12-18  322  
76ee7b905678f4 Ankit Nautiyal  2020-12-18  323  	/** @dsc_cap: DSC capabilities of the sink */
76ee7b905678f4 Ankit Nautiyal  2020-12-18  324  	struct drm_hdmi_dsc_cap dsc_cap;
d67d4ba70c215e Lin Yujun       2024-02-04  325  
d67d4ba70c215e Lin Yujun       2024-02-04  326  	KABI_RESERVE(1)
d67d4ba70c215e Lin Yujun       2024-02-04  327  	KABI_RESERVE(2)
52217195176115 Daniel Vetter   2016-08-12 @328  };
52217195176115 Daniel Vetter   2016-08-12  329  

:::::: The code at line 328 was first introduced by commit
:::::: 522171951761153172c75b94ae1f4bc9ab631745 drm: Extract drm_connector.[hc]

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
