Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF56170A03
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731485873; cv=none; b=D/IkojiMrq1BMTO/OtHnk0mh5NZNTIsQZjV619YL3VwnW/avqn8uzmdlMqF3I2FzpRsyIlbU/LQ5TQxulcZm6C3Fup+uXWCFs9rvTrfrgoBBmbVPXl3IC4GLY7cv9UIk0N4ZCQ8sq+RA1vT3/RMdqIGCg3qmEOyzeCk4B/4pF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731485873; c=relaxed/simple;
	bh=UJ4ttMOresGgNJ2a5vZaaKdD1JP2YF6vYqynwGSzWXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=enJE08POT/k6lfq6fn4sIpDLYrq2g0PiT5dUaB2lFvEPtY5dnEE07Pcv5khE2OIfME8UD9pswrxqS7THKD/m2EYsnuTkFw9L1KoNoo3gD9XCZ0Lhtng+/lUDxHaC0XUPhA+M0e9kxhl43bz/IwMtXoIMDfUAzUUqFB2t6qXce+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTJy2ffS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTJy2ffS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731485872; x=1763021872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJ4ttMOresGgNJ2a5vZaaKdD1JP2YF6vYqynwGSzWXc=;
  b=CTJy2ffS80IwMsSTOSLnr9L5CgNfkUJPYsszZr2u0G1k6TuskM0ef8cT
   ITZzlsARLHbrDZx3pGLA2fwVMWgLkWzWn4JVfTCXQ1auxaPdK7n2TO456
   P0GEA959yZspMpZBX1XgV8Cc1+Xk3k/txhyfF5mm1KbDv39Ak9iO4myZP
   QJu/c27pwSp1l+n80Zg+peRiIg6vQtN8yr06xLhtDPzeDwbp2AtE5+SNw
   g5gK697umXc2wvZUz+/fFyQ+YZwBg/BRo7WGFMjn1aGJegHC+0xK33+gL
   q1o/Ts/a65uwjESaXHrPrf7m7ie5nnM2XDy4LAjxJtTAlPpEj+0D3FN14
   w==;
X-CSE-ConnectionGUID: u/2VS6R4RU+mQa3xpOnmOg==
X-CSE-MsgGUID: g8C8JEvuTu+3Va8WcxkQYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18974291"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="18974291"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 00:17:44 -0800
X-CSE-ConnectionGUID: LeytM5DhQEOGjmWoLrQ9ew==
X-CSE-MsgGUID: m8YKsLaPQD6mxixxcM2lTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="92573533"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2024 00:16:46 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB8YH-00008V-2S;
	Wed, 13 Nov 2024 08:16:37 +0000
Date: Wed, 13 Nov 2024 16:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 drivers/mmc/host/phytium-mci-pci.c:48:15: error: implicit declaration of
 function 'pcim_enable_device'; did you mean 'pci_enable_device'?
Message-ID: <202411131629.7UL1eTyi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Malloy,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d047cc727adb896a530936ced8c98485e6654a11
commit: d65622e6edee11f7fcbd295bdb5aef86e12dfef3 [1291/1291] mmc: add support for Phytium MMC
config: arm64-randconfig-003-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131629.7UL1eTyi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131629.7UL1eTyi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131629.7UL1eTyi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/mmc/host/phytium-mci-pci.c: In function 'phytium_mci_pci_probe':
>> drivers/mmc/host/phytium-mci-pci.c:48:15: error: implicit declaration of function 'pcim_enable_device'; did you mean 'pci_enable_device'? [-Werror=implicit-function-declaration]
      48 |         ret = pcim_enable_device(pdev);
         |               ^~~~~~~~~~~~~~~~~~
         |               pci_enable_device
>> drivers/mmc/host/phytium-mci-pci.c:61:9: error: implicit declaration of function 'pci_enable_msi'; did you mean 'pci_enable_sriov'? [-Werror=implicit-function-declaration]
      61 |         pci_enable_msi(pdev);
         |         ^~~~~~~~~~~~~~
         |         pci_enable_sriov
   drivers/mmc/host/phytium-mci-pci.c: At top level:
>> drivers/mmc/host/phytium-mci-pci.c:180:1: warning: data definition has no type or storage class
     180 | module_pci_driver(phytium_mci_pci_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/mmc/host/phytium-mci-pci.c:180:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Werror=implicit-int]
