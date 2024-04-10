Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B053372
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 19:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776169; cv=none; b=m/S9lr2zu641cB/AbZUwOdGwFOToEK51lm2214nNUgm/pHN0zIDCIedLCLYw0maJD8GZVNVZ5C7a4A1iKiOf1ydIc0dLQUFZSUY34zrSMOYtP0Q8EuUF2o9z8Wy9sv1IvAoxhumiVOtZCP70npCMJpkdlr3lpAM/W9Xzw/Eaq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776169; c=relaxed/simple;
	bh=Q43p2CsLNppvEhW67gRi+TladYynr7Al3OFagLFs1MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOIlP+egSGaMnsgYi5YzokQT+mowS0s8T1wAgnT4EXvqIjDQT/SuUL8ai74wK2zAPXPoC2hsvfS13k3vWL/+TMT4QqoggiSd6l0Li3zxlNVVeOKlL6neAi+OlQxUa/N3eatXu9V+T/i/dKHp4LRTuIBs9oIn3EUlB3jPNLeXDL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jk3F4F+Z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jk3F4F+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712776167; x=1744312167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q43p2CsLNppvEhW67gRi+TladYynr7Al3OFagLFs1MU=;
  b=jk3F4F+ZDqXcVXwfItd67PlQlF4hsL9mZqQXtDToDDgDxa128EjG394u
   p2yCVEe9mu2wahAusptC1OdFsKCEb/oyJEu62vuKtyOtt7hV/rARKWCyi
   f4W2xlYTQSx9aoTQ1ip0ma1suzrXfWIQ0PTxT2K+bJTL0b0y4QQ3t0Zg8
   SHgyO+jA6Qu8JgCzxCEQWg2z+rHHCZBVXA4zf2fNtpYNdig9xMyhihhMC
   w35HNMX0XMfzxensIinb32ic5s+E8mwtJ9ImoGZl1u7JLuYWX4T20zW9Q
   TM3g9CUFU7mEa1sW6SZYMm2o+ZBL620BVVHSwsW/Wjdh5Zcp9l+Qk5iCP
   g==;
X-CSE-ConnectionGUID: gCVBnK1CScCZhHZ3vFqebg==
X-CSE-MsgGUID: D24cF/fyTTiBdY0vRMwY0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33562912"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="33562912"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 12:09:26 -0700
X-CSE-ConnectionGUID: 8IltNqPpQv67PAo7RQiriw==
X-CSE-MsgGUID: +dRAfH0DT7e18CjQ13CzwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="21153327"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2024 12:09:25 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rudJy-0007iA-2E;
	Wed, 10 Apr 2024 19:09:22 +0000
Date: Thu, 11 Apr 2024 03:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21349/22070]
 drivers/mmc/host/phytium-mci-pci.c:48:15: error: implicit declaration of
 function 'pcim_enable_device'; did you mean 'pci_enable_device'?
Message-ID: <202404110253.L2D6kNbe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9b7534a0d66b224a89df1826d1494d121b15ada5
commit: d65622e6edee11f7fcbd295bdb5aef86e12dfef3 [21349/22070] mmc: add support for Phytium MMC
config: arm64-randconfig-002-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110253.L2D6kNbe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110253.L2D6kNbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110253.L2D6kNbe-lkp@intel.com/

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
>> drivers/mmc/host/phytium-mci-pci.c:180:1: warning: parameter names (without types) in function declaration
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
