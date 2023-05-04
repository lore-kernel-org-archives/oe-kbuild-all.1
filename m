Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C267E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683207823; x=1714743823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fpoWL0/92qDAdRMBmDim9NWmp0C5D4So5ymCwU5ABtQ=;
  b=eDSXCMlmxTHmhyxL3MwPDIerI4VTZyzqVAU22Fb+mTQbySZoRKQogi/r
   ht9VNYnbLqkQf+muG0VB8vbYP/UQRxAIPi7a5xgNxJD518RpvGJ3I714o
   6hqE2ey/5hCvGmwoGqa7QOYJbrv3s9cbDHIAHhx7Lzlw/6IDTYKCdP3cj
   H3sG7qCoLNrNsRTC6y4KJ8U0Zfo6zypLMzuXYaeBrUzR4FfOxN+2n3O4H
   /V22NTrJDiXUMhSQROLcGewImAsoh8Vr7AlShUyQhZupiXv9kqc2psKr1
   AtDUdqBCeaaQraXgQ/zl3wed5kzyIc5/LhLQRNzAsfDVJsqkEqWfQNzOI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="435242157"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="435242157"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 06:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="808727780"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="808727780"
Received: from lkp-server01.sh.intel.com (HELO d0e14d8700eb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 May 2023 06:43:41 -0700
Received: from kbuild by d0e14d8700eb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puZFF-000018-0E;
	Thu, 04 May 2023 13:43:41 +0000
Date: Thu, 4 May 2023 21:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:amlogic/v6.3/upstream/dsi-ccf-vim3l 14/17]
 drivers/clk/meson/g12a.c:3267:60: warning: missing braces around initializer
Message-ID: <202305042114.eJmyu3NN-lkp@intel.com>
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
commit: aa34b57736328bb6bfebad37a00b88ed707b51d6 [14/17] clk: meson: add code to setup VCLK2/DSI clocks
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230504/202305042114.eJmyu3NN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/superna9999/linux/commit/aa34b57736328bb6bfebad37a00b88ed707b51d6
        git remote add superna9999 https://github.com/superna9999/linux
        git fetch --no-tags superna9999 amlogic/v6.3/upstream/dsi-ccf-vim3l
        git checkout aa34b57736328bb6bfebad37a00b88ed707b51d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/meson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305042114.eJmyu3NN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/meson/g12a.c:3267:60: warning: missing braces around initializer [-Wmissing-braces]
    3267 | static struct g12a_vclk_div_notifier g12a_vclk2_div_data = {
         |                                                            ^
   ......
    3272 |         .nb = g12a_vclk_div_notifier_cb,
         |               {
    3273 | };
         | }
   drivers/clk/meson/g12a.c:3331:58: warning: missing braces around initializer [-Wmissing-braces]
    3331 | static struct g12a_vclk_reset_notifier g12a_vclk2_data = {
         |                                                          ^
   ......
    3335 |         .nb = g12a_vclk_notifier_cb,
         |               {
    3336 | };
         | }


vim +3267 drivers/clk/meson/g12a.c

  3266	
> 3267	static struct g12a_vclk_div_notifier g12a_vclk2_div_data = {
  3268		.clk = &g12a_vclk2_div,
  3269		.offset = HHI_VIID_CLK_DIV,
  3270		.en_bit_idx = 16,
  3271		.reset_bit_idx = 17,
  3272		.nb = g12a_vclk_div_notifier_cb,
  3273	};
  3274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
