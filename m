Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47A1859
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725153450; cv=none; b=MabFTfjNUfENsqKObrDuGpbQ0wPoRYJN8I9vArL6Z0bOcN41qa2iumgu+ScSBi1tIYJ9xmDt6mX9wmSIhJAewxGc+zBNXyYXiz90lpcmJGijj0dcp8oUoSCRm6CkXJ4Me5cxWdujgcPcxdLBvNqpj6aAbMcW6ONew+2W7mj7zdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725153450; c=relaxed/simple;
	bh=aJaWmAcMYKuO+lMp8nHWCKnyksvaP51Rf1wjZmSysjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3WMriPlc1k+jIE63CBvGwoGihtrhCqnCHCM8Z+ZQHgJOvcH57fceqgyVyu8d3Nu++fnKG8oLsambClsgb2JDX6zyT//EY6AuBiiTh4TuXd5hos6+r3XXpfj/k3w8OEpPxC7ykhaMCwfgxshCCSoA8xikojvkQGzGKmFRl1LCsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdHmu1xP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdHmu1xP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725153447; x=1756689447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aJaWmAcMYKuO+lMp8nHWCKnyksvaP51Rf1wjZmSysjg=;
  b=OdHmu1xPmMdvOZ61I0Nb9xgqjutcnyGM0t85MwuNv17doO1Orj5q6epj
   ftrBtF2OW1EeFmO3tsHP89L1ma3geY3FE489ccWP1YimI399ZVFUw7kfS
   veM/7bScd9EjiBZTKy97lsuTp+viTFE2sBWmzflVL7eQF7p7ObgL5H2v8
   Nlpl8nnu9Cm9ruAWyWF9V15ZbCb1XXjuv8MSVXLAsPw3ibeRa+CViFTsS
   5oAOMU26h0nY8Q04g3IbnDNceZGq2X7bx7xmGxrUKRLZ39v2UMxY7QmpT
   tBq6gXxCbKXAaI2TlPwlJMo9rQgY/1hzU7UgjetiTdZ32g0qRbmxuTDnf
   Q==;
X-CSE-ConnectionGUID: bXHa74WLSaWTqN20xeKbCg==
X-CSE-MsgGUID: f4Dms7IEQw6xhrVRzvPk0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23643950"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23643950"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 18:17:26 -0700
X-CSE-ConnectionGUID: 3XCCxiKqQzyAx9aelDmwJw==
X-CSE-MsgGUID: a/gCE+N6T56UGzcn2QWIqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="64203019"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Aug 2024 18:17:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skZDX-0003GC-0n;
	Sun, 01 Sep 2024 01:17:23 +0000
Date: Sun, 1 Sep 2024 09:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Message-ID: <202409010932.1Rz6Qe3X-lkp@intel.com>
References: <20240828202240.2809740-3-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828202240.2809740-3-ziy@nvidia.com>

