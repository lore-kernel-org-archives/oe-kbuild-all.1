Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C666285CB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 04:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300470; cv=none; b=HJmabGdKWSYMmQLFIsI3Pe/cHm0ZO0aUr09dBk8S4IFNVRfGTwyoHfce54sG+wBpdSJQPwvjG+cCE1wAogOfh/lvZT2ibu+GzjPg74eMs2bZsCWNQnPqcNJd2WGEjZNPSGlv3Cn8Yh0jStYa/8lZrUn1lSpwikIW/B4l8t/Mhvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300470; c=relaxed/simple;
	bh=rLGF2OiHkq7JEFt7vVbzBxtjElHK3tsSo7/AVCRNRBQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HcIauELQ6K6Jo2bRRGN/O0WbpprG8T8xdEQyN0LlA+p02dCiSh0PdcawxnlxPsLbEMXxXv11IufnqxoK42sbz7XOU0U6kZCykefCT0AL+eklvaRLk3XlghJsjE3W0cV904q9h07TM4vfHVcaJZoW2ELLSF1QaYmS8PZNvWJef+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLI4clcK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLI4clcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785300468; x=1816836468;
  h=date:from:to:cc:subject:message-id;
  bh=rLGF2OiHkq7JEFt7vVbzBxtjElHK3tsSo7/AVCRNRBQ=;
  b=mLI4clcKSIV7I1tFwQ04dNvhCNNOrF0Bd0Eg8sIxoYIHFwVIeCS0PYyc
   y5iSBdDYQGu9+4Y1338pObSFpLtLofldNnjSr44LbK7/grYFKL7QDEUog
   XGTd+grSP38WCHvS0Ybm39U7i8jsj+dPI0iZC4+2c0k4oqy1ofu14QTwW
   G6fppIQ40nLgR63XtXqoz0Lg9AHYfLNZZ7GTjrDqZ8fjvFCIjhslP0kgm
   5hpakkBbw5guisEE30IK4zVRUsUpwGspZeYntCir2JriM2R10fINkCJyh
   9rX8TxyiwvKfDYZXnLXiJmvnSd7RrzOwkz/KTausN0cKxmdqNLW9oelJH
   w==;
X-CSE-ConnectionGUID: +OZNuzE9SD6OOgnJq5M84A==
X-CSE-MsgGUID: PHG+QlGwSeC++ZfWs03Pyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97055714"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="97055714"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 21:47:48 -0700
X-CSE-ConnectionGUID: YgBLKrLRS96Rv4pcsFP5wg==
X-CSE-MsgGUID: ikxO0g4jTvKNM4IwYzQa0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="284444531"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jul 2026 21:47:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wowCU-00000000f2h-2A9q;
	Wed, 29 Jul 2026 04:47:30 +0000
Date: Wed, 29 Jul 2026 12:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:hugetlb-20260728 6/22]
 mm/memory-failure.c:2751:17: error: incompatible pointer types passing 'pte_t
 *(*)(struct vm_area_struct *, unsigned long, unsigned long)' to parameter of
 type 'spinlock_t *' (aka 'struct spinlock *')
Message-ID: <202607291228.V4u5fLJF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache hugetlb-20260728
head:   9d175837a52482ede820b73b06d16914dfe184b9
commit: 4e9ba443c27579c311e9cc43d1ed6d4c01abcccf [6/22] hugetlb: Use the has_hwpoisoned flag
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260729/202607291228.V4u5fLJF-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291228.V4u5fLJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291228.V4u5fLJF-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory-failure.c:2751:18: error: use of undeclared identifier 'hugetlb_lock'; did you mean 'hugetlb_walk'?
    2751 |                 spin_lock_irq(&hugetlb_lock);
         |                                ^~~~~~~~~~~~
         |                                hugetlb_walk
   include/linux/hugetlb.h:1349:1: note: 'hugetlb_walk' declared here
    1349 | hugetlb_walk(struct vm_area_struct *vma, unsigned long addr, unsigned long sz)
         | ^
