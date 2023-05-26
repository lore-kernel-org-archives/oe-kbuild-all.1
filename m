Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F166848B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685114610; x=1716650610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4ONd31MFQxXxR+L2Uz7HIwBP6IzuwdQsDpO32h1hRE=;
  b=K/LivZJNBXaCtLlPsist/jKGxW4yajBehmFcUfpAwe790DIh/xCQSqKU
   /0yJZItPHZ4JlEuqo09OcwhSv5OEVmiAFrfI/owZ7NxmcIqvZtEBkZqEN
   +2XomP3fhsL3T1/HyrZdT5He/m1iycUXA7Tjrdpmmmhwns1HTpDD9IobO
   XFntJ81nHIQlTg8HWcse2jm2IDXk4hf9u1V5QDdPbQTPTuRh3Ug2KUPxh
   l/QHKGBacbYV8ocEHgUBFeGStcJL2Bh4W7MFoTma/SRkHiZcp/jDlW5vk
   nyl1q81O77H83HKGgwLCeZkvDCJgN9/nHDtT7gQh0tmqkOI9wX7BQQMEp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382472718"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="382472718"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 08:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="655670352"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="655670352"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 May 2023 08:19:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2ZE6-000JQC-2n;
	Fri, 26 May 2023 15:19:34 +0000
Date: Fri, 26 May 2023 23:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 1295/9879]
 drivers/video/fbdev/mxc/mxcfb_rm68200_wxga.c:121:6: warning: no previous
 prototype for 'mipid_rm68200_get_lcd_videomode'
