Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8B283C8D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434624; cv=none; b=Nm2MaqALlxg2AUbqQlIeWgRpL5oH8cnsjFx5VjUWbOTo1ps0/Tn9gYCLRWnBqA9YqGggqdLghufyWvIbL7TKu9Rbl2e525TGU6F5vpUAiiT9bDqtmsJ7FTQyS1DHwaBZfVIMPyeZvHfvN2N8+3Z4850xuBoRiVkTTozpZx/RA5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434624; c=relaxed/simple;
	bh=5RSniwFxc5rEX5wh9yTOng/Fso+vhz5ATGCfbJ9xPUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z6PlqmR8RM/Fb/w551f6RPjPOg4qjoUXqh1C4KtNGJ9dcMIeAG+dMIQSUN8Hx9K+gGWV/yXJ/YpDI3j0NZwWSNwu9x0JBwFuKYW/cEKrrhaIvVnmuwO63ppIURpeckv13E6Vz0hyUoTRibgZBFNI+cuK9KlJuxnh/bfiM5WCPzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7OAxLvJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7OAxLvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748434623; x=1779970623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5RSniwFxc5rEX5wh9yTOng/Fso+vhz5ATGCfbJ9xPUE=;
  b=I7OAxLvJQvKznGUDdTLgjO8bT273Jx1q6Nh752unB/QCmYaeI/K1ynat
   blKpk3VRUb3q0mJA65CVxNKMgSVHZcnFpUp5tKASEKjhanyuVmacC3OFO
   elNcLldb7r3pSLHAxjUhoqGuKBIzFnzW+aMT71oFNLavo6bHJkdh/6JmW
   gWoscDKRtmKIzuLcKS11ImU27kFPldZs8NMCesuzTnZqxbfALFvdWBnBN
   DAcRi3Yf8fm7IiA+AfHDuyDChvdCacLMw7yhtfTQZEtFEqYsAMoxmWsbx
   aYONj85qIPkUywXIfT15C50zpvpfW/kfpnDQe6VJ4ePeYVM/MlD1K3JNB
   w==;
X-CSE-ConnectionGUID: SjivxErtQb2euIInSexzyw==
X-CSE-MsgGUID: h+ZQ8doWTa6LHcdLzWUxQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50454005"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50454005"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 05:17:02 -0700
X-CSE-ConnectionGUID: NDyuAmc0QUiB/CEw5SyssQ==
X-CSE-MsgGUID: wSYOZCZRSjGoavISuMKehg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143675419"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 May 2025 05:17:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKFiM-000Ve2-1X;
	Wed, 28 May 2025 12:16:58 +0000
Date: Wed, 28 May 2025 20:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [akpm-mm:mm-unstable 36/67] mm/khugepaged.c:2337:7: error: implicit
 declaration of function 'folio_expected_ref_count'; did you mean
 'folio_ref_count'?
Message-ID: <202505282015.F0fVmLmH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   52ce652e7ab0f015b51fee11b2862507b2c0c25d
commit: 3bdddbba5f02f6d97283acb18e2a6e079324fe4b [36/67] mm/khugepaged: fix race with folio split/free using temporary reference
config: arm64-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282015.F0fVmLmH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282015.F0fVmLmH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282015.F0fVmLmH-lkp@intel.com/

Note: the akpm-mm/mm-unstable HEAD 52ce652e7ab0f015b51fee11b2862507b2c0c25d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   mm/khugepaged.c: In function 'hpage_collapse_scan_file':
>> mm/khugepaged.c:2337:7: error: implicit declaration of function 'folio_expected_ref_count'; did you mean 'folio_ref_count'? [-Werror=implicit-function-declaration]
      if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
          ^~~~~~~~~~~~~~~~~~~~~~~~
          folio_ref_count
   cc1: some warnings being treated as errors


