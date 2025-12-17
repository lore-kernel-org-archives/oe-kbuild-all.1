Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B332C5478D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 01:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765935453; cv=none; b=Xx4FvJjth1C6U1FhbDnZMfPb6/cGcKScL3U1L3cn5Wm4NLM/8XP9mpXjAT6ChiA2DMGKKxGiVA5cqo/8QU86ptDI6RKkqJ4W+OGf5cekowc9q5Efd2RwyYdp6GK3aMTAs634Fte76roSqVuXBZySCwstIgcnzDAJwOM9qHZsegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765935453; c=relaxed/simple;
	bh=QEBFgkGi0UFgkR/8qpUAalGgJ+kIesFeBQ4ifwFQ5Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rkxMc6pYKWzIWx7Dcm1Oyim2jhIZzE9yaBCTc41yLcBLdcgiCI2l4AYWLiU4Dpq3tVVkgCfjvdZUq+YbKVVlT5A7tVnZUjdg1qJx/W6tp+D5PiRrunlkRvrtDvQEfsNjbH/cSC/0Xl94cS53dsNSNi3vylasPueAZ2GyCALH3mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iT1l7p2i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iT1l7p2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765935452; x=1797471452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QEBFgkGi0UFgkR/8qpUAalGgJ+kIesFeBQ4ifwFQ5Ak=;
  b=iT1l7p2i+z62e9JWjE+Ae84biq1xI/eOnZ/NB8tCZ9iZEmA0yd+Fw9bM
   gDf5LiNUVHvuepILHJ+NDY7shtMYcIWTEg7BPzL91az5LatUl6qKQaAZP
   +U25TS5weHeg5s1h3dQ7D30rCY6o4ApoHpZTSTTolgn4DjR8bPHt6plA/
   YH71m7Q4Gxi64CKILhq0QNZyJGhMThVlyA3Kh2rSmMRFY5gzqRyJa0mz0
   OvfVaA1Stb/0TcRcxYQoloUj94pTWS0sZmKi83ke3XoQWZe/6KwDc3yrR
   udEUTJXrB4fFiH8H1slE7mHA4DGk1KU7AGp6jHlRDkE9i9sozMBJkQRL2
   w==;
X-CSE-ConnectionGUID: XbXiE6LHQvKmNv7cmd7BQg==
X-CSE-MsgGUID: L5XOvsaOSTeo3xIEBZmeDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78173619"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="78173619"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 17:37:31 -0800
X-CSE-ConnectionGUID: 6FHLicIGR0iGFebT+GAK/w==
X-CSE-MsgGUID: hxFa+zUZReqc/ZIjXHZgTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="197912140"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 17:37:30 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVgTn-0000000040q-2ETO;
	Wed, 17 Dec 2025 01:37:27 +0000
Date: Wed, 17 Dec 2025 09:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2]
 drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol
 'ads_page_owner' was not declared. Should it be static?
Message-ID: <202512170907.0KS5mX6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [0/2] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-061-20251217 (https://download.01.org/0day-ci/archive/20251217/202512170907.0KS5mX6u-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170907.0KS5mX6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170907.0KS5mX6u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol 'ads_page_owner' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:28:6: sparse: sparse: symbol 'ads_slub_debug' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:29:15: sparse: sparse: symbol 'ads_vmalloc_nr_pages' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:30:15: sparse: sparse: symbol 'ads_pcpu_nr_pages' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:88:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/ads_page_owner +27 drivers/android/android_debug_symbols.c

    26	
  > 27	bool ads_page_owner;
  > 28	bool ads_slub_debug;
  > 29	unsigned long ads_vmalloc_nr_pages;
  > 30	unsigned long ads_pcpu_nr_pages;
    31	
    32	#define _ADS_ENTRY(index, symbol)			\
    33		[index] = { .name = #symbol, .addr = (void *)symbol }
    34	#define ADS_ENTRY(index, symbol) _ADS_ENTRY(index, symbol)
    35	
    36	#define _ADS_PER_CPU_ENTRY(index, symbol)			\
    37		[index] = { .name = #symbol, .addr = (void *)&symbol }
    38	#define ADS_PER_CPU_ENTRY(index, symbol) _ADS_PER_CPU_ENTRY(index, symbol)
    39	
    40	/*
    41	 * This module maintains static array of symbol and address information.
    42	 * Add all required core kernel symbols and their addresses into ads_entries[] array,
    43	 * so that vendor modules can query and to find address of non-exported symbol.
    44	 */
    45	static const struct ads_entry ads_entries[ADS_END] = {
    46		ADS_ENTRY(ADS_SDATA, _sdata),
    47		ADS_ENTRY(ADS_BSS_END, __bss_stop),
    48		ADS_ENTRY(ADS_PER_CPU_START, __per_cpu_start),
    49		ADS_ENTRY(ADS_PER_CPU_END, __per_cpu_end),
    50		ADS_ENTRY(ADS_START_RO_AFTER_INIT, __start_ro_after_init),
    51		ADS_ENTRY(ADS_END_RO_AFTER_INIT, __end_ro_after_init),
    52		ADS_ENTRY(ADS_LINUX_BANNER, linux_banner),
    53	#ifdef CONFIG_CMA
    54		ADS_ENTRY(ADS_TOTAL_CMA, &totalcma_pages),
    55	#endif
    56		ADS_ENTRY(ADS_SLAB_CACHES, &slab_caches),
    57		ADS_ENTRY(ADS_SLAB_MUTEX, &slab_mutex),
    58		ADS_ENTRY(ADS_MIN_LOW_PFN, &min_low_pfn),
    59		ADS_ENTRY(ADS_MAX_PFN, &max_pfn),
    60		ADS_ENTRY(ADS_VMALLOC_NR_PAGES, &ads_vmalloc_nr_pages),
    61		ADS_ENTRY(ADS_PCPU_NR_PAGES, &ads_pcpu_nr_pages),
    62	#ifdef CONFIG_PAGE_OWNER
    63		ADS_ENTRY(ADS_PAGE_OWNER_ENABLED, &ads_page_owner),
    64	#endif
    65	#ifdef CONFIG_SLUB_DEBUG
    66		ADS_ENTRY(ADS_SLUB_DEBUG, &ads_slub_debug),
    67	#endif
    68	#ifdef CONFIG_SWAP
    69		ADS_ENTRY(ADS_NR_SWAP_PAGES, &nr_swap_pages),
    70	#endif
    71	#ifdef CONFIG_MMU
    72		ADS_ENTRY(ADS_MMAP_MIN_ADDR, &mmap_min_addr),
    73	#endif
    74		ADS_ENTRY(ADS_STACK_GUARD_GAP, &stack_guard_gap),
    75	#ifdef CONFIG_SYSCTL
    76		ADS_ENTRY(ADS_SYSCTL_LEGACY_VA_LAYOUT, &sysctl_legacy_va_layout),
    77	#endif
    78	};
    79	
    80	/*
    81	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    82	 */
    83	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    84	#ifdef CONFIG_ARM64
    85		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    86	#endif
    87	#ifdef CONFIG_X86
  > 88		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    89	#endif
    90	};
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
