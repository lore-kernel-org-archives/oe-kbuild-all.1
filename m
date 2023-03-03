Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DAD1851
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 04:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677816411; x=1709352411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qYTRfwcONgpLhVYWUarHWAOspAX5FtZR6SFDh2G8xn0=;
  b=KFXCc3WVtdURdqW1+cqzMWrqGCkwm5U8VHz3K7/tCyfwGs0WHIjKQQi9
   72nEC3Oc5rhm5hh39XLKdt7iGwStoXaQIZC3s0RWEynf7c/Ugljf1/blE
   RKIeJXIflU1HJmMsCVhw3pZbFpFY3Hl2IXkl0JplHxygMSxe//OoXTVU1
   Dv/ffLbYOSiLOmooBJZI4HHl7zZLiTrg4IPCaGsMXi1MOmg75qQP9rs4N
   DBjEFwJQqBLGaDtKsqm16UbJAMo94knIfjI46V46AcRi15+RQu4QWSO0s
   nNHXq+VJgedheZ9tmBgUl/t7239bKzX3DJJ8qO9TV6OPFEgy1B+jHyiM9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="315350202"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="315350202"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 20:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="818331364"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="818331364"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2023 20:06:49 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXwgy-0001BE-2l;
	Fri, 03 Mar 2023 04:06:48 +0000
Date: Fri, 3 Mar 2023 12:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2.0-net-next-phy-leds 19/23]
 drivers/net/phy/phy_device.c:3085:21: error: 'struct led_classdev' has no
 member named 'hw_control_configure'
Message-ID: <202303031243.yLsMmIu9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2.0-net-next-phy-leds
head:   754bf629fa1ea70b4e2b779ac7955e744ae1608d
commit: 38890be32bc8bf8df585618b174f4c3274786f9f [19/23] net: phy: phy_device: Call into the PHY driver to set LED offload
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230303/202303031243.yLsMmIu9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/38890be32bc8bf8df585618b174f4c3274786f9f
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout 38890be32bc8bf8df585618b174f4c3274786f9f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031243.yLsMmIu9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phy_device.c: In function 'of_phy_led':
>> drivers/net/phy/phy_device.c:3085:21: error: 'struct led_classdev' has no member named 'hw_control_configure'
    3085 |                 cdev->hw_control_configure = phy_led_hw_control_configure;
         |                     ^~


vim +3085 drivers/net/phy/phy_device.c

  3056	
  3057	static int of_phy_led(struct phy_device *phydev,
  3058			      struct device_node *led)
  3059	{
  3060		struct device *dev = &phydev->mdio.dev;
  3061		struct led_init_data init_data = {};
  3062		struct led_classdev *cdev;
  3063		struct phy_led *phyled;
  3064		int err;
  3065	
  3066		phyled = devm_kzalloc(dev, sizeof(*phyled), GFP_KERNEL);
  3067		if (!phyled)
  3068			return -ENOMEM;
  3069	
  3070		phyled->phydev = phydev;
  3071		cdev = &phyled->led_cdev;
  3072		INIT_LIST_HEAD(&phyled->led_list);
  3073	
  3074		err = of_property_read_u32(led, "reg", &phyled->index);
  3075		if (err)
  3076			return err;
  3077	
  3078		if (phydev->drv->led_brightness_set)
  3079			cdev->brightness_set_blocking = phy_led_set_brightness;
  3080		if (phydev->drv->led_blink_set)
  3081			cdev->blink_set = phy_led_blink_set;
  3082		if (phydev->drv->led_hw_is_supported &&
  3083		    phydev->drv->led_hw_control_set &&
  3084		    phydev->drv->led_hw_control_get)
> 3085			cdev->hw_control_configure = phy_led_hw_control_configure;
  3086		cdev->max_brightness = 1;
  3087		init_data.devicename = dev_name(&phydev->mdio.dev);
  3088		init_data.fwnode = of_fwnode_handle(led);
  3089	
  3090		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3091		if (err)
  3092			return err;
  3093	
  3094		list_add(&phyled->led_list, &phydev->led_list);
  3095	
  3096		return 0;
  3097	}
  3098	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
