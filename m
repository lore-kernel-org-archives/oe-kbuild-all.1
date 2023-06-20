Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4EE46A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687247711; x=1718783711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mGkKtC5e62Cj7K2qDVKoRT3T8adz0k2VGlidsUPaoYI=;
  b=ROu2mrooe/IV6lJMVkeS80ymFj3kDS5Bg2Lo4oeNAGjwPd1wHcuCMMJQ
   OW7S+AHZs55l70cAOQnxgp17Xo8b0lCMjyuYezcSFobLD6nD/W2r2BGbY
   bQxigkMkB59cfJsiWtlc7gkbfOYc5JsviWE+PXK/d7+N9oW3qRMaNu+dv
   rOT3tS0gnjcjKJFGpR5UILzBCVYNVFbtFI3L326COB/9dcEkJxc3thX3h
   TnM0b07GTZLqcwVSwaOR+njizCiVKoxDvLhYXSimkl9S/inJ0IU6GDjBI
   cSLcbUkjx8LX94pkJtOcjwnmT16JBtQP38YUqokw7VW0idVwnJ4WBqRL9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="362335737"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="362335737"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 00:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="664196593"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="664196593"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jun 2023 00:55:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBWCb-0005eS-1K;
	Tue, 20 Jun 2023 07:55:01 +0000
Date: Tue, 20 Jun 2023 15:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Kuo <louis.kuo@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 9641/9999]
 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:328:22: error:
 variable 'cal_sel' set but not used
Message-ID: <202306201555.FxQnwTt5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Louis,

