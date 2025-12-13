Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69A772618
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765608553; cv=none; b=DQMbITRlaGePAncGPBnzPtfVVcceN2VbThsx/Xronb8Mvuhud4RTsRI2BMudutr91Tpen6w5kglAZC7/ZXFPulLXA3AdryYzUktcvcgxMy0axoyphI4Ikpgi2dmWu+CnUHhXwz2wjGqQmC/93jauqdZ/Bt64NKXcbOk3UnYoTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765608553; c=relaxed/simple;
	bh=PxOpNpnYm8iyOWS6ess3ofN/HiHYlgqwJJsc7Nbv0eY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K39NXtIWtQ6xFLpO9HzxAcHMBZAis8CBHORLiI5deL/pNuCLUwfYA+J182X/a/exBHQurky8VH3HZDSkkMsNN0AWhPsZqHqpnD+BEhbf7QbbsbdYYhZdAX23pMNGRac23+GcYLBAQjQz7GxXsrRA1jKoUtkvewgOj7205/Yzhfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1MRpXQa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1MRpXQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765608552; x=1797144552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PxOpNpnYm8iyOWS6ess3ofN/HiHYlgqwJJsc7Nbv0eY=;
  b=e1MRpXQa3/l6Lbq8K5jLgJ4mJsTB/XxmyWjQVMG6wub9Qa54xKgBbbJZ
   Sn3x0/Xcjlp6+qz2CwHPBMw6GV/cvBX+A0FWT3/HXz4X0rlP/2P8qeSji
   ueoFEsnLLUMhMC58UT7vydrU1saVt0nIzWFssP9BPPG0isW5b7AXQFGsL
   4FalU/J0jEAjC65fUgHJVjlii4TBPWzY0EqKQl41fPVBKw310jYiu/Xcb
   bd/sMR0wGdhMzgM2IovfwgfXP6TpkGdnx+AUKnTFXSZymwf1+fKSMrUcU
   X9WcYEhM15aHF+hUGI1ekZGZ9LB4U5pwkY55xiB+x23c+sjpF0ia+5EkF
   A==;
X-CSE-ConnectionGUID: Fv0aHTkxRQ+tGXrtDUIdRg==
X-CSE-MsgGUID: tVJxJD4QQ+6mXVWCaBt4ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67485840"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67485840"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:49:10 -0800
X-CSE-ConnectionGUID: Qot6on7HSUO33eedYn4Gig==
X-CSE-MsgGUID: glKJN/yoRw63ii2xfeWfsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197768983"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 22:49:09 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJRC-000000007CH-3pwg;
	Sat, 13 Dec 2025 06:49:06 +0000
Date: Sat, 13 Dec 2025 14:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype
 for '__arm_lpae_map'
Message-ID: <202512131423.yGsrDwSB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jean-Philippe,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: cf616fc76f2555d91fc88a543badc8a051f749c9 [2/2] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver
config: x86_64-buildonly-randconfig-005-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131423.yGsrDwSB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131423.yGsrDwSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131423.yGsrDwSB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype for '__arm_lpae_map' [-Wmissing-prototypes]
     139 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^~~~~~~~~~~~~~


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
