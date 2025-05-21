Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4D5224D6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 03:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747798515; cv=none; b=hTqi8zjWBYMFD5/nUih6Vo9Ghn+UyEyoOCS2zo/cT5ziHyjVEKmoF9jZJsMWsvDOkkIUZ/bJYfY9kLTUGkw0VdcNQ+rzTY3hLresdfIHeqgCvCl5+tBzJqEeOtNUqQJr10mhMNUX3PoTZBYL/AN4IzAlYT63/hzACTonYw9ls1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747798515; c=relaxed/simple;
	bh=ABrEtHOt3Kn948L8KIjbR+/udF/psP/luqimMR+MQa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PdgxfPHLbE+/BSN/jHwZ1oGwIt+vhhyMVlPaw2FcI8vJpm5SEjTtkm2a391bq57mIBh+qpz5/N8x7MNazatASV1V8h1nuuO/i/vrMlEqFq32hTxS1yRTSmJHSN10AGIq3Mwbd2QMoeayZo/ImavWrVK2kjCJHEbgfbt6ZGdRkBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Afb9/0fw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Afb9/0fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747798513; x=1779334513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ABrEtHOt3Kn948L8KIjbR+/udF/psP/luqimMR+MQa4=;
  b=Afb9/0fweaQSC+vc9FvSMxYVGiz7zhZsrU4+NuHBHsxg+QF6CXFWRpzb
   5skyF7kdH8p6UF+UOGDk61VZrbr5ZQ2scikDaY0LljlYuSFc7j273eDoQ
   QJC4XgTfpMsHqQjLUitc4pAGrZm+Slk0qLrTUM3Z8I3fe0sp8Ec2yKJOE
   I4g38T23IVZXbw1JSwI/bDB1Uqc+Y/YGhUf6TWuZAbSDAnVFIa44ioK61
   9POuL+BDrB5O9p4CT2zh4/CUnbD1S6un2oIrWz4urgtk3n3Sh2oDI0YMC
   /Otd7hOfME8F46n12wKU18g+C7y7+cwCIpBahEixQnjobnkKL+5hSdM70
   A==;
X-CSE-ConnectionGUID: YVX2eaZvS/CivMyCCNMp3Q==
X-CSE-MsgGUID: J5HUrrj/S4ipw0NkCgn4RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49819080"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49819080"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:35:11 -0700
X-CSE-ConnectionGUID: uzm9T5H/SoqSJ2J90oJdIw==
X-CSE-MsgGUID: YhkfZfU6SZi6f8qgTdVtCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139731737"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2025 20:35:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHaEV-000Npo-1u;
	Wed, 21 May 2025 03:35:07 +0000
Date: Wed, 21 May 2025 11:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 16/20] mm/page_isolation.c:95:63: error:
 implicit declaration of function '__folio_test_movable'; did you mean
 '__folio_set_pgtable'?
