Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2FF2417D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 04:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785473305; cv=none; b=ovEAOgF0xisNmY2StsgZE9/zDR3KG+K7EZp8ekXYIFhlJErHWVQxWzP+d0cfi8Og+L1/FWjTZGpn2hVSFwlcDUtBfgg+CfMzogcirxLV1jIDuM3IvNKVkxr9QBDI8/tlC4TGOc7XyHoFUgSRaMZhQqzzHdBh7eY+xQ1F+hzTFtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785473305; c=relaxed/simple;
	bh=prHNrsRtGXKHF2DH29MsI3cFdXm0ulCiQdVHpSpjczk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ozgMQlVMV7FgzmKF2z9M0I0RYNBe5G2vFmZd7gbmwKyuvroNhETRXd86KBGxxt54G8d6goyFmhsX+1hSjE9W5CEWZsxChmNkEV/re5JyjktNuJSwMcIQpmqfliSPN7mk4mT2KmPLr7CguPC+A3QoOH4qekgbBOk0D2uwyx0pcDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXEuJJwW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXEuJJwW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785473304; x=1817009304;
  h=date:from:to:cc:subject:message-id;
  bh=prHNrsRtGXKHF2DH29MsI3cFdXm0ulCiQdVHpSpjczk=;
  b=EXEuJJwW7cLbzAQjuArg7/1iMf8i1iBSAp2S0QEbDg85qqcVHKKMGwTz
   BowylHvOUCIbX8C/YOP3F88iBrdPZeaVDJjjNLktpZHScA3yiGuWWBO/L
   HzM8ZbcoMxuY53bzvytRvL2VGU8UI5b2XMdCBzqj+ra+2XQmp0kKpe6Mn
   nLnCTRxASYnWbvwzadGs+zRfeXJdgCbOacg0oOPIf4Q2H1698VtrmyQk4
   w0QfLn7ssckTSbOHgk/NTP1Rf04HSxZRSD+GmmnOtb+ZZHwXLlwxylHXj
   ZbEx2rH2NKv3D59yeudM+fuAFLTCFU8ogy4TwMt+nWFG3gmLKg5I67Jji
   A==;
X-CSE-ConnectionGUID: lDt+0r5RTyeUlJ54Ijcdbw==
X-CSE-MsgGUID: aMelsxjiRfGKhYlci8Fi/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85971535"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="85971535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 21:48:23 -0700
X-CSE-ConnectionGUID: rGNPFvJMQmqoI1Il7MDy+w==
X-CSE-MsgGUID: Nm+2BZ2DR8OHdX7aUewZWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="257806806"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jul 2026 21:48:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpfAP-00000000085-3GR2;
	Fri, 31 Jul 2026 04:48:17 +0000
Date: Fri, 31 Jul 2026 12:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Michael Walle <mwalle@kernel.org>,
 "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>,
 Linus Walleij <linusw@kernel.org>,
 "Yu-Chun Lin" <eleanor.lin@realtek.com>
Subject: [linux-next:master 10548/10862]
 drivers/gpio/gpio-regmap.c:423:40: error: 'struct regmap_irq_chip' has no
 member named 'irq_reqres'
Message-ID: <202607311248.9rNtrp3c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95d6a9ccef99117115e41e9adb271243bd5e985b
commit: 2da8b903cf7039338e6cc1b1d0e9f9e1cf9159c3 [10548/10862] gpio: regmap: Apply default resource callbacks for regmap IRQ chip
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311248.9rNtrp3c-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311248.9rNtrp3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311248.9rNtrp3c-lkp@intel.com/

Note: the linux-next/master HEAD 95d6a9ccef99117115e41e9adb271243bd5e985b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-regmap.c: In function 'gpio_regmap_register':
>> drivers/gpio/gpio-regmap.c:423:40: error: 'struct regmap_irq_chip' has no member named 'irq_reqres'
     423 |                 config->regmap_irq_chip->irq_reqres = gpio_regmap_irq_reqres;
         |                                        ^~
>> drivers/gpio/gpio-regmap.c:424:40: error: 'struct regmap_irq_chip' has no member named 'irq_relres'
     424 |                 config->regmap_irq_chip->irq_relres = gpio_regmap_irq_relres;
         |                                        ^~


