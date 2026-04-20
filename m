Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805F038F947
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681471; cv=none; b=ksMHHXVIlUX+nVtRUc8LGJRHYRzjOdZysT3HcCb1Gw49UCWWZL2gsrOjCGBOZGpcw3AxYC4CsQbWsx+HocTkzySbtnlSlPLLh/9q4etaPkEPBxCj+wJdJrRu4EnpcBKl0WCTkUcC0MSkv/9v7Hj1w37tgFFCRafyNB7MDs05lf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681471; c=relaxed/simple;
	bh=OaE38/iRBA+h8dIt0HLOjTwkkcZL5TkX9uKx4DWNCDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MHWjIcWFlW8hv7xmiHMaliKufWu5/00CFkPCZI8blFJnRCa1zUPPhyzXy8TAFGkHGaY+Yhmkkyhs6v7xL97dGHQKvL3nGdTnWp9+H5fyMT+UUF36Jtj824an15J1bWn3deo/xrQEmxUJHEPezJHa9xR8DlKS0yFEDQKN1yUp00w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIliaU6P; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIliaU6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776681470; x=1808217470;
  h=date:from:to:cc:subject:message-id;
  bh=OaE38/iRBA+h8dIt0HLOjTwkkcZL5TkX9uKx4DWNCDI=;
  b=TIliaU6PkSJWR8XRTuF51PXB5YaZ4UfVFj6+N5ECcX1gD+WKyjzw3krN
   4whmArN40An4rKCgKypBiQOU5P05JKt7AYmAjQI8Uto7B8aznjxYVRZYn
   q/CXpheXiquWIk0iuvDbHhgnB5t2dAWDqJ39uJ9Nqf7gptnSkSkrAQ/YE
   cbbmIliDlFSHYK/FfhVoXF2Q2Yt3ws2gdhqQy7bSsRIiG49AUsQVg9eMD
   0VAUgENdJOKesErNChfgq6QaFBF5ilpkNvQeSZPXoEvgfhc2txw7+07TS
   TX0SSytC0DI//PkrTOFq1m8HTXfoZfLKbhYunNDlSaKUWcMvQs9xXe3n8
   w==;
X-CSE-ConnectionGUID: 4sLphNlARDuAETUEqa3DwA==
X-CSE-MsgGUID: 7Yz+fACkTlq8i3xz1P/p0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81464768"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="81464768"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 03:37:49 -0700
X-CSE-ConnectionGUID: szzmilrLQ6KuzPgDa0T8Fw==
X-CSE-MsgGUID: 1Qb8u9l/Sn2Roy/JMez8Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="233451974"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Apr 2026 03:37:47 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEm0e-000000002Kq-458Q;
	Mon, 20 Apr 2026 10:37:45 +0000
Date: Mon, 20 Apr 2026 18:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:uffd/rfc-v3 2/9] mm/huge_memory.c:2644:43: error:
 'PAGE_NONE' undeclared; did you mean 'PAGE_U_NONE'?
Message-ID: <202604201849.LXRq9cVf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd/rfc-v3
head:   fa6a4bc0ae172e756264bbe74bea1d95acb29b02
commit: 25dab3d3a0ffa02119bbf5873d46ba0af562a502 [2/9] mm: add MM_CP_UFFD_RWP change_protection() flag
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260420/202604201849.LXRq9cVf-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201849.LXRq9cVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604201849.LXRq9cVf-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/huge_memory.c: In function 'change_huge_pmd':
>> mm/huge_memory.c:2644:43: error: 'PAGE_NONE' undeclared (first use in this function); did you mean 'PAGE_U_NONE'?
    2644 |                 entry = pmd_modify(entry, PAGE_NONE);
         |                                           ^~~~~~~~~
         |                                           PAGE_U_NONE
   mm/huge_memory.c:2644:43: note: each undeclared identifier is reported only once for each function it appears in