Message-ID: <202505211106.wfInDz3R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   db626d091462225f4c751be2eacba627422ff8d7
commit: 8bd35c2ab2d0c61b23cfb655c4ca42cb5c685923 [16/20] mm: stop using page->mapping for non-folio migration
config: sparc-randconfig-001-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211106.wfInDz3R-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211106.wfInDz3R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211106.wfInDz3R-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_isolation.c: In function 'has_unmovable_pages':
>> mm/page_isolation.c:95:63: error: implicit declaration of function '__folio_test_movable'; did you mean '__folio_set_pgtable'? [-Werror=implicit-function-declaration]
      95 |                         } else if (!folio_test_lru(folio) && !__folio_test_movable(folio)) {
         |                                                               ^~~~~~~~~~~~~~~~~~~~
         |                                                               __folio_set_pgtable
   cc1: some warnings being treated as errors


vim +95 mm/page_isolation.c

0f0848e5118a4cb Joonsoo Kim       2016-01-14   17  
b48d8a8e5ce53e3 Zi Yan            2022-05-12   18  /*
844fbae63e468e3 Zi Yan            2022-05-12   19   * This function checks whether the range [start_pfn, end_pfn) includes
844fbae63e468e3 Zi Yan            2022-05-12   20   * unmovable pages or not. The range must fall into a single pageblock and
844fbae63e468e3 Zi Yan            2022-05-12   21   * consequently belong to a single zone.
b48d8a8e5ce53e3 Zi Yan            2022-05-12   22   *
b48d8a8e5ce53e3 Zi Yan            2022-05-12   23   * PageLRU check without isolation or lru_lock could race so that
8bd35c2ab2d0c61 David Hildenbrand 2025-04-11   24   * MIGRATE_MOVABLE block might include unmovable pages. Similarly, non-folio
8bd35c2ab2d0c61 David Hildenbrand 2025-04-11   25   * pages that are movable but already isolated are detected as unmovable.
8bd35c2ab2d0c61 David Hildenbrand 2025-04-11   26   * So you can't expect this function should be exact.
b48d8a8e5ce53e3 Zi Yan            2022-05-12   27   *
b48d8a8e5ce53e3 Zi Yan            2022-05-12   28   * Returns a page without holding a reference. If the caller wants to
b48d8a8e5ce53e3 Zi Yan            2022-05-12   29   * dereference that page (e.g., dumping), it has to make sure that it
b48d8a8e5ce53e3 Zi Yan            2022-05-12   30   * cannot get removed (e.g., via memory unplug) concurrently.
b48d8a8e5ce53e3 Zi Yan            2022-05-12   31   *
b48d8a8e5ce53e3 Zi Yan            2022-05-12   32   */
844fbae63e468e3 Zi Yan            2022-05-12   33  static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long end_pfn,
b48d8a8e5ce53e3 Zi Yan            2022-05-12   34  				int migratetype, int flags)
b48d8a8e5ce53e3 Zi Yan            2022-05-12   35  {
844fbae63e468e3 Zi Yan            2022-05-12   36  	struct page *page = pfn_to_page(start_pfn);
844fbae63e468e3 Zi Yan            2022-05-12   37  	struct zone *zone = page_zone(page);
844fbae63e468e3 Zi Yan            2022-05-12   38  	unsigned long pfn;
844fbae63e468e3 Zi Yan            2022-05-12   39  
4f9bc69ac5ce340 Kefeng Wang       2022-09-07   40  	VM_BUG_ON(pageblock_start_pfn(start_pfn) !=
4f9bc69ac5ce340 Kefeng Wang       2022-09-07   41  		  pageblock_start_pfn(end_pfn - 1));
b48d8a8e5ce53e3 Zi Yan            2022-05-12   42  
b48d8a8e5ce53e3 Zi Yan            2022-05-12   43  	if (is_migrate_cma_page(page)) {
b48d8a8e5ce53e3 Zi Yan            2022-05-12   44  		/*
b48d8a8e5ce53e3 Zi Yan            2022-05-12   45  		 * CMA allocations (alloc_contig_range) really need to mark
b48d8a8e5ce53e3 Zi Yan            2022-05-12   46  		 * isolate CMA pageblocks even when they are not movable in fact
b48d8a8e5ce53e3 Zi Yan            2022-05-12   47  		 * so consider them movable here.
b48d8a8e5ce53e3 Zi Yan            2022-05-12   48  		 */
b48d8a8e5ce53e3 Zi Yan            2022-05-12   49  		if (is_migrate_cma(migratetype))
b48d8a8e5ce53e3 Zi Yan            2022-05-12   50  			return NULL;
b48d8a8e5ce53e3 Zi Yan            2022-05-12   51  
b48d8a8e5ce53e3 Zi Yan            2022-05-12   52  		return page;
b48d8a8e5ce53e3 Zi Yan            2022-05-12   53  	}
b48d8a8e5ce53e3 Zi Yan            2022-05-12   54  
844fbae63e468e3 Zi Yan            2022-05-12   55  	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
844fbae63e468e3 Zi Yan            2022-05-12   56  		page = pfn_to_page(pfn);
b48d8a8e5ce53e3 Zi Yan            2022-05-12   57  
b48d8a8e5ce53e3 Zi Yan            2022-05-12   58  		/*
b48d8a8e5ce53e3 Zi Yan            2022-05-12   59  		 * Both, bootmem allocations and memory holes are marked
b48d8a8e5ce53e3 Zi Yan            2022-05-12   60  		 * PG_reserved and are unmovable. We can even have unmovable
b48d8a8e5ce53e3 Zi Yan            2022-05-12   61  		 * allocations inside ZONE_MOVABLE, for example when
b48d8a8e5ce53e3 Zi Yan            2022-05-12   62  		 * specifying "movablecore".
b48d8a8e5ce53e3 Zi Yan            2022-05-12   63  		 */
b48d8a8e5ce53e3 Zi Yan            2022-05-12   64  		if (PageReserved(page))
b48d8a8e5ce53e3 Zi Yan            2022-05-12   65  			return page;
b48d8a8e5ce53e3 Zi Yan            2022-05-12   66  
b48d8a8e5ce53e3 Zi Yan            2022-05-12   67  		/*
b48d8a8e5ce53e3 Zi Yan            2022-05-12   68  		 * If the zone is movable and we have ruled out all reserved
b48d8a8e5ce53e3 Zi Yan            2022-05-12   69  		 * pages then it should be reasonably safe to assume the rest
b48d8a8e5ce53e3 Zi Yan            2022-05-12   70  		 * is movable.
b48d8a8e5ce53e3 Zi Yan            2022-05-12   71  		 */
b48d8a8e5ce53e3 Zi Yan            2022-05-12   72  		if (zone_idx(zone) == ZONE_MOVABLE)
b48d8a8e5ce53e3 Zi Yan            2022-05-12   73  			continue;
b48d8a8e5ce53e3 Zi Yan            2022-05-12   74  
b48d8a8e5ce53e3 Zi Yan            2022-05-12   75  		/*
b48d8a8e5ce53e3 Zi Yan            2022-05-12   76  		 * Hugepages are not in LRU lists, but they're movable.
b48d8a8e5ce53e3 Zi Yan            2022-05-12   77  		 * THPs are on the LRU, but need to be counted as #small pages.
b48d8a8e5ce53e3 Zi Yan            2022-05-12   78  		 * We need not scan over tail pages because we don't
b48d8a8e5ce53e3 Zi Yan            2022-05-12   79  		 * handle each tail page individually in migration.
b48d8a8e5ce53e3 Zi Yan            2022-05-12   80  		 */
b48d8a8e5ce53e3 Zi Yan            2022-05-12   81  		if (PageHuge(page) || PageTransCompound(page)) {
affd26b1fbd67fc Sidhartha Kumar   2023-07-19   82  			struct folio *folio = page_folio(page);
b48d8a8e5ce53e3 Zi Yan            2022-05-12   83  			unsigned int skip_pages;
b48d8a8e5ce53e3 Zi Yan            2022-05-12   84  
b48d8a8e5ce53e3 Zi Yan            2022-05-12   85  			if (PageHuge(page)) {
a0a9f2180b90c7d Liu Shixin        2025-01-22   86  				struct hstate *h;
a0a9f2180b90c7d Liu Shixin        2025-01-22   87  
a0a9f2180b90c7d Liu Shixin        2025-01-22   88  				/*
a0a9f2180b90c7d Liu Shixin        2025-01-22   89  				 * The huge page may be freed so can not
a0a9f2180b90c7d Liu Shixin        2025-01-22   90  				 * use folio_hstate() directly.
a0a9f2180b90c7d Liu Shixin        2025-01-22   91  				 */
a0a9f2180b90c7d Liu Shixin        2025-01-22   92  				h = size_to_hstate(folio_size(folio));
a0a9f2180b90c7d Liu Shixin        2025-01-22   93  				if (h && !hugepage_migration_supported(h))
b48d8a8e5ce53e3 Zi Yan            2022-05-12   94  					return page;
affd26b1fbd67fc Sidhartha Kumar   2023-07-19  @95  			} else if (!folio_test_lru(folio) && !__folio_test_movable(folio)) {
b48d8a8e5ce53e3 Zi Yan            2022-05-12   96  				return page;
b48d8a8e5ce53e3 Zi Yan            2022-05-12   97  			}
b48d8a8e5ce53e3 Zi Yan            2022-05-12   98  
affd26b1fbd67fc Sidhartha Kumar   2023-07-19   99  			skip_pages = folio_nr_pages(folio) - folio_page_idx(folio, page);
844fbae63e468e3 Zi Yan            2022-05-12  100  			pfn += skip_pages - 1;
b48d8a8e5ce53e3 Zi Yan            2022-05-12  101  			continue;
b48d8a8e5ce53e3 Zi Yan            2022-05-12  102  		}
b48d8a8e5ce53e3 Zi Yan            2022-05-12  103  
b48d8a8e5ce53e3 Zi Yan            2022-05-12  104  		/*
b48d8a8e5ce53e3 Zi Yan            2022-05-12  105  		 * We can't use page_count without pin a page
b48d8a8e5ce53e3 Zi Yan            2022-05-12  106  		 * because another CPU can free compound page.
b48d8a8e5ce53e3 Zi Yan            2022-05-12  107  		 * This check already skips compound tails of THP
b48d8a8e5ce53e3 Zi Yan            2022-05-12  108  		 * because their page->_refcount is zero at all time.
b48d8a8e5ce53e3 Zi Yan            2022-05-12  109  		 */
b48d8a8e5ce53e3 Zi Yan            2022-05-12  110  		if (!page_ref_count(page)) {
b48d8a8e5ce53e3 Zi Yan            2022-05-12  111  			if (PageBuddy(page))
844fbae63e468e3 Zi Yan            2022-05-12  112  				pfn += (1 << buddy_order(page)) - 1;
b48d8a8e5ce53e3 Zi Yan            2022-05-12  113  			continue;
b48d8a8e5ce53e3 Zi Yan            2022-05-12  114  		}
b48d8a8e5ce53e3 Zi Yan            2022-05-12  115  
b48d8a8e5ce53e3 Zi Yan            2022-05-12  116  		/*
b48d8a8e5ce53e3 Zi Yan            2022-05-12  117  		 * The HWPoisoned page may be not in buddy system, and
b48d8a8e5ce53e3 Zi Yan            2022-05-12  118  		 * page_count() is not 0.
b48d8a8e5ce53e3 Zi Yan            2022-05-12  119  		 */
b48d8a8e5ce53e3 Zi Yan            2022-05-12  120  		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
b48d8a8e5ce53e3 Zi Yan            2022-05-12  121  			continue;
b48d8a8e5ce53e3 Zi Yan            2022-05-12  122  
b48d8a8e5ce53e3 Zi Yan            2022-05-12  123  		/*
c799e19dd852f8f David Hildenbrand 2025-04-17  124  		 * PageOffline() pages that are marked as "skippable"
c799e19dd852f8f David Hildenbrand 2025-04-17  125  		 * are treated like movable pages for memory offlining.
b48d8a8e5ce53e3 Zi Yan            2022-05-12  126  		 */
c799e19dd852f8f David Hildenbrand 2025-04-17  127  		if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
c799e19dd852f8f David Hildenbrand 2025-04-17  128  		    PageOfflineSkippable(page))
b48d8a8e5ce53e3 Zi Yan            2022-05-12  129  			continue;
b48d8a8e5ce53e3 Zi Yan            2022-05-12  130  
8bd35c2ab2d0c61 David Hildenbrand 2025-04-11  131  		if (PageLRU(page) || page_test_non_folio_movable(page))
b48d8a8e5ce53e3 Zi Yan            2022-05-12  132  			continue;
b48d8a8e5ce53e3 Zi Yan            2022-05-12  133  
b48d8a8e5ce53e3 Zi Yan            2022-05-12  134  		/*
b48d8a8e5ce53e3 Zi Yan            2022-05-12  135  		 * If there are RECLAIMABLE pages, we need to check
b48d8a8e5ce53e3 Zi Yan            2022-05-12  136  		 * it.  But now, memory offline itself doesn't call
b48d8a8e5ce53e3 Zi Yan            2022-05-12  137  		 * shrink_node_slabs() and it still to be fixed.
b48d8a8e5ce53e3 Zi Yan            2022-05-12  138  		 */
b48d8a8e5ce53e3 Zi Yan            2022-05-12  139  		return page;
b48d8a8e5ce53e3 Zi Yan            2022-05-12  140  	}
b48d8a8e5ce53e3 Zi Yan            2022-05-12  141  	return NULL;
b48d8a8e5ce53e3 Zi Yan            2022-05-12  142  }
b48d8a8e5ce53e3 Zi Yan            2022-05-12  143  

:::::: The code at line 95 was first introduced by commit
:::::: affd26b1fbd67fceea70d9ceac40ff4815afbeb5 mm/hugetlb: get rid of page_hstate()

:::::: TO: Sidhartha Kumar <sidhartha.kumar@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
