Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9733A35950
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738375198; cv=none; b=tc4GtwSrOEEqB5iEAMojD4KXjFj86k43cBqGCiirXVpsalkKS+zRFkfl+TAL6o8Lpzrn7GIdQOSCAEyaEaJx6O/AYk/q35+TDOYbD4NAdaAFoJL5GEQnaV3hi68AqBRhvqMvsWPWQS9hS06MBWJiSoF2iQ+RViEtTJmlJl4ocq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738375198; c=relaxed/simple;
	bh=WUVcA0thqOx6j0sSpZYT1JH/tijd9l46ehtNr5YyZvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MSlRMliYNZrDkgFpoR9x+p65Ax/h2MI0BqD4FYJR7pWAcn5kp215zOudqi9w7mt/1d9eJI2j3aENHGLJsToxcQDNRJiWmhAaTPO/ff4379H7w10QbJCi2RQ97Ypbp5jdnbqbei9hNug60bP2zErE4GpEoTHxwzsIvBxjpF8lrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnEGtOVX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnEGtOVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738375197; x=1769911197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WUVcA0thqOx6j0sSpZYT1JH/tijd9l46ehtNr5YyZvQ=;
  b=AnEGtOVX92yGfgeEzCvCjFlxE9/HUgDyYrJtcVCA4+E1k6IKBfYiKVp4
   u/kyFSUCxKChLFiPgYr+nVpPXRz/8Q78+3mL+gUFnmFy35uhLcj4oadQK
   3tq21OmrKnuSzMNUH8RnYFxcDfUFpLnonfSK/gTY3zGU1WdL9BlurUd4B
   RUVfY4i1TlydvyV2zWbwNdhcP0mBQ1hEbFNDA8QuWO+rplDHhCFrwGW8T
   seqGzy44LHw4YG5WGcL/MHswSKViTaXRGGSbysiY7dXyxLbvL6mPRhIqH
   QJdJKVw4p27hTEsGUV9AoQaaiFc8DunQ1JfWyhhbL8LnrEcrYSdwAT+7J
   w==;
X-CSE-ConnectionGUID: 1leQ5UASSGO119rRHETl1w==
X-CSE-MsgGUID: +4F5v93gTLSE9CnFFOU8WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="41784471"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="41784471"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 17:59:56 -0800
X-CSE-ConnectionGUID: 6SryX1W4ThCd+Y0sLOKyGg==
X-CSE-MsgGUID: N2sn1ZCKQ+WzNO8FiKXw4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146972930"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2025 17:59:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te2nY-000nbD-1S;
	Sat, 01 Feb 2025 01:59:52 +0000
Date: Sat, 1 Feb 2025 09:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:irqdesc 5/5] drivers/gpio/gpiolib.c:1936: warning:
 Excess function parameter 'lock_key' description in 'gpiochip_add_irqchip'
Message-ID: <202502010954.4mHiUThI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux irqdesc
head:   0a8325ed89ae6643481ec1c84b05f592d7ad0208
commit: 0a8325ed89ae6643481ec1c84b05f592d7ad0208 [5/5] irq: Simplify gpiochip_add_data()
config: x86_64-buildonly-randconfig-003-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010954.4mHiUThI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010954.4mHiUThI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010954.4mHiUThI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib.c:1936: warning: Excess function parameter 'lock_key' description in 'gpiochip_add_irqchip'
>> drivers/gpio/gpiolib.c:1936: warning: Excess function parameter 'request_key' description in 'gpiochip_add_irqchip'


vim +1936 drivers/gpio/gpiolib.c

