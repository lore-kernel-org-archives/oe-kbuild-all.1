Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522211101
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 04:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZB0Rlvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697344658; x=1728880658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XSNFMU60RQ9+7aar1yFgJ/+dpFHa7qDqOTbPbBgydlE=;
  b=BZB0Rlvie2vfzuGBjNUcGRI2+anVzQAc3mv93IE20IvB6bdJM25UglRA
   Ax4x/Ib3DHhHDSXU41pqhz9lDkzFxLyTXgBm4XsDbWMQQBU9DQvSzmsqj
   yODR1e63YFU6MODQXGVYgSw1hKfcsFG3xpxWWP8oCfaryaYZxGYRkPn9e
   uBTwZ/U+8mey4U14n7WxG8n9u4YZEo4YkkqnAM0k53m6JBO+/uG7UD0AD
   3jitnBiwgaDuuXsR02/yuex/F9wDSWrrgm9iFs762k+145Ds4VrB29QJg
   ueWplKZwzC3x3cOwn13xKSM5mtBft3MJeFD84gaKmAmSIjdm8NEjnyzIj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471594336"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="471594336"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 21:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748855497"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="748855497"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 21:37:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrssf-00072J-2J;
	Sun, 15 Oct 2023 04:37:33 +0000
Date: Sun, 15 Oct 2023 12:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4863/15767]
 arch/arm/mach-imx/pm-rpmsg.c:141:6: warning: no previous prototype for
 'pm_shutdown_notify_m4'
