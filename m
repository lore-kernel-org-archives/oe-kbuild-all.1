Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F056279DB1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 02:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784342993; cv=none; b=Ft8S469rYcfWawuomckkdCUF7qHogQ083AMj4oHTqgN+mvILDwPA0HTEj3U2JcVeF25Q6kGt3gTLVJ79eDnTmfQv9tqov7o+sk2rDRp/wWLLgbXGouzRr8kM4i8F/kjN3gdidPDTGsSCnC2NNfgz+p/oiJeQjbeK0RICTS72z6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784342993; c=relaxed/simple;
	bh=QK+OPnK7TCXq/9jOYppCiZMfCurBH5vFUMA8w8umYAQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l57MFBN1aimpLf2to/bo6LCu+CfZAUYCH6VMTRji8cFA7v9XVVFGFQqfBrwNYR+0+9pcVT1/jhAMMSz0+RSMGRNJHQKHWn0Ky2P7loD6w3JjAreyYSOf2HXEbtaIrC3h/1MujPrgAeKXx96EO8foAUX8czOzsEKt3JR8vT9CwtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKuA9UDI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKuA9UDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784342991; x=1815878991;
  h=date:from:to:cc:subject:message-id;
  bh=QK+OPnK7TCXq/9jOYppCiZMfCurBH5vFUMA8w8umYAQ=;
  b=CKuA9UDIlo/ROCwepnBIKqbzIZb1DV4Rv1EMFJtrLbH5qQmnleoxGyq5
   ZO7i0gtWDlOJBCiYG0R+Sd9hwoYh1SR0gSrN0wtq/ez6PTompB9kp8l62
   KRmZy1X0NnjUvFRCkriwi4fSfx2fULJj9yyGGsCguKvw9Biu9lwMbZxmc
   1u0y58dHN9VWx1bCk+SCsJ1do9YmKthzzgigGdidA9oXajN0zkuXI7pH3
   OwuCiVzs5smjpAtrMeNfGDb8d2Km7wAUkFz8zCvIe6M60XIE0jVnWyQGG
   39kMQXHgAQXEgrq2mR1HjnXdm2FkM0/dhAjIuWPhvdL7RcxscjqfF0hCp
   Q==;
X-CSE-ConnectionGUID: JLR21rV3S+aIGoEdnDGRBw==
X-CSE-MsgGUID: sZcTN+hcT1+JUjNtW4S2Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85038135"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85038135"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 19:49:50 -0700
X-CSE-ConnectionGUID: ymu/j2MPR0aqMwQggTPQVQ==
X-CSE-MsgGUID: xSJfae6NQf+NxPEDCWi1Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="256378190"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2026 19:49:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkv7Q-00000000TP3-3LtN;
	Sat, 18 Jul 2026 02:49:38 +0000
Date: Sat, 18 Jul 2026 10:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>
Subject: drivers/mfd/macsmc.c:462:26: sparse: sparse: cast to
 restricted __be32
Message-ID: <202607181046.OANjIoqR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: e038d985c9823a12cd64fa077d0c5aca2c644b67 mfd: Add Apple Silicon System Management Controller
date:   12 months ago
config: sparc64-randconfig-r131-20260716 (https://download.01.org/0day-ci/archive/20260718/202607181046.OANjIoqR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181046.OANjIoqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management Controller")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181046.OANjIoqR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
