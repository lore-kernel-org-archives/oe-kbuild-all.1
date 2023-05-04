Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF3E7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683208424; x=1714744424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E6AsoOgUYPGMSZ38WTKYoUVg5IkLbk95ADoRfe4kdBk=;
  b=YlYuGjKJNuX4Iy1TdNpo9E0R7QukAx9FDg6OU6EA/JpDUb86dZrfd6ii
   UyeePmS5Xyg3WmYNqS8PS9QD4+E886Ev5RRma2CI37odwk88H/Pqw0CR+
   F+41yQPORdq4Hbl4uzWGDkbNaPACVOqxGDq7PXvvVajJsJ2PeaU7hcQHV
   p4YVKFQcVhZQ1tuw+T3PhAFw2gDreucJvuId6mquJ92C4N3gRbUR2odGa
   2Rf5T1UMSpIEPJrgK+8vAr7rNT5gaaiUQrkPdkXPUjFpveMkaUJbW1wFP
   FUjqYmQGCVA8OifY6sjXTg7NVNIOsN2eXUvPG9BaZeRM/d6eGa1hBO2zO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="329293901"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="329293901"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 06:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="697040477"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="697040477"
Received: from lkp-server01.sh.intel.com (HELO d0e14d8700eb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 May 2023 06:53:41 -0700
Received: from kbuild by d0e14d8700eb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puZOv-00001M-0k;
	Thu, 04 May 2023 13:53:41 +0000
Date: Thu, 4 May 2023 21:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Jagan Teki <jagan@amarulasolutions.com>
Subject: [superna9999:amlogic/v6.3/upstream/dsi-ccf-vim3l 11/17]
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:84:40: warning: format '%lu'
 expects argument of type 'long unsigned int', but argument 3 has type 'int'
Message-ID: <202305042144.qjlfIMMy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/superna9999/linux amlogic/v6.3/upstream/dsi-ccf-vim3l
head:   dc9a851c0d5c5f6d8d1446877e6c7af3e443d7ce
commit: d7611879c0bf995a9f22da3eb93d4b16eb1116b2 [11/17] drm/meson: add support for MIPI-DSI transceiver
config: arm-buildonly-randconfig-r002-20230501 (https://download.01.org/0day-ci/archive/20230504/202305042144.qjlfIMMy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/superna9999/linux/commit/d7611879c0bf995a9f22da3eb93d4b16eb1116b2
        git remote add superna9999 https://github.com/superna9999/linux
        git fetch --no-tags superna9999 amlogic/v6.3/upstream/dsi-ccf-vim3l
        git checkout d7611879c0bf995a9f22da3eb93d4b16eb1116b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/meson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305042144.qjlfIMMy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:29,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:8:
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c: In function 'dw_mipi_dsi_phy_init':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:80:9: note: in expansion of macro 'pr_info'
      80 |         pr_info("%s: px_clk_rate before %d\n", __func__, clk_get_rate(mipi_dsi->px_clk));
         |         ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5,
                    from drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:12:
>> drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:84:40: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
      84 |                 dev_err(mipi_dsi->dev, "Failed to set DSI Pixel clock rate %lu (%d)\n",
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:84:17: note: in expansion of macro 'dev_err'
      84 |                 dev_err(mipi_dsi->dev, "Failed to set DSI Pixel clock rate %lu (%d)\n",
         |                 ^~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:84:78: note: format string is defined here
      84 |                 dev_err(mipi_dsi->dev, "Failed to set DSI Pixel clock rate %lu (%d)\n",
         |                                                                            ~~^
         |                                                                              |
         |                                                                              long unsigned int
         |                                                                            %u
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:89:9: note: in expansion of macro 'pr_info'
      89 |         pr_info("%s: px_clk_rate after %d\n", __func__, clk_get_rate(mipi_dsi->px_clk));
         |         ^~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c: In function 'dw_mipi_dsi_get_lane_mbps':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:153:9: note: in expansion of macro 'pr_info'
     153 |         pr_info("%s: bit_clk_rate target %d\n", __func__, mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate); // + (mode->clock * 1000));
         |         ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:154:9: note: in expansion of macro 'pr_info'
     154 |         pr_info("%s: bit_clk_rate before %d\n", __func__, clk_get_rate(mipi_dsi->bit_clk));
         |         ^~~~~~~
>> drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:160:40: warning: too many arguments for format [-Wformat-extra-args]
     160 |                 dev_err(mipi_dsi->dev, "Failed to set DSI Bit clock rate %lu (ret)\n",
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:160:17: note: in expansion of macro 'dev_err'
     160 |                 dev_err(mipi_dsi->dev, "Failed to set DSI Bit clock rate %lu (ret)\n",
         |                 ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:165:9: note: in expansion of macro 'pr_info'
     165 |         pr_info("%s: bit_clk_rate after %d\n", __func__, clk_get_rate(mipi_dsi->bit_clk));
         |         ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:171:9: note: in expansion of macro 'pr_info'
     171 |         pr_info("%s: hs_clk_rate %d\n", __func__, mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate);
         |         ^~~~~~~
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c: In function 'meson_dw_mipi_dsi_probe':
   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:276:13: warning: unused variable 'ret' [-Wunused-variable]
     276 |         int ret;
         |             ^~~


vim +84 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c

    73	
    74	static int dw_mipi_dsi_phy_init(void *priv_data)
    75	{
    76		struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
    77		unsigned int dpi_data_format, venc_data_width;
    78		int ret;
    79	
    80		pr_info("%s: px_clk_rate before %d\n", __func__, clk_get_rate(mipi_dsi->px_clk));
    81	
    82		ret = clk_set_min_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
    83		if (ret) {
  > 84			dev_err(mipi_dsi->dev, "Failed to set DSI Pixel clock rate %lu (%d)\n",
    85			        mipi_dsi->mode->clock * 1000, ret);
    86			return ret;
    87		}
    88	
    89		pr_info("%s: px_clk_rate after %d\n", __func__, clk_get_rate(mipi_dsi->px_clk));
    90	
    91		switch (mipi_dsi->dsi_device->format) {
    92		case MIPI_DSI_FMT_RGB888:
    93			dpi_data_format = DPI_COLOR_24BIT;
    94			venc_data_width = VENC_IN_COLOR_24B;
    95			break;
    96		case MIPI_DSI_FMT_RGB666:
    97			dpi_data_format = DPI_COLOR_18BIT_CFG_2;
    98			venc_data_width = VENC_IN_COLOR_18B;
    99			break;
   100		case MIPI_DSI_FMT_RGB666_PACKED:
   101		case MIPI_DSI_FMT_RGB565:
   102			return -EINVAL;
   103		};
   104	
   105		/* Configure color format for DPI register */
   106		writel_relaxed(FIELD_PREP(MIPI_DSI_TOP_DPI_COLOR_MODE, dpi_data_format) |
   107			       FIELD_PREP(MIPI_DSI_TOP_IN_COLOR_MODE, venc_data_width) |
   108			       FIELD_PREP(MIPI_DSI_TOP_COMP2_SEL, 2) |
   109			       FIELD_PREP(MIPI_DSI_TOP_COMP1_SEL, 1) |
   110			       FIELD_PREP(MIPI_DSI_TOP_COMP0_SEL, 0) |
   111			       (mipi_dsi->mode->flags & DRM_MODE_FLAG_NHSYNC ?
   112					0 : MIPI_DSI_TOP_HSYNC_INVERT) |
   113			       (mipi_dsi->mode->flags & DRM_MODE_FLAG_NVSYNC ?
   114					0 : MIPI_DSI_TOP_VSYNC_INVERT),
   115				mipi_dsi->base + MIPI_DSI_TOP_CNTL);
   116	
   117		return phy_configure(mipi_dsi->phy, &mipi_dsi->phy_opts);
   118	}
   119	
   120	static void dw_mipi_dsi_phy_power_on(void *priv_data)
   121	{
   122		struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
   123	
   124		if (phy_power_on(mipi_dsi->phy))
   125			dev_warn(mipi_dsi->dev, "Failed to power on PHY\n");
   126	}
   127	
   128	static void dw_mipi_dsi_phy_power_off(void *priv_data)
   129	{
   130		struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
   131	
   132		if (phy_power_off(mipi_dsi->phy))
   133			dev_warn(mipi_dsi->dev, "Failed to power off PHY\n");
   134	}
   135	
   136	static int
   137	dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
   138				  unsigned long mode_flags, u32 lanes, u32 format,
   139				  unsigned int *lane_mbps)
   140	{
   141		struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
   142		int bpp;
   143		int ret;
   144	
   145		mipi_dsi->mode = mode;
   146	
   147		bpp = mipi_dsi_pixel_format_to_bpp(mipi_dsi->dsi_device->format);
   148	
   149		phy_mipi_dphy_get_default_config(mode->clock * 1000,
   150						 bpp, mipi_dsi->dsi_device->lanes,
   151						 &mipi_dsi->phy_opts.mipi_dphy);
   152	
   153		pr_info("%s: bit_clk_rate target %d\n", __func__, mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate); // + (mode->clock * 1000));
   154		pr_info("%s: bit_clk_rate before %d\n", __func__, clk_get_rate(mipi_dsi->bit_clk));
   155	
   156		/* Try to set a rate at min hs_clk_rate + pclk */
   157		ret = clk_set_rate(mipi_dsi->bit_clk,
   158				       mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate); // + (mode->clock * 1000));
   159		if (ret) {
 > 160			dev_err(mipi_dsi->dev, "Failed to set DSI Bit clock rate %lu (ret)\n",
   161				mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate, ret); // + (mode->clock * 1000), ret);
   162			return ret;
   163		}
   164	
   165		pr_info("%s: bit_clk_rate after %d\n", __func__, clk_get_rate(mipi_dsi->bit_clk));
   166	
   167		/* Use the rate set as base of hs_clk_rate */
   168		mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate = clk_get_rate(mipi_dsi->bit_clk);
   169	
   170		pr_info("%s: mode clock %d\n", __func__, mode->clock * 1000);
   171		pr_info("%s: hs_clk_rate %d\n", __func__, mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate);
   172	
   173		*lane_mbps = DIV_ROUND_UP(mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate, USEC_PER_SEC);
   174	
   175		return 0;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
