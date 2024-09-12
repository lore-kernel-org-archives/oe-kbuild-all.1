Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB101A0BF9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726140114; cv=none; b=amiV2WBq4HLGOAU+BTNVK6iAChkiaQuMKTKvC3SpxYiNUeT27g/fZgjaKR0JlAzBDxYWIsfBQ+MXLtaTDKnpaMlE+qbhLtAA3fR8gfNdzhFT9PCALonXl4x35rMdy0WEdizTcRCTzeL5uTUg6XErpOyw4EMnH6+YkjykL8EqEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726140114; c=relaxed/simple;
	bh=AA/B8CGdaXZBW5veNNxsPJNcTmxO3NQCwBKbidnyqRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHZTc55dSV8TZra+mww4/4H5gcLL+SQPmdzxHdIxUpoU3jBs2Ark1ocQ9XuOIVAyhpaK+9JTiCH/iTOyfPWripmX1gSsfxSZ70SqjmLkCYgPbkm8h6eWBURwVpibnIEpfejzbg1Y8TCIeI63gTtwnLgLM6RlxADsXwenFupy4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GivkLMrH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GivkLMrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726140113; x=1757676113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AA/B8CGdaXZBW5veNNxsPJNcTmxO3NQCwBKbidnyqRs=;
  b=GivkLMrHFTJUCJRq5tD7bnGVHRaiy8W3paWBy9J9ZPPbqyz/8pC1xbK3
   H5mD1kGoPuBjoxlxs/frgz3Pa/NeGKATi/4m2xOABg2FqK5ju53cDgpUl
   WSh8HW/0m3zMahZ2AYqBNN4UwHsGUN6nQLwR9ynodejzSTkwamdnWXHAM
   RhKYJk9pyISnL1PjcPQyJqqbrXSdUkKfjZrgm1j6m9MGqUqNwYhDIboO0
   YM4QPITHN5PFRAMoUAqZfMw131mmSL3UQ3nCvEn68cRJOQuC07EZDrCgh
   FJoaSmKt5MkBKTmf5dNjR2f050Sa+bHlAGwFaJzCFn4TNTLtDInZzCdmc
   Q==;
X-CSE-ConnectionGUID: 1QLY/Q39TeKnL6mjoC1ozg==
X-CSE-MsgGUID: 8sELBWkKTki/w47b8cGITA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28874313"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="28874313"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 04:21:52 -0700
X-CSE-ConnectionGUID: KY/jFHeVRP2AjE83ZTDecw==
X-CSE-MsgGUID: de4UVPPrT/28W/PQsAWNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="67501414"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Sep 2024 04:21:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sohtU-000514-30;
	Thu, 12 Sep 2024 11:21:48 +0000
Date: Thu, 12 Sep 2024 19:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 17535/30000] mm/share_pool.c:2573:7: warning: no
 previous prototype for '__mg_sp_alloc_nodemask'
Message-ID: <202409121903.R7e8tX7R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8f53b22e47e98837db7830541a369ed0cd5df749
commit: 8deff3a60ce1a9dffb552210f065fc9ed6a55f84 [17535/30000] mm/sharepool: Add mg_sp_alloc_nodemask
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240912/202409121903.R7e8tX7R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121903.R7e8tX7R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409121903.R7e8tX7R-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


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
