Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E62584
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679519522; x=1711055522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eSiPEhiD3eyWx6BdNjKRIt3tdE6FmjeGhOTRrf8+4/4=;
  b=RtXKyA6r1TKxvH5VqL1LXC+cT9cYPlBz0nM/eI/7atOyiHhXt0VgTOHL
   yXzclQN2McpCNvGzk7hcj17gSj+tGpq4HfRe+zMCW2V00AUiumbv5hQUV
   smacTf8hVJk7TI07VFLrNHRQV1+OnRlWFcHOb0vsoxhYttksCcrZJua3T
   VF93RO6cFPAG+oZ4s6UzqbtxvbciJUX8O3j4Zyx5nNagAN871V2c0sjx/
   RF9sqP3xoI/duR5kBZryD5bTwCDpdyCHjgUh9wFOW4Wy4Rn4IPhChyqDZ
   +E+7eItH7IxzMyHyC49WOX/19QwIalZQQBuBOe+ak52tkA1lcIlpqt5S2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336840847"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="336840847"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 14:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632120583"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="632120583"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Mar 2023 14:12:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf5kQ-000Df0-1X;
	Wed, 22 Mar 2023 21:11:54 +0000
Date: Thu, 23 Mar 2023 05:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:v6.3-rc2-net-next-phy-leds 5/15]
 drivers/net/phy/phy_device.c:3025: undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202303230542.PH58J4P2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc2-net-next-phy-leds
head:   31990696068654b2fc49ca6be815e8a07f5eb30c
commit: 152381bd1930ab5201b26cceccad9ee422f287e7 [5/15] net: phy: Add a binding for PHY LEDs
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230323/202303230542.PH58J4P2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/lunn/linux/commit/152381bd1930ab5201b26cceccad9ee422f287e7
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc2-net-next-phy-leds
        git checkout 152381bd1930ab5201b26cceccad9ee422f287e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230542.PH58J4P2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/phy/phy_device.o: in function `of_phy_led':
>> drivers/net/phy/phy_device.c:3025: undefined reference to `devm_led_classdev_register_ext'


vim +3025 drivers/net/phy/phy_device.c

  3000	
  3001	static int of_phy_led(struct phy_device *phydev,
  3002			      struct device_node *led)
  3003	{
  3004		struct device *dev = &phydev->mdio.dev;
  3005		struct led_init_data init_data = {};
  3006		struct led_classdev *cdev;
  3007		struct phy_led *phyled;
  3008		int err;
  3009	
  3010		phyled = devm_kzalloc(dev, sizeof(*phyled), GFP_KERNEL);
  3011		if (!phyled)
  3012			return -ENOMEM;
  3013	
  3014		cdev = &phyled->led_cdev;
  3015	
  3016		err = of_property_read_u32(led, "reg", &phyled->index);
  3017		if (err)
  3018			return err;
  3019	
  3020		cdev->brightness_set_blocking = phy_led_set_brightness;
  3021		cdev->max_brightness = 1;
  3022		init_data.devicename = dev_name(&phydev->mdio.dev);
  3023		init_data.fwnode = of_fwnode_handle(led);
  3024	
> 3025		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3026		if (err)
  3027			return err;
  3028	
  3029		list_add(&phyled->list, &phydev->leds);
  3030	
  3031		return 0;
  3032	}
  3033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
