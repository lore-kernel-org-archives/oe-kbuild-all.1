Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1879DD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 20:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675803214; x=1707339214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8HVPQko0pHpLHJJu5kZ8ASYtbx3D0XkF6VXHDh2Llzk=;
  b=cRztPyztpW3O0u3x9dYYGxrXQNA0DwKCUD+TjEJ+iNOc1tE4L3CFdEoL
   ot+7uQbPpSg8GveM3p3PUCRepBFs6RNC1zIYzovbBQxMFohkZi2UdU2n+
   DUyPGUPr/zopaboO5WO70JfEn18JeMxWL+9xg5G4MEAbSiqDRiYmMLCLy
   tdsVo5hAtvioSNxIfsCB9NUeSgLm9OptgXRZ45Tt9bIuKv1omAtlVwq9P
   XbFzbfov979x1gG8ibKOgzPTtZ8YotP5s09ODT8BPh8tSzKEMdOTVVah6
   wh5RUeNgROYhF4X/lVqA6uIkjXebqSumdm3SsVZZk0mP7kUTil5acx2ly
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="357003174"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="357003174"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 12:53:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="735674081"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="735674081"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Feb 2023 12:53:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPUy3-0003so-2z;
	Tue, 07 Feb 2023 20:53:31 +0000
Date: Wed, 8 Feb 2023 04:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 12/12] gpiolib: Clean up headers
Message-ID: <202302080412.kZeKWUuw-lkp@intel.com>
References: <20230207142952.51844-13-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207142952.51844-13-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on next-20230207]
[cannot apply to powerpc/next powerpc/fixes soc/for-next linus/master v6.2-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpiolib-remove-empty-asm-gpio-h-files/20230207-223652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20230207142952.51844-13-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v3 12/12] gpiolib: Clean up headers
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230208/202302080412.kZeKWUuw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1b29af54a98628e27cdabe2554fbf29b75a1c18b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-remove-empty-asm-gpio-h-files/20230207-223652
        git checkout 1b29af54a98628e27cdabe2554fbf29b75a1c18b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-regmap.c: In function 'gpio_regmap_register':
   drivers/gpio/gpio-regmap.c:256:40: error: implicit declaration of function 'dev_name' [-Werror=implicit-function-declaration]
     256 |         chip->label = config->label ?: dev_name(config->parent);
         |                                        ^~~~~~~~
>> drivers/gpio/gpio-regmap.c:256:38: warning: pointer/integer type mismatch in conditional expression
     256 |         chip->label = config->label ?: dev_name(config->parent);
         |                                      ^
   drivers/gpio/gpio-regmap.c: In function 'devm_gpio_regmap_register':
   drivers/gpio/gpio-regmap.c:329:15: error: implicit declaration of function 'devm_add_action_or_reset' [-Werror=implicit-function-declaration]
     329 |         ret = devm_add_action_or_reset(dev, devm_gpio_regmap_unregister, gpio);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +256 drivers/gpio/gpio-regmap.c

