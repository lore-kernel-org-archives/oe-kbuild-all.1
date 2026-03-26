Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5EB2D73A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 00:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774485709; cv=none; b=ua7uxRA/2XZ5FSEdKFlTH+XVbaJlRATW4nUs79O5MtWFtYdU7gF+xWN8e1lrr592depw97c2DH1h/c5uqX0g2NIF3lrBVLlrFIlIl4pv6hsxoddhFNsfghum8BEKOZqlr964uzH+lbk8Us0XOK6+PL4Q8jtNQv6Q2WkGUoxvLoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774485709; c=relaxed/simple;
	bh=SbOPBbtyN/7c78W0lSrp5ovuOYoE8sgyNjKlC7kitIo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B0dBG7T0s2Bp4Cf/xHC6mJZJ5PcEwYxWyX8geRvcjw34kVYG7umtX2D34uc3SdQsVR4bOrXWKrbXrhV+stafBesqr5mgN9PxZ8BgX5EoBy83DPvnU1qeJ5Ikdzac9tABKFmbsAwxZHMn48xltX/kufZ1xLwaawHzreg8T6xESHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9d9cheM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9d9cheM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774485707; x=1806021707;
  h=date:from:to:cc:subject:message-id;
  bh=SbOPBbtyN/7c78W0lSrp5ovuOYoE8sgyNjKlC7kitIo=;
  b=k9d9cheM/w5FyV8rFzIilV+8/2E7SurCBcXtiJhwpcfCZtyvw4gjIa6k
   4Nlm/zb+gvAtuObQCebEpoR1vkQWjGLHEas9YD2I2Bse185TlTwWnUm6Y
   covHXnvclVohwTjlqT+d61bKAf4uv8wbUle23q+aqZVA14jjxgj8UEuWp
   gPeGeBHJPrmSrHnWMolsPpXTsM7LXelPHmFWkK0atAhdfsdKqot+OL6s4
   32s/JZnnCzMrxZnt0rEy/oNacF+GS00Zb6CvcL+Rtz2eRAxXUJFYv/2k3
   4R6bLnL6P1RvHfjF0ki7b/D0TBQftPassd0mSfpI8wAoZgLhnKLElTFi+
   w==;
X-CSE-ConnectionGUID: ta7bTm0qQJmBrIk59gLgfQ==
X-CSE-MsgGUID: Y6SsRec3RXK9vrXyy28Hzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74717565"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="74717565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 17:41:46 -0700
X-CSE-ConnectionGUID: iSKyLS2gSM2YGcIhKq2sCg==
X-CSE-MsgGUID: nCEOjN/USpqN8ugAMsevyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="218250282"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2026 17:41:45 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Yn9-000000007uH-0PzQ;
	Thu, 26 Mar 2026 00:41:43 +0000
Date: Thu, 26 Mar 2026 08:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype
 for '__arm_lpae_unmap_pages'
Message-ID: <202603260818.rW00pLf5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   028e591355fbe43d834e69213a013c2944080c1a
commit: 528a0fb681c600db04e9700fac40c21cc208773e [1/1] ANDROID: iommu/io-pgtable: Add unmap_pages_walk() operation
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260326/202603260818.rW00pLf5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260818.rW00pLf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260818.rW00pLf5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/io-pgtable-arm-common.c:143:5: warning: no previous prototype for '__arm_lpae_map' [-Wmissing-prototypes]
     143 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-arm-common.c:264:5: warning: no previous prototype for 'arm_lpae_map_pages' [-Wmissing-prototypes]
     264 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype for '__arm_lpae_unmap_pages' [-Wmissing-prototypes]
     471 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-arm-common.c:493:13: warning: no previous prototype for 'arm_lpae_iova_to_phys' [-Wmissing-prototypes]
     493 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-arm-common.c:529:8: warning: no previous prototype for 'arm_lpae_unmap_pages' [-Wmissing-prototypes]
     529 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/io-pgtable-arm-common.c:536:8: warning: no previous prototype for 'arm_lpae_unmap_pages_walk' [-Wmissing-prototypes]
     536 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~


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
   529	size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
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
