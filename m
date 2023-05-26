Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A867742EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 11:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685101890; x=1716637890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eUzNsNnKV70DmR+HdFSfAR7+GayBMP9NxBO72J5sQJs=;
  b=APrl5WeQbPJCBVQHZMv9uXqPKTRGGl4B5HpSPDhwAOlKAV1bpqM+SXc6
   9HlcE/XdI4UUrT2A358s9ShbE2nUX3hYF0ZiVK5k1IBi4+Nib+HPdt3Ab
   BLNsIR4p9WEC8Pq50SGWXyA7VsbuECmpiI0T8h76hIRWA0lKA+V3C15AN
   8lyHOPD4EprevW3wV6sjAyZnhHWjy8zBsuAm3cwOGag70If9514UdyEHe
   9Kepjmva0U7qIkwa5Nc7wBTXSirmYtr7IwogbhZ39oCM7hrT9gYZzlJ6g
   PUjQjP3SBrtTCIXhSUS1jfxOk3vw6CaSr+3MoW5KUv8aZdR2NhmzOB1vp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357437510"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="357437510"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 04:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879536394"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="879536394"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 04:51:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2Vyh-000JIk-2f;
	Fri, 26 May 2023 11:51:27 +0000
Date: Fri, 26 May 2023 19:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4771/9879]
 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:65:5: warning: "CONFIG_PM" is not
 defined, evaluates to 0
Message-ID: <202305261903.AhBONAk1-lkp@intel.com>
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
commit: 40a00e52f763d43e15a7fdb328005a297608ba73 [4771/9879] Merge remote-tracking branch 'origin/display/dsim' into display/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230526/202305261903.AhBONAk1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/40a00e52f763d43e15a7fdb328005a297608ba73
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 40a00e52f763d43e15a7fdb328005a297608ba73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/imx/ drivers/input/touchscreen/ drivers/media/platform/chips-media/ drivers/mfd/ drivers/spi/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261903.AhBONAk1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:65:5: warning: "CONFIG_PM" is not defined, evaluates to 0 [-Wundef]
      65 | #if CONFIG_PM
         |     ^~~~~~~~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: In function 'sec_dsim_of_parse_resets':
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:293:18: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     293 |         uint32_t len, rstc_num = 0;
         |                  ^~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: At top level:
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:73:12: warning: 'imx_sec_dsim_runtime_resume' defined but not used [-Wunused-function]
      73 | static int imx_sec_dsim_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:69:12: warning: 'imx_sec_dsim_runtime_suspend' defined but not used [-Wunused-function]
      69 | static int imx_sec_dsim_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_PM +65 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c

e43f910d2d8ae8 Fancy Fang 2018-06-06  64  
1f4adce7a1da6c Fancy Fang 2018-07-02 @65  #if CONFIG_PM
1f4adce7a1da6c Fancy Fang 2018-07-02  66  static int imx_sec_dsim_runtime_suspend(struct device *dev);
1f4adce7a1da6c Fancy Fang 2018-07-02  67  static int imx_sec_dsim_runtime_resume(struct device *dev);
1f4adce7a1da6c Fancy Fang 2018-07-02  68  #else
1f4adce7a1da6c Fancy Fang 2018-07-02  69  static int imx_sec_dsim_runtime_suspend(struct device *dev)
1f4adce7a1da6c Fancy Fang 2018-07-02  70  {
1f4adce7a1da6c Fancy Fang 2018-07-02  71  	return 0;
1f4adce7a1da6c Fancy Fang 2018-07-02  72  }
1f4adce7a1da6c Fancy Fang 2018-07-02  73  static int imx_sec_dsim_runtime_resume(struct device *dev)
1f4adce7a1da6c Fancy Fang 2018-07-02  74  {
1f4adce7a1da6c Fancy Fang 2018-07-02  75  	return 0;
1f4adce7a1da6c Fancy Fang 2018-07-02  76  }
1f4adce7a1da6c Fancy Fang 2018-07-02  77  #endif
1f4adce7a1da6c Fancy Fang 2018-07-02  78  

:::::: The code at line 65 was first introduced by commit
:::::: 1f4adce7a1da6ce7e7a1564ffcb496ea564173ac MLK-19017-6 drm/imx: add system pm support for SEC DSIM

:::::: TO: Fancy Fang <chen.fang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
