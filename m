Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745723264EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776253986; cv=none; b=QLwZiZ0rwnDByMlweTKr1YiYyAitwL5wgGJBVLeiU/YuYFajE8CoCgxsSspeGYzXYgz6WzNcZjP1fXpmsKJ5NQOR0sVeGaWcV12k0kYeRrVS4dc45ZXYVrG7458UnGr02be77GFr1hF+cP3xjvYn7fEeQoo+orrf1RT+Z/vHfwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776253986; c=relaxed/simple;
	bh=I5004+rbxOc9nBXdZUDKxQOVT1i0kbtZz1elAvqCMKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JopUOnAwx2VGo5pL5gGWZ6XKcu8yaJWbUlb+QIoQeqmwSBEDKIyooPDIFJ4s7szxICVXkk97SpbdnQucwV8LfISBJWLP4Y/wqrUsyJw1nGVPyMwHD+TQ/VZWAuHS0IQZ/Ty4uqVvitO1yYsE1h5p2Kate7dGHkEd9aniOpwJT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abCKwFIH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abCKwFIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776253984; x=1807789984;
  h=date:from:to:cc:subject:message-id;
  bh=I5004+rbxOc9nBXdZUDKxQOVT1i0kbtZz1elAvqCMKc=;
  b=abCKwFIH7WDiMG+eXFJJQcENJyR/Ut4sV4Y3Q6kSZmFdUHHBueuctOaL
   pPbRDOpm6ARyyr/D8awVXDAy5MT7amFx/HboI6yGFomH7mRN9FlPHCaPR
   5tPVY44VYW+sdTqyAav9LQBUIO2vUKrU0jbSkJCf8F+jFWu0YAKZzPBQs
   PFF5WUhL/QB+425680LsHC4Qj+P9vUbeNxxkm8RnqJ9sz/IWf/bOWsdNp
   bMatB36aUwtvMs82Q6WWHK7dZJ8a1yKvydYlLuN5o2H+m0Epw2x0EougD
   6+Jzn6TqEh/psmBk8M4oY2b6AIblIf1thxsl7ds7e1ItOuO+En3PmSZiM
   A==;
X-CSE-ConnectionGUID: 3EZc5oQiQ4WD0c9u/E1fSQ==
X-CSE-MsgGUID: xkSIeshXQla3h2hMD6fgGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77103749"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77103749"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 04:53:04 -0700
X-CSE-ConnectionGUID: eyWypJOlTCSR5uWPDrJMGg==
X-CSE-MsgGUID: BnW/ekehRQqNiey9ED0+WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234432114"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2026 04:53:01 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCyni-000000000SL-3n0X;
	Wed, 15 Apr 2026 11:52:58 +0000
