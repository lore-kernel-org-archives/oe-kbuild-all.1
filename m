Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0813C3FFAD5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519566; cv=none; b=ibmLJRIlxfzeMv1xyw9v/M389bovdirG3Jh7NO6/oStFSy8DfGzXylOBbZf4TadIdnl1FT4NL2TSiGWNxknAR36qCREv+UX9kZ+x7ehwjSuwwqzvKtu8Qu3p7oUkCzeaBg4KOeYUSBmD0SXNc6W/tvezeT0yYCT26P3Z3QmXJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519566; c=relaxed/simple;
	bh=WSdU09bJoSTjBXaMT+kE1W1fIrbUw+a7PaLxmnuMCXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HCL6owCBog/EcYD0k1W/14sRJQVUB5PvnSFWwSoaqN+1Hi1kFNk8PRIaCGCSDgdUoWbKgKfCfFA+2Sb6rbpsTzkCOuZJ+aP77taj/ncusmOhdx2YMh+CcSLV4AVpqh6CQbt5O25Gpe5dTSEzjPWHaRW2aKzS+x9anODp2b+CRrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsG3einb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsG3einb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778519565; x=1810055565;
  h=date:from:to:cc:subject:message-id;
  bh=WSdU09bJoSTjBXaMT+kE1W1fIrbUw+a7PaLxmnuMCXo=;
  b=VsG3einbSWyXpkC27bwTpu0hd2ndX/7dK5BYG41zFYw48mvCQTHH9IvF
   lj5ZtHyLE3a3Rhq3/JIoci6muCdjAIvfZjVFykJ7OMFcrd8W28eyRiw6f
   +tCw8ISVAV4zVGe+F8i7P6bcOHN2GgiwbXwrls5U61D/EzuxbqF8xKSMS
   ASzSKHJ18SoovDwIPwiVm3noMdA1D8/C/9ORWRb00uBuSellAxpFVJAVn
   0J90e+S8UbkkwfC+W3nXuK2MWqjnwIJJFqOsL/vUx5m3SoHGABb5PM8c9
   Av0KMv2/XBTuasAcdzkahVzVwLy4FtSdH8+iE+TXJx2XR/g5oFIfzLWz5
   w==;
X-CSE-ConnectionGUID: xUPus3MuSo+V4WflpFFwZw==
X-CSE-MsgGUID: ESRGr1hVQi2427mmrvT+gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89720121"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="89720121"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:12:44 -0700
X-CSE-ConnectionGUID: tlnTpMhYR8iZWfWHnGY57w==
X-CSE-MsgGUID: bIR+QEBoQL+IPtsNOyP7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="242474747"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 10:12:42 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMUBM-000000000vf-1PEV;
	Mon, 11 May 2026 17:12:40 +0000
Date: Tue, 12 May 2026 01:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jon Hunter <jonathanh@nvidia.com>,
 Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [jonhunter:tegra/tegra264 9/9]
 drivers/pci/controller/pcie-tegra264.c:228:27: warning: left shift count >=
 width of type
Message-ID: <202605120107.0zKF9ebo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jonhunter/linux tegra/tegra264
head:   de3856a60dafca44ccb5ead24e0fd37c1d852026
commit: de3856a60dafca44ccb5ead24e0fd37c1d852026 [9/9] PCI: tegra: Add Tegra264 support
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260512/202605120107.0zKF9ebo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120107.0zKF9ebo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120107.0zKF9ebo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-tegra264.c: In function 'tegra264_pcie_check_ranges':
>> drivers/pci/controller/pcie-tegra264.c:228:27: warning: left shift count >= width of type [-Wshift-count-overflow]
     228 |                 phys = hi << 32 | lo;
         |                           ^~
   drivers/pci/controller/pcie-tegra264.c:232:28: warning: left shift count >= width of type [-Wshift-count-overflow]
     232 |                 limit = hi << 32 | lo | mask;
         |                            ^~
   drivers/pci/controller/pcie-tegra264.c:248:19: warning: left shift count >= width of type [-Wshift-count-overflow]
     248 |         phys = hi << 32 | lo;
         |                   ^~


