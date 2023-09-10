Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B3A10E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 00:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694307305; x=1725843305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wNyXnPpKsSUlSwcD03LOJLtPH9zm5uuiUW8P4tpGNI=;
  b=KxTbwW5FL5nBvK9H4eWA40UhFNw1mEj4OClCsvyGux0pAOLXX8dvRPyd
   4AJKWOmr3ARQkLwqmIwmv2SyFmyOKiBhLIKDrGtYkiKo9xku7mnT6LSkH
   R7p76pr3Bb1aQJ686gAE/O9PDjQi6s6QiTNCasAJvl56yxvhe5RmPgUES
   Wca7luLx7V4h5VM4Mx8VLOIN9R5TyAuxC16v1TVN46cU7Z+BY57gBkaHc
   +EgJkcb9TYM6Sr9GAcT1nplifROPpJq+ZSNKSH6uTltXhG0TpRjwovUb0
   CksXADTC3SDeqgpM/qmqHAx9ouAhQje6l+N48Knl6z56HrkquVebnG8G4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441871549"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="441871549"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 17:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="772142175"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="772142175"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Sep 2023 17:55:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf8j7-00047E-2t;
	Sun, 10 Sep 2023 00:55:01 +0000
Date: Sun, 10 Sep 2023 08:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3225/25021]
 drivers/gpio/gpio-scu.c:99:6: error: no member named 'of_node' in 'struct
 gpio_chip'
Message-ID: <202309100815.t2vXlCZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: cdb7bf80f99743df8c3375d3191d3b96661c4b65 [3225/25021] MLK-25166-1 gpio: gpio-scu: gpio driver over scu fw misc api
config: hexagon-randconfig-r036-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100815.t2vXlCZl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100815.t2vXlCZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100815.t2vXlCZl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-scu.c:99:6: error: no member named 'of_node' in 'struct gpio_chip'
           gc->of_node = np;
           ~~  ^
   1 error generated.


vim +99 drivers/gpio/gpio-scu.c

    80	
    81	static int imx_scu_gpio_probe(struct platform_device *pdev)
    82	{
    83		struct device *dev = &pdev->dev;
    84		struct device_node *np = dev->of_node;
    85		struct imxscfw *port;
    86		struct gpio_chip *gc;
    87		int ret;
    88	
    89		port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
    90		if (!port)
    91			return -ENOMEM;
    92	
    93		ret = imx_scu_get_handle(&port->handle);
    94		if (ret)
    95			return ret;
    96	
    97		mutex_init(&port->lock);
    98		gc = &port->chip;
  > 99		gc->of_node = np;
   100		gc->parent = dev;
   101		gc->label = "imx-scu-gpio";
   102		gc->ngpio = PIN_NUMBER;
   103		gc->base = of_alias_get_id(np, "gpio") * 32;
   104	
   105		gc->get = imxscfw_get;
   106		gc->set = imxscfw_set;
   107	
   108		platform_set_drvdata(pdev, port);
   109	
   110		ret = devm_gpiochip_add_data(dev, gc, port);
   111	
   112		return ret;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
