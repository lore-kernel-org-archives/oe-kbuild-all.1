Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72E2E62B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 23:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132100; cv=none; b=aR+8hiU6w47pZnV1H1gCEWVNiyWgdgDLm3Qj3KwIHG96E8ezcT9sPu5jed2Rivzo9HuZ+TFak8bYhey0TZF0XeVxb4KLvPcTJo65IRxz2Y4Q53v4vs0PW+nasPi3OjCfTGvHdFcw6eIdqo3c38bb4ifBd1j3wa5IUxZygLztTqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132100; c=relaxed/simple;
	bh=LSN8FJHtjFWnOf1m8/Bz3TRGwmC04btvesDouq3g4TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QjkobAsw4r0KIJYreFPiuSBuCpaM9cbY0cNsCSbxzLYZhkSAKJdNerJI28DyJ7vUbONDvNUcrDgMk03Q5D7Htedh5cH0ShtJnbM0BjF9LNW3lHrqnBrb31qLDVCrh/tMU+LYeyjlKTwTBNGcVnnAV93NfRVb2a7O5ktLdVBSM7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxnCqmgg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxnCqmgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734132097; x=1765668097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LSN8FJHtjFWnOf1m8/Bz3TRGwmC04btvesDouq3g4TY=;
  b=hxnCqmggG8LkSx9ujtTGkresS4pDTmYCsjqG+G3Xy0ELnsnbKeqVZyrE
   QdlPGlk9y9i127ADkMWF9GV42ckNxGny3pahmVDz5htBvD36salYu6oHb
   CdZGD2b3mW5E1bYOl3kElT+t4IUCCm/gDqbW9dzNlgCxSK93qx1GmURso
   uGDt4oO151mvWVn++TFzVHUcE6Iom3pym3eTkKFCXBi2UXlw6jQXjv5eq
   j86ztGBm2n4Vm58FRZT+PaRGHCNIgv1BOko0Dwp43PSGtWIoc8t/g2C/x
   flnmJPE8LNSfy3tZSXlpuC4uDk2pvOegnXWdgdmv+vuMUG4UkO+ZL+0YM
   A==;
X-CSE-ConnectionGUID: Bh896X1fR3qT8aL3PIXGXQ==
X-CSE-MsgGUID: XWPgt0GrTeyQu2fyZMluQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34470676"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="34470676"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 15:21:37 -0800
X-CSE-ConnectionGUID: B/BBlzRxQyyHiYhM2MFt2w==
X-CSE-MsgGUID: qqm09nsTTUuQRDNN9fp2sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="101673450"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Dec 2024 15:21:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMEyU-000CWf-0O;
	Fri, 13 Dec 2024 23:21:34 +0000
Date: Sat, 14 Dec 2024 07:21:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] mm/share_pool.c:4227:64: error:
 'HUGETLB_ALLOC_BUDDY' undeclared
