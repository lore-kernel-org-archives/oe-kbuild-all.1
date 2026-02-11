Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6321B4F2C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770816877; cv=none; b=DMMcdkj2CWP2RF0OmI851QDyXrhoalZry+RNBvGq/tG7Q1ffABQ0XuxAacr/SxJ3QEOhjl7eHRdoErZ2G2ZJNdOcI1mxe5erGVccgZZHpPdbskmOpslm9/SVr5Otqo9bxZYOJW3kWLblonlDw9peQqvxk/3cu1QVC0nmDco/5aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770816877; c=relaxed/simple;
	bh=Vt6iOgTMmbP3ORPXGE4cqGf9P9k4RzX5Nb9d0j0nyZc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eswZW+2rebJ9skpeggBhb6H4Dwqp88ZWg6GKMMeqgVIaSfdjH8JqK4JIN9uJ5fkvFZHjaNqqXupJQhi/NXYIDCveo3B5/2QjdHTLOEKI1OOM8L6tZ78584yetziJsFqbPvovplNbKCo2L9i67Q8Rwc+OJU4BSXkm8dQzynhENSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P94agTxD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P94agTxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770816876; x=1802352876;
  h=date:from:to:cc:subject:message-id;
  bh=Vt6iOgTMmbP3ORPXGE4cqGf9P9k4RzX5Nb9d0j0nyZc=;
  b=P94agTxDRc8YwQjbLL9/2p+nmYjdpT/czwAmr055xyuOMHBF6XEX9pwN
   ZegXwqIsIAabvKaaepvCN8CIU/yFNL6eNMjzONsLhE6AInPyYGwY1TsMs
   o9IV7Ji5hb7J9WEmyfR7TojZTKG+/VJKnwnAh/pztZtph5CIdU2WqNjWd
   99FAD+OceCUmL7J3ku3TQnWCSp+KilHfhibmo31bMn0OFbVUqOlaOUtKk
   8aBRzVZOHjL9zPjXSpeYsfEeJMCem861I1czS5CNyMM54adkn22dMfIlS
   Ri6jHLASvAIE5aAMXoLRQnjxvxvZant1W2ut1pZPK90t4ZJIkxf6iuOjd
   w==;
X-CSE-ConnectionGUID: L+hMKpkfRC+zZqECu4+ZmA==
X-CSE-MsgGUID: p35yZKZ6RIegM5cyMbdCAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="97421543"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97421543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 05:34:35 -0800
X-CSE-ConnectionGUID: dHkdg7bRRJu6HkIpw8Y7og==
X-CSE-MsgGUID: 7azfY98qQ3apyOSaPwHOQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="235240940"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 05:34:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqAMQ-00000000q1k-2ZgT;
	Wed, 11 Feb 2026 13:34:30 +0000
Date: Wed, 11 Feb 2026 21:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 203/203]
 mm/memory.c:3303:13: sparse: sparse: incorrect type in assignment (different
 base types)
