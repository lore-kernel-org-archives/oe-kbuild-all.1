Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9574683
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 04:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735964399; cv=none; b=gEpYlsnmH3NyTgVOODenJFBc4Xxwcbr/DqnmPhRZkyRwXFJiGeCI9rEC+3VgsKWqPQYnO8eru2OG6QYVXRog2B5x20kKr+lE42JmHPUdqf2K2d5rOVDV+vKuTuYvL2cyLj78aQ4z3xUMlqAdwQ8aXQaZO05euRIgNQljPO1XveY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735964399; c=relaxed/simple;
	bh=I6JkQAddRlVGqqUb25f5d2bCnPip8LUjfqpZXQN+oEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II3ls+6L7NdRQlihUufTCKKriUIsICS10VCSgzcu3ed4gF1qU/EJL02Pw+WGAhpyls76LU8I0M0+JwS0YRtEpKwrXwWR/eeNu/Z9+XNeJCE3i0GrsnD35nfGkSlOlYOAMnFPPa8Ft5wnNtNRYXtYe2WhqaCYux1QdSMrmJ1I1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7r/Pc3k; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7r/Pc3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735964398; x=1767500398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I6JkQAddRlVGqqUb25f5d2bCnPip8LUjfqpZXQN+oEY=;
  b=e7r/Pc3kYMOCzO3+616ZfWiskAKq53n0zKAPbkVa9F/75YJ0j177XHXm
   vZRwwKhZqtqBZHv6HeE73LUCR+B7uoe7JW2TqUmkP9Wk/eV28vpynFion
   Gg6kXAbbNQJk9fzzzVwDOd89RUfbx1yKl18dhpLgkFMIKrmquCP0olrdf
   g5WBrxDZPVobrjkWWfdFUFT4plNjDCHhM4TX1MLRsBdvj43DYIg0qbssU
   B7P7JgC9ONm1hwc7J/P0GtxaRtap/OKyJj8wg4KCgwBa1a3csuag2ENb7
   +aCJ6QvkOmo2NTupfiOefjoUyw/j2pTELUF6vzPN+pXnmE+7wTtb08LRL
   A==;
X-CSE-ConnectionGUID: Y21HVMECRNOgEfpFysgbOw==
X-CSE-MsgGUID: Xlle5WBiSZ2E3hq7DgKjsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36428308"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="36428308"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 20:19:56 -0800
X-CSE-ConnectionGUID: hMSOABsGTHqQu5zbtrdtjg==
X-CSE-MsgGUID: ex7oyUwEQfuBRMealkG+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106572764"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jan 2025 20:19:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTvdg-000Abf-2s;
	Sat, 04 Jan 2025 04:19:52 +0000
Date: Sat, 4 Jan 2025 12:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] mm/migrate: add migrate_folios_batch_move to
 batch the folio move operations
Message-ID: <202501041206.9cE8Qd8b-lkp@intel.com>
References: <20250103172419.4148674-4-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103172419.4148674-4-ziy@nvidia.com>

