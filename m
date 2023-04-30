Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E2A5668
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682892229; x=1714428229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Lft3sVIFWDFLsofNdLXln1oAUW+XdEq+O0Wd4qjQRQ=;
  b=bj9FDDYxns/E20vvjCoF8pL8WCIKxNNSiaxPGVprWNQ3xOJ2ptazhbHS
   9Mx115Jtl9PIOrf5LVkC6HYvJUEY7ZuJfdmsfTJeBbm7Zqtm9d6Hxc1Qr
   LNf6nqYjNYZhlkT785MGZCc9PoPLEptX1X6cOzFvC9l6LY5P/uwaklCQB
   t54nUwkOOIfoTy41GseRipzXyTZq819izOAzaMJj+nCcRDocDGNdnfr3F
   T44YbLsgHsvcSHRR7cvF47N+CBYLHiuOaHdn8BpzIQRU4oKkEDSIhMGna
   REf35313GAL3SCAg9PHiqOfU7aEtZ6juIu5txi6ESur+Ehwx+F+4P3s7i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="328407756"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="328407756"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 15:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="760483575"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="760483575"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Apr 2023 15:03:47 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptF90-00009d-0w;
	Sun, 30 Apr 2023 22:03:46 +0000
Date: Mon, 1 May 2023 06:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:leds-offload-support-reduced-auto-netdev 3/38]
 drivers/net/phy/phy_device.c:3045: undefined reference to
 `devm_led_classdev_unregister'
Message-ID: <202305010503.zVoul4ir-lkp@intel.com>
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
commit: 1433aa0fef70d234110237e349a4eccd10fb3f3e [3/38] net: phy: Add a binding for PHY LEDs
config: arc-randconfig-r043-20230501 (https://download.01.org/0day-ci/archive/20230501/202305010503.zVoul4ir-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/1433aa0fef70d234110237e349a4eccd10fb3f3e
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn leds-offload-support-reduced-auto-netdev
        git checkout 1433aa0fef70d234110237e349a4eccd10fb3f3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010503.zVoul4ir-lkp@intel.com/

All errors (new ones prefixed by >>):

   arceb-elf-ld: drivers/net/phy/phy_device.o: in function `phy_remove':
>> drivers/net/phy/phy_device.c:3045: undefined reference to `devm_led_classdev_unregister'
>> arceb-elf-ld: drivers/net/phy/phy_device.c:3045: undefined reference to `devm_led_classdev_unregister'
   arceb-elf-ld: drivers/net/phy/phy_device.o: in function `phy_probe':
>> drivers/net/phy/phy_device.c:3003: undefined reference to `devm_led_classdev_register_ext'
>> arceb-elf-ld: drivers/net/phy/phy_device.c:3003: undefined reference to `devm_led_classdev_register_ext'


vim +3045 drivers/net/phy/phy_device.c

  2976	
  2977	static int of_phy_led(struct phy_device *phydev,
  2978			      struct device_node *led)
  2979	{
  2980		struct device *dev = &phydev->mdio.dev;
  2981		struct led_init_data init_data = {};
  2982		struct led_classdev *cdev;
  2983		struct phy_led *phyled;
  2984		int err;
  2985	
  2986		phyled = devm_kzalloc(dev, sizeof(*phyled), GFP_KERNEL);
  2987		if (!phyled)
  2988			return -ENOMEM;
  2989	
  2990		phyled->phydev = phydev;
  2991		cdev = &phyled->led_cdev;
  2992		INIT_LIST_HEAD(&phyled->led_list);
  2993	
  2994		err = of_property_read_u32(led, "reg", &phyled->index);
  2995		if (err)
  2996			return err;
  2997	
  2998		cdev->brightness_set_blocking = phy_led_set_brightness;
  2999		cdev->max_brightness = 1;
  3000		init_data.devicename = dev_name(&phydev->mdio.dev);
  3001		init_data.fwnode = of_fwnode_handle(led);
  3002	
> 3003		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3004		if (err)
  3005			return err;
  3006	
  3007		list_add(&phyled->led_list, &phydev->led_list);
  3008	
  3009		return 0;
  3010	}
  3011	
  3012	static int of_phy_leds(struct phy_device *phydev)
  3013	{
  3014		struct device_node *node = phydev->mdio.dev.of_node;
  3015		struct device_node *leds, *led;
  3016		int err;
  3017	
  3018		if (!IS_ENABLED(CONFIG_OF_MDIO))
  3019			return 0;
  3020	
  3021		if (!node)
  3022			return 0;
  3023	
  3024		leds = of_get_child_by_name(node, "leds");
  3025		if (!leds)
  3026			return 0;
  3027	
  3028		for_each_available_child_of_node(leds, led) {
  3029			err = of_phy_led(phydev, led);
  3030			if (err)
  3031				return err;
  3032		}
  3033	
  3034		return 0;
  3035	}
  3036	
  3037	static void phy_leds_remove(struct phy_device *phydev)
  3038	{
  3039		struct device *dev = &phydev->mdio.dev;
  3040		struct led_classdev *cdev;
  3041		struct phy_led *phyled;
  3042	
  3043		list_for_each_entry(phyled, &phydev->led_list, led_list) {
  3044			cdev = &phyled->led_cdev;
> 3045			devm_led_classdev_unregister(dev, cdev);
  3046		}
  3047	}
  3048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
