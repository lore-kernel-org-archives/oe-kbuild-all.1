Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6664A392C28
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 20:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851970; cv=none; b=Xq1Yba7pnPvfX9m8WjYQLLjDLJunXTHguFHlO+voOwkB6dPN/imJApeUf9LU42SGYl9XouWIobut/zd+KeRIX3Kf/F/McnXybq++Bl+tLsAwOVoYMgZoiuXuEisix4F+CR0zx0TjSATnDD98726OiIu9rLVxRJwr6m8Kj7Omqjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851970; c=relaxed/simple;
	bh=TjWI2T+UXHW1koLVVvokC+WdS5JqC39ZqvgusD9zj0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZSJ28XkVrcpvLfWmTWypu0QcHzUPse25T6UtIAdwlugv0W8oxc9Gk1muuqFcRghtlYFTW5TfuJE8Xuvf9eHOJG+MwTbG0VEcnJeuK7sRCYPUNP0rF4h96R89YxU1cFoIVO1lZIlUGLs/QoFHTwhsVJGFwfWVvZqocLVMn7+z+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gx/V6buT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gx/V6buT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782851968; x=1814387968;
  h=date:from:to:cc:subject:message-id;
  bh=TjWI2T+UXHW1koLVVvokC+WdS5JqC39ZqvgusD9zj0g=;
  b=gx/V6buTxgGFZxlwmvHD7nsFOqWalr86JAZ0ZIXa0q1S2akf+ei8pMCb
   D7BM8ZMl6XewKMEfR7vFCQHMdOXIa+vocafZFwHESir8cpTQ1Ywwqqd+L
   ozH1iaI4n9eZafiUjHMnGLP4WVn5xhbeuitdUyhcASilk5RjoTgeWDCdo
   wcIRVuBTJkjpEdt/9c6pUWpOryyDEHortG1ytSci/gNzAKNfRFZiZJT8o
   KrQ0GiefuEVF1uKQppbG85WfbBDz9hXfrARnxsRDVD/OQcmG+FAxID9Yr
   nllnVU/fMlxYUyxOxu+LIJbmQuRRxZw/7URE2eBHNYZZBXUlfwSVs/gRZ
   A==;
X-CSE-ConnectionGUID: Z+6lOE4cQi25HAeYK7ddQw==
X-CSE-MsgGUID: Z2bz4lF7SmW5dkwtl/f0Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83632922"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83632922"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 13:39:27 -0700
X-CSE-ConnectionGUID: 3C89aq6sRoOwulC8QEoS5Q==
X-CSE-MsgGUID: U6Shs9d+RyeF03HT94w2OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="248378973"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jun 2026 13:39:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wefEp-000000008eZ-22O0;
	Tue, 30 Jun 2026 20:39:23 +0000
Date: Wed, 01 Jul 2026 04:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 0/9]
 mm/huge_memory.c:587:43: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202607010457.MrHSOxYe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   13ff069897df965d9039dca208b2f39dacf81957
commit: 5b8452920e50ad7219983ebbf26c8eda1110d283 [0/9] ANDROID: mm: Export several symbols
config: x86_64-randconfig-123 (https://download.01.org/0day-ci/archive/20260701/202607010457.MrHSOxYe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010457.MrHSOxYe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010457.MrHSOxYe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/huge_memory.c:587:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct mthp_stat * @@
   mm/huge_memory.c:587:43: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/huge_memory.c:587:43: sparse:     got struct mthp_stat *
   mm/huge_memory.c:2033:20: sparse: sparse: context imbalance in 'madvise_free_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2071:28: sparse: sparse: context imbalance in 'zap_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2194:28: sparse: sparse: context imbalance in 'move_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2334:20: sparse: sparse: context imbalance in 'change_huge_pmd' - unexpected unlock
   mm/huge_memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/x86/include/asm/pgtable.h:898:9: sparse: sparse: context imbalance in 'change_huge_pud' - unexpected unlock
   mm/huge_memory.c:2416:28: sparse: sparse: context imbalance in 'move_pages_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2531:12: sparse: sparse: context imbalance in '__pmd_trans_huge_lock' - wrong count at exit
   mm/huge_memory.c:2549:12: sparse: sparse: context imbalance in '__pud_trans_huge_lock' - wrong count at exit
   mm/huge_memory.c:2575:28: sparse: sparse: context imbalance in 'zap_huge_pud' - unexpected unlock
   mm/huge_memory.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in '__split_huge_zero_page_pmd' - unexpected unlock
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in '__split_huge_pmd_locked' - unexpected unlock
   mm/huge_memory.c:3266:30: sparse: sparse: context imbalance in '__split_huge_page' - unexpected unlock
   mm/huge_memory.c:3569:17: sparse: sparse: context imbalance in 'split_huge_page_to_list_to_order' - different lock contexts for basic block
   mm/huge_memory.c:4007:17: sparse: sparse: context imbalance in 'split_huge_pages_pid' - unexpected unlock

vim +587 mm/huge_memory.c

ec33687c674934 Barry Song 2024-04-12  580  
ec33687c674934 Barry Song 2024-04-12  581  static unsigned long sum_mthp_stat(int order, enum mthp_stat_item item)
ec33687c674934 Barry Song 2024-04-12  582  {
ec33687c674934 Barry Song 2024-04-12  583  	unsigned long sum = 0;
ec33687c674934 Barry Song 2024-04-12  584  	int cpu;
ec33687c674934 Barry Song 2024-04-12  585  
ec33687c674934 Barry Song 2024-04-12  586  	for_each_possible_cpu(cpu) {
ec33687c674934 Barry Song 2024-04-12 @587  		struct mthp_stat *this = &per_cpu(mthp_stats, cpu);
ec33687c674934 Barry Song 2024-04-12  588  
ec33687c674934 Barry Song 2024-04-12  589  		sum += this->stats[order][item];
ec33687c674934 Barry Song 2024-04-12  590  	}
ec33687c674934 Barry Song 2024-04-12  591  
ec33687c674934 Barry Song 2024-04-12  592  	return sum;
ec33687c674934 Barry Song 2024-04-12  593  }
ec33687c674934 Barry Song 2024-04-12  594  

:::::: The code at line 587 was first introduced by commit
:::::: ec33687c674934dfefd782a8ffd58370b080b503 mm: add per-order mTHP anon_fault_alloc and anon_fault_fallback counters

:::::: TO: Barry Song <v-songbaohua@oppo.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
