Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8575414A8B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 00:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786927677; cv=none; b=kEQ2oI49Ueet5klQ7QR1a1+GgT4o10t9d8DT130kjOH2Sxkowm2bg320LaJ5y/5pD7ia979JDLAc5V9EgSqk2h9cghtILg7LFOsLWSNxG6LAxzVbYP2h1XXQY/4wznXr7glLVIFlrOH4aMt09CLqCy9ocBjrrZAV359FRG59kwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786927677; c=relaxed/simple;
	bh=1PLO5Ilx9TbXwf1yvM93LzKql71nGhWVQD4LOtyYCSw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OWzO9sNIeYkEu7s80d5jyW8LuvGf1kHV0us4G8zWaZKqtJflyTA6dZ2YyXJNuzDvOUOUp/+AXnbfOz2rsw+MdwcZeMpEoj7uXIGWrftOruWumramswuM0N4v46Wq0y7EXdi3QO7JbWko3lciGi5tqIWCy7l5bs5N9/kZ4Nt2qrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckqXww5h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckqXww5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786927676; x=1818463676;
  h=date:from:to:cc:subject:message-id;
  bh=1PLO5Ilx9TbXwf1yvM93LzKql71nGhWVQD4LOtyYCSw=;
  b=ckqXww5hiBx5n0RXXYbqYwuQwTBRYiqaKZ/JQakJ8fadjJh9ouYp8QkE
   crgpmAOFQiJc+KMFS/pq7Z2nUUb/0wBzzDmkGhaelAteVxgluTGAy+JFd
   Hp219pFMW9Mho4CWBgkCVbHdy0g/SvP82wqX+SIGMRriCC/GmSnkNqjS9
   BmRwJUJxROwloKqMtinKbvfAxQa7d9T4WMKEEGqeS/+elIr0R69Jz2KXY
   KjHQVbibO0VgT8fWfvtrsmFZ4c54EwMOSfB8618tLh3B7+U8X1gLStsQz
   ilAvs4IFjKRlUl58+jVYzQmQayWALhq6p8tOhzPX/FAYw8XHVRVWHKlMR
   A==;
X-CSE-ConnectionGUID: aGtmRsEKQNa5SeScU83Ybg==
X-CSE-MsgGUID: WlIyz/o/RNWjh9JAeYQGkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87322212"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87322212"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 17:47:55 -0700
X-CSE-ConnectionGUID: 8MIANVFlRA+tWb2rZFPbkA==
X-CSE-MsgGUID: EuRwRdOySm6NWdfbH3n9rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="268256347"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Aug 2026 17:47:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvlW2-00000000dB8-3v3i;
	Mon, 17 Aug 2026 00:47:50 +0000
Date: Mon, 17 Aug 2026 08:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 160/217]
 drivers/mfd/88pm860x-core.c:841:13: warning: 'device_codec_init' defined but
 not used
Message-ID: <202608170852.2QxCkILI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 59d0d39f2a1e71a171b677f5c4a10641c22d6fff [160/217] mfd: 88pm860x: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608170852.2QxCkILI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170852.2QxCkILI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170852.2QxCkILI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/88pm860x-core.c: In function 'pm860x_probe':
   drivers/mfd/88pm860x-core.c:985:36: error: 'np' undeclared (first use in this function); did you mean 'up'?
     985 |         ret = of_property_read_u32(np, "marvell,88pm860x-slave-addr",
         |                                    ^~
         |                                    up
   drivers/mfd/88pm860x-core.c:985:36: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from drivers/mfd/88pm860x-core.c:13:
   drivers/mfd/88pm860x-core.c:988:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     988 |                 dev_err(dev,
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/mfd/88pm860x-core.c:988:17: note: in expansion of macro 'dev_err'
     988 |                 dev_err(dev,
         |                 ^~~~~~~
   drivers/mfd/88pm860x-core.c:980:29: warning: unused variable 'node' [-Wunused-variable]
     980 |         struct device_node *node = client->dev.of_node;
         |                             ^~~~
   drivers/mfd/88pm860x-core.c: At top level:
>> drivers/mfd/88pm860x-core.c:841:13: warning: 'device_codec_init' defined but not used [-Wunused-function]
     841 | static void device_codec_init(struct pm860x_chip *chip)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/mfd/88pm860x-core.c:326:33: warning: 'chg_desc_regulator_data' defined but not used [-Wunused-variable]
     326 | static struct charger_regulator chg_desc_regulator_data[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/input/touchscreen/88pm860x-ts.c: In function 'pm860x_touch_probe':
>> drivers/input/touchscreen/88pm860x-ts.c:174:34: warning: unused variable 'data' [-Wunused-variable]
     174 |         int irq, ret, res_x = 0, data = 0;
         |                                  ^~~~


vim +/device_codec_init +841 drivers/mfd/88pm860x-core.c

   840	
 > 841	static void device_codec_init(struct pm860x_chip *chip)
   842	{
   843		int ret;
   844	
   845		codec_devs[0].num_resources = ARRAY_SIZE(codec_resources);
   846		codec_devs[0].resources = &codec_resources[0];
   847		ret = mfd_add_devices(chip->dev, 0, &codec_devs[0],
   848				      ARRAY_SIZE(codec_devs), &codec_resources[0], 0,
   849				      NULL);
   850		if (ret < 0)
   851			dev_err(chip->dev, "Failed to add codec subdev\n");
   852	}
   853	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
