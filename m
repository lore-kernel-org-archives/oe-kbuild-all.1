Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B9E3C2B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685282111; x=1716818111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KrL18DyxqUEg1aGlP+fekqaPPlzmNopm3mazcWJHiMk=;
  b=OcJMGFR03CiGHxqoXVv8yzjNM6v74urPFHzUDWXTft9qfoI3Jma4G8w+
   NuFnEOASt/0FSdON/AAfsBj1BVOWqPcd0+x/AkSwb7JrMtDuHCWaL0z0Q
   X3WE0pgvo33BIT0+HkViajK4e7hCR4+5VAc4YCBCGOUalQVfkP+4LJwsl
   XKKEFUavtrS/RVbckhISnOCBbNYTnHrXnO+Uj7rvLjwRZdH2Bc56GOUuW
   hBZD4Rj0HwptgIKseX6J91WrfCy2RBQkLbYQgiIPS+oVeUIrvl7Kf2NSK
   VMafIej508ggDkKCKN6m/+tROyu7qh8yJl7K/2vjGwALeFEBW9SQ1XPcp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="339108792"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="339108792"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 06:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="850094612"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="850094612"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 May 2023 06:55:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3GrS-000KbW-2P;
	Sun, 28 May 2023 13:55:06 +0000
Date: Sun, 28 May 2023 21:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 1305/9879]
 drivers/video/fbdev/mxc/mxsfb_sii902x.c:331:36: error:
 'FB_EVENT_FB_REGISTERED' undeclared
Message-ID: <202305282142.Yf2PLUks-lkp@intel.com>
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
commit: 9edae90c0b4ef8e0b8f73606736d551a741dc832 [1305/9879] video: fbdev: add sii902x hdmi driver code
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230528/202305282142.Yf2PLUks-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/9edae90c0b4ef8e0b8f73606736d551a741dc832
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 9edae90c0b4ef8e0b8f73606736d551a741dc832
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305282142.Yf2PLUks-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/mxc/mxsfb_sii902x.c: In function 'sii902x_fb_event':
>> drivers/video/fbdev/mxc/mxsfb_sii902x.c:331:36: error: 'FB_EVENT_FB_REGISTERED' undeclared (first use in this function)
     331 |         if (!sii902x.fbi && val == FB_EVENT_FB_REGISTERED &&
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/mxc/mxsfb_sii902x.c:331:36: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/video/fbdev/mxc/mxsfb_sii902x.c:29:
   drivers/video/fbdev/mxc/mxsfb_sii902x.c: At top level:
   include/linux/module.h:130:49: error: redefinition of '__inittest'
     130 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_init'
     267 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/i2c.h:951:9: note: in expansion of macro 'module_driver'
     951 |         module_driver(__i2c_driver, i2c_add_driver, \
         |         ^~~~~~~~~~~~~
   drivers/video/fbdev/mxc/mxsfb_sii902x.c:558:1: note: in expansion of macro 'module_i2c_driver'
     558 | module_i2c_driver(sii902x_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:130:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     130 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/module.h:119:41: note: in expansion of macro 'module_init'
     119 | #define fs_initcall_sync(fn)            module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/video/fbdev/mxc/mxsfb_sii902x.c:533:1: note: in expansion of macro 'fs_initcall_sync'
     533 | fs_initcall_sync(sii902x_init);
         | ^~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: error: redefinition of 'init_module'
     132 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_init'
     267 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/i2c.h:951:9: note: in expansion of macro 'module_driver'
     951 |         module_driver(__i2c_driver, i2c_add_driver, \
         |         ^~~~~~~~~~~~~
   drivers/video/fbdev/mxc/mxsfb_sii902x.c:558:1: note: in expansion of macro 'module_i2c_driver'
     558 | module_i2c_driver(sii902x_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: note: previous definition of 'init_module' with type 'int(void)'
     132 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/module.h:119:41: note: in expansion of macro 'module_init'
     119 | #define fs_initcall_sync(fn)            module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/video/fbdev/mxc/mxsfb_sii902x.c:533:1: note: in expansion of macro 'fs_initcall_sync'
     533 | fs_initcall_sync(sii902x_init);
         | ^~~~~~~~~~~~~~~~


vim +/FB_EVENT_FB_REGISTERED +331 drivers/video/fbdev/mxc/mxsfb_sii902x.c

   324	
   325	static int sii902x_fb_event(struct notifier_block *nb, unsigned long val, void *v)
   326	{
   327		struct fb_event *event = v;
   328		struct fb_info *fbi = event->info;
   329	
   330		/* Check if our FB just registered */
 > 331		if (!sii902x.fbi && val == FB_EVENT_FB_REGISTERED &&
   332				!strncmp(fbi->fix.id, "mxs-lcdif", 9)) {
   333			pr_info("sii902x bound to %s from %s\n",
   334					fbi->fix.id, dev_name(fbi->device));
   335			sii902x.fbi = fbi;
   336		}
   337	
   338		/* Ignore if not our FB */
   339		if (fbi != sii902x.fbi)
   340			return 0;
   341	
   342		/* Ignore if driver did not probe yet */
   343		if (sii902x_in_init_state)
   344			return 0;
   345	
   346		switch (val) {
   347		case FB_EVENT_FB_REGISTERED:
   348			/* check cable status */
   349			handle_cable_status();
   350			fb_show_logo(fbi, 0);
   351	
   352			break;
   353		case FB_EVENT_MODE_CHANGE:
   354			sii902x_setup(fbi);
   355			break;
   356		case FB_EVENT_BLANK:
   357			if (*((int *)event->data) == FB_BLANK_UNBLANK) {
   358				dev_dbg(&sii902x.client->dev, "FB_BLANK_UNBLANK\n");
   359				sii902x_poweron();
   360			} else {
   361				dev_dbg(&sii902x.client->dev, "FB_BLANK_BLANK\n");
   362				sii902x_poweroff();
   363			}
   364			break;
   365		}
   366		return 0;
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
