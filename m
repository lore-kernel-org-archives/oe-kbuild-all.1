Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2539461
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 19:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535768; cv=none; b=npB1HitV2TgLOSN6Ws8GGWfEQyaROE8clqoJiphT0xGbsE9x0PZTGHWEbLhqDRGz35GhSY331r4FNX/y5xzlj5i4Y8jiFZxFT8B5bUutiY+LxFGJnssMLJhFYUTT6kkmcdGxK/Ei/AHqYGZaVQyuzAdP2rNp+QQQRIBSW7BakRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535768; c=relaxed/simple;
	bh=tb5qGA5n8iMCGPRz00Yc6lOL90Baigr90zfd10ZBnQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PmHF55MMRAVSyr5S+SAQiJyXDxRTTkqIK6Efs9lQiRrWYPseID5psb0D2m1zdyFfPqc5O+qGu4uinvmvQ+TOD5vEebl3eYq2zesrN3Gw1D6IitZ8sST1L/i5bp71BHQ2sn5hStjtK4qQNY2/ikkkKgL/WvZ5zI6lN0M/zwMLqbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UF226Vs0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UF226Vs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743535766; x=1775071766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tb5qGA5n8iMCGPRz00Yc6lOL90Baigr90zfd10ZBnQc=;
  b=UF226Vs09ORq7FfuO3td6TkG8GbYJw7AM89mZLZU1NT5NUXnB85ubhpk
   l84lpKc0QdghG/PLX/DOYLhvqBQxN2cziQ31FllpAbqDjNNFo5bNZKTJw
   KKmfqXf/AB2IxFh7DiYFbWMFZEO/mdcvQ3gw0OqOQaugx5hp+iT4mfOvZ
   bPg2YN3OenbGp6CAz7+PFazs1HM9n4cmtgpj2YxMzPhqy/xvusBmPVPKY
   dgB1LYmiSyV5pavkdWeUpWZZNqCgMajaZ3M6zQlasa4Gq+epm0H7hlTzy
   BQkfPe3mTk0i9+IaubtT80lvPUKqaY/x2ngCXrjeGBApaxZaPTFE1ECPO
   A==;
X-CSE-ConnectionGUID: MzRoHSEBSeah2jMaiC2W9A==
X-CSE-MsgGUID: QkRqjGVZRCO7G2FYmrP8Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44127938"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="44127938"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:29:26 -0700
X-CSE-ConnectionGUID: 9bqnAijpRz+pR7RaBHyF5A==
X-CSE-MsgGUID: 64VtEAaeRMWf1KpyqsioeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="127303225"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Apr 2025 12:29:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzhIY-000A5O-2D;
	Tue, 01 Apr 2025 19:29:22 +0000
Date: Wed, 2 Apr 2025 03:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1544/1544] mm/share_pool.c:4577:64:
 error: 'HUGETLB_ALLOC_BUDDY' undeclared
