Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DD9146599
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 06:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731998975; cv=none; b=FZQAcoQE50e7/tLR0v/vY/7NXOrAaON80OP2TC3Aq9xXCO+hTUSciPQP85VHh/vQFMlZVr+gs/paPVisvRvCxy3mKuFAsOJOyXCjBc4UITS+DBiJ/wKTlzXRcEUDdzLg/lCwJn76J6pqB7Pz41fix5vKo/ptC2A0aRZ/8LSUb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731998975; c=relaxed/simple;
	bh=AjEBptmGuYLNjl8dARBb9mEnsohr4rMk83LoYtKKYJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m81nA/y6QQq1Ey8Z3Hnc84G7WTqtPkDre+X9909jrSO04Zt7bzZsO9NPibPd1uXfwUz1zR43Sdccr5obznFGzAnvjX9qQKF0s4dWWG+ZxaXynJh73PRP7zof4aBSaVXAqIzgATdUVus+ZWWAXZirhUDeQRsvA77krE8ELUNeX5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdBCLq6w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdBCLq6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731998973; x=1763534973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjEBptmGuYLNjl8dARBb9mEnsohr4rMk83LoYtKKYJE=;
  b=SdBCLq6ww5AwWdQsMHo4W9Yc6l4eIm2cTtn0lqT4q/0f8sBgidyTTxCm
   pz13f13TqNcwy8bLerCDldTZUjTDIRgoTJ8LZWcgA3iij1YJ25aKWGAU6
   +J4JhQEirdQ0CH0ZQ3+Ow3eyLNnkgT2QfLOI7WR10aGKOTAmji+YqLjn0
   UlNEKFzYrDREYzFFHjlt0zoXtfw3S0mI66tjxvjHXS79RFUXcH0oOqQM1
   eHN5EZbuY/odII7/nFKHsrSmV/vUN9sPcTQQLyaTN7CXKVMzVqeGK/y7R
   +VOHkf2tHjPXAF6avnN4WDDzKHpGNeTZht95Q6D7PYxyy69iujVqw7GkA
   A==;
X-CSE-ConnectionGUID: DfUgtRvQRl2ntnpj9wJW0g==
X-CSE-MsgGUID: +QcsRGKhSp2RYdNFuDUA2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35890738"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="35890738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 22:49:32 -0800
X-CSE-ConnectionGUID: FACG4riFSEe9b08k7DLqaQ==
X-CSE-MsgGUID: Pw/TKy3kQTmjgHaXoBLikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="120390802"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2024 22:49:31 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDI0i-000094-1A;
	Tue, 19 Nov 2024 06:47:56 +0000
Date: Tue, 19 Nov 2024 14:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:pending-fixes 639/729] sound/soc/amd/ps/pci-ps.c:601:
 undefined reference to `snd_soc_acpi_amd_acp63_sdw_machines'
Message-ID: <202411191418.xjxcQBNJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   5ed96793046374dba245a6a7060cc945ff255800
commit: 56d540befd5940dc34b4e22cc9b8ce9bb45946f7 [639/729] ASoC: amd: ps: add soundwire machines for acp6.3 platform
config: i386-randconfig-001-20241119 (https://download.01.org/0day-ci/archive/20241119/202411191418.xjxcQBNJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191418.xjxcQBNJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191418.xjxcQBNJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/amd/ps/pci-ps.o: in function `snd_acp63_probe':
>> sound/soc/amd/ps/pci-ps.c:601: undefined reference to `snd_soc_acpi_amd_acp63_sdw_machines'


vim +601 sound/soc/amd/ps/pci-ps.c

   528	
   529	static int snd_acp63_probe(struct pci_dev *pci,
   530				   const struct pci_device_id *pci_id)
   531	{
   532		struct acp63_dev_data *adata;
   533		u32 addr;
   534		u32 irqflags, flag;
   535		int ret;
   536	
   537		irqflags = IRQF_SHARED;
   538	
   539		/* Return if acp config flag is defined */
   540		flag = snd_amd_acp_find_config(pci);
   541		if (flag)
   542			return -ENODEV;
   543	
   544		/* Pink Sardine device check */
   545		switch (pci->revision) {
   546		case 0x63:
   547			break;
   548		default:
   549			dev_dbg(&pci->dev, "acp63 pci device not found\n");
   550			return -ENODEV;
   551		}
   552		if (pci_enable_device(pci)) {
   553			dev_err(&pci->dev, "pci_enable_device failed\n");
   554			return -ENODEV;
   555		}
   556	
   557		ret = pci_request_regions(pci, "AMD ACP6.2 audio");
   558		if (ret < 0) {
   559			dev_err(&pci->dev, "pci_request_regions failed\n");
   560			goto disable_pci;
   561		}
   562		adata = devm_kzalloc(&pci->dev, sizeof(struct acp63_dev_data),
   563				     GFP_KERNEL);
   564		if (!adata) {
   565			ret = -ENOMEM;
   566			goto release_regions;
   567		}
   568	
   569		addr = pci_resource_start(pci, 0);
   570		adata->acp63_base = devm_ioremap(&pci->dev, addr,
   571						 pci_resource_len(pci, 0));
   572		if (!adata->acp63_base) {
   573			ret = -ENOMEM;
   574			goto release_regions;
   575		}
   576		adata->addr = addr;
   577		adata->reg_range = ACP63_REG_END - ACP63_REG_START;
   578		pci_set_master(pci);
   579		pci_set_drvdata(pci, adata);
   580		mutex_init(&adata->acp_lock);
   581		ret = acp63_init(adata->acp63_base, &pci->dev);
   582		if (ret)
   583			goto release_regions;
   584		ret = devm_request_threaded_irq(&pci->dev, pci->irq, acp63_irq_handler,
   585						acp63_irq_thread, irqflags, "ACP_PCI_IRQ", adata);
   586		if (ret) {
   587			dev_err(&pci->dev, "ACP PCI IRQ request failed\n");
   588			goto de_init;
   589		}
   590		ret = get_acp63_device_config(pci, adata);
   591		/* ACP PCI driver probe should be continued even PDM or SoundWire Devices are not found */
   592		if (ret) {
   593			dev_dbg(&pci->dev, "get acp device config failed:%d\n", ret);
   594			goto skip_pdev_creation;
   595		}
   596		ret = create_acp63_platform_devs(pci, adata, addr);
   597		if (ret < 0) {
   598			dev_err(&pci->dev, "ACP platform devices creation failed\n");
   599			goto de_init;
   600		}
 > 601		adata->machines = snd_soc_acpi_amd_acp63_sdw_machines;
   602		ret = acp63_machine_register(&pci->dev);
   603		if (ret) {
   604			dev_err(&pci->dev, "ACP machine register failed\n");
   605			goto de_init;
   606		}
   607	skip_pdev_creation:
   608		device_set_wakeup_enable(&pci->dev, true);
   609		pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
   610		pm_runtime_use_autosuspend(&pci->dev);
   611		pm_runtime_put_noidle(&pci->dev);
   612		pm_runtime_allow(&pci->dev);
   613		return 0;
   614	de_init:
   615		if (acp63_deinit(adata->acp63_base, &pci->dev))
   616			dev_err(&pci->dev, "ACP de-init failed\n");
   617	release_regions:
   618		pci_release_regions(pci);
   619	disable_pci:
   620		pci_disable_device(pci);
   621	
   622		return ret;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
