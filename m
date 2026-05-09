Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349512DB79F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 19:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778355335; cv=none; b=LWD6cVeaOMU53X3PFwecuTjhUtsqgDOMTj8TlYR95ODIJAffT4Wdw3md3NZv8TRhITrI5XZg1duHdoTWKHilftl9OVEPScydvO+6lKvSFM/0FDhg//BAOKt0kGAU7poKcU0FLFdJwzyTOw+V7DVtIdlFRExEKgjXBklTGUQK4vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778355335; c=relaxed/simple;
	bh=FSxT03RyG0k/PfdoeouqeZso3rH6aMlXPnc2lr904oU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BlewUbH6k4hMa9nAoV9/Di/EwxD7+sb5u0DiSgmjkKKT+zggjidTegius7pHxZjr/6YEy0r7OZIhczwZTZdQVG5t+trg3qOxuNuUUADiiuMC61KblecPvShDFtWSRwE3aesDnsLc6zhZRULDeEgd8hwH/CWfBX/XE8KUkOfSjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRXXr28V; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRXXr28V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778355333; x=1809891333;
  h=date:from:to:cc:subject:message-id;
  bh=FSxT03RyG0k/PfdoeouqeZso3rH6aMlXPnc2lr904oU=;
  b=IRXXr28VwbH8EO+7ppmSXiXKhTGbrsVoSgDGJAVCCk7vXIvgdujOEYhS
   7DD3hfyxeqsvuCv+69J+V+4+Mg8+sUqgc3orUA1C6r/GUikUoz+pA6Ziq
   xTlg/yFOdh26o1Q+3NrXHtma0dd2H7tikMYdJvwPezjoIJ33se7j9jChk
   A0CSJ8AIua4mcQIPRkNBIfUjzlMMFnrya91Dide3PdQjWhGXnqbyEBTKo
   fQYcNnmFIvEvJTXJcyoB9ew4vKGku8VD2pICyWU98y+ZUlLcZF+Mgwu3r
   B2+P5NoJkmhW+Qkfr688Pym29YHbKfVxGLf/JyRGRMNRJyrh31MKE80ha
   Q==;
X-CSE-ConnectionGUID: sfVvh8SwRK6TcLY3pgjCrw==
X-CSE-MsgGUID: KrRlfh5OTSy9CA2cx9kZPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79289616"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79289616"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 12:35:33 -0700
X-CSE-ConnectionGUID: M/iUUNuPSlmXy25VYiCSBA==
X-CSE-MsgGUID: WmCTIbbST9Seb/M0SavMbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="241056656"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2026 12:35:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLnST-000000007XJ-021q;
	Sat, 09 May 2026 19:35:29 +0000
Date: Sat, 09 May 2026 21:34:54 +0200
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/hugetlb.c:2940:18: warning: variable 'idx' set but not
 used
Message-ID: <202605092114.EcooQ4rc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ackerley,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Ackerley-Tng-via-B4-Relay/mm-hugetlb-Consolidate-interpretation-of-gbl_chg-within-alloc_hugetlb_folio/20260509-122934
head:   e06df2148681c917bccd7accb682f4facd3f9f97
commit: e06df2148681c917bccd7accb682f4facd3f9f97 mm: hugetlb: Refactor out hugetlb_alloc_folio()
date:   15 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260509/202605092114.EcooQ4rc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092114.EcooQ4rc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605092114.EcooQ4rc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c: In function 'alloc_hugetlb_folio':
>> mm/hugetlb.c:2940:18: warning: variable 'idx' set but not used [-Wunused-but-set-variable]
    2940 |         int ret, idx;
         |                  ^~~


vim +/idx +2940 mm/hugetlb.c

