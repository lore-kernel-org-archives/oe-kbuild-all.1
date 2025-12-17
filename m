Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9799233A030
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969957; cv=none; b=B+V2ddfV51q0sgN1B1Nu6FUFX4afTbWP4/2CU2hzFHYHLHUiCSaxB7hC3/yZRRSRUvblojwX/6Gh6kiFv5NGLnvt0J+Yp4oouDG5LGsbKuWJK0KF7TjI83ZSr8IDVGRAoZ8g4hnv3f4SoGdImwfX6G9FADfJY3QnBH367wxoipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969957; c=relaxed/simple;
	bh=bDlASj3c09wODGW0TKYG4pCwJcqYbsVjv+G1tTtWmhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Co7LvZS3isnTyNgErJD7xR83ylBkIB4i2hUAeg723gEEjYr4NL3O62m5Pdt7BYNl1GoVmIckuRZ8hoK5oADchrIHCYiAJRC4++ATnmckDc6a8dUbofTm6bWFUY8w0eru+P1o1hEg3z7yzOspWSCynRL6gR9A93wSmoVAYTmUapo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZOjMQs0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZOjMQs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765969955; x=1797505955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bDlASj3c09wODGW0TKYG4pCwJcqYbsVjv+G1tTtWmhU=;
  b=eZOjMQs0NqLblJx8F0oh8RQiyFhBNVeB7lilg5nu2xvfOHPtvq4kLQ9I
   xPgJI5aFtS67NXLWhOVv2h/4EoJf2CeUC7s6iYpStUL+66HrL4BNjd91w
   DeIDtEsLrADxAvVT0X0/F5o5KRC4cYdkbJB2oj7NLW3PUPycHnrs90eMS
   vwUDiIIIpQLjH22G7YZdh0GDdFf1PMlLoK3pDN3xo26xmVoQvbI/mAH2k
   kVYBTlOYIuIkKJ2cWe9wYAqBqWCRvSiqg0V97Xe4iIOLWVcFQal8zWMRJ
   mktCkppGmpCCk53gwziPQalqxXzqEvgXriVKMHhnBzmWUBBSfpGNUlhve
   w==;
X-CSE-ConnectionGUID: W7lHMRnwTayaJ1dtLBagJg==
X-CSE-MsgGUID: pUG6LIUjRqWw8M2wItD/cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67946886"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="67946886"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:12:34 -0800
X-CSE-ConnectionGUID: 1lZpbIPcQCulw5UBAe1Nwg==
X-CSE-MsgGUID: P/YxViS6SGuixzUxvac1WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="203380445"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Dec 2025 03:12:32 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVpSH-000000000Rl-3to1;
	Wed, 17 Dec 2025 11:12:29 +0000
Date: Wed, 17 Dec 2025 19:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2]
 drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol
 'ads_page_owner' was not declared. Should it be static?
Message-ID: <202512171930.FWNm3OS7-lkp@intel.com>
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
config: i386-randconfig-061-20251217 (https://download.01.org/0day-ci/archive/20251217/202512171930.FWNm3OS7-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171930.FWNm3OS7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171930.FWNm3OS7-lkp@intel.com/

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
