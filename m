Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA887E6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 06:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678341794; x=1709877794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SEomrDDHUVm7ZdNdhsEaNY4sb11/LS44b7tiN7goW9M=;
  b=h0Yk3pZNTXBIdeqMhcee5PZzUBWqfbywdicur33rcoVfbyiYO/wrqdOn
   4jlivLrIHOd4OrmThg46xUMNdTCoMv4YRLpdZddpZIL03exv6QyHZfPRj
   WUR6n4dLmb4znFAZkm0/Ea1mABsJlx/GLn6qeH64/XennmSzj+kgrQz35
   fCpkhM3uyDEp54ItFS/2I+roMv+yDwFJqQY9yp5um2chF5VjGaEzGoYn3
   SBeAfO5YFalVhObjAojQ9Y+GuHNWSu34Bdrxb0vGB4r3aLvrssSA3FXYd
   eh2xCAobs4Z8UYAlZyIA8tEVTqNLiQNg30RKHEwhRGU6dxBlNbnYS40Pe
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335065756"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="335065756"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 22:03:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="746185611"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="746185611"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2023 22:03:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa9Mt-0002hP-2s;
	Thu, 09 Mar 2023 06:03:11 +0000
Date: Thu, 9 Mar 2023 14:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2.0-net-next-phy-leds 27/28]
 drivers/net/phy/phy_device.c:3097:13: error: 'struct led_classdev' has no
 member named 'hw_control_get_device'
Message-ID: <202303091418.gZAzIgnX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2.0-net-next-phy-leds
head:   5e80c5c7b6177d29b99f274eeffbfd2faf6a8985
commit: 9ef4575a04bf842629ba73306f2654e4b34aac62 [27/28] net: phy: Implement hw_control_get_device()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230309/202303091418.gZAzIgnX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/9ef4575a04bf842629ba73306f2654e4b34aac62
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout 9ef4575a04bf842629ba73306f2654e4b34aac62
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091418.gZAzIgnX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phy_device.c: In function 'of_phy_led':
   drivers/net/phy/phy_device.c:3096:21: error: 'struct led_classdev' has no member named 'hw_control_configure'
    3096 |                 cdev->hw_control_configure = phy_led_hw_control_configure;
         |                     ^~
>> drivers/net/phy/phy_device.c:3097:13: error: 'struct led_classdev' has no member named 'hw_control_get_device'
    3097 |         cdev->hw_control_get_device = phy_led_hw_control_get_device;
         |             ^~


vim +3097 drivers/net/phy/phy_device.c

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
  3081		phyled->phydev = phydev;
  3082		cdev = &phyled->led_cdev;
  3083		INIT_LIST_HEAD(&phyled->led_list);
  3084	
  3085		err = of_property_read_u32(led, "reg", &phyled->index);
  3086		if (err)
  3087			return err;
  3088	
  3089		if (phydev->drv->led_brightness_set)
  3090			cdev->brightness_set_blocking = phy_led_set_brightness;
  3091		if (phydev->drv->led_blink_set)
  3092			cdev->blink_set = phy_led_blink_set;
  3093		if (phydev->drv->led_hw_is_supported &&
  3094		    phydev->drv->led_hw_control_set &&
  3095		    phydev->drv->led_hw_control_get)
  3096			cdev->hw_control_configure = phy_led_hw_control_configure;
> 3097		cdev->hw_control_get_device = phy_led_hw_control_get_device;
  3098		cdev->max_brightness = 1;
  3099		init_data.devicename = dev_name(&phydev->mdio.dev);
  3100		init_data.fwnode = of_fwnode_handle(led);
  3101	
  3102		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3103		if (err)
  3104			return err;
  3105	
  3106		list_add(&phyled->led_list, &phydev->led_list);
  3107	
  3108		return 0;
  3109	}
  3110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
