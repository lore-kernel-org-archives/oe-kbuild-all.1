Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB3D2C21E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931861; cv=none; b=eqlhQBMy2F0vDyTwmqbVgxZsp3UvMZQc2hNnxdbR++wK9bZmIcqlVvmZFr4hdbFLYR/3mgnYBd+ZBb72cnemvzAGrnugGfJXeToaALSO4jd0QbslrEWTSY+FqDp4LNo+V0hR3Xfy0hNxfDyWEUYP53qkNcw0Yr1n3xReLHI9Xjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931861; c=relaxed/simple;
	bh=yPDbkYI/ezw5ciWTgka+wWLLJYdBSetR695Rftu6v+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GJaR9dvM+74phpudPTTlrRrjSrNuWw5m8ogvAmGEXi1I4MQ7r1Rz4Im4BuwbmO5xmdlI87qFEfCFf8acKDrf7JSVPJxdLMsy1vBdM7vpVwhAHsCvggo4meR+mnadCjSxhFu0zd6z4djZpqMK5QIwJcKKHsOzfj1MzepVuH7IxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lH2/WDvd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lH2/WDvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754931860; x=1786467860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yPDbkYI/ezw5ciWTgka+wWLLJYdBSetR695Rftu6v+Y=;
  b=lH2/WDvdDdbRpuWE8NNcbfvugEG7J4YFrN9wTdTha8rSpL6Gj8piGzLm
   0eXtndTwHtEv8qpYMROE8UMDrtynaYJRcRXfxwmDRKTRAE3QgwD0H1FcZ
   zV+MVAzQCtJplqL84kpglXI3p4RKPMGTlQJ0reFXXUcgStD6lyVR6NpiF
   TewKgbCZU2Luyq6kPSR3Scwhh2BYD9MTCr3AN2TvC9PkZG9rDkPw9/0Tp
   Hcf3NUlVbGd5CxLskCgdsaOSZq6woBtmBZWC6/JBdM5+k9IQDBcLSIbmK
   tX/VX2Y/M6jjnzxuNd2yFm09b7lSsYW+lwQ49Oh2XNkuj/klv3R7aSVxL
   Q==;
X-CSE-ConnectionGUID: zz5XKjVASbutmxo8l+8oMw==
X-CSE-MsgGUID: R5VpsHLYSRy56hpRERG3+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67901696"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67901696"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 10:04:19 -0700
X-CSE-ConnectionGUID: 7vj/cwndQBa2rrugbFP0cw==
X-CSE-MsgGUID: q5YHzVybQuSQ5FJ3xf0tXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166273176"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2025 10:04:18 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulVwU-00035P-2z;
	Mon, 11 Aug 2025 17:04:14 +0000
Date: Mon, 11 Aug 2025 19:03:54 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype
 for '__arm_lpae_map'
Message-ID: <202508111939.iW8PecqM-lkp@intel.com>
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
commit: cf616fc76f2555d91fc88a543badc8a051f749c9 [0/1] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver
config: i386-buildonly-randconfig-2004-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111939.iW8PecqM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111939.iW8PecqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111939.iW8PecqM-lkp@intel.com/

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
