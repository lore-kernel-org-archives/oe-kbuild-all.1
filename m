Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9948B1DFF5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708299366; cv=none; b=crStmFT6Xf16Tt70I0MszkH7FH+X7ycvTE8tJd5VELGg0gT/Xwvfj6Ft4J2QziQe1FJg8p6K5mT8l+0C2skjFIqCHqcLZNl+Lplpuhy7GxgqyD517RNHKJFzrfv2ouwa5wgbF+VoC9P5cohiRr2hWnmeHgADoamhjhwwKPe3bI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708299366; c=relaxed/simple;
	bh=Ilf4xRtWBZc73+6bC7oHx3Kx7SFIY79rYuOgQNt5qj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsewSXzu2GPHP6nE15nhY+sqwcLWYhbUGB9d/W9h+wkZk9XvqDH6sQORHas55iSQyvkaQVFpXTrd3W3q/YLimpzhsCT1PNXY0A55VR3pwalmiWM5RD3ziYA4QfxMBSKCt1txGXPzB1IiDZJhOkpw4LZMWWBpKbQbt6diq3gtToo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkQw2nyB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkQw2nyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708299364; x=1739835364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ilf4xRtWBZc73+6bC7oHx3Kx7SFIY79rYuOgQNt5qj8=;
  b=dkQw2nyB2DZziSWSesFev+AdENyoBuPXhuoh2v+Wq54ZXZoApFPfv85T
   6ywla2MMmeeKvjWNFBlZ9A85yryVRAUCzBEGulFjERBb6rqsaZyKNfUTa
   K3tOhW/nyN3kL2pocT/a2XIMv9I8Hi4NXxaaYJfaow7v8Wy2xfG2msyp6
   K1oGYJ6zN3NNspiUPqVZ1nMUrsf9yKX3BGLF4vQuQALLdMuC4VyZSwnxA
   kNhlRYYMRMtyPmFybNtCSDM+3aP08dhM+CE9grL4bQwfUUX/pvjhwucDI
   PhxaCFTfwSmk7u79QZUgYatSRWxSeTqrWVb7nWGKas8lDFqByg63x4k55
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="27815784"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="27815784"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 15:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="912766088"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="912766088"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2024 15:36:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbqhT-0003Md-1y;
	Sun, 18 Feb 2024 23:35:59 +0000
Date: Mon, 19 Feb 2024 07:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.2-main 33/51]
 include/linux/container_of.h:20:54: error: 'struct mt76_dev' has no member
 named 'led_cdev'
Message-ID: <202402190744.0uoDzp83-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.2-main
head:   a61fd31e818faa27d01d4dec56cd68236cc01595
commit: a885fdb6c1bf57526c107541b7ad251be6c377db [33/51] wifi: mt76: move leds field in leds struct
config: i386-randconfig-012-20240218 (https://download.01.org/0day-ci/archive/20240219/202402190744.0uoDzp83-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402190744.0uoDzp83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402190744.0uoDzp83-lkp@intel.com/

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
>> include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
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
https://github.com/intel/lkp-tests/wiki
