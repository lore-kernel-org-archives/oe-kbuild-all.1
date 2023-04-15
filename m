Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D687A10FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 09:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681552413; x=1713088413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s7mxZ18IpClE4EyiF3Ii1z+ZnX2pIyhNvgxvgsQh9Ww=;
  b=RunCMzNCDg2MyvAmqDn4tB3Xz9nfzgxxgB3GUS6cVrZO55vz3n6jN01N
   fJRzBbZDGgnF0kvBGB85PaOKxe8snq4IXsuN35EBO7aAxeBLSczGyiniL
   qokDka+e2Qspt7TxgXw/mismuIZKGTzgyOTRkhcYu+v0LhQwXJL7Jci6N
   ngnK9kWi/MpACS47aw7TM1vZpPiWq/p5RXP26RcvjhK7oYhbSnFyeu/85
   q8DTiOslOeznSm/Gq6G3zm1/Y8kUdYjsD/pQ49S2CS2TjLNGq1HXPYUcY
   UVNFjd3+R50M8E1Lpb9oYE3VjjFoGHqTpuInkZvWo68jQofhx65v7kxF8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="409843703"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="409843703"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 02:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779521641"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="779521641"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Apr 2023 02:53:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pncb0-000aoh-1U;
	Sat, 15 Apr 2023 09:53:26 +0000
Date: Sat, 15 Apr 2023 17:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 1035/9838]
 drivers/gpu/drm/bridge/it6161.c:747:22: warning: variable 'ddc_master' set
 but not used
Message-ID: <202304151731.FRd0zLl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 6aa529254650a4e8745cff6e0358ed83c3d2a703 [1035/9838] LF-4164-3: drm: bridge: add IT6161 MIPI to HDMI converter support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304151731.FRd0zLl5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/6aa529254650a4e8745cff6e0358ed83c3d2a703
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 6aa529254650a4e8745cff6e0358ed83c3d2a703
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/mailbox/ drivers/media/platform/ drivers/net/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/fbdev/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151731.FRd0zLl5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/it6161.c: In function 'it6161_hdmi_tx_abort_ddc':
>> drivers/gpu/drm/bridge/it6161.c:747:22: warning: variable 'ddc_master' set but not used [-Wunused-but-set-variable]
     747 |         u8 sw_reset, ddc_master, retry = 2;
         |                      ^~~~~~~~~~
   drivers/gpu/drm/bridge/it6161.c: In function 'setHDMITX_NLPCMAudio':
>> drivers/gpu/drm/bridge/it6161.c:1591:25: warning: variable 'AudioFormat' set but not used [-Wunused-but-set-variable]
    1591 |         u8 AudioEnable, AudioFormat;
         |                         ^~~~~~~~~~~
   drivers/gpu/drm/bridge/it6161.c: In function 'it6161_i2c_probe':
   drivers/gpu/drm/bridge/it6161.c:2335:31: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
    2335 |         it6161->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
         |                               devm_regulator_get_optional
   drivers/gpu/drm/bridge/it6161.c:2335:70: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
    2335 |         it6161->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
         |                                                                      ^~~~~~~~~~~~~
   drivers/gpu/drm/bridge/it6161.c:2335:70: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/bridge/it6161.c:2339:17: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Werror=implicit-function-declaration]
    2339 |                 gpiod_set_value_cansleep(it6161->enable_gpio, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ddc_master +747 drivers/gpu/drm/bridge/it6161.c

   742	
   743	/* force abort DDC and reset DDC bus */
   744	static void it6161_hdmi_tx_abort_ddc(struct it6161 *it6161)
   745	{
   746		struct device *dev = &it6161->i2c_hdmi_tx->dev;
 > 747		u8 sw_reset, ddc_master, retry = 2;
   748		u8 uc, timeout, i;
   749	
   750		DRM_DEV_DEBUG_DRIVER(dev, "ddc abort\n");
   751		/* save the sw reset, ddc master and cp desire setting */
   752		sw_reset = it6161_hdmi_tx_read(it6161, REG_TX_SW_RST);
   753		ddc_master = it6161_hdmi_tx_read(it6161, REG_TX_DDC_MASTER_CTRL);
   754	
   755		it6161_hdmi_tx_write(it6161, REG_TX_SW_RST, sw_reset | B_TX_HDCP_RST_HDMITX);
   756		it6161_hdmi_tx_write(it6161, REG_TX_DDC_MASTER_CTRL, B_TX_MASTERDDC | B_TX_MASTERHOST);
   757	
   758		/* do abort DDC */
   759		for (i = 0; i < retry; i++) {
   760			it6161_hdmi_tx_write(it6161, REG_TX_DDC_CMD, CMD_DDC_ABORT);
   761			it6161_hdmi_tx_write(it6161, REG_TX_DDC_CMD, CMD_GEN_SCLCLK);
   762	
   763			for (timeout = 0; timeout < 200; timeout++) {
   764				uc = it6161_hdmi_tx_read(it6161, REG_TX_DDC_STATUS);
   765				if (uc & B_TX_DDC_DONE)
   766					break;
   767	
   768				if (uc & (B_TX_DDC_NOACK | B_TX_DDC_WAITBUS | B_TX_DDC_ARBILOSE)) {
   769					DRM_DEV_ERROR(dev, "it6161_hdmi_tx_abort_ddc Fail by reg16=%02X\n", (int)uc);
   770					break;
   771				}
   772				/* delay 1 ms to stable */
   773				msleep(1);
   774			}
   775		}
   776	}
   777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
