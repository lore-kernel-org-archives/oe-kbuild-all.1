Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1D33AD53E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 16:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268944; cv=none; b=YE7fu6Oso3U/7WAOPMO8dcsO/klCQEb5I7Mqaw8zeXsA40kysGWC1LlzYcA3p50aIIKYV+dmYzIK7uFg2uxvllt9u6s3s+7ujzPmCge6DqSXsOdTmMPAyHQMYh3qANwF7E957hRVw2NbPJWlwBnbk3gi2UGWDl+R7Vj9ZFcUwWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268944; c=relaxed/simple;
	bh=gcWEs+rCOf8VGnANuBpvPLCpsCBVQARvBjgn3rhoBEw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JmlQmkhIbvUP2hmXEgurggHYDieMcdvi8zd1mAS/oubRluMF5m6XaKE3wv7yiRI6nImnnpFI+K9ux4q+YJXi/mqXyW1b/nAOUYB5KcD+2EBF77sOpvKJyln4+DgY2PejD82dNEVOVnSvugO6V1U5o2ai0N1aKt6IlWJqEJgcW4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5rA2h7y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5rA2h7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776268942; x=1807804942;
  h=date:from:to:cc:subject:message-id;
  bh=gcWEs+rCOf8VGnANuBpvPLCpsCBVQARvBjgn3rhoBEw=;
  b=H5rA2h7yFKAC4t4M0XO5DG16x+BbYRU3ft7k5FLZjrAJftaUNgkHZd/N
   WT1hKwNuxjVzoxJ//sApCNINSbeKx+Oh5emVq00CmR/xivwOsSkpI4tvq
   gQ/oSMahyQv6kmGYxrn0PjdoGruRcNmy07lAIJw8MkQ0UHzxYZVknBTPZ
   HPl1xNSpedB/IHCrEm9gMyd4sdffpq7WAA6PwgiseCV1n1QE12aKnPsP1
   4SEsL3e33ODXzQMyn7Rh2KqxoU7EFp7w0CuVl2X8rURlJzPrvBRM55fWv
   QiQYJhf6yTgXBu33yNCGpekPY/7iVo+Lisv9lmRirBj/uF49RDzuh4mPQ
   g==;
X-CSE-ConnectionGUID: DyjO2f+oTAWaUAtXVpry9Q==
X-CSE-MsgGUID: /2ZO2jB2QZehgimcmYucGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87559625"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87559625"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 09:02:21 -0700
X-CSE-ConnectionGUID: ls8atoaGSH2jPpp1to33rw==
X-CSE-MsgGUID: rNN2UEoGQ3+3lPJ2897XEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227292592"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2026 09:02:19 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD2gy-000000000fC-2Tye;
	Wed, 15 Apr 2026 16:02:16 +0000
