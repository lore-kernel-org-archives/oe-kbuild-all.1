Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1A78460
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692634239; x=1724170239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wV9ndxTymZmN87jXR5Esk2ewj9RDJwZ2+RQVeoLqrY8=;
  b=Stzsjm8i4x0e0NJRefRfceTZqAHdjW2DKCkd5oO7NqbHH0FJXaWs1wUl
   XPIlOjBith97hFBAuvtdszYLqSVGC7NHI8NVMlnjnzKyvqPi7+cabnu7M
   /Nsu33McYD0vnVzpRDrnH2hMs8fhSgN/+uCanj4PNX1jZYhLwF5QylGsA
   JjwJd/aQAOu952cktWyPxJYlkrcO0Kdg8sTKuc0l4Fues23JEyPVArLSP
   H96jmRKltVSl2FPYCjqfqzSPY5dWdZgXv6VTPeF6T5KPOkbSnI5ybLIgH
   FHHAfc/vr7sB1LTmLg7eaamPD6rv7zyTyHThc6Ka6Z/8pV/vvRVsCERwC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353947074"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="353947074"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 09:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850237945"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="850237945"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 09:08:59 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY7Sc-0000fM-1b;
	Mon, 21 Aug 2023 16:08:58 +0000
Date: Tue, 22 Aug 2023 00:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Qin Jian <qinjian@cqplus1.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: drivers/pinctrl/sunplus/sppctl.c:176: warning: Function parameter or
 member 'pctl' not described in 'sppctl_func_set'
Message-ID: <202308220036.Mcjk8zyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 0aa94eea8d955c82014e5368a843da93f1dc58f8 ARM: sunplus: Add initial support for Sunplus SP7021 SoC
date:   1 year, 1 month ago
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20230822/202308220036.Mcjk8zyh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220036.Mcjk8zyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220036.Mcjk8zyh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/sunplus/sppctl.c:176: warning: Function parameter or member 'pctl' not described in 'sppctl_func_set'
>> drivers/pinctrl/sunplus/sppctl.c:176: warning: Function parameter or member 'func' not described in 'sppctl_func_set'
>> drivers/pinctrl/sunplus/sppctl.c:176: warning: Function parameter or member 'val' not described in 'sppctl_func_set'
>> drivers/pinctrl/sunplus/sppctl.c:229: warning: Function parameter or member 'pctl' not described in 'sppctl_gmx_set'
>> drivers/pinctrl/sunplus/sppctl.c:229: warning: Function parameter or member 'reg_off' not described in 'sppctl_gmx_set'
>> drivers/pinctrl/sunplus/sppctl.c:229: warning: Function parameter or member 'bit_off' not described in 'sppctl_gmx_set'
>> drivers/pinctrl/sunplus/sppctl.c:229: warning: Function parameter or member 'bit_sz' not described in 'sppctl_gmx_set'
>> drivers/pinctrl/sunplus/sppctl.c:229: warning: Function parameter or member 'val' not described in 'sppctl_gmx_set'
>> drivers/pinctrl/sunplus/sppctl.c:262: warning: Function parameter or member 'chip' not described in 'sppctl_first_get'
>> drivers/pinctrl/sunplus/sppctl.c:262: warning: Function parameter or member 'offset' not described in 'sppctl_first_get'
>> drivers/pinctrl/sunplus/sppctl.c:297: warning: Function parameter or member 'chip' not described in 'sppctl_master_get'
>> drivers/pinctrl/sunplus/sppctl.c:297: warning: Function parameter or member 'offset' not described in 'sppctl_master_get'
>> drivers/pinctrl/sunplus/sppctl.c:699: warning: Function parameter or member 'offset' not described in 'sppctl_fully_pinmux_conv'


vim +176 drivers/pinctrl/sunplus/sppctl.c

