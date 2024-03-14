Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004005D47E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710403945; cv=none; b=XjEjFXlsjpdpnskDTKqPXDqg/5+r1jny+rsU34IBmhn2DNH0K/Lr6KhY0q1BMIxxumVkVlE9QPRApF1fgVqHqYRyjfvfXaOlJwj8kaXwxqjBJ3S0PTNzVrGpBYLYF/dPoNZxzrJXgSry7DzM51inqcXEfUBIpe6ljDd2ulbsK/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710403945; c=relaxed/simple;
	bh=liykRDF6CGgwE6ZR98clSloBTjYRpLu5tx2nwHW4eHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HEiBhEHAppr2pj4Fgw9E7up9zbMM1Imgtb2lSMl8qyf+QsWKPr2tkuvRhO0QNy3Ygc9aC5ghP4gWjye/G1uurSWYEut4r3L5nljZibptzKOwVvYgf+uZoCTP97ev1ZF6Apmsh3HzlWPAJw2XUoir/rq95cy49PACjtHyDr+GYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwRveqrE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwRveqrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710403943; x=1741939943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=liykRDF6CGgwE6ZR98clSloBTjYRpLu5tx2nwHW4eHI=;
  b=YwRveqrEJcqmryrWtfHlMzGAqhEf4dmkgKvuvIBi4S4wW8QOo+mHLbop
   dyaTstXo2JNdxRyLLWaUDej1CI7cOdbk6XgY3NJe0OhLgqR3tLZ2510Ap
   IhY/ZAXIroN+uC6XavWj5l22JW3I7zY4LQfnVf65s2O7P85yBWGEQOUQD
   bBPVi35Sfrvqck71LRH4b3mso/NnwLAsn1GHO+yNz3qLcnp/p/ANwMZOs
   lVMVPFVHw5qgf9nilUyHBc6iYf6GF4tYLue1d2uO/iqcOF9dxJhEHzkny
   h542jLiwf3yZMjz41o2LPftlam20+i3KiyXfXely2eJJJgMtGi29MAUGV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5402867"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5402867"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 01:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16805199"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Mar 2024 01:12:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkgCJ-000DEN-0V;
	Thu, 14 Mar 2024 08:12:19 +0000
Date: Thu, 14 Mar 2024 16:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 22883/30000] mm/share_pool.c:2573:7: warning: no
 previous prototype for '__mg_sp_alloc_nodemask'
Message-ID: <202403141613.ZRlTvvlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9e82708a746dc5d4ec8995a3e6edace2cf23c6fd
commit: 8deff3a60ce1a9dffb552210f065fc9ed6a55f84 [22883/30000] mm/sharepool: Add mg_sp_alloc_nodemask
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240314/202403141613.ZRlTvvlC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141613.ZRlTvvlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141613.ZRlTvvlC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/share_pool.c:2573:7: warning: no previous prototype for '__mg_sp_alloc_nodemask' [-Wmissing-prototypes]
    2573 | void *__mg_sp_alloc_nodemask(unsigned long size, unsigned long sp_flags, int spg_id,
         |       ^~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:3037:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    3037 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:3037:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_unshare_kva':
   mm/share_pool.c:3355:14: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
    3355 |         bool is_hugepage = true;
         |              ^~~~~~~~~~~
   mm/share_pool.c: In function 'sharepool_no_page':
   mm/share_pool.c:4071:41: error: 'HUGETLB_ALLOC_BUDDY' undeclared (first use in this function)
    4071 |                                         HUGETLB_ALLOC_BUDDY | HUGETLB_ALLOC_NORECLAIM);
         |                                         ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4071:41: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:4071:63: error: 'HUGETLB_ALLOC_NORECLAIM' undeclared (first use in this function)
    4071 |                                         HUGETLB_ALLOC_BUDDY | HUGETLB_ALLOC_NORECLAIM);
         |                                                               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4079:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    4079 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
   mm/share_pool.c:4099:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    4099 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
   mm/share_pool.c:4121:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    4121 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
   mm/share_pool.c:4123:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    4123 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   cc1: some warnings being treated as errors


vim +/__mg_sp_alloc_nodemask +2573 mm/share_pool.c

  2572	
> 2573	void *__mg_sp_alloc_nodemask(unsigned long size, unsigned long sp_flags, int spg_id,
  2574			nodemask_t *nodemask)
  2575	{
  2576		struct sp_area *spa = NULL;
  2577		int ret = 0;
  2578		struct sp_alloc_context ac;
  2579	
  2580		if (!sp_is_enabled())
  2581			return ERR_PTR(-EOPNOTSUPP);
  2582	
  2583		ret = sp_alloc_prepare(size, sp_flags, spg_id, &ac);
  2584		if (ret)
  2585			return ERR_PTR(ret);
  2586	
  2587	try_again:
  2588		spa = sp_alloc_area(ac.size_aligned, ac.sp_flags, ac.spg,
  2589				    ac.type, current->tgid);
  2590		if (IS_ERR(spa)) {
  2591			pr_err_ratelimited("alloc spa failed in allocation(potential no enough virtual memory when -75): %ld\n",
  2592				PTR_ERR(spa));
  2593			ret = PTR_ERR(spa);
  2594			goto out;
  2595		}
  2596	
  2597		ret = sp_alloc_mmap_populate(spa, &ac, nodemask);
  2598		if (ret && ac.state == ALLOC_RETRY) {
  2599			/*
  2600			 * The mempolicy for shared memory is located at backend file, which varies
  2601			 * between normal pages and huge pages. So we should set the mbind policy again
  2602			 * when we retry using normal pages.
  2603			 */
  2604			ac.have_mbind = false;
  2605			goto try_again;
  2606		}
  2607	
  2608	out:
  2609		sp_alloc_finish(ret, spa, &ac);
  2610		if (ret)
  2611			return ERR_PTR(ret);
  2612		else
  2613			return (void *)(spa->va_start);
  2614	}
  2615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
