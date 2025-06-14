Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67A9158520
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 19:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928648; cv=none; b=HanLcGsxBequfS3eI6KcsIm/SA+JtjkrVoE2ic0pBnJIb/Ao1tUEmRXcAwWqY54oEIgAJQD12ugBhIYVQCz8eVBHtFCY00AgWtrF9qJ566pXN4zQRj8jwHm9dnav4FdMVzv+gDOw2QK5so2sBB55Nafp1xWsW+wfv8AkRppt+IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928648; c=relaxed/simple;
	bh=ybH7nd/LkACgOceOR9FuUFDcNhzU+DqJAhtrjP8ZuUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RaRT7ET6kOeMRNb+keWnsxOQ/xpKxgkcUp1tUAn1nPSX7XWZRSuwLRB6ilU1USbhQFCRrDPVYgxZDHl3Yt7sghkG0ncdHR5iqwbh75PEybSa817CAE+XaAcYMEcPu5Aa8ya7I4mpoaEHukZVaInKM8zBGK3IhXk8tObU33K/mTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RDFYa29b; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDFYa29b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749928646; x=1781464646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ybH7nd/LkACgOceOR9FuUFDcNhzU+DqJAhtrjP8ZuUk=;
  b=RDFYa29b3TCbxJXRt8HeUaZo6EdKMidCOH/1PjoVghiKH+zHLMXHiJVp
   n0s+9ighNO6UddnVWZlyLPkL7gEpLZYKFX+Wm8dky2j8wK9+XAVzlJN98
   S20abGZupBku51y0P8mV9DKYUUPcgKl6EpCAY4FhOV+8TrFrYFcnNDBTC
   GzQD09ldArTZrIpjb1XgRHALiBHcsPtjS3NOwDVgyYyFzCWRjqeUGWKSZ
   0fDCVtt/3e+sWfzeXH2+WWeUvsjIpsgK8AO5ZmUI2TFzPytkuyQJXSebQ
   36T7c/dmtjupvUDVqXjATwt/UIQ+CU5NbogB0kCf9+uKU7Orw/fyd5evn
   A==;
X-CSE-ConnectionGUID: 7P9R/1seRhuLHSHuUgWabg==
X-CSE-MsgGUID: ZmuvqqwtSU+uN6LdlSO7hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52212112"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="52212112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 12:17:24 -0700
X-CSE-ConnectionGUID: gs2+czmYRNSDK30BTKU72g==
X-CSE-MsgGUID: keLZWFdDSeyOKHAbSIojtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="153071223"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2025 12:17:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQWNU-000DnN-19;
	Sat, 14 Jun 2025 19:17:20 +0000
Date: Sun, 15 Jun 2025 03:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/memory-region 10/17]
 drivers/net/ethernet/airoha/airoha_npu.c:535:43: error: 'rmem' undeclared;
 did you mean 'res'?
Message-ID: <202506150305.KYbtw9UQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
head:   acb6a336a64dc26032171de30a4d43a25aa88284
commit: 050d93627f59cfe49ee3d5f2e96a97d0e8244d21 [10/17] net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"
config: parisc-randconfig-002-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150305.KYbtw9UQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150305.KYbtw9UQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150305.KYbtw9UQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/airoha/airoha_npu.c: In function 'airoha_npu_probe':
>> drivers/net/ethernet/airoha/airoha_npu.c:535:43: error: 'rmem' undeclared (first use in this function); did you mean 'res'?
     err = airoha_npu_run_firmware(dev, base, rmem);
                                              ^~~~
                                              res
   drivers/net/ethernet/airoha/airoha_npu.c:535:43: note: each undeclared identifier is reported only once for each function it appears in


vim +535 drivers/net/ethernet/airoha/airoha_npu.c

