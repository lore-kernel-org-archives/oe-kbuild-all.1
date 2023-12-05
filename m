Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328FFD2F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 11:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mS6OnrMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701774928; x=1733310928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cAHeC/Pk5J32+arFSFjYqzJQQT4EH8OrQxwDt0FBjLE=;
  b=mS6OnrMF8U1mQpK400g+Oacv5pBY5gj8t1IQoRsF1uqE33GjgUKYdD3F
   jlTrqCYg+wLPUXVwhBGfxJ1nKqdLIFOfhUxaWMBCCapdVsb2KZuUsdYCA
   +gTUDFl7LpnEEXxrcUJcnbTUQrcLCAhC/3CpczUYWC8UsseblJn3xiuH5
   lN9UAcx7+aE81prIuyb6QafbjLHs7dup9dMVGmVh5spLoDz9PPw5XGlM9
   O/kPCPluVlDoTjoG3ETIEnQy8EP54FC9RRuFBtNvmBhCXHPGKLVVnrtcZ
   jT3tOuOnmwIbcAfvFB1UMhaLWn9XIzUULiFbSfMRZxH+pPyNTiSQ125mj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7223275"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7223275"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:15:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="720663321"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="720663321"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 03:15:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rATOc-0008qD-0Z;
	Tue, 05 Dec 2023 11:15:22 +0000
Date: Tue, 5 Dec 2023 19:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-hans 28/36]
 drivers/platform/x86/intel/pmc/core_ssram.c:98:25: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202312051949.S6RGbdp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   35ddd61cf023b5deb2b7e9f1627abef053281c0a
commit: a01486dc4bb17de976c6d0a4b1ad5f8106525dfb [28/36] platform/x86/intel/pmc: Cleanup SSRAM discovery
config: x86_64-randconfig-r113-20231205 (https://download.01.org/0day-ci/archive/20231205/202312051949.S6RGbdp3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051949.S6RGbdp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051949.S6RGbdp3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/intel/pmc/core_ssram.c:98:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *val @@     got void [noderef] __iomem *__val @@
   drivers/platform/x86/intel/pmc/core_ssram.c:98:25: sparse:     expected void const volatile *val
   drivers/platform/x86/intel/pmc/core_ssram.c:98:25: sparse:     got void [noderef] __iomem *__val

vim +98 drivers/platform/x86/intel/pmc/core_ssram.c

    70	
    71	static int
    72	pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)
    73	{
    74		struct pci_dev *ssram_pcidev = pmcdev->ssram_pcidev;
    75		void __iomem __free(pmc_core_iounmap) *tmp_ssram = NULL;
    76		void __iomem __free(pmc_core_iounmap) *ssram = NULL;
    77		const struct pmc_reg_map *map;
    78		u64 ssram_base, pwrm_base;
    79		u16 devid;
    80	
    81		if (!pmcdev->regmap_list)
    82			return -ENOENT;
    83	
    84		ssram_base = ssram_pcidev->resource[0].start;
    85		tmp_ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
    86	
    87		if (pmc_idx != PMC_IDX_MAIN) {
    88			/*
    89			 * The secondary PMC BARS (which are behind hidden PCI devices)
    90			 * are read from fixed offsets in MMIO of the primary PMC BAR.
    91			 */
    92			ssram_base = get_base(tmp_ssram, offset);
    93			ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
    94			if (!ssram)
    95				return -ENOMEM;
    96	
    97		} else {
  > 98			ssram = no_free_ptr(tmp_ssram);
    99		}
   100	
   101		pwrm_base = get_base(ssram, SSRAM_PWRM_OFFSET);
   102		devid = readw(ssram + SSRAM_DEVID_OFFSET);
   103	
   104		map = pmc_core_find_regmap(pmcdev->regmap_list, devid);
   105		if (!map)
   106			return -ENODEV;
   107	
   108		return pmc_core_pmc_add(pmcdev, pwrm_base, map, PMC_IDX_MAIN);
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
