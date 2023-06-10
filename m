Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A78BA4E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686401980; x=1717937980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zsy8LfKMHmaVfXo4NxebLwmlaYCmYvjvU+0KumabJZM=;
  b=HDqheXiZ0Dmb3AtzDMvamoN4LnGgw80Kcu2cxgM3hcsYbou/RKgvkysY
   f8TdT8s8VIbBxWluFw18nff20ykj5Jw8ZpkRavwttP5MHRzfGxgTeNow7
   zZcf5TYksasq2LJ+mBaZ7ICPlxT/qGGm7zi0YnKyPT2dzvSZfetina7Si
   JhrGR9z++oqsCddhTcKqvQR1skMRB1SLMpEs0TTWSpb5LR6H7vjULIfVl
   07nTBgZPP2n/RTqPjAgIfEWxJYA4vXpdZzYHrDEBkNGJXK1Cqz042DpXI
   IwHNaNgOquGz3Ck+rS72VFn48I3ZUN8OFFI1JFzWC8kceEh9/5tq6Kh45
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="338122784"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="338122784"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 05:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="957451083"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="957451083"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2023 05:59:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7yBt-000A64-2A;
	Sat, 10 Jun 2023 12:59:37 +0000
Date: Sat, 10 Jun 2023 20:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Yogesh Lal <quic_ylal@quicinc.com>,
	Elliot Berman <eberman@codeaurora.org>
Subject: [sudeep-holla:android13-5.15/ffa 1113/4062]
 drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol
 'ads_page_owner' was not declared. Should it be static?
Message-ID: <202306102044.5xOHAvPc-lkp@intel.com>
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
config: i386-randconfig-s031-20230610 (https://download.01.org/0day-ci/archive/20230610/202306102044.5xOHAvPc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=b2df67a932b5cbd6535de9f1a6e63004992ad014
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla android13-5.15/ffa
        git checkout b2df67a932b5cbd6535de9f1a6e63004992ad014
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306102044.5xOHAvPc-lkp@intel.com/

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