923682a0dd5706 Peter Xu         2025-01-07  2924  
30cef82bc6e897 Peter Xu         2025-01-07  2925  /*
30cef82bc6e897 Peter Xu         2025-01-07  2926   * NOTE! "cow_from_owner" represents a very hacky usage only used in CoW
30cef82bc6e897 Peter Xu         2025-01-07  2927   * faults of hugetlb private mappings on top of a non-page-cache folio (in
30cef82bc6e897 Peter Xu         2025-01-07  2928   * which case even if there's a private vma resv map it won't cover such
30cef82bc6e897 Peter Xu         2025-01-07  2929   * allocation).  New call sites should (probably) never set it to true!!
30cef82bc6e897 Peter Xu         2025-01-07  2930   * When it's set, the allocation will bypass all vma level reservations.
30cef82bc6e897 Peter Xu         2025-01-07  2931   */
d0ce0e47b323a8 Sidhartha Kumar  2023-01-25  2932  struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
30cef82bc6e897 Peter Xu         2025-01-07  2933  				    unsigned long addr, bool cow_from_owner)
^1da177e4c3f41 Linus Torvalds   2005-04-16  2934  {
90481622d75715 David Gibson     2012-03-21  2935  	struct hugepage_subpool *spool = subpool_vma(vma);
a5516438959d90 Andi Kleen       2008-07-23  2936  	struct hstate *h = hstate_vma(vma);
d4ab0316cc33ae Sidhartha Kumar  2022-11-01  2937  	struct folio *folio;
a833a693a490ec Wupeng Ma        2025-04-10  2938  	long retval, gbl_chg, gbl_reserve;
923682a0dd5706 Peter Xu         2025-01-07  2939  	map_chg_state map_chg;
991135774c0e05 Joshua Hahn      2024-12-11 @2940  	int ret, idx;
1b026ebc6ec559 Ackerley Tng     2026-05-06  2941  	gfp_t gfp = htlb_alloc_mask(h);
ed3c29aeaf2a9b Ackerley Tng     2026-05-06  2942  	struct mempolicy *mpol;
ed3c29aeaf2a9b Ackerley Tng     2026-05-06  2943  	nodemask_t *nodemask;
ed3c29aeaf2a9b Ackerley Tng     2026-05-06  2944  	int nid;
e06df2148681c9 Ackerley Tng     2026-05-06  2945  	bool charge_hugetlb_cgroup_rsvd;
e06df2148681c9 Ackerley Tng     2026-05-06  2946  	bool global_reservation_exists;
8cba9576df601c Nhat Pham        2023-10-06  2947  
6d76dcf4040514 Aneesh Kumar K.V 2012-07-31  2948  	idx = hstate_index(h);
923682a0dd5706 Peter Xu         2025-01-07  2949  
923682a0dd5706 Peter Xu         2025-01-07  2950  	/* Whether we need a separate per-vma reservation? */
923682a0dd5706 Peter Xu         2025-01-07  2951  	if (cow_from_owner) {
923682a0dd5706 Peter Xu         2025-01-07  2952  		/*
923682a0dd5706 Peter Xu         2025-01-07  2953  		 * Special case!  Since it's a CoW on top of a reserved
923682a0dd5706 Peter Xu         2025-01-07  2954  		 * page, the private resv map doesn't count.  So it cannot
923682a0dd5706 Peter Xu         2025-01-07  2955  		 * consume the per-vma resv map even if it's reserved.
923682a0dd5706 Peter Xu         2025-01-07  2956  		 */
923682a0dd5706 Peter Xu         2025-01-07  2957  		map_chg = MAP_CHG_ENFORCED;
923682a0dd5706 Peter Xu         2025-01-07  2958  	} else {
a1e78772d72b26 Mel Gorman       2008-07-23  2959  		/*
d85f69b0b533ec Mike Kravetz     2015-09-08  2960  		 * Examine the region/reserve map to determine if the process
d85f69b0b533ec Mike Kravetz     2015-09-08  2961  		 * has a reservation for the page to be allocated.  A return
d85f69b0b533ec Mike Kravetz     2015-09-08  2962  		 * code of zero indicates a reservation exists (no change).
a1e78772d72b26 Mel Gorman       2008-07-23  2963  		 */
923682a0dd5706 Peter Xu         2025-01-07  2964  		retval = vma_needs_reservation(h, vma, addr);
923682a0dd5706 Peter Xu         2025-01-07  2965  		if (retval < 0)
76dcee75c1aff6 Aneesh Kumar K.V 2012-07-31  2966  			return ERR_PTR(-ENOMEM);
923682a0dd5706 Peter Xu         2025-01-07  2967  		map_chg = retval ? MAP_CHG_NEEDED : MAP_CHG_REUSE;
923682a0dd5706 Peter Xu         2025-01-07  2968  	}
d85f69b0b533ec Mike Kravetz     2015-09-08  2969  
d85f69b0b533ec Mike Kravetz     2015-09-08  2970  	/*
923682a0dd5706 Peter Xu         2025-01-07  2971  	 * Whether we need a separate global reservation?
923682a0dd5706 Peter Xu         2025-01-07  2972  	 *
d85f69b0b533ec Mike Kravetz     2015-09-08  2973  	 * Processes that did not create the mapping will have no
d85f69b0b533ec Mike Kravetz     2015-09-08  2974  	 * reserves as indicated by the region/reserve map. Check
d85f69b0b533ec Mike Kravetz     2015-09-08  2975  	 * that the allocation will not exceed the subpool limit.
923682a0dd5706 Peter Xu         2025-01-07  2976  	 * Or if it can get one from the pool reservation directly.
d85f69b0b533ec Mike Kravetz     2015-09-08  2977  	 */
923682a0dd5706 Peter Xu         2025-01-07  2978  	if (map_chg) {
d85f69b0b533ec Mike Kravetz     2015-09-08  2979  		gbl_chg = hugepage_subpool_get_pages(spool, 1);
a5e7a679002987 Ackerley Tng     2026-05-06  2980  		if (gbl_chg < 0) {
a5e7a679002987 Ackerley Tng     2026-05-06  2981  			ret = -ENOSPC;
8cba9576df601c Nhat Pham        2023-10-06  2982  			goto out_end_reservation;
a5e7a679002987 Ackerley Tng     2026-05-06  2983  		}
923682a0dd5706 Peter Xu         2025-01-07  2984  	} else {
923682a0dd5706 Peter Xu         2025-01-07  2985  		/*
923682a0dd5706 Peter Xu         2025-01-07  2986  		 * If we have the vma reservation ready, no need for extra
923682a0dd5706 Peter Xu         2025-01-07  2987  		 * global reservation.
923682a0dd5706 Peter Xu         2025-01-07  2988  		 */
923682a0dd5706 Peter Xu         2025-01-07  2989  		gbl_chg = 0;
d85f69b0b533ec Mike Kravetz     2015-09-08  2990  	}
d85f69b0b533ec Mike Kravetz     2015-09-08  2991  
923682a0dd5706 Peter Xu         2025-01-07  2992  	/*
e06df2148681c9 Ackerley Tng     2026-05-06  2993  	 * If allocation doesn't reuse a reservation in the resv_map,
e06df2148681c9 Ackerley Tng     2026-05-06  2994  	 * charge for the reservation.
08cf9faf755802 Mina Almasry     2020-04-01  2995  	 */
e06df2148681c9 Ackerley Tng     2026-05-06  2996  	charge_hugetlb_cgroup_rsvd = map_chg != MAP_CHG_REUSE;
08cf9faf755802 Mina Almasry     2020-04-01  2997  
e06df2148681c9 Ackerley Tng     2026-05-06  2998  	/*
e06df2148681c9 Ackerley Tng     2026-05-06  2999  	 * gbl_chg == 0 indicates a reservation exists for this
e06df2148681c9 Ackerley Tng     2026-05-06  3000  	 * allocation, so try to use it.
e06df2148681c9 Ackerley Tng     2026-05-06  3001  	 */
e06df2148681c9 Ackerley Tng     2026-05-06  3002  	global_reservation_exists = gbl_chg == 0;
627803cefe310c Ackerley Tng     2026-05-06  3003  
ed3c29aeaf2a9b Ackerley Tng     2026-05-06  3004  	/* Takes reference on mpol. */
ed3c29aeaf2a9b Ackerley Tng     2026-05-06  3005  	nid = huge_node(vma, addr, gfp, &mpol, &nodemask);
ed3c29aeaf2a9b Ackerley Tng     2026-05-06  3006  
e06df2148681c9 Ackerley Tng     2026-05-06  3007  	folio = hugetlb_alloc_folio(h, spool, mpol, nid, nodemask,
e06df2148681c9 Ackerley Tng     2026-05-06  3008  				    charge_hugetlb_cgroup_rsvd,
e06df2148681c9 Ackerley Tng     2026-05-06  3009  				    global_reservation_exists);
ff7d853b031302 Sidhartha Kumar  2023-01-13  3010  
ed3c29aeaf2a9b Ackerley Tng     2026-05-06  3011  	mpol_cond_put(mpol);
ed3c29aeaf2a9b Ackerley Tng     2026-05-06  3012  
e06df2148681c9 Ackerley Tng     2026-05-06  3013  	if (IS_ERR(folio)) {
e06df2148681c9 Ackerley Tng     2026-05-06  3014  		ret = PTR_ERR(folio);
4efd224672c910 Ackerley Tng     2026-05-06  3015  		goto out_subpool_put;
4efd224672c910 Ackerley Tng     2026-05-06  3016  	}
4efd224672c910 Ackerley Tng     2026-05-06  3017  
ff7d853b031302 Sidhartha Kumar  2023-01-13  3018  	hugetlb_set_folio_subpool(folio, spool);
a1e78772d72b26 Mel Gorman       2008-07-23  3019  
923682a0dd5706 Peter Xu         2025-01-07  3020  	if (map_chg != MAP_CHG_ENFORCED) {
923682a0dd5706 Peter Xu         2025-01-07  3021  		/* commit() is only needed if the map_chg is not enforced */
923682a0dd5706 Peter Xu         2025-01-07  3022  		retval = vma_commit_reservation(h, vma, addr);
33039678c8da81 Mike Kravetz     2015-06-24  3023  		/*
923682a0dd5706 Peter Xu         2025-01-07  3024  		 * Check for possible race conditions. When it happens..
33039678c8da81 Mike Kravetz     2015-06-24  3025  		 * The page was added to the reservation map between
33039678c8da81 Mike Kravetz     2015-06-24  3026  		 * vma_needs_reservation and vma_commit_reservation.
33039678c8da81 Mike Kravetz     2015-06-24  3027  		 * This indicates a race with hugetlb_reserve_pages.
33039678c8da81 Mike Kravetz     2015-06-24  3028  		 * Adjust for the subpool count incremented above AND
33039678c8da81 Mike Kravetz     2015-06-24  3029  		 * in hugetlb_reserve_pages for the same page.	Also,
33039678c8da81 Mike Kravetz     2015-06-24  3030  		 * the reservation count added in hugetlb_reserve_pages
33039678c8da81 Mike Kravetz     2015-06-24  3031  		 * no longer applies.
33039678c8da81 Mike Kravetz     2015-06-24  3032  		 */
923682a0dd5706 Peter Xu         2025-01-07  3033  		if (unlikely(map_chg == MAP_CHG_NEEDED && retval == 0)) {
33039678c8da81 Mike Kravetz     2015-06-24  3034  			long rsv_adjust;
33039678c8da81 Mike Kravetz     2015-06-24  3035  
33039678c8da81 Mike Kravetz     2015-06-24  3036  			rsv_adjust = hugepage_subpool_put_pages(spool, 1);
33039678c8da81 Mike Kravetz     2015-06-24  3037  			hugetlb_acct_memory(h, -rsv_adjust);
b76b46902c2d03 Peter Xu         2024-04-17  3038  			spin_lock_irq(&hugetlb_lock);
923682a0dd5706 Peter Xu         2025-01-07  3039  			hugetlb_cgroup_uncharge_folio_rsvd(
a1c655f5544415 Joshua Hahn      2026-01-16  3040  			    hstate_index(h), pages_per_huge_page(h), folio);
b76b46902c2d03 Peter Xu         2024-04-17  3041  			spin_unlock_irq(&hugetlb_lock);
b76b46902c2d03 Peter Xu         2024-04-17  3042  		}
33039678c8da81 Mike Kravetz     2015-06-24  3043  	}
8cba9576df601c Nhat Pham        2023-10-06  3044  
d0ce0e47b323a8 Sidhartha Kumar  2023-01-25  3045  	return folio;
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3046  
8f34af6f93aee8 Jianyu Zhan      2014-06-04  3047  out_subpool_put:
a833a693a490ec Wupeng Ma        2025-04-10  3048  	/*
a833a693a490ec Wupeng Ma        2025-04-10  3049  	 * put page to subpool iff the quota of subpool's rsv_hpages is used
a833a693a490ec Wupeng Ma        2025-04-10  3050  	 * during hugepage_subpool_get_pages.
a833a693a490ec Wupeng Ma        2025-04-10  3051  	 */
a833a693a490ec Wupeng Ma        2025-04-10  3052  	if (map_chg && !gbl_chg) {
a833a693a490ec Wupeng Ma        2025-04-10  3053  		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
a833a693a490ec Wupeng Ma        2025-04-10  3054  		hugetlb_acct_memory(h, -gbl_reserve);
a833a693a490ec Wupeng Ma        2025-04-10  3055  	}
a833a693a490ec Wupeng Ma        2025-04-10  3056  
8cba9576df601c Nhat Pham        2023-10-06  3057  out_end_reservation:
923682a0dd5706 Peter Xu         2025-01-07  3058  	if (map_chg != MAP_CHG_ENFORCED)
feba16e25a5780 Mike Kravetz     2015-09-08  3059  		vma_end_reservation(h, vma, addr);
a5e7a679002987 Ackerley Tng     2026-05-06  3060  	return ERR_PTR(ret);
^1da177e4c3f41 Linus Torvalds   2005-04-16  3061  }
b45b5bd65f668a David Gibson     2006-03-22  3062  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
