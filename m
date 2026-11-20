Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189867;
	b=LqmfXEDwSbwxSUJN75CUAPebKbP6Ai4QPg6FYf58NjVyVZpuQOfNzFTTbngnQH4B41Lz
	 s7Am6AMFc69t9l4Akb59rot0hFeOCmrhHpn+gpsTyB/XxyFOqDECGUuKROvBUcMwuUgQL
	 BkUHh8trgz1WzJ+gSmjyFSAdtyIbCB1qysc4nQ5pprxHnTXM1b2C1ZgPsYqEKiN+OX4GO
	 CCll4tDMMxlj0mJRgsm88LvjoOpWuhprhwada1UC4Q0Pvqe10ViL3ubUrry2cIHL4Ct1I
	 Guqlg6e5hXPf/YdIvORj6MwgdOYqCQTfXrQPCmV6cXnbnp4fYwE1HVzzG3AceG15jcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189867;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=a2Pf7EQ+umI9s+sUXWxaeQPYte0MkI8tsywE2nKX8tc=;
	b=xQWX+LztIaX/aiexbUB6DOdkV/chWU1QvmKDZJbRPE/QkkChTf9EnsqvdMKMQXGyBs2a
	 oM1tqOwZAUJuQScPVffdKViD6YAfDGNCBZQdLFuQ6zMUfDeVOU6ii2q2zkwvs+4IJK/v2
	 1GjAKk3BT05Eg65sVmr4antXu0MCrndv4BFCeGmvBLGiGkUa9Ho89+IL33bA2MpNva+I7
	 74oETzGDtopxKVKqPMIBu+SDONwyR2EgZlbYmKNb40aFNFzme+PKD13FhgVQHmGiaLtyk
	 tR5gRdA0zT3Bt4orNIyGspykp0LkthERSMxBhwrVLoKFuG2SXlRlKlkz2PM6NE0Xpew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cmxJl4CY;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF02F606A320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 15:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF02F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cmxJl4CY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795189866; x=1826725866;
  h=date:from:to:cc:subject:message-id;
  bh=plq9uI4RiWYKfYfSnFCZHTnU5qksaz3XF1VWmOUUdZg=;
  b=cmxJl4CY1K6X/pKwy8XMni9T2URzPblkhFoLR07dE6MNDQnHUGrubgdy
   ZyJ6NiLc8nYTKjcUr5QKjAJgE2xxRxQIx7+1N0e/tPOToIeg4UvBCnKG+
   5i+5U+kR3fGW4Qqwrrd++7HaWM5bZX20zBrHBV3uPmKigzNoM90xGg8A9
   UeC3RAIBSgVGrxGg38UZCXKTpTBHyeENxcqzYW8RvyGU1xKWs3vXriT2u
   tDid8peSwBlnJ5juaUgzOgsNWpl+t+1E/kT/y85KKmThCYtz5NSQYgQGE
   K8q4SnBGRWKIbpLlkvmZM/IK5N5oUoAm+rP2w6cFayv4s5mMEJuixHXnH
   w==;
X-CSE-ConnectionGUID: FUA4Xe1GTLe6ksdFzQQ8lA==
X-CSE-MsgGUID: K0nABDvgSaqljjLRawZO0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4074338"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4074338"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:51:06 -0800
X-CSE-ConnectionGUID: iRQb59ThTvqu+8GfkAo0Aw==
X-CSE-MsgGUID: aLvKJIArRASN5Oo1juV1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10848361"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2026 07:51:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUQtA-0000000044b-3HKI;
	Fri, 20 Nov 2026 15:51:00 +0000
Date: Fri, 20 Nov 2026 16:50:16 +0100
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [mm:for-test 9/9] mm/hugetlb.c:5544:38: error: implicit
 declaration of function 'tlb_delay_rmap'; did you mean 'tlb_can_delay_rmap'?
Message-ID: <20261120163957.EF7GtH5c-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mm/linux.git for-test
head:   57851d09ac9eab196459f71a938f26f71f4b82ce
commit: 57851d09ac9eab196459f71a938f26f71f4b82ce [9/9] Merge https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new into for-test
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261120/20261120163957.EF7GtH5c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120163957.EF7GtH5c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120163957.EF7GtH5c-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb.c: In function 'hugetlb_unmap_range':
>> mm/hugetlb.c:5544:38: error: implicit declaration of function 'tlb_delay_rmap'; did you mean 'tlb_can_delay_rmap'? [-Wimplicit-function-declaration]
    5544 |                         delay_rmap = tlb_delay_rmap(tlb);
         |                                      ^~~~~~~~~~~~~~
         |                                      tlb_can_delay_rmap
