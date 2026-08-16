Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EC6345CCD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786872751; cv=none; b=mzMpwbZ1NWaaVMqMemxpyB/nQNsVUXRv2oYsdhY2NUNg1dDWfmcU4PzTfJ0MTu4QYK7BUpPTY+FIDnHT33YgAa2CPmkNRcPitFxUvOO7fdyxOm0rn0+4uhWnz+Lrtv/M2WrxMx+m0ioqAXZH7C0QUm6WRTV2hn8Lbn29kb4Hsp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786872751; c=relaxed/simple;
	bh=StQmV5OrVMenz39D8q13bAe7PQZjTUbCu7bUqGAXJwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f6p20ED6H6riqS1HrwoiF+6sy2OlA/QIl8FQBsUcwIpQTqLGwquUEtaA+D1zpzQx3iQYTbKdHBx+8533Ol7mBeBqMZPPuAW2GEZxwk6qIuqpZQWf6I7aVgE7SYjcvvfv+M21w5LmrAzleOvXBR4WQO7PHOp+TT1kHE09GnR8rhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEyBTZvZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEyBTZvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786872749; x=1818408749;
  h=date:from:to:cc:subject:message-id;
  bh=StQmV5OrVMenz39D8q13bAe7PQZjTUbCu7bUqGAXJwc=;
  b=TEyBTZvZ7uRQyZ6BWdULugNh45XCCGCURpRtXihcpS486pOu5Wh8F/Dj
   iX+aPadaNH5cEvDuh2bbxoS5fW5jh3yPdxX2k0XXuKyj5OXhW3wyr9UiK
   6YE1BYvqJuWm65xYwGE5D23s8Qk2BPdsrrG5UuQ18PAB82WBqmiPJYr7L
   /fDlCj/hVFiiDQMfnF+9wa7EFjVgaLkKFoPtOlJkTHKJEgiDS6lBSWXzs
   yz/KjeX0CpCZpv4p081+riid3a1H+yytWCrXjOOlNjn+n23SyHfPyGUkX
   ohmKfNni6hz2vD+CxxeEUak82r7wnFp7hUBbrgLtx0r6uwckudoFOhXcO
   w==;
X-CSE-ConnectionGUID: YqR/esAOQE6bMw5ASKDZhQ==
X-CSE-MsgGUID: cCnxeDHPQvicOeaylk8fNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="110163589"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="110163589"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 02:32:25 -0700
X-CSE-ConnectionGUID: Je2ryJCdSMyTjSLsKQtoGQ==
X-CSE-MsgGUID: CgtSzv6dQ5u2EktFcogRmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="268487655"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2026 02:32:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvXE5-00000000cqI-2Hl0;
	Sun, 16 Aug 2026 09:32:21 +0000
Date: Sun, 16 Aug 2026 17:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 114/217]
 drivers/regulator/da9055-regulator.c:77:26: error: field 'reg_rselect' has
 incomplete type
Message-ID: <202608161718.qy3xohxH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 158b19afd623da6a93d8ac59dd4aeefe48fa2085 [114/217] mfd: da9055: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608161718.qy3xohxH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161718.qy3xohxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161718.qy3xohxH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/da9055-regulator.c:77:26: error: field 'reg_rselect' has incomplete type
      77 |         enum gpio_select reg_rselect;
         |                          ^~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_set_voltage_sel':
>> drivers/regulator/da9055-regulator.c:208:39: error: 'NO_GPIO' undeclared (first use in this function)
     208 |         if (regulator->reg_rselect == NO_GPIO) {
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c:208:39: note: each undeclared identifier is reported only once for each function it appears in
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_set_suspend_voltage':
   drivers/regulator/da9055-regulator.c:248:39: error: 'NO_GPIO' undeclared (first use in this function)
     248 |         if (regulator->reg_rselect == NO_GPIO) {
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_enable':
   drivers/regulator/da9055-regulator.c:269:39: error: 'NO_GPIO' undeclared (first use in this function)
     269 |         if (regulator->reg_rselect == NO_GPIO)
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_disable':
   drivers/regulator/da9055-regulator.c:282:39: error: 'NO_GPIO' undeclared (first use in this function)
     282 |         if (regulator->reg_rselect == NO_GPIO)
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_gpio_init':
>> drivers/regulator/da9055-regulator.c:466:42: error: 'pdata' undeclared (first use in this function); did you mean '_data'?
     466 |                 regulator->reg_rselect = pdata->reg_rsel[id];
         |                                          ^~~~~
         |                                          _data
   drivers/regulator/da9055-regulator.c:417:33: warning: parameter 'id' set but not used [-Wunused-but-set-parameter=]
     417 |                             int id)
         |                             ~~~~^~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kcsan-checks.h:14,
                    from include/asm-generic/barrier.h:17,
                    from arch/alpha/include/asm/barrier.h:21,
                    from arch/alpha/include/asm/rwonce.h:10,
                    from include/linux/compiler.h:369,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/regulator/da9055-regulator.c:9:
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_probe':
>> include/linux/stddef.h:8:14: error: passing argument 4 of 'da9055_gpio_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/regulator/da9055-regulator.c:534:64: note: in expansion of macro 'NULL'
     534 |         ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
         |                                                                ^~~~
   drivers/regulator/da9055-regulator.c:417:33: note: expected 'int' but argument is of type 'void *'
     417 |                             int id)
         |                             ~~~~^~
