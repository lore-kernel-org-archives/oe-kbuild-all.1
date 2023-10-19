Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310EF46669
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 04:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLA8xzv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697689490; x=1729225490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=utPm2c11fvcJ1ZMQz6MxcL9O91Okyj2CZKpeAAKGjb4=;
  b=fLA8xzv6j6NJAQvZTM/WoKQph6ZS3FXV6t0DHRAksW2ieAyDCNs5g+cM
   j8Qoo0uKHf1xzkhv9u6C8BjdQUnnfvJ+E/FTpCEISVHOyR7tdvt0VVDKh
   Wf9D/6Wgkz4Wfyrpg1JYlX5rERKiyagFTqWvPiaLktzeqESX/ea9Gza8j
   IutNsV4Xx1GNRRtHOHZzRSXNYLyr64BqePdIHDVR3InHdQptO6322f821
   hJX6KsoCb7K1St4ISJn727wx1R8t4cRMssvg3D+MnQUmdGKFzo4XV3iX4
   0Y29Ey7ga+Dn3UuqqQZs+H5v1CNy8gikE3l/D7b+BOm/im4LLUEhTgVfr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417282239"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="417282239"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 21:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="873308429"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="873308429"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2023 21:24:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtKaT-0001b2-1m;
	Thu, 19 Oct 2023 04:24:45 +0000
Date: Thu, 19 Oct 2023 12:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] mm: only use old generation and stable tier for
 madv_pageout
