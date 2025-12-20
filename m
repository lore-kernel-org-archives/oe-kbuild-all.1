Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8AB283FDD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766240592; cv=none; b=DlbS+crt1FTr0XK4j3jxeRShrDxSCQCYI+z4SYfVzbBknEKxYwxq0ExL6YwchiLOE0dYftxnz7188YGWzOaLbp9kM7oMiY6ZiR4fzHb3d7aKeszuaMMydObQTDp8+RnkUCenanyFlYYVC4pkMkxoCbbbsr3JSEdInqSM4K2onJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766240592; c=relaxed/simple;
	bh=Dbt9/ccFGcKGqcTvsevgBQhv/qsPgmb+CCsoGM4rT44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qXdGsck2ecPsOzYWAqtc0ArYv80CKF0i62iU2peXH47K3ctve14uw1IJf/9dl5gnnFQbnygjKpVH6NKknd9wg7YjoDHCJhScA8IvJXKeByb3yP+GWUoAigdrGihBGi7NJ3RPXNSy8lFJJhWT8/Jv59VK3nWVmT9oA7pv+9zui4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkWLOAc9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkWLOAc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766240591; x=1797776591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dbt9/ccFGcKGqcTvsevgBQhv/qsPgmb+CCsoGM4rT44=;
  b=OkWLOAc9Gy1iD6UjI7NXbCvASPPvnI/ALIwwBy1sxbXI6VkZMX4Tofoj
   QD6KYT04o6uMxZzqLVbm9V1i1NVfqx3yUetNsSd7eYpqiBD72wlq1N0rp
   ByKRyx5LJDFHzjm//fXpyzizkGbPigh0hnSKSB+hFvscCVslrwDYhQWmI
   bknnPIIi5hLg09l0Mab7Yi1wBmxvlEUlHpm6+3EYvzzHv/3stu3ljT/Bx
   9YsOk2ZIDsvX2aNo2Dow2CjFXKKzfUyaDFQsugLiqhpruAIxrB2yQvTiI
   B7+761YdiD49egEmd4DtOalU0kUgjHAkdYsgXguMXd7ymDmmRwvSOqHP+
   g==;
X-CSE-ConnectionGUID: TZMR3sffStu8n3HbIvWAQQ==
X-CSE-MsgGUID: 7EJeMxWoRqyFuolJY402Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68327860"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68327860"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:23:08 -0800
X-CSE-ConnectionGUID: P6Qta79vSWODKGVjAR4CPQ==
X-CSE-MsgGUID: kgtzO02BTeCH+dz7VVsEmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199984399"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 06:23:06 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxrM-000000004dH-0qlW;
	Sat, 20 Dec 2025 14:23:04 +0000
Date: Sat, 20 Dec 2025 22:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:thp1 1/1] mm/huge_memory.c:1286:26: error: use of
 undeclared identifier 'addr'; did you mean 'haddr'?
Message-ID: <202512202205.xyBP7Yhl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git thp1
head:   92bbb3ed72c8bba724b402ec1693356bcaae871a
commit: 92bbb3ed72c8bba724b402ec1693356bcaae871a [1/1] merge HPAGE_PMD_MASK into addr
config: sparc64-randconfig-r132-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202205.xyBP7Yhl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202205.xyBP7Yhl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202205.xyBP7Yhl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/huge_memory.c:1286:26: error: use of undeclared identifier 'addr'; did you mean 'haddr'?
    1286 |                 folio_zero_user(folio, addr);
         |                                        ^~~~
         |                                        haddr
   mm/huge_memory.c:1254:17: note: 'haddr' declared here
    1254 |                 unsigned long haddr)
         |                               ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +1286 mm/huge_memory.c

