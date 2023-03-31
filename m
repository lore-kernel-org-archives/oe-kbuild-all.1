Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCFA3D63
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680290034; x=1711826034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PTC5KGG8/MoiUsaMIyV1ROrrvKQ117KpPyzxqGimmw4=;
  b=ID7VmV5ozFnRrLwGCxBwJVnuTrQnxyxFHTHVjcqU+fEFNf1tNjlDb4Ke
   qx3jQ7ce27PTBonv2PaHw3GmYBWcyHnN8AuSUJIwV0cA5mbzJ6p9Krsbz
   tauPzP0KGoOYx9MeodQcbO9LU1k16wNkQb02TtWKzv5dICs+xukDsrQka
   g0uNtcVbVnNDIm6UruRO4hCAT8KeEIGKeM0CzB4XO7Id5Dtiy828C+KYN
   c+RWS2avhXLtPYcsu0hVvHoG4kzD5vO1EgAkDe7YbrkhFfFGSyBRMP/0Y
   pFhYcgVhBRytNnk7ap+ZJJE3SWu0EY7XGVzBzx8EIvilD32GfNzQ3Uw2D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321194384"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="321194384"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 12:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="685213929"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="685213929"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2023 12:13:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piKC7-000M5P-1c;
	Fri, 31 Mar 2023 19:13:51 +0000
Date: Sat, 1 Apr 2023 03:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>
Subject: [abelvesa:for-next 9/9] drivers/clk/imx/clk-imx6ul.c:546:9: error:
 too many arguments to function 'imx_register_uart_clocks'
