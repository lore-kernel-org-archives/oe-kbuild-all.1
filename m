Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E412170A23
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 23:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734910630; cv=none; b=azkkS5xywT+AaotsCsvDMt/CWgKueGg0lNRRyWh+ht6KiPlYkaipp029wzTLkklUky7BpqSFbVSfjrXzg9q2kXgTPJ+eT2gfvW9x8/8GDaUeTLIyzW7P2eWsSugjBdo57asBGlvqo6zt9PeM5YxzRAAPEHfUDndd48f8laPcM9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734910630; c=relaxed/simple;
	bh=wFFr5CN2DPzY0DBJXv5/cGfEGx3JqFC+wZbeaXEs3o0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdRxZivAxHeub39sshUn9i6HbEquQxvyGcKvmrPnUuDiqxLIBDzCqi/ALEoZnwMWwlGzngbDBQ70FRDeCZP98DS/IcLMW2sO3vG/qjOZ0BMbA9/ahGzJmPIIbfBMJGelmFPGUT1PBHaE4HmQUjp1F2eGX/O7QNXRVFd5WBBGlb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WG6yuiY0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WG6yuiY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734910628; x=1766446628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wFFr5CN2DPzY0DBJXv5/cGfEGx3JqFC+wZbeaXEs3o0=;
  b=WG6yuiY0S1qPrCfflvqHo44UFWbvTp588TSbZ0YfKCJfuR+NsZlgHpHE
   XoInDl71tJgql6Rp11Ham67qknWemsOst/3rHhZm2+65oVFSPv7/BrhK/
   +xXZ+GHgiNtOoQXPL+HGLEpbh+rdoJSI44Vp32ohoBCYSHLds0udybpXP
   8kuik030JtX9+STkPvmrHsatEkYAUMpioqyEJcmtKE4ErOwBWCseG3npv
   sAsV153YHE/unDTudXy7rYEW3NAcJIe4WYd//945MDngn09/VKzX2IA5F
   W3iILunhqVE6lIT2zlIGowqAHgi38fpo7SFsghSeLmdmdaCkwG0+Oq40G
   A==;
X-CSE-ConnectionGUID: m8atCKHXQyq6kge13lSqiA==
X-CSE-MsgGUID: MVU7GpQTT4eKUJ5oZ5Q0OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35258594"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35258594"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 15:37:08 -0800
X-CSE-ConnectionGUID: nrm4YoUuQda90A/VIoEbWA==
X-CSE-MsgGUID: fGF1dwGNRdmlIZNR6rs83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="129892736"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2024 15:37:06 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPVVQ-0003Gz-0W;
	Sun, 22 Dec 2024 23:37:04 +0000
Date: Mon, 23 Dec 2024 07:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: arch/sh/mm/cache-sh4.c:224:15: error: implicit declaration of
 function 'pte_offset_kernel'
Message-ID: <202412230702.CnrUBP57-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bbf9020becbfd8fc2c3da790855b7042fad455b
commit: 974b9b2c68f3d35a65e80af9657fe378d2439b60 mm: consolidate pte_index() and pte_offset_*() definitions
date:   4 years, 6 months ago
config: sh-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241223/202412230702.CnrUBP57-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230702.CnrUBP57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230702.CnrUBP57-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: error: arch/sh/include/mach-highlander: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/sh/include/mach-sdk7780: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/sh/include/mach-highlander: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/sh/include/mach-sdk7780: No such file or directory [-Werror=missing-include-dirs]
   arch/sh/mm/cache-sh4.c: In function 'flush_cache_one':
   arch/sh/mm/cache-sh4.c:98:31: error: 'cached_to_uncached' undeclared (first use in this function); did you mean 'jump_to_uncached'?
      98 |                 exec_offset = cached_to_uncached;
         |                               ^~~~~~~~~~~~~~~~~~
         |                               jump_to_uncached
   arch/sh/mm/cache-sh4.c:98:31: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/init.h:5,
                    from arch/sh/mm/cache-sh4.c:13:
   arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_mm':
   arch/sh/mm/cache-sh4.c:191:13: error: implicit declaration of function 'cpu_context'; did you mean 'put_io_context'? [-Werror=implicit-function-declaration]
     191 |         if (cpu_context(smp_processor_id(), mm) == NO_CONTEXT)
         |             ^~~~~~~~~~~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/sh/mm/cache-sh4.c:191:9: note: in expansion of macro 'if'
     191 |         if (cpu_context(smp_processor_id(), mm) == NO_CONTEXT)
         |         ^~
   arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_page':
   arch/sh/mm/cache-sh4.c:223:15: error: implicit declaration of function 'pmd_off' [-Werror=implicit-function-declaration]
     223 |         pmd = pmd_off(vma->vm_mm, address);
         |               ^~~~~~~
   arch/sh/mm/cache-sh4.c:223:13: error: assignment to 'pmd_t *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
     223 |         pmd = pmd_off(vma->vm_mm, address);
         |             ^
