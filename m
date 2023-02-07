Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2272587
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675801953; x=1707337953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Y6KtkK+QUHDgx0O/YBYqPJiaBbN4HmcVakZ2dP00z0=;
  b=bEsIPGe1M2gdiQ4Odr08Zl+U748NzNwf86haiAtSPmcCQo0z2L7I7lBP
   BqloPttZ+TT/ZXonu5eAgkSnUodJNx3suHzQbCWov5MmQOTJMMhMFEmV1
   TD/crUfcD3WNV+xKCIn9W1WLwmHkb7GAGdj6VQcxNkeuxhEPgipLN6mjY
   Iukogseq/YJHXVqHMtLdUIMG/AnLTIw/vw9yB2dHvVg7CfhlDpxin3r1G
   e+hvtXxncUZ8ObOfZ3OHgRCyt9QbaulJE9ewL1oGE8e3FRT/XUXhuw9zV
   OmjeaR5GDGvQ9sBgAaTGZdS0ExO5uxcTynSdwh0M4FipoPt7rGFihUzYE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="331753494"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="331753494"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 12:32:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="666977134"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="666977134"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Feb 2023 12:32:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPUdj-0003sA-1P;
	Tue, 07 Feb 2023 20:32:31 +0000
Date: Wed, 8 Feb 2023 04:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 12/12] gpiolib: Clean up headers
Message-ID: <202302080455.WG29wF0y-lkp@intel.com>
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
config: arm-assabet_defconfig (https://download.01.org/0day-ci/archive/20230208/202302080455.WG29wF0y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1b29af54a98628e27cdabe2554fbf29b75a1c18b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-remove-empty-asm-gpio-h-files/20230207-223652
        git checkout 1b29af54a98628e27cdabe2554fbf29b75a1c18b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-reg.c: In function 'gpio_reg_init':
   drivers/gpio/gpio-reg.c:139:21: error: implicit declaration of function 'devm_kzalloc' [-Werror=implicit-function-declaration]
     139 |                 r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
         |                     ^~~~~~~~~~~~
>> drivers/gpio/gpio-reg.c:139:19: warning: assignment to 'struct gpio_reg *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     139 |                 r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
         |                   ^
   cc1: some warnings being treated as errors


vim +139 drivers/gpio/gpio-reg.c

0e3cb6ee386f384 Russell King 2016-09-02  109  
380639c7cc786ec Russell King 2016-08-31  110  /**
380639c7cc786ec Russell King 2016-08-31  111   * gpio_reg_init - add a fixed in/out register as gpio
380639c7cc786ec Russell King 2016-08-31  112   * @dev: optional struct device associated with this register
380639c7cc786ec Russell King 2016-08-31  113   * @base: start gpio number, or -1 to allocate
380639c7cc786ec Russell King 2016-08-31  114   * @num: number of GPIOs, maximum 32
380639c7cc786ec Russell King 2016-08-31  115   * @label: GPIO chip label
380639c7cc786ec Russell King 2016-08-31  116   * @direction: bitmask of fixed direction, one per GPIO signal, 1 = in
380639c7cc786ec Russell King 2016-08-31  117   * @def_out: initial GPIO output value
0e3cb6ee386f384 Russell King 2016-09-02  118   * @names: array of %num strings describing each GPIO signal or %NULL
0e3cb6ee386f384 Russell King 2016-09-02  119   * @irqdom: irq domain or %NULL
0e3cb6ee386f384 Russell King 2016-09-02  120   * @irqs: array of %num ints describing the interrupt mapping for each
0e3cb6ee386f384 Russell King 2016-09-02  121   *        GPIO signal, or %NULL.  If @irqdom is %NULL, then this
0e3cb6ee386f384 Russell King 2016-09-02  122   *        describes the Linux interrupt number, otherwise it describes
0e3cb6ee386f384 Russell King 2016-09-02  123   *        the hardware interrupt number in the specified irq domain.
380639c7cc786ec Russell King 2016-08-31  124   *
380639c7cc786ec Russell King 2016-08-31  125   * Add a single-register GPIO device containing up to 32 GPIO signals,
380639c7cc786ec Russell King 2016-08-31  126   * where each GPIO has a fixed input or output configuration.  Only
380639c7cc786ec Russell King 2016-08-31  127   * input GPIOs are assumed to be readable from the register, and only
380639c7cc786ec Russell King 2016-08-31  128   * then after a double-read.  Output values are assumed not to be
380639c7cc786ec Russell King 2016-08-31  129   * readable.
380639c7cc786ec Russell King 2016-08-31  130   */
380639c7cc786ec Russell King 2016-08-31  131  struct gpio_chip *gpio_reg_init(struct device *dev, void __iomem *reg,
380639c7cc786ec Russell King 2016-08-31  132  	int base, int num, const char *label, u32 direction, u32 def_out,
0e3cb6ee386f384 Russell King 2016-09-02  133  	const char *const *names, struct irq_domain *irqdom, const int *irqs)
380639c7cc786ec Russell King 2016-08-31  134  {
380639c7cc786ec Russell King 2016-08-31  135  	struct gpio_reg *r;
380639c7cc786ec Russell King 2016-08-31  136  	int ret;
380639c7cc786ec Russell King 2016-08-31  137  
380639c7cc786ec Russell King 2016-08-31  138  	if (dev)
380639c7cc786ec Russell King 2016-08-31 @139  		r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
380639c7cc786ec Russell King 2016-08-31  140  	else
380639c7cc786ec Russell King 2016-08-31  141  		r = kzalloc(sizeof(*r), GFP_KERNEL);
380639c7cc786ec Russell King 2016-08-31  142  
380639c7cc786ec Russell King 2016-08-31  143  	if (!r)
380639c7cc786ec Russell King 2016-08-31  144  		return ERR_PTR(-ENOMEM);
380639c7cc786ec Russell King 2016-08-31  145  
380639c7cc786ec Russell King 2016-08-31  146  	spin_lock_init(&r->lock);
380639c7cc786ec Russell King 2016-08-31  147  
380639c7cc786ec Russell King 2016-08-31  148  	r->gc.label = label;
380639c7cc786ec Russell King 2016-08-31  149  	r->gc.get_direction = gpio_reg_get_direction;
380639c7cc786ec Russell King 2016-08-31  150  	r->gc.direction_input = gpio_reg_direction_input;
380639c7cc786ec Russell King 2016-08-31  151  	r->gc.direction_output = gpio_reg_direction_output;
380639c7cc786ec Russell King 2016-08-31  152  	r->gc.set = gpio_reg_set;
380639c7cc786ec Russell King 2016-08-31  153  	r->gc.get = gpio_reg_get;
380639c7cc786ec Russell King 2016-08-31  154  	r->gc.set_multiple = gpio_reg_set_multiple;
0e3cb6ee386f384 Russell King 2016-09-02  155  	if (irqs)
0e3cb6ee386f384 Russell King 2016-09-02  156  		r->gc.to_irq = gpio_reg_to_irq;
380639c7cc786ec Russell King 2016-08-31  157  	r->gc.base = base;
380639c7cc786ec Russell King 2016-08-31  158  	r->gc.ngpio = num;
380639c7cc786ec Russell King 2016-08-31  159  	r->gc.names = names;
380639c7cc786ec Russell King 2016-08-31  160  	r->direction = direction;
380639c7cc786ec Russell King 2016-08-31  161  	r->out = def_out;
380639c7cc786ec Russell King 2016-08-31  162  	r->reg = reg;
0e3cb6ee386f384 Russell King 2016-09-02  163  	r->irqs = irqs;
380639c7cc786ec Russell King 2016-08-31  164  
380639c7cc786ec Russell King 2016-08-31  165  	if (dev)
380639c7cc786ec Russell King 2016-08-31  166  		ret = devm_gpiochip_add_data(dev, &r->gc, r);
380639c7cc786ec Russell King 2016-08-31  167  	else
380639c7cc786ec Russell King 2016-08-31  168  		ret = gpiochip_add_data(&r->gc, r);
380639c7cc786ec Russell King 2016-08-31  169  
380639c7cc786ec Russell King 2016-08-31  170  	return ret ? ERR_PTR(ret) : &r->gc;
380639c7cc786ec Russell King 2016-08-31  171  }
380639c7cc786ec Russell King 2016-08-31  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
