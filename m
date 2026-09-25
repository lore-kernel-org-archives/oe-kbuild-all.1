Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50A62C027C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338079; cv=none; b=VvqctSIfWJulta2Dku1K6D8pK2eiWLcAPF3OHtDFpPjKhnQ3kO1mZ2hAI1LgNsw1o7YJo06uQnXXk7Sw/7O/3y79c02pUTrCXGwY6zuU2GbhwWNvCGCxlsqCzsPCpU4X5/UmoGfXFJKSmfOrF4zUg3BCo7SqevuloaHk7HtoVL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338079; c=relaxed/simple;
	bh=0pp16wBokeb6nc1+WiheBFWO7VzYB2Rqb1OHx/lAYK4=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJY/50BF6bguQNS0KAeYrMEmOi8j2y2Y/67h0pk3EfckEPxMiNjQqRzAyGW1ULK7YTyTg1Yo9lIeZ/meNRA2yc6Aowfq77B6yjsSdO77MoE9Nn+liw3x9YI3GJa9FSGB91qrfD7ucGzZGR+b+DVdoPoNH4tv/PnG7JULHD2yA1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTrTY2+B; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTrTY2+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790338077; x=1821874077;
  h=date:from:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=0pp16wBokeb6nc1+WiheBFWO7VzYB2Rqb1OHx/lAYK4=;
  b=iTrTY2+BSFBoIjz75fwldzh8627yHQtERPDY4Rbpis8LwooQBddNoVvi
   z9qDWUQfs8QLcDtGnXaOr7uNGbkcO25dBC7IoEhAKjWPO8Gt/lI2ys2de
   IEwrG3TbttO04+mAuC3PQSOJDiFAQQBtNLDoSchd0RTFUk5cCmFWStJae
   DHyA4Qvt9biDcTCVw3w+V2IcWkthqto5wladPqpdt/EpZ33wbj87Oo/Jm
   HQAMI7pkvC0PvqVl6cahUFmHa6CcM9GD4GutdRFxYldel+6MQTi+3tGJ2
   gskqIFnkBVK4P7vnSghXmigfJ0JoLgppXIfINOZs/0SHSv1mDhYXfJuff
   Q==;
X-CSE-ConnectionGUID: lmEwM7yXSuCH77wBbsDM0Q==
X-CSE-MsgGUID: a+ggVAC6Si+s8MNQw9i3pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="108612447"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="108612447"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 05:07:57 -0700
X-CSE-ConnectionGUID: LOMSMAfZRPGP7MNrDL0eog==
X-CSE-MsgGUID: Yfbo+CzmRc6WRhV+4IPOTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="277700577"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Sep 2026 05:07:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA4iY-00000000KYA-0SpI
	for oe-kbuild-all@lists.linux.dev;
	Fri, 25 Sep 2026 12:07:54 +0000
Date: Fri, 25 Sep 2026 20:07:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re:
Message-ID: <202609251905.3SAxQlsP-lkp@intel.com>
References: <202609251905.3SAxQlsP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202609251905.3SAxQlsP-lkp@intel.com>

