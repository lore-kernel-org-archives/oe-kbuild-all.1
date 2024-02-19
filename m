Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA9A2107
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 03:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708312765; cv=none; b=oFDY0ohfAzmM05qVRK9YyOOVOGcsAyN/V2h2adDcbNR5KmA9ZK2AQGMvwb5RDUbutGGAWz7f2aIIyqvodzJsz67FECSuTilbS1fcjV4IZNuFsc6kC0L/tqZy40CC3QtLIBBYYx6TlXK/yO0ol7rDmBbt4uv1PaRGAkfhhpWS84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708312765; c=relaxed/simple;
	bh=/fOXxfNBlKFEyJcPt/I2IINwbAtHsZXCLtf87d8cTP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pv+tOyhpSgVQVS3rHqFaczOVzKg/XGjYi88PBp5hM0vmLb+bdX/ktb8GGwvnDXHXFD2737ZeICBoMtITzuMultw1KSkEjcUdAxXcw+5p0zmQwQqcHyHeFrIgMDLhLQ/09iDQ+CzBC4bHPjKQDdEhJYDYSsjHXsgSOWHIMM+ApT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXZnPRPD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXZnPRPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708312762; x=1739848762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/fOXxfNBlKFEyJcPt/I2IINwbAtHsZXCLtf87d8cTP4=;
  b=ZXZnPRPD06kYFCN7+8wWp3B4Gmu6LO+CvY6gPfJqUoR/tMevCTJInZMH
   bUt8CiOoUXhZWJWBMCsHE/cm1G+G7yuFait2tHrp1oxI1macrl4RpJ8kM
   6DXekK9+BPKY1mdbvISfowF2ploiWYkZxipS6wac/T6QF7cQ7gNUcKGYl
   CJAEluqqxGqnZYD1LPb2gmotvvFLOSFiSPfcBe4+Uput4Dz42cb2Gq684
   nDQ1prBmdYtDSdo7QiBHBI8mzQfIYrdHwPTr71mfMihJ/tddhS3NIlXVe
   EB6P1m0NvCCk8E5FFAt5JTH3EjKHJo6t3+MLkRthYn0/bPmKKqzXMUVbf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="13004776"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="13004776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 19:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4632149"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2024 19:19:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbuBa-0003U2-2F;
	Mon, 19 Feb 2024 03:19:18 +0000
Date: Mon, 19 Feb 2024 11:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.2-main 33/51]
 drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:49: error: no member
 named 'led_cdev' in 'struct mt76_dev'
Message-ID: <202402191108.775bEx60-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240219/202402191108.775bEx60-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402191108.775bEx60-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402191108.775bEx60-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:49: error: no member named 'led_cdev' in 'struct mt76_dev'
      52 |         mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:299:74: note: expanded from macro '__same_type'
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:9: error: no member named 'led_cdev' in 'mt76_dev'
      52 |         mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
         |                ^                                       ~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:52:7: error: assigning to 'struct mt76_dev *' from incompatible type 'void'
      52 |         mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:68:16: error: no member named 'led_al' in 'struct mt76_dev'
      68 |         if (dev->mt76.led_al)
         |             ~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:264:17: error: no member named 'led_pin' in 'struct mt76_dev'
     264 |                 i = dev->mt76.led_pin ? MT_LED_GPIO_MUX3 : MT_LED_GPIO_MUX2;
         |                     ~~~~~~~~~ ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:790:13: error: no member named 'led_cdev' in 'struct mt76_dev'
     790 |                 dev->mt76.led_cdev.brightness_set = mt7996_led_set_brightness;
         |                 ~~~~~~~~~ ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:791:13: error: no member named 'led_cdev' in 'struct mt76_dev'
     791 |                 dev->mt76.led_cdev.blink_set = mt7996_led_set_blink;
         |                 ~~~~~~~~~ ^
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
https://github.com/intel/lkp-tests/wiki
