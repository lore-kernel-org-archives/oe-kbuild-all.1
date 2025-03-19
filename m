Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378251A5B9F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742393637; cv=none; b=XGwk3PhMkuc17pf7Yvz5OIrAuYYG7GfW6d8DAfl8ss/ZNhzJPKNR63uC1MRH4ijQ4YY9dleE3N+oGtpHU0ci8uzkyKYq4uIVN5Bez6vxA56E/blRkp9hW/sabjfHjLnjvYOsDG+xvANwa882MVRHWCZfh+Dwtv0Ist6ic85h0g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742393637; c=relaxed/simple;
	bh=BZNSVpFNwNZdH7Y5Wmut6AGNIs+zP+EaMJw3jvThsx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkX9rsrPpHs7EFkxeA5hRBdEi1MEx4xM84UA0GEGVgWxPonOIstUuBiHWsIytan3QlJRyhP0uXfNX4q6+CYB0cWVypUECEjpDWxsxXM6QZ8/bnmCrhVze2v9oJ6WKyMjHqILsXhDe5GtXHSSRYFW94jWYbzwKkEI3MO+2UAYboU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sw2vvZbY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sw2vvZbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742393636; x=1773929636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BZNSVpFNwNZdH7Y5Wmut6AGNIs+zP+EaMJw3jvThsx0=;
  b=Sw2vvZbY8KL1WJh+Whh874DLlSwn/UIc0JkU5F23Gbz1zc/koQuSX6D1
   NmN/Mfe2L4Wz1cdN9GyhFaiacMhLEgmKvdWQCI+Z98fFNw/6VVritXmhw
   DNBmF1dEGbbNxYhHmgVshMcOGZlvEXkoJ9trtltswsXyMNkhSy6w1h4Fu
   ediwbAq6C7R6TLQTTAGHTONBAhin3/c8enXMWCl9lOsU50v6NLaBMxyNX
   Gf1Y9c+BFb5jqq8ASdujIciVQGaFsAFR02jciMBXp7dvPA1ho5nXbPXiG
   KKb/maS4TxVzQccbgac0LMpNW28BYetoqBJMjMveckOAUFEut9P+taDKB
   w==;
X-CSE-ConnectionGUID: QrxOUq6VToO0TyvjPNAP8g==
X-CSE-MsgGUID: ef1YCzszRxmPCVYQ+MrEUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43601168"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43601168"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 07:13:56 -0700
X-CSE-ConnectionGUID: qET96VOmRlKskkekdQKbZA==
X-CSE-MsgGUID: u8jj9rvZSjeuk9bbK6ER9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123126357"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Mar 2025 07:13:50 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuuAs-000Eiu-1v;
	Wed, 19 Mar 2025 14:13:41 +0000
Date: Wed, 19 Mar 2025 22:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
	andriy.shevchenko@intel.com,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH v5 08/11] gpio: max7360: Add MAX7360 gpio support
Message-ID: <202503192257.KfRkL589-lkp@intel.com>
References: <20250318-mdb-max7360-support-v5-8-fb20baf97da0@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-mdb-max7360-support-v5-8-fb20baf97da0@bootlin.com>

Hi Mathieu,

kernel test robot noticed the following build errors:

[auto build test ERROR on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Dubois-Briand/dt-bindings-mfd-gpio-Add-MAX7360/20250319-003750
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250318-mdb-max7360-support-v5-8-fb20baf97da0%40bootlin.com
patch subject: [PATCH v5 08/11] gpio: max7360: Add MAX7360 gpio support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250319/202503192257.KfRkL589-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503192257.KfRkL589-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503192257.KfRkL589-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-max7360.c: In function 'max7360_set_gpos_count':
>> drivers/gpio/gpio-max7360.c:78:8: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     val = FIELD_PREP(MAX7360_PORTS, available_gpios);
           ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +78 drivers/gpio/gpio-max7360.c

    55	
    56	static int max7360_set_gpos_count(struct device *dev, struct regmap *regmap)
    57	{
    58		/*
    59		 * MAX7360 COL0 to COL7 pins can be used either as keypad columns,
    60		 * general purpose output or a mix of both.
    61		 * By default, all pins are used as keypad, here we update this
    62		 * configuration to allow to use some of them as GPIOs.
    63		 */
    64		unsigned int available_gpios;
    65		unsigned int val;
    66		int ret;
    67	
    68		ret = max7360_get_available_gpos(dev, &available_gpios);
    69		if (ret)
    70			return ret;
    71	
    72		/*
    73		 * Configure which GPIOs will be used for keypad.
    74		 * MAX7360_REG_DEBOUNCE contains configuration both for keypad debounce
    75		 * timings and gpos/keypad columns repartition. Only the later is
    76		 * modified here.
    77		 */
  > 78		val = FIELD_PREP(MAX7360_PORTS, available_gpios);
    79		ret = regmap_write_bits(regmap, MAX7360_REG_DEBOUNCE, MAX7360_PORTS, val);
    80		if (ret) {
    81			dev_err(dev, "Failed to write max7360 columns/gpos configuration");
    82			return ret;
    83		}
    84	
    85		return 0;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