vim +2644 mm/huge_memory.c

  2550	
  2551	/*
  2552	 * Returns
  2553	 *  - 0 if PMD could not be locked
  2554	 *  - 1 if PMD was locked but protections unchanged and TLB flush unnecessary
  2555	 *      or if prot_numa but THP migration is not supported
  2556	 *  - HPAGE_PMD_NR if protections changed and TLB flush necessary
  2557	 */
  2558	int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
  2559			    pmd_t *pmd, unsigned long addr, pgprot_t newprot,
  2560			    unsigned long cp_flags)
  2561	{
  2562		struct mm_struct *mm = vma->vm_mm;
  2563		spinlock_t *ptl;
  2564		pmd_t oldpmd, entry;
  2565		bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
  2566		bool uffd_rwp = cp_flags & MM_CP_UFFD_RWP;
  2567		bool uffd_rwp_resolve = cp_flags & MM_CP_UFFD_RWP_RESOLVE;
  2568		bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
  2569		bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
  2570		int ret = 1;
  2571	
  2572		tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
  2573	
  2574		if (prot_numa && !thp_migration_supported())
  2575			return 1;
  2576	
  2577		ptl = __pmd_trans_huge_lock(pmd, vma);
  2578		if (!ptl)
  2579			return 0;
  2580	
  2581		if (thp_migration_supported() && pmd_is_valid_softleaf(*pmd)) {
  2582			change_non_present_huge_pmd(mm, addr, pmd,
  2583						    uffd_wp || uffd_rwp,
  2584						    uffd_wp_resolve || uffd_rwp_resolve);
  2585			goto unlock;
  2586		}
  2587	
  2588		/* Already in the desired state */
  2589		if (prot_numa && pmd_protnone(*pmd))
  2590			goto unlock;
  2591		if (uffd_rwp && pmd_protnone(*pmd) && pmd_uffd_wp(*pmd))
  2592			goto unlock;
  2593	
  2594		if (prot_numa) {
  2595	
  2596			/*
  2597			 * Avoid trapping faults against the zero page. The read-only
  2598			 * data is likely to be read-cached on the local CPU and
  2599			 * local/remote hits to the zero page are not interesting.
  2600			 */
  2601			if (is_huge_zero_pmd(*pmd))
  2602				goto unlock;
  2603	
  2604			if (!folio_can_map_prot_numa(pmd_folio(*pmd), vma,
  2605						     vma_is_single_threaded_private(vma)))
  2606				goto unlock;
  2607		}
  2608		/*
  2609		 * In case prot_numa, we are under mmap_read_lock(mm). It's critical
  2610		 * to not clear pmd intermittently to avoid race with MADV_DONTNEED
  2611		 * which is also under mmap_read_lock(mm):
  2612		 *
  2613		 *	CPU0:				CPU1:
  2614		 *				change_huge_pmd(prot_numa=1)
  2615		 *				 pmdp_huge_get_and_clear_notify()
  2616		 * madvise_dontneed()
  2617		 *  zap_pmd_range()
  2618		 *   pmd_trans_huge(*pmd) == 0 (without ptl)
  2619		 *   // skip the pmd
  2620		 *				 set_pmd_at();
  2621		 *				 // pmd is re-established
  2622		 *
  2623		 * The race makes MADV_DONTNEED miss the huge pmd and don't clear it
  2624		 * which may break userspace.
  2625		 *
  2626		 * pmdp_invalidate_ad() is required to make sure we don't miss
  2627		 * dirty/young flags set by hardware.
  2628		 */
  2629		oldpmd = pmdp_invalidate_ad(vma, addr, pmd);
  2630	
  2631		entry = pmd_modify(oldpmd, newprot);
  2632		if (uffd_wp || uffd_rwp)
  2633			entry = pmd_mkuffd_wp(entry);
  2634		else if (uffd_wp_resolve || uffd_rwp_resolve)
  2635			/*
  2636			 * Leave the write bit to be handled by PF interrupt
  2637			 * handler, then things like COW could be properly
  2638			 * handled.
  2639			 */
  2640			entry = pmd_clear_uffd_wp(entry);
  2641	
  2642		/* See change_pte_range(): preserve RWP protection across mprotect() */
  2643		if (userfaultfd_rwp(vma) && pmd_uffd_wp(entry))
> 2644			entry = pmd_modify(entry, PAGE_NONE);
  2645	
  2646		/* See change_pte_range(). */
  2647		if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) && !pmd_write(entry) &&
  2648		    can_change_pmd_writable(vma, addr, entry))
  2649			entry = pmd_mkwrite(entry, vma);
  2650	
  2651		ret = HPAGE_PMD_NR;
  2652		set_pmd_at(mm, addr, pmd, entry);
  2653	
  2654		if (huge_pmd_needs_flush(oldpmd, entry))
  2655			tlb_flush_pmd_range(tlb, addr, HPAGE_PMD_SIZE);
  2656	unlock:
  2657		spin_unlock(ptl);
  2658		return ret;
  2659	}
  2660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
