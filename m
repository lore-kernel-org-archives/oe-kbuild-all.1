Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395194A02
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770920543; cv=none; b=UOANH56xHEgRs8A3Opz1hdpdaV70LMjsEf9K2Uz5ky0iTCay5v5QZVplbfuqE85Dw9Qu4kqHJP2VsY3tKn+OQIloH3qc/QH2Dkg2TiiaWceSU0VQyJsKbuluIZxtug+gb2nBIxGmnetzsVnDf28UQ6JQvYJE0d7MgUxYrXuBQ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770920543; c=relaxed/simple;
	bh=8ax0K1VZEc5q5CalYCULktcby+/9WC5DvpuRGmCJ4TY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kzB1kDaMCPcKUjMnVkU7X6K0AnnE8x2bsrUgEMULp6Yf+isRa0xdTAHU66CnFTVYL5hqMR8o4R0/E2LxjJQAaSjrR8LPpaLLwWXQgZn7+T0zI+zHf7fm0MOFIlNgUY97Yz31PpdDrR1geXppoKBgoLHxPzFFlZ0zmplWMEyF2OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ok4ZzlIj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ok4ZzlIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770920542; x=1802456542;
  h=date:from:to:cc:subject:message-id;
  bh=8ax0K1VZEc5q5CalYCULktcby+/9WC5DvpuRGmCJ4TY=;
  b=Ok4ZzlIjecW4tjANdwF1SubK5CkzMivirRo9MhB1/HxrLpEw6kvTa/qD
   xG0dlObFtnmAkLXbu0cGgPwVa1sDCvYtjkbpQA53T2qnOLhaINAQJVIiX
   /P1/zVXjcYX/+KoCzgh1vs6tNHmdXkU+pvr/pZToj4Udjdw4chr2V4uZI
   GlNEIXr3miXF6u3wJ1dX1O1upCydIenP2wu1fjMEnY83bVJKh1QncBRJs
   LaYa1ZlEglVmeCDZB7LrtNuVjm/Ej+9jlTLdecqPivtGuMcCKDRvApMez
   M99oXuMco2UQsk2UDbBSFJvGzIPrmbvQ8hgstq1FCOGWELzHpS4sJdK7w
   w==;
X-CSE-ConnectionGUID: Bth+kgOZTV2cgGSaX63FjA==
X-CSE-MsgGUID: mhL2K1o1S1iO997J/KFCVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72005821"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="72005821"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 10:22:21 -0800
X-CSE-ConnectionGUID: 60r3PiZ1TKuxU85PX3GeVg==
X-CSE-MsgGUID: bUTQ2xMxRAy8xBz9w5YPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="242222436"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2026 10:22:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqbKS-00000000sHA-34kr;
	Thu, 12 Feb 2026 18:22:16 +0000
Date: Fri, 13 Feb 2026 02:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/4] mm/filemap.c:1909:60:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202602130232.BFa3xRhN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   8509f529f4f89b70589200986bed71bd0e69d008
commit: 5f7004a8d09a928abe77727512f37fb570a66690 [0/4] ANDROID: mm: Add vendor hook in filemap_get_folio()
config: i386-randconfig-061-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130232.BFa3xRhN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130232.BFa3xRhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130232.BFa3xRhN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/filemap.c:1909:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int fgp_flags @@     got restricted fgf_t [usertype] fgp_flags @@
   mm/filemap.c:1909:60: sparse:     expected int fgp_flags
   mm/filemap.c:1909:60: sparse:     got restricted fgf_t [usertype] fgp_flags
   mm/filemap.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h, include/linux/dax.h):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in 'filemap_fault_recheck_pte_none' - unexpected unlock
   include/linux/rcupdate.h:878:9: sparse: sparse: context imbalance in 'filemap_map_pages' - different lock contexts for basic block

