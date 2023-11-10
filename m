Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87262B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 00:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXcvXBiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699577361; x=1731113361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zgfTN0TZEGmYLF5W0HanA1V7XSIVaeMhBLdeiribmps=;
  b=EXcvXBiZfnBdLGAa/iZUNjeSRjC+ssR32XKCJN7859JlZvIcDtwq4huz
   lh5BT2NQJWlxKuUp4qVPjANsI0dj2EdAXtw0G8Kx1StukC2W/jy+fd/9/
   JV54LQU1h7rcjvVpsQ0VG0DmIup1A1iRzO9+qC5xqxsxLrCQBkIs8ejoo
   KQ6kexhYq7sIVDYI4Kl3JyXsjBcRwIcQj83u5oUAGAxGCe8QxF/NIzK+/
   NLWof4boPJ5/oeaMbrztUK2wWM7Hau8D1m/1mf3isCTk6t0x1uCY5D6Mk
   MdcVNoq5hr7HuSEOUMRoduRLucJ28Z3i/BeAtQq9D9URnIEROOAFcQx9q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380497759"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="380497759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 16:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="11319474"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2023 16:49:20 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Fi0-0009JC-1n;
	Fri, 10 Nov 2023 00:49:16 +0000
Date: Fri, 10 Nov 2023 08:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Yogesh Lal <quic_ylal@quicinc.com>,
	Elliot Berman <eberman@codeaurora.org>
Subject: [sudeep-holla:android13-5.15/ffa 1113/4062]
 drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol
 'ads_page_owner' was not declared. Should it be static?
Message-ID: <202311100822.JBecBqtk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [1113/4062] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231110/202311100822.JBecBqtk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100822.JBecBqtk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100822.JBecBqtk-lkp@intel.com/

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
