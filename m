Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD9286A7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O70lwc0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696607900; x=1728143900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rApvbeb8/MG+KylUAmcOnHk1Fzm3j/9TyAB7rOY0xv0=;
  b=O70lwc0Gs4XYCnRv9NPM66DayjG+pRGpY1PLp0M35LafxDfe5yLcSIG2
   lWoiFYWkRWqdFTSruej86q0nApYuR4Mb1X6yN03pQWhGeUo+BIbb1ZzG4
   8LeabA4L3BJSw1hJQIVxw+CdIDfyDGIC9WCD/raqDRz5d1FM2Fya46xNN
   EQDOl/FB+QIbPRE36/m9qyP+SEHxQdyMtwU0KcswxY4cE1oJVoGh4uhZv
   oh7kSJ3tZEPI3CZg3SkzamCrSoMBWuXJ28qtJqBNGy5eGngs/nc8gdQ4Y
   hFRMpEPCJrv34SEHkBEK1rA9+m//ROtXZcAraO90uOhuoYVTyeVPwcrei
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="2379321"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="2379321"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 08:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="745911438"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="745911438"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Oct 2023 08:58:18 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qonDU-0003M1-0d;
	Fri, 06 Oct 2023 15:58:16 +0000
Date: Fri, 6 Oct 2023 23:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/powerpc/platforms/85xx/t1042rdb_diu.c:41: warning: Function
 parameter or member 'port' not described in 't1042rdb_set_monitor_port'
