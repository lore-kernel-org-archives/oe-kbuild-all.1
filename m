Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2E93B42C1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 21:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786050115; cv=none; b=dOOa5X9CHxdsmDlXdmONxcXVbLFUy/FsTAq21CtV02I7yvOKv1iRqA6tBSQqWod0o/koU+64Vq7aI2iE8RGzG72+to9JdAHxa6di1WyOulofEuva8F8G+J6xqXdGNp8KzclxjD33OLV/0vQgySUiBTGBwgElcNXt7xwSQ4DYcZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786050115; c=relaxed/simple;
	bh=yryCtzWs+HndbVGznUBI8u8i9GCMRbr6z55Vw4+4TOk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QijspNLzz1wqpIr9LCxQQ70gf6WAmQIczMS+4b5Y45yi6Ti4Q5x07haTcaoeIJPC47u6LCx4Ax2vMuVPVupX0f5XLtZYfF407gKxBR5nmq/tBpOIT6em7MBXjnDQSI0wCXcyOzWij1LctsJSBH8ZeLJTlI2H2rXQkJfqtlQcjt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXfoJHxG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXfoJHxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786050114; x=1817586114;
  h=date:from:to:cc:subject:message-id;
  bh=yryCtzWs+HndbVGznUBI8u8i9GCMRbr6z55Vw4+4TOk=;
  b=HXfoJHxG3TgjE1aD7qffA25ja06IoEhuUzEzQTnfMruGbDxoqyfgKimZ
   3EIgflnnPp4Kfycm8WvhAYiWXWDgElT2MDq+T0YpDc8tgZFLIsEktdjxa
   m4jMQR9xvx9icczMgT6lGdHSw9Tv67bMxLHTa+srrmI8DK+4Z8Uu44h9S
   yPOe8SMCqtBz8pfQlSk4J0q3E9hA6yL7VAvxHxi7Fo69yygyEYQqvs+BA
   1i5YvyGGepfXp2G8PwXXp79RxiYNvFblfHSZsp43HvdaHmcD7QGSWSH1M
   WM6vabJ+hOJ+1iuX5V0UpkMtVUxxyrXECNMVAOyh44gE8VRACr3x6I9cI
   g==;
X-CSE-ConnectionGUID: FIougxmBQ2aAjt47GQMqUw==
X-CSE-MsgGUID: acgJsrA3RlasVhu1RRZgvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98020107"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="98020107"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:01:53 -0700
X-CSE-ConnectionGUID: /iRqHV/lRF27EIYwLuZWLw==
X-CSE-MsgGUID: Dhr5WiOcRnu5bMkqqHxEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="266055668"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2026 14:01:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws5Dp-00000000GEj-3IUa;
	Thu, 06 Aug 2026 21:01:49 +0000
Date: Fri, 07 Aug 2026 05:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8777/13479] mm/hugetlb.c:3095:39:
 warning: array subscript 4294967295 is above array bounds of 'struct
 list_head[1]'
Message-ID: <202608070433.x3vNSfjt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea2bff00da89d7767d677bb68470130ba96f4928
commit: 20549ccf4da49ff6dcb35ffc741f92aa92e07aeb [8777/13479] mm/hugetlb: free cross-zone bootmem gigantic pages after allocation
config: parisc-randconfig-002-20260807 (https://download.01.org/0day-ci/archive/20260807/202608070433.x3vNSfjt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070433.x3vNSfjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070433.x3vNSfjt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c: In function 'alloc_bootmem_huge_page':
>> mm/hugetlb.c:3095:39: warning: array subscript 4294967295 is above array bounds of 'struct list_head[1]' [-Warray-bounds]
       list_add(&m->list, &huge_boot_pages[nid_request]);
                           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   In file included from mm/hugetlb.c:6:
>> include/linux/list.h:163:12: warning: array subscript -1 is below array bounds of 'struct list_head[1]' [-Warray-bounds]
     new->prev = prev;
     ~~~~~~~~~~^~~~~~


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
