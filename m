Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700335;
	b=JDy6CTKcPxEjrzj9Wslk1LvLsLW5EkC6kZx0uOjpRSd62cR/Pe42gdfyzsB01VUbKinl
	 c4rgX1Wosusv4MAvSKUDZwEpsnyALb/bQQ0bbyWdK6+g14XGfwqpDBqIEkmWzhr9B09x4
	 RnokBLcHnhHfsyCGVZAjXVzoX8Y1Ure8JSW0CdPcgaTBBmkQ5azF+i1VYiOfEoz7zTU9+
	 am3bPqVFJ/EkopOJwBfPTwdbg+ON321Op6gPXzn48czzqd00Hmb0FU0IOyHP2OUAgPK1m
	 nlYHMLyUayz/98Wd8/s7d1YxoJ6yy/tWdhmG5imtCLlGu8PbUbQR/zonlLLxpv2N21g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700335;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cmj8aohQkghA3ogFtYHs0my/aIe2brcgIgPBtSC6/fs=;
	b=Bl+pTJSEBIN+WSOkESmqzmpqW49yWmqyd2Wdng91G6UYr6XliQHonKd3YjO1DT3uZRwB
	 L6ZZavCN1VnPVYtydMtEvimLu7FNi8j8RDRG9gaHjSUUYO7TOW0bwl8gjywRIpMUVNPp2
	 KjrwJLRPC8t9rKaGswVU1WMomyIWrVjr667Sl6N7X40MlzS5bkwx7+T/ChJSzp8nrtvNe
	 gSMErZYXozyVPn563BPNjGldbeNSqSgEFioS+YcERiQlM6USInYbUcK5vCwxQ1Zg4wiZa
	 EAZwtKNAkAvsk0HARhS/vBeeOH265BOjXNOkDWO8zy+6k4KLa16se++9r/GZIqeCKoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXUfI74m;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA10606A319
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 20:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA10606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXUfI74m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792700334; x=1824236334;
  h=date:from:to:cc:subject:message-id;
  bh=n8wD1oYzb/YsU8gUlSNMfMKt9G2rZRKWh0M7rltihKM=;
  b=UXUfI74m2dJW18y4MRKGGlW8GwgAHxf0Be6ElVhIDq4xSwE+0bvzhmtp
   2mhcKTch284nw486LLW+c0PdS89IwOCdeilb16jq1/mxmD5J0TuzXqFSx
   koiQSaUCHn84pm6xPNekYWXXenpfEnGEE6UmjFkl6J/HY7a9rGutjzYhI
   SC/RF+FpcxCE8N+zIJnXq2HgIy88gGODiqTXVMXyuU9kGhztwfEDoOdx/
   2EJ6BYvVhCKL653ZULt3kicfYpMejurfu4P21HI2TKG9Spior73UbtzSz
   RMTNrOqpToFA4tzKN46OIw6ljX2M68vOh+u8b4m0x99ZheXgKwel7mdYt
   Q==;
X-CSE-ConnectionGUID: eostRxpeSjeWL5qJV/stag==
X-CSE-MsgGUID: j9NIcyFSS+eQKF3TPNVJsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1361777"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1361777"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 13:18:53 -0700
X-CSE-ConnectionGUID: f8OzYEsVRKanPJOlGrkljw==
X-CSE-MsgGUID: M5DU6N4DSISE3FAlWA+8gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3806700"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Oct 2026 13:18:52 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJzFQ-00000000RcY-3Jtx;
	Thu, 22 Oct 2026 20:18:48 +0000
Date: Fri, 23 Oct 2026 04:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 3/3]
 drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype
 for '__arm_lpae_map'
Message-ID: <202610230432.xW3OpiLo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Jean-Philippe,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   c188dac82b97f76b0b0ad1cce72676701ebc53cf
commit: cf616fc76f2555d91fc88a543badc8a051f749c9 [3/3] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20261023/202610230432.xW3OpiLo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230432.xW3OpiLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230432.xW3OpiLo-lkp@intel.com/

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