vim +1909 mm/filemap.c

  1883	
  1884	/**
  1885	 * __filemap_get_folio - Find and get a reference to a folio.
  1886	 * @mapping: The address_space to search.
  1887	 * @index: The page index.
  1888	 * @fgp_flags: %FGP flags modify how the folio is returned.
  1889	 * @gfp: Memory allocation flags to use if %FGP_CREAT is specified.
  1890	 *
  1891	 * Looks up the page cache entry at @mapping & @index.
  1892	 *
  1893	 * If %FGP_LOCK or %FGP_CREAT are specified then the function may sleep even
  1894	 * if the %GFP flags specified for %FGP_CREAT are atomic.
  1895	 *
  1896	 * If this function returns a folio, it is returned with an increased refcount.
  1897	 *
  1898	 * Return: The found folio or an ERR_PTR() otherwise.
  1899	 */
  1900	struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
  1901			fgf_t fgp_flags, gfp_t gfp)
  1902	{
  1903		struct folio *folio;
  1904	
  1905	repeat:
  1906		folio = filemap_get_entry(mapping, index);
  1907		if (xa_is_value(folio))
  1908			folio = NULL;
> 1909		trace_android_vh_filemap_get_folio(mapping, index, fgp_flags,
  1910						gfp, folio);
  1911		if (!folio)
  1912			goto no_page;
  1913	
  1914		if (fgp_flags & FGP_LOCK) {
  1915			if (fgp_flags & FGP_NOWAIT) {
  1916				if (!folio_trylock(folio)) {
  1917					folio_put(folio);
  1918					return ERR_PTR(-EAGAIN);
  1919				}
  1920			} else {
  1921				folio_lock(folio);
  1922			}
  1923	
  1924			/* Has the page been truncated? */
  1925			if (unlikely(folio->mapping != mapping)) {
  1926				folio_unlock(folio);
  1927				folio_put(folio);
  1928				goto repeat;
  1929			}
  1930			VM_BUG_ON_FOLIO(!folio_contains(folio, index), folio);
  1931		}
  1932	
  1933		if (fgp_flags & FGP_ACCESSED)
  1934			folio_mark_accessed(folio);
  1935		else if (fgp_flags & FGP_WRITE) {
  1936			/* Clear idle flag for buffer write */
  1937			if (folio_test_idle(folio))
  1938				folio_clear_idle(folio);
  1939		}
  1940	
  1941		if (fgp_flags & FGP_STABLE)
  1942			folio_wait_stable(folio);
  1943	no_page:
  1944		if (!folio && (fgp_flags & FGP_CREAT)) {
  1945			unsigned int min_order = mapping_min_folio_order(mapping);
  1946			unsigned int order = max(min_order, FGF_GET_ORDER(fgp_flags));
  1947			int err;
  1948			index = mapping_align_index(mapping, index);
  1949	
  1950			if ((fgp_flags & FGP_WRITE) && mapping_can_writeback(mapping))
  1951				gfp |= __GFP_WRITE;
  1952			if (fgp_flags & FGP_NOFS)
  1953				gfp &= ~__GFP_FS;
  1954			if (fgp_flags & FGP_NOWAIT) {
  1955				gfp &= ~GFP_KERNEL;
  1956				gfp |= GFP_NOWAIT | __GFP_NOWARN;
  1957			}
  1958			if (WARN_ON_ONCE(!(fgp_flags & (FGP_LOCK | FGP_FOR_MMAP))))
  1959				fgp_flags |= FGP_LOCK;
  1960	
  1961			if (order > mapping_max_folio_order(mapping))
  1962				order = mapping_max_folio_order(mapping);
  1963			/* If we're not aligned, allocate a smaller folio */
  1964			if (index & ((1UL << order) - 1))
  1965				order = __ffs(index);
  1966	
  1967			do {
  1968				gfp_t alloc_gfp = gfp;
  1969	
  1970				err = -ENOMEM;
  1971				if (order > min_order)
  1972					alloc_gfp |= __GFP_NORETRY | __GFP_NOWARN;
  1973				folio = filemap_alloc_folio(alloc_gfp, order);
  1974				if (!folio)
  1975					continue;
  1976	
  1977				/* Init accessed so avoid atomic mark_page_accessed later */
  1978				if (fgp_flags & FGP_ACCESSED)
  1979					__folio_set_referenced(folio);
  1980	
  1981				err = filemap_add_folio(mapping, folio, index, gfp);
  1982				if (!err)
  1983					break;
  1984				folio_put(folio);
  1985				folio = NULL;
  1986			} while (order-- > min_order);
  1987	
  1988			if (err == -EEXIST)
  1989				goto repeat;
  1990			if (err)
  1991				return ERR_PTR(err);
  1992			/*
  1993			 * filemap_add_folio locks the page, and for mmap
  1994			 * we expect an unlocked page.
  1995			 */
  1996			if (folio && (fgp_flags & FGP_FOR_MMAP))
  1997				folio_unlock(folio);
  1998		}
  1999	
  2000		if (!folio)
  2001			return ERR_PTR(-ENOENT);
  2002		return folio;
  2003	}
  2004	EXPORT_SYMBOL(__filemap_get_folio);
  2005	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
