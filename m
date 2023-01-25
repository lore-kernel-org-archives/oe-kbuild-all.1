Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AB023C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 13:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674651988; x=1706187988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1mqywrJMeeZYtMk3BB+H3FwoqOF0jCFCdHv1yVtRogc=;
  b=Q3uZSLTKOf5toaMJPD7qMIOIUh0G0FcuT1LcAeLNEtxeCyuzNCPRmdHB
   qkwd6fyC6Ss8MhIkDugDNzqHjZt7xFwOpJaHjbVYL+qiwCa0ddH/yUn/4
   Q/AY+twHi2gCaFzlGO+ki1TOxLIpEpJGa4CZCgb9r4bfGC9qGUmHPb8cY
   9fEeynljT3hLq7jB6TdElUYJv71WBLIdje0OFHhHdqiQngjnoXAqRE8yg
   2sdzW8NJjVQvwmEJeiuE8eRce8tQYUr5M2RZfAem0uldb407kAUIVD7iO
   ILVRRbIsqCOXGCCX+zwml11Qqw9f0+mJYvaK+rc2CRGyX9AKcAtKmqzz7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="326577219"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="326577219"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 05:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="694728274"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="694728274"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Jan 2023 05:06:11 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKfTf-0007JY-0L;
	Wed, 25 Jan 2023 13:06:11 +0000
Date: Wed, 25 Jan 2023 21:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 5/13]
 drivers/hid/hid-playstation.c:816: undefined reference to
 `led_mc_calc_color_components'
Message-ID: <202301252121.lxM3hnvQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   56c8a404365f8d4733f82456bea32b4f832e0954
commit: e1cd3ffe478871deb44f1ce2fbe6a6c8e7e08ab3 [5/13] UPSTREAM: HID: playstation: expose DualSense lightbar through a multi-color LED.
config: x86_64-randconfig-c022-20230123 (https://download.01.org/0day-ci/archive/20230125/202301252121.lxM3hnvQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.10
        git checkout e1cd3ffe478871deb44f1ce2fbe6a6c8e7e08ab3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-playstation.o: in function `dualsense_lightbar_set_brightness':
>> drivers/hid/hid-playstation.c:816: undefined reference to `led_mc_calc_color_components'
   ld: drivers/hid/hid-playstation.o: in function `devm_led_classdev_multicolor_register':
>> include/linux/led-class-multicolor.h:74: undefined reference to `devm_led_classdev_multicolor_register_ext'


vim +816 drivers/hid/hid-playstation.c

   808	
   809	static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
   810		enum led_brightness brightness)
   811	{
   812		struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
   813		struct dualsense *ds = container_of(mc_cdev, struct dualsense, lightbar);
   814		uint8_t red, green, blue;
   815	
 > 816		led_mc_calc_color_components(mc_cdev, brightness);
   817		red = mc_cdev->subled_info[0].brightness;
   818		green = mc_cdev->subled_info[1].brightness;
   819		blue = mc_cdev->subled_info[2].brightness;
   820	
   821		dualsense_set_lightbar(ds, red, green, blue);
   822		return 0;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