Date: Thu, 16 Apr 2026 00:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 159/160] mm/sparse-vmemmap.c:766:35: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202604160027.KyDdtIJG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   f358e95febcb2f3d7ac6aafab0a2b9ace9cc8b7c
commit: a55cc18eb303ff23501859829362c863e39372ef [159/160] mm/sparse: fix race on mem_section->usage in pfn walkers
config: s390-randconfig-r112-20260415 (https://download.01.org/0day-ci/archive/20260416/202604160027.KyDdtIJG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160027.KyDdtIJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160027.KyDdtIJG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/sparse-vmemmap.c:616:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long *map @@     got unsigned long [noderef] __rcu * @@
   mm/sparse-vmemmap.c:616:39: sparse:     expected unsigned long *map
   mm/sparse-vmemmap.c:616:39: sparse:     got unsigned long [noderef] __rcu *
   mm/sparse-vmemmap.c:684:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long *subsection_map @@     got unsigned long [noderef] __rcu * @@
   mm/sparse-vmemmap.c:684:17: sparse:     expected unsigned long *subsection_map
   mm/sparse-vmemmap.c:684:17: sparse:     got unsigned long [noderef] __rcu *
   mm/sparse-vmemmap.c:701:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long const *src @@     got unsigned long [noderef] __rcu * @@
   mm/sparse-vmemmap.c:701:55: sparse:     expected unsigned long const *src
   mm/sparse-vmemmap.c:701:55: sparse:     got unsigned long [noderef] __rcu *
   mm/sparse-vmemmap.c:714:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long *subsection_map @@     got unsigned long [noderef] __rcu * @@
   mm/sparse-vmemmap.c:714:24: sparse:     expected unsigned long *subsection_map
   mm/sparse-vmemmap.c:714:24: sparse:     got unsigned long [noderef] __rcu *
>> mm/sparse-vmemmap.c:766:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *kaddr @@     got struct mem_section_usage [noderef] __rcu *usage @@
   mm/sparse-vmemmap.c:766:35: sparse:     expected void const *kaddr
   mm/sparse-vmemmap.c:766:35: sparse:     got struct mem_section_usage [noderef] __rcu *usage
   mm/sparse-vmemmap.c:805:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct mem_section_usage [noderef] __rcu *usage @@     got struct mem_section_usage *[assigned] usage @@
   mm/sparse-vmemmap.c:805:27: sparse:     expected struct mem_section_usage [noderef] __rcu *usage
   mm/sparse-vmemmap.c:805:27: sparse:     got struct mem_section_usage *[assigned] usage
   mm/sparse-vmemmap.c:884:59: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct mem_section_usage *usage @@     got struct mem_section_usage [noderef] __rcu *usage @@
   mm/sparse-vmemmap.c:884:59: sparse:     expected struct mem_section_usage *usage
   mm/sparse-vmemmap.c:884:59: sparse:     got struct mem_section_usage [noderef] __rcu *usage
   mm/sparse-vmemmap.c: note: in included file:
   mm/internal.h:987:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct mem_section_usage [noderef] __rcu *usage @@     got struct mem_section_usage *usage @@
   mm/internal.h:987:19: sparse:     expected struct mem_section_usage [noderef] __rcu *usage
   mm/internal.h:987:19: sparse:     got struct mem_section_usage *usage

vim +766 mm/sparse-vmemmap.c

738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  726) 
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  727) /*
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  728)  * To deactivate a memory region, there are 3 cases to handle:
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  729)  *
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  730)  * 1. deactivation of a partial hot-added section:
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  731)  *      a) section was present at memory init.
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  732)  *      b) section was hot-added post memory init.
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  733)  * 2. deactivation of a complete hot-added section.
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  734)  * 3. deactivation of a complete section from memory init.
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  735)  *
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  736)  * For 1, when subsection_map does not empty we will not be freeing the
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  737)  * usage map, but still need to free the vmemmap range.
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  738)  */
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  739) static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  740) 		struct vmem_altmap *altmap)
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  741) {
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  742) 	struct mem_section *ms = __pfn_to_section(pfn);
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  743) 	bool section_is_early = early_section(ms);
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  744) 	struct page *memmap = NULL;
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  745) 	bool empty;
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  746) 
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  747) 	if (clear_subsection_map(pfn, nr_pages))
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  748) 		return;
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  749) 
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  750) 	empty = is_subsection_map_empty(ms);
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  751) 	if (empty) {
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  752) 		/*
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  753) 		 * Mark the section invalid so that valid_section()
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  754) 		 * return false. This prevents code from dereferencing
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  755) 		 * ms->usage array.
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  756) 		 */
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  757) 		ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  758) 
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  759) 		/*
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  760) 		 * When removing an early section, the usage map is kept (as the
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  761) 		 * usage maps of other sections fall into the same page). It
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  762) 		 * will be re-used when re-adding the section - which is then no
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  763) 		 * longer an early section. If the usage map is PageReserved, it
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  764) 		 * was allocated during boot.
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  765) 		 */
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20 @766) 		if (!PageReserved(virt_to_page(ms->usage))) {
a55cc18eb303ff2 Muchun Song             2026-04-15  767  			struct mem_section_usage *usage;
a55cc18eb303ff2 Muchun Song             2026-04-15  768  
a55cc18eb303ff2 Muchun Song             2026-04-15  769  			usage = rcu_replace_pointer(ms->usage, NULL, true);
a55cc18eb303ff2 Muchun Song             2026-04-15  770  			kfree_rcu(usage, rcu);
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  771) 		}
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  772) 		memmap = pfn_to_page(SECTION_ALIGN_DOWN(pfn));
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  773) 	}
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  774) 
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  775) 	/*
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  776) 	 * The memmap of early sections is always fully populated. See
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  777) 	 * section_activate() and pfn_valid() .
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  778) 	 */
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  779) 	if (!section_is_early) {
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  780) 		memmap_pages_add(-1L * (DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE)));
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  781) 		depopulate_section_memmap(pfn, nr_pages, altmap);
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  782) 	} else if (memmap) {
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  783) 		memmap_boot_pages_add(-1L * (DIV_ROUND_UP(nr_pages * sizeof(struct page),
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  784) 							  PAGE_SIZE)));
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  785) 		free_map_bootmem(memmap);
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  786) 	}
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  787) 
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  788) 	if (empty)
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  789) 		ms->section_mem_map = (unsigned long)NULL;
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  790) }
738de20c4fafe64 David Hildenbrand (Arm  2026-03-20  791) 

:::::: The code at line 766 was first introduced by commit
:::::: 738de20c4fafe64290c5086d683254f60e837db6 mm/sparse: move memory hotplug bits to sparse-vmemmap.c

:::::: TO: David Hildenbrand (Arm) <david@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
