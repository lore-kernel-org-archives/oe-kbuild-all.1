Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7DF33D9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681576134; x=1713112134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=scTgoJ7KEs+b7/ItHY/OMxb1mTqUsxn6F/znmtd01z8=;
  b=bUQ+mWO4qflvgONDB3jLd1KQUurRnVJbP7yeHlHA+Cc/FPNRfclXEoxP
   yfHraiiVz2DDqNdz00AnJjkO8YzL28WABikUasE8RyuL43g93wQy042l6
   yuPU0qmXe7RQJ8rLOzrnz9pzxnb6n9oznOmSM+N6S+OQaUs2wxmOBojL1
   suJrk7/dJrBXmuDObn7gGTibIX/nEqb58spl/H03/ZroxWqgEclDsmuUM
   kTTOXJmCHesRBteAh/usuCS3dQofKhknhhBbJ0nEOePPdIjCnSEZY4Pqm
   iqW1Jz6Lt2Ud84z3xVsvSQ3eR54cCzmkN5Ve9CYy6oiy9Pn7/OwpxYL+R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="344656242"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="344656242"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 09:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="936370021"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="936370021"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Apr 2023 09:28:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnilb-000bCv-2L;
	Sat, 15 Apr 2023 16:28:47 +0000
Date: Sun, 16 Apr 2023 00:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 565/9838]
 drivers/clk/imx/clk-imx-acm-utils.c:66: warning: expecting prototype for
 fsl_dev_detach_pm_domains(). Prototype was for
 clk_imx_acm_detach_pm_domains() instead
Message-ID: <202304160021.BAPO7DU2-lkp@intel.com>
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
commit: d2e08b5fe8be9a8418c988cb44f30a3db0202d81 [565/9838] MLK-23618-12: clk: imx: acm: add acm utils function
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304160021.BAPO7DU2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/d2e08b5fe8be9a8418c988cb44f30a3db0202d81
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout d2e08b5fe8be9a8418c988cb44f30a3db0202d81
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160021.BAPO7DU2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-imx-acm-utils.c:13: warning: Function parameter or member 'dev' not described in 'clk_imx_acm_attach_pm_domains'
   drivers/clk/imx/clk-imx-acm-utils.c:13: warning: Function parameter or member 'dev_pm' not described in 'clk_imx_acm_attach_pm_domains'
   drivers/clk/imx/clk-imx-acm-utils.c:66: warning: Function parameter or member 'dev' not described in 'clk_imx_acm_detach_pm_domains'
   drivers/clk/imx/clk-imx-acm-utils.c:66: warning: Function parameter or member 'dev_pm' not described in 'clk_imx_acm_detach_pm_domains'
>> drivers/clk/imx/clk-imx-acm-utils.c:66: warning: expecting prototype for fsl_dev_detach_pm_domains(). Prototype was for clk_imx_acm_detach_pm_domains() instead


vim +66 drivers/clk/imx/clk-imx-acm-utils.c

    60	
    61	/**
    62	 * fsl_dev_detach_pm_domains
    63	 */
    64	int clk_imx_acm_detach_pm_domains(struct device *dev,
    65					  struct clk_imx_acm_pm_domains *dev_pm)
  > 66	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