Message-ID: <202305262359.sjfDLNP9-lkp@intel.com>
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
commit: 132c86cf3a63f96eb71c7c3fa1eaf7d6f365a044 [1295/9879] video: fbdev: mxc: add RM68200 mipi panel driver support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230526/202305262359.sjfDLNP9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/132c86cf3a63f96eb71c7c3fa1eaf7d6f365a044
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 132c86cf3a63f96eb71c7c3fa1eaf7d6f365a044
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305262359.sjfDLNP9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/mxc/mxcfb_rm68200_wxga.c:121:6: warning: no previous prototype for 'mipid_rm68200_get_lcd_videomode' [-Wmissing-prototypes]
     121 | void mipid_rm68200_get_lcd_videomode(struct fb_videomode **mode, int *size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/mxc/mxcfb_rm68200_wxga.c:129:5: warning: no previous prototype for 'mipid_rm68200_lcd_setup' [-Wmissing-prototypes]
     129 | int mipid_rm68200_lcd_setup(struct mipi_dsi_info *mipi_dsi)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/mxc/mxcfb_rm68200_wxga.c:434:35: warning: 'mipid_lcd_bl_ops' defined but not used [-Wunused-const-variable=]
     434 | static const struct backlight_ops mipid_lcd_bl_ops = {
         |                                   ^~~~~~~~~~~~~~~~


vim +/mipid_rm68200_get_lcd_videomode +121 drivers/video/fbdev/mxc/mxcfb_rm68200_wxga.c

   120	
 > 121	void mipid_rm68200_get_lcd_videomode(struct fb_videomode **mode, int *size,
   122					     struct mipi_lcd_config **data)
   123	{
   124		*mode = &rk_lcd_modedb[0];
   125		*size = ARRAY_SIZE(rk_lcd_modedb);
   126		*data = &lcd_config;
   127	}
   128	
 > 129	int mipid_rm68200_lcd_setup(struct mipi_dsi_info *mipi_dsi)
   130	{
   131		u8 buf[DSI_CMD_BUF_MAXSIZE];
   132	
   133		dev_dbg(&mipi_dsi->pdev->dev, "MIPI DSI LCD RM68200 setup.\n");
   134	
   135		/* change to MCS Page 0 */
   136		RM68200_DCS_write_1A_1P(0xFE, 0x01);
   137		RM68200_DCS_write_1A_1P(0x24, 0xc0);	/* External PWR IC Control */
   138		RM68200_DCS_write_1A_1P(0x25, 0x53);
   139		RM68200_DCS_write_1A_1P(0x26, 0x00);
   140		RM68200_DCS_write_1A_1P(0x2B, 0xE5);
   141		RM68200_DCS_write_1A_1P(0x27, 0x0A);
   142		RM68200_DCS_write_1A_1P(0x29, 0x0A);
   143		RM68200_DCS_write_1A_1P(0x16, 0x52);
   144		RM68200_DCS_write_1A_1P(0x2F, 0x53);
   145		RM68200_DCS_write_1A_1P(0x34, 0x5A);
   146		RM68200_DCS_write_1A_1P(0x1B, 0x00);
   147		RM68200_DCS_write_1A_1P(0x12, 0x0A);
   148		RM68200_DCS_write_1A_1P(0x1A, 0x06);
   149		RM68200_DCS_write_1A_1P(0x46, 0x56);
   150		RM68200_DCS_write_1A_1P(0x52, 0xA0);
   151		RM68200_DCS_write_1A_1P(0x53, 0x00);
   152		RM68200_DCS_write_1A_1P(0x54, 0xA0);
   153		RM68200_DCS_write_1A_1P(0x55, 0x00);
   154		RM68200_DCS_write_1A_1P(0x5F, 0x11);	/* 2 data lanes */
   155	
   156		/* change to MCS Page 2 */
   157		RM68200_DCS_write_1A_1P(0xFE, 0x03);
   158		RM68200_DCS_write_1A_1P(0x00, 0x05);
   159		RM68200_DCS_write_1A_1P(0x02, 0x0B);
   160		RM68200_DCS_write_1A_1P(0x03, 0x0F);
   161		RM68200_DCS_write_1A_1P(0x04, 0x7D);
   162		RM68200_DCS_write_1A_1P(0x05, 0x00);
   163		RM68200_DCS_write_1A_1P(0x06, 0x50);
   164		RM68200_DCS_write_1A_1P(0x07, 0x05);
   165		RM68200_DCS_write_1A_1P(0x08, 0x16);
   166		RM68200_DCS_write_1A_1P(0x09, 0x0D);
   167		RM68200_DCS_write_1A_1P(0x0A, 0x11);
   168		RM68200_DCS_write_1A_1P(0x0B, 0x7D);
   169		RM68200_DCS_write_1A_1P(0x0C, 0x00);
   170		RM68200_DCS_write_1A_1P(0x0D, 0x50);
   171		RM68200_DCS_write_1A_1P(0x0E, 0x07);
   172		RM68200_DCS_write_1A_1P(0x0F, 0x08);
   173		RM68200_DCS_write_1A_1P(0x10, 0x01);
   174		RM68200_DCS_write_1A_1P(0x11, 0x02);
   175		RM68200_DCS_write_1A_1P(0x12, 0x00);
   176		RM68200_DCS_write_1A_1P(0x13, 0x7D);
   177		RM68200_DCS_write_1A_1P(0x14, 0x00);
   178		RM68200_DCS_write_1A_1P(0x15, 0x85);
   179		RM68200_DCS_write_1A_1P(0x16, 0x08);
   180		RM68200_DCS_write_1A_1P(0x17, 0x03);
   181		RM68200_DCS_write_1A_1P(0x18, 0x04);
   182		RM68200_DCS_write_1A_1P(0x19, 0x05);
   183		RM68200_DCS_write_1A_1P(0x1A, 0x06);
   184		RM68200_DCS_write_1A_1P(0x1B, 0x00);
   185		RM68200_DCS_write_1A_1P(0x1C, 0x7D);
   186		RM68200_DCS_write_1A_1P(0x1D, 0x00);
   187		RM68200_DCS_write_1A_1P(0x1E, 0x85);
   188		RM68200_DCS_write_1A_1P(0x1F, 0x08);
   189		RM68200_DCS_write_1A_1P(0x20, 0x00);
   190		RM68200_DCS_write_1A_1P(0x21, 0x00);
   191		RM68200_DCS_write_1A_1P(0x22, 0x00);
   192		RM68200_DCS_write_1A_1P(0x23, 0x00);
   193		RM68200_DCS_write_1A_1P(0x24, 0x00);
   194		RM68200_DCS_write_1A_1P(0x25, 0x00);
   195		RM68200_DCS_write_1A_1P(0x26, 0x00);
   196		RM68200_DCS_write_1A_1P(0x27, 0x00);
   197		RM68200_DCS_write_1A_1P(0x28, 0x00);
   198		RM68200_DCS_write_1A_1P(0x29, 0x00);
   199		RM68200_DCS_write_1A_1P(0x2A, 0x07);
   200		RM68200_DCS_write_1A_1P(0x2B, 0x08);
   201		RM68200_DCS_write_1A_1P(0x2D, 0x01);
   202		RM68200_DCS_write_1A_1P(0x2F, 0x02);
   203		RM68200_DCS_write_1A_1P(0x30, 0x00);
   204		RM68200_DCS_write_1A_1P(0x31, 0x40);
   205		RM68200_DCS_write_1A_1P(0x32, 0x05);
   206		RM68200_DCS_write_1A_1P(0x33, 0x08);
   207		RM68200_DCS_write_1A_1P(0x34, 0x54);
   208		RM68200_DCS_write_1A_1P(0x35, 0x7D);
   209		RM68200_DCS_write_1A_1P(0x36, 0x00);
   210		RM68200_DCS_write_1A_1P(0x37, 0x03);
   211		RM68200_DCS_write_1A_1P(0x38, 0x04);
   212		RM68200_DCS_write_1A_1P(0x39, 0x05);
   213		RM68200_DCS_write_1A_1P(0x3A, 0x06);
   214		RM68200_DCS_write_1A_1P(0x3B, 0x00);
   215		RM68200_DCS_write_1A_1P(0x3D, 0x40);
   216		RM68200_DCS_write_1A_1P(0x3F, 0x05);
   217		RM68200_DCS_write_1A_1P(0x40, 0x08);
   218		RM68200_DCS_write_1A_1P(0x41, 0x54);
   219		RM68200_DCS_write_1A_1P(0x42, 0x7D);
   220		RM68200_DCS_write_1A_1P(0x43, 0x00);
   221		RM68200_DCS_write_1A_1P(0x44, 0x00);
   222		RM68200_DCS_write_1A_1P(0x45, 0x00);
   223		RM68200_DCS_write_1A_1P(0x46, 0x00);
   224		RM68200_DCS_write_1A_1P(0x47, 0x00);
   225		RM68200_DCS_write_1A_1P(0x48, 0x00);
   226		RM68200_DCS_write_1A_1P(0x49, 0x00);
   227		RM68200_DCS_write_1A_1P(0x4A, 0x00);
   228		RM68200_DCS_write_1A_1P(0x4B, 0x00);
   229		RM68200_DCS_write_1A_1P(0x4C, 0x00);
   230		RM68200_DCS_write_1A_1P(0x4D, 0x00);
   231		RM68200_DCS_write_1A_1P(0x4E, 0x00);
   232		RM68200_DCS_write_1A_1P(0x4F, 0x00);
   233		RM68200_DCS_write_1A_1P(0x50, 0x00);
   234		RM68200_DCS_write_1A_1P(0x51, 0x00);
   235		RM68200_DCS_write_1A_1P(0x52, 0x00);
   236		RM68200_DCS_write_1A_1P(0x53, 0x00);
   237		RM68200_DCS_write_1A_1P(0x54, 0x00);
   238		RM68200_DCS_write_1A_1P(0x55, 0x00);
   239		RM68200_DCS_write_1A_1P(0x56, 0x00);
   240		RM68200_DCS_write_1A_1P(0x58, 0x00);
   241		RM68200_DCS_write_1A_1P(0x59, 0x00);
   242		RM68200_DCS_write_1A_1P(0x5A, 0x00);
   243		RM68200_DCS_write_1A_1P(0x5B, 0x00);
   244		RM68200_DCS_write_1A_1P(0x5C, 0x00);
   245		RM68200_DCS_write_1A_1P(0x5D, 0x00);
   246		RM68200_DCS_write_1A_1P(0x5E, 0x00);
   247		RM68200_DCS_write_1A_1P(0x5F, 0x00);
   248		RM68200_DCS_write_1A_1P(0x60, 0x00);
   249		RM68200_DCS_write_1A_1P(0x61, 0x00);
   250		RM68200_DCS_write_1A_1P(0x62, 0x00);
   251		RM68200_DCS_write_1A_1P(0x63, 0x00);
   252		RM68200_DCS_write_1A_1P(0x64, 0x00);
   253		RM68200_DCS_write_1A_1P(0x65, 0x00);
   254		RM68200_DCS_write_1A_1P(0x66, 0x00);
   255		RM68200_DCS_write_1A_1P(0x67, 0x00);
   256		RM68200_DCS_write_1A_1P(0x68, 0x00);
   257		RM68200_DCS_write_1A_1P(0x69, 0x00);
   258		RM68200_DCS_write_1A_1P(0x6A, 0x00);
   259		RM68200_DCS_write_1A_1P(0x6B, 0x00);
   260		RM68200_DCS_write_1A_1P(0x6C, 0x00);
   261		RM68200_DCS_write_1A_1P(0x6D, 0x00);
   262		RM68200_DCS_write_1A_1P(0x6E, 0x00);
   263		RM68200_DCS_write_1A_1P(0x6F, 0x00);
   264		RM68200_DCS_write_1A_1P(0x70, 0x00);
   265		RM68200_DCS_write_1A_1P(0x71, 0x00);
   266		RM68200_DCS_write_1A_1P(0x72, 0x20);
   267		RM68200_DCS_write_1A_1P(0x73, 0x00);
   268		RM68200_DCS_write_1A_1P(0x74, 0x08);
   269		RM68200_DCS_write_1A_1P(0x75, 0x08);
   270		RM68200_DCS_write_1A_1P(0x76, 0x08);
   271		RM68200_DCS_write_1A_1P(0x77, 0x08);
   272		RM68200_DCS_write_1A_1P(0x78, 0x08);
   273		RM68200_DCS_write_1A_1P(0x79, 0x08);
   274		RM68200_DCS_write_1A_1P(0x7A, 0x00);
   275		RM68200_DCS_write_1A_1P(0x7B, 0x00);
   276		RM68200_DCS_write_1A_1P(0x7C, 0x00);
   277		RM68200_DCS_write_1A_1P(0x7D, 0x00);
   278		RM68200_DCS_write_1A_1P(0x7E, 0xBF);
   279		RM68200_DCS_write_1A_1P(0x7F, 0x02);
   280		RM68200_DCS_write_1A_1P(0x80, 0x06);
   281		RM68200_DCS_write_1A_1P(0x81, 0x14);
   282		RM68200_DCS_write_1A_1P(0x82, 0x10);
   283		RM68200_DCS_write_1A_1P(0x83, 0x16);
   284		RM68200_DCS_write_1A_1P(0x84, 0x12);
   285		RM68200_DCS_write_1A_1P(0x85, 0x08);
   286		RM68200_DCS_write_1A_1P(0x86, 0x3F);
   287		RM68200_DCS_write_1A_1P(0x87, 0x3F);
   288		RM68200_DCS_write_1A_1P(0x88, 0x3F);
   289		RM68200_DCS_write_1A_1P(0x89, 0x3F);
   290		RM68200_DCS_write_1A_1P(0x8A, 0x3F);
   291		RM68200_DCS_write_1A_1P(0x8B, 0x0C);
   292		RM68200_DCS_write_1A_1P(0x8C, 0x0A);
   293		RM68200_DCS_write_1A_1P(0x8D, 0x0E);
   294		RM68200_DCS_write_1A_1P(0x8E, 0x3F);
   295		RM68200_DCS_write_1A_1P(0x8F, 0x3F);
   296		RM68200_DCS_write_1A_1P(0x90, 0x00);
   297		RM68200_DCS_write_1A_1P(0x91, 0x04);
   298		RM68200_DCS_write_1A_1P(0x92, 0x3F);
   299		RM68200_DCS_write_1A_1P(0x93, 0x3F);
   300		RM68200_DCS_write_1A_1P(0x94, 0x3F);
   301		RM68200_DCS_write_1A_1P(0x95, 0x3F);
   302		RM68200_DCS_write_1A_1P(0x96, 0x05);
   303		RM68200_DCS_write_1A_1P(0x97, 0x01);
   304		RM68200_DCS_write_1A_1P(0x98, 0x3F);
   305		RM68200_DCS_write_1A_1P(0x99, 0x3F);
   306		RM68200_DCS_write_1A_1P(0x9A, 0x0F);
   307		RM68200_DCS_write_1A_1P(0x9B, 0x0B);
   308		RM68200_DCS_write_1A_1P(0x9C, 0x0D);
   309		RM68200_DCS_write_1A_1P(0x9D, 0x3F);
   310		RM68200_DCS_write_1A_1P(0x9E, 0x3F);
   311		RM68200_DCS_write_1A_1P(0x9F, 0x3F);
   312		RM68200_DCS_write_1A_1P(0xA0, 0x3F);
   313		RM68200_DCS_write_1A_1P(0xA2, 0x3F);
   314		RM68200_DCS_write_1A_1P(0xA3, 0x09);
   315		RM68200_DCS_write_1A_1P(0xA4, 0x13);
   316		RM68200_DCS_write_1A_1P(0xA5, 0x17);
   317		RM68200_DCS_write_1A_1P(0xA6, 0x11);
   318		RM68200_DCS_write_1A_1P(0xA7, 0x15);
   319		RM68200_DCS_write_1A_1P(0xA9, 0x07);
   320		RM68200_DCS_write_1A_1P(0xAA, 0x03);
   321		RM68200_DCS_write_1A_1P(0xAB, 0x3F);
   322		RM68200_DCS_write_1A_1P(0xAC, 0x3F);
   323		RM68200_DCS_write_1A_1P(0xAD, 0x05);
   324		RM68200_DCS_write_1A_1P(0xAE, 0x01);
   325		RM68200_DCS_write_1A_1P(0xAF, 0x17);
   326		RM68200_DCS_write_1A_1P(0xB0, 0x13);
   327		RM68200_DCS_write_1A_1P(0xB1, 0x15);
   328		RM68200_DCS_write_1A_1P(0xB2, 0x11);
   329		RM68200_DCS_write_1A_1P(0xB3, 0x0F);
   330		RM68200_DCS_write_1A_1P(0xB4, 0x3F);
   331		RM68200_DCS_write_1A_1P(0xB5, 0x3F);
   332		RM68200_DCS_write_1A_1P(0xB6, 0x3F);
   333		RM68200_DCS_write_1A_1P(0xB7, 0x3F);
   334		RM68200_DCS_write_1A_1P(0xB8, 0x3F);
   335		RM68200_DCS_write_1A_1P(0xB9, 0x0B);
   336		RM68200_DCS_write_1A_1P(0xBA, 0x0D);
   337		RM68200_DCS_write_1A_1P(0xBB, 0x09);
   338		RM68200_DCS_write_1A_1P(0xBC, 0x3F);
   339		RM68200_DCS_write_1A_1P(0xBD, 0x3F);
   340		RM68200_DCS_write_1A_1P(0xBE, 0x07);
   341		RM68200_DCS_write_1A_1P(0xBF, 0x03);
   342		RM68200_DCS_write_1A_1P(0xC0, 0x3F);
   343		RM68200_DCS_write_1A_1P(0xC1, 0x3F);
   344		RM68200_DCS_write_1A_1P(0xC2, 0x3F);
   345		RM68200_DCS_write_1A_1P(0xC3, 0x3F);
   346		RM68200_DCS_write_1A_1P(0xC4, 0x02);
   347		RM68200_DCS_write_1A_1P(0xC5, 0x06);
   348		RM68200_DCS_write_1A_1P(0xC6, 0x3F);
   349		RM68200_DCS_write_1A_1P(0xC7, 0x3F);
   350		RM68200_DCS_write_1A_1P(0xC8, 0x08);
   351		RM68200_DCS_write_1A_1P(0xC9, 0x0C);
   352		RM68200_DCS_write_1A_1P(0xCA, 0x0A);
   353		RM68200_DCS_write_1A_1P(0xCB, 0x3F);
   354		RM68200_DCS_write_1A_1P(0xCC, 0x3F);
   355		RM68200_DCS_write_1A_1P(0xCD, 0x3F);
   356		RM68200_DCS_write_1A_1P(0xCE, 0x3F);
   357		RM68200_DCS_write_1A_1P(0xCF, 0x3F);
   358		RM68200_DCS_write_1A_1P(0xD0, 0x0E);
   359		RM68200_DCS_write_1A_1P(0xD1, 0x10);
   360		RM68200_DCS_write_1A_1P(0xD2, 0x14);
   361		RM68200_DCS_write_1A_1P(0xD3, 0x12);
   362		RM68200_DCS_write_1A_1P(0xD4, 0x16);
   363		RM68200_DCS_write_1A_1P(0xD5, 0x00);
   364		RM68200_DCS_write_1A_1P(0xD6, 0x04);
   365		RM68200_DCS_write_1A_1P(0xD7, 0x3F);
   366		RM68200_DCS_write_1A_1P(0xDC, 0x02);
   367		RM68200_DCS_write_1A_1P(0xDE, 0x12);
   368		RM68200_DCS_write_1A_1P(0xFE, 0x0E);
   369		RM68200_DCS_write_1A_1P(0x01, 0x75);
   370	
   371		/* change to MCS Page 3: Gamma Settings */
   372		RM68200_DCS_write_1A_1P(0xFE, 0x04);
   373		RM68200_DCS_write_1A_1P(0x60, 0x00);
   374		RM68200_DCS_write_1A_1P(0x61, 0x0C);
   375		RM68200_DCS_write_1A_1P(0x62, 0x12);
   376		RM68200_DCS_write_1A_1P(0x63, 0x0E);
   377		RM68200_DCS_write_1A_1P(0x64, 0x06);
   378		RM68200_DCS_write_1A_1P(0x65, 0x12);
   379		RM68200_DCS_write_1A_1P(0x66, 0x0E);
   380		RM68200_DCS_write_1A_1P(0x67, 0x0B);
   381		RM68200_DCS_write_1A_1P(0x68, 0x15);
   382		RM68200_DCS_write_1A_1P(0x69, 0x0B);
   383		RM68200_DCS_write_1A_1P(0x6A, 0x10);
   384		RM68200_DCS_write_1A_1P(0x6B, 0x07);
   385		RM68200_DCS_write_1A_1P(0x6C, 0x0F);
   386		RM68200_DCS_write_1A_1P(0x6D, 0x12);
   387		RM68200_DCS_write_1A_1P(0x6E, 0x0C);
   388		RM68200_DCS_write_1A_1P(0x6F, 0x00);
   389		RM68200_DCS_write_1A_1P(0x70, 0x00);
   390		RM68200_DCS_write_1A_1P(0x71, 0x0C);
   391		RM68200_DCS_write_1A_1P(0x72, 0x12);
   392		RM68200_DCS_write_1A_1P(0x73, 0x0E);
   393		RM68200_DCS_write_1A_1P(0x74, 0x06);
   394		RM68200_DCS_write_1A_1P(0x75, 0x12);
   395		RM68200_DCS_write_1A_1P(0x76, 0x0E);
   396		RM68200_DCS_write_1A_1P(0x77, 0x0B);
   397		RM68200_DCS_write_1A_1P(0x78, 0x15);
   398		RM68200_DCS_write_1A_1P(0x79, 0x0B);
   399		RM68200_DCS_write_1A_1P(0x7A, 0x10);
   400		RM68200_DCS_write_1A_1P(0x7B, 0x07);
   401		RM68200_DCS_write_1A_1P(0x7C, 0x0F);
   402		RM68200_DCS_write_1A_1P(0x7D, 0x12);
   403		RM68200_DCS_write_1A_1P(0x7E, 0x0C);
   404		RM68200_DCS_write_1A_1P(0x7F, 0x00);
   405	
   406		/* change to MCS Page 0 */
   407		RM68200_DCS_write_1A_1P(0xFE, 0x00);
   408		RM68200_DCS_write_1A_1P(0x11, 0x00);
   409		mdelay(200);
   410		RM68200_DCS_write_1A_1P(0x29, 0x00);
   411		mdelay(100);
   412		RM68200_DCS_write_1A_0P(0x2C);
   413		RM68200_DCS_write_1A_1P(0x35, 0x00);
   414		mdelay(200);
   415	
   416		return 0;
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
