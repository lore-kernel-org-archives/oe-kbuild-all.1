Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79272F26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 21:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682889767; x=1714425767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jn5UpAsopm7EgOD5QB3vAjtEgq7t9NNb86VTFqr1J8Q=;
  b=M24JpWrJr7PekFsgqW3QXlH7PNCovIpbXIC1DuzU49ntC03ExgN5EMSt
   RQFoTJ5YXbjSJvKak/RoGDaC0ZgHUV3O6vy8K5cu7DLFNXFwdMvsRpJKD
   Bh4YPcwJDSfzjzmO2pLjlSFUmceIwuxqcbLCMcMNkfniv5a8DgEKZinYV
   zU61WP0Ew6shnheetuUEqtXUu35P67rxsWtfEhwGjJdDxsxqRC0cs+rHu
   9362MsV26QXz/TGtB8tweRvuvJdMsfN1/MT/J7ZzzKW+dfA8TLyCDqTTH
   fGL8AVrRYGVyRgK5kaoyJ5EiYBkNT3pMKlcfoiVmu8xhWvmmrVG/xJ21Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="348093832"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="348093832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 14:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="785059596"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="785059596"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2023 14:22:46 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptEVJ-00008T-12;
	Sun, 30 Apr 2023 21:22:45 +0000
Date: Mon, 1 May 2023 05:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:leds-offload-support-reduced-auto-netdev 12/14]
 drivers/net/phy/phy_device.c:3081:21: error: 'struct led_classdev' has no
 member named 'hw_control_is_supported'
Message-ID: <202305010543.AphNfyWq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git leds-offload-support-reduced-auto-netdev
head:   95771ae239994ead436141b910fabce1e1376c11
commit: 80245f36fba85ae21d4aeb1044564f67f282e629 [12/14] net: phy: phy_device: Call into the PHY driver to set LED offload
config: alpha-randconfig-r001-20230501 (https://download.01.org/0day-ci/archive/20230501/202305010543.AphNfyWq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/80245f36fba85ae21d4aeb1044564f67f282e629
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn leds-offload-support-reduced-auto-netdev
        git checkout 80245f36fba85ae21d4aeb1044564f67f282e629
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010543.AphNfyWq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phy_device.c: In function 'of_phy_led':
>> drivers/net/phy/phy_device.c:3081:21: error: 'struct led_classdev' has no member named 'hw_control_is_supported'
    3081 |                 cdev->hw_control_is_supported = phy_led_hw_is_supported;
         |                     ^~
>> drivers/net/phy/phy_device.c:3082:21: error: 'struct led_classdev' has no member named 'hw_control_set'
    3082 |                 cdev->hw_control_set = phy_led_hw_control_set;
         |                     ^~
>> drivers/net/phy/phy_device.c:3083:21: error: 'struct led_classdev' has no member named 'hw_control_get'
    3083 |                 cdev->hw_control_get = phy_led_hw_control_get;
         |                     ^~
>> drivers/net/phy/phy_device.c:3084:21: error: 'struct led_classdev' has no member named 'hw_control_trigger'
    3084 |                 cdev->hw_control_trigger = "netdev";
         |                     ^~
>> drivers/net/phy/phy_device.c:3085:21: error: 'struct led_classdev' has no member named 'trigger_supported_flags_mask'
    3085 |                 cdev->trigger_supported_flags_mask = (BIT(TRIGGER_NETDEV_TX) |
         |                     ^~
   drivers/net/phy/phy_device.c:3090:13: error: 'struct led_classdev' has no member named 'hw_control_get_device'
    3090 |         cdev->hw_control_get_device = phy_led_hw_control_get_device;
         |             ^~


vim +3081 drivers/net/phy/phy_device.c

  3052	
  3053	static int of_phy_led(struct phy_device *phydev,
  3054			      struct device_node *led)
  3055	{
  3056		struct device *dev = &phydev->mdio.dev;
  3057		struct led_init_data init_data = {};
  3058		struct led_classdev *cdev;
  3059		struct phy_led *phyled;
  3060		int err;
  3061	
  3062		phyled = devm_kzalloc(dev, sizeof(*phyled), GFP_KERNEL);
  3063		if (!phyled)
  3064			return -ENOMEM;
  3065	
  3066		phyled->phydev = phydev;
  3067		cdev = &phyled->led_cdev;
  3068		INIT_LIST_HEAD(&phyled->led_list);
  3069	
  3070		err = of_property_read_u32(led, "reg", &phyled->index);
  3071		if (err)
  3072			return err;
  3073	
  3074		if (phydev->drv->led_brightness_set)
  3075			cdev->brightness_set_blocking = phy_led_set_brightness;
  3076		if (phydev->drv->led_blink_set)
  3077			cdev->blink_set = phy_led_blink_set;
  3078		if (phydev->drv->led_hw_is_supported &&
  3079		    phydev->drv->led_hw_control_set &&
  3080		    phydev->drv->led_hw_control_get) {
> 3081			cdev->hw_control_is_supported = phy_led_hw_is_supported;
> 3082			cdev->hw_control_set = phy_led_hw_control_set;
> 3083			cdev->hw_control_get = phy_led_hw_control_get;
> 3084			cdev->hw_control_trigger = "netdev";
> 3085			cdev->trigger_supported_flags_mask = (BIT(TRIGGER_NETDEV_TX) |
  3086							      BIT(TRIGGER_NETDEV_RX) |
  3087							      BIT(TRIGGER_NETDEV_LINK));
  3088		}
  3089	
  3090		cdev->hw_control_get_device = phy_led_hw_control_get_device;
  3091		cdev->max_brightness = 1;
  3092		init_data.devicename = dev_name(&phydev->mdio.dev);
  3093		init_data.fwnode = of_fwnode_handle(led);
  3094	
  3095		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3096		if (err)
  3097			return err;
  3098	
  3099		list_add(&phyled->led_list, &phydev->led_list);
  3100	
  3101		return 0;
  3102	}
  3103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
