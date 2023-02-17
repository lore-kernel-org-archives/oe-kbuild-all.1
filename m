Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2272105
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676620445; x=1708156445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nr4scn9twWZ6N3VLOPfu438n/aiWnDop/pQprSJ+bN8=;
  b=LoH0RQejM4uaAUBcYwczBkHCxUs4Knu9gD9TB6yqD/Ue39+Y24sf1I3k
   SAMqP3ttHm11/mF/+q1I27fEnVeKYI6VHKYhIxJwKMgn8Sc6pXnBc5Y+Z
   2X0IG/INOZrKWvkSOWlCwNjKyNiGuOzKiMZ9xnVhdMwGKnRfpU7JV5Re9
   kU9wdyiIdmaf3dqPgzEBA8OScRYg6ogVj/4iRZlWAReRbmCF9v9x0LHgg
   R0qxInSFdQ22fPrMb4pmFiiWGoFA4kNuc14SXfXbIalwWmBzesuoFhosm
   D06MEDSJArtudzYvy5kNhT0eAv/mzKxZX1l5v8/v6WkVwwOUXvFPmYa2H
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359382720"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="359382720"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 23:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915989882"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="915989882"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Feb 2023 23:54:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSvZC-000BDC-18;
	Fri, 17 Feb 2023 07:54:02 +0000
Date: Fri, 17 Feb 2023 15:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sandeep Panda <spanda@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrzej Hajda <a.hajda@samsung.com>,
	Sean Paul <seanpaul@chromium.org>,
	"Kristian H. Kristensen" <hoegsberg@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 384/9999]
 drivers/gpu/drm/bridge/ti-sn65dsi86.c:366:9: sparse: sparse: cast truncates
 bits from constant value (ffffffffe becomes fffffffe)
