Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD5A2B2D7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 06:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765606992; cv=none; b=jFldg00G1CvK2kDtiqL63mwEK4HdxFk6Yr5Cd9pV+rlzXlTkCGeGDNfvCL+MnXzFfYIvOx13/0lncOX/+pYWQdx8jaQ+eXpTwgtBAqSzk8q6Rvog8AXNdMGNh7PoHPx6lNmAkjlERQlpOj2QWAeS/eDG+697x8bJpPXSfd2nZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765606992; c=relaxed/simple;
	bh=PpdZEStpSqaQEExk6J7OjOxg/LSAFN9+6mkXxj8AAzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sVJiRxKYNfGNIK996uyPYc3fy/5Wa5Q6ZiLM1e1YwvJC+pbaZYNBpxCFDJ14Yckh+3cIXp4FE6QcZxROsfcuUl2cyFbWt/V3CTFnoPd2eMDmB9Szdr97WgB+XHgFai9yRbUxMCygOYfHXBO8y65YZYlWGlRflPeZtVseZM3KYho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcblelDM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcblelDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765606991; x=1797142991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PpdZEStpSqaQEExk6J7OjOxg/LSAFN9+6mkXxj8AAzM=;
  b=fcblelDMBcJxMJmn8AaR6FilfwOyq3oKOE9aaNySTAVQf7oD6+6thOHA
   folS+lsWVkfgM15GeXEaHFebMKDAzDpmtxaU1H/GnMlDP+rFL0p+qjnpp
   SUZ9IaMtC3L0BnZ3l+lshcn2OorkLmeMJrWc44bUXbJraUBVOm9fNIXHg
   cWyvLKeA80P3WF+YkjhbkZ8tqKVgAwZfZ2XYmM+E/t3BM+WPAstt50IQY
   MTQjS1aPfDaaRN9Qkz6Y9/YnHYaaCRuI9sMzVyOsAd+z5cJThAmm48gI3
   XB1S4KiPB5sS8d3Uh58YRPlYz5Bi1iNxVcToYP8FfzfBTwRziE/OxGeYk
   A==;
X-CSE-ConnectionGUID: g/tVCFroSSWGuYqX/KeLGw==
X-CSE-MsgGUID: vAIS5DcrSC2nuKrsRw9bOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78717869"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78717869"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:23:09 -0800
X-CSE-ConnectionGUID: Xl8UXKKBS/G3ug7xwI1NQA==
X-CSE-MsgGUID: mBzl5yG1ShuXYPwVtkLADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196340486"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 22:23:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJ21-000000007A3-3myq;
	Sat, 13 Dec 2025 06:23:05 +0000
Date: Sat, 13 Dec 2025 14:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype
 for '__arm_lpae_unmap_pages'
Message-ID: <202512131406.GCqWjEPh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 528a0fb681c600db04e9700fac40c21cc208773e [2/2] ANDROID: iommu/io-pgtable: Add unmap_pages_walk() operation
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20251213/202512131406.GCqWjEPh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131406.GCqWjEPh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131406.GCqWjEPh-lkp@intel.com/

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