vim +423 drivers/gpio/gpio-regmap.c

   307	
   308	/**
   309	 * gpio_regmap_register() - Register a generic regmap GPIO controller
   310	 * @config: configuration for gpio_regmap
   311	 *
   312	 * Return: A pointer to the registered gpio_regmap or ERR_PTR error value.
   313	 */
   314	struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config)
   315	{
   316		struct irq_domain *irq_domain;
   317		struct gpio_regmap *gpio;
   318		struct gpio_chip *chip;
   319		int ret;
   320	
   321		if (!config->parent)
   322			return ERR_PTR(-EINVAL);
   323	
   324		/* we need at least one */
   325		if (!config->reg_dat_base && !config->reg_set_base)
   326			return ERR_PTR(-EINVAL);
   327	
   328		/* if we have a direction register we need both input and output */
   329		if ((config->reg_dir_out_base || config->reg_dir_in_base) &&
   330		    (!config->reg_dat_base || !config->reg_set_base))
   331			return ERR_PTR(-EINVAL);
   332	
   333		/* we don't support having both registers simultaneously for now */
   334		if (config->reg_dir_out_base && config->reg_dir_in_base)
   335			return ERR_PTR(-EINVAL);
   336	
   337		gpio = kzalloc_obj(*gpio);
   338		if (!gpio)
   339			return ERR_PTR(-ENOMEM);
   340	
   341		gpio->parent = config->parent;
   342		gpio->driver_data = config->drvdata;
   343		gpio->regmap = config->regmap;
   344		gpio->reg_dat_base = config->reg_dat_base;
   345		gpio->reg_set_base = config->reg_set_base;
   346		gpio->reg_clr_base = config->reg_clr_base;
   347		gpio->reg_dir_in_base = config->reg_dir_in_base;
   348		gpio->reg_dir_out_base = config->reg_dir_out_base;
   349	
   350		chip = &gpio->gpio_chip;
   351		chip->parent = config->parent;
   352		chip->fwnode = config->fwnode;
   353		chip->base = -1;
   354		chip->names = config->names;
   355		chip->label = config->label ?: dev_name(config->parent);
   356		chip->can_sleep = regmap_might_sleep(config->regmap);
   357		chip->init_valid_mask = config->init_valid_mask;
   358	
   359		chip->request = gpiochip_generic_request;
   360		chip->free = gpiochip_generic_free;
   361		chip->get = gpio_regmap_get;
   362		if (gpio->reg_set_base && gpio->reg_clr_base)
   363			chip->set = gpio_regmap_set_with_clear;
   364		else if (gpio->reg_set_base)
   365			chip->set = gpio_regmap_set;
   366	
   367		chip->get_direction = gpio_regmap_get_direction;
   368		if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {
   369			chip->direction_input = gpio_regmap_direction_input;
   370			chip->direction_output = gpio_regmap_direction_output;
   371		}
   372	
   373		chip->ngpio = config->ngpio;
   374		if (!chip->ngpio) {
   375			ret = gpiochip_get_ngpios(chip, chip->parent);
   376			if (ret)
   377				goto err_free_gpio;
   378		}
   379	
   380		if (config->fixed_direction_mask) {
   381			gpio->fixed_direction_mask = bitmap_alloc(chip->ngpio,
   382								    GFP_KERNEL);
   383			if (!gpio->fixed_direction_mask) {
   384				ret = -ENOMEM;
   385				goto err_free_gpio;
   386			}
   387			bitmap_copy(gpio->fixed_direction_mask,
   388				    config->fixed_direction_mask, chip->ngpio);
   389		}
   390	
   391		if (config->fixed_direction_output) {
   392			gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
   393								    GFP_KERNEL);
   394			if (!gpio->fixed_direction_output) {
   395				ret = -ENOMEM;
   396				goto err_free_bitmap_dirmask;
   397			}
   398			bitmap_copy(gpio->fixed_direction_output,
   399				    config->fixed_direction_output, chip->ngpio);
   400		}
   401	
   402		/* if not set, assume there is only one register */
   403		gpio->ngpio_per_reg = config->ngpio_per_reg;
   404		if (!gpio->ngpio_per_reg)
   405			gpio->ngpio_per_reg = config->ngpio;
   406	
   407		/* if not set, assume they are consecutive */
   408		gpio->reg_stride = config->reg_stride;
   409		if (!gpio->reg_stride)
   410			gpio->reg_stride = 1;
   411	
   412		gpio->reg_mask_xlate = config->reg_mask_xlate;
   413		if (!gpio->reg_mask_xlate)
   414			gpio->reg_mask_xlate = gpio_regmap_simple_xlate;
   415	
   416		ret = gpiochip_add_data(chip, gpio);
   417		if (ret < 0)
   418			goto err_free_bitmap_output;
   419	
   420	#ifdef CONFIG_REGMAP_IRQ
   421		if (config->regmap_irq_chip) {
   422			gpio->regmap_irq_line = config->regmap_irq_line;
 > 423			config->regmap_irq_chip->irq_reqres = gpio_regmap_irq_reqres;
 > 424			config->regmap_irq_chip->irq_relres = gpio_regmap_irq_relres;
   425			config->regmap_irq_chip->irq_drv_data = gpio;
   426			ret = regmap_add_irq_chip_fwnode(dev_fwnode(config->parent), config->regmap,
   427							 config->regmap_irq_line, config->regmap_irq_flags,
   428							 0, config->regmap_irq_chip, &gpio->irq_chip_data);
   429			if (ret)
   430				goto err_remove_gpiochip;
   431	
   432			irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
   433		} else
   434	#endif
   435		irq_domain = config->irq_domain;
   436	
   437		if (irq_domain) {
   438			ret = gpiochip_irqchip_add_domain(chip, irq_domain);
   439			if (ret)
   440				goto err_remove_gpiochip;
   441		}
   442	
   443		return gpio;
   444	
   445	err_remove_gpiochip:
   446		gpiochip_remove(chip);
   447	err_free_bitmap_output:
   448		bitmap_free(gpio->fixed_direction_output);
   449	err_free_bitmap_dirmask:
   450		bitmap_free(gpio->fixed_direction_mask);
   451	err_free_gpio:
   452		kfree(gpio);
   453		return ERR_PTR(ret);
   454	}
   455	EXPORT_SYMBOL_GPL(gpio_regmap_register);
   456	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
