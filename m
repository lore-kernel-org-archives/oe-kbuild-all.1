Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B884C6C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211018; cv=none; b=tX3oRfFIp4F+THLmRxyjdrMB+hFe3/ZPlEyS5aCc+PcTP86lPIOFcL46mJaW2R6ybNAMidX5PtlExYDVEXiSSY2KRGkzgi7UxReHSksaTOiv+U8V19PKmHLCCDPkmMaKyoxauB0wx9Ll4VY5SJcBrXXQr+tLApUW620NNfH60Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211018; c=relaxed/simple;
	bh=yFaN3FgAaAusihnQ94d7P/RgCZvhsSIYti/8CCLzgEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsGN34xLpRHi+uQiHYogYXxeb8JWVAEOND3p1t1/zHO3pBXFfZPm/FcHRQNP/YPhMDfyHXRLyclDUa+wy61a4B7jkdPSIrAgnvszLmBZCfpKnmE+YCeXFgE33VhJpAjjEm+Hi2P9gbj1MyFrPL0Ga5+wDDOHGH2YuIXOVTqjzQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n80yDL1p; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n80yDL1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747211016; x=1778747016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yFaN3FgAaAusihnQ94d7P/RgCZvhsSIYti/8CCLzgEM=;
  b=n80yDL1p2d5h8BVXUnWJW9Wy+l2kaSXh5Zxq//8a+FZZ9QFPCc5YiJ1w
   AP8Bb2ESx556Hj/KJ5+f6F/Yv/cgXJ4qM7PYv8xhDoR4RRoRYBUqAH+1u
   O57wH6XYkfrMa/Ru2n9hweugIEvNBnYpfu54ymi8IVihNh29p7WRDKe+8
   bJW/m46jhq5iet7zRkranuAAwbX/EHjZmOez5MiL2Bm9GMTPb2wbbzD70
   zMkyznbk124kXPmYsCaY5ufAQidr/7CkGNnL73mVr+P5C5Usnt2vXw5g7
   xFTzXuwkzx7C4sI02hglpAQUSJXGbTtinOhsfoQEaAvaVkc4GmzLY+Kc8
   A==;
X-CSE-ConnectionGUID: SstivYbVRbCDLV3rf9X7FQ==
X-CSE-MsgGUID: 7azZ2gJqRF61yRyYQC7jCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49074806"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="49074806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 01:23:35 -0700
X-CSE-ConnectionGUID: 7fIjzqxoQMK8bH8a1KUJow==
X-CSE-MsgGUID: jEcHAaoIReW897c1infZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="141998549"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2025 01:23:34 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF7Om-00017m-0q;
	Wed, 14 May 2025 08:23:32 +0000
Date: Wed, 14 May 2025 16:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] drivers/gpio/gpio-xilinx.c:75:
 warning: Function parameter or member 'irqchip' not described in
 'xgpio_instance'
Message-ID: <202505141621.VpZryxHY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0caacc39200ed39c9449b0b8da1ffc26e2402876
commit: 12a1cf9db1785f4d25b7852eaad612df917c885c [1/1] gpio: xilinx: remove excess kernel doc
config: arm-randconfig-2002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141621.VpZryxHY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141621.VpZryxHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141621.VpZryxHY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-xilinx.c:75: warning: Function parameter or member 'irqchip' not described in 'xgpio_instance'


vim +75 drivers/gpio/gpio-xilinx.c

74600ee017557b drivers/gpio/gpio-xilinx.c Michal Simek    2013-06-03  43  
74600ee017557b drivers/gpio/gpio-xilinx.c Michal Simek    2013-06-03  44  /**
74600ee017557b drivers/gpio/gpio-xilinx.c Michal Simek    2013-06-03  45   * struct xgpio_instance - Stores information about GPIO device
1ebd06871b57a6 drivers/gpio/gpio-xilinx.c Robert Hancock  2019-06-07  46   * @gc: GPIO chip
1ebd06871b57a6 drivers/gpio/gpio-xilinx.c Robert Hancock  2019-06-07  47   * @regs: register block
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  48   * @hw_map: GPIO pin mapping on hardware side
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  49   * @sw_map: GPIO pin mapping on software side
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  50   * @state: GPIO write state shadow register
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  51   * @last_irq_read: GPIO read state register from last interrupt
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  52   * @dir: GPIO direction shadow register
4ae798fae200f1 drivers/gpio/gpio-xilinx.c Ricardo Ribalda 2014-12-17  53   * @gpio_lock: Lock used for synchronization
a32c7caea292c4 drivers/gpio/gpio-xilinx.c Srinivas Neeli  2021-01-29  54   * @irq: IRQ used by GPIO device
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  55   * @enable: GPIO IRQ enable/disable bitfield
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  56   * @rising_edge: GPIO IRQ rising edge enable/disable bitfield
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  57   * @falling_edge: GPIO IRQ falling edge enable/disable bitfield
65bbe531b54668 drivers/gpio/gpio-xilinx.c Srinivas Neeli  2020-11-12  58   * @clk: clock resource for this driver
74600ee017557b drivers/gpio/gpio-xilinx.c Michal Simek    2013-06-03  59   */
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn       2008-11-12  60  struct xgpio_instance {
1ebd06871b57a6 drivers/gpio/gpio-xilinx.c Robert Hancock  2019-06-07  61  	struct gpio_chip gc;
1ebd06871b57a6 drivers/gpio/gpio-xilinx.c Robert Hancock  2019-06-07  62  	void __iomem *regs;
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  63  	DECLARE_BITMAP(hw_map, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  64  	DECLARE_BITMAP(sw_map, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  65  	DECLARE_BITMAP(state, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  66  	DECLARE_BITMAP(last_irq_read, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  67  	DECLARE_BITMAP(dir, 64);
d25041d4a3b2af drivers/gpio/gpio-xilinx.c Sean Anderson   2025-01-10  68  	raw_spinlock_t gpio_lock;	/* For serializing operations */
a32c7caea292c4 drivers/gpio/gpio-xilinx.c Srinivas Neeli  2021-01-29  69  	int irq;
a32c7caea292c4 drivers/gpio/gpio-xilinx.c Srinivas Neeli  2021-01-29  70  	struct irq_chip irqchip;
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  71  	DECLARE_BITMAP(enable, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  72  	DECLARE_BITMAP(rising_edge, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  73  	DECLARE_BITMAP(falling_edge, 64);
65bbe531b54668 drivers/gpio/gpio-xilinx.c Srinivas Neeli  2020-11-12  74  	struct clk *clk;
749564ffd52d91 drivers/gpio/gpio-xilinx.c Ricardo Ribalda 2014-12-17 @75  };
749564ffd52d91 drivers/gpio/gpio-xilinx.c Ricardo Ribalda 2014-12-17  76  

:::::: The code at line 75 was first introduced by commit
:::::: 749564ffd52d91ddf9917315e6fba2a3dcf3137e gpio/xilinx: Convert the driver to platform device interface

:::::: TO: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
