Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9942C695
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMtcCNp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705321209; x=1736857209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ea66opnJoOwZn9QVKRPn/MAGFvnqbULbV2um2Md9VE=;
  b=aMtcCNp7Qfv/gGedd7NtwBOJHshR9VsIWbEjOFZQ2ji4tS6NrM7pjPdZ
   Hd9iiwd9M/3aWjlgiobB6amEWUK90AqIDeblTK+OivxAIy1BZTeL3U+yB
   2oWEPqqylQRGO7OmciVh909puiWPnqkivkTp1oLK1dKhR/R16+qTeLGLj
   hQ8H39PyynhRoA5YqeWR1YSXJ/Jks0df7KhTaxMEQu5On/JFJXBeBdKXF
   kR1VP5r2w/FN6FtKtdzb4IS5rrHR7iIctBgVJkJye4Dd6Uqgj/E/ldgNH
   DVielatVn68xyOGPI1N+hCzYbVrgQULeLERruMyAcfd1AQs7Jp1yizHc3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6697773"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="6697773"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 04:20:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="853988786"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="853988786"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jan 2024 04:20:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPLw0-000CSm-0x;
	Mon, 15 Jan 2024 12:19:46 +0000
Date: Mon, 15 Jan 2024 20:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Kuo <louis.kuo@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>
Subject: [pinchartl:mtk/v6.8/pumpkin/camera 19/29]
 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:462:18:
 error: implicit declaration of function
 'v4l2_subdev_state_get_stream_format'; did you mean
 'v4l2_subdev_state_get_format'?
Message-ID: <202401152013.A0FmcuIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.8/pumpkin/camera
head:   112af108c9337e6c9849cdf5bbda7d13dabf81b2
commit: e976f45416f2be1adaa9a784022d3e34b7d0f103 [19/29] media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor interface
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240115/202401152013.A0FmcuIS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401152013.A0FmcuIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401152013.A0FmcuIS-lkp@intel.com/

