Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117318F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 04:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682916300; x=1714452300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XgPObTuXz7af82Hphod/r+iwzu4A/XGPKgPESAW/T2E=;
  b=MCDirliIJSOIMkqAsW1ydUN564yZw2bd/3y9T5eKBLwoe3ZFtjOb74X3
   92G2i1hCcbpwMr5T41nFkHPgaX9Kaom/FhsYkZq9qgOC5XGShxiLxVa2m
   yT8nf9jWFpb9SAoeE8aBSvq1rZE3S/ljmBjLiNHiIo/uxkoZ6tkaJR/HL
   9itBw8K5X6iSaWFhrN23QuknCqquovaI2AcV/zAome9jgE4frXYuIuWGU
   iy6cqJXTU5/I9ZoCHD7kRNwCdZ7kk56mOiIrUf3LFpBY1hi4cCHBYURKI
   B5S7tKKcY3IF/CTmwUaJc0p3FHiepP5qgYekQxF1+9nlBWcFZrL1DLwNv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="328438789"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="328438789"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 21:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870059520"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="870059520"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Apr 2023 21:44:58 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptLPF-0000JF-18;
	Mon, 01 May 2023 04:44:57 +0000
Date: Mon, 1 May 2023 12:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:leds-offload-support-reduced-auto-netdev 15/21]
 drivers/leds/led-class.c:362:43: error: 'struct led_classdev' has no member
 named 'fwnode'; did you mean 'node'?
Message-ID: <202305011246.DbARkgUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git leds-offload-support-reduced-auto-netdev
head:   f1ffe7d8f875fe17f996d112a87846ad06e9eab3
commit: ff5cab2905c761adcb9d203303c5d4bd48e0aab9 [15/21] drivers: led: led-class: Keep fwnode from init_data for triggers
config: i386-randconfig-a004-20230501 (https://download.01.org/0day-ci/archive/20230501/202305011246.DbARkgUD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/lunn/linux/commit/ff5cab2905c761adcb9d203303c5d4bd48e0aab9
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn leds-offload-support-reduced-auto-netdev
        git checkout ff5cab2905c761adcb9d203303c5d4bd48e0aab9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011246.DbARkgUD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/led-class.c: In function 'led_classdev_register_ext':
>> drivers/leds/led-class.c:362:43: error: 'struct led_classdev' has no member named 'fwnode'; did you mean 'node'?
     362 |                                 led_cdev->fwnode = init_data->fwnode;
         |                                           ^~~~~~
         |                                           node


vim +362 drivers/leds/led-class.c

   326	
   327	/**
   328	 * led_classdev_register_ext - register a new object of led_classdev class
   329	 *			       with init data.
   330	 *
   331	 * @parent: parent of LED device
   332	 * @led_cdev: the led_classdev structure for this device.
   333	 * @init_data: LED class device initialization data
   334	 */
   335	int led_classdev_register_ext(struct device *parent,
   336				      struct led_classdev *led_cdev,
   337				      struct led_init_data *init_data)
   338	{
   339		char composed_name[LED_MAX_NAME_SIZE];
   340		char final_name[LED_MAX_NAME_SIZE];
   341		const char *proposed_name = composed_name;
   342		int ret;
   343	
   344		if (init_data) {
   345			if (init_data->devname_mandatory && !init_data->devicename) {
   346				dev_err(parent, "Mandatory device name is missing");
   347				return -EINVAL;
   348			}
   349			ret = led_compose_name(parent, init_data, composed_name);
   350			if (ret < 0)
   351				return ret;
   352	
   353			if (init_data->fwnode) {
   354				fwnode_property_read_string(init_data->fwnode,
   355					"linux,default-trigger",
   356					&led_cdev->default_trigger);
   357	
   358				if (fwnode_property_present(init_data->fwnode,
   359							    "retain-state-shutdown"))
   360					led_cdev->flags |= LED_RETAIN_AT_SHUTDOWN;
   361				if (IS_ENABLED(CONFIG_LEDS_TRIGGERS))
 > 362					led_cdev->fwnode = init_data->fwnode;
   363			}
   364		} else {
   365			proposed_name = led_cdev->name;
   366		}
   367	
   368		ret = led_classdev_next_name(proposed_name, final_name, sizeof(final_name));
   369		if (ret < 0)
   370			return ret;
   371	
   372		mutex_init(&led_cdev->led_access);
   373		mutex_lock(&led_cdev->led_access);
   374		led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
   375					led_cdev, led_cdev->groups, "%s", final_name);
   376		if (IS_ERR(led_cdev->dev)) {
   377			mutex_unlock(&led_cdev->led_access);
   378			return PTR_ERR(led_cdev->dev);
   379		}
   380		if (init_data && init_data->fwnode)
   381			device_set_node(led_cdev->dev, init_data->fwnode);
   382	
   383		if (ret)
   384			dev_warn(parent, "Led %s renamed to %s due to name collision",
   385					proposed_name, dev_name(led_cdev->dev));
   386	
   387		if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
   388			ret = led_add_brightness_hw_changed(led_cdev);
   389			if (ret) {
   390				device_unregister(led_cdev->dev);
   391				led_cdev->dev = NULL;
   392				mutex_unlock(&led_cdev->led_access);
   393				return ret;
   394			}
   395		}
   396	
   397		led_cdev->work_flags = 0;
   398	#ifdef CONFIG_LEDS_TRIGGERS
   399		init_rwsem(&led_cdev->trigger_lock);
   400	#endif
   401	#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
   402		led_cdev->brightness_hw_changed = -1;
   403	#endif
   404		/* add to the list of leds */
   405		down_write(&leds_list_lock);
   406		list_add_tail(&led_cdev->node, &leds_list);
   407		up_write(&leds_list_lock);
   408	
   409		if (!led_cdev->max_brightness)
   410			led_cdev->max_brightness = LED_FULL;
   411	
   412		led_update_brightness(led_cdev);
   413	
   414		led_init_core(led_cdev);
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
