Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC25FF09
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHrEh7Z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702578607; x=1734114607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ew09GcjkZYq5BSwV4yo5CvVrIH5rflhUjotYPDNsyGI=;
  b=hHrEh7Z7YeGsZIfS3wr94jMx8L3yqkxHMF4wQ7i7QvcXMdDHf41zVP7R
   ckNeBYvT8ryQLwCj2BY6W7K99j95PURP+7ickaFwX1/zdFk54OluBhecz
   PyZzakgigaqIMy/hvnaMOJHpw+v8speA87r9ySua3W2f/Eno40sBHHC0y
   CNeFziYO1FnHyPBuOUKgCVa7S611ev+nu3ynMH8BFObaSA7T5P5trKT0e
   xoB7mVGayv/msfhK8eKgwLaI0pdOK97vlOjVeVdm7USz46+PXI3qS2/wu
   Hsn+JVlAfpQtpgxCpfARkROJ4/rKhVjNHU3fgo8icVU6i+VcLMGg4JJ22
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459487333"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="459487333"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:30:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="777980982"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="777980982"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2023 10:30:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDqTB-000MTB-1f;
	Thu, 14 Dec 2023 18:30:01 +0000
Date: Fri, 15 Dec 2023 02:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Marc Zyngier <maz@kernel.org>
Subject: drivers/gpio/gpio-xilinx.c:75: warning: Excess struct member
 'irqchip' description in 'xgpio_instance'
Message-ID: <202312150239.IyuTVvrL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: b4510f8fd5d0e9afa777f115871f5d522540c417 gpio: xilinx: Convert to immutable irq_chip
date:   9 months ago
config: arm-randconfig-r081-20231214 (https://download.01.org/0day-ci/archive/20231215/202312150239.IyuTVvrL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150239.IyuTVvrL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150239.IyuTVvrL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-xilinx.c:75: warning: Excess struct member 'irqchip' description in 'xgpio_instance'


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
a32c7caea292c4 drivers/gpio/gpio-xilinx.c Srinivas Neeli  2021-01-29  55   * @irqchip: IRQ chip
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  56   * @enable: GPIO IRQ enable/disable bitfield
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  57   * @rising_edge: GPIO IRQ rising edge enable/disable bitfield
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  58   * @falling_edge: GPIO IRQ falling edge enable/disable bitfield
65bbe531b54668 drivers/gpio/gpio-xilinx.c Srinivas Neeli  2020-11-12  59   * @clk: clock resource for this driver
74600ee017557b drivers/gpio/gpio-xilinx.c Michal Simek    2013-06-03  60   */
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn       2008-11-12  61  struct xgpio_instance {
1ebd06871b57a6 drivers/gpio/gpio-xilinx.c Robert Hancock  2019-06-07  62  	struct gpio_chip gc;
1ebd06871b57a6 drivers/gpio/gpio-xilinx.c Robert Hancock  2019-06-07  63  	void __iomem *regs;
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  64  	DECLARE_BITMAP(hw_map, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  65  	DECLARE_BITMAP(sw_map, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  66  	DECLARE_BITMAP(state, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  67  	DECLARE_BITMAP(last_irq_read, 64);
02b3f84d9080b0 drivers/gpio/gpio-xilinx.c Andy Shevchenko 2021-05-10  68  	DECLARE_BITMAP(dir, 64);
37ef3346808002 drivers/gpio/gpio-xilinx.c Srinivas Neeli  2021-01-29  69  	spinlock_t gpio_lock;	/* For serializing operations */
a32c7caea292c4 drivers/gpio/gpio-xilinx.c Srinivas Neeli  2021-01-29  70  	int irq;
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
