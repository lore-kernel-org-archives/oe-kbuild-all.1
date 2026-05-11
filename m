Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8692F9D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 04:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778473017; cv=none; b=pC3bE3edRCRGTOwjXh0k4BLPCGYDXStcZEwCV59kMo4qo5mCxCqUebyv1UAVGARywXxz98jnkTb08dvaEtr2AecLnI6VInTDCQVWumwYn2jVNgQiBcZgsIffCknHNr8Sv+J8q6L1XtzW8fMnw/aPFCs0KvORRpI7nqix3vUgqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778473017; c=relaxed/simple;
	bh=N9zKDNofZmWEyTMziMCVjYnNWhk5PArwKnInVdQSBtE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rSs3mSDSmgq7WQrKKnvZa7c3vRR28ec2YBWBnQ+hTJMRARUamJfnvhN/J3/n2eoC7ONcZ0k3ZT3RMhZ2yIsDj8ygorS4mnE10DD9cW2OcuwYDrv+a3Z9mAiA9IHtgdILdefbHJRVYiBUHcNOpItz4FPfdywJ5k0UjJIrnuB8wgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXkEctsI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXkEctsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778473016; x=1810009016;
  h=date:from:to:cc:subject:message-id;
  bh=N9zKDNofZmWEyTMziMCVjYnNWhk5PArwKnInVdQSBtE=;
  b=FXkEctsIN7/ZpVU7WNqEAVtaZe5Dew8JerBkvJRf8DxCNxq9QThHnpKL
   rhQZOaF1jMlyVWV4RzRXS63FH6pdLmoJBA+r7O2IHbxB9OaskhS7n1Scs
   JNKiguvWEcdOVmhQMgzgZhVZuSW/7UoMBSHblF0krlPYWBef+WVxPyTU8
   pP7ejmmjv9GWo5PViiphEIGVxUCqRnEKQZg3sH2gz9abOhybC/uUJIUO7
   7LLQwdXwiYFwihxXhejPyPgApSXjCgz+0zOAwK52rMDyKqcQyRsaDo8nd
   K4uK6g5T9bzzNqoqLlFdx7uYQbzPuYNjPcE35ISNpGCafaG8nixNa1xZg
   Q==;
X-CSE-ConnectionGUID: xQi+q/+uRuevOE08fY9ZaQ==
X-CSE-MsgGUID: m8oavC/LRCSacf54roBhWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="104812924"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="104812924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 21:16:55 -0700
X-CSE-ConnectionGUID: yQSVuE9YRmCEtCxxAs/oWQ==
X-CSE-MsgGUID: oBUxK0PgRmeA49mG8ujxXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="242313741"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 May 2026 21:16:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMI4Z-000000007sf-1oV4;
	Mon, 11 May 2026 04:16:51 +0000
Date: Mon, 11 May 2026 06:16:38 +0200
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/sparse-vmemmap.c:369:13: error: implicit declaration of
 function 'vmemmap_alloc_block_zero'; did you mean 'vmemmap_alloc_block_buf'?
Message-ID: <202605110647.GgWYf2Px-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kevin-Brodsky/mm-Introduce-kpkeys/20260511-035515
head:   0d3293fffa052760cd8744b91e08b4c258894d35
commit: 183bd16e8357a68038cb9c4f9156fba842ad8942 mm: kpkeys: Protect vmemmap page tables
date:   8 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260511/202605110647.GgWYf2Px-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110647.GgWYf2Px-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605110647.GgWYf2Px-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/sparse-vmemmap.c: In function 'vmemmap_get_tail':
>> mm/sparse-vmemmap.c:369:13: error: implicit declaration of function 'vmemmap_alloc_block_zero'; did you mean 'vmemmap_alloc_block_buf'? [-Wimplicit-function-declaration]
     369 |         p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
         |             vmemmap_alloc_block_buf
>> mm/sparse-vmemmap.c:369:11: error: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     369 |         p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
         |           ^


vim +369 mm/sparse-vmemmap.c

9eb6207b7812ce Frank van der Linden 2025-02-28  342  
622026e87c4019 Kiryl Shutsemau      2026-02-27  343  #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
622026e87c4019 Kiryl Shutsemau      2026-02-27  344  static __meminit struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
622026e87c4019 Kiryl Shutsemau      2026-02-27  345  {
622026e87c4019 Kiryl Shutsemau      2026-02-27  346  	struct page *p, *tail;
622026e87c4019 Kiryl Shutsemau      2026-02-27  347  	unsigned int idx;
622026e87c4019 Kiryl Shutsemau      2026-02-27  348  	int node = zone_to_nid(zone);
622026e87c4019 Kiryl Shutsemau      2026-02-27  349  
622026e87c4019 Kiryl Shutsemau      2026-02-27  350  	if (WARN_ON_ONCE(order < VMEMMAP_TAIL_MIN_ORDER))
622026e87c4019 Kiryl Shutsemau      2026-02-27  351  		return NULL;
622026e87c4019 Kiryl Shutsemau      2026-02-27  352  	if (WARN_ON_ONCE(order > MAX_FOLIO_ORDER))
622026e87c4019 Kiryl Shutsemau      2026-02-27  353  		return NULL;
622026e87c4019 Kiryl Shutsemau      2026-02-27  354  
622026e87c4019 Kiryl Shutsemau      2026-02-27  355  	idx = order - VMEMMAP_TAIL_MIN_ORDER;
622026e87c4019 Kiryl Shutsemau      2026-02-27  356  	tail = zone->vmemmap_tails[idx];
622026e87c4019 Kiryl Shutsemau      2026-02-27  357  	if (tail)
622026e87c4019 Kiryl Shutsemau      2026-02-27  358  		return tail;
622026e87c4019 Kiryl Shutsemau      2026-02-27  359  
9eb6207b7812ce Frank van der Linden 2025-02-28  360  	/*
622026e87c4019 Kiryl Shutsemau      2026-02-27  361  	 * Only allocate the page, but do not initialize it.
622026e87c4019 Kiryl Shutsemau      2026-02-27  362  	 *
622026e87c4019 Kiryl Shutsemau      2026-02-27  363  	 * Any initialization done here will be overwritten by memmap_init().
622026e87c4019 Kiryl Shutsemau      2026-02-27  364  	 *
622026e87c4019 Kiryl Shutsemau      2026-02-27  365  	 * hugetlb_vmemmap_init() will take care of initialization after
622026e87c4019 Kiryl Shutsemau      2026-02-27  366  	 * memmap_init().
9eb6207b7812ce Frank van der Linden 2025-02-28  367  	 */
622026e87c4019 Kiryl Shutsemau      2026-02-27  368  
622026e87c4019 Kiryl Shutsemau      2026-02-27 @369  	p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
622026e87c4019 Kiryl Shutsemau      2026-02-27  370  	if (!p)
622026e87c4019 Kiryl Shutsemau      2026-02-27  371  		return NULL;
622026e87c4019 Kiryl Shutsemau      2026-02-27  372  
622026e87c4019 Kiryl Shutsemau      2026-02-27  373  	tail = virt_to_page(p);
622026e87c4019 Kiryl Shutsemau      2026-02-27  374  	zone->vmemmap_tails[idx] = tail;
622026e87c4019 Kiryl Shutsemau      2026-02-27  375  
622026e87c4019 Kiryl Shutsemau      2026-02-27  376  	return tail;
622026e87c4019 Kiryl Shutsemau      2026-02-27  377  }
622026e87c4019 Kiryl Shutsemau      2026-02-27  378  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