>> drivers/regulator/da9055-regulator.c:534:15: error: too many arguments to function 'da9055_gpio_init'; expected 4, have 5
     534 |         ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
         |               ^~~~~~~~~~~~~~~~                                       ~~~~~~~~
   drivers/regulator/da9055-regulator.c:414:12: note: declared here
     414 | static int da9055_gpio_init(struct device *dev,
         |            ^~~~~~~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_disable':
   drivers/regulator/da9055-regulator.c:287:1: warning: control reaches end of non-void function [-Wreturn-type]
     287 | }
         | ^
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_enable':
   drivers/regulator/da9055-regulator.c:274:1: warning: control reaches end of non-void function [-Wreturn-type]
     274 | }
         | ^


vim +/reg_rselect +77 drivers/regulator/da9055-regulator.c

f6130be652d0b4f Ashish Jangam       2012-11-01   72  
f6130be652d0b4f Ashish Jangam       2012-11-01   73  struct da9055_regulator {
f6130be652d0b4f Ashish Jangam       2012-11-01   74  	struct da9055 *da9055;
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09   75  	const struct da9055_regulator_info *info;
f6130be652d0b4f Ashish Jangam       2012-11-01   76  	struct regulator_dev *rdev;
f6130be652d0b4f Ashish Jangam       2012-11-01  @77  	enum gpio_select reg_rselect;
f6130be652d0b4f Ashish Jangam       2012-11-01   78  };
f6130be652d0b4f Ashish Jangam       2012-11-01   79  
f6130be652d0b4f Ashish Jangam       2012-11-01   80  static unsigned int da9055_buck_get_mode(struct regulator_dev *rdev)
f6130be652d0b4f Ashish Jangam       2012-11-01   81  {
f6130be652d0b4f Ashish Jangam       2012-11-01   82  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09   83  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01   84  	int ret, mode = 0;
f6130be652d0b4f Ashish Jangam       2012-11-01   85  
f6130be652d0b4f Ashish Jangam       2012-11-01   86  	ret = da9055_reg_read(regulator->da9055, info->mode.reg);
f6130be652d0b4f Ashish Jangam       2012-11-01   87  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01   88  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01   89  
f6130be652d0b4f Ashish Jangam       2012-11-01   90  	switch ((ret & info->mode.mask) >> info->mode.shift) {
f6130be652d0b4f Ashish Jangam       2012-11-01   91  	case DA9055_BUCK_MODE_SYNC:
f6130be652d0b4f Ashish Jangam       2012-11-01   92  		mode = REGULATOR_MODE_FAST;
f6130be652d0b4f Ashish Jangam       2012-11-01   93  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01   94  	case DA9055_BUCK_MODE_AUTO:
f6130be652d0b4f Ashish Jangam       2012-11-01   95  		mode = REGULATOR_MODE_NORMAL;
f6130be652d0b4f Ashish Jangam       2012-11-01   96  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01   97  	case DA9055_BUCK_MODE_SLEEP:
f6130be652d0b4f Ashish Jangam       2012-11-01   98  		mode = REGULATOR_MODE_STANDBY;
f6130be652d0b4f Ashish Jangam       2012-11-01   99  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  100  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  101  
f6130be652d0b4f Ashish Jangam       2012-11-01  102  	return mode;
f6130be652d0b4f Ashish Jangam       2012-11-01  103  }
f6130be652d0b4f Ashish Jangam       2012-11-01  104  
f6130be652d0b4f Ashish Jangam       2012-11-01  105  static int da9055_buck_set_mode(struct regulator_dev *rdev,
f6130be652d0b4f Ashish Jangam       2012-11-01  106  					unsigned int mode)
f6130be652d0b4f Ashish Jangam       2012-11-01  107  {
f6130be652d0b4f Ashish Jangam       2012-11-01  108  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  109  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  110  	int val = 0;
f6130be652d0b4f Ashish Jangam       2012-11-01  111  
f6130be652d0b4f Ashish Jangam       2012-11-01  112  	switch (mode) {
f6130be652d0b4f Ashish Jangam       2012-11-01  113  	case REGULATOR_MODE_FAST:
f6130be652d0b4f Ashish Jangam       2012-11-01  114  		val = DA9055_BUCK_MODE_SYNC << info->mode.shift;
f6130be652d0b4f Ashish Jangam       2012-11-01  115  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  116  	case REGULATOR_MODE_NORMAL:
f6130be652d0b4f Ashish Jangam       2012-11-01  117  		val = DA9055_BUCK_MODE_AUTO << info->mode.shift;
f6130be652d0b4f Ashish Jangam       2012-11-01  118  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  119  	case REGULATOR_MODE_STANDBY:
f6130be652d0b4f Ashish Jangam       2012-11-01  120  		val = DA9055_BUCK_MODE_SLEEP << info->mode.shift;
f6130be652d0b4f Ashish Jangam       2012-11-01  121  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  122  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  123  
f6130be652d0b4f Ashish Jangam       2012-11-01  124  	return da9055_reg_update(regulator->da9055, info->mode.reg,
f6130be652d0b4f Ashish Jangam       2012-11-01  125  				 info->mode.mask, val);
f6130be652d0b4f Ashish Jangam       2012-11-01  126  }
f6130be652d0b4f Ashish Jangam       2012-11-01  127  
f6130be652d0b4f Ashish Jangam       2012-11-01  128  static unsigned int da9055_ldo_get_mode(struct regulator_dev *rdev)
f6130be652d0b4f Ashish Jangam       2012-11-01  129  {
f6130be652d0b4f Ashish Jangam       2012-11-01  130  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  131  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  132  	int ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  133  
f6130be652d0b4f Ashish Jangam       2012-11-01  134  	ret = da9055_reg_read(regulator->da9055, info->volt.reg_b);
f6130be652d0b4f Ashish Jangam       2012-11-01  135  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  136  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  137  
f6130be652d0b4f Ashish Jangam       2012-11-01  138  	if (ret >> info->volt.sl_shift)
f6130be652d0b4f Ashish Jangam       2012-11-01  139  		return REGULATOR_MODE_STANDBY;
f6130be652d0b4f Ashish Jangam       2012-11-01  140  	else
f6130be652d0b4f Ashish Jangam       2012-11-01  141  		return REGULATOR_MODE_NORMAL;
f6130be652d0b4f Ashish Jangam       2012-11-01  142  }
f6130be652d0b4f Ashish Jangam       2012-11-01  143  
f6130be652d0b4f Ashish Jangam       2012-11-01  144  static int da9055_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
f6130be652d0b4f Ashish Jangam       2012-11-01  145  {
f6130be652d0b4f Ashish Jangam       2012-11-01  146  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  147  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  148  	struct da9055_volt_reg volt = info->volt;
f6130be652d0b4f Ashish Jangam       2012-11-01  149  	int val = 0;
f6130be652d0b4f Ashish Jangam       2012-11-01  150  
f6130be652d0b4f Ashish Jangam       2012-11-01  151  	switch (mode) {
f6130be652d0b4f Ashish Jangam       2012-11-01  152  	case REGULATOR_MODE_NORMAL:
f6130be652d0b4f Ashish Jangam       2012-11-01  153  	case REGULATOR_MODE_FAST:
f6130be652d0b4f Ashish Jangam       2012-11-01  154  		val = DA9055_LDO_MODE_SYNC;
f6130be652d0b4f Ashish Jangam       2012-11-01  155  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  156  	case REGULATOR_MODE_STANDBY:
f6130be652d0b4f Ashish Jangam       2012-11-01  157  		val = DA9055_LDO_MODE_SLEEP;
f6130be652d0b4f Ashish Jangam       2012-11-01  158  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  159  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  160  
f6130be652d0b4f Ashish Jangam       2012-11-01  161  	return da9055_reg_update(regulator->da9055, volt.reg_b,
f6130be652d0b4f Ashish Jangam       2012-11-01  162  				 1 << volt.sl_shift,
f6130be652d0b4f Ashish Jangam       2012-11-01  163  				 val << volt.sl_shift);
f6130be652d0b4f Ashish Jangam       2012-11-01  164  }
f6130be652d0b4f Ashish Jangam       2012-11-01  165  
f6130be652d0b4f Ashish Jangam       2012-11-01  166  static int da9055_regulator_get_voltage_sel(struct regulator_dev *rdev)
f6130be652d0b4f Ashish Jangam       2012-11-01  167  {
f6130be652d0b4f Ashish Jangam       2012-11-01  168  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  169  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  170  	struct da9055_volt_reg volt = info->volt;
f6130be652d0b4f Ashish Jangam       2012-11-01  171  	int ret, sel;
f6130be652d0b4f Ashish Jangam       2012-11-01  172  
f6130be652d0b4f Ashish Jangam       2012-11-01  173  	/*
f6130be652d0b4f Ashish Jangam       2012-11-01  174  	 * There are two voltage register set A & B for voltage ramping but
f6130be652d0b4f Ashish Jangam       2012-11-01  175  	 * either one of then can be active therefore we first determine
f6130be652d0b4f Ashish Jangam       2012-11-01  176  	 * the active register set.
f6130be652d0b4f Ashish Jangam       2012-11-01  177  	 */
f6130be652d0b4f Ashish Jangam       2012-11-01  178  	ret = da9055_reg_read(regulator->da9055, info->conf.reg);
f6130be652d0b4f Ashish Jangam       2012-11-01  179  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  180  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  181  
f6130be652d0b4f Ashish Jangam       2012-11-01  182  	ret &= info->conf.sel_mask;
f6130be652d0b4f Ashish Jangam       2012-11-01  183  
f6130be652d0b4f Ashish Jangam       2012-11-01  184  	/* Get the voltage for the active register set A/B */
f6130be652d0b4f Ashish Jangam       2012-11-01  185  	if (ret == DA9055_REGUALTOR_SET_A)
f6130be652d0b4f Ashish Jangam       2012-11-01  186  		ret = da9055_reg_read(regulator->da9055, volt.reg_a);
f6130be652d0b4f Ashish Jangam       2012-11-01  187  	else
f6130be652d0b4f Ashish Jangam       2012-11-01  188  		ret = da9055_reg_read(regulator->da9055, volt.reg_b);
f6130be652d0b4f Ashish Jangam       2012-11-01  189  
f6130be652d0b4f Ashish Jangam       2012-11-01  190  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  191  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  192  
f6130be652d0b4f Ashish Jangam       2012-11-01  193  	sel = (ret & volt.v_mask);
f6130be652d0b4f Ashish Jangam       2012-11-01  194  	return sel;
f6130be652d0b4f Ashish Jangam       2012-11-01  195  }
f6130be652d0b4f Ashish Jangam       2012-11-01  196  
f6130be652d0b4f Ashish Jangam       2012-11-01  197  static int da9055_regulator_set_voltage_sel(struct regulator_dev *rdev,
f6130be652d0b4f Ashish Jangam       2012-11-01  198  					    unsigned int selector)
f6130be652d0b4f Ashish Jangam       2012-11-01  199  {
f6130be652d0b4f Ashish Jangam       2012-11-01  200  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  201  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  202  	int ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  203  
f6130be652d0b4f Ashish Jangam       2012-11-01  204  	/*
f6130be652d0b4f Ashish Jangam       2012-11-01  205  	 * Regulator register set A/B is not selected through GPIO therefore
f6130be652d0b4f Ashish Jangam       2012-11-01  206  	 * we use default register set A for voltage ramping.
f6130be652d0b4f Ashish Jangam       2012-11-01  207  	 */
f6130be652d0b4f Ashish Jangam       2012-11-01 @208  	if (regulator->reg_rselect == NO_GPIO) {
f6130be652d0b4f Ashish Jangam       2012-11-01  209  		/* Select register set A */
f6130be652d0b4f Ashish Jangam       2012-11-01  210  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4f Ashish Jangam       2012-11-01  211  					info->conf.sel_mask, DA9055_SEL_REG_A);
f6130be652d0b4f Ashish Jangam       2012-11-01  212  		if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  213  			return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  214  
f6130be652d0b4f Ashish Jangam       2012-11-01  215  		/* Set the voltage */
369cf602f364a60 Axel Lin            2012-11-20  216  		return da9055_reg_update(regulator->da9055, info->volt.reg_a,
369cf602f364a60 Axel Lin            2012-11-20  217  					 info->volt.v_mask, selector);
f6130be652d0b4f Ashish Jangam       2012-11-01  218  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  219  
f6130be652d0b4f Ashish Jangam       2012-11-01  220  	/*
f6130be652d0b4f Ashish Jangam       2012-11-01  221  	 * Here regulator register set A/B is selected through GPIO.
f6130be652d0b4f Ashish Jangam       2012-11-01  222  	 * Therefore we first determine the selected register set A/B and
f6130be652d0b4f Ashish Jangam       2012-11-01  223  	 * then set the desired voltage for that register set A/B.
f6130be652d0b4f Ashish Jangam       2012-11-01  224  	 */
f6130be652d0b4f Ashish Jangam       2012-11-01  225  	ret = da9055_reg_read(regulator->da9055, info->conf.reg);
f6130be652d0b4f Ashish Jangam       2012-11-01  226  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  227  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  228  
f6130be652d0b4f Ashish Jangam       2012-11-01  229  	ret &= info->conf.sel_mask;
f6130be652d0b4f Ashish Jangam       2012-11-01  230  
f6130be652d0b4f Ashish Jangam       2012-11-01  231  	/* Set the voltage */
f6130be652d0b4f Ashish Jangam       2012-11-01  232  	if (ret == DA9055_REGUALTOR_SET_A)
369cf602f364a60 Axel Lin            2012-11-20  233  		return da9055_reg_update(regulator->da9055, info->volt.reg_a,
369cf602f364a60 Axel Lin            2012-11-20  234  					 info->volt.v_mask, selector);
f6130be652d0b4f Ashish Jangam       2012-11-01  235  	else
369cf602f364a60 Axel Lin            2012-11-20  236  		return da9055_reg_update(regulator->da9055, info->volt.reg_b,
369cf602f364a60 Axel Lin            2012-11-20  237  					 info->volt.v_mask, selector);
f6130be652d0b4f Ashish Jangam       2012-11-01  238  }
f6130be652d0b4f Ashish Jangam       2012-11-01  239  
f6130be652d0b4f Ashish Jangam       2012-11-01  240  static int da9055_regulator_set_suspend_voltage(struct regulator_dev *rdev,
f6130be652d0b4f Ashish Jangam       2012-11-01  241  						int uV)
f6130be652d0b4f Ashish Jangam       2012-11-01  242  {
f6130be652d0b4f Ashish Jangam       2012-11-01  243  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  244  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  245  	int ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  246  
f6130be652d0b4f Ashish Jangam       2012-11-01  247  	/* Select register set B for suspend voltage ramping. */
f6130be652d0b4f Ashish Jangam       2012-11-01  248  	if (regulator->reg_rselect == NO_GPIO) {
f6130be652d0b4f Ashish Jangam       2012-11-01  249  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4f Ashish Jangam       2012-11-01  250  					info->conf.sel_mask, DA9055_SEL_REG_B);
f6130be652d0b4f Ashish Jangam       2012-11-01  251  		if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  252  			return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  253  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  254  
6b1f8a45666877d Axel Lin            2012-11-27  255  	ret = regulator_map_voltage_linear(rdev, uV, uV);
f6130be652d0b4f Ashish Jangam       2012-11-01  256  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  257  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  258  
369cf602f364a60 Axel Lin            2012-11-20  259  	return da9055_reg_update(regulator->da9055, info->volt.reg_b,
369cf602f364a60 Axel Lin            2012-11-20  260  				 info->volt.v_mask, ret);
f6130be652d0b4f Ashish Jangam       2012-11-01  261  }
f6130be652d0b4f Ashish Jangam       2012-11-01  262  
f6130be652d0b4f Ashish Jangam       2012-11-01  263  static int da9055_suspend_enable(struct regulator_dev *rdev)
f6130be652d0b4f Ashish Jangam       2012-11-01  264  {
f6130be652d0b4f Ashish Jangam       2012-11-01  265  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  266  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  267  
f6130be652d0b4f Ashish Jangam       2012-11-01  268  	/* Select register set B for voltage ramping. */
f6130be652d0b4f Ashish Jangam       2012-11-01 @269  	if (regulator->reg_rselect == NO_GPIO)
f6130be652d0b4f Ashish Jangam       2012-11-01  270  		return da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4f Ashish Jangam       2012-11-01  271  					info->conf.sel_mask, DA9055_SEL_REG_B);
f6130be652d0b4f Ashish Jangam       2012-11-01  272  	else
f6130be652d0b4f Ashish Jangam       2012-11-01  273  		return 0;
f6130be652d0b4f Ashish Jangam       2012-11-01  274  }
f6130be652d0b4f Ashish Jangam       2012-11-01  275  

:::::: The code at line 77 was first introduced by commit
:::::: f6130be652d0b4fbf710d83a816298c007e59ed1 regulator: DA9055 regulator driver

:::::: TO: Ashish Jangam <ashish.jangam@kpitcummins.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
