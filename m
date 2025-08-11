Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB7E1F875A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754941591; cv=none; b=n+z32pLBZxOxWl+AttO1LNsDSVjCnvErKbOYFwyndOtdBo9rhohw2oxX9hRJPJ87BPvoe/68Z0R9Mzub0HpmG+Q5xzhah/xvH2KOTLviTtSo0V49e+GnVX/IUT8Lx4+N2hFhPeQeIav1ndYK9heFxlw7LBfvaEbejr7DpMyW2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754941591; c=relaxed/simple;
	bh=X38fE7W7bsZL89rHdVjpVxhc9jXaumwchY+zKCycGQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P8QThivtwDVV1MRgaJWqBKZ69J6gDXLTLaN1Gg9zu3jFWJarn/KETK2EdRJwMKo4aZTu2UC1OFiXzMa8OwFjsI89J8MbsF46I7Hb553MIxO0K8jmP6ItE1EnhJWh3fngGPQ+D/XZg9wWsN5fx5R/bsH51dSj3qutlri/LFUPjRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmvMWZj2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmvMWZj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754941589; x=1786477589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X38fE7W7bsZL89rHdVjpVxhc9jXaumwchY+zKCycGQ4=;
  b=FmvMWZj2l1Tbc9/Dczl78d3i2agAci1y8DheyMy05rjH2rXumeqt7ncu
   tusgq8RuODaTcUw/lYHs4jStPzfLyxlmiix2HnzQ4P16aG8xzhjdqhcKF
   J7AHHgrJ3irsk5oxELXLAr9aVqB2fljjOegEGcAYDRhZ8UKjDD75We/Ml
   BZqIUuvJ0D05amJKgphQIUf7zmTHZNCaiy5ukq5AdZxh7L7JEHVqVM1Ta
   IYRiqJUk1yZbpQfkquB0tBoKEMVX/hR42jnn85sumO9NvPdMnQLvCvG9L
   jGHzri2WlyQN+9uoV1zouNHhUR+2MhSjcHFtXibEHJJBUn1HmlmQtlnfo
   w==;
X-CSE-ConnectionGUID: sFzJMXxbTY6B2wfcIhx1VQ==
X-CSE-MsgGUID: XNw9jTEQRN++cpm9uxG67g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67914368"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="67914368"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 12:46:27 -0700
X-CSE-ConnectionGUID: WSkOC3kKR4Ou8RVbWnrH9A==
X-CSE-MsgGUID: toZaCvTOTEyqA3wpkEn3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166390527"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 11 Aug 2025 12:46:26 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulYTQ-000371-27;
	Mon, 11 Aug 2025 19:46:24 +0000
Date: Mon, 11 Aug 2025 21:46:19 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype
 for '__arm_lpae_unmap_pages'
Message-ID: <202508112105.kASzXA5p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3b6fab0ff24f7108c71a4d9c12567455cb2a5a81
commit: 528a0fb681c600db04e9700fac40c21cc208773e [0/1] ANDROID: iommu/io-pgtable: Add unmap_pages_walk() operation
config: i386-buildonly-randconfig-2004-20250811 (https://download.01.org/0day-ci/archive/20250811/202508112105.kASzXA5p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508112105.kASzXA5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508112105.kASzXA5p-lkp@intel.com/

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
