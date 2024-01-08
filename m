Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8079DE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 05:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9lHNflo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704693094; x=1736229094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G0+RtWaAKD+rXu7OinGTAvpPp8JM44PbkrwFz4nR8K0=;
  b=n9lHNflo/ZXooD500Fm31BlP03+ONj0jmD9hIc9XmCfkqh7IbUTiAmR4
   xrzvjWzlqvmWOotUvuZtPaIzGnklftYi3/G1bChmAbvfhq3z7jDF+QeDl
   PU+vngaCknef7+ZwDAesW1Dwwjv4DJft/u5EKibPo/PYvLGB5jvKHSi+U
   3Xa5BLYw4VJbXVcl1SWKXPfadvNTxbMdsuK9Vu+9H/4sODKWdD529zDpq
   lxKYpOMGlMfb6XFJACMl2zKOqW45XB6RAMhtqjuiV/Mx/HLeQn5DksUpo
   Tf1/ITb/dSYY7sltMu/N7N0cmlwjRihi7ze7rncf/i2mzO+yFFfB0eZaW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4559562"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4559562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 21:51:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="924758395"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="924758395"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2024 21:51:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMiXp-0004TY-1J;
	Mon, 08 Jan 2024 05:51:29 +0000
Date: Mon, 8 Jan 2024 13:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.7-rc6-net-next-mv88e6xxx-leds-v3 6/8]
 net/core/netdev-leds.c:120:13: error: 'struct led_classdev' has no member
 named 'hw_control_get_device'
