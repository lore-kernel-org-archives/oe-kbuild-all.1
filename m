Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E724D2EC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 12:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192433; cv=none; b=mvATySdPw2epL6wUOqS6IrxjFer5Nz1nnuroAWqBwmQf9T1R3BAWIFgf3NwbG2JYOk3qAfb/PIkvbx1z5B2YdIvcmzYeutYpmR4eOOi97G7Ntznlpo6H2q1/iUbjq6TQ0Xp65Zsa5umOFPm50g0ODARHvHgPwFsHn+PkW+chGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192433; c=relaxed/simple;
	bh=n4rB27wu1f9HAI5d3cpjUyin9xge6ICOCdbcCzVgUlY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L3+qp1itOFaXZcdultaSILy5mc3rrDtlpfi5flQGuPdz35lerHvt0y+JYI94w7KnJKPsSjtjlIkYD7NVyqe5bdAUHCPcCdMQ0sVOYM6MPOUnnkzuEp0DDK9rJjq4/EgRxi2/xwqVUd1hcrhP+U/SHPTxFouE1B9Ejsckeu+YSrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwneAY4F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwneAY4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779192432; x=1810728432;
  h=date:from:to:cc:subject:message-id;
  bh=n4rB27wu1f9HAI5d3cpjUyin9xge6ICOCdbcCzVgUlY=;
  b=AwneAY4F9L5YngMIkkEkeLO3/mLJxUizhkjmnt2DO+YaB3nCKrV1ukjM
   he5f1dWhCLAFq99dH0un/EKVesDq2y2rZnqLSpCne7lCsLdyWypDpMv1U
   6gndlfivufeJim05hY3IuODWp5P9tl2KOLRV3qAbOhIux8xiRLpDhkz7o
   GIg35eyd1H+gZN4ywHuqcEmH/Sb9PYwqSM7CNjDId7kAWEr/ZEyV/iLiH
   SsqaXSK3ss1fLjMQj6XDJjnglu3Zhm/BmRQcoyGs+tgSv0JRpHxxGaTC8
   O6eDW+0TbPX1a6Yg3UYLawXtGQ4YP5XuvhY4E17+6IvSzuXPYoIdP2Q8G
   A==;
X-CSE-ConnectionGUID: zNXIgZ3yR4iwNkFT2Rtl9A==
X-CSE-MsgGUID: 5X+fZUAbQFqjiD5uzlb67w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79968454"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79968454"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:07:11 -0700
X-CSE-ConnectionGUID: k25gHcatRGmLWS12lqUPBw==
X-CSE-MsgGUID: efFb/ZwiRbWVjgQY560oLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235309288"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 May 2026 05:07:10 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPJE3-0000000010c-3KU6;
	Tue, 19 May 2026 12:07:07 +0000
Date: Tue, 19 May 2026 20:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 206/238]
 arch/sparc/kernel/ldc.c:1068:10-33: WARNING: casting value returned by memory
 allocation function to (struct ldc_mtable_entry *) is useless.
Message-ID: <202605191900.HFymsstN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 827f3babf39f0eb767d7e347bd5e45cb6657c0b2 [206/238] sparc: replace __get_free_pages() with kmalloc()
config: sparc64-randconfig-r052-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191900.HFymsstN-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191900.HFymsstN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/sparc/kernel/ldc.c:1068:10-33: WARNING: casting value returned by memory allocation function to (struct ldc_mtable_entry *) is useless.

vim +1068 arch/sparc/kernel/ldc.c

  1040	
  1041	static int ldc_iommu_init(const char *name, struct ldc_channel *lp)
  1042	{
  1043		unsigned long sz, num_tsb_entries, tsbsize, order;
  1044		struct ldc_iommu *ldc_iommu = &lp->iommu;
  1045		struct iommu_map_table *iommu = &ldc_iommu->iommu_map_table;
  1046		struct ldc_mtable_entry *table;
  1047		unsigned long hv_err;
  1048		int err;
  1049	
  1050		num_tsb_entries = LDC_IOTABLE_SIZE;
  1051		tsbsize = num_tsb_entries * sizeof(struct ldc_mtable_entry);
  1052		spin_lock_init(&ldc_iommu->lock);
  1053	
  1054		sz = num_tsb_entries / 8;
  1055		sz = (sz + 7UL) & ~7UL;
  1056		iommu->map = kzalloc(sz, GFP_KERNEL);
  1057		if (!iommu->map) {
  1058			printk(KERN_ERR PFX "Alloc of arena map failed, sz=%lu\n", sz);
  1059			return -ENOMEM;
  1060		}
  1061		iommu_tbl_pool_init(iommu, num_tsb_entries, PAGE_SHIFT,
  1062				    NULL, false /* no large pool */,
  1063				    1 /* npools */,
  1064				    true /* skip span boundary check */);
  1065	
  1066		order = get_order(tsbsize);
  1067	
> 1068		table = (struct ldc_mtable_entry *)kmalloc(PAGE_SIZE << (order), GFP_KERNEL);
  1069		err = -ENOMEM;
  1070		if (!table) {
  1071			printk(KERN_ERR PFX "Alloc of MTE table failed, "
  1072			       "size=%lu order=%lu\n", tsbsize, order);
  1073			goto out_free_map;
  1074		}
  1075	
  1076		memset(table, 0, PAGE_SIZE << order);
  1077	
  1078		ldc_iommu->page_table = table;
  1079	
  1080		hv_err = sun4v_ldc_set_map_table(lp->id, __pa(table),
  1081						 num_tsb_entries);
  1082		err = -EINVAL;
  1083		if (hv_err)
  1084			goto out_free_table;
  1085	
  1086		return 0;
  1087	
  1088	out_free_table:
  1089		kfree((void *)(unsigned long) table);
  1090		ldc_iommu->page_table = NULL;
  1091	
  1092	out_free_map:
  1093		kfree(iommu->map);
  1094		iommu->map = NULL;
  1095	
  1096		return err;
  1097	}
  1098	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
