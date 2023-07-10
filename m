Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA2156CD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 22:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689026733; x=1720562733;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2u8udISsoyiMX9dGsmo1vjT9zghpRAK3JDXqv9azGgU=;
  b=g6vvc/C4Z5N9R5U/1lV003xDJdaRzEvsk8wk/dMi8IzQfH2J3kysDteh
   X3HrjtOduAWfCGDiOaJsjlfzXe016Dv61OwFpvq/yP8nca0kFAYMIQWw+
   xnHk5B/vDLW1IHnAS7oM0ho1riG3ps1/PZLfz/dgl+NHFSN9Nst/9S0LN
   gP2swq3SqfRTmqAmg9MLuRIAsA2r7OCjuxnKrAti89CfoPq46dflnvtQw
   +8N/cOl3ezF24Wd1zC1+vhcFnD4pQy3kxjQiZXVgVH2auDaQ0JK4UZbrA
   V42yt9Z8UC/06SdkSQQXO95IhLJpAq7T/DDybK3dXqDxEo+1+tafFPJwz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="363336427"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="363336427"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 15:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="894942745"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="894942745"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Jul 2023 15:05:30 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIz0b-00043O-1X;
	Mon, 10 Jul 2023 22:05:29 +0000
Date: Tue, 11 Jul 2023 06:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20230710_andriy_shevchenko_spi_header_and_core_clean_up_and_refactoring
 6/11] drivers/net/ethernet/asix/ax88796c_main.c:950:20: warning: assignment
 to 'struct gpio_desc *' from 'int' makes pointer from integer without a cast
Message-ID: <202307110527.2AsnJbVr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20230710_andriy_shevchenko_spi_header_and_core_clean_up_and_refactoring
head:   369552a608af49f5a4eb2e0f314b7404ab405b27
commit: 7ed8e3577d00253736324aabaae615698fb65f78 [6/11] spi: Clean up headers
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230711/202307110527.2AsnJbVr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110527.2AsnJbVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110527.2AsnJbVr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/asix/ax88796c_main.c: In function 'ax88796c_hard_reset':
   drivers/net/ethernet/asix/ax88796c_main.c:950:22: error: implicit declaration of function 'gpiod_get'; did you mean 'guid_gen'? [-Werror=implicit-function-declaration]
     950 |         reset_gpio = gpiod_get(dev, "reset", 0);
         |                      ^~~~~~~~~
         |                      guid_gen
>> drivers/net/ethernet/asix/ax88796c_main.c:950:20: warning: assignment to 'struct gpio_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     950 |         reset_gpio = gpiod_get(dev, "reset", 0);
         |                    ^
   drivers/net/ethernet/asix/ax88796c_main.c:957:9: error: implicit declaration of function 'gpiod_direction_output' [-Werror=implicit-function-declaration]
     957 |         gpiod_direction_output(reset_gpio, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/asix/ax88796c_main.c:960:9: error: implicit declaration of function 'gpiod_put' [-Werror=implicit-function-declaration]
     960 |         gpiod_put(reset_gpio);
         |         ^~~~~~~~~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/netdevice.h:24,
                    from drivers/net/ethernet/asix/ax88796c_main.h:12,
                    from drivers/net/ethernet/asix/ax88796c_main.c:11:
   In function 'fortify_memcpy_chk',
       inlined from 'ax88796c_tx_fixup' at drivers/net/ethernet/asix/ax88796c_main.c:287:2:
   include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     592 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +950 drivers/net/ethernet/asix/ax88796c_main.c

a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  943  
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  944  static int ax88796c_hard_reset(struct ax88796c_device *ax_local)
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  945  {
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  946  	struct device *dev = (struct device *)&ax_local->spi->dev;
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  947  	struct gpio_desc *reset_gpio;
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  948  
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  949  	/* reset info */
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20 @950  	reset_gpio = gpiod_get(dev, "reset", 0);
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  951  	if (IS_ERR(reset_gpio)) {
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  952  		dev_err(dev, "Could not get 'reset' GPIO: %ld", PTR_ERR(reset_gpio));
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  953  		return PTR_ERR(reset_gpio);
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  954  	}
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  955  
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  956  	/* set reset */
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  957  	gpiod_direction_output(reset_gpio, 1);
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  958  	msleep(100);
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  959  	gpiod_direction_output(reset_gpio, 0);
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  960  	gpiod_put(reset_gpio);
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  961  	msleep(20);
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  962  
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  963  	return 0;
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  964  }
a97c69ba4f30e4 Łukasz Stelmach 2021-10-20  965  

:::::: The code at line 950 was first introduced by commit
:::::: a97c69ba4f30e46abb9cc7be8b98227cb468fdf9 net: ax88796c: ASIX AX88796C SPI Ethernet Adapter Driver

:::::: TO: Łukasz Stelmach <l.stelmach@samsung.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
