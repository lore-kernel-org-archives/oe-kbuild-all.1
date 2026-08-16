Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC44B04AB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 16:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786898225; cv=none; b=lVGIVBsZhDhBz389mv+7YEFMZ2udBd2ZWR9YNbEsEu6U0p2lETmssCUxnuka7Mr78XoQSmS21qejakOMcyOPeTK410nHh1BW/2XK6HSRWzzCrSd9f6HRbq1JOVBJISG3LAMoQdCRI7pmXFN7i31mDWFrq41Yp9azGGk8A49OJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786898225; c=relaxed/simple;
	bh=LUT1X5gNR2zGDfqYMkVCXmcxX/qUeGz6V976KRKVfRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QtQZFH6+cBxUK5p0I1kZn7DEYsevC+EpAEyM4ocf25H0ttxQntDgMoqkLPtd3QX1hDMsQK2i04DMeuKAubW2M9HPvQykUvVdO0hUDkD90I6hREXI7vZw98U+46rjBO2UFxwnmgkYQzqVQJy5cimd7gQ08sX5ki8SNJidse/L5u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWSEBw4H; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWSEBw4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786898223; x=1818434223;
  h=date:from:to:cc:subject:message-id;
  bh=LUT1X5gNR2zGDfqYMkVCXmcxX/qUeGz6V976KRKVfRY=;
  b=RWSEBw4HLt0qNG8TwXHhwL4UU4DDMA67BLvbFr+kV6oGfBuCuEPqzYxk
   HA6aNkXFYPbWX5621F3N0oNFvnJz9FmUGFq7mKe5EKaaq7bpNgrKWuEcs
   zkJSbLRAmAN0+zlywmGs+5K7eU7FrMtJFghnTcS06TczkHnEm1XuYwZ2W
   8wxCEPwK0YJlXf5S2WSoQ5fJSq1PsSJQeUa73FrQCDuVeg0tiTp21XX0W
   Tb5wWnAflG0uGP4zAGad9sCsSYtilsDh751VQvR1pEhuMqG9+SCX/EspV
   ZI9n1jjWePOErGvefD0V98/f0op9tzy6AKtzFWmP0MsMv1EvudnOhk0qH
   A==;
X-CSE-ConnectionGUID: YFCuzdLTQdG5mUShcdYJag==
X-CSE-MsgGUID: uA/G/VmuTOqlbznOEkg5jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91204013"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="91204013"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 09:37:02 -0700
X-CSE-ConnectionGUID: TOdTP/B7TzyXdNk/171kAg==
X-CSE-MsgGUID: Zer9avPYT1Sp+4uQ96tO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="264747119"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2026 09:37:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvdr0-00000000d0M-1OwO;
	Sun, 16 Aug 2026 16:36:58 +0000
Date: Mon, 17 Aug 2026 00:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 154/217] drivers/mfd/max8925-i2c.c:146:9:
 error: 'ret' undeclared; did you mean 'net'?
Message-ID: <202608170025.qu8rAquT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: a4e72f5a88a6efa6a9edbb7e22c08bb45fd91940 [154/217] mfd: max8925: remove platform data probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608170025.qu8rAquT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170025.qu8rAquT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170025.qu8rAquT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/max8925-i2c.c: In function 'max8925_probe':
>> drivers/mfd/max8925-i2c.c:146:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     146 |         ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
         |         ^~~
         |         net
   drivers/mfd/max8925-i2c.c:146:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/mfd/max8925-i2c.c:146:36: error: 'np' undeclared (first use in this function); did you mean 'up'?
     146 |         ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
         |                                    ^~
         |                                    up
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/mfd/max8925-i2c.c:10:
>> drivers/mfd/max8925-i2c.c:148:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     148 |                 dev_err(dev, "Not found maxim,tsc-irq property\n");
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/mfd/max8925-i2c.c:148:17: note: in expansion of macro 'dev_err'
     148 |                 dev_err(dev, "Not found maxim,tsc-irq property\n");
         |                 ^~~~~~~
   drivers/mfd/max8925-i2c.c:137:29: warning: unused variable 'node' [-Wunused-variable]
     137 |         struct device_node *node = client->dev.of_node;
         |                             ^~~~


vim +146 drivers/mfd/max8925-i2c.c

   133	
   134	static int max8925_probe(struct i2c_client *client)
   135	{
   136		struct max8925_chip *chip;
   137		struct device_node *node = client->dev.of_node;
   138		int tsc_irq;
   139	
   140		chip = devm_kzalloc(&client->dev,
   141				    sizeof(struct max8925_chip), GFP_KERNEL);
   142		if (chip == NULL)
   143			return -ENOMEM;
   144	
   145		/* parse DT to get platform data */
 > 146		ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
   147		if (ret) {
 > 148			dev_err(dev, "Not found maxim,tsc-irq property\n");
   149			return -EINVAL;
   150		}
   151	
   152		chip->i2c = client;
   153		chip->dev = &client->dev;
   154		i2c_set_clientdata(client, chip);
   155		mutex_init(&chip->io_lock);
   156	
   157		chip->rtc = i2c_new_dummy_device(chip->i2c->adapter, RTC_I2C_ADDR);
   158		if (IS_ERR(chip->rtc)) {
   159			dev_err(chip->dev, "Failed to allocate I2C device for RTC\n");
   160			return PTR_ERR(chip->rtc);
   161		}
   162		i2c_set_clientdata(chip->rtc, chip);
   163	
   164		chip->adc = i2c_new_dummy_device(chip->i2c->adapter, ADC_I2C_ADDR);
   165		if (IS_ERR(chip->adc)) {
   166			dev_err(chip->dev, "Failed to allocate I2C device for ADC\n");
   167			i2c_unregister_device(chip->rtc);
   168			return PTR_ERR(chip->adc);
   169		}
   170		i2c_set_clientdata(chip->adc, chip);
   171	
   172		device_init_wakeup(&client->dev, 1);
   173	
   174		max8925_device_init(chip, tsc_irq);
   175	
   176		return 0;
   177	}
   178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