Message-ID: <202602112102.2VmadLry-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: 5835d87162afa8424c692a73a10ef5723dcc183b [203/203] FROMLIST: mm: make pte_unmap_same compatible with SPF
config: i386-randconfig-063-20260211 (https://download.01.org/0day-ci/archive/20260211/202602112102.2VmadLry-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112102.2VmadLry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602112102.2VmadLry-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/memory.c:2873:19: sparse: sparse: incorrect type in initializer (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   mm/memory.c:2873:19: sparse:     expected int ret
   mm/memory.c:2873:19: sparse:     got restricted vm_fault_t
   mm/memory.c:2918:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   mm/memory.c:2918:21: sparse:     expected int ret
   mm/memory.c:2918:21: sparse:     got restricted vm_fault_t
   mm/memory.c:3012:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int ret @@
   mm/memory.c:3012:16: sparse:     expected restricted vm_fault_t
   mm/memory.c:3012:16: sparse:     got int ret
>> mm/memory.c:3303:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] ret @@     got int @@
   mm/memory.c:3303:13: sparse:     expected restricted vm_fault_t [usertype] ret
   mm/memory.c:3303:13: sparse:     got int
   mm/memory.c:5262:22: sparse: sparse: cast removes address space '__user' of expression
   mm/memory.c:957:17: sparse: sparse: context imbalance in 'copy_pte_range' - different lock contexts for basic block
   mm/memory.c:1637:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:1686:9: sparse: sparse: context imbalance in 'insert_page' - different lock contexts for basic block
   mm/memory.c:2188:17: sparse: sparse: context imbalance in 'remap_pte_range' - different lock contexts for basic block
   mm/memory.c:2433:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   mm/memory.c:2712:9: sparse: sparse: context imbalance in 'wp_page_copy' - different lock contexts for basic block
   mm/memory.c:3060:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3123:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c:3719:19: sparse: sparse: context imbalance in 'pte_alloc_one_map' - different lock contexts for basic block
   mm/memory.c:3947:17: sparse: sparse: context imbalance in 'finish_fault' - unexpected unlock
   mm/memory.c:4056:9: sparse: sparse: context imbalance in 'do_fault_around' - unexpected unlock
   mm/memory.c:4775:12: sparse: sparse: context imbalance in '__follow_pte_pmd' - wrong count at exit
   mm/memory.c:4861:16: sparse: sparse: context imbalance in 'follow_pte_pmd' - different lock contexts for basic block
   mm/memory.c:4921:9: sparse: sparse: context imbalance in 'follow_phys' - unexpected unlock

