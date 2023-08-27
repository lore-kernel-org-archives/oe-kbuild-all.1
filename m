Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583436A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 01:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693100499; x=1724636499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7XoI2JL/nJjBX9Fe2pFzuHxd22kQZfOHtuORwsFACw=;
  b=nvz92yIRBx2FA3eBJL0iAiO0FPugGCob5By+EGZJmdfZgCXtrjTZ/PEL
   jlwiJQm6e8W8w1hlFnkQtsFI4EQFuFVcwYzGbgWEqkmqO97bMow+2vWrZ
   A4aiBPBZQ/BMTWudYE3Rd5mvkfE5oeFt0XkN09ROrAHmnDPc4cFCnI20I
   eDoE1ZuWO6mifsctz9xMoljHm0vmNE/3S12ilVrky+5vXV/QPF3tNQ485
   dUTW9JGGdawO5eVC5u3g2w+PVrBKluUlwkeEMEBR2vKzqIq/LIwJVRZjS
   CT4dzEK1PlzMVWLuqL/9Zzu8d1VGCGBT0Iu3enyUas5/avHAKgd0AjNJ8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="373790129"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="373790129"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 18:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="687707444"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="687707444"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Aug 2023 18:41:34 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa4mT-0005GR-2n;
	Sun, 27 Aug 2023 01:41:33 +0000
Date: Sun, 27 Aug 2023 09:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-nobdev-20230822-minorder 11585/11599]
 mm/filemap.c:1877 __filemap_get_folio() warn: inconsistent indenting
Message-ID: <202308270953.qOl0WKg9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230822-minorder
head:   8685ca5fce6fede915222ae35e0885eb9442d25e
commit: 5f72bf46d09d734d5b4d55f18dc93b606c84279e [11585/11599] filemap: use minimum order while allocating folios
config: x86_64-randconfig-161-20230823 (https://download.01.org/0day-ci/archive/20230827/202308270953.qOl0WKg9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270953.qOl0WKg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270953.qOl0WKg9-lkp@intel.com/

smatch warnings:
mm/filemap.c:1877 __filemap_get_folio() warn: inconsistent indenting

vim +1877 mm/filemap.c

  1856	
  1857	/**
  1858	 * __filemap_get_folio - Find and get a reference to a folio.
  1859	 * @mapping: The address_space to search.
  1860	 * @index: The page index.
  1861	 * @fgp_flags: %FGP flags modify how the folio is returned.
  1862	 * @gfp: Memory allocation flags to use if %FGP_CREAT is specified.
  1863	 *
  1864	 * Looks up the page cache entry at @mapping & @index.
  1865	 *
  1866	 * If %FGP_LOCK or %FGP_CREAT are specified then the function may sleep even
  1867	 * if the %GFP flags specified for %FGP_CREAT are atomic.
  1868	 *
  1869	 * If this function returns a folio, it is returned with an increased refcount.
  1870	 *
  1871	 * Return: The found folio or an ERR_PTR() otherwise.
  1872	 */
  1873	struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
  1874			fgf_t fgp_flags, gfp_t gfp)
  1875	{
  1876		struct folio *folio;
> 1877	       int min_order = mapping_min_folio_order(mapping);
  1878	       int nr_of_pages = (1U << min_order);
  1879	
  1880	
  1881	repeat:
  1882		folio = filemap_get_entry(mapping, index);
  1883		if (xa_is_value(folio))
  1884			folio = NULL;
  1885		if (!folio)
  1886			goto no_page;
  1887	
  1888		if (fgp_flags & FGP_LOCK) {
  1889			if (fgp_flags & FGP_NOWAIT) {
  1890				if (!folio_trylock(folio)) {
  1891					folio_put(folio);
  1892					return ERR_PTR(-EAGAIN);
  1893				}
  1894			} else {
  1895				folio_lock(folio);
  1896			}
  1897	
  1898			/* Has the page been truncated? */
  1899			if (unlikely(folio->mapping != mapping)) {
  1900				folio_unlock(folio);
  1901				folio_put(folio);
  1902				goto repeat;
  1903			}
  1904			VM_BUG_ON_FOLIO(!folio_contains(folio, index), folio);
  1905		}
  1906	
  1907		if (fgp_flags & FGP_ACCESSED)
  1908			folio_mark_accessed(folio);
  1909		else if (fgp_flags & FGP_WRITE) {
  1910			/* Clear idle flag for buffer write */
  1911			if (folio_test_idle(folio))
  1912				folio_clear_idle(folio);
  1913		}
  1914	
  1915		if (fgp_flags & FGP_STABLE)
  1916			folio_wait_stable(folio);
  1917	no_page:
  1918		if (!folio && (fgp_flags & FGP_CREAT)) {
  1919			unsigned order = FGF_GET_ORDER(fgp_flags);
  1920			int err;
  1921	
  1922			if ((fgp_flags & FGP_WRITE) && mapping_can_writeback(mapping))
  1923				gfp |= __GFP_WRITE;
  1924			if (fgp_flags & FGP_NOFS)
  1925				gfp &= ~__GFP_FS;
  1926			if (fgp_flags & FGP_NOWAIT) {
  1927				gfp &= ~GFP_KERNEL;
  1928				gfp |= GFP_NOWAIT | __GFP_NOWARN;
  1929			}
  1930			if (WARN_ON_ONCE(!(fgp_flags & (FGP_LOCK | FGP_FOR_MMAP))))
  1931				fgp_flags |= FGP_LOCK;
  1932	
  1933			if (!mapping_large_folio_support(mapping))
  1934				order = 0;
  1935			if (order > MAX_PAGECACHE_ORDER)
  1936				order = MAX_PAGECACHE_ORDER;
  1937	
  1938			if (min_order)
  1939				index = round_down(index, nr_of_pages);
  1940			/* If we're not aligned, allocate a smaller folio */
  1941			if (index & ((1UL << order) - 1))
  1942				order = __ffs(index);
  1943	
  1944			do {
  1945				gfp_t alloc_gfp = gfp;
  1946	
  1947				err = -ENOMEM;
  1948				if (order == 1)
  1949					order = 0;
  1950				if (order > 0)
  1951					alloc_gfp |= __GFP_NORETRY | __GFP_NOWARN;
  1952	
  1953				if (min_order && (order < min_order))
  1954					BUG();
  1955	
  1956				folio = filemap_alloc_folio(alloc_gfp, order);
  1957				if (!folio)
  1958					continue;
  1959	
  1960				/* Init accessed so avoid atomic mark_page_accessed later */
  1961				if (fgp_flags & FGP_ACCESSED)
  1962					__folio_set_referenced(folio);
  1963	
  1964				err = filemap_add_folio(mapping, folio, index, gfp);
  1965				if (!err)
  1966					break;
  1967				folio_put(folio);
  1968				folio = NULL;
  1969			} while (order-- > 0);
  1970	
  1971			if (err == -EEXIST)
  1972				goto repeat;
  1973			if (err)
  1974				return ERR_PTR(err);
  1975			/*
  1976			 * filemap_add_folio locks the page, and for mmap
  1977			 * we expect an unlocked page.
  1978			 */
  1979			if (folio && (fgp_flags & FGP_FOR_MMAP))
  1980				folio_unlock(folio);
  1981		}
  1982	
  1983		if (!folio)
  1984			return ERR_PTR(-ENOENT);
  1985		return folio;
  1986	}
  1987	EXPORT_SYMBOL(__filemap_get_folio);
  1988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
