Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB5120C00A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770001826; cv=none; b=ixWh3/CbmNZC5zzK7Rv2JPcJUyWNkg1FoBsoyMj+cKnFG1kd82TcsgH0Bj15DYvzrr/+LLAkTbseA45E4Vzs8v1TUIWpa5li0jW+L1JE6bZLM782d/Jl/Nv5dSmvYTZCjAGhl4pPMDMYDKP9StJYjpJwrZmg5MC8M1n6u9ggmYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770001826; c=relaxed/simple;
	bh=OJ6x+8p7RS3p1oOyWD9XlLYDeF3QIp9n1oIbQWGI4GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXz2vOQIYUOJKrsRGmuykiqwwzslCAPKi4eDRLc3IfnxOJz+z8kOI8f1Jg5nIY6TJQH6oXEPA5DmLzkNYD+EnjclbRzI4KGyquc9wgud5LlztOwxWcOdJcQsYp7PZ2GluEBCpD08FkJNnQD0AS+wi3QyRBQMAmUrFlg2WmfQ+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkgsSaI/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkgsSaI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770001824; x=1801537824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OJ6x+8p7RS3p1oOyWD9XlLYDeF3QIp9n1oIbQWGI4GA=;
  b=OkgsSaI/Rm+dtk3zUWtxbbDQQF6IoF4lQrZ22yXRb9/N8GnftXL4gnO3
   8x5oLJZRD4VC/muuYFhjVl0yTfARVRKMPfTzkct3jvBncnfIj2him/B2l
   csFFh0XoJ1B6OTARPD/69YufEbjBa+M2rmEq73SxjNVkwkLLfqQPC93bO
   jk/iJ+jYmUhiUmmbb/I0gHqc+5KVkh0USuGU8nEm9S/bCdIuOqB56Qmpz
   kR2oRQBQc97vsjUEyimMPQ40emN1Ed7YriePNJEZfDeO9DDxYq8TT9PHv
   EuK+TlXSZ9k532ON4eSXDn3rrA2fyebCVP0iBGJeXbMPb106QYg6i9KWh
   A==;
X-CSE-ConnectionGUID: R+GVNnC8RleXhIee8ekSjQ==
X-CSE-MsgGUID: 74MjmqXTQza+5WVBBkTpZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="88735732"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="88735732"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 19:10:23 -0800
X-CSE-ConnectionGUID: 8hbuZs0qQHqows2VRa0CGA==
X-CSE-MsgGUID: 0hNUKyXBTciP47pymgRmNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="209707515"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Feb 2026 19:10:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmkKR-00000000fCm-3Lah;
	Mon, 02 Feb 2026 03:10:19 +0000
Date: Mon, 2 Feb 2026 11:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 01/12] mm: add PUD THP ptdesc and rmap support
Message-ID: <202602021158.RvuFv8Nm-lkp@intel.com>
References: <20260202005451.774496-2-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202005451.774496-2-usamaarif642@gmail.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-add-PUD-THP-ptdesc-and-rmap-support/20260202-085725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260202005451.774496-2-usamaarif642%40gmail.com
patch subject: [RFC 01/12] mm: add PUD THP ptdesc and rmap support
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260202/202602021158.RvuFv8Nm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021158.RvuFv8Nm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021158.RvuFv8Nm-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/rmap.c: In function 'try_to_unmap_one':
>> mm/rmap.c:2106:41: error: implicit declaration of function 'split_huge_pud_locked'; did you mean 'split_huge_pmd_locked'? [-Werror=implicit-function-declaration]
    2106 |                                         split_huge_pud_locked(vma, pvmw.pud, pvmw.address);
         |                                         ^~~~~~~~~~~~~~~~~~~~~
         |                                         split_huge_pmd_locked
   cc1: some warnings being treated as errors