Message-ID: <202412140704.cam9C57r-lkp@intel.com>
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
commit: bec70574669710bd0962f1f6807363915fc94f16 [2579/2579] mm/sharepool: fix hugepage_rsvd count increase error
config: arm64-randconfig-004-20241213 (https://download.01.org/0day-ci/archive/20241214/202412140704.cam9C57r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140704.cam9C57r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140704.cam9C57r-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c:865:23: warning: no previous prototype for 'find_spg_node_by_spg' [-Wmissing-prototypes]
     865 | struct sp_group_node *find_spg_node_by_spg(struct mm_struct *mm,
         |                       ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:3085:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    3085 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:3085:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_unshare_kva':
   mm/share_pool.c:3462:14: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
    3462 |         bool is_hugepage = true;
         |              ^~~~~~~~~~~
   mm/share_pool.c: At top level:
   mm/share_pool.c:3954:6: warning: no previous prototype for 'spa_overview_show' [-Wmissing-prototypes]
    3954 | void spa_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:4036:6: warning: no previous prototype for 'spg_overview_show' [-Wmissing-prototypes]
    4036 | void spg_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sharepool_no_page':
>> mm/share_pool.c:4227:64: error: 'HUGETLB_ALLOC_BUDDY' undeclared (first use in this function)
    4227 |                         page = hugetlb_alloc_hugepage(node_id, HUGETLB_ALLOC_BUDDY);
         |                                                                ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4227:64: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:4233:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    4233 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
   mm/share_pool.c:4246:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    4246 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
   mm/share_pool.c:4268:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    4268 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
   mm/share_pool.c:4270:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    4270 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   mm/share_pool.c: At top level:
   mm/share_pool.c:4132:12: warning: 'proc_usage_show' defined but not used [-Wunused-function]
    4132 | static int proc_usage_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~
   mm/share_pool.c:4110:12: warning: 'proc_group_usage_show' defined but not used [-Wunused-function]
    4110 | static int proc_group_usage_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4061:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    4061 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/HUGETLB_ALLOC_BUDDY +4227 mm/share_pool.c

  4193	
  4194	vm_fault_t sharepool_no_page(struct mm_struct *mm,
  4195				struct vm_area_struct *vma,
  4196				struct address_space *mapping, pgoff_t idx,
  4197				unsigned long address, pte_t *ptep, unsigned int flags)
  4198	{
  4199		struct hstate *h = hstate_vma(vma);
  4200		vm_fault_t ret = VM_FAULT_SIGBUS;
  4201		unsigned long size;
  4202		struct page *page;
  4203		pte_t new_pte;
  4204		spinlock_t *ptl;
  4205		unsigned long haddr = address & huge_page_mask(h);
  4206		bool new_page = false;
  4207		int err;
  4208		int node_id;
  4209		struct sp_area *spa;
  4210	
  4211		spa = vma->vm_private_data;
  4212		if (!spa) {
  4213			pr_err("share pool: vma is invalid, not from sp mmap\n");
  4214			return ret;
  4215		}
  4216		node_id = spa->node_id;
  4217	
  4218	retry:
  4219		page = find_lock_page(mapping, idx);
  4220		if (!page) {
  4221			size = i_size_read(mapping->host) >> huge_page_shift(h);
  4222			if (idx >= size)
  4223				goto out;
  4224	
  4225			page = alloc_huge_page(vma, haddr, 0);
  4226			if (IS_ERR(page)) {
> 4227				page = hugetlb_alloc_hugepage(node_id, HUGETLB_ALLOC_BUDDY);
  4228				if (!page)
  4229					page = ERR_PTR(-ENOMEM);
  4230			}
  4231			if (IS_ERR(page)) {
  4232				ptl = huge_pte_lock(h, mm, ptep);
  4233				if (!huge_pte_none(huge_ptep_get(ptep))) {
  4234					ret = 0;
  4235					spin_unlock(ptl);
  4236					goto out;
  4237				}
  4238				spin_unlock(ptl);
  4239				ret = vmf_error(PTR_ERR(page));
  4240				goto out;
  4241			}
  4242			__SetPageUptodate(page);
  4243			new_page = true;
  4244	
  4245			/* sharepool pages are all shared */
  4246			err = huge_add_to_page_cache(page, mapping, idx);
  4247			if (err) {
  4248				put_page(page);
  4249				if (err == -EEXIST)
  4250					goto retry;
  4251				goto out;
  4252			}
  4253		}
  4254	
  4255	
  4256		ptl = huge_pte_lock(h, mm, ptep);
  4257		size = i_size_read(mapping->host) >> huge_page_shift(h);
  4258		if (idx >= size)
  4259			goto backout;
  4260	
  4261		ret = 0;
  4262		if (!huge_pte_none(huge_ptep_get(ptep)))
  4263			goto backout;
  4264	
  4265		page_dup_rmap(page, true);
  4266		new_pte = make_huge_pte(vma, page, ((vma->vm_flags & VM_WRITE)
  4267					&& (vma->vm_flags & VM_SHARED)));
  4268		set_huge_pte_at(mm, haddr, ptep, new_pte);
  4269	
  4270		hugetlb_count_add(pages_per_huge_page(h), mm);
  4271	
  4272		spin_unlock(ptl);
  4273	
  4274		if (new_page) {
  4275			SetPagePrivate(&page[1]);
  4276		}
  4277	
  4278		unlock_page(page);
  4279	out:
  4280		return ret;
  4281	
  4282	backout:
  4283		spin_unlock(ptl);
  4284		unlock_page(page);
  4285		put_page(page);
  4286		goto out;
  4287	}
  4288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