ebe363197e525ff Michael Walle          2020-05-28  191  
ebe363197e525ff Michael Walle          2020-05-28  192  /**
ebe363197e525ff Michael Walle          2020-05-28  193   * gpio_regmap_register() - Register a generic regmap GPIO controller
ebe363197e525ff Michael Walle          2020-05-28  194   * @config: configuration for gpio_regmap
ebe363197e525ff Michael Walle          2020-05-28  195   *
ebe363197e525ff Michael Walle          2020-05-28  196   * Return: A pointer to the registered gpio_regmap or ERR_PTR error value.
ebe363197e525ff Michael Walle          2020-05-28  197   */
ebe363197e525ff Michael Walle          2020-05-28  198  struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config)
ebe363197e525ff Michael Walle          2020-05-28  199  {
ebe363197e525ff Michael Walle          2020-05-28  200  	struct gpio_regmap *gpio;
ebe363197e525ff Michael Walle          2020-05-28  201  	struct gpio_chip *chip;
ebe363197e525ff Michael Walle          2020-05-28  202  	int ret;
ebe363197e525ff Michael Walle          2020-05-28  203  
ebe363197e525ff Michael Walle          2020-05-28  204  	if (!config->parent)
ebe363197e525ff Michael Walle          2020-05-28  205  		return ERR_PTR(-EINVAL);
ebe363197e525ff Michael Walle          2020-05-28  206  
ebe363197e525ff Michael Walle          2020-05-28  207  	if (!config->ngpio)
ebe363197e525ff Michael Walle          2020-05-28  208  		return ERR_PTR(-EINVAL);
ebe363197e525ff Michael Walle          2020-05-28  209  
ebe363197e525ff Michael Walle          2020-05-28  210  	/* we need at least one */
ebe363197e525ff Michael Walle          2020-05-28  211  	if (!config->reg_dat_base && !config->reg_set_base)
ebe363197e525ff Michael Walle          2020-05-28  212  		return ERR_PTR(-EINVAL);
ebe363197e525ff Michael Walle          2020-05-28  213  
ebe363197e525ff Michael Walle          2020-05-28  214  	/* if we have a direction register we need both input and output */
ebe363197e525ff Michael Walle          2020-05-28  215  	if ((config->reg_dir_out_base || config->reg_dir_in_base) &&
ebe363197e525ff Michael Walle          2020-05-28  216  	    (!config->reg_dat_base || !config->reg_set_base))
ebe363197e525ff Michael Walle          2020-05-28  217  		return ERR_PTR(-EINVAL);
ebe363197e525ff Michael Walle          2020-05-28  218  
ebe363197e525ff Michael Walle          2020-05-28  219  	/* we don't support having both registers simultaneously for now */
ebe363197e525ff Michael Walle          2020-05-28  220  	if (config->reg_dir_out_base && config->reg_dir_in_base)
ebe363197e525ff Michael Walle          2020-05-28  221  		return ERR_PTR(-EINVAL);
ebe363197e525ff Michael Walle          2020-05-28  222  
ebe363197e525ff Michael Walle          2020-05-28  223  	gpio = kzalloc(sizeof(*gpio), GFP_KERNEL);
ebe363197e525ff Michael Walle          2020-05-28  224  	if (!gpio)
ebe363197e525ff Michael Walle          2020-05-28  225  		return ERR_PTR(-ENOMEM);
ebe363197e525ff Michael Walle          2020-05-28  226  
ebe363197e525ff Michael Walle          2020-05-28  227  	gpio->parent = config->parent;
9b3c47f124b6077 Michael Walle          2021-06-05  228  	gpio->driver_data = config->drvdata;
ebe363197e525ff Michael Walle          2020-05-28  229  	gpio->regmap = config->regmap;
ebe363197e525ff Michael Walle          2020-05-28  230  	gpio->ngpio_per_reg = config->ngpio_per_reg;
ebe363197e525ff Michael Walle          2020-05-28  231  	gpio->reg_stride = config->reg_stride;
ebe363197e525ff Michael Walle          2020-05-28  232  	gpio->reg_mask_xlate = config->reg_mask_xlate;
ebe363197e525ff Michael Walle          2020-05-28  233  	gpio->reg_dat_base = config->reg_dat_base;
ebe363197e525ff Michael Walle          2020-05-28  234  	gpio->reg_set_base = config->reg_set_base;
ebe363197e525ff Michael Walle          2020-05-28  235  	gpio->reg_clr_base = config->reg_clr_base;
ebe363197e525ff Michael Walle          2020-05-28  236  	gpio->reg_dir_in_base = config->reg_dir_in_base;
ebe363197e525ff Michael Walle          2020-05-28  237  	gpio->reg_dir_out_base = config->reg_dir_out_base;
ebe363197e525ff Michael Walle          2020-05-28  238  
ebe363197e525ff Michael Walle          2020-05-28  239  	/* if not set, assume there is only one register */
ebe363197e525ff Michael Walle          2020-05-28  240  	if (!gpio->ngpio_per_reg)
ebe363197e525ff Michael Walle          2020-05-28  241  		gpio->ngpio_per_reg = config->ngpio;
ebe363197e525ff Michael Walle          2020-05-28  242  
ebe363197e525ff Michael Walle          2020-05-28  243  	/* if not set, assume they are consecutive */
ebe363197e525ff Michael Walle          2020-05-28  244  	if (!gpio->reg_stride)
ebe363197e525ff Michael Walle          2020-05-28  245  		gpio->reg_stride = 1;
ebe363197e525ff Michael Walle          2020-05-28  246  
ebe363197e525ff Michael Walle          2020-05-28  247  	if (!gpio->reg_mask_xlate)
ebe363197e525ff Michael Walle          2020-05-28  248  		gpio->reg_mask_xlate = gpio_regmap_simple_xlate;
ebe363197e525ff Michael Walle          2020-05-28  249  
ebe363197e525ff Michael Walle          2020-05-28  250  	chip = &gpio->gpio_chip;
ebe363197e525ff Michael Walle          2020-05-28  251  	chip->parent = config->parent;
f21ecad451c9b33 Andy Shevchenko        2021-12-23  252  	chip->fwnode = config->fwnode;
ebe363197e525ff Michael Walle          2020-05-28  253  	chip->base = -1;
ebe363197e525ff Michael Walle          2020-05-28  254  	chip->ngpio = config->ngpio;
ebe363197e525ff Michael Walle          2020-05-28  255  	chip->names = config->names;
ebe363197e525ff Michael Walle          2020-05-28 @256  	chip->label = config->label ?: dev_name(config->parent);
297a44f664a8ac2 Michael Walle          2023-01-05  257  	chip->can_sleep = regmap_might_sleep(config->regmap);
ebe363197e525ff Michael Walle          2020-05-28  258  
ebe363197e525ff Michael Walle          2020-05-28  259  	chip->get = gpio_regmap_get;
ebe363197e525ff Michael Walle          2020-05-28  260  	if (gpio->reg_set_base && gpio->reg_clr_base)
ebe363197e525ff Michael Walle          2020-05-28  261  		chip->set = gpio_regmap_set_with_clear;
ebe363197e525ff Michael Walle          2020-05-28  262  	else if (gpio->reg_set_base)
ebe363197e525ff Michael Walle          2020-05-28  263  		chip->set = gpio_regmap_set;
ebe363197e525ff Michael Walle          2020-05-28  264  
ebe363197e525ff Michael Walle          2020-05-28  265  	chip->get_direction = gpio_regmap_get_direction;
8978277c229b950 William Breathitt Gray 2022-12-27  266  	if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {
ebe363197e525ff Michael Walle          2020-05-28  267  		chip->direction_input = gpio_regmap_direction_input;
ebe363197e525ff Michael Walle          2020-05-28  268  		chip->direction_output = gpio_regmap_direction_output;
ebe363197e525ff Michael Walle          2020-05-28  269  	}
ebe363197e525ff Michael Walle          2020-05-28  270  
ebe363197e525ff Michael Walle          2020-05-28  271  	ret = gpiochip_add_data(chip, gpio);
ebe363197e525ff Michael Walle          2020-05-28  272  	if (ret < 0)
ebe363197e525ff Michael Walle          2020-05-28  273  		goto err_free_gpio;
ebe363197e525ff Michael Walle          2020-05-28  274  
ebe363197e525ff Michael Walle          2020-05-28  275  	if (config->irq_domain) {
ebe363197e525ff Michael Walle          2020-05-28  276  		ret = gpiochip_irqchip_add_domain(chip, config->irq_domain);
ebe363197e525ff Michael Walle          2020-05-28  277  		if (ret)
ebe363197e525ff Michael Walle          2020-05-28  278  			goto err_remove_gpiochip;
ebe363197e525ff Michael Walle          2020-05-28  279  	}
ebe363197e525ff Michael Walle          2020-05-28  280  
ebe363197e525ff Michael Walle          2020-05-28  281  	return gpio;
ebe363197e525ff Michael Walle          2020-05-28  282  
ebe363197e525ff Michael Walle          2020-05-28  283  err_remove_gpiochip:
ebe363197e525ff Michael Walle          2020-05-28  284  	gpiochip_remove(chip);
ebe363197e525ff Michael Walle          2020-05-28  285  err_free_gpio:
ebe363197e525ff Michael Walle          2020-05-28  286  	kfree(gpio);
ebe363197e525ff Michael Walle          2020-05-28  287  	return ERR_PTR(ret);
ebe363197e525ff Michael Walle          2020-05-28  288  }
ebe363197e525ff Michael Walle          2020-05-28  289  EXPORT_SYMBOL_GPL(gpio_regmap_register);
ebe363197e525ff Michael Walle          2020-05-28  290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
