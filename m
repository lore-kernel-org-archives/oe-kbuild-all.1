Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9D56CDA3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714925258; cv=none; b=eGG/YrDnHE3vkJ4rB/ZEudpQQ7FMuEIU43JJeoC71c8UIkQMTrEYAdLa6Djd++ujHsl9G8XCxHCGRGT9n9L8XnStWS9OyC2kUvrXBSPfz7+wUMDEYih5DH+1XmD3KEyCAzAq/YKdWgHRQK1xlOxNPOyeaCHPfPYgVxXE69OT7XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714925258; c=relaxed/simple;
	bh=+AH6EZuNz7nmMSiPntEHb4CSCKreaaySv+jUzP2w5Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o9b7z9g30M5LUgj6+u53P+Ag4LMnIfndgkEolra2yl6cg4mcl39zKztCPJqbtDZo8PxnyTGkhohG/MOuuyoRcOFxcwx2hTX3fGS9D9NM42keyE4PmCMMbeUTsVGTVswN0jhoQVcInFaXnMlEegaZbtN++aA/1+bsI4ZA5r6j3IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsO0YB7v; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsO0YB7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714925257; x=1746461257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+AH6EZuNz7nmMSiPntEHb4CSCKreaaySv+jUzP2w5Oc=;
  b=gsO0YB7vopqoqUDQf9MXE0YzwgiIsThnC2wGV/jHcrIcJ448bzDu2OkH
   OU47ykmO7A3yQRE5KqIkUGB8i6N46jVcslPRd1UA3DRkjXqPnCUpOI/s5
   z4q2iF7d7TF/I3iPb2JCklr6PjsWjlZSijAm3HDD3I9qIcEiYgXr+vZIz
   H+A4+8XGHD/oPI+peG+Lxp+EtOj+jqgC+rxg3iivRCRsnU/ZY+A+rjY2t
   kg8+XRe+P2HZoW2IDZyBy1KKyWsHfNNga9bYdpX9Q30wFPxlQy2Enjm7h
   N6ei3JnPyMjwyfoUT0TcCXjOImqGK7Hq9zpRU0XP3eRSxtn5L1SGsQVoJ
   g==;
X-CSE-ConnectionGUID: ZxIJQ0YITw+cAKht8V6g5Q==
X-CSE-MsgGUID: Idmuw39MSpK4qEw9fkYMDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21351750"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="21351750"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 09:07:36 -0700
X-CSE-ConnectionGUID: jvIKqVVZRwyKo5tLf2T7FA==
X-CSE-MsgGUID: kkUhyaofQjyRbMiSqbUnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="32741633"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 May 2024 09:07:35 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3eOi-000024-1k;
	Sun, 05 May 2024 16:07:32 +0000
Date: Mon, 6 May 2024 00:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 972/1143]
 drivers/gpio/gpio-aspeed.c:1126:48: warning: passing argument 1 of
 'pinctrl_gpio_request' makes pointer from integer without a cast
