Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525691868
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 19:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681587296; x=1713123296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dm2NHjVSZnQ2togS/GZWB+jxj55ZvES3LYC+N1qWwRw=;
  b=DkeZjoFkcvz0PueVRC3TJ0kRK1ze2Fefure7eQySKVdQNVbQV64LlGsD
   SvEifmp5rM2cq4wIqau9YZxw18YUnHpddST/PQjjlxZBdBDH8fvg3opmc
   2g1UeGOet0hUSvWZCNURaosh6fEAwFot18DJJhcfbLMiK/MGrBlsXf88X
   9IhiN6/0duZKAke+Bt/0W9noj9XC6m/E9DGVllJUqfc+Mw5YX3whR6lWD
   0rTokgvQaa/HoCkCAhYzbvD5ujFO3bvXYEZyLRSWdQO5Nf/1MhkiFEk5N
   AT0cEqy0DmCX7xkRhHyksk2/agOMlyJcUCI2yvAN32BL8TCzikjduaiLG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="430967134"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="430967134"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 12:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="814310303"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="814310303"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2023 12:34:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnlff-000bIR-1y;
	Sat, 15 Apr 2023 19:34:51 +0000
Date: Sun, 16 Apr 2023 03:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4863/9838]
 drivers/soc/imx/rpmsg_life_cycle.c:126:13: error: 'pm_suspend_target_state'
 undeclared
Message-ID: <202304160350.PP8hTqMo-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: d76441df9683065e8b622bc0cdf725ba3b2db0fd [4863/9838] Merge branch 'rpmsg/next' into next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230416/202304160350.PP8hTqMo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/d76441df9683065e8b622bc0cdf725ba3b2db0fd
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout d76441df9683065e8b622bc0cdf725ba3b2db0fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/pwm/ drivers/soc/imx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160350.PP8hTqMo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/imx/rpmsg_life_cycle.c: In function 'rpmsg_lifecycle_pm_notify':
>> drivers/soc/imx/rpmsg_life_cycle.c:126:13: error: 'pm_suspend_target_state' undeclared (first use in this function)
     126 |         if (pm_suspend_target_state != PM_SUSPEND_MEM)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/rpmsg_life_cycle.c:126:13: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RPMSG_VIRTIO
   Depends on [n]: HAS_DMA [=n]
   Selected by [m]:
   - HAVE_IMX_RPMSG [=y] && IMX_MBOX [=m]
   WARNING: unmet direct dependencies detected for UIO
   Depends on [n]: MMU [=n]
   Selected by [m]:
   - FEC_UIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y]


vim +/pm_suspend_target_state +126 drivers/soc/imx/rpmsg_life_cycle.c

ef6386e70ae4cf Jacky Bai 2021-09-23  119  
fb9fd020919b41 Jacky Bai 2021-10-18  120  static int __maybe_unused rpmsg_lifecycle_pm_notify(bool enter)
fb9fd020919b41 Jacky Bai 2021-10-18  121  {
fb9fd020919b41 Jacky Bai 2021-10-18  122  	struct pm_rpmsg_data msg = {};
fb9fd020919b41 Jacky Bai 2021-10-18  123  	int ret;
fb9fd020919b41 Jacky Bai 2021-10-18  124  
fb9fd020919b41 Jacky Bai 2021-10-18  125  	/* Only need to do lifecycle notify when APD enter mem(HW PD) mode */
fb9fd020919b41 Jacky Bai 2021-10-18 @126  	if (pm_suspend_target_state != PM_SUSPEND_MEM)
fb9fd020919b41 Jacky Bai 2021-10-18  127  		return 0;
fb9fd020919b41 Jacky Bai 2021-10-18  128  
fb9fd020919b41 Jacky Bai 2021-10-18  129  	msg.data = enter ? PM_RPMSG_SUSPEND : PM_RPMSG_ACTIVE;
fb9fd020919b41 Jacky Bai 2021-10-18  130  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
fb9fd020919b41 Jacky Bai 2021-10-18  131  	msg.header.major = IMX_RMPSG_MAJOR;
fb9fd020919b41 Jacky Bai 2021-10-18  132  	msg.header.minor = IMX_RMPSG_MINOR;
fb9fd020919b41 Jacky Bai 2021-10-18  133  	msg.header.type = PM_RPMSG_TYPE;
fb9fd020919b41 Jacky Bai 2021-10-18  134  	msg.header.cmd = PM_RPMSG_MODE;
fb9fd020919b41 Jacky Bai 2021-10-18  135  
fb9fd020919b41 Jacky Bai 2021-10-18  136  	reinit_completion(&cmd_complete);
fb9fd020919b41 Jacky Bai 2021-10-18  137  
fb9fd020919b41 Jacky Bai 2021-10-18  138  	ret = rpmsg_send(life_cycle_rpdev->ept, &msg, sizeof(struct pm_rpmsg_data));
fb9fd020919b41 Jacky Bai 2021-10-18  139  	if (ret) {
fb9fd020919b41 Jacky Bai 2021-10-18  140  		dev_err(&life_cycle_rpdev->dev, "rpmsg send failed:%d\n", ret);
fb9fd020919b41 Jacky Bai 2021-10-18  141  		return ret;
fb9fd020919b41 Jacky Bai 2021-10-18  142  	}
fb9fd020919b41 Jacky Bai 2021-10-18  143  
fb9fd020919b41 Jacky Bai 2021-10-18  144  	ret = wait_for_completion_timeout(&cmd_complete,
fb9fd020919b41 Jacky Bai 2021-10-18  145  					msecs_to_jiffies(RPMSG_TIMEOUT));
fb9fd020919b41 Jacky Bai 2021-10-18  146  	if (!ret) {
fb9fd020919b41 Jacky Bai 2021-10-18  147  		dev_err(&life_cycle_rpdev->dev, "rpmsg_send timeout!\n");
fb9fd020919b41 Jacky Bai 2021-10-18  148  		return -ETIMEDOUT;
fb9fd020919b41 Jacky Bai 2021-10-18  149  	}
fb9fd020919b41 Jacky Bai 2021-10-18  150  
fb9fd020919b41 Jacky Bai 2021-10-18  151  	return 0;
fb9fd020919b41 Jacky Bai 2021-10-18  152  }
fb9fd020919b41 Jacky Bai 2021-10-18  153  

:::::: The code at line 126 was first introduced by commit
:::::: fb9fd020919b41006aab5e892c5c2cb804071cb0 LF-6607-01 soc: imx: Add suspend/resume lifecycle sync support on imx8ulp

:::::: TO: Jacky Bai <ping.bai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
