Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFDF1F5F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758770136; cv=none; b=h6pj+sc8gz4MHo8DFtHWsJmiykXJNqfPXqloy4Sc/0Ay9QhCl3GbTQu3kIzJAQ+I0p0c5JP/+/G67f2pr3e1+61jj1Wfl8V6zg+xS5xDq/ttLYbrLAPrP4qzd514BiwdA4JU+d1x4kEv/HEWJKhXXCCWeSdIiBl45E4CRUh4FS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758770136; c=relaxed/simple;
	bh=dcHRKjC5uPYSbUjebGbjanamzIaJ4paJPnI6HaSqIY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HM4103P8ftEtqc7rnqkh8DXGBPigZM8LQeXilmb0G6+ArY37euWo1pqGPSZSrIoRJ22Wt4P+Pad3NpbsgWIT1Qk4b11z8GjIkPP3/qYKWPP7Cc05LYPFBp5Dn/x2Nt9+2lmXK8QPXQE/IZSAKpIuQofijmQOTI4bMmR3QkGSjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOpyxT4t; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOpyxT4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758770134; x=1790306134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dcHRKjC5uPYSbUjebGbjanamzIaJ4paJPnI6HaSqIY8=;
  b=jOpyxT4twb7x91MP7WOPJ+swAQCSo/O2hcBDJSb5s/yn5GLh5xVl0QGE
   0354DLDWV40wksM1DhH/u1nq6EcxkR41H3XIFSbrqBcTR1B6RDraTNUqx
   +jDQmw0aZjEUfc02d7n2Q/e6Fe2hgmzDP8veBjQ9pe9HMlIfPvWIQx5pn
   orlWlbhYo8zMcfgX07RQTMucWByCATmIG1yWkkGYQPXxmzLNBojTrFTgj
   QkdoMvxF6nX5wHeyPClkjsRuONYcz0nRAE0PrsBKWERBHQifjI90d5EkJ
   VNpNHsuGGZSV5B8zdN7nc6KYwtQwexZHjtF3rxPGzyrfxXXY0Q6VM7OF4
   g==;
X-CSE-ConnectionGUID: sVX0HVvjSP6HdFIbVhYnbg==
X-CSE-MsgGUID: 1sqx3SGwTXSa7oUFm0lJ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61246539"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="61246539"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 20:15:34 -0700
X-CSE-ConnectionGUID: RUmPP61MRRusi5ThTH93OQ==
X-CSE-MsgGUID: a6fbvHYzTVyTWFP5z/sydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177045241"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 20:15:33 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1cSA-0004sr-13;
	Thu, 25 Sep 2025 03:15:30 +0000
Date: Thu, 25 Sep 2025 11:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Yin Tirui <yintirui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] mm: add PMD-level huge page support for
 remap_pfn_range()
Message-ID: <202509251011.a6EgAfsn-lkp@intel.com>
References: <20250923133104.926672-3-yintirui@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923133104.926672-3-yintirui@huawei.com>

Hi Yin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on soc/for-next linus/master v6.17-rc7 next-20250924]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yin-Tirui/pgtable-add-pte_clrhuge-implementation-for-arm64-and-riscv/20250923-213919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250923133104.926672-3-yintirui%40huawei.com
patch subject: [PATCH RFC 2/2] mm: add PMD-level huge page support for remap_pfn_range()
config: s390-randconfig-002-20250925 (https://download.01.org/0day-ci/archive/20250925/202509251011.a6EgAfsn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251011.a6EgAfsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251011.a6EgAfsn-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/huge_memory.c: In function '__split_huge_pmd_locked':
>> mm/huge_memory.c:2868:33: error: implicit declaration of function 'pte_clrhuge'; did you mean 'pte_mkhuge'? [-Werror=implicit-function-declaration]
    2868 |                         entry = pte_clrhuge(pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd)));
         |                                 ^~~~~~~~~~~
         |                                 pte_mkhuge
>> mm/huge_memory.c:2868:33: error: incompatible types when assigning to type 'pte_t' from type 'int'
   cc1: some warnings being treated as errors


