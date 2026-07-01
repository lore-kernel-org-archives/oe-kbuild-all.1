Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875234D385
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 01:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782869834; cv=none; b=HU6q9k4LSDtfg4ZfnCryBtowaDjReEE1pwIzNeeNR6vlXHhRlHeLwSSUI0gLFe3GxBhLDN9SDvrsE6Hc97YDQVXqHLgbdNX5hKSV/L4fUR3LoIjXI9TZp2aMHPQuzGNyMbhPLib3v0C150PZXA0SUVgpN0JblQu8idY4j3QvpZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782869834; c=relaxed/simple;
	bh=PFxWOFsTYrEDx75BwfRH5hpO6+k30LXq3G+vNZaMPPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jQC5tzTQcuiiK58i1icl9C/EQgK0n+tPmsoaIohBwcZCaPemtEMewxs9ooZTxwXaVwyMNuHuXWF3PL2wr+mNGdTw4Rip8NT0raNKqtENV7GnCE7iIJtBebbgmHcSZ+mUMI/fzOgnmFyZRWTVxVVFdyoIl7CFCDgPTnHVGQK0qa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMlqi+H6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMlqi+H6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782869833; x=1814405833;
  h=date:from:to:cc:subject:message-id;
  bh=PFxWOFsTYrEDx75BwfRH5hpO6+k30LXq3G+vNZaMPPU=;
  b=jMlqi+H6kC3nHo5bgKgDAXsr+HvKjDNZEoK+2q7Fug1twBceI0QM9VWe
   2ZA0pR59pbP2kowtS2+QPrl4RaKAZq1IWG+ikWcTgTna6LWDHc+Gm6jIz
   CXkk4xVNc0EYQzLm0gr67wbPA4zlrYZ35ebnAa36hFnpKmhFSkKPSdoAh
   1hcaWHb6pnO8ZokeEn4QTeGNqqXFD6l2JbYYmWZTc6UMPvmmz9oldqNRj
   hoAj1e6TabUktNz13UppAl5LFQ4J5PZA5FkMVLIGb1osgfeh8sJH0nMz/
   UzL+mrZWMzAppDXplSdkVCQ9LrseFgBl8BUwezKQ/APuAXiR3GgKTikH4
   w==;
X-CSE-ConnectionGUID: XqubBDuJS86N9RoVdrmO8w==
X-CSE-MsgGUID: tMMLkvpLQTea0z+A7yexyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87427277"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="87427277"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:37:12 -0700
X-CSE-ConnectionGUID: Q2TRE87+Qa6oRVXvaxMNLQ==
X-CSE-MsgGUID: BxGRJdSASDerHOYa/gzemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="256338041"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Jun 2026 18:37:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wejsv-000000008pv-1d8Z;
	Wed, 01 Jul 2026 01:37:06 +0000
Date: Wed, 01 Jul 2026 09:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1977/2307] mm/hugetlb.c:3095:4: warning:
 array subscript -1 is below array bounds of 'struct list_head[1]'
Message-ID: <202607010945.6lDjBFTU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c93fa674f0fc3c8f359c2143abce6bbb422e6
commit: f48ee682d55e3602fcc194cb93b8398f2546e53f [1977/2307] mm/hugetlb: free cross-zone bootmem gigantic pages after allocation
config: sparc-randconfig-r131-20260701 (https://download.01.org/0day-ci/archive/20260701/202607010945.6lDjBFTU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010945.6lDjBFTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010945.6lDjBFTU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c: In function 'alloc_bootmem_huge_page':
>> mm/hugetlb.c:3095:4: warning: array subscript -1 is below array bounds of 'struct list_head[1]' [-Warray-bounds]
       list_add(&m->list, &huge_boot_pages[nid_request]);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +3095 mm/hugetlb.c

  3060	
  3061	static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
  3062	{
  3063		unsigned long pfn;
  3064		unsigned int nid_request = nid;
  3065		struct huge_bootmem_page *m = arch_alloc_bootmem_huge_page(h, nid);
  3066	
  3067		if (!m)
  3068			return false;
  3069	
  3070		pfn = PHYS_PFN(__pa(m));
  3071		nid = early_pfn_to_nid(pfn);
  3072		/*
  3073		 * Use the beginning of the huge page to store the huge_bootmem_page
  3074		 * struct (until gather_bootmem puts them into the mem_map).
  3075		 *
  3076		 * Put them into a private list first because mem_map is not up yet.
  3077		 */
  3078		INIT_LIST_HEAD(&m->list);
  3079		m->hstate = h;
  3080		if (!hugetlb_early_cma(h)) {
  3081			m->cma = NULL;
  3082			m->flags = 0;
  3083		}
  3084	
  3085		/* CMA pages: zone-crossing is validated in hugetlb_cma_reserve(). */
  3086		if (!hugetlb_early_cma(h) &&
  3087		    pfn_range_intersects_zones(nid, pfn, pages_per_huge_page(h))) {
  3088			/*
  3089			 * If the allocated page is on a different node than requested
  3090			 * (e.g., on PowerPC LPARs), put it on the requested node's list,
  3091			 * because hugetlb_free_cross_zone_pages() only frees cross-zone
  3092			 * pages belonging to the requested node.
  3093			 */
  3094			if (WARN_ON_ONCE(nid_request != NUMA_NO_NODE && nid != nid_request))
> 3095				list_add(&m->list, &huge_boot_pages[nid_request]);
  3096			else
  3097				list_add(&m->list, &huge_boot_pages[nid]);
  3098		} else {
  3099			list_add_tail(&m->list, &huge_boot_pages[nid]);
  3100			m->flags |= HUGE_BOOTMEM_ZONES_VALID;
  3101			/*
  3102			 * Only initialize the head struct page in memmap_init_reserved_pages,
  3103			 * rest of the struct pages will be initialized by the HugeTLB
  3104			 * subsystem itself.
  3105			 * The head struct page is used to get folio information by the HugeTLB
  3106			 * subsystem like zone id and node id.
  3107			 */
  3108			memblock_reserved_mark_noinit(__pa((void *)m + PAGE_SIZE),
  3109					huge_page_size(h) - PAGE_SIZE);
  3110		}
  3111	
  3112		return true;
  3113	}
  3114	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
