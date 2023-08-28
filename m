Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FB86116
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693237643; x=1724773643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=60BLtUsw73w8gp/YFjcAp6reQ0Pby4CdXm/6rOzkdZc=;
  b=k+TGvh4Jmi6OGtMIy+kiEGEhtXXggdBv8GgF3I6QZZf7+m+5YjfTm5Bj
   ZLTWKwktq9in9lxf5sg0arDMAINy6Fh20wscJzIb4Y1sthb9EBMp4XXXT
   7LMrGZoQYWc4J48chrf4fII3Vq2O0YZnTIaEcurDDqz9ZiohEcANOxAQo
   zmR5xnBTtY8yZVhq1PDSuqeCFIt43TB8Wm/Wsuv7EGGf5XEkzpI5N+61k
   ZkzrhV8azH7myVvg820fpN3pMHIlLcp8Oz1E/kG8XQam9ooVC4Pqgu62D
   8vhlbfiRqEXsiRKCSZaW217Q5S660/x/1qhXUysf32i/2VkthUbJShQVo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441479776"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="441479776"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 08:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="1069092537"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="1069092537"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 08:46:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaeRw-0007zf-3A;
	Mon, 28 Aug 2023 15:46:44 +0000
Date: Mon, 28 Aug 2023 23:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 37/39]
 drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or
 member 'is_ck_de_pol' not described in 'mtk_dpi_conf'
Message-ID: <202308282307.9CySMB7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   01b0f7911af24417437d518fbca859a0e2caf01c
commit: 061dbb2e0300b2aa141f67fd09c6e08504e70ee4 [37/39] UPSTREAM: drm/mediatek: dpi: Add kernel document for struct mtk_dpi_conf
config: arm64-randconfig-r002-20230828 (https://download.01.org/0day-ci/archive/20230828/202308282307.9CySMB7w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230828/202308282307.9CySMB7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308282307.9CySMB7w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'is_ck_de_pol' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'is_dpintf' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'csc_support' not described in 'mtk_dpi_conf'
   drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'swap_input_support' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'dimension_mask' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'hvsize_mask' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'channel_swap_shift' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'yuv422_en_bit' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'csc_enable_bit' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi.c:153: warning: Function parameter or member 'limit' not described in 'mtk_dpi_conf'


vim +153 drivers/gpu/drm/mediatek/mtk_dpi.c

9e629c17aa8d7a Jie Qiu      2016-01-04  124  
061dbb2e0300b2 Bo-Chen Chen 2022-07-01  125  /**
061dbb2e0300b2 Bo-Chen Chen 2022-07-01  126   * struct mtk_dpi_conf - Configuration of mediatek dpi.
061dbb2e0300b2 Bo-Chen Chen 2022-07-01  127   * @cal_factor: Callback function to calculate factor value.
061dbb2e0300b2 Bo-Chen Chen 2022-07-01  128   * @reg_h_fre_con: Register address of frequency control.
061dbb2e0300b2 Bo-Chen Chen 2022-07-01  129   * @max_clock_khz: Max clock frequency supported for this SoCs in khz units.
061dbb2e0300b2 Bo-Chen Chen 2022-07-01  130   * @edge_sel_en: Enable of edge selection.
061dbb2e0300b2 Bo-Chen Chen 2022-07-01  131   * @output_fmts: Array of supported output formats.
061dbb2e0300b2 Bo-Chen Chen 2022-07-01  132   * @num_output_fmts: Quantity of supported output formats.
061dbb2e0300b2 Bo-Chen Chen 2022-07-01  133   */
0ace4b993c7a52 chunhui dai  2018-10-03  134  struct mtk_dpi_conf {
55c78aa5c808ba chunhui dai  2018-10-03  135  	unsigned int (*cal_factor)(int clock);
0ace4b993c7a52 chunhui dai  2018-10-03  136  	u32 reg_h_fre_con;
5f76153de6c927 Rex-BC Chen  2021-03-18  137  	u32 max_clock_khz;
79080159a7c1bc chunhui dai  2018-10-03  138  	bool edge_sel_en;
595945ce9b6d81 Rex-BC Chen  2021-05-26  139  	const u32 *output_fmts;
595945ce9b6d81 Rex-BC Chen  2021-05-26  140  	u32 num_output_fmts;
270385f0bcbda8 Jitao Shi    2021-11-24  141  	bool is_ck_de_pol;
270385f0bcbda8 Jitao Shi    2021-11-24  142  	bool is_dpintf;
270385f0bcbda8 Jitao Shi    2021-11-24  143  	bool csc_support;
270385f0bcbda8 Jitao Shi    2021-11-24  144  	bool swap_input_support;
270385f0bcbda8 Jitao Shi    2021-11-24  145  	// Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift)
270385f0bcbda8 Jitao Shi    2021-11-24  146  	u32 dimension_mask;
270385f0bcbda8 Jitao Shi    2021-11-24  147  	// Mask used for HSIZE and VSIZE (no shift)
270385f0bcbda8 Jitao Shi    2021-11-24  148  	u32 hvsize_mask;
270385f0bcbda8 Jitao Shi    2021-11-24  149  	u32 channel_swap_shift;
270385f0bcbda8 Jitao Shi    2021-11-24  150  	u32 yuv422_en_bit;
9fc1f39630d4af Jitao Shi    2021-11-24  151  	u32 csc_enable_bit;
270385f0bcbda8 Jitao Shi    2021-11-24  152  	const struct mtk_dpi_yc_limit *limit;
0ace4b993c7a52 chunhui dai  2018-10-03 @153  };
0ace4b993c7a52 chunhui dai  2018-10-03  154  

:::::: The code at line 153 was first introduced by commit
:::::: 0ace4b993c7a524962c6c17f3956a2d3cf2454e1 drm/mediatek: move hardware register to node data

:::::: TO: chunhui dai <chunhui.dai@mediatek.com>
:::::: CC: CK Hu <ck.hu@mediatek.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
