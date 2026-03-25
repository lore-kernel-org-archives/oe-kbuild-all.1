Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FE73358AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 21:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473638; cv=none; b=nj6bHKf8PXs/N3ZYiuiql6F7iH/V+1kj4OrrbK3ijX5+fu/RZgNWWrFkdNn49XIrfy/1CgVPCJ5eIEAHnuc5M6Q2kbN+gj78GUhY8f7k2OrDNLhkLHvgh3Xg+flhK5ZJriUHcwiMxSbAHFsvYuXNZUOgMVd4LMoA+5RMLtpF5Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473638; c=relaxed/simple;
	bh=h6jb1pR8kIW/IQrt/HnxPYNyJpFyLrhtkK/FTYdwD9Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sPVwoa2yJ0BXnNwRmkqWKYPxhStSBuZ6gnyTyaevFFROQsnuGSveHqi01D/mbqeIhejk3BNjRn39LcUYzyhHqafiZQntkq0SLdQZKK/S5nhd4qzV4f6SWjkN4sEXuHortoLoaF2uuRK1hhmXmlZpG4GSaRn/8fW6bURbFQBEGwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAiYZ2Qf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAiYZ2Qf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774473637; x=1806009637;
  h=date:from:to:cc:subject:message-id;
  bh=h6jb1pR8kIW/IQrt/HnxPYNyJpFyLrhtkK/FTYdwD9Y=;
  b=dAiYZ2QfLsg33ijdVYrbpr20cyFfZOWjQqcyerhcmlESCc0ZNvgj3u9L
   HY2iIxhNapa4S0qZirUoUVfxAYQ5sW486hN5vcN4l/l8kq1eRi+z0qZPZ
   t/JOF8NXGKXhXIAfM8pBhFH9ACURw2qDVpSLBXSQg0h8y9/HSAyoHLD1P
   9Zan+EotB/+JOH+IhzYPZdMp31Rsr4+97LDW6mrFreBQ0BD0hMGA7OGtU
   s7roSuWr4fI3Ut8s1vs43WpWJDashxMnJoG0S0OFrAKZz19yJjHKpmdM/
   YMgXTBcblG3i5XLlG+2t69mZkv+UtouOJSlL/qSMH2wGFoFo2WQdlCN6f
   A==;
X-CSE-ConnectionGUID: LF7DpbBFRxi30IE56GBuiA==
X-CSE-MsgGUID: kArjS6bKQCupX+KYHOQgiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75485908"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75485908"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 14:20:37 -0700
X-CSE-ConnectionGUID: ir3CbubMRfW9kiD+VhapYg==
X-CSE-MsgGUID: 03XA0eC8SSm2JVZL89n3zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224748324"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Mar 2026 14:20:36 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5VeS-000000007jt-2vYZ;
	Wed, 25 Mar 2026 21:20:32 +0000
Date: Thu, 26 Mar 2026 05:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/iommu/io-pgtable-arm-common.c:263:5: warning: no previous prototype
 for 'arm_lpae_map_pages'
Message-ID: <202603260547.OIH8M3Eu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jean-Philippe,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   028e591355fbe43d834e69213a013c2944080c1a
commit: 13eaf12ed57eb62de2eb52ae870f5b94ad4e5ba0 [1/1] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split initialization
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260326/202603260547.OIH8M3Eu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260547.OIH8M3Eu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260547.OIH8M3Eu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/io-pgtable-arm-common.c:142:5: warning: no previous prototype for '__arm_lpae_map' [-Wmissing-prototypes]
     142 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^~~~~~~~~~~~~~
>> drivers/iommu/io-pgtable-arm-common.c:263:5: warning: no previous prototype for 'arm_lpae_map_pages' [-Wmissing-prototypes]
     263 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/iommu/io-pgtable-arm-common.c:448:8: warning: no previous prototype for 'arm_lpae_unmap_pages' [-Wmissing-prototypes]
     448 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/io-pgtable-arm-common.c:469:13: warning: no previous prototype for 'arm_lpae_iova_to_phys' [-Wmissing-prototypes]
     469 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/arm_lpae_map_pages +263 drivers/iommu/io-pgtable-arm-common.c

cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  262  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18 @263  int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  264  		       phys_addr_t paddr, size_t pgsize, size_t pgcount,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  265  		       int iommu_prot, gfp_t gfp, size_t *mapped)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  266  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  267  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  268  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  269  	arm_lpae_iopte *ptep = data->pgd;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  270  	int ret, lvl = data->start_level;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  271  	arm_lpae_iopte prot;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  272  	long iaext = (s64)iova >> cfg->ias;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  273  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  274  	if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  275  		return -EINVAL;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  276  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  277  	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  278  		iaext = ~iaext;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  279  	if (WARN_ON(iaext || paddr >> cfg->oas))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  280  		return -ERANGE;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  281  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  282  	/* If no access, then nothing to do */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  283  	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  284  		return 0;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  285  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  286  	prot = arm_lpae_prot_to_pte(data, iommu_prot);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  287  	ret = __arm_lpae_map(data, iova, paddr, pgsize, pgcount, prot, lvl,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  288  			     ptep, gfp, mapped);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  289  	/*
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  290  	 * Synchronise all PTE updates for the new mapping before there's
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  291  	 * a chance for anything to kick off a table walk for the new iova.
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  292  	 */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  293  	wmb();
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  294  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  295  	return ret;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  296  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  297  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  298  void __arm_lpae_free_pgtable(struct arm_lpae_io_pgtable *data, int lvl,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  299  			     arm_lpae_iopte *ptep)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  300  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  301  	arm_lpae_iopte *start, *end;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  302  	unsigned long table_size;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  303  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  304  	if (lvl == data->start_level)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  305  		table_size = ARM_LPAE_PGD_SIZE(data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  306  	else
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  307  		table_size = ARM_LPAE_GRANULE(data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  308  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  309  	start = ptep;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  310  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  311  	/* Only leaf entries at the last level */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  312  	if (lvl == ARM_LPAE_MAX_LEVELS - 1)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  313  		end = ptep;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  314  	else
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  315  		end = (void *)ptep + table_size;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  316  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  317  	while (ptep != end) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  318  		arm_lpae_iopte pte = *ptep++;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  319  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  320  		if (!pte || iopte_leaf(pte, lvl, data->iop.fmt))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  321  			continue;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  322  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  323  		__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  324  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  325  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  326  	__arm_lpae_free_pages(start, table_size, &data->iop.cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  327  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  328  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  329  static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  330  				       struct iommu_iotlb_gather *gather,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  331  				       unsigned long iova, size_t size,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  332  				       arm_lpae_iopte blk_pte, int lvl,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  333  				       arm_lpae_iopte *ptep, size_t pgcount)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  334  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  335  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  336  	arm_lpae_iopte pte, *tablep;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  337  	phys_addr_t blk_paddr;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  338  	size_t tablesz = ARM_LPAE_GRANULE(data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  339  	size_t split_sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  340  	int ptes_per_table = ARM_LPAE_PTES_PER_TABLE(data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  341  	int i, unmap_idx_start = -1, num_entries = 0, max_entries;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  342  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  343  	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  344  		return 0;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  345  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  346  	tablep = __arm_lpae_alloc_pages(tablesz, GFP_ATOMIC, cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  347  	if (!tablep)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  348  		return 0; /* Bytes unmapped */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  349  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  350  	if (size == split_sz) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  351  		unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  352  		max_entries = ptes_per_table - unmap_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  353  		num_entries = min_t(int, pgcount, max_entries);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  354  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  355  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  356  	blk_paddr = iopte_to_paddr(blk_pte, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  357  	pte = iopte_prot(blk_pte);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  358  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  359  	for (i = 0; i < ptes_per_table; i++, blk_paddr += split_sz) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  360  		/* Unmap! */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  361  		if (i >= unmap_idx_start && i < (unmap_idx_start + num_entries))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  362  			continue;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  363  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  364  		__arm_lpae_init_pte(data, blk_paddr, pte, lvl, 1, &tablep[i]);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  365  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  366  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  367  	pte = arm_lpae_install_table(tablep, ptep, blk_pte, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  368  	if (pte != blk_pte) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  369  		__arm_lpae_free_pages(tablep, tablesz, cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  370  		/*
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  371  		 * We may race against someone unmapping another part of this
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  372  		 * block, but anything else is invalid. We can't misinterpret
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  373  		 * a page entry here since we're never at the last level.
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  374  		 */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  375  		if (iopte_type(pte) != ARM_LPAE_PTE_TYPE_TABLE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  376  			return 0;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  377  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  378  		tablep = iopte_deref(pte, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  379  	} else if (unmap_idx_start >= 0) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  380  		for (i = 0; i < num_entries; i++)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  381  			io_pgtable_tlb_add_page(&data->iop, gather, iova + i * size, size);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  382  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  383  		return num_entries * size;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  384  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  385  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  386  	return __arm_lpae_unmap(data, gather, iova, size, pgcount, lvl, tablep);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  387  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  388  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  389  static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  390  			       struct iommu_iotlb_gather *gather,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  391  			       unsigned long iova, size_t size, size_t pgcount,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  392  			       int lvl, arm_lpae_iopte *ptep)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  393  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  394  	arm_lpae_iopte pte;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  395  	struct io_pgtable *iop = &data->iop;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  396  	int i = 0, num_entries, max_entries, unmap_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  397  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  398  	/* Something went horribly wrong and we ran out of page table */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  399  	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  400  		return 0;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  401  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  402  	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  403  	ptep += unmap_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  404  	pte = READ_ONCE(*ptep);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  405  	if (WARN_ON(!pte))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  406  		return 0;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  407  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  408  	/* If the size matches this level, we're in the right place */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  409  	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  410  		max_entries = ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  411  		num_entries = min_t(int, pgcount, max_entries);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  412  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  413  		while (i < num_entries) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  414  			pte = READ_ONCE(*ptep);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  415  			if (WARN_ON(!pte))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  416  				break;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  417  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  418  			__arm_lpae_clear_pte(ptep, &iop->cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  419  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  420  			if (!iopte_leaf(pte, lvl, iop->fmt)) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  421  				/* Also flush any partial walks */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  422  				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  423  							  ARM_LPAE_GRANULE(data));
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  424  				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  425  			} else if (!iommu_iotlb_gather_queued(gather)) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  426  				io_pgtable_tlb_add_page(iop, gather, iova + i * size, size);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  427  			}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  428  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  429  			ptep++;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  430  			i++;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  431  		}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  432  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  433  		return i * size;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  434  	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  435  		/*
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  436  		 * Insert a table at the next level to map the old region,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  437  		 * minus the part we want to unmap
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  438  		 */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  439  		return arm_lpae_split_blk_unmap(data, gather, iova, size, pte,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  440  						lvl + 1, ptep, pgcount);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  441  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  442  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  443  	/* Keep on walkin' */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  444  	ptep = iopte_deref(pte, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  445  	return __arm_lpae_unmap(data, gather, iova, size, pgcount, lvl + 1, ptep);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  446  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  447  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18 @448  size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  449  			    size_t pgsize, size_t pgcount,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  450  			    struct iommu_iotlb_gather *gather)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  451  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  452  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  453  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  454  	arm_lpae_iopte *ptep = data->pgd;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  455  	long iaext = (s64)iova >> cfg->ias;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  456  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  457  	if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize || !pgcount))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  458  		return 0;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  459  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  460  	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  461  		iaext = ~iaext;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  462  	if (WARN_ON(iaext))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  463  		return 0;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  464  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  465  	return __arm_lpae_unmap(data, gather, iova, pgsize, pgcount,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  466  				data->start_level, ptep);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  467  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  468  

:::::: The code at line 263 was first introduced by commit
:::::: cf616fc76f2555d91fc88a543badc8a051f749c9 BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
