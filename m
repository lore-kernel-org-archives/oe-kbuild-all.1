Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D545612FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709131753; cv=none; b=JGmtZJ+jjXA27Gpu7+iZh5I3cNubzD/Cf9c45ff1+lW6PrsglHR+NZgKiQc/fAsviesP5t6IUI4zerESMfK5qrZ373D8LO+UHF5iavKNN2o4OUGMA1e/29B0Oe/WDcTYI55xUDI8V6s0tLRNASDEPW3FUctHu8xlfPkES/6neXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709131753; c=relaxed/simple;
	bh=eJyQQqk6fEpgtMTI5rkBgsH7hAi0wMMZ2qh3JBBlQ4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S26xnAGj4Zm6j04ag3GQrl/rO725V64EFw7+88y08l04bUH6KcNz1YQUCudN7P7ZKyl4c1ZUFdQ+d+eJzcv9ZLZiVIWpG+bHTDRQnyAMzx4pZzrFyUbA1xluCflS+smxk/ouT1rtRk0aagLvsUaX3XEQuBgEUxN2mQ6TymjEDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAqh+Tni; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAqh+Tni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709131751; x=1740667751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eJyQQqk6fEpgtMTI5rkBgsH7hAi0wMMZ2qh3JBBlQ4Q=;
  b=SAqh+Tnisa62xFLo+SXBxHO1d76AIGttIwIWNI4smFalzh2ki6MVvAgS
   RgDwW0jyxV75Jj9VlSQfPdJ5qFguZ2pXw/A/z7TZzfWjMBBJuyN/VTnJl
   WWuYE9ZhyBcyJ1FSFOOIxlbtqpTzOuUC+H0kEfA95EmCZpR5L6/HPAAXm
   wRwsaCQa/Kkq5rzLqcoDKYR3ZKAFBubiK8gYaFyUD94yRtKnjjNX5qmec
   mUWSxTnfh+0fbdhDQxVDWSyoVCuXQLJEZjIVb2zeKLMxHrZinZ1XW1oLO
   QKav37U3JbCed1z/qioKoIUsJDeTsnDQfEXw7pm82kEhRSRa6tNIIoltA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="4104701"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="4104701"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 06:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7406422"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Feb 2024 06:49:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfLF4-000C8t-0l;
	Wed, 28 Feb 2024 14:49:06 +0000
Date: Wed, 28 Feb 2024 22:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <v-songbaohua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [linux-next:master 10511/10830] mm/internal.h:98:23: error: implicit
 declaration of function 'pte_mkclean'; did you mean 'page_mkclean'?