Note: the pinchartl/mtk/v6.8/pumpkin/camera HEAD 112af108c9337e6c9849cdf5bbda7d13dabf81b2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: In function 'mtk_seninf_input_setup_csi2':
>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:462:18: error: implicit declaration of function 'v4l2_subdev_state_get_stream_format'; did you mean 'v4l2_subdev_state_get_format'? [-Werror=implicit-function-declaration]
     462 |         format = v4l2_subdev_state_get_stream_format(state, input->pad, 0);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_state_get_format
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:462:16: warning: assignment to 'const struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     462 |         format = v4l2_subdev_state_get_stream_format(state, input->pad, 0);
         |                ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: In function 'mtk_seninf_mux_setup':
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:547:16: warning: assignment to 'const struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     547 |         format = v4l2_subdev_state_get_stream_format(state, input->pad, 0);
         |                ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: In function 'seninf_enable_test_pattern':
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:621:16: warning: assignment to 'const struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     621 |         format = v4l2_subdev_state_get_stream_format(state, priv->conf->nb_inputs, 0);
         |                ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: In function 'seninf_set_fmt':
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1006:16: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1006 |         format = v4l2_subdev_state_get_stream_format(state, fmt->pad, fmt->stream);
         |                ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: At top level:
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1040:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'init_cfg'
    1040 |         .init_cfg = seninf_init_cfg,
         |          ^~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1040:21: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' [-Werror=incompatible-pointer-types]
    1040 |         .init_cfg = seninf_init_cfg,
         |                     ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1040:21: note: (near initialization for 'seninf_subdev_pad_ops.enum_mbus_code')
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1041:27: warning: initialized field overwritten [-Woverride-init]
    1041 |         .enum_mbus_code = seninf_enum_mbus_code,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1041:27: note: (near initialization for 'seninf_subdev_pad_ops.enum_mbus_code')
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1422:12: warning: 'seninf_pm_resume' defined but not used [-Wunused-function]
    1422 | static int seninf_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1412:12: warning: 'seninf_pm_suspend' defined but not used [-Wunused-function]
    1412 | static int seninf_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +462 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c

   453	
   454	static void mtk_seninf_input_setup_csi2(struct mtk_seninf_input *input,
   455						struct v4l2_subdev_state *state)
   456	{
   457		const struct mtk_seninf_format_info *fmtinfo;
   458		const struct v4l2_mbus_framefmt *format;
   459		unsigned int num_data_lanes = input->bus.num_data_lanes;
   460		unsigned int val = 0;
   461	
 > 462		format = v4l2_subdev_state_get_stream_format(state, input->pad, 0);
   463		fmtinfo = mtk_seninf_format_info(format->code);
   464	
   465		/* Configure timestamp */
   466		writel(SENINF_TIMESTAMP_STEP, input->base + SENINF_TG1_TM_STP);
   467	
   468		/* HQ */
   469		writel(0x0, input->base + SENINF_TG1_PH_CNT);
   470		writel(0x10001, input->base + SENINF_TG1_SEN_CK);
   471	
   472		/* First Enable Sensor interface and select pad (0x1a04_0200) */
   473		mtk_seninf_input_update(input, SENINF_CTRL, SENINF_EN, 1);
   474		mtk_seninf_input_update(input, SENINF_CTRL, PAD2CAM_DATA_SEL, SENINF_PAD_10BIT);
   475		mtk_seninf_input_update(input, SENINF_CTRL, SENINF_SRC_SEL, 0);
   476		mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_CSI2_IP_EN, 1);
   477		mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_NCSI2_IP_EN, 0);
   478	
   479		/* DPCM Enable */
   480		if (fmtinfo->flags & MTK_SENINF_FORMAT_DPCM)
   481			val = SENINF_CSI2_DPCM_DI_2A_DPCM_EN;
   482		else
   483			val = SENINF_CSI2_DPCM_DI_30_DPCM_EN;
   484		writel(val, input->base + SENINF_CSI2_DPCM);
   485	
   486		/* Settle delay */
   487		mtk_seninf_input_update(input, SENINF_CSI2_LNRD_TIMING,
   488					DATA_SETTLE_PARAMETER, SENINF_SETTLE_DELAY);
   489	
   490		/* HQ */
   491		writel(0x10, input->base + SENINF_CSI2_LNRC_FSM);
   492	
   493		/* CSI2 control */
   494		val = readl(input->base + SENINF_CSI2_CTL)
   495		    | (FIELD_PREP(SENINF_CSI2_CTL_ED_SEL, DATA_HEADER_ORDER_DI_WCL_WCH)
   496		    | SENINF_CSI2_CTL_CLOCK_LANE_EN | (BIT(num_data_lanes) - 1));
   497		writel(val, input->base + SENINF_CSI2_CTL);
   498	
   499		mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL,
   500					BYPASS_LANE_RESYNC, 0);
   501		mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL, CDPHY_SEL, 0);
   502		mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL,
   503					CPHY_LANE_RESYNC_CNT, 3);
   504		mtk_seninf_input_update(input, SENINF_CSI2_MODE, CSR_CSI2_MODE, 0);
   505		mtk_seninf_input_update(input, SENINF_CSI2_MODE, CSR_CSI2_HEADER_LEN, 0);
   506		mtk_seninf_input_update(input, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_MASK_0, 0xff00);
   507		mtk_seninf_input_update(input, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_PAT_0, 0x001d);
   508	
   509		mtk_seninf_input_update(input, SENINF_CSI2_CTL, CLOCK_HS_OPTION, 0);
   510		mtk_seninf_input_update(input, SENINF_CSI2_CTL, HSRX_DET_EN, 0);
   511		mtk_seninf_input_update(input, SENINF_CSI2_CTL, HS_TRAIL_EN, 1);
   512		mtk_seninf_input_update(input, SENINF_CSI2_HS_TRAIL, HS_TRAIL_PARAMETER,
   513					SENINF_HS_TRAIL_PARAMETER);
   514	
   515		/* Set debug port to output packet number */
   516		mtk_seninf_input_update(input, SENINF_CSI2_DGB_SEL, DEBUG_EN, 1);
   517		mtk_seninf_input_update(input, SENINF_CSI2_DGB_SEL, DEBUG_SEL, 0x1a);
   518	
   519		/* HQ */
   520		writel(0xfffffffe, input->base + SENINF_CSI2_SPARE0);
   521	
   522		/* Enable CSI2 IRQ mask */
   523		/* Turn on all interrupt */
   524		writel(0xffffffff, input->base + SENINF_CSI2_INT_EN);
   525		/* Write clear CSI2 IRQ */
   526		writel(0xffffffff, input->base + SENINF_CSI2_INT_STATUS);
   527		/* Enable CSI2 Extend IRQ mask */
   528		/* Turn on all interrupt */
   529		mtk_seninf_input_update(input, SENINF_CTRL, CSI2_SW_RST, 1);
   530		udelay(1);
   531		mtk_seninf_input_update(input, SENINF_CTRL, CSI2_SW_RST, 0);
   532	}
   533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
