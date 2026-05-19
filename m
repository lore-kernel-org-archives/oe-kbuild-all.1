Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8F748C8DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193519; cv=none; b=AzehFuqwk3KdR8nsuJzMatY9NyW+1r/OFh5B9Ie1zoUUZ2gvQGIDBNeXXHw24xmiEygUkWNXnrpc1RoNIgswKmLQQe/VPNIr2eCNdKKOZIV0KJXoOX5A1h+3CLfQVoD0d7oUodVarNvkfHz7lZ0BKAJQA6XkTMg3nClcq57dtXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193519; c=relaxed/simple;
	bh=tqi23VdcmDkZJus0clAvMo8RFNJD4V+od/sRwMJnCEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IBVqPUFpa/uXkDCtbk4aCBdHIXdOP+0FiqvKKPVnhn+4bSzxomsClpLSYN7vdOPI+OJ4S5s5U92viM1/orS2LABhh6rBM1ognXHP3/wYF7w1qOaXnfFcN1QPTlU69PuGzOnj0QsMUnmFAXq//SfaZaAIbK2nr9Fxca67HDZ/+5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y85iNzTz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y85iNzTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779193518; x=1810729518;
  h=date:from:to:cc:subject:message-id;
  bh=tqi23VdcmDkZJus0clAvMo8RFNJD4V+od/sRwMJnCEU=;
  b=Y85iNzTzL/LwzKJjknARyi7tRQDGoxWwqZwgS6+Uew0+mgw9l7V16lO5
   1Qu2Jfd/cxia7tRbWqdFvSpHXSU+Duq980x2S08oEN9iuCkQkjWY+A5J0
   fMRnNzhF+jAXkN1uiDnFCeH9zR0dBgph8jiWbVIi1Cd6SNvldXRaPu2SW
   AE62h0WDJEOlc1flz1z2Uon+kZZ8p7qjbwsZAfd0987VCJeGWRhccA8V2
   JRsWgkuZlW92t6Hdj5niYN0p8Szs84wnmu+6//uIGrJm11zyvpIUi8pJH
   Z0uAf0hSMQ66mUVFgz3Dhgw0Z6HJdCB+M0TKmUyTwi5FSwPi6goq1uIEI
   Q==;
X-CSE-ConnectionGUID: VpeZ1b1SQpSKh3X/mimE0A==
X-CSE-MsgGUID: 5rq4r9tfR36UDgCU8qQG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80120117"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80120117"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:25:18 -0700
X-CSE-ConnectionGUID: 5Vod9CdHS+SGgVJyQ6f68g==
X-CSE-MsgGUID: JOYwVkJuR06WTx4OC8jy6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277862374"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2026 05:25:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPJVa-00000000ACH-0nFk;
	Tue, 19 May 2026 12:25:14 +0000
Date: Tue, 19 May 2026 14:24:30 +0200
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 James Houghton <jthoughton@google.com>
Subject: mm/hugetlb.c:2955:37: error: 'struct mempolicy' has no
 member named 'mode'
Message-ID: <202605191453.7J1fSR1n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ackerley,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Ackerley-Tng-via-B4-Relay/mm-hugetlb-Consolidate-interpretation-of-gbl_chg-within-alloc_hugetlb_folio/20260519-105032
head:   2d804a8eb4584a7eb2d84e12b6ea36a31142421d
commit: 3eccf508aa46cbf1377d4a926fe5076da780173c mm: hugetlb: Move mpol interpretation out of alloc_buddy_hugetlb_folio_with_mpol()
date:   9 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260519/202605191453.7J1fSR1n-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191453.7J1fSR1n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191453.7J1fSR1n-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb.c: In function 'alloc_hugetlb_folio':
>> mm/hugetlb.c:2955:37: error: 'struct mempolicy' has no member named 'mode'
    2955 |                         .mode = mpol->mode,
         |                                     ^~