--
   mm/huge_memory.c: In function 'zap_huge_pmd_folio':
>> mm/huge_memory.c:2552:18: error: too few arguments to function '__tlb_remove_page_size'
    2552 |         else if (__tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE))
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/tlb.h:8,
                    from mm/huge_memory.c:46:
   include/asm-generic/tlb.h:248:6: note: declared here
     248 | bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +5544 mm/hugetlb.c

0fedfe11a346b2 David Hildenbrand (Arm      2026-11-16  5440) 
92daa8652f88c8 Li Zhe                      2026-10-22  5441  static void hugetlb_unmap_range(struct mmu_gather *tlb,
92daa8652f88c8 Li Zhe                      2026-10-22  5442  				struct vm_area_struct *vma, unsigned long start,
92daa8652f88c8 Li Zhe                      2026-10-22  5443  				unsigned long end, struct folio *folio,
92daa8652f88c8 Li Zhe                      2026-10-22  5444  				zap_flags_t zap_flags)
63551ae0feaaa2 David Gibson                2005-06-21  5445  {
63551ae0feaaa2 David Gibson                2005-06-21  5446  	struct mm_struct *mm = vma->vm_mm;
05275594a311cd Fan Ni                      2025-05-05  5447  	const bool folio_provided = !!folio;
63551ae0feaaa2 David Gibson                2005-06-21  5448  	unsigned long address;
c7546f8f03f5a4 David Gibson                2005-08-05  5449  	pte_t *ptep;
63551ae0feaaa2 David Gibson                2005-06-21  5450  	pte_t pte;
cb900f41215447 Kiryl Shutsemau             2013-11-14  5451  	spinlock_t *ptl;
a5516438959d90 Andi Kleen                  2008-07-23  5452  	struct hstate *h = hstate_vma(vma);
a5516438959d90 Andi Kleen                  2008-07-23  5453  	unsigned long sz = huge_page_size(h);
e95a9851787bbb Mike Kravetz                2022-06-21  5454  	unsigned long last_addr_mask;
a5516438959d90 Andi Kleen                  2008-07-23  5455  
5120b1e048d485 Guillaume Morin             2026-07-28  5456  	i_mmap_assert_write_locked(vma->vm_file->f_mapping);
c911e7ebebf58c Lorenzo Stoakes (ARM        2026-10-13  5457) 	WARN_ON(!vma_is_hugetlb(vma));
a5516438959d90 Andi Kleen                  2008-07-23  5458  	BUG_ON(start & ~huge_page_mask(h));
a5516438959d90 Andi Kleen                  2008-07-23  5459  	BUG_ON(end & ~huge_page_mask(h));
63551ae0feaaa2 David Gibson                2005-06-21  5460  
e95a9851787bbb Mike Kravetz                2022-06-21  5461  	last_addr_mask = hugetlb_mask_last_page(h);
569f48b85813f0 Hillf Danton                2014-12-10  5462  	address = start;
569f48b85813f0 Hillf Danton                2014-12-10  5463  	for (; address < end; address += sz) {
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5464) 		bool delay_rmap = false;
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5465) 
9c67a20704e763 Peter Xu                    2022-12-16  5466  		ptep = hugetlb_walk(vma, address, sz);
e95a9851787bbb Mike Kravetz                2022-06-21  5467  		if (!ptep) {
e95a9851787bbb Mike Kravetz                2022-06-21  5468  			address |= last_addr_mask;
c7546f8f03f5a4 David Gibson                2005-08-05  5469  			continue;
e95a9851787bbb Mike Kravetz                2022-06-21  5470  		}
c7546f8f03f5a4 David Gibson                2005-08-05  5471  
cb900f41215447 Kiryl Shutsemau             2013-11-14  5472  		ptl = huge_pte_lock(h, mm, ptep);
8ce720d5bd91e9 David Hildenbrand (Red Hat  2025-12-23  5473) 		if (huge_pmd_unshare(tlb, vma, address, ptep)) {
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5474  			spin_unlock(ptl);
4ddb4d91b82f4b Mike Kravetz                2022-06-21  5475  			address |= last_addr_mask;
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5476  			continue;
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5477  		}
39dde65c9940c9 Kenneth W Chen              2006-12-06  5478  
e6c0c03245b14d Christophe Leroy            2024-07-02  5479  		pte = huge_ptep_get(mm, address, ptep);
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5480  		if (huge_pte_none(pte)) {
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5481  			spin_unlock(ptl);
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5482  			continue;
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5483  		}
6629326b89b6e6 Hillf Danton                2012-03-23  5484  
6629326b89b6e6 Hillf Danton                2012-03-23  5485  		/*
9fbc1f635fd0bd Naoya Horiguchi             2015-02-11  5486  		 * Migrating hugepage or HWPoisoned hugepage is already
9fbc1f635fd0bd Naoya Horiguchi             2015-02-11  5487  		 * unmapped and its refcount is dropped, so just clear pte here.
6629326b89b6e6 Hillf Danton                2012-03-23  5488  		 */
9fbc1f635fd0bd Naoya Horiguchi             2015-02-11  5489  		if (unlikely(!pte_present(pte))) {
05e90bd05eea33 Peter Xu                    2022-05-12  5490  			/*
05e90bd05eea33 Peter Xu                    2022-05-12  5491  			 * If the pte was wr-protected by uffd-wp in any of the
05e90bd05eea33 Peter Xu                    2022-05-12  5492  			 * swap forms, meanwhile the caller does not want to
05e90bd05eea33 Peter Xu                    2022-05-12  5493  			 * drop the uffd-wp bit in this zap, then replace the
05e90bd05eea33 Peter Xu                    2022-05-12  5494  			 * pte with a marker.
05e90bd05eea33 Peter Xu                    2022-05-12  5495  			 */
f6605fc6b14bd5 Josef Bacik                 2026-10-15  5496  			if (userfaultfd_wp(vma) && pte_swp_uffd_any(pte) &&
05e90bd05eea33 Peter Xu                    2022-05-12  5497  			    !(zap_flags & ZAP_FLAG_DROP_MARKER))
05e90bd05eea33 Peter Xu                    2022-05-12  5498  				set_huge_pte_at(mm, address, ptep,
935d4f0c6dc8b3 Ryan Roberts                2023-09-22  5499  						make_pte_marker(PTE_MARKER_UFFD_WP),
935d4f0c6dc8b3 Ryan Roberts                2023-09-22  5500  						sz);
05e90bd05eea33 Peter Xu                    2022-05-12  5501  			else
9386fac34c7cbe Punit Agrawal               2017-07-06  5502  				huge_pte_clear(mm, address, ptep, sz);
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5503  			spin_unlock(ptl);
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5504  			continue;
8c4894c6bc790d Naoya Horiguchi             2012-12-12  5505  		}
6629326b89b6e6 Hillf Danton                2012-03-23  5506  
04f2cbe35699d2 Mel Gorman                  2008-07-23  5507  		/*
7f4b6065d9a842 Fan Ni                      2025-05-05  5508  		 * If a folio is supplied, it is because a specific
7f4b6065d9a842 Fan Ni                      2025-05-05  5509  		 * folio is being unmapped, not a range. Ensure the folio we
7f4b6065d9a842 Fan Ni                      2025-05-05  5510  		 * are about to unmap is the actual folio of interest.
04f2cbe35699d2 Mel Gorman                  2008-07-23  5511  		 */
05275594a311cd Fan Ni                      2025-05-05  5512  		if (folio_provided) {
05275594a311cd Fan Ni                      2025-05-05  5513  			if (folio != page_folio(pte_page(pte))) {
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5514  				spin_unlock(ptl);
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5515  				continue;
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5516  			}
04f2cbe35699d2 Mel Gorman                  2008-07-23  5517  			/*
04f2cbe35699d2 Mel Gorman                  2008-07-23  5518  			 * Mark the VMA as having unmapped its page so that
04f2cbe35699d2 Mel Gorman                  2008-07-23  5519  			 * future faults in this VMA will fail rather than
04f2cbe35699d2 Mel Gorman                  2008-07-23  5520  			 * looking like data was lost
04f2cbe35699d2 Mel Gorman                  2008-07-23  5521  			 */
04f2cbe35699d2 Mel Gorman                  2008-07-23  5522  			set_vma_resv_flags(vma, HPAGE_RESV_UNMAPPED);
05275594a311cd Fan Ni                      2025-05-05  5523  		} else {
05275594a311cd Fan Ni                      2025-05-05  5524  			folio = page_folio(pte_page(pte));
04f2cbe35699d2 Mel Gorman                  2008-07-23  5525  		}
04f2cbe35699d2 Mel Gorman                  2008-07-23  5526  
02410ac72ac370 Ryan Roberts                2025-02-26  5527  		pte = huge_ptep_get_and_clear(mm, address, ptep, sz);
b528e4b6405b9f Aneesh Kumar K.V            2016-12-12  5528  		tlb_remove_huge_tlb_entry(h, tlb, ptep, address);
106c992a5ebef2 Gerald Schaefer             2013-04-29  5529  		if (huge_pte_dirty(pte))
05275594a311cd Fan Ni                      2025-05-05  5530  			folio_mark_dirty(folio);
05e90bd05eea33 Peter Xu                    2022-05-12  5531  		/* Leave a uffd-wp pte marker if needed */
f6605fc6b14bd5 Josef Bacik                 2026-10-15  5532  		if (userfaultfd_wp(vma) && huge_pte_uffd(pte) &&
05e90bd05eea33 Peter Xu                    2022-05-12  5533  		    !(zap_flags & ZAP_FLAG_DROP_MARKER))
05e90bd05eea33 Peter Xu                    2022-05-12  5534  			set_huge_pte_at(mm, address, ptep,
935d4f0c6dc8b3 Ryan Roberts                2023-09-22  5535  					make_pte_marker(PTE_MARKER_UFFD_WP),
935d4f0c6dc8b3 Ryan Roberts                2023-09-22  5536  					sz);
5d317b2b653659 Naoya Horiguchi             2015-11-05  5537  		hugetlb_count_sub(pages_per_huge_page(h), mm);
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5538) 		/*
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5539) 		 * hugetlb_wp() uses mapcount to decide whether an anonymous
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5540) 		 * folio can be reused. Delay rmap removal until stale TLB
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5541) 		 * entries are gone, unless the mm has no users left.
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5542) 		 */
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5543) 		if (folio_test_anon(folio) && !tlb->fullmm) {
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16 @5544) 			delay_rmap = tlb_delay_rmap(tlb);
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5545) 			/*
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5546) 			 * Without delay-rmap support, just flush before
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5547) 			 * dropping the PTL. Except with MMU_GATHER_NO_GATHER
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5548) 			 * where clearing already flushed the TLB.
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5549) 			 */
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5550) 			if (!delay_rmap && !IS_ENABLED(CONFIG_MMU_GATHER_NO_GATHER))
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5551) 				flush_hugetlb_tlb_range(vma, address, address + sz);
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5552) 		}
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5553) 		if (!delay_rmap)
05275594a311cd Fan Ni                      2025-05-05  5554  			hugetlb_remove_rmap(folio);
21cc2b5c5062a2 Jeongjun Park               2025-08-24  5555  		spin_unlock(ptl);
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5556  
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5557) 		if (!delay_rmap)
0fedfe11a346b2 David Hildenbrand (Arm      2026-11-16  5558) 			hugetlb_folio_restore_rsv_on_unmap(vma, folio);
df7a6d1f64056a Breno Leitao                2024-02-05  5559  
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5560) 		if (__tlb_remove_page_size(tlb, folio_page(folio, 0), sz,
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5561) 					   delay_rmap)) {
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5562) 			tlb_flush_mmu_tlbonly(tlb);
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5563) 			tlb_flush_rmaps(tlb, vma);
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5564) 			tlb_flush_mmu(tlb);
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5565) 		}
24669e58477e27 Aneesh Kumar K.V            2012-07-31  5566  		/*
7f4b6065d9a842 Fan Ni                      2025-05-05  5567  		 * If we were instructed to unmap a specific folio, we're done.
24669e58477e27 Aneesh Kumar K.V            2012-07-31  5568  		 */
05275594a311cd Fan Ni                      2025-05-05  5569  		if (folio_provided)
31d49da5ad0172 Aneesh Kumar K.V            2016-07-26  5570  			break;
fe1668ae5bf014 Kenneth W Chen              2006-10-04  5571  	}
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5572) 
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5573) 	if (tlb->delayed_rmap) {
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5574) 		tlb_flush_mmu_tlbonly(tlb);
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5575) 		tlb_flush_rmaps(tlb, vma);
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5576) 		tlb_flush_mmu(tlb);
a8ce63a2d6e62a David Hildenbrand (Arm      2026-11-16  5577) 	}
92daa8652f88c8 Li Zhe                      2026-10-22  5578  }
92daa8652f88c8 Li Zhe                      2026-10-22  5579  

:::::: The code at line 5544 was first introduced by commit
:::::: a8ce63a2d6e62a97bb426cf65f3a1d4f91db31ce mm/hugetlb: delay anon folio rmap removal until after the TLB flush

:::::: TO: David Hildenbrand (Arm) <david@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