Message-ID: <202401081323.hMWQAHqt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.7-rc6-net-next-mv88e6xxx-leds-v3
head:   9a48ae1a616c32799d10fcde6a9eea1bbade8496
commit: 3248e132ab2e635e3cb715ec9ff5b5bbcc5f3177 [6/8] dsa: mv88e6xxx: Create port/netdev LEDs
config: loongarch-randconfig-002-20240108 (https://download.01.org/0day-ci/archive/20240108/202401081323.hMWQAHqt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081323.hMWQAHqt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081323.hMWQAHqt-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/netdev-leds.c: In function 'netdev_led_setup':
>> net/core/netdev-leds.c:120:13: error: 'struct led_classdev' has no member named 'hw_control_get_device'
     120 |         cdev->hw_control_get_device = netdev_hw_control_get_device;
         |             ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NETDEV_LEDS
   Depends on [n]: NET [=y] && LEDS_CLASS [=n]=y
   Selected by [m]:
   - NET_DSA_MV88E6XXX [=m] && NETDEVICES [=y] && NET_DSA [=m]


vim +120 net/core/netdev-leds.c

db29c33ae0111af Andrew Lunn 2023-11-30   79  
db29c33ae0111af Andrew Lunn 2023-11-30   80  static int netdev_led_setup(struct net_device *ndev, struct device_node *led,
db29c33ae0111af Andrew Lunn 2023-11-30   81  			    struct list_head *list, struct netdev_leds_ops *ops)
db29c33ae0111af Andrew Lunn 2023-11-30   82  {
db29c33ae0111af Andrew Lunn 2023-11-30   83  	struct led_init_data init_data = {};
db29c33ae0111af Andrew Lunn 2023-11-30   84  	struct device *dev = &ndev->dev;
db29c33ae0111af Andrew Lunn 2023-11-30   85  	struct netdev_led *netdev_led;
db29c33ae0111af Andrew Lunn 2023-11-30   86  	struct led_classdev *cdev;
db29c33ae0111af Andrew Lunn 2023-11-30   87  	u32 index;
db29c33ae0111af Andrew Lunn 2023-11-30   88  	int err;
db29c33ae0111af Andrew Lunn 2023-11-30   89  
db29c33ae0111af Andrew Lunn 2023-11-30   90  	netdev_led = devm_kzalloc(dev, sizeof(*netdev_led), GFP_KERNEL);
db29c33ae0111af Andrew Lunn 2023-11-30   91  	if (!netdev_led)
db29c33ae0111af Andrew Lunn 2023-11-30   92  		return -ENOMEM;
db29c33ae0111af Andrew Lunn 2023-11-30   93  
db29c33ae0111af Andrew Lunn 2023-11-30   94  	netdev_led->ndev = ndev;
db29c33ae0111af Andrew Lunn 2023-11-30   95  	netdev_led->ops = ops;
db29c33ae0111af Andrew Lunn 2023-11-30   96  	cdev = &netdev_led->led_cdev;
db29c33ae0111af Andrew Lunn 2023-11-30   97  
db29c33ae0111af Andrew Lunn 2023-11-30   98  	err = of_property_read_u32(led, "reg", &index);
db29c33ae0111af Andrew Lunn 2023-11-30   99  	if (err)
db29c33ae0111af Andrew Lunn 2023-11-30  100  		return err;
db29c33ae0111af Andrew Lunn 2023-11-30  101  
db29c33ae0111af Andrew Lunn 2023-11-30  102  	if (index > 255)
db29c33ae0111af Andrew Lunn 2023-11-30  103  		return -EINVAL;
db29c33ae0111af Andrew Lunn 2023-11-30  104  
db29c33ae0111af Andrew Lunn 2023-11-30  105  	netdev_led->index = index;
db29c33ae0111af Andrew Lunn 2023-11-30  106  
db29c33ae0111af Andrew Lunn 2023-11-30  107  	if (ops->brightness_set)
db29c33ae0111af Andrew Lunn 2023-11-30  108  		cdev->brightness_set_blocking = netdev_brightness_set;
db29c33ae0111af Andrew Lunn 2023-11-30  109  	if (ops->blink_set)
db29c33ae0111af Andrew Lunn 2023-11-30  110  		cdev->blink_set = netdev_blink_set;
db29c33ae0111af Andrew Lunn 2023-11-30  111  #ifdef CONFIG_LEDS_TRIGGERS
db29c33ae0111af Andrew Lunn 2023-11-30  112  	if (ops->hw_control_is_supported)
db29c33ae0111af Andrew Lunn 2023-11-30  113  		cdev->hw_control_is_supported = netdev_hw_control_is_supported;
db29c33ae0111af Andrew Lunn 2023-11-30  114  	if (ops->hw_control_set)
db29c33ae0111af Andrew Lunn 2023-11-30  115  		cdev->hw_control_set = netdev_hw_control_set;
db29c33ae0111af Andrew Lunn 2023-11-30  116  	if (ops->hw_control_get)
db29c33ae0111af Andrew Lunn 2023-11-30  117  		cdev->hw_control_get = netdev_hw_control_get;
db29c33ae0111af Andrew Lunn 2023-11-30  118  	cdev->hw_control_trigger = "netdev";
db29c33ae0111af Andrew Lunn 2023-11-30  119  #endif
db29c33ae0111af Andrew Lunn 2023-11-30 @120  	cdev->hw_control_get_device = netdev_hw_control_get_device;
db29c33ae0111af Andrew Lunn 2023-11-30  121  	cdev->max_brightness = 1;
db29c33ae0111af Andrew Lunn 2023-11-30  122  	init_data.fwnode = of_fwnode_handle(led);
db29c33ae0111af Andrew Lunn 2023-11-30  123  	init_data.devname_mandatory = true;
db29c33ae0111af Andrew Lunn 2023-11-30  124  
db29c33ae0111af Andrew Lunn 2023-11-30  125  	init_data.devicename = dev_name(dev);
db29c33ae0111af Andrew Lunn 2023-11-30  126  	err = devm_led_classdev_register_ext(dev, cdev, &init_data);
db29c33ae0111af Andrew Lunn 2023-11-30  127  	if (err)
db29c33ae0111af Andrew Lunn 2023-11-30  128  		return err;
db29c33ae0111af Andrew Lunn 2023-11-30  129  
db29c33ae0111af Andrew Lunn 2023-11-30  130  	INIT_LIST_HEAD(&netdev_led->led_list);
db29c33ae0111af Andrew Lunn 2023-11-30  131  	list_add(&netdev_led->led_list, list);
db29c33ae0111af Andrew Lunn 2023-11-30  132  
db29c33ae0111af Andrew Lunn 2023-11-30  133  	return 0;
db29c33ae0111af Andrew Lunn 2023-11-30  134  }
db29c33ae0111af Andrew Lunn 2023-11-30  135  

:::::: The code at line 120 was first introduced by commit
:::::: db29c33ae0111af2fcf8364bb3b3153697893e78 net: Add helpers for netdev LEDs

:::::: TO: Andrew Lunn <andrew@lunn.ch>
:::::: CC: Andrew Lunn <andrew@lunn.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
