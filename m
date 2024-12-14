Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756ABA27
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 01:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734139905; cv=none; b=A2mPs5XGY7qi2o1xrG7ZGzdyjQ+sPbmVQvBLmeKCecwUDoafEHB/5UMTqYamI7BLpTPV5GdJ+SDpTKRv6Rzmiqn3oNVFinkN0L6EhYzal3o/WBegBFKMiL1gGrG0cmX643Z+JsnXtXFjmrpOXVjHapAXQQvjghwNZTJrlkVYYK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734139905; c=relaxed/simple;
	bh=bf+d0MYBZ44gzG0Dy/X8k6u14t8Gtlm90k4CiI9UYN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y4SoQRIOpjYscd1hv36zXD75pVUridkw/v8wQwoFN2Z7N1SoEAWf7VD7Zl7KcO1AU8sztw3olJwiHsd5yyqrwrLl3Y0may2wmkPGJhbtDypl6KevlHY8dMaabokzqPDfhRUvIz71Uoc0s6FU96pqerB6I8b3+cZWFsnc7K2BKp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAocDSBA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAocDSBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734139903; x=1765675903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bf+d0MYBZ44gzG0Dy/X8k6u14t8Gtlm90k4CiI9UYN0=;
  b=CAocDSBAOTClLyywEj5PXKwO4bMo3K15MlZQqZddGMKKuHrwwXxuskkG
   34Hw+LyB24KWb/xoPkqBHGbxthPY5QWT0x36TY+W6VymszBsfkMplzqFH
   QfVDLfOyhD5FihmUUJEjfTLd4fKs28PtmT2afDZr/kcVYH7zxor1x9ZZl
   PmPzPN1uKFEQ+Qktxwix6TOWnbtRtnlmcHl0BT/kPGPXUzgM25lznkMUm
   EaHnEX+O19gidbLLnTBN+HOufK4o5XTcIYyYLd+4/06OIUcGlowmSNl1P
   KB8aaFNLoLhxaUmriovw3+Z2LYu1Se27tTPLe5xckgbWpp0uMxsfxKLWC
   Q==;
X-CSE-ConnectionGUID: HxFdziNIR2uRjLT645qpug==
X-CSE-MsgGUID: 8N/+EnppQ/2PMFBlv+4zUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45089125"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45089125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 17:31:43 -0800
X-CSE-ConnectionGUID: rtTrEa5gT96xu/6GUyb1nw==
X-CSE-MsgGUID: PG2hS2rpSjK2N0Mi/ROAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="97098029"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2024 17:31:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMH0M-000CcB-2I;
	Sat, 14 Dec 2024 01:31:38 +0000
Date: Sat, 14 Dec 2024 09:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] mm/share_pool.c:4215:63: error:
 'HUGETLB_ALLOC_NORECLAIM' undeclared