>> drivers/mmc/host/phytium-mci-pci.c:180:1: warning: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/mmc/host/phytium-mci-pci.c:171:26: warning: 'phytium_mci_pci_driver' defined but not used [-Wunused-variable]
     171 | static struct pci_driver phytium_mci_pci_driver = {
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +48 drivers/mmc/host/phytium-mci-pci.c

    40	
    41	static int
    42	phytium_mci_pci_probe(struct pci_dev *pdev, const struct pci_device_id *pid)
    43	{
    44		struct phytium_mci_host *host;
    45		struct mmc_host *mmc;
    46		int ret;
    47	
  > 48		ret = pcim_enable_device(pdev);
    49	
    50		if (ret)
    51			return ret;
    52		pci_set_master(pdev);
    53	
    54		mmc = mmc_alloc_host(sizeof(struct phytium_mci_host), &pdev->dev);
    55	
    56		if (!mmc)
    57			return -ENOMEM;
    58	
    59		host = mmc_priv(mmc);
    60	
  > 61		pci_enable_msi(pdev);
    62	
    63		host->irq = pdev->irq;
    64		host->irq_flags = IRQF_SHARED;
    65		host->dev = &pdev->dev;
    66		ret = pcim_iomap_regions(pdev, 1 << PCI_BAR_NO, pci_name(pdev));
    67	
    68		if (ret) {
    69			dev_err(&pdev->dev, "I/O memory remapping failed\n");
    70			goto host_free;
    71		}
    72	
    73		host->base = pcim_iomap_table(pdev)[PCI_BAR_NO];
    74		host->is_use_dma = 1;
    75		host->is_device_x100 = 1;
    76	
    77		if (pdev->devfn == 2) {
    78			host->caps = emmc_caps;
    79			host->caps2 = emmc_caps2;
    80		} else {
    81			host->caps = sd_caps;
    82			host->caps2 = sd_caps2;
    83			mmc->f_max = 25000000; /* stable frequency */
    84		}
    85	
    86		host->mmc = mmc;
    87		host->clk_rate = MCI_CLK;
    88	
    89		dev_info(&pdev->dev,
    90			"%s %d:[bar %d] addr:0x%llx size:0x%llx km:0x%llx devfn:%d\n",
    91			 __func__, __LINE__, PCI_BAR_NO, pci_resource_start(pdev, 0),
    92			 pci_resource_len(pdev, 0), (uint64_t)host->base, pdev->devfn);
    93	
    94		dev_dbg(&pdev->dev, "%s %d:irq:0x%x\n", __func__, __LINE__, host->irq);
    95	
    96		ret = phytium_mci_common_probe(host);
    97	
    98		if (ret == MCI_REALEASE_MEM) {
    99			ret = -ENOMEM;
   100			goto release_mem;
   101		} else if (ret) {
   102			goto release;
   103		}
   104		pci_set_drvdata(pdev, mmc);
   105		dev_info(&pdev->dev,
   106			"%s %d: probe phytium mci successful.\n", __func__, __LINE__);
   107		return 0;
   108	
   109	release:
   110		phytium_mci_deinit_hw(host);
   111	release_mem:
   112	
   113		if (host->dma.adma_table) {
   114			dma_free_coherent(&pdev->dev,
   115				MAX_BD_NUM * sizeof(struct phytium_adma2_64_desc),
   116				host->dma.adma_table, host->dma.adma_addr);
   117		}
   118	host_free:
   119		mmc_free_host(mmc);
   120		pci_disable_device(pdev);
   121		return ret;
   122	}
   123	
   124	static void phytium_mci_pci_remove(struct pci_dev *pdev)
   125	{
   126		struct phytium_mci_host *host;
   127		struct mmc_host *mmc;
   128	
   129		mmc = pci_get_drvdata(pdev);
   130		if (!mmc) {
   131			dev_info(&pdev->dev,
   132				"%s %d: mmc is null.\n", __func__, __LINE__);
   133			return;
   134		}
   135		host = mmc_priv(mmc);
   136		if (!host) {
   137			dev_info(&pdev->dev,
   138				"%s %d: host is null.\n", __func__, __LINE__);
   139			mmc_remove_host(mmc);
   140			mmc_free_host(mmc);
   141			return;
   142		}
   143	
   144		del_timer(&host->hotplug_timer);
   145	
   146		mmc_remove_host(host->mmc);
   147	
   148		if (host->dma.adma_table) {
   149			dma_free_coherent(&pdev->dev,
   150				MAX_BD_NUM * sizeof(struct phytium_adma2_64_desc),
   151				host->dma.adma_table, host->dma.adma_addr);
   152		}
   153		phytium_mci_deinit_hw(host);
   154		mmc_free_host(mmc);
   155		pci_set_drvdata(pdev, NULL);
   156	}
   157	
   158	static const struct pci_device_id phytium_mci_pci_tbl[] = {
   159		{
   160			.vendor		= 0x1DB7,
   161			.device		= 0xDC28,
   162			.subvendor	= PCI_ANY_ID,
   163			.subdevice	= PCI_ANY_ID,
   164			.class		= 0x5,
   165			.class_mask	= 0,
   166		},
   167		{}
   168	};
   169	MODULE_DEVICE_TABLE(pci, phytium_mci_pci_tbl);
   170	
 > 171	static struct pci_driver phytium_mci_pci_driver = {
   172		.name		= "phytium-mci-pci",
   173		.id_table	= phytium_mci_pci_tbl,
   174		.probe		= phytium_mci_pci_probe,
   175		.remove		= phytium_mci_pci_remove,
   176		.driver	= {
   177			.pm	= &phytium_mci_dev_pm_ops,
   178		}
   179	};
 > 180	module_pci_driver(phytium_mci_pci_driver);
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
