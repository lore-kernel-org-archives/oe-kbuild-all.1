Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B16289811
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 11:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184635; cv=none; b=KubDrl/fQ6USR+WsOYyXVKKTRM5F99Iq3U0CWetAKDax3LpJUUTL6aG5b7zSqihgangqJZyEDjBkskuDh4YHMskk7CDUp7DUjCXaZDsl99TiVrjZIWR2MrWHXdKvNxi+LyoqyWG76+NRgwuxCdZJVcp/ooDAeOLqKmgqjndhOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184635; c=relaxed/simple;
	bh=eU8+bXl71pGHDdHDAfw/KrlEc97iGJ5auh9tcyzObjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p15F3LXhLyEX8sVfHMqcXdhT6p6V1bzfErqw2uVlbCrYQQsKFts3LhD3k3bSd5EyrjV3HB7mcxdZP1TStXkjhLMnvXhuQOE1uY34nq8cOjCbCkQWuS6V1Py/m0/1Wz0ob06K1WX5vmQbDIvzoGzrn5zQYOyy84JOYslh24+Uo1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9ropdd5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9ropdd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753184633; x=1784720633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eU8+bXl71pGHDdHDAfw/KrlEc97iGJ5auh9tcyzObjw=;
  b=B9ropdd5DVA0iFXLPlYYwo7r3F7i5iI93AnKlMx66bzFykVVvTBtXnQI
   ssG3lwGxCHNvgz5yCCNg09gehT5tUlgzaA8advPRNigMTLhe16vXUiTcy
   NSYww6q8D3GnMcAjdBZ3vOYBtld4SwvnGO9cgpVbIMRFVjr0Is3laDs/Y
   sz/j3zE7ERW2xg7vrgEJNU0qmddc6/0sr6m6dAyfE2yb8CZfHEusdIOMv
   WUH+S+Zs5ctPZO/BFns7yspPh2tmm0JzSoiB6y/jvRNxiOA1dcpGqTpfp
   Hkoaa4aUxWQ2jCRRcmhalXQ4yc+vauTFYfT/dJN+/9dygg0t697HGD8fM
   g==;
X-CSE-ConnectionGUID: 8wj29PR2TvOBZUkSnuidHQ==
X-CSE-MsgGUID: sPmNHkxISUCTW6ZckTJDjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66861396"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="66861396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 04:43:52 -0700
X-CSE-ConnectionGUID: y2yTHFxfR4yaf0pZ1GTVJw==
X-CSE-MsgGUID: nUuk777WTa+chwcPD6LkHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="190073599"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jul 2025 04:43:51 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueBPR-000HkR-0M;
	Tue, 22 Jul 2025 11:43:49 +0000
Date: Tue, 22 Jul 2025 19:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-02 2/2] mm/filemap.c:1933:60:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202507221930.U3treVDS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-02
head:   d0c43a640eabd158f426e314f7bf2019a4f3e102
commit: cbac5cbf85540c043d1ddb917f288ebfe62bbca7 [2/2] ANDROID: mm: Add vendor hook in filemap_get_folio()
config: i386-randconfig-r121-20250722 (https://download.01.org/0day-ci/archive/20250722/202507221930.U3treVDS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221930.U3treVDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221930.U3treVDS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/filemap.c:1933:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int fgp_flags @@     got restricted fgf_t [usertype] fgp_flags @@
   mm/filemap.c:1933:60: sparse:     expected int fgp_flags
   mm/filemap.c:1933:60: sparse:     got restricted fgf_t [usertype] fgp_flags
   mm/filemap.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h, include/linux/dax.h):
   include/linux/rcupdate.h:815:9: sparse: sparse: context imbalance in 'filemap_map_pages' - different lock contexts for basic block