>> mm/memory-failure.c:2751:17: error: incompatible pointer types passing 'pte_t *(*)(struct vm_area_struct *, unsigned long, unsigned long)' to parameter of type 'spinlock_t *' (aka 'struct spinlock *') [-Wincompatible-pointer-types]
    2751 |                 spin_lock_irq(&hugetlb_lock);
         |                               ^~~~~~~~~~~~~
   include/linux/spinlock.h:369:55: note: passing argument to parameter 'lock' here
     369 | static __always_inline void spin_lock_irq(spinlock_t *lock)
         |                                                       ^
   mm/memory-failure.c:2756:22: error: use of undeclared identifier 'hugetlb_lock'; did you mean 'hugetlb_walk'?
    2756 |                                 spin_unlock_irq(&hugetlb_lock);
         |                                                  ^~~~~~~~~~~~
         |                                                  hugetlb_walk
   include/linux/hugetlb.h:1349:1: note: 'hugetlb_walk' declared here
    1349 | hugetlb_walk(struct vm_area_struct *vma, unsigned long addr, unsigned long sz)
         | ^
   mm/memory-failure.c:2756:21: error: incompatible pointer types passing 'pte_t *(*)(struct vm_area_struct *, unsigned long, unsigned long)' to parameter of type 'spinlock_t *' (aka 'struct spinlock *') [-Wincompatible-pointer-types]
    2756 |                                 spin_unlock_irq(&hugetlb_lock);
         |                                                 ^~~~~~~~~~~~~
   include/linux/spinlock.h:399:57: note: passing argument to parameter 'lock' here
     399 | static __always_inline void spin_unlock_irq(spinlock_t *lock)
         |                                                         ^
   mm/memory-failure.c:2763:20: error: use of undeclared identifier 'hugetlb_lock'; did you mean 'hugetlb_walk'?
    2763 |                 spin_unlock_irq(&hugetlb_lock);
         |                                  ^~~~~~~~~~~~
         |                                  hugetlb_walk
   include/linux/hugetlb.h:1349:1: note: 'hugetlb_walk' declared here
    1349 | hugetlb_walk(struct vm_area_struct *vma, unsigned long addr, unsigned long sz)
         | ^
   mm/memory-failure.c:2763:19: error: incompatible pointer types passing 'pte_t *(*)(struct vm_area_struct *, unsigned long, unsigned long)' to parameter of type 'spinlock_t *' (aka 'struct spinlock *') [-Wincompatible-pointer-types]
    2763 |                 spin_unlock_irq(&hugetlb_lock);
         |                                 ^~~~~~~~~~~~~
   include/linux/spinlock.h:399:57: note: passing argument to parameter 'lock' here
     399 | static __always_inline void spin_unlock_irq(spinlock_t *lock)
         |                                                         ^
   6 errors generated.


