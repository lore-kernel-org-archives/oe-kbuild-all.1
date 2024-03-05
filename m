Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320D29A2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 04:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709613034; cv=none; b=hZ+aYqaQmOqFlb15nFPu4NX2TTCcTBDKKtYKHv72llTCb13og0QyqLfDg2KyWfEot4GuHddyw1JL1tSK1OGjbfyYX78N2aoOOkWNLbX7zRsdZVBm9NAXhJRkNyOz1UqxOmvNFJLeItneCPeyLebHXty416TG3p30miZfZ44PEQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709613034; c=relaxed/simple;
	bh=q6qKHU3FB4wGlA1/+1DOyPxt67Snj8lYIlmA9+Yb1BM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RC6ub3PLrScOz0ypCrwdTggCN8NZChfcbkFqNI6I6S0orALSoaIc4RIYLZjW0AgxmGkw/azZbLRmKeuqR5OZEC+v3julUImNxzCG/Pw+2znDrQg1OUPIqBGODD04KTE3Cz4DXE+KOjAgvpCOfDBKy5XuhI57CR5Ec479SIxzRdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvOc7usl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvOc7usl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709613033; x=1741149033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6qKHU3FB4wGlA1/+1DOyPxt67Snj8lYIlmA9+Yb1BM=;
  b=cvOc7uslckxPpIT6D9uUTsJM3HwHGwE2qNnkNoMAjl5x7Q/07/rP9aRI
   dXnksiksMD9rZN2G0m86vadePm+WrJjKmFSoHozABx4ghBw/GXl37jxWa
   nEBWqU2xnBZkgQPgz297xGSAJPqP0F4Yg8EZXF9jHu535ZgZ2KeOAX+A7
   cNaWUadqzR4/kThlYbi77JVvcd5xbWyOdRU4MWdS0RyNh9HSrgyDxTh0J
   ca5NEuL3ngpYOAFsO1fCogVYuanoVxzXnZXOWmmIkqDoQ4q/gq7I28RyS
   fWFhO+Y0DWOvO5c6CFxNIH6YP4nsCaOh+1Jqwsil5h4GyEQmEkhM/O1YZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="29565398"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="29565398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 20:30:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9341744"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2024 20:30:31 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhMRh-00032D-0Z;
	Tue, 05 Mar 2024 04:30:29 +0000
Date: Tue, 5 Mar 2024 12:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 7/8]
 drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype
 for function '__arm_lpae_unmap_pages'
Message-ID: <202403051233.XSuNt0MO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a7294be0eb7058de592c1713af10741e17c4158f
commit: 528a0fb681c600db04e9700fac40c21cc208773e [7/8] ANDROID: iommu/io-pgtable: Add unmap_pages_walk() operation
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240305/202403051233.XSuNt0MO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051233.XSuNt0MO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051233.XSuNt0MO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/io-pgtable-arm-common.c:143:5: warning: no previous prototype for function '__arm_lpae_map' [-Wmissing-prototypes]
   int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
       ^
   drivers/iommu/io-pgtable-arm-common.c:143:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
   ^
   static 
   drivers/iommu/io-pgtable-arm-common.c:264:5: warning: no previous prototype for function 'arm_lpae_map_pages' [-Wmissing-prototypes]
   int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
       ^
   drivers/iommu/io-pgtable-arm-common.c:264:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
   ^
   static 
>> drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype for function '__arm_lpae_unmap_pages' [-Wmissing-prototypes]
   size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
          ^
   drivers/iommu/io-pgtable-arm-common.c:471:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
   ^
   static 
   drivers/iommu/io-pgtable-arm-common.c:493:13: warning: no previous prototype for function 'arm_lpae_iova_to_phys' [-Wmissing-prototypes]
   phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
               ^
   drivers/iommu/io-pgtable-arm-common.c:493:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
   ^
   static 
   drivers/iommu/io-pgtable-arm-common.c:529:8: warning: no previous prototype for function 'arm_lpae_unmap_pages' [-Wmissing-prototypes]
   size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
          ^
   drivers/iommu/io-pgtable-arm-common.c:529:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
   ^
   static 
>> drivers/iommu/io-pgtable-arm-common.c:536:8: warning: no previous prototype for function 'arm_lpae_unmap_pages_walk' [-Wmissing-prototypes]
   size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
          ^
   drivers/iommu/io-pgtable-arm-common.c:536:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
   ^
   static 
   6 warnings generated.


vim +/__arm_lpae_unmap_pages +471 drivers/iommu/io-pgtable-arm-common.c

   469	
   470	
 > 471	size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
   472				      size_t pgsize, size_t pgcount,
   473				      struct iommu_iotlb_gather *gather,
   474				      struct io_pgtable_walker *walker)
   475	{
   476		struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
   477		struct io_pgtable_cfg *cfg = &data->iop.cfg;
   478		arm_lpae_iopte *ptep = data->pgd;
   479		long iaext = (s64)iova >> cfg->ias;
   480	
   481		if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize || !pgcount))
   482			return 0;
   483	
   484		if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
   485			iaext = ~iaext;
   486		if (WARN_ON(iaext))
   487			return 0;
   488	
   489		return __arm_lpae_unmap(data, gather, iova, pgsize, pgcount,
   490					data->start_level, ptep, walker);
   491	}
   492	
   493	phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
   494					  unsigned long iova)
   495	{
   496		struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
   497		arm_lpae_iopte pte, *ptep = data->pgd;
   498		int lvl = data->start_level;
   499	
   500		do {
   501			/* Valid IOPTE pointer? */
   502			if (!ptep)
   503				return 0;
   504	
   505			/* Grab the IOPTE we're interested in */
   506			ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
   507			pte = READ_ONCE(*ptep);
   508	
   509			/* Valid entry? */
   510			if (!pte)
   511				return 0;
   512	
   513			/* Leaf entry? */
   514			if (iopte_leaf(pte, lvl, data->iop.fmt))
   515				goto found_translation;
   516	
   517			/* Take it to the next level */
   518			ptep = iopte_deref(pte, data);
   519		} while (++lvl < ARM_LPAE_MAX_LEVELS);
   520	
   521		/* Ran out of page tables to walk */
   522		return 0;
   523	
   524	found_translation:
   525		iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
   526		return iopte_to_paddr(pte, data) | iova;
   527	}
   528	
 > 529	size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
   530				    size_t pgsize, size_t pgcount,
   531				    struct iommu_iotlb_gather *gather)
   532	{
   533		return __arm_lpae_unmap_pages(ops, iova, pgsize, pgcount, gather, NULL);
   534	}
   535	
 > 536	size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
   537					 size_t pgsize, size_t pgcount,
   538					 struct iommu_iotlb_gather *gather,
   539					 struct io_pgtable_walker *walker)
   540	{
   541		return __arm_lpae_unmap_pages(ops, iova, pgsize, pgcount, gather, walker);
   542	}
   543	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
