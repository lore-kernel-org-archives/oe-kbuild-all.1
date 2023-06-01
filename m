Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E2111F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 04:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685594044; x=1717130044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cv9zAh7TPPde2yzpM6VfL7dtnaSyd09QHAeXf1iFgjg=;
  b=WekQ67XqfFMBjvaIEI0WjCI4rl6Mwi/dWGnNDTfO8zBKyDs6AA0D83QP
   EKRvSsuKxG+QH36kTGzd66OILIuLI4fR8VvHL6NCOwDdrR5RZk6t5r5Ab
   7t9gfTCbyQqGZCJCqi7JEbZOhHQ6NFdZ1Tk3ZRf/mz3XegTzU02STKefR
   lCWCaKQYVBN4x9rtu6fvMFlO2RjOofkYLODEjjSKf8sw1Go+L0Moa1540
   fF8Z4EseQlJHVMXAfC/mKwO32tkPhmUyqVlUaCQtTi3UCshOaFH/E60kI
   0gAALfcfa5rXM+Ar5+bsltb0aHucZXope30+uqpUU6G6HRrRS/Ea0DOrK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="355457060"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="355457060"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 21:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="881464356"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="881464356"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 May 2023 21:34:00 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4a0e-0001uR-0v;
	Thu, 01 Jun 2023 04:34:00 +0000
Date: Thu, 1 Jun 2023 12:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/10]
 include/linux/led-class-multicolor.h:74: undefined reference to
 `devm_led_classdev_multicolor_register_ext'
Message-ID: <202306011243.MYOdsPG1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   45b8bb886df7422b136ba2703469302d9310974f
commit: c3336b229d33938c45da272589c68a3e66505fbd [2/10] UPSTREAM: HID: playstation: expose DualSense lightbar through a multi-color LED.
config: i386-randconfig-i001-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011243.MYOdsPG1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout c3336b229d33938c45da272589c68a3e66505fbd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011243.MYOdsPG1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-playstation.o: in function `devm_led_classdev_multicolor_register':
>> include/linux/led-class-multicolor.h:74: undefined reference to `devm_led_classdev_multicolor_register_ext'
   ld: drivers/hid/hid-playstation.o: in function `dualsense_lightbar_set_brightness':
>> drivers/hid/hid-playstation.c:816: undefined reference to `led_mc_calc_color_components'


vim +74 include/linux/led-class-multicolor.h

55d5d3b46b08a4 Dan Murphy 2020-07-16  62  
55d5d3b46b08a4 Dan Murphy 2020-07-16  63  /* Calculate brightness for the monochrome LED cluster */
55d5d3b46b08a4 Dan Murphy 2020-07-16  64  int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
55d5d3b46b08a4 Dan Murphy 2020-07-16  65  				 enum led_brightness brightness);
55d5d3b46b08a4 Dan Murphy 2020-07-16  66  
55d5d3b46b08a4 Dan Murphy 2020-07-16  67  int devm_led_classdev_multicolor_register_ext(struct device *parent,
55d5d3b46b08a4 Dan Murphy 2020-07-16  68  					  struct led_classdev_mc *mcled_cdev,
55d5d3b46b08a4 Dan Murphy 2020-07-16  69  					  struct led_init_data *init_data);
55d5d3b46b08a4 Dan Murphy 2020-07-16  70  
55d5d3b46b08a4 Dan Murphy 2020-07-16  71  static inline int devm_led_classdev_multicolor_register(struct device *parent,
55d5d3b46b08a4 Dan Murphy 2020-07-16  72  				     struct led_classdev_mc *mcled_cdev)
55d5d3b46b08a4 Dan Murphy 2020-07-16  73  {
55d5d3b46b08a4 Dan Murphy 2020-07-16 @74  	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
55d5d3b46b08a4 Dan Murphy 2020-07-16  75  							 NULL);
55d5d3b46b08a4 Dan Murphy 2020-07-16  76  }
55d5d3b46b08a4 Dan Murphy 2020-07-16  77  

:::::: The code at line 74 was first introduced by commit
:::::: 55d5d3b46b08a4dc0b05343d24640744e7430ed7 leds: multicolor: Introduce a multicolor class definition

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Pavel Machek <pavel@ucw.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
