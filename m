Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC4834D389
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783159346; cv=none; b=jGxjEK6Jn5z7NKhDKGVNuNwtFnidnKQ5qcarmNImCTIz6f3NK/BtkD6MrMI66JesVlE7ezQFGQNy9N7aATGgvpWqF6/PHuxZroHuwzzZ3rrUHxp92c6nf7YIhQubaybZ115nAyWM8wjsRvJ75Jhsdh8WE8sA1u5iqafzGlr+mqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783159346; c=relaxed/simple;
	bh=pEM1V6jU6NJvjTpsF36hdwkpUV9ZyDsumDbu3Jsa6ys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dbZ4+ViMtX4DX4uG9+99xrybyjCFH+Shbv7Yxq7tR1JsgJ/FAZ8uNwE1TSzG04J+wTwqNNt8URMe3lwkGiTu1lqh9smxVJZqcWO639IDueVzFD8cZZVpDo3h0+liQ4W0x6Y2I52vIExHjJjGRF/WyYeg2PDAMCoXHz2ON9SpX8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dm/k4aPC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dm/k4aPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783159344; x=1814695344;
  h=date:from:to:cc:subject:message-id;
  bh=pEM1V6jU6NJvjTpsF36hdwkpUV9ZyDsumDbu3Jsa6ys=;
  b=dm/k4aPCjKy9W8w/+X4mA32vRT55fvxyLeCVPRAJnmUKXQuz/U2/bi+Y
   huss1o27ZiFCDghtGfdRpb+U8g4T7dlIk7onQgt5wDXAPOQWP1VB5sYmF
   +Tcn7Km6TvA0rCBZFQXmT+4xiRgDLkXXwdVaIGnBAStWUfv6hN6ZPJxoX
   FzBLHYnlYdRoIKzUNNl/yI5XNDOfyP8cK81YrqMjsjy+WMq7+hTiY2Rth
   tohdgh/vSeIVdw3euYZXa5hxdZob7yxdIazSumdyChr4I7/kxOXrd29wM
   vB8H9KshCFMnZpPSIdpij0/Rhe1XaHdp/oR7h5Qapn2FCKh5WC01iSy+y
   g==;
X-CSE-ConnectionGUID: WcdT+PuuSdm4loIErm26qw==
X-CSE-MsgGUID: lOLnJ3LVRnutPdyB1ohE1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87558806"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="87558806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 03:02:23 -0700
X-CSE-ConnectionGUID: 2z5fSHyvRiOKiZTb6CT4lg==
X-CSE-MsgGUID: g7Q7XAkhSSq4Ql/w8lO5KA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jul 2026 03:02:21 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfxCS-000000001j6-3dvL;
	Sat, 04 Jul 2026 10:02:16 +0000
Date: Sat, 04 Jul 2026 12:01:31 +0200
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/huge_memory.c:2921:45: error: storage size of
 'cache_state' isn't known
Message-ID: <202607041106.x6QeyX5W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-add-PMD-swap-entry-detection-support/20260704-014151
head:   370b8609c174cc4dd5de5ae0b80f00344ace145c
commit: 039b71991e13295c082f0758829fb422e766264a mm: handle PMD swap entries in UFFDIO_MOVE
date:   16 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260704/202607041106.x6QeyX5W-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041106.x6QeyX5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041106.x6QeyX5W-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/huge_memory.c: In function 'move_pages_huge_pmd':
>> mm/huge_memory.c:2921:45: error: storage size of 'cache_state' isn't known
    2921 |                         enum swap_pmd_cache cache_state;
         |                                             ^~~~~~~~~~~
>> mm/huge_memory.c:2941:39: error: implicit declaration of function 'swap_pmd_cache_lookup' [-Wimplicit-function-declaration]
    2941 |                         cache_state = swap_pmd_cache_lookup(entry, &src_folio);
         |                                       ^~~~~~~~~~~~~~~~~~~~~
