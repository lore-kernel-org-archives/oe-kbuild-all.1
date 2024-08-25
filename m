Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BBD15B13A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Aug 2024 16:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724604529; cv=none; b=RPdjvr95QYcOm2mLHkD9vGVNluYOx5Zi38Dt+EB7OriyiQ1o2EE8/1e+mBrweB0bqHheSEtjB1J0bm4omCuxLHcpgvBVQxMxU4D0GyiaBoXkqXfsP/sOSwdszw9XwZc6Sz2ExjeLNoDLYEQ7iwd4/2TuGbhPSeO7igfEu/yyCec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724604529; c=relaxed/simple;
	bh=ed8m98regKmwizNIyAhDc2DwKS15Z1BN2tFi+BmPX6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/jh12zzvP4Z8ClLw+S0sNQhnAGNdjSnJv5/f0gemKHEn0xh+xIoQgjddAtCX/MT9YsdMvrbuiGiSEG7y+gQ+uyrOCYZOxWsKSn6JPddCjbmmqgdMN+IweMoe8Fsp7iuX41y0BUdrMk2yWTJ8depVRMhoRzbRa9Afef4SBNi9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOTKHi/H; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOTKHi/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724604527; x=1756140527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ed8m98regKmwizNIyAhDc2DwKS15Z1BN2tFi+BmPX6Y=;
  b=ZOTKHi/HiYCfNK9WJSDM4u5impO3NRLNunL7if7cEtgy8AfGIGtzJIC5
   sYh8QBkhWdNVXF26rwh1aLr4HXQOzy/A4/WocY6xt9dqU7uF0He2EgnwL
   Td2CdoDNl8AVYmPvOvFKQuMd0NnGtV7gkJ8AOuqLI7zY8+Uy9G301ikUy
   o2LA5nyWZrhImRWeF4Oucrhzm1V27zrJ2KY+wy4gT8WF6dECFJ5MCcjA1
   4HSRKwdRNopWmS6hKcxUYG/b22qp+lzKd0wX2FDK3z9ERGs9IXShfuNJK
   l3gqXbfROgn9hMWLU5mmMAmXvRr1L9lt+jxk1dbYh9pGfmxIJN5XsqU+O
   g==;
X-CSE-ConnectionGUID: tzZoZnaKQtKvVttfoJes0A==
X-CSE-MsgGUID: EWCFydjFTBeBFVe5NlsP0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33586238"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="33586238"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 09:48:46 -0700
X-CSE-ConnectionGUID: B7uGRQWLRX6wdmimILDY9g==
X-CSE-MsgGUID: E6v4i7ZTS/OW6y7YiDS4dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="62260648"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Aug 2024 09:48:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siGPy-000FJb-26;
	Sun, 25 Aug 2024 16:48:42 +0000
Date: Mon, 26 Aug 2024 00:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6060/6439] mm/memory_hotplug.c:1811:33: error:
 implicit declaration of function 'unmap_posioned_folio'; did you mean
 'unmap_poisoned_folio'?
