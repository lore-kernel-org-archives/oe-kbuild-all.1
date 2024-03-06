Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3161426B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 03:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709696834; cv=none; b=nx2hUxCoyyN8eOq4dEUIrT6QfGMtTOOzYJI+S+2//Gc2XuyKmYXY13obJBpTDFZ4MxkdyZxVUP8raF1z5Y02mrnnxSqEml0zdiQw5zSbl0nREBLPNP5l+kYzkT/V4hIuIR5qfZIfTkenN3AnXciO4SwnrxybH724whvzcnwmY+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709696834; c=relaxed/simple;
	bh=QuxnOV8VHszpBlzsCpVAOZyOyUnFb5rXx6v/TGlwJUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yx6cFPH6HMRWzXfPpEydI8KjllVNvfZsd0VXz2LanibJnCmG9ie0V9dapYuYXfo+ezRhyD8gojH0yieMIlg+WiPGs/Clp5S8ZCnh8wP+0Z+Od7+jDFnbQ7u4YquPTzbIHu+yMK8ZdBAiJcBe/X9y5hGvmrwHoudEjba2kT7ofZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JY4sA6NR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JY4sA6NR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709696833; x=1741232833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QuxnOV8VHszpBlzsCpVAOZyOyUnFb5rXx6v/TGlwJUs=;
  b=JY4sA6NRJCVlANDIwstow3wy/8VhufzrLCBCN3xO+oIkQxJZpq2PtMds
   7rb4WtyHDWuz997TeAM8m8VsahC5ZeXMv8P3jjSjkBTuKlHYKM4jQnZ29
   Gndy2MoVrSG8MC6eqek70RVKUEW2mKt1i2wMxOUqbh1Y/y9+4AdfWO+IJ
   efO02WrFuifxpuNQMdv5TULpgTZLz4t98urhwXNoB9IIMzErCJXCD36iM
   nc1bc5pgJu4PLuwc99AcTKd4dPL8t3rQFxC8xnftSQnAaZFW2dyN5enNY
   ctRBho6UHyEXmi2R/UJYt7aAZAKCwn8MUrrO2uD6Zw7X6xVUXbYDNmDnu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15701618"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="15701618"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 19:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9585055"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2024 19:47:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhiFG-0003t7-0X;
	Wed, 06 Mar 2024 03:47:06 +0000
Date: Wed, 6 Mar 2024 11:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/8]
 drivers/iommu/io-pgtable-arm-common.c:139:5: sparse: sparse: symbol
 '__arm_lpae_map' was not declared. Should it be static?
Message-ID: <202403061150.lCOebemm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   2fccd6896ec8c25f94228ed44bedf7c4dc8642c1
commit: cf616fc76f2555d91fc88a543badc8a051f749c9 [2/8] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver
config: arm64-randconfig-r113-20240306 (https://download.01.org/0day-ci/archive/20240306/202403061150.lCOebemm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce: (https://download.01.org/0day-ci/archive/20240306/202403061150.lCOebemm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061150.lCOebemm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/io-pgtable-arm-common.c:139:5: sparse: sparse: symbol '__arm_lpae_map' was not declared. Should it be static?
   drivers/iommu/io-pgtable-arm-common.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

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
