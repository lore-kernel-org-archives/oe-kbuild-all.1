Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA2A21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 04:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679977070; x=1711513070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WXJmCBzPJYbavuLKYq3ztZZCv9CSd7ND6ufFF8QjNNo=;
  b=Upx6a+5nZTNDl6VkdOq2QMCfNa7XGM0BSCDkkX+OrBCfIPrWeukuosxW
   GWksLBZGnB9KvTjNOTpJQ/aoZRJZ4ENzV2vrqbnJINJOdjM14YRoZiaC1
   fxj41NI890huNkfYsi6+Mw4OMheo7eeKahXvv9olWU7jB/YF6Hdjm1iS4
   fgIvyeMPMZEE0SJ+eV+6yjhCe7lsIwIEqedJ/yn480VGcFXLwjYYiKwT5
   u7OtPY4YsL5ST5uxX1Q2rEl8kNua09Fxx+bpppsJ+i+JLWJNFPIqqyjN8
   Gdb0kBib0OvjmsMdiYJq9ohNkxZnV7kuQa5L6yyckEL/GqCN0SJpmB9zi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324361210"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="324361210"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 21:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="1013386680"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="1013386680"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Mar 2023 21:17:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph0mJ-000IGh-1e;
	Tue, 28 Mar 2023 04:17:47 +0000
Date: Tue, 28 Mar 2023 12:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.3-rc3-net-next-ethtool-eee-v5 19/24]
 drivers/net/usb/lan78xx.c:2103:28: warning: unused variable 'phydev'
Message-ID: <202303281202.HNpfdToO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc3-net-next-ethtool-eee-v5
head:   77147a26b8a2f5214b87c01a2682aa44cc4d8814
commit: 5cf88bf4cd568a0c7a7d047e25283e77e5a0dfc8 [19/24] net: usb: lan78xx: Fixup EEE
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303281202.HNpfdToO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/lunn/linux/commit/5cf88bf4cd568a0c7a7d047e25283e77e5a0dfc8
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc3-net-next-ethtool-eee-v5
        git checkout 5cf88bf4cd568a0c7a7d047e25283e77e5a0dfc8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281202.HNpfdToO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/usb/lan78xx.c: In function 'lan78xx_link_status_change':
   drivers/net/usb/lan78xx.c:2107:50: error: expected ')' before ';' token
    2107 |         ret = lan78xx_read_reg(dev, MAC_CR, &data;
         |                               ~                  ^
         |                                                  )
   drivers/net/usb/lan78xx.c:2117:34: error: expected ';' before '}' token
    2117 |         phy_print_status(phydev);
         |                                  ^
         |                                  ;
    2118 | }
         | ~                                 
   drivers/net/usb/lan78xx.c:2105:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2105 |         int ret;
         |             ^~~
>> drivers/net/usb/lan78xx.c:2103:28: warning: unused variable 'phydev' [-Wunused-variable]
    2103 |         struct phy_device *phydev = net->phydev;
         |                            ^~~~~~


vim +/phydev +2103 drivers/net/usb/lan78xx.c

ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2099  
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2100  static void lan78xx_link_status_change(struct net_device *net)
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2101  {
5cf88bf4cd568a Andrew Lunn               2023-02-15  2102  	struct lan78xx_net *dev = netdev_priv(net);
14437e3fa284f4 Woojung Huh               2016-04-25 @2103  	struct phy_device *phydev = net->phydev;
5cf88bf4cd568a Andrew Lunn               2023-02-15  2104  	u32 data;
5cf88bf4cd568a Andrew Lunn               2023-02-15  2105  	int ret;
5cf88bf4cd568a Andrew Lunn               2023-02-15  2106  
5cf88bf4cd568a Andrew Lunn               2023-02-15  2107  	ret = lan78xx_read_reg(dev, MAC_CR, &data;
5cf88bf4cd568a Andrew Lunn               2023-02-15  2108  	if (ret < 0)
5cf88bf4cd568a Andrew Lunn               2023-02-15  2109  		return;
5cf88bf4cd568a Andrew Lunn               2023-02-15  2110  
5cf88bf4cd568a Andrew Lunn               2023-02-15  2111  	if (phydev->eee_active)
5cf88bf4cd568a Andrew Lunn               2023-02-15  2112  		data |=  MAC_CR_EEE_EN_;
5cf88bf4cd568a Andrew Lunn               2023-02-15  2113  	else
5cf88bf4cd568a Andrew Lunn               2023-02-15  2114  		data &= ~MAC_CR_EEE_EN_;
5cf88bf4cd568a Andrew Lunn               2023-02-15  2115  	lan78xx_write_reg(dev, MAC_CR, data);
14437e3fa284f4 Woojung Huh               2016-04-25  2116  
e57cf3639c323e Yuiko Oshino              2023-03-01  2117  	phy_print_status(phydev);
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2118  }
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2119  

:::::: The code at line 2103 was first introduced by commit
:::::: 14437e3fa284f465dbbc8611fd4331ca8d60e986 lan78xx: workaround of forced 100 Full/Half duplex mode error

:::::: TO: Woojung Huh <woojung.huh@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
