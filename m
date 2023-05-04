Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E6FED4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683197948; x=1714733948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8wfP2Bs9YesKHdPHzOk9X/nwOMYeqTtEr0IOm+75fjo=;
  b=nVx5Q3T9VYlbabJam2DowzZyfnGBRFW4FV2sljCGd+akNLAO8GxVZ1cJ
   y4rmSNa6nPsPzPIMsevCfP2mI773q32WPvCL356HcTUzlHOufc2rXiNkq
   puoKyIhfEP1Zj2vjOF4l417YiB/57er7Kv+cbnR5bH4eSDAC1NxO3213N
   ukCK9acp69Moa91bNRgFb4DRBE4Dx/FZ0N+G2fldB2Y885BjEIEbQmHQ8
   8W5lQbg1T0cerchpIVxNERcMloN3EfnXqDG1nCAk5b+GSSMHWe/9YFNQP
   YM6ifnuyJi1HiyXlD8gAsNWIwiz+mDQI6Cft35WXBtvkcLmWIKqrMxLMX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333279375"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="333279375"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 03:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674503075"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="674503075"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 May 2023 03:58:22 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puWfG-0002rZ-0O;
	Thu, 04 May 2023 10:58:22 +0000
Date: Thu, 4 May 2023 18:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.3.y 7/34]
 drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for
 'odroid_card_reset'
Message-ID: <202305041806.qvj5f8cq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.3.y
head:   6fdc1217984da926f8896235d0c4e8944bf0e5e0
commit: ad699747102febd37b84fac38a3d5f9378d91df7 [7/34] ODROID-COMMON: power:reset: Add odroid support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230504/202305041806.qvj5f8cq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/tobetter/linux/commit/ad699747102febd37b84fac38a3d5f9378d91df7
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroid-6.3.y
        git checkout ad699747102febd37b84fac38a3d5f9378d91df7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/power/reset/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041806.qvj5f8cq-lkp@intel.com/

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
