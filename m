Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49ED36DA0D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 02:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857853; cv=none; b=YBaX3QgVZun1jthXSnPzaQK3gXroWOLOGwj7lHjQtp0rDrFhwdf8a6Osw4CNVJKRF38NldnJRdKHF21RAghMSIqUTwfQGVyGG5MJiDbnoGyghsvd/nGLl9GTeF1sfsmcvAUz7+k3C0qRYTgn1gDf0fvxzq1I/TooaNXRcjboy+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857853; c=relaxed/simple;
	bh=g11k3XyKfE1mQKEXT42iLG4AvR1CjD7+VBdAuDuvJUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZzCjaklA7Vn5vNsyvcGF5M4ZG3J+z1SS6fwCdzxvgH7ovKlPsIC9rtLtxlEZCkRQfx79aip1cmgyxbDgavo1389fWJAvGCr8DYP9mPxyDpJpDwIC415SE4gzaFUX51hBB2WtpIT6SpNGhIMz4XLR95ktddpheey7fOXEwSRH4HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElOHHQVV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElOHHQVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791857851; x=1823393851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g11k3XyKfE1mQKEXT42iLG4AvR1CjD7+VBdAuDuvJUY=;
  b=ElOHHQVVqjHfUHGSNQTUgq4+mZaS8knSy4p3OpsfkNFjgPVfB3BBUyZl
   NUB5yRsmHHlh8CcET1U9rgrnq4KwNPaPoupX9g/Q47UGjEaSP9G2WgvYc
   CAbemSg4+kG60jO4l4NXI7hQaP35jnYvAp64m8PtA1zZwDADu3v/0FToH
   14aKGInN/2m59IDvvAvsm7i/9oNHTpkuUZwacqr+RgDsXz47RtXSfo4JW
   T0viiOAZWgjGithkbG4Elr2TbATUvGBkmbWTZMeWVVNTl1wArzEH4J5uC
   8EmMqdDb7XOP0usXe2s+azQNOQvD1xj4+lcKhGDL1L3v9A07UHql6P7Kj
   g==;
X-CSE-ConnectionGUID: Jdg2AM7MQOKxbm/lKb3mYA==
X-CSE-MsgGUID: seoDKV5ORFmls+Y2M1TQnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="469410"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="469410"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 19:17:31 -0700
X-CSE-ConnectionGUID: BfBOxF57Q0uKtBrWbs0BxA==
X-CSE-MsgGUID: VSc1FOwJTk+IPndAngUDvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1023549"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 12 Oct 2026 19:17:29 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGS51-00000000ALz-1325;
	Tue, 13 Oct 2026 02:17:27 +0000
Date: Tue, 13 Oct 2026 04:17:03 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 =?us-ascii?Q?arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgt?=
 =?us-ascii?Q?able-arm-common.c:143:5:?= warning: no previous prototype for
 '__arm_lpae_map'