vim +2868 mm/huge_memory.c

  2836	
  2837	static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
  2838			unsigned long haddr, bool freeze)
  2839	{
  2840		struct mm_struct *mm = vma->vm_mm;
  2841		struct folio *folio;
  2842		struct page *page;
  2843		pgtable_t pgtable;
  2844		pmd_t old_pmd, _pmd;
  2845		bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
  2846		bool anon_exclusive = false, dirty = false;
  2847		unsigned long addr;
  2848		pte_t *pte;
  2849		int i;
  2850	
  2851		VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
  2852		VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
  2853		VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
  2854		VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
  2855	
  2856		count_vm_event(THP_SPLIT_PMD);
  2857	
  2858		if (!vma_is_anonymous(vma)) {
  2859			old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
  2860			if (!vma_is_dax(vma) && vma_is_special_huge(vma)) {
  2861				pte_t entry;
  2862	
  2863				pgtable = pgtable_trans_huge_withdraw(mm, pmd);
  2864				if (unlikely(!pgtable))
  2865					return;
  2866				pmd_populate(mm, &_pmd, pgtable);
  2867				pte = pte_offset_map(&_pmd, haddr);
> 2868				entry = pte_clrhuge(pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd)));
  2869				set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
  2870				pte_unmap(pte);
  2871	
  2872				smp_wmb(); /* make pte visible before pmd */
  2873				pmd_populate(mm, pmd, pgtable);
  2874				return;
  2875			}
  2876			if (unlikely(is_pmd_migration_entry(old_pmd))) {
  2877				swp_entry_t entry;
  2878	
  2879				entry = pmd_to_swp_entry(old_pmd);
  2880				folio = pfn_swap_entry_folio(entry);
  2881			} else if (is_huge_zero_pmd(old_pmd)) {
  2882				return;
  2883			} else {
  2884				page = pmd_page(old_pmd);
  2885				folio = page_folio(page);
  2886				if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
  2887					folio_mark_dirty(folio);
  2888				if (!folio_test_referenced(folio) && pmd_young(old_pmd))
  2889					folio_set_referenced(folio);
  2890				folio_remove_rmap_pmd(folio, page, vma);
  2891				folio_put(folio);
  2892			}
  2893			add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
  2894			return;
  2895		}
  2896	
  2897		if (is_huge_zero_pmd(*pmd)) {
  2898			/*
  2899			 * FIXME: Do we want to invalidate secondary mmu by calling
  2900			 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
  2901			 * inside __split_huge_pmd() ?
  2902			 *
  2903			 * We are going from a zero huge page write protected to zero
  2904			 * small page also write protected so it does not seems useful
  2905			 * to invalidate secondary mmu at this time.
  2906			 */
  2907			return __split_huge_zero_page_pmd(vma, haddr, pmd);
  2908		}
  2909	
  2910		pmd_migration = is_pmd_migration_entry(*pmd);
  2911		if (unlikely(pmd_migration)) {
  2912			swp_entry_t entry;
  2913	
  2914			old_pmd = *pmd;
  2915			entry = pmd_to_swp_entry(old_pmd);
  2916			page = pfn_swap_entry_to_page(entry);
  2917			write = is_writable_migration_entry(entry);
  2918			if (PageAnon(page))
  2919				anon_exclusive = is_readable_exclusive_migration_entry(entry);
  2920			young = is_migration_entry_young(entry);
  2921			dirty = is_migration_entry_dirty(entry);
  2922			soft_dirty = pmd_swp_soft_dirty(old_pmd);
  2923			uffd_wp = pmd_swp_uffd_wp(old_pmd);
  2924		} else {
  2925			/*
  2926			 * Up to this point the pmd is present and huge and userland has
  2927			 * the whole access to the hugepage during the split (which
  2928			 * happens in place). If we overwrite the pmd with the not-huge
  2929			 * version pointing to the pte here (which of course we could if
  2930			 * all CPUs were bug free), userland could trigger a small page
  2931			 * size TLB miss on the small sized TLB while the hugepage TLB
  2932			 * entry is still established in the huge TLB. Some CPU doesn't
  2933			 * like that. See
  2934			 * http://support.amd.com/TechDocs/41322_10h_Rev_Gd.pdf, Erratum
  2935			 * 383 on page 105. Intel should be safe but is also warns that
  2936			 * it's only safe if the permission and cache attributes of the
  2937			 * two entries loaded in the two TLB is identical (which should
  2938			 * be the case here). But it is generally safer to never allow
  2939			 * small and huge TLB entries for the same virtual address to be
  2940			 * loaded simultaneously. So instead of doing "pmd_populate();
  2941			 * flush_pmd_tlb_range();" we first mark the current pmd
  2942			 * notpresent (atomically because here the pmd_trans_huge must
  2943			 * remain set at all times on the pmd until the split is
  2944			 * complete for this pmd), then we flush the SMP TLB and finally
  2945			 * we write the non-huge version of the pmd entry with
  2946			 * pmd_populate.
  2947			 */
  2948			old_pmd = pmdp_invalidate(vma, haddr, pmd);
  2949			page = pmd_page(old_pmd);
  2950			folio = page_folio(page);
  2951			if (pmd_dirty(old_pmd)) {
  2952				dirty = true;
  2953				folio_set_dirty(folio);
  2954			}
  2955			write = pmd_write(old_pmd);
  2956			young = pmd_young(old_pmd);
  2957			soft_dirty = pmd_soft_dirty(old_pmd);
  2958			uffd_wp = pmd_uffd_wp(old_pmd);
  2959	
  2960			VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
  2961			VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
  2962	
  2963			/*
  2964			 * Without "freeze", we'll simply split the PMD, propagating the
  2965			 * PageAnonExclusive() flag for each PTE by setting it for
  2966			 * each subpage -- no need to (temporarily) clear.
  2967			 *
  2968			 * With "freeze" we want to replace mapped pages by
  2969			 * migration entries right away. This is only possible if we
  2970			 * managed to clear PageAnonExclusive() -- see
  2971			 * set_pmd_migration_entry().
  2972			 *
  2973			 * In case we cannot clear PageAnonExclusive(), split the PMD
  2974			 * only and let try_to_migrate_one() fail later.
  2975			 *
  2976			 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
  2977			 */
  2978			anon_exclusive = PageAnonExclusive(page);
  2979			if (freeze && anon_exclusive &&
  2980			    folio_try_share_anon_rmap_pmd(folio, page))
  2981				freeze = false;
  2982			if (!freeze) {
  2983				rmap_t rmap_flags = RMAP_NONE;
  2984	
  2985				folio_ref_add(folio, HPAGE_PMD_NR - 1);
  2986				if (anon_exclusive)
  2987					rmap_flags |= RMAP_EXCLUSIVE;
  2988				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
  2989							 vma, haddr, rmap_flags);
  2990			}
  2991		}
  2992	
  2993		/*
  2994		 * Withdraw the table only after we mark the pmd entry invalid.
  2995		 * This's critical for some architectures (Power).
  2996		 */
  2997		pgtable = pgtable_trans_huge_withdraw(mm, pmd);
  2998		pmd_populate(mm, &_pmd, pgtable);
  2999	
  3000		pte = pte_offset_map(&_pmd, haddr);
  3001		VM_BUG_ON(!pte);
  3002	
  3003		/*
  3004		 * Note that NUMA hinting access restrictions are not transferred to
  3005		 * avoid any possibility of altering permissions across VMAs.
  3006		 */
  3007		if (freeze || pmd_migration) {
  3008			for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
  3009				pte_t entry;
  3010				swp_entry_t swp_entry;
  3011	
  3012				if (write)
  3013					swp_entry = make_writable_migration_entry(
  3014								page_to_pfn(page + i));
  3015				else if (anon_exclusive)
  3016					swp_entry = make_readable_exclusive_migration_entry(
  3017								page_to_pfn(page + i));
  3018				else
  3019					swp_entry = make_readable_migration_entry(
  3020								page_to_pfn(page + i));
  3021				if (young)
  3022					swp_entry = make_migration_entry_young(swp_entry);
  3023				if (dirty)
  3024					swp_entry = make_migration_entry_dirty(swp_entry);
  3025				entry = swp_entry_to_pte(swp_entry);
  3026				if (soft_dirty)
  3027					entry = pte_swp_mksoft_dirty(entry);
  3028				if (uffd_wp)
  3029					entry = pte_swp_mkuffd_wp(entry);
  3030	
  3031				VM_WARN_ON(!pte_none(ptep_get(pte + i)));
  3032				set_pte_at(mm, addr, pte + i, entry);
  3033			}
  3034		} else {
  3035			pte_t entry;
  3036	
  3037			entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
  3038			if (write)
  3039				entry = pte_mkwrite(entry, vma);
  3040			if (!young)
  3041				entry = pte_mkold(entry);
  3042			/* NOTE: this may set soft-dirty too on some archs */
  3043			if (dirty)
  3044				entry = pte_mkdirty(entry);
  3045			if (soft_dirty)
  3046				entry = pte_mksoft_dirty(entry);
  3047			if (uffd_wp)
  3048				entry = pte_mkuffd_wp(entry);
  3049	
  3050			for (i = 0; i < HPAGE_PMD_NR; i++)
  3051				VM_WARN_ON(!pte_none(ptep_get(pte + i)));
  3052	
  3053			set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
  3054		}
  3055		pte_unmap(pte);
  3056	
  3057		if (!pmd_migration)
  3058			folio_remove_rmap_pmd(folio, page, vma);
  3059		if (freeze)
  3060			put_page(page);
  3061	
  3062		smp_wmb(); /* make pte visible before pmd */
  3063		pmd_populate(mm, pmd, pgtable);
  3064	}
  3065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
