Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507C1628
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 01:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678323971; x=1709859971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZ3YZXUd4Z+uO5terOkRbVLFmL+CFG30KGhb4waRFP4=;
  b=TODQdRu/UrhuHEPkYuTz+eXZaSg23DkiqCijStwGbSnt6VLP9h/2ppp5
   WGsOmdHfqoAOgmNiXp+I2v3s5SVbFoW+D9JgeXnQKjmPKhL8FyU7QGcLm
   G3nImR1ThDyUEecb2gmGXULWRc3Wd0qLKTFRYcxcHTQlPY8nOTVGdMy/L
   UwTYrXQYtwrbpYLG+KYD4wn2hyq6+Y4Z+OEHKBX92G0F0eAPTZY3JwwmV
   mUN5A/UhOt5XSUCGtVhuL0vVWlXLm2ypjmkgAPx0CEN1Lt1h5AqUJP/gN
   MktKUfbOvBH+ajVVxn/Ew3YIupgji5SYEM99LgTvlfMhaAn4pN1FNSMx7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="336337773"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="336337773"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 17:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741343827"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="741343827"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 17:06:05 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa4jM-0002XB-1m;
	Thu, 09 Mar 2023 01:06:04 +0000
Date: Thu, 9 Mar 2023 09:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 384/590]
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c:172:42: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202303090935.ChbhTV22-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Abel,

First bad commit (maybe != root cause):

tree:   https://github.com/krzk/linux wip/sm8450-hdmi-audio-on-qcomlt
head:   df22339e983065105fd5f7e2c02bf96adc9f88ed
commit: defa91be85256bdf900fa2eb9709f74744a8fddf [384/590] Merge branch 'topic/sm8550/upstream/usb' into tracking-qcomlt-sm8550-drivers
config: arc-randconfig-r043-20230308 (https://download.01.org/0day-ci/archive/20230309/202303090935.ChbhTV22-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/defa91be85256bdf900fa2eb9709f74744a8fddf
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout defa91be85256bdf900fa2eb9709f74744a8fddf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090935.ChbhTV22-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-snps-eusb2.c: In function 'qcom_eusb2_default_parameters':
>> drivers/phy/qualcomm/phy-qcom-snps-eusb2.c:172:42: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     172 |                                          FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
         |                                          ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +172 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

e237c155707730 Abel Vesa 2022-10-25  166  
e237c155707730 Abel Vesa 2022-10-25  167  static void qcom_eusb2_default_parameters(struct qcom_snps_eusb2_hsphy *phy)
e237c155707730 Abel Vesa 2022-10-25  168  {
e237c155707730 Abel Vesa 2022-10-25  169  	/* default parameters: tx pre-emphasis */
e237c155707730 Abel Vesa 2022-10-25  170  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
e237c155707730 Abel Vesa 2022-10-25  171  					 PHY_CFG_TX_PREEMP_TUNE_MASK,
e237c155707730 Abel Vesa 2022-10-25 @172  					 FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
e237c155707730 Abel Vesa 2022-10-25  173  
e237c155707730 Abel Vesa 2022-10-25  174  	/* tx rise/fall time */
e237c155707730 Abel Vesa 2022-10-25  175  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
e237c155707730 Abel Vesa 2022-10-25  176  					 PHY_CFG_TX_RISE_TUNE_MASK,
e237c155707730 Abel Vesa 2022-10-25  177  					 FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
e237c155707730 Abel Vesa 2022-10-25  178  
e237c155707730 Abel Vesa 2022-10-25  179  	/* source impedance adjustment */
e237c155707730 Abel Vesa 2022-10-25  180  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
e237c155707730 Abel Vesa 2022-10-25  181  					 PHY_CFG_TX_RES_TUNE_MASK,
e237c155707730 Abel Vesa 2022-10-25  182  					 FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
e237c155707730 Abel Vesa 2022-10-25  183  
e237c155707730 Abel Vesa 2022-10-25  184  	/* dc voltage level adjustement */
e237c155707730 Abel Vesa 2022-10-25  185  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
e237c155707730 Abel Vesa 2022-10-25  186  					 PHY_CFG_TX_HS_VREF_TUNE_MASK,
e237c155707730 Abel Vesa 2022-10-25  187  					 FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
e237c155707730 Abel Vesa 2022-10-25  188  
e237c155707730 Abel Vesa 2022-10-25  189  	/* transmitter HS crossover adjustement */
e237c155707730 Abel Vesa 2022-10-25  190  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
e237c155707730 Abel Vesa 2022-10-25  191  					 PHY_CFG_TX_HS_XV_TUNE_MASK,
e237c155707730 Abel Vesa 2022-10-25  192  					 FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
e237c155707730 Abel Vesa 2022-10-25  193  }
e237c155707730 Abel Vesa 2022-10-25  194  

:::::: The code at line 172 was first introduced by commit
:::::: e237c15570773096c4d5e4a98b3390fc0f1e8d6b phy: qcom: Add QCOM SNPS eUSB2 driver

:::::: TO: Abel Vesa <abel.vesa@linaro.org>
:::::: CC: Abel Vesa <abel.vesa@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
