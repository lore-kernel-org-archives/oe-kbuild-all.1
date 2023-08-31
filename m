Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24815A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 04:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693454744; x=1724990744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q0oRrvNtesMjhNmESbI/EXHNAsBFJc2ZreKTCuonhYM=;
  b=GmTFOxqoQLK4EtF7bS3lQ/igHfYpu7zYVRwj/HgGUhExLYu611WoR9Xc
   L4+cp84+nzFoLebouFSOtiwyyi1jqm0heYe4MnWCD6p84uUUSTcFy92Ho
   82bt9Lv9tt3uVAUrBaronC71dvD3N8HjZdV7vTIztSh5Eiseef2srWSdJ
   wiG/B0wftYN6UJWGVU/6xdnyZqAoZYxPR5g7kMMgVtlhrJBHgIkE9v8dK
   eh0+X9yuUJK9OPdEgz0teRqazUzZU+NwOMYuRTB6CzWgS6/0YmuUL7zLh
   J476m2reKH8W1OJ4excVC//szjD0zg2TbjHE9SArODqas8e5zs0ji97De
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="356119643"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="356119643"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 21:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768649302"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="768649302"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 21:05:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbYw6-000AaX-0u;
	Thu, 31 Aug 2023 04:05:38 +0000
Date: Thu, 31 Aug 2023 12:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 7/7] drivers/watchdog/marvell_gti_wdt.c:265:20:
 warning: assignment to 'const struct gti_match_data *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202308311257.F1FyN40C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: 2f859c7b504dbff5d4770187e5416610db4625e3 [7/7] of: header cleanups
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308311257.F1FyN40C-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311257.F1FyN40C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311257.F1FyN40C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/marvell_gti_wdt.c: In function 'gti_wdt_probe':
   drivers/watchdog/marvell_gti_wdt.c:265:22: error: implicit declaration of function 'of_device_get_match_data' [-Werror=implicit-function-declaration]
     265 |         priv->data = of_device_get_match_data(dev);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/watchdog/marvell_gti_wdt.c:265:20: warning: assignment to 'const struct gti_match_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     265 |         priv->data = of_device_get_match_data(dev);
         |                    ^
   drivers/watchdog/marvell_gti_wdt.c:270:15: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
     270 |         err = of_property_read_u32(dev->of_node, "marvell,wdt-timer-index",
         |               ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +265 drivers/watchdog/marvell_gti_wdt.c

ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  240  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  241  static int gti_wdt_probe(struct platform_device *pdev)
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  242  {
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  243  	struct gti_wdt_priv *priv;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  244  	struct device *dev = &pdev->dev;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  245  	struct watchdog_device *wdog_dev;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  246  	u64 max_pretimeout;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  247  	u32 wdt_idx;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  248  	int irq;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  249  	int err;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  250  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  251  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  252  	if (!priv)
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  253  		return -ENOMEM;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  254  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  255  	priv->base = devm_platform_ioremap_resource(pdev, 0);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  256  	if (IS_ERR(priv->base))
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  257  		return dev_err_probe(&pdev->dev, PTR_ERR(priv->base),
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  258  			      "reg property not valid/found\n");
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  259  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  260  	err = gti_wdt_get_cntfrq(pdev, priv);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  261  	if (err)
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  262  		return dev_err_probe(&pdev->dev, err,
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  263  				     "GTI clock frequency not valid/found");
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  264  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03 @265  	priv->data = of_device_get_match_data(dev);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  266  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  267  	/* default use last timer for watchdog */
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  268  	priv->wdt_timer_idx = priv->data->gti_num_timers - 1;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  269  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  270  	err = of_property_read_u32(dev->of_node, "marvell,wdt-timer-index",
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  271  				   &wdt_idx);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  272  	if (!err) {
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  273  		if (wdt_idx >= priv->data->gti_num_timers)
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  274  			return dev_err_probe(&pdev->dev, err,
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  275  				"GTI wdog timer index not valid");
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  276  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  277  		priv->wdt_timer_idx = wdt_idx;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  278  	}
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  279  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  280  	wdog_dev = &priv->wdev;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  281  	wdog_dev->info = &gti_wdt_ident,
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  282  	wdog_dev->ops = &gti_wdt_ops,
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  283  	wdog_dev->parent = dev;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  284  	/*
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  285  	 * Watchdog counter is 24 bit where lower 8 bits are zeros
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  286  	 * This counter decrements every 1024 clock cycles.
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  287  	 */
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  288  	max_pretimeout = (GTI_CWD_WDOG_CNT_MASK >> GTI_CWD_WDOG_CNT_SHIFT);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  289  	max_pretimeout &= ~0xFFUL;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  290  	max_pretimeout = (max_pretimeout * 1024) / priv->clock_freq;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  291  	wdog_dev->pretimeout = max_pretimeout;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  292  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  293  	/* Maximum timeout is 3 times the pretimeout */
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  294  	wdog_dev->max_timeout = max_pretimeout * 3;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  295  	/* Minimum first timeout (pretimeout) is 1, so min_timeout as 3 */
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  296  	wdog_dev->min_timeout = 3;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  297  	wdog_dev->timeout = wdog_dev->pretimeout;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  298  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  299  	watchdog_set_drvdata(wdog_dev, priv);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  300  	platform_set_drvdata(pdev, priv);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  301  	gti_wdt_settimeout(wdog_dev, wdog_dev->timeout);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  302  	watchdog_stop_on_reboot(wdog_dev);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  303  	watchdog_stop_on_unregister(wdog_dev);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  304  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  305  	err = devm_watchdog_register_device(dev, wdog_dev);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  306  	if (err)
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  307  		return err;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  308  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  309  	irq = platform_get_irq(pdev, 0);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  310  	if (irq < 0)
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  311  		return dev_err_probe(&pdev->dev, irq, "IRQ resource not found\n");
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  312  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  313  	err = devm_request_irq(dev, irq, gti_wdt_interrupt, 0,
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  314  			       pdev->name, &priv->wdev);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  315  	if (err)
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  316  		return dev_err_probe(dev, err, "Failed to register interrupt handler\n");
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  317  
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  318  	dev_info(dev, "Watchdog enabled (timeout=%d sec)\n", wdog_dev->timeout);
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  319  	return 0;
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  320  }
ef9e7fe2c890f7 Bharat Bhushan 2023-08-03  321  

:::::: The code at line 265 was first introduced by commit
:::::: ef9e7fe2c890f7609b5a667eba282f900434e58d Watchdog: Add marvell GTI watchdog driver

:::::: TO: Bharat Bhushan <bbhushan2@marvell.com>
:::::: CC: Wim Van Sebroeck <wim@linux-watchdog.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