Message-ID: <202412140941.hd45mfxv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: 107e2b7c4b1d007583efab423cc48429c87c6408 [2579/2579] mm/sharepool: Fix sharepool hugepage cgroup uncount error.
config: arm64-randconfig-004-20241213 (https://download.01.org/0day-ci/archive/20241214/202412140941.hd45mfxv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140941.hd45mfxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140941.hd45mfxv-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c:864:23: warning: no previous prototype for 'find_spg_node_by_spg' [-Wmissing-prototypes]
     864 | struct sp_group_node *find_spg_node_by_spg(struct mm_struct *mm,
         |                       ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:3073:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    3073 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:3073:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_unshare_kva':
   mm/share_pool.c:3450:14: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
    3450 |         bool is_hugepage = true;
         |              ^~~~~~~~~~~
   mm/share_pool.c: At top level:
   mm/share_pool.c:3942:6: warning: no previous prototype for 'spa_overview_show' [-Wmissing-prototypes]
    3942 | void spa_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:4024:6: warning: no previous prototype for 'spg_overview_show' [-Wmissing-prototypes]
    4024 | void spg_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sharepool_no_page':
   mm/share_pool.c:4215:41: error: 'HUGETLB_ALLOC_BUDDY' undeclared (first use in this function)
    4215 |                                         HUGETLB_ALLOC_BUDDY | HUGETLB_ALLOC_NORECLAIM);
         |                                         ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4215:41: note: each undeclared identifier is reported only once for each function it appears in
>> mm/share_pool.c:4215:63: error: 'HUGETLB_ALLOC_NORECLAIM' undeclared (first use in this function)
    4215 |                                         HUGETLB_ALLOC_BUDDY | HUGETLB_ALLOC_NORECLAIM);
         |                                                               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4221:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    4221 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
   mm/share_pool.c:4234:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    4234 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
   mm/share_pool.c:4256:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    4256 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
   mm/share_pool.c:4258:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    4258 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   mm/share_pool.c: At top level:
   mm/share_pool.c:4119:12: warning: 'proc_usage_show' defined but not used [-Wunused-function]
    4119 | static int proc_usage_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~
   mm/share_pool.c:4097:12: warning: 'proc_group_usage_show' defined but not used [-Wunused-function]
    4097 | static int proc_group_usage_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4049:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    4049 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/HUGETLB_ALLOC_NORECLAIM +4215 mm/share_pool.c

  4180	
  4181	vm_fault_t sharepool_no_page(struct mm_struct *mm,
  4182				struct vm_area_struct *vma,
  4183				struct address_space *mapping, pgoff_t idx,
  4184				unsigned long address, pte_t *ptep, unsigned int flags)
  4185	{
  4186		struct hstate *h = hstate_vma(vma);
  4187		vm_fault_t ret = VM_FAULT_SIGBUS;
  4188		unsigned long size;
  4189		struct page *page;
  4190		pte_t new_pte;
  4191		spinlock_t *ptl;
  4192		unsigned long haddr = address & huge_page_mask(h);
  4193		bool new_page = false;
  4194		int err;
  4195		int node_id;
  4196		struct sp_area *spa;
  4197	
  4198		spa = vma->vm_private_data;
  4199		if (!spa) {
  4200			pr_err("share pool: vma is invalid, not from sp mmap\n");
  4201			return ret;
  4202		}
  4203		node_id = spa->node_id;
  4204	
  4205	retry:
  4206		page = find_lock_page(mapping, idx);
  4207		if (!page) {
  4208			size = i_size_read(mapping->host) >> huge_page_shift(h);
  4209			if (idx >= size)
  4210				goto out;
  4211	
  4212			page = alloc_huge_page(vma, haddr, 0);
  4213			if (IS_ERR(page)) {
  4214				page = hugetlb_alloc_hugepage(node_id,
> 4215						HUGETLB_ALLOC_BUDDY | HUGETLB_ALLOC_NORECLAIM);
  4216				if (!page)
  4217					page = ERR_PTR(-ENOMEM);
  4218			}
  4219			if (IS_ERR(page)) {
  4220				ptl = huge_pte_lock(h, mm, ptep);
  4221				if (!huge_pte_none(huge_ptep_get(ptep))) {
  4222					ret = 0;
  4223					spin_unlock(ptl);
  4224					goto out;
  4225				}
  4226				spin_unlock(ptl);
  4227				ret = vmf_error(PTR_ERR(page));
  4228				goto out;
  4229			}
  4230			__SetPageUptodate(page);
  4231			new_page = true;
  4232	
  4233			/* sharepool pages are all shared */
  4234			err = huge_add_to_page_cache(page, mapping, idx);
  4235			if (err) {
  4236				put_page(page);
  4237				if (err == -EEXIST)
  4238					goto retry;
  4239				goto out;
  4240			}
  4241		}
  4242	
  4243	
  4244		ptl = huge_pte_lock(h, mm, ptep);
  4245		size = i_size_read(mapping->host) >> huge_page_shift(h);
  4246		if (idx >= size)
  4247			goto backout;
  4248	
  4249		ret = 0;
  4250		if (!huge_pte_none(huge_ptep_get(ptep)))
  4251			goto backout;
  4252	
  4253		page_dup_rmap(page, true);
  4254		new_pte = make_huge_pte(vma, page, ((vma->vm_flags & VM_WRITE)
  4255					&& (vma->vm_flags & VM_SHARED)));
  4256		set_huge_pte_at(mm, haddr, ptep, new_pte);
  4257	
  4258		hugetlb_count_add(pages_per_huge_page(h), mm);
  4259	
  4260		spin_unlock(ptl);
  4261	
  4262		if (new_page) {
  4263			SetPagePrivate(&page[1]);
  4264		}
  4265	
  4266		unlock_page(page);
  4267	out:
  4268		return ret;
  4269	
  4270	backout:
  4271		spin_unlock(ptl);
  4272		unlock_page(page);
  4273		put_page(page);
  4274		goto out;
  4275	}
  4276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