Date: Wed, 15 Apr 2026 19:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 159/160] mm/sparse-vmemmap.c:616:39: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202604151926.dc8MhD4N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   f358e95febcb2f3d7ac6aafab0a2b9ace9cc8b7c
commit: 085038a33b6f00e4c43cceab8116315d1d42380c [159/160] mm/sparse: fix race on mem_section->usage in pfn walkers
config: riscv-randconfig-r131-20260415 (https://download.01.org/0day-ci/archive/20260415/202604151926.dc8MhD4N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151926.dc8MhD4N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151926.dc8MhD4N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/sparse-vmemmap.c:616:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long *map @@     got unsigned long [noderef] __rcu * @@
   mm/sparse-vmemmap.c:616:39: sparse:     expected unsigned long *map
   mm/sparse-vmemmap.c:616:39: sparse:     got unsigned long [noderef] __rcu *
>> mm/sparse-vmemmap.c:684:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long *subsection_map @@     got unsigned long [noderef] __rcu * @@
   mm/sparse-vmemmap.c:684:17: sparse:     expected unsigned long *subsection_map
   mm/sparse-vmemmap.c:684:17: sparse:     got unsigned long [noderef] __rcu *
>> mm/sparse-vmemmap.c:701:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long const *src @@     got unsigned long [noderef] __rcu * @@
   mm/sparse-vmemmap.c:701:55: sparse:     expected unsigned long const *src
   mm/sparse-vmemmap.c:701:55: sparse:     got unsigned long [noderef] __rcu *
>> mm/sparse-vmemmap.c:714:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long *subsection_map @@     got unsigned long [noderef] __rcu * @@
   mm/sparse-vmemmap.c:714:24: sparse:     expected unsigned long *subsection_map
   mm/sparse-vmemmap.c:714:24: sparse:     got unsigned long [noderef] __rcu *
>> mm/sparse-vmemmap.c:805:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct mem_section_usage [noderef] __rcu *usage @@     got struct mem_section_usage *[assigned] usage @@
   mm/sparse-vmemmap.c:805:27: sparse:     expected struct mem_section_usage [noderef] __rcu *usage
   mm/sparse-vmemmap.c:805:27: sparse:     got struct mem_section_usage *[assigned] usage
>> mm/sparse-vmemmap.c:884:59: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct mem_section_usage *usage @@     got struct mem_section_usage [noderef] __rcu *usage @@
   mm/sparse-vmemmap.c:884:59: sparse:     expected struct mem_section_usage *usage
   mm/sparse-vmemmap.c:884:59: sparse:     got struct mem_section_usage [noderef] __rcu *usage
   mm/sparse-vmemmap.c: note: in included file:
   mm/internal.h:987:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct mem_section_usage [noderef] __rcu *usage @@     got struct mem_section_usage *usage @@
   mm/internal.h:987:19: sparse:     expected struct mem_section_usage [noderef] __rcu *usage
   mm/internal.h:987:19: sparse:     got struct mem_section_usage *usage

vim +616 mm/sparse-vmemmap.c

738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  603) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  604) void __init sparse_init_subsection_map(unsigned long pfn, unsigned long nr_pages)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  605) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  606) 	int end_sec_nr = pfn_to_section_nr(pfn + nr_pages - 1);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  607) 	unsigned long nr, start_sec_nr = pfn_to_section_nr(pfn);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  608) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  609) 	for (nr = start_sec_nr; nr <= end_sec_nr; nr++) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  610) 		struct mem_section *ms;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  611) 		unsigned long pfns;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  612) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  613) 		pfns = min(nr_pages, PAGES_PER_SECTION
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  614) 				- (pfn & ~PAGE_SECTION_MASK));
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  615) 		ms = __nr_to_section(nr);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20 @616) 		subsection_mask_set(ms->usage->subsection_map, pfn, pfns);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  617) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  618) 		pr_debug("%s: sec: %lu pfns: %lu set(%d, %d)\n", __func__, nr,
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  619) 				pfns, subsection_map_index(pfn),
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  620) 				subsection_map_index(pfn + pfns - 1));
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  621) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  622) 		pfn += pfns;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  623) 		nr_pages -= pfns;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  624) 	}
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  625) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  626) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  627) #ifdef CONFIG_MEMORY_HOTPLUG
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  628) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  629) /* Mark all memory sections within the pfn range as online */
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  630) void online_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  631) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  632) 	unsigned long pfn;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  633) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  634) 	for (pfn = start_pfn; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  635) 		unsigned long section_nr = pfn_to_section_nr(pfn);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  636) 		struct mem_section *ms = __nr_to_section(section_nr);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  637) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  638) 		ms->section_mem_map |= SECTION_IS_ONLINE;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  639) 	}
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  640) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  641) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  642) /* Mark all memory sections within the pfn range as offline */
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  643) void offline_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  644) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  645) 	unsigned long pfn;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  646) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  647) 	for (pfn = start_pfn; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  648) 		unsigned long section_nr = pfn_to_section_nr(pfn);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  649) 		struct mem_section *ms = __nr_to_section(section_nr);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  650) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  651) 		ms->section_mem_map &= ~SECTION_IS_ONLINE;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  652) 	}
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  653) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  654) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  655) static struct page * __meminit populate_section_memmap(unsigned long pfn,
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  656) 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  657) 		struct dev_pagemap *pgmap)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  658) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  659) 	return __populate_section_memmap(pfn, nr_pages, nid, altmap, pgmap);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  660) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  661) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  662) static void depopulate_section_memmap(unsigned long pfn, unsigned long nr_pages,
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  663) 		struct vmem_altmap *altmap)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  664) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  665) 	unsigned long start = (unsigned long) pfn_to_page(pfn);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  666) 	unsigned long end = start + nr_pages * sizeof(struct page);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  667) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  668) 	vmemmap_free(start, end, altmap);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  669) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  670) static void free_map_bootmem(struct page *memmap)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  671) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  672) 	unsigned long start = (unsigned long)memmap;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  673) 	unsigned long end = (unsigned long)(memmap + PAGES_PER_SECTION);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  674) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  675) 	vmemmap_free(start, end, NULL);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  676) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  677) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  678) static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  679) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  680) 	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) = { 0 };
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  681) 	DECLARE_BITMAP(tmp, SUBSECTIONS_PER_SECTION) = { 0 };
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  682) 	struct mem_section *ms = __pfn_to_section(pfn);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  683) 	unsigned long *subsection_map = ms->usage
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20 @684) 		? &ms->usage->subsection_map[0] : NULL;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  685) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  686) 	subsection_mask_set(map, pfn, nr_pages);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  687) 	if (subsection_map)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  688) 		bitmap_and(tmp, map, subsection_map, SUBSECTIONS_PER_SECTION);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  689) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  690) 	if (WARN(!subsection_map || !bitmap_equal(tmp, map, SUBSECTIONS_PER_SECTION),
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  691) 				"section already deactivated (%#lx + %ld)\n",
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  692) 				pfn, nr_pages))
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  693) 		return -EINVAL;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  694) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  695) 	bitmap_xor(subsection_map, map, subsection_map, SUBSECTIONS_PER_SECTION);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  696) 	return 0;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  697) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  698) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  699) static bool is_subsection_map_empty(struct mem_section *ms)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  700) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20 @701) 	return bitmap_empty(&ms->usage->subsection_map[0],
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  702) 			    SUBSECTIONS_PER_SECTION);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  703) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  704) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  705) static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  706) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  707) 	struct mem_section *ms = __pfn_to_section(pfn);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  708) 	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) = { 0 };
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  709) 	unsigned long *subsection_map;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  710) 	int rc = 0;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  711) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  712) 	subsection_mask_set(map, pfn, nr_pages);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  713) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20 @714) 	subsection_map = &ms->usage->subsection_map[0];
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  715) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  716) 	if (bitmap_empty(map, SUBSECTIONS_PER_SECTION))
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  717) 		rc = -EINVAL;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  718) 	else if (bitmap_intersects(map, subsection_map, SUBSECTIONS_PER_SECTION))
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  719) 		rc = -EEXIST;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  720) 	else
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  721) 		bitmap_or(subsection_map, map, subsection_map,
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  722) 				SUBSECTIONS_PER_SECTION);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  723) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  724) 	return rc;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  725) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  726) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  727) /*
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  728)  * To deactivate a memory region, there are 3 cases to handle:
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  729)  *
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  730)  * 1. deactivation of a partial hot-added section:
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  731)  *      a) section was present at memory init.
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  732)  *      b) section was hot-added post memory init.
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  733)  * 2. deactivation of a complete hot-added section.
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  734)  * 3. deactivation of a complete section from memory init.
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  735)  *
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  736)  * For 1, when subsection_map does not empty we will not be freeing the
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  737)  * usage map, but still need to free the vmemmap range.
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  738)  */
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  739) static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  740) 		struct vmem_altmap *altmap)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  741) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  742) 	struct mem_section *ms = __pfn_to_section(pfn);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  743) 	bool section_is_early = early_section(ms);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  744) 	struct page *memmap = NULL;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  745) 	bool empty;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  746) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  747) 	if (clear_subsection_map(pfn, nr_pages))
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  748) 		return;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  749) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  750) 	empty = is_subsection_map_empty(ms);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  751) 	if (empty) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  752) 		/*
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  753) 		 * Mark the section invalid so that valid_section()
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  754) 		 * return false. This prevents code from dereferencing
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  755) 		 * ms->usage array.
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  756) 		 */
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  757) 		ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  758) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  759) 		/*
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  760) 		 * When removing an early section, the usage map is kept (as the
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  761) 		 * usage maps of other sections fall into the same page). It
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  762) 		 * will be re-used when re-adding the section - which is then no
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  763) 		 * longer an early section. If the usage map is PageReserved, it
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  764) 		 * was allocated during boot.
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  765) 		 */
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  766) 		if (!PageReserved(virt_to_page(ms->usage))) {
085038a33b6f00 Muchun Song             2026-04-15  767  			struct mem_section_usage *usage;
085038a33b6f00 Muchun Song             2026-04-15  768  
085038a33b6f00 Muchun Song             2026-04-15  769  			usage = rcu_replace_pointer(ms->usage, NULL, true);
085038a33b6f00 Muchun Song             2026-04-15  770  			kfree_rcu(usage, rcu);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  771) 		}
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  772) 		memmap = pfn_to_page(SECTION_ALIGN_DOWN(pfn));
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  773) 	}
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  774) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  775) 	/*
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  776) 	 * The memmap of early sections is always fully populated. See
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  777) 	 * section_activate() and pfn_valid() .
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  778) 	 */
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  779) 	if (!section_is_early) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  780) 		memmap_pages_add(-1L * (DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE)));
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  781) 		depopulate_section_memmap(pfn, nr_pages, altmap);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  782) 	} else if (memmap) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  783) 		memmap_boot_pages_add(-1L * (DIV_ROUND_UP(nr_pages * sizeof(struct page),
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  784) 							  PAGE_SIZE)));
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  785) 		free_map_bootmem(memmap);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  786) 	}
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  787) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  788) 	if (empty)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  789) 		ms->section_mem_map = (unsigned long)NULL;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  790) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  791) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  792) static struct page * __meminit section_activate(int nid, unsigned long pfn,
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  793) 		unsigned long nr_pages, struct vmem_altmap *altmap,
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  794) 		struct dev_pagemap *pgmap)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  795) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  796) 	struct mem_section *ms = __pfn_to_section(pfn);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  797) 	struct mem_section_usage *usage = NULL;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  798) 	struct page *memmap;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  799) 	int rc;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  800) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  801) 	if (!ms->usage) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  802) 		usage = kzalloc(mem_section_usage_size(), GFP_KERNEL);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  803) 		if (!usage)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  804) 			return ERR_PTR(-ENOMEM);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20 @805) 		ms->usage = usage;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  806) 	}
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  807) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  808) 	rc = fill_subsection_map(pfn, nr_pages);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  809) 	if (rc) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  810) 		if (usage)
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  811) 			ms->usage = NULL;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  812) 		kfree(usage);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  813) 		return ERR_PTR(rc);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  814) 	}
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  815) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  816) 	/*
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  817) 	 * The early init code does not consider partially populated
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  818) 	 * initial sections, it simply assumes that memory will never be
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  819) 	 * referenced.  If we hot-add memory into such a section then we
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  820) 	 * do not need to populate the memmap and can simply reuse what
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  821) 	 * is already there.
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  822) 	 */
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  823) 	if (nr_pages < PAGES_PER_SECTION && early_section(ms))
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  824) 		return pfn_to_page(pfn);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  825) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  826) 	memmap = populate_section_memmap(pfn, nr_pages, nid, altmap, pgmap);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  827) 	if (!memmap) {
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  828) 		section_deactivate(pfn, nr_pages, altmap);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  829) 		return ERR_PTR(-ENOMEM);
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  830) 	}
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  831) 	memmap_pages_add(DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE));
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  832) 
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  833) 	return memmap;
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  834) }
738de20c4fafe6 David Hildenbrand (Arm  2026-03-20  835) 

:::::: The code at line 616 was first introduced by commit
:::::: 738de20c4fafe64290c5086d683254f60e837db6 mm/sparse: move memory hotplug bits to sparse-vmemmap.c

:::::: TO: David Hildenbrand (Arm) <david@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
