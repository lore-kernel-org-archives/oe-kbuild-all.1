Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84D12E1DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711567664; cv=none; b=otx4CyLuxV6pNwfUo2mi+VKp9jG581NDQun2c+5JdKuTGfi6YBR9A8+3FtuiyeBzezW7QimvtCJD0UrqqhJR+1q/ZcM+78SL0pqr04HDER0cftK8/vGL6V4OsH4CEuH8LEXiRXf73zyFxwWJdhmS2zdw2voUpBccNdvmi/ALU/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711567664; c=relaxed/simple;
	bh=ob2n85ZjVWqNgYq2n/XsjQz32KuqZGIlEt8uQgwxmKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HknnDE6eSZQkURDY9MN/JZyEhOJgkQBYpfTqFzg0hEPNJ+FGROwWWcVebIoVizQRoNIttJpHvUB3TVdOFJtcqfcFwEIk+vC+VlSwToDXMG63CCU4jnQzDwIEbNkS1CtDpyiJiMRbdUorxGfN1E/FjYGTHR2jpoOQVd9dUCKp2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9WuEoQh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9WuEoQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711567662; x=1743103662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ob2n85ZjVWqNgYq2n/XsjQz32KuqZGIlEt8uQgwxmKI=;
  b=l9WuEoQhq53/OkZ4kgiMj7RnD+8+bmuwKx9cpXA41UcA64LLQq2bzROY
   /qAlAUDnLMiKjqYyIKL+Qx7J2r1+86QAJoPl3K0mO6z6JIO6qAAu5T8iL
   j93XMy3IYzT1Gcsf/UhC0kU5SLG519hBgopIXWEJzCQj/n1a8+NG3QR11
   0C0pjJaYB9zzkzt03CVFSSZW38Z26bcwp3rK3HxDvD3B4vHg3K3UZnybc
   rIGmQs8IPo7dPt/GWH98PuuObTOsqnFgDPZ+2XqBvlt31jJth3zCiwYqZ
   Dzy2vEgNIqaDqEHQ+qBwYN7BS7a55z+rRrrmXhhedtEddKoWtzhYkgFx4
   Q==;
X-CSE-ConnectionGUID: mLHUUSB+QiyZ1o88awS8JQ==
X-CSE-MsgGUID: DNaLYcF2Tr2hB+KXxR+ztA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7297034"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="7297034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 12:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17021896"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Mar 2024 12:27:39 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpYvw-0001Py-28;
	Wed, 27 Mar 2024 19:27:36 +0000
Date: Thu, 28 Mar 2024 03:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>
Subject: [akpm-mm:mm-unstable 74/199] mm/mempolicy.c:2223: warning: expecting
 prototype for alloc_pages_mpol_noprof(). Prototype was for
 alloc_pages_mpol() instead
Message-ID: <202403280323.SEPBf4pi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   4e567abb6482f6228d23491a25b0d343350e51fe
commit: e1759b2193c7893c152134bfe4dd59cb4765d58c [74/199] mm: enable page allocation tagging
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240328/202403280323.SEPBf4pi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280323.SEPBf4pi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280323.SEPBf4pi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mempolicy.c:2223: warning: expecting prototype for alloc_pages_mpol_noprof(). Prototype was for alloc_pages_mpol() instead
>> mm/mempolicy.c:2298: warning: expecting prototype for vma_alloc_folio_noprof(). Prototype was for vma_alloc_folio() instead
>> mm/mempolicy.c:2326: warning: expecting prototype for alloc_pages_noprof(). Prototype was for alloc_pages() instead


vim +2223 mm/mempolicy.c