vim +2955 mm/hugetlb.c

  2856	
  2857	/*
  2858	 * NOTE! "cow_from_owner" represents a very hacky usage only used in CoW
  2859	 * faults of hugetlb private mappings on top of a non-page-cache folio (in
  2860	 * which case even if there's a private vma resv map it won't cover such
  2861	 * allocation).  New call sites should (probably) never set it to true!!
  2862	 * When it's set, the allocation will bypass all vma level reservations.
  2863	 */
  2864	struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
  2865					    unsigned long addr, bool cow_from_owner)
  2866	{
  2867		struct hugepage_subpool *spool = subpool_vma(vma);
  2868		struct hstate *h = hstate_vma(vma);
  2869		struct folio *folio;
  2870		long retval, gbl_chg, gbl_reserve;
  2871		map_chg_state map_chg;
  2872		int ret, idx;
  2873		struct hugetlb_cgroup *h_cg = NULL;
  2874		gfp_t gfp = htlb_alloc_mask(h);
  2875	
  2876		idx = hstate_index(h);
  2877	
  2878		/* Whether we need a separate per-vma reservation? */
  2879		if (cow_from_owner) {
  2880			/*
  2881			 * Special case!  Since it's a CoW on top of a reserved
  2882			 * page, the private resv map doesn't count.  So it cannot
  2883			 * consume the per-vma resv map even if it's reserved.
  2884			 */
  2885			map_chg = MAP_CHG_ENFORCED;
  2886		} else {
  2887			/*
  2888			 * Examine the region/reserve map to determine if the process
  2889			 * has a reservation for the page to be allocated.  A return
  2890			 * code of zero indicates a reservation exists (no change).
  2891			 */
  2892			retval = vma_needs_reservation(h, vma, addr);
  2893			if (retval < 0)
  2894				return ERR_PTR(-ENOMEM);
  2895			map_chg = retval ? MAP_CHG_NEEDED : MAP_CHG_REUSE;
  2896		}
  2897	
  2898		/*
  2899		 * Whether we need a separate global reservation?
  2900		 *
  2901		 * Processes that did not create the mapping will have no
  2902		 * reserves as indicated by the region/reserve map. Check
  2903		 * that the allocation will not exceed the subpool limit.
  2904		 * Or if it can get one from the pool reservation directly.
  2905		 */
  2906		if (map_chg) {
  2907			gbl_chg = hugepage_subpool_get_pages(spool, 1);
  2908			if (gbl_chg < 0)
  2909				goto out_end_reservation;
  2910		} else {
  2911			/*
  2912			 * If we have the vma reservation ready, no need for extra
  2913			 * global reservation.
  2914			 */
  2915			gbl_chg = 0;
  2916		}
  2917	
  2918		/*
  2919		 * If this allocation is not consuming a per-vma reservation,
  2920		 * charge the hugetlb cgroup now.
  2921		 */
  2922		if (map_chg) {
  2923			ret = hugetlb_cgroup_charge_cgroup_rsvd(
  2924				idx, pages_per_huge_page(h), &h_cg);
  2925			if (ret)
  2926				goto out_subpool_put;
  2927		}
  2928	
  2929		ret = hugetlb_cgroup_charge_cgroup(idx, pages_per_huge_page(h), &h_cg);
  2930		if (ret)
  2931			goto out_uncharge_cgroup_reservation;
  2932	
  2933		spin_lock_irq(&hugetlb_lock);
  2934	
  2935		/*
  2936		 * gbl_chg == 0 indicates a reservation exists for the
  2937		 * allocation, so try dequeuing a page. In case there was no
  2938		 * reservation, try dequeuing a page if there are available
  2939		 * pages in the global pool.
  2940		 */
  2941		folio = NULL;
  2942		if (!gbl_chg || available_huge_pages(h))
  2943			folio = dequeue_hugetlb_folio_vma(h, vma, addr);
  2944	
  2945		if (!folio) {
  2946			struct mempolicy_interpreted mpoli;
  2947			struct mempolicy *mpol;
  2948			nodemask_t *nodemask;
  2949			int nid;
  2950	
  2951			spin_unlock_irq(&hugetlb_lock);
  2952			nid = huge_node(vma, addr, gfp, &mpol, &nodemask);
  2953			mpoli = (struct mempolicy_interpreted){
  2954				.nid = nid,
> 2955				.mode = mpol->mode,
  2956				.nodemask = nodemask,
  2957			};
  2958			folio = alloc_buddy_hugetlb_folio(h, gfp, &mpoli);
  2959			mpol_cond_put(mpol);
  2960			if (!folio)
  2961				goto out_uncharge_cgroup;
  2962			spin_lock_irq(&hugetlb_lock);
  2963			list_add(&folio->lru, &h->hugepage_activelist);
  2964			folio_ref_unfreeze(folio, 1);
  2965			/* Fall through */
  2966		}
  2967	
  2968		/*
  2969		 * Either dequeued or buddy-allocated folio needs to add special
  2970		 * mark to the folio when it consumes a global reservation.
  2971		 */
  2972		if (!gbl_chg) {
  2973			folio_set_hugetlb_restore_reserve(folio);
  2974			h->resv_huge_pages--;
  2975		}
  2976	
  2977		hugetlb_cgroup_commit_charge(idx, pages_per_huge_page(h), h_cg, folio);
  2978		/* If allocation is not consuming a reservation, also store the
  2979		 * hugetlb_cgroup pointer on the page.
  2980		 */
  2981		if (map_chg) {
  2982			hugetlb_cgroup_commit_charge_rsvd(idx, pages_per_huge_page(h),
  2983							  h_cg, folio);
  2984		}
  2985	
  2986		spin_unlock_irq(&hugetlb_lock);
  2987	
  2988		hugetlb_set_folio_subpool(folio, spool);
  2989	
  2990		if (map_chg != MAP_CHG_ENFORCED) {
  2991			/* commit() is only needed if the map_chg is not enforced */
  2992			retval = vma_commit_reservation(h, vma, addr);
  2993			/*
  2994			 * Check for possible race conditions. When it happens..
  2995			 * The page was added to the reservation map between
  2996			 * vma_needs_reservation and vma_commit_reservation.
  2997			 * This indicates a race with hugetlb_reserve_pages.
  2998			 * Adjust for the subpool count incremented above AND
  2999			 * in hugetlb_reserve_pages for the same page.	Also,
  3000			 * the reservation count added in hugetlb_reserve_pages
  3001			 * no longer applies.
  3002			 */
  3003			if (unlikely(map_chg == MAP_CHG_NEEDED && retval == 0)) {
  3004				long rsv_adjust;
  3005	
  3006				rsv_adjust = hugepage_subpool_put_pages(spool, 1);
  3007				hugetlb_acct_memory(h, -rsv_adjust);
  3008				spin_lock_irq(&hugetlb_lock);
  3009				hugetlb_cgroup_uncharge_folio_rsvd(
  3010				    hstate_index(h), pages_per_huge_page(h), folio);
  3011				spin_unlock_irq(&hugetlb_lock);
  3012			}
  3013		}
  3014	
  3015		ret = mem_cgroup_charge_hugetlb(folio, gfp | __GFP_RETRY_MAYFAIL);
  3016		/*
  3017		 * Unconditionally increment NR_HUGETLB here. If it turns out that
  3018		 * mem_cgroup_charge_hugetlb failed, then immediately free the page and
  3019		 * decrement NR_HUGETLB.
  3020		 */
  3021		lruvec_stat_mod_folio(folio, NR_HUGETLB, pages_per_huge_page(h));
  3022	
  3023		if (ret == -ENOMEM) {
  3024			free_huge_folio(folio);
  3025			return ERR_PTR(-ENOMEM);
  3026		}
  3027	
  3028		return folio;
  3029	
  3030	out_uncharge_cgroup:
  3031		hugetlb_cgroup_uncharge_cgroup(idx, pages_per_huge_page(h), h_cg);
  3032	out_uncharge_cgroup_reservation:
  3033		if (map_chg)
  3034			hugetlb_cgroup_uncharge_cgroup_rsvd(idx, pages_per_huge_page(h),
  3035							    h_cg);
  3036	out_subpool_put:
  3037		/*
  3038		 * put page to subpool iff the quota of subpool's rsv_hpages is used
  3039		 * during hugepage_subpool_get_pages.
  3040		 */
  3041		if (map_chg && !gbl_chg) {
  3042			gbl_reserve = hugepage_subpool_put_pages(spool, 1);
  3043			hugetlb_acct_memory(h, -gbl_reserve);
  3044		}
  3045	
  3046	
  3047	out_end_reservation:
  3048		if (map_chg != MAP_CHG_ENFORCED)
  3049			vma_end_reservation(h, vma, addr);
  3050		return ERR_PTR(-ENOSPC);
  3051	}
  3052	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
