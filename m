Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514C43242AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463066; cv=none; b=pKW7sU1nR3/ZHFXzEMrpwKTvQUmjW6RzBaqDMmq5FfAG6bhJctB5hzSM4Rbp8S5FQDNxycbs2cVqYEGAjSBXxxKfwEmybl2e/OmP9R8x3Cvc1hrgxotmCP6hRFUFdTfKff/Q8BK0Fo95vJiRcMY3dP3B1kZqImMcjXpQkYpeelY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463066; c=relaxed/simple;
	bh=BScODBPRan99oajzaNiU1TiL44/3lKZRK7cVeyN2fkE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i2odnCzmb5WCjc9JExNyxOIHYK7+zUMejkrWZmXc0sLs3J/0wflru8YIggeHJl7fSuu8atIJL/0kBbtMTpX7OYsjUv8Er+lI6VucwF6Y671KXbGMElgcEzUJcgfFy7NDXByd2oCbQ2Z+aAhuYYiUXBZx/lev8rV1dZbinFb352w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlgLuNvM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlgLuNvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774463063; x=1805999063;
  h=date:from:to:cc:subject:message-id;
  bh=BScODBPRan99oajzaNiU1TiL44/3lKZRK7cVeyN2fkE=;
  b=QlgLuNvM1d/wITOGO9jlldPti0MSi6PjWE6OW+MkGlK7nQBY4/B27hnV
   unqRWviWheSpO1hvaK8pjj46t2Qy2CdFSG8yOdgXRL3VGS2r/pM1Y+QF0
   aiuhfoj9EIkEgu0YfXPepnwQ5xyLMdtR/szT0Ke7u9FrRXKMuN++j1SNb
   9D0vRAfzvoK9up9LIYiSaQRKIcbqG8+wdgcx+xTFk/Ngvz3OSBI7vcOpJ
   XXZsJ5zv8VumOTtPG4aiC+m8uy+GMHJMk/mppVNMnEPE5NCw4d1/mwNH6
   eMxJYLaVwR17aDDjFgHhVt5KDGlmjBxguGG6OIW7oXZn70hcp57kgS13q
   Q==;
X-CSE-ConnectionGUID: 3vN2mPtTTqS+JFOK8d2xmA==
X-CSE-MsgGUID: 6jj73IncS8OzEdNlA9+fFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86887642"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86887642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 11:24:23 -0700
X-CSE-ConnectionGUID: 9eDcHOKjTE6SqKxGie+BgA==
X-CSE-MsgGUID: nLfsyEjWQBy4fl8tIofthA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224712727"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Mar 2026 11:24:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Stu-000000007Sv-2xBQ;
	Wed, 25 Mar 2026 18:24:18 +0000
Date: Thu, 26 Mar 2026 02:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype
 for '__arm_lpae_map'
Message-ID: <202603260259.gNs7mu60-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jean-Philippe,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: cf616fc76f2555d91fc88a543badc8a051f749c9 [1/1] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260326/202603260259.gNs7mu60-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260259.gNs7mu60-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260259.gNs7mu60-lkp@intel.com/

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