vim +3303 mm/memory.c

  3283	
  3284	/*
  3285	 * We enter with non-exclusive mmap_lock (to exclude vma changes,
  3286	 * but allow concurrent faults), and pte mapped but not yet locked.
  3287	 * We return with pte unmapped and unlocked.
  3288	 *
  3289	 * We return with the mmap_lock locked or unlocked in the same cases
  3290	 * as does filemap_fault().
  3291	 */
  3292	vm_fault_t do_swap_page(struct vm_fault *vmf)
  3293	{
  3294		struct vm_area_struct *vma = vmf->vma;
  3295		struct page *page = NULL, *swapcache;
  3296		swp_entry_t entry;
  3297		pte_t pte;
  3298		int locked;
  3299		int exclusive = 0;
  3300		vm_fault_t ret;
  3301		void *shadow = NULL;
  3302	
> 3303		ret = pte_unmap_same(vmf);
  3304		if (ret) {
  3305			/*
  3306			 * If pte != orig_pte, this means another thread did the
  3307			 * swap operation in our back.
  3308			 * So nothing else to do.
  3309			 */
  3310			if (ret == VM_FAULT_PTNOTSAME)
  3311				ret = 0;
  3312			goto out;
  3313		}
  3314	
  3315		entry = pte_to_swp_entry(vmf->orig_pte);
  3316		if (unlikely(non_swap_entry(entry))) {
  3317			if (is_migration_entry(entry)) {
  3318				migration_entry_wait(vma->vm_mm, vmf->pmd,
  3319						     vmf->address);
  3320			} else if (is_device_private_entry(entry)) {
  3321				vmf->page = device_private_entry_to_page(entry);
  3322				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
  3323			} else if (is_hwpoison_entry(entry)) {
  3324				ret = VM_FAULT_HWPOISON;
  3325			} else {
  3326				print_bad_pte(vma, vmf->address, vmf->orig_pte, NULL);
  3327				ret = VM_FAULT_SIGBUS;
  3328			}
  3329			goto out;
  3330		}
  3331	
  3332	
  3333		delayacct_set_flag(DELAYACCT_PF_SWAPIN);
  3334		page = lookup_swap_cache(entry, vma, vmf->address);
  3335		swapcache = page;
  3336	
  3337		if (!page) {
  3338			struct swap_info_struct *si = swp_swap_info(entry);
  3339	
  3340			if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
  3341			    __swap_count(entry) == 1) {
  3342				/* skip swapcache */
  3343				gfp_t flags = GFP_HIGHUSER_MOVABLE;
  3344	
  3345				trace_android_rvh_set_skip_swapcache_flags(&flags);
  3346				page = alloc_page_vma(flags, vma, vmf->address);
  3347				if (page) {
  3348					int err;
  3349	
  3350					__SetPageLocked(page);
  3351					__SetPageSwapBacked(page);
  3352					set_page_private(page, entry.val);
  3353	
  3354					/* Tell memcg to use swap ownership records */
  3355					SetPageSwapCache(page);
  3356					err = mem_cgroup_charge(page, vma->vm_mm,
  3357								GFP_KERNEL);
  3358					ClearPageSwapCache(page);
  3359					if (err) {
  3360						ret = VM_FAULT_OOM;
  3361						goto out_page;
  3362					}
  3363	
  3364					shadow = get_shadow_from_swap_cache(entry);
  3365					if (shadow)
  3366						workingset_refault(page, shadow);
  3367	
  3368					lru_cache_add(page);
  3369					swap_readpage(page, true);
  3370				}
  3371			} else {
  3372				page = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE,
  3373							vmf);
  3374				swapcache = page;
  3375			}
  3376	
  3377			if (!page) {
  3378				/*
  3379				 * Back out if the VMA has changed in our back during
  3380				 * a speculative page fault or if somebody else
  3381				 * faulted in this pte while we released the pte lock.
  3382				 */
  3383				if (!pte_map_lock(vmf)) {
  3384					delayacct_clear_flag(DELAYACCT_PF_SWAPIN);
  3385					ret = VM_FAULT_RETRY;
  3386					goto out;
  3387				}
  3388	
  3389				if (likely(pte_same(*vmf->pte, vmf->orig_pte)))
  3390					ret = VM_FAULT_OOM;
  3391				delayacct_clear_flag(DELAYACCT_PF_SWAPIN);
  3392				goto unlock;
  3393			}
  3394	
  3395			/* Had to read the page from swap area: Major fault */
  3396			ret = VM_FAULT_MAJOR;
  3397			count_vm_event(PGMAJFAULT);
  3398			count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
  3399		} else if (PageHWPoison(page)) {
  3400			/*
  3401			 * hwpoisoned dirty swapcache pages are kept for killing
  3402			 * owner processes (which may be unknown at hwpoison time)
  3403			 */
  3404			ret = VM_FAULT_HWPOISON;
  3405			delayacct_clear_flag(DELAYACCT_PF_SWAPIN);
  3406			goto out_release;
  3407		}
  3408	
  3409		locked = lock_page_or_retry(page, vma->vm_mm, vmf->flags);
  3410	
  3411		delayacct_clear_flag(DELAYACCT_PF_SWAPIN);
  3412		if (!locked) {
  3413			ret |= VM_FAULT_RETRY;
  3414			goto out_release;
  3415		}
  3416	
  3417		/*
  3418		 * Make sure try_to_free_swap or reuse_swap_page or swapoff did not
  3419		 * release the swapcache from under us.  The page pin, and pte_same
  3420		 * test below, are not enough to exclude that.  Even if it is still
  3421		 * swapcache, we need to check that the page's swap has not changed.
  3422		 */
  3423		if (unlikely((!PageSwapCache(page) ||
  3424				page_private(page) != entry.val)) && swapcache)
  3425			goto out_page;
  3426	
  3427		page = ksm_might_need_to_copy(page, vma, vmf->address);
  3428		if (unlikely(!page)) {
  3429			ret = VM_FAULT_OOM;
  3430			page = swapcache;
  3431			goto out_page;
  3432		}
  3433	
  3434		cgroup_throttle_swaprate(page, GFP_KERNEL);
  3435	
  3436		/*
  3437		 * Back out if the VMA has changed in our back during a speculative
  3438		 * page fault or if somebody else already faulted in this pte.
  3439		 */
  3440		if (!pte_map_lock(vmf)) {
  3441			ret = VM_FAULT_RETRY;
  3442			goto out_page;
  3443		}
  3444		if (unlikely(!pte_same(*vmf->pte, vmf->orig_pte)))
  3445			goto out_nomap;
  3446	
  3447		if (unlikely(!PageUptodate(page))) {
  3448			ret = VM_FAULT_SIGBUS;
  3449			goto out_nomap;
  3450		}
  3451	
  3452		/*
  3453		 * The page isn't present yet, go ahead with the fault.
  3454		 *
  3455		 * Be careful about the sequence of operations here.
  3456		 * To get its accounting right, reuse_swap_page() must be called
  3457		 * while the page is counted on swap but not yet in mapcount i.e.
  3458		 * before page_add_anon_rmap() and swap_free(); try_to_free_swap()
  3459		 * must be called after the swap_free(), or it will never succeed.
  3460		 */
  3461	
  3462		inc_mm_counter_fast(vma->vm_mm, MM_ANONPAGES);
  3463		dec_mm_counter_fast(vma->vm_mm, MM_SWAPENTS);
  3464		pte = mk_pte(page, vma->vm_page_prot);
  3465		if ((vmf->flags & FAULT_FLAG_WRITE) && reuse_swap_page(page, NULL)) {
  3466			pte = maybe_mkwrite(pte_mkdirty(pte), vma);
  3467			vmf->flags &= ~FAULT_FLAG_WRITE;
  3468			ret |= VM_FAULT_WRITE;
  3469			exclusive = RMAP_EXCLUSIVE;
  3470		}
  3471		flush_icache_page(vma, page);
  3472		if (pte_swp_soft_dirty(vmf->orig_pte))
  3473			pte = pte_mksoft_dirty(pte);
  3474		if (pte_swp_uffd_wp(vmf->orig_pte)) {
  3475			pte = pte_mkuffd_wp(pte);
  3476			pte = pte_wrprotect(pte);
  3477		}
  3478		set_pte_at(vma->vm_mm, vmf->address, vmf->pte, pte);
  3479		arch_do_swap_page(vma->vm_mm, vma, vmf->address, pte, vmf->orig_pte);
  3480		vmf->orig_pte = pte;
  3481	
  3482		/* ksm created a completely new copy */
  3483		if (unlikely(page != swapcache && swapcache)) {
  3484			page_add_new_anon_rmap(page, vma, vmf->address, false);
  3485			lru_cache_add_inactive_or_unevictable(page, vma);
  3486		} else {
  3487			do_page_add_anon_rmap(page, vma, vmf->address, exclusive);
  3488		}
  3489	
  3490		swap_free(entry);
  3491		if (mem_cgroup_swap_full(page) ||
  3492		    (vma->vm_flags & VM_LOCKED) || PageMlocked(page))
  3493			try_to_free_swap(page);
  3494		unlock_page(page);
  3495		if (page != swapcache && swapcache) {
  3496			/*
  3497			 * Hold the lock to avoid the swap entry to be reused
  3498			 * until we take the PT lock for the pte_same() check
  3499			 * (to avoid false positives from pte_same). For
  3500			 * further safety release the lock after the swap_free
  3501			 * so that the swap count won't change under a
  3502			 * parallel locked swapcache.
  3503			 */
  3504			unlock_page(swapcache);
  3505			put_page(swapcache);
  3506		}
  3507	
  3508		if (vmf->flags & FAULT_FLAG_WRITE) {
  3509			ret |= do_wp_page(vmf);
  3510			if (ret & VM_FAULT_ERROR)
  3511				ret &= VM_FAULT_ERROR;
  3512			goto out;
  3513		}
  3514	
  3515		/* No need to invalidate - it was non-present before */
  3516		update_mmu_cache(vma, vmf->address, vmf->pte);
  3517	unlock:
  3518		pte_unmap_unlock(vmf->pte, vmf->ptl);
  3519	out:
  3520		return ret;
  3521	out_nomap:
  3522		pte_unmap_unlock(vmf->pte, vmf->ptl);
  3523	out_page:
  3524		unlock_page(page);
  3525	out_release:
  3526		put_page(page);
  3527		if (page != swapcache && swapcache) {
  3528			unlock_page(swapcache);
  3529			put_page(swapcache);
  3530		}
  3531		return ret;
  3532	}
  3533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
