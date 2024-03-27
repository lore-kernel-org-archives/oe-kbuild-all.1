Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5658A1509BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711565200; cv=none; b=qrawK+ehKBakpmKKD3eRmSSO55EiBB8HsnBkh+XD+rusRttxN8nahExDO1CVKEqTLixwz9gDHeELMVJqGOu5+Eo0aguRxRBR0VgLC59RlKsdTn+WgZZcnK9zJ+6wK2/Djr0EflAbuiBR3EzzSHy6qp+FDVzUNdxhC56IWDwYF/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711565200; c=relaxed/simple;
	bh=ieOUOpGzjx2JrI1c7nzuCkZNqnSREw7sXC7rWf+mwa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6Wt0Hu4mC+gQdoKvJU6Y9pQFI1Of2jPmY17eMCNLAouDvpUOayaXWg0WA8S66t1N9iu5EDEqEjiWafzVBUW4Soh3mqdYqph5uFCFCyDsrmICoNYagtNI0xFM3PK/FlrXwIXpS+Dx5NVuWlu6xtXE96aqvtWIjFw4sie0E36+hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPpbS7u/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPpbS7u/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711565198; x=1743101198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ieOUOpGzjx2JrI1c7nzuCkZNqnSREw7sXC7rWf+mwa0=;
  b=gPpbS7u/05/Bt0EMTUB6sFV33dwxJQ7FDzTLtQS4JlKuBxhEqT8bgHC7
   ksN3uSiO+hmSG1eHwXR+rYgtpOVwti39cuwGfXOb4BL9enzRgSC64SvfE
   UljTkhENZ/F90+dZ+oQCCnfkZqYIDUkuUYWaOtWO1Ph3n24lx9mvdcN6B
   avHBfirEEhabHTiKubhjrOHq5HXQBm4khA0hQBfCurygwueRV0ucUEjQ5
   tn+LGpGyWhBRZxDs3P2TzYfxXFgs5YmijgTPh89f2ri+GRlDDXzUjB9Qe
   YRkp7Sdhvek2loYXsRs5CqwKh5jQ37VM2eSUbfBanS426Mizng5VN0x6D
   A==;
X-CSE-ConnectionGUID: S9XS8c2ATaK9XO0P1dpqPA==
X-CSE-MsgGUID: rS2WgHiVQAaxVmC+3FWnWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7292301"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="7292301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 11:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="16420701"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2024 11:46:36 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpYIE-0001NS-0b;
	Wed, 27 Mar 2024 18:46:34 +0000
Date: Thu, 28 Mar 2024 02:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 01/10] sh: Remove use of PG_arch_1 on individual pages
Message-ID: <202403280209.6eW34UZ5-lkp@intel.com>
References: <20240326171045.410737-2-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326171045.410737-2-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on jcmvbkbc-xtensa/xtensa-for-next arm64/for-next/core s390/features tj-cgroup/for-next linus/master vbabka-slab/for-next v6.9-rc1 next-20240327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/sh-Remove-use-of-PG_arch_1-on-individual-pages/20240327-011221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240326171045.410737-2-willy%40infradead.org
patch subject: [PATCH 01/10] sh: Remove use of PG_arch_1 on individual pages
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240328/202403280209.6eW34UZ5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280209.6eW34UZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280209.6eW34UZ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/sh/mm/cache-sh4.c:14:
   arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_page':
>> arch/sh/mm/cache-sh4.c:250:51: error: too few arguments to function 'folio_flags'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                                                   ^~~~~~~~~~~
   include/linux/bitops.h:50:44: note: in definition of macro 'bitop'
      50 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   arch/sh/mm/cache-sh4.c:250:25: note: in expansion of macro 'test_bit'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                         ^~~~~~~~
   In file included from include/linux/mmzone.h:23:
   include/linux/page-flags.h:317:23: note: declared here
     317 | static unsigned long *folio_flags(struct folio *folio, unsigned n)
         |                       ^~~~~~~~~~~
>> arch/sh/mm/cache-sh4.c:250:51: error: too few arguments to function 'folio_flags'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                                                   ^~~~~~~~~~~
   include/linux/bitops.h:51:23: note: in definition of macro 'bitop'
      51 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   arch/sh/mm/cache-sh4.c:250:25: note: in expansion of macro 'test_bit'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                         ^~~~~~~~
   include/linux/page-flags.h:317:23: note: declared here
     317 | static unsigned long *folio_flags(struct folio *folio, unsigned n)
         |                       ^~~~~~~~~~~
