Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80674414
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721569943; cv=none; b=TiaRod1kk/X3cg5rjWUwlYYpfopBiqf7Dg6v8YDl+wKu6XJ/1RfFsYitvFg7LC8q7pwpdEECoKPre6GOm97Tr+kqfsT7cIE0lDFK6ICHrZls3CMW8sFWCan4O5MDY3reclfVo6e0uHGKYTS0fm5mi/ZYbcthtFPFwP2pSR7u76s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721569943; c=relaxed/simple;
	bh=kPtKknMJ7DcFXslT7xZ7ok4m1DIprUPCpHa4yTBCsPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FpnxKwZ0X+xUc9A3di5jP43PcgH2ZexTS9xiKbfdWdIYn9gS5/QQaSsxFvakPlMjeptGZZwEzeL3mi0BUqOH6oQT3vZfHruFZruuFdkCdh/q6Q+RpL2HZvY8pbD0wypGB6nn5EmJMJpmkuJn2zKxs+V5CxXbYGTiwFWp6OodY7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQq8tcj3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQq8tcj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721569941; x=1753105941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPtKknMJ7DcFXslT7xZ7ok4m1DIprUPCpHa4yTBCsPs=;
  b=mQq8tcj3R1CMr/g243vTRnZj9FiJwJ+W2IjfCyNvDjum0eZHRXjAZTqP
   7hkd1hg9PDEWJI416v9ueJxpRtVw06Y0PfS3LoWMNIg8YnXIs7fFPFqJ0
   LRzbpvz/qDCe+Jmnm15AJLpEW1jEZhrFYECUJ+teIGV/LLC9jjRAv8PN9
   BCm4lwwpGn7g5ftS9oHfi2Gn8dnCX2EXkDzmKTW+NhksF5icb5wL7BYtg
   AhGLT8HCOA0P8KPuCNiEzlZ4L5dwcXLuphl06ZHJQEKPk0wjbISjOpMWJ
   G249g22iAzXvrlq6+YHySDXVhxBDdAnkhOdVlOkHGl87Zp6BjF8RWZr+O
   g==;
X-CSE-ConnectionGUID: YNOpnXXUT1OAsM2HDlL8FA==
X-CSE-MsgGUID: u4D62eMTSqy/0qrPCHDT+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="18982377"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="18982377"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 06:52:21 -0700
X-CSE-ConnectionGUID: DLErWVI3RBC/kEeG29pTvA==
X-CSE-MsgGUID: ux0LBTkQTq+8FJ0xRAvtJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="56457372"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jul 2024 06:52:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVWz3-000kJ0-0X;
	Sun, 21 Jul 2024 13:52:17 +0000
Date: Sun, 21 Jul 2024 21:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 38/42] mm/memory.c:4650:35: error: assignment
 to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t
 *'}
Message-ID: <202407212146.6dFfRFLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: f4c4f25d6f74bc03fe3e095de591c9a78735d6d2 [38/42] mm: convert vmf.prealloc_pte to struct ptdesc pointer
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240721/202407212146.6dFfRFLE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407212146.6dFfRFLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407212146.6dFfRFLE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   arch/m68k/include/asm/motorola_pgalloc.h: In function 'pmd_populate':
   include/linux/mm_types.h:504:41: error: passing argument 2 of 'pmd_set' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   arch/m68k/include/asm/motorola_pgalloc.h:89:22: note: in expansion of macro 'ptdesc_page'
      89 |         pmd_set(pmd, ptdesc_page(page));
         |                      ^~~~~~~~~~~
   In file included from arch/m68k/include/asm/pgtable_mm.h:157,
                    from arch/m68k/include/asm/pgtable.h:10,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/memory.c:44:
   arch/m68k/include/asm/motorola_pgtable.h:96:48: note: expected 'pte_t *' but argument is of type 'struct page *'
      96 | static inline void pmd_set(pmd_t *pmdp, pte_t *ptep)
         |                                         ~~~~~~~^~~~
   mm/memory.c: In function '__pte_alloc':
   mm/memory.c:448:33: error: initialization of 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                                 ^~~~~~~~~~~~~
   mm/memory.c:454:30: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     454 |                 pte_free(mm, ptdesc);
         |                              ^~~~~~
         |                              |
         |                              struct ptdesc *
   In file included from arch/m68k/include/asm/pgalloc.h:16,
                    from mm/memory.c:86:
   arch/m68k/include/asm/motorola_pgalloc.h:42:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      42 | static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/memory.c: In function '__do_fault':
>> mm/memory.c:4650:35: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
    4650 |                 vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
         |                                   ^
   mm/memory.c: In function 'do_fault_around':
   mm/memory.c:5013:35: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
    5013 |                 vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
         |                                   ^
   mm/memory.c: In function 'do_fault':
   mm/memory.c:5199:36: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    5199 |                 pte_free(vm_mm, vmf->prealloc_pte);
         |                                 ~~~^~~~~~~~~~~~~~
         |                                    |
         |                                    struct ptdesc *
   arch/m68k/include/asm/motorola_pgalloc.h:42:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      42 | static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
         |                                                   ~~~~~~~~~~^~~~~~~


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
> 4650			vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
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