vim +2751 mm/memory-failure.c

  2677	
  2678	/**
  2679	 * unpoison_memory - Unpoison a previously poisoned page
  2680	 * @pfn: Page number of the to be unpoisoned page
  2681	 *
  2682	 * Software-unpoison a page that has been poisoned by
  2683	 * memory_failure() earlier.
  2684	 *
  2685	 * This is only done on the software-level, so it only works
  2686	 * for linux injected failures, not real hardware failures
  2687	 *
  2688	 * Returns 0 for success, otherwise -errno.
  2689	 */
  2690	int unpoison_memory(unsigned long pfn)
  2691	{
  2692		struct folio *folio;
  2693		struct page *p;
  2694		int ret = -EBUSY, ghp;
  2695		unsigned long count;
  2696		bool huge = false;
  2697		static DEFINE_RATELIMIT_STATE(unpoison_rs, DEFAULT_RATELIMIT_INTERVAL,
  2698						DEFAULT_RATELIMIT_BURST);
  2699	
  2700		p = pfn_to_online_page(pfn);
  2701		if (!p)
  2702			return -EIO;
  2703		folio = page_folio(p);
  2704	
  2705		mutex_lock(&mf_mutex);
  2706	
  2707		if (hw_memory_failure) {
  2708			unpoison_pr_info("%#lx: disabled after HW memory failure\n",
  2709					 pfn, &unpoison_rs);
  2710			ret = -EOPNOTSUPP;
  2711			goto unlock_mutex;
  2712		}
  2713	
  2714		if (is_huge_zero_folio(folio)) {
  2715			unpoison_pr_info("%#lx: huge zero page is not supported\n",
  2716					 pfn, &unpoison_rs);
  2717			ret = -EOPNOTSUPP;
  2718			goto unlock_mutex;
  2719		}
  2720	
  2721		if (!is_page_hwpoison(p)) {
  2722			unpoison_pr_info("%#lx: page is not poisoned\n",
  2723					 pfn, &unpoison_rs);
  2724			goto unlock_mutex;
  2725		}
  2726	
  2727		if (folio_ref_count(folio) > 1) {
  2728			unpoison_pr_info("%#lx: someone grabs the hwpoison page\n",
  2729					 pfn, &unpoison_rs);
  2730			goto unlock_mutex;
  2731		}
  2732	
  2733		if (folio_test_slab(folio) || folio_test_pgtable(folio) ||
  2734		    folio_test_reserved(folio) || folio_test_offline(folio))
  2735			goto unlock_mutex;
  2736	
  2737		if (folio_mapped(folio)) {
  2738			unpoison_pr_info("%#lx: someone maps the hwpoison page\n",
  2739					 pfn, &unpoison_rs);
  2740			goto unlock_mutex;
  2741		}
  2742	
  2743		if (folio_mapping(folio)) {
  2744			unpoison_pr_info("%#lx: the hwpoison page has non-NULL mapping\n",
  2745					 pfn, &unpoison_rs);
  2746			goto unlock_mutex;
  2747		}
  2748	
  2749		ghp = get_hwpoison_page(p, MF_UNPOISON);
  2750		if (!ghp) {
> 2751			spin_lock_irq(&hugetlb_lock);
  2752			if (folio_test_hugetlb(folio)) {
  2753				huge = true;
  2754				count = folio_free_raw_hwp(folio, false);
  2755				if (count == 0) {
  2756					spin_unlock_irq(&hugetlb_lock);
  2757					goto unlock_mutex;
  2758				}
  2759				ret = hugetlb_clear_poison(folio);
  2760			} else {
  2761				ret = TestClearPageHWPoison(p) ? 0 : -EBUSY;
  2762			}
  2763			spin_unlock_irq(&hugetlb_lock);
  2764		} else if (ghp < 0) {
  2765			if (ghp == -EHWPOISON) {
  2766				ret = put_page_back_buddy(p) ? 0 : -EBUSY;
  2767			} else {
  2768				ret = ghp;
  2769				unpoison_pr_info("%#lx: failed to grab page\n",
  2770						 pfn, &unpoison_rs);
  2771			}
  2772		} else if (folio_test_hugetlb(folio)) {
  2773			huge = true;
  2774			count = folio_free_raw_hwp(folio, false);
  2775			if (count == 0) {
  2776				folio_put(folio);
  2777				goto unlock_mutex;
  2778			}
  2779			ret = hugetlb_clear_poison(folio);
  2780			folio_put(folio);
  2781			if (!ret)
  2782				folio_put(folio);
  2783		} else {
  2784			folio_put(folio);
  2785			if (TestClearPageHWPoison(p)) {
  2786				folio_put(folio);
  2787				ret = 0;
  2788			}
  2789		}
  2790	
  2791	unlock_mutex:
  2792		mutex_unlock(&mf_mutex);
  2793		if (!ret) {
  2794			if (!huge)
  2795				num_poisoned_pages_sub(pfn, 1);
  2796			unpoison_pr_info("%#lx: software-unpoisoned page\n",
  2797					 page_to_pfn(p), &unpoison_rs);
  2798		}
  2799		return ret;
  2800	}
  2801	EXPORT_SYMBOL(unpoison_memory);
  2802	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
