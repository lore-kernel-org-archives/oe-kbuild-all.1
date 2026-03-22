Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CEC1F1518
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774191451; cv=none; b=AsbPP8uy1Z4CweCXR7DkeElOylC66RiNNZS8o+Zca21a8ywEQvcQdSteOAiu5lck+eHU5kxH9OKaFnNJ0POAsdZ1cDwheAoXYoa9ezybqgUBWvYrMO1RGeqAufVC+gjgeIicrn33PTChsMw+bMsKFS6sHUBB3CdIAXnwOfXl2o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774191451; c=relaxed/simple;
	bh=Q2kTJBLZGbJ2YsPj3Wl/BsYhirV7bEgDrwAXj3InlU8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B35CozckRCAVbYzNxnRVfwbfBXPBvdQDrbTiQblpVlD37jrKUJjaY8XzouyT6R/JGkk4vqFUJfTVEWPGspNp7rE1dtkx5+G63XwADGIQ34MNLbOi7ZWI5v46iSWHHR0kxGUOlHpJU23IYBe1ucCV6WdnljJob4wLbGs8V7UlgFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRs8YjfH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRs8YjfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774191450; x=1805727450;
  h=date:from:to:cc:subject:message-id;
  bh=Q2kTJBLZGbJ2YsPj3Wl/BsYhirV7bEgDrwAXj3InlU8=;
  b=IRs8YjfH7aMG0RiGFeJ4uAPPCURip/6f4EMWT8TPlBacRckMkQFDeWwf
   coPYwa7npwZJ13V+25v+day8QLNWO6QizSFepUGbjMhtwKJdUUy9Qt8vo
   WkiO3wcJOFG4WYlX93sCETGVh6PYaYeRDv+kTBb/RQBUmurfz2+jPcksD
   6xFK0sYNJ2j7OxhfDMAF67XUPdjG+9BowewtsrwFuoXjWCgeIrKfBCaDn
   T266/4KxCyaQAzmjvzNWXFnv1/RLfVerYZKmMXxwhotNkW6yMtcAVbhIW
   WOhtiQfQuRG6zsh7XBaBvsqavhWd3WFc4Y9qJoP0yetkzdUSGdf+9gLfp
   A==;
X-CSE-ConnectionGUID: I/H2vOmURt2K79jVq2OZBw==
X-CSE-MsgGUID: WrXKASPHQLeyDCP+hGNlDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75237428"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75237428"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 07:57:29 -0700
X-CSE-ConnectionGUID: GZ/kTvfHROektqKdTmqIIA==
X-CSE-MsgGUID: 5i5j78G6S8qPIkCrhsIONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="223813240"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Mar 2026 07:57:28 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4KF3-000000002GL-1Rat;
	Sun, 22 Mar 2026 14:57:25 +0000
Date: Sun, 22 Mar 2026 22:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 26/30] mm/memory.c:5471:2: error: too many
 arguments to function 'folio_add_file_rmap_pmd'
Message-ID: <202603222203.vV8QxcWd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: cbef1d0b647d13181325aba9b7fb964d22e03829 [26/30] tmp
config: arc-randconfig-001-20260322 (https://download.01.org/0day-ci/archive/20260322/202603222203.vV8QxcWd-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222203.vV8QxcWd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222203.vV8QxcWd-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'do_set_pmd':
>> mm/memory.c:5471:2: error: too many arguments to function 'folio_add_file_rmap_pmd'
     folio_add_file_rmap_pmd(folio, page, vma, haddr);
     ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ksm.h:14,
                    from mm/memory.c:55:
   include/linux/rmap.h:417:6: note: declared here
    void folio_add_file_rmap_pmd(struct folio *, struct page *,
         ^~~~~~~~~~~~~~~~~~~~~~~
--
   mm/huge_memory.c: In function '__split_huge_pmd_locked':
>> mm/huge_memory.c:3097:4: error: too many arguments to function 'folio_add_anon_rmap_ptes'
       folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
       ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/huge_memory.c:15:
   include/linux/rmap.h:405:6: note: declared here
    void folio_add_anon_rmap_ptes(struct folio *, struct page *, int nr_ptes,
         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/folio_add_file_rmap_pmd +5471 mm/memory.c

  5414	
  5415	vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page)
  5416	{
  5417		struct vm_area_struct *vma = vmf->vma;
  5418		bool write = vmf->flags & FAULT_FLAG_WRITE;
  5419		unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
  5420		pmd_t entry;
  5421		vm_fault_t ret = VM_FAULT_FALLBACK;
  5422	
  5423		/*
  5424		 * It is too late to allocate a small folio, we already have a large
  5425		 * folio in the pagecache: especially s390 KVM cannot tolerate any
  5426		 * PMD mappings, but PTE-mapped THP are fine. So let's simply refuse any
  5427		 * PMD mappings if THPs are disabled. As we already have a THP,
  5428		 * behave as if we are forcing a collapse.
  5429		 */
  5430		if (thp_disabled_by_hw() || vma_thp_disabled(vma, vma->vm_flags,
  5431							     /* forced_collapse=*/ true))
  5432			return ret;
  5433	
  5434		if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
  5435			return ret;
  5436	
  5437		if (folio_order(folio) != HPAGE_PMD_ORDER)
  5438			return ret;
  5439		page = &folio->page;
  5440	
  5441		/*
  5442		 * Just backoff if any subpage of a THP is corrupted otherwise
  5443		 * the corrupted page may mapped by PMD silently to escape the
  5444		 * check.  This kind of THP just can be PTE mapped.  Access to
  5445		 * the corrupted subpage should trigger SIGBUS as expected.
  5446		 */
  5447		if (unlikely(folio_test_has_hwpoisoned(folio)))
  5448			return ret;
  5449	
  5450		/*
  5451		 * Archs like ppc64 need additional space to store information
  5452		 * related to pte entry. Use the preallocated table for that.
  5453		 */
  5454		if (arch_needs_pgtable_deposit() && !vmf->prealloc_pte) {
  5455			vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
  5456			if (!vmf->prealloc_pte)
  5457				return VM_FAULT_OOM;
  5458		}
  5459	
  5460		vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
  5461		if (unlikely(!pmd_none(*vmf->pmd)))
  5462			goto out;
  5463	
  5464		flush_icache_pages(vma, page, HPAGE_PMD_NR);
  5465	
  5466		entry = folio_mk_pmd(folio, vma->vm_page_prot);
  5467		if (write)
  5468			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
  5469	
  5470		add_mm_counter(vma->vm_mm, mm_counter_file(folio), HPAGE_PMD_NR);
> 5471		folio_add_file_rmap_pmd(folio, page, vma, haddr);
  5472	
  5473		/*
  5474		 * deposit and withdraw with pmd lock held
  5475		 */
  5476		if (arch_needs_pgtable_deposit())
  5477			deposit_prealloc_pte(vmf);
  5478	
  5479		set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
  5480	
  5481		update_mmu_cache_pmd(vma, haddr, vmf->pmd);
  5482	
  5483		/* fault is handled */
  5484		ret = 0;
  5485		count_vm_event(THP_FILE_MAPPED);
  5486	out:
  5487		spin_unlock(vmf->ptl);
  5488		return ret;
  5489	}
  5490	#else
  5491	vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page)
  5492	{
  5493		return VM_FAULT_FALLBACK;
  5494	}
  5495	#endif
  5496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
