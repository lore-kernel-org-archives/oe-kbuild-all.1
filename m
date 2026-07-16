Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1C73F23BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191075; cv=none; b=mYo678p7TPIwbOsYnuAu7yTcEmgYXGVb2KrSp6HXUhjSo8BntEDTJQ8XDm6JnA4Vd2dKXb+z0uv7iMPP21ls95F1UJbQT+cdDENqtg3dDaP5D0Rngp1KmPvIkGBJlMxtGm0fPJjSzip3vRoj7kToLkIvNvLo0VsXNxtXwgcutVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191075; c=relaxed/simple;
	bh=xbyCV2Pfgu2HJNtQAQOELRnqyQX16kaTERJ4QZgYOjw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s7bFV20W5DHrYUwGkOHwtRN2Tb7GLpgWG9YeIa/bnDn3L0kIDFmTGY04Nexz/eF8JvtFspLNsp2rGKqJYhvLnt0hoEenVyEPfjP2DzbBDAyxz0iZk4wqbZ82K4adSiiya0M0iuUQ6egvPZYVebH+8BpLQ4fAFchtBWJQpWQonNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TA743PaZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TA743PaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784191073; x=1815727073;
  h=date:from:to:cc:subject:message-id;
  bh=xbyCV2Pfgu2HJNtQAQOELRnqyQX16kaTERJ4QZgYOjw=;
  b=TA743PaZvx1iJFvglAR9AM8gotShfF1ddZSaf6S/VMr6ELI1EwtTnRpl
   7xQFSSabwuZ1WvGYojqJXeDmgWD0S3blg71e8IbYq87xGokypY0Kg1o7q
   yjQZt77pq7MaVPlLPt5gj+a0KE/5wB2uOjz9Q6VgGkOcREVO4pMbyVC/R
   xHGZ4D+VAlWhUHnHpx5xEBgs+zC5IxLRXhbu1BSj39qhK9pJ5I+LILN/D
   i4aumurkYOH908Mjln/G1iP/Lsyn/a8FpIVqYA4eTxfFUEbiRBbflK696
   MdtLh9usA79FRH95Ft/gZphqUBL7s9YLkdkLM5hxEhd3ZOYpjGGQQ2OA0
   A==;
X-CSE-ConnectionGUID: jHOBXJEJSdWQyhec6YkyUg==
X-CSE-MsgGUID: Ba2zHk0mQnGcjql0xhnzmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84883572"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84883572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:37:52 -0700
X-CSE-ConnectionGUID: BHlpjykpTpOhwl5nB0cIiQ==
X-CSE-MsgGUID: OJhyZjkrQASe+Qwi39vM2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="252457009"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jul 2026 01:37:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkHbE-00000000OXu-1VoQ;
	Thu, 16 Jul 2026 08:37:45 +0000
Date: Thu, 16 Jul 2026 16:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2026-06 6/6]
 drivers/gpio/gpio-xilinx.c:75: warning: Function parameter or member
 'irqchip' not described in 'xgpio_instance'
Message-ID: <202607161604.I6XgGJky-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bartosz,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2026-06
head:   7e8c257a4ec10d7fb33263300a521590d71c1fb1
commit: 12a1cf9db1785f4d25b7852eaad612df917c885c [6/6] gpio: xilinx: remove excess kernel doc
config: i386-randconfig-063-20260715 (https://download.01.org/0day-ci/archive/20260716/202607161604.I6XgGJky-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161604.I6XgGJky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161604.I6XgGJky-lkp@intel.com/

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