Message-ID: <202302171558.Jt8NUkpo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: a1834678f77d4aa1a3a5dd91b43f75ffae44c02f [384/9999] UPSTREAM: drm/bridge: add support for sn65dsi86 bridge driver
config: sh-randconfig-s033-20230212 (https://download.01.org/0day-ci/archive/20230217/202302171558.Jt8NUkpo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/a1834678f77d4aa1a3a5dd91b43f75ffae44c02f
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout a1834678f77d4aa1a3a5dd91b43f75ffae44c02f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh SHELL=/bin/bash drivers/gpu/drm/bridge/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171558.Jt8NUkpo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/bridge/ti-sn65dsi86.c: note: in included file (through arch/sh/include/uapi/asm/byteorder.h, arch/sh/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/byteorder/little_endian.h:8:2: sparse: sparse: inconsistent configuration, CONFIG_CPU_BIG_ENDIAN is set
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:366:9: sparse: sparse: cast truncates bits from constant value (ffffffffe becomes fffffffe)
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:403:9: sparse: sparse: cast truncates bits from constant value (ffffffffe0 becomes ffffffe0)
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:455:9: sparse: sparse: cast truncates bits from constant value (1ffffffff8 becomes fffffff8)
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:460:9: sparse: sparse: cast truncates bits from constant value (3ffffffff0 becomes fffffff0)

vim +366 drivers/gpu/drm/bridge/ti-sn65dsi86.c

   342	
   343	static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
   344	{
   345		int i;
   346		u32 refclk_rate;
   347		const u32 *refclk_lut;
   348		size_t refclk_lut_size;
   349	
   350		if (pdata->refclk) {
   351			refclk_rate = clk_get_rate(pdata->refclk);
   352			refclk_lut = ti_sn_bridge_refclk_lut;
   353			refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
   354			clk_prepare_enable(pdata->refclk);
   355		} else {
   356			refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
   357			refclk_lut = ti_sn_bridge_dsiclk_lut;
   358			refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
   359		}
   360	
   361		/* for i equals to refclk_lut_size means default frequency */
   362		for (i = 0; i < refclk_lut_size; i++)
   363			if (refclk_lut[i] == refclk_rate)
   364				break;
   365	
 > 366		regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG,
   367				   SN_REFCLK_FREQ_BITS, i << SN_REFCLK_FREQ_OFFSET);
   368	}
   369	
   370	/**
   371	 * LUT index corresponds to register value and
   372	 * LUT values corresponds to dp data rate supported
   373	 * by the bridge in Mbps unit.
   374	 */
   375	static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
   376		0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
   377	};
   378	
   379	static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
   380	{
   381		unsigned int bit_rate_mhz, clk_freq_mhz, dp_rate_mhz;
   382		unsigned int val, i;
   383		struct drm_display_mode *mode =
   384			&pdata->bridge.encoder->crtc->state->adjusted_mode;
   385	
   386		/* set DSIA clk frequency */
   387		bit_rate_mhz = (mode->clock / 1000) *
   388				mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
   389		clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
   390	
   391		/* for each increment in val, frequency increases by 5MHz */
   392		val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
   393			(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
   394		regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
   395	
   396		/* set DP data rate */
   397		dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
   398								DP_CLK_FUDGE_DEN;
   399		for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
   400			if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
   401				break;
   402	
 > 403		regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
   404				   SN_DP_DATA_RATE_BITS, i << SN_DP_DATA_RATE_OFFSET);
   405	}
   406	
   407	static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
   408	{
   409		struct drm_display_mode *mode =
   410			&pdata->bridge.encoder->crtc->state->adjusted_mode;
   411		u8 hsync_polarity = 0, vsync_polarity = 0;
   412	
   413		if (mode->flags & DRM_MODE_FLAG_PHSYNC)
   414			hsync_polarity = BIT(SN_SYNC_POLARITY_OFFSET);
   415		if (mode->flags & DRM_MODE_FLAG_PVSYNC)
   416			vsync_polarity = BIT(SN_SYNC_POLARITY_OFFSET);
   417	
   418		ti_sn_bridge_write_u16(pdata, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,
   419				       mode->hdisplay);
   420		ti_sn_bridge_write_u16(pdata, SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG,
   421				       mode->vdisplay);
   422		regmap_write(pdata->regmap, SN_CHA_HSYNC_PULSE_WIDTH_LOW_REG,
   423			     (mode->hsync_end - mode->hsync_start) & 0xFF);
   424		regmap_write(pdata->regmap, SN_CHA_HSYNC_PULSE_WIDTH_HIGH_REG,
   425			     (((mode->hsync_end - mode->hsync_start) >> 8) & 0x7F) |
   426			     hsync_polarity);
   427		regmap_write(pdata->regmap, SN_CHA_VSYNC_PULSE_WIDTH_LOW_REG,
   428			     (mode->vsync_end - mode->vsync_start) & 0xFF);
   429		regmap_write(pdata->regmap, SN_CHA_VSYNC_PULSE_WIDTH_HIGH_REG,
   430			     (((mode->vsync_end - mode->vsync_start) >> 8) & 0x7F) |
   431			     vsync_polarity);
   432	
   433		regmap_write(pdata->regmap, SN_CHA_HORIZONTAL_BACK_PORCH_REG,
   434			     (mode->htotal - mode->hsync_end) & 0xFF);
   435		regmap_write(pdata->regmap, SN_CHA_VERTICAL_BACK_PORCH_REG,
   436			     (mode->vtotal - mode->vsync_end) & 0xFF);
   437	
   438		regmap_write(pdata->regmap, SN_CHA_HORIZONTAL_FRONT_PORCH_REG,
   439			     (mode->hsync_start - mode->hdisplay) & 0xFF);
   440		regmap_write(pdata->regmap, SN_CHA_VERTICAL_FRONT_PORCH_REG,
   441			     (mode->vsync_start - mode->vdisplay) & 0xFF);
   442	
   443		usleep_range(10000, 10500); /* 10ms delay recommended by spec */
   444	}
   445	
   446	static void ti_sn_bridge_enable(struct drm_bridge *bridge)
   447	{
   448		struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
   449		unsigned int val;
   450	
   451		drm_panel_prepare(pdata->panel);
   452	
   453		/* DSI_A lane config */
   454		val = (4 - pdata->dsi->lanes) << SN_DSIA_LANE_OFFSET;
 > 455		regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
   456				   SN_DSIA_NUM_LANES_BITS, val);
   457	
   458		/* DP lane config */
   459		val = (pdata->dsi->lanes - 1) << SN_DP_LANE_OFFSET;
 > 460		regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG,
   461				   SN_DP_NUM_LANES_BITS, val);
   462	
   463		/* set dsi/dp clk frequency value */
   464		ti_sn_bridge_set_dsi_dp_rate(pdata);
   465	
   466		/* enable DP PLL */
   467		regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
   468		usleep_range(10000, 10500); /* 10ms delay recommended by spec */
   469	
   470		/**
   471		 * The SN65DSI86 only supports ASSR Display Authentication method and
   472		 * this method is enabled by default. An eDP panel must support this
   473		 * authentication method. We need to enable this method in the eDP panel
   474		 * at DisplayPort address 0x0010A prior to link training.
   475		 */
   476		regmap_write(pdata->regmap, SN_AUX_WDATA0_REG, 0x01);
   477		regmap_write(pdata->regmap, SN_AUX_ADDR_19_16_REG, 0x00);
   478		regmap_write(pdata->regmap, SN_AUX_ADDR_15_8_REG, 0x01);
   479		regmap_write(pdata->regmap, SN_AUX_ADDR_7_0_REG, 0x0A);
   480		regmap_write(pdata->regmap, SN_AUX_LENGTH_REG, 0x01);
   481		regmap_write(pdata->regmap, SN_AUX_CMD_REG, 0x81);
   482		usleep_range(10000, 10500); /* 10ms delay recommended by spec */
   483	
   484		/* Semi auto link training mode */
   485		regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0x0A);
   486		msleep(20); /* 20ms delay recommended by spec */
   487	
   488		/* config video parameters */
   489		ti_sn_bridge_set_video_timings(pdata);
   490	
   491		/* enable video stream */
   492		regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
   493				   SN_ENABLE_VID_STREAM_BIT, SN_ENABLE_VID_STREAM_BIT);
   494	
   495		drm_panel_enable(pdata->panel);
   496	}
   497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
