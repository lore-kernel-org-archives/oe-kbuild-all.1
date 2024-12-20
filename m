Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF35D1A8416
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 21:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734729440; cv=none; b=itrOEW12FXsgK0zzD0XPwxE4k3DLjozVibyr4HWlMqTlwRe4yEaIwPxZqaSB3vs6rBKPfyRLuD/+o8cZ1aSILRwg4nSOXwKKVpz4M8aFqktacZFDk9NrrsNNC17yQ8MxJjxrmIMIKtzk3Scs3/XxLn+J+IgnePdeLuCJJBmUdWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734729440; c=relaxed/simple;
	bh=5RnACzscWawG4avTS7Rq9pROXNhfiRYhVw44mmxP+g8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWsjkMvdH4K0v0o81Rx6/KFoP48CnbovlFUIVZSCcXsTSI0R3r510LppFY0DgS07WbU91Ssc8lYmBEL7tFUWm9lvCp4jmWDUCbp4UjfdkYXmB96wqst4p8rJBayH2WeRJ6yZ7DinFVLkaWi5KXgBGHqfHXz+4QrmFBhzdst4ln0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqCP4L+w; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqCP4L+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734729437; x=1766265437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5RnACzscWawG4avTS7Rq9pROXNhfiRYhVw44mmxP+g8=;
  b=kqCP4L+wFAuALtFpW12tEnXf/lg/JVl4mN/PsF3f4bvIUTPapEhAap+s
   pp/bQTWFkYWDlgMlUcB8FpCpW+qlrqsaCjeeXbB82CtHxltJOz5/kwkTH
   h9UBCYWy5fatSNtBv7q8Zd9bzO2uhoMWc/t1XGI5WLGPG5Y88LWSP4RA7
   zGjZtiCiXhidvdM6l/pNext5f8X99jWJR2Npi0fs+1vpRdwUCG3i2oZaM
   L4wXMiLlKhki2kHpeaJtmIfZ0u/bGsh0eeO9pf5XWkRw8CYD0IhDhtX/v
   c3WuvHT3PwBhFhnrNJKzBN/IPF9W2KcnUG4xQGjA4Sn4jvfbb8AFhna7w
   g==;
X-CSE-ConnectionGUID: NVDUuzHjTKCDYJ2DExaXgg==
X-CSE-MsgGUID: DAhJy4HATNeDnJqYJykiAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35179006"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35179006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 13:17:17 -0800
X-CSE-ConnectionGUID: eBQN3KV0RFOoWNyPM/4CZQ==
X-CSE-MsgGUID: eSWl/gxISKKWLTPvljBYBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135959788"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2024 13:17:16 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOkN0-0001g3-0j;
	Fri, 20 Dec 2024 21:17:14 +0000
Date: Sat, 21 Dec 2024 05:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 20520/20527] mm/filemap.c:1933:60:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202412210519.ZlyIoKlU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b0fdd065a6751a6fb92e88d2f97c753d59efd7b4
commit: cbac5cbf85540c043d1ddb917f288ebfe62bbca7 [20520/20527] ANDROID: mm: Add vendor hook in filemap_get_folio()
config: x86_64-randconfig-123-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210519.ZlyIoKlU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210519.ZlyIoKlU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210519.ZlyIoKlU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/filemap.c:1933:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int fgp_flags @@     got restricted fgf_t [usertype] fgp_flags @@
   mm/filemap.c:1933:60: sparse:     expected int fgp_flags
   mm/filemap.c:1933:60: sparse:     got restricted fgf_t [usertype] fgp_flags
   mm/filemap.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, include/linux/dax.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
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
