Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E48257448
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 17:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710325; cv=none; b=bVZ+YV9K7qQ8ehu+Kh1Q1scND6yY5BE7n7SBC4qf4OzvPruRJZdeRFbGECRr1HtNLrAy8nNF3WaAGHvaceiOH48I+vtXKpu0THTxn5qPP6Cd4edlqTtS55QLbMRk1bKs9rHlMfnjwtvjFrcx439/viFj3V3Dj2cwa9ivw3mfxBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710325; c=relaxed/simple;
	bh=Hc9gC0C5P4Um8KKMeXMgFEY9OEi276BuvUEKld+hnBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eNInjEDbawWFPcyTasufPLmYALTWNStcepqip7zAOYAhemM8jvcdS2J3djUozbdFIkS6HmX89oyAz9/fGuDj6mWi7EnqwNp6UOJylPsdaFq5nUAT8rItMbVAoyO9+td23S+m0FFtwFYUgRUb1GH8kBm/d/iM1evZecPHf/PN0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBf1hcAn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBf1hcAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755710323; x=1787246323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hc9gC0C5P4Um8KKMeXMgFEY9OEi276BuvUEKld+hnBE=;
  b=LBf1hcAnw3ewddrrwIcg4HSZGgxYV0bl5oBJHJuSkvk+VPOXR7yudHu5
   eRJ4tA6RtwO3CdhCVq2bTVFk3FcRyTwMISM8zr6dGpF5tg6atZW+86M4k
   z/UdZ5biINDONRFOdp9U1o7ZgCCLhxJ9qMgEe2BCMH8fBStwWHIZaEsbH
   N7OXECe3ncX2rZlFcZoJG3GGDy4UzAFfHi66+z9jpI5UIBgCoZEd2R2vU
   TqsqW5tLz+gR+mfhZv/1DOPC1srJGBJxFPTpwI5Kc4SJBWZjzhwImWDr6
   hObdzL4xRlZmQnsmE4RBkHIVIdSYI2gRHWrIrLqS5zB0+uCD0sqEGwXNn
   g==;
X-CSE-ConnectionGUID: FElKBMHoQxaUjyOKn/kUWg==
X-CSE-MsgGUID: 7/LuEKu8RT+Z37+gjA8zsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57015450"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57015450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 10:18:41 -0700
X-CSE-ConnectionGUID: ydTA4AneRB2+JuwNRiwAuw==
X-CSE-MsgGUID: Hl/afEL9QWayezwX/No3eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="173530023"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2025 10:18:40 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uomSL-000JXB-2l;
	Wed, 20 Aug 2025 17:18:37 +0000
Date: Thu, 21 Aug 2025 01:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nth_page /35] arch/mips/mm/cache.c:125:15: error:
 '__flush_dcache_folio' undeclared here (not in a function); did you mean
 'flush_dcache_folio'?
Message-ID: <202508210156.ijeIO4Jv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   08edfb2d6483056d06ad759516674898baa4cf1f
commit: f2cda36d6e625baed56fbc2ed4ff81e1ab9e075b [/35] mips: mm: convert __flush_dcache_pages() to __flush_dcache_folio_pages()
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20250821/202508210156.ijeIO4Jv-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210156.ijeIO4Jv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210156.ijeIO4Jv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from arch/mips/mm/cache.c:9:
>> arch/mips/mm/cache.c:125:15: error: '__flush_dcache_folio' undeclared here (not in a function); did you mean 'flush_dcache_folio'?
     125 | EXPORT_SYMBOL(__flush_dcache_folio);
         |               ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:89:41: note: in expansion of macro '_EXPORT_SYMBOL'
      89 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   arch/mips/mm/cache.c:125:1: note: in expansion of macro 'EXPORT_SYMBOL'
     125 | EXPORT_SYMBOL(__flush_dcache_folio);
         | ^~~~~~~~~~~~~


