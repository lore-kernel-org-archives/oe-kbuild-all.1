Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D4B3B5310
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421533; cv=none; b=UuMdbqeOQSf2OymPN1OiP0nfOp2T//8ZQo6WH8gOfMhXlnoPAsJoDTSyAEiRu8rOJYBvJ1/hSas7bXK6/By1AvuQCKbRyAjhQOBVor0+y8JY4sEg/hBqzI8sziwS9xbncomjRtCk+dZa3SZrL1leR4jg6+krcbB96/qtfJLnGPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421533; c=relaxed/simple;
	bh=KbwQMBkqcryg36MuPaxvPGHLpmUDJgvPWNaTzRjjV38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QhLL3ic9x9vKh6l8CRvPaB5wIx3e0sE6mpcrUi4hcu63O8QpdSOrkNAPHE00VXy9/cpG0xoNAoGgM8fQmYzq/TCQshJcuCwufl/tyPVAseBaWKnsNDgAEpQoO2lFzyaiIbqCWfWGozzf8qiY0TZcTFKoN/c4AHu8ygKZEK9fMIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSwYBNSe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSwYBNSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776421531; x=1807957531;
  h=date:from:to:cc:subject:message-id;
  bh=KbwQMBkqcryg36MuPaxvPGHLpmUDJgvPWNaTzRjjV38=;
  b=NSwYBNSehxroGUOTZyB+g5D2Oo+1gYxmG6hi2jy/iABt3tSXNbC9vAcT
   MP00CGOLgHQ/TgtXtT7N9esUPB9BRjLlvzViWgLzEJ1kN+ls9ThqO/fZ8
   QclNDKxJ05qyaLzSIljYje4TBL9mQawIAp8tV/iORiQVD294D1LzHZDVj
   OZC+OrGSjc8rL9X5qIlNX6TZI4g7bua/x1YYIzmeqPkIC/k6QqvyxeYvT
   eM9oQxHCTiVXDJmh3B1BoPvEqmzJ47ManJOwt+2SGoS3Aoib7Vu8WA2Hb
   cfQZa7ur3bXNjEN4thEoJpodoAVCXxYbdTHcOegCXpnVlmhRT6MHMgMse
   g==;
X-CSE-ConnectionGUID: cPVRhlc1RiaEL1XrJxeUxw==
X-CSE-MsgGUID: B3m7QtI/RFe5pj0hySb5AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77556056"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77556056"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 03:25:30 -0700
X-CSE-ConnectionGUID: hJIxlttCSkOXi545/F70AA==
X-CSE-MsgGUID: 9ig81UChRhCF6ekPr94EJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230137833"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2026 03:25:29 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDgO5-000000000EX-2uCs;
	Fri, 17 Apr 2026 10:25:25 +0000
Date: Fri, 17 Apr 2026 18:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 163/164] mm/bootmem_info.c:58:15: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202604171841.MGvqbmu8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   ee03ca7d1cb1223d0e14dfd3b48478545af75253
commit: 8568f268a5183e0fd5fbd33569b6513038b62f27 [163/164] mm/sparse: fix race on mem_section->usage in pfn walkers
config: x86_64-randconfig-r131-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171841.MGvqbmu8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171841.MGvqbmu8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171841.MGvqbmu8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bootmem_info.c:58:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct mem_section_usage *usage @@     got struct mem_section_usage [noderef] __rcu *usage @@
   mm/bootmem_info.c:58:15: sparse:     expected struct mem_section_usage *usage
   mm/bootmem_info.c:58:15: sparse:     got struct mem_section_usage [noderef] __rcu *usage

vim +58 mm/bootmem_info.c

426e5c429d16e4c Muchun Song             2021-06-30  42  
cdcfc631c80e716 Muchun Song             2021-09-02  43  static void __init register_page_bootmem_info_section(unsigned long start_pfn)
426e5c429d16e4c Muchun Song             2021-06-30  44  {
426e5c429d16e4c Muchun Song             2021-06-30  45  	unsigned long mapsize, section_nr, i;
426e5c429d16e4c Muchun Song             2021-06-30  46  	struct mem_section *ms;
426e5c429d16e4c Muchun Song             2021-06-30  47  	struct mem_section_usage *usage;
7f8e592bb3271ea David Hildenbrand (Arm  2026-03-20  48) 	struct page *page;
426e5c429d16e4c Muchun Song             2021-06-30  49  
7f8e592bb3271ea David Hildenbrand (Arm  2026-03-20  50) 	start_pfn = SECTION_ALIGN_DOWN(start_pfn);
426e5c429d16e4c Muchun Song             2021-06-30  51  	section_nr = pfn_to_section_nr(start_pfn);
426e5c429d16e4c Muchun Song             2021-06-30  52  	ms = __nr_to_section(section_nr);
426e5c429d16e4c Muchun Song             2021-06-30  53  
d65917c42373f70 Frank van der Linden    2025-02-28  54  	if (!preinited_vmemmap_section(ms))
7f8e592bb3271ea David Hildenbrand (Arm  2026-03-20  55) 		register_page_bootmem_memmap(section_nr, pfn_to_page(start_pfn),
d65917c42373f70 Frank van der Linden    2025-02-28  56  					     PAGES_PER_SECTION);
426e5c429d16e4c Muchun Song             2021-06-30  57  
426e5c429d16e4c Muchun Song             2021-06-30 @58  	usage = ms->usage;
426e5c429d16e4c Muchun Song             2021-06-30  59  	page = virt_to_page(usage);
426e5c429d16e4c Muchun Song             2021-06-30  60  
426e5c429d16e4c Muchun Song             2021-06-30  61  	mapsize = PAGE_ALIGN(mem_section_usage_size()) >> PAGE_SHIFT;
426e5c429d16e4c Muchun Song             2021-06-30  62  
426e5c429d16e4c Muchun Song             2021-06-30  63  	for (i = 0; i < mapsize; i++, page++)
426e5c429d16e4c Muchun Song             2021-06-30  64  		get_page_bootmem(section_nr, page, MIX_SECTION_INFO);
426e5c429d16e4c Muchun Song             2021-06-30  65  }
426e5c429d16e4c Muchun Song             2021-06-30  66  

:::::: The code at line 58 was first introduced by commit
:::::: 426e5c429d16e4cd5ded46e21ff8e939bf8abd0f mm: memory_hotplug: factor out bootmem core functions to bootmem_info.c

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
