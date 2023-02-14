Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D9FC5F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676405363; x=1707941363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wLfNUHX5Ckyad8Etj2qX/K0k4IP5wROcr1fhDR1iFag=;
  b=WTEtIH9a0Wv4dnFf+n2fRXwnZJ+QoYH98hPsrXC4dA79/S3+MGsZm5Cp
   0elsF8EFk1KG1AtD8zAvnovDWq2y9WlH4uj9iVeZsG1gfQriW26mItDVZ
   SCzE45MIA6+9D7YejZDBHK6n+PYHRBslCdgfDYzIJI0GYUdOutX4uOBPK
   o64igsRT/PewsibYhwiJvOJcURkcV5YL/Sl8vnRvTL/O9/xixFBv6TF7O
   pXqxUDedcNakX6FLFUO8NGAadMZ2rI2fDM3TzXyoEmWLve+5ZG2+cus9W
   hn+T8emyejt9yXT/3r/ce/zCEgYsfjkWouIT2MeqQrDhBQ1sdYynpi8Bo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333391502"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="333391502"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 12:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758117662"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="758117662"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2023 12:09:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS1c8-0008lZ-2c;
	Tue, 14 Feb 2023 20:09:20 +0000
Date: Wed, 15 Feb 2023 04:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.2-rc 35/50]
 include/linux/container_of.h:20:54: error: 'struct mt76_dev' has no member
 named 'led_cdev'
Message-ID: <202302150351.OahPBjAz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.2-rc
head:   160aa4f55cd79fbd22c1d2ab789b044a2d38ab46
commit: 9c9893a3a118d09cdb6d27060894676898dba058 [35/50] wifi: mt76: move leds field in leds struct
config: alpha-randconfig-r036-20230212 (https://download.01.org/0day-ci/archive/20230215/202302150351.OahPBjAz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/frank-w/BPI-R2-4.14/commit/9c9893a3a118d09cdb6d27060894676898dba058
        git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R2-4.14
        git fetch --no-tags frank-w-bpi-r2-4.14 6.2-rc
        git checkout 9c9893a3a118d09cdb6d27060894676898dba058
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/mt7996/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150351.OahPBjAz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/wireless/mediatek/mt76/mt7996/init.c:6:
   drivers/net/wireless/mediatek/mt76/mt7996/init.c: In function 'mt7996_led_set_config':
>> include/linux/container_of.h:20:54: error: 'struct mt76_dev' has no member named 'led_cdev'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:16: note: in expansion of macro 'container_of'
      52 |         mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
         |                ^~~~~~~~~~~~
   include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:16: note: in expansion of macro 'container_of'
      52 |         mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
         |                ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/limits.h:6,
                    from include/linux/kernel.h:16:
>> include/linux/stddef.h:16:33: error: 'struct mt76_dev' has no member named 'led_cdev'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:16: note: in expansion of macro 'container_of'
      52 |         mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
         |                ^~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:68:22: error: 'struct mt76_dev' has no member named 'led_al'
      68 |         if (dev->mt76.led_al)
         |                      ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c: In function 'mt7996_mac_init':
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:264:30: error: 'struct mt76_dev' has no member named 'led_pin'
     264 |                 i = dev->mt76.led_pin ? MT_LED_GPIO_MUX3 : MT_LED_GPIO_MUX2;
         |                              ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c: In function 'mt7996_register_device':
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:790:26: error: 'struct mt76_dev' has no member named 'led_cdev'
     790 |                 dev->mt76.led_cdev.brightness_set = mt7996_led_set_brightness;
         |                          ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:791:26: error: 'struct mt76_dev' has no member named 'led_cdev'
     791 |                 dev->mt76.led_cdev.blink_set = mt7996_led_set_blink;
         |                          ^


vim +20 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
7376e561fd2e01 Sakari Ailus     2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  19  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08 @20  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  21  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  22  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  24  

:::::: The code at line 20 was first introduced by commit
:::::: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: switch to static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
