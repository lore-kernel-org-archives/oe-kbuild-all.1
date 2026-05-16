Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661AC3CF694
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926292; cv=none; b=g9b2JGYNbGF4zuUwEeWhwh8N++kn7OxzzK8AXpqncra0IynSMWEnMzotL5gWpYo72NrMX7YB70JmZIRCj3WxglhembtvJI6mx320vNFgv8LcwTWtBgsldP5F30iDohh21gGT9+f/JsWSNyyQhialm7uZtl1ACYHhfJ86v2W31z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926292; c=relaxed/simple;
	bh=m0DQ9mV6AjFu0/dbI88RWhdc1DYkzGF2vKrEOsoaPgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6o7vEKDGwrDS6GNNfuOtWPo4/W2NMmCDcYAnMN3aofuqPAFCxodCJFcRgz2TqF8IufkOi70gieb7dhZrIfU9YSFUzOXO4pJfD4XP9XKasHJkJ5V8h3rH3pya8kiWFStD+BAa8H3vlPbBSfOAQVR1EL6oQIj0lolmCHeurz+pKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9RjS7uz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9RjS7uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778926291; x=1810462291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m0DQ9mV6AjFu0/dbI88RWhdc1DYkzGF2vKrEOsoaPgE=;
  b=m9RjS7uzH4y1G85hQ4jDxDqTLmNkKV2wokYtBcpeT69Wuctuxvg7h7mF
   mQWv2GukYsolaFNUTyC9+wT9M2g0Ow3Jyacr2uacOC0z2ihhcD/VEju0q
   9JRnTaFGbU6hCIpqaxHFEd2ImH9UpJ83RApfkA2JXDsBO0nYimD6nCBIc
   DAnytuZvwEoSH2BG0VI7mol0enVLpZZju3awy27Yz6+sUCX9QcXsduK1c
   jRFvSnpUE/Jgrqy0lxGcKi1nbtDHpe/AjSHxpX2lyf/XfBteoVbZCkr0s
   /BT9CiWnvzofph1ZXIXyI2HhyNrlBgzEYRzkam61RVnPepqsR7HAZWKSt
   w==;
X-CSE-ConnectionGUID: SKu6hAOjRxWvjnI1CtfbBg==
X-CSE-MsgGUID: K6GfrCNiR6W/onlbnordzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79001172"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79001172"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 03:11:30 -0700
X-CSE-ConnectionGUID: rb0ZqTdVQeakYpSiam6GBg==
X-CSE-MsgGUID: C0aKR/qRQ1qDof3zPd2nAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="269291637"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 May 2026 03:11:29 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOBzS-000000000iH-013q;
	Sat, 16 May 2026 10:11:26 +0000
Date: Sat, 16 May 2026 18:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] i2c: i2c-gpio Enhance driver for buses with shared
 SCL
Message-ID: <202605161836.Pd84kaCN-lkp@intel.com>
References: <20260514092042.3265986-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514092042.3265986-1-markus.stockhausen@gmx.de>

Hi Markus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/i2c-i2c-gpio-Enhance-driver-for-buses-with-shared-SCL/20260514-233812
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20260514092042.3265986-1-markus.stockhausen%40gmx.de
patch subject: [RFC PATCH] i2c: i2c-gpio Enhance driver for buses with shared SCL
config: um-randconfig-r073-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161836.Pd84kaCN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161836.Pd84kaCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161836.Pd84kaCN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-gpio.c: In function 'i2c_gpio_fi_act_on_scl_irq':
>> drivers/i2c/busses/i2c-gpio.c:197:41: error: passing argument 1 of 'gpiod_to_irq' from incompatible pointer type [-Wincompatible-pointer-types]
     197 |         int ret, irq = gpiod_to_irq(priv->scl);
         |                                     ~~~~^~~~~
         |                                         |
         |                                         struct i2c_gpio_scl_data *
   In file included from drivers/i2c/busses/i2c-gpio.c:10:
   include/linux/gpio/consumer.h:169:42: note: expected 'const struct gpio_desc *' but argument is of type 'struct i2c_gpio_scl_data *'
     169 | int gpiod_to_irq(const struct gpio_desc *desc);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/i2c/busses/i2c-gpio.c:204:41: error: passing argument 1 of 'gpiod_direction_input' from incompatible pointer type [-Wincompatible-pointer-types]
     204 |         ret = gpiod_direction_input(priv->scl);
         |                                     ~~~~^~~~~
         |                                         |
         |                                         struct i2c_gpio_scl_data *
   include/linux/gpio/consumer.h:114:45: note: expected 'struct gpio_desc *' but argument is of type 'struct i2c_gpio_scl_data *'
     114 | int gpiod_direction_input(struct gpio_desc *desc);
         |                           ~~~~~~~~~~~~~~~~~~^~~~