First bad commit (maybe != root cause):

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 21d7588740d9f4e096005af37caa623d3d58f8f1 [9641/9999] BACKPORT: FROMLIST: media: platform: Add Mediatek sensor interface driver KConfig
config: h8300-randconfig-r015-20230620 (https://download.01.org/0day-ci/archive/20230620/202306201555.FxQnwTt5-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201555.FxQnwTt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201555.FxQnwTt5-lkp@intel.com/

All errors (new ones prefixed by >>):

     256 |                         writel(0xffffff0f &
         |                                ~~~~~~~~~~~^
     257 |                                 readl(pmipi_rx + MIPI_RX_ANA18_CSI0B) |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:259:43: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     259 |                         writel(0xff0fffff &
         |                                ~~~~~~~~~~~^
     260 |                                 readl(pmipi_rx + MIPI_RX_ANA1C_CSI0B) |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:262:43: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     262 |                         writel(0xff0fffff &
         |                                ~~~~~~~~~~~^
     263 |                                 readl(pmipi_rx + MIPI_RX_ANA20_CSI0B) |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:267:35: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     267 |                 writel(0xff0fff0f & readl(pmipi_rx + MIPI_RX_ANA18_CSI1A) |
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:269:35: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     269 |                 writel(0xffffff0f & readl(pmipi_rx + MIPI_RX_ANA1C_CSI1A) |
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:273:43: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     273 |                         writel(0xff0fff0f &
         |                                ~~~~~~~~~~~^
     274 |                                 readl(pmipi_rx + MIPI_RX_ANA18_CSI1B) |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:276:43: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     276 |                         writel(0xffffff0f &
         |                                ~~~~~~~~~~~^
     277 |                                 readl(pmipi_rx + MIPI_RX_ANA1C_CSI1B) |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:284:25: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     284 |         writel(0xffffff & readl(pmipi_rx + MIPI_RX_ANA24_CSI0A) |
         |                ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:287:33: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     287 |                 writel(0xffffff & readl(pmipi_rx + MIPI_RX_ANA24_CSI0B) |
         |                        ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:295:27: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     295 |         writel(0xfffffff7 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0A) |
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:298:35: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     298 |                 writel(0xfffffff7 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0B) |
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:302:27: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     302 |         writel(0xfffffff7 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0A) |
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:305:35: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     305 |                 writel(0xfffffffb & readl(pmipi_rx + MIPI_RX_ANA00_CSI0B) |
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:311:33: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     311 |                 writel(0xffffff &
         |                        ~~~~~~~~~^
     312 |                         readl(pmipi_rx_conf + MIPI_RX_CON24_CSI0) |
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:315:33: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     315 |                 writel(0xffffff &
         |                        ~~~~~~~~~^
     316 |                         readl(pmipi_rx_conf + MIPI_RX_CON24_CSI0) |
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c: In function 'mtk_seninf_set_csi_mipi':
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:339:35: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     339 |                 writel(0x7ffff8fe & readl(seninf_base +
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
     340 |                         SENINF_TOP_PHY_SENINF_CTL_CSI1) | 0x80000200
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:345:35: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     345 |                 writel(0x7ffff8fe & readl(seninf_base +
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
     346 |                         SENINF_TOP_PHY_SENINF_CTL_CSI2) | 0x80000200
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:351:35: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     351 |                 writel(0x7ffff8fe & readl(seninf_base +
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
     352 |                         SENINF_TOP_PHY_SENINF_CTL_CSI0) | 0x80000200
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:358:35: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     358 |                 writel(0x7fffc8fe & readl(seninf_base +
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
     359 |                         SENINF_TOP_PHY_SENINF_CTL_CSI0) | 0x80001100
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:367:27: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     367 |         writel(0x8fffffff & readl(pseninf + SENINF1_CTRL) |
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:371:27: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     371 |         writel(0xffffff9f & readl(pseninf + SENINF1_CTRL_EXT) |
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:381:27: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     381 |         writel(0xffff00ff & readl(pseninf + SENINF1_CSI2_LNRD_TIMING) |
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:387:27: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     387 |         writel(0xfffff3f8 & readl(pseninf + SENINF1_CSI2_RESYNC_MERGE_CTL) |
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:394:27: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     394 |         writel(0xf5ffff7f & readl(pseninf + SENINF1_CSI2_CTL) |
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:396:27: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     396 |         writel(0xffffff00 & readl(pseninf + SENINF1_CSI2_HS_TRAIL) |
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:409:27: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     409 |         writel(0xffffff7f & readl(pseninf + SENINF1_CTRL) |
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:328:22: error: variable 'cal_sel' set but not used [-Werror=unused-but-set-variable]
     328 |         unsigned int cal_sel;
         |                      ^~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c: In function 'mtk_seninf_power_on':
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:440:28: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     440 |         writel(0xffffffbfU & readl(pseninf + SENINF1_CTRL_EXT) |
         |                ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/platform_device.h:14,
                    from drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:5:
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c: In function 'seninf_link_setup':
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:622:22: error: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Werror=format=]
     622 |         dev_dbg(dev, "local->flags %d flags %d\n", local->flags, flags);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1370:22: note: in definition of macro 'dev_fmt'
    1370 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:622:9: note: in expansion of macro 'dev_dbg'
     622 |         dev_dbg(dev, "local->flags %d flags %d\n", local->flags, flags);
         |         ^~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:622:37: note: format string is defined here
     622 |         dev_dbg(dev, "local->flags %d flags %d\n", local->flags, flags);
         |                                    ~^
         |                                     |
         |                                     int
         |                                    %ld
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:632:30: error: too many arguments for format [-Werror=format-extra-args]
     632 |                 dev_dbg(dev, "set sensor port\n", local->index);
         |                              ^~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1370:22: note: in definition of macro 'dev_fmt'
    1370 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:632:17: note: in expansion of macro 'dev_dbg'
     632 |                 dev_dbg(dev, "set sensor port\n", local->index);
         |                 ^~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c: In function 'seninf_enable_test_pattern':
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:721:62: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     721 |                         | priv->fmt[priv->port].format.width + 0x100;
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c: At top level:
>> drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:955:12: error: 'seninf_pm_resume' defined but not used [-Werror=unused-function]
     955 | static int seninf_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c:945:12: error: 'seninf_pm_suspend' defined but not used [-Werror=unused-function]
     945 | static int seninf_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/cal_sel +328 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c

61e12ddf819761 Louis Kuo 2019-09-15  320  
61e12ddf819761 Louis Kuo 2019-09-15  321  static void mtk_seninf_set_csi_mipi(struct mtk_seninf *priv,
61e12ddf819761 Louis Kuo 2019-09-15  322  				    unsigned int seninf)
61e12ddf819761 Louis Kuo 2019-09-15  323  {
61e12ddf819761 Louis Kuo 2019-09-15  324  	void *seninf_base = priv->base_reg;
61e12ddf819761 Louis Kuo 2019-09-15  325  	void *pseninf = priv->base_reg + 0x1000 * seninf;
61e12ddf819761 Louis Kuo 2019-09-15  326  	unsigned int dpcm = mtk_seninf_get_dpcm(priv);
61e12ddf819761 Louis Kuo 2019-09-15  327  	unsigned int data_lane_num = priv->sensor[priv->port].num_data_lanes;
61e12ddf819761 Louis Kuo 2019-09-15 @328  	unsigned int cal_sel;
61e12ddf819761 Louis Kuo 2019-09-15  329  	unsigned int data_header_order = 1;
61e12ddf819761 Louis Kuo 2019-09-15  330  	unsigned int pad_sel = PAD_10BIT;
61e12ddf819761 Louis Kuo 2019-09-15  331  	unsigned int val = 0;
61e12ddf819761 Louis Kuo 2019-09-15  332  
61e12ddf819761 Louis Kuo 2019-09-15  333  	dev_dbg(priv->dev, "IS_4D1C %d port %d\n",
61e12ddf819761 Louis Kuo 2019-09-15  334  		is_4d1c(priv->port), priv->port);
61e12ddf819761 Louis Kuo 2019-09-15  335  
61e12ddf819761 Louis Kuo 2019-09-15  336  	switch (priv->port) {
61e12ddf819761 Louis Kuo 2019-09-15  337  	case CFG_CSI_PORT_1:
61e12ddf819761 Louis Kuo 2019-09-15  338  		cal_sel = 1;
61e12ddf819761 Louis Kuo 2019-09-15  339  		writel(0x7ffff8fe & readl(seninf_base +
61e12ddf819761 Louis Kuo 2019-09-15  340  			SENINF_TOP_PHY_SENINF_CTL_CSI1)	| 0x80000200
61e12ddf819761 Louis Kuo 2019-09-15  341  			, seninf_base + SENINF_TOP_PHY_SENINF_CTL_CSI1);
61e12ddf819761 Louis Kuo 2019-09-15  342  		break;
61e12ddf819761 Louis Kuo 2019-09-15  343  	case CFG_CSI_PORT_2:
61e12ddf819761 Louis Kuo 2019-09-15  344  		cal_sel = 2;
61e12ddf819761 Louis Kuo 2019-09-15  345  		writel(0x7ffff8fe & readl(seninf_base +
61e12ddf819761 Louis Kuo 2019-09-15  346  			SENINF_TOP_PHY_SENINF_CTL_CSI2)	| 0x80000200
61e12ddf819761 Louis Kuo 2019-09-15  347  			, seninf_base + SENINF_TOP_PHY_SENINF_CTL_CSI2);
61e12ddf819761 Louis Kuo 2019-09-15  348  		break;
61e12ddf819761 Louis Kuo 2019-09-15  349  	case CFG_CSI_PORT_0:
61e12ddf819761 Louis Kuo 2019-09-15  350  		cal_sel = 0;
61e12ddf819761 Louis Kuo 2019-09-15  351  		writel(0x7ffff8fe & readl(seninf_base +
61e12ddf819761 Louis Kuo 2019-09-15  352  			SENINF_TOP_PHY_SENINF_CTL_CSI0)	| 0x80000200
61e12ddf819761 Louis Kuo 2019-09-15  353  			, seninf_base + SENINF_TOP_PHY_SENINF_CTL_CSI0);
61e12ddf819761 Louis Kuo 2019-09-15  354  		break;
61e12ddf819761 Louis Kuo 2019-09-15  355  	case CFG_CSI_PORT_0A:
61e12ddf819761 Louis Kuo 2019-09-15  356  	case CFG_CSI_PORT_0B:
61e12ddf819761 Louis Kuo 2019-09-15  357  		cal_sel = 0;
61e12ddf819761 Louis Kuo 2019-09-15  358  		writel(0x7fffc8fe & readl(seninf_base +
61e12ddf819761 Louis Kuo 2019-09-15  359  			SENINF_TOP_PHY_SENINF_CTL_CSI0)	| 0x80001100
61e12ddf819761 Louis Kuo 2019-09-15  360  			, seninf_base + SENINF_TOP_PHY_SENINF_CTL_CSI0);
61e12ddf819761 Louis Kuo 2019-09-15  361  		break;
61e12ddf819761 Louis Kuo 2019-09-15  362  	}
61e12ddf819761 Louis Kuo 2019-09-15  363  
61e12ddf819761 Louis Kuo 2019-09-15  364  	/* First Enable Sensor interface and select pad (0x1a04_0200) */
61e12ddf819761 Louis Kuo 2019-09-15  365  	writel(readl(pseninf + SENINF1_CTRL) | 0x1
61e12ddf819761 Louis Kuo 2019-09-15  366  		, pseninf + SENINF1_CTRL);
61e12ddf819761 Louis Kuo 2019-09-15  367  	writel(0x8fffffff & readl(pseninf + SENINF1_CTRL) |
61e12ddf819761 Louis Kuo 2019-09-15  368  		(pad_sel << 28), pseninf + SENINF1_CTRL);
61e12ddf819761 Louis Kuo 2019-09-15  369  	writel(0xffff0fff & readl(pseninf + SENINF1_CTRL)
61e12ddf819761 Louis Kuo 2019-09-15  370  		, pseninf + SENINF1_CTRL);
61e12ddf819761 Louis Kuo 2019-09-15  371  	writel(0xffffff9f & readl(pseninf + SENINF1_CTRL_EXT) |
61e12ddf819761 Louis Kuo 2019-09-15  372  		0x40, pseninf + SENINF1_CTRL_EXT);
61e12ddf819761 Louis Kuo 2019-09-15  373  
61e12ddf819761 Louis Kuo 2019-09-15  374  	mtk_seninf_set_dphy(priv, seninf);
61e12ddf819761 Louis Kuo 2019-09-15  375  
61e12ddf819761 Louis Kuo 2019-09-15  376  	/* DPCM Enable */
61e12ddf819761 Louis Kuo 2019-09-15  377  	val = 1 << ((dpcm == 0x2a) ? 15 : ((dpcm & 0xF) + 7));
61e12ddf819761 Louis Kuo 2019-09-15  378  	writel(val, pseninf + SENINF1_CSI2_DPCM);
61e12ddf819761 Louis Kuo 2019-09-15  379  
61e12ddf819761 Louis Kuo 2019-09-15  380  	/* Settle delay */
61e12ddf819761 Louis Kuo 2019-09-15  381  	writel(0xffff00ff & readl(pseninf + SENINF1_CSI2_LNRD_TIMING) |
61e12ddf819761 Louis Kuo 2019-09-15  382  		(SENINF_SETTLE_DELAY << 8), pseninf + SENINF1_CSI2_LNRD_TIMING);
61e12ddf819761 Louis Kuo 2019-09-15  383  	/* CSI2 control */
61e12ddf819761 Louis Kuo 2019-09-15  384  	val = readl(pseninf + SENINF1_CSI2_CTL) | (data_header_order << 16) |
61e12ddf819761 Louis Kuo 2019-09-15  385  		0x10 | ((1 << data_lane_num) - 1);
61e12ddf819761 Louis Kuo 2019-09-15  386  	writel(val, pseninf + SENINF1_CSI2_CTL);
61e12ddf819761 Louis Kuo 2019-09-15  387  	writel(0xfffff3f8 & readl(pseninf + SENINF1_CSI2_RESYNC_MERGE_CTL) |
61e12ddf819761 Louis Kuo 2019-09-15  388  		0x3, pseninf + SENINF1_CSI2_RESYNC_MERGE_CTL);
61e12ddf819761 Louis Kuo 2019-09-15  389  	writel(0xfffff800 & readl(pseninf + SENINF1_CSI2_MODE)
61e12ddf819761 Louis Kuo 2019-09-15  390  		, pseninf + SENINF1_CSI2_MODE);
61e12ddf819761 Louis Kuo 2019-09-15  391  	writel(0x1dff00, pseninf + SENINF1_CSI2_DPHY_SYNC);
61e12ddf819761 Louis Kuo 2019-09-15  392  	writel(0xfffffffe & readl(pseninf + SENINF1_CSI2_SPARE0)
61e12ddf819761 Louis Kuo 2019-09-15  393  		, pseninf + SENINF1_CSI2_SPARE0);
61e12ddf819761 Louis Kuo 2019-09-15 @394  	writel(0xf5ffff7f & readl(pseninf + SENINF1_CSI2_CTL) |
61e12ddf819761 Louis Kuo 2019-09-15  395  		0x2000000, pseninf + SENINF1_CSI2_CTL);
61e12ddf819761 Louis Kuo 2019-09-15  396  	writel(0xffffff00 & readl(pseninf + SENINF1_CSI2_HS_TRAIL) |
61e12ddf819761 Louis Kuo 2019-09-15  397  		SENINF_HS_TRAIL_PARAMETER, pseninf + SENINF1_CSI2_HS_TRAIL);
61e12ddf819761 Louis Kuo 2019-09-15  398  
61e12ddf819761 Louis Kuo 2019-09-15  399  	/* Set debug port to output packet number */
61e12ddf819761 Louis Kuo 2019-09-15  400  	writel(0x8000001A, pseninf + SENINF1_CSI2_DGB_SEL);
61e12ddf819761 Louis Kuo 2019-09-15  401  	/* Enable CSI2 IRQ mask */
61e12ddf819761 Louis Kuo 2019-09-15  402  	/* Turn on all interrupt */
61e12ddf819761 Louis Kuo 2019-09-15  403  	writel(0xffffffff, pseninf + SENINF1_CSI2_INT_EN);
61e12ddf819761 Louis Kuo 2019-09-15  404  	/* Write clear CSI2 IRQ */
61e12ddf819761 Louis Kuo 2019-09-15  405  	writel(0xffffffff, pseninf + SENINF1_CSI2_INT_STATUS);
61e12ddf819761 Louis Kuo 2019-09-15  406  	/* Enable CSI2 Extend IRQ mask */
61e12ddf819761 Louis Kuo 2019-09-15  407  	/* Turn on all interrupt */
61e12ddf819761 Louis Kuo 2019-09-15  408  	writel(0x0000001f, pseninf + SENINF1_CSI2_INT_EN_EXT);
61e12ddf819761 Louis Kuo 2019-09-15  409  	writel(0xffffff7f & readl(pseninf + SENINF1_CTRL) |
61e12ddf819761 Louis Kuo 2019-09-15  410  		0x80, pseninf + SENINF1_CTRL);
61e12ddf819761 Louis Kuo 2019-09-15  411  
61e12ddf819761 Louis Kuo 2019-09-15  412  	udelay(1);
61e12ddf819761 Louis Kuo 2019-09-15  413  	writel(0xffffff7f & readl(pseninf + SENINF1_CTRL)
61e12ddf819761 Louis Kuo 2019-09-15  414  		, pseninf + SENINF1_CTRL);
61e12ddf819761 Louis Kuo 2019-09-15  415  }
61e12ddf819761 Louis Kuo 2019-09-15  416  

:::::: The code at line 328 was first introduced by commit
:::::: 61e12ddf8197612c314860cdc6efacf0c37424b6 BACKPORT: FROMLIST: media: platform: mtk-isp: Add Mediatek sensor interface driver

:::::: TO: Louis Kuo <louis.kuo@mediatek.com>
:::::: CC: Commit Bot <commit-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
