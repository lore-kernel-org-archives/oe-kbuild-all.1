Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35E3BD22C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 23:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782949157; cv=none; b=dJTDAuJvobM/EhE3Z4PWXSDOXWtWKH/MxZYwITs2Op6/JKbYEhefHjRfv8VWWBEzr2bnFgoCj5J8pBsjRHctPUjZOOi10TEEdgIvireZdNwu/uVZKErG1NVFN47d9tUSQX7RMiQJ3+zAL9HgohN6HuB5YY/aWirNYLXtg9oMElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782949157; c=relaxed/simple;
	bh=rcPmTGdVmnKpAe2m+zIfkinWwLId1MWKce4N2gZzqcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I26i/znBcjn7bF0hbDAo7k7B8x5WZsoRZzbtBnngxXnr/jxmlLZ5sF2IbQVsgDek9o7MERxQbuhSmco2YTYAYSQ/M++a0+weRwjP9z7hzNYVHg1K/o/42Cgc/EOkIamiZhWqbaoh9WMJfAXOeau1QUdFQopnleZwGuuqgnttn+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQTlT3gx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQTlT3gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782949156; x=1814485156;
  h=date:from:to:cc:subject:message-id;
  bh=rcPmTGdVmnKpAe2m+zIfkinWwLId1MWKce4N2gZzqcc=;
  b=gQTlT3gxm1bkB91fJpkNt/smc/6d5ZaXO4eJBbXfX7n6S9sfwUSaK8bn
   YHm/IKAnAMaDE75Lf/46duNOBHgEZSpCpNKIAPZ1wsAXM6Gqpn7suIbe/
   cUHkagCw+GEmga9zSAZm49nlkiZRAm901PF9ILav0fz/tfzD9cAt4YUum
   qk2B7lGmemR9VHy5EjxkvPAISUMLLQY8QJulVhyDGJnfYv1UvciDPnCot
   KZeqyh6OzwFFSzoufGoJezhgfhfSBml9b5jEyvs3iBe5P7limcS+8zll3
   clBJa4A10C1ju2aHTrt3rlXMyvqPyqfe4hTjVjfgTAV6dOZs/DODGex2W
   A==;
X-CSE-ConnectionGUID: reEz7g2fQlasBcA8rD7RFA==
X-CSE-MsgGUID: +3gBmYb9RsSfCzFEcNDtwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87525475"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="87525475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 16:39:16 -0700
X-CSE-ConnectionGUID: JzN6oDWYQ/iiAKC9xB37zg==
X-CSE-MsgGUID: DPEqP9+ZTBiU+KfFnpn3hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="257587834"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jul 2026 16:39:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf4W9-000000009iZ-2hxF;
	Wed, 01 Jul 2026 23:39:01 +0000
Date: Thu, 02 Jul 2026 07:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1981/2307] mm/hugetlb.c:3091:39: warning:
 array subscript 4294967295 is above array bounds of 'struct list_head[1]'
Message-ID: <202607020711.qYf0IlRF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f441960e691d37c880d2cc004de06bb5b6bd5e4
commit: 307959669e447b936fbe286c4fa8eb440b5645da [1981/2307] mm/hugetlb: remove unused bootmem cma field
config: sparc-randconfig-r062-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020711.qYf0IlRF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020711.qYf0IlRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020711.qYf0IlRF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c: In function 'alloc_bootmem_huge_page':
>> mm/hugetlb.c:3091:39: warning: array subscript 4294967295 is above array bounds of 'struct list_head[1]' [-Warray-bounds]
       list_add(&m->list, &huge_boot_pages[nid_request]);
                           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   In file included from mm/hugetlb.c:6:
>> include/linux/list.h:177:2: warning: array subscript -1 is below array bounds of 'struct list_head[1]' [-Warray-bounds]
     __list_add(new, head, head->next);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +3091 mm/hugetlb.c

