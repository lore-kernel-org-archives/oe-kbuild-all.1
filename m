Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD187E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 03:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685245738; x=1716781738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vlbcxntdiOXI4oxnL+wl1wuVv8fl0YOhj2Qt5SLAty8=;
  b=V6urQyHYwbg8Tsl7GJ/vtJjkBivX8g3hTAnJ5ewLi1n4HEc7++lboV/H
   Nswm1SZqeGiNY2+UQ2GTgF8yNTVmDlu2QjyFi3vw923VVALRyqVJbHf4W
   XOrGt4j5vswlll3e1df/EQUX5byc1B53nfD27HNjj4S/qFh2uzWxaEVKj
   xZ2fl4zLryJ4bKO0MFRxLsh0ChjjmoCDhz4TWy2csn6k1MN1dPlCBeGAk
   DPzHkyLpVUvEgx34flYnO4HUMzYFrvJ/bOdp5OOLy531jfIVovoldHW7P
   Llv3UkElL78ZGK9tNiLnuqMUFNNfhRx0W9oOppPbaVS9OuzhgxWD2jHyK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="334833741"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="334833741"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 20:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="817998575"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="817998575"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2023 20:48:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q37On-000KPi-0g;
	Sun, 28 May 2023 03:48:53 +0000
Date: Sun, 28 May 2023 11:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 1299/9879]
 drivers/video/fbdev/mxc/mxcfb_hx8369_wvga.c:181:6: warning: no previous
 prototype for 'mipid_hx8369_get_lcd_videomode'
