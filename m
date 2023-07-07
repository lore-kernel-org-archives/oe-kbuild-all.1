Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A217726
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 20:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688760733; x=1720296733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6jsFjPE6WOVxqzRf19OWApkzkZKGWE/KloDs1I4SFyI=;
  b=J2+YAetWueUC6apWhsnxf3X88nZXt8HUbXXTmo7N/OnLDbhCyqm5rQjc
   Y3GvqDlpfo+F5CnKKDJoxuBFXCQA5uRLyP92TjKJy/HjIQxGJwlNwH0+E
   e9GOPXZu6ghmDuaMBK4cUe/WLNHPcGTK33jljM3nqGd5FvkSQl0RMH5n/
   XqfysZXY65gEGg5BSriQzAAyobaC6roe8ATfQ7e8bMV9oF+gSv5ndENxm
   L4ExIOP2PmfvxOb2GXLq21XkBBINGdTzOPAOXmx0A1YqKBewP6oE0QIK1
   1XrfhwiwpOdCQkhz1htVXNAvdR/jxR3c8KkMPLtxL+16NLnrtYMG6QW6r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="364012847"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="364012847"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 13:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="785469127"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="785469127"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jul 2023 13:12:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHroG-0002Fe-1m;
	Fri, 07 Jul 2023 20:12:08 +0000
Date: Sat, 8 Jul 2023 04:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 13/37]
 arch/loongarch/include/asm/pgtable.h:341:17: error: implicit declaration of
 function 'set_pte_at'; did you mean 'set_pmd_at'?
Message-ID: <202307080436.gR49oUPx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   a357c8502e070a8a7aa2fa94492fd040ae053b78
commit: 4d8ff6824fca631b7236c305e3cd3aac0c831a88 [13/37] loongarch: Implement the new page table range API
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230708/202307080436.gR49oUPx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080436.gR49oUPx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080436.gR49oUPx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/loongarch/kernel/asm-offsets.c:9:
   arch/loongarch/include/asm/pgtable.h: In function 'pte_clear':
>> arch/loongarch/include/asm/pgtable.h:341:17: error: implicit declaration of function 'set_pte_at'; did you mean 'set_pmd_at'? [-Werror=implicit-function-declaration]
     341 |                 set_pte_at(mm, addr, ptep, __pte(_PAGE_GLOBAL));
         |                 ^~~~~~~~~~
         |                 set_pmd_at
   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/loongarch/kernel/asm-offsets.c:11:
   include/linux/cacheflush.h: At top level:
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
   arch/loongarch/kernel/asm-offsets.c:266:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     266 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:278:6: warning: no previous prototype for 'output_fgraph_ret_regs_defines' [-Wmissing-prototypes]
     278 | void output_fgraph_ret_regs_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +341 arch/loongarch/include/asm/pgtable.h

09cfefb7fa70c3 Huacai Chen 2022-05-31  336  
09cfefb7fa70c3 Huacai Chen 2022-05-31  337  static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
09cfefb7fa70c3 Huacai Chen 2022-05-31  338  {
09cfefb7fa70c3 Huacai Chen 2022-05-31  339  	/* Preserve global status for the pair */
09cfefb7fa70c3 Huacai Chen 2022-05-31  340  	if (pte_val(*ptep_buddy(ptep)) & _PAGE_GLOBAL)
09cfefb7fa70c3 Huacai Chen 2022-05-31 @341  		set_pte_at(mm, addr, ptep, __pte(_PAGE_GLOBAL));
09cfefb7fa70c3 Huacai Chen 2022-05-31  342  	else
09cfefb7fa70c3 Huacai Chen 2022-05-31  343  		set_pte_at(mm, addr, ptep, __pte(0));
09cfefb7fa70c3 Huacai Chen 2022-05-31  344  }
09cfefb7fa70c3 Huacai Chen 2022-05-31  345  

:::::: The code at line 341 was first introduced by commit
:::::: 09cfefb7fa70c3af011b0db0a513fd80b2f18abc LoongArch: Add memory management

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