Hi Zi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master sysctl/sysctl-next v6.13-rc5 next-20241220]
[cannot apply to mcgrof/sysctl-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-separate-move-undo-doing-on-folio-list-from-migrate_pages_batch/20250104-012955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250103172419.4148674-4-ziy%40nvidia.com
patch subject: [RFC PATCH 3/5] mm/migrate: add migrate_folios_batch_move to batch the folio move operations
config: i386-buildonly-randconfig-004-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041206.9cE8Qd8b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041206.9cE8Qd8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041206.9cE8Qd8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/migrate.c: In function 'migrate_folios_batch_move':
>> mm/migrate.c:1805:14: warning: variable 'is_lru' set but not used [-Wunused-but-set-variable]
    1805 |         bool is_lru;
         |              ^~~~~~


vim +/is_lru +1805 mm/migrate.c

  1791	
  1792	static void migrate_folios_batch_move(struct list_head *src_folios,
  1793			struct list_head *dst_folios,
  1794			free_folio_t put_new_folio, unsigned long private,
  1795			enum migrate_mode mode, int reason,
  1796			struct list_head *ret_folios,
  1797			struct migrate_pages_stats *stats,
  1798			int *retry, int *thp_retry, int *nr_failed,
  1799			int *nr_retry_pages)
  1800	{
  1801		struct folio *folio, *folio2, *dst, *dst2;
  1802		int rc, nr_pages = 0, nr_mig_folios = 0;
  1803		int old_page_state = 0;
  1804		struct anon_vma *anon_vma = NULL;
> 1805		bool is_lru;
  1806		int is_thp = 0;
  1807		LIST_HEAD(err_src);
  1808		LIST_HEAD(err_dst);
  1809	
  1810		if (mode != MIGRATE_ASYNC) {
  1811			*retry += 1;
  1812			return;
  1813		}
  1814	
  1815		/*
  1816		 * Iterate over the list of locked src/dst folios to copy the metadata
  1817		 */
  1818		dst = list_first_entry(dst_folios, struct folio, lru);
  1819		dst2 = list_next_entry(dst, lru);
  1820		list_for_each_entry_safe(folio, folio2, src_folios, lru) {
  1821			is_thp = folio_test_large(folio) && folio_test_pmd_mappable(folio);
  1822			nr_pages = folio_nr_pages(folio);
  1823			is_lru = !__folio_test_movable(folio);
  1824	
  1825			/*
  1826			 * dst->private is not cleared here. It is cleared and moved to
  1827			 * src->private in __migrate_folio().
  1828			 */
  1829			__migrate_folio_read(dst, &old_page_state, &anon_vma);
  1830	
  1831			/*
  1832			 * Use MIGRATE_NO_COPY mode in migrate_folio family functions
  1833			 * to copy the flags, mapping and some other ancillary information.
  1834			 * This does everything except the page copy. The actual page copy
  1835			 * is handled later in a batch manner.
  1836			 */
  1837			rc = _move_to_new_folio_prep(dst, folio, MIGRATE_NO_COPY);
  1838	
  1839			/*
  1840			 * -EAGAIN: Move src/dst folios to tmp lists for retry
  1841			 * Other Errno: Put src folio on ret_folios list, remove the dst folio
  1842			 * Success: Copy the folio bytes, restoring working pte, unlock and
  1843			 *	    decrement refcounter
  1844			 */
  1845			if (rc == -EAGAIN) {
  1846				*retry += 1;
  1847				*thp_retry += is_thp;
  1848				*nr_retry_pages += nr_pages;
  1849	
  1850				list_move_tail(&folio->lru, &err_src);
  1851				list_move_tail(&dst->lru, &err_dst);
  1852				__migrate_folio_record(dst, old_page_state, anon_vma);
  1853			} else if (rc != MIGRATEPAGE_SUCCESS) {
  1854				*nr_failed += 1;
  1855				stats->nr_thp_failed += is_thp;
  1856				stats->nr_failed_pages += nr_pages;
  1857	
  1858				list_del(&dst->lru);
  1859				migrate_folio_undo_src(folio, old_page_state & PAGE_WAS_MAPPED,
  1860						anon_vma, true, ret_folios);
  1861				migrate_folio_undo_dst(dst, true, put_new_folio, private);
  1862			} else /* MIGRATEPAGE_SUCCESS */
  1863				nr_mig_folios++;
  1864	
  1865			dst = dst2;
  1866			dst2 = list_next_entry(dst, lru);
  1867		}
  1868	
  1869		/* Exit if folio list for batch migration is empty */
  1870		if (!nr_mig_folios)
  1871			goto out;
  1872	
  1873		/* Batch copy the folios */
  1874		{
  1875			dst = list_first_entry(dst_folios, struct folio, lru);
  1876			dst2 = list_next_entry(dst, lru);
  1877			list_for_each_entry_safe(folio, folio2, src_folios, lru) {
  1878				is_thp = folio_test_large(folio) &&
  1879					 folio_test_pmd_mappable(folio);
  1880				nr_pages = folio_nr_pages(folio);
  1881				rc = folio_mc_copy(dst, folio);
  1882	
  1883				if (rc) {
  1884					int old_page_state = 0;
  1885					struct anon_vma *anon_vma = NULL;
  1886	
  1887					/*
  1888					 * dst->private is moved to src->private in
  1889					 * __migrate_folio(), so page state and anon_vma
  1890					 * values can be extracted from (src) folio.
  1891					 */
  1892					__migrate_folio_extract(folio, &old_page_state,
  1893							&anon_vma);
  1894					migrate_folio_undo_src(folio,
  1895							old_page_state & PAGE_WAS_MAPPED,
  1896							anon_vma, true, ret_folios);
  1897					list_del(&dst->lru);
  1898					migrate_folio_undo_dst(dst, true, put_new_folio,
  1899							private);
  1900				}
  1901	
  1902				switch (rc) {
  1903				case MIGRATEPAGE_SUCCESS:
  1904					stats->nr_succeeded += nr_pages;
  1905					stats->nr_thp_succeeded += is_thp;
  1906					break;
  1907				default:
  1908					*nr_failed += 1;
  1909					stats->nr_thp_failed += is_thp;
  1910					stats->nr_failed_pages += nr_pages;
  1911					break;
  1912				}
  1913	
  1914				dst = dst2;
  1915				dst2 = list_next_entry(dst, lru);
  1916			}
  1917		}
  1918	
  1919		/*
  1920		 * Iterate the folio lists to remove migration pte and restore them
  1921		 * as working pte. Unlock the folios, add/remove them to LRU lists (if
  1922		 * applicable) and release the src folios.
  1923		 */
  1924		dst = list_first_entry(dst_folios, struct folio, lru);
  1925		dst2 = list_next_entry(dst, lru);
  1926		list_for_each_entry_safe(folio, folio2, src_folios, lru) {
  1927			is_thp = folio_test_large(folio) && folio_test_pmd_mappable(folio);
  1928			nr_pages = folio_nr_pages(folio);
  1929			/*
  1930			 * dst->private is moved to src->private in __migrate_folio(),
  1931			 * so page state and anon_vma values can be extracted from
  1932			 * (src) folio.
  1933			 */
  1934			__migrate_folio_extract(folio, &old_page_state, &anon_vma);
  1935			list_del(&dst->lru);
  1936	
  1937			_move_to_new_folio_finalize(dst, folio, MIGRATEPAGE_SUCCESS);
  1938	
  1939			/*
  1940			 * Below few steps are only applicable for lru pages which is
  1941			 * ensured as we have removed the non-lru pages from our list.
  1942			 */
  1943			_migrate_folio_move_finalize1(folio, dst, old_page_state);
  1944	
  1945			_migrate_folio_move_finalize2(folio, dst, reason, anon_vma);
  1946	
  1947			/* Page migration successful, increase stat counter */
  1948			stats->nr_succeeded += nr_pages;
  1949			stats->nr_thp_succeeded += is_thp;
  1950	
  1951			dst = dst2;
  1952			dst2 = list_next_entry(dst, lru);
  1953		}
  1954	out:
  1955		/* Add tmp folios back to the list to let CPU re-attempt migration. */
  1956		list_splice(&err_src, src_folios);
  1957		list_splice(&err_dst, dst_folios);
  1958	}
  1959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
