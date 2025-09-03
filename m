Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9CD28CF41
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914823; cv=none; b=UzWYFcKWZbBeVKsxkWO638+Sgezyjz+yr8ryig8iJvL4X2OCmvN9mcWhgz+sWJyULW3djuevTwiEJW5cznM0vw52Ic/aikSgvxYe6xIyQ78E1WCB4G1NPnWV9PFj+n2r5VK/G3Rnt68OF6imUaf5HLCQjQToW4J7GJfp4cz/YfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914823; c=relaxed/simple;
	bh=4+d29CDo2isLdSQEJ2x639g6QrGngZo+P1Q4KfYpGyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZAFW9LUEL63V+4Cx4uwcWtQqNUiC/D/2/JKoCW2Fm60fTMk7SBThmmMJcNM/JTIlVekXleFGWxffA51j/3e9raj/QNW/gXnVYFhUh0hLC5vtrTirVQIwQG8BnoaLbtXxY7oiL/KVuDQNye+BgV9WdCd1Dn4x9GS5DY06x9NM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxPKy6+9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxPKy6+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756914822; x=1788450822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+d29CDo2isLdSQEJ2x639g6QrGngZo+P1Q4KfYpGyo=;
  b=KxPKy6+9IpEcfBeYOZ6LSwXBOdir1GKzA/qfP8heUwl63EH2rEbia0jQ
   pMeRAMJCCslk7IO3TfLxiGZw1L8VuxJWWChCfRiNloJ6dJ+z8RTnBDRJv
   7tP0tbiMjZvmh3F+1+Shhg1vRGH7fMAcFYhGRC/pMdQBPnn2jvGxB66jO
   du01GpOqJ0TH/2y1n2UdPF6lTiCCqJwSmWD1esIC9Su8uHSBnv9pW6Olh
   3XobFW0CVXebqXY0VlZmFjkwQNYk3HJYE4Z7yJH9JCnQPNvMAH80h/tct
   W5eE7Vk1yc1zrm8gUaoUhMDfFexDmAvBIH+nxbcJqp0uuDvQexdUfwYnZ
   A==;
X-CSE-ConnectionGUID: +MS6euo7Ss6n1wyDlRXFmg==
X-CSE-MsgGUID: Y0MmxBkATlKg2NJsT9gTgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70333968"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="70333968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 08:53:40 -0700
X-CSE-ConnectionGUID: v5o1qFZwTY66KnCNM9RufA==
X-CSE-MsgGUID: 95EVW+ARSoqj4E/WC2Uc6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171998599"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2025 08:53:38 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utpnk-00046R-1o;
	Wed, 03 Sep 2025 15:53:36 +0000
Date: Wed, 3 Sep 2025 23:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:nested_lazy_mmu 2/7] mm/vmscan.c:3524:26: warning:
 variable 'lazy_mmu_state' set but not used
Message-ID: <202509032340.luqGELNq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git nested_lazy_mmu
head:   95673e91d66295c538fe848aa7ce00753f02b2e1
commit: 6bd8375a897e4aee7a5cb7a9583f3d365fe9c3de [2/7] mm: introduce local state for lazy_mmu sections
config: i386-buildonly-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509032340.luqGELNq-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509032340.luqGELNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509032340.luqGELNq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c: In function 'walk_pte_range':
>> mm/vmscan.c:3524:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
    3524 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
   mm/vmscan.c: In function 'walk_pmd_range_locked':
   mm/vmscan.c:3604:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
    3604 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
   mm/vmscan.c: In function 'lru_gen_look_around':
   mm/vmscan.c:4232:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
    4232 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
--
   mm/mremap.c: In function 'move_ptes':
>> mm/mremap.c:196:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
     196 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
--
   mm/vmalloc.c: In function 'vmap_pte_range':
>> mm/vmalloc.c:98:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
      98 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
   mm/vmalloc.c: In function 'vunmap_pte_range':
   mm/vmalloc.c:358:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
     358 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
   mm/vmalloc.c: In function 'vmap_pages_pte_range':
   mm/vmalloc.c:519:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
     519 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
--
   mm/memory.c: In function 'copy_pte_range':
>> mm/memory.c:1082:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
    1082 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
   mm/memory.c: In function 'zap_pte_range':
   mm/memory.c:1698:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
    1698 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
   mm/memory.c: In function 'remap_pte_range':
   mm/memory.c:2688:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
    2688 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
   mm/memory.c: In function 'apply_to_pte_range':
   mm/memory.c:2995:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
    2995 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~
--
   mm/mprotect.c: In function 'change_pte_range':
>> mm/mprotect.c:276:26: warning: variable 'lazy_mmu_state' set but not used [-Wunused-but-set-variable]
     276 |         lazy_mmu_state_t lazy_mmu_state;
         |                          ^~~~~~~~~~~~~~


vim +/lazy_mmu_state +3524 mm/vmscan.c

  3520	
  3521	static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
  3522				   struct mm_walk *args)
  3523	{
> 3524		lazy_mmu_state_t lazy_mmu_state;
  3525		int i;
  3526		bool dirty;
  3527		pte_t *pte;
  3528		spinlock_t *ptl;
  3529		unsigned long addr;
  3530		int total = 0;
  3531		int young = 0;
  3532		struct folio *last = NULL;
  3533		struct lru_gen_mm_walk *walk = args->private;
  3534		struct mem_cgroup *memcg = lruvec_memcg(walk->lruvec);
  3535		struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
  3536		DEFINE_MAX_SEQ(walk->lruvec);
  3537		int gen = lru_gen_from_seq(max_seq);
  3538		pmd_t pmdval;
  3539	
  3540		pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
  3541		if (!pte)
  3542			return false;
  3543	
  3544		if (!spin_trylock(ptl)) {
  3545			pte_unmap(pte);
  3546			return true;
  3547		}
  3548	
  3549		if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
  3550			pte_unmap_unlock(pte, ptl);
  3551			return false;
  3552		}
  3553	
  3554		lazy_mmu_state = arch_enter_lazy_mmu_mode();
  3555	restart:
  3556		for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
  3557			unsigned long pfn;
  3558			struct folio *folio;
  3559			pte_t ptent = ptep_get(pte + i);
  3560	
  3561			total++;
  3562			walk->mm_stats[MM_LEAF_TOTAL]++;
  3563	
  3564			pfn = get_pte_pfn(ptent, args->vma, addr, pgdat);
  3565			if (pfn == -1)
  3566				continue;
  3567	
  3568			folio = get_pfn_folio(pfn, memcg, pgdat);
  3569			if (!folio)
  3570				continue;
  3571	
  3572			if (!ptep_clear_young_notify(args->vma, addr, pte + i))
  3573				continue;
  3574	
  3575			if (last != folio) {
  3576				walk_update_folio(walk, last, gen, dirty);
  3577	
  3578				last = folio;
  3579				dirty = false;
  3580			}
  3581	
  3582			if (pte_dirty(ptent))
  3583				dirty = true;
  3584	
  3585			young++;
  3586			walk->mm_stats[MM_LEAF_YOUNG]++;
  3587		}
  3588	
  3589		walk_update_folio(walk, last, gen, dirty);
  3590		last = NULL;
  3591	
  3592		if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
  3593			goto restart;
  3594	
  3595		arch_leave_lazy_mmu_mode(lazy_mmu_state);
  3596		pte_unmap_unlock(pte, ptl);
  3597	
  3598		return suitable_to_scan(total, young);
  3599	}
  3600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