aa74c44be19c8b Wells Lu 2022-01-16  149  
aa74c44be19c8b Wells Lu 2022-01-16  150  /**
aa74c44be19c8b Wells Lu 2022-01-16  151   * sppctl_func_set() - Set pin of fully-pinmux function.
aa74c44be19c8b Wells Lu 2022-01-16  152   *
aa74c44be19c8b Wells Lu 2022-01-16  153   * Mask-fields and control-fields of fully-pinmux function of SP7021 are
aa74c44be19c8b Wells Lu 2022-01-16  154   * arranged as shown below:
aa74c44be19c8b Wells Lu 2022-01-16  155   *
aa74c44be19c8b Wells Lu 2022-01-16  156   *  func# | register |  mask-field  | control-field
aa74c44be19c8b Wells Lu 2022-01-16  157   * -------+----------+--------------+---------------
aa74c44be19c8b Wells Lu 2022-01-16  158   *    0   | base[0]  |  (22 : 16)   |   ( 6 : 0)
aa74c44be19c8b Wells Lu 2022-01-16  159   *    1   | base[0]  |  (30 : 24)   |   (14 : 8)
aa74c44be19c8b Wells Lu 2022-01-16  160   *    2   | base[1]  |  (22 : 16)   |   ( 6 : 0)
aa74c44be19c8b Wells Lu 2022-01-16  161   *    3   | baeg[1]  |  (30 : 24)   |   (14 : 8)
aa74c44be19c8b Wells Lu 2022-01-16  162   *    :   |    :     |      :       |       :
aa74c44be19c8b Wells Lu 2022-01-16  163   *
aa74c44be19c8b Wells Lu 2022-01-16  164   * where mask-fields are used to protect control-fields from write-in
aa74c44be19c8b Wells Lu 2022-01-16  165   * accidentally. Set the corresponding bits in the mask-field before
aa74c44be19c8b Wells Lu 2022-01-16  166   * you write a value into a control-field.
aa74c44be19c8b Wells Lu 2022-01-16  167   *
aa74c44be19c8b Wells Lu 2022-01-16  168   * Control-fields are used to set where the function pin is going to
aa74c44be19c8b Wells Lu 2022-01-16  169   * be routed to.
aa74c44be19c8b Wells Lu 2022-01-16  170   *
aa74c44be19c8b Wells Lu 2022-01-16  171   * Note that mask-fields and control-fields of even number of 'func'
aa74c44be19c8b Wells Lu 2022-01-16  172   * are located at bits (22:16) and (6:0), while odd number of 'func's
aa74c44be19c8b Wells Lu 2022-01-16  173   * are located at bits (30:24) and (14:8).
aa74c44be19c8b Wells Lu 2022-01-16  174   */
aa74c44be19c8b Wells Lu 2022-01-16  175  static void sppctl_func_set(struct sppctl_pdata *pctl, u8 func, u8 val)
aa74c44be19c8b Wells Lu 2022-01-16 @176  {
aa74c44be19c8b Wells Lu 2022-01-16  177  	u32 reg, offset;
aa74c44be19c8b Wells Lu 2022-01-16  178  
aa74c44be19c8b Wells Lu 2022-01-16  179  	/*
aa74c44be19c8b Wells Lu 2022-01-16  180  	 * Note that upper 16-bit word are mask-fields and lower 16-bit
aa74c44be19c8b Wells Lu 2022-01-16  181  	 * word are the control-fields. Set corresponding bits in mask-
aa74c44be19c8b Wells Lu 2022-01-16  182  	 * field before write to a control-field.
aa74c44be19c8b Wells Lu 2022-01-16  183  	 */
aa74c44be19c8b Wells Lu 2022-01-16  184  	reg = SPPCTL_FULLY_PINMUX_MASK_MASK | val;
aa74c44be19c8b Wells Lu 2022-01-16  185  
aa74c44be19c8b Wells Lu 2022-01-16  186  	/*
aa74c44be19c8b Wells Lu 2022-01-16  187  	 * MUXF_L2SW_CLK_OUT is the first fully-pinmux pin
aa74c44be19c8b Wells Lu 2022-01-16  188  	 * and its register offset is 0.
aa74c44be19c8b Wells Lu 2022-01-16  189  	 */
aa74c44be19c8b Wells Lu 2022-01-16  190  	func -= MUXF_L2SW_CLK_OUT;
aa74c44be19c8b Wells Lu 2022-01-16  191  
aa74c44be19c8b Wells Lu 2022-01-16  192  	/*
aa74c44be19c8b Wells Lu 2022-01-16  193  	 * Check if 'func' is an odd number or not. Mask and control-
aa74c44be19c8b Wells Lu 2022-01-16  194  	 * fields of odd number 'func' is located at upper portion of
aa74c44be19c8b Wells Lu 2022-01-16  195  	 * a register. Extra shift is needed.
aa74c44be19c8b Wells Lu 2022-01-16  196  	 */
aa74c44be19c8b Wells Lu 2022-01-16  197  	if (func & BIT(0))
aa74c44be19c8b Wells Lu 2022-01-16  198  		reg <<= SPPCTL_FULLY_PINMUX_UPPER_SHIFT;
aa74c44be19c8b Wells Lu 2022-01-16  199  
aa74c44be19c8b Wells Lu 2022-01-16  200  	/* Convert func# to register offset w.r.t. base register. */
aa74c44be19c8b Wells Lu 2022-01-16  201  	offset = func * 2;
aa74c44be19c8b Wells Lu 2022-01-16  202  	offset &= GENMASK(31, 2);
aa74c44be19c8b Wells Lu 2022-01-16  203  
aa74c44be19c8b Wells Lu 2022-01-16  204  	writel(reg, pctl->moon2_base + offset);
aa74c44be19c8b Wells Lu 2022-01-16  205  }
aa74c44be19c8b Wells Lu 2022-01-16  206  
aa74c44be19c8b Wells Lu 2022-01-16  207  /**
aa74c44be19c8b Wells Lu 2022-01-16  208   * sppctl_gmx_set() - Set pin of group-pinmux.
aa74c44be19c8b Wells Lu 2022-01-16  209   *
aa74c44be19c8b Wells Lu 2022-01-16  210   * Mask-fields and control-fields of group-pinmux function of SP7021 are
aa74c44be19c8b Wells Lu 2022-01-16  211   * arranged as shown below:
aa74c44be19c8b Wells Lu 2022-01-16  212   *
aa74c44be19c8b Wells Lu 2022-01-16  213   *  register |  mask-fields | control-fields
aa74c44be19c8b Wells Lu 2022-01-16  214   * ----------+--------------+----------------
aa74c44be19c8b Wells Lu 2022-01-16  215   *  base[0]  |  (31 : 16)   |   (15 : 0)
aa74c44be19c8b Wells Lu 2022-01-16  216   *  base[1]  |  (31 : 24)   |   (15 : 0)
aa74c44be19c8b Wells Lu 2022-01-16  217   *  base[2]  |  (31 : 24)   |   (15 : 0)
aa74c44be19c8b Wells Lu 2022-01-16  218   *     :     |      :       |       :
aa74c44be19c8b Wells Lu 2022-01-16  219   *
aa74c44be19c8b Wells Lu 2022-01-16  220   * where mask-fields are used to protect control-fields from write-in
aa74c44be19c8b Wells Lu 2022-01-16  221   * accidentally. Set the corresponding bits in the mask-field before
aa74c44be19c8b Wells Lu 2022-01-16  222   * you write a value into a control-field.
aa74c44be19c8b Wells Lu 2022-01-16  223   *
aa74c44be19c8b Wells Lu 2022-01-16  224   * Control-fields are used to set where the function pin is going to
aa74c44be19c8b Wells Lu 2022-01-16  225   * be routed to. A control-field consists of one or more bits.
aa74c44be19c8b Wells Lu 2022-01-16  226   */
aa74c44be19c8b Wells Lu 2022-01-16  227  static void sppctl_gmx_set(struct sppctl_pdata *pctl, u8 reg_off, u8 bit_off, u8 bit_sz,
aa74c44be19c8b Wells Lu 2022-01-16  228  			   u8 val)
aa74c44be19c8b Wells Lu 2022-01-16 @229  {
aa74c44be19c8b Wells Lu 2022-01-16  230  	u32 mask, reg;
aa74c44be19c8b Wells Lu 2022-01-16  231  
aa74c44be19c8b Wells Lu 2022-01-16  232  	/*
aa74c44be19c8b Wells Lu 2022-01-16  233  	 * Note that upper 16-bit word are mask-fields and lower 16-bit
aa74c44be19c8b Wells Lu 2022-01-16  234  	 * word are the control-fields. Set corresponding bits in mask-
aa74c44be19c8b Wells Lu 2022-01-16  235  	 * field before write to a control-field.
aa74c44be19c8b Wells Lu 2022-01-16  236  	 */
aa74c44be19c8b Wells Lu 2022-01-16  237  	mask = GENMASK(bit_sz - 1, 0) << SPPCTL_MOON_REG_MASK_SHIFT;
aa74c44be19c8b Wells Lu 2022-01-16  238  	reg = (mask | val) << bit_off;
aa74c44be19c8b Wells Lu 2022-01-16  239  
aa74c44be19c8b Wells Lu 2022-01-16  240  	writel(reg, pctl->moon1_base + reg_off * 4);
aa74c44be19c8b Wells Lu 2022-01-16  241  }
aa74c44be19c8b Wells Lu 2022-01-16  242  
aa74c44be19c8b Wells Lu 2022-01-16  243  /**
aa74c44be19c8b Wells Lu 2022-01-16  244   * sppctl_first_get() - get bit of FIRST register.
aa74c44be19c8b Wells Lu 2022-01-16  245   *
aa74c44be19c8b Wells Lu 2022-01-16  246   * There are 4 FIRST registers. Each has 32 control-bits.
aa74c44be19c8b Wells Lu 2022-01-16  247   * Totally, there are 4 * 32 = 128 control-bits.
aa74c44be19c8b Wells Lu 2022-01-16  248   * Control-bits are arranged as shown below:
aa74c44be19c8b Wells Lu 2022-01-16  249   *
aa74c44be19c8b Wells Lu 2022-01-16  250   *  registers | control-bits
aa74c44be19c8b Wells Lu 2022-01-16  251   * -----------+--------------
aa74c44be19c8b Wells Lu 2022-01-16  252   *  first[0]  |  (31 :  0)
aa74c44be19c8b Wells Lu 2022-01-16  253   *  first[1]  |  (63 : 32)
aa74c44be19c8b Wells Lu 2022-01-16  254   *  first[2]  |  (95 : 64)
aa74c44be19c8b Wells Lu 2022-01-16  255   *  first[3]  | (127 : 96)
aa74c44be19c8b Wells Lu 2022-01-16  256   *
aa74c44be19c8b Wells Lu 2022-01-16  257   * Each control-bit sets type of a GPIO pin.
aa74c44be19c8b Wells Lu 2022-01-16  258   *   0: a fully-pinmux pin
aa74c44be19c8b Wells Lu 2022-01-16  259   *   1: a GPIO or IOP pin
aa74c44be19c8b Wells Lu 2022-01-16  260   */
aa74c44be19c8b Wells Lu 2022-01-16  261  static int sppctl_first_get(struct gpio_chip *chip, unsigned int offset)
aa74c44be19c8b Wells Lu 2022-01-16 @262  {
aa74c44be19c8b Wells Lu 2022-01-16  263  	struct sppctl_gpio_chip *spp_gchip = gpiochip_get_data(chip);
aa74c44be19c8b Wells Lu 2022-01-16  264  	u32 reg_off, bit_off, reg;
aa74c44be19c8b Wells Lu 2022-01-16  265  
aa74c44be19c8b Wells Lu 2022-01-16  266  	bit_off = sppctl_get_reg_and_bit_offset(offset, &reg_off);
aa74c44be19c8b Wells Lu 2022-01-16  267  	reg = sppctl_first_readl(spp_gchip, reg_off);
aa74c44be19c8b Wells Lu 2022-01-16  268  
aa74c44be19c8b Wells Lu 2022-01-16  269  	return (reg & BIT(bit_off)) ? 1 : 0;
aa74c44be19c8b Wells Lu 2022-01-16  270  }
aa74c44be19c8b Wells Lu 2022-01-16  271  
aa74c44be19c8b Wells Lu 2022-01-16  272  /**
aa74c44be19c8b Wells Lu 2022-01-16  273   * sppctl_master_get() - get bit of MASTER register.
aa74c44be19c8b Wells Lu 2022-01-16  274   *
aa74c44be19c8b Wells Lu 2022-01-16  275   * There are 8 MASTER registers. Each has 16 mask-bits and 16 control-bits.
aa74c44be19c8b Wells Lu 2022-01-16  276   * Upper 16-bit of MASTER registers are mask-bits while lower 16-bit are
aa74c44be19c8b Wells Lu 2022-01-16  277   * control-bits. Totally, there are 128 mask-bits and 128 control-bits.
aa74c44be19c8b Wells Lu 2022-01-16  278   * They are arranged as shown below:
aa74c44be19c8b Wells Lu 2022-01-16  279   *
aa74c44be19c8b Wells Lu 2022-01-16  280   *  register  |  mask-bits  | control-bits
aa74c44be19c8b Wells Lu 2022-01-16  281   * -----------+-------------+--------------
aa74c44be19c8b Wells Lu 2022-01-16  282   *  master[0] |  (15 :   0) |  (15 :   0)
aa74c44be19c8b Wells Lu 2022-01-16  283   *  master[1] |  (31 :  16) |  (31 :  16)
aa74c44be19c8b Wells Lu 2022-01-16  284   *  master[2] |  (47 :  32) |  (47 :  32)
aa74c44be19c8b Wells Lu 2022-01-16  285   *     :      |      :      |      :
aa74c44be19c8b Wells Lu 2022-01-16  286   *  master[7] | (127 : 112) | (127 : 112)
aa74c44be19c8b Wells Lu 2022-01-16  287   *
aa74c44be19c8b Wells Lu 2022-01-16  288   * where mask-bits are used to protect control-bits from write-in
aa74c44be19c8b Wells Lu 2022-01-16  289   * accidentally. Set the corresponding mask-bit before you write
aa74c44be19c8b Wells Lu 2022-01-16  290   * a value into a control-bit.
aa74c44be19c8b Wells Lu 2022-01-16  291   *
aa74c44be19c8b Wells Lu 2022-01-16  292   * Each control-bit sets type of a GPIO pin when FIRST bit is 1.
aa74c44be19c8b Wells Lu 2022-01-16  293   *   0: a IOP pin
aa74c44be19c8b Wells Lu 2022-01-16  294   *   1: a GPIO pin
aa74c44be19c8b Wells Lu 2022-01-16  295   */
aa74c44be19c8b Wells Lu 2022-01-16  296  static int sppctl_master_get(struct gpio_chip *chip, unsigned int offset)
aa74c44be19c8b Wells Lu 2022-01-16 @297  {
aa74c44be19c8b Wells Lu 2022-01-16  298  	struct sppctl_gpio_chip *spp_gchip = gpiochip_get_data(chip);
aa74c44be19c8b Wells Lu 2022-01-16  299  	u32 reg_off, bit_off, reg;
aa74c44be19c8b Wells Lu 2022-01-16  300  
aa74c44be19c8b Wells Lu 2022-01-16  301  	bit_off = sppctl_get_moon_reg_and_bit_offset(offset, &reg_off);
aa74c44be19c8b Wells Lu 2022-01-16  302  	reg = sppctl_gpio_master_readl(spp_gchip, reg_off);
aa74c44be19c8b Wells Lu 2022-01-16  303  	return (reg & BIT(bit_off)) ? 1 : 0;
aa74c44be19c8b Wells Lu 2022-01-16  304  }
aa74c44be19c8b Wells Lu 2022-01-16  305  

:::::: The code at line 176 was first introduced by commit
:::::: aa74c44be19c8b1de38d955c2c45c309991c805a pinctrl: Add driver for Sunplus SP7021

:::::: TO: Wells Lu <wellslutw@gmail.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