Message-ID: <202610130455.GsOGPhms-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Jean-Philippe,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5597a6bf0b11918da3f4fc2e4354f904acd26cc7
commit: cc07183cc836e2c8e29a55ae6e8e2aa431d59170 [1/1] BACKPORT: FROMLIST: KVM: arm64: smmu-v3: Support io-pgtable
config: arm64-randconfig-r2105-20261012 (https://download.01.org/0day-ci/archive/20261013/202610130455.GsOGPhms-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130455.GsOGPhms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130455.GsOGPhms-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:143:5: warning: no previous prototype for '__arm_lpae_map' [-Wmissing-prototypes]
     143 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:264:5: warning: no previous prototype for 'arm_lpae_map_pages' [-Wmissing-prototypes]
     264 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |     ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype for '__arm_lpae_unmap_pages' [-Wmissing-prototypes]
     471 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:493:13: warning: no previous prototype for 'arm_lpae_iova_to_phys' [-Wmissing-prototypes]
     493 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:529:8: warning: no previous prototype for 'arm_lpae_unmap_pages' [-Wmissing-prototypes]
     529 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:536:8: warning: no previous prototype for 'arm_lpae_unmap_pages_walk' [-Wmissing-prototypes]
     536 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/__arm_lpae_map +143 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c

cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  142  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18 @143  int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  144  		   phys_addr_t paddr, size_t size, size_t pgcount,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  145  		   arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  146  		   gfp_t gfp, size_t *mapped)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  147  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  148  	arm_lpae_iopte *cptep, pte;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  149  	size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  150  	size_t tblsz = ARM_LPAE_GRANULE(data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  151  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  152  	int ret = 0, num_entries, max_entries, map_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  153  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  154  	/* Find our entry at the current level */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  155  	map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  156  	ptep += map_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  157  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  158  	/* If we can install a leaf entry at this level, then do so */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  159  	if (size == block_size) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  160  		max_entries = ARM_LPAE_PTES_PER_TABLE(data) - map_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  161  		num_entries = min_t(int, pgcount, max_entries);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  162  		ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl, num_entries, ptep);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  163  		if (!ret)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  164  			*mapped += num_entries * size;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  165  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  166  		return ret;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  167  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  168  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  169  	/* We can't allocate tables at the final level */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  170  	if (WARN_ON(lvl >= ARM_LPAE_MAX_LEVELS - 1))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  171  		return -EINVAL;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  172  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  173  	/* Grab a pointer to the next level */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  174  	pte = READ_ONCE(*ptep);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  175  	if (!pte) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  176  		cptep = __arm_lpae_alloc_pages(tblsz, gfp, cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  177  		if (!cptep)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  178  			return -ENOMEM;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  179  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  180  		pte = arm_lpae_install_table(cptep, ptep, 0, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  181  		if (pte)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  182  			__arm_lpae_free_pages(cptep, tblsz, cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  183  	} else if (!cfg->coherent_walk && !(pte & ARM_LPAE_PTE_SW_SYNC)) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  184  		__arm_lpae_sync_pte(ptep, 1, cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  185  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  186  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  187  	if (pte && !iopte_leaf(pte, lvl, data->iop.fmt)) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  188  		cptep = iopte_deref(pte, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  189  	} else if (pte) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  190  		/* We require an unmap first */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  191  		WARN_ON(!selftest_running);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  192  		return -EEXIST;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  193  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  194  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  195  	/* Rinse, repeat */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  196  	return __arm_lpae_map(data, iova, paddr, size, pgcount, prot, lvl + 1,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  197  			      cptep, gfp, mapped);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  198  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  199  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  200  static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  201  					   int prot)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  202  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  203  	arm_lpae_iopte pte;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  204  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  205  	if (data->iop.fmt == ARM_64_LPAE_S1 ||
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  206  	    data->iop.fmt == ARM_32_LPAE_S1) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  207  		pte = ARM_LPAE_PTE_nG;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  208  		if (!(prot & IOMMU_WRITE) && (prot & IOMMU_READ))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  209  			pte |= ARM_LPAE_PTE_AP_RDONLY;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  210  		if (!(prot & IOMMU_PRIV))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  211  			pte |= ARM_LPAE_PTE_AP_UNPRIV;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  212  	} else {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  213  		pte = ARM_LPAE_PTE_HAP_FAULT;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  214  		if (prot & IOMMU_READ)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  215  			pte |= ARM_LPAE_PTE_HAP_READ;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  216  		if (prot & IOMMU_WRITE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  217  			pte |= ARM_LPAE_PTE_HAP_WRITE;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  218  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  219  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  220  	/*
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  221  	 * Note that this logic is structured to accommodate Mali LPAE
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  222  	 * having stage-1-like attributes but stage-2-like permissions.
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  223  	 */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  224  	if (data->iop.fmt == ARM_64_LPAE_S2 ||
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  225  	    data->iop.fmt == ARM_32_LPAE_S2) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  226  		if (prot & IOMMU_MMIO)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  227  			pte |= ARM_LPAE_PTE_MEMATTR_DEV;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  228  		else if (prot & IOMMU_CACHE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  229  			pte |= ARM_LPAE_PTE_MEMATTR_OIWB;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  230  		else
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  231  			pte |= ARM_LPAE_PTE_MEMATTR_NC;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  232  	} else {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  233  		if (prot & IOMMU_MMIO)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  234  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_DEV
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  235  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  236  		else if (prot & IOMMU_CACHE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  237  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  238  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  239  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  240  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  241  	/*
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  242  	 * Also Mali has its own notions of shareability wherein its Inner
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  243  	 * domain covers the cores within the GPU, and its Outer domain is
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  244  	 * "outside the GPU" (i.e. either the Inner or System domain in CPU
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  245  	 * terms, depending on coherency).
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  246  	 */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  247  	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  248  		pte |= ARM_LPAE_PTE_SH_IS;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  249  	else
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  250  		pte |= ARM_LPAE_PTE_SH_OS;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  251  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  252  	if (prot & IOMMU_NOEXEC)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  253  		pte |= ARM_LPAE_PTE_XN;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  254  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  255  	if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NS)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  256  		pte |= ARM_LPAE_PTE_NS;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  257  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  258  	if (data->iop.fmt != ARM_MALI_LPAE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  259  		pte |= ARM_LPAE_PTE_AF;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  260  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  261  	return pte;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  262  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  263  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18 @264  int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  265  		       phys_addr_t paddr, size_t pgsize, size_t pgcount,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  266  		       int iommu_prot, gfp_t gfp, size_t *mapped)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  267  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  268  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  269  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  270  	arm_lpae_iopte *ptep = data->pgd;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  271  	int ret, lvl = data->start_level;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  272  	arm_lpae_iopte prot;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  273  	long iaext = (s64)iova >> cfg->ias;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  274  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  275  	if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  276  		return -EINVAL;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  277  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  278  	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  279  		iaext = ~iaext;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  280  	if (WARN_ON(iaext || paddr >> cfg->oas))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  281  		return -ERANGE;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  282  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  283  	/* If no access, then nothing to do */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  284  	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  285  		return 0;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  286  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  287  	prot = arm_lpae_prot_to_pte(data, iommu_prot);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  288  	ret = __arm_lpae_map(data, iova, paddr, pgsize, pgcount, prot, lvl,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  289  			     ptep, gfp, mapped);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  290  	/*
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  291  	 * Synchronise all PTE updates for the new mapping before there's
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  292  	 * a chance for anything to kick off a table walk for the new iova.
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  293  	 */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  294  	wmb();
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  295  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  296  	return ret;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  297  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  298  

:::::: The code at line 143 was first introduced by commit
:::::: cf616fc76f2555d91fc88a543badc8a051f749c9 BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Mostafa Saleh <smostafa@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