vim +1933 mm/filemap.c

  1907	
  1908	/**
  1909	 * __filemap_get_folio - Find and get a reference to a folio.
  1910	 * @mapping: The address_space to search.
  1911	 * @index: The page index.
  1912	 * @fgp_flags: %FGP flags modify how the folio is returned.
  1913	 * @gfp: Memory allocation flags to use if %FGP_CREAT is specified.
  1914	 *
  1915	 * Looks up the page cache entry at @mapping & @index.
  1916	 *
  1917	 * If %FGP_LOCK or %FGP_CREAT are specified then the function may sleep even
  1918	 * if the %GFP flags specified for %FGP_CREAT are atomic.
  1919	 *
  1920	 * If this function returns a folio, it is returned with an increased refcount.
  1921	 *
  1922	 * Return: The found folio or an ERR_PTR() otherwise.
  1923	 */
  1924	struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
  1925			fgf_t fgp_flags, gfp_t gfp)
  1926	{
  1927		struct folio *folio;
  1928	
  1929	repeat:
  1930		folio = filemap_get_entry(mapping, index);
  1931		if (xa_is_value(folio))
  1932			folio = NULL;
> 1933		trace_android_vh_filemap_get_folio(mapping, index, fgp_flags,
  1934						gfp, folio);
  1935		if (!folio)
  1936			goto no_page;
  1937	
  1938		if (fgp_flags & FGP_LOCK) {
  1939			if (fgp_flags & FGP_NOWAIT) {
  1940				if (!folio_trylock(folio)) {
  1941					folio_put(folio);
  1942					return ERR_PTR(-EAGAIN);
  1943				}
  1944			} else {
  1945				folio_lock(folio);
  1946			}
  1947	
  1948			/* Has the page been truncated? */
  1949			if (unlikely(folio->mapping != mapping)) {
  1950				folio_unlock(folio);
  1951				folio_put(folio);
  1952				goto repeat;
  1953			}
  1954			VM_BUG_ON_FOLIO(!folio_contains(folio, index), folio);
  1955		}
  1956	
  1957		if (fgp_flags & FGP_ACCESSED)
  1958			folio_mark_accessed(folio);
  1959		else if (fgp_flags & FGP_WRITE) {
  1960			/* Clear idle flag for buffer write */
  1961			if (folio_test_idle(folio))
  1962				folio_clear_idle(folio);
  1963		}
  1964	
  1965		if (fgp_flags & FGP_STABLE)
  1966			folio_wait_stable(folio);
  1967	no_page:
  1968		if (!folio && (fgp_flags & FGP_CREAT)) {
  1969			unsigned order = FGF_GET_ORDER(fgp_flags);
  1970			int err;
  1971	
  1972			if ((fgp_flags & FGP_WRITE) && mapping_can_writeback(mapping))
  1973				gfp |= __GFP_WRITE;
  1974			if (fgp_flags & FGP_NOFS)
  1975				gfp &= ~__GFP_FS;
  1976			if (fgp_flags & FGP_NOWAIT) {
  1977				gfp &= ~GFP_KERNEL;
  1978				gfp |= GFP_NOWAIT | __GFP_NOWARN;
  1979			}
  1980			if (WARN_ON_ONCE(!(fgp_flags & (FGP_LOCK | FGP_FOR_MMAP))))
  1981				fgp_flags |= FGP_LOCK;
  1982	
  1983			if (!mapping_large_folio_support(mapping))
  1984				order = 0;
  1985			if (order > MAX_PAGECACHE_ORDER)
  1986				order = MAX_PAGECACHE_ORDER;
  1987			/* If we're not aligned, allocate a smaller folio */
  1988			if (index & ((1UL << order) - 1))
  1989				order = __ffs(index);
  1990	
  1991			do {
  1992				gfp_t alloc_gfp = gfp;
  1993	
  1994				err = -ENOMEM;
  1995				if (order == 1)
  1996					order = 0;
  1997				if (order > 0)
  1998					alloc_gfp |= __GFP_NORETRY | __GFP_NOWARN;
  1999				folio = filemap_alloc_folio(alloc_gfp, order);
  2000				if (!folio)
  2001					continue;
  2002	
  2003				/* Init accessed so avoid atomic mark_page_accessed later */
  2004				if (fgp_flags & FGP_ACCESSED)
  2005					__folio_set_referenced(folio);
  2006	
  2007				err = filemap_add_folio(mapping, folio, index, gfp);
  2008				if (!err)
  2009					break;
  2010				folio_put(folio);
  2011				folio = NULL;
  2012			} while (order-- > 0);
  2013	
  2014			if (err == -EEXIST)
  2015				goto repeat;
  2016			if (err)
  2017				return ERR_PTR(err);
  2018			/*
  2019			 * filemap_add_folio locks the page, and for mmap
  2020			 * we expect an unlocked page.
  2021			 */
  2022			if (folio && (fgp_flags & FGP_FOR_MMAP))
  2023				folio_unlock(folio);
  2024		}
  2025	
  2026		if (!folio)
  2027			return ERR_PTR(-ENOENT);
  2028		return folio;
  2029	}
  2030	EXPORT_SYMBOL(__filemap_get_folio);
  2031	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