74d2fad1334d12 Toshi Kani       2016-10-07  1252  
ebcfc63d6bca3c Dev Jain         2024-10-08  1253  static struct folio *vma_alloc_anon_folio_pmd(struct vm_area_struct *vma,
92bbb3ed72c8bb Alex Shi         2025-12-16  1254  		unsigned long haddr)
71e3aac0724ffe Andrea Arcangeli 2011-01-13  1255  {
ebcfc63d6bca3c Dev Jain         2024-10-08  1256  	gfp_t gfp = vma_thp_gfp_mask(vma);
ebcfc63d6bca3c Dev Jain         2024-10-08  1257  	const int order = HPAGE_PMD_ORDER;
ebcfc63d6bca3c Dev Jain         2024-10-08  1258  	struct folio *folio;
71e3aac0724ffe Andrea Arcangeli 2011-01-13  1259  
92bbb3ed72c8bb Alex Shi         2025-12-16  1260  	folio = vma_alloc_folio(gfp, order, vma, haddr);
00501b531c4723 Johannes Weiner  2014-08-08  1261  
ebcfc63d6bca3c Dev Jain         2024-10-08  1262  	if (unlikely(!folio)) {
ebcfc63d6bca3c Dev Jain         2024-10-08  1263  		count_vm_event(THP_FAULT_FALLBACK);
ebcfc63d6bca3c Dev Jain         2024-10-08  1264  		count_mthp_stat(order, MTHP_STAT_ANON_FAULT_FALLBACK);
ebcfc63d6bca3c Dev Jain         2024-10-08  1265  		return NULL;
ebcfc63d6bca3c Dev Jain         2024-10-08  1266  	}
00501b531c4723 Johannes Weiner  2014-08-08  1267  
ebcfc63d6bca3c Dev Jain         2024-10-08  1268  	VM_BUG_ON_FOLIO(!folio_test_large(folio), folio);
cfe3236d32d07b Kefeng Wang      2023-03-02  1269  	if (mem_cgroup_charge(folio, vma->vm_mm, gfp)) {
cfe3236d32d07b Kefeng Wang      2023-03-02  1270  		folio_put(folio);
6b251fc96cf2cd Andrea Arcangeli 2015-09-04  1271  		count_vm_event(THP_FAULT_FALLBACK);
85b9f46e8ea451 David Rientjes   2020-04-06  1272  		count_vm_event(THP_FAULT_FALLBACK_CHARGE);
ebcfc63d6bca3c Dev Jain         2024-10-08  1273  		count_mthp_stat(order, MTHP_STAT_ANON_FAULT_FALLBACK);
ebcfc63d6bca3c Dev Jain         2024-10-08  1274  		count_mthp_stat(order, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
ebcfc63d6bca3c Dev Jain         2024-10-08  1275  		return NULL;
6b251fc96cf2cd Andrea Arcangeli 2015-09-04  1276  	}
cfe3236d32d07b Kefeng Wang      2023-03-02  1277  	folio_throttle_swaprate(folio, gfp);
00501b531c4723 Johannes Weiner  2014-08-08  1278  
5708d96da20b99 Zi Yan           2024-10-11  1279         /*
c51a4f11e6d824 Zi Yan           2024-12-09  1280  	* When a folio is not zeroed during allocation (__GFP_ZERO not used)
c51a4f11e6d824 Zi Yan           2024-12-09  1281  	* or user folios require special handling, folio_zero_user() is used to
c51a4f11e6d824 Zi Yan           2024-12-09  1282  	* make sure that the page corresponding to the faulting address will be
c51a4f11e6d824 Zi Yan           2024-12-09  1283  	* hot in the cache after zeroing.
5708d96da20b99 Zi Yan           2024-10-11  1284  	*/
c51a4f11e6d824 Zi Yan           2024-12-09  1285  	if (user_alloc_needs_zeroing())
ebcfc63d6bca3c Dev Jain         2024-10-08 @1286  		folio_zero_user(folio, addr);
52f37629fd3c7b Minchan Kim      2013-04-29  1287  	/*
cfe3236d32d07b Kefeng Wang      2023-03-02  1288  	 * The memory barrier inside __folio_mark_uptodate makes sure that
78fefd04c12349 Kefeng Wang      2024-06-18  1289  	 * folio_zero_user writes become visible before the set_pmd_at()
52f37629fd3c7b Minchan Kim      2013-04-29  1290  	 * write.
52f37629fd3c7b Minchan Kim      2013-04-29  1291  	 */
cfe3236d32d07b Kefeng Wang      2023-03-02  1292  	__folio_mark_uptodate(folio);
ebcfc63d6bca3c Dev Jain         2024-10-08  1293  	return folio;
ebcfc63d6bca3c Dev Jain         2024-10-08  1294  }
ebcfc63d6bca3c Dev Jain         2024-10-08  1295  

:::::: The code at line 1286 was first introduced by commit
:::::: ebcfc63d6bca3cce1bfca30092712f3468b4ecff mm: abstract THP allocation

:::::: TO: Dev Jain <dev.jain@arm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