Hi Zi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20240830]
[cannot apply to linus/master v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-page_isolation-make-page-isolation-a-standalone-bit/20240829-042547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240828202240.2809740-3-ziy%40nvidia.com
patch subject: [RFC PATCH 2/4] mm/page_isolation: remove migratetype from move_freepages_block_isolate()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240901/202409010932.1Rz6Qe3X-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010932.1Rz6Qe3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010932.1Rz6Qe3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:1768: warning: Excess function parameter 'migratetype' description in 'move_freepages_block_isolate'


vim +1768 mm/page_alloc.c

fd919a85cd55be5 Johannes Weiner 2024-03-20  1747  
fd919a85cd55be5 Johannes Weiner 2024-03-20  1748  /**
fd919a85cd55be5 Johannes Weiner 2024-03-20  1749   * move_freepages_block_isolate - move free pages in block for page isolation
fd919a85cd55be5 Johannes Weiner 2024-03-20  1750   * @zone: the zone
fd919a85cd55be5 Johannes Weiner 2024-03-20  1751   * @page: the pageblock page
fd919a85cd55be5 Johannes Weiner 2024-03-20  1752   * @migratetype: migratetype to set on the pageblock
fd919a85cd55be5 Johannes Weiner 2024-03-20  1753   *
fd919a85cd55be5 Johannes Weiner 2024-03-20  1754   * This is similar to move_freepages_block(), but handles the special
fd919a85cd55be5 Johannes Weiner 2024-03-20  1755   * case encountered in page isolation, where the block of interest
fd919a85cd55be5 Johannes Weiner 2024-03-20  1756   * might be part of a larger buddy spanning multiple pageblocks.
fd919a85cd55be5 Johannes Weiner 2024-03-20  1757   *
fd919a85cd55be5 Johannes Weiner 2024-03-20  1758   * Unlike the regular page allocator path, which moves pages while
fd919a85cd55be5 Johannes Weiner 2024-03-20  1759   * stealing buddies off the freelist, page isolation is interested in
fd919a85cd55be5 Johannes Weiner 2024-03-20  1760   * arbitrary pfn ranges that may have overlapping buddies on both ends.
fd919a85cd55be5 Johannes Weiner 2024-03-20  1761   *
fd919a85cd55be5 Johannes Weiner 2024-03-20  1762   * This function handles that. Straddling buddies are split into
fd919a85cd55be5 Johannes Weiner 2024-03-20  1763   * individual pageblocks. Only the block of interest is moved.
fd919a85cd55be5 Johannes Weiner 2024-03-20  1764   *
fd919a85cd55be5 Johannes Weiner 2024-03-20  1765   * Returns %true if pages could be moved, %false otherwise.
fd919a85cd55be5 Johannes Weiner 2024-03-20  1766   */
a3bab1588c46605 Zi Yan          2024-08-28  1767  bool move_freepages_block_isolate(struct zone *zone, struct page *page)
fd919a85cd55be5 Johannes Weiner 2024-03-20 @1768  {
e1f42a577f63647 Vlastimil Babka 2024-04-25  1769  	unsigned long start_pfn, pfn;
a3bab1588c46605 Zi Yan          2024-08-28  1770  	bool is_block_isolated = get_pageblock_isolate(page);
a3bab1588c46605 Zi Yan          2024-08-28  1771  	int from_mt;
a3bab1588c46605 Zi Yan          2024-08-28  1772  	int to_mt;
fd919a85cd55be5 Johannes Weiner 2024-03-20  1773  
e1f42a577f63647 Vlastimil Babka 2024-04-25  1774  	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
fd919a85cd55be5 Johannes Weiner 2024-03-20  1775  		return false;
fd919a85cd55be5 Johannes Weiner 2024-03-20  1776  
fd919a85cd55be5 Johannes Weiner 2024-03-20  1777  	/* No splits needed if buddies can't span multiple blocks */
fd919a85cd55be5 Johannes Weiner 2024-03-20  1778  	if (pageblock_order == MAX_PAGE_ORDER)
fd919a85cd55be5 Johannes Weiner 2024-03-20  1779  		goto move;
fd919a85cd55be5 Johannes Weiner 2024-03-20  1780  
fd919a85cd55be5 Johannes Weiner 2024-03-20  1781  	/* We're a tail block in a larger buddy */
fd919a85cd55be5 Johannes Weiner 2024-03-20  1782  	pfn = find_large_buddy(start_pfn);
fd919a85cd55be5 Johannes Weiner 2024-03-20  1783  	if (pfn != start_pfn) {
fd919a85cd55be5 Johannes Weiner 2024-03-20  1784  		struct page *buddy = pfn_to_page(pfn);
fd919a85cd55be5 Johannes Weiner 2024-03-20  1785  		int order = buddy_order(buddy);
fd919a85cd55be5 Johannes Weiner 2024-03-20  1786  
e0932b6c1f942fa Johannes Weiner 2024-03-20  1787  		del_page_from_free_list(buddy, zone, order,
e0932b6c1f942fa Johannes Weiner 2024-03-20  1788  					get_pfnblock_migratetype(buddy, pfn));
a3bab1588c46605 Zi Yan          2024-08-28  1789  		if (is_block_isolated)
a3bab1588c46605 Zi Yan          2024-08-28  1790  			clear_pageblock_isolate(page);
a3bab1588c46605 Zi Yan          2024-08-28  1791  		else
a3bab1588c46605 Zi Yan          2024-08-28  1792  			set_pageblock_isolate(page);
e076aa8880a982e Yu Zhao         2024-08-13  1793  		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
fd919a85cd55be5 Johannes Weiner 2024-03-20  1794  		return true;
fd919a85cd55be5 Johannes Weiner 2024-03-20  1795  	}
fd919a85cd55be5 Johannes Weiner 2024-03-20  1796  
fd919a85cd55be5 Johannes Weiner 2024-03-20  1797  	/* We're the starting block of a larger buddy */
fd919a85cd55be5 Johannes Weiner 2024-03-20  1798  	if (PageBuddy(page) && buddy_order(page) > pageblock_order) {
fd919a85cd55be5 Johannes Weiner 2024-03-20  1799  		int order = buddy_order(page);
fd919a85cd55be5 Johannes Weiner 2024-03-20  1800  
e0932b6c1f942fa Johannes Weiner 2024-03-20  1801  		del_page_from_free_list(page, zone, order,
e0932b6c1f942fa Johannes Weiner 2024-03-20  1802  					get_pfnblock_migratetype(page, pfn));
a3bab1588c46605 Zi Yan          2024-08-28  1803  		if (is_block_isolated)
a3bab1588c46605 Zi Yan          2024-08-28  1804  			clear_pageblock_isolate(page);
a3bab1588c46605 Zi Yan          2024-08-28  1805  		else
a3bab1588c46605 Zi Yan          2024-08-28  1806  			set_pageblock_isolate(page);
e076aa8880a982e Yu Zhao         2024-08-13  1807  		split_large_buddy(zone, page, pfn, order, FPI_NONE);
fd919a85cd55be5 Johannes Weiner 2024-03-20  1808  		return true;
fd919a85cd55be5 Johannes Weiner 2024-03-20  1809  	}
fd919a85cd55be5 Johannes Weiner 2024-03-20  1810  move:
a3bab1588c46605 Zi Yan          2024-08-28  1811  	if (is_block_isolated)
a3bab1588c46605 Zi Yan          2024-08-28  1812  		clear_pageblock_isolate(page);
a3bab1588c46605 Zi Yan          2024-08-28  1813  
a3bab1588c46605 Zi Yan          2024-08-28  1814  	from_mt = is_block_isolated ? MIGRATE_ISOLATE : get_pageblock_migratetype(page);
a3bab1588c46605 Zi Yan          2024-08-28  1815  	to_mt = is_block_isolated ? get_pageblock_migratetype(page) : MIGRATE_ISOLATE;
a3bab1588c46605 Zi Yan          2024-08-28  1816  
a3bab1588c46605 Zi Yan          2024-08-28  1817  	if (!is_block_isolated)
a3bab1588c46605 Zi Yan          2024-08-28  1818  		set_pageblock_isolate(page);
e1f42a577f63647 Vlastimil Babka 2024-04-25  1819  	__move_freepages_block(zone, start_pfn,
a3bab1588c46605 Zi Yan          2024-08-28  1820  			       from_mt, to_mt);
fd919a85cd55be5 Johannes Weiner 2024-03-20  1821  	return true;
fd919a85cd55be5 Johannes Weiner 2024-03-20  1822  }
fd919a85cd55be5 Johannes Weiner 2024-03-20  1823  #endif /* CONFIG_MEMORY_ISOLATION */
fd919a85cd55be5 Johannes Weiner 2024-03-20  1824  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
