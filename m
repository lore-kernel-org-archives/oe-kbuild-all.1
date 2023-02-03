Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999731C29
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675418239; x=1706954239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yflGmA/j065pPib9vUbkE9SNzy4bFHIPVzytysgVCcQ=;
  b=lf3plza+NNBiErhHsTCstgXVOpn18NN/MR44OcwQ5klverlC/p5SzTSg
   dbuu4Y+YmIJM9AEsGXVUg3gX9wMzD41el4Xfce1y+Y7YgA62m0JpZRiui
   X8DBYPyladDJCZorLU4Qt1PpOBFchGPWJVhsQin6v8Krqz20ZnB/1lZBk
   Zhx6g8fxXXNdtuU1286GYl7BqWz5RJDkc381Cv3tgcbc11ZRkW61oEabw
   7WGhxVPJgm2fy8sbS0EeC8KvOfeTR1I5sHKOHi3ydePy5tcTbQFLavaMx
   XnGVP44KaEdry7PfolAiqUIX84KaSBxSupX9tSr2CeQS1/2quTK1lsW3K
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="328724596"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="328724596"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 01:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="667601783"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="667601783"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Feb 2023 01:56:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNsoN-0000NB-1p;
	Fri, 03 Feb 2023 09:56:51 +0000
Date: Fri, 3 Feb 2023 17:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.2.y 20/62]
 drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for
 'odroid_card_reset'
Message-ID: <202302031748.PSrlSr0v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.2.y
head:   f4d864771f25fc8eaf9aa7e692d8456c1ddbebfd
commit: 41551f3278105277ecac4d550f7a5c6c8cb9c821 [20/62] ODROID-COMMON: power:reset: Add odroid support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302031748.PSrlSr0v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/tobetter/linux/commit/41551f3278105277ecac4d550f7a5c6c8cb9c821
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroid-6.2.y
        git checkout 41551f3278105277ecac4d550f7a5c6c8cb9c821
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/power/reset/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for 'odroid_card_reset' [-Wmissing-prototypes]
      63 | void odroid_card_reset(void)
         |      ^~~~~~~~~~~~~~~~~
   drivers/power/reset/odroid-reboot.c: In function 'odroid_restart_probe':
   drivers/power/reset/odroid-reboot.c:141:17: error: 'arm_pm_restart' undeclared (first use in this function); did you mean 'alarm_restart'?
     141 |                 arm_pm_restart = do_odroid_restart;
         |                 ^~~~~~~~~~~~~~
         |                 alarm_restart
   drivers/power/reset/odroid-reboot.c:141:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/odroid_card_reset +63 drivers/power/reset/odroid-reboot.c

    62	
  > 63	void odroid_card_reset(void)
    64	{
    65		int ret = 0;
    66	
    67		if ((sd_vqsw == 0) && (sd_vmmc == 0))
    68			return;
    69	
    70		if (sd_vqen == 0) {
    71			gpio_free(sd_vqsw);
    72			gpio_free(sd_vmmc);
    73			ret = gpio_request_one(sd_vqsw,
    74					GPIOF_OUT_INIT_LOW, "REBOOT");
    75			CHECK_RET(ret);
    76			mdelay(10);
    77			ret = gpio_direction_output(sd_vqsw, 1);
    78			CHECK_RET(ret);
    79			ret = gpio_request_one(sd_vmmc,
    80					GPIOF_OUT_INIT_LOW, "REBOOT");
    81			CHECK_RET(ret);
    82			mdelay(10);
    83			ret = gpio_direction_output(sd_vqsw, 0);
    84			CHECK_RET(ret);
    85			ret = gpio_direction_output(sd_vmmc, 1);
    86			CHECK_RET(ret);
    87			mdelay(5);
    88			gpio_free(sd_vqsw);
    89			gpio_free(sd_vmmc);
    90		} else {
    91			gpio_free(sd_vqsw);
    92			gpio_free(sd_vqen);
    93			gpio_free(sd_vmmc);
    94	
    95			ret = gpio_request_one(sd_vqsw,
    96					GPIOF_OUT_INIT_LOW, "REBOOT");
    97			CHECK_RET(ret);
    98			ret = gpio_request_one(sd_vqen,
    99					GPIOF_OUT_INIT_LOW, "REBOOT");
   100			CHECK_RET(ret);
   101			ret = gpio_request_one(sd_vmmc,
   102					GPIOF_OUT_INIT_LOW, "REBOOT");
   103			CHECK_RET(ret);
   104			mdelay(100);
   105			ret = gpio_direction_input(sd_vqen);
   106			CHECK_RET(ret);
   107			ret = gpio_direction_input(sd_vmmc);
   108			CHECK_RET(ret);
   109			ret = gpio_direction_input(sd_vqsw);
   110			CHECK_RET(ret);
   111			mdelay(5);
   112			gpio_free(sd_vqen);
   113			gpio_free(sd_vmmc);
   114			gpio_free(sd_vqsw);
   115		}
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
