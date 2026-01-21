Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5405D4534B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 07:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768979744; cv=none; b=G2e1DcLiIVZe9nJOP8LIwAGuw4O8jntAByqUqtHH9YNUfGusK6sUj+4dYpYuoLE2CGWHaPE+4d9ygYAKIyj67tLS40BpXK0xe8WTMelw1Og3Ibh7ORe88RbQqG2BHccdWsMPJGRd+hrh1pMHCI84IfTSRMiEp4y8WCcEc8FWHdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768979744; c=relaxed/simple;
	bh=tdbAvdxiQPRibAwQpFJUcPZnfzhcTDFF5YBmnZWAWas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=goFvQpC/YTijPwthkODuAh8rgu5m4EExBdFws6v6ZTauXD6b4Sxnx6reiJamHjRza3h3fwEFz/I88egC0e34HAiTwVkn2A5XviTo1e9t94DJHrXCjZMJSKLQFAPT6XbcAzNHXuXtBr7MwhQWb5A/ctAgF2Zx7kl5BwWfyU1Igfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtHCAizW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtHCAizW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768979744; x=1800515744;
  h=date:from:to:cc:subject:message-id;
  bh=tdbAvdxiQPRibAwQpFJUcPZnfzhcTDFF5YBmnZWAWas=;
  b=BtHCAizWt4qM7+Ghd3bYwSp/+t8APbNwZGPw80Ft57OEa4p0ykF4RLE9
   5UmY4ZwJR2lIdnHk3fy7tIpYvwKpdXfd8tyxIwA7msLz6wQIyzwxZoF1Z
   P4j358tPZy+wfLeX2nPfeVcqrIgwCPviIrMVhJYqkcpTuUg2RswCBMJ31
   Vhe7YiF+D5XWj61fTnJtLdC0ApE1xafdtTp68QjvXuO969orm3rS+XktL
   QytQy1WoBsZ1GZSIdPHRxmdXLCw7xJND8BxY+JfigHIM4CdsRIj6RZZBs
   Q7YA808eWIV4cTnDFizvs7zHyX2qaawTBUjTP0PUZBQdguKuENOePtITo
   A==;
X-CSE-ConnectionGUID: Qg3gvC/dSXSaJDtzShs06Q==
X-CSE-MsgGUID: z2qy5DB4Ru2MrmBEVAGCJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="57763796"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="57763796"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 23:15:43 -0800
X-CSE-ConnectionGUID: y+pOtOWqT9q4lSKYtSqIBQ==
X-CSE-MsgGUID: RoDMxGP4TaSx/r3iVCZW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="237620936"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jan 2026 23:15:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viSRG-00000000Q7n-39vx;
	Wed, 21 Jan 2026 07:15:38 +0000
Date: Wed, 21 Jan 2026 15:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 18/18]
 drivers/mfd/ls2k-bmc-core.c:434:14: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202601211557.nFZJGQfF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   406593924bc6e46a9b9f27a31a90d141f9d71f21
commit: 406593924bc6e46a9b9f27a31a90d141f9d71f21 [18/18] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: loongarch-randconfig-r122-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211557.nFZJGQfF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211557.nFZJGQfF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211557.nFZJGQfF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/ls2k-bmc-core.c:434:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *mode @@     got void [noderef] __iomem * @@
   drivers/mfd/ls2k-bmc-core.c:434:14: sparse:     expected char *mode
   drivers/mfd/ls2k-bmc-core.c:434:14: sparse:     got void [noderef] __iomem *
--
>> drivers/usb/dwc3/dwc3-qcom.c:605:22: sparse: sparse: symbol 'dwc3_qcom_glue_ops' was not declared. Should it be static?

vim +434 drivers/mfd/ls2k-bmc-core.c

d952bba3fbb5d8 Binbin Zhou 2025-09-04  423  
0d64f6d1ffe96f Binbin Zhou 2025-09-04  424  /*
0d64f6d1ffe96f Binbin Zhou 2025-09-04  425   * Currently the Loongson-2K BMC hardware does not have an I2C interface to adapt to the
0d64f6d1ffe96f Binbin Zhou 2025-09-04  426   * resolution. We set the resolution by presetting "video=1280x1024-16@2M" to the BMC memory.
0d64f6d1ffe96f Binbin Zhou 2025-09-04  427   */
0d64f6d1ffe96f Binbin Zhou 2025-09-04  428  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
0d64f6d1ffe96f Binbin Zhou 2025-09-04  429  {
0d64f6d1ffe96f Binbin Zhou 2025-09-04  430  	char *mode;
0d64f6d1ffe96f Binbin Zhou 2025-09-04  431  	int depth, ret;
0d64f6d1ffe96f Binbin Zhou 2025-09-04  432  
0d64f6d1ffe96f Binbin Zhou 2025-09-04  433  	/* The last 16M of PCI BAR0 is used to store the resolution string. */
0d64f6d1ffe96f Binbin Zhou 2025-09-04 @434  	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
0d64f6d1ffe96f Binbin Zhou 2025-09-04  435  	if (!mode)
0d64f6d1ffe96f Binbin Zhou 2025-09-04  436  		return -ENOMEM;
0d64f6d1ffe96f Binbin Zhou 2025-09-04  437  
0d64f6d1ffe96f Binbin Zhou 2025-09-04  438  	/* The resolution field starts with the flag "video=". */
0d64f6d1ffe96f Binbin Zhou 2025-09-04  439  	if (!strncmp(mode, "video=", 6))
0d64f6d1ffe96f Binbin Zhou 2025-09-04  440  		mode = mode + 6;
0d64f6d1ffe96f Binbin Zhou 2025-09-04  441  
0d64f6d1ffe96f Binbin Zhou 2025-09-04  442  	ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
0d64f6d1ffe96f Binbin Zhou 2025-09-04  443  	if (ret)
0d64f6d1ffe96f Binbin Zhou 2025-09-04  444  		return ret;
0d64f6d1ffe96f Binbin Zhou 2025-09-04  445  
0d64f6d1ffe96f Binbin Zhou 2025-09-04  446  	ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
0d64f6d1ffe96f Binbin Zhou 2025-09-04  447  	if (ret)
0d64f6d1ffe96f Binbin Zhou 2025-09-04  448  		return ret;
0d64f6d1ffe96f Binbin Zhou 2025-09-04  449  
0d64f6d1ffe96f Binbin Zhou 2025-09-04  450  	ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
0d64f6d1ffe96f Binbin Zhou 2025-09-04  451  	if (ret)
0d64f6d1ffe96f Binbin Zhou 2025-09-04  452  		return ret;
0d64f6d1ffe96f Binbin Zhou 2025-09-04  453  
0d64f6d1ffe96f Binbin Zhou 2025-09-04  454  	pd->stride = pd->width * depth / 8;
0d64f6d1ffe96f Binbin Zhou 2025-09-04  455  	pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
0d64f6d1ffe96f Binbin Zhou 2025-09-04  456  
0d64f6d1ffe96f Binbin Zhou 2025-09-04  457  	return 0;
0d64f6d1ffe96f Binbin Zhou 2025-09-04  458  }
0d64f6d1ffe96f Binbin Zhou 2025-09-04  459  

:::::: The code at line 434 was first introduced by commit
:::::: 0d64f6d1ffe96f59145481f7413344b1fa3ad1ce mfd: ls2kbmc: Introduce Loongson-2K BMC core driver

:::::: TO: Binbin Zhou <zhoubinbin@loongson.cn>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