Message-ID: <202405052337.Zfoxpj4V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: b85cf7d0dbd1065b8827d7d610308f9a30424b6f [972/1143] gpio: aspeed: Extend the gpio number for g7.
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240505/202405052337.Zfoxpj4V-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405052337.Zfoxpj4V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405052337.Zfoxpj4V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-aspeed.c: In function 'aspeed_g7_gpio_request':
>> drivers/gpio/gpio-aspeed.c:1126:48: warning: passing argument 1 of 'pinctrl_gpio_request' makes pointer from integer without a cast [-Wint-conversion]
    1126 |         return pinctrl_gpio_request(chip->base + offset);
         |                                     ~~~~~~~~~~~^~~~~~~~
         |                                                |
         |                                                unsigned int
   In file included from drivers/gpio/gpio-aspeed.c:16:
   include/linux/pinctrl/consumer.h:30:44: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      30 | int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset);
         |                          ~~~~~~~~~~~~~~~~~~^~
   drivers/gpio/gpio-aspeed.c:1126:16: error: too few arguments to function 'pinctrl_gpio_request'
    1126 |         return pinctrl_gpio_request(chip->base + offset);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:30:5: note: declared here
      30 | int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset);
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c: In function 'aspeed_g7_gpio_set_config':
   drivers/gpio/gpio-aspeed.c:1498:48: warning: passing argument 1 of 'pinctrl_gpio_set_config' makes pointer from integer without a cast [-Wint-conversion]
    1498 |                 return pinctrl_gpio_set_config(offset, config);
         |                                                ^~~~~~
         |                                                |
         |                                                unsigned int
   include/linux/pinctrl/consumer.h:36:47: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |                             ~~~~~~~~~~~~~~~~~~^~
   drivers/gpio/gpio-aspeed.c:1498:24: error: too few arguments to function 'pinctrl_gpio_set_config'
    1498 |                 return pinctrl_gpio_set_config(offset, config);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:36:5: note: declared here
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpio-aspeed.c:15:
   drivers/gpio/gpio-aspeed.c: At top level:
   include/linux/module.h:131:49: error: redefinition of '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/platform_device.h:326:1: note: in expansion of macro 'module_init'
     326 | module_init(__platform_driver##_init); \
         | ^~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:1941:1: note: in expansion of macro 'module_platform_driver_probe'
    1941 | module_platform_driver_probe(aspeed_g7_gpio_driver, aspeed_g7_gpio_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:131:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/platform_device.h:326:1: note: in expansion of macro 'module_init'
     326 | module_init(__platform_driver##_init); \
         | ^~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:1940:1: note: in expansion of macro 'module_platform_driver_probe'
    1940 | module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:133:13: error: redefinition of 'init_module'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/platform_device.h:326:1: note: in expansion of macro 'module_init'
     326 | module_init(__platform_driver##_init); \
         | ^~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:1941:1: note: in expansion of macro 'module_platform_driver_probe'
    1941 | module_platform_driver_probe(aspeed_g7_gpio_driver, aspeed_g7_gpio_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:133:13: note: previous definition of 'init_module' with type 'int(void)'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/platform_device.h:326:1: note: in expansion of macro 'module_init'
     326 | module_init(__platform_driver##_init); \
         | ^~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:1940:1: note: in expansion of macro 'module_platform_driver_probe'
    1940 | module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:139:49: error: redefinition of '__exittest'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/platform_device.h:331:1: note: in expansion of macro 'module_exit'
     331 | module_exit(__platform_driver##_exit);
         | ^~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:1941:1: note: in expansion of macro 'module_platform_driver_probe'
    1941 | module_platform_driver_probe(aspeed_g7_gpio_driver, aspeed_g7_gpio_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:139:49: note: previous definition of '__exittest' with type 'void (*(void))(void)'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/platform_device.h:331:1: note: in expansion of macro 'module_exit'
     331 | module_exit(__platform_driver##_exit);
         | ^~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:1940:1: note: in expansion of macro 'module_platform_driver_probe'
    1940 | module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:141:14: error: redefinition of 'cleanup_module'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/platform_device.h:331:1: note: in expansion of macro 'module_exit'
     331 | module_exit(__platform_driver##_exit);
         | ^~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:1941:1: note: in expansion of macro 'module_platform_driver_probe'
    1941 | module_platform_driver_probe(aspeed_g7_gpio_driver, aspeed_g7_gpio_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:141:14: note: previous definition of 'cleanup_module' with type 'void(void)'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/platform_device.h:331:1: note: in expansion of macro 'module_exit'
     331 | module_exit(__platform_driver##_exit);
         | ^~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:1940:1: note: in expansion of macro 'module_platform_driver_probe'
    1940 | module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c: In function 'aspeed_g7_gpio_request':
>> drivers/gpio/gpio-aspeed.c:1127:1: warning: control reaches end of non-void function [-Wreturn-type]
    1127 | }
         | ^


vim +/pinctrl_gpio_request +1126 drivers/gpio/gpio-aspeed.c

  1120	
  1121	static int aspeed_g7_gpio_request(struct gpio_chip *chip, unsigned int offset)
  1122	{
  1123		if (!have_gpio_g7(gpiochip_get_data(chip), offset))
  1124			return -ENODEV;
  1125	
> 1126		return pinctrl_gpio_request(chip->base + offset);
> 1127	}
  1128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
