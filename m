Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C371DA55
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 04:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766809861; cv=none; b=dkL/1QF5OYqT+FrFdtEHGuPOZvOBSUQN+ZeBXLVYg8XePmFclj8yA9SBYs6radpcWlkT+7NXsDENs3llMAJ4UhHDXhUcJndZ9boCeGGE+Cs/ZXQVEy5mgtro7hBkb16d/LKLZWC/eqUjzx3kDjKmdr9+aSJZUQizWuQ+5s5vMRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766809861; c=relaxed/simple;
	bh=gE71B9P+oK1WaVpSfncZrZ51FRioLW5nF6puQheR7xc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BjhS41Nqf8Pv0YoALG+9rwXG6TWFhXoqkdnZJxsA0ZKs7LyuT/Fd/dvI0QD9f6GAnlkM6aRIiCBhbap/UZ37qcw7Xje2ABusU+pQ9tDt8AlrISNgEPPIIHXGwiQ0Y7UhT7n4wx1H2Mb8hMIly6dHw8zdCSNISj+ieztbqm3zTUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGHICw4G; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGHICw4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766809859; x=1798345859;
  h=date:from:to:cc:subject:message-id;
  bh=gE71B9P+oK1WaVpSfncZrZ51FRioLW5nF6puQheR7xc=;
  b=eGHICw4G25dp5sJrWAdUhTBlkax0v4Zj9MFOiTg/LrGbAdLDxhKo7llJ
   hjWbF6echQvi9DR4RXSEkc4U7kGDSRVqpMTyCHaSaNgVOtVnvvdQ/ySOX
   wMTixF9Qa2GXejrM2acNLmpaIJ0Y1x1EytNk4/+xH88e4Wxv23TLb4AW8
   iXvLraF6z7cpRgD0x4TkzCGSH97sF8pqLJlnpWyjbc1YaK+YnRUh0cdVB
   NtPQMqjfdlJhrUgdh9NIeiQxSKOH8d1hMdBLK4pfF/qGbjf4LCQl/2YSO
   L22imtDomk2rkvBUpsQEBhUtvyqTVpDi82JMCtjkwTiv6We3uhA4+yCbc
   w==;
X-CSE-ConnectionGUID: j14tNi6wRkGUpc4Z6PprmQ==
X-CSE-MsgGUID: fqItRaf+QMSFC0rspVWB8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79167597"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79167597"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 20:30:59 -0800
X-CSE-ConnectionGUID: Vmbq2I/PR9ClzSgEX4HfbA==
X-CSE-MsgGUID: YWKzRFqwR2Sb7M8viNPt8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205028257"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Dec 2025 20:30:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZLx2-000000005XF-3vxr;
	Sat, 27 Dec 2025 04:30:49 +0000
Date: Sat, 27 Dec 2025 12:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Santos <Jonathan.Santos@analog.com>
Subject: drivers/iio/adc/ad7768-1.c:420: undefined reference to
 `gpiochip_get_data'
Message-ID: <202512271235.WwAmAbOa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   04688d6128b7c8b4ccec2913e7f2ff1c4437da96
commit: d569ae0f052e0e44db0e1d69110eba13f5060223 iio: adc: ad7768-1: Add GPIO controller support
date:   6 months ago
config: parisc-randconfig-001-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271235.WwAmAbOa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271235.WwAmAbOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271235.WwAmAbOa-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/iio/adc/ad7768-1.o: in function `ad7768_gpio_get':
>> drivers/iio/adc/ad7768-1.c:420: undefined reference to `gpiochip_get_data'
   hppa-linux-ld: drivers/iio/adc/ad7768-1.o: in function `ad7768_gpio_set':
   drivers/iio/adc/ad7768-1.c:453: undefined reference to `gpiochip_get_data'
   hppa-linux-ld: drivers/iio/adc/ad7768-1.o: in function `ad7768_gpio_init':
>> drivers/iio/adc/ad7768-1.c:498: undefined reference to `devm_gpiochip_add_data_with_key'
   hppa-linux-ld: drivers/iio/adc/ad7768-1.o: in function `ad7768_gpio_direction_input':
   drivers/iio/adc/ad7768-1.c:387: undefined reference to `gpiochip_get_data'
   hppa-linux-ld: drivers/iio/adc/ad7768-1.o: in function `ad7768_gpio_direction_output':
   drivers/iio/adc/ad7768-1.c:404: undefined reference to `gpiochip_get_data'


vim +420 drivers/iio/adc/ad7768-1.c

   417	
   418	static int ad7768_gpio_get(struct gpio_chip *chip, unsigned int offset)
   419	{
 > 420		struct iio_dev *indio_dev = gpiochip_get_data(chip);
   421		struct ad7768_state *st = iio_priv(indio_dev);
   422		unsigned int val;
   423		int ret;
   424	
   425		if (!iio_device_claim_direct(indio_dev))
   426			return -EBUSY;
   427	
   428		ret = regmap_read(st->regmap, AD7768_REG_GPIO_CONTROL, &val);
   429		if (ret)
   430			goto err_release;
   431	
   432		/*
   433		 * If the GPIO is configured as an output, read the current value from
   434		 * AD7768_REG_GPIO_WRITE. Otherwise, read the input value from
   435		 * AD7768_REG_GPIO_READ.
   436		 */
   437		if (val & BIT(offset))
   438			ret = regmap_read(st->regmap, AD7768_REG_GPIO_WRITE, &val);
   439		else
   440			ret = regmap_read(st->regmap, AD7768_REG_GPIO_READ, &val);
   441		if (ret)
   442			goto err_release;
   443	
   444		ret = !!(val & BIT(offset));
   445	err_release:
   446		iio_device_release_direct(indio_dev);
   447	
   448		return ret;
   449	}
   450	
   451	static int ad7768_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
   452	{
   453		struct iio_dev *indio_dev = gpiochip_get_data(chip);
   454		struct ad7768_state *st = iio_priv(indio_dev);
   455		unsigned int val;
   456		int ret;
   457	
   458		if (!iio_device_claim_direct(indio_dev))
   459			return -EBUSY;
   460	
   461		ret = regmap_read(st->regmap, AD7768_REG_GPIO_CONTROL, &val);
   462		if (ret)
   463			goto err_release;
   464	
   465		if (val & BIT(offset))
   466			ret = regmap_assign_bits(st->regmap, AD7768_REG_GPIO_WRITE,
   467						 BIT(offset), value);
   468	
   469	err_release:
   470		iio_device_release_direct(indio_dev);
   471	
   472		return ret;
   473	}
   474	
   475	static int ad7768_gpio_init(struct iio_dev *indio_dev)
   476	{
   477		struct ad7768_state *st = iio_priv(indio_dev);
   478		int ret;
   479	
   480		ret = regmap_write(st->regmap, AD7768_REG_GPIO_CONTROL,
   481				   AD7768_GPIO_UNIVERSAL_EN);
   482		if (ret)
   483			return ret;
   484	
   485		st->gpiochip = (struct gpio_chip) {
   486			.label = "ad7768_1_gpios",
   487			.base = -1,
   488			.ngpio = 4,
   489			.parent = &st->spi->dev,
   490			.can_sleep = true,
   491			.direction_input = ad7768_gpio_direction_input,
   492			.direction_output = ad7768_gpio_direction_output,
   493			.get = ad7768_gpio_get,
   494			.set_rv = ad7768_gpio_set,
   495			.owner = THIS_MODULE,
   496		};
   497	
 > 498		return devm_gpiochip_add_data(&st->spi->dev, &st->gpiochip, indio_dev);
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
