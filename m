Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B487226296
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 04:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941617; cv=none; b=BFSmciCORZrntyiueQ7q5CEIfQIEGIFjBdIQ2fI/kl2ZIV7BT9FV+PHQlvgFZhWeY/ttMZLx5UwLZyrwigW/HeFoTtVeb3IM1hlAuK/jyjXOGZu6M9rXllHks9lh+q28nEKJ5421KG1jYWPhoTJpq8KpgMSOs8fGajx1zEvmDC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941617; c=relaxed/simple;
	bh=pInzdS3fVKHNjkfsX7JNQYahFsJ5mN6YqccQ6+RHLIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TDdq0XH4xyeoisYtlvUncyn/YS3ar2F+Xjh+huVmUbER/UI9rSTm1oxnZ81OpUTLr/qu1WfmcGSx1/hfYE7OyTiJD+oM7OJROo9CUNaANnxkApbmOV7qPhPJypVpzIVd9rQ4OVcqbl6OkUf0XdLckgNYdB6E8Ga3XxTVCE/AjWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmmEE8d0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmmEE8d0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786941615; x=1818477615;
  h=date:from:to:cc:subject:message-id;
  bh=pInzdS3fVKHNjkfsX7JNQYahFsJ5mN6YqccQ6+RHLIc=;
  b=TmmEE8d0sC0ozxHqOt9uMNwg8PCUsSHnp1GGgn96ju9CdWGt2ltYtY9F
   bn2uqoiGYwfS87oJhBJP6JdryVIxXH5vUvkGn0oAy+0nCIDkj4pZ684Vi
   54M3QhpdRl3CI4AFjtjxvQF0XU9aFHvjnuPSNf+tb2fobATlJi4y81Uoy
   jMD+b8prHWvBT1EhivtkW+zHP0ZfJmyOkqjgckKUFUmQvXnJx3ROyb4ix
   fb5uTEbsvAdcPOMkZoXfshfFbgRhj5TrTeuXcoBC8H1OQcAc1EHJz5UZS
   1XEEhb4972+gsuutnv192wmN5GJsDHpx46tUG/1pIlNuASHf6fezplGlj
   A==;
X-CSE-ConnectionGUID: dKb2iQe3R2CdJ6C0Hk61YA==
X-CSE-MsgGUID: C89J4p3eT0OqoNlpwrnpVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="74943287"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="74943287"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 21:40:14 -0700
X-CSE-ConnectionGUID: 3T7RcBV4SBa/wlZZN3zOww==
X-CSE-MsgGUID: T5RQp45mQYWmyMg6fxTL5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="262170968"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Aug 2026 21:40:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvp8r-00000000dIU-3kX7;
	Mon, 17 Aug 2026 04:40:09 +0000
Date: Mon, 17 Aug 2026 12:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 160/217]
 drivers/mfd/88pm860x-core.c:985:36: error: 'np' undeclared; did you mean
 'up'?
