Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA4034C9AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510720; cv=none; b=RfTjEFXhNL5xYx+uvAVHKsheafd8taTS1IFOLEE/+emmHn867EnlteSDQUH7DQY9AuKeCq+T+mo00NEq8kQKZtRs1v1eZxzZDK3AvDp4J3tinzdN/rKjUhVZt9nuF/rpp3k+2rGIJO9RIvBQ8AwY0CRVPcAXqouw4PHl1lLNXhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510720; c=relaxed/simple;
	bh=FG8wO2yRiPPk2c+Kpjj2XCxe9hYQAVCxaneZEO4ubaE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YOMDxEwwiS2ri9ozTmOBVMXvYxIjp9GneewaIzXHXBzDvz643Bw6dw+uL6acXL8CFVHEM7wskTB4rdCrmVI5ZnEM3aPctl1HsjCrr/NOCPX8DvY/6wvFxGPeMmYYMX2NYjgbxRYlk5ymBKkoYi/MLyrreqRd3A8CoYswVTAHFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJfiAijn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJfiAijn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774510719; x=1806046719;
  h=date:from:to:cc:subject:message-id;
  bh=FG8wO2yRiPPk2c+Kpjj2XCxe9hYQAVCxaneZEO4ubaE=;
  b=MJfiAijnk/tTXjKcX1EKEpAeT7Y969eQMTiKaTkjIHB/ZDBfIJqNDcQl
   fpo0aFt6FZWi3nryCyEI1F4Iagq9aHf55loFcp8lqFnujVPLJ8PvaKBdf
   L5HNGMcweTAKLUKNyLXHRBNd4g12Pr3vcMojbZaxqfZIt5ISL1NPhXfZJ
   3pFrdgCBOuRHiSBaTV06Cs5D/4F7jqZzfYXimKRp6HgMuEmZefcBAnfUj
   YAwdNO0xqbS2CLtrfluxSsyWJzTX8JaK+ZEt+tXV4C/5OCMDUuFpI/V9b
   ntklj2U1GzfxMUorZNsPVj3aerWHPE6fv+Yuo+Mpv/PX3IiI+D0GPKW68
   Q==;
X-CSE-ConnectionGUID: qqUgQRMzTcK//u+JOo1ZyQ==
X-CSE-MsgGUID: YjKfDMMZTdqBImj429zBCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75445624"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75445624"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:38:38 -0700
X-CSE-ConnectionGUID: ByvII4wRSkCxS7Qdprzl/w==
X-CSE-MsgGUID: DDcA95lLR3CntwD1np1hlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229695656"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 00:38:36 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5fIX-000000008Zd-3Y7u;
	Thu, 26 Mar 2026 07:38:33 +0000
Date: Thu, 26 Mar 2026 15:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype
 for function '__arm_lpae_map'
Message-ID: <202603261525.MK40vxm8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   028e591355fbe43d834e69213a013c2944080c1a
commit: cf616fc76f2555d91fc88a543badc8a051f749c9 [1/1] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260326/202603261525.MK40vxm8-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261525.MK40vxm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261525.MK40vxm8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/io-pgtable-arm-common.c:11:
   In file included from include/linux/io-pgtable-arm.h:5:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype for function '__arm_lpae_map' [-Wmissing-prototypes]
     139 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^
   drivers/iommu/io-pgtable-arm-common.c:139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     139 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         | ^
         | static 
   2 warnings generated.


vim +/__arm_lpae_map +139 drivers/iommu/io-pgtable-arm-common.c

   138	
 > 139	int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
   140			   phys_addr_t paddr, size_t size, size_t pgcount,
   141			   arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
   142			   gfp_t gfp, size_t *mapped)
   143	{
   144		arm_lpae_iopte *cptep, pte;
   145		size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
   146		size_t tblsz = ARM_LPAE_GRANULE(data);
   147		struct io_pgtable_cfg *cfg = &data->iop.cfg;
   148		int ret = 0, num_entries, max_entries, map_idx_start;
   149	
   150		/* Find our entry at the current level */
   151		map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
   152		ptep += map_idx_start;
   153	
   154		/* If we can install a leaf entry at this level, then do so */
   155		if (size == block_size) {
   156			max_entries = ARM_LPAE_PTES_PER_TABLE(data) - map_idx_start;
   157			num_entries = min_t(int, pgcount, max_entries);
   158			ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl, num_entries, ptep);
   159			if (!ret)
   160				*mapped += num_entries * size;
   161	
   162			return ret;
   163		}
   164	
   165		/* We can't allocate tables at the final level */
   166		if (WARN_ON(lvl >= ARM_LPAE_MAX_LEVELS - 1))
   167			return -EINVAL;
   168	
   169		/* Grab a pointer to the next level */
   170		pte = READ_ONCE(*ptep);
   171		if (!pte) {
   172			cptep = __arm_lpae_alloc_pages(tblsz, gfp, cfg);
   173			if (!cptep)
   174				return -ENOMEM;
   175	
   176			pte = arm_lpae_install_table(cptep, ptep, 0, data);
   177			if (pte)
   178				__arm_lpae_free_pages(cptep, tblsz, cfg);
   179		} else if (!cfg->coherent_walk && !(pte & ARM_LPAE_PTE_SW_SYNC)) {
   180			__arm_lpae_sync_pte(ptep, 1, cfg);
   181		}
   182	
   183		if (pte && !iopte_leaf(pte, lvl, data->iop.fmt)) {
   184			cptep = iopte_deref(pte, data);
   185		} else if (pte) {
   186			/* We require an unmap first */
   187			WARN_ON(!selftest_running);
   188			return -EEXIST;
   189		}
   190	
   191		/* Rinse, repeat */
   192		return __arm_lpae_map(data, iova, paddr, size, pgcount, prot, lvl + 1,
   193				      cptep, gfp, mapped);
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
