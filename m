Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC96FCD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680188885; x=1711724885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YDb0zByWPCAjG9V7xIrsrKEo7UnViW+hdwgOHoBXWBg=;
  b=I2mXzbGLgdLv+S/ODWd+cZZ9TcYhI8SAnVaAwGC8/102FiQnoulcvm2w
   OEbM1iNRYKxemFtBt6LT6I2/XLRpwYR/JuVCY4abA5XokDtMn1RcF4cCY
   VOjQM4JzuOVGfbrHs56iUgdGfzoFwhsnWSKPk1JjanOfnoovAyxDqNBc1
   GSK29mbhlNKf6Qu8agId/hOYULGt3Qpypda3oy/7JI3LQFYjBn5VMiin7
   g3qBGEgB/eR5N28QxDj2hoxqwSHkn74qIhO/ZCLc+LLtKy5iWgaBcPI25
   x1RjjVqxnTpf/O2dA+2p7k84hwueWlwhRK8vIyRvx1ai0sfPd4E6ZGwjJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343678989"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="343678989"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 08:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678227400"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="678227400"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 08:05:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phtqf-000Kw2-1l;
	Thu, 30 Mar 2023 15:05:57 +0000
Date: Thu, 30 Mar 2023 23:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v6 05/16] net: phy: Add a binding for PHY LEDs
Message-ID: <202303302228.ADozXwG9-lkp@intel.com>
References: <20230327141031.11904-6-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327141031.11904-6-ansuelsmth@gmail.com>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230327-221554
patch link:    https://lore.kernel.org/r/20230327141031.11904-6-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v6 05/16] net: phy: Add a binding for PHY LEDs
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20230330/202303302228.ADozXwG9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c92f680d5120a9a315ef75d26c0233aa11091a20
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230327-221554
        git checkout c92f680d5120a9a315ef75d26c0233aa11091a20
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303302228.ADozXwG9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phy_device.o: in function `of_phy_led':
>> drivers/net/phy/phy_device.c:3025: undefined reference to `devm_led_classdev_register_ext'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - KS8851 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICREL [=y] && SPI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   Selected by [m]:
   - PHYLINK [=m] && NETDEVICES [=y]
   - AX88796 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_8390 [=y] && (ARM [=y] || MIPS || SUPERH || ZORRO || COMPILE_TEST [=n])
   - R8169 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_REALTEK [=y] && PCI [=y]
   - SMSC911X [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_SMSC [=y] && HAS_IOMEM [=y]
   - USB_NET_AX88179_178A [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m] && USB_USBNET [=m]
   - USB_NET_SMSC95XX [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m] && USB_USBNET [=m]


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