23290c7bc190de Lorenzo Bianconi  2025-02-28  473  
23290c7bc190de Lorenzo Bianconi  2025-02-28  474  static int airoha_npu_probe(struct platform_device *pdev)
23290c7bc190de Lorenzo Bianconi  2025-02-28  475  {
23290c7bc190de Lorenzo Bianconi  2025-02-28  476  	struct device *dev = &pdev->dev;
23290c7bc190de Lorenzo Bianconi  2025-02-28  477  	struct airoha_npu *npu;
050d93627f59cf Rob Herring (Arm  2025-03-13  478) 	struct resource res;
23290c7bc190de Lorenzo Bianconi  2025-02-28  479  	void __iomem *base;
23290c7bc190de Lorenzo Bianconi  2025-02-28  480  	int i, irq, err;
23290c7bc190de Lorenzo Bianconi  2025-02-28  481  
23290c7bc190de Lorenzo Bianconi  2025-02-28  482  	base = devm_platform_ioremap_resource(pdev, 0);
23290c7bc190de Lorenzo Bianconi  2025-02-28  483  	if (IS_ERR(base))
23290c7bc190de Lorenzo Bianconi  2025-02-28  484  		return PTR_ERR(base);
23290c7bc190de Lorenzo Bianconi  2025-02-28  485  
23290c7bc190de Lorenzo Bianconi  2025-02-28  486  	npu = devm_kzalloc(dev, sizeof(*npu), GFP_KERNEL);
23290c7bc190de Lorenzo Bianconi  2025-02-28  487  	if (!npu)
23290c7bc190de Lorenzo Bianconi  2025-02-28  488  		return -ENOMEM;
23290c7bc190de Lorenzo Bianconi  2025-02-28  489  
23290c7bc190de Lorenzo Bianconi  2025-02-28  490  	npu->dev = dev;
23290c7bc190de Lorenzo Bianconi  2025-02-28  491  	npu->ops.ppe_init = airoha_npu_ppe_init;
23290c7bc190de Lorenzo Bianconi  2025-02-28  492  	npu->ops.ppe_deinit = airoha_npu_ppe_deinit;
23290c7bc190de Lorenzo Bianconi  2025-02-28  493  	npu->ops.ppe_flush_sram_entries = airoha_npu_ppe_flush_sram_entries;
23290c7bc190de Lorenzo Bianconi  2025-02-28  494  	npu->ops.ppe_foe_commit_entry = airoha_npu_foe_commit_entry;
23290c7bc190de Lorenzo Bianconi  2025-02-28  495  
23290c7bc190de Lorenzo Bianconi  2025-02-28  496  	npu->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
23290c7bc190de Lorenzo Bianconi  2025-02-28  497  	if (IS_ERR(npu->regmap))
23290c7bc190de Lorenzo Bianconi  2025-02-28  498  		return PTR_ERR(npu->regmap);
23290c7bc190de Lorenzo Bianconi  2025-02-28  499  
050d93627f59cf Rob Herring (Arm  2025-03-13  500) 	err = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
050d93627f59cf Rob Herring (Arm  2025-03-13  501) 	if (err)
050d93627f59cf Rob Herring (Arm  2025-03-13  502) 		return err;
23290c7bc190de Lorenzo Bianconi  2025-02-28  503  
23290c7bc190de Lorenzo Bianconi  2025-02-28  504  	irq = platform_get_irq(pdev, 0);
23290c7bc190de Lorenzo Bianconi  2025-02-28  505  	if (irq < 0)
23290c7bc190de Lorenzo Bianconi  2025-02-28  506  		return irq;
23290c7bc190de Lorenzo Bianconi  2025-02-28  507  
23290c7bc190de Lorenzo Bianconi  2025-02-28  508  	err = devm_request_irq(dev, irq, airoha_npu_mbox_handler,
23290c7bc190de Lorenzo Bianconi  2025-02-28  509  			       IRQF_SHARED, "airoha-npu-mbox", npu);
23290c7bc190de Lorenzo Bianconi  2025-02-28  510  	if (err)
23290c7bc190de Lorenzo Bianconi  2025-02-28  511  		return err;
23290c7bc190de Lorenzo Bianconi  2025-02-28  512  
23290c7bc190de Lorenzo Bianconi  2025-02-28  513  	for (i = 0; i < ARRAY_SIZE(npu->cores); i++) {
23290c7bc190de Lorenzo Bianconi  2025-02-28  514  		struct airoha_npu_core *core = &npu->cores[i];
23290c7bc190de Lorenzo Bianconi  2025-02-28  515  
23290c7bc190de Lorenzo Bianconi  2025-02-28  516  		spin_lock_init(&core->lock);
23290c7bc190de Lorenzo Bianconi  2025-02-28  517  		core->npu = npu;
23290c7bc190de Lorenzo Bianconi  2025-02-28  518  
23290c7bc190de Lorenzo Bianconi  2025-02-28  519  		irq = platform_get_irq(pdev, i + 1);
23290c7bc190de Lorenzo Bianconi  2025-02-28  520  		if (irq < 0)
23290c7bc190de Lorenzo Bianconi  2025-02-28  521  			return irq;
23290c7bc190de Lorenzo Bianconi  2025-02-28  522  
23290c7bc190de Lorenzo Bianconi  2025-02-28  523  		err = devm_request_irq(dev, irq, airoha_npu_wdt_handler,
23290c7bc190de Lorenzo Bianconi  2025-02-28  524  				       IRQF_SHARED, "airoha-npu-wdt", core);
23290c7bc190de Lorenzo Bianconi  2025-02-28  525  		if (err)
23290c7bc190de Lorenzo Bianconi  2025-02-28  526  			return err;
23290c7bc190de Lorenzo Bianconi  2025-02-28  527  
23290c7bc190de Lorenzo Bianconi  2025-02-28  528  		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
23290c7bc190de Lorenzo Bianconi  2025-02-28  529  	}
23290c7bc190de Lorenzo Bianconi  2025-02-28  530  
23290c7bc190de Lorenzo Bianconi  2025-02-28  531  	err = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
23290c7bc190de Lorenzo Bianconi  2025-02-28  532  	if (err)
23290c7bc190de Lorenzo Bianconi  2025-02-28  533  		return err;
23290c7bc190de Lorenzo Bianconi  2025-02-28  534  
23290c7bc190de Lorenzo Bianconi  2025-02-28 @535  	err = airoha_npu_run_firmware(dev, base, rmem);
23290c7bc190de Lorenzo Bianconi  2025-02-28  536  	if (err)
23290c7bc190de Lorenzo Bianconi  2025-02-28  537  		return dev_err_probe(dev, err, "failed to run npu firmware\n");
23290c7bc190de Lorenzo Bianconi  2025-02-28  538  
23290c7bc190de Lorenzo Bianconi  2025-02-28  539  	regmap_write(npu->regmap, REG_CR_NPU_MIB(10),
050d93627f59cf Rob Herring (Arm  2025-03-13  540) 		     res.start + NPU_EN7581_FIRMWARE_RV32_MAX_SIZE);
23290c7bc190de Lorenzo Bianconi  2025-02-28  541  	regmap_write(npu->regmap, REG_CR_NPU_MIB(11), 0x40000); /* SRAM 256K */
23290c7bc190de Lorenzo Bianconi  2025-02-28  542  	regmap_write(npu->regmap, REG_CR_NPU_MIB(12), 0);
23290c7bc190de Lorenzo Bianconi  2025-02-28  543  	regmap_write(npu->regmap, REG_CR_NPU_MIB(21), 1);
23290c7bc190de Lorenzo Bianconi  2025-02-28  544  	msleep(100);
23290c7bc190de Lorenzo Bianconi  2025-02-28  545  
23290c7bc190de Lorenzo Bianconi  2025-02-28  546  	/* setting booting address */
23290c7bc190de Lorenzo Bianconi  2025-02-28  547  	for (i = 0; i < NPU_NUM_CORES; i++)
050d93627f59cf Rob Herring (Arm  2025-03-13  548) 		regmap_write(npu->regmap, REG_CR_BOOT_BASE(i), res.start);
23290c7bc190de Lorenzo Bianconi  2025-02-28  549  	usleep_range(1000, 2000);
23290c7bc190de Lorenzo Bianconi  2025-02-28  550  
23290c7bc190de Lorenzo Bianconi  2025-02-28  551  	/* enable NPU cores */
23290c7bc190de Lorenzo Bianconi  2025-02-28  552  	/* do not start core3 since it is used for WiFi offloading */
23290c7bc190de Lorenzo Bianconi  2025-02-28  553  	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xf7);
23290c7bc190de Lorenzo Bianconi  2025-02-28  554  	regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
23290c7bc190de Lorenzo Bianconi  2025-02-28  555  	msleep(100);
23290c7bc190de Lorenzo Bianconi  2025-02-28  556  
23290c7bc190de Lorenzo Bianconi  2025-02-28  557  	platform_set_drvdata(pdev, npu);
23290c7bc190de Lorenzo Bianconi  2025-02-28  558  
23290c7bc190de Lorenzo Bianconi  2025-02-28  559  	return 0;
23290c7bc190de Lorenzo Bianconi  2025-02-28  560  }
23290c7bc190de Lorenzo Bianconi  2025-02-28  561  

:::::: The code at line 535 was first introduced by commit
:::::: 23290c7bc190def4e1ca61610992d9b7c32e33f3 net: airoha: Introduce Airoha NPU support

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
