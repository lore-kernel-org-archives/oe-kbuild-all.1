Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F460263
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709573781; cv=none; b=VclZOL9rULcSA23kpAwu6b10iUfbYlbaJrR1lwngUWO2sJ0NzYz1b9RS886/FdvsmFK4X5b9y7fhWTqJ473fSoxK8FvstAR2d2cEMrCqyWuc3o+dFt4N1KWoMOCnXv6rzMeXO5CU4szX0l/cZbaVW0uCtbIxrbQHVmBl/u6HjE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709573781; c=relaxed/simple;
	bh=Wsn9ihzRSBrYDxCI1/bhlo3K/rnI602JaWld2/fVQ4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=usRzyVwOS5kQUzks430JpOnQ6Gs8ysaMpiUUdR+xMIRMz1COFw3y64qicmvFI453Pq2RBiQiqwKw6DbC7lP57h+GMvNU6a3HegWuKydbh/g2dEVCfSZwDO3BNzGH+BB7LTrTxbFEigon7L16GMSc1Klsk+1VDEGN+BFt/QAMTDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVbyvKQ1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVbyvKQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709573780; x=1741109780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wsn9ihzRSBrYDxCI1/bhlo3K/rnI602JaWld2/fVQ4Y=;
  b=LVbyvKQ1tjk5zTYprRaIBdQoYgKEypPyJPAHsiRQWTbt1Bk0ShPeZhqj
   sdjszjnuOMv5uYV5u6lfACKOvX3gz4hDuFTvlNrpAtel1sAHzQ9nbEnPp
   v5uaOx5w6ckJ6YmOPVeF85ju/MPnqx6+GGXhlEbFssujtiB0C10LK/NsZ
   7m5XRQmjsJFgPNp8TqDNmZSkjqEpPVwhWPg28lO0b10n9gVd+wpstIu8G
   Lhh5bSp8XQALimGSECQN8xHKyo4v6jYEccPJvhwtTc67TgewMkYlHqEAx
   1Xjfx8REWXZZC/skWd9b7qDxo91f2ENiKgR5/UjhTQGTeHAaEVt28CwIC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4207183"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4207183"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 09:36:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13571191"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Mar 2024 09:36:17 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhCEZ-0002fF-26;
	Mon, 04 Mar 2024 17:36:15 +0000
Date: Tue, 5 Mar 2024 01:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/8]
 drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype
 for function '__arm_lpae_map'
Message-ID: <202403050134.qsh4zyie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   83d4ec1a7b1b3ec5e4b5609a035fa705199afeac
commit: cf616fc76f2555d91fc88a543badc8a051f749c9 [2/8] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240305/202403050134.qsh4zyie-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050134.qsh4zyie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050134.qsh4zyie-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype for function '__arm_lpae_map' [-Wmissing-prototypes]
   int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
       ^
   drivers/iommu/io-pgtable-arm-common.c:139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
   ^
   static 
   1 warning generated.


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
