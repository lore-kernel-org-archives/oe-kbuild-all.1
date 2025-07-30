Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0DE55B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 07:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859125; cv=none; b=nAIHm0Iy0KAycbAQ+tY0sPmHMeAXC9L4dcUzYyrGMx6Ro8ftPdREPhz7/B8ZNk+QZ8+DKSRkVNgRkJ/UhexfaDkzipQTARIZDAuHxhgjAvLb6YdfN+6loxkoi1fjs/ZnEzmact6Knhdl0u6OOVDe1BE2c9Y2SlM2zWcRc4kcbPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859125; c=relaxed/simple;
	bh=44CcRz7PsA3dqiAUsMEXwlM9MZjLRh7AHlsQsDXPhqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw0B7Uv2J9eVdDLforA4vLcI6JH42cKP6K9rMTyQw735gzw4UV3v4zbLW3wYOk+9PB/gQijvhGyl6ZmIPa12dtX6MprkfH4sK1XPIZGQyvC4ewVj1lAxuUDk8s08VoXiAGKSFyX6SZUAMmrOhUEG8IzIzHbLk4qfEfF6Hak/6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uhy6g6eb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uhy6g6eb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753859124; x=1785395124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=44CcRz7PsA3dqiAUsMEXwlM9MZjLRh7AHlsQsDXPhqE=;
  b=Uhy6g6eb6pSim6x08Gu5O13cy1PPa5uMJ50Gt1WbQmZCMe5YNkxdAmdo
   eyUsLI50AONT8F1JpSzh2xyp9ds4cGH2vFFIH+5CtZ5bErEhMXHqqgeGR
   zh79lvlWXFfvUqvUDEJ+pA1MpYH9kEoyiyqDz/ojI0tldft1xEjhwYd+P
   FRVwopd9wTOmLA+pEGwm9oZ0C0TddKwH6fdPca7RhNQ1JEPco3bIrw1T1
   kDkEusTs/MrcvarQgwhLYh41k3HFS4/+jl96fqJVfgb7kRNB6/t4wF8XC
   ezHGLFxJ+eQf5M+alBtykehGssJE1VBzbHaYhw/rdwRtHnMRAWRqJyc6m
   g==;
X-CSE-ConnectionGUID: 4FfiQEF3TMKrirrlWHlCgg==
X-CSE-MsgGUID: w0z0IE7iReWkWyAe+yu3kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="58770961"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="58770961"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 00:05:23 -0700
X-CSE-ConnectionGUID: ugxYLMV1Qf62pmwT1HOCfg==
X-CSE-MsgGUID: v4+FIMAdTRqZxmLdlZJA0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163254838"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Jul 2025 00:05:22 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh0sJ-00028u-2E;
	Wed, 30 Jul 2025 07:05:19 +0000
Date: Wed, 30 Jul 2025 15:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] gpio: remove legacy GPIO line value setter callbacks
Message-ID: <202507301446.52ufgnWr-lkp@intel.com>
References: <20250725074651.14002-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725074651.14002-1-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.16 next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-remove-legacy-GPIO-line-value-setter-callbacks/20250725-154843
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250725074651.14002-1-brgl%40bgdev.pl
patch subject: [PATCH] gpio: remove legacy GPIO line value setter callbacks
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250730/202507301446.52ufgnWr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301446.52ufgnWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301446.52ufgnWr-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mach-s3c/gpio-samsung.c: In function 'samsung_gpiolib_add':
>> arch/arm/mach-s3c/gpio-samsung.c:519:18: error: 'struct gpio_chip' has no member named 'set'; did you mean 'get'?
     519 |         if (!gc->set)
         |                  ^~~
         |                  get


vim +519 arch/arm/mach-s3c/gpio-samsung.c

1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  493  
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  494  /*
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  495   * samsung_gpiolib_add() - add the Samsung gpio_chip.
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  496   * @chip: The chip to register
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  497   *
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  498   * This is a wrapper to gpiochip_add() that takes our specific gpio chip
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  499   * information and makes the necessary alterations for the platform and
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  500   * notes the information for use with the configuration systems and any
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  501   * other parts of the system.
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  502   */
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  503  
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  504  static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  505  {
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  506  	struct gpio_chip *gc = &chip->chip;
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  507  	int ret;
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  508  
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  509  	BUG_ON(!chip->base);
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  510  	BUG_ON(!gc->label);
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  511  	BUG_ON(!gc->ngpio);
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  512  
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  513  	spin_lock_init(&chip->lock);
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  514  
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  515  	if (!gc->direction_input)
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  516  		gc->direction_input = samsung_gpiolib_2bit_input;
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  517  	if (!gc->direction_output)
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  518  		gc->direction_output = samsung_gpiolib_2bit_output;
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30 @519  	if (!gc->set)
fb52f3226cab41 arch/arm/mach-s3c/gpio-samsung.c Bartosz Golaszewski 2025-04-07  520  		gc->set_rv = samsung_gpiolib_set;
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  521  	if (!gc->get)
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  522  		gc->get = samsung_gpiolib_get;
1b39d5f2cc5c28 drivers/gpio/gpio-samsung.c      Kukjin Kim          2011-08-30  523  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