Message-ID: <202504020332.I3Yx3nDu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   54ad6c4559d2bcbb5d7a03050b2f417a326a1ce2
commit: 0886320b818787f720824229f153f161c89faf70 [1544/1544] mm/sharepool: Charge Buddy hugepage to memcg
config: arm64-randconfig-r131-20250401 (https://download.01.org/0day-ci/archive/20250402/202504020332.I3Yx3nDu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250402/202504020332.I3Yx3nDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020332.I3Yx3nDu-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c:1086:29: sparse: sparse: incompatible types for operation (<=):
   mm/share_pool.c:1086:29: sparse:    int *num
   mm/share_pool.c:1086:29: sparse:    int
   mm/share_pool.c:3299:21: sparse: sparse: undefined identifier 'huge_ptep_get'
   mm/share_pool.c:3299:34: sparse: sparse: invalid initializer
   mm/share_pool.c:4577:32: sparse: sparse: undefined identifier 'hugetlb_alloc_hugepage'
   mm/share_pool.c:4585:30: sparse: sparse: undefined identifier 'huge_pte_none'
   mm/share_pool.c:4606:23: sparse: sparse: undefined identifier 'huge_add_to_page_cache'
   mm/share_pool.c:4625:14: sparse: sparse: undefined identifier 'huge_pte_none'
   mm/share_pool.c:4631:9: sparse: sparse: undefined identifier 'set_huge_pte_at'
   mm/share_pool.c:4633:9: sparse: sparse: undefined identifier 'hugetlb_count_add'
   mm/share_pool.c:4797:24: sparse: sparse: undefined identifier 'hugetlb_alloc_hugepage'
   mm/share_pool.c: In function 'mg_sp_group_id_by_pid':
   mm/share_pool.c:1086:29: warning: ordered comparison of pointer with integer zero [-Wextra]
    1086 |         if (!spg_ids || num <= 0)
         |                             ^~
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:3299:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    3299 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:3299:21: error: invalid initializer
   mm/share_pool.c: In function 'sharepool_no_page':
   mm/share_pool.c:4577:32: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
    4577 |                         page = hugetlb_alloc_hugepage(node_id, HUGETLB_ALLOC_BUDDY);
         |                                ^~~~~~~~~~~~~~~~~~~~~~
         |                                vmalloc_hugepage
>> mm/share_pool.c:4577:64: error: 'HUGETLB_ALLOC_BUDDY' undeclared (first use in this function)
    4577 |                         page = hugetlb_alloc_hugepage(node_id, HUGETLB_ALLOC_BUDDY);
         |                                                                ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4577:64: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:4585:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    4585 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
   mm/share_pool.c:4606:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    4606 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
   mm/share_pool.c:4631:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    4631 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
   mm/share_pool.c:4633:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    4633 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   mm/share_pool.c: In function 'sp_alloc_pages':
   mm/share_pool.c:4797:61: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
    4797 |                 page = hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                                                             ^~~~~~~~~~~~~~~~~~
         |                                                             HUGETLB_ANON_FILE
   cc1: some warnings being treated as errors


vim +/HUGETLB_ALLOC_BUDDY +4577 mm/share_pool.c

  4541	
  4542	vm_fault_t sharepool_no_page(struct mm_struct *mm,
  4543				struct vm_area_struct *vma,
  4544				struct address_space *mapping, pgoff_t idx,
  4545				unsigned long address, pte_t *ptep, unsigned int flags)
  4546	{
  4547		struct hstate *h = hstate_vma(vma);
  4548		vm_fault_t ret = VM_FAULT_SIGBUS;
  4549		unsigned long size;
  4550		struct page *page;
  4551		pte_t new_pte;
  4552		spinlock_t *ptl;
  4553		unsigned long haddr = address & huge_page_mask(h);
  4554		bool new_page = false;
  4555		int err;
  4556		int node_id;
  4557		struct sp_area *spa;
  4558		bool charge_hpage = false;
  4559		struct mem_cgroup *memcg;
  4560	
  4561		spa = vma->vm_private_data;
  4562		if (!spa) {
  4563			pr_err("share pool: vma is invalid, not from sp mmap\n");
  4564			return ret;
  4565		}
  4566		node_id = spa->node_id;
  4567	
  4568	retry:
  4569		page = find_lock_page(mapping, idx);
  4570		if (!page) {
  4571			size = i_size_read(mapping->host) >> huge_page_shift(h);
  4572			if (idx >= size)
  4573				goto out;
  4574	
  4575			page = alloc_huge_page(vma, haddr, 0);
  4576			if (IS_ERR(page)) {
> 4577				page = hugetlb_alloc_hugepage(node_id, HUGETLB_ALLOC_BUDDY);
  4578				if (!page)
  4579					page = ERR_PTR(-ENOMEM);
  4580				else if (!PageKmemcg(page))
  4581					charge_hpage = true;
  4582			}
  4583			if (IS_ERR(page)) {
  4584				ptl = huge_pte_lock(h, mm, ptep);
  4585				if (!huge_pte_none(huge_ptep_get(ptep))) {
  4586					ret = 0;
  4587					spin_unlock(ptl);
  4588					goto out;
  4589				}
  4590				spin_unlock(ptl);
  4591				ret = vmf_error(PTR_ERR(page));
  4592				goto out;
  4593			}
  4594	
  4595			if (charge_hpage &&
  4596			    mem_cgroup_try_charge_delay(page, vma->vm_mm, GFP_KERNEL, &memcg, true)) {
  4597				put_page(page);
  4598				ret = vmf_error(-ENOMEM);
  4599				goto out;
  4600			}
  4601	
  4602			__SetPageUptodate(page);
  4603			new_page = true;
  4604	
  4605			/* sharepool pages are all shared */
  4606			err = huge_add_to_page_cache(page, mapping, idx);
  4607			if (err) {
  4608				if (charge_hpage) {
  4609					mem_cgroup_cancel_charge(page, memcg, true);
  4610					charge_hpage = false;
  4611				}
  4612				put_page(page);
  4613				if (err == -EEXIST)
  4614					goto retry;
  4615				goto out;
  4616			}
  4617		}
  4618	
  4619		ptl = huge_pte_lock(h, mm, ptep);
  4620		size = i_size_read(mapping->host) >> huge_page_shift(h);
  4621		if (idx >= size)
  4622			goto backout;
  4623	
  4624		ret = 0;
  4625		if (!huge_pte_none(huge_ptep_get(ptep)))
  4626			goto backout;
  4627	
  4628		page_dup_rmap(page, true);
  4629		new_pte = make_huge_pte(vma, page, ((vma->vm_flags & VM_WRITE)
  4630					&& (vma->vm_flags & VM_SHARED)));
  4631		set_huge_pte_at(mm, haddr, ptep, new_pte);
  4632	
  4633		hugetlb_count_add(pages_per_huge_page(h), mm);
  4634	
  4635		if (charge_hpage)
  4636			mem_cgroup_commit_charge(page, memcg, false, true);
  4637	
  4638		spin_unlock(ptl);
  4639	
  4640		if (new_page)
  4641			SetPagePrivate(&page[1]);
  4642	
  4643		unlock_page(page);
  4644	out:
  4645		return ret;
  4646	
  4647	backout:
  4648		spin_unlock(ptl);
  4649		unlock_page(page);
  4650		if (charge_hpage)
  4651			mem_cgroup_cancel_charge(page, memcg, true);
  4652		put_page(page);
  4653		goto out;
  4654	}
  4655	EXPORT_SYMBOL(sharepool_no_page);
  4656	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
