Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAD23A6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 02:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754014866; cv=none; b=K/8+lbXV9Z+aDbO1Si/6cS+7DLirhjQbTR6bFvjtzjNcfKux1cODDegPpPfJKNxmQ3SPvsmrwO1SgzEEnPBWGjgLQXPAGbEBD2UXUUmWLq4UJcJqY82kwOS36FpW8jmne5GxkiVqzbZI6Y9LKH/NGrC2NL8kSQ96zz/AYGv5v6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754014866; c=relaxed/simple;
	bh=Z0g4QiVb2fnvAIn/hPGsA3RcMEgHNUylGQu+qFAnfSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+qNBtrzHAGDFJAPeEZwfslXTYMdn77XeLPnJY8Jhi7PP3PVwC+ZbrN4tmxkmTvChjCJA2c2lGBg5nGAQjSrVBdC1dPkGMN8WXhzM2ZiRW73O7fm//vmxHbn84dsvM36INHoPpq/BlF6a7NehTg4lqpaqI9Bx7KvpVT+3xPCW5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NH07LSxM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NH07LSxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754014863; x=1785550863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z0g4QiVb2fnvAIn/hPGsA3RcMEgHNUylGQu+qFAnfSE=;
  b=NH07LSxMzRlFX8JeUrlfCmyTYfuweHdZFOWRCDEQwr7VA5TMHaQtE0pf
   PCTGHva315fltHcbYMqyUxXkCJ4lGU7f+ApM67nHX/qi6/FjULHwvCpxx
   SR1SfVyZ7l7XR0t2MsOne6yoTUkMIxOxE1ytW/JUioNj9o/xYW0DJgwQP
   YnuW3sDu7fzytJlo84to7eAtpCGDEOs1F0HcRdyaFsH574BKMkCNLvau1
   YlEgx21uDK5kN+pievv80qjYzLw2VRBd8LCBxWo9xTrySpgFXOFIcihI1
   IS0GUHjrnWdCS0JEKzBoVAfHhBHSfzeV+1wXRvGZuObJgJV/ibC+IFfc2
   Q==;
X-CSE-ConnectionGUID: glThzCpdQqq0vlb5ZBERkw==
X-CSE-MsgGUID: KsuauNwvRqG6600utnoy1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56501186"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56501186"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 19:21:02 -0700
X-CSE-ConnectionGUID: tRROlMOiTIm7n5ZGH+7l/A==
X-CSE-MsgGUID: /B26K+EiSSOzYPFZksbgeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="168820976"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Jul 2025 19:21:00 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhfOE-0004Ia-0J;
	Fri, 01 Aug 2025 02:20:58 +0000
Date: Fri, 1 Aug 2025 10:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/khugepaged.c:2112: warning:
 Function parameter or member 'cc' not described in 'collapse_file'
Message-ID: <202508011049.Z6gZHXRQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilin,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   3ab761d2a7a1fc006adaf133a8a0d8a14f4c1058
commit: 3ab761d2a7a1fc006adaf133a8a0d8a14f4c1058 [2/2] anolis: mm: honor THP defrag setting for direct file collapse
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250801/202508011049.Z6gZHXRQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011049.Z6gZHXRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011049.Z6gZHXRQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c:164: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'nr_adapt_vma' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'adapt_vmas' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'adaptive_regions' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'work' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'evict_timestamp' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'state' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'recheck_hugetext' not described in 'mm_slot'
   mm/khugepaged.c:164: warning: Function parameter or member 'nr_hugetext' not described in 'mm_slot'
   mm/khugepaged.c:1875: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1875: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:2112: warning: Function parameter or member 'mm' not described in 'collapse_file'
   mm/khugepaged.c:2112: warning: Function parameter or member 'file' not described in 'collapse_file'
   mm/khugepaged.c:2112: warning: Function parameter or member 'start' not described in 'collapse_file'
   mm/khugepaged.c:2112: warning: Function parameter or member 'hpage' not described in 'collapse_file'
   mm/khugepaged.c:2112: warning: Function parameter or member 'node' not described in 'collapse_file'
>> mm/khugepaged.c:2112: warning: Function parameter or member 'cc' not described in 'collapse_file'


vim +2112 mm/khugepaged.c

