Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABA04B048E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 12:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786883465; cv=none; b=A8sRljb7JmipZQNl7bKsLPr1kxvopJOxbaxMmxmpn83rwQbuGKfGlkj3XBtK5UiLqFR4nyzIpf/KR+xFnwQ/78YWOIRt7ZNQoiD0SXV2yDU9mM5s1TDnc4EuFfdUwmej3FTkpQ4GPyeaOCQaXpugyFg0G6kqMq8SDsQneudxLM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786883465; c=relaxed/simple;
	bh=kD8QPIAM6isSShq79uOPcWa3mIUPFU0Gob/Cq6gxC2g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OhaYGle1z6c7FzVi1w+5KGxzTns4xD0+cg1xCDBMKlSETtfUSropcFma1o7ANyB5j+aUO5fU5nVHCKgSifZ+FXf0lr3RQ+mK+MxDpKxxxZYt60r3Iz64fs+wgQ9OnSVqTAfee4piCYgCWLx4OQeceEP1DTv8C42FYrQPgNh4zJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvjlaL0d; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvjlaL0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786883463; x=1818419463;
  h=date:from:to:cc:subject:message-id;
  bh=kD8QPIAM6isSShq79uOPcWa3mIUPFU0Gob/Cq6gxC2g=;
  b=HvjlaL0dbh6fdgA0xle5RK0lgsO7HmZje7ad+uvYOHlmai4Y4E4yoWqP
   CCEMV7qx/e5m08JAEbQeAY9jupCKfQIFKxsei+XDoeys5uV5vQD6RhfkH
   yzqRZ8yIEVyuWMFkZgeXNwbJvtM/EDBQXMXfGWP7ElkL3qraiE8SvuAqv
   AC2nxj1WfSvDegQ0FT8ShdRht2k7PwCi+CeDutLTUFlTmcgNacoLBkUdR
   DJI7G6kteFOcl2VStNAXSgCGDQlmMWBl9sQg1CnqRYRnonYUnBTJpVWEt
   m2bxoX1GMGDOO/zJBE8sZtr8dJ1F1RFhc3nkBtgpx+Bw77rs8fAGeAua7
   Q==;
X-CSE-ConnectionGUID: 03WivFl5S/OW3m2tAT1FhQ==
X-CSE-MsgGUID: 8AljPW4LRZi8ZBIFrMJfUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87303952"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87303952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 05:31:03 -0700
X-CSE-ConnectionGUID: NDwx8DRqSiyYIRRLWbH/hw==
X-CSE-MsgGUID: jfARQYuRTtGVvVochLY/HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="260445846"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2026 05:31:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wva0w-00000000csk-1k4x;
	Sun, 16 Aug 2026 12:30:58 +0000
Date: Sun, 16 Aug 2026 20:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 154/217] drivers/mfd/max8925-core.c:44:30:
 warning: 'touch_devs' defined but not used
Message-ID: <202608162020.9k7w3mbZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: a4e72f5a88a6efa6a9edbb7e22c08bb45fd91940 [154/217] mfd: max8925: remove platform data probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608162020.9k7w3mbZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608162020.9k7w3mbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608162020.9k7w3mbZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/max8925-core.c:44:30: warning: 'touch_devs' defined but not used [-Wunused-const-variable=]
      44 | static const struct mfd_cell touch_devs[] = {
         |                              ^~~~~~~~~~
--
   drivers/mfd/max8925-i2c.c: In function 'max8925_probe':
   drivers/mfd/max8925-i2c.c:146:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     146 |         ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
         |         ^~~
         |         net
   drivers/mfd/max8925-i2c.c:146:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/mfd/max8925-i2c.c:146:36: error: 'np' undeclared (first use in this function); did you mean 'up'?
     146 |         ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
         |                                    ^~
         |                                    up
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/mfd/max8925-i2c.c:10:
   drivers/mfd/max8925-i2c.c:148:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     148 |                 dev_err(dev, "Not found maxim,tsc-irq property\n");
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/mfd/max8925-i2c.c:148:17: note: in expansion of macro 'dev_err'
     148 |                 dev_err(dev, "Not found maxim,tsc-irq property\n");
         |                 ^~~~~~~
>> drivers/mfd/max8925-i2c.c:137:29: warning: unused variable 'node' [-Wunused-variable]
     137 |         struct device_node *node = client->dev.of_node;
         |                             ^~~~


vim +/touch_devs +44 drivers/mfd/max8925-core.c

1ad998934e9c6c Haojian Zhuang     2010-01-08  43  
7c0517b1716bc1 Geert Uytterhoeven 2013-11-18 @44  static const struct mfd_cell touch_devs[] = {
1ad998934e9c6c Haojian Zhuang     2010-01-08  45  	{
1ad998934e9c6c Haojian Zhuang     2010-01-08  46  		.name		= "max8925-touch",
1ad998934e9c6c Haojian Zhuang     2010-01-08  47  		.num_resources	= 1,
1ad998934e9c6c Haojian Zhuang     2010-01-08  48  		.resources	= &touch_resources[0],
1ad998934e9c6c Haojian Zhuang     2010-01-08  49  		.id		= -1,
1ad998934e9c6c Haojian Zhuang     2010-01-08  50  	},
1ad998934e9c6c Haojian Zhuang     2010-01-08  51  };
1ad998934e9c6c Haojian Zhuang     2010-01-08  52  

:::::: The code at line 44 was first introduced by commit
:::::: 7c0517b1716bc1aa873064290401a8ce2fbabc32 mfd: maxim: Constify struct mfd_cell where possible

:::::: TO: Geert Uytterhoeven <geert@linux-m68k.org>
:::::: CC: Lee Jones <lee.jones@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
