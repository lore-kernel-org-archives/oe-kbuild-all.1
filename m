Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACB722F11
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 17:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716311530; cv=none; b=QXD7iBbnIc3GOP+BmLBReMSqKi76mwRxC4nuCQnETJCY6tSykuIDSnYjCgLco+qBQFXR0FMfJ9YnN9sJv0qjvhwtTO2C5jURzsXpBU24gVV1G3qYTtkZ0n5mFayD54FCSs6xRXLpoxgjBUR8A42a+8lvTCae0yM/EdH0UZfMJqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716311530; c=relaxed/simple;
	bh=g1JBS9+4hJsfjQwU0MSdLWwdDoR1HpSE1cmGUbs8Dtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLH9cgoPO3XG3FslHsKJ7mw5hCDFahvBrzx0s4XxurgerVx9856pj/s0OTEvPgbKSeyt3z5KxS9bFSSzskxfI8nFtudRHTBPTkgyL08o69Z3q1pJ63wDGhytxJb287mWqtVr/hRCejyD2JeYxNWYAAbnVWdy3djGJF4r7zxEQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhFTcjX1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhFTcjX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716311528; x=1747847528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1JBS9+4hJsfjQwU0MSdLWwdDoR1HpSE1cmGUbs8Dtk=;
  b=GhFTcjX1QiTSraVAkYlu1ldAajEU0dXbRRxdiVYqbpozRRQCQVKD9Jn4
   kwXRCQGo43P89vY4M6/qwSlKyQp/MXDpmemjfmZyXO+d/Rp/itp3Pzadv
   jarGfBiOGGTQAy5avPjsBlIRVcn+FNC7rANhTmXRIVOBcfw6sE72CAEj4
   +XaR5C9s5qqHLzIVRWYheALiA09QxHZ0PVN9pZxm4Od4Z8O9GwuFYinnS
   qv+fSW+4JCpRm91pVO3P1+yNfCEeZiIw2c1DJ0uFhlLaf70bDn9E9eklF
   Zgcv3nXYI6RIdy1s/JEOlnsjEoFzZBPemB1Jp47b2A9ael0GQPhVkbGS+
   Q==;
X-CSE-ConnectionGUID: 5PR6RPXNQCWin2vuiGIKQw==
X-CSE-MsgGUID: a8W7Ph/+RgWYdqnS+I19Og==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12697907"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="12697907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 10:12:08 -0700
X-CSE-ConnectionGUID: MKiRQz9DSBmWg020BGcX3w==
X-CSE-MsgGUID: /I6AASZnTYGBd8GmEcm1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="33418443"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2024 10:12:06 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9T1u-0000Z3-2j;
	Tue, 21 May 2024 17:12:03 +0000
Date: Wed, 22 May 2024 01:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9619/9677]
 arch/x86/kernel/zhaoxin_kh40000.c:87:33: warning: initialization of 'struct
 iommu_domain *' from 'int' makes pointer from integer without a cast
Message-ID: <202405220034.VMppwRxc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f3f9407325616af0ea4e2399d86d31f8571fa55f
commit: 4332dbb07181359cccca3ba757ef54e434fb1296 [9619/9677] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-randconfig-102-20240521 (https://download.01.org/0day-ci/archive/20240522/202405220034.VMppwRxc-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220034.VMppwRxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220034.VMppwRxc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/zhaoxin_kh40000.c: In function 'kh40000_sync_single_dma_for_cpu':
   arch/x86/kernel/zhaoxin_kh40000.c:87:33: error: implicit declaration of function 'iommu_get_dma_domain'; did you mean 'iommu_is_dma_domain'? [-Werror=implicit-function-declaration]
      87 |   struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                 ^~~~~~~~~~~~~~~~~~~~
         |                                 iommu_is_dma_domain
>> arch/x86/kernel/zhaoxin_kh40000.c:87:33: warning: initialization of 'struct iommu_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +87 arch/x86/kernel/zhaoxin_kh40000.c

    64	
    65	static void kh40000_sync_single_dma_for_cpu(struct device *dev, dma_addr_t paddr,
    66			enum dma_data_direction dir, bool is_iommu)
    67	{
    68		u8 vid;
    69		struct pci_dev *pci;
    70		u64 dma_mask = *dev->dma_mask;
    71	
    72		/* check direction */
    73		if ((dir != DMA_FROM_DEVICE) && (dir != DMA_BIDIRECTIONAL))
    74			return;
    75	
    76		/* check dma capability */
    77		if (dma_mask <= DMA_BIT_MASK(32))
    78			return;
    79	
    80		/* check device type */
    81		pci = kh40000_get_pci_dev(dev);
    82		if (pci == NULL)
    83			return;
    84	
    85		/* get real physical address */
    86		if (is_iommu) {
  > 87			struct iommu_domain *domain = iommu_get_dma_domain(dev);
    88	
    89			paddr = iommu_iova_to_phys(domain, paddr);
    90			if (!paddr)
    91				return;
    92		}
    93	
    94		/* check node or not */
    95		if ((zhaoxin_patch_code & ZHAOXIN_P2CW_NODE_CHECK)
    96		   && pfn_to_nid(PFN_DOWN(paddr)) == dev_to_node(dev))
    97			return;
    98	
    99		/* flush data by one pci read cycle */
   100		pci_read_config_byte(pci, PCI_VENDOR_ID, &vid);
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
