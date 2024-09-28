Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC05187FF3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727532685; cv=none; b=XFBdxT4TDFsNjAG8/AX/2Hzy8RHcoe5B1hTgPQDSZOvX6ivfbJ1cxjoIUBA9FfBIWhCZS7s7b3mocgcEK/0MjI6e8RTDrxXOUnbez7WqwTdAQhu/FPTEDns8abq6jsf8v7niyQyj8sYpdoMmmVLod91B0CUW8Aie36zHi9rvXpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727532685; c=relaxed/simple;
	bh=590/v72PSY7oSN3qNHZnphO/mDM0r7RMEkSykmcX+FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZS4kIywtiXj35TYbsAPuFLPhZRCnVR+s3oUvTc39cId2swEnFzx3JkYDwLhmoC/Aq+8+mYAa/9mv08IcY5yYvaLsqMzhGz0Seb7M0gnPQuXWw9GOkwbiQwdkgfy58e8jXxLjPpMjSCm0umrduLyaWNs35gpVUPhEXaBj63hrX+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cA6d+M6n; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cA6d+M6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727532683; x=1759068683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=590/v72PSY7oSN3qNHZnphO/mDM0r7RMEkSykmcX+FU=;
  b=cA6d+M6nyWTrPZSxl1uvVg/tijeJeCnqU5LUwsa8yQfnDh98E1+oN+W5
   HEg3aobKNpfq9FBnivwAzmrFQGxqYSTaqYbyI64BdqBz6XWFxYGW4RTd1
   P6NNTvcS5GLewYOmtapMll/iD4j+Aggve+kfFyeANhMAjjo3HvXXyNk/d
   jUqXXdkwPXB60ZKIqz7TvJ3O81oi04+OZa/avByku8YPdGSitt3Nj3xRM
   hvebvdS03FpvbWG4azDO7iMBRpsS4ZN08/XmiI1JBG9tJ78oe9SZps7rw
   6BlFZ9uQZIkC5aerEAtuRYcpnnjNaHJ2uLFvh//6fxszQ1V1T3IBpqQ7V
   Q==;
X-CSE-ConnectionGUID: 8FqsU1muSEq+78eYMNYBAg==
X-CSE-MsgGUID: kf+b018yQYCInq3hMfwtog==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26829367"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26829367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 07:11:18 -0700
X-CSE-ConnectionGUID: lN47gdbzSjGOXFUPxLylQA==
X-CSE-MsgGUID: hjYVEFiKQtGXSldKZredqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73139375"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 07:11:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suYAE-000NJL-0n;
	Sat, 28 Sep 2024 14:11:14 +0000
Date: Sat, 28 Sep 2024 22:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20162/23799] mm/share_pool.c:4577:64:
 error: 'HUGETLB_ALLOC_BUDDY' undeclared
Message-ID: <202409282248.mtMRfV3U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: 0886320b818787f720824229f153f161c89faf70 [20162/23799] mm/sharepool: Charge Buddy hugepage to memcg
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282248.mtMRfV3U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282248.mtMRfV3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282248.mtMRfV3U-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'mg_sp_group_id_by_pid':
   mm/share_pool.c:1086:29: warning: ordered comparison of pointer with integer zero [-Wextra]
    1086 |         if (!spg_ids || num <= 0)
         |                             ^~
   mm/share_pool.c: In function 'sp_compact_nodes':
   mm/share_pool.c:2149:9: error: implicit declaration of function 'sysctl_compaction_handler'; did you mean 'sysctl_memcg_qos_handler'? [-Werror=implicit-function-declaration]
    2149 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         sysctl_memcg_qos_handler
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
   mm/share_pool.c: At top level:
   mm/share_pool.c:4492:12: warning: 'proc_overview_show' defined but not used [-Wunused-function]
    4492 | static int proc_overview_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4440:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    4440 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   mm/share_pool.c:4377:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    4377 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
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
