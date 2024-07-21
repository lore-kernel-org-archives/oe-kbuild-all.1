Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453826AED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721582933; cv=none; b=D/9pydQ5mk4VeYdTtXkfwOSLRLsHMnqR+ZY/V7KD49sMC3Ek4UOG87taa5H62XwCfs6VA023ImsrLwbaUpOPRO4Xrgmm7tucTOZCbC74cWcgHG/EIIKEC89xqrjs+kpRSFJNPCoIa0FWW0sjNdmgE0T9+2lpzN6byvA46Uz756k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721582933; c=relaxed/simple;
	bh=WuSEgEmGb0uvdwchtqfpzF3zG6dCTI6DzDQbL7XoKLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lxg4ZKtbmbFbwEnrwkpZHW7BzEqa8HbJLaJ9tlEIO2eKSOjYfQsMy30wt06Hq9FYo8ztNmeEN4ZVUwREEkFKUoiDA6tNEacEYuYEbsYpVSY0l81Rhmrqe9CWkvdjVmCK05Ut9oMO90dxrje3GTcoikzgb25Vj0ZEydQCpZaOXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elLSJffn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elLSJffn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721582931; x=1753118931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WuSEgEmGb0uvdwchtqfpzF3zG6dCTI6DzDQbL7XoKLQ=;
  b=elLSJffn1x3zZ7ulepmzLkknQn1Jrl1JstbmmQszLmdz9/qXoeoON3o9
   Fjl4NbI4OF/+Em4cr32pQIAGpKrZN+FUkq5GcAoYmPDlvK5OoMdJ7K3Uu
   5h7x11Pu9kHZy6qVEIpZaNt6tLaxshT7KRjsP6uzkgFGQEEcmTdsU+QNl
   NPCF7dvDGIMDPM8WcB4EH8tAXpphNIfdYaBshgRzdGkkdzSQqso4W+bQ1
   OMV1XvuSDElDdWNjK8U/EVD1H8khe75zeg1fuhQd2/j3wWZCraJUMCY7z
   3lOXIKK4RozAljPe+mH1koTwnNErSv98COgn5LkkVPbQvB2F2b6YzRm7T
   g==;
X-CSE-ConnectionGUID: AXPgMhtxRM2VhyXJf97VnA==
X-CSE-MsgGUID: W4dHsyhpTNqO2xwvWprzgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22908810"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="22908810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 10:28:50 -0700
X-CSE-ConnectionGUID: cxbMKFpsT7S9U6MDh8lGdg==
X-CSE-MsgGUID: Jm5Geu1BRB2oerCg1BJPUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="82270296"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jul 2024 10:28:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVaMZ-000kQK-0F;
	Sun, 21 Jul 2024 17:28:47 +0000
Date: Mon, 22 Jul 2024 01:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 31/43] mm/memory.c:4650:35: error: assignment to
 'pgtable_t' {aka 'long unsigned int *'} from incompatible pointer type
 'struct page *'
Message-ID: <202407220155.P6mZKB5R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   24c8778745b223097d5e3d590967626176306b1d
commit: 3ee93675accebc1936331d1225cb0e84411ee71f [31/43] mm/pgtable: fully use ptdesc in pte_alloc_one series functions
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20240722/202407220155.P6mZKB5R-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407220155.P6mZKB5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407220155.P6mZKB5R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sparc/include/asm/hardirq_32.h:11,
                    from arch/sparc/include/asm/hardirq.h:7,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   mm/memory.c: In function '__pte_alloc':
   include/linux/mm_types.h:504:41: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/memory.c:454:30: note: in expansion of macro 'ptdesc_page'
     454 |                 pte_free(mm, ptdesc_page(ptdesc));
         |                              ^~~~~~~~~~~
   In file included from arch/sparc/include/asm/pgalloc.h:7,
                    from mm/memory.c:86:
   arch/sparc/include/asm/pgalloc_32.h:74:48: note: expected 'pgtable_t' {aka 'long unsigned int *'} but argument is of type 'struct page *'
      74 | void pte_free(struct mm_struct * mm, pgtable_t pte);
         |                                      ~~~~~~~~~~^~~
   mm/memory.c: In function '__do_fault':