Message-ID: <202408260054.ka3zWBLH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c79c85875f1af04040fe4492ed94ce37ad729c4d
commit: fb3b45758493a2451a9fdcf7f8c034d614d85939 [6060/6439] mm: memory_hotplug: check hwpoisoned page firstly in do_migrate_range()
config: x86_64-rhel-8.3-ltp (https://download.01.org/0day-ci/archive/20240826/202408260054.ka3zWBLH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408260054.ka3zWBLH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408260054.ka3zWBLH-lkp@intel.com/

Note: the linux-next/master HEAD c79c85875f1af04040fe4492ed94ce37ad729c4d builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   mm/memory_hotplug.c: In function 'do_migrate_range':
>> mm/memory_hotplug.c:1811:33: error: implicit declaration of function 'unmap_posioned_folio'; did you mean 'unmap_poisoned_folio'? [-Werror=implicit-function-declaration]
    1811 |                                 unmap_posioned_folio(folio, TTU_IGNORE_MLOCK);
         |                                 ^~~~~~~~~~~~~~~~~~~~
         |                                 unmap_poisoned_folio
   cc1: some warnings being treated as errors


vim +1811 mm/memory_hotplug.c

  1772	
  1773	static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
  1774	{
  1775		unsigned long pfn;
  1776		struct page *page;
  1777		LIST_HEAD(source);
  1778		static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
  1779					      DEFAULT_RATELIMIT_BURST);
  1780	
  1781		for (pfn = start_pfn; pfn < end_pfn; pfn++) {
  1782			struct folio *folio;
  1783			bool isolated;
  1784	
  1785			if (!pfn_valid(pfn))
  1786				continue;
  1787			page = pfn_to_page(pfn);
  1788			folio = page_folio(page);
  1789	
  1790			/*
  1791			 * No reference or lock is held on the folio, so it might
  1792			 * be modified concurrently (e.g. split).  As such,
  1793			 * folio_nr_pages() may read garbage.  This is fine as the outer
  1794			 * loop will revisit the split folio later.
  1795			 */
  1796			if (folio_test_large(folio))
  1797				pfn = folio_pfn(folio) + folio_nr_pages(folio) - 1;
  1798	
  1799			/*
  1800			 * HWPoison pages have elevated reference counts so the migration would
  1801			 * fail on them. It also doesn't make any sense to migrate them in the
  1802			 * first place. Still try to unmap such a page in case it is still mapped
  1803			 * (e.g. current hwpoison implementation doesn't unmap KSM pages but keep
  1804			 * the unmap as the catch all safety net).
  1805			 */
  1806			if (folio_test_hwpoison(folio) ||
  1807			    (folio_test_large(folio) && folio_test_has_hwpoisoned(folio))) {
  1808				if (WARN_ON(folio_test_lru(folio)))
  1809					folio_isolate_lru(folio);
  1810				if (folio_mapped(folio))
> 1811					unmap_posioned_folio(folio, TTU_IGNORE_MLOCK);
  1812				continue;
  1813			}
  1814	
  1815			if (folio_test_hugetlb(folio)) {
  1816				isolate_hugetlb(folio, &source);
  1817				continue;
  1818			}
  1819	
  1820			if (!get_page_unless_zero(page))
  1821				continue;
  1822			/*
  1823			 * We can skip free pages. And we can deal with pages on
  1824			 * LRU and non-lru movable pages.
  1825			 */
  1826			if (PageLRU(page))
  1827				isolated = isolate_lru_page(page);
  1828			else
  1829				isolated = isolate_movable_page(page, ISOLATE_UNEVICTABLE);
  1830			if (isolated) {
  1831				list_add_tail(&page->lru, &source);
  1832				if (!__PageMovable(page))
  1833					inc_node_page_state(page, NR_ISOLATED_ANON +
  1834							    page_is_file_lru(page));
  1835	
  1836			} else {
  1837				if (__ratelimit(&migrate_rs)) {
  1838					pr_warn("failed to isolate pfn %lx\n", pfn);
  1839					dump_page(page, "isolation failed");
  1840				}
  1841			}
  1842			put_page(page);
  1843		}
  1844		if (!list_empty(&source)) {
  1845			nodemask_t nmask = node_states[N_MEMORY];
  1846			struct migration_target_control mtc = {
  1847				.nmask = &nmask,
  1848				.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
  1849				.reason = MR_MEMORY_HOTPLUG,
  1850			};
  1851			int ret;
  1852	
  1853			/*
  1854			 * We have checked that migration range is on a single zone so
  1855			 * we can use the nid of the first page to all the others.
  1856			 */
  1857			mtc.nid = page_to_nid(list_first_entry(&source, struct page, lru));
  1858	
  1859			/*
  1860			 * try to allocate from a different node but reuse this node
  1861			 * if there are no other online nodes to be used (e.g. we are
  1862			 * offlining a part of the only existing node)
  1863			 */
  1864			node_clear(mtc.nid, nmask);
  1865			if (nodes_empty(nmask))
  1866				node_set(mtc.nid, nmask);
  1867			ret = migrate_pages(&source, alloc_migration_target, NULL,
  1868				(unsigned long)&mtc, MIGRATE_SYNC, MR_MEMORY_HOTPLUG, NULL);
  1869			if (ret) {
  1870				list_for_each_entry(page, &source, lru) {
  1871					if (__ratelimit(&migrate_rs)) {
  1872						pr_warn("migrating pfn %lx failed ret:%d\n",
  1873							page_to_pfn(page), ret);
  1874						dump_page(page, "migration failure");
  1875					}
  1876				}
  1877				putback_movable_pages(&source);
  1878			}
  1879		}
  1880	}
  1881	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