>> arch/sh/mm/cache-sh4.c:224:15: error: implicit declaration of function 'pte_offset_kernel' [-Werror=implicit-function-declaration]
     224 |         pte = pte_offset_kernel(pmd, address);
         |               ^~~~~~~~~~~~~~~~~
   arch/sh/mm/cache-sh4.c:224:13: error: assignment to 'pte_t *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
     224 |         pte = pte_offset_kernel(pmd, address);
         |             ^
   arch/sh/mm/cache-sh4.c: At top level:
   arch/sh/mm/cache-sh4.c:373:13: error: no previous prototype for 'sh4_cache_init' [-Werror=missing-prototypes]
     373 | void __init sh4_cache_init(void)
         |             ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/pte_offset_kernel +224 arch/sh/mm/cache-sh4.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  196  
^1da177e4c3f41 Linus Torvalds     2005-04-16  197  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  198   * Write back and invalidate I/D-caches for the page.
^1da177e4c3f41 Linus Torvalds     2005-04-16  199   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  200   * ADDR: Virtual Address (U0 address)
^1da177e4c3f41 Linus Torvalds     2005-04-16  201   * PFN: Physical page number
^1da177e4c3f41 Linus Torvalds     2005-04-16  202   */
f26b2a562b46ab Paul Mundt         2009-08-21  203  static void sh4_flush_cache_page(void *args)
^1da177e4c3f41 Linus Torvalds     2005-04-16  204  {
f26b2a562b46ab Paul Mundt         2009-08-21  205  	struct flusher_data *data = args;
f26b2a562b46ab Paul Mundt         2009-08-21  206  	struct vm_area_struct *vma;
deaef20e9789d9 Paul Mundt         2009-09-09  207  	struct page *page;
f26b2a562b46ab Paul Mundt         2009-08-21  208  	unsigned long address, pfn, phys;
deaef20e9789d9 Paul Mundt         2009-09-09  209  	int map_coherent = 0;
deaef20e9789d9 Paul Mundt         2009-09-09  210  	pmd_t *pmd;
deaef20e9789d9 Paul Mundt         2009-09-09  211  	pte_t *pte;
deaef20e9789d9 Paul Mundt         2009-09-09  212  	void *vaddr;
b638d0b921dc95 Richard Curnow     2006-09-27  213  
f26b2a562b46ab Paul Mundt         2009-08-21  214  	vma = data->vma;
abeaf33a410176 Paul Mundt         2009-10-16  215  	address = data->addr1 & PAGE_MASK;
f26b2a562b46ab Paul Mundt         2009-08-21  216  	pfn = data->addr2;
f26b2a562b46ab Paul Mundt         2009-08-21  217  	phys = pfn << PAGE_SHIFT;
deaef20e9789d9 Paul Mundt         2009-09-09  218  	page = pfn_to_page(pfn);
f26b2a562b46ab Paul Mundt         2009-08-21  219  
e7b8b7f16edc9b Paul Mundt         2009-08-15  220  	if (cpu_context(smp_processor_id(), vma->vm_mm) == NO_CONTEXT)
e7b8b7f16edc9b Paul Mundt         2009-08-15  221  		return;
e7b8b7f16edc9b Paul Mundt         2009-08-15  222  
e05c7b1f2bc4b7 Mike Rapoport      2020-06-08  223  	pmd = pmd_off(vma->vm_mm, address);
deaef20e9789d9 Paul Mundt         2009-09-09 @224  	pte = pte_offset_kernel(pmd, address);
deaef20e9789d9 Paul Mundt         2009-09-09  225  
deaef20e9789d9 Paul Mundt         2009-09-09  226  	/* If the page isn't present, there is nothing to do here. */
deaef20e9789d9 Paul Mundt         2009-09-09  227  	if (!(pte_val(*pte) & _PAGE_PRESENT))
deaef20e9789d9 Paul Mundt         2009-09-09  228  		return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  229  
deaef20e9789d9 Paul Mundt         2009-09-09  230  	if ((vma->vm_mm == current->active_mm))
deaef20e9789d9 Paul Mundt         2009-09-09  231  		vaddr = NULL;
deaef20e9789d9 Paul Mundt         2009-09-09  232  	else {
b638d0b921dc95 Richard Curnow     2006-09-27  233  		/*
deaef20e9789d9 Paul Mundt         2009-09-09  234  		 * Use kmap_coherent or kmap_atomic to do flushes for
deaef20e9789d9 Paul Mundt         2009-09-09  235  		 * another ASID than the current one.
b638d0b921dc95 Richard Curnow     2006-09-27  236  		 */
deaef20e9789d9 Paul Mundt         2009-09-09  237  		map_coherent = (current_cpu_data.dcache.n_aliases &&
55661fc1f105ed Paul Mundt         2010-12-01  238  			test_bit(PG_dcache_clean, &page->flags) &&
e1534ae95004d6 Kirill A. Shutemov 2016-01-15  239  			page_mapcount(page));
deaef20e9789d9 Paul Mundt         2009-09-09  240  		if (map_coherent)
deaef20e9789d9 Paul Mundt         2009-09-09  241  			vaddr = kmap_coherent(page, address);
deaef20e9789d9 Paul Mundt         2009-09-09  242  		else
bc3e11be88010e Cong Wang          2011-11-25  243  			vaddr = kmap_atomic(page);
deaef20e9789d9 Paul Mundt         2009-09-09  244  
deaef20e9789d9 Paul Mundt         2009-09-09  245  		address = (unsigned long)vaddr;
deaef20e9789d9 Paul Mundt         2009-09-09  246  	}
deaef20e9789d9 Paul Mundt         2009-09-09  247  
abeaf33a410176 Paul Mundt         2009-10-16  248  	flush_cache_one(CACHE_OC_ADDRESS_ARRAY |
deaef20e9789d9 Paul Mundt         2009-09-09  249  			(address & shm_align_mask), phys);
deaef20e9789d9 Paul Mundt         2009-09-09  250  
deaef20e9789d9 Paul Mundt         2009-09-09  251  	if (vma->vm_flags & VM_EXEC)
deaef20e9789d9 Paul Mundt         2009-09-09  252  		flush_icache_all();
deaef20e9789d9 Paul Mundt         2009-09-09  253  
deaef20e9789d9 Paul Mundt         2009-09-09  254  	if (vaddr) {
deaef20e9789d9 Paul Mundt         2009-09-09  255  		if (map_coherent)
deaef20e9789d9 Paul Mundt         2009-09-09  256  			kunmap_coherent(vaddr);
deaef20e9789d9 Paul Mundt         2009-09-09  257  		else
bc3e11be88010e Cong Wang          2011-11-25  258  			kunmap_atomic(vaddr);
^1da177e4c3f41 Linus Torvalds     2005-04-16  259  	}
b638d0b921dc95 Richard Curnow     2006-09-27  260  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  261  

:::::: The code at line 224 was first introduced by commit
:::::: deaef20e9789d93c06d2d3b5ffc99939814802ca sh: Rework sh4_flush_cache_page() for coherent kmap mapping.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
