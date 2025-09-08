Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6FF1EFF8B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 20:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757361770; cv=none; b=SsQ45Iz3+YYZqLh1RCQXBASoaeY31e3xHp38cEz/HJE4osGuSoRS+BIGqq/Uoi721ulfC/ACCYJHe3K7IXw5+nk8n4L+0XKVqI0nHelh4fddHxaXGHKAE1XP+GL8zkYoKDD7dvGizjBQyYWzBRn+FJ8BA1A3M+Hbza5lSR2tWf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757361770; c=relaxed/simple;
	bh=7DOP+7F2mn8xBOqn8zohU2fZyfjzOo/Gx5CGf4Zo840=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BggU0ptkD/16HvrIqizyrPPZ67o1+qTnnEUlCqMUWzl6z8cHsFPB5IbGZpq6CcJDct+IDL6q0xJtlpt65W8IY2Au+OHPlcXB6T2Evi9xeNqxYoOpoykgw4HgFss2whb2ZD1aJejbyX8B9AJD/dHUypz5hypCz6JnhCbUS1w/TOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtiiVnJz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtiiVnJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757361769; x=1788897769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7DOP+7F2mn8xBOqn8zohU2fZyfjzOo/Gx5CGf4Zo840=;
  b=GtiiVnJzkfwaGHew++M/ZhpLpDR7lWS5QmS4cW4XwogB4HuKy5uWu4y6
   b2OybFzp83ha2zLNsDP/Q7oEkJykRPUN5paODVZP1vdHJEv+tF+a8Kf//
   5UUlKKojtMCUPYQWAlVKM443cKW7etwfNBEuGbAZo1Y1eCXaRxohPgZIY
   eJlqO0yQ9u8+Ig4TxDkr9+Cv6HVSkxUoxgXamay+zQNQ0j++5QiSAJaE7
   W2byRbURckpb9DsIuj/hvkQhx7hH8xyFzqWtdUVAs8fIIqXrtfP0a3YVk
   63GGIS46P8BQDekKQq3o+u+EWzhFPgiAdu4OfCk3NAKchtas8nAyCuqzL
   A==;
X-CSE-ConnectionGUID: MMmrnz0wTHOdjI6DY4CulQ==
X-CSE-MsgGUID: 36f+FqSxQSSa5wEHUY6vzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70732128"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="70732128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 13:02:46 -0700
X-CSE-ConnectionGUID: /Sl2FUhRQ4KOZTq0Jxxl6w==
X-CSE-MsgGUID: gTr/fpAHT8e/neTJAB80kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="172759587"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Sep 2025 13:02:41 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvi4U-00047f-0u;
	Mon, 08 Sep 2025 20:02:38 +0000
Date: Tue, 9 Sep 2025 04:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Tobias Sperling <tobias.sperling@softing.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Esteban Blanc <eblanc@baylibre.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	Hans de Goede <hansg@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iio: adc: Support ROHM BD79112 ADC/GPIO
Message-ID: <202509090302.DzgxdNbE-lkp@intel.com>
References: <3cc1faffcb4f71f0755b6192f193acecd36bea67.1757053456.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cc1faffcb4f71f0755b6192f193acecd36bea67.1757053456.git.mazziesaccount@gmail.com>

Hi Matti,

kernel test robot noticed the following build errors:

[auto build test ERROR on d1487b0b78720b86ec2a2ac7acc683ec90627e5b]

url:    https://github.com/intel-lab-lkp/linux/commits/Matti-Vaittinen/dt-bindings-iio-adc-ROHM-BD79112-ADC-GPIO/20250905-144454
base:   d1487b0b78720b86ec2a2ac7acc683ec90627e5b
patch link:    https://lore.kernel.org/r/3cc1faffcb4f71f0755b6192f193acecd36bea67.1757053456.git.mazziesaccount%40gmail.com
patch subject: [PATCH v3 2/3] iio: adc: Support ROHM BD79112 ADC/GPIO
config: i386-randconfig-r133-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090302.DzgxdNbE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090302.DzgxdNbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090302.DzgxdNbE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "spi_sync" [drivers/base/regmap/regmap-spi.ko] undefined!
>> ERROR: modpost: "spi_async" [drivers/base/regmap/regmap-spi.ko] undefined!
>> ERROR: modpost: "spi_write_then_read" [drivers/base/regmap/regmap-spi.ko] undefined!
>> ERROR: modpost: "__spi_register_driver" [drivers/iio/adc/rohm-bd79112.ko] undefined!
>> ERROR: modpost: "spi_sync" [drivers/iio/adc/rohm-bd79112.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [m]:
   - ROHM_BD79112 [=m] && IIO [=m] && I2C [=y] && GPIOLIB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
