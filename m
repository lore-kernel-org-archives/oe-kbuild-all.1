Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010063205
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 23:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675639602; x=1707175602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1V4dxvxYPWJLKhjav2G7Ki5MQ6D8QAHHmSONm4DCbo=;
  b=WQY0F9caP8ojDOBnpmv1QaW5iJavgeMFENaux3l2d6e9RhBxLHcQVi1D
   DilQPxomoT5DKt636nFS4BypK4+24OrX6Lb/4egpk9gXbZfiecMQsTSX/
   21rllQbh7vG/ObOJg+8zb74iS+tzILzQrc3UpHDeD2GhWfCsO1pc9ZPKg
   /C5LiogQl5Lh4I5c2f5i8iNw05CkOWOGEKVD2qsqAn0GtU838mNtKgSQ4
   VLZhgRf1pY2ugc72M4wq49QsajAGynRgo5VObOcngZZ29ByAg47JOXoH7
   EeaNPja8YqcmKWh+a68DOdGVcNsp4KPdT/3C2994xXZVAqxDkjmgikjVn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309434120"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309434120"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 15:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="696700383"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="696700383"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Feb 2023 15:26:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOoP9-0002HQ-0b;
	Sun, 05 Feb 2023 23:26:39 +0000
Date: Mon, 6 Feb 2023 07:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.2-rc 35/49]
 drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:49: error: no member
 named 'led_cdev' in 'struct mt76_dev'
Message-ID: <202302060710.31iQEFDP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.2-rc
head:   7b762fb36d61497f9270342420834474ce31f898
commit: 9c9893a3a118d09cdb6d27060894676898dba058 [35/49] wifi: mt76: move leds field in leds struct
config: x86_64-randconfig-a001-20230206 (https://download.01.org/0day-ci/archive/20230206/202302060710.31iQEFDP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/frank-w/BPI-R2-4.14/commit/9c9893a3a118d09cdb6d27060894676898dba058
        git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R2-4.14
        git fetch --no-tags frank-w-bpi-r2-4.14 6.2-rc
        git checkout 9c9893a3a118d09cdb6d27060894676898dba058
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:49: error: no member named 'led_cdev' in 'struct mt76_dev'
           mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
           static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:299:74: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                            ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:9: error: no member named 'led_cdev' in 'mt76_dev'
           mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
                  ^                                       ~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
           ((type *)(__mptr - offsetof(type, member))); })
                              ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:7: error: assigning to 'struct mt76_dev *' from incompatible type 'void'
           mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:68:16: error: no member named 'led_al' in 'struct mt76_dev'
           if (dev->mt76.led_al)
               ~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:264:17: error: no member named 'led_pin' in 'struct mt76_dev'
                   i = dev->mt76.led_pin ? MT_LED_GPIO_MUX3 : MT_LED_GPIO_MUX2;
                       ~~~~~~~~~ ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:790:13: error: no member named 'led_cdev' in 'struct mt76_dev'
                   dev->mt76.led_cdev.brightness_set = mt7996_led_set_brightness;
                   ~~~~~~~~~ ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:791:13: error: no member named 'led_cdev' in 'struct mt76_dev'
                   dev->mt76.led_cdev.blink_set = mt7996_led_set_blink;
                   ~~~~~~~~~ ^
   7 errors generated.


vim +52 drivers/net/wireless/mediatek/mt76/mt7996/init.c

98686cd21624c7 Shayne Chen 2022-11-22  44  
98686cd21624c7 Shayne Chen 2022-11-22  45  static void mt7996_led_set_config(struct led_classdev *led_cdev,
98686cd21624c7 Shayne Chen 2022-11-22  46  				  u8 delay_on, u8 delay_off)
98686cd21624c7 Shayne Chen 2022-11-22  47  {
98686cd21624c7 Shayne Chen 2022-11-22  48  	struct mt7996_dev *dev;
98686cd21624c7 Shayne Chen 2022-11-22  49  	struct mt76_dev *mt76;
98686cd21624c7 Shayne Chen 2022-11-22  50  	u32 val;
98686cd21624c7 Shayne Chen 2022-11-22  51  
98686cd21624c7 Shayne Chen 2022-11-22 @52  	mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
98686cd21624c7 Shayne Chen 2022-11-22  53  	dev = container_of(mt76, struct mt7996_dev, mt76);
98686cd21624c7 Shayne Chen 2022-11-22  54  
98686cd21624c7 Shayne Chen 2022-11-22  55  	/* select TX blink mode, 2: only data frames */
98686cd21624c7 Shayne Chen 2022-11-22  56  	mt76_rmw_field(dev, MT_TMAC_TCR0(0), MT_TMAC_TCR0_TX_BLINK, 2);
98686cd21624c7 Shayne Chen 2022-11-22  57  
98686cd21624c7 Shayne Chen 2022-11-22  58  	/* enable LED */
98686cd21624c7 Shayne Chen 2022-11-22  59  	mt76_wr(dev, MT_LED_EN(0), 1);
98686cd21624c7 Shayne Chen 2022-11-22  60  
98686cd21624c7 Shayne Chen 2022-11-22  61  	/* set LED Tx blink on/off time */
98686cd21624c7 Shayne Chen 2022-11-22  62  	val = FIELD_PREP(MT_LED_TX_BLINK_ON_MASK, delay_on) |
98686cd21624c7 Shayne Chen 2022-11-22  63  	      FIELD_PREP(MT_LED_TX_BLINK_OFF_MASK, delay_off);
98686cd21624c7 Shayne Chen 2022-11-22  64  	mt76_wr(dev, MT_LED_TX_BLINK(0), val);
98686cd21624c7 Shayne Chen 2022-11-22  65  
98686cd21624c7 Shayne Chen 2022-11-22  66  	/* control LED */
98686cd21624c7 Shayne Chen 2022-11-22  67  	val = MT_LED_CTRL_BLINK_MODE | MT_LED_CTRL_KICK;
98686cd21624c7 Shayne Chen 2022-11-22 @68  	if (dev->mt76.led_al)
98686cd21624c7 Shayne Chen 2022-11-22  69  		val |= MT_LED_CTRL_POLARITY;
98686cd21624c7 Shayne Chen 2022-11-22  70  
98686cd21624c7 Shayne Chen 2022-11-22  71  	mt76_wr(dev, MT_LED_CTRL(0), val);
98686cd21624c7 Shayne Chen 2022-11-22  72  	mt76_clear(dev, MT_LED_CTRL(0), MT_LED_CTRL_KICK);
98686cd21624c7 Shayne Chen 2022-11-22  73  }
98686cd21624c7 Shayne Chen 2022-11-22  74  

:::::: The code at line 52 was first introduced by commit
:::::: 98686cd21624c75a043e96812beadddf4f6f48e5 wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices

:::::: TO: Shayne Chen <shayne.chen@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
