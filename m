Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B4F566C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685292792; x=1716828792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0uDKPAxg4YGr3akWUKoX07Vcl3lnC7wUpQCkM7h+PYY=;
  b=QSSRokf/VueLwX7cvFY0eQ4b5nkrgHK3gZ30TSMAVUiQBRhsGjGV9IXq
   y3sm9dskckciWkk30DxWHZX2Rcn0/Z96q29D9s2x8ekAZA82VBqX40AY2
   ZYjmwWr6yLN0QUd1daq2eFynzcntQ+ZwRVaKv5ObFgosKVINesK9A29Vk
   hEY7PUsFIZISoVqi/1zjCb1C5z6yjhGmS4IQBznRUP02/Mc68DWh2nc1x
   mc7BfbLaTGMaWRonBulq3lQ1JYLyGPlmbmY2mYFzMm2txrl5m6klFVnYP
   dubYtMuJSGGd9tKe9Vam9+GDTX0YKZRTl2dFcSn923d2PBIcSITCcXtsg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="357785496"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="357785496"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 09:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="705797105"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="705797105"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 May 2023 09:53:11 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Jdm-000KgE-1k;
	Sun, 28 May 2023 16:53:10 +0000
Date: Mon, 29 May 2023 00:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 3/4] drivers/phy/apple/atc.c:1571:13:
 warning: variable 'ret' set but not used
Message-ID: <202305290053.hlMcxGBY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   e3ed55ca947e67fac029ec3917d1f2ca6371d360
commit: 42ffc8978cdb02ee0131e1315bd7548f92f09690 [3/4] WIP: phy: apple: Add Apple Type-C PHY
config: m68k-buildonly-randconfig-r001-20230528 (https://download.01.org/0day-ci/archive/20230529/202305290053.hlMcxGBY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/42ffc8978cdb02ee0131e1315bd7548f92f09690
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/170-atcphy
        git checkout 42ffc8978cdb02ee0131e1315bd7548f92f09690
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/phy/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305290053.hlMcxGBY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/apple/atc.c: In function 'atcphy_usb3_power_on':
>> drivers/phy/apple/atc.c:1571:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1571 |         int ret = 0;
         |             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TYPEC
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - PHY_APPLE_ATC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +/ret +1571 drivers/phy/apple/atc.c

  1566	
  1567	static int atcphy_usb3_power_on(struct phy *phy)
  1568	{
  1569		struct apple_atcphy *atcphy = phy_get_drvdata(phy);
  1570		enum atcphy_pipehandler_state state;
> 1571		int ret = 0;
  1572	
  1573		/*
  1574		 * Both usb role switch and mux set work will be running concurrently.
  1575		 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
  1576		 * trying to switch dwc3 to the correct PHY.
  1577		 */
  1578		mutex_lock(&atcphy->lock);
  1579		if (atcphy->mode != atcphy->target_mode) {
  1580			reinit_completion(&atcphy->atcphy_online_event);
  1581			mutex_unlock(&atcphy->lock);
  1582			wait_for_completion_timeout(&atcphy->atcphy_online_event,
  1583						msecs_to_jiffies(1000));
  1584			mutex_lock(&atcphy->lock);
  1585		}
  1586	
  1587		if (atcphy->mode != atcphy->target_mode) {
  1588			dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
  1589			return -EINVAL;
  1590		}
  1591	
  1592		atcphy->dwc3_online = true;
  1593		state = atcphy_modes[atcphy->mode].pipehandler_state;
  1594		switch (state) {
  1595		case ATCPHY_PIPEHANDLER_STATE_USB2:
  1596		case ATCPHY_PIPEHANDLER_STATE_USB3:
  1597			ret = atcphy_configure_pipehandler(atcphy, state);
  1598			break;
  1599	
  1600		case ATCPHY_PIPEHANDLER_STATE_INVALID:
  1601		default:
  1602			dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
  1603				 state);
  1604			ret = -EINVAL;
  1605		}
  1606	
  1607		mutex_unlock(&atcphy->lock);
  1608	
  1609		return 0;
  1610	}
  1611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