081bfdb303abaf Andy Shevchenko   2023-06-21  1925  
e0d89728981393 Thierry Reding    2017-11-07  1926  /**
e0d89728981393 Thierry Reding    2017-11-07  1927   * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
a0b66a73785ccc Linus Walleij     2020-03-29  1928   * @gc: the GPIO chip to add the IRQ chip to
39c3fd58952d75 Andrew Lunn       2017-12-02  1929   * @lock_key: lockdep class for IRQ lock
39c3fd58952d75 Andrew Lunn       2017-12-02  1930   * @request_key: lockdep class for IRQ request
94bd9ce16063a2 Andy Shevchenko   2024-08-28  1931   *
94bd9ce16063a2 Andy Shevchenko   2024-08-28  1932   * Returns:
94bd9ce16063a2 Andy Shevchenko   2024-08-28  1933   * 0 on success, or a negative errno on failure.
e0d89728981393 Thierry Reding    2017-11-07  1934   */
0a8325ed89ae66 Bart Van Assche   2025-01-31  1935  static int gpiochip_add_irqchip(struct gpio_chip *gc)
e0d89728981393 Thierry Reding    2017-11-07 @1936  {
5c63a9dbab55be Andy Shevchenko   2021-03-09  1937  	struct fwnode_handle *fwnode = dev_fwnode(&gc->gpiodev->dev);
a0b66a73785ccc Linus Walleij     2020-03-29  1938  	struct irq_chip *irqchip = gc->irq.chip;
39f3ad73d4465d Andy Shevchenko   2023-06-21  1939  	struct irq_domain *domain;
e0d89728981393 Thierry Reding    2017-11-07  1940  	unsigned int type;
e0d89728981393 Thierry Reding    2017-11-07  1941  	unsigned int i;
eec349dbe4fa27 Andy Shevchenko   2023-06-21  1942  	int ret;
e0d89728981393 Thierry Reding    2017-11-07  1943  
e0d89728981393 Thierry Reding    2017-11-07  1944  	if (!irqchip)
e0d89728981393 Thierry Reding    2017-11-07  1945  		return 0;
e0d89728981393 Thierry Reding    2017-11-07  1946  
a0b66a73785ccc Linus Walleij     2020-03-29  1947  	if (gc->irq.parent_handler && gc->can_sleep) {
a0b66a73785ccc Linus Walleij     2020-03-29  1948  		chip_err(gc, "you cannot have chained interrupts on a chip that may sleep\n");
e0d89728981393 Thierry Reding    2017-11-07  1949  		return -EINVAL;
e0d89728981393 Thierry Reding    2017-11-07  1950  	}
e0d89728981393 Thierry Reding    2017-11-07  1951  
a0b66a73785ccc Linus Walleij     2020-03-29  1952  	type = gc->irq.default_type;
e0d89728981393 Thierry Reding    2017-11-07  1953  
e0d89728981393 Thierry Reding    2017-11-07  1954  	/*
e0d89728981393 Thierry Reding    2017-11-07  1955  	 * Specifying a default trigger is a terrible idea if DT or ACPI is
e0d89728981393 Thierry Reding    2017-11-07  1956  	 * used to configure the interrupts, as you may end up with
e0d89728981393 Thierry Reding    2017-11-07  1957  	 * conflicting triggers. Tell the user, and reset to NONE.
e0d89728981393 Thierry Reding    2017-11-07  1958  	 */
5c63a9dbab55be Andy Shevchenko   2021-03-09  1959  	if (WARN(fwnode && type != IRQ_TYPE_NONE,
5c63a9dbab55be Andy Shevchenko   2021-03-09  1960  		 "%pfw: Ignoring %u default trigger\n", fwnode, type))
e0d89728981393 Thierry Reding    2017-11-07  1961  		type = IRQ_TYPE_NONE;
e0d89728981393 Thierry Reding    2017-11-07  1962  
a0b66a73785ccc Linus Walleij     2020-03-29  1963  	gc->irq.default_type = type;
e0d89728981393 Thierry Reding    2017-11-07  1964  
fdd61a013a24f2 Linus Walleij     2019-08-08  1965  	/* If a parent irqdomain is provided, let's build a hierarchy */
a0b66a73785ccc Linus Walleij     2020-03-29  1966  	if (gpiochip_hierarchy_is_hierarchical(gc)) {
39f3ad73d4465d Andy Shevchenko   2023-06-21  1967  		domain = gpiochip_hierarchy_create_domain(gc);
fdd61a013a24f2 Linus Walleij     2019-08-08  1968  	} else {
39f3ad73d4465d Andy Shevchenko   2023-06-21  1969  		domain = gpiochip_simple_create_domain(gc);
fdd61a013a24f2 Linus Walleij     2019-08-08  1970  	}
39f3ad73d4465d Andy Shevchenko   2023-06-21  1971  	if (IS_ERR(domain))
39f3ad73d4465d Andy Shevchenko   2023-06-21  1972  		return PTR_ERR(domain);
e0d89728981393 Thierry Reding    2017-11-07  1973  
a0b66a73785ccc Linus Walleij     2020-03-29  1974  	if (gc->irq.parent_handler) {
a0b66a73785ccc Linus Walleij     2020-03-29  1975  		for (i = 0; i < gc->irq.num_parents; i++) {
cfe6807d82e97e Marc Zyngier      2021-10-26  1976  			void *data;
cfe6807d82e97e Marc Zyngier      2021-10-26  1977  
cfe6807d82e97e Marc Zyngier      2021-10-26  1978  			if (gc->irq.per_parent_data)
cfe6807d82e97e Marc Zyngier      2021-10-26  1979  				data = gc->irq.parent_handler_data_array[i];
cfe6807d82e97e Marc Zyngier      2021-10-26  1980  			else
cfe6807d82e97e Marc Zyngier      2021-10-26  1981  				data = gc->irq.parent_handler_data ?: gc;
cfe6807d82e97e Marc Zyngier      2021-10-26  1982  
e0d89728981393 Thierry Reding    2017-11-07  1983  			/*
e0d89728981393 Thierry Reding    2017-11-07  1984  			 * The parent IRQ chip is already using the chip_data
e0d89728981393 Thierry Reding    2017-11-07  1985  			 * for this IRQ chip, so our callbacks simply use the
e0d89728981393 Thierry Reding    2017-11-07  1986  			 * handler_data.
e0d89728981393 Thierry Reding    2017-11-07  1987  			 */
a0b66a73785ccc Linus Walleij     2020-03-29  1988  			irq_set_chained_handler_and_data(gc->irq.parents[i],
a0b66a73785ccc Linus Walleij     2020-03-29  1989  							 gc->irq.parent_handler,
e0d89728981393 Thierry Reding    2017-11-07  1990  							 data);
e0d89728981393 Thierry Reding    2017-11-07  1991  		}
e0d89728981393 Thierry Reding    2017-11-07  1992  	}
e0d89728981393 Thierry Reding    2017-11-07  1993  
a0b66a73785ccc Linus Walleij     2020-03-29  1994  	gpiochip_set_irq_hooks(gc);
ca620f2de153d6 Hans Verkuil      2018-09-08  1995  
eec349dbe4fa27 Andy Shevchenko   2023-06-21  1996  	ret = gpiochip_irqchip_add_allocated_domain(gc, domain, false);
eec349dbe4fa27 Andy Shevchenko   2023-06-21  1997  	if (ret)
eec349dbe4fa27 Andy Shevchenko   2023-06-21  1998  		return ret;
5467801f1fcbdc Shreeya Patel     2022-03-21  1999  
06fb4ecfeac7e0 Mario Limonciello 2022-04-22  2000  	acpi_gpiochip_request_interrupts(gc);
06fb4ecfeac7e0 Mario Limonciello 2022-04-22  2001  
e0d89728981393 Thierry Reding    2017-11-07  2002  	return 0;
e0d89728981393 Thierry Reding    2017-11-07  2003  }
e0d89728981393 Thierry Reding    2017-11-07  2004  

:::::: The code at line 1936 was first introduced by commit
:::::: e0d89728981393b7d694bd3419b7794b9882c92d gpio: Implement tighter IRQ chip integration

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
