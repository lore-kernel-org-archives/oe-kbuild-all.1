Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857303B798
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSRupGzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701779382; x=1733315382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uy0JjbUhr9AN4cZOKVcWcb17pB/FQmQsUQLHn0ov5uU=;
  b=OSRupGzESNgQQdbn+LHWr1kqPO3mrbe2Tj4Ekd601TpCF1E3kQ3EJDgA
   JXEOc7NFaHm2+xuDuPALLZlMJNMC2J3xvjrFcADdSlfCADBsP2EyMQYCO
   h+JwHGKB4QF0g86zqSi18GxAB8O5t9eQMvQwxmFCbArqhmO8b3js77XCR
   HZCFcZ7C7TdXtHJjx/0Yzcw7ebITu1dcNfNfwgxcSMvtja97XPC4Faju1
   Np6/jBPaCN2JStuAcIWx+pw5sSlfrBjrck3wFbodSnVrrbkKEWyOsgxjT
   Lc/HKc42U4iu+woWAX6UUrXEu4uY4IBLik74v3sj31IN3pz+Pl/7neYY7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="391048706"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="391048706"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:29:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="805262969"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="805262969"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Dec 2023 04:29:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUYT-0008xW-2i;
	Tue, 05 Dec 2023 12:29:37 +0000
Date: Tue, 5 Dec 2023 20:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.7-rc2-net-next-mv88e6xxx-leds-v2 2/7]
 net/switchdev/port_leds.c:129:6: error: 'struct led_classdev' has no member
 named 'hw_control_get_device'
Message-ID: <202312052049.ZFJTo5Lm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.7-rc2-net-next-mv88e6xxx-leds-v2
head:   f53b44745216770b0b090aa7a1def08f267575ac
commit: 2d3288f4a81b362c674699749ec6f017910d4a49 [2/7] net: switchdev: Add helpers for port LEDs.
config: i386-randconfig-002-20231205 (https://download.01.org/0day-ci/archive/20231205/202312052049.ZFJTo5Lm-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052049.ZFJTo5Lm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052049.ZFJTo5Lm-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/switchdev/port_leds.c: In function 'port_led_setup':
>> net/switchdev/port_leds.c:129:6: error: 'struct led_classdev' has no member named 'hw_control_get_device'
     cdev->hw_control_get_device = port_hw_control_get_device;
         ^~


vim +129 net/switchdev/port_leds.c

    86	
    87	static int port_led_setup(struct device_node *led, struct device *dev,
    88				  struct list_head *list, void *priv, int port,
    89				  struct port_leds_ops *ops)
    90	{
    91		struct led_init_data init_data = {};
    92		struct led_classdev *cdev;
    93		struct port_led *port_led;
    94		u32 index;
    95		int err;
    96	
    97		port_led = devm_kzalloc(dev, sizeof(*port_led), GFP_KERNEL);
    98		if (!port_led)
    99			return -ENOMEM;
   100	
   101		port_led->dev = dev;
   102		port_led->priv = priv;
   103		port_led->port = port;
   104		port_led->ops = ops;
   105		cdev = &port_led->led_cdev;
   106	
   107		err = of_property_read_u32(led, "reg", &index);
   108		if (err)
   109			return err;
   110	
   111		if (index > 255)
   112			return -EINVAL;
   113	
   114		port_led->index = index;
   115	
   116		if (ops->brightness_set)
   117			cdev->brightness_set_blocking = port_brightness_set;
   118		if (ops->blink_set)
   119			cdev->blink_set = port_blink_set;
   120	#ifdef CONFIG_LEDS_TRIGGERS
   121		if (ops->hw_control_is_supported)
   122			cdev->hw_control_is_supported = port_hw_control_is_supported;
   123		if (ops->hw_control_set)
   124			cdev->hw_control_set = port_hw_control_set;
   125		if (ops->hw_control_get)
   126			cdev->hw_control_get = port_hw_control_get;
   127		cdev->hw_control_trigger = "netdev";
   128	#endif
 > 129		cdev->hw_control_get_device = port_hw_control_get_device;
   130		cdev->max_brightness = 1;
   131		init_data.fwnode = of_fwnode_handle(led);
   132		init_data.devname_mandatory = true;
   133	
   134		init_data.devicename = dev_name(dev);
   135		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
   136		if (err)
   137			return err;
   138	
   139		INIT_LIST_HEAD(&port_led->led_list);
   140		list_add(&port_led->led_list, list);
   141	
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
