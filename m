Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E6D1FC0EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766434669; cv=none; b=jOzu8Ou3YgLlKbxDqs6/xZz9hbxVlEfuipHcmcVztp1jQOxx2IXnQliXGM97C8oaZbsJpSUVmwHlSd/LHHbjPvpLNQeiPz5aV04+hh6ItRXDE3l4S00WH8akc4gEXMWL1gBJfW1r6ThmrEjV0jEuK7iHGJ8ImLso93kWm/vVzzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766434669; c=relaxed/simple;
	bh=9J11EGyZ//qs1wCNLxc5BldSS8QLUzyLHBCWPMOrS3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JahqIIA35HLODyZKBF8Y9jciMF9Cqs8iCES0rztjHE3/EL0MX/CM+D0czlNViLBQHdB2LX7K/0kLY7W488ig6cCAwYlqdj/KQdp46oRh7Qfj0Jxgzru3NoUUlsiOEoVs6xaNkvxZ5MTzLJzbxAFnvIwSmG8vzOmKyA9lPQG8zbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUFsrKr+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUFsrKr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766434667; x=1797970667;
  h=date:from:to:cc:subject:message-id;
  bh=9J11EGyZ//qs1wCNLxc5BldSS8QLUzyLHBCWPMOrS3g=;
  b=UUFsrKr+vRSxRG5Vq/e9quEERQKSw+ePtrWeSO65Kl3VRoeevo9e4Tfl
   KaVPxP9BGcSQqxZ3iwZiAlJSAAFcCQ7DJV2m/X+LwAxansZH4yjIyKIR2
   76W3ulxZmBwbwsDIgHNxy7nNCI7/DK3gYKhgemFfn5yB5npTPGZeXmHav
   ltM0NOgdEbVw0CIHuVeN0FTMm1MsCFhWHenSMO1QGt47MSyFb5HF9U7wA
   337ziK3U5+m9NntfqB4iNTmJdKMjM2aSyxEsKg8B+hu6iC8JR4iVB5rfh
   5bM79sx8AWxj8/y9wMcvB7o+KZMe7rsfyr7EqpfYFFtxc74e7kpscgDB7
   Q==;
X-CSE-ConnectionGUID: MhyG0UQ0SIykukLGxUguzA==
X-CSE-MsgGUID: ifEMmmKDQx6TI5D/tQp6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79410608"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79410608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 12:17:46 -0800
X-CSE-ConnectionGUID: KwtYUj92RmmsFSTuIGChSg==
X-CSE-MsgGUID: lXmhMjsgQl+TkbZi5l3cuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199914354"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 12:17:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXmLU-0000000014T-12a2;
	Mon, 22 Dec 2025 20:17:36 +0000
Date: Tue, 23 Dec 2025 04:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Carlos Song <carlos.song@nxp.com>,
 Adrian Fluturel <fluturel.adrian@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [jic23-iio:testing 47/49]
 drivers/base/regmap/regmap-i3c.c:41: undefined reference to
 `i3c_device_do_xfers'
Message-ID: <202512230418.nu3V6Yua-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   4e44c635ba8c281f74001d47e20bbcb7f516530c
commit: 6e5f6bf2e3f036e6d7466d2a3322445729ea3356 [47/49] iio: magnetometer: Add mmc5633 sensor
config: sparc64-randconfig-001-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230418.nu3V6Yua-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230418.nu3V6Yua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230418.nu3V6Yua-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/base/regmap/regmap-i3c.o: in function `regmap_i3c_read':
>> drivers/base/regmap/regmap-i3c.c:41: undefined reference to `i3c_device_do_xfers'
   sparc64-linux-ld: drivers/base/regmap/regmap-i3c.o: in function `regmap_i3c_write':
   drivers/base/regmap/regmap-i3c.c:22: undefined reference to `i3c_device_do_xfers'
   sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_is_support_hdr':
>> drivers/iio/magnetometer/mmc5633.c:193: undefined reference to `i3c_device_get_supported_xfer_mode'
   sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_read_measurement':
>> drivers/iio/magnetometer/mmc5633.c:230: undefined reference to `i3c_device_do_xfers'
>> sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.c:237: undefined reference to `i3c_device_do_xfers'
   sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.c:251: undefined reference to `i3c_device_do_xfers'
>> sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.c:230: undefined reference to `i3c_device_do_xfers'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]
   WARNING: unmet direct dependencies detected for REGMAP_I3C
   Depends on [n]: I3C [=n]
   Selected by [y]:
   - MMC5633 [=y] && IIO [=y] && (I2C [=y] || I3C [=n])


vim +41 drivers/base/regmap/regmap-i3c.c

6445500b43129b Vitor Soares   2019-06-06  24  
6445500b43129b Vitor Soares   2019-06-06  25  static int regmap_i3c_read(void *context,
6445500b43129b Vitor Soares   2019-06-06  26  			   const void *reg, size_t reg_size,
6445500b43129b Vitor Soares   2019-06-06  27  			   void *val, size_t val_size)
6445500b43129b Vitor Soares   2019-06-06  28  {
6445500b43129b Vitor Soares   2019-06-06  29  	struct device *dev = context;
6445500b43129b Vitor Soares   2019-06-06  30  	struct i3c_device *i3c = dev_to_i3cdev(dev);
79c3ae7ada0548 Frank Li       2025-10-28  31  	struct i3c_xfer xfers[2];
6445500b43129b Vitor Soares   2019-06-06  32  
6445500b43129b Vitor Soares   2019-06-06  33  	xfers[0].rnw = false;
6445500b43129b Vitor Soares   2019-06-06  34  	xfers[0].len = reg_size;
6445500b43129b Vitor Soares   2019-06-06  35  	xfers[0].data.out = reg;
6445500b43129b Vitor Soares   2019-06-06  36  
6445500b43129b Vitor Soares   2019-06-06  37  	xfers[1].rnw = true;
6445500b43129b Vitor Soares   2019-06-06  38  	xfers[1].len = val_size;
6445500b43129b Vitor Soares   2019-06-06  39  	xfers[1].data.in = val;
6445500b43129b Vitor Soares   2019-06-06  40  
c2f2b01b74be8b Linus Torvalds 2025-12-08 @41  	return i3c_device_do_xfers(i3c, xfers, ARRAY_SIZE(xfers), I3C_SDR);
6445500b43129b Vitor Soares   2019-06-06  42  }
6445500b43129b Vitor Soares   2019-06-06  43  

:::::: The code at line 41 was first introduced by commit
:::::: c2f2b01b74be8b40a2173372bcd770723f87e7b2 Merge tag 'i3c/for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
