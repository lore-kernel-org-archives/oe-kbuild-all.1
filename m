Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8E7624
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 00:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720744861; cv=none; b=WZuoxnkEszhQRr4OYw981RqI6HNHycg5vXURwLvRsQmSW5hsLeY2dQQdPQyoLXkGfNvDxrGyVnI7lpKmeJ8viwqYRgczB0NjhAp++XO/0ZR7b4dGbd8HtnlXTja1xBDwXM7yCPG1Vb7rcVlW5dQ4ZdJt8EzHX1azgE+SZE+fn0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720744861; c=relaxed/simple;
	bh=T0et93mreabQZ0z0SY1UYHZiFR4euARqQlXyV9VW78Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7/BtAjpYz9HunxeYBW7yRUUW4nTagv/3nvJB/zOGdPcdNVvwzLsG4f7n626KhhjTQOFA/ZlAxGaMw4dA46Q3akDl67X8HAIcZ5+pfeai4/ez/6Z69t20HaYjSlHMJh6sDMeeFx315RJosUwtOhY8wE3xlQpoh8LdS6RltToP5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQCebtTZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQCebtTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720744860; x=1752280860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T0et93mreabQZ0z0SY1UYHZiFR4euARqQlXyV9VW78Q=;
  b=nQCebtTZLd8v04iMs2RbJUDVlmQwIYmsfsij4CJhpWJ78Ma2AY71bK+i
   kBVh6M20V027Kxh0ATJwYhRFm9SOLkiPWhlQjcEWLaHEWJARCs7DzkQVR
   EZltAE8MHI64VnCIZZ3VkOWYuY6aDrfLDzmnf65M96LdApcbejiSIhBEp
   6rjRkDTqnpqFZNpTJpBP7hzMB8IZLmP7qCxlqVDHXd236wfi88poed13r
   uS69ibxnN71Kj9+/3ke5aI2is/kqcEWKui78r39OY2siqe7Xscr1nmQ7i
   Nus9Ku4ZbhYlKXhM1ayoK38NuvVkrdKvvlwVGXVQsEqdri7peMlzFr7kt
   A==;
X-CSE-ConnectionGUID: bxGskNXRQR+MxWnFoNapiA==
X-CSE-MsgGUID: wf+QdcLZTy2y0ZbDydEp1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17876244"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="17876244"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 17:40:59 -0700
X-CSE-ConnectionGUID: H4iRE4jvSf+LxZgo1cQMsQ==
X-CSE-MsgGUID: uwTT6GpRREyyWX6qzQuE1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="53577627"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jul 2024 17:40:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS4LH-000a8W-2E;
	Fri, 12 Jul 2024 00:40:55 +0000
Date: Fri, 12 Jul 2024 08:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, zx2c4@kernel.org
Subject: [crng-random:jd/pte_dirty 2/3] mm/vmscan.c:3398:38: error: 'vma'
 undeclared; did you mean 'cma'?
Message-ID: <202407120810.P232oW0z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git jd/pte_dirty
head:   9c32583226a971efbfbaf93ab5199cc3532ba696
commit: 601bf66c49eee8c687a0efe9ecfed04dda417d4f [2/3] mm: re-add pte_dirty() with vma argument
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240712/202407120810.P232oW0z-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120810.P232oW0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120810.P232oW0z-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'walk_pte_range':
>> mm/vmscan.c:3398:38: error: 'vma' undeclared (first use in this function); did you mean 'cma'?
    3398 |                 if (pte_dirty(ptent, vma) && !folio_test_dirty(folio) &&
         |                                      ^~~
         |                                      cma
   mm/vmscan.c:3398:38: note: each undeclared identifier is reported only once for each function it appears in


vim +3398 mm/vmscan.c

  3345	
  3346	static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
  3347				   struct mm_walk *args)
  3348	{
  3349		int i;
  3350		pte_t *pte;
  3351		spinlock_t *ptl;
  3352		unsigned long addr;
  3353		int total = 0;
  3354		int young = 0;
  3355		struct lru_gen_mm_walk *walk = args->private;
  3356		struct mem_cgroup *memcg = lruvec_memcg(walk->lruvec);
  3357		struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
  3358		DEFINE_MAX_SEQ(walk->lruvec);
  3359		int old_gen, new_gen = lru_gen_from_seq(max_seq);
  3360	
  3361		pte = pte_offset_map_nolock(args->mm, pmd, start & PMD_MASK, &ptl);
  3362		if (!pte)
  3363			return false;
  3364		if (!spin_trylock(ptl)) {
  3365			pte_unmap(pte);
  3366			return false;
  3367		}
  3368	
  3369		arch_enter_lazy_mmu_mode();
  3370	restart:
  3371		for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
  3372			unsigned long pfn;
  3373			struct folio *folio;
  3374			pte_t ptent = ptep_get(pte + i);
  3375	
  3376			total++;
  3377			walk->mm_stats[MM_LEAF_TOTAL]++;
  3378	
  3379			pfn = get_pte_pfn(ptent, args->vma, addr);
  3380			if (pfn == -1)
  3381				continue;
  3382	
  3383			if (!pte_young(ptent)) {
  3384				walk->mm_stats[MM_LEAF_OLD]++;
  3385				continue;
  3386			}
  3387	
  3388			folio = get_pfn_folio(pfn, memcg, pgdat, walk->can_swap);
  3389			if (!folio)
  3390				continue;
  3391	
  3392			if (!ptep_test_and_clear_young(args->vma, addr, pte + i))
  3393				VM_WARN_ON_ONCE(true);
  3394	
  3395			young++;
  3396			walk->mm_stats[MM_LEAF_YOUNG]++;
  3397	
> 3398			if (pte_dirty(ptent, vma) && !folio_test_dirty(folio) &&
  3399			    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
  3400			      !folio_test_swapcache(folio)))
  3401				folio_mark_dirty(folio);
  3402	
  3403			old_gen = folio_update_gen(folio, new_gen);
  3404			if (old_gen >= 0 && old_gen != new_gen)
  3405				update_batch_size(walk, folio, old_gen, new_gen);
  3406		}
  3407	
  3408		if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
  3409			goto restart;
  3410	
  3411		arch_leave_lazy_mmu_mode();
  3412		pte_unmap_unlock(pte, ptl);
  3413	
  3414		return suitable_to_scan(total, young);
  3415	}
  3416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