Message-ID: <202304010336.L6H9SxmK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git for-next
head:   edc6476d334adaeedf899c70e61264305155fd70
commit: edc6476d334adaeedf899c70e61264305155fd70 [9/9] clk: imx6ul: retain early UART clocks during kernel init
config: arm-randconfig-r046-20230329 (https://download.01.org/0day-ci/archive/20230401/202304010336.L6H9SxmK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/commit/?id=edc6476d334adaeedf899c70e61264305155fd70
        git remote add abelvesa https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git
        git fetch --no-tags abelvesa for-next
        git checkout edc6476d334adaeedf899c70e61264305155fd70
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/imx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010336.L6H9SxmK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/imx/clk-imx6ul.c: In function 'imx6ul_clocks_init':
>> drivers/clk/imx/clk-imx6ul.c:546:9: error: too many arguments to function 'imx_register_uart_clocks'
     546 |         imx_register_uart_clocks(2);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/imx/clk-imx6ul.c:19:
   drivers/clk/imx/clk.h:15:6: note: declared here
      15 | void imx_register_uart_clocks(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx_register_uart_clocks +546 drivers/clk/imx/clk-imx6ul.c

   125	
   126	static void __init imx6ul_clocks_init(struct device_node *ccm_node)
   127	{
   128		struct device_node *np;
   129		void __iomem *base;
   130	
   131		clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
   132						  IMX6UL_CLK_END), GFP_KERNEL);
   133		if (WARN_ON(!clk_hw_data))
   134			return;
   135	
   136		clk_hw_data->num = IMX6UL_CLK_END;
   137		hws = clk_hw_data->hws;
   138	
   139		hws[IMX6UL_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
   140	
   141		hws[IMX6UL_CLK_CKIL] = imx_get_clk_hw_by_name(ccm_node, "ckil");
   142		hws[IMX6UL_CLK_OSC] = imx_get_clk_hw_by_name(ccm_node, "osc");
   143	
   144		/* ipp_di clock is external input */
   145		hws[IMX6UL_CLK_IPP_DI0] = imx_get_clk_hw_by_name(ccm_node, "ipp_di0");
   146		hws[IMX6UL_CLK_IPP_DI1] = imx_get_clk_hw_by_name(ccm_node, "ipp_di1");
   147	
   148		np = of_find_compatible_node(NULL, NULL, "fsl,imx6ul-anatop");
   149		base = of_iomap(np, 0);
   150		of_node_put(np);
   151		WARN_ON(!base);
   152	
   153		hws[IMX6UL_PLL1_BYPASS_SRC] = imx_clk_hw_mux("pll1_bypass_src", base + 0x00, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
   154		hws[IMX6UL_PLL2_BYPASS_SRC] = imx_clk_hw_mux("pll2_bypass_src", base + 0x30, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
   155		hws[IMX6UL_PLL3_BYPASS_SRC] = imx_clk_hw_mux("pll3_bypass_src", base + 0x10, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
   156		hws[IMX6UL_PLL4_BYPASS_SRC] = imx_clk_hw_mux("pll4_bypass_src", base + 0x70, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
   157		hws[IMX6UL_PLL5_BYPASS_SRC] = imx_clk_hw_mux("pll5_bypass_src", base + 0xa0, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
   158		hws[IMX6UL_PLL6_BYPASS_SRC] = imx_clk_hw_mux("pll6_bypass_src", base + 0xe0, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
   159		hws[IMX6UL_PLL7_BYPASS_SRC] = imx_clk_hw_mux("pll7_bypass_src", base + 0x20, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
   160	
   161		hws[IMX6UL_CLK_PLL1] = imx_clk_hw_pllv3(IMX_PLLV3_SYS,	 "pll1", "osc", base + 0x00, 0x7f);
   162		hws[IMX6UL_CLK_PLL2] = imx_clk_hw_pllv3(IMX_PLLV3_GENERIC, "pll2", "osc", base + 0x30, 0x1);
   163		hws[IMX6UL_CLK_PLL3] = imx_clk_hw_pllv3(IMX_PLLV3_USB,	 "pll3", "osc", base + 0x10, 0x3);
   164		hws[IMX6UL_CLK_PLL4] = imx_clk_hw_pllv3(IMX_PLLV3_AV,	 "pll4", "osc", base + 0x70, 0x7f);
   165		hws[IMX6UL_CLK_PLL5] = imx_clk_hw_pllv3(IMX_PLLV3_AV,	 "pll5", "osc", base + 0xa0, 0x7f);
   166		hws[IMX6UL_CLK_PLL6] = imx_clk_hw_pllv3(IMX_PLLV3_ENET,	 "pll6", "osc", base + 0xe0, 0x3);
   167		hws[IMX6UL_CLK_PLL7] = imx_clk_hw_pllv3(IMX_PLLV3_USB,	 "pll7", "osc", base + 0x20, 0x3);
   168	
   169		hws[IMX6UL_PLL1_BYPASS] = imx_clk_hw_mux_flags("pll1_bypass", base + 0x00, 16, 1, pll1_bypass_sels, ARRAY_SIZE(pll1_bypass_sels), CLK_SET_RATE_PARENT);
   170		hws[IMX6UL_PLL2_BYPASS] = imx_clk_hw_mux_flags("pll2_bypass", base + 0x30, 16, 1, pll2_bypass_sels, ARRAY_SIZE(pll2_bypass_sels), CLK_SET_RATE_PARENT);
   171		hws[IMX6UL_PLL3_BYPASS] = imx_clk_hw_mux_flags("pll3_bypass", base + 0x10, 16, 1, pll3_bypass_sels, ARRAY_SIZE(pll3_bypass_sels), CLK_SET_RATE_PARENT);
   172		hws[IMX6UL_PLL4_BYPASS] = imx_clk_hw_mux_flags("pll4_bypass", base + 0x70, 16, 1, pll4_bypass_sels, ARRAY_SIZE(pll4_bypass_sels), CLK_SET_RATE_PARENT);
   173		hws[IMX6UL_PLL5_BYPASS] = imx_clk_hw_mux_flags("pll5_bypass", base + 0xa0, 16, 1, pll5_bypass_sels, ARRAY_SIZE(pll5_bypass_sels), CLK_SET_RATE_PARENT);
   174		hws[IMX6UL_PLL6_BYPASS] = imx_clk_hw_mux_flags("pll6_bypass", base + 0xe0, 16, 1, pll6_bypass_sels, ARRAY_SIZE(pll6_bypass_sels), CLK_SET_RATE_PARENT);
   175		hws[IMX6UL_PLL7_BYPASS] = imx_clk_hw_mux_flags("pll7_bypass", base + 0x20, 16, 1, pll7_bypass_sels, ARRAY_SIZE(pll7_bypass_sels), CLK_SET_RATE_PARENT);
   176	
   177		/* Do not bypass PLLs initially */
   178		clk_set_parent(hws[IMX6UL_PLL1_BYPASS]->clk, hws[IMX6UL_CLK_PLL1]->clk);
   179		clk_set_parent(hws[IMX6UL_PLL2_BYPASS]->clk, hws[IMX6UL_CLK_PLL2]->clk);
   180		clk_set_parent(hws[IMX6UL_PLL3_BYPASS]->clk, hws[IMX6UL_CLK_PLL3]->clk);
   181		clk_set_parent(hws[IMX6UL_PLL4_BYPASS]->clk, hws[IMX6UL_CLK_PLL4]->clk);
   182		clk_set_parent(hws[IMX6UL_PLL5_BYPASS]->clk, hws[IMX6UL_CLK_PLL5]->clk);
   183		clk_set_parent(hws[IMX6UL_PLL6_BYPASS]->clk, hws[IMX6UL_CLK_PLL6]->clk);
   184		clk_set_parent(hws[IMX6UL_PLL7_BYPASS]->clk, hws[IMX6UL_CLK_PLL7]->clk);
   185	
   186		hws[IMX6UL_CLK_PLL1_SYS]	= imx_clk_hw_fixed_factor("pll1_sys",	"pll1_bypass", 1, 1);
   187		hws[IMX6UL_CLK_PLL2_BUS]	= imx_clk_hw_gate("pll2_bus",	"pll2_bypass", base + 0x30, 13);
   188		hws[IMX6UL_CLK_PLL3_USB_OTG]	= imx_clk_hw_gate("pll3_usb_otg",	"pll3_bypass", base + 0x10, 13);
   189		hws[IMX6UL_CLK_PLL4_AUDIO]	= imx_clk_hw_gate("pll4_audio",	"pll4_bypass", base + 0x70, 13);
   190		hws[IMX6UL_CLK_PLL5_VIDEO]	= imx_clk_hw_gate("pll5_video",	"pll5_bypass", base + 0xa0, 13);
   191		hws[IMX6UL_CLK_PLL6_ENET]	= imx_clk_hw_fixed_factor("pll6_enet",	"pll6_bypass", 1, 1);
   192		hws[IMX6UL_CLK_PLL7_USB_HOST]	= imx_clk_hw_gate("pll7_usb_host",	"pll7_bypass", base + 0x20, 13);
   193	
   194		/*
   195		 * Bit 20 is the reserved and read-only bit, we do this only for:
   196		 * - Do nothing for usbphy clk_enable/disable
   197		 * - Keep refcount when do usbphy clk_enable/disable, in that case,
   198		 * the clk framework many need to enable/disable usbphy's parent
   199		 */
   200		hws[IMX6UL_CLK_USBPHY1] = imx_clk_hw_gate("usbphy1", "pll3_usb_otg",  base + 0x10, 20);
   201		hws[IMX6UL_CLK_USBPHY2] = imx_clk_hw_gate("usbphy2", "pll7_usb_host", base + 0x20, 20);
   202	
   203		/*
   204		 * usbphy*_gate needs to be on after system boots up, and software
   205		 * never needs to control it anymore.
   206		 */
   207		hws[IMX6UL_CLK_USBPHY1_GATE] = imx_clk_hw_gate("usbphy1_gate", "dummy", base + 0x10, 6);
   208		hws[IMX6UL_CLK_USBPHY2_GATE] = imx_clk_hw_gate("usbphy2_gate", "dummy", base + 0x20, 6);
   209	
   210		/*					name		   parent_name	   reg		idx */
   211		hws[IMX6UL_CLK_PLL2_PFD0] = imx_clk_hw_pfd("pll2_pfd0_352m", "pll2_bus",	   base + 0x100, 0);
   212		hws[IMX6UL_CLK_PLL2_PFD1] = imx_clk_hw_pfd("pll2_pfd1_594m", "pll2_bus",	   base + 0x100, 1);
   213		hws[IMX6UL_CLK_PLL2_PFD2] = imx_clk_hw_pfd("pll2_pfd2_396m", "pll2_bus",	   base + 0x100, 2);
   214		hws[IMX6UL_CLK_PLL2_PFD3] = imx_clk_hw_pfd("pll2_pfd3_594m", "pll2_bus",	   base + 0x100, 3);
   215		hws[IMX6UL_CLK_PLL3_PFD0] = imx_clk_hw_pfd("pll3_pfd0_720m", "pll3_usb_otg", base + 0xf0,  0);
   216		hws[IMX6UL_CLK_PLL3_PFD1] = imx_clk_hw_pfd("pll3_pfd1_540m", "pll3_usb_otg", base + 0xf0,  1);
   217		hws[IMX6UL_CLK_PLL3_PFD2] = imx_clk_hw_pfd("pll3_pfd2_508m", "pll3_usb_otg", base + 0xf0,	 2);
   218		hws[IMX6UL_CLK_PLL3_PFD3] = imx_clk_hw_pfd("pll3_pfd3_454m", "pll3_usb_otg", base + 0xf0,	 3);
   219	
   220		hws[IMX6UL_CLK_ENET_REF] = clk_hw_register_divider_table(NULL, "enet1_ref", "pll6_enet", 0,
   221				base + 0xe0, 0, 2, 0, clk_enet_ref_table, &imx_ccm_lock);
   222		hws[IMX6UL_CLK_ENET2_REF] = clk_hw_register_divider_table(NULL, "enet2_ref", "pll6_enet", 0,
   223				base + 0xe0, 2, 2, 0, clk_enet_ref_table, &imx_ccm_lock);
   224	
   225		hws[IMX6UL_CLK_ENET1_REF_125M] = imx_clk_hw_gate("enet1_ref_125m", "enet1_ref", base + 0xe0, 13);
   226		hws[IMX6UL_CLK_ENET2_REF_125M] = imx_clk_hw_gate("enet2_ref_125m", "enet2_ref", base + 0xe0, 20);
   227		hws[IMX6UL_CLK_ENET_PTP_REF]	= imx_clk_hw_fixed_factor("enet_ptp_ref", "pll6_enet", 1, 20);
   228		hws[IMX6UL_CLK_ENET_PTP]	= imx_clk_hw_gate("enet_ptp", "enet_ptp_ref", base + 0xe0, 21);
   229	
   230		hws[IMX6UL_CLK_PLL4_POST_DIV]  = clk_hw_register_divider_table(NULL, "pll4_post_div", "pll4_audio",
   231			 CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0x70, 19, 2, 0, post_div_table, &imx_ccm_lock);
   232		hws[IMX6UL_CLK_PLL4_AUDIO_DIV] = clk_hw_register_divider(NULL, "pll4_audio_div", "pll4_post_div",
   233			 CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0x170, 15, 1, 0, &imx_ccm_lock);
   234		hws[IMX6UL_CLK_PLL5_POST_DIV]  = clk_hw_register_divider_table(NULL, "pll5_post_div", "pll5_video",
   235			 CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0xa0, 19, 2, 0, post_div_table, &imx_ccm_lock);
   236		hws[IMX6UL_CLK_PLL5_VIDEO_DIV] = clk_hw_register_divider_table(NULL, "pll5_video_div", "pll5_post_div",
   237			 CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0x170, 30, 2, 0, video_div_table, &imx_ccm_lock);
   238	
   239		/*						   name		parent_name	 mult  div */
   240		hws[IMX6UL_CLK_PLL2_198M] = imx_clk_hw_fixed_factor("pll2_198m", "pll2_pfd2_396m", 1,	2);
   241		hws[IMX6UL_CLK_PLL3_80M]  = imx_clk_hw_fixed_factor("pll3_80m",  "pll3_usb_otg",   1,	6);
   242		hws[IMX6UL_CLK_PLL3_60M]  = imx_clk_hw_fixed_factor("pll3_60m",  "pll3_usb_otg",   1,	8);
   243		hws[IMX6UL_CLK_GPT_3M]	   = imx_clk_hw_fixed_factor("gpt_3m",	"osc",		 1,	8);
   244	
   245		np = ccm_node;
   246		base = of_iomap(np, 0);
   247		WARN_ON(!base);
   248	
   249		hws[IMX6UL_CA7_SECONDARY_SEL]	  = imx_clk_hw_mux("ca7_secondary_sel", base + 0xc, 3, 1, ca7_secondary_sels, ARRAY_SIZE(ca7_secondary_sels));
   250		hws[IMX6UL_CLK_STEP]		  = imx_clk_hw_mux("step", base + 0x0c, 8, 1, step_sels, ARRAY_SIZE(step_sels));
   251		hws[IMX6UL_CLK_PLL1_SW]	  = imx_clk_hw_mux_flags("pll1_sw",   base + 0x0c, 2,  1, pll1_sw_sels, ARRAY_SIZE(pll1_sw_sels), 0);
   252		hws[IMX6UL_CLK_AXI_ALT_SEL]	  = imx_clk_hw_mux("axi_alt_sel",		base + 0x14, 7,  1, axi_alt_sels, ARRAY_SIZE(axi_alt_sels));
   253		hws[IMX6UL_CLK_AXI_SEL]	  = imx_clk_hw_mux_flags("axi_sel",	base + 0x14, 6,  1, axi_sels, ARRAY_SIZE(axi_sels), 0);
   254		hws[IMX6UL_CLK_PERIPH_PRE]	  = imx_clk_hw_mux("periph_pre",       base + 0x18, 18, 2, periph_pre_sels, ARRAY_SIZE(periph_pre_sels));
   255		hws[IMX6UL_CLK_PERIPH2_PRE]	  = imx_clk_hw_mux("periph2_pre",      base + 0x18, 21, 2, periph2_pre_sels, ARRAY_SIZE(periph2_pre_sels));
   256		hws[IMX6UL_CLK_PERIPH_CLK2_SEL]  = imx_clk_hw_mux("periph_clk2_sel",  base + 0x18, 12, 2, periph_clk2_sels, ARRAY_SIZE(periph_clk2_sels));
   257		hws[IMX6UL_CLK_PERIPH2_CLK2_SEL] = imx_clk_hw_mux("periph2_clk2_sel", base + 0x18, 20, 1, periph2_clk2_sels, ARRAY_SIZE(periph2_clk2_sels));
   258		hws[IMX6UL_CLK_EIM_SLOW_SEL]	  = imx_clk_hw_mux("eim_slow_sel", base + 0x1c, 29, 2, eim_slow_sels, ARRAY_SIZE(eim_slow_sels));
   259		hws[IMX6UL_CLK_GPMI_SEL]	  = imx_clk_hw_mux("gpmi_sel",     base + 0x1c, 19, 1, gpmi_sels, ARRAY_SIZE(gpmi_sels));
   260		hws[IMX6UL_CLK_BCH_SEL]	  = imx_clk_hw_mux("bch_sel",	base + 0x1c, 18, 1, bch_sels, ARRAY_SIZE(bch_sels));
   261		hws[IMX6UL_CLK_USDHC2_SEL]	  = imx_clk_hw_mux("usdhc2_sel",   base + 0x1c, 17, 1, usdhc_sels, ARRAY_SIZE(usdhc_sels));
   262		hws[IMX6UL_CLK_USDHC1_SEL]	  = imx_clk_hw_mux("usdhc1_sel",   base + 0x1c, 16, 1, usdhc_sels, ARRAY_SIZE(usdhc_sels));
   263		hws[IMX6UL_CLK_SAI3_SEL]	  = imx_clk_hw_mux("sai3_sel",     base + 0x1c, 14, 2, sai_sels, ARRAY_SIZE(sai_sels));
   264		hws[IMX6UL_CLK_SAI2_SEL]         = imx_clk_hw_mux("sai2_sel",     base + 0x1c, 12, 2, sai_sels, ARRAY_SIZE(sai_sels));
   265		hws[IMX6UL_CLK_SAI1_SEL]	  = imx_clk_hw_mux("sai1_sel",     base + 0x1c, 10, 2, sai_sels, ARRAY_SIZE(sai_sels));
   266		hws[IMX6UL_CLK_QSPI1_SEL]	  = imx_clk_hw_mux("qspi1_sel",    base + 0x1c, 7,  3, qspi1_sels, ARRAY_SIZE(qspi1_sels));
   267		hws[IMX6UL_CLK_PERCLK_SEL]	  = imx_clk_hw_mux("perclk_sel",	base + 0x1c, 6,  1, perclk_sels, ARRAY_SIZE(perclk_sels));
   268		hws[IMX6UL_CLK_CAN_SEL]	  = imx_clk_hw_mux("can_sel",	base + 0x20, 8,  2, can_sels, ARRAY_SIZE(can_sels));
   269		if (clk_on_imx6ull())
   270			hws[IMX6ULL_CLK_ESAI_SEL]	  = imx_clk_hw_mux("esai_sel",	base + 0x20, 19, 2, esai_sels, ARRAY_SIZE(esai_sels));
   271		hws[IMX6UL_CLK_UART_SEL]	  = imx_clk_hw_mux("uart_sel",	base + 0x24, 6,  1, uart_sels, ARRAY_SIZE(uart_sels));
   272		hws[IMX6UL_CLK_ENFC_SEL]	  = imx_clk_hw_mux("enfc_sel",	base + 0x2c, 15, 3, enfc_sels, ARRAY_SIZE(enfc_sels));
   273		hws[IMX6UL_CLK_LDB_DI0_SEL]	  = imx_clk_hw_mux("ldb_di0_sel",	base + 0x2c, 9,  3, ldb_di0_sels, ARRAY_SIZE(ldb_di0_sels));
   274		hws[IMX6UL_CLK_SPDIF_SEL]	  = imx_clk_hw_mux("spdif_sel",	base + 0x30, 20, 2, spdif_sels, ARRAY_SIZE(spdif_sels));
   275		if (clk_on_imx6ul()) {
   276			hws[IMX6UL_CLK_SIM_PRE_SEL]	= imx_clk_hw_mux("sim_pre_sel",	base + 0x34, 15, 3, sim_pre_sels, ARRAY_SIZE(sim_pre_sels));
   277			hws[IMX6UL_CLK_SIM_SEL]		= imx_clk_hw_mux("sim_sel",	base + 0x34, 9, 3, sim_sels, ARRAY_SIZE(sim_sels));
   278		} else if (clk_on_imx6ull()) {
   279			hws[IMX6ULL_CLK_EPDC_PRE_SEL]	= imx_clk_hw_mux("epdc_pre_sel",	base + 0x34, 15, 3, epdc_pre_sels, ARRAY_SIZE(epdc_pre_sels));
   280			hws[IMX6ULL_CLK_EPDC_SEL]	= imx_clk_hw_mux("epdc_sel",	base + 0x34, 9, 3, epdc_sels, ARRAY_SIZE(epdc_sels));
   281		}
   282		hws[IMX6UL_CLK_ECSPI_SEL]	  = imx_clk_hw_mux("ecspi_sel",	base + 0x38, 18, 1, ecspi_sels, ARRAY_SIZE(ecspi_sels));
   283		hws[IMX6UL_CLK_LCDIF_PRE_SEL]	  = imx_clk_hw_mux_flags("lcdif_pre_sel", base + 0x38, 15, 3, lcdif_pre_sels, ARRAY_SIZE(lcdif_pre_sels), CLK_SET_RATE_PARENT);
   284		hws[IMX6UL_CLK_LCDIF_SEL]	  = imx_clk_hw_mux("lcdif_sel",	base + 0x38, 9, 3, lcdif_sels, ARRAY_SIZE(lcdif_sels));
   285		hws[IMX6UL_CLK_CSI_SEL]		  = imx_clk_hw_mux("csi_sel", base + 0x3c, 9, 2, csi_sels, ARRAY_SIZE(csi_sels));
   286	
   287		hws[IMX6UL_CLK_LDB_DI0_DIV_SEL]  = imx_clk_hw_mux("ldb_di0", base + 0x20, 10, 1, ldb_di0_div_sels, ARRAY_SIZE(ldb_di0_div_sels));
   288		hws[IMX6UL_CLK_LDB_DI1_DIV_SEL]  = imx_clk_hw_mux("ldb_di1", base + 0x20, 11, 1, ldb_di1_div_sels, ARRAY_SIZE(ldb_di1_div_sels));
   289	
   290		hws[IMX6UL_CLK_CKO1_SEL]	  = imx_clk_hw_mux("cko1_sel", base + 0x60, 0,  4, cko1_sels, ARRAY_SIZE(cko1_sels));
   291		hws[IMX6UL_CLK_CKO2_SEL]	  = imx_clk_hw_mux("cko2_sel", base + 0x60, 16, 5, cko2_sels, ARRAY_SIZE(cko2_sels));
   292		hws[IMX6UL_CLK_CKO]		  = imx_clk_hw_mux("cko", base + 0x60, 8, 1, cko_sels, ARRAY_SIZE(cko_sels));
   293	
   294		hws[IMX6UL_CLK_LDB_DI0_DIV_3_5] = imx_clk_hw_fixed_factor("ldb_di0_div_3_5", "ldb_di0_sel", 2, 7);
   295		hws[IMX6UL_CLK_LDB_DI0_DIV_7]	 = imx_clk_hw_fixed_factor("ldb_di0_div_7",   "ldb_di0_sel", 1, 7);
   296		hws[IMX6UL_CLK_LDB_DI1_DIV_3_5] = imx_clk_hw_fixed_factor("ldb_di1_div_3_5", "qspi1_sel", 2, 7);
   297		hws[IMX6UL_CLK_LDB_DI1_DIV_7]	 = imx_clk_hw_fixed_factor("ldb_di1_div_7",   "qspi1_sel", 1, 7);
   298	
   299		hws[IMX6UL_CLK_PERIPH]  = imx_clk_hw_busy_mux("periph",  base + 0x14, 25, 1, base + 0x48, 5, periph_sels, ARRAY_SIZE(periph_sels));
   300		hws[IMX6UL_CLK_PERIPH2] = imx_clk_hw_busy_mux("periph2", base + 0x14, 26, 1, base + 0x48, 3, periph2_sels, ARRAY_SIZE(periph2_sels));
   301	
   302		hws[IMX6UL_CLK_PERIPH_CLK2]	= imx_clk_hw_divider("periph_clk2",   "periph_clk2_sel",	base + 0x14, 27, 3);
   303		hws[IMX6UL_CLK_PERIPH2_CLK2]	= imx_clk_hw_divider("periph2_clk2",  "periph2_clk2_sel",	base + 0x14, 0,  3);
   304		hws[IMX6UL_CLK_IPG]		= imx_clk_hw_divider("ipg",	   "ahb",		base + 0x14, 8,	 2);
   305		hws[IMX6UL_CLK_LCDIF_PODF]	= imx_clk_hw_divider("lcdif_podf",	   "lcdif_pred",	base + 0x18, 23, 3);
   306		hws[IMX6UL_CLK_QSPI1_PDOF]	= imx_clk_hw_divider("qspi1_podf",	   "qspi1_sel",		base + 0x1c, 26, 3);
   307		hws[IMX6UL_CLK_EIM_SLOW_PODF]	= imx_clk_hw_divider("eim_slow_podf", "eim_slow_sel",	base + 0x1c, 23, 3);
   308		hws[IMX6UL_CLK_PERCLK]		= imx_clk_hw_divider("perclk",	   "perclk_sel",	base + 0x1c, 0,  6);
   309		hws[IMX6UL_CLK_CAN_PODF]	= imx_clk_hw_divider("can_podf",	   "can_sel",		base + 0x20, 2,  6);
   310		hws[IMX6UL_CLK_GPMI_PODF]	= imx_clk_hw_divider("gpmi_podf",	   "gpmi_sel",		base + 0x24, 22, 3);
   311		hws[IMX6UL_CLK_BCH_PODF]	= imx_clk_hw_divider("bch_podf",	   "bch_sel",		base + 0x24, 19, 3);
   312		hws[IMX6UL_CLK_USDHC2_PODF]	= imx_clk_hw_divider("usdhc2_podf",   "usdhc2_sel",	base + 0x24, 16, 3);
   313		hws[IMX6UL_CLK_USDHC1_PODF]	= imx_clk_hw_divider("usdhc1_podf",   "usdhc1_sel",	base + 0x24, 11, 3);
   314		hws[IMX6UL_CLK_UART_PODF]	= imx_clk_hw_divider("uart_podf",	   "uart_sel",		base + 0x24, 0,  6);
   315		hws[IMX6UL_CLK_SAI3_PRED]	= imx_clk_hw_divider("sai3_pred",	   "sai3_sel",		base + 0x28, 22, 3);
   316		hws[IMX6UL_CLK_SAI3_PODF]	= imx_clk_hw_divider("sai3_podf",	   "sai3_pred",		base + 0x28, 16, 6);
   317		hws[IMX6UL_CLK_SAI1_PRED]	= imx_clk_hw_divider("sai1_pred",	   "sai1_sel",		base + 0x28, 6,	 3);
   318		hws[IMX6UL_CLK_SAI1_PODF]	= imx_clk_hw_divider("sai1_podf",	   "sai1_pred",		base + 0x28, 0,	 6);
   319		if (clk_on_imx6ull()) {
   320			hws[IMX6ULL_CLK_ESAI_PRED]	= imx_clk_hw_divider("esai_pred",     "esai_sel",		base + 0x28, 9,  3);
   321			hws[IMX6ULL_CLK_ESAI_PODF]	= imx_clk_hw_divider("esai_podf",     "esai_pred",		base + 0x28, 25, 3);
   322		}
   323		hws[IMX6UL_CLK_ENFC_PRED]	= imx_clk_hw_divider("enfc_pred",	   "enfc_sel",		base + 0x2c, 18, 3);
   324		hws[IMX6UL_CLK_ENFC_PODF]	= imx_clk_hw_divider("enfc_podf",	   "enfc_pred",		base + 0x2c, 21, 6);
   325		hws[IMX6UL_CLK_SAI2_PRED]	= imx_clk_hw_divider("sai2_pred",	   "sai2_sel",		base + 0x2c, 6,	 3);
   326		hws[IMX6UL_CLK_SAI2_PODF]	= imx_clk_hw_divider("sai2_podf",	   "sai2_pred",		base + 0x2c, 0,  6);
   327		hws[IMX6UL_CLK_SPDIF_PRED]	= imx_clk_hw_divider("spdif_pred",	   "spdif_sel",		base + 0x30, 25, 3);
   328		hws[IMX6UL_CLK_SPDIF_PODF]	= imx_clk_hw_divider("spdif_podf",	   "spdif_pred",	base + 0x30, 22, 3);
   329		if (clk_on_imx6ul())
   330			hws[IMX6UL_CLK_SIM_PODF]	= imx_clk_hw_divider("sim_podf",	   "sim_pre_sel",	base + 0x34, 12, 3);
   331		else if (clk_on_imx6ull())
   332			hws[IMX6ULL_CLK_EPDC_PODF]	= imx_clk_hw_divider("epdc_podf",	   "epdc_pre_sel",	base + 0x34, 12, 3);
   333		hws[IMX6UL_CLK_ECSPI_PODF]	= imx_clk_hw_divider("ecspi_podf",	   "ecspi_sel",		base + 0x38, 19, 6);
   334		hws[IMX6UL_CLK_LCDIF_PRED]	= imx_clk_hw_divider("lcdif_pred",	   "lcdif_pre_sel",	base + 0x38, 12, 3);
   335		hws[IMX6UL_CLK_CSI_PODF]       = imx_clk_hw_divider("csi_podf",      "csi_sel",           base + 0x3c, 11, 3);
   336	
   337		hws[IMX6UL_CLK_CKO1_PODF]	= imx_clk_hw_divider("cko1_podf",     "cko1_sel",          base + 0x60, 4,  3);
   338		hws[IMX6UL_CLK_CKO2_PODF]	= imx_clk_hw_divider("cko2_podf",     "cko2_sel",          base + 0x60, 21, 3);
   339	
   340		hws[IMX6UL_CLK_ARM]		= imx_clk_hw_busy_divider("arm",	    "pll1_sw",	base +	0x10, 0,  3,  base + 0x48, 16);
   341		hws[IMX6UL_CLK_MMDC_PODF]	= imx_clk_hw_busy_divider("mmdc_podf", "periph2",	base +  0x14, 3,  3,  base + 0x48, 2);
   342		hws[IMX6UL_CLK_AXI_PODF]	= imx_clk_hw_busy_divider("axi_podf",  "axi_sel",	base +  0x14, 16, 3,  base + 0x48, 0);
   343		hws[IMX6UL_CLK_AHB]		= imx_clk_hw_busy_divider("ahb",	    "periph",	base +  0x14, 10, 3,  base + 0x48, 1);
   344	
   345		/* CCGR0 */
   346		hws[IMX6UL_CLK_AIPSTZ1]	= imx_clk_hw_gate2_flags("aips_tz1", "ahb", base + 0x68, 0, CLK_IS_CRITICAL);
   347		hws[IMX6UL_CLK_AIPSTZ2]	= imx_clk_hw_gate2_flags("aips_tz2", "ahb", base + 0x68, 2, CLK_IS_CRITICAL);
   348		hws[IMX6UL_CLK_APBHDMA]	= imx_clk_hw_gate2("apbh_dma",	"bch_podf",	base + 0x68,	4);
   349		hws[IMX6UL_CLK_ASRC_IPG]	= imx_clk_hw_gate2_shared("asrc_ipg",	"ahb",	base + 0x68,	6, &share_count_asrc);
   350		hws[IMX6UL_CLK_ASRC_MEM]	= imx_clk_hw_gate2_shared("asrc_mem",	"ahb",	base + 0x68,	6, &share_count_asrc);
   351		if (clk_on_imx6ul()) {
   352			hws[IMX6UL_CLK_CAAM_MEM]	= imx_clk_hw_gate2("caam_mem",	"ahb",		base + 0x68,	8);
   353			hws[IMX6UL_CLK_CAAM_ACLK]	= imx_clk_hw_gate2("caam_aclk",	"ahb",		base + 0x68,	10);
   354			hws[IMX6UL_CLK_CAAM_IPG]	= imx_clk_hw_gate2("caam_ipg",	"ipg",		base + 0x68,	12);
   355		} else if (clk_on_imx6ull()) {
   356			hws[IMX6ULL_CLK_DCP_CLK]	= imx_clk_hw_gate2("dcp",		"ahb",		base + 0x68,	10);
   357			hws[IMX6UL_CLK_ENET]		= imx_clk_hw_gate2("enet",		"ipg",		base + 0x68,	12);
   358			hws[IMX6UL_CLK_ENET_AHB]	= imx_clk_hw_gate2("enet_ahb",	"ahb",		base + 0x68,	12);
   359		}
   360		hws[IMX6UL_CLK_CAN1_IPG]	= imx_clk_hw_gate2("can1_ipg",	"ipg",		base + 0x68,	14);
   361		hws[IMX6UL_CLK_CAN1_SERIAL]	= imx_clk_hw_gate2("can1_serial",	"can_podf",	base + 0x68,	16);
   362		hws[IMX6UL_CLK_CAN2_IPG]	= imx_clk_hw_gate2("can2_ipg",	"ipg",		base + 0x68,	18);
   363		hws[IMX6UL_CLK_CAN2_SERIAL]	= imx_clk_hw_gate2("can2_serial",	"can_podf",	base + 0x68,	20);
   364		hws[IMX6UL_CLK_GPT2_BUS]	= imx_clk_hw_gate2("gpt2_bus",	"perclk",	base + 0x68,	24);
   365		hws[IMX6UL_CLK_GPT2_SERIAL]	= imx_clk_hw_gate2("gpt2_serial",	"perclk",	base + 0x68,	26);
   366		hws[IMX6UL_CLK_UART2_IPG]	= imx_clk_hw_gate2("uart2_ipg",	"ipg",		base + 0x68,	28);
   367		hws[IMX6UL_CLK_UART2_SERIAL]	= imx_clk_hw_gate2("uart2_serial",	"uart_podf",	base + 0x68,	28);
   368		if (clk_on_imx6ull())
   369			hws[IMX6UL_CLK_AIPSTZ3]	= imx_clk_hw_gate2("aips_tz3",	"ahb",		 base + 0x80,	18);
   370		hws[IMX6UL_CLK_GPIO2]		= imx_clk_hw_gate2("gpio2",	"ipg",		base + 0x68,	30);
   371	
   372		/* CCGR1 */
   373		hws[IMX6UL_CLK_ECSPI1]		= imx_clk_hw_gate2("ecspi1",	"ecspi_podf",	base + 0x6c,	0);
   374		hws[IMX6UL_CLK_ECSPI2]		= imx_clk_hw_gate2("ecspi2",	"ecspi_podf",	base + 0x6c,	2);
   375		hws[IMX6UL_CLK_ECSPI3]		= imx_clk_hw_gate2("ecspi3",	"ecspi_podf",	base + 0x6c,	4);
   376		hws[IMX6UL_CLK_ECSPI4]		= imx_clk_hw_gate2("ecspi4",	"ecspi_podf",	base + 0x6c,	6);
   377		hws[IMX6UL_CLK_ADC2]		= imx_clk_hw_gate2("adc2",		"ipg",		base + 0x6c,	8);
   378		hws[IMX6UL_CLK_UART3_IPG]	= imx_clk_hw_gate2("uart3_ipg",	"ipg",		base + 0x6c,	10);
   379		hws[IMX6UL_CLK_UART3_SERIAL]	= imx_clk_hw_gate2("uart3_serial",	"uart_podf",	base + 0x6c,	10);
   380		hws[IMX6UL_CLK_EPIT1]		= imx_clk_hw_gate2("epit1",	"perclk",	base + 0x6c,	12);
   381		hws[IMX6UL_CLK_EPIT2]		= imx_clk_hw_gate2("epit2",	"perclk",	base + 0x6c,	14);
   382		hws[IMX6UL_CLK_ADC1]		= imx_clk_hw_gate2("adc1",		"ipg",		base + 0x6c,	16);
   383		hws[IMX6UL_CLK_GPT1_BUS]	= imx_clk_hw_gate2("gpt1_bus",	"perclk",	base + 0x6c,	20);
   384		hws[IMX6UL_CLK_GPT1_SERIAL]	= imx_clk_hw_gate2("gpt1_serial",	"perclk",	base + 0x6c,	22);
   385		hws[IMX6UL_CLK_UART4_IPG]	= imx_clk_hw_gate2("uart4_ipg",	"ipg",		base + 0x6c,	24);
   386		hws[IMX6UL_CLK_UART4_SERIAL]	= imx_clk_hw_gate2("uart4_serial",	"uart_podf",	base + 0x6c,	24);
   387		hws[IMX6UL_CLK_GPIO1]		= imx_clk_hw_gate2("gpio1",	"ipg",		base + 0x6c,	26);
   388		hws[IMX6UL_CLK_GPIO5]		= imx_clk_hw_gate2("gpio5",	"ipg",		base + 0x6c,	30);
   389	
   390		/* CCGR2 */
   391		if (clk_on_imx6ull()) {
   392			hws[IMX6ULL_CLK_ESAI_EXTAL]	= imx_clk_hw_gate2_shared("esai_extal",	"esai_podf",	base + 0x70,	0, &share_count_esai);
   393			hws[IMX6ULL_CLK_ESAI_IPG]	= imx_clk_hw_gate2_shared("esai_ipg",	"ahb",		base + 0x70,	0, &share_count_esai);
   394			hws[IMX6ULL_CLK_ESAI_MEM]	= imx_clk_hw_gate2_shared("esai_mem",	"ahb",		base + 0x70,	0, &share_count_esai);
   395		}
   396		hws[IMX6UL_CLK_I2C1]		= imx_clk_hw_gate2("i2c1",		"perclk",	base + 0x70,	6);
   397		hws[IMX6UL_CLK_I2C2]		= imx_clk_hw_gate2("i2c2",		"perclk",	base + 0x70,	8);
   398		hws[IMX6UL_CLK_I2C3]		= imx_clk_hw_gate2("i2c3",		"perclk",	base + 0x70,	10);
   399		hws[IMX6UL_CLK_OCOTP]		= imx_clk_hw_gate2("ocotp",	"ipg",		base + 0x70,	12);
   400		hws[IMX6UL_CLK_IOMUXC]		= imx_clk_hw_gate2("iomuxc",	"lcdif_podf",	base + 0x70,	14);
   401		hws[IMX6UL_CLK_GPIO3]		= imx_clk_hw_gate2("gpio3",	"ipg",		base + 0x70,	26);
   402		hws[IMX6UL_CLK_LCDIF_APB]	= imx_clk_hw_gate2("lcdif_apb",	"axi",		base + 0x70,	28);
   403		hws[IMX6UL_CLK_PXP]		= imx_clk_hw_gate2("pxp",		"axi",		base + 0x70,	30);
   404	
   405		/* CCGR3 */
   406		/*
   407		 * Although the imx6ull reference manual lists CCGR2 as the csi clk
   408		 * gate register, tests have shown that it is actually the CCGR3
   409		 * register bit 0/1, same as for the imx6ul.
   410		 */
   411		hws[IMX6UL_CLK_CSI]		= imx_clk_hw_gate2("csi",	"csi_podf",	base + 0x74,	0);
   412		hws[IMX6UL_CLK_UART5_IPG]	= imx_clk_hw_gate2("uart5_ipg",	"ipg",		base + 0x74,	2);
   413		hws[IMX6UL_CLK_UART5_SERIAL]	= imx_clk_hw_gate2("uart5_serial",	"uart_podf",	base + 0x74,	2);
   414		if (clk_on_imx6ul()) {
   415			hws[IMX6UL_CLK_ENET]		= imx_clk_hw_gate2("enet",		"ipg",		base + 0x74,	4);
   416			hws[IMX6UL_CLK_ENET_AHB]	= imx_clk_hw_gate2("enet_ahb",	"ahb",		base + 0x74,	4);
   417		} else if (clk_on_imx6ull()) {
   418			hws[IMX6ULL_CLK_EPDC_ACLK]	= imx_clk_hw_gate2("epdc_aclk",	"axi",		base + 0x74,	4);
   419			hws[IMX6ULL_CLK_EPDC_PIX]	= imx_clk_hw_gate2("epdc_pix",	"epdc_podf",	base + 0x74,	4);
   420		}
   421		hws[IMX6UL_CLK_UART6_IPG]	= imx_clk_hw_gate2("uart6_ipg",	"ipg",		base + 0x74,	6);
   422		hws[IMX6UL_CLK_UART6_SERIAL]	= imx_clk_hw_gate2("uart6_serial",	"uart_podf",	base + 0x74,	6);
   423		hws[IMX6UL_CLK_LCDIF_PIX]	= imx_clk_hw_gate2("lcdif_pix",	"lcdif_podf",	base + 0x74,	10);
   424		hws[IMX6UL_CLK_GPIO4]		= imx_clk_hw_gate2("gpio4",	"ipg",		base + 0x74,	12);
   425		hws[IMX6UL_CLK_QSPI]		= imx_clk_hw_gate2("qspi1",	"qspi1_podf",	base + 0x74,	14);
   426		hws[IMX6UL_CLK_WDOG1]		= imx_clk_hw_gate2("wdog1",	"ipg",		base + 0x74,	16);
   427		hws[IMX6UL_CLK_MMDC_P0_FAST]	= imx_clk_hw_gate_flags("mmdc_p0_fast", "mmdc_podf", base + 0x74,	20, CLK_IS_CRITICAL);
   428		hws[IMX6UL_CLK_MMDC_P0_IPG]	= imx_clk_hw_gate2_flags("mmdc_p0_ipg",	"ipg",		base + 0x74,	24, CLK_IS_CRITICAL);
   429		hws[IMX6UL_CLK_MMDC_P1_IPG]	= imx_clk_hw_gate2_flags("mmdc_p1_ipg",	"ipg",		base + 0x74,	26, CLK_IS_CRITICAL);
   430		hws[IMX6UL_CLK_AXI]		= imx_clk_hw_gate_flags("axi",	"axi_podf",	base + 0x74,	28, CLK_IS_CRITICAL);
   431	
   432		/* CCGR4 */
   433		hws[IMX6UL_CLK_PER_BCH]	= imx_clk_hw_gate2("per_bch",	"bch_podf",	base + 0x78,	12);
   434		hws[IMX6UL_CLK_PWM1]		= imx_clk_hw_gate2("pwm1",		"perclk",	base + 0x78,	16);
   435		hws[IMX6UL_CLK_PWM2]		= imx_clk_hw_gate2("pwm2",		"perclk",	base + 0x78,	18);
   436		hws[IMX6UL_CLK_PWM3]		= imx_clk_hw_gate2("pwm3",		"perclk",	base + 0x78,	20);
   437		hws[IMX6UL_CLK_PWM4]		= imx_clk_hw_gate2("pwm4",		"perclk",	base + 0x78,	22);
   438		hws[IMX6UL_CLK_GPMI_BCH_APB]	= imx_clk_hw_gate2("gpmi_bch_apb",	"bch_podf",	base + 0x78,	24);
   439		hws[IMX6UL_CLK_GPMI_BCH]	= imx_clk_hw_gate2("gpmi_bch",	"gpmi_podf",	base + 0x78,	26);
   440		hws[IMX6UL_CLK_GPMI_IO]	= imx_clk_hw_gate2("gpmi_io",	"enfc_podf",	base + 0x78,	28);
   441		hws[IMX6UL_CLK_GPMI_APB]	= imx_clk_hw_gate2("gpmi_apb",	"bch_podf",	base + 0x78,	30);
   442	
   443		/* CCGR5 */
   444		hws[IMX6UL_CLK_ROM]		= imx_clk_hw_gate2_flags("rom",	"ahb",		base + 0x7c,	0,	CLK_IS_CRITICAL);
   445		hws[IMX6UL_CLK_SDMA]		= imx_clk_hw_gate2("sdma",		"ahb",		base + 0x7c,	6);
   446		hws[IMX6UL_CLK_KPP]		= imx_clk_hw_gate2("kpp",		"ipg",		base + 0x7c,	8);
   447		hws[IMX6UL_CLK_WDOG2]		= imx_clk_hw_gate2("wdog2",	"ipg",		base + 0x7c,	10);
   448		hws[IMX6UL_CLK_SPBA]		= imx_clk_hw_gate2("spba",		"ipg",		base + 0x7c,	12);
   449		hws[IMX6UL_CLK_SPDIF]		= imx_clk_hw_gate2_shared("spdif",		"spdif_podf",	base + 0x7c,	14, &share_count_audio);
   450		hws[IMX6UL_CLK_SPDIF_GCLK]	= imx_clk_hw_gate2_shared("spdif_gclk",	"ipg",		base + 0x7c,	14, &share_count_audio);
   451		hws[IMX6UL_CLK_SAI3]		= imx_clk_hw_gate2_shared("sai3",		"sai3_podf",	base + 0x7c,	22, &share_count_sai3);
   452		hws[IMX6UL_CLK_SAI3_IPG]	= imx_clk_hw_gate2_shared("sai3_ipg",	"ipg",		base + 0x7c,	22, &share_count_sai3);
   453		hws[IMX6UL_CLK_UART1_IPG]	= imx_clk_hw_gate2("uart1_ipg",	"ipg",		base + 0x7c,	24);
   454		hws[IMX6UL_CLK_UART1_SERIAL]	= imx_clk_hw_gate2("uart1_serial",	"uart_podf",	base + 0x7c,	24);
   455		hws[IMX6UL_CLK_UART7_IPG]	= imx_clk_hw_gate2("uart7_ipg",	"ipg",		base + 0x7c,	26);
   456		hws[IMX6UL_CLK_UART7_SERIAL]	= imx_clk_hw_gate2("uart7_serial",	"uart_podf",	base + 0x7c,	26);
   457		hws[IMX6UL_CLK_SAI1]		= imx_clk_hw_gate2_shared("sai1",		"sai1_podf",	base + 0x7c,	28, &share_count_sai1);
   458		hws[IMX6UL_CLK_SAI1_IPG]	= imx_clk_hw_gate2_shared("sai1_ipg",	"ipg",		base + 0x7c,	28, &share_count_sai1);
   459		hws[IMX6UL_CLK_SAI2]		= imx_clk_hw_gate2_shared("sai2",		"sai2_podf",	base + 0x7c,	30, &share_count_sai2);
   460		hws[IMX6UL_CLK_SAI2_IPG]	= imx_clk_hw_gate2_shared("sai2_ipg",	"ipg",		base + 0x7c,	30, &share_count_sai2);
   461	
   462		/* CCGR6 */
   463		hws[IMX6UL_CLK_USBOH3]		= imx_clk_hw_gate2("usboh3",	"ipg",		 base + 0x80,	0);
   464		hws[IMX6UL_CLK_USDHC1]		= imx_clk_hw_gate2("usdhc1",	"usdhc1_podf",	 base + 0x80,	2);
   465		hws[IMX6UL_CLK_USDHC2]		= imx_clk_hw_gate2("usdhc2",	"usdhc2_podf",	 base + 0x80,	4);
   466		if (clk_on_imx6ul()) {
   467			hws[IMX6UL_CLK_SIM1]		= imx_clk_hw_gate2("sim1",		"sim_sel",	 base + 0x80,	6);
   468			hws[IMX6UL_CLK_SIM2]		= imx_clk_hw_gate2("sim2",		"sim_sel",	 base + 0x80,	8);
   469		}
   470		hws[IMX6UL_CLK_EIM]		= imx_clk_hw_gate2("eim",		"eim_slow_podf", base + 0x80,	10);
   471		hws[IMX6UL_CLK_PWM8]		= imx_clk_hw_gate2("pwm8",		"perclk",	 base + 0x80,	16);
   472		hws[IMX6UL_CLK_UART8_IPG]	= imx_clk_hw_gate2("uart8_ipg",	"ipg",		 base + 0x80,	14);
   473		hws[IMX6UL_CLK_UART8_SERIAL]	= imx_clk_hw_gate2("uart8_serial", "uart_podf",	 base + 0x80,	14);
   474		hws[IMX6UL_CLK_WDOG3]		= imx_clk_hw_gate2("wdog3",	"ipg",		 base + 0x80,	20);
   475		hws[IMX6UL_CLK_I2C4]		= imx_clk_hw_gate2("i2c4",		"perclk",	 base + 0x80,	24);
   476		hws[IMX6UL_CLK_PWM5]		= imx_clk_hw_gate2("pwm5",		"perclk",	 base + 0x80,	26);
   477		hws[IMX6UL_CLK_PWM6]		= imx_clk_hw_gate2("pwm6",		"perclk",	 base +	0x80,	28);
   478		hws[IMX6UL_CLK_PWM7]		= imx_clk_hw_gate2("pwm7",		"perclk",	 base + 0x80,	30);
   479	
   480		/* CCOSR */
   481		hws[IMX6UL_CLK_CKO1]		= imx_clk_hw_gate("cko1",		"cko1_podf",	 base + 0x60,	7);
   482		hws[IMX6UL_CLK_CKO2]		= imx_clk_hw_gate("cko2",		"cko2_podf",	 base + 0x60,	24);
   483	
   484		/* mask handshake of mmdc */
   485		imx_mmdc_mask_handshake(base, 0);
   486	
   487		hws[IMX6UL_CLK_ENET1_REF_PAD] = imx_obtain_fixed_of_clock(ccm_node, "enet1_ref_pad", 0);
   488	
   489		hws[IMX6UL_CLK_ENET1_REF_SEL] = imx_clk_gpr_mux("enet1_ref_sel", "fsl,imx6ul-iomuxc-gpr",
   490					IOMUXC_GPR1, enet1_ref_sels, ARRAY_SIZE(enet1_ref_sels),
   491					enet1_ref_sels_table, enet1_ref_sels_table_mask);
   492		hws[IMX6UL_CLK_ENET2_REF_PAD] = imx_obtain_fixed_of_clock(ccm_node, "enet2_ref_pad", 0);
   493	
   494		hws[IMX6UL_CLK_ENET2_REF_SEL] = imx_clk_gpr_mux("enet2_ref_sel", "fsl,imx6ul-iomuxc-gpr",
   495					IOMUXC_GPR1, enet2_ref_sels, ARRAY_SIZE(enet2_ref_sels),
   496					enet2_ref_sels_table, enet2_ref_sels_table_mask);
   497	
   498		imx_check_clk_hws(hws, IMX6UL_CLK_END);
   499	
   500		of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
   501	
   502		/*
   503		 * Lower the AHB clock rate before changing the parent clock source,
   504		 * as AHB clock rate can NOT be higher than 133MHz, but its parent
   505		 * will be switched from 396MHz PFD to 528MHz PLL in order to increase
   506		 * AXI clock rate, so we need to lower AHB rate first to make sure at
   507		 * any time, AHB rate is <= 133MHz.
   508		 */
   509		clk_set_rate(hws[IMX6UL_CLK_AHB]->clk, 99000000);
   510	
   511		/* Change periph_pre clock to pll2_bus to adjust AXI rate to 264MHz */
   512		clk_set_parent(hws[IMX6UL_CLK_PERIPH_CLK2_SEL]->clk, hws[IMX6UL_CLK_OSC]->clk);
   513		clk_set_parent(hws[IMX6UL_CLK_PERIPH]->clk, hws[IMX6UL_CLK_PERIPH_CLK2]->clk);
   514		clk_set_parent(hws[IMX6UL_CLK_PERIPH_PRE]->clk, hws[IMX6UL_CLK_PLL2_BUS]->clk);
   515		clk_set_parent(hws[IMX6UL_CLK_PERIPH]->clk, hws[IMX6UL_CLK_PERIPH_PRE]->clk);
   516	
   517		/* Make sure AHB rate is 132MHz  */
   518		clk_set_rate(hws[IMX6UL_CLK_AHB]->clk, 132000000);
   519	
   520		/* set perclk to from OSC */
   521		clk_set_parent(hws[IMX6UL_CLK_PERCLK_SEL]->clk, hws[IMX6UL_CLK_OSC]->clk);
   522	
   523		clk_set_rate(hws[IMX6UL_CLK_ENET_REF]->clk, 50000000);
   524		clk_set_rate(hws[IMX6UL_CLK_ENET2_REF]->clk, 50000000);
   525		clk_set_rate(hws[IMX6UL_CLK_CSI]->clk, 24000000);
   526	
   527		if (clk_on_imx6ull())
   528			clk_prepare_enable(hws[IMX6UL_CLK_AIPSTZ3]->clk);
   529	
   530		if (IS_ENABLED(CONFIG_USB_MXS_PHY)) {
   531			clk_prepare_enable(hws[IMX6UL_CLK_USBPHY1_GATE]->clk);
   532			clk_prepare_enable(hws[IMX6UL_CLK_USBPHY2_GATE]->clk);
   533		}
   534	
   535		clk_set_parent(hws[IMX6UL_CLK_CAN_SEL]->clk, hws[IMX6UL_CLK_PLL3_80M]->clk);
   536		if (clk_on_imx6ul())
   537			clk_set_parent(hws[IMX6UL_CLK_SIM_PRE_SEL]->clk, hws[IMX6UL_CLK_PLL3_USB_OTG]->clk);
   538		else if (clk_on_imx6ull())
   539			clk_set_parent(hws[IMX6ULL_CLK_EPDC_PRE_SEL]->clk, hws[IMX6UL_CLK_PLL3_PFD2]->clk);
   540	
   541		clk_set_parent(hws[IMX6UL_CLK_ENFC_SEL]->clk, hws[IMX6UL_CLK_PLL2_PFD2]->clk);
   542	
   543		clk_set_parent(hws[IMX6UL_CLK_ENET1_REF_SEL]->clk, hws[IMX6UL_CLK_ENET_REF]->clk);
   544		clk_set_parent(hws[IMX6UL_CLK_ENET2_REF_SEL]->clk, hws[IMX6UL_CLK_ENET2_REF]->clk);
   545	
 > 546		imx_register_uart_clocks(2);
   547	}
   548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