Message-ID: <202608171207.4fB2Fj1E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 59d0d39f2a1e71a171b677f5c4a10641c22d6fff [160/217] mfd: 88pm860x: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608171207.4fB2Fj1E-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171207.4fB2Fj1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608171207.4fB2Fj1E-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/88pm860x-core.c: In function 'pm860x_probe':
>> drivers/mfd/88pm860x-core.c:985:36: error: 'np' undeclared (first use in this function); did you mean 'up'?
     985 |         ret = of_property_read_u32(np, "marvell,88pm860x-slave-addr",
         |                                    ^~
         |                                    up
   drivers/mfd/88pm860x-core.c:985:36: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from drivers/mfd/88pm860x-core.c:13:
>> drivers/mfd/88pm860x-core.c:988:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
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
   drivers/mfd/88pm860x-core.c:841:13: warning: 'device_codec_init' defined but not used [-Wunused-function]
     841 | static void device_codec_init(struct pm860x_chip *chip)
         |             ^~~~~~~~~~~~~~~~~
   drivers/mfd/88pm860x-core.c:326:33: warning: 'chg_desc_regulator_data' defined but not used [-Wunused-variable]
     326 | static struct charger_regulator chg_desc_regulator_data[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +985 drivers/mfd/88pm860x-core.c

f2f218cdc3ef4fd Haojian Zhuang      2012-09-17   977  
59d0d39f2a1e71a Arnd Bergmann       2026-08-07   978  static int pm860x_probe(struct i2c_client *client)
2e57d56747e601b Haojian Zhuang      2012-09-21   979  {
59d0d39f2a1e71a Arnd Bergmann       2026-08-07   980  	struct device_node *node = client->dev.of_node;
59d0d39f2a1e71a Arnd Bergmann       2026-08-07   981  	struct pm860x_chip *chip;
59d0d39f2a1e71a Arnd Bergmann       2026-08-07   982  	int companion_addr;
2e57d56747e601b Haojian Zhuang      2012-09-21   983  	int ret;
2e57d56747e601b Haojian Zhuang      2012-09-21   984  
2e57d56747e601b Haojian Zhuang      2012-09-21  @985  	ret = of_property_read_u32(np, "marvell,88pm860x-slave-addr",
59d0d39f2a1e71a Arnd Bergmann       2026-08-07   986  				   &companion_addr);
2e57d56747e601b Haojian Zhuang      2012-09-21   987  	if (ret) {
2e57848fed74352 Lee Jones           2014-05-08  @988  		dev_err(dev,
2e57848fed74352 Lee Jones           2014-05-08   989  			"Not found \"marvell,88pm860x-slave-addr\" property\n");
59d0d39f2a1e71a Arnd Bergmann       2026-08-07   990  		companion_addr = 0;
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17   991  	}
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17   992  
a1ace0aac5a83b8 Lee Jones           2013-05-23   993  	chip = devm_kzalloc(&client->dev,
a1ace0aac5a83b8 Lee Jones           2013-05-23   994  			    sizeof(struct pm860x_chip), GFP_KERNEL);
85529575b67c318 Jingoo Han          2013-02-20   995  	if (chip == NULL)
85529575b67c318 Jingoo Han          2013-02-20   996  		return -ENOMEM;
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17   997  
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17   998  	chip->id = verify_addr(client);
aaaab4223ebad24 Sachin Kamat        2013-06-12   999  	chip->regmap = devm_regmap_init_i2c(client, &pm860x_regmap_config);
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1000  	if (IS_ERR(chip->regmap)) {
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1001  		ret = PTR_ERR(chip->regmap);
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1002  		dev_err(&client->dev, "Failed to allocate register map: %d\n",
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1003  				ret);
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1004  		return ret;
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1005  	}
59d0d39f2a1e71a Arnd Bergmann       2026-08-07  1006  	chip->irq_mode = of_property_read_bool(np, "marvell,88pm860x-irq-read-clr");
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1007  	chip->client = client;
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1008  	i2c_set_clientdata(client, chip);
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1009  	chip->dev = &client->dev;
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1010  
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1011  	/*
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1012  	 * Both client and companion client shares same platform driver.
59d0d39f2a1e71a Arnd Bergmann       2026-08-07  1013  	 * Driver distinguishes them by companion_addr.
59d0d39f2a1e71a Arnd Bergmann       2026-08-07  1014  	 * companion_addr is only assigned if companion chip exists.
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1015  	 * At the same time, the companion_addr shouldn't equal to client
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1016  	 * address.
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1017  	 */
59d0d39f2a1e71a Arnd Bergmann       2026-08-07  1018  	if (companion_addr && (companion_addr != client->addr)) {
59d0d39f2a1e71a Arnd Bergmann       2026-08-07  1019  		chip->companion_addr = companion_addr;
9520b835ffda85c Wolfram Sang        2019-07-22  1020  		chip->companion = i2c_new_dummy_device(chip->client->adapter,
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1021  						chip->companion_addr);
9520b835ffda85c Wolfram Sang        2019-07-22  1022  		if (IS_ERR(chip->companion)) {
159ce52a6b777fc Krzysztof Kozlowski 2014-02-11  1023  			dev_err(&client->dev,
159ce52a6b777fc Krzysztof Kozlowski 2014-02-11  1024  				"Failed to allocate I2C companion device\n");
9520b835ffda85c Wolfram Sang        2019-07-22  1025  			return PTR_ERR(chip->companion);
159ce52a6b777fc Krzysztof Kozlowski 2014-02-11  1026  		}
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1027  		chip->regmap_companion = regmap_init_i2c(chip->companion,
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1028  							&pm860x_regmap_config);
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1029  		if (IS_ERR(chip->regmap_companion)) {
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1030  			ret = PTR_ERR(chip->regmap_companion);
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1031  			dev_err(&chip->companion->dev,
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1032  				"Failed to allocate register map: %d\n", ret);
a7ab1c8b261305a Krzysztof Kozlowski 2014-02-11  1033  			i2c_unregister_device(chip->companion);
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1034  			return ret;
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1035  		}
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1036  		i2c_set_clientdata(chip->companion, chip);
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1037  	}
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1038  
59d0d39f2a1e71a Arnd Bergmann       2026-08-07  1039  	pm860x_device_init(chip);
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1040  	return 0;
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1041  }
f2f218cdc3ef4fd Haojian Zhuang      2012-09-17  1042  

:::::: The code at line 985 was first introduced by commit
:::::: 2e57d56747e601b3e0ff6697e524025d0504d161 mfd: 88pm860x: Device tree support

:::::: TO: Haojian Zhuang <haojian.zhuang@gmail.com>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
