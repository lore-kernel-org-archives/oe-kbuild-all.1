Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69EB7F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679125184; x=1710661184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fPwbWGU8lEYpF6+3i/oVvYGRVjCCBTtZmjupan5U8zg=;
  b=I2ywz7+HmCRsaYG5cT1L+B5LhGO9i2ftvuZz0JXece8Bfv6HNpepNlaB
   bXX7zQyML1l+T8UMbhFbYWu3jLduKZ33wk7sWzGk0nmLX2a2Tn/chQxdl
   /QP0KrbsSl8vQJvwjpzHTIU71DRl2Y5KJFSe8AMFHtyPe7AMt4voyjvTl
   PONuGSIn/HA8oRP3YivjZ9UOHh4OpuCVVNY1zkfGMynoyUPVvRhojYQuI
   tlf/19u08b4dHjWNOgCemgius5XIgB8BLgqwnJPzhhbIuSPK7vsvgGy7M
   Py6a+OtU3VTnyP6rA+6xyh2wFxzBXNHzR4tTSt2HkKSXEL2yCvJrq7NO9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335911211"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="335911211"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 00:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="854719458"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="854719458"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2023 00:39:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdRA9-0009uO-1B;
	Sat, 18 Mar 2023 07:39:37 +0000
Date: Sat, 18 Mar 2023 15:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2.0-net-next-phy-leds 20/28]
 drivers/net/phy/phy_device.c:3084:21: error: 'struct led_classdev' has no
 member named 'hw_control_configure'
Message-ID: <202303181550.Gc0shbAp-lkp@intel.com>
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
commit: bbade5cbf97bd9260cd0c9cf17699127c2b815af [20/28] net: phy: phy_device: Call into the PHY driver to set LED offload
config: ia64-randconfig-r001-20230312 (https://download.01.org/0day-ci/archive/20230318/202303181550.Gc0shbAp-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/bbade5cbf97bd9260cd0c9cf17699127c2b815af
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout bbade5cbf97bd9260cd0c9cf17699127c2b815af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181550.Gc0shbAp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phy_device.c: In function 'of_phy_led':
>> drivers/net/phy/phy_device.c:3084:21: error: 'struct led_classdev' has no member named 'hw_control_configure'
    3084 |                 cdev->hw_control_configure = phy_led_hw_control_configure;
         |                     ^~


vim +3084 drivers/net/phy/phy_device.c

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
  3070		cdev = &phyled->led_cdev;
  3071		phyled->phydev = phydev;
  3072	
  3073		err = of_property_read_u32(led, "reg", &phyled->index);
  3074		if (err)
  3075			return err;
  3076	
  3077		if (phydev->drv->led_brightness_set)
  3078			cdev->brightness_set_blocking = phy_led_set_brightness;
  3079		if (phydev->drv->led_blink_set)
  3080			cdev->blink_set = phy_led_blink_set;
  3081		if (phydev->drv->led_hw_is_supported &&
  3082		    phydev->drv->led_hw_control_set &&
  3083		    phydev->drv->led_hw_control_get)
> 3084			cdev->hw_control_configure = phy_led_hw_control_configure;
  3085		cdev->max_brightness = 1;
  3086		init_data.devicename = dev_name(&phydev->mdio.dev);
  3087		init_data.fwnode = of_fwnode_handle(led);
  3088	
  3089		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3090		if (err)
  3091			return err;
  3092	
  3093		list_add(&phyled->list, &phydev->leds);
  3094	
  3095		return 0;
  3096	}
  3097	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
