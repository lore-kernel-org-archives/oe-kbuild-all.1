Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C90014294
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692279649; x=1723815649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1bD9wcPBGWe7Un6sf5HTl7UZilTo6QI7GzeaDVEBS4s=;
  b=CPg82ICw1bz/6m++CCpbePezHo7vnlYVwYxOaMExD0NcTfKGxwBnyQBe
   OmAVAGzEu8zWMiCeIFfMcdAFVduA5mWxYYdX9ugFHbZuZvN509sYA+HgH
   Fp6i3AKTwFs7ILROZ6xdO0T44R+2WcoCVpPwkh6iUjwfN88UKN5zcj3Tm
   APpmdBpe+RBPlRFT1KuWXRFbGyaBB/BuBJYJwbUK603czivZ4+SDXcRuy
   nq5zRzgmvNSlMbhGDdNEwMbOXXjlLKe1zVNxBZgwHTsdFd7c8W1EE4fdX
   bwW2wr8CXVIABmiyFOHbHTfk1sr3gemKOBw9KSd5wDpMADoAoLsBu8uee
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371717247"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="371717247"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 06:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908411151"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="908411151"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 06:40:43 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWdEw-0001Au-1V;
	Thu, 17 Aug 2023 13:40:42 +0000
Date: Thu, 17 Aug 2023 21:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Cutts <hcutts@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dtor@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 510/6555]
 drivers/hid/hid-logitech-hidpp.c:412: warning: Function parameter or member
 'bit' not described in 'hidpp10_set_register_bit'
