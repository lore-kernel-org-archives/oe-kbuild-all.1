Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5107A1400A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 03:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727493903; cv=none; b=S/OCrAB2rWccUjp7d98IbY7rAvpKZOWDBvBo//9+PsnJGnAY32kD9VpFBs/hJHiPoNCdTrPspzwZGQB6BkZgEcq//R47nVEl5C+8J7r4nIXdDpfn0TEdQbk23WGsrOh+olUKG6nEgrm3ONEAoxj5h/clVEURY2wSTd3jKwH22c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727493903; c=relaxed/simple;
	bh=1lu0uj4SAjLW6czIi5P6eGvSUcaQkuahhwn27u8o0FE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PEVsHyPJ7hMOX+cLslUt77V8FmnBgpsigdFtOwcNWap79dWO5kg3oRk47gn9MDN/w02qnBdXBCcYLE2rQz/YS8miq9M+YDuref/gn3iadPlv+HritaHVMxR4GUHKsQglZe/u1o5HXNNFulNczFdccGVtIwzt+jtn+mZ7yPJNlDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ucgsu7lG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ucgsu7lG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727493902; x=1759029902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lu0uj4SAjLW6czIi5P6eGvSUcaQkuahhwn27u8o0FE=;
  b=Ucgsu7lGfV638QlGUiH5DcLEUbGsrpuGVQDR42bfds3gbRNyNax/+D67
   SHCKODhSvsgv3mPR48PmZpnqJOOsq2e+OEDHd6YvPEBauV+Ucq929Uf9f
   u+LRqxsnCHJ1mDg5xPxs4rmH4Dlie8rdFn+k8QDfAQPJWWXyrhYVcWINf
   cYLxwxw+wPnYRKVlJzo7bbNy3nGeNPgWMPB6s5B9LSFe9wWC9/3mTygBs
   LFdxvmYyQwFQLH4HmkBNKDA0GgKPOeDJWgT/neWGkpxBePOMOKFqo88m5
   2+qzt5tv5jyXBM115Ybsk7z3c20FImg6aHLLVEfdNZcRXFYIedeHsvGCa
   g==;
X-CSE-ConnectionGUID: TXHcW+UqRoapGH3uK3KvDw==
X-CSE-MsgGUID: vqnP6iWvR5mfkHauvw8/dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26519925"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26519925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 20:25:00 -0700
X-CSE-ConnectionGUID: 5pxNflWeTo68ltI0CO/F7A==
X-CSE-MsgGUID: VZkgHUoLTWOIoTx40n4c6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72785975"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2024 20:24:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suO4m-000Mt6-1S;
	Sat, 28 Sep 2024 03:24:56 +0000
Date: Sat, 28 Sep 2024 11:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18191/23799] mm/share_pool.c:2435:30:
 error: implicit declaration of function 'huge_pte_none'; did you mean
 'huge_pte_lock'?
Message-ID: <202409281115.zfsojOdU-lkp@intel.com>
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
commit: 4e851c2bb53e45d92e266c65cf0c203624e74710 [18191/23799] ascend: share_pool: Use sharepool_no_page to alloc hugepage
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281115.zfsojOdU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281115.zfsojOdU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281115.zfsojOdU-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:1685:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    1685 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:1685:21: error: invalid initializer
   mm/share_pool.c: In function 'sharepool_no_page':
>> mm/share_pool.c:2435:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    2435 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
>> mm/share_pool.c:2448:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    2448 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
>> mm/share_pool.c:2470:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    2470 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
>> mm/share_pool.c:2472:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    2472 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   mm/share_pool.c: In function 'sp_alloc_pages':
   mm/share_pool.c:2508:24: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
    2508 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        vmalloc_hugepage
   mm/share_pool.c:2508:61: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
    2508 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                                                             ^~~~~~~~~~~~~~~~~~
         |                                                             HUGETLB_ANON_FILE
   mm/share_pool.c:2508:61: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:2511:1: warning: control reaches end of non-void function [-Wreturn-type]
    2511 | }
         | ^
   mm/share_pool.c: At top level:
   mm/share_pool.c:2393:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    2393 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   mm/share_pool.c:2274:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    2274 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2435 mm/share_pool.c

  2403	
  2404	vm_fault_t sharepool_no_page(struct mm_struct *mm,
  2405				struct vm_area_struct *vma,
  2406				struct address_space *mapping, pgoff_t idx,
  2407				unsigned long address, pte_t *ptep, unsigned int flags)
  2408	{
  2409		struct hstate *h = hstate_vma(vma);
  2410		vm_fault_t ret = VM_FAULT_SIGBUS;
  2411		unsigned long size;
  2412		struct page *page;
  2413		pte_t new_pte;
  2414		spinlock_t *ptl;
  2415		unsigned long haddr = address & huge_page_mask(h);
  2416		bool new_page = false;
  2417		int err;
  2418	
  2419	retry:
  2420		page = find_lock_page(mapping, idx);
  2421		if (!page) {
  2422			size = i_size_read(mapping->host) >> huge_page_shift(h);
  2423			if (idx >= size)
  2424				goto out;
  2425	
  2426			page = alloc_huge_page(vma, haddr, 0);
  2427			if (IS_ERR(page)) {
  2428				page = alloc_huge_page_node(hstate_file(vma->vm_file),
  2429							    numa_mem_id());
  2430				if (!page)
  2431					page = ERR_PTR(-ENOMEM);
  2432			}
  2433			if (IS_ERR(page)) {
  2434				ptl = huge_pte_lock(h, mm, ptep);
> 2435				if (!huge_pte_none(huge_ptep_get(ptep))) {
  2436					ret = 0;
  2437					spin_unlock(ptl);
  2438					goto out;
  2439				}
  2440				spin_unlock(ptl);
  2441				ret = vmf_error(PTR_ERR(page));
  2442				goto out;
  2443			}
  2444			__SetPageUptodate(page);
  2445			new_page = true;
  2446	
  2447			/* sharepool pages are all shared */
> 2448			err = huge_add_to_page_cache(page, mapping, idx);
  2449			if (err) {
  2450				put_page(page);
  2451				if (err == -EEXIST)
  2452					goto retry;
  2453				goto out;
  2454			}
  2455		}
  2456	
  2457	
  2458		ptl = huge_pte_lock(h, mm, ptep);
  2459		size = i_size_read(mapping->host) >> huge_page_shift(h);
  2460		if (idx >= size)
  2461			goto backout;
  2462	
  2463		ret = 0;
  2464		if (!huge_pte_none(huge_ptep_get(ptep)))
  2465			goto backout;
  2466	
  2467		page_dup_rmap(page, true);
  2468		new_pte = make_huge_pte(vma, page, ((vma->vm_flags & VM_WRITE)
  2469					&& (vma->vm_flags & VM_SHARED)));
> 2470		set_huge_pte_at(mm, haddr, ptep, new_pte);
  2471	
> 2472		hugetlb_count_add(pages_per_huge_page(h), mm);
  2473	
  2474		spin_unlock(ptl);
  2475	
  2476		if (new_page) {
  2477			SetPagePrivate(&page[1]);
  2478		}
  2479	
  2480		unlock_page(page);
  2481	out:
  2482		return ret;
  2483	
  2484	backout:
  2485		spin_unlock(ptl);
  2486		unlock_page(page);
  2487		put_page(page);
  2488		goto out;
  2489	}
  2490	EXPORT_SYMBOL(sharepool_no_page);
  2491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
