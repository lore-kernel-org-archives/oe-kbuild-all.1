Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B204D224DD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 18:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/RPnNO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697307726; x=1728843726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=em/MClDnXtC/kb7FZAw5asP1ksTMe2RNvKKQ3qc8BGg=;
  b=H/RPnNO91eo9A1ooCwcmE2dwXM1F3c+hOEh3J7Jz8q3oJYflu1vCUlb3
   0IzJ/IbW6HmX3GV2+xruvf/ys6dKzjYnuHPDPVDDPvN490zQyEV4yXA9T
   YJ/XXWLEoeNjkpDrV2MwEXyfiLUJC0S4maH0Lb48sAbwuNK8VF4+U8NhQ
   lQmfzpPD7MGc1fUQpt7oj6ogsVssZsb5tmskGXx2rnCLmpxDGkP9WVXMT
   kAqjwNpMhTtfVhkg+JIzCTXOZ4lkxqmQObGlWsUZvGjbdknP1tGnGGoRn
   4Lunzb54ceINJm4Ywe9dtAHbNcQ72lzzGStBC3mJFK+Big7nwhaGR/+bR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449532499"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="449532499"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 11:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755089631"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="755089631"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Oct 2023 11:22:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrjH0-0006UZ-12;
	Sat, 14 Oct 2023 18:22:02 +0000
Date: Sun, 15 Oct 2023 02:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 1035/15768]
 drivers/gpu/drm/bridge/it6161.c:747:22: warning: variable 'ddc_master' set
 but not used
Message-ID: <202310150216.ts61jzns-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandor,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 6aa529254650a4e8745cff6e0358ed83c3d2a703 [1035/15768] LF-4164-3: drm: bridge: add IT6161 MIPI to HDMI converter support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150216.ts61jzns-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150216.ts61jzns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150216.ts61jzns-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