Message-ID: <202310151222.tTmCa5NQ-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: d76441df9683065e8b622bc0cdf725ba3b2db0fd [4863/15767] Merge branch 'rpmsg/next' into next
config: arm-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231015/202310151222.tTmCa5NQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151222.tTmCa5NQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151222.tTmCa5NQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/pm-rpmsg.c:141:6: warning: no previous prototype for 'pm_shutdown_notify_m4' [-Wmissing-prototypes]
     141 | void pm_shutdown_notify_m4(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/pm-rpmsg.c:158:6: warning: no previous prototype for 'pm_reboot_notify_m4' [-Wmissing-prototypes]
     158 | void pm_reboot_notify_m4(void)
         |      ^~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/pm-rpmsg.c:175:7: warning: no previous prototype for 'pm_heartbeat_off_notify_m4' [-Wmissing-prototypes]
     175 | void  pm_heartbeat_off_notify_m4(bool enter)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pm_shutdown_notify_m4 +141 arch/arm/mach-imx/pm-rpmsg.c

6c805eae9e1422 Robin Gong  2019-08-07  140  
6c805eae9e1422 Robin Gong  2019-08-07 @141  void pm_shutdown_notify_m4(void)
6c805eae9e1422 Robin Gong  2019-08-07  142  {
6c805eae9e1422 Robin Gong  2019-08-07  143  	struct pm_rpmsg_data msg;
6c805eae9e1422 Robin Gong  2019-08-07  144  
b5132b9107cc0b Jacky Bai   2021-12-15  145  	memset(&msg, 0, sizeof(msg));
6c805eae9e1422 Robin Gong  2019-08-07  146  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
6c805eae9e1422 Robin Gong  2019-08-07  147  	msg.header.major = IMX_RMPSG_MAJOR;
6c805eae9e1422 Robin Gong  2019-08-07  148  	msg.header.minor = IMX_RMPSG_MINOR;
6c805eae9e1422 Robin Gong  2019-08-07  149  	msg.header.type = PM_RPMSG_TYPE;
6c805eae9e1422 Robin Gong  2019-08-07  150  	msg.header.cmd = PM_RPMSG_MODE;
6c805eae9e1422 Robin Gong  2019-08-07  151  	msg.data = PM_RPMSG_SHUTDOWN;
6c805eae9e1422 Robin Gong  2019-08-07  152  	/* No ACK from M4 */
7cc85094eeff60 Peng Fan    2022-12-06  153  	local_irq_enable();
6c805eae9e1422 Robin Gong  2019-08-07  154  	pm_send_message(&msg, &pm_rpmsg, false);
38ffbbaeede0b0 Anson Huang 2019-08-07  155  	imx7ulp_poweroff();
6c805eae9e1422 Robin Gong  2019-08-07  156  }
6c805eae9e1422 Robin Gong  2019-08-07  157  
6c805eae9e1422 Robin Gong  2019-08-07 @158  void pm_reboot_notify_m4(void)
6c805eae9e1422 Robin Gong  2019-08-07  159  {
6c805eae9e1422 Robin Gong  2019-08-07  160  	struct pm_rpmsg_data msg;
6c805eae9e1422 Robin Gong  2019-08-07  161  
b5132b9107cc0b Jacky Bai   2021-12-15  162  	memset(&msg, 0, sizeof(msg));
6c805eae9e1422 Robin Gong  2019-08-07  163  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
6c805eae9e1422 Robin Gong  2019-08-07  164  	msg.header.major = IMX_RMPSG_MAJOR;
6c805eae9e1422 Robin Gong  2019-08-07  165  	msg.header.minor = IMX_RMPSG_MINOR;
6c805eae9e1422 Robin Gong  2019-08-07  166  	msg.header.type = PM_RPMSG_TYPE;
6c805eae9e1422 Robin Gong  2019-08-07  167  	msg.header.cmd = PM_RPMSG_MODE;
6c805eae9e1422 Robin Gong  2019-08-07  168  	msg.data = PM_RPMSG_REBOOT;
6c805eae9e1422 Robin Gong  2019-08-07  169  
7cc85094eeff60 Peng Fan    2022-12-06  170  	pm_send_message(&msg, &pm_rpmsg, false);
98f5319e7ecb4e Peng Fan    2022-12-06  171  	/* Give a grace period for failure to restart of 1s */
98f5319e7ecb4e Peng Fan    2022-12-06  172  	mdelay(1000);
6c805eae9e1422 Robin Gong  2019-08-07  173  }
6c805eae9e1422 Robin Gong  2019-08-07  174  
6c805eae9e1422 Robin Gong  2019-08-07 @175  void  pm_heartbeat_off_notify_m4(bool enter)
6c805eae9e1422 Robin Gong  2019-08-07  176  {
6c805eae9e1422 Robin Gong  2019-08-07  177  	struct pm_rpmsg_data msg;
6c805eae9e1422 Robin Gong  2019-08-07  178  
b5132b9107cc0b Jacky Bai   2021-12-15  179  	memset(&msg, 0, sizeof(msg));
6c805eae9e1422 Robin Gong  2019-08-07  180  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
6c805eae9e1422 Robin Gong  2019-08-07  181  	msg.header.major = IMX_RMPSG_MAJOR;
6c805eae9e1422 Robin Gong  2019-08-07  182  	msg.header.minor = IMX_RMPSG_MINOR;
6c805eae9e1422 Robin Gong  2019-08-07  183  	msg.header.type = PM_RPMSG_TYPE;
6c805eae9e1422 Robin Gong  2019-08-07  184  	msg.header.cmd = PM_RPMSG_HEART_BEAT_OFF;
6c805eae9e1422 Robin Gong  2019-08-07  185  	msg.data = enter ? 0 : 1;
6c805eae9e1422 Robin Gong  2019-08-07  186  
6c805eae9e1422 Robin Gong  2019-08-07  187  	pm_send_message(&msg, &pm_rpmsg, true);
6c805eae9e1422 Robin Gong  2019-08-07  188  }
6c805eae9e1422 Robin Gong  2019-08-07  189  

:::::: The code at line 141 was first introduced by commit
:::::: 6c805eae9e142258f0076809eb80f2c8961a01fe ARM: mach-imx: add heartbeat driver for i.mx7ulp

:::::: TO: Robin Gong <yibin.gong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