Message-ID: <202305281154.LAnt9MzA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: 7e1b3ecc5a586a10aee8fb68ab5ffe95622e328b [1299/9879] video: fbdev: mxc: add HX8369 mipi panel driver support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230528/202305281154.LAnt9MzA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/7e1b3ecc5a586a10aee8fb68ab5ffe95622e328b
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 7e1b3ecc5a586a10aee8fb68ab5ffe95622e328b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281154.LAnt9MzA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/mxc/mxcfb_hx8369_wvga.c:181:6: warning: no previous prototype for 'mipid_hx8369_get_lcd_videomode' [-Wmissing-prototypes]
     181 | void mipid_hx8369_get_lcd_videomode(struct fb_videomode **mode, int *size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/mxc/mxcfb_hx8369_wvga.c:190:5: warning: no previous prototype for 'mipid_hx8369_lcd_setup' [-Wmissing-prototypes]
     190 | int mipid_hx8369_lcd_setup(struct mipi_dsi_info *mipi_dsi)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/mipid_hx8369_get_lcd_videomode +181 drivers/video/fbdev/mxc/mxcfb_hx8369_wvga.c

   174	
   175	static struct mipi_lcd_config lcd_config = {
   176		.virtual_ch		= 0x0,
   177		.data_lane_num  = HX8369_TWO_DATA_LANE,
   178		.max_phy_clk    = HX8369_MAX_DPHY_CLK,
   179		.dpi_fmt		= MIPI_RGB888,
   180	};
 > 181	void mipid_hx8369_get_lcd_videomode(struct fb_videomode **mode, int *size,
   182			struct mipi_lcd_config **data)
   183	{
   184		*mode = &truly_lcd_modedb[0];
   185		*size = ARRAY_SIZE(truly_lcd_modedb);
   186		*data = &lcd_config;
   187	}
   188	EXPORT_SYMBOL(mipid_hx8369_get_lcd_videomode);
   189	
 > 190	int mipid_hx8369_lcd_setup(struct mipi_dsi_info *mipi_dsi)
   191	{
   192		u32 buf[DSI_CMD_BUF_MAXSIZE];
   193		int err;
   194	
   195		dev_dbg(&mipi_dsi->pdev->dev, "MIPI DSI LCD setup.\n");
   196		buf[0] = HX8369_CMD_SETEXTC | (HX8369_CMD_SETEXTC_PARAM_1 << 8);
   197		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE,
   198						buf, HX8369_CMD_SETEXTC_LEN);
   199		CHECK_RETCODE(err);
   200		buf[0] = MIPI_DSI_MAX_RET_PACK_SIZE;
   201		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi,
   202					MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
   203					buf, 0);
   204		CHECK_RETCODE(err);
   205		buf[0] = HX8369_CMD_GETHXID;
   206		err =  mipi_dsi->mipi_dsi_pkt_read(mipi_dsi,
   207				MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM,
   208				buf, HX8369_CMD_GETHXID_LEN);
   209		if (!err && ((buf[0] & HX8369_ID_MASK) == HX8369_ID)) {
   210			dev_info(&mipi_dsi->pdev->dev,
   211					"MIPI DSI LCD ID:0x%x.\n", buf[0]);
   212		} else {
   213			dev_err(&mipi_dsi->pdev->dev,
   214				"mipi_dsi_pkt_read err:%d, data:0x%x.\n",
   215				err, buf[0]);
   216			dev_info(&mipi_dsi->pdev->dev,
   217					"MIPI DSI LCD not detected!\n");
   218			return err;
   219		}
   220	
   221		/* set LCD resolution as 480RGBx800, DPI interface,
   222		 * display operation mode: RGB data bypass GRAM mode.
   223		 */
   224		buf[0] = HX8369_CMD_SETDISP | (HX8369_CMD_SETDISP_1_HALT << 8) |
   225				(HX8369_CMD_SETDISP_2_RES_MODE << 16) |
   226				(HX8369_CMD_SETDISP_3_BP << 24);
   227		buf[1] = HX8369_CMD_SETDISP_4_FP | (HX8369_CMD_SETDISP_5_SAP << 8) |
   228				 (HX8369_CMD_SETDISP_6_GENON << 16) |
   229				 (HX8369_CMD_SETDISP_7_GENOFF << 24);
   230		buf[2] = HX8369_CMD_SETDISP_8_RTN | (HX8369_CMD_SETDISP_9_TEI << 8) |
   231				 (HX8369_CMD_SETDISP_10_TEP_UP << 16) |
   232				 (HX8369_CMD_SETDISP_11_TEP_LOW << 24);
   233		buf[3] = HX8369_CMD_SETDISP_12_BP_PE |
   234				(HX8369_CMD_SETDISP_13_FP_PE << 8) |
   235				 (HX8369_CMD_SETDISP_14_RTN_PE << 16) |
   236				 (HX8369_CMD_SETDISP_15_GON << 24);
   237		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE,
   238							buf, HX8369_CMD_SETDISP_LEN);
   239		CHECK_RETCODE(err);
   240	
   241		/* Set display waveform cycle */
   242		buf[0] = HX8369_CMD_SETCYC | (HX8369_CMD_SETCYC_PARAM_1 << 8);
   243		buf[1] = HX8369_CMD_SETCYC_PARAM_2;
   244		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE,
   245							buf, HX8369_CMD_SETCYC_LEN);
   246		CHECK_RETCODE(err);
   247	
   248		/* Set GIP timing output control */
   249		buf[0] = HX8369_CMD_SETGIP | (HX8369_CMD_SETGIP_PARAM_1 << 8);
   250		buf[1] = HX8369_CMD_SETGIP_PARAM_2;
   251		buf[2] = HX8369_CMD_SETGIP_PARAM_3;
   252		buf[3] = HX8369_CMD_SETGIP_PARAM_4;
   253		buf[4] = HX8369_CMD_SETGIP_PARAM_5;
   254		buf[5] = HX8369_CMD_SETGIP_PARAM_6;
   255		buf[6] = HX8369_CMD_SETGIP_PARAM_7;
   256		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE, buf,
   257					HX8369_CMD_SETGIP_LEN);
   258		CHECK_RETCODE(err);
   259	
   260		/* Set power: standby, DC etc. */
   261		buf[0] = HX8369_CMD_SETPOWER | (HX8369_CMD_SETPOWER_PARAM_1 << 8);
   262		buf[1] = HX8369_CMD_SETPOWER_PARAM_2;
   263		buf[2] = HX8369_CMD_SETPOWER_PARAM_3;
   264		buf[3] = HX8369_CMD_SETPOWER_PARAM_4;
   265		buf[4] = HX8369_CMD_SETPOWER_PARAM_5;
   266		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE, buf,
   267					HX8369_CMD_SETPOWER_LEN);
   268		CHECK_RETCODE(err);
   269	
   270		/* Set VCOM voltage. */
   271		buf[0] = HX8369_CMD_SETVCOM | (HX8369_CMD_SETVCOM_PARAM_1 << 8);
   272		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE, buf,
   273					HX8369_CMD_SETVCOM_LEN);
   274		CHECK_RETCODE(err);
   275	
   276		/* Set Panel: BGR/RGB or Inversion. */
   277		buf[0] = HX8369_CMD_SETPANEL | (HX8369_CMD_SETPANEL_PARAM_1 << 8);
   278		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi,
   279			MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM, buf, 0);
   280		CHECK_RETCODE(err);
   281	
   282		/* Set gamma curve related setting */
   283		buf[0] = HX8369_CMD_SETGAMMA | (HX8369_CMD_SETGAMMA_PARAM_1 << 8);
   284		buf[1] = HX8369_CMD_SETGAMMA_PARAM_2;
   285		buf[2] = HX8369_CMD_SETGAMMA_PARAM_3;
   286		buf[3] = HX8369_CMD_SETGAMMA_PARAM_4;
   287		buf[4] = HX8369_CMD_SETGAMMA_PARAM_5;
   288		buf[5] = HX8369_CMD_SETGAMMA_PARAM_6;
   289		buf[6] = HX8369_CMD_SETGAMMA_PARAM_7;
   290		buf[7] = HX8369_CMD_SETGAMMA_PARAM_8;
   291		buf[8] = HX8369_CMD_SETGAMMA_PARAM_9;
   292		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE, buf,
   293					HX8369_CMD_SETGAMMA_LEN);
   294		CHECK_RETCODE(err);
   295	
   296		/* Set MIPI: DPHYCMD & DSICMD, data lane number */
   297		buf[0] = HX8369_CMD_SETMIPI | (HX8369_CMD_SETMIPI_PARAM_1 << 8);
   298		buf[1] = HX8369_CMD_SETMIPI_PARAM_2;
   299		buf[2] = HX8369_CMD_SETMIPI_PARAM_3;
   300		if (lcd_config.data_lane_num == HX8369_ONE_DATA_LANE)
   301			buf[2] |= HX8369_CMD_SETMIPI_ONELANE;
   302		else
   303			buf[2] |= HX8369_CMD_SETMIPI_TWOLANE;
   304		buf[3] = HX8369_CMD_SETMIPI_PARAM_4;
   305		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE, buf,
   306					HX8369_CMD_SETMIPI_LEN);
   307		CHECK_RETCODE(err);
   308	
   309		/* Set pixel format:24bpp */
   310		buf[0] = HX8369_CMD_SETPIXEL_FMT;
   311		switch (lcd_config.dpi_fmt) {
   312		case MIPI_RGB565_PACKED:
   313		case MIPI_RGB565_LOOSELY:
   314		case MIPI_RGB565_CONFIG3:
   315			buf[0] |= (HX8369_CMD_SETPIXEL_FMT_16BPP << 8);
   316			break;
   317	
   318		case MIPI_RGB666_LOOSELY:
   319		case MIPI_RGB666_PACKED:
   320			buf[0] |= (HX8369_CMD_SETPIXEL_FMT_18BPP << 8);
   321			break;
   322	
   323		case MIPI_RGB888:
   324			buf[0] |= (HX8369_CMD_SETPIXEL_FMT_24BPP << 8);
   325			break;
   326	
   327		default:
   328			buf[0] |= (HX8369_CMD_SETPIXEL_FMT_24BPP << 8);
   329			break;
   330		}
   331		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM,
   332				buf, 0);
   333		CHECK_RETCODE(err);
   334	
   335		/* Set column address: 0~479 */
   336		buf[0] = HX8369_CMD_SETCLUMN_ADDR |
   337			(HX8369_CMD_SETCLUMN_ADDR_PARAM_1 << 8);
   338		buf[1] = HX8369_CMD_SETCLUMN_ADDR_PARAM_2;
   339		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE,
   340					buf, HX8369_CMD_SETCLUMN_ADDR_LEN);
   341		CHECK_RETCODE(err);
   342	
   343		/* Set page address: 0~799 */
   344		buf[0] = HX8369_CMD_SETPAGE_ADDR |
   345			(HX8369_CMD_SETPAGE_ADDR_PARAM_1 << 8);
   346		buf[1] = HX8369_CMD_SETPAGE_ADDR_PARAM_2;
   347		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_LONG_WRITE,
   348						buf, HX8369_CMD_SETPAGE_ADDR_LEN);
   349		CHECK_RETCODE(err);
   350	
   351		/* Set display brightness related */
   352		buf[0] = HX8369_CMD_WRT_DISP_BRIGHT |
   353				(HX8369_CMD_WRT_DISP_BRIGHT_PARAM_1 << 8);
   354		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM,
   355			buf, 0);
   356		CHECK_RETCODE(err);
   357	
   358		buf[0] = HX8369_CMD_WRT_CABC_CTRL |
   359			(HX8369_CMD_WRT_CABC_CTRL_PARAM_1 << 8);
   360		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM,
   361			buf, 0);
   362		CHECK_RETCODE(err);
   363	
   364		buf[0] = HX8369_CMD_WRT_CTRL_DISP |
   365			(HX8369_CMD_WRT_CTRL_DISP_PARAM_1 << 8);
   366		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM,
   367			buf, 0);
   368		CHECK_RETCODE(err);
   369	
   370		/* exit sleep mode and set display on */
   371		buf[0] = MIPI_DCS_EXIT_SLEEP_MODE;
   372		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM,
   373			buf, 0);
   374		CHECK_RETCODE(err);
   375		/* To allow time for the supply voltages
   376		 * and clock circuits to stabilize.
   377		 */
   378		msleep(5);
   379		buf[0] = MIPI_DCS_SET_DISPLAY_ON;
   380		err = mipi_dsi->mipi_dsi_pkt_write(mipi_dsi, MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM,
   381			buf, 0);
   382		CHECK_RETCODE(err);
   383	
   384		err = mipid_init_backlight(mipi_dsi);
   385		return err;
   386	}
   387	EXPORT_SYMBOL(mipid_hx8369_lcd_setup);
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