vim +2337 mm/khugepaged.c

  2266	
  2267	static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
  2268					    struct file *file, pgoff_t start,
  2269					    struct collapse_control *cc)
  2270	{
  2271		struct folio *folio = NULL;
  2272		struct address_space *mapping = file->f_mapping;
  2273		XA_STATE(xas, &mapping->i_pages, start);
  2274		int present, swap;
  2275		int node = NUMA_NO_NODE;
  2276		int result = SCAN_SUCCEED;
  2277	
  2278		present = 0;
  2279		swap = 0;
  2280		memset(cc->node_load, 0, sizeof(cc->node_load));
  2281		nodes_clear(cc->alloc_nmask);
  2282		rcu_read_lock();
  2283		xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
  2284			if (xas_retry(&xas, folio))
  2285				continue;
  2286	
  2287			if (xa_is_value(folio)) {
  2288				swap += 1 << xas_get_order(&xas);
  2289				if (cc->is_khugepaged &&
  2290				    swap > khugepaged_max_ptes_swap) {
  2291					result = SCAN_EXCEED_SWAP_PTE;
  2292					count_vm_event(THP_SCAN_EXCEED_SWAP_PTE);
  2293					break;
  2294				}
  2295				continue;
  2296			}
  2297	
  2298			if (!folio_try_get(folio)) {
  2299				xas_reset(&xas);
  2300				continue;
  2301			}
  2302	
  2303			if (unlikely(folio != xas_reload(&xas))) {
  2304				folio_put(folio);
  2305				xas_reset(&xas);
  2306				continue;
  2307			}
  2308	
  2309			if (folio_order(folio) == HPAGE_PMD_ORDER &&
  2310			    folio->index == start) {
  2311				/* Maybe PMD-mapped */
  2312				result = SCAN_PTE_MAPPED_HUGEPAGE;
  2313				/*
  2314				 * For SCAN_PTE_MAPPED_HUGEPAGE, further processing
  2315				 * by the caller won't touch the page cache, and so
  2316				 * it's safe to skip LRU and refcount checks before
  2317				 * returning.
  2318				 */
  2319				folio_put(folio);
  2320				break;
  2321			}
  2322	
  2323			node = folio_nid(folio);
  2324			if (hpage_collapse_scan_abort(node, cc)) {
  2325				result = SCAN_SCAN_ABORT;
  2326				folio_put(folio);
  2327				break;
  2328			}
  2329			cc->node_load[node]++;
  2330	
  2331			if (!folio_test_lru(folio)) {
  2332				result = SCAN_PAGE_LRU;
  2333				folio_put(folio);
  2334				break;
  2335			}
  2336	
> 2337			if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
  2338				result = SCAN_PAGE_COUNT;
  2339				folio_put(folio);
  2340				break;
  2341			}
  2342	
  2343			/*
  2344			 * We probably should check if the folio is referenced
  2345			 * here, but nobody would transfer pte_young() to
  2346			 * folio_test_referenced() for us.  And rmap walk here
  2347			 * is just too costly...
  2348			 */
  2349	
  2350			present += folio_nr_pages(folio);
  2351			folio_put(folio);
  2352	
  2353			if (need_resched()) {
  2354				xas_pause(&xas);
  2355				cond_resched_rcu();
  2356			}
  2357		}
  2358		rcu_read_unlock();
  2359	
  2360		if (result == SCAN_SUCCEED) {
  2361			if (cc->is_khugepaged &&
  2362			    present < HPAGE_PMD_NR - khugepaged_max_ptes_none) {
  2363				result = SCAN_EXCEED_NONE_PTE;
  2364				count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
  2365			} else {
  2366				result = collapse_file(mm, addr, file, start, cc);
  2367			}
  2368		}
  2369	
  2370		trace_mm_khugepaged_scan_file(mm, folio, file, present, swap, result);
  2371		return result;
  2372	}
  2373	#else
  2374	static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
  2375					    struct file *file, pgoff_t start,
  2376					    struct collapse_control *cc)
  2377	{
  2378		BUILD_BUG();
  2379	}
  2380	#endif
  2381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