Hi Guangshuo,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/pmdomain-imx-gpc-remove-all-initialized-power-domains/20260924-222520
base:   
patch link:    https://lore.kernel.org/r/202609251905.3SAxQlsP-lkp%40intel.com
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260925/202609251905.3SAxQlsP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251905.3SAxQlsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251905.3SAxQlsP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from drivers/pmdomain/imx/gpc.c:11:
   drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_remove':
   drivers/pmdomain/imx/gpc.c:554:25: error: invalid storage class for function 'imx_gpc_driver_init'
     554 | builtin_platform_driver(imx_gpc_driver)
         |                         ^~~~~~~~~~~~~~
   include/linux/device/driver.h:294:19: note: in definition of macro 'builtin_driver'
     294 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:245,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/pmdomain/imx/gpc.c:7:
   drivers/pmdomain/imx/gpc.c:554:25: error: initializer element is not constant
     554 | builtin_platform_driver(imx_gpc_driver)
         |                         ^~~~~~~~~~~~~~
   include/linux/init.h:265:55: note: in definition of macro '____define_initcall'
     265 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:275:9: note: in expansion of macro '__unique_initcall'
     275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:277:35: note: in expansion of macro '___define_initcall'
     277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
     306 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:298:1: note: in expansion of macro 'device_initcall'
     298 | device_initcall(__driver##_init);
         | ^~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:9: note: in expansion of macro 'builtin_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:176:30: error: expected declaration or statement at end of input
     176 | #define THIS_MODULE ((struct module *)0)
         |                              ^~~~~~
   include/linux/platform_device.h:304:41: note: in expansion of macro 'THIS_MODULE'
     304 |         __platform_driver_register(drv, THIS_MODULE, KBUILD_MODNAME)
         |                                         ^~~~~~~~~~~
   include/linux/device/driver.h:296:16: note: in expansion of macro 'platform_driver_register'
     296 |         return __register(&(__driver) , ##__VA_ARGS__); \
         |                ^~~~~~~~~~
   include/linux/platform_device.h:345:9: note: in expansion of macro 'builtin_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c: At top level:
>> drivers/pmdomain/imx/gpc.c:503:13: warning: 'imx_gpc_remove' defined but not used [-Wunused-function]
     503 | static void imx_gpc_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~


vim +/imx_gpc_remove +503 drivers/pmdomain/imx/gpc.c

721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  502  
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-König  2023-11-24 @503  static void imx_gpc_remove(struct platform_device *pdev)
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  504  {
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  505  	const struct imx_gpc_dt_data *of_id_data;
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  506  	struct device_node *pgc_node;
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  507  	unsigned int num_domains;
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  508  	int ret;
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  509  
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  510  	pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  511  
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  512  	/* bail out if DT too old and doesn't provide the necessary info */
8d04dfdbc380d1 drivers/pmdomain/imx/gpc.c Rob Herring (Arm  2024-11-04  513) 	if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  514  	    !pgc_node)
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-König  2023-11-24  515  		return;
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  516  
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  517  	/*
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  518  	 * If the old DT binding is used the toplevel driver needs to
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  519  	 * de-register the power domains
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  520  	 */
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  521  	if (!pgc_node) {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  522  		of_genpd_del_provider(pdev->dev.of_node);
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  523  
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  524  		of_id_data = device_get_match_data(&pdev->dev);
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  525  		if (!of_id_data)
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-König  2023-11-24  526  			return;
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  527  
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  528  		num_domains = of_id_data->num_domains;
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  529  		while (num_domains--) {
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  530  			ret = pm_genpd_remove(&imx_gpc_domains[num_domains].base);
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-König  2023-11-24  531  			if (ret) {
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  532  				dev_err(&pdev->dev,
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  533  					"Failed to remove %s power domain (%pe)\n",
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  534  					imx_gpc_domains[num_domains].base.name,
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-König  2023-11-24  535  					ERR_PTR(ret));
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-König  2023-11-24  536  				return;
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-König  2023-11-24  537  			}
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  538  
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  539  		if (num_domains == GPC_PGC_DOMAIN_PU)
822828d63fb9f1 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  540  			imx_pgc_put_clocks(&imx_gpc_domains[num_domains]);
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  541  	}
bbde14682eba21 drivers/pmdomain/imx/gpc.c Miaoqian Lin      2025-10-28  542  
bbde14682eba21 drivers/pmdomain/imx/gpc.c Miaoqian Lin      2025-10-28  543  	of_node_put(pgc_node);
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  544  }
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  545  
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  546  static struct platform_driver imx_gpc_driver = {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  547  	.driver = {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  548  		.name = "imx-gpc",
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  549  		.of_match_table = imx_gpc_dt_ids,
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  550  	},
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  551  	.probe = imx_gpc_probe,
e70140ba0d2b1a drivers/pmdomain/imx/gpc.c Linus Torvalds    2024-12-01  552  	.remove = imx_gpc_remove,
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  553  };
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17 @554  builtin_platform_driver(imx_gpc_driver)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
