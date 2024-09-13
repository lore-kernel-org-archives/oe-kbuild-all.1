Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28741714B6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 21:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263210; cv=none; b=iY7FJQ8y8WhuoghvWX4/6GyP4XdxgdzuDBXTDEUvT/XqeoPhgq3Zme9g2nW8YHhy1arIQci61D1BL1O5rVqR8jz80teo5twBNjsqAF0OGu3kI6/3lZUd33jVLbYiE6eKBevN4X18XffkvLjkIqpPCvFS866KFQ5a+d0SGM97+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263210; c=relaxed/simple;
	bh=1FetzQF97MZ+NvSgUS8v4sYk4k1l2IWCaVIJ3ehvuUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMgHaYRMF72Yh7DwrvOxj6eZXajH3qRI+uO1gvZm44Blrj6erHJFJ/s/awkIriN/pnLGrKJM3MaqaHWaH8tyOLrrJZbDBLRgYPXohEaOJRNX6In6CYANbPT3gBfq4GxfI7dX+Y6QxRf/f7bcnZzP+xrcjNT9YsmPy+vWlvz0o7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXtyZwPy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXtyZwPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726263209; x=1757799209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1FetzQF97MZ+NvSgUS8v4sYk4k1l2IWCaVIJ3ehvuUE=;
  b=CXtyZwPy8JjUmx1HxEBNnES8ruJ/HZyI1KJZD/a6cGjff+WFS9MOQk0X
   EFubLoxP4cy3+AK/XzShxe26W4S4bz+iFpSF3dL4C88Jx8Kpt16XZS6cK
   1JAn4G67vFw9FrBv3bq7m4RdxItlC4nIz7tk1CcYwrdEcTmZEAXYtDVOR
   VjehW/YU7XPCQ6CBujr+7Bp5W+bsLnACcdVzRwiPu1M+VpUToSUGU4DWj
   okuDmXTFuY0W//Rx38l/3gMcffmYSvT7PvH2tPaiZMlLBGHVA9EbJo1ZL
   ryf7OMsbuP/n+74PTAyOND/Mmh0+ULlAstmcQycWvN2TT/AwIqBkrkMEy
   A==;
X-CSE-ConnectionGUID: 9QY495y9Qky4sKD/MnzvHA==
X-CSE-MsgGUID: MPw0mLQQRGqVeM6UfnM2ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36558407"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="36558407"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 14:33:28 -0700
X-CSE-ConnectionGUID: wPu07pG+T8KrPLnsadQYmg==
X-CSE-MsgGUID: m7Ibg4uuQ6KR3mid+/Fo4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68711463"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2024 14:33:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spDuu-000738-2u;
	Fri, 13 Sep 2024 21:33:24 +0000
Date: Sat, 14 Sep 2024 05:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/39] mm: hugetlb: Refactor
 alloc_buddy_hugetlb_folio_with_mpol() to interpret mempolicy instead of vma
Message-ID: <202409140553.G2RGVWNA-lkp@intel.com>
References: <1778a7324a1242fa907981576ebd69716a94d778.1726009989.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1778a7324a1242fa907981576ebd69716a94d778.1726009989.git.ackerleytng@google.com>

Hi Ackerley,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.11-rc7 next-20240913]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ackerley-Tng/mm-hugetlb-Simplify-logic-in-dequeue_hugetlb_folio_vma/20240911-074716
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/1778a7324a1242fa907981576ebd69716a94d778.1726009989.git.ackerleytng%40google.com
patch subject: [RFC PATCH 05/39] mm: hugetlb: Refactor alloc_buddy_hugetlb_folio_with_mpol() to interpret mempolicy instead of vma
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409140553.G2RGVWNA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140553.G2RGVWNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140553.G2RGVWNA-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb.c: In function 'alloc_hugetlb_folio':
>> mm/hugetlb.c:3197:23: error: implicit declaration of function 'policy_node_nodemask'; did you mean 'policy_mbind_nodemask'? [-Werror=implicit-function-declaration]
    3197 |                 nid = policy_node_nodemask(mpol, htlb_alloc_mask(h), ilx, &nodemask);
         |                       ^~~~~~~~~~~~~~~~~~~~
         |                       policy_mbind_nodemask
   cc1: some warnings being treated as errors