vim +125 arch/mips/mm/cache.c

   > 9	#include <linux/fs.h>
    10	#include <linux/fcntl.h>
    11	#include <linux/kernel.h>
    12	#include <linux/linkage.h>
    13	#include <linux/export.h>
    14	#include <linux/sched.h>
    15	#include <linux/syscalls.h>
    16	#include <linux/mm.h>
    17	#include <linux/highmem.h>
    18	#include <linux/pagemap.h>
    19	
    20	#include <asm/bcache.h>
    21	#include <asm/cacheflush.h>
    22	#include <asm/processor.h>
    23	#include <asm/cpu.h>
    24	#include <asm/cpu-features.h>
    25	#include <asm/setup.h>
    26	#include <asm/pgtable.h>
    27	
    28	/* Cache operations. */
    29	void (*flush_cache_all)(void);
    30	void (*__flush_cache_all)(void);
    31	EXPORT_SYMBOL_GPL(__flush_cache_all);
    32	void (*flush_cache_mm)(struct mm_struct *mm);
    33	void (*flush_cache_range)(struct vm_area_struct *vma, unsigned long start,
    34		unsigned long end);
    35	void (*flush_cache_page)(struct vm_area_struct *vma, unsigned long page,
    36		unsigned long pfn);
    37	void (*flush_icache_range)(unsigned long start, unsigned long end);
    38	EXPORT_SYMBOL_GPL(flush_icache_range);
    39	void (*local_flush_icache_range)(unsigned long start, unsigned long end);
    40	EXPORT_SYMBOL_GPL(local_flush_icache_range);
    41	void (*__flush_icache_user_range)(unsigned long start, unsigned long end);
    42	void (*__local_flush_icache_user_range)(unsigned long start, unsigned long end);
    43	EXPORT_SYMBOL_GPL(__local_flush_icache_user_range);
    44	
    45	void (*__flush_cache_vmap)(void);
    46	void (*__flush_cache_vunmap)(void);
    47	
    48	void (*__flush_kernel_vmap_range)(unsigned long vaddr, int size);
    49	EXPORT_SYMBOL_GPL(__flush_kernel_vmap_range);
    50	
    51	/* MIPS specific cache operations */
    52	void (*flush_data_cache_page)(unsigned long addr);
    53	void (*flush_icache_all)(void);
    54	
    55	EXPORT_SYMBOL(flush_data_cache_page);
    56	EXPORT_SYMBOL(flush_icache_all);
    57	
    58	/*
    59	 * Dummy cache handling routine
    60	 */
    61	
    62	void cache_noop(void) {}
    63	
    64	#ifdef CONFIG_BOARD_SCACHE
    65	
    66	static struct bcache_ops no_sc_ops = {
    67		.bc_enable = (void *)cache_noop,
    68		.bc_disable = (void *)cache_noop,
    69		.bc_wback_inv = (void *)cache_noop,
    70		.bc_inv = (void *)cache_noop
    71	};
    72	
    73	struct bcache_ops *bcops = &no_sc_ops;
    74	#endif
    75	
    76	#ifdef CONFIG_DMA_NONCOHERENT
    77	
    78	/* DMA cache operations. */
    79	void (*_dma_cache_wback_inv)(unsigned long start, unsigned long size);
    80	void (*_dma_cache_wback)(unsigned long start, unsigned long size);
    81	void (*_dma_cache_inv)(unsigned long start, unsigned long size);
    82	
    83	#endif /* CONFIG_DMA_NONCOHERENT */
    84	
    85	/*
    86	 * We could optimize the case where the cache argument is not BCACHE but
    87	 * that seems very atypical use ...
    88	 */
    89	SYSCALL_DEFINE3(cacheflush, unsigned long, addr, unsigned long, bytes,
    90		unsigned int, cache)
    91	{
    92		if (bytes == 0)
    93			return 0;
    94		if (!access_ok((void __user *) addr, bytes))
    95			return -EFAULT;
    96	
    97		__flush_icache_user_range(addr, addr + bytes);
    98	
    99		return 0;
   100	}
   101	
   102	void __flush_dcache_folio_pages(struct folio *folio, struct page *page,
   103			unsigned int nr)
   104	{
   105		struct address_space *mapping = folio_flush_mapping(folio);
   106		unsigned long addr;
   107		unsigned int i;
   108	
   109		if (mapping && !mapping_mapped(mapping)) {
   110			folio_set_dcache_dirty(folio);
   111			return;
   112		}
   113	
   114		/*
   115		 * We could delay the flush for the !folio_mapping case too.  But that
   116		 * case is for exec env/arg pages and those are %99 certainly going to
   117		 * get faulted into the tlb (and thus flushed) anyways.
   118		 */
   119		for (i = 0; i < nr; i++) {
   120			addr = (unsigned long)kmap_local_page(page + i);
   121			flush_data_cache_page(addr);
   122			kunmap_local((void *)addr);
   123		}
   124	}
 > 125	EXPORT_SYMBOL(__flush_dcache_folio);
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
