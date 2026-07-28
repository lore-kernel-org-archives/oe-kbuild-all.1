Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429D841D64E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 22:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785277562; cv=none; b=EkZO9YsDSh5i8a3yHxaQ2eaHF5eh2ov+5C2GIYMK0SWFSx68+d1bA0QnRI5HyJb7bxI1tMuXZuxFbHHZ2oH4VSlwKqlmEh0DnazUu99dJj9b473xE0Gv/qUNhcLy+8ldS9pNOol43OKlSCNUr+0zlnGKf3hJ08wq3263D0sJ3bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785277562; c=relaxed/simple;
	bh=OZWPQvLkHr7CDJ4jJ8Zpr9lbLQA/5one/rswchEF4wc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gw9nbJQPo3FOiJM0NuALiK9WxDWclSFJ/CamW1w1HZavG9wVMU+tuAPbg7Da9SoL/yHQpQPN0Th8ASPsofNjJxaPKZVKiTJEOzniFvDV/y2Mfd7wcb3G3UecI8KjrrNl8iBzGKOskYwcbXe8J4ZnaGW0IEQuPpx2/1WDZSM3+c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OH9md2nR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OH9md2nR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785277560; x=1816813560;
  h=date:from:to:cc:subject:message-id;
  bh=OZWPQvLkHr7CDJ4jJ8Zpr9lbLQA/5one/rswchEF4wc=;
  b=OH9md2nRLuORqd5WatUBfP0UMdCoZfWIXVSDEYUhR+3+Unl5iCebXFg1
   VaPcKDKmS+swnExXvjbLHj6EEkpc9C399TLLAdrGkAWZ3sYd05dC2cC/+
   cPaMBH44nllt+PwlpB/6wWLgHuVclTzzFqdss4FugFSOUONLkKCcMvVHs
   7v//d/D5TzgNpCRRkxei7LngQ9nObftjD3yoO2SXVNhsEtc08lHdp4SQx
   JXSh7XRGqVKfX0AwXfCNIbvqos/rt5h0HRg4rMrr/yBgLKV0jr2iM0ZLe
   p0FeNL8VDFfunZAT5MpvRnud1zS+hvKUqBaHi8YkqiniQcu+8ZjvKAQpS
   g==;
X-CSE-ConnectionGUID: IrVOP5OyTbynCOxqVeRMVA==
X-CSE-MsgGUID: 7a/OqfmeQwqpp53yzRqaOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86068391"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="86068391"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:25:59 -0700
X-CSE-ConnectionGUID: oUpdJAqBSC6Szkl/koF+oQ==
X-CSE-MsgGUID: E7rwFjhmSTGl1jEhwcZFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="253498300"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jul 2026 15:25:57 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woqFG-0000000021i-3teI;
	Tue, 28 Jul 2026 22:25:54 +0000
Date: Wed, 29 Jul 2026 00:25:17 +0200
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:hugetlb-20260728 6/22]
 mm/memory-failure.c:2751:17: error: incompatible pointer types passing 'pte_t
 *(*)(struct vm_area_struct *, unsigned long, unsigned long)' to parameter of
 type 'spinlock_t *' (aka 'struct spinlock *')
Message-ID: <202607290031.jbqmE0Tw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache hugetlb-20260728
head:   9d175837a52482ede820b73b06d16914dfe184b9
commit: 4e9ba443c27579c311e9cc43d1ed6d4c01abcccf [6/22] hugetlb: Use the has_hwpoisoned flag
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260729/202607290031.jbqmE0Tw-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290031.jbqmE0Tw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290031.jbqmE0Tw-lkp@intel.com/

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
