Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995731AADA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 21:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709761960; cv=none; b=DsfnZNt9Qa4fS4rNCy6Hib2u7ivs8DVW0CVoeAi3Q9XMukCWRhrtA2lXtkOfatwe2xbUoH/DOTx6+tmFGJmIf4I8hn44n6NSFD5t6wyedyEDsqTiI5/TawYJILh9q5ek8gB4G583Cts024PSDQkGoHgS5HAPlaoebbAkLNDgMD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709761960; c=relaxed/simple;
	bh=rX1e5VviFKyXO2ZlrcNz4XaKVtiZR+ttiLT/HKsf638=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JqKrcdpyrjRRNPyECxp3U1mGCN8YoLTRlnnvZS+3vy9G5Z8tpORDYdv4dpaKyzpCp+OPMCdGmehseZYwEQd6YkkAIf/YZOgetpISaJaxbiKe+zu0MUVKJ+xVItuONwyft+NhCSqXYrldHQpBDUVtr3Y8qyUvSHF1VeOqxFLT5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CS55uZRh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CS55uZRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709761957; x=1741297957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rX1e5VviFKyXO2ZlrcNz4XaKVtiZR+ttiLT/HKsf638=;
  b=CS55uZRh47Wr/AN2np0BXpoJNZpSM+HFja0vUGbgeBWAGxcV160fVFBu
   TXTOhfbIVK3uVQ4Sdm5Ia2hKT8WzZdVJjChnTmq7AD+rgXgrBf25AgPar
   RBjICKlriqeL110tf/K6ujbWD/5CH1XRGqebUwz1SpP3FMlzxy0WErac+
   xX0lJ2qglI4ke+MSBijsfvv3gHc+6fClTunw13HVP+36Kr1Vvgzw1N+nC
   OoAtuO3nF6YdswFP5gw9g9Zwau84JXi/Opw7AAGWURt/dyslmDB+Mw09M
   I3wWyXjNpdYpM9vnxCVTZMf7aU7Gt0cDZ6DQeHTVa3npvUBOWps5AFtfa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15123727"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="15123727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 13:52:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9870987"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2024 13:52:36 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhzBh-0004ZN-0I;
	Wed, 06 Mar 2024 21:52:33 +0000
Date: Thu, 7 Mar 2024 05:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/8]
 drivers/iommu/io-pgtable-arm-common.c:139:5: sparse: sparse: symbol
 '__arm_lpae_map' was not declared. Should it be static?
Message-ID: <202403070520.LqgMsBsK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   d762f92ae92ce3242f0ef5b825d197e0300f0d9d
commit: cf616fc76f2555d91fc88a543badc8a051f749c9 [2/8] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver
config: arm64-randconfig-r113-20240306 (https://download.01.org/0day-ci/archive/20240307/202403070520.LqgMsBsK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce: (https://download.01.org/0day-ci/archive/20240307/202403070520.LqgMsBsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070520.LqgMsBsK-lkp@intel.com/

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