f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2089  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2090  /**
99cb0dbd47a15d Song Liu                2019-09-23  2091   * collapse_file - collapse filemap/tmpfs/shmem pages into huge one.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2092   *
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2093   * Basic scheme is simple, details are more complex:
87c460a0bded56 Hugh Dickins            2018-11-30  2094   *  - allocate and lock a new huge page;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2095   *  - scan page cache replacing old pages with the new one
99cb0dbd47a15d Song Liu                2019-09-23  2096   *    + swap/gup in pages if necessary;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2097   *    + fill in gaps;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2098   *    + keep old pages around in case rollback is required;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2099   *  - if replacing succeeds:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2100   *    + copy data over;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2101   *    + free old pages;
87c460a0bded56 Hugh Dickins            2018-11-30  2102   *    + unlock huge page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2103   *  - if replacing failed;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2104   *    + put all pages back and unfreeze them;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2105   *    + restore gaps in the page cache;
87c460a0bded56 Hugh Dickins            2018-11-30  2106   *    + unlock and free huge page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2107   */
579c571e2efdb8 Song Liu                2019-09-23  2108  static void collapse_file(struct mm_struct *mm,
579c571e2efdb8 Song Liu                2019-09-23  2109  		struct file *file, pgoff_t start,
3ab761d2a7a1fc Weilin Tong             2025-07-29  2110  		struct page **hpage, int node,
3ab761d2a7a1fc Weilin Tong             2025-07-29  2111  		struct collapse_control *cc)
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26 @2112  {
579c571e2efdb8 Song Liu                2019-09-23  2113  	struct address_space *mapping = file->f_mapping;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2114  	gfp_t gfp;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2115  	struct page *new_page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2116  	pgoff_t index, end = start + HPAGE_PMD_NR;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2117  	LIST_HEAD(pagelist);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2118  	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2119  	int nr_none = 0, result = SCAN_SUCCEED;
99cb0dbd47a15d Song Liu                2019-09-23  2120  	bool is_shmem = shmem_file(file);
01406028a5a96b Muchun Song             2021-02-24  2121  	int nr;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2122  
99cb0dbd47a15d Song Liu                2019-09-23  2123  	VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2124  	VM_BUG_ON(start & (HPAGE_PMD_NR - 1));
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2125  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2126  	/* Only allocate from the target node */
3ab761d2a7a1fc Weilin Tong             2025-07-29  2127  	if (cc->hugetext_direct_vma)
3ab761d2a7a1fc Weilin Tong             2025-07-29  2128  		gfp = vma_thp_gfp_mask(cc->hugetext_direct_vma) | __GFP_THISNODE;
3ab761d2a7a1fc Weilin Tong             2025-07-29  2129  	else
41b6167e8f746b Michal Hocko            2017-01-10  2130  		gfp = alloc_hugepage_khugepaged_gfpmask() | __GFP_THISNODE;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2131  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2132  	new_page = khugepaged_alloc_page(hpage, gfp, node);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2133  	if (!new_page) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2134  		result = SCAN_ALLOC_HUGE_PAGE_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2135  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2136  	}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2137  
d9eb1ea2bf8734 Johannes Weiner         2020-06-03  2138  	if (unlikely(mem_cgroup_charge(new_page, mm, gfp))) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2139  		result = SCAN_CGROUP_CHARGE_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2140  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2141  	}
9d82c69438d0df Johannes Weiner         2020-06-03  2142  	count_memcg_page_event(new_page, THP_COLLAPSE_ALLOC);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2143  
95feeabb77149f Hugh Dickins            2018-11-30  2144  	/* This will be less messy when we use multi-index entries */
95feeabb77149f Hugh Dickins            2018-11-30  2145  	do {
95feeabb77149f Hugh Dickins            2018-11-30  2146  		xas_lock_irq(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  2147  		xas_create_range(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  2148  		if (!xas_error(&xas))
95feeabb77149f Hugh Dickins            2018-11-30  2149  			break;
95feeabb77149f Hugh Dickins            2018-11-30  2150  		xas_unlock_irq(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  2151  		if (!xas_nomem(&xas, GFP_KERNEL)) {
95feeabb77149f Hugh Dickins            2018-11-30  2152  			result = SCAN_FAIL;
95feeabb77149f Hugh Dickins            2018-11-30  2153  			goto out;
95feeabb77149f Hugh Dickins            2018-11-30  2154  		}
95feeabb77149f Hugh Dickins            2018-11-30  2155  	} while (1);
95feeabb77149f Hugh Dickins            2018-11-30  2156  
042a30824871fa Hugh Dickins            2018-11-30  2157  	__SetPageLocked(new_page);
99cb0dbd47a15d Song Liu                2019-09-23  2158  	if (is_shmem)
042a30824871fa Hugh Dickins            2018-11-30  2159  		__SetPageSwapBacked(new_page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2160  	new_page->index = start;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2161  	new_page->mapping = mapping;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2162  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2163  	/*
87c460a0bded56 Hugh Dickins            2018-11-30  2164  	 * At this point the new_page is locked and not up-to-date.
87c460a0bded56 Hugh Dickins            2018-11-30  2165  	 * It's safe to insert it into the page cache, because nobody would
87c460a0bded56 Hugh Dickins            2018-11-30  2166  	 * be able to map it or use it in another way until we unlock it.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2167  	 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2168  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2169  	xas_set(&xas, start);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2170  	for (index = start; index < end; index++) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2171  		struct page *page = xas_next(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2172  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2173  		VM_BUG_ON(index != xas.xa_index);
99cb0dbd47a15d Song Liu                2019-09-23  2174  		if (is_shmem) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2175  			if (!page) {
701270fa193aad Hugh Dickins            2018-11-30  2176  				/*
99cb0dbd47a15d Song Liu                2019-09-23  2177  				 * Stop if extent has been truncated or
99cb0dbd47a15d Song Liu                2019-09-23  2178  				 * hole-punched, and is now completely
99cb0dbd47a15d Song Liu                2019-09-23  2179  				 * empty.
701270fa193aad Hugh Dickins            2018-11-30  2180  				 */
701270fa193aad Hugh Dickins            2018-11-30  2181  				if (index == start) {
701270fa193aad Hugh Dickins            2018-11-30  2182  					if (!xas_next_entry(&xas, end - 1)) {
701270fa193aad Hugh Dickins            2018-11-30  2183  						result = SCAN_TRUNCATED;
042a30824871fa Hugh Dickins            2018-11-30  2184  						goto xa_locked;
701270fa193aad Hugh Dickins            2018-11-30  2185  					}
701270fa193aad Hugh Dickins            2018-11-30  2186  					xas_set(&xas, index);
701270fa193aad Hugh Dickins            2018-11-30  2187  				}
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2188  				if (!shmem_charge(mapping->host, 1)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2189  					result = SCAN_FAIL;
042a30824871fa Hugh Dickins            2018-11-30  2190  					goto xa_locked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2191  				}
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2192) 				xas_store(&xas, new_page);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2193  				nr_none++;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2194  				continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2195  			}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2196  
3159f943aafdba Matthew Wilcox          2017-11-03  2197  			if (xa_is_value(page) || !PageUptodate(page)) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2198  				xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2199  				/* swap in or instantiate fallocated page */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2200  				if (shmem_getpage(mapping->host, index, &page,
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2201  						  SGP_NOHUGE)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2202  					result = SCAN_FAIL;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2203  					goto xa_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2204  				}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2205  			} else if (trylock_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2206  				get_page(page);
042a30824871fa Hugh Dickins            2018-11-30  2207  				xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2208  			} else {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2209  				result = SCAN_PAGE_LOCK;
042a30824871fa Hugh Dickins            2018-11-30  2210  				goto xa_locked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2211  			}
99cb0dbd47a15d Song Liu                2019-09-23  2212  		} else {	/* !is_shmem */
99cb0dbd47a15d Song Liu                2019-09-23  2213  			if (!page || xa_is_value(page)) {
99cb0dbd47a15d Song Liu                2019-09-23  2214  				xas_unlock_irq(&xas);
99cb0dbd47a15d Song Liu                2019-09-23  2215  				page_cache_sync_readahead(mapping, &file->f_ra,
99cb0dbd47a15d Song Liu                2019-09-23  2216  							  file, index,
e5a59d308f52bb David Howells           2020-09-04  2217  							  end - index);
99cb0dbd47a15d Song Liu                2019-09-23  2218  				/* drain pagevecs to help isolate_lru_page() */
99cb0dbd47a15d Song Liu                2019-09-23  2219  				lru_add_drain();
99cb0dbd47a15d Song Liu                2019-09-23  2220  				page = find_lock_page(mapping, index);
99cb0dbd47a15d Song Liu                2019-09-23  2221  				if (unlikely(page == NULL)) {
99cb0dbd47a15d Song Liu                2019-09-23  2222  					result = SCAN_FAIL;
99cb0dbd47a15d Song Liu                2019-09-23  2223  					goto xa_unlocked;
99cb0dbd47a15d Song Liu                2019-09-23  2224  				}
75f360696ce9d8 Song Liu                2019-11-30  2225  			} else if (PageDirty(page)) {
75f360696ce9d8 Song Liu                2019-11-30  2226  				/*
75f360696ce9d8 Song Liu                2019-11-30  2227  				 * khugepaged only works on read-only fd,
75f360696ce9d8 Song Liu                2019-11-30  2228  				 * so this page is dirty because it hasn't
75f360696ce9d8 Song Liu                2019-11-30  2229  				 * been flushed since first write. There
75f360696ce9d8 Song Liu                2019-11-30  2230  				 * won't be new dirty pages.
75f360696ce9d8 Song Liu                2019-11-30  2231  				 *
75f360696ce9d8 Song Liu                2019-11-30  2232  				 * Trigger async flush here and hope the
75f360696ce9d8 Song Liu                2019-11-30  2233  				 * writeback is done when khugepaged
75f360696ce9d8 Song Liu                2019-11-30  2234  				 * revisits this page.
75f360696ce9d8 Song Liu                2019-11-30  2235  				 *
75f360696ce9d8 Song Liu                2019-11-30  2236  				 * This is a one-off situation. We are not
75f360696ce9d8 Song Liu                2019-11-30  2237  				 * forcing writeback in loop.
75f360696ce9d8 Song Liu                2019-11-30  2238  				 */
75f360696ce9d8 Song Liu                2019-11-30  2239  				xas_unlock_irq(&xas);
75f360696ce9d8 Song Liu                2019-11-30  2240  				filemap_flush(mapping);
75f360696ce9d8 Song Liu                2019-11-30  2241  				result = SCAN_FAIL;
75f360696ce9d8 Song Liu                2019-11-30  2242  				goto xa_unlocked;
69a7fa5cb0de06 Rongwei Wang            2021-10-28  2243  			} else if (PageWriteback(page)) {
69a7fa5cb0de06 Rongwei Wang            2021-10-28  2244  				xas_unlock_irq(&xas);
69a7fa5cb0de06 Rongwei Wang            2021-10-28  2245  				result = SCAN_FAIL;
69a7fa5cb0de06 Rongwei Wang            2021-10-28  2246  				goto xa_unlocked;
99cb0dbd47a15d Song Liu                2019-09-23  2247  			} else if (trylock_page(page)) {
99cb0dbd47a15d Song Liu                2019-09-23  2248  				get_page(page);
99cb0dbd47a15d Song Liu                2019-09-23  2249  				xas_unlock_irq(&xas);
99cb0dbd47a15d Song Liu                2019-09-23  2250  			} else {
99cb0dbd47a15d Song Liu                2019-09-23  2251  				result = SCAN_PAGE_LOCK;
99cb0dbd47a15d Song Liu                2019-09-23  2252  				goto xa_locked;
99cb0dbd47a15d Song Liu                2019-09-23  2253  			}
99cb0dbd47a15d Song Liu                2019-09-23  2254  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2255  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2256  		/*
b93b016313b3ba Matthew Wilcox          2018-04-10  2257  		 * The page must be locked, so we can drop the i_pages lock
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2258  		 * without racing with truncate.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2259  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2260  		VM_BUG_ON_PAGE(!PageLocked(page), page);
4655e5e5f38726 Song Liu                2019-11-15  2261  
4655e5e5f38726 Song Liu                2019-11-15  2262  		/* make sure the page is up to date */
4655e5e5f38726 Song Liu                2019-11-15  2263  		if (unlikely(!PageUptodate(page))) {
4655e5e5f38726 Song Liu                2019-11-15  2264  			result = SCAN_FAIL;
4655e5e5f38726 Song Liu                2019-11-15  2265  			goto out_unlock;
4655e5e5f38726 Song Liu                2019-11-15  2266  		}
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2267  
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2268  		/*
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2269  		 * If file was truncated then extended, or hole-punched, before
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2270  		 * we locked the first page, then a THP might be there already.
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2271  		 */
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2272  		if (PageTransCompound(page)) {
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2273  			result = SCAN_PAGE_COMPOUND;
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2274  			goto out_unlock;
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2275  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2276  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2277  		if (page_mapping(page) != mapping) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2278  			result = SCAN_TRUNCATED;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2279  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2280  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2281  
69a7fa5cb0de06 Rongwei Wang            2021-10-28  2282  		if (!is_shmem && (PageDirty(page) ||
69a7fa5cb0de06 Rongwei Wang            2021-10-28  2283  				  PageWriteback(page))) {
4655e5e5f38726 Song Liu                2019-11-15  2284  			/*
4655e5e5f38726 Song Liu                2019-11-15  2285  			 * khugepaged only works on read-only fd, so this
4655e5e5f38726 Song Liu                2019-11-15  2286  			 * page is dirty because it hasn't been flushed
4655e5e5f38726 Song Liu                2019-11-15  2287  			 * since first write.
4655e5e5f38726 Song Liu                2019-11-15  2288  			 */
4655e5e5f38726 Song Liu                2019-11-15  2289  			result = SCAN_FAIL;
4655e5e5f38726 Song Liu                2019-11-15  2290  			goto out_unlock;
4655e5e5f38726 Song Liu                2019-11-15  2291  		}
4655e5e5f38726 Song Liu                2019-11-15  2292  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2293  		if (isolate_lru_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2294  			result = SCAN_DEL_PAGE_LRU;
042a30824871fa Hugh Dickins            2018-11-30  2295  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2296  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2297  
99cb0dbd47a15d Song Liu                2019-09-23  2298  		if (page_has_private(page) &&
99cb0dbd47a15d Song Liu                2019-09-23  2299  		    !try_to_release_page(page, GFP_KERNEL)) {
99cb0dbd47a15d Song Liu                2019-09-23  2300  			result = SCAN_PAGE_HAS_PRIVATE;
2f33a706027c94 Hugh Dickins            2020-05-27  2301  			putback_lru_page(page);
99cb0dbd47a15d Song Liu                2019-09-23  2302  			goto out_unlock;
99cb0dbd47a15d Song Liu                2019-09-23  2303  		}
99cb0dbd47a15d Song Liu                2019-09-23  2304  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2305  		if (page_mapped(page))
977fbdcd5986c9 Matthew Wilcox          2018-01-31  2306  			unmap_mapping_pages(mapping, index, 1, false);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2307  
b15cd4ad8aad69 Xu Yu                   2021-11-02  2308  		dedup_page(page, false);
b15cd4ad8aad69 Xu Yu                   2021-11-02  2309  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2310  		xas_lock_irq(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2311  		xas_set(&xas, index);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2312  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2313  		VM_BUG_ON_PAGE(page != xas_load(&xas), page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2314  		VM_BUG_ON_PAGE(page_mapped(page), page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2315  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2316  		/*
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2317  		 * The page is expected to have page_count() == 3:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2318  		 *  - we hold a pin on it;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2319  		 *  - one reference from page cache;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2320  		 *  - one from isolate_lru_page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2321  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2322  		if (!page_ref_freeze(page, 3)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2323  			result = SCAN_PAGE_COUNT;
042a30824871fa Hugh Dickins            2018-11-30  2324  			xas_unlock_irq(&xas);
042a30824871fa Hugh Dickins            2018-11-30  2325  			putback_lru_page(page);
042a30824871fa Hugh Dickins            2018-11-30  2326  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2327  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2328  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2329  		/*
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2330  		 * Add the page to the list to be able to undo the collapse if
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2331  		 * something go wrong.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2332  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2333  		list_add_tail(&page->lru, &pagelist);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2334  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2335  		/* Finally, replace with the new page. */
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2336) 		xas_store(&xas, new_page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2337  		continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2338  out_unlock:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2339  		unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2340  		put_page(page);
042a30824871fa Hugh Dickins            2018-11-30  2341  		goto xa_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2342  	}
01406028a5a96b Muchun Song             2021-02-24  2343  	nr = thp_nr_pages(new_page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2344  
99cb0dbd47a15d Song Liu                2019-09-23  2345  	if (is_shmem)
2dc7dbc6022b72 Muchun Song             2021-02-24  2346  		__mod_lruvec_page_state(new_page, NR_SHMEM_THPS, nr);
09d91cda0e8207 Song Liu                2019-09-23  2347  	else {
01406028a5a96b Muchun Song             2021-02-24  2348  		__mod_lruvec_page_state(new_page, NR_FILE_THPS, nr);
09d91cda0e8207 Song Liu                2019-09-23  2349  		filemap_nr_thps_inc(mapping);
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2350  		/*
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2351  		 * Paired with smp_mb() in do_dentry_open() to ensure
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2352  		 * i_writecount is up to date and the update to nr_thps is
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2353  		 * visible. Ensures the page cache will be truncated if the
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2354  		 * file is opened writable.
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2355  		 */
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2356  		smp_mb();
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2357  		if (inode_is_open_for_write(mapping->host)) {
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2358  			result = SCAN_FAIL;
01406028a5a96b Muchun Song             2021-02-24  2359  			__mod_lruvec_page_state(new_page, NR_FILE_THPS, -nr);
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2360  			filemap_nr_thps_dec(mapping);
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2361  			goto xa_locked;
118d14d3e6ee95 Collin Fijalkovich      2021-08-03  2362  		}
09d91cda0e8207 Song Liu                2019-09-23  2363  	}
99cb0dbd47a15d Song Liu                2019-09-23  2364  
042a30824871fa Hugh Dickins            2018-11-30  2365  	if (nr_none) {
9d82c69438d0df Johannes Weiner         2020-06-03  2366  		__mod_lruvec_page_state(new_page, NR_FILE_PAGES, nr_none);
99cb0dbd47a15d Song Liu                2019-09-23  2367  		if (is_shmem)
9d82c69438d0df Johannes Weiner         2020-06-03  2368  			__mod_lruvec_page_state(new_page, NR_SHMEM, nr_none);
042a30824871fa Hugh Dickins            2018-11-30  2369  	}
042a30824871fa Hugh Dickins            2018-11-30  2370  
042a30824871fa Hugh Dickins            2018-11-30  2371  xa_locked:
042a30824871fa Hugh Dickins            2018-11-30  2372  	xas_unlock_irq(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2373  xa_unlocked:
042a30824871fa Hugh Dickins            2018-11-30  2374  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2375  	if (result == SCAN_SUCCEED) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2376  		struct page *page, *tmp;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2377  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2378  		/*
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2379  		 * Replacing old pages with new one has succeeded, now we
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2380  		 * need to copy the content and free the old pages.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2381  		 */
2af8ff291848cc Hugh Dickins            2018-11-30  2382  		index = start;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2383  		list_for_each_entry_safe(page, tmp, &pagelist, lru) {
2af8ff291848cc Hugh Dickins            2018-11-30  2384  			while (index < page->index) {
2af8ff291848cc Hugh Dickins            2018-11-30  2385  				clear_highpage(new_page + (index % HPAGE_PMD_NR));
2af8ff291848cc Hugh Dickins            2018-11-30  2386  				index++;
2af8ff291848cc Hugh Dickins            2018-11-30  2387  			}
390a2159a49817 Kaihao Bai              2024-12-02  2388  			mod_lruvec_page_state(page, NR_FILE_PAGES, -1);
390a2159a49817 Kaihao Bai              2024-12-02  2389  			if (is_shmem)
390a2159a49817 Kaihao Bai              2024-12-02  2390  				mod_lruvec_page_state(page, NR_SHMEM, -1);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2391  			copy_highpage(new_page + (page->index % HPAGE_PMD_NR),
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2392  					page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2393  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2394  			page->mapping = NULL;
042a30824871fa Hugh Dickins            2018-11-30  2395  			page_ref_unfreeze(page, 1);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2396  			ClearPageActive(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2397  			ClearPageUnevictable(page);
042a30824871fa Hugh Dickins            2018-11-30  2398  			unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2399  			put_page(page);
2af8ff291848cc Hugh Dickins            2018-11-30  2400  			index++;
2af8ff291848cc Hugh Dickins            2018-11-30  2401  		}
2af8ff291848cc Hugh Dickins            2018-11-30  2402  		while (index < end) {
2af8ff291848cc Hugh Dickins            2018-11-30  2403  			clear_highpage(new_page + (index % HPAGE_PMD_NR));
2af8ff291848cc Hugh Dickins            2018-11-30  2404  			index++;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2405  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2406  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2407  		SetPageUptodate(new_page);
87c460a0bded56 Hugh Dickins            2018-11-30  2408  		page_ref_add(new_page, HPAGE_PMD_NR - 1);
6058eaec816f29 Johannes Weiner         2020-06-03  2409  		if (is_shmem)
99cb0dbd47a15d Song Liu                2019-09-23  2410  			set_page_dirty(new_page);
6058eaec816f29 Johannes Weiner         2020-06-03  2411  		lru_cache_add(new_page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2412  
042a30824871fa Hugh Dickins            2018-11-30  2413  		/*
042a30824871fa Hugh Dickins            2018-11-30  2414  		 * Remove pte page tables, so we can re-fault the page as huge.
042a30824871fa Hugh Dickins            2018-11-30  2415  		 */
042a30824871fa Hugh Dickins            2018-11-30  2416  		retract_page_tables(mapping, start);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2417  		*hpage = NULL;
87aa752906ecf6 Yang Shi                2018-08-17  2418  
390a2159a49817 Kaihao Bai              2024-12-02  2419  		mod_lruvec_page_state(new_page, NR_FILE_PAGES, nr - nr_none);
390a2159a49817 Kaihao Bai              2024-12-02  2420  		if (is_shmem)
390a2159a49817 Kaihao Bai              2024-12-02  2421  			mod_lruvec_page_state(new_page, NR_SHMEM, nr - nr_none);
390a2159a49817 Kaihao Bai              2024-12-02  2422  
87aa752906ecf6 Yang Shi                2018-08-17  2423  		khugepaged_pages_collapsed++;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2424  	} else {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2425  		struct page *page;
aaa52e340073b7 Hugh Dickins            2018-11-30  2426  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2427  		/* Something went wrong: roll back page cache changes */
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2428  		xas_lock_irq(&xas);
aaa52e340073b7 Hugh Dickins            2018-11-30  2429  		mapping->nrpages -= nr_none;
99cb0dbd47a15d Song Liu                2019-09-23  2430  
99cb0dbd47a15d Song Liu                2019-09-23  2431  		if (is_shmem)
aaa52e340073b7 Hugh Dickins            2018-11-30  2432  			shmem_uncharge(mapping->host, nr_none);
aaa52e340073b7 Hugh Dickins            2018-11-30  2433  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2434  		xas_set(&xas, start);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2435  		xas_for_each(&xas, page, end - 1) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2436  			page = list_first_entry_or_null(&pagelist,
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2437  					struct page, lru);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2438  			if (!page || xas.xa_index < page->index) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2439  				if (!nr_none)
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2440  					break;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2441  				nr_none--;
59749e6ce53735 Johannes Weiner         2016-12-12  2442  				/* Put holes back where they were */
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2443  				xas_store(&xas, NULL);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2444  				continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2445  			}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2446  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2447  			VM_BUG_ON_PAGE(page->index != xas.xa_index, page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2448  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2449  			/* Unfreeze the page. */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2450  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2451  			page_ref_unfreeze(page, 2);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2452  			xas_store(&xas, page);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2453  			xas_pause(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2454  			xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2455  			unlock_page(page);
042a30824871fa Hugh Dickins            2018-11-30  2456  			putback_lru_page(page);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2457  			xas_lock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2458  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2459  		VM_BUG_ON(nr_none);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2460  		xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2461  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2462  		new_page->mapping = NULL;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2463  	}
042a30824871fa Hugh Dickins            2018-11-30  2464  
042a30824871fa Hugh Dickins            2018-11-30  2465  	unlock_page(new_page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2466  out:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2467  	VM_BUG_ON(!list_empty(&pagelist));
9d82c69438d0df Johannes Weiner         2020-06-03  2468  	if (!IS_ERR_OR_NULL(*hpage))
9d82c69438d0df Johannes Weiner         2020-06-03  2469  		mem_cgroup_uncharge(*hpage);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2470  	/* TODO: tracepoints */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2471  }
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2472  

:::::: The code at line 2112 was first introduced by commit
:::::: f3f0e1d2150b2b99da2cbdfaad000089efe9bf30 khugepaged: add support of collapse for tmpfs/shmem pages

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
