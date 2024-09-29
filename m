Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BA04C69
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 22:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727648183; cv=none; b=u6ufJhUVcTP6NTrT1flsOdH/Drvr6FVf2840Jz71/VYEEWLNc/6UmM1vS4YdfLnRnNHLkr3KaDODcTNTuvv33r7kT555CNDyGcrOenxVUqWRqzxXK6loEZ3vOzzs3uy3RXF0/2YEmmkHQ84yWY2nhHxAy0/t+m2ms8ybAo0uEYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727648183; c=relaxed/simple;
	bh=sQVEQ7D1SVehXJpjJ9Yfu1CNAspei3wQYd8os7EjnAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mDEAdpk/tAsBnCrfzO0ahd+fXv7hViE6CYtAxAc1I1tj7xi6yJx0fPDIefhmnpWK+kE8h2Ssu8nZVWvp4xiVO2+ifCPghSRWt2FKocwxX7wMB+JtJEEWf4eYSA5rrcYsvybjRTYOqbye9tyqHxcVpCdsDLnHIZ9UgrQ17H8NZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4/7qkM3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4/7qkM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727648180; x=1759184180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sQVEQ7D1SVehXJpjJ9Yfu1CNAspei3wQYd8os7EjnAE=;
  b=a4/7qkM3XD1V0QDwdg9l9CGKzgYKwA/jtdizr8GULvMs65Nn4DKLEVPm
   ksVYxP2eFa3jsfBhwvrnNkajBMMp5goxOW4sSCTjxi5wAzjQHoCY3zNNy
   LSvf4fs8xkMrpd74Lqohv7nh4TkIvo90hgD4vkBCQixavwQrppHlgDUfJ
   srR7JlC7QA/TMU4rrg35b/6tYxtaL5Z55/+tELoHcL3Cjdy5xtdg5nVyf
   mPhCEc/3F2qMW6e2m2q9MSt3qmacGssI991UPq1fWFRF7XXiThw7o2TlO
   lSoyEO56DLUNQKYcie6DWEFqa97W/ecx3BHsbWC4BhNkCAkcOlFL+4xFF
   Q==;
X-CSE-ConnectionGUID: VVWbWnhSQDaB8InKwZCfmQ==
X-CSE-MsgGUID: 9b1+2433ThGQMnzmmD91wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="29606314"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="29606314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 15:16:20 -0700
X-CSE-ConnectionGUID: GYNeZKRsS4KQIIewWq1aXA==
X-CSE-MsgGUID: Vz+mwd9DSYWIf1TgJLXb4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73162066"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Sep 2024 15:16:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv2D8-000Olj-05;
	Sun, 29 Sep 2024 22:16:14 +0000
Date: Mon, 30 Sep 2024 06:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 12005/12031] mm/khugepaged.c:2131:51: error:
 invalid use of undefined type 'struct mem_cgroup'
Message-ID: <202409300602.m8qpsPwl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: 4e6f350b03517e7158aec8e506f846a14e712708 [12005/12031] rue/mm: fix file page_counter 'memcg->pagecache' error when THP enabled
config: x86_64-buildonly-randconfig-002-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300602.m8qpsPwl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300602.m8qpsPwl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300602.m8qpsPwl-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/khugepaged.c: In function 'collapse_file':
>> mm/khugepaged.c:2131:51: error: invalid use of undefined type 'struct mem_cgroup'
    2131 |                         page_counter_charge(&memcg->pagecache, nr);
         |                                                   ^~


