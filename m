Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9568C7FC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680682867; x=1712218867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wTDPlBymdC9W+V7vbYQoVLC9ZmtyyxYpPvlDZCC2sg=;
  b=hWkQk1SC6v3in04tfNnJtr3av9t2JIGMswIhCvbZsQsh84nsJQOY9zdZ
   c3FHLccpy718ssptgDxw2dOGWm1Tnuogl6mxRrhU3b83hSNZPd8VUipst
   hO6lZIGsSl+Ffcf6OJtZK/vfyFy2PWKRddGNdlGvK9Jz7dowOzuxgyLq1
   LtAEPA2kW94fmABa1yPzekrHSYHDXPB5zOWy3Bswr3tyOakP4gkD37y0r
   e7HzLBhC1EORRJmNhSlsZJaxD/H8Tx6hAB9/+15Iaz3mGYHLjxlHW4sUk
   SzeFjVPcRSzkesDQLYLOgSjg3eHp7Og0xq7fWw5PBGO3VFCU7HKhP4Cyv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428682978"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="428682978"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 01:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="830280171"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="830280171"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2023 01:21:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjyO8-000QPo-1r;
	Wed, 05 Apr 2023 08:21:04 +0000
Date: Wed, 5 Apr 2023 16:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linux-next:master 931/9377] arch/mips/ar7/gpio.c:19:33: error:
 field 'chip' has incomplete type
Message-ID: <202304051646.5QtRQQau-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8417c8f5007bf4567ccffda850a3157c7d905f67
commit: 21d9526d13b5467b0a6532e5a8b0eb04c01ce326 [931/9377] gpiolib: Make the legacy <linux/gpio.h> consumer-only
config: mips-randconfig-r004-20230403 (https://download.01.org/0day-ci/archive/20230405/202304051646.5QtRQQau-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=21d9526d13b5467b0a6532e5a8b0eb04c01ce326
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 21d9526d13b5467b0a6532e5a8b0eb04c01ce326
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/ar7/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051646.5QtRQQau-lkp@intel.com/

Note: the linux-next/master HEAD 8417c8f5007bf4567ccffda850a3157c7d905f67 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/mips/ar7/gpio.c:19:33: error: field 'chip' has incomplete type
      19 |         struct gpio_chip        chip;
         |                                 ^~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_get_value':
>> arch/mips/ar7/gpio.c:24:38: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
      24 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c:24:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/mips/ar7/gpio.c: In function 'titan_gpio_get_value':
   arch/mips/ar7/gpio.c:32:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      32 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_set_value':
   arch/mips/ar7/gpio.c:42:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      42 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'titan_gpio_set_value':
   arch/mips/ar7/gpio.c:55:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      55 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_direction_input':
   arch/mips/ar7/gpio.c:68:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      68 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'titan_gpio_direction_input':
   arch/mips/ar7/gpio.c:78:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      78 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_direction_output':
   arch/mips/ar7/gpio.c:93:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      93 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'titan_gpio_direction_output':
   arch/mips/ar7/gpio.c:105:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     105 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_init':
>> arch/mips/ar7/gpio.c:318:15: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
     318 |         ret = gpiochip_add_data(&gpch->chip, gpch);
         |               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/chip +19 arch/mips/ar7/gpio.c

7ca5dc145bc7dad Florian Fainelli 2009-06-24  16  
5f3c909881d5dee Florian Fainelli 2010-01-03  17  struct ar7_gpio_chip {
5f3c909881d5dee Florian Fainelli 2010-01-03  18  	void __iomem		*regs;
5f3c909881d5dee Florian Fainelli 2010-01-03 @19  	struct gpio_chip	chip;
5f3c909881d5dee Florian Fainelli 2010-01-03  20  };
7ca5dc145bc7dad Florian Fainelli 2009-06-24  21  
5f3c909881d5dee Florian Fainelli 2010-01-03  22  static int ar7_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
7ca5dc145bc7dad Florian Fainelli 2009-06-24  23  {
1b2766fb496c462 Linus Walleij    2015-12-08 @24  	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
5f3c909881d5dee Florian Fainelli 2010-01-03  25  	void __iomem *gpio_in = gpch->regs + AR7_GPIO_INPUT;
7ca5dc145bc7dad Florian Fainelli 2009-06-24  26  
249e573d99ab590 Linus Walleij    2015-12-22  27  	return !!(readl(gpio_in) & (1 << gpio));
5f3c909881d5dee Florian Fainelli 2010-01-03  28  }
5f3c909881d5dee Florian Fainelli 2010-01-03  29  

:::::: The code at line 19 was first introduced by commit
:::::: 5f3c909881d5deebb9a3ddc836a15937e76daefc MIPS: AR7: Implement gpiolib

:::::: TO: Florian Fainelli <florian@openwrt.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