>> mm/huge_memory.c:2942:44: error: 'SWAP_PMD_CACHE_SPLIT' undeclared (first use in this function)
    2942 |                         if (cache_state == SWAP_PMD_CACHE_SPLIT) {
         |                                            ^~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:2942:44: note: each undeclared identifier is reported only once for each function it appears in
>> mm/huge_memory.c:2921:45: warning: unused variable 'cache_state' [-Wunused-variable]
    2921 |                         enum swap_pmd_cache cache_state;
         |                                             ^~~~~~~~~~~


vim +2921 mm/huge_memory.c

  2878	
  2879	/*
  2880	 * The PT lock for src_pmd and dst_vma/src_vma (for reading) are locked by
  2881	 * the caller, but it must return after releasing the page_table_lock.
  2882	 * Just move the page from src_pmd to dst_pmd if possible.
  2883	 * Return zero if succeeded in moving the page, -EAGAIN if it needs to be
  2884	 * repeated by the caller, or other errors in case of failure.
  2885	 */
  2886	int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pmd_t dst_pmdval,
  2887				struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
  2888				unsigned long dst_addr, unsigned long src_addr)
  2889	{
  2890		pmd_t _dst_pmd, src_pmdval;
  2891		struct page *src_page;
  2892		struct folio *src_folio;
  2893		spinlock_t *src_ptl, *dst_ptl;
  2894		pgtable_t src_pgtable;
  2895		struct mmu_notifier_range range;
  2896		int err = 0;
  2897	
  2898		src_pmdval = *src_pmd;
  2899		src_ptl = pmd_lockptr(mm, src_pmd);
  2900	
  2901		lockdep_assert_held(src_ptl);
  2902		vma_assert_locked(src_vma);
  2903		vma_assert_locked(dst_vma);
  2904	
  2905		/* Sanity checks before the operation */
  2906		if (WARN_ON_ONCE(!pmd_none(dst_pmdval)) || WARN_ON_ONCE(src_addr & ~HPAGE_PMD_MASK) ||
  2907		    WARN_ON_ONCE(dst_addr & ~HPAGE_PMD_MASK)) {
  2908			spin_unlock(src_ptl);
  2909			return -EINVAL;
  2910		}
  2911	
  2912		if (!pmd_trans_huge(src_pmdval)) {
  2913			if (pmd_is_migration_entry(src_pmdval)) {
  2914				spin_unlock(src_ptl);
  2915				pmd_migration_entry_wait(mm, &src_pmdval);
  2916				return -EAGAIN;
  2917			}
  2918			if (pmd_is_swap_entry(src_pmdval)) {
  2919				swp_entry_t entry;
  2920				struct swap_info_struct *si;
> 2921				enum swap_pmd_cache cache_state;
  2922	
  2923				/*
  2924				 * UFFDIO_MOVE on anon mappings requires single-owner
  2925				 * semantics; refuse to move a shared swap entry.
  2926				 */
  2927				if (!pmd_swp_exclusive(src_pmdval)) {
  2928					spin_unlock(src_ptl);
  2929					return -EBUSY;
  2930				}
  2931	
  2932				entry = softleaf_from_pmd(src_pmdval);
  2933				spin_unlock(src_ptl);
  2934	
  2935				/* Pin the swap device against a racing swapoff. */
  2936				si = get_swap_device(entry);
  2937				if (unlikely(!si))
  2938					return -EAGAIN;
  2939	
  2940				src_folio = NULL;
> 2941				cache_state = swap_pmd_cache_lookup(entry, &src_folio);
> 2942				if (cache_state == SWAP_PMD_CACHE_SPLIT) {
  2943					put_swap_device(si);
  2944					__split_huge_pmd(src_vma, src_pmd, src_addr, false);
  2945					return -EAGAIN;
  2946				}
  2947	
  2948				mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0,
  2949							mm, src_addr,
  2950							src_addr + HPAGE_PMD_SIZE);
  2951				mmu_notifier_invalidate_range_start(&range);
  2952	
  2953				if (src_folio) {
  2954					folio_lock(src_folio);
  2955					if (!folio_matches_swap_entry(src_folio, entry) ||
  2956					    folio_nr_pages(src_folio) != HPAGE_PMD_NR) {
  2957						err = -EAGAIN;
  2958						folio_unlock(src_folio);
  2959						folio_put(src_folio);
  2960						mmu_notifier_invalidate_range_end(&range);
  2961						put_swap_device(si);
  2962						__split_huge_pmd(src_vma, src_pmd,
  2963								 src_addr, false);
  2964						return err;
  2965					}
  2966				}
  2967	
  2968				dst_ptl = pmd_lockptr(mm, dst_pmd);
  2969				err = move_swap_pmd(mm, dst_vma, dst_addr, src_addr,
  2970						    dst_pmd, src_pmd, dst_pmdval,
  2971						    src_pmdval, dst_ptl, src_ptl,
  2972						    src_folio, entry);
  2973	
  2974				mmu_notifier_invalidate_range_end(&range);
  2975				if (src_folio) {
  2976					folio_unlock(src_folio);
  2977					folio_put(src_folio);
  2978				}
  2979				put_swap_device(si);
  2980				return err;
  2981			}
  2982			spin_unlock(src_ptl);
  2983			return -ENOENT;
  2984		}
  2985	
  2986		src_page = pmd_page(src_pmdval);
  2987	
  2988		if (!is_huge_zero_pmd(src_pmdval)) {
  2989			if (unlikely(!PageAnonExclusive(src_page))) {
  2990				spin_unlock(src_ptl);
  2991				return -EBUSY;
  2992			}
  2993	
  2994			src_folio = page_folio(src_page);
  2995			folio_get(src_folio);
  2996		} else
  2997			src_folio = NULL;
  2998	
  2999		spin_unlock(src_ptl);
  3000	
  3001		flush_cache_range(src_vma, src_addr, src_addr + HPAGE_PMD_SIZE);
  3002		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, src_addr,
  3003					src_addr + HPAGE_PMD_SIZE);
  3004		mmu_notifier_invalidate_range_start(&range);
  3005	
  3006		if (src_folio)
  3007			folio_lock(src_folio);
  3008	
  3009		dst_ptl = pmd_lockptr(mm, dst_pmd);
  3010		double_pt_lock(src_ptl, dst_ptl);
  3011		if (unlikely(!pmd_same(*src_pmd, src_pmdval) ||
  3012			     !pmd_same(*dst_pmd, dst_pmdval))) {
  3013			err = -EAGAIN;
  3014			goto unlock_ptls;
  3015		}
  3016		if (src_folio) {
  3017			if (folio_maybe_dma_pinned(src_folio) ||
  3018			    !PageAnonExclusive(&src_folio->page)) {
  3019				err = -EBUSY;
  3020				goto unlock_ptls;
  3021			}
  3022	
  3023			if (WARN_ON_ONCE(!folio_test_head(src_folio)) ||
  3024			    WARN_ON_ONCE(!folio_test_anon(src_folio))) {
  3025				err = -EBUSY;
  3026				goto unlock_ptls;
  3027			}
  3028	
  3029			src_pmdval = pmdp_huge_clear_flush(src_vma, src_addr, src_pmd);
  3030			/* Folio got pinned from under us. Put it back and fail the move. */
  3031			if (folio_maybe_dma_pinned(src_folio)) {
  3032				set_pmd_at(mm, src_addr, src_pmd, src_pmdval);
  3033				err = -EBUSY;
  3034				goto unlock_ptls;
  3035			}
  3036	
  3037			folio_move_anon_rmap(src_folio, dst_vma);
  3038			src_folio->index = linear_page_index(dst_vma, dst_addr);
  3039	
  3040			_dst_pmd = folio_mk_pmd(src_folio, dst_vma->vm_page_prot);
  3041			/* Follow mremap() behavior and treat the entry dirty after the move */
  3042			_dst_pmd = pmd_mkwrite(pmd_mkdirty(_dst_pmd), dst_vma);
  3043		} else {
  3044			src_pmdval = pmdp_huge_clear_flush(src_vma, src_addr, src_pmd);
  3045			_dst_pmd = move_soft_dirty_pmd(src_pmdval);
  3046			_dst_pmd = clear_uffd_wp_pmd(_dst_pmd);
  3047		}
  3048		set_pmd_at(mm, dst_addr, dst_pmd, _dst_pmd);
  3049	
  3050		src_pgtable = pgtable_trans_huge_withdraw(mm, src_pmd);
  3051		pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
  3052	unlock_ptls:
  3053		double_pt_unlock(src_ptl, dst_ptl);
  3054		/* unblock rmap walks */
  3055		if (src_folio)
  3056			folio_unlock(src_folio);
  3057		mmu_notifier_invalidate_range_end(&range);
  3058		if (src_folio)
  3059			folio_put(src_folio);
  3060		return err;
  3061	}
  3062	#endif /* CONFIG_USERFAULTFD */
  3063	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
