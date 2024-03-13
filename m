Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5175110965
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 04:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710303338; cv=none; b=gtDgLbTzOd8M2aAmTFPPq/NDLxvVMB9AGoxWbIoyX2BBb/UrmspO4917IbY4hvUVKwksPwVS3fuZ1yub0ueLfJ/m+tAGRCax5tPN9kwV+5rqcG/gI6Q03EnfD+u13akhc1mSNLONsvodrOfQMP0EtY2ESTEJrOui0/pqO8wwgm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710303338; c=relaxed/simple;
	bh=hwJCVbYP6gnoTdCZsp1o5vXOOTviceX0+p+StrNCG94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQp2UL+DNDTq73pKaWdcV+ybxFDqdsO85u4VgfkhObhI+l8P3dqBtJfALRZPOlNUVwz+BTctP/jP40eR/Q0EBwe9lHVxOdSp6MMWU0G3CLVk4SgLBsmZl4BxNTQoZTHwu8BA+bLQgOf+duDKjthDxPrrcUjPIwMTHrvqwi4U8jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+vfs8Nv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+vfs8Nv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710303336; x=1741839336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwJCVbYP6gnoTdCZsp1o5vXOOTviceX0+p+StrNCG94=;
  b=d+vfs8Nv2tvDT8mukQ0tNXRHW96hqdtVSjh4DjDTptzVFEWJEUNCBQay
   Z2zD7AtQtemCqlSR1aBmd+wrxJOVuewO3Cb8o/EGEKKqIL/P+en8VMeKO
   u0lMOmxzMI4c5DdrDU5KcjHv0zLl7vKkeEjFNMRxVT/+WMPnCnzaOqpWy
   JatIWmOPmu3wmo0S7sulpFeodRg0E4Mue+as75n2gjDs1+UmYXfr1wn3U
   QsfA5kcX3Bar6bnv8G2LD8HDX/1eXDKSdsxAmol6HpVh+ztWlVSK6kM5o
   NzmHCqv8xZJZrEpRLg/xwvUmSa5sdvuHcNS5VlraTM5U2ofU+qZNVYgeL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5169815"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5169815"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 21:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11844220"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2024 21:15:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkG1a-000C03-35;
	Wed, 13 Mar 2024 04:15:30 +0000
Date: Wed, 13 Mar 2024 12:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16692/30000] mm/share_pool.c:4227:64: error:
 'HUGETLB_ALLOC_BUDDY' undeclared
Message-ID: <202403131259.tZO2bTEt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4fa7099066983597bd415dde5a3e416bf2bd8f7c
commit: bec70574669710bd0962f1f6807363915fc94f16 [16692/30000] mm/sharepool: fix hugepage_rsvd count increase error
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240313/202403131259.tZO2bTEt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131259.tZO2bTEt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131259.tZO2bTEt-lkp@intel.com/

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
   cc1: some warnings being treated as errors


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