>> arch/sh/mm/cache-sh4.c:250:51: error: too few arguments to function 'folio_flags'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                                                   ^~~~~~~~~~~
   include/linux/bitops.h:52:57: note: in definition of macro 'bitop'
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   arch/sh/mm/cache-sh4.c:250:25: note: in expansion of macro 'test_bit'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                         ^~~~~~~~
   include/linux/page-flags.h:317:23: note: declared here
     317 | static unsigned long *folio_flags(struct folio *folio, unsigned n)
         |                       ^~~~~~~~~~~
>> arch/sh/mm/cache-sh4.c:250:51: error: too few arguments to function 'folio_flags'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                                                   ^~~~~~~~~~~
   include/linux/bitops.h:53:24: note: in definition of macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   arch/sh/mm/cache-sh4.c:250:25: note: in expansion of macro 'test_bit'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                         ^~~~~~~~
   include/linux/page-flags.h:317:23: note: declared here
     317 | static unsigned long *folio_flags(struct folio *folio, unsigned n)
         |                       ^~~~~~~~~~~
>> arch/sh/mm/cache-sh4.c:250:51: error: too few arguments to function 'folio_flags'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                                                   ^~~~~~~~~~~
   include/linux/bitops.h:53:39: note: in definition of macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   arch/sh/mm/cache-sh4.c:250:25: note: in expansion of macro 'test_bit'
     250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
         |                         ^~~~~~~~
   include/linux/page-flags.h:317:23: note: declared here
     317 | static unsigned long *folio_flags(struct folio *folio, unsigned n)
         |                       ^~~~~~~~~~~
   arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_range':
   arch/sh/mm/cache-sh4.c:287:30: warning: variable 'end' set but not used [-Wunused-but-set-variable]
     287 |         unsigned long start, end;
         |                              ^~~
   arch/sh/mm/cache-sh4.c:287:23: warning: variable 'start' set but not used [-Wunused-but-set-variable]
     287 |         unsigned long start, end;
         |                       ^~~~~
   arch/sh/mm/cache-sh4.c: At top level:
   arch/sh/mm/cache-sh4.c:385:13: warning: no previous prototype for 'sh4_cache_init' [-Wmissing-prototypes]
     385 | void __init sh4_cache_init(void)
         |             ^~~~~~~~~~~~~~


vim +/folio_flags +250 arch/sh/mm/cache-sh4.c

   207	
   208	/*
   209	 * Write back and invalidate I/D-caches for the page.
   210	 *
   211	 * ADDR: Virtual Address (U0 address)
   212	 * PFN: Physical page number
   213	 */
   214	static void sh4_flush_cache_page(void *args)
   215	{
   216		struct flusher_data *data = args;
   217		struct vm_area_struct *vma;
   218		struct page *page;
   219		unsigned long address, pfn, phys;
   220		int map_coherent = 0;
   221		pmd_t *pmd;
   222		pte_t *pte;
   223		void *vaddr;
   224	
   225		vma = data->vma;
   226		address = data->addr1 & PAGE_MASK;
   227		pfn = data->addr2;
   228		phys = pfn << PAGE_SHIFT;
   229		page = pfn_to_page(pfn);
   230	
   231		if (cpu_context(smp_processor_id(), vma->vm_mm) == NO_CONTEXT)
   232			return;
   233	
   234		pmd = pmd_off(vma->vm_mm, address);
   235		pte = pte_offset_kernel(pmd, address);
   236	
   237		/* If the page isn't present, there is nothing to do here. */
   238		if (!(pte_val(*pte) & _PAGE_PRESENT))
   239			return;
   240	
   241		if ((vma->vm_mm == current->active_mm))
   242			vaddr = NULL;
   243		else {
   244			struct folio *folio = page_folio(page);
   245			/*
   246			 * Use kmap_coherent or kmap_atomic to do flushes for
   247			 * another ASID than the current one.
   248			 */
   249			map_coherent = (current_cpu_data.dcache.n_aliases &&
 > 250				test_bit(PG_dcache_clean, folio_flags(folio)) &&
   251				page_mapped(page));
   252			if (map_coherent)
   253				vaddr = kmap_coherent(page, address);
   254			else
   255				vaddr = kmap_atomic(page);
   256	
   257			address = (unsigned long)vaddr;
   258		}
   259	
   260		flush_cache_one(CACHE_OC_ADDRESS_ARRAY |
   261				(address & shm_align_mask), phys);
   262	
   263		if (vma->vm_flags & VM_EXEC)
   264			flush_icache_all();
   265	
   266		if (vaddr) {
   267			if (map_coherent)
   268				kunmap_coherent(vaddr);
   269			else
   270				kunmap_atomic(vaddr);
   271		}
   272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
