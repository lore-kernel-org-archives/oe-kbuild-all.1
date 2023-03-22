Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD491FDE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679474678; x=1711010678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rPU+Oq92gJzzwRBUdMejhG+SxhgXJzy8svyIUJmaJQg=;
  b=UYLz8D4vjuDsMcVkEVMulZxFxG/INrYM6y39fzF7lJxUEY1MnmaZ3iRv
   uHbzbhk5rEXWZmQQwJy7ECWN8wuufTUpQwzoKGR6+qVq+c1KK23lVCYWj
   hSBvde7FRwJmPiFnTj9VfkXaMNrkGBNaeeRhW3dHhy7aHDPonp8lZ8X9R
   dUgT13LvCY/xBe04WzlXXmx7fJHldmPOrvHbT5hNMYMpNZIljY2P/dc1v
   mz7ERpGmHZYXde5YgQBEbMdX5CPu7qKZPJva/1ZEizoUqXYHDNKIkd3im
   ce9bBeyeaWhaJ+dMlFcEjAME/hjRld6dlAubC8xX1mosEaS3veP99uaHX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366896664"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="366896664"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 01:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750958606"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="750958606"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2023 01:44:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peu56-000D62-0R;
	Wed, 22 Mar 2023 08:44:28 +0000
Date: Wed, 22 Mar 2023 16:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2.0-net-next-phy-leds 27/28]
 drivers/net/phy/phy_device.c:3096:13: error: 'struct led_classdev' has no
 member named 'hw_control_get_device'
Message-ID: <202303221626.LfGWDYAA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2.0-net-next-phy-leds
head:   8a9b1a5ad5dd0e48585009020088a2ee5bdd6688
commit: 7c2cfe88a4bf5b643c74c16e15be9119689e475d [27/28] net: phy: Implement hw_control_get_device()
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230322/202303221626.LfGWDYAA-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/7c2cfe88a4bf5b643c74c16e15be9119689e475d
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout 7c2cfe88a4bf5b643c74c16e15be9119689e475d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221626.LfGWDYAA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phy_device.c: In function 'of_phy_led':
   drivers/net/phy/phy_device.c:3095:21: error: 'struct led_classdev' has no member named 'hw_control_configure'
    3095 |                 cdev->hw_control_configure = phy_led_hw_control_configure;
         |                     ^~
>> drivers/net/phy/phy_device.c:3096:13: error: 'struct led_classdev' has no member named 'hw_control_get_device'
    3096 |         cdev->hw_control_get_device = phy_led_hw_control_get_device;
         |             ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [n]: NETDEVICES [=y] && LEDS_CLASS [=n]
   Selected by [y]:
   - PHYLINK [=y] && NETDEVICES [=y]
   - R8169 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_REALTEK [=y] && PCI [=y]
   WARNING: unmet direct dependencies detected for MDIO_BUS_MUX
   Depends on [n]: NETDEVICES [=y] && MDIO_DEVICE [=n] && MDIO_BUS [=n] && OF_MDIO [=n]
   Selected by [m]:
   - DWMAC_SUN8I [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_SUNXI [=y] || COMPILE_TEST [=n])


vim +3096 drivers/net/phy/phy_device.c

  3067	
  3068	static int of_phy_led(struct phy_device *phydev,
  3069			      struct device_node *led)
  3070	{
  3071		struct device *dev = &phydev->mdio.dev;
  3072		struct led_init_data init_data = {};
  3073		struct led_classdev *cdev;
  3074		struct phy_led *phyled;
  3075		int err;
  3076	
  3077		phyled = devm_kzalloc(dev, sizeof(*phyled), GFP_KERNEL);
  3078		if (!phyled)
  3079			return -ENOMEM;
  3080	
  3081		cdev = &phyled->led_cdev;
  3082		phyled->phydev = phydev;
  3083	
  3084		err = of_property_read_u32(led, "reg", &phyled->index);
  3085		if (err)
  3086			return err;
  3087	
  3088		if (phydev->drv->led_brightness_set)
  3089			cdev->brightness_set_blocking = phy_led_set_brightness;
  3090		if (phydev->drv->led_blink_set)
  3091			cdev->blink_set = phy_led_blink_set;
  3092		if (phydev->drv->led_hw_is_supported &&
  3093		    phydev->drv->led_hw_control_set &&
  3094		    phydev->drv->led_hw_control_get)
  3095			cdev->hw_control_configure = phy_led_hw_control_configure;
> 3096		cdev->hw_control_get_device = phy_led_hw_control_get_device;
  3097		cdev->max_brightness = 1;
  3098		init_data.devicename = dev_name(&phydev->mdio.dev);
  3099		init_data.fwnode = of_fwnode_handle(led);
  3100	
  3101		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3102		if (err)
  3103			return err;
  3104	
  3105		list_add(&phyled->list, &phydev->leds);
  3106	
  3107		return 0;
  3108	}
  3109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
