Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55A52918
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676831863; x=1708367863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOmyZuqUshu4FXUyk9wX4CSQVX4UFp6dTepzqq19l7Y=;
  b=g3ZZaT/KnhWuSTuksTRjZ5SkQDTpSMj674pyU+XNMLhLi6iBhv+FJOVM
   /1MjHLbSEkXgPp4Y+VvBfUjs/AE1KoiZM3R4GXhRnFhuuWTUN2NUnAe7X
   ye6Vs6RVLZgaWr0JruGynJueETatEiTdetZNvw519Oim3V1EFoS6vlYds
   q4WLjykJ37zAIhl0fH+gtm6CGhkmFRE+diNZEq/gsdRgzLIYu4AaVreZy
   dD1MFddNNg6BeeXA8M+TYIN1YXUHDG9EBK/4mjXlaFTxPjb5htMS777YV
   PmBIqidr9wFl8Pphj9WAgTiCfdm4b10CkVvSca/J0QZl23o3tD2hwg1yQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="311906651"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="311906651"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 10:37:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="734911729"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="734911729"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Feb 2023 10:37:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pToZB-000DPZ-0x;
	Sun, 19 Feb 2023 18:37:41 +0000
Date: Mon, 20 Feb 2023 02:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 9/54] drivers/phy/apple/atc.c:1586:13:
 warning: variable 'ret' set but not used
Message-ID: <202302200224.6BlCXTPA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: 168464bc07a38655ea673ba03febe4aeb6cfa5e2 [9/54] WIP: phy: apple: Add Apple Type-C PHY
config: loongarch-randconfig-r006-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200224.6BlCXTPA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/168464bc07a38655ea673ba03febe4aeb6cfa5e2
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout 168464bc07a38655ea673ba03febe4aeb6cfa5e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/pci/ drivers/phy/apple/ drivers/thunderbolt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200224.6BlCXTPA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/apple/atc.c: In function 'atcphy_usb3_power_on':
>> drivers/phy/apple/atc.c:1586:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1586 |         int ret = 0;
         |             ^~~
   drivers/phy/apple/atc.c: In function 'atcphy_usb4_power_on':
   drivers/phy/apple/atc.c:1858:13: warning: unused variable 'ret' [-Wunused-variable]
    1858 |         int ret = 0;
         |             ^~~


vim +/ret +1586 drivers/phy/apple/atc.c

  1581	
  1582	static int atcphy_usb3_power_on(struct phy *phy)
  1583	{
  1584		struct apple_atcphy *atcphy = phy_get_drvdata(phy);
  1585		enum atcphy_pipehandler_state state;
> 1586		int ret = 0;
  1587	
  1588		/*
  1589		 * Both usb role switch and mux set work will be running concurrently.
  1590		 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
  1591		 * trying to switch dwc3 to the correct PHY.
  1592		 */
  1593		mutex_lock(&atcphy->lock);
  1594		if (atcphy->mode != atcphy->target_mode) {
  1595			reinit_completion(&atcphy->atcphy_online_event);
  1596			mutex_unlock(&atcphy->lock);
  1597			wait_for_completion_timeout(&atcphy->atcphy_online_event,
  1598						    msecs_to_jiffies(2000));
  1599			mutex_lock(&atcphy->lock);
  1600		}
  1601	
  1602		if (atcphy->mode != atcphy->target_mode) {
  1603			dev_err(atcphy->dev,
  1604				"ATCPHY did not come up; won't allow dwc3 to come up.\n");
  1605			mutex_unlock(&atcphy->lock);
  1606			return -EINVAL;
  1607		}
  1608	
  1609		atcphy->dwc3_online = true;
  1610		state = atcphy_modes[atcphy->mode].pipehandler_state;
  1611		switch (state) {
  1612		case ATCPHY_PIPEHANDLER_STATE_USB2:
  1613		case ATCPHY_PIPEHANDLER_STATE_USB3:
  1614			ret = atcphy_configure_pipehandler(atcphy, state);
  1615			break;
  1616	
  1617		case ATCPHY_PIPEHANDLER_STATE_INVALID:
  1618		default:
  1619			dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
  1620				 state);
  1621			ret = -EINVAL;
  1622		}
  1623	
  1624		mutex_unlock(&atcphy->lock);
  1625	
  1626		return 0;
  1627	}
  1628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