Message-ID: <202308172138.IuBgM7UM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 9aa10d76c5e8f38c51035a69de8944db45667900 [510/6555] FROMLIST: Add function to enable HID++ 1.0 "scrolling acceleration"
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230817/202308172138.IuBgM7UM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172138.IuBgM7UM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172138.IuBgM7UM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/hid-logitech-hidpp.c:21:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'hidpp_driver_exit': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1585:1: note: in expansion of macro 'module_exit'
    1585 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/hid.h:869:9: note: in expansion of macro 'module_driver'
     869 |         module_driver(__hid_driver, hid_register_driver, \
         |         ^~~~~~~~~~~~~
   drivers/hid/hid-logitech-hidpp.c:3158:1: note: in expansion of macro 'module_hid_driver'
    3158 | module_hid_driver(hidpp_driver);
         | ^~~~~~~~~~~~~~~~~
   In file included from drivers/hid/hid-logitech-hidpp.c:17:
   drivers/hid/hid-logitech-hidpp.c:3158:19: note: 'cleanup_module' target declared here
    3158 | module_hid_driver(hidpp_driver);
         |                   ^~~~~~~~~~~~
   include/linux/device.h:1581:20: note: in definition of macro 'module_driver'
    1581 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/hid/hid-logitech-hidpp.c:3158:1: note: in expansion of macro 'module_hid_driver'
    3158 | module_hid_driver(hidpp_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'hidpp_driver_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1580:1: note: in expansion of macro 'module_init'
    1580 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/hid.h:869:9: note: in expansion of macro 'module_driver'
     869 |         module_driver(__hid_driver, hid_register_driver, \
         |         ^~~~~~~~~~~~~
   drivers/hid/hid-logitech-hidpp.c:3158:1: note: in expansion of macro 'module_hid_driver'
    3158 | module_hid_driver(hidpp_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/hid/hid-logitech-hidpp.c:3158:19: note: 'init_module' target declared here
    3158 | module_hid_driver(hidpp_driver);
         |                   ^~~~~~~~~~~~
   include/linux/device.h:1576:19: note: in definition of macro 'module_driver'
    1576 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/hid/hid-logitech-hidpp.c:3158:1: note: in expansion of macro 'module_hid_driver'
    3158 | module_hid_driver(hidpp_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/hid/hid-logitech-hidpp.c:447:12: warning: 'hidpp10_enable_scrolling_acceleration' defined but not used [-Wunused-function]
     447 | static int hidpp10_enable_scrolling_acceleration(struct hidpp_device *hidpp_dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-logitech-hidpp.c:224: warning: Function parameter or member 'hidpp' not described in 'hidpp_send_message_sync'
   drivers/hid/hid-logitech-hidpp.c:224: warning: Function parameter or member 'message' not described in 'hidpp_send_message_sync'
   drivers/hid/hid-logitech-hidpp.c:224: warning: Function parameter or member 'response' not described in 'hidpp_send_message_sync'
   drivers/hid/hid-logitech-hidpp.c:371: warning: Function parameter or member 'name' not described in 'hidpp_prefix_name'
   drivers/hid/hid-logitech-hidpp.c:371: warning: Function parameter or member 'name_length' not described in 'hidpp_prefix_name'
>> drivers/hid/hid-logitech-hidpp.c:412: warning: Function parameter or member 'bit' not described in 'hidpp10_set_register_bit'
   drivers/hid/hid-logitech-hidpp.c:1277: warning: Function parameter or member 'hidpp' not described in 'hidpp_touchpad_fw_items_set'
   drivers/hid/hid-logitech-hidpp.c:1277: warning: Function parameter or member 'feature_index' not described in 'hidpp_touchpad_fw_items_set'
   drivers/hid/hid-logitech-hidpp.c:1277: warning: Function parameter or member 'items' not described in 'hidpp_touchpad_fw_items_set'


vim +412 drivers/hid/hid-logitech-hidpp.c

33797820af98cd Benjamin Tissoires 2014-09-30  402  
9aa10d76c5e8f3 Harry Cutts        2018-08-30  403  /**
9aa10d76c5e8f3 Harry Cutts        2018-08-30  404   * hidpp10_set_register_bit() - Sets a single bit in a HID++ 1.0 register.
9aa10d76c5e8f3 Harry Cutts        2018-08-30  405   * @hidpp_dev: the device to set the register on.
9aa10d76c5e8f3 Harry Cutts        2018-08-30  406   * @register_address: the address of the register to modify.
9aa10d76c5e8f3 Harry Cutts        2018-08-30  407   * @byte: the byte of the register to modify. Should be less than 3.
9aa10d76c5e8f3 Harry Cutts        2018-08-30  408   * Return: 0 if successful, otherwise a negative error code.
9aa10d76c5e8f3 Harry Cutts        2018-08-30  409   */
9aa10d76c5e8f3 Harry Cutts        2018-08-30  410  static int hidpp10_set_register_bit(struct hidpp_device *hidpp_dev,
9aa10d76c5e8f3 Harry Cutts        2018-08-30  411  	u8 register_address, u8 byte, u8 bit)
7f7ce2a258b47f Benjamin Tissoires 2017-03-27 @412  {
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  413  	struct hidpp_report response;
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  414  	int ret;
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  415  	u8 params[3] = { 0 };
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  416  
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  417  	ret = hidpp_send_rap_command_sync(hidpp_dev,
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  418  					  REPORT_ID_HIDPP_SHORT,
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  419  					  HIDPP_GET_REGISTER,
9aa10d76c5e8f3 Harry Cutts        2018-08-30  420  					  register_address,
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  421  					  NULL, 0, &response);
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  422  	if (ret)
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  423  		return ret;
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  424  
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  425  	memcpy(params, response.rap.params, 3);
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  426  
9aa10d76c5e8f3 Harry Cutts        2018-08-30  427  	params[byte] |= BIT(bit);
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  428  
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  429  	return hidpp_send_rap_command_sync(hidpp_dev,
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  430  					   REPORT_ID_HIDPP_SHORT,
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  431  					   HIDPP_SET_REGISTER,
9aa10d76c5e8f3 Harry Cutts        2018-08-30  432  					   register_address,
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  433  					   params, 3, &response);
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  434  }
7f7ce2a258b47f Benjamin Tissoires 2017-03-27  435  
9aa10d76c5e8f3 Harry Cutts        2018-08-30  436  
9aa10d76c5e8f3 Harry Cutts        2018-08-30  437  #define HIDPP_REG_GENERAL				0x00
9aa10d76c5e8f3 Harry Cutts        2018-08-30  438  
9aa10d76c5e8f3 Harry Cutts        2018-08-30  439  static int hidpp10_enable_battery_reporting(struct hidpp_device *hidpp_dev)
9aa10d76c5e8f3 Harry Cutts        2018-08-30  440  {
9aa10d76c5e8f3 Harry Cutts        2018-08-30  441  	return hidpp10_set_register_bit(hidpp_dev, HIDPP_REG_GENERAL, 0, 4);
9aa10d76c5e8f3 Harry Cutts        2018-08-30  442  }
9aa10d76c5e8f3 Harry Cutts        2018-08-30  443  
9aa10d76c5e8f3 Harry Cutts        2018-08-30  444  #define HIDPP_REG_FEATURES				0x01
9aa10d76c5e8f3 Harry Cutts        2018-08-30  445  
9aa10d76c5e8f3 Harry Cutts        2018-08-30  446  /* On HID++ 1.0 devices, high-res scroll was called "scrolling acceleration". */
9aa10d76c5e8f3 Harry Cutts        2018-08-30 @447  static int hidpp10_enable_scrolling_acceleration(struct hidpp_device *hidpp_dev)
9aa10d76c5e8f3 Harry Cutts        2018-08-30  448  {
9aa10d76c5e8f3 Harry Cutts        2018-08-30  449  	return hidpp10_set_register_bit(hidpp_dev, HIDPP_REG_FEATURES, 0, 6);
9aa10d76c5e8f3 Harry Cutts        2018-08-30  450  }
9aa10d76c5e8f3 Harry Cutts        2018-08-30  451  

:::::: The code at line 412 was first introduced by commit
:::::: 7f7ce2a258b47f9510ad613328c046a3ff9426b0 HID: logitech-hidpp: enable HID++ 1.0 battery reporting

:::::: TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
