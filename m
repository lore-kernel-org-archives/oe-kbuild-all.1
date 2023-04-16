Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABDC23C4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681658653; x=1713194653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e7SDnbPqMPxuSSS7IiDrYww/hrFDE577+WSINJLUpFY=;
  b=Q5biV/xidUU150TRmUOqDlC8Zweda14Jher/fEMupPaLfhOkyyYpRyPL
   0qdsyBL4lLHyYZ3UUnmAkfnOUY4bhnvSKuWSEM6zgBe1zyEZ7MTgGCDdU
   8nmBcU6EwEzlisnqKBTVPNUjbZbJPZP+lghE/KpkVF0Bhpvp5yr+441Jq
   RtmeWgomwSTqWFocSmSEPYi5PUGgaHW2zlxsprQWZkSvPFty4h7arSQOu
   /ctKfcs/vl0l79vQH2ItCIEkMKpSR/j1j7WaS0ui7SS8CQcb1NJhqI2D+
   WpTEwkZx81KrULdUTYGnfwAdgLk/LyTawBsIdLCLwIy3Z5VzdVUedB8/L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="407630578"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="407630578"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 08:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="693001526"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="693001526"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Apr 2023 08:24:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po4Ec-000bjT-0U;
	Sun, 16 Apr 2023 15:24:10 +0000
Date: Sun, 16 Apr 2023 23:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 1300/9838]
 drivers/video/fbdev/mxc/mipi_dsi.c:58:11: error: positional initialization
 of field in 'struct' declared with 'designated_init' attribute
Message-ID: <202304162337.3zTMfeih-lkp@intel.com>
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
commit: d368bdd73e55410f089fc065109f13953f409d88 [1300/9838] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304162337.3zTMfeih-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/d368bdd73e55410f089fc065109f13953f409d88
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout d368bdd73e55410f089fc065109f13953f409d88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304162337.3zTMfeih-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/mxc/mipi_dsi.c:58:11: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      58 |          {mipid_hx8369_get_lcd_videomode, mipid_hx8369_lcd_setup}
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/mxc/mipi_dsi.c:58:11: note: (near initialization for 'mipi_dsi_lcd_db[0].lcd_callback')
>> drivers/video/fbdev/mxc/mipi_dsi.c:58:11: error: invalid initializer
   drivers/video/fbdev/mxc/mipi_dsi.c:58:11: note: (near initialization for 'mipi_dsi_lcd_db[0].lcd_callback.<anonymous>')
   drivers/video/fbdev/mxc/mipi_dsi.c:58:43: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      58 |          {mipid_hx8369_get_lcd_videomode, mipid_hx8369_lcd_setup}
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/mxc/mipi_dsi.c:58:43: note: (near initialization for 'mipi_dsi_lcd_db[0].lcd_callback')
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from drivers/video/fbdev/mxc/mipi_dsi.c:13:
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/video/fbdev/mxc/mipi_dsi.c:62:14: note: in expansion of macro 'NULL'
      62 |         "", {NULL, NULL}
         |              ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'mipi_dsi_lcd_db[1].lcd_callback')
       8 | #define NULL ((void *)0)
         |              ^
   drivers/video/fbdev/mxc/mipi_dsi.c:62:14: note: in expansion of macro 'NULL'
      62 |         "", {NULL, NULL}
         |              ^~~~
   include/linux/stddef.h:8:14: error: invalid initializer
       8 | #define NULL ((void *)0)
         |              ^
   drivers/video/fbdev/mxc/mipi_dsi.c:62:14: note: in expansion of macro 'NULL'
      62 |         "", {NULL, NULL}
         |              ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'mipi_dsi_lcd_db[1].lcd_callback.<anonymous>')
       8 | #define NULL ((void *)0)
         |              ^
   drivers/video/fbdev/mxc/mipi_dsi.c:62:14: note: in expansion of macro 'NULL'
      62 |         "", {NULL, NULL}
         |              ^~~~
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/video/fbdev/mxc/mipi_dsi.c:62:20: note: in expansion of macro 'NULL'
      62 |         "", {NULL, NULL}
         |                    ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'mipi_dsi_lcd_db[1].lcd_callback')
       8 | #define NULL ((void *)0)
         |              ^
   drivers/video/fbdev/mxc/mipi_dsi.c:62:20: note: in expansion of macro 'NULL'
      62 |         "", {NULL, NULL}
         |                    ^~~~
   drivers/video/fbdev/mxc/mipi_dsi.c:525:6: warning: no previous prototype for 'mipi_dsi_power_off' [-Wmissing-prototypes]
     525 | void mipi_dsi_power_off(struct mxc_dispdrv_handle *disp)
         |      ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +58 drivers/video/fbdev/mxc/mipi_dsi.c

5670f5b5c73057 Fancy Fang 2019-08-21  53  
5670f5b5c73057 Fancy Fang 2019-08-21  54  static struct mipi_dsi_match_lcd mipi_dsi_lcd_db[] = {
5670f5b5c73057 Fancy Fang 2019-08-21  55  #ifdef CONFIG_FB_MXC_TRULY_WVGA_SYNC_PANEL
5670f5b5c73057 Fancy Fang 2019-08-21  56  	{
5670f5b5c73057 Fancy Fang 2019-08-21  57  	 "TRULY-WVGA",
5670f5b5c73057 Fancy Fang 2019-08-21 @58  	 {mipid_hx8369_get_lcd_videomode, mipid_hx8369_lcd_setup}
5670f5b5c73057 Fancy Fang 2019-08-21  59  	},
5670f5b5c73057 Fancy Fang 2019-08-21  60  #endif
5670f5b5c73057 Fancy Fang 2019-08-21  61  	{
5670f5b5c73057 Fancy Fang 2019-08-21  62  	"", {NULL, NULL}
5670f5b5c73057 Fancy Fang 2019-08-21  63  	}
5670f5b5c73057 Fancy Fang 2019-08-21  64  };
5670f5b5c73057 Fancy Fang 2019-08-21  65  

:::::: The code at line 58 was first introduced by commit
:::::: 5670f5b5c73057aa4cede54a4d8e415e8d302283 video: fbdev: mxc: add NXP MIPI DSI driver support

:::::: TO: Fancy Fang <chen.fang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
