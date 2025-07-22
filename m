Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343591876
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 03:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753155858; cv=none; b=uh1CHwbomZ4MV4yhaXgqnxVWse1F+q0FbOjt0DZqBih9LoKE6sNO8IdDvsPMw0LseIJ/UguJG5M4o2OnmZreJa1JJfRkPjWt1ERNYrFlODGELMghfF8XxBZPMIthsxz9YiSpN6+W2GElilQeJWEgfWt/pMZG37NhhEWlF8ScQ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753155858; c=relaxed/simple;
	bh=2ZvYoYX+SuCBwfIvU2YFmyM77rU1NE5YbSYqPnpsODE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=macdSuiXLDMdozSoARI2f9Nhnx28lIrZxJE74qnem76QEew01l6RLlt4RKKmL5Nj7C74EMBZt1Vf2qW7dXajZ8BckXjHIzL0yGSiQriaK8pmwq4E58Kcrr8iK7AHsPRLreETlRkpyGBOu46cfN3NLINSx7+yhLRrq5RFUpJ4rEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IH5bRpdA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IH5bRpdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753155856; x=1784691856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZvYoYX+SuCBwfIvU2YFmyM77rU1NE5YbSYqPnpsODE=;
  b=IH5bRpdA9vLsFUrycfY+YJJmowe+ToGNFi8mb8+eJV+aHmOqwhzR5tku
   xLYhBUfTvIT3NjWqDDD1ZtK5DKsfJtX5ZkxzLvz9uX7IHDsAHk/YHgPC3
   vWjYATCeFbHWr3smLqU75EVf+FeaH0yUBIQyQYD1o3qUJxXzOp3g29Ug+
   7RduZ7WAf7otpJC6iNgSvzSkmabQAwYDtA5s+flv3msmLwdNt6sBI/E07
   FnVyxxXHrgjH9TNbLIq0+s2jLw7fx4+DMP3WA/JxMilekY2NqSgRKPPW0
   WtY0snWuDHKA/3dvqBXOLbQCQLHkSSJyMC4KOFJDof5bZFvLLRaS8lYCO
   A==;
X-CSE-ConnectionGUID: DeXyfyowSo+j6N8E5afi3g==
X-CSE-MsgGUID: ZXj3OZpeTxavbV1udQU4qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="72958980"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="72958980"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 20:44:02 -0700
X-CSE-ConnectionGUID: zj8GMpY0Spq4CaMxxos4Jw==
X-CSE-MsgGUID: 40GY78hzTb+kTMnYBYtdNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="158341641"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2025 20:44:00 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue3v3-000HPF-1Z;
	Tue, 22 Jul 2025 03:43:57 +0000
Date: Tue, 22 Jul 2025 11:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 34/34] mm/vmscan.c:1731:24: warning:
 variable 'target_lruvec' set but not used
Message-ID: <202507221130.PulfwV6h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c51bc02ec5b3728140f3a1cd74cf21c8566be5c
commit: 9cdcb2b3cdd068d49a930f922a5056458a937bad [34/34] anolis: mm: vmscan: make memcg kswapd set memcg state to dirty or writeback
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250722/202507221130.PulfwV6h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221130.PulfwV6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221130.PulfwV6h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c: In function 'shrink_folio_list':
>> mm/vmscan.c:1731:24: warning: variable 'target_lruvec' set but not used [-Wunused-but-set-variable]
    1731 |         struct lruvec *target_lruvec;
         |                        ^~~~~~~~~~~~~


