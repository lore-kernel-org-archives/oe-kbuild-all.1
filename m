Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE131774B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 23:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688771415; x=1720307415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bkm9BHpbJyODZ5Zpunq4o5En3rTQAIvsFmdNYJjCtB8=;
  b=GmUIXjmJSpe1mHZXXIxWrhyYmulWKBnVKJugH0H5rKnMk/9E5QktdA8l
   dZm4DsKxpZBO301ixcZxJ2bpQyKPqBkt0XwoQarTUAuYTyjzG2Msk11G6
   wvSPTMAfDFHMiCgXouMi6OCgw3AclfPFWhmDTmMPqiLIdJ74dS3DOxnkf
   9TD0cAdpKWgA7Q+gSaGlHbziS5C+Tjc5R+w5I9b5G9t0cClVAGVTk3y4R
   fTjQu6zYMasUO7yqit4mH3GVsW+0TJ4roQHOZNdKKFxgKL2e/4pt6mRvA
   YW1pCitFeVvoZDHxlI/wrwAA0+0cSNX8PESOCH9xUtzFfjmldQPB18aR+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="343586421"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="343586421"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 16:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="785506742"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="785506742"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jul 2023 16:10:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHuaa-0002Mk-0S;
	Fri, 07 Jul 2023 23:10:12 +0000
Date: Sat, 8 Jul 2023 07:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 14/38]
 arch/loongarch/include/asm/cacheflush.h:53:57: error: expected identifier or
 '(' before 'do'
Message-ID: <202307080759.hhJOJH83-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   72c34bd0b2a432506d992bdc1e3a89260461667d
commit: f57e47780e45bbe3d5618e1854b16b17d9be7d9a [14/38] loongarch: Implement the new page table range API
config: loongarch-randconfig-r013-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080759.hhJOJH83-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080759.hhJOJH83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080759.hhJOJH83-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/loongarch/kernel/asm-offsets.c:11:
>> arch/loongarch/include/asm/cacheflush.h:53:57: error: expected identifier or '(' before 'do'
      53 | #define flush_dcache_folio(folio)                       do { } while (0)
         |                                                         ^~
   include/linux/cacheflush.h:14:20: note: in expansion of macro 'flush_dcache_folio'
      14 | static inline void flush_dcache_folio(struct folio *folio)
         |                    ^~~~~~~~~~~~~~~~~~
>> arch/loongarch/include/asm/cacheflush.h:53:64: error: expected identifier or '(' before 'while'
      53 | #define flush_dcache_folio(folio)                       do { } while (0)
         |                                                                ^~~~~
   include/linux/cacheflush.h:14:20: note: in expansion of macro 'flush_dcache_folio'
      14 | static inline void flush_dcache_folio(struct folio *folio)
         |                    ^~~~~~~~~~~~~~~~~~
>> include/linux/cacheflush.h:17: warning: "flush_dcache_folio" redefined
      17 | #define flush_dcache_folio flush_dcache_folio
         | 
   arch/loongarch/include/asm/cacheflush.h:53: note: this is the location of the previous definition
      53 | #define flush_dcache_folio(folio)                       do { } while (0)
         | 
   arch/loongarch/kernel/asm-offsets.c:17:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      17 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:64:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      64 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:79:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      79 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:95:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      95 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:138:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     138 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:178:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     178 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:210:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     210 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:218:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     218 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:256:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     256 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/loongarch/kernel/asm-offsets.s] Error 1 shuffle=4376737
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=4376737
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=4376737
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=4376737
   make: Target 'prepare' not remade because of errors.


vim +53 arch/loongarch/include/asm/cacheflush.h

    41	
    42	#define flush_cache_all()				do { } while (0)
    43	#define flush_cache_mm(mm)				do { } while (0)
    44	#define flush_cache_dup_mm(mm)				do { } while (0)
    45	#define flush_cache_range(vma, start, end)		do { } while (0)
    46	#define flush_cache_page(vma, vmaddr, pfn)		do { } while (0)
    47	#define flush_cache_vmap(start, end)			do { } while (0)
    48	#define flush_cache_vunmap(start, end)			do { } while (0)
    49	#define flush_icache_page(vma, page)			do { } while (0)
    50	#define flush_icache_pages(vma, page)			do { } while (0)
    51	#define flush_icache_user_page(vma, page, addr, len)	do { } while (0)
    52	#define flush_dcache_page(page)				do { } while (0)
  > 53	#define flush_dcache_folio(folio)			do { } while (0)
    54	#define flush_dcache_mmap_lock(mapping)			do { } while (0)
    55	#define flush_dcache_mmap_unlock(mapping)		do { } while (0)
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