vim +3197 mm/hugetlb.c

  3119	
  3120	struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
  3121					    unsigned long addr, int avoid_reserve)
  3122	{
  3123		struct hugepage_subpool *spool = subpool_vma(vma);
  3124		struct hstate *h = hstate_vma(vma);
  3125		struct folio *folio;
  3126		long map_chg, map_commit, nr_pages = pages_per_huge_page(h);
  3127		long gbl_chg;
  3128		int memcg_charge_ret, ret, idx;
  3129		struct hugetlb_cgroup *h_cg = NULL;
  3130		struct mem_cgroup *memcg;
  3131		bool deferred_reserve;
  3132		gfp_t gfp = htlb_alloc_mask(h) | __GFP_RETRY_MAYFAIL;
  3133		bool use_hstate_resv;
  3134	
  3135		memcg = get_mem_cgroup_from_current();
  3136		memcg_charge_ret = mem_cgroup_hugetlb_try_charge(memcg, gfp, nr_pages);
  3137		if (memcg_charge_ret == -ENOMEM) {
  3138			mem_cgroup_put(memcg);
  3139			return ERR_PTR(-ENOMEM);
  3140		}
  3141	
  3142		idx = hstate_index(h);
  3143		/*
  3144		 * Examine the region/reserve map to determine if the process
  3145		 * has a reservation for the page to be allocated.  A return
  3146		 * code of zero indicates a reservation exists (no change).
  3147		 */
  3148		map_chg = gbl_chg = vma_needs_reservation(h, vma, addr);
  3149		if (map_chg < 0) {
  3150			if (!memcg_charge_ret)
  3151				mem_cgroup_cancel_charge(memcg, nr_pages);
  3152			mem_cgroup_put(memcg);
  3153			return ERR_PTR(-ENOMEM);
  3154		}
  3155	
  3156		/*
  3157		 * Processes that did not create the mapping will have no
  3158		 * reserves as indicated by the region/reserve map. Check
  3159		 * that the allocation will not exceed the subpool limit.
  3160		 * Allocations for MAP_NORESERVE mappings also need to be
  3161		 * checked against any subpool limit.
  3162		 */
  3163		if (map_chg || avoid_reserve) {
  3164			gbl_chg = hugepage_subpool_get_pages(spool, 1);
  3165			if (gbl_chg < 0)
  3166				goto out_end_reservation;
  3167	
  3168		}
  3169	
  3170		/* If this allocation is not consuming a reservation, charge it now.
  3171		 */
  3172		deferred_reserve = map_chg || avoid_reserve;
  3173		if (deferred_reserve) {
  3174			ret = hugetlb_cgroup_charge_cgroup_rsvd(
  3175				idx, pages_per_huge_page(h), &h_cg);
  3176			if (ret)
  3177				goto out_subpool_put;
  3178		}
  3179	
  3180		ret = hugetlb_cgroup_charge_cgroup(idx, pages_per_huge_page(h), &h_cg);
  3181		if (ret)
  3182			goto out_uncharge_cgroup_reservation;
  3183	
  3184		use_hstate_resv = should_use_hstate_resv(vma, gbl_chg, avoid_reserve);
  3185	
  3186		spin_lock_irq(&hugetlb_lock);
  3187		folio = dequeue_hugetlb_folio_vma(h, vma, addr, use_hstate_resv);
  3188		if (!folio) {
  3189			struct mempolicy *mpol;
  3190			nodemask_t *nodemask;
  3191			pgoff_t ilx;
  3192			int nid;
  3193	
  3194			spin_unlock_irq(&hugetlb_lock);
  3195	
  3196			mpol = get_vma_policy(vma, addr, hstate_vma(vma)->order, &ilx);
> 3197			nid = policy_node_nodemask(mpol, htlb_alloc_mask(h), ilx, &nodemask);
  3198			folio = alloc_buddy_hugetlb_folio_from_node(h, mpol, nid, nodemask);
  3199			mpol_cond_put(mpol);
  3200	
  3201			if (!folio)
  3202				goto out_uncharge_cgroup;
  3203			spin_lock_irq(&hugetlb_lock);
  3204			if (use_hstate_resv) {
  3205				folio_set_hugetlb_restore_reserve(folio);
  3206				h->resv_huge_pages--;
  3207			}
  3208			list_add(&folio->lru, &h->hugepage_activelist);
  3209			folio_ref_unfreeze(folio, 1);
  3210			/* Fall through */
  3211		}
  3212	
  3213		hugetlb_cgroup_commit_charge(idx, pages_per_huge_page(h), h_cg, folio);
  3214		/* If allocation is not consuming a reservation, also store the
  3215		 * hugetlb_cgroup pointer on the page.
  3216		 */
  3217		if (deferred_reserve) {
  3218			hugetlb_cgroup_commit_charge_rsvd(idx, pages_per_huge_page(h),
  3219							  h_cg, folio);
  3220		}
  3221	
  3222		spin_unlock_irq(&hugetlb_lock);
  3223	
  3224		hugetlb_set_folio_subpool(folio, spool);
  3225	
  3226		map_commit = vma_commit_reservation(h, vma, addr);
  3227		if (unlikely(map_chg > map_commit)) {
  3228			/*
  3229			 * The page was added to the reservation map between
  3230			 * vma_needs_reservation and vma_commit_reservation.
  3231			 * This indicates a race with hugetlb_reserve_pages.
  3232			 * Adjust for the subpool count incremented above AND
  3233			 * in hugetlb_reserve_pages for the same page.  Also,
  3234			 * the reservation count added in hugetlb_reserve_pages
  3235			 * no longer applies.
  3236			 */
  3237			long rsv_adjust;
  3238	
  3239			rsv_adjust = hugepage_subpool_put_pages(spool, 1);
  3240			hugetlb_acct_memory(h, -rsv_adjust);
  3241			if (deferred_reserve) {
  3242				spin_lock_irq(&hugetlb_lock);
  3243				hugetlb_cgroup_uncharge_folio_rsvd(hstate_index(h),
  3244						pages_per_huge_page(h), folio);
  3245				spin_unlock_irq(&hugetlb_lock);
  3246			}
  3247		}
  3248	
  3249		if (!memcg_charge_ret)
  3250			mem_cgroup_commit_charge(folio, memcg);
  3251		mem_cgroup_put(memcg);
  3252	
  3253		return folio;
  3254	
  3255	out_uncharge_cgroup:
  3256		hugetlb_cgroup_uncharge_cgroup(idx, pages_per_huge_page(h), h_cg);
  3257	out_uncharge_cgroup_reservation:
  3258		if (deferred_reserve)
  3259			hugetlb_cgroup_uncharge_cgroup_rsvd(idx, pages_per_huge_page(h),
  3260							    h_cg);
  3261	out_subpool_put:
  3262		if (map_chg || avoid_reserve)
  3263			hugepage_subpool_put_pages(spool, 1);
  3264	out_end_reservation:
  3265		vma_end_reservation(h, vma, addr);
  3266		if (!memcg_charge_ret)
  3267			mem_cgroup_cancel_charge(memcg, nr_pages);
  3268		mem_cgroup_put(memcg);
  3269		return ERR_PTR(-ENOSPC);
  3270	}
  3271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
