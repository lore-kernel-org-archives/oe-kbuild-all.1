Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329D2EC571
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781189449; cv=none; b=SqY1UnCZTSUk9hudDS5BgWMVsejDXoIJEgATrc5crGhLev7I6nPfHA2TgebUhZZb8iWYwD74MQJs5bUIZ/eLDOhVMHe8csORApzF9Mwj0gg0cEQCtsKakHnXuk94Bq3X0iv9EA9ld/K0FSO73CL0poNE87WUkIt5xDF+fACl69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781189449; c=relaxed/simple;
	bh=W5BDX/RKqmiIqW8TGhQbND4lmMkBC6Fad6L9mbEyb8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PHzl4/dmcl2AUrrxdi7xMnGM3kgTPTo7OXZui+RG9AC0gn5KUciF4UFtcWF6DHaqIgKRLgfiiriXe4SzWw+rOCuAcsmTNg91xyg99Dv5OwczLdCX4Wi5V9di6PNLxDRvVRgpcdT1mMrPUiY9qF39WNgAsl+MJ70sWOcZLOSMyvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdzRHnrx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdzRHnrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781189448; x=1812725448;
  h=date:from:to:cc:subject:message-id;
  bh=W5BDX/RKqmiIqW8TGhQbND4lmMkBC6Fad6L9mbEyb8Y=;
  b=PdzRHnrxciWqOfMJUHPxWsvIVV78XXqIGuU09RSlVk+rNbrAtSjL6O05
   mSWIzkt4OqR0bQ5FzGTQHALuWnw59Q9l6kBgFugK+Wp9+g7nHY7+RNZne
   YminDT1S6kcrlzmIxrrGXaGeLAXr8bxqXXz7mqNv7/MH8z6c+dY/Ww/iU
   jl6bjgF2Lh4FJafWkWO6wayOQiX1hPOT1F2GJBv3xfv/x3vtNYiwuB1Xo
   O+JGjMMthj7dPyswmL0PpriHPIGBr/59XQ1pcYEnvq+HR/2eUYc42v/Vg
   ID0V6Sy60AG4rObvHgzCjhuUEzo5FUzJDJzfHWv4PMLPZLPMjEJjCaFbr
   w==;
X-CSE-ConnectionGUID: AazMoQyhT0yi9SlzPWZGIA==
X-CSE-MsgGUID: oY3c4kK8TSyqiTX04aTR6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81986634"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81986634"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 07:50:47 -0700
X-CSE-ConnectionGUID: 2f54JqF/RJSomTGVMTSH2Q==
X-CSE-MsgGUID: eFU3XrKbRgOIWpW4xwNosw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 07:50:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXgjy-00000000NFY-2E3t;
	Thu, 11 Jun 2026 14:50:42 +0000
Date: Thu, 11 Jun 2026 22:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>
Subject: drivers/mfd/macsmc.c:462:26: sparse: sparse: cast to
 restricted __be32
Message-ID: <202606112222.NIgwfLNG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: e038d985c9823a12cd64fa077d0c5aca2c644b67 mfd: Add Apple Silicon System Management Controller
date:   11 months ago
config: riscv-randconfig-r121-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112222.NIgwfLNG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112222.NIgwfLNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management Controller")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112222.NIgwfLNG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/macsmc.c:462:26: sparse: sparse: cast to restricted __be32
>> drivers/mfd/macsmc.c:462:26: sparse: sparse: cast to restricted __be32
>> drivers/mfd/macsmc.c:462:26: sparse: sparse: cast to restricted __be32
>> drivers/mfd/macsmc.c:462:26: sparse: sparse: cast to restricted __be32
>> drivers/mfd/macsmc.c:462:26: sparse: sparse: cast to restricted __be32
>> drivers/mfd/macsmc.c:462:26: sparse: sparse: cast to restricted __be32
   drivers/mfd/macsmc.c:242:5: sparse: sparse: context imbalance in 'apple_smc_write_atomic' - wrong count at exit

vim +462 drivers/mfd/macsmc.c

   404	
   405	static int apple_smc_probe(struct platform_device *pdev)
   406	{
   407		struct device *dev = &pdev->dev;
   408		struct apple_smc *smc;
   409		u32 count;
   410		int ret;
   411	
   412		smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
   413		if (!smc)
   414			return -ENOMEM;
   415	
   416		smc->dev = &pdev->dev;
   417		smc->sram_base = devm_platform_get_and_ioremap_resource(pdev, 1, &smc->sram);
   418		if (IS_ERR(smc->sram_base))
   419			return dev_err_probe(dev, PTR_ERR(smc->sram_base), "Failed to map SRAM region");
   420	
   421		smc->rtk = devm_apple_rtkit_init(dev, smc, NULL, 0, &apple_smc_rtkit_ops);
   422		if (IS_ERR(smc->rtk))
   423			return dev_err_probe(dev, PTR_ERR(smc->rtk), "Failed to initialize RTKit");
   424	
   425		smc->boot_stage = APPLE_SMC_BOOTING;
   426		ret = apple_rtkit_wake(smc->rtk);
   427		if (ret)
   428			return dev_err_probe(dev, ret, "Failed to wake up SMC");
   429	
   430		ret = devm_add_action_or_reset(dev, apple_smc_rtkit_shutdown, smc);
   431		if (ret)
   432			return dev_err_probe(dev, ret, "Failed to register rtkit shutdown action");
   433	
   434		ret = apple_rtkit_start_ep(smc->rtk, SMC_ENDPOINT);
   435		if (ret)
   436			return dev_err_probe(dev, ret, "Failed to start SMC endpoint");
   437	
   438		init_completion(&smc->init_done);
   439		init_completion(&smc->cmd_done);
   440	
   441		ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT,
   442					       FIELD_PREP(SMC_MSG, SMC_MSG_INITIALIZE), NULL, false);
   443		if (ret)
   444			return dev_err_probe(dev, ret, "Failed to send init message");
   445	
   446		if (wait_for_completion_timeout(&smc->init_done, msecs_to_jiffies(SMC_TIMEOUT_MS)) == 0) {
   447			dev_err(dev, "Timed out initializing SMC");
   448			return -ETIMEDOUT;
   449		}
   450	
   451		if (smc->boot_stage != APPLE_SMC_INITIALIZED) {
   452			dev_err(dev, "SMC failed to boot successfully, boot stage=%d\n", smc->boot_stage);
   453			return -EIO;
   454		}
   455	
   456		dev_set_drvdata(&pdev->dev, smc);
   457		BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
   458	
   459		ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
   460		if (ret)
   461			return dev_err_probe(smc->dev, ret, "Failed to get key count");
 > 462		smc->key_count = be32_to_cpu(count);
   463	
   464		/* Enable notifications */
   465		apple_smc_write_flag(smc, SMC_KEY(NTAP), true);
   466		ret = devm_add_action_or_reset(dev, apple_smc_disable_notifications, smc);
   467		if (ret)
   468			return dev_err_probe(dev, ret, "Failed to register notification disable action");
   469	
   470		ret = devm_mfd_add_devices(smc->dev, PLATFORM_DEVID_NONE,
   471					   apple_smc_devs, ARRAY_SIZE(apple_smc_devs),
   472					   NULL, 0, NULL);
   473		if (ret)
   474			return dev_err_probe(smc->dev, ret, "Failed to register sub-devices");
   475	
   476	
   477		return 0;
   478	}
   479	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
