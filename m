Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C31B042E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 06:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743835435; cv=none; b=AjKleAk4zIl11MdjJuU8NFNqw3edi/O2h9DzawUfPDoNdiR8ci3/Dwxd1tZnZgSg/suvVVWRRSkW56uoPJXNNPiOaHHb+MAr+b1It7RFaxaxJACMvAMjwv94/qZFCkBk696TKyGjhK0DnsZNeIs6qQJlkT1YwCDSe2vB7CkG2cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743835435; c=relaxed/simple;
	bh=L/BfebJsWPW09pX/2X+2dtQR51eThG+koOcN5rMhWhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIGXZ0Sy5VJL7NWRR3kj2szEA0gTJGl/e6+usHK6HEBqBQTL4DMcsoWyu4nGabEQ7HCXvaxBjcnqvTAvuPFrOm9mjtf9V9SjtIEYLrSAzPIvIfISWHxaEA390qZtdV2HIYrS2Hq3zJFSlmaDqvO9Akm4N4KRRN+8TIrbZtBk4tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aThfyLip; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aThfyLip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743835433; x=1775371433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/BfebJsWPW09pX/2X+2dtQR51eThG+koOcN5rMhWhQ=;
  b=aThfyLipbOYsZpr21Gekq0HkrKdWhSqCSpAj/Me5+C7/TjkhUptYTK5s
   ErakBT+qFNbb7rrWKOaTZnvQyi9P5AMrGDXi2AsdcjSWA/yxC7JAX8xBp
   t5m1p8n/KJPD3PXX+Cn3ZhBKRt9kCiMgTde7WOPjch3pbtSlOiXnYF0IC
   n6nD+gZ0ZweB+pnRTu9tosYD9Dcpl19ZcaRN+KRo0SOzW8YOCc/0FdE10
   bOopF5vaOQDuGpDAVGRlMRudSKmQaFa6K83je/o5xGbryQgDVNVR31KIU
   +DKwTB6z6WThl6UXkJ0flwDhueDbOJtvnDw6wezuj4pZetGWswsRLxCVT
   Q==;
X-CSE-ConnectionGUID: g3W4RYzQTgyF59o80CRdfg==
X-CSE-MsgGUID: pwFVlalhRiqXvgGXUzqIOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56648580"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="56648580"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 23:43:53 -0700
X-CSE-ConnectionGUID: VVUxr93eSG2gn4H+Nu9kiw==
X-CSE-MsgGUID: SktiV3lnRiylLty2tTLIUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="127376918"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2025 23:43:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0xFs-0001rd-3B;
	Sat, 05 Apr 2025 06:43:48 +0000
Date: Sat, 5 Apr 2025 14:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/12] mm/filemap.c:1909:60:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202504051410.jLrdPzwt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   549cfab57c29bdb8f5df3031ef883e23c1fd7a40
commit: 5f7004a8d09a928abe77727512f37fb570a66690 [0/12] ANDROID: mm: Add vendor hook in filemap_get_folio()
config: x86_64-randconfig-123-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051410.jLrdPzwt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051410.jLrdPzwt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051410.jLrdPzwt-lkp@intel.com/

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