vim +228 drivers/pci/controller/pcie-tegra264.c

   152	
   153	/*
   154	 * The various memory regions used by the controller (I/O, memory, ECAM) are
   155	 * set up during early boot and have hardware-level protections in place. If
   156	 * the DT ranges don't match what's been setup, the controller won't be able
   157	 * to write the address endpoints properly, so make sure to validate that DT
   158	 * and firmware programming agree on these ranges.
   159	 */
   160	static bool tegra264_pcie_check_ranges(struct platform_device *pdev)
   161	{
   162		struct tegra264_pcie *pcie = platform_get_drvdata(pdev);
   163		struct device_node *np = pcie->dev->of_node;
   164		struct of_pci_range_parser parser;
   165		phys_addr_t phys, limit, hi, lo;
   166		struct of_pci_range range;
   167		struct resource *res;
   168		bool status = true;
   169		u32 value;
   170		int err;
   171	
   172		err = of_pci_range_parser_init(&parser, np);
   173		if (err < 0)
   174			return false;
   175	
   176		for_each_of_pci_range(&parser, &range) {
   177			unsigned int addr_hi, addr_lo, limit_hi, limit_lo, enable;
   178			unsigned long type = range.flags & IORESOURCE_TYPE_BITS;
   179			phys_addr_t start, end, mask;
   180			const char *region = NULL;
   181	
   182			end = range.cpu_addr + range.size - 1;
   183			start = range.cpu_addr;
   184	
   185			switch (type) {
   186			case IORESOURCE_IO:
   187				addr_hi = XAL_RC_IO_BASE_HI;
   188				addr_lo = XAL_RC_IO_BASE_LO;
   189				limit_hi = XAL_RC_IO_LIMIT_HI;
   190				limit_lo = XAL_RC_IO_LIMIT_LO;
   191				enable = XAL_RC_BAR_CNTL_STANDARD_IOBAR_EN;
   192				mask = SZ_64K - 1;
   193				region = "I/O";
   194				break;
   195	
   196			case IORESOURCE_MEM:
   197				if (range.flags & IORESOURCE_PREFETCH) {
   198					addr_hi = XAL_RC_MEM_64BIT_BASE_HI;
   199					addr_lo = XAL_RC_MEM_64BIT_BASE_LO;
   200					limit_hi = XAL_RC_MEM_64BIT_LIMIT_HI;
   201					limit_lo = XAL_RC_MEM_64BIT_LIMIT_LO;
   202					enable = XAL_RC_BAR_CNTL_STANDARD_64B_BAR_EN;
   203					region = "prefetchable memory";
   204				} else {
   205					addr_hi = XAL_RC_MEM_32BIT_BASE_HI;
   206					addr_lo = XAL_RC_MEM_32BIT_BASE_LO;
   207					limit_hi = XAL_RC_MEM_32BIT_LIMIT_HI;
   208					limit_lo = XAL_RC_MEM_32BIT_LIMIT_LO;
   209					enable = XAL_RC_BAR_CNTL_STANDARD_32B_BAR_EN;
   210					region = "memory";
   211				}
   212	
   213				mask = SZ_1M - 1;
   214				break;
   215			}
   216	
   217			/* not interested in anything that's not I/O or memory */
   218			if (!region)
   219				continue;
   220	
   221			/* don't check regions that haven't been enabled */
   222			value = readl(pcie->xal + XAL_RC_BAR_CNTL_STANDARD);
   223			if ((value & enable) == 0)
   224				continue;
   225	
   226			hi = readl(pcie->xal + addr_hi);
   227			lo = readl(pcie->xal + addr_lo);
 > 228			phys = hi << 32 | lo;
   229	
   230			hi = readl(pcie->xal + limit_hi);
   231			lo = readl(pcie->xal + limit_lo);
   232			limit = hi << 32 | lo | mask;
   233	
   234			if (phys != start || limit != end) {
   235				dev_err(pcie->dev,
   236					"%s region mismatch: %pap-%pap -> %pap-%pap\n",
   237					region, &phys, &limit, &start, &end);
   238				status = false;
   239			}
   240		}
   241	
   242		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ecam");
   243		if (!res)
   244			return false;
   245	
   246		hi = readl(pcie->xal + XAL_RC_ECAM_BASE_HI);
   247		lo = readl(pcie->xal + XAL_RC_ECAM_BASE_LO);
   248		phys = hi << 32 | lo;
   249	
   250		value = readl(pcie->xal + XAL_RC_ECAM_BUSMASK);
   251		limit = phys + ((value + 1) << 20) - 1;
   252	
   253		if (phys != res->start || limit != res->end) {
   254			dev_err(pcie->dev,
   255				"ECAM region mismatch: %pap-%pap -> %pap-%pap\n",
   256				&phys, &limit, &res->start, &res->end);
   257			status = false;
   258		}
   259	
   260		return status;
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