Message-ID: <202402282202.yV6GmMJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
commit: 9ea89c8b43ac0de34c9542a97eaab901af02e5a8 [10511/10830] mm: make folio_pte_batch available outside of mm/memory.c
config: riscv-nommu_k210_defconfig (https://download.01.org/0day-ci/archive/20240228/202402282202.yV6GmMJu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402282202.yV6GmMJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402282202.yV6GmMJu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:51:
   mm/internal.h: In function '__pte_batch_clear_ignored':
>> mm/internal.h:98:23: error: implicit declaration of function 'pte_mkclean'; did you mean 'page_mkclean'? [-Werror=implicit-function-declaration]
      98 |                 pte = pte_mkclean(pte);
         |                       ^~~~~~~~~~~
         |                       page_mkclean
   mm/internal.h:98:23: error: incompatible types when assigning to type 'pte_t' from type 'int'
>> mm/internal.h:101:16: error: implicit declaration of function 'pte_wrprotect' [-Werror=implicit-function-declaration]
     101 |         return pte_wrprotect(pte_mkold(pte));
         |                ^~~~~~~~~~~~~
>> mm/internal.h:101:30: error: implicit declaration of function 'pte_mkold' [-Werror=implicit-function-declaration]
     101 |         return pte_wrprotect(pte_mkold(pte));
         |                              ^~~~~~~~~
>> mm/internal.h:101:16: error: incompatible types when returning type 'int' but 'pte_t' was expected
     101 |         return pte_wrprotect(pte_mkold(pte));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/dax.h:5,
                    from mm/filemap.c:15:
   mm/internal.h: In function 'folio_pte_batch':
>> mm/internal.h:140:27: error: implicit declaration of function 'pte_present'; did you mean 'pgd_present'? [-Werror=implicit-function-declaration]
     140 |         VM_WARN_ON_FOLIO(!pte_present(pte), folio);
         |                           ^~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/internal.h:140:9: note: in expansion of macro 'VM_WARN_ON_FOLIO'
     140 |         VM_WARN_ON_FOLIO(!pte_present(pte), folio);
         |         ^~~~~~~~~~~~~~~~
>> mm/internal.h:142:49: error: implicit declaration of function 'pte_pfn' [-Werror=implicit-function-declaration]
     142 |         VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
         |                                                 ^~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/internal.h:142:9: note: in expansion of macro 'VM_WARN_ON_FOLIO'
     142 |         VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
         |         ^~~~~~~~~~~~~~~~
   mm/internal.h:142:26: note: in expansion of macro 'page_folio'
     142 |         VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
         |                          ^~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   mm/internal.h:142:37: note: in expansion of macro 'pfn_to_page'
     142 |         VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
         |                                     ^~~~~~~~~~~
   mm/internal.h:144:14: error: implicit declaration of function 'pte_batch_hint' [-Werror=implicit-function-declaration]
     144 |         nr = pte_batch_hint(start_ptep, pte);
         |              ^~~~~~~~~~~~~~
   mm/internal.h:145:50: error: implicit declaration of function 'pte_advance_pfn' [-Werror=implicit-function-declaration]
     145 |         expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
         |                                                  ^~~~~~~~~~~~~~~
   mm/internal.h:145:50: error: incompatible type for argument 1 of '__pte_batch_clear_ignored'
     145 |         expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   mm/internal.h:95:53: note: expected 'pte_t' but argument is of type 'int'
      95 | static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
         |                                               ~~~~~~^~~
   mm/internal.h:149:23: error: implicit declaration of function 'ptep_get' [-Werror=implicit-function-declaration]
     149 |                 pte = ptep_get(ptep);
         |                       ^~~~~~~~
   mm/internal.h:149:23: error: incompatible types when assigning to type 'pte_t' from type 'int'
>> mm/internal.h:151:38: error: implicit declaration of function 'pte_write'; did you mean 'pgd_write'? [-Werror=implicit-function-declaration]
     151 |                         writable = !!pte_write(pte);
         |                                      ^~~~~~~~~
         |                                      pgd_write
   mm/internal.h:154:22: error: implicit declaration of function 'pte_same' [-Werror=implicit-function-declaration]
     154 |                 if (!pte_same(pte, expected_pte))
         |                      ^~~~~~~~
   mm/internal.h:169:32: error: incompatible types when assigning to type 'pte_t' from type 'int'
     169 |                 expected_pte = pte_advance_pfn(expected_pte, nr);
         |                                ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from mm/oom_kill.c:50:
   mm/internal.h: In function '__pte_batch_clear_ignored':
>> mm/internal.h:98:23: error: implicit declaration of function 'pte_mkclean'; did you mean 'page_mkclean'? [-Werror=implicit-function-declaration]
      98 |                 pte = pte_mkclean(pte);
         |                       ^~~~~~~~~~~
         |                       page_mkclean
   mm/internal.h:98:23: error: incompatible types when assigning to type 'pte_t' from type 'int'
>> mm/internal.h:101:16: error: implicit declaration of function 'pte_wrprotect' [-Werror=implicit-function-declaration]
     101 |         return pte_wrprotect(pte_mkold(pte));
         |                ^~~~~~~~~~~~~
>> mm/internal.h:101:30: error: implicit declaration of function 'pte_mkold' [-Werror=implicit-function-declaration]
     101 |         return pte_wrprotect(pte_mkold(pte));
         |                              ^~~~~~~~~
>> mm/internal.h:101:16: error: incompatible types when returning type 'int' but 'pte_t' was expected
     101 |         return pte_wrprotect(pte_mkold(pte));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/rculist.h:10,
                    from include/linux/sched/signal.h:5,
                    from include/linux/oom.h:6,
                    from mm/oom_kill.c:21:
   mm/internal.h: In function 'folio_pte_batch':
>> mm/internal.h:140:27: error: implicit declaration of function 'pte_present'; did you mean 'pgd_present'? [-Werror=implicit-function-declaration]
     140 |         VM_WARN_ON_FOLIO(!pte_present(pte), folio);
         |                           ^~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/internal.h:140:9: note: in expansion of macro 'VM_WARN_ON_FOLIO'
     140 |         VM_WARN_ON_FOLIO(!pte_present(pte), folio);
         |         ^~~~~~~~~~~~~~~~
>> mm/internal.h:142:49: error: implicit declaration of function 'pte_pfn' [-Werror=implicit-function-declaration]
     142 |         VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
         |                                                 ^~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/internal.h:142:9: note: in expansion of macro 'VM_WARN_ON_FOLIO'
     142 |         VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
         |         ^~~~~~~~~~~~~~~~
   mm/internal.h:142:26: note: in expansion of macro 'page_folio'
     142 |         VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
         |                          ^~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   mm/internal.h:142:37: note: in expansion of macro 'pfn_to_page'
     142 |         VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
         |                                     ^~~~~~~~~~~
   mm/internal.h:144:14: error: implicit declaration of function 'pte_batch_hint' [-Werror=implicit-function-declaration]
     144 |         nr = pte_batch_hint(start_ptep, pte);
         |              ^~~~~~~~~~~~~~
   mm/internal.h:145:50: error: implicit declaration of function 'pte_advance_pfn' [-Werror=implicit-function-declaration]
     145 |         expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
         |                                                  ^~~~~~~~~~~~~~~
   mm/internal.h:145:50: error: incompatible type for argument 1 of '__pte_batch_clear_ignored'
     145 |         expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   mm/internal.h:95:53: note: expected 'pte_t' but argument is of type 'int'
      95 | static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
         |                                               ~~~~~~^~~
   mm/internal.h:149:23: error: implicit declaration of function 'ptep_get' [-Werror=implicit-function-declaration]
     149 |                 pte = ptep_get(ptep);
         |                       ^~~~~~~~
   mm/internal.h:149:23: error: incompatible types when assigning to type 'pte_t' from type 'int'
   mm/internal.h:151:38: error: implicit declaration of function 'pte_write'; did you mean 'seq_write'? [-Werror=implicit-function-declaration]
     151 |                         writable = !!pte_write(pte);
         |                                      ^~~~~~~~~
         |                                      seq_write
   mm/internal.h:154:22: error: implicit declaration of function 'pte_same' [-Werror=implicit-function-declaration]
     154 |                 if (!pte_same(pte, expected_pte))
         |                      ^~~~~~~~
   mm/internal.h:169:32: error: incompatible types when assigning to type 'pte_t' from type 'int'
     169 |                 expected_pte = pte_advance_pfn(expected_pte, nr);
         |                                ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +98 mm/internal.h

    94	
    95	static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
    96	{
    97		if (flags & FPB_IGNORE_DIRTY)
  > 98			pte = pte_mkclean(pte);
    99		if (likely(flags & FPB_IGNORE_SOFT_DIRTY))
   100			pte = pte_clear_soft_dirty(pte);
 > 101		return pte_wrprotect(pte_mkold(pte));
   102	}
   103	
   104	/**
   105	 * folio_pte_batch - detect a PTE batch for a large folio
   106	 * @folio: The large folio to detect a PTE batch for.
   107	 * @addr: The user virtual address the first page is mapped at.
   108	 * @start_ptep: Page table pointer for the first entry.
   109	 * @pte: Page table entry for the first page.
   110	 * @max_nr: The maximum number of table entries to consider.
   111	 * @flags: Flags to modify the PTE batch semantics.
   112	 * @any_writable: Optional pointer to indicate whether any entry except the
   113	 *		  first one is writable.
   114	 *
   115	 * Detect a PTE batch: consecutive (present) PTEs that map consecutive
   116	 * pages of the same large folio.
   117	 *
   118	 * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
   119	 * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
   120	 * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
   121	 *
   122	 * start_ptep must map any page of the folio. max_nr must be at least one and
   123	 * must be limited by the caller so scanning cannot exceed a single page table.
   124	 *
   125	 * Return: the number of table entries in the batch.
   126	 */
   127	static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
   128			pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
   129			bool *any_writable)
   130	{
   131		unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
   132		const pte_t *end_ptep = start_ptep + max_nr;
   133		pte_t expected_pte, *ptep;
   134		bool writable;
   135		int nr;
   136	
   137		if (any_writable)
   138			*any_writable = false;
   139	
 > 140		VM_WARN_ON_FOLIO(!pte_present(pte), folio);
   141		VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
 > 142		VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
   143	
   144		nr = pte_batch_hint(start_ptep, pte);
   145		expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
   146		ptep = start_ptep + nr;
   147	
   148		while (ptep < end_ptep) {
   149			pte = ptep_get(ptep);
   150			if (any_writable)
 > 151				writable = !!pte_write(pte);
   152			pte = __pte_batch_clear_ignored(pte, flags);
   153	
   154			if (!pte_same(pte, expected_pte))
   155				break;
   156	
   157			/*
   158			 * Stop immediately once we reached the end of the folio. In
   159			 * corner cases the next PFN might fall into a different
   160			 * folio.
   161			 */
   162			if (pte_pfn(pte) >= folio_end_pfn)
   163				break;
   164	
   165			if (any_writable)
   166				*any_writable |= writable;
   167	
   168			nr = pte_batch_hint(ptep, pte);
   169			expected_pte = pte_advance_pfn(expected_pte, nr);
   170			ptep += nr;
   171		}
   172	
   173		return min(ptep - start_ptep, max_nr);
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