aa888a74977a8f2 Andi Kleen           2008-07-23  3059  
0f9d5ef0522a273 Muchun Song          2026-06-12  3060  static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
0f9d5ef0522a273 Muchun Song          2026-06-12  3061  {
f48ee682d55e360 Muchun Song          2026-06-12  3062  	unsigned long pfn;
f48ee682d55e360 Muchun Song          2026-06-12  3063  	unsigned int nid_request = nid;
0f9d5ef0522a273 Muchun Song          2026-06-12  3064  	struct huge_bootmem_page *m = arch_alloc_bootmem_huge_page(h, nid);
0f9d5ef0522a273 Muchun Song          2026-06-12  3065  
0f9d5ef0522a273 Muchun Song          2026-06-12  3066  	if (!m)
0f9d5ef0522a273 Muchun Song          2026-06-12  3067  		return false;
0f9d5ef0522a273 Muchun Song          2026-06-12  3068  
f48ee682d55e360 Muchun Song          2026-06-12  3069  	pfn = PHYS_PFN(__pa(m));
f48ee682d55e360 Muchun Song          2026-06-12  3070  	nid = early_pfn_to_nid(pfn);
0f9d5ef0522a273 Muchun Song          2026-06-12  3071  	/*
0f9d5ef0522a273 Muchun Song          2026-06-12  3072  	 * Use the beginning of the huge page to store the huge_bootmem_page
0f9d5ef0522a273 Muchun Song          2026-06-12  3073  	 * struct (until gather_bootmem puts them into the mem_map).
0f9d5ef0522a273 Muchun Song          2026-06-12  3074  	 *
0f9d5ef0522a273 Muchun Song          2026-06-12  3075  	 * Put them into a private list first because mem_map is not up yet.
0f9d5ef0522a273 Muchun Song          2026-06-12  3076  	 */
0f9d5ef0522a273 Muchun Song          2026-06-12  3077  	INIT_LIST_HEAD(&m->list);
0f9d5ef0522a273 Muchun Song          2026-06-12  3078  	m->hstate = h;
307959669e447b9 Muchun Song          2026-06-12  3079  	m->flags = hugetlb_early_cma(h) ? HUGE_BOOTMEM_CMA : 0;
fde1c4ecf91640e Usama Arif           2023-09-13  3080  
f48ee682d55e360 Muchun Song          2026-06-12  3081  	/* CMA pages: zone-crossing is validated in hugetlb_cma_reserve(). */
f48ee682d55e360 Muchun Song          2026-06-12  3082  	if (!hugetlb_early_cma(h) &&
f48ee682d55e360 Muchun Song          2026-06-12  3083  	    pfn_range_intersects_zones(nid, pfn, pages_per_huge_page(h))) {
f48ee682d55e360 Muchun Song          2026-06-12  3084  		/*
f48ee682d55e360 Muchun Song          2026-06-12  3085  		 * If the allocated page is on a different node than requested
f48ee682d55e360 Muchun Song          2026-06-12  3086  		 * (e.g., on PowerPC LPARs), put it on the requested node's list,
f48ee682d55e360 Muchun Song          2026-06-12  3087  		 * because hugetlb_free_cross_zone_pages() only frees cross-zone
f48ee682d55e360 Muchun Song          2026-06-12  3088  		 * pages belonging to the requested node.
f48ee682d55e360 Muchun Song          2026-06-12  3089  		 */
f48ee682d55e360 Muchun Song          2026-06-12  3090  		if (WARN_ON_ONCE(nid_request != NUMA_NO_NODE && nid != nid_request))
f48ee682d55e360 Muchun Song          2026-06-12 @3091  			list_add(&m->list, &huge_boot_pages[nid_request]);
f48ee682d55e360 Muchun Song          2026-06-12  3092  		else
f48ee682d55e360 Muchun Song          2026-06-12  3093  			list_add(&m->list, &huge_boot_pages[nid]);
f48ee682d55e360 Muchun Song          2026-06-12  3094  	} else {
f48ee682d55e360 Muchun Song          2026-06-12  3095  		list_add_tail(&m->list, &huge_boot_pages[nid]);
f48ee682d55e360 Muchun Song          2026-06-12  3096  		m->flags |= HUGE_BOOTMEM_ZONES_VALID;
fde1c4ecf91640e Usama Arif           2023-09-13  3097  		/*
fde1c4ecf91640e Usama Arif           2023-09-13  3098  		 * Only initialize the head struct page in memmap_init_reserved_pages,
fde1c4ecf91640e Usama Arif           2023-09-13  3099  		 * rest of the struct pages will be initialized by the HugeTLB
fde1c4ecf91640e Usama Arif           2023-09-13  3100  		 * subsystem itself.
fde1c4ecf91640e Usama Arif           2023-09-13  3101  		 * The head struct page is used to get folio information by the HugeTLB
fde1c4ecf91640e Usama Arif           2023-09-13  3102  		 * subsystem like zone id and node id.
fde1c4ecf91640e Usama Arif           2023-09-13  3103  		 */
a1e59fc6ee4ed89 Ritesh Harjani (IBM  2026-02-26  3104) 		memblock_reserved_mark_noinit(__pa((void *)m + PAGE_SIZE),
fde1c4ecf91640e Usama Arif           2023-09-13  3105  				huge_page_size(h) - PAGE_SIZE);
f48ee682d55e360 Muchun Song          2026-06-12  3106  	}
b1222550fbf7384 Frank van der Linden 2025-02-28  3107  
0f9d5ef0522a273 Muchun Song          2026-06-12  3108  	return true;
aa888a74977a8f2 Andi Kleen           2008-07-23  3109  }
aa888a74977a8f2 Andi Kleen           2008-07-23  3110  

:::::: The code at line 3091 was first introduced by commit
:::::: f48ee682d55e3602fcc194cb93b8398f2546e53f mm/hugetlb: free cross-zone bootmem gigantic pages after allocation

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
