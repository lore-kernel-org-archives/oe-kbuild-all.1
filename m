Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11C61BB3A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691596421; x=1723132421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dj676W2O9DJOKwFzZE82xJDQXseR2xDc1orVEpusYIU=;
  b=K7eGds0R0QDaQ53jxomDK+aDxaCaLCSmm4EIMdxzMTM/FMuHD+eRYvXf
   4XEeEKlnwT+5kwkLxSZpMLL1iKQiyZTcmkNoGcTGylgb0M3BiqsBgEoGE
   BZdjYZkdqbleGC0mzPv/qQVU2od9QbM9gg+noJ4ikQTMpmcHfNtCa2vRv
   VBS8KAkvZVtKV9OS9gDg8+6RJxLUN9ixproOx5QhAGow5hoRqJ/+5hsuC
   Mawq7/e3XRySz/BJcosc+N/KwSQFlhP0UyzgeG8BKTnICOiGRdrtDTwbA
   RaJARbwBuul0jR7snADY/v6ChDLBKturfEOReaVpscn4f2yUc5XWioxBq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361289688"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="361289688"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 08:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="735064884"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="735064884"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2023 08:53:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTlVA-0006DA-2A;
	Wed, 09 Aug 2023 15:53:36 +0000
Date: Wed, 9 Aug 2023 23:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2] mm/kfence/core.c:245:63:
 warning: dereferencing 'void *' pointer
Message-ID: <202308092315.gZSbZsFj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   1d8567fb084df07151b6dbf6337f7e909b3576f3
commit: 1d8567fb084df07151b6dbf6337f7e909b3576f3 [2/2] kfence: Use a const void * for page pool
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230809/202308092315.gZSbZsFj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092315.gZSbZsFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092315.gZSbZsFj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kfence/core.c:111:13: error: conflicting types for '__kfence_pool'; have 'const void *'
     111 | const void *__kfence_pool __read_mostly;
         |             ^~~~~~~~~~~~~
   In file included from mm/kfence/core.c:17:
   include/linux/kfence.h:28:14: note: previous declaration of '__kfence_pool' with type 'char *'
      28 | extern char *__kfence_pool;
         |              ^~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/arm/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from mm/kfence/core.c:11:
   mm/kfence/core.c:112:15: error: conflicting types for '__kfence_pool'; have 'const void *'
     112 | EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
         |               ^~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   mm/kfence/core.c:112:1: note: in expansion of macro 'EXPORT_SYMBOL'
     112 | EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
         | ^~~~~~~~~~~~~
   include/linux/kfence.h:28:14: note: previous declaration of '__kfence_pool' with type 'char *'
      28 | extern char *__kfence_pool;
         |              ^~~~~~~~~~~~~
   mm/kfence/core.c: In function 'metadata_to_pageaddr':
>> mm/kfence/core.c:245:63: warning: dereferencing 'void *' pointer
     245 |         unsigned long pageaddr = (unsigned long)&__kfence_pool[offset];
         |                                                               ^


vim +245 mm/kfence/core.c

