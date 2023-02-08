Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D370D7F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 02:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675824712; x=1707360712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJKgo9jddAFdwW2IbuDIHkPRorIUa+zN8aD1siPQ5Ww=;
  b=caHDBGV2UblIbbY2wjusE6J2ZHl4bRi3V/ONqdl/q9SxMqBSEPM3Q8US
   9HtYc3a8k7FKFITIaZ7qAZM+/fkvRrfW4JtvwHoHCGkjLcgU9QQ3jFoIe
   oxy5TCQYL/9hIM7AQlB3IqjN84BMyvKF0Fr70Dq2CFy9fwiEZxgv8CiDs
   YUFxUYqrkyj7L0t1rJLmZVqT8AEc//R5HKNkrX6y0Ndkf7k3I+G43YRth
   CT+MOJN4Eo9x7eVxlmCf7rg0xhy65O9r3uKiRUUDbKvz3+7k1TvO/TV1t
   SKmN24xc6nfHwqQ/Jp7XUJ+5L4irx5hTZLmOrLscCPxSF0Lg1pNZkL/rJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="330984857"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="330984857"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 18:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="669024995"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="669024995"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Feb 2023 18:51:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPaYj-00046i-2O;
	Wed, 08 Feb 2023 02:51:45 +0000
Date: Wed, 8 Feb 2023 10:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 14787/20209]
 drivers/soc/imx/rpmsg_life_cycle.c:126:13: error: 'pm_suspend_target_state'
 undeclared
Message-ID: <202302081021.WsASAdOc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jacky,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 264ab88f12e93e8f2755792771f22da44c9ead9e [14787/20209] LF-6644: soc: imx: Only do lifecycle notify when enter mem mode
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230208/202302081021.WsASAdOc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/264ab88f12e93e8f2755792771f22da44c9ead9e
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 264ab88f12e93e8f2755792771f22da44c9ead9e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/soc/imx/rpmsg_life_cycle.c: In function 'rpmsg_lifecycle_pm_notify':
>> drivers/soc/imx/rpmsg_life_cycle.c:126:13: error: 'pm_suspend_target_state' undeclared (first use in this function)
     126 |         if (pm_suspend_target_state != PM_SUSPEND_MEM)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/rpmsg_life_cycle.c:126:13: note: each undeclared identifier is reported only once for each function it appears in


vim +/pm_suspend_target_state +126 drivers/soc/imx/rpmsg_life_cycle.c

   119	
   120	static int __maybe_unused rpmsg_lifecycle_pm_notify(bool enter)
   121	{
   122		struct pm_rpmsg_data msg;
   123		int ret;
   124	
   125		/* Only need to do lifecycle notify when APD enter mem(HW PD) mode */
 > 126		if (pm_suspend_target_state != PM_SUSPEND_MEM)
   127			return 0;
   128	
   129		msg.data = enter ? PM_RPMSG_SUSPEND : PM_RPMSG_ACTIVE;
   130		msg.header.cate = IMX_RMPSG_LIFECYCLE;
   131		msg.header.major = IMX_RMPSG_MAJOR;
   132		msg.header.minor = IMX_RMPSG_MINOR;
   133		msg.header.type = PM_RPMSG_TYPE;
   134		msg.header.cmd = PM_RPMSG_MODE;
   135	
   136		reinit_completion(&cmd_complete);
   137	
   138		ret = rpmsg_send(life_cycle_rpdev->ept, &msg, sizeof(struct pm_rpmsg_data));
   139		if (ret) {
   140			dev_err(&life_cycle_rpdev->dev, "rpmsg send failed:%d\n", ret);
   141			return ret;
   142		}
   143	
   144		ret = wait_for_completion_timeout(&cmd_complete,
   145						msecs_to_jiffies(RPMSG_TIMEOUT));
   146		if (!ret) {
   147			dev_err(&life_cycle_rpdev->dev, "rpmsg_send timeout!\n");
   148			return -ETIMEDOUT;
   149		}
   150	
   151		return 0;
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