vim +2106 mm/rmap.c

  2010	
  2011	/*
  2012	 * @arg: enum ttu_flags will be passed to this argument
  2013	 */
  2014	static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
  2015			     unsigned long address, void *arg)
  2016	{
  2017		struct mm_struct *mm = vma->vm_mm;
  2018		DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
  2019		bool anon_exclusive, ret = true;
  2020		pte_t pteval;
  2021		struct page *subpage;
  2022		struct mmu_notifier_range range;
  2023		enum ttu_flags flags = (enum ttu_flags)(long)arg;
  2024		unsigned long nr_pages = 1, end_addr;
  2025		unsigned long pfn;
  2026		unsigned long hsz = 0;
  2027		int ptes = 0;
  2028	
  2029		/*
  2030		 * When racing against e.g. zap_pte_range() on another cpu,
  2031		 * in between its ptep_get_and_clear_full() and folio_remove_rmap_*(),
  2032		 * try_to_unmap() may return before page_mapped() has become false,
  2033		 * if page table locking is skipped: use TTU_SYNC to wait for that.
  2034		 */
  2035		if (flags & TTU_SYNC)
  2036			pvmw.flags = PVMW_SYNC;
  2037	
  2038		/*
  2039		 * For THP, we have to assume the worse case ie pmd for invalidation.
  2040		 * For hugetlb, it could be much worse if we need to do pud
  2041		 * invalidation in the case of pmd sharing.
  2042		 *
  2043		 * Note that the folio can not be freed in this function as call of
  2044		 * try_to_unmap() must hold a reference on the folio.
  2045		 */
  2046		range.end = vma_address_end(&pvmw);
  2047		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
  2048					address, range.end);
  2049		if (folio_test_hugetlb(folio)) {
  2050			/*
  2051			 * If sharing is possible, start and end will be adjusted
  2052			 * accordingly.
  2053			 */
  2054			adjust_range_if_pmd_sharing_possible(vma, &range.start,
  2055							     &range.end);
  2056	
  2057			/* We need the huge page size for set_huge_pte_at() */
  2058			hsz = huge_page_size(hstate_vma(vma));
  2059		}
  2060		mmu_notifier_invalidate_range_start(&range);
  2061	
  2062		while (page_vma_mapped_walk(&pvmw)) {
  2063			/*
  2064			 * If the folio is in an mlock()d vma, we must not swap it out.
  2065			 */
  2066			if (!(flags & TTU_IGNORE_MLOCK) &&
  2067			    (vma->vm_flags & VM_LOCKED)) {
  2068				ptes++;
  2069	
  2070				/*
  2071				 * Set 'ret' to indicate the page cannot be unmapped.
  2072				 *
  2073				 * Do not jump to walk_abort immediately as additional
  2074				 * iteration might be required to detect fully mapped
  2075				 * folio an mlock it.
  2076				 */
  2077				ret = false;
  2078	
  2079				/* Only mlock fully mapped pages */
  2080				if (pvmw.pte && ptes != pvmw.nr_pages)
  2081					continue;
  2082	
  2083				/*
  2084				 * All PTEs must be protected by page table lock in
  2085				 * order to mlock the page.
  2086				 *
  2087				 * If page table boundary has been cross, current ptl
  2088				 * only protect part of ptes.
  2089				 */
  2090				if (pvmw.flags & PVMW_PGTABLE_CROSSED)
  2091					goto walk_done;
  2092	
  2093				/* Restore the mlock which got missed */
  2094				mlock_vma_folio(folio, vma);
  2095				goto walk_done;
  2096			}
  2097	
  2098			if (!pvmw.pte) {
  2099				/*
  2100				 * Check for PUD-mapped THP first.
  2101				 * If we have a PUD mapping and TTU_SPLIT_HUGE_PUD is set,
  2102				 * split the PUD to PMD level and restart the walk.
  2103				 */
  2104				if (pvmw.pud && pud_trans_huge(*pvmw.pud)) {
  2105					if (flags & TTU_SPLIT_HUGE_PUD) {
> 2106						split_huge_pud_locked(vma, pvmw.pud, pvmw.address);
  2107						flags &= ~TTU_SPLIT_HUGE_PUD;
  2108						page_vma_mapped_walk_restart(&pvmw);
  2109						continue;
  2110					}
  2111				}
  2112	
  2113				if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
  2114					if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
  2115						goto walk_done;
  2116					/*
  2117					 * unmap_huge_pmd_locked has either already marked
  2118					 * the folio as swap-backed or decided to retain it
  2119					 * due to GUP or speculative references.
  2120					 */
  2121					goto walk_abort;
  2122				}
  2123	
  2124				if (flags & TTU_SPLIT_HUGE_PMD) {
  2125					/*
  2126					 * We temporarily have to drop the PTL and
  2127					 * restart so we can process the PTE-mapped THP.
  2128					 */
  2129					split_huge_pmd_locked(vma, pvmw.address,
  2130							      pvmw.pmd, false);
  2131					flags &= ~TTU_SPLIT_HUGE_PMD;
  2132					page_vma_mapped_walk_restart(&pvmw);
  2133					continue;
  2134				}
  2135			}
  2136	
  2137			/* Unexpected PMD-mapped THP? */
  2138			VM_BUG_ON_FOLIO(!pvmw.pte, folio);
  2139	
  2140			/*
  2141			 * Handle PFN swap PTEs, such as device-exclusive ones, that
  2142			 * actually map pages.
  2143			 */
  2144			pteval = ptep_get(pvmw.pte);
  2145			if (likely(pte_present(pteval))) {
  2146				pfn = pte_pfn(pteval);
  2147			} else {
  2148				const softleaf_t entry = softleaf_from_pte(pteval);
  2149	
  2150				pfn = softleaf_to_pfn(entry);
  2151				VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
  2152			}
  2153	
  2154			subpage = folio_page(folio, pfn - folio_pfn(folio));
  2155			address = pvmw.address;
  2156			anon_exclusive = folio_test_anon(folio) &&
  2157					 PageAnonExclusive(subpage);
  2158	
  2159			if (folio_test_hugetlb(folio)) {
  2160				bool anon = folio_test_anon(folio);
  2161	
  2162				/*
  2163				 * The try_to_unmap() is only passed a hugetlb page
  2164				 * in the case where the hugetlb page is poisoned.
  2165				 */
  2166				VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
  2167				/*
  2168				 * huge_pmd_unshare may unmap an entire PMD page.
  2169				 * There is no way of knowing exactly which PMDs may
  2170				 * be cached for this mm, so we must flush them all.
  2171				 * start/end were already adjusted above to cover this
  2172				 * range.
  2173				 */
  2174				flush_cache_range(vma, range.start, range.end);
  2175	
  2176				/*
  2177				 * To call huge_pmd_unshare, i_mmap_rwsem must be
  2178				 * held in write mode.  Caller needs to explicitly
  2179				 * do this outside rmap routines.
  2180				 *
  2181				 * We also must hold hugetlb vma_lock in write mode.
  2182				 * Lock order dictates acquiring vma_lock BEFORE
  2183				 * i_mmap_rwsem.  We can only try lock here and fail
  2184				 * if unsuccessful.
  2185				 */
  2186				if (!anon) {
  2187					struct mmu_gather tlb;
  2188	
  2189					VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
  2190					if (!hugetlb_vma_trylock_write(vma))
  2191						goto walk_abort;
  2192	
  2193					tlb_gather_mmu_vma(&tlb, vma);
  2194					if (huge_pmd_unshare(&tlb, vma, address, pvmw.pte)) {
  2195						hugetlb_vma_unlock_write(vma);
  2196						huge_pmd_unshare_flush(&tlb, vma);
  2197						tlb_finish_mmu(&tlb);
  2198						/*
  2199						 * The PMD table was unmapped,
  2200						 * consequently unmapping the folio.
  2201						 */
  2202						goto walk_done;
  2203					}
  2204					hugetlb_vma_unlock_write(vma);
  2205					tlb_finish_mmu(&tlb);
  2206				}
  2207				pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
  2208				if (pte_dirty(pteval))
  2209					folio_mark_dirty(folio);
  2210			} else if (likely(pte_present(pteval))) {
  2211				nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
  2212				end_addr = address + nr_pages * PAGE_SIZE;
  2213				flush_cache_range(vma, address, end_addr);
  2214	
  2215				/* Nuke the page table entry. */
  2216				pteval = get_and_clear_ptes(mm, address, pvmw.pte, nr_pages);
  2217				/*
  2218				 * We clear the PTE but do not flush so potentially
  2219				 * a remote CPU could still be writing to the folio.
  2220				 * If the entry was previously clean then the
  2221				 * architecture must guarantee that a clear->dirty
  2222				 * transition on a cached TLB entry is written through
  2223				 * and traps if the PTE is unmapped.
  2224				 */
  2225				if (should_defer_flush(mm, flags))
  2226					set_tlb_ubc_flush_pending(mm, pteval, address, end_addr);
  2227				else
  2228					flush_tlb_range(vma, address, end_addr);
  2229				if (pte_dirty(pteval))
  2230					folio_mark_dirty(folio);
  2231			} else {
  2232				pte_clear(mm, address, pvmw.pte);
  2233			}
  2234	
  2235			/*
  2236			 * Now the pte is cleared. If this pte was uffd-wp armed,
  2237			 * we may want to replace a none pte with a marker pte if
  2238			 * it's file-backed, so we don't lose the tracking info.
  2239			 */
  2240			pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
  2241	
  2242			/* Update high watermark before we lower rss */
  2243			update_hiwater_rss(mm);
  2244	
  2245			if (PageHWPoison(subpage) && (flags & TTU_HWPOISON)) {
  2246				pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
  2247				if (folio_test_hugetlb(folio)) {
  2248					hugetlb_count_sub(folio_nr_pages(folio), mm);
  2249					set_huge_pte_at(mm, address, pvmw.pte, pteval,
  2250							hsz);
  2251				} else {
  2252					dec_mm_counter(mm, mm_counter(folio));
  2253					set_pte_at(mm, address, pvmw.pte, pteval);
  2254				}
  2255			} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
  2256				   !userfaultfd_armed(vma)) {
  2257				/*
  2258				 * The guest indicated that the page content is of no
  2259				 * interest anymore. Simply discard the pte, vmscan
  2260				 * will take care of the rest.
  2261				 * A future reference will then fault in a new zero
  2262				 * page. When userfaultfd is active, we must not drop
  2263				 * this page though, as its main user (postcopy
  2264				 * migration) will not expect userfaults on already
  2265				 * copied pages.
  2266				 */
  2267				dec_mm_counter(mm, mm_counter(folio));
  2268			} else if (folio_test_anon(folio)) {
  2269				swp_entry_t entry = page_swap_entry(subpage);
  2270				pte_t swp_pte;
  2271				/*
  2272				 * Store the swap location in the pte.
  2273				 * See handle_pte_fault() ...
  2274				 */
  2275				if (unlikely(folio_test_swapbacked(folio) !=
  2276						folio_test_swapcache(folio))) {
  2277					WARN_ON_ONCE(1);
  2278					goto walk_abort;
  2279				}
  2280	
  2281				/* MADV_FREE page check */
  2282				if (!folio_test_swapbacked(folio)) {
  2283					int ref_count, map_count;
  2284	
  2285					/*
  2286					 * Synchronize with gup_pte_range():
  2287					 * - clear PTE; barrier; read refcount
  2288					 * - inc refcount; barrier; read PTE
  2289					 */
  2290					smp_mb();
  2291	
  2292					ref_count = folio_ref_count(folio);
  2293					map_count = folio_mapcount(folio);
  2294	
  2295					/*
  2296					 * Order reads for page refcount and dirty flag
  2297					 * (see comments in __remove_mapping()).
  2298					 */
  2299					smp_rmb();
  2300	
  2301					if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
  2302						/*
  2303						 * redirtied either using the page table or a previously
  2304						 * obtained GUP reference.
  2305						 */
  2306						set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
  2307						folio_set_swapbacked(folio);
  2308						goto walk_abort;
  2309					} else if (ref_count != 1 + map_count) {
  2310						/*
  2311						 * Additional reference. Could be a GUP reference or any
  2312						 * speculative reference. GUP users must mark the folio
  2313						 * dirty if there was a modification. This folio cannot be
  2314						 * reclaimed right now either way, so act just like nothing
  2315						 * happened.
  2316						 * We'll come back here later and detect if the folio was
  2317						 * dirtied when the additional reference is gone.
  2318						 */
  2319						set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
  2320						goto walk_abort;
  2321					}
  2322					add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
  2323					goto discard;
  2324				}
  2325	
  2326				if (folio_dup_swap(folio, subpage) < 0) {
  2327					set_pte_at(mm, address, pvmw.pte, pteval);
  2328					goto walk_abort;
  2329				}
  2330	
  2331				/*
  2332				 * arch_unmap_one() is expected to be a NOP on
  2333				 * architectures where we could have PFN swap PTEs,
  2334				 * so we'll not check/care.
  2335				 */
  2336				if (arch_unmap_one(mm, vma, address, pteval) < 0) {
  2337					folio_put_swap(folio, subpage);
  2338					set_pte_at(mm, address, pvmw.pte, pteval);
  2339					goto walk_abort;
  2340				}
  2341	
  2342				/* See folio_try_share_anon_rmap(): clear PTE first. */
  2343				if (anon_exclusive &&
  2344				    folio_try_share_anon_rmap_pte(folio, subpage)) {
  2345					folio_put_swap(folio, subpage);
  2346					set_pte_at(mm, address, pvmw.pte, pteval);
  2347					goto walk_abort;
  2348				}
  2349				if (list_empty(&mm->mmlist)) {
  2350					spin_lock(&mmlist_lock);
  2351					if (list_empty(&mm->mmlist))
  2352						list_add(&mm->mmlist, &init_mm.mmlist);
  2353					spin_unlock(&mmlist_lock);
  2354				}
  2355				dec_mm_counter(mm, MM_ANONPAGES);
  2356				inc_mm_counter(mm, MM_SWAPENTS);
  2357				swp_pte = swp_entry_to_pte(entry);
  2358				if (anon_exclusive)
  2359					swp_pte = pte_swp_mkexclusive(swp_pte);
  2360				if (likely(pte_present(pteval))) {
  2361					if (pte_soft_dirty(pteval))
  2362						swp_pte = pte_swp_mksoft_dirty(swp_pte);
  2363					if (pte_uffd_wp(pteval))
  2364						swp_pte = pte_swp_mkuffd_wp(swp_pte);
  2365				} else {
  2366					if (pte_swp_soft_dirty(pteval))
  2367						swp_pte = pte_swp_mksoft_dirty(swp_pte);
  2368					if (pte_swp_uffd_wp(pteval))
  2369						swp_pte = pte_swp_mkuffd_wp(swp_pte);
  2370				}
  2371				set_pte_at(mm, address, pvmw.pte, swp_pte);
  2372			} else {
  2373				/*
  2374				 * This is a locked file-backed folio,
  2375				 * so it cannot be removed from the page
  2376				 * cache and replaced by a new folio before
  2377				 * mmu_notifier_invalidate_range_end, so no
  2378				 * concurrent thread might update its page table
  2379				 * to point at a new folio while a device is
  2380				 * still using this folio.
  2381				 *
  2382				 * See Documentation/mm/mmu_notifier.rst
  2383				 */
  2384				add_mm_counter(mm, mm_counter_file(folio), -nr_pages);
  2385			}
  2386	discard:
  2387			if (unlikely(folio_test_hugetlb(folio))) {
  2388				hugetlb_remove_rmap(folio);
  2389			} else {
  2390				folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
  2391			}
  2392			if (vma->vm_flags & VM_LOCKED)
  2393				mlock_drain_local();
  2394			folio_put_refs(folio, nr_pages);
  2395	
  2396			/*
  2397			 * If we are sure that we batched the entire folio and cleared
  2398			 * all PTEs, we can just optimize and stop right here.
  2399			 */
  2400			if (nr_pages == folio_nr_pages(folio))
  2401				goto walk_done;
  2402			continue;
  2403	walk_abort:
  2404			ret = false;
  2405	walk_done:
  2406			page_vma_mapped_walk_done(&pvmw);
  2407			break;
  2408		}
  2409	
  2410		mmu_notifier_invalidate_range_end(&range);
  2411	
  2412		return ret;
  2413	}
  2414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