Message-ID: <202310062311.EzRtIdWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b78b18fb8ee19f7a05f20c3abc865b3bfe182884
commit: a6e60d84989fa0e91db7f236eda40453b0e44afa include/linux/module.h: copy __init/__exit attrs to init/cleanup_module
date:   4 years, 8 months ago
config: powerpc64-randconfig-001-20230920 (https://download.01.org/0day-ci/archive/20231006/202310062311.EzRtIdWn-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310062311.EzRtIdWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310062311.EzRtIdWn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/85xx/t1042rdb_diu.c:41: warning: Function parameter or member 'port' not described in 't1042rdb_set_monitor_port'
>> arch/powerpc/platforms/85xx/t1042rdb_diu.c:131: warning: Function parameter or member 'port' not described in 't1042rdb_valid_monitor_port'


vim +41 arch/powerpc/platforms/85xx/t1042rdb_diu.c

1c06552a703c6a Jason Jin   2016-11-25   36  
1c06552a703c6a Jason Jin   2016-11-25   37  /**
1c06552a703c6a Jason Jin   2016-11-25   38   * t1042rdb_set_monitor_port: switch the output to a different monitor port
1c06552a703c6a Jason Jin   2016-11-25   39   */
1c06552a703c6a Jason Jin   2016-11-25   40  static void t1042rdb_set_monitor_port(enum fsl_diu_monitor_port port)
1c06552a703c6a Jason Jin   2016-11-25  @41  {
af8511cf32189b Yue Haibing 2018-11-15   42  	void __iomem *cpld_base;
1c06552a703c6a Jason Jin   2016-11-25   43  
1c06552a703c6a Jason Jin   2016-11-25   44  	cpld_base = of_iomap(cpld_node, 0);
1c06552a703c6a Jason Jin   2016-11-25   45  	if (!cpld_base) {
1c06552a703c6a Jason Jin   2016-11-25   46  		pr_err("%s: Could not map cpld registers\n", __func__);
1c06552a703c6a Jason Jin   2016-11-25   47  		goto exit;
1c06552a703c6a Jason Jin   2016-11-25   48  	}
1c06552a703c6a Jason Jin   2016-11-25   49  
1c06552a703c6a Jason Jin   2016-11-25   50  	switch (port) {
1c06552a703c6a Jason Jin   2016-11-25   51  	case FSL_DIU_PORT_DVI:
1c06552a703c6a Jason Jin   2016-11-25   52  		/* Enable the DVI(HDMI) port, disable the DFP and
1c06552a703c6a Jason Jin   2016-11-25   53  		 * the backlight
1c06552a703c6a Jason Jin   2016-11-25   54  		 */
1c06552a703c6a Jason Jin   2016-11-25   55  		clrbits8(cpld_base + CPLD_DIUCSR, CPLD_DIUCSR_DVIEN);
1c06552a703c6a Jason Jin   2016-11-25   56  		break;
1c06552a703c6a Jason Jin   2016-11-25   57  	case FSL_DIU_PORT_LVDS:
1c06552a703c6a Jason Jin   2016-11-25   58  		/*
1c06552a703c6a Jason Jin   2016-11-25   59  		 * LVDS also needs backlight enabled, otherwise the display
1c06552a703c6a Jason Jin   2016-11-25   60  		 * will be blank.
1c06552a703c6a Jason Jin   2016-11-25   61  		 */
1c06552a703c6a Jason Jin   2016-11-25   62  		/* Enable the DFP port, disable the DVI*/
1c06552a703c6a Jason Jin   2016-11-25   63  		setbits8(cpld_base + CPLD_DIUCSR, 0x01 << 8);
1c06552a703c6a Jason Jin   2016-11-25   64  		setbits8(cpld_base + CPLD_DIUCSR, 0x01 << 4);
1c06552a703c6a Jason Jin   2016-11-25   65  		setbits8(cpld_base + CPLD_DIUCSR, CPLD_DIUCSR_BACKLIGHT);
1c06552a703c6a Jason Jin   2016-11-25   66  		break;
1c06552a703c6a Jason Jin   2016-11-25   67  	default:
1c06552a703c6a Jason Jin   2016-11-25   68  		pr_err("%s: Unsupported monitor port %i\n", __func__, port);
1c06552a703c6a Jason Jin   2016-11-25   69  	}
1c06552a703c6a Jason Jin   2016-11-25   70  
1c06552a703c6a Jason Jin   2016-11-25   71  	iounmap(cpld_base);
1c06552a703c6a Jason Jin   2016-11-25   72  exit:
1c06552a703c6a Jason Jin   2016-11-25   73  	of_node_put(cpld_node);
1c06552a703c6a Jason Jin   2016-11-25   74  }
1c06552a703c6a Jason Jin   2016-11-25   75  
1c06552a703c6a Jason Jin   2016-11-25   76  /**
1c06552a703c6a Jason Jin   2016-11-25   77   * t1042rdb_set_pixel_clock: program the DIU's clock
1c06552a703c6a Jason Jin   2016-11-25   78   * @pixclock: pixel clock in ps (pico seconds)
1c06552a703c6a Jason Jin   2016-11-25   79   */
1c06552a703c6a Jason Jin   2016-11-25   80  static void t1042rdb_set_pixel_clock(unsigned int pixclock)
1c06552a703c6a Jason Jin   2016-11-25   81  {
1c06552a703c6a Jason Jin   2016-11-25   82  	struct device_node *scfg_np;
1c06552a703c6a Jason Jin   2016-11-25   83  	void __iomem *scfg;
1c06552a703c6a Jason Jin   2016-11-25   84  	unsigned long freq;
1c06552a703c6a Jason Jin   2016-11-25   85  	u64 temp;
1c06552a703c6a Jason Jin   2016-11-25   86  	u32 pxclk;
1c06552a703c6a Jason Jin   2016-11-25   87  
1c06552a703c6a Jason Jin   2016-11-25   88  	scfg_np = of_find_compatible_node(NULL, NULL, "fsl,t1040-scfg");
1c06552a703c6a Jason Jin   2016-11-25   89  	if (!scfg_np) {
1c06552a703c6a Jason Jin   2016-11-25   90  		pr_err("%s: Missing scfg node. Can not display video.\n",
1c06552a703c6a Jason Jin   2016-11-25   91  		       __func__);
1c06552a703c6a Jason Jin   2016-11-25   92  		return;
1c06552a703c6a Jason Jin   2016-11-25   93  	}
1c06552a703c6a Jason Jin   2016-11-25   94  
1c06552a703c6a Jason Jin   2016-11-25   95  	scfg = of_iomap(scfg_np, 0);
1c06552a703c6a Jason Jin   2016-11-25   96  	of_node_put(scfg_np);
1c06552a703c6a Jason Jin   2016-11-25   97  	if (!scfg) {
1c06552a703c6a Jason Jin   2016-11-25   98  		pr_err("%s: Could not map device. Can not display video.\n",
1c06552a703c6a Jason Jin   2016-11-25   99  		       __func__);
1c06552a703c6a Jason Jin   2016-11-25  100  		return;
1c06552a703c6a Jason Jin   2016-11-25  101  	}
1c06552a703c6a Jason Jin   2016-11-25  102  
1c06552a703c6a Jason Jin   2016-11-25  103  	/* Convert pixclock into frequency */
1c06552a703c6a Jason Jin   2016-11-25  104  	temp = 1000000000000ULL;
1c06552a703c6a Jason Jin   2016-11-25  105  	do_div(temp, pixclock);
1c06552a703c6a Jason Jin   2016-11-25  106  	freq = temp;
1c06552a703c6a Jason Jin   2016-11-25  107  
1c06552a703c6a Jason Jin   2016-11-25  108  	/*
1c06552a703c6a Jason Jin   2016-11-25  109  	 * 'pxclk' is the ratio of the platform clock to the pixel clock.
1c06552a703c6a Jason Jin   2016-11-25  110  	 * This number is programmed into the PIXCLKCR register, and the valid
1c06552a703c6a Jason Jin   2016-11-25  111  	 * range of values is 2-255.
1c06552a703c6a Jason Jin   2016-11-25  112  	 */
1c06552a703c6a Jason Jin   2016-11-25  113  	pxclk = DIV_ROUND_CLOSEST(fsl_get_sys_freq(), freq);
1c06552a703c6a Jason Jin   2016-11-25  114  	pxclk = clamp_t(u32, pxclk, 2, 255);
1c06552a703c6a Jason Jin   2016-11-25  115  
1c06552a703c6a Jason Jin   2016-11-25  116  	/* Disable the pixel clock, and set it to non-inverted and no delay */
1c06552a703c6a Jason Jin   2016-11-25  117  	clrbits32(scfg + CCSR_SCFG_PIXCLKCR,
1c06552a703c6a Jason Jin   2016-11-25  118  		  PIXCLKCR_PXCKEN | PIXCLKCR_PXCKDLY | PIXCLKCR_PXCLK_MASK);
1c06552a703c6a Jason Jin   2016-11-25  119  
1c06552a703c6a Jason Jin   2016-11-25  120  	/* Enable the clock and set the pxclk */
1c06552a703c6a Jason Jin   2016-11-25  121  	setbits32(scfg + CCSR_SCFG_PIXCLKCR, PIXCLKCR_PXCKEN | (pxclk << 16));
1c06552a703c6a Jason Jin   2016-11-25  122  
1c06552a703c6a Jason Jin   2016-11-25  123  	iounmap(scfg);
1c06552a703c6a Jason Jin   2016-11-25  124  }
1c06552a703c6a Jason Jin   2016-11-25  125  
1c06552a703c6a Jason Jin   2016-11-25  126  /**
1c06552a703c6a Jason Jin   2016-11-25  127   * t1042rdb_valid_monitor_port: set the monitor port for sysfs
1c06552a703c6a Jason Jin   2016-11-25  128   */
1c06552a703c6a Jason Jin   2016-11-25  129  static enum fsl_diu_monitor_port
1c06552a703c6a Jason Jin   2016-11-25  130  t1042rdb_valid_monitor_port(enum fsl_diu_monitor_port port)
1c06552a703c6a Jason Jin   2016-11-25 @131  {
1c06552a703c6a Jason Jin   2016-11-25  132  	switch (port) {
1c06552a703c6a Jason Jin   2016-11-25  133  	case FSL_DIU_PORT_DVI:
1c06552a703c6a Jason Jin   2016-11-25  134  	case FSL_DIU_PORT_LVDS:
1c06552a703c6a Jason Jin   2016-11-25  135  		return port;
1c06552a703c6a Jason Jin   2016-11-25  136  	default:
1c06552a703c6a Jason Jin   2016-11-25  137  		return FSL_DIU_PORT_DVI; /* Dual-link LVDS is not supported */
1c06552a703c6a Jason Jin   2016-11-25  138  	}
1c06552a703c6a Jason Jin   2016-11-25  139  }
1c06552a703c6a Jason Jin   2016-11-25  140  

:::::: The code at line 41 was first introduced by commit
:::::: 1c06552a703c6a4256976a1615d262b5a0d754e5 powerpc/85xx: Enable display support for t1042rdb

:::::: TO: Jason Jin <jason.jin@nxp.com>
:::::: CC: Scott Wood <oss@buserror.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
