Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B55FC14
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wsph/4LT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701085219; x=1732621219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Wk4/k1bK8WfCBXncr0HmmGuqJBuxtkTdm8u/WFN4dk=;
  b=Wsph/4LT/SVItMDigOVbmGvCWlJYPkcDY/u7CtHweo2DdiyPp3/taoUs
   a5XGysVJjqDC+apMJGn8IxJlWL87e8l+g8lHyoDwp39hvfXyqU9sxAeUD
   6jxk1hxyypjgeA8zVsHxx8BjrxWADhqsQGzWLe4t7Vm3Z9u04/zYJ0fsD
   r3QjHbLj7TEbcQMl9icZdnlM1HXKDGgTYFqIr4CRGsulIcdZP6BZ+gBOw
   sd4Ul3L2AQZcg/uRoczvJGJAhNKdqeqw0ZbApD9+zzYZjdjret9oez8fr
   qxh6E9IyEDNR0bEEFu75CxyL3HGejI+BnDQtxILgHErURQlc7iA6SU9J3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391556279"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="391556279"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 03:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891720980"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="891720980"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Nov 2023 03:40:16 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7ZyI-0006DX-2S;
	Mon, 27 Nov 2023 11:40:14 +0000
Date: Mon, 27 Nov 2023 19:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.7-rc2-net-next-mv88e6xxx-leds 5/8] net/dsa/dsa.c:570:7:
 error: 'struct led_classdev' has no member named 'hw_control_is_supported'
Message-ID: <202311271806.lQvVfuQ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.7-rc2-net-next-mv88e6xxx-leds
head:   d67635694438025b12dfacb6990b641ed2a55633
commit: 0e2c1c7ed1d6780406f9291e9d94848ac2e04740 [5/8] dsa: Plumb in LED calls needed for hardware offload
config: x86_64-buildonly-randconfig-006-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271806.lQvVfuQ9-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271806.lQvVfuQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271806.lQvVfuQ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/dsa/dsa.c: In function 'dsa_port_led_setup':
>> net/dsa/dsa.c:570:7: error: 'struct led_classdev' has no member named 'hw_control_is_supported'
     570 |   cdev->hw_control_is_supported = dsa_led_hw_control_is_supported;
         |       ^~
>> net/dsa/dsa.c:572:7: error: 'struct led_classdev' has no member named 'hw_control_set'
     572 |   cdev->hw_control_set = dsa_led_hw_control_set;
         |       ^~
>> net/dsa/dsa.c:574:7: error: 'struct led_classdev' has no member named 'hw_control_get'
     574 |   cdev->hw_control_get = dsa_led_hw_control_get;
         |       ^~
>> net/dsa/dsa.c:575:6: error: 'struct led_classdev' has no member named 'hw_control_get_device'
     575 |  cdev->hw_control_get_device = dsa_led_hw_control_get_device;
         |      ^~
>> net/dsa/dsa.c:576:6: error: 'struct led_classdev' has no member named 'hw_control_trigger'
     576 |  cdev->hw_control_trigger = "netdev";
         |      ^~


vim +570 net/dsa/dsa.c

   539	
   540	static int dsa_port_led_setup(struct dsa_port *dp,
   541				      struct device_node *led)
   542	{
   543		struct led_init_data init_data = {};
   544		struct dsa_switch *ds = dp->ds;
   545		struct led_classdev *cdev;
   546		struct dsa_led *dsa_led;
   547		u32 index;
   548		int err;
   549	
   550		dsa_led = devm_kzalloc(ds->dev, sizeof(*dsa_led), GFP_KERNEL);
   551		if (!dsa_led)
   552			return -ENOMEM;
   553	
   554		dsa_led->dp = dp;
   555		cdev = &dsa_led->led_cdev;
   556	
   557		err = of_property_read_u32(led, "reg", &index);
   558		if (err)
   559			return err;
   560		if (index > 255)
   561			return -EINVAL;
   562	
   563		dsa_led->index = index;
   564	
   565		if (ds->ops->led_brightness_set)
   566			cdev->brightness_set_blocking = dsa_led_brightness_set;
   567		if (ds->ops->led_blink_set)
   568			cdev->blink_set = dsa_led_blink_set;
   569		if (ds->ops->led_hw_control_is_supported)
 > 570			cdev->hw_control_is_supported = dsa_led_hw_control_is_supported;
   571		if (ds->ops->led_hw_control_set)
 > 572			cdev->hw_control_set = dsa_led_hw_control_set;
   573		if (ds->ops->led_hw_control_get)
 > 574			cdev->hw_control_get = dsa_led_hw_control_get;
 > 575		cdev->hw_control_get_device = dsa_led_hw_control_get_device;
 > 576		cdev->hw_control_trigger = "netdev";
   577		cdev->max_brightness = 1;
   578	
   579		init_data.fwnode = of_fwnode_handle(led);
   580		if (dp->user) {
   581			init_data.devicename = dev_name(&dp->user->dev);
   582			err = devm_led_classdev_register_ext(&dp->user->dev, cdev,
   583							     &init_data);
   584		} else {
   585			init_data.devicename = kasprintf(GFP_KERNEL, "%s:%d",
   586							 dev_name(ds->dev), dp->index);
   587			err = devm_led_classdev_register_ext(ds->dev, cdev, &init_data);
   588		}
   589		if (err)
   590			return err;
   591	
   592		INIT_LIST_HEAD(&dsa_led->led_list);
   593		list_add(&dsa_led->led_list, &dp->leds);
   594	
   595		if (!dp->user)
   596			kfree(init_data.devicename);
   597	
   598		return 0;
   599	}
   600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
