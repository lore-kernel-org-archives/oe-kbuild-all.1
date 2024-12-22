Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E4E78F45
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 07:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734851199; cv=none; b=dSC/8aZYQB8lKm4/faPv+x0pLzyx9n8CRjEx407rPIxnSheN8TpgFtpUQV0O40y3P1yVNeB8mpUlnYGjVo6caftZnCFpetF4pZXY9pN5GWUXUNB1ccY0YL09JdLJ6/C/CwV4pLQrskPY4rDUkhj6Buwbol5OX8nx9hvDwdSd/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734851199; c=relaxed/simple;
	bh=Dlj7j408Rj5pnROfE461rnMR5pdwG2ljr5dsMldvvk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpw7jcvi1dumoUBYSpe8M/01FDNE6+6Ep3s1c0iOMUZM9/HxDX7SU3pXzm3sEcEojJ2Da1zywBOtvhXJmO8u5eqCsLkH+lEseSSiTETYCO4dexi6Exn6ge6V3XOOS2eU14+LZXJcIRQK0V5HD8j12C7x70635qTMPN8KnQCehbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHLLWfdB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHLLWfdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734851197; x=1766387197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dlj7j408Rj5pnROfE461rnMR5pdwG2ljr5dsMldvvk8=;
  b=ZHLLWfdBQHHqniIR98IqHa7mih6HvKWFatkwIOVv4L/yKSGECvM75rhl
   1fXQd8zQT10E9XWG4wru7eBwtejMou5bxw7qmwdKhU9uoDCgKkiEAukx9
   8NE+0Dog8dSCTRTZMnWwQbLhoCMR8SjGE4lS27/KnGABhnnfIjdPiJoUT
   oTB2zrh5iHrYe4J+xYwDvU1bS5puh7v6GBIDbdRD7ijXT2FaO1GdMWE2v
   eBbrrFbzOHqp+oufdkdLUU9cUzJJuol2W4MaZdGG2+VMiwefGrgbp3hR0
   3r0S/cEEKw0uAzt0OS2MkqIQyPOlZrbZv4Y+GsDYYmZcu+rczfSGkShLO
   w==;
X-CSE-ConnectionGUID: LGzJaLPJQDWaMDxMblGwFA==
X-CSE-MsgGUID: 8Ewt8mPGRWGEh4ACYkB/PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="60730263"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="60730263"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 23:06:35 -0800
X-CSE-ConnectionGUID: l6FqANuPR1CZI4FfOVRuiw==
X-CSE-MsgGUID: VF7wfc3VRpGhsqztFpwOhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="103769250"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2024 23:06:34 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPG2p-0002mD-2m;
	Sun, 22 Dec 2024 07:06:31 +0000
Date: Sun, 22 Dec 2024 15:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: arch/sh/mm/cache-sh4.c:223:15: error: implicit declaration of
 function 'pmd_off'
Message-ID: <202412221527.oTd4Lie4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: e05c7b1f2bc4b7b28199b9a7572f73436d97317e mm: pgtable: add shortcuts for accessing kernel PMD and PTE
date:   4 years, 6 months ago
config: sh-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241222/202412221527.oTd4Lie4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221527.oTd4Lie4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221527.oTd4Lie4-lkp@intel.com/

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
>> arch/sh/mm/cache-sh4.c:223:15: error: implicit declaration of function 'pmd_off' [-Werror=implicit-function-declaration]
     223 |         pmd = pmd_off(vma->vm_mm, address);
         |               ^~~~~~~
   arch/sh/mm/cache-sh4.c:223:13: error: assignment to 'pmd_t *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
     223 |         pmd = pmd_off(vma->vm_mm, address);
         |             ^
   arch/sh/mm/cache-sh4.c: At top level:
   arch/sh/mm/cache-sh4.c:373:13: error: no previous prototype for 'sh4_cache_init' [-Werror=missing-prototypes]
     373 | void __init sh4_cache_init(void)
         |             ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/pmd_off +223 arch/sh/mm/cache-sh4.c

   176	
   177	/*
   178	 * Note : (RPC) since the caches are physically tagged, the only point
   179	 * of flush_cache_mm for SH-4 is to get rid of aliases from the
   180	 * D-cache.  The assumption elsewhere, e.g. flush_cache_range, is that
   181	 * lines can stay resident so long as the virtual address they were
   182	 * accessed with (hence cache set) is in accord with the physical
   183	 * address (i.e. tag).  It's no different here.
   184	 *
   185	 * Caller takes mm->mmap_sem.
   186	 */
   187	static void sh4_flush_cache_mm(void *arg)
   188	{
   189		struct mm_struct *mm = arg;
   190	
 > 191		if (cpu_context(smp_processor_id(), mm) == NO_CONTEXT)
   192			return;
   193	
   194		flush_dcache_all();
   195	}
   196	
   197	/*
   198	 * Write back and invalidate I/D-caches for the page.
   199	 *
   200	 * ADDR: Virtual Address (U0 address)
   201	 * PFN: Physical page number
   202	 */
   203	static void sh4_flush_cache_page(void *args)
   204	{
   205		struct flusher_data *data = args;
   206		struct vm_area_struct *vma;
   207		struct page *page;
   208		unsigned long address, pfn, phys;
   209		int map_coherent = 0;
   210		pmd_t *pmd;
   211		pte_t *pte;
   212		void *vaddr;
   213	
   214		vma = data->vma;
   215		address = data->addr1 & PAGE_MASK;
   216		pfn = data->addr2;
   217		phys = pfn << PAGE_SHIFT;
   218		page = pfn_to_page(pfn);
   219	
   220		if (cpu_context(smp_processor_id(), vma->vm_mm) == NO_CONTEXT)
   221			return;
   222	
 > 223		pmd = pmd_off(vma->vm_mm, address);
   224		pte = pte_offset_kernel(pmd, address);
   225	
   226		/* If the page isn't present, there is nothing to do here. */
   227		if (!(pte_val(*pte) & _PAGE_PRESENT))
   228			return;
   229	
   230		if ((vma->vm_mm == current->active_mm))
   231			vaddr = NULL;
   232		else {
   233			/*
   234			 * Use kmap_coherent or kmap_atomic to do flushes for
   235			 * another ASID than the current one.
   236			 */
   237			map_coherent = (current_cpu_data.dcache.n_aliases &&
   238				test_bit(PG_dcache_clean, &page->flags) &&
   239				page_mapcount(page));
   240			if (map_coherent)
   241				vaddr = kmap_coherent(page, address);
   242			else
   243				vaddr = kmap_atomic(page);
   244	
   245			address = (unsigned long)vaddr;
   246		}
   247	
   248		flush_cache_one(CACHE_OC_ADDRESS_ARRAY |
   249				(address & shm_align_mask), phys);
   250	
   251		if (vma->vm_flags & VM_EXEC)
   252			flush_icache_all();
   253	
   254		if (vaddr) {
   255			if (map_coherent)
   256				kunmap_coherent(vaddr);
   257			else
   258				kunmap_atomic(vaddr);
   259		}
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
