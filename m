Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0772F26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 20:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682887307; x=1714423307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qwuuDzdHlQHVZZ2HxAEWlU3MrOSPxXczaAitey0GQmU=;
  b=dahkGn7K7pzZ4oizmxz1YUOH0pJlDDtvPKs8u1jgMea/B/Fy0LXlmWa0
   lLEfKRPZ9JgstXuxY48g9VTFCEkU/VRPzHem+iakYlwWcjamjCrsJg+i/
   TINGw0hqtHArKX2ydVQdjz9N5MEPYidM9hT846f87Y32h2CLNadNqL9gW
   ASwkqMco8Mp5WSvzwT/v42t9EWylozY/KGMoHiWY8juv4oF07qi/DAJ4B
   VbKcgOXueL0QFrWlP+JXWukZAoGfbf3FToFmmwimrF8fbVtMJBeLmoKdh
   S7P2Ed2z1xu8m3/uC5C8SWWEsXaGjohsVrsO0elV+dNRsaMT+IM9UEjjX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346853538"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="346853538"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 13:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="1025411477"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="1025411477"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Apr 2023 13:41:45 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptDrc-00007p-2G;
	Sun, 30 Apr 2023 20:41:44 +0000
Date: Mon, 1 May 2023 04:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:leds-offload-support-reduced-auto-netdev 8/14]
 drivers/net/phy/phy_device.c:3036:13: error: 'struct led_classdev' has no
 member named 'hw_control_get_device'
Message-ID: <202305010440.XWa4KPKk-lkp@intel.com>
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
commit: 4e9ae2a99b73137d020f069a5e6911edf0e93437 [8/14] net: phy: Implement hw_control_get_device()
config: alpha-randconfig-r001-20230501 (https://download.01.org/0day-ci/archive/20230501/202305010440.XWa4KPKk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/4e9ae2a99b73137d020f069a5e6911edf0e93437
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn leds-offload-support-reduced-auto-netdev
        git checkout 4e9ae2a99b73137d020f069a5e6911edf0e93437
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010440.XWa4KPKk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phy_device.c: In function 'of_phy_led':
>> drivers/net/phy/phy_device.c:3036:13: error: 'struct led_classdev' has no member named 'hw_control_get_device'
    3036 |         cdev->hw_control_get_device = phy_led_hw_control_get_device;
         |             ^~


vim +3036 drivers/net/phy/phy_device.c

  3010	
  3011	static int of_phy_led(struct phy_device *phydev,
  3012			      struct device_node *led)
  3013	{
  3014		struct device *dev = &phydev->mdio.dev;
  3015		struct led_init_data init_data = {};
  3016		struct led_classdev *cdev;
  3017		struct phy_led *phyled;
  3018		int err;
  3019	
  3020		phyled = devm_kzalloc(dev, sizeof(*phyled), GFP_KERNEL);
  3021		if (!phyled)
  3022			return -ENOMEM;
  3023	
  3024		phyled->phydev = phydev;
  3025		cdev = &phyled->led_cdev;
  3026		INIT_LIST_HEAD(&phyled->led_list);
  3027	
  3028		err = of_property_read_u32(led, "reg", &phyled->index);
  3029		if (err)
  3030			return err;
  3031	
  3032		if (phydev->drv->led_brightness_set)
  3033			cdev->brightness_set_blocking = phy_led_set_brightness;
  3034		if (phydev->drv->led_blink_set)
  3035			cdev->blink_set = phy_led_blink_set;
> 3036		cdev->hw_control_get_device = phy_led_hw_control_get_device;
  3037		cdev->max_brightness = 1;
  3038		init_data.devicename = dev_name(&phydev->mdio.dev);
  3039		init_data.fwnode = of_fwnode_handle(led);
  3040	
  3041		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3042		if (err)
  3043			return err;
  3044	
  3045		list_add(&phyled->led_list, &phydev->led_list);
  3046	
  3047		return 0;
  3048	}
  3049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