3c81b3bb0a33e2 huangshaobo         2022-05-09  109  
0ce20dd840897b Alexander Potapenko 2021-02-25  110  /* The pool of pages used for guard pages and objects. */
1d8567fb084df0 Linus Walleij       2023-08-09  111  const void *__kfence_pool __read_mostly;
0ce20dd840897b Alexander Potapenko 2021-02-25 @112  EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
0ce20dd840897b Alexander Potapenko 2021-02-25  113  
0ce20dd840897b Alexander Potapenko 2021-02-25  114  /*
0ce20dd840897b Alexander Potapenko 2021-02-25  115   * Per-object metadata, with one-to-one mapping of object metadata to
0ce20dd840897b Alexander Potapenko 2021-02-25  116   * backing pages (in __kfence_pool).
0ce20dd840897b Alexander Potapenko 2021-02-25  117   */
0ce20dd840897b Alexander Potapenko 2021-02-25  118  static_assert(CONFIG_KFENCE_NUM_OBJECTS > 0);
0ce20dd840897b Alexander Potapenko 2021-02-25  119  struct kfence_metadata kfence_metadata[CONFIG_KFENCE_NUM_OBJECTS];
0ce20dd840897b Alexander Potapenko 2021-02-25  120  
0ce20dd840897b Alexander Potapenko 2021-02-25  121  /* Freelist with available objects. */
0ce20dd840897b Alexander Potapenko 2021-02-25  122  static struct list_head kfence_freelist = LIST_HEAD_INIT(kfence_freelist);
0ce20dd840897b Alexander Potapenko 2021-02-25  123  static DEFINE_RAW_SPINLOCK(kfence_freelist_lock); /* Lock protecting freelist. */
0ce20dd840897b Alexander Potapenko 2021-02-25  124  
07e8481d3c38f4 Marco Elver         2021-11-05  125  /*
07e8481d3c38f4 Marco Elver         2021-11-05  126   * The static key to set up a KFENCE allocation; or if static keys are not used
07e8481d3c38f4 Marco Elver         2021-11-05  127   * to gate allocations, to avoid a load and compare if KFENCE is disabled.
07e8481d3c38f4 Marco Elver         2021-11-05  128   */
0ce20dd840897b Alexander Potapenko 2021-02-25  129  DEFINE_STATIC_KEY_FALSE(kfence_allocation_key);
0ce20dd840897b Alexander Potapenko 2021-02-25  130  
0ce20dd840897b Alexander Potapenko 2021-02-25  131  /* Gates the allocation, ensuring only one succeeds in a given period. */
0ce20dd840897b Alexander Potapenko 2021-02-25  132  atomic_t kfence_allocation_gate = ATOMIC_INIT(1);
0ce20dd840897b Alexander Potapenko 2021-02-25  133  
08f6b10630f284 Marco Elver         2021-11-05  134  /*
08f6b10630f284 Marco Elver         2021-11-05  135   * A Counting Bloom filter of allocation coverage: limits currently covered
08f6b10630f284 Marco Elver         2021-11-05  136   * allocations of the same source filling up the pool.
08f6b10630f284 Marco Elver         2021-11-05  137   *
08f6b10630f284 Marco Elver         2021-11-05  138   * Assuming a range of 15%-85% unique allocations in the pool at any point in
08f6b10630f284 Marco Elver         2021-11-05  139   * time, the below parameters provide a probablity of 0.02-0.33 for false
08f6b10630f284 Marco Elver         2021-11-05  140   * positive hits respectively:
08f6b10630f284 Marco Elver         2021-11-05  141   *
08f6b10630f284 Marco Elver         2021-11-05  142   *	P(alloc_traces) = (1 - e^(-HNUM * (alloc_traces / SIZE)) ^ HNUM
08f6b10630f284 Marco Elver         2021-11-05  143   */
08f6b10630f284 Marco Elver         2021-11-05  144  #define ALLOC_COVERED_HNUM	2
08f6b10630f284 Marco Elver         2021-11-05  145  #define ALLOC_COVERED_ORDER	(const_ilog2(CONFIG_KFENCE_NUM_OBJECTS) + 2)
08f6b10630f284 Marco Elver         2021-11-05  146  #define ALLOC_COVERED_SIZE	(1 << ALLOC_COVERED_ORDER)
08f6b10630f284 Marco Elver         2021-11-05  147  #define ALLOC_COVERED_HNEXT(h)	hash_32(h, ALLOC_COVERED_ORDER)
08f6b10630f284 Marco Elver         2021-11-05  148  #define ALLOC_COVERED_MASK	(ALLOC_COVERED_SIZE - 1)
08f6b10630f284 Marco Elver         2021-11-05  149  static atomic_t alloc_covered[ALLOC_COVERED_SIZE];
08f6b10630f284 Marco Elver         2021-11-05  150  
08f6b10630f284 Marco Elver         2021-11-05  151  /* Stack depth used to determine uniqueness of an allocation. */
08f6b10630f284 Marco Elver         2021-11-05  152  #define UNIQUE_ALLOC_STACK_DEPTH ((size_t)8)
08f6b10630f284 Marco Elver         2021-11-05  153  
08f6b10630f284 Marco Elver         2021-11-05  154  /*
08f6b10630f284 Marco Elver         2021-11-05  155   * Randomness for stack hashes, making the same collisions across reboots and
08f6b10630f284 Marco Elver         2021-11-05  156   * different machines less likely.
08f6b10630f284 Marco Elver         2021-11-05  157   */
08f6b10630f284 Marco Elver         2021-11-05  158  static u32 stack_hash_seed __ro_after_init;
08f6b10630f284 Marco Elver         2021-11-05  159  
0ce20dd840897b Alexander Potapenko 2021-02-25  160  /* Statistics counters for debugfs. */
0ce20dd840897b Alexander Potapenko 2021-02-25  161  enum kfence_counter_id {
0ce20dd840897b Alexander Potapenko 2021-02-25  162  	KFENCE_COUNTER_ALLOCATED,
0ce20dd840897b Alexander Potapenko 2021-02-25  163  	KFENCE_COUNTER_ALLOCS,
0ce20dd840897b Alexander Potapenko 2021-02-25  164  	KFENCE_COUNTER_FREES,
0ce20dd840897b Alexander Potapenko 2021-02-25  165  	KFENCE_COUNTER_ZOMBIES,
0ce20dd840897b Alexander Potapenko 2021-02-25  166  	KFENCE_COUNTER_BUGS,
9a19aeb5665068 Marco Elver         2021-11-05  167  	KFENCE_COUNTER_SKIP_INCOMPAT,
9a19aeb5665068 Marco Elver         2021-11-05  168  	KFENCE_COUNTER_SKIP_CAPACITY,
08f6b10630f284 Marco Elver         2021-11-05  169  	KFENCE_COUNTER_SKIP_COVERED,
0ce20dd840897b Alexander Potapenko 2021-02-25  170  	KFENCE_COUNTER_COUNT,
0ce20dd840897b Alexander Potapenko 2021-02-25  171  };
0ce20dd840897b Alexander Potapenko 2021-02-25  172  static atomic_long_t counters[KFENCE_COUNTER_COUNT];
0ce20dd840897b Alexander Potapenko 2021-02-25  173  static const char *const counter_names[] = {
0ce20dd840897b Alexander Potapenko 2021-02-25  174  	[KFENCE_COUNTER_ALLOCATED]	= "currently allocated",
0ce20dd840897b Alexander Potapenko 2021-02-25  175  	[KFENCE_COUNTER_ALLOCS]		= "total allocations",
0ce20dd840897b Alexander Potapenko 2021-02-25  176  	[KFENCE_COUNTER_FREES]		= "total frees",
0ce20dd840897b Alexander Potapenko 2021-02-25  177  	[KFENCE_COUNTER_ZOMBIES]	= "zombie allocations",
0ce20dd840897b Alexander Potapenko 2021-02-25  178  	[KFENCE_COUNTER_BUGS]		= "total bugs",
9a19aeb5665068 Marco Elver         2021-11-05  179  	[KFENCE_COUNTER_SKIP_INCOMPAT]	= "skipped allocations (incompatible)",
9a19aeb5665068 Marco Elver         2021-11-05  180  	[KFENCE_COUNTER_SKIP_CAPACITY]	= "skipped allocations (capacity)",
08f6b10630f284 Marco Elver         2021-11-05  181  	[KFENCE_COUNTER_SKIP_COVERED]	= "skipped allocations (covered)",
0ce20dd840897b Alexander Potapenko 2021-02-25  182  };
0ce20dd840897b Alexander Potapenko 2021-02-25  183  static_assert(ARRAY_SIZE(counter_names) == KFENCE_COUNTER_COUNT);
0ce20dd840897b Alexander Potapenko 2021-02-25  184  
0ce20dd840897b Alexander Potapenko 2021-02-25  185  /* === Internals ============================================================ */
0ce20dd840897b Alexander Potapenko 2021-02-25  186  
08f6b10630f284 Marco Elver         2021-11-05  187  static inline bool should_skip_covered(void)
08f6b10630f284 Marco Elver         2021-11-05  188  {
08f6b10630f284 Marco Elver         2021-11-05  189  	unsigned long thresh = (CONFIG_KFENCE_NUM_OBJECTS * kfence_skip_covered_thresh) / 100;
08f6b10630f284 Marco Elver         2021-11-05  190  
08f6b10630f284 Marco Elver         2021-11-05  191  	return atomic_long_read(&counters[KFENCE_COUNTER_ALLOCATED]) > thresh;
08f6b10630f284 Marco Elver         2021-11-05  192  }
08f6b10630f284 Marco Elver         2021-11-05  193  
08f6b10630f284 Marco Elver         2021-11-05  194  static u32 get_alloc_stack_hash(unsigned long *stack_entries, size_t num_entries)
08f6b10630f284 Marco Elver         2021-11-05  195  {
08f6b10630f284 Marco Elver         2021-11-05  196  	num_entries = min(num_entries, UNIQUE_ALLOC_STACK_DEPTH);
08f6b10630f284 Marco Elver         2021-11-05  197  	num_entries = filter_irq_stacks(stack_entries, num_entries);
08f6b10630f284 Marco Elver         2021-11-05  198  	return jhash(stack_entries, num_entries * sizeof(stack_entries[0]), stack_hash_seed);
08f6b10630f284 Marco Elver         2021-11-05  199  }
08f6b10630f284 Marco Elver         2021-11-05  200  
08f6b10630f284 Marco Elver         2021-11-05  201  /*
08f6b10630f284 Marco Elver         2021-11-05  202   * Adds (or subtracts) count @val for allocation stack trace hash
08f6b10630f284 Marco Elver         2021-11-05  203   * @alloc_stack_hash from Counting Bloom filter.
08f6b10630f284 Marco Elver         2021-11-05  204   */
08f6b10630f284 Marco Elver         2021-11-05  205  static void alloc_covered_add(u32 alloc_stack_hash, int val)
08f6b10630f284 Marco Elver         2021-11-05  206  {
08f6b10630f284 Marco Elver         2021-11-05  207  	int i;
08f6b10630f284 Marco Elver         2021-11-05  208  
08f6b10630f284 Marco Elver         2021-11-05  209  	for (i = 0; i < ALLOC_COVERED_HNUM; i++) {
08f6b10630f284 Marco Elver         2021-11-05  210  		atomic_add(val, &alloc_covered[alloc_stack_hash & ALLOC_COVERED_MASK]);
08f6b10630f284 Marco Elver         2021-11-05  211  		alloc_stack_hash = ALLOC_COVERED_HNEXT(alloc_stack_hash);
08f6b10630f284 Marco Elver         2021-11-05  212  	}
08f6b10630f284 Marco Elver         2021-11-05  213  }
08f6b10630f284 Marco Elver         2021-11-05  214  
08f6b10630f284 Marco Elver         2021-11-05  215  /*
08f6b10630f284 Marco Elver         2021-11-05  216   * Returns true if the allocation stack trace hash @alloc_stack_hash is
08f6b10630f284 Marco Elver         2021-11-05  217   * currently contained (non-zero count) in Counting Bloom filter.
08f6b10630f284 Marco Elver         2021-11-05  218   */
08f6b10630f284 Marco Elver         2021-11-05  219  static bool alloc_covered_contains(u32 alloc_stack_hash)
08f6b10630f284 Marco Elver         2021-11-05  220  {
08f6b10630f284 Marco Elver         2021-11-05  221  	int i;
08f6b10630f284 Marco Elver         2021-11-05  222  
08f6b10630f284 Marco Elver         2021-11-05  223  	for (i = 0; i < ALLOC_COVERED_HNUM; i++) {
08f6b10630f284 Marco Elver         2021-11-05  224  		if (!atomic_read(&alloc_covered[alloc_stack_hash & ALLOC_COVERED_MASK]))
08f6b10630f284 Marco Elver         2021-11-05  225  			return false;
08f6b10630f284 Marco Elver         2021-11-05  226  		alloc_stack_hash = ALLOC_COVERED_HNEXT(alloc_stack_hash);
08f6b10630f284 Marco Elver         2021-11-05  227  	}
08f6b10630f284 Marco Elver         2021-11-05  228  
08f6b10630f284 Marco Elver         2021-11-05  229  	return true;
08f6b10630f284 Marco Elver         2021-11-05  230  }
08f6b10630f284 Marco Elver         2021-11-05  231  
0ce20dd840897b Alexander Potapenko 2021-02-25  232  static bool kfence_protect(unsigned long addr)
0ce20dd840897b Alexander Potapenko 2021-02-25  233  {
0ce20dd840897b Alexander Potapenko 2021-02-25  234  	return !KFENCE_WARN_ON(!kfence_protect_page(ALIGN_DOWN(addr, PAGE_SIZE), true));
0ce20dd840897b Alexander Potapenko 2021-02-25  235  }
0ce20dd840897b Alexander Potapenko 2021-02-25  236  
0ce20dd840897b Alexander Potapenko 2021-02-25  237  static bool kfence_unprotect(unsigned long addr)
0ce20dd840897b Alexander Potapenko 2021-02-25  238  {
0ce20dd840897b Alexander Potapenko 2021-02-25  239  	return !KFENCE_WARN_ON(!kfence_protect_page(ALIGN_DOWN(addr, PAGE_SIZE), false));
0ce20dd840897b Alexander Potapenko 2021-02-25  240  }
0ce20dd840897b Alexander Potapenko 2021-02-25  241  
0ce20dd840897b Alexander Potapenko 2021-02-25  242  static inline unsigned long metadata_to_pageaddr(const struct kfence_metadata *meta)
0ce20dd840897b Alexander Potapenko 2021-02-25  243  {
0ce20dd840897b Alexander Potapenko 2021-02-25  244  	unsigned long offset = (meta - kfence_metadata + 1) * PAGE_SIZE * 2;
0ce20dd840897b Alexander Potapenko 2021-02-25 @245  	unsigned long pageaddr = (unsigned long)&__kfence_pool[offset];
0ce20dd840897b Alexander Potapenko 2021-02-25  246  
0ce20dd840897b Alexander Potapenko 2021-02-25  247  	/* The checks do not affect performance; only called from slow-paths. */
0ce20dd840897b Alexander Potapenko 2021-02-25  248  
0ce20dd840897b Alexander Potapenko 2021-02-25  249  	/* Only call with a pointer into kfence_metadata. */
0ce20dd840897b Alexander Potapenko 2021-02-25  250  	if (KFENCE_WARN_ON(meta < kfence_metadata ||
0ce20dd840897b Alexander Potapenko 2021-02-25  251  			   meta >= kfence_metadata + CONFIG_KFENCE_NUM_OBJECTS))
0ce20dd840897b Alexander Potapenko 2021-02-25  252  		return 0;
0ce20dd840897b Alexander Potapenko 2021-02-25  253  
0ce20dd840897b Alexander Potapenko 2021-02-25  254  	/*
0ce20dd840897b Alexander Potapenko 2021-02-25  255  	 * This metadata object only ever maps to 1 page; verify that the stored
0ce20dd840897b Alexander Potapenko 2021-02-25  256  	 * address is in the expected range.
0ce20dd840897b Alexander Potapenko 2021-02-25  257  	 */
0ce20dd840897b Alexander Potapenko 2021-02-25  258  	if (KFENCE_WARN_ON(ALIGN_DOWN(meta->addr, PAGE_SIZE) != pageaddr))
0ce20dd840897b Alexander Potapenko 2021-02-25  259  		return 0;
0ce20dd840897b Alexander Potapenko 2021-02-25  260  
0ce20dd840897b Alexander Potapenko 2021-02-25  261  	return pageaddr;
0ce20dd840897b Alexander Potapenko 2021-02-25  262  }
0ce20dd840897b Alexander Potapenko 2021-02-25  263  

:::::: The code at line 245 was first introduced by commit
:::::: 0ce20dd840897b12ae70869c69f1ba34d6d16965 mm: add Kernel Electric-Fence infrastructure

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
