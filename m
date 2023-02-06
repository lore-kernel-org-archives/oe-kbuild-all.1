Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA8053BB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 19:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675710433; x=1707246433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wZYEt0JY28YTmV0fh+u3PO/Q0m/X4Vv8H70ZRHaKQFM=;
  b=WUUxXeGxHx79sSqEjmMf7k+QJJ1t+eFDo6F27GekGWDPGagxVvoFkPw5
   M/C9Yz/+r+SW4cTXqPtvzoITFW0JqVxwt9vx7ff+TPQaI6noQn9mzlQlP
   bs8hC8xWoeu/U3zbFG+zlL4Mo0rLekQVpnBYtXT68iVrGBm/kBWfaN6j/
   xH9ABStC1T/0o33ZwrxSP7N06Al3yFfUxia8o54vIrTd5W2jU+OiMhj7q
   p5iGtB98dOwq05uVd0kTjbCJ8nUkG0vOh5HvzvmR29LI5j0tTccT7pzYC
   /g/hUP2mewf5qROSwE8pbjeGqGnLo2feFcSNTB4MM/2H+hDFsRrUermL/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="326975470"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="326975470"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 11:07:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="666578961"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="666578961"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Feb 2023 11:07:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP6pa-0002js-0m;
	Mon, 06 Feb 2023 19:07:10 +0000
Date: Tue, 7 Feb 2023 03:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6186/20208]
 arch/arm/mach-imx/pm-rpmsg.c:139:6: warning: no previous prototype for
 'pm_shutdown_notify_m4'
Message-ID: <202302070226.rq6CowAP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: df2cf48a1a65a19f1cc6031103da7395847c995f [6186/20208] Merge branch 'rpmsg/next' into next
config: arm-randconfig-r046-20230205 (https://download.01.org/0day-ci/archive/20230207/202302070226.rq6CowAP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/df2cf48a1a65a19f1cc6031103da7395847c995f
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout df2cf48a1a65a19f1cc6031103da7395847c995f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/pm-rpmsg.c:139:6: warning: no previous prototype for 'pm_shutdown_notify_m4' [-Wmissing-prototypes]
     139 | void pm_shutdown_notify_m4(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/pm-rpmsg.c:154:6: warning: no previous prototype for 'pm_reboot_notify_m4' [-Wmissing-prototypes]
     154 | void pm_reboot_notify_m4(void)
         |      ^~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/pm-rpmsg.c:169:7: warning: no previous prototype for 'pm_heartbeat_off_notify_m4' [-Wmissing-prototypes]
     169 | void  pm_heartbeat_off_notify_m4(bool enter)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/pm-rpmsg.c:28:
   arch/arm/mach-imx/common.h:164:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     164 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~


vim +/pm_shutdown_notify_m4 +139 arch/arm/mach-imx/pm-rpmsg.c

c74687cb9b9757 Robin Gong  2019-08-07  138  
c74687cb9b9757 Robin Gong  2019-08-07 @139  void pm_shutdown_notify_m4(void)
c74687cb9b9757 Robin Gong  2019-08-07  140  {
c74687cb9b9757 Robin Gong  2019-08-07  141  	struct pm_rpmsg_data msg;
c74687cb9b9757 Robin Gong  2019-08-07  142  
c74687cb9b9757 Robin Gong  2019-08-07  143  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
c74687cb9b9757 Robin Gong  2019-08-07  144  	msg.header.major = IMX_RMPSG_MAJOR;
c74687cb9b9757 Robin Gong  2019-08-07  145  	msg.header.minor = IMX_RMPSG_MINOR;
c74687cb9b9757 Robin Gong  2019-08-07  146  	msg.header.type = PM_RPMSG_TYPE;
c74687cb9b9757 Robin Gong  2019-08-07  147  	msg.header.cmd = PM_RPMSG_MODE;
c74687cb9b9757 Robin Gong  2019-08-07  148  	msg.data = PM_RPMSG_SHUTDOWN;
c74687cb9b9757 Robin Gong  2019-08-07  149  	/* No ACK from M4 */
c74687cb9b9757 Robin Gong  2019-08-07  150  	pm_send_message(&msg, &pm_rpmsg, false);
4f463da3122e0b Anson Huang 2019-08-07  151  	imx7ulp_poweroff();
c74687cb9b9757 Robin Gong  2019-08-07  152  }
c74687cb9b9757 Robin Gong  2019-08-07  153  
c74687cb9b9757 Robin Gong  2019-08-07 @154  void pm_reboot_notify_m4(void)
c74687cb9b9757 Robin Gong  2019-08-07  155  {
c74687cb9b9757 Robin Gong  2019-08-07  156  	struct pm_rpmsg_data msg;
c74687cb9b9757 Robin Gong  2019-08-07  157  
c74687cb9b9757 Robin Gong  2019-08-07  158  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
c74687cb9b9757 Robin Gong  2019-08-07  159  	msg.header.major = IMX_RMPSG_MAJOR;
c74687cb9b9757 Robin Gong  2019-08-07  160  	msg.header.minor = IMX_RMPSG_MINOR;
c74687cb9b9757 Robin Gong  2019-08-07  161  	msg.header.type = PM_RPMSG_TYPE;
c74687cb9b9757 Robin Gong  2019-08-07  162  	msg.header.cmd = PM_RPMSG_MODE;
c74687cb9b9757 Robin Gong  2019-08-07  163  	msg.data = PM_RPMSG_REBOOT;
c74687cb9b9757 Robin Gong  2019-08-07  164  
c74687cb9b9757 Robin Gong  2019-08-07  165  	pm_send_message(&msg, &pm_rpmsg, true);
c74687cb9b9757 Robin Gong  2019-08-07  166  
c74687cb9b9757 Robin Gong  2019-08-07  167  }
c74687cb9b9757 Robin Gong  2019-08-07  168  
c74687cb9b9757 Robin Gong  2019-08-07 @169  void  pm_heartbeat_off_notify_m4(bool enter)
c74687cb9b9757 Robin Gong  2019-08-07  170  {
c74687cb9b9757 Robin Gong  2019-08-07  171  	struct pm_rpmsg_data msg;
c74687cb9b9757 Robin Gong  2019-08-07  172  
c74687cb9b9757 Robin Gong  2019-08-07  173  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
c74687cb9b9757 Robin Gong  2019-08-07  174  	msg.header.major = IMX_RMPSG_MAJOR;
c74687cb9b9757 Robin Gong  2019-08-07  175  	msg.header.minor = IMX_RMPSG_MINOR;
c74687cb9b9757 Robin Gong  2019-08-07  176  	msg.header.type = PM_RPMSG_TYPE;
c74687cb9b9757 Robin Gong  2019-08-07  177  	msg.header.cmd = PM_RPMSG_HEART_BEAT_OFF;
c74687cb9b9757 Robin Gong  2019-08-07  178  	msg.data = enter ? 0 : 1;
c74687cb9b9757 Robin Gong  2019-08-07  179  
c74687cb9b9757 Robin Gong  2019-08-07  180  	pm_send_message(&msg, &pm_rpmsg, true);
c74687cb9b9757 Robin Gong  2019-08-07  181  }
c74687cb9b9757 Robin Gong  2019-08-07  182  

:::::: The code at line 139 was first introduced by commit
:::::: c74687cb9b9757da23bdede21135d84df04e455e ARM: mach-imx: add heartbeat driver for i.mx7ulp

:::::: TO: Robin Gong <yibin.gong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