>> mm/memory.c:4650:35: error: assignment to 'pgtable_t' {aka 'long unsigned int *'} from incompatible pointer type 'struct page *' [-Wincompatible-pointer-types]
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                   ^
   mm/memory.c: In function 'do_fault_around':
   mm/memory.c:5013:35: error: assignment to 'pgtable_t' {aka 'long unsigned int *'} from incompatible pointer type 'struct page *' [-Wincompatible-pointer-types]
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                   ^
--
>> arch/sparc/mm/srmmu.c:349:11: error: conflicting types for 'pte_alloc_one'; have 'pte_t *(struct mm_struct *)' {aka 'long unsigned int *(struct mm_struct *)'}
     349 | pgtable_t pte_alloc_one(struct mm_struct *mm)
         |           ^~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/pgalloc.h:7,
                    from arch/sparc/mm/srmmu.c:30:
   arch/sparc/include/asm/pgalloc_32.h:58:16: note: previous declaration of 'pte_alloc_one' with type 'struct ptdesc *(struct mm_struct *)'
      58 | struct ptdesc *pte_alloc_one(struct mm_struct *mm);
         |                ^~~~~~~~~~~~~
   arch/sparc/mm/srmmu.c: In function 'poke_hypersparc':
   arch/sparc/mm/srmmu.c:1082:32: warning: variable 'clear' set but not used [-Wunused-but-set-variable]
    1082 |         volatile unsigned long clear;
         |                                ^~~~~


vim +4650 mm/memory.c

  4622	
  4623	/*
  4624	 * The mmap_lock must have been held on entry, and may have been
  4625	 * released depending on flags and vma->vm_ops->fault() return value.
  4626	 * See filemap_fault() and __lock_page_retry().
  4627	 */
  4628	static vm_fault_t __do_fault(struct vm_fault *vmf)
  4629	{
  4630		struct vm_area_struct *vma = vmf->vma;
  4631		struct folio *folio;
  4632		vm_fault_t ret;
  4633	
  4634		/*
  4635		 * Preallocate pte before we take page_lock because this might lead to
  4636		 * deadlocks for memcg reclaim which waits for pages under writeback:
  4637		 *				lock_page(A)
  4638		 *				SetPageWriteback(A)
  4639		 *				unlock_page(A)
  4640		 * lock_page(B)
  4641		 *				lock_page(B)
  4642		 * pte_alloc_one
  4643		 *   shrink_folio_list
  4644		 *     wait_on_page_writeback(A)
  4645		 *				SetPageWriteback(B)
  4646		 *				unlock_page(B)
  4647		 *				# flush A, B to clear the writeback
  4648		 */
  4649		if (pmd_none(*vmf->pmd) && !vmf->prealloc_pte) {
> 4650			vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
  4651			if (!vmf->prealloc_pte)
  4652				return VM_FAULT_OOM;
  4653		}
  4654	
  4655		ret = vma->vm_ops->fault(vmf);
  4656		if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE | VM_FAULT_RETRY |
  4657				    VM_FAULT_DONE_COW)))
  4658			return ret;
  4659	
  4660		folio = page_folio(vmf->page);
  4661		if (unlikely(PageHWPoison(vmf->page))) {
  4662			vm_fault_t poisonret = VM_FAULT_HWPOISON;
  4663			if (ret & VM_FAULT_LOCKED) {
  4664				if (page_mapped(vmf->page))
  4665					unmap_mapping_folio(folio);
  4666				/* Retry if a clean folio was removed from the cache. */
  4667				if (mapping_evict_folio(folio->mapping, folio))
  4668					poisonret = VM_FAULT_NOPAGE;
  4669				folio_unlock(folio);
  4670			}
  4671			folio_put(folio);
  4672			vmf->page = NULL;
  4673			return poisonret;
  4674		}
  4675	
  4676		if (unlikely(!(ret & VM_FAULT_LOCKED)))
  4677			folio_lock(folio);
  4678		else
  4679			VM_BUG_ON_PAGE(!folio_test_locked(folio), vmf->page);
  4680	
  4681		return ret;
  4682	}
  4683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
