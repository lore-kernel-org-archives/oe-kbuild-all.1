Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D7610F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 06:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692253093; x=1723789093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lOtrg2qfwtp34iHpVyfe1gJbR0ImfXCPDFKMLh8th/0=;
  b=cB6yFhWZLCesKXfh04qPNmYa5uEAx45jx1zYrQgcZ6q57aJ/zSL7jZRw
   owU3NAaL5dJMDYZtoNvkpkEXCQ5eZPOx8sYP65Dwb6+QIWrDbxhOcZCXN
   2MIFmA5HtaMsMa44wgO/uEH+F5HnKXrz7gBqiXET953O6m5cu5zDvKVOz
   HroxuXAhDyDmzT/owPUX5v5e1Vyvos4j3mXSzr6/tWaTizEaFQGRY7amg
   doF6uGFU3O1DjcPWnoYLbYRqwHUqxSvJ+8t5L793ZB/3xsuiFDMApVBVJ
   qBD/Ykn7VL8Z7TqxhxMydW/3TtzrLT+fi+QQ9L2t1TtqFmH0L0Shcq4N/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376460097"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="376460097"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 23:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="684318377"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="684318377"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Aug 2023 23:18:09 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWWKe-0000qf-1y;
	Thu, 17 Aug 2023 06:18:08 +0000
Date: Thu, 17 Aug 2023 14:17:40 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [linux-next:master 2839/10848]
 drivers/pinctrl/pinctrl-cy8c95x0.c:168: warning: Function parameter or
 member 'gpio_reset' not described in 'cy8c95x0_pinctrl'
Message-ID: <202308171406.uWe0yyv9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
commit: 99084881de88ffcd156b03aaeb7d4eb740005e3e [2839/10848] pinctrl: cy8c95x0: Add reset support
config: csky-randconfig-r034-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171406.uWe0yyv9-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171406.uWe0yyv9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171406.uWe0yyv9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-cy8c95x0.c:168: warning: Function parameter or member 'gpio_reset' not described in 'cy8c95x0_pinctrl'


vim +168 drivers/pinctrl/pinctrl-cy8c95x0.c

e6cbbe42944de9 Patrick Rudolph 2022-08-16  124  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  125  /**
e6cbbe42944de9 Patrick Rudolph 2022-08-16  126   * struct cy8c95x0_pinctrl - driver data
e6cbbe42944de9 Patrick Rudolph 2022-08-16  127   * @regmap:         Device's regmap
e6cbbe42944de9 Patrick Rudolph 2022-08-16  128   * @irq_lock:       IRQ bus lock
e6cbbe42944de9 Patrick Rudolph 2022-08-16  129   * @i2c_lock:       Mutex for the device internal mux register
e6cbbe42944de9 Patrick Rudolph 2022-08-16  130   * @irq_mask:       I/O bits affected by interrupts
e6cbbe42944de9 Patrick Rudolph 2022-08-16  131   * @irq_trig_raise: I/O bits affected by raising voltage level
e6cbbe42944de9 Patrick Rudolph 2022-08-16  132   * @irq_trig_fall:  I/O bits affected by falling voltage level
e6cbbe42944de9 Patrick Rudolph 2022-08-16  133   * @irq_trig_low:   I/O bits affected by a low voltage level
e6cbbe42944de9 Patrick Rudolph 2022-08-16  134   * @irq_trig_high:  I/O bits affected by a high voltage level
e6cbbe42944de9 Patrick Rudolph 2022-08-16  135   * @push_pull:      I/O bits configured as push pull driver
e6cbbe42944de9 Patrick Rudolph 2022-08-16  136   * @shiftmask:      Mask used to compensate for Gport2 width
e6cbbe42944de9 Patrick Rudolph 2022-08-16  137   * @nport:          Number of Gports in this chip
e6cbbe42944de9 Patrick Rudolph 2022-08-16  138   * @gpio_chip:      gpiolib chip
e6cbbe42944de9 Patrick Rudolph 2022-08-16  139   * @driver_data:    private driver data
e6cbbe42944de9 Patrick Rudolph 2022-08-16  140   * @regulator:      Pointer to the regulator for the IC
e6cbbe42944de9 Patrick Rudolph 2022-08-16  141   * @dev:            struct device
e6cbbe42944de9 Patrick Rudolph 2022-08-16  142   * @pctldev:        pin controller device
e6cbbe42944de9 Patrick Rudolph 2022-08-16  143   * @pinctrl_desc:   pin controller description
e6cbbe42944de9 Patrick Rudolph 2022-08-16  144   * @name:           Chip controller name
e6cbbe42944de9 Patrick Rudolph 2022-08-16  145   * @tpin:           Total number of pins
e6cbbe42944de9 Patrick Rudolph 2022-08-16  146   */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  147  struct cy8c95x0_pinctrl {
e6cbbe42944de9 Patrick Rudolph 2022-08-16  148  	struct regmap *regmap;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  149  	struct mutex irq_lock;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  150  	struct mutex i2c_lock;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  151  	DECLARE_BITMAP(irq_mask, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  152  	DECLARE_BITMAP(irq_trig_raise, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  153  	DECLARE_BITMAP(irq_trig_fall, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  154  	DECLARE_BITMAP(irq_trig_low, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  155  	DECLARE_BITMAP(irq_trig_high, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  156  	DECLARE_BITMAP(push_pull, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  157  	DECLARE_BITMAP(shiftmask, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  158  	int nport;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  159  	struct gpio_chip gpio_chip;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  160  	unsigned long driver_data;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  161  	struct regulator *regulator;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  162  	struct device *dev;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  163  	struct pinctrl_dev *pctldev;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  164  	struct pinctrl_desc pinctrl_desc;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  165  	char name[32];
e6cbbe42944de9 Patrick Rudolph 2022-08-16  166  	unsigned int tpin;
99084881de88ff Patrick Rudolph 2023-07-14  167  	struct gpio_desc *gpio_reset;
e6cbbe42944de9 Patrick Rudolph 2022-08-16 @168  };
e6cbbe42944de9 Patrick Rudolph 2022-08-16  169  

:::::: The code at line 168 was first introduced by commit
:::::: e6cbbe42944de93ba4e0785b4f90d284b1d7cdf6 pinctrl: Add Cypress cy8c95x0 support

:::::: TO: Patrick Rudolph <patrick.rudolph@9elements.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
