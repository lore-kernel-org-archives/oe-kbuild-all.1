Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB94947A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 14:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678370981; x=1709906981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EiY9EBpf73OUtVovs3Jffallt/SWaI6E2j5fvbetltc=;
  b=fJa74759zWHsGO4phvomZbU6G9ZlyYLFaLvVr3sqasWi/9dCI2KltV79
   UhepV7cnfIEsdkSwQ+snXZWD161rhvtxwcwcUIUcocrzxdpGDSuHZ6lwk
   b0bWER31tpXRLpekuVzUSqv/cGGEgw/wW7s+cPCUAVr+wr3Htq50Z8XeE
   irPTpdepDGsERDZ+urPSgF0+ui4XYnWdD7jZd8Ign2l/Jc9wxbcEDQHFu
   gJrk/KY4PEygyy6jvHRc4ilPhmHPPSvV5iHZ09Wy7Oua6cBJGvkf/zjSC
   D9UpQRyAqbFY0rx60YAFA/fMlQlqqgBf94chP3GfYjhDoTQzlnO38Y5JI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333922467"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="333922467"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 06:09:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820614344"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="820614344"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2023 06:09:26 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paGxR-0002zh-2i;
	Thu, 09 Mar 2023 14:09:25 +0000
Date: Thu, 9 Mar 2023 22:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2.0-net-next-phy-leds 20/28]
 drivers/net/phy/phy_device.c:3085:21: error: 'struct led_classdev' has no
 member named 'hw_control_configure'
Message-ID: <202303092143.Oi6anuSy-lkp@intel.com>
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
commit: 0080d5983f89364a7cc968f96fc449befedcbfb4 [20/28] net: phy: phy_device: Call into the PHY driver to set LED offload
config: arc-randconfig-r043-20230308 (https://download.01.org/0day-ci/archive/20230309/202303092143.Oi6anuSy-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/0080d5983f89364a7cc968f96fc449befedcbfb4
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout 0080d5983f89364a7cc968f96fc449befedcbfb4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092143.Oi6anuSy-lkp@intel.com/

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