vim +2131 mm/khugepaged.c

  1762	
  1763	/**
  1764	 * collapse_file - collapse filemap/tmpfs/shmem pages into huge one.
  1765	 *
  1766	 * @mm: process address space where collapse happens
  1767	 * @addr: virtual collapse start address
  1768	 * @file: file that collapse on
  1769	 * @start: collapse start address
  1770	 * @cc: collapse context and scratchpad
  1771	 *
  1772	 * Basic scheme is simple, details are more complex:
  1773	 *  - allocate and lock a new huge page;
  1774	 *  - scan page cache, locking old pages
  1775	 *    + swap/gup in pages if necessary;
  1776	 *  - copy data to new page
  1777	 *  - handle shmem holes
  1778	 *    + re-validate that holes weren't filled by someone else
  1779	 *    + check for userfaultfd
  1780	 *  - finalize updates to the page cache;
  1781	 *  - if replacing succeeds:
  1782	 *    + unlock huge page;
  1783	 *    + free old pages;
  1784	 *  - if replacing failed;
  1785	 *    + unlock old pages
  1786	 *    + unlock and free huge page;
  1787	 */
  1788	static int collapse_file(struct mm_struct *mm, unsigned long addr,
  1789				 struct file *file, pgoff_t start,
  1790				 struct collapse_control *cc)
  1791	{
  1792		struct address_space *mapping = file->f_mapping;
  1793		struct page *hpage;
  1794		struct page *page;
  1795		struct page *tmp;
  1796		struct folio *folio;
  1797		struct mem_cgroup *memcg;
  1798		pgoff_t index = 0, end = start + HPAGE_PMD_NR;
  1799		LIST_HEAD(pagelist);
  1800		XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
  1801		int nr_none = 0, result = SCAN_SUCCEED;
  1802		bool is_shmem = shmem_file(file);
  1803		int nr = 0;
  1804	
  1805		VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
  1806		VM_BUG_ON(start & (HPAGE_PMD_NR - 1));
  1807	
  1808		result = alloc_charge_hpage(&hpage, mm, cc);
  1809		if (result != SCAN_SUCCEED)
  1810			goto out;
  1811	
  1812		__SetPageLocked(hpage);
  1813		if (is_shmem)
  1814			__SetPageSwapBacked(hpage);
  1815		hpage->index = start;
  1816		hpage->mapping = mapping;
  1817	
  1818		/*
  1819		 * Ensure we have slots for all the pages in the range.  This is
  1820		 * almost certainly a no-op because most of the pages must be present
  1821		 */
  1822		do {
  1823			xas_lock_irq(&xas);
  1824			xas_create_range(&xas);
  1825			if (!xas_error(&xas))
  1826				break;
  1827			xas_unlock_irq(&xas);
  1828			if (!xas_nomem(&xas, GFP_KERNEL)) {
  1829				result = SCAN_FAIL;
  1830				goto rollback;
  1831			}
  1832		} while (1);
  1833	
  1834		for (index = start; index < end; index++) {
  1835			xas_set(&xas, index);
  1836			page = xas_load(&xas);
  1837	
  1838			VM_BUG_ON(index != xas.xa_index);
  1839			if (is_shmem) {
  1840				if (!page) {
  1841					/*
  1842					 * Stop if extent has been truncated or
  1843					 * hole-punched, and is now completely
  1844					 * empty.
  1845					 */
  1846					if (index == start) {
  1847						if (!xas_next_entry(&xas, end - 1)) {
  1848							result = SCAN_TRUNCATED;
  1849							goto xa_locked;
  1850						}
  1851					}
  1852					nr_none++;
  1853					continue;
  1854				}
  1855	
  1856				if (xa_is_value(page) || !PageUptodate(page)) {
  1857					xas_unlock_irq(&xas);
  1858					/* swap in or instantiate fallocated page */
  1859					if (shmem_get_folio(mapping->host, index,
  1860							&folio, SGP_NOALLOC)) {
  1861						result = SCAN_FAIL;
  1862						goto xa_unlocked;
  1863					}
  1864					/* drain lru cache to help isolate_lru_page() */
  1865					lru_add_drain();
  1866					page = folio_file_page(folio, index);
  1867				} else if (trylock_page(page)) {
  1868					get_page(page);
  1869					xas_unlock_irq(&xas);
  1870				} else {
  1871					result = SCAN_PAGE_LOCK;
  1872					goto xa_locked;
  1873				}
  1874			} else {	/* !is_shmem */
  1875				if (!page || xa_is_value(page)) {
  1876					xas_unlock_irq(&xas);
  1877					page_cache_sync_readahead(mapping, &file->f_ra,
  1878								  file, index,
  1879								  end - index);
  1880					/* drain lru cache to help isolate_lru_page() */
  1881					lru_add_drain();
  1882					page = find_lock_page(mapping, index);
  1883					if (unlikely(page == NULL)) {
  1884						result = SCAN_FAIL;
  1885						goto xa_unlocked;
  1886					}
  1887				} else if (PageDirty(page)) {
  1888					/*
  1889					 * khugepaged only works on read-only fd,
  1890					 * so this page is dirty because it hasn't
  1891					 * been flushed since first write. There
  1892					 * won't be new dirty pages.
  1893					 *
  1894					 * Trigger async flush here and hope the
  1895					 * writeback is done when khugepaged
  1896					 * revisits this page.
  1897					 *
  1898					 * This is a one-off situation. We are not
  1899					 * forcing writeback in loop.
  1900					 */
  1901					xas_unlock_irq(&xas);
  1902					filemap_flush(mapping);
  1903					result = SCAN_FAIL;
  1904					goto xa_unlocked;
  1905				} else if (PageWriteback(page)) {
  1906					xas_unlock_irq(&xas);
  1907					result = SCAN_FAIL;
  1908					goto xa_unlocked;
  1909				} else if (trylock_page(page)) {
  1910					get_page(page);
  1911					xas_unlock_irq(&xas);
  1912				} else {
  1913					result = SCAN_PAGE_LOCK;
  1914					goto xa_locked;
  1915				}
  1916			}
  1917	
  1918			/*
  1919			 * The page must be locked, so we can drop the i_pages lock
  1920			 * without racing with truncate.
  1921			 */
  1922			VM_BUG_ON_PAGE(!PageLocked(page), page);
  1923	
  1924			/* make sure the page is up to date */
  1925			if (unlikely(!PageUptodate(page))) {
  1926				result = SCAN_FAIL;
  1927				goto out_unlock;
  1928			}
  1929	
  1930			/*
  1931			 * If file was truncated then extended, or hole-punched, before
  1932			 * we locked the first page, then a THP might be there already.
  1933			 * This will be discovered on the first iteration.
  1934			 */
  1935			if (PageTransCompound(page)) {
  1936				struct page *head = compound_head(page);
  1937	
  1938				result = compound_order(head) == HPAGE_PMD_ORDER &&
  1939						head->index == start
  1940						/* Maybe PMD-mapped */
  1941						? SCAN_PTE_MAPPED_HUGEPAGE
  1942						: SCAN_PAGE_COMPOUND;
  1943				goto out_unlock;
  1944			}
  1945	
  1946			folio = page_folio(page);
  1947	
  1948			if (folio_mapping(folio) != mapping) {
  1949				result = SCAN_TRUNCATED;
  1950				goto out_unlock;
  1951			}
  1952	
  1953			if (!is_shmem && (folio_test_dirty(folio) ||
  1954					  folio_test_writeback(folio))) {
  1955				/*
  1956				 * khugepaged only works on read-only fd, so this
  1957				 * page is dirty because it hasn't been flushed
  1958				 * since first write.
  1959				 */
  1960				result = SCAN_FAIL;
  1961				goto out_unlock;
  1962			}
  1963	
  1964			if (!folio_isolate_lru(folio)) {
  1965				result = SCAN_DEL_PAGE_LRU;
  1966				goto out_unlock;
  1967			}
  1968	
  1969			if (!filemap_release_folio(folio, GFP_KERNEL)) {
  1970				result = SCAN_PAGE_HAS_PRIVATE;
  1971				folio_putback_lru(folio);
  1972				goto out_unlock;
  1973			}
  1974	
  1975			if (folio_mapped(folio))
  1976				try_to_unmap(folio,
  1977						TTU_IGNORE_MLOCK | TTU_BATCH_FLUSH);
  1978	
  1979			xas_lock_irq(&xas);
  1980	
  1981			VM_BUG_ON_PAGE(page != xa_load(xas.xa, index), page);
  1982	
  1983			/*
  1984			 * We control three references to the page:
  1985			 *  - we hold a pin on it;
  1986			 *  - one reference from page cache;
  1987			 *  - one from isolate_lru_page;
  1988			 * If those are the only references, then any new usage of the
  1989			 * page will have to fetch it from the page cache. That requires
  1990			 * locking the page to handle truncate, so any new usage will be
  1991			 * blocked until we unlock page after collapse/during rollback.
  1992			 */
  1993			if (page_count(page) != 3) {
  1994				result = SCAN_PAGE_COUNT;
  1995				xas_unlock_irq(&xas);
  1996				putback_lru_page(page);
  1997				goto out_unlock;
  1998			}
  1999	
  2000			/*
  2001			 * Accumulate the pages that are being collapsed.
  2002			 */
  2003			list_add_tail(&page->lru, &pagelist);
  2004			continue;
  2005	out_unlock:
  2006			unlock_page(page);
  2007			put_page(page);
  2008			goto xa_unlocked;
  2009		}
  2010	
  2011		if (!is_shmem) {
  2012			filemap_nr_thps_inc(mapping);
  2013			/*
  2014			 * Paired with smp_mb() in do_dentry_open() to ensure
  2015			 * i_writecount is up to date and the update to nr_thps is
  2016			 * visible. Ensures the page cache will be truncated if the
  2017			 * file is opened writable.
  2018			 */
  2019			smp_mb();
  2020			if (inode_is_open_for_write(mapping->host)) {
  2021				result = SCAN_FAIL;
  2022				filemap_nr_thps_dec(mapping);
  2023			}
  2024		}
  2025	
  2026	xa_locked:
  2027		xas_unlock_irq(&xas);
  2028	xa_unlocked:
  2029	
  2030		/*
  2031		 * If collapse is successful, flush must be done now before copying.
  2032		 * If collapse is unsuccessful, does flush actually need to be done?
  2033		 * Do it anyway, to clear the state.
  2034		 */
  2035		try_to_unmap_flush();
  2036	
  2037		if (result == SCAN_SUCCEED && nr_none &&
  2038		    !shmem_charge(mapping->host, nr_none))
  2039			result = SCAN_FAIL;
  2040		if (result != SCAN_SUCCEED) {
  2041			nr_none = 0;
  2042			goto rollback;
  2043		}
  2044	
  2045		/*
  2046		 * The old pages are locked, so they won't change anymore.
  2047		 */
  2048		index = start;
  2049		list_for_each_entry(page, &pagelist, lru) {
  2050			while (index < page->index) {
  2051				clear_highpage(hpage + (index % HPAGE_PMD_NR));
  2052				index++;
  2053			}
  2054			if (copy_mc_highpage(hpage + (page->index % HPAGE_PMD_NR), page) > 0) {
  2055				result = SCAN_COPY_MC;
  2056				goto rollback;
  2057			}
  2058			index++;
  2059		}
  2060		while (index < end) {
  2061			clear_highpage(hpage + (index % HPAGE_PMD_NR));
  2062			index++;
  2063		}
  2064	
  2065		if (nr_none) {
  2066			struct vm_area_struct *vma;
  2067			int nr_none_check = 0;
  2068	
  2069			i_mmap_lock_read(mapping);
  2070			xas_lock_irq(&xas);
  2071	
  2072			xas_set(&xas, start);
  2073			for (index = start; index < end; index++) {
  2074				if (!xas_next(&xas)) {
  2075					xas_store(&xas, XA_RETRY_ENTRY);
  2076					if (xas_error(&xas)) {
  2077						result = SCAN_STORE_FAILED;
  2078						goto immap_locked;
  2079					}
  2080					nr_none_check++;
  2081				}
  2082			}
  2083	
  2084			if (nr_none != nr_none_check) {
  2085				result = SCAN_PAGE_FILLED;
  2086				goto immap_locked;
  2087			}
  2088	
  2089			/*
  2090			 * If userspace observed a missing page in a VMA with a MODE_MISSING
  2091			 * userfaultfd, then it might expect a UFFD_EVENT_PAGEFAULT for that
  2092			 * page. If so, we need to roll back to avoid suppressing such an
  2093			 * event. Since wp/minor userfaultfds don't give userspace any
  2094			 * guarantees that the kernel doesn't fill a missing page with a zero
  2095			 * page, so they don't matter here.
  2096			 *
  2097			 * Any userfaultfds registered after this point will not be able to
  2098			 * observe any missing pages due to the previously inserted retry
  2099			 * entries.
  2100			 */
  2101			vma_interval_tree_foreach(vma, &mapping->i_mmap, start, end) {
  2102				if (userfaultfd_missing(vma)) {
  2103					result = SCAN_EXCEED_NONE_PTE;
  2104					goto immap_locked;
  2105				}
  2106			}
  2107	
  2108	immap_locked:
  2109			i_mmap_unlock_read(mapping);
  2110			if (result != SCAN_SUCCEED) {
  2111				xas_set(&xas, start);
  2112				for (index = start; index < end; index++) {
  2113					if (xas_next(&xas) == XA_RETRY_ENTRY)
  2114						xas_store(&xas, NULL);
  2115				}
  2116	
  2117				xas_unlock_irq(&xas);
  2118				goto rollback;
  2119			}
  2120		} else {
  2121			xas_lock_irq(&xas);
  2122		}
  2123	
  2124		nr = thp_nr_pages(hpage);
  2125		if (is_shmem)
  2126			__mod_lruvec_page_state(hpage, NR_SHMEM_THPS, nr);
  2127		else {
  2128			memcg = page_memcg(hpage);
  2129	
  2130			if (!mem_cgroup_disabled() && memcg)
> 2131				page_counter_charge(&memcg->pagecache, nr);
  2132	
  2133			__mod_lruvec_page_state(hpage, NR_FILE_THPS, nr);
  2134		}
  2135	
  2136		if (nr_none) {
  2137			__mod_lruvec_page_state(hpage, NR_FILE_PAGES, nr_none);
  2138			/* nr_none is always 0 for non-shmem. */
  2139			__mod_lruvec_page_state(hpage, NR_SHMEM, nr_none);
  2140		}
  2141	
  2142		/*
  2143		 * Mark hpage as uptodate before inserting it into the page cache so
  2144		 * that it isn't mistaken for an fallocated but unwritten page.
  2145		 */
  2146		folio = page_folio(hpage);
  2147		folio_mark_uptodate(folio);
  2148		folio_ref_add(folio, HPAGE_PMD_NR - 1);
  2149	
  2150		if (is_shmem)
  2151			folio_mark_dirty(folio);
  2152		folio_add_lru(folio);
  2153	
  2154		/* Join all the small entries into a single multi-index entry. */
  2155		xas_set_order(&xas, start, HPAGE_PMD_ORDER);
  2156		xas_store(&xas, hpage);
  2157		WARN_ON_ONCE(xas_error(&xas));
  2158		xas_unlock_irq(&xas);
  2159	
  2160		/*
  2161		 * Remove pte page tables, so we can re-fault the page as huge.
  2162		 * If MADV_COLLAPSE, adjust result to call collapse_pte_mapped_thp().
  2163		 */
  2164		retract_page_tables(mapping, start);
  2165		if (cc && !cc->is_khugepaged)
  2166			result = SCAN_PTE_MAPPED_HUGEPAGE;
  2167		unlock_page(hpage);
  2168	
  2169		/*
  2170		 * The collapse has succeeded, so free the old pages.
  2171		 */
  2172		list_for_each_entry_safe(page, tmp, &pagelist, lru) {
  2173			list_del(&page->lru);
  2174			page->mapping = NULL;
  2175			ClearPageActive(page);
  2176			ClearPageUnevictable(page);
  2177			unlock_page(page);
  2178			folio_put_refs(page_folio(page), 3);
  2179		}
  2180	
  2181		goto out;
  2182	
  2183	rollback:
  2184		/* Something went wrong: roll back page cache changes */
  2185		if (nr_none) {
  2186			xas_lock_irq(&xas);
  2187			mapping->nrpages -= nr_none;
  2188			xas_unlock_irq(&xas);
  2189			shmem_uncharge(mapping->host, nr_none);
  2190		}
  2191	
  2192		list_for_each_entry_safe(page, tmp, &pagelist, lru) {
  2193			list_del(&page->lru);
  2194			unlock_page(page);
  2195			putback_lru_page(page);
  2196			put_page(page);
  2197		}
  2198		/*
  2199		 * Undo the updates of filemap_nr_thps_inc for non-SHMEM
  2200		 * file only. This undo is not needed unless failure is
  2201		 * due to SCAN_COPY_MC.
  2202		 */
  2203		if (!is_shmem && result == SCAN_COPY_MC) {
  2204			filemap_nr_thps_dec(mapping);
  2205			/*
  2206			 * Paired with smp_mb() in do_dentry_open() to
  2207			 * ensure the update to nr_thps is visible.
  2208			 */
  2209			smp_mb();
  2210		}
  2211	
  2212		hpage->mapping = NULL;
  2213	
  2214		unlock_page(hpage);
  2215		put_page(hpage);
  2216	out:
  2217		VM_BUG_ON(!list_empty(&pagelist));
  2218		trace_mm_khugepaged_collapse_file(mm, hpage, index, is_shmem, addr, file, nr, result);
  2219		return result;
  2220	}
  2221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