4c54d94908e089 Feng Tang               2021-09-02  2210  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2211  /**
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2212   * alloc_pages_mpol_noprof - Allocate pages according to NUMA mempolicy.
eb350739605107 Matthew Wilcox (Oracle  2021-04-29  2213)  * @gfp: GFP flags.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2214   * @order: Order of the page allocation.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2215   * @pol: Pointer to the NUMA mempolicy.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2216   * @ilx: Index for interleave mempolicy (also distinguishes alloc_pages()).
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2217   * @nid: Preferred node (usually numa_node_id() but @mpol may override it).
eb350739605107 Matthew Wilcox (Oracle  2021-04-29  2218)  *
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2219   * Return: The page on success or NULL if allocation fails.
^1da177e4c3f41 Linus Torvalds          2005-04-16  2220   */
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2221  struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2222  		struct mempolicy *pol, pgoff_t ilx, int nid)
^1da177e4c3f41 Linus Torvalds          2005-04-16 @2223  {
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2224  	nodemask_t *nodemask;
adf88aa8ea7ff1 Matthew Wilcox (Oracle  2022-05-12  2225) 	struct page *page;
adf88aa8ea7ff1 Matthew Wilcox (Oracle  2022-05-12  2226) 
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2227  	nodemask = policy_nodemask(gfp, pol, ilx, &nid);
4c54d94908e089 Feng Tang               2021-09-02  2228  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2229  	if (pol->mode == MPOL_PREFERRED_MANY)
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2230  		return alloc_pages_preferred_many(gfp, order, nid, nodemask);
19deb7695e072d David Rientjes          2019-09-04  2231  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2232  	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2233  	    /* filter "hugepage" allocation, unless from alloc_pages() */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2234  	    order == HPAGE_PMD_ORDER && ilx != NO_INTERLEAVE_INDEX) {
19deb7695e072d David Rientjes          2019-09-04  2235  		/*
19deb7695e072d David Rientjes          2019-09-04  2236  		 * For hugepage allocation and non-interleave policy which
19deb7695e072d David Rientjes          2019-09-04  2237  		 * allows the current node (or other explicitly preferred
19deb7695e072d David Rientjes          2019-09-04  2238  		 * node) we only try to allocate from the current/preferred
19deb7695e072d David Rientjes          2019-09-04  2239  		 * node and don't fall back to other nodes, as the cost of
19deb7695e072d David Rientjes          2019-09-04  2240  		 * remote accesses would likely offset THP benefits.
19deb7695e072d David Rientjes          2019-09-04  2241  		 *
b27abaccf8e8b0 Dave Hansen             2021-09-02  2242  		 * If the policy is interleave or does not allow the current
19deb7695e072d David Rientjes          2019-09-04  2243  		 * node in its nodemask, we allocate the standard way.
19deb7695e072d David Rientjes          2019-09-04  2244  		 */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2245  		if (pol->mode != MPOL_INTERLEAVE &&
fa3bea4e1f8202 Gregory Price           2024-02-02  2246  		    pol->mode != MPOL_WEIGHTED_INTERLEAVE &&
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2247  		    (!nodemask || node_isset(nid, *nodemask))) {
cc638f329ef605 Vlastimil Babka         2020-01-13  2248  			/*
cc638f329ef605 Vlastimil Babka         2020-01-13  2249  			 * First, try to allocate THP only on local node, but
cc638f329ef605 Vlastimil Babka         2020-01-13  2250  			 * don't reclaim unnecessarily, just compact.
cc638f329ef605 Vlastimil Babka         2020-01-13  2251  			 */
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2252  			page = __alloc_pages_node_noprof(nid,
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2253  				gfp | __GFP_THISNODE | __GFP_NORETRY, order);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2254  			if (page || !(gfp & __GFP_DIRECT_RECLAIM))
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2255  				return page;
76e654cc91bbe6 David Rientjes          2019-09-04  2256  			/*
76e654cc91bbe6 David Rientjes          2019-09-04  2257  			 * If hugepage allocations are configured to always
76e654cc91bbe6 David Rientjes          2019-09-04  2258  			 * synchronous compact or the vma has been madvised
76e654cc91bbe6 David Rientjes          2019-09-04  2259  			 * to prefer hugepage backing, retry allowing remote
cc638f329ef605 Vlastimil Babka         2020-01-13  2260  			 * memory with both reclaim and compact as well.
76e654cc91bbe6 David Rientjes          2019-09-04  2261  			 */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2262  		}
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2263  	}
76e654cc91bbe6 David Rientjes          2019-09-04  2264  
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2265  	page = __alloc_pages_noprof(gfp, order, nid, nodemask);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2266  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2267  	if (unlikely(pol->mode == MPOL_INTERLEAVE) && page) {
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2268  		/* skip NUMA_INTERLEAVE_HIT update if numa stats is disabled */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2269  		if (static_branch_likely(&vm_numa_stat_key) &&
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2270  		    page_to_nid(page) == nid) {
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2271  			preempt_disable();
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2272  			__count_numa_event(page_zone(page), NUMA_INTERLEAVE_HIT);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2273  			preempt_enable();
19deb7695e072d David Rientjes          2019-09-04  2274  		}
356ff8a9a78fb3 David Rientjes          2018-12-07  2275  	}
356ff8a9a78fb3 David Rientjes          2018-12-07  2276  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2277  	return page;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2278  }
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2279  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2280  /**
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2281   * vma_alloc_folio_noprof - Allocate a folio for a VMA.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2282   * @gfp: GFP flags.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2283   * @order: Order of the folio.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2284   * @vma: Pointer to VMA.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2285   * @addr: Virtual address of the allocation.  Must be inside @vma.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2286   * @hugepage: Unused (was: For hugepages try only preferred node if possible).
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2287   *
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2288   * Allocate a folio for a specific address in @vma, using the appropriate
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2289   * NUMA policy.  The caller must hold the mmap_lock of the mm_struct of the
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2290   * VMA to prevent it from going away.  Should be used for all allocations
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2291   * for folios that will be mapped into user space, excepting hugetlbfs, and
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2292   * excepting where direct use of alloc_pages_mpol() is more appropriate.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2293   *
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2294   * Return: The folio on success or NULL if allocation fails.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2295   */
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2296  struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order, struct vm_area_struct *vma,
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2297  		unsigned long addr, bool hugepage)
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19 @2298  {
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2299  	struct mempolicy *pol;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2300  	pgoff_t ilx;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2301  	struct page *page;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2302  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2303  	pol = get_vma_policy(vma, addr, order, &ilx);
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2304  	page = alloc_pages_mpol_noprof(gfp | __GFP_COMP, order,
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2305  				       pol, ilx, numa_node_id());
d51e9894d27492 Vlastimil Babka         2017-01-24  2306  	mpol_cond_put(pol);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2307  	return page_rmappable_folio(page);
f584b68005ac78 Matthew Wilcox (Oracle  2022-04-04  2308) }
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2309  EXPORT_SYMBOL(vma_alloc_folio_noprof);
f584b68005ac78 Matthew Wilcox (Oracle  2022-04-04  2310) 
^1da177e4c3f41 Linus Torvalds          2005-04-16  2311  /**
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2312   * alloc_pages_noprof - Allocate pages.
6421ec764a62c5 Matthew Wilcox (Oracle  2021-04-29  2313)  * @gfp: GFP flags.
6421ec764a62c5 Matthew Wilcox (Oracle  2021-04-29  2314)  * @order: Power of two of number of pages to allocate.
^1da177e4c3f41 Linus Torvalds          2005-04-16  2315   *
6421ec764a62c5 Matthew Wilcox (Oracle  2021-04-29  2316)  * Allocate 1 << @order contiguous pages.  The physical address of the
6421ec764a62c5 Matthew Wilcox (Oracle  2021-04-29  2317)  * first page is naturally aligned (eg an order-3 allocation will be aligned
6421ec764a62c5 Matthew Wilcox (Oracle  2021-04-29  2318)  * to a multiple of 8 * PAGE_SIZE bytes).  The NUMA policy of the current
6421ec764a62c5 Matthew Wilcox (Oracle  2021-04-29  2319)  * process is honoured when in process context.
^1da177e4c3f41 Linus Torvalds          2005-04-16  2320   *
6421ec764a62c5 Matthew Wilcox (Oracle  2021-04-29  2321)  * Context: Can be called from any context, providing the appropriate GFP
6421ec764a62c5 Matthew Wilcox (Oracle  2021-04-29  2322)  * flags are used.
6421ec764a62c5 Matthew Wilcox (Oracle  2021-04-29  2323)  * Return: The page on success or NULL if allocation fails.
^1da177e4c3f41 Linus Torvalds          2005-04-16  2324   */
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2325  struct page *alloc_pages_noprof(gfp_t gfp, unsigned int order)
^1da177e4c3f41 Linus Torvalds          2005-04-16 @2326  {
8d90274b3b118c Oleg Nesterov           2014-10-09  2327  	struct mempolicy *pol = &default_policy;
52cd3b074050dd Lee Schermerhorn        2008-04-28  2328  
52cd3b074050dd Lee Schermerhorn        2008-04-28  2329  	/*
52cd3b074050dd Lee Schermerhorn        2008-04-28  2330  	 * No reference counting needed for current->mempolicy
52cd3b074050dd Lee Schermerhorn        2008-04-28  2331  	 * nor system default_policy
52cd3b074050dd Lee Schermerhorn        2008-04-28  2332  	 */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2333  	if (!in_interrupt() && !(gfp & __GFP_THISNODE))
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2334  		pol = get_task_policy(current);
cc9a6c8776615f Mel Gorman              2012-03-21  2335  
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2336  	return alloc_pages_mpol_noprof(gfp, order, pol, NO_INTERLEAVE_INDEX,
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2337  				       numa_node_id());
^1da177e4c3f41 Linus Torvalds          2005-04-16  2338  }
e1759b2193c789 Suren Baghdasaryan      2024-03-21  2339  EXPORT_SYMBOL(alloc_pages_noprof);
^1da177e4c3f41 Linus Torvalds          2005-04-16  2340  

:::::: The code at line 2223 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