Message-ID: <202310191208.kuNmoYUs-lkp@intel.com>
References: <20231013113028.2720996-1-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013113028.2720996-1-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-only-use-old-generation-and-stable-tier-for-madv_pageout/20231017-121940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231013113028.2720996-1-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH 1/1] mm: only use old generation and stable tier for madv_pageout
config: um-defconfig (https://download.01.org/0day-ci/archive/20231019/202310191208.kuNmoYUs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191208.kuNmoYUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191208.kuNmoYUs-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function 'madvise_cold_or_pageout_pte_range':
>> mm/madvise.c:449:35: error: implicit declaration of function 'folio_lru_gen'; did you mean 'folio_lruvec'? [-Werror=implicit-function-declaration]
     449 |                         int gen = folio_lru_gen(folio);
         |                                   ^~~~~~~~~~~~~
         |                                   folio_lruvec
>> mm/madvise.c:452:36: error: implicit declaration of function 'folio_lru_refs'; did you mean 'folio_put_refs'? [-Werror=implicit-function-declaration]
     452 |                         int refs = folio_lru_refs(folio);
         |                                    ^~~~~~~~~~~~~~
         |                                    folio_put_refs
>> mm/madvise.c:453:36: error: implicit declaration of function 'lru_tier_from_refs' [-Werror=implicit-function-declaration]
     453 |                         int tier = lru_tier_from_refs(refs);
         |                                    ^~~~~~~~~~~~~~~~~~
>> mm/madvise.c:456:35: error: implicit declaration of function 'lru_gen_from_seq' [-Werror=implicit-function-declaration]
     456 |                         if (gen > lru_gen_from_seq(lruvec->lrugen.min_seq[type]) + 1
         |                                   ^~~~~~~~~~~~~~~~
>> mm/madvise.c:456:58: error: 'struct lruvec' has no member named 'lrugen'
     456 |                         if (gen > lru_gen_from_seq(lruvec->lrugen.min_seq[type]) + 1
         |                                                          ^~
   cc1: some warnings being treated as errors


vim +449 mm/madvise.c

   323	
   324	static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
   325					unsigned long addr, unsigned long end,
   326					struct mm_walk *walk)
   327	{
   328		struct madvise_walk_private *private = walk->private;
   329		struct mmu_gather *tlb = private->tlb;
   330		bool pageout = private->pageout;
   331		struct mm_struct *mm = tlb->mm;
   332		struct vm_area_struct *vma = walk->vma;
   333		pte_t *start_pte, *pte, ptent;
   334		spinlock_t *ptl;
   335		struct folio *folio = NULL;
   336		LIST_HEAD(folio_list);
   337		bool pageout_anon_only_filter;
   338		unsigned int batch_count = 0;
   339	
   340		if (fatal_signal_pending(current))
   341			return -EINTR;
   342	
   343		pageout_anon_only_filter = pageout && !vma_is_anonymous(vma) &&
   344						!can_do_file_pageout(vma);
   345	
   346	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
   347		if (pmd_trans_huge(*pmd)) {
   348			pmd_t orig_pmd;
   349			unsigned long next = pmd_addr_end(addr, end);
   350	
   351			tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
   352			ptl = pmd_trans_huge_lock(pmd, vma);
   353			if (!ptl)
   354				return 0;
   355	
   356			orig_pmd = *pmd;
   357			if (is_huge_zero_pmd(orig_pmd))
   358				goto huge_unlock;
   359	
   360			if (unlikely(!pmd_present(orig_pmd))) {
   361				VM_BUG_ON(thp_migration_supported() &&
   362						!is_pmd_migration_entry(orig_pmd));
   363				goto huge_unlock;
   364			}
   365	
   366			folio = pfn_folio(pmd_pfn(orig_pmd));
   367	
   368			/* Do not interfere with other mappings of this folio */
   369			if (folio_estimated_sharers(folio) != 1)
   370				goto huge_unlock;
   371	
   372			if (pageout_anon_only_filter && !folio_test_anon(folio))
   373				goto huge_unlock;
   374	
   375			if (next - addr != HPAGE_PMD_SIZE) {
   376				int err;
   377	
   378				folio_get(folio);
   379				spin_unlock(ptl);
   380				folio_lock(folio);
   381				err = split_folio(folio);
   382				folio_unlock(folio);
   383				folio_put(folio);
   384				if (!err)
   385					goto regular_folio;
   386				return 0;
   387			}
   388	
   389			if (pmd_young(orig_pmd)) {
   390				pmdp_invalidate(vma, addr, pmd);
   391				orig_pmd = pmd_mkold(orig_pmd);
   392	
   393				set_pmd_at(mm, addr, pmd, orig_pmd);
   394				tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
   395			}
   396	
   397			folio_clear_referenced(folio);
   398			folio_test_clear_young(folio);
   399			if (folio_test_active(folio))
   400				folio_set_workingset(folio);
   401			if (pageout) {
   402				if (folio_isolate_lru(folio)) {
   403					if (folio_test_unevictable(folio))
   404						folio_putback_lru(folio);
   405					else
   406						list_add(&folio->lru, &folio_list);
   407				}
   408			} else
   409				folio_deactivate(folio);
   410	huge_unlock:
   411			spin_unlock(ptl);
   412			if (pageout)
   413				reclaim_pages(&folio_list);
   414			return 0;
   415		}
   416	
   417	regular_folio:
   418	#endif
   419		tlb_change_page_size(tlb, PAGE_SIZE);
   420	restart:
   421		start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
   422		if (!start_pte)
   423			return 0;
   424		flush_tlb_batched_pending(mm);
   425		arch_enter_lazy_mmu_mode();
   426		for (; addr < end; pte++, addr += PAGE_SIZE) {
   427			ptent = ptep_get(pte);
   428	
   429			if (++batch_count == SWAP_CLUSTER_MAX) {
   430				batch_count = 0;
   431				if (need_resched()) {
   432					pte_unmap_unlock(start_pte, ptl);
   433					cond_resched();
   434					goto restart;
   435				}
   436			}
   437	
   438			if (pte_none(ptent))
   439				continue;
   440	
   441			if (!pte_present(ptent))
   442				continue;
   443	
   444			folio = vm_normal_folio(vma, addr, ptent);
   445			if (!folio || folio_is_zone_device(folio))
   446				continue;
   447	
   448			if (lru_gen_enabled() && pageout) {
 > 449				int gen = folio_lru_gen(folio);
   450				struct lruvec *lruvec = folio_lruvec(folio);
   451				int type = folio_is_file_lru(folio);
 > 452				int refs = folio_lru_refs(folio);
 > 453				int tier = lru_tier_from_refs(refs);
   454				int tier_st = get_tier_idx(lruvec, type);
   455	
 > 456				if (gen > lru_gen_from_seq(lruvec->lrugen.min_seq[type]) + 1
   457					|| tier > tier_st)
   458					continue;
   459			}
   460			/*
   461			 * Creating a THP page is expensive so split it only if we
   462			 * are sure it's worth. Split it if we are only owner.
   463			 */
   464			if (folio_test_large(folio)) {
   465				int err;
   466	
   467				if (folio_estimated_sharers(folio) != 1)
   468					break;
   469				if (pageout_anon_only_filter && !folio_test_anon(folio))
   470					break;
   471				if (!folio_trylock(folio))
   472					break;
   473				folio_get(folio);
   474				arch_leave_lazy_mmu_mode();
   475				pte_unmap_unlock(start_pte, ptl);
   476				start_pte = NULL;
   477				err = split_folio(folio);
   478				folio_unlock(folio);
   479				folio_put(folio);
   480				if (err)
   481					break;
   482				start_pte = pte =
   483					pte_offset_map_lock(mm, pmd, addr, &ptl);
   484				if (!start_pte)
   485					break;
   486				arch_enter_lazy_mmu_mode();
   487				pte--;
   488				addr -= PAGE_SIZE;
   489				continue;
   490			}
   491	
   492			/*
   493			 * Do not interfere with other mappings of this folio and
   494			 * non-LRU folio.
   495			 */
   496			if (!folio_test_lru(folio) || folio_mapcount(folio) != 1)
   497				continue;
   498	
   499			if (pageout_anon_only_filter && !folio_test_anon(folio))
   500				continue;
   501	
   502			VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
   503	
   504			if (pte_young(ptent)) {
   505				ptent = ptep_get_and_clear_full(mm, addr, pte,
   506								tlb->fullmm);
   507				ptent = pte_mkold(ptent);
   508				set_pte_at(mm, addr, pte, ptent);
   509				tlb_remove_tlb_entry(tlb, pte, addr);
   510			}
   511	
   512			/*
   513			 * We are deactivating a folio for accelerating reclaiming.
   514			 * VM couldn't reclaim the folio unless we clear PG_young.
   515			 * As a side effect, it makes confuse idle-page tracking
   516			 * because they will miss recent referenced history.
   517			 */
   518			folio_clear_referenced(folio);
   519			folio_test_clear_young(folio);
   520			if (folio_test_active(folio))
   521				folio_set_workingset(folio);
   522			if (pageout) {
   523				if (folio_isolate_lru(folio)) {
   524					if (folio_test_unevictable(folio))
   525						folio_putback_lru(folio);
   526					else
   527						list_add(&folio->lru, &folio_list);
   528				}
   529			} else
   530				folio_deactivate(folio);
   531		}
   532	
   533		if (start_pte) {
   534			arch_leave_lazy_mmu_mode();
   535			pte_unmap_unlock(start_pte, ptl);
   536		}
   537		if (pageout)
   538			reclaim_pages(&folio_list);
   539		cond_resched();
   540	
   541		return 0;
   542	}
   543	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