vim +/target_lruvec +1731 mm/vmscan.c

  1716	
  1717	/*
  1718	 * shrink_folio_list() returns the number of reclaimed pages
  1719	 */
  1720	static unsigned int shrink_folio_list(struct list_head *folio_list,
  1721			struct pglist_data *pgdat, struct scan_control *sc,
  1722			struct reclaim_stat *stat, bool ignore_references)
  1723	{
  1724		LIST_HEAD(ret_folios);
  1725		LIST_HEAD(free_folios);
  1726		LIST_HEAD(demote_folios);
  1727		unsigned int nr_reclaimed = 0;
  1728		unsigned int pgactivate = 0;
  1729		bool do_demote_pass;
  1730		struct swap_iocb *plug = NULL;
> 1731		struct lruvec *target_lruvec;
  1732	
  1733		target_lruvec = mem_cgroup_lruvec(sc->target_mem_cgroup, pgdat);
  1734	
  1735		memset(stat, 0, sizeof(*stat));
  1736		cond_resched();
  1737		do_demote_pass = can_demote(pgdat->node_id, sc);
  1738	
  1739	retry:
  1740		while (!list_empty(folio_list)) {
  1741			struct address_space *mapping;
  1742			struct folio *folio;
  1743			enum folio_references references = FOLIOREF_RECLAIM;
  1744			bool dirty, writeback;
  1745			unsigned int nr_pages;
  1746	
  1747			cond_resched();
  1748	
  1749			folio = lru_to_folio(folio_list);
  1750			list_del(&folio->lru);
  1751	
  1752			if (!folio_trylock(folio))
  1753				goto keep;
  1754	
  1755			VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
  1756	
  1757			nr_pages = folio_nr_pages(folio);
  1758	
  1759			/* Account the number of base pages */
  1760			sc->nr_scanned += nr_pages;
  1761	
  1762			if (unlikely(!folio_evictable(folio)))
  1763				goto activate_locked;
  1764	
  1765			if (!sc->may_unmap && folio_mapped(folio))
  1766				goto keep_locked;
  1767	
  1768			/* folio_update_gen() tried to promote this page? */
  1769			if (lru_gen_enabled() && !ignore_references &&
  1770			    folio_mapped(folio) && folio_test_referenced(folio))
  1771				goto keep_locked;
  1772	
  1773			/*
  1774			 * The number of dirty pages determines if a node is marked
  1775			 * reclaim_congested. kswapd will stall and start writing
  1776			 * folios if the tail of the LRU is all dirty unqueued folios.
  1777			 */
  1778			folio_check_dirty_writeback(folio, &dirty, &writeback);
  1779			if (dirty || writeback)
  1780				stat->nr_dirty += nr_pages;
  1781	
  1782			if (dirty && !writeback)
  1783				stat->nr_unqueued_dirty += nr_pages;
  1784	
  1785			/*
  1786			 * Treat this folio as congested if folios are cycling
  1787			 * through the LRU so quickly that the folios marked
  1788			 * for immediate reclaim are making it to the end of
  1789			 * the LRU a second time.
  1790			 */
  1791			if (writeback && folio_test_reclaim(folio))
  1792				stat->nr_congested += nr_pages;
  1793	
  1794			/*
  1795			 * If a folio at the tail of the LRU is under writeback, there
  1796			 * are three cases to consider.
  1797			 *
  1798			 * 1) If reclaim is encountering an excessive number
  1799			 *    of folios under writeback and this folio has both
  1800			 *    the writeback and reclaim flags set, then it
  1801			 *    indicates that folios are being queued for I/O but
  1802			 *    are being recycled through the LRU before the I/O
  1803			 *    can complete. Waiting on the folio itself risks an
  1804			 *    indefinite stall if it is impossible to writeback
  1805			 *    the folio due to I/O error or disconnected storage
  1806			 *    so instead note that the LRU is being scanned too
  1807			 *    quickly and the caller can stall after the folio
  1808			 *    list has been processed.
  1809			 *
  1810			 * 2) Global or new memcg reclaim encounters a folio that is
  1811			 *    not marked for immediate reclaim, or the caller does not
  1812			 *    have __GFP_FS (or __GFP_IO if it's simply going to swap,
  1813			 *    not to fs). In this case mark the folio for immediate
  1814			 *    reclaim and continue scanning.
  1815			 *
  1816			 *    Require may_enter_fs() because we would wait on fs, which
  1817			 *    may not have submitted I/O yet. And the loop driver might
  1818			 *    enter reclaim, and deadlock if it waits on a folio for
  1819			 *    which it is needed to do the write (loop masks off
  1820			 *    __GFP_IO|__GFP_FS for this reason); but more thought
  1821			 *    would probably show more reasons.
  1822			 *
  1823			 * 3) Legacy memcg encounters a folio that already has the
  1824			 *    reclaim flag set. memcg does not have any dirty folio
  1825			 *    throttling so we could easily OOM just because too many
  1826			 *    folios are in writeback and there is nothing else to
  1827			 *    reclaim. Wait for the writeback to complete.
  1828			 *
  1829			 * In cases 1) and 2) we activate the folios to get them out of
  1830			 * the way while we continue scanning for clean folios on the
  1831			 * inactive list and refilling from the active list. The
  1832			 * observation here is that waiting for disk writes is more
  1833			 * expensive than potentially causing reloads down the line.
  1834			 * Since they're marked for immediate reclaim, they won't put
  1835			 * memory pressure on the cache working set any longer than it
  1836			 * takes to write them to disk.
  1837			 */
  1838			if (folio_test_writeback(folio)) {
  1839				/* Case 1 above */
  1840				if (current_is_kswapd() &&
  1841				    folio_test_reclaim(folio) &&
  1842				    test_bit(LRUVEC_WRITEBACK, &pgdat->flags)) {
  1843					stat->nr_immediate += nr_pages;
  1844					goto activate_locked;
  1845	
  1846				/* Case 2 above */
  1847				} else if (writeback_throttling_sane(sc) ||
  1848				    !folio_test_reclaim(folio) ||
  1849				    !may_enter_fs(folio, sc->gfp_mask)) {
  1850					/*
  1851					 * This is slightly racy -
  1852					 * folio_end_writeback() might have
  1853					 * just cleared the reclaim flag, then
  1854					 * setting the reclaim flag here ends up
  1855					 * interpreted as the readahead flag - but
  1856					 * that does not matter enough to care.
  1857					 * What we do want is for this folio to
  1858					 * have the reclaim flag set next time
  1859					 * memcg reclaim reaches the tests above,
  1860					 * so it will then wait for writeback to
  1861					 * avoid OOM; and it's also appropriate
  1862					 * in global reclaim.
  1863					 */
  1864					folio_set_reclaim(folio);
  1865					stat->nr_writeback += nr_pages;
  1866					goto activate_locked;
  1867	
  1868				/* Case 3 above */
  1869				} else {
  1870					folio_unlock(folio);
  1871					folio_wait_writeback(folio);
  1872					/* then go back and try same folio again */
  1873					list_add_tail(&folio->lru, folio_list);
  1874					continue;
  1875				}
  1876			}
  1877	
  1878			if (!ignore_references)
  1879				references = folio_check_references(folio, sc);
  1880	
  1881			switch (references) {
  1882			case FOLIOREF_ACTIVATE:
  1883				goto activate_locked;
  1884			case FOLIOREF_KEEP:
  1885				stat->nr_ref_keep += nr_pages;
  1886				goto keep_locked;
  1887			case FOLIOREF_RECLAIM:
  1888			case FOLIOREF_RECLAIM_CLEAN:
  1889				; /* try to reclaim the folio below */
  1890			}
  1891	
  1892			/*
  1893			 * Before reclaiming the folio, try to relocate
  1894			 * its contents to another node.
  1895			 */
  1896			if (do_demote_pass &&
  1897			    (thp_migration_supported() || !folio_test_large(folio))) {
  1898				list_add(&folio->lru, &demote_folios);
  1899				folio_unlock(folio);
  1900				continue;
  1901			}
  1902	
  1903			/*
  1904			 * Anonymous process memory has backing store?
  1905			 * Try to allocate it some swap space here.
  1906			 * Lazyfree folio could be freed directly
  1907			 */
  1908			if (folio_test_anon(folio) && folio_test_swapbacked(folio)) {
  1909				if (!folio_test_swapcache(folio)) {
  1910					if (!(sc->gfp_mask & __GFP_IO))
  1911						goto keep_locked;
  1912					if (folio_maybe_dma_pinned(folio))
  1913						goto keep_locked;
  1914					if (folio_test_large(folio)) {
  1915						/* cannot split folio, skip it */
  1916						if (!can_split_folio(folio, NULL))
  1917							goto activate_locked;
  1918						/*
  1919						 * Split partially mapped folios right away.
  1920						 * We can free the unmapped pages without IO.
  1921						 */
  1922						if (data_race(!list_empty(&folio->_deferred_list)) &&
  1923						    split_folio_to_list(folio, folio_list))
  1924							goto activate_locked;
  1925					}
  1926					if (!add_to_swap(folio)) {
  1927						int __maybe_unused order = folio_order(folio);
  1928	
  1929						if (!folio_test_large(folio))
  1930							goto activate_locked_split;
  1931						/* Fallback to swap normal pages */
  1932						if (split_folio_to_list(folio, folio_list))
  1933							goto activate_locked;
  1934	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  1935						if (nr_pages >= HPAGE_PMD_NR) {
  1936							count_memcg_folio_events(folio, THP_SWPOUT_FALLBACK, 1);
  1937							count_vm_event(THP_SWPOUT_FALLBACK);
  1938						}
  1939						count_mthp_stat(order, MTHP_STAT_SWPOUT_FALLBACK);
  1940	#endif
  1941						if (!add_to_swap(folio))
  1942							goto activate_locked_split;
  1943					}
  1944				}
  1945			}
  1946	
  1947			/*
  1948			 * If the folio was split above, the tail pages will make
  1949			 * their own pass through this function and be accounted
  1950			 * then.
  1951			 */
  1952			if ((nr_pages > 1) && !folio_test_large(folio)) {
  1953				sc->nr_scanned -= (nr_pages - 1);
  1954				nr_pages = 1;
  1955			}
  1956	
  1957			/*
  1958			 * The folio is mapped into the page tables of one or more
  1959			 * processes. Try to unmap it here.
  1960			 */
  1961			if (folio_mapped(folio)) {
  1962				enum ttu_flags flags = TTU_BATCH_FLUSH;
  1963				bool was_swapbacked = folio_test_swapbacked(folio);
  1964	
  1965				if (folio_test_pmd_mappable(folio))
  1966					flags |= TTU_SPLIT_HUGE_PMD;
  1967	
  1968				try_to_unmap(folio, flags);
  1969				if (folio_mapped(folio)) {
  1970					stat->nr_unmap_fail += nr_pages;
  1971					if (!was_swapbacked &&
  1972					    folio_test_swapbacked(folio))
  1973						stat->nr_lazyfree_fail += nr_pages;
  1974					goto activate_locked;
  1975				}
  1976			}
  1977	
  1978			/*
  1979			 * Folio is unmapped now so it cannot be newly pinned anymore.
  1980			 * No point in trying to reclaim folio if it is pinned.
  1981			 * Furthermore we don't want to reclaim underlying fs metadata
  1982			 * if the folio is pinned and thus potentially modified by the
  1983			 * pinning process as that may upset the filesystem.
  1984			 */
  1985			if (folio_maybe_dma_pinned(folio))
  1986				goto activate_locked;
  1987	
  1988			mapping = folio_mapping(folio);
  1989			if (folio_test_dirty(folio)) {
  1990				/*
  1991				 * Only kswapd can writeback filesystem folios
  1992				 * to avoid risk of stack overflow. But avoid
  1993				 * injecting inefficient single-folio I/O into
  1994				 * flusher writeback as much as possible: only
  1995				 * write folios when we've encountered many
  1996				 * dirty folios, and when we've already scanned
  1997				 * the rest of the LRU for clean folios and see
  1998				 * the same dirty folios again (with the reclaim
  1999				 * flag set).
  2000				 */
  2001				if (folio_is_file_lru(folio) &&
  2002				    (!current_is_kswapd() ||
  2003				     !folio_test_reclaim(folio) ||
  2004				     !test_bit(LRUVEC_DIRTY, &pgdat->flags))) {
  2005					/*
  2006					 * Immediately reclaim when written back.
  2007					 * Similar in principle to folio_deactivate()
  2008					 * except we already have the folio isolated
  2009					 * and know it's dirty
  2010					 */
  2011					node_stat_mod_folio(folio, NR_VMSCAN_IMMEDIATE,
  2012							nr_pages);
  2013					folio_set_reclaim(folio);
  2014	
  2015					goto activate_locked;
  2016				}
  2017	
  2018				if (references == FOLIOREF_RECLAIM_CLEAN)
  2019					goto keep_locked;
  2020				if (!may_enter_fs(folio, sc->gfp_mask))
  2021					goto keep_locked;
  2022				if (!sc->may_writepage)
  2023					goto keep_locked;
  2024	
  2025				/*
  2026				 * Folio is dirty. Flush the TLB if a writable entry
  2027				 * potentially exists to avoid CPU writes after I/O
  2028				 * starts and then write it out here.
  2029				 */
  2030				try_to_unmap_flush_dirty();
  2031				switch (pageout(folio, mapping, &plug, folio_list)) {
  2032				case PAGE_KEEP:
  2033					goto keep_locked;
  2034				case PAGE_ACTIVATE:
  2035					/*
  2036					 * If shmem folio is split when writeback to swap,
  2037					 * the tail pages will make their own pass through
  2038					 * this function and be accounted then.
  2039					 */
  2040					if (nr_pages > 1 && !folio_test_large(folio)) {
  2041						sc->nr_scanned -= (nr_pages - 1);
  2042						nr_pages = 1;
  2043					}
  2044					goto activate_locked;
  2045				case PAGE_SUCCESS:
  2046					if (nr_pages > 1 && !folio_test_large(folio)) {
  2047						sc->nr_scanned -= (nr_pages - 1);
  2048						nr_pages = 1;
  2049					}
  2050					stat->nr_pageout += nr_pages;
  2051	
  2052					if (folio_test_writeback(folio))
  2053						goto keep;
  2054					if (folio_test_dirty(folio))
  2055						goto keep;
  2056	
  2057					/*
  2058					 * A synchronous write - probably a ramdisk.  Go
  2059					 * ahead and try to reclaim the folio.
  2060					 */
  2061					if (!folio_trylock(folio))
  2062						goto keep;
  2063					if (folio_test_dirty(folio) ||
  2064					    folio_test_writeback(folio))
  2065						goto keep_locked;
  2066					mapping = folio_mapping(folio);
  2067					fallthrough;
  2068				case PAGE_CLEAN:
  2069					; /* try to free the folio below */
  2070				}
  2071			}
  2072	
  2073			/*
  2074			 * If the folio has buffers, try to free the buffer
  2075			 * mappings associated with this folio. If we succeed
  2076			 * we try to free the folio as well.
  2077			 *
  2078			 * We do this even if the folio is dirty.
  2079			 * filemap_release_folio() does not perform I/O, but it
  2080			 * is possible for a folio to have the dirty flag set,
  2081			 * but it is actually clean (all its buffers are clean).
  2082			 * This happens if the buffers were written out directly,
  2083			 * with submit_bh(). ext3 will do this, as well as
  2084			 * the blockdev mapping.  filemap_release_folio() will
  2085			 * discover that cleanness and will drop the buffers
  2086			 * and mark the folio clean - it can be freed.
  2087			 *
  2088			 * Rarely, folios can have buffers and no ->mapping.
  2089			 * These are the folios which were not successfully
  2090			 * invalidated in truncate_cleanup_folio().  We try to
  2091			 * drop those buffers here and if that worked, and the
  2092			 * folio is no longer mapped into process address space
  2093			 * (refcount == 1) it can be freed.  Otherwise, leave
  2094			 * the folio on the LRU so it is swappable.
  2095			 */
  2096			if (folio_needs_release(folio)) {
  2097				if (!filemap_release_folio(folio, sc->gfp_mask))
  2098					goto activate_locked;
  2099				if (!mapping && folio_ref_count(folio) == 1) {
  2100					folio_unlock(folio);
  2101					if (folio_put_testzero(folio))
  2102						goto free_it;
  2103					else {
  2104						/*
  2105						 * rare race with speculative reference.
  2106						 * the speculative reference will free
  2107						 * this folio shortly, so we may
  2108						 * increment nr_reclaimed here (and
  2109						 * leave it off the LRU).
  2110						 */
  2111						nr_reclaimed += nr_pages;
  2112						continue;
  2113					}
  2114				}
  2115			}
  2116	
  2117			if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
  2118				/* follow __remove_mapping for reference */
  2119				if (!folio_ref_freeze(folio, 1))
  2120					goto keep_locked;
  2121				/*
  2122				 * The folio has only one reference left, which is
  2123				 * from the isolation. After the caller puts the
  2124				 * folio back on the lru and drops the reference, the
  2125				 * folio will be freed anyway. It doesn't matter
  2126				 * which lru it goes on. So we don't bother checking
  2127				 * the dirty flag here.
  2128				 */
  2129				count_vm_events(PGLAZYFREED, nr_pages);
  2130				count_memcg_folio_events(folio, PGLAZYFREED, nr_pages);
  2131			} else if (!mapping || !__remove_mapping(mapping, folio, true,
  2132								 sc->target_mem_cgroup))
  2133				goto keep_locked;
  2134	
  2135			folio_unlock(folio);
  2136	free_it:
  2137			/*
  2138			 * Folio may get swapped out as a whole, need to account
  2139			 * all pages in it.
  2140			 */
  2141			nr_reclaimed += nr_pages;
  2142	
  2143			/*
  2144			 * Is there need to periodically free_folio_list? It would
  2145			 * appear not as the counts should be low
  2146			 */
  2147			if (unlikely(folio_test_large(folio)))
  2148				destroy_large_folio(folio);
  2149			else
  2150				list_add(&folio->lru, &free_folios);
  2151			continue;
  2152	
  2153	activate_locked_split:
  2154			/*
  2155			 * The tail pages that are failed to add into swap cache
  2156			 * reach here.  Fixup nr_scanned and nr_pages.
  2157			 */
  2158			if (nr_pages > 1) {
  2159				sc->nr_scanned -= (nr_pages - 1);
  2160				nr_pages = 1;
  2161			}
  2162	activate_locked:
  2163			/* Not a candidate for swapping, so reclaim swap space. */
  2164			if (folio_test_swapcache(folio) &&
  2165			    (mem_cgroup_swap_full(folio) || folio_test_mlocked(folio)))
  2166				folio_free_swap(folio);
  2167			VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
  2168			if (!folio_test_mlocked(folio)) {
  2169				int type = folio_is_file_lru(folio);
  2170				folio_set_active(folio);
  2171				stat->nr_activate[type] += nr_pages;
  2172				count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
  2173			}
  2174	keep_locked:
  2175			folio_unlock(folio);
  2176	keep:
  2177			list_add(&folio->lru, &ret_folios);
  2178			VM_BUG_ON_FOLIO(folio_test_lru(folio) ||
  2179					folio_test_unevictable(folio), folio);
  2180		}
  2181		/* 'folio_list' is always empty here */
  2182	
  2183		/* Migrate folios selected for demotion */
  2184		nr_reclaimed += demote_folio_list(&demote_folios, pgdat);
  2185		/* Folios that could not be demoted are still in @demote_folios */
  2186		if (!list_empty(&demote_folios)) {
  2187			/* Folios which weren't demoted go back on @folio_list */
  2188			list_splice_init(&demote_folios, folio_list);
  2189	
  2190			/*
  2191			 * goto retry to reclaim the undemoted folios in folio_list if
  2192			 * desired.
  2193			 *
  2194			 * Reclaiming directly from top tier nodes is not often desired
  2195			 * due to it breaking the LRU ordering: in general memory
  2196			 * should be reclaimed from lower tier nodes and demoted from
  2197			 * top tier nodes.
  2198			 *
  2199			 * However, disabling reclaim from top tier nodes entirely
  2200			 * would cause ooms in edge scenarios where lower tier memory
  2201			 * is unreclaimable for whatever reason, eg memory being
  2202			 * mlocked or too hot to reclaim. We can disable reclaim
  2203			 * from top tier nodes in proactive reclaim though as that is
  2204			 * not real memory pressure.
  2205			 */
  2206			if (!sc->proactive) {
  2207				do_demote_pass = false;
  2208				goto retry;
  2209			}
  2210		}
  2211	
  2212		pgactivate = stat->nr_activate[0] + stat->nr_activate[1];
  2213	
  2214		mem_cgroup_uncharge_list(&free_folios);
  2215		try_to_unmap_flush();
  2216		free_unref_page_list(&free_folios);
  2217	
  2218		list_splice(&ret_folios, folio_list);
  2219		count_vm_events(PGACTIVATE, pgactivate);
  2220	
  2221		if (plug)
  2222			swap_write_unplug(plug);
  2223		return nr_reclaimed;
  2224	}
  2225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