>> drivers/i2c/busses/i2c-gpio.c:219:42: error: passing argument 1 of 'gpiod_direction_output' from incompatible pointer type [-Wincompatible-pointer-types]
     219 |         ret = gpiod_direction_output(priv->scl, 1) ?: ret;
         |                                      ~~~~^~~~~
         |                                          |
         |                                          struct i2c_gpio_scl_data *
   include/linux/gpio/consumer.h:115:46: note: expected 'struct gpio_desc *' but argument is of type 'struct i2c_gpio_scl_data *'
     115 | int gpiod_direction_output(struct gpio_desc *desc, int value);
         |                            ~~~~~~~~~~~~~~~~~~^~~~


vim +/gpiod_to_irq +197 drivers/i2c/busses/i2c-gpio.c

bbe899700a44af Wolfram Sang 2018-06-29  193  
63e57b6f191db9 Wolfram Sang 2019-02-19  194  static int i2c_gpio_fi_act_on_scl_irq(struct i2c_gpio_private_data *priv,
63e57b6f191db9 Wolfram Sang 2019-02-19  195  				       irqreturn_t handler(int, void*))
63e57b6f191db9 Wolfram Sang 2019-02-19  196  {
63e57b6f191db9 Wolfram Sang 2019-02-19 @197  	int ret, irq = gpiod_to_irq(priv->scl);
63e57b6f191db9 Wolfram Sang 2019-02-19  198  
63e57b6f191db9 Wolfram Sang 2019-02-19  199  	if (irq < 0)
63e57b6f191db9 Wolfram Sang 2019-02-19  200  		return irq;
63e57b6f191db9 Wolfram Sang 2019-02-19  201  
63e57b6f191db9 Wolfram Sang 2019-02-19  202  	i2c_lock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
63e57b6f191db9 Wolfram Sang 2019-02-19  203  
63e57b6f191db9 Wolfram Sang 2019-02-19 @204  	ret = gpiod_direction_input(priv->scl);
63e57b6f191db9 Wolfram Sang 2019-02-19  205  	if (ret)
63e57b6f191db9 Wolfram Sang 2019-02-19  206  		goto unlock;
63e57b6f191db9 Wolfram Sang 2019-02-19  207  
63e57b6f191db9 Wolfram Sang 2019-02-19  208  	reinit_completion(&priv->scl_irq_completion);
63e57b6f191db9 Wolfram Sang 2019-02-19  209  
63e57b6f191db9 Wolfram Sang 2019-02-19  210  	ret = request_irq(irq, handler, IRQF_TRIGGER_FALLING,
63e57b6f191db9 Wolfram Sang 2019-02-19  211  			  "i2c_gpio_fault_injector_scl_irq", priv);
63e57b6f191db9 Wolfram Sang 2019-02-19  212  	if (ret)
63e57b6f191db9 Wolfram Sang 2019-02-19  213  		goto output;
63e57b6f191db9 Wolfram Sang 2019-02-19  214  
63e57b6f191db9 Wolfram Sang 2019-02-19  215  	wait_for_completion_interruptible(&priv->scl_irq_completion);
63e57b6f191db9 Wolfram Sang 2019-02-19  216  
63e57b6f191db9 Wolfram Sang 2019-02-19  217  	free_irq(irq, priv);
63e57b6f191db9 Wolfram Sang 2019-02-19  218   output:
63e57b6f191db9 Wolfram Sang 2019-02-19 @219  	ret = gpiod_direction_output(priv->scl, 1) ?: ret;
63e57b6f191db9 Wolfram Sang 2019-02-19  220   unlock:
63e57b6f191db9 Wolfram Sang 2019-02-19  221  	i2c_unlock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
63e57b6f191db9 Wolfram Sang 2019-02-19  222  
63e57b6f191db9 Wolfram Sang 2019-02-19  223  	return ret;
63e57b6f191db9 Wolfram Sang 2019-02-19  224  }
63e57b6f191db9 Wolfram Sang 2019-02-19  225  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
