Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E4F219EB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765698480; cv=none; b=WAnV6GOrWWXkD1S9LHftU8Mcp1dLu++sESgweQSOrYpK7x40SoVcrpzuwHfokK9fkVqdJ5pVh1LFCqalxeMj83PTJ3TK4+EVqMK9ehRnYdGra7jj81JnoXvRXKopyW07Z8TqJjdFRwUJv3bNZmbr081mk16vFXHHGksLUR1xK2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765698480; c=relaxed/simple;
	bh=CDoqBpIDDBCnoQoetPlApQQlQWWOdS4UnZNrJSlUznA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FqQEyNe/l5Q7yHMIumtqVQZoMZ03KTSb99gwTuxkE9d/vHo3chVkMyDYTohvJNbEfBZPeBANN7efDuy4mgWON/LlTh3cEqU86w2zj+RxgZMco8huoEpADJt2I39L65Gp1+WjJZTHIe29DKdnmLQ+a5s2Qvn6Du6k4OojqFk2BGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAwnckWk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAwnckWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765698479; x=1797234479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CDoqBpIDDBCnoQoetPlApQQlQWWOdS4UnZNrJSlUznA=;
  b=KAwnckWkwPHugrILaMhprlipw5k7qC4nZZa2MNWVayDvnpL66Q1xElnL
   PuP3yf3upaj9m1wZfYzrAinSXycUeLg8bjeLwdpFB05TAUd8/6ky1QVCc
   FvySD+DV19LU2NXFkUPs0pTgfDk1jX7EcLCfjT9wgtGgyBWH2IDA8o+t4
   vmGcsRG0vwVs/dXfbFfCxeuVo8K53LuBsKfwwjKHGyo8WfWVG9FEwLSa9
   jbpXeqbEREBHS2L9qFUcN46nn7JFpZioYk1GiPmVCNa03xsdqhnIBbwmf
   3+PqiW6xsXsZ8VQj+i8HqIucjsNFslIlhQPJzzHdUd5ihQCrXSTq2qTzu
   A==;
X-CSE-ConnectionGUID: ENQJ1RPiRZyVx2CQ/idotw==
X-CSE-MsgGUID: Ctg7UCSZRe6OcWvEtHBPSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78338073"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="78338073"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:47:58 -0800
X-CSE-ConnectionGUID: QrP6rdbuT4SicIPQz5WJ9g==
X-CSE-MsgGUID: 10WQYxbqRbSwq2tkdJJCMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197222238"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 23:47:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUgpd-000000008pZ-49VQ;
	Sun, 14 Dec 2025 07:47:53 +0000
Date: Sun, 14 Dec 2025 15:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:145:5:
 warning: no previous prototype for function '__arm_lpae_map'
Message-ID: <202512141522.5zpKT0Qk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 1f7c566fe2211514bf377944f1e9964255b2ba75 [2/2] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512141522.5zpKT0Qk-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141522.5zpKT0Qk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141522.5zpKT0Qk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:11:
   In file included from include/linux/io-pgtable-arm.h:5:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:145:5: warning: no previous prototype for function '__arm_lpae_map' [-Wmissing-prototypes]
     145 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     145 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:266:5: warning: no previous prototype for function 'arm_lpae_map_pages' [-Wmissing-prototypes]
     266 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     266 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:470:8: warning: no previous prototype for function '__arm_lpae_unmap_pages' [-Wmissing-prototypes]
     470 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:470:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     470 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:492:13: warning: no previous prototype for function 'arm_lpae_iova_to_phys' [-Wmissing-prototypes]
     492 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         |             ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:492:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     492 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:528:8: warning: no previous prototype for function 'arm_lpae_unmap_pages' [-Wmissing-prototypes]
     528 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:528:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     528 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:535:8: warning: no previous prototype for function 'arm_lpae_unmap_pages_walk' [-Wmissing-prototypes]
     535 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:535:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     535 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
   11 warnings generated.


vim +/__arm_lpae_map +145 drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c

cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  144  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18 @145  int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  146  		   phys_addr_t paddr, size_t size, size_t pgcount,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  147  		   arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  148  		   gfp_t gfp, size_t *mapped)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  149  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  150  	arm_lpae_iopte *cptep, pte;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  151  	size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  152  	size_t tblsz = ARM_LPAE_GRANULE(data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  153  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  154  	int ret = 0, num_entries, max_entries, map_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  155  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  156  	/* Find our entry at the current level */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  157  	map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  158  	ptep += map_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  159  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  160  	/* If we can install a leaf entry at this level, then do so */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  161  	if (size == block_size) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  162  		max_entries = ARM_LPAE_PTES_PER_TABLE(data) - map_idx_start;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  163  		num_entries = min_t(int, pgcount, max_entries);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  164  		ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl, num_entries, ptep);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  165  		if (!ret)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  166  			*mapped += num_entries * size;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  167  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  168  		return ret;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  169  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  170  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  171  	/* We can't allocate tables at the final level */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  172  	if (WARN_ON(lvl >= ARM_LPAE_MAX_LEVELS - 1))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  173  		return -EINVAL;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  174  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  175  	/* Grab a pointer to the next level */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  176  	pte = READ_ONCE(*ptep);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  177  	if (!pte) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  178  		cptep = __arm_lpae_alloc_pages(tblsz, gfp, cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  179  		if (!cptep)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  180  			return -ENOMEM;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  181  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  182  		pte = arm_lpae_install_table(cptep, ptep, 0, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  183  		if (pte)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  184  			__arm_lpae_free_pages(cptep, tblsz, cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  185  	} else if (!cfg->coherent_walk && !(pte & ARM_LPAE_PTE_SW_SYNC)) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  186  		__arm_lpae_sync_pte(ptep, 1, cfg);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  187  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  188  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  189  	if (pte && !iopte_leaf(pte, lvl, data->iop.fmt)) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  190  		cptep = iopte_deref(pte, data);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  191  	} else if (pte) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  192  		/* We require an unmap first */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  193  		WARN_ON(!selftest_running);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  194  		return -EEXIST;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  195  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  196  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  197  	/* Rinse, repeat */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  198  	return __arm_lpae_map(data, iova, paddr, size, pgcount, prot, lvl + 1,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  199  			      cptep, gfp, mapped);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  200  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  201  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  202  static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  203  					   int prot)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  204  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  205  	arm_lpae_iopte pte;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  206  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  207  	if (data->iop.fmt == ARM_64_LPAE_S1 ||
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  208  	    data->iop.fmt == ARM_32_LPAE_S1) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  209  		pte = ARM_LPAE_PTE_nG;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  210  		if (!(prot & IOMMU_WRITE) && (prot & IOMMU_READ))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  211  			pte |= ARM_LPAE_PTE_AP_RDONLY;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  212  		if (!(prot & IOMMU_PRIV))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  213  			pte |= ARM_LPAE_PTE_AP_UNPRIV;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  214  	} else {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  215  		pte = ARM_LPAE_PTE_HAP_FAULT;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  216  		if (prot & IOMMU_READ)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  217  			pte |= ARM_LPAE_PTE_HAP_READ;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  218  		if (prot & IOMMU_WRITE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  219  			pte |= ARM_LPAE_PTE_HAP_WRITE;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  220  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  221  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  222  	/*
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  223  	 * Note that this logic is structured to accommodate Mali LPAE
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  224  	 * having stage-1-like attributes but stage-2-like permissions.
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  225  	 */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  226  	if (data->iop.fmt == ARM_64_LPAE_S2 ||
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  227  	    data->iop.fmt == ARM_32_LPAE_S2) {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  228  		if (prot & IOMMU_MMIO)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  229  			pte |= ARM_LPAE_PTE_MEMATTR_DEV;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  230  		else if (prot & IOMMU_CACHE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  231  			pte |= ARM_LPAE_PTE_MEMATTR_OIWB;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  232  		else
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  233  			pte |= ARM_LPAE_PTE_MEMATTR_NC;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  234  	} else {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  235  		if (prot & IOMMU_MMIO)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  236  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_DEV
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  237  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  238  		else if (prot & IOMMU_CACHE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  239  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  240  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  241  	}
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  242  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  243  	/*
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  244  	 * Also Mali has its own notions of shareability wherein its Inner
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  245  	 * domain covers the cores within the GPU, and its Outer domain is
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  246  	 * "outside the GPU" (i.e. either the Inner or System domain in CPU
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  247  	 * terms, depending on coherency).
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  248  	 */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  249  	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  250  		pte |= ARM_LPAE_PTE_SH_IS;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  251  	else
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  252  		pte |= ARM_LPAE_PTE_SH_OS;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  253  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  254  	if (prot & IOMMU_NOEXEC)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  255  		pte |= ARM_LPAE_PTE_XN;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  256  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  257  	if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NS)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  258  		pte |= ARM_LPAE_PTE_NS;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  259  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  260  	if (data->iop.fmt != ARM_MALI_LPAE)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  261  		pte |= ARM_LPAE_PTE_AF;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  262  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  263  	return pte;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  264  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  265  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18 @266  int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  267  		       phys_addr_t paddr, size_t pgsize, size_t pgcount,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  268  		       int iommu_prot, gfp_t gfp, size_t *mapped)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  269  {
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  270  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  271  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  272  	arm_lpae_iopte *ptep = data->pgd;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  273  	int ret, lvl = data->start_level;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  274  	arm_lpae_iopte prot;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  275  	long iaext = (s64)iova >> cfg->ias;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  276  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  277  	if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  278  		return -EINVAL;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  279  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  280  	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  281  		iaext = ~iaext;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  282  	if (WARN_ON(iaext || paddr >> cfg->oas))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  283  		return -ERANGE;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  284  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  285  	/* If no access, then nothing to do */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  286  	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  287  		return 0;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  288  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  289  	prot = arm_lpae_prot_to_pte(data, iommu_prot);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  290  	ret = __arm_lpae_map(data, iova, paddr, pgsize, pgcount, prot, lvl,
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  291  			     ptep, gfp, mapped);
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  292  	/*
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  293  	 * Synchronise all PTE updates for the new mapping before there's
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  294  	 * a chance for anything to kick off a table walk for the new iova.
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  295  	 */
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  296  	wmb();
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  297  
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  298  	return ret;
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  299  }
cf616fc76f2555 Jean-Philippe Brucker 2022-11-18  300  

:::::: The code at line 145 was first introduced by commit
:::::: cf616fc76f2555d91fc88a543badc8a051f749c9 BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
