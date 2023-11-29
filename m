Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5B2627
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 02:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqoSYX5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701225719; x=1732761719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hd70jirOnpD0ILuk8Ag03dmA7fJoPFSkHtSjhwC4dWs=;
  b=eqoSYX5V7X8e9M5xa9dNx78i91xdMPQ8dVoF6qNmtLrPsSX5d8p5yyke
   Kv9AyqHlgZGkEhxxZGK8C36cbZ4zi0J7htBoSe5UtoM6pYaM7vJKt2xbD
   l/eroBXL/DdjqFwyDQ7BHShFuK6GfCJWK1CQhaCfRgpwZatOErXX/aH2D
   4ZF+tUkveJRA3HHsKxcf8MGK0/UF+zJNs4Na+LMsDidTnikI3eubptDe6
   eHgwy8uR2suOrbjL9cxKq4vj55fVaFYH3oEJNdjo2JV3GZrzVs8lSdK3w
   klrZ43OgN3EHQMyjw3gjbbwpKUroa2UXp756q66PofJTdtWfnquH3h2j1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="395897452"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="395897452"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 18:41:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="768749635"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="768749635"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Nov 2023 18:41:58 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8AWR-0008SO-2X;
	Wed, 29 Nov 2023 02:41:55 +0000
Date: Wed, 29 Nov 2023 10:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: Weixi Zhu <weixi.zhu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] mm/gmem: extending Linux core MM to support
 unified virtual address space
Message-ID: <202311290751.mqDVtXS9-lkp@intel.com>
References: <20231128125025.4449-7-weixi.zhu@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128125025.4449-7-weixi.zhu@huawei.com>

Hi Weixi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on linus/master v6.7-rc3]
[cannot apply to akpm-mm/mm-everything arm64/for-next/core next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Weixi-Zhu/mm-gmem-add-heterogeneous-NUMA-node/20231128-205404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20231128125025.4449-7-weixi.zhu%40huawei.com
patch subject: [RFC PATCH 6/6] mm/gmem: extending Linux core MM to support unified virtual address space
config: i386-buildonly-randconfig-005-20231129 (https://download.01.org/0day-ci/archive/20231129/202311290751.mqDVtXS9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311290751.mqDVtXS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290751.mqDVtXS9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/huge_memory.c:40:
   include/linux/gmem.h:338:65: warning: 'struct gm_as' declared inside parameter list will not be visible outside of this definition or declaration
     338 | int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as)
         |                                                                 ^~~~~
   include/linux/gmem.h:338:5: warning: no previous prototype for 'gm_as_create' [-Wmissing-prototypes]
     338 | int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as)
         |     ^~~~~~~~~~~~
   include/linux/gmem.h:342:26: warning: 'struct gm_as' declared inside parameter list will not be visible outside of this definition or declaration
     342 | int gm_as_destroy(struct gm_as *as)
         |                          ^~~~~
   include/linux/gmem.h:342:5: warning: no previous prototype for 'gm_as_destroy' [-Wmissing-prototypes]
     342 | int gm_as_destroy(struct gm_as *as)
         |     ^~~~~~~~~~~~~
   include/linux/gmem.h:347:40: warning: 'struct gm_context' declared inside parameter list will not be visible outside of this definition or declaration
     347 |                  bool activate, struct gm_context **out_ctx)
         |                                        ^~~~~~~~~~
   include/linux/gmem.h:346:61: warning: 'enum gm_mmu_mode' declared inside parameter list will not be visible outside of this definition or declaration
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |                                                             ^~~~~~~~~~~
   include/linux/gmem.h:346:43: warning: 'struct gm_dev' declared inside parameter list will not be visible outside of this definition or declaration
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |                                           ^~~~~~
   include/linux/gmem.h:346:25: warning: 'struct gm_as' declared inside parameter list will not be visible outside of this definition or declaration
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |                         ^~~~~
   include/linux/gmem.h:346:73: error: parameter 3 ('mode') has incomplete type
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |                                                        ~~~~~~~~~~~~~~~~~^~~~
   include/linux/gmem.h:346:5: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |     ^~~~~~~~~~~~
   mm/huge_memory.c: In function '__do_huge_pmd_anonymous_page':
   mm/huge_memory.c:691:57: error: 'struct mm_struct' has no member named 'vm_obj'
     691 |                 gm_mapping = vm_object_lookup(vma->vm_mm->vm_obj, haddr);
         |                                                         ^~
   mm/huge_memory.c:716:42: error: implicit declaration of function 'gm_mapping_cpu' [-Werror=implicit-function-declaration]
     716 |         if (!(vma_is_peer_shared(vma) && gm_mapping_cpu(gm_mapping)))
         |                                          ^~~~~~~~~~~~~~
   mm/huge_memory.c:750:48: error: implicit declaration of function 'gm_mapping_device' [-Werror=implicit-function-declaration]
     750 |                 if (vma_is_peer_shared(vma) && gm_mapping_device(gm_mapping)) {
         |                                                ^~~~~~~~~~~~~~~~~
   mm/huge_memory.c:752:31: error: implicit declaration of function 'gm_host_fault_locked'; did you mean 'assert_fault_locked'? [-Werror=implicit-function-declaration]
     752 |                         ret = gm_host_fault_locked(vmf, PMD_ORDER);
         |                               ^~~~~~~~~~~~~~~~~~~~
         |                               assert_fault_locked
   mm/huge_memory.c:765:25: error: implicit declaration of function 'gm_mapping_flags_set' [-Werror=implicit-function-declaration]
     765 |                         gm_mapping_flags_set(gm_mapping, GM_PAGE_CPU);
         |                         ^~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:765:58: error: 'GM_PAGE_CPU' undeclared (first use in this function)
     765 |                         gm_mapping_flags_set(gm_mapping, GM_PAGE_CPU);
         |                                                          ^~~~~~~~~~~
   mm/huge_memory.c:765:58: note: each undeclared identifier is reported only once for each function it appears in
>> mm/huge_memory.c:766:35: error: invalid use of undefined type 'struct gm_mapping'
     766 |                         gm_mapping->page = page;
         |                                   ^~
   mm/huge_memory.c:767:49: error: invalid use of undefined type 'struct gm_mapping'
     767 |                         mutex_unlock(&gm_mapping->lock);
         |                                                 ^~
   mm/huge_memory.c:780:41: error: invalid use of undefined type 'struct gm_mapping'
     780 |                 mutex_unlock(&gm_mapping->lock);
         |                                         ^~
   mm/huge_memory.c: In function 'do_huge_pmd_anonymous_page':
   mm/huge_memory.c:845:54: error: 'struct mm_struct' has no member named 'vm_obj'
     845 |                 struct vm_object *vm_obj = vma->vm_mm->vm_obj;
         |                                                      ^~
   In file included from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1092,
                    from mm/huge_memory.c:8:
>> mm/huge_memory.c:847:31: error: invalid use of undefined type 'struct vm_object'
     847 |                 xa_lock(vm_obj->logical_page_table);
         |                               ^~
   include/linux/xarray.h:532:45: note: in definition of macro 'xa_lock'
     532 | #define xa_lock(xa)             spin_lock(&(xa)->xa_lock)
         |                                             ^~
   mm/huge_memory.c:853:33: error: invalid use of undefined type 'struct vm_object'
     853 |                 xa_unlock(vm_obj->logical_page_table);
         |                                 ^~
   include/linux/xarray.h:533:47: note: in definition of macro 'xa_unlock'
     533 | #define xa_unlock(xa)           spin_unlock(&(xa)->xa_lock)
         |                                               ^~
   mm/huge_memory.c:854:39: error: invalid use of undefined type 'struct gm_mapping'
     854 |                 mutex_lock(&gm_mapping->lock);
         |                                       ^~
   mm/huge_memory.c:856:49: error: invalid use of undefined type 'struct gm_mapping'
     856 |                         mutex_unlock(&gm_mapping->lock);
         |                                                 ^~
   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   mm/huge_memory.c:914:46: error: invalid use of undefined type 'struct gm_mapping'
     914 |                 folio = page_folio(gm_mapping->page);
         |                                              ^~
   include/linux/page-flags.h:269:44: note: in definition of macro 'page_folio'
     269 | #define page_folio(p)           (_Generic((p),                          \
         |                                            ^
   mm/huge_memory.c:931:41: error: invalid use of undefined type 'struct gm_mapping'
     931 |                 mutex_unlock(&gm_mapping->lock);
         |                                         ^~
   cc1: some warnings being treated as errors


vim +766 mm/huge_memory.c

   679	
   680	static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
   681				struct page *page, gfp_t gfp)
   682	{
   683		struct vm_area_struct *vma = vmf->vma;
   684		struct folio *folio = page_folio(page);
   685		pgtable_t pgtable;
   686		unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
   687		vm_fault_t ret = 0;
   688		struct gm_mapping *gm_mapping = NULL;
   689	
   690		if (vma_is_peer_shared(vma))
   691			gm_mapping = vm_object_lookup(vma->vm_mm->vm_obj, haddr);
   692	
   693		VM_BUG_ON_FOLIO(!folio_test_large(folio), folio);
   694	
   695		if (mem_cgroup_charge(folio, vma->vm_mm, gfp)) {
   696			folio_put(folio);
   697			count_vm_event(THP_FAULT_FALLBACK);
   698			count_vm_event(THP_FAULT_FALLBACK_CHARGE);
   699			ret = VM_FAULT_FALLBACK;
   700			goto gm_mapping_release;
   701		}
   702		folio_throttle_swaprate(folio, gfp);
   703	
   704		pgtable = pte_alloc_one(vma->vm_mm);
   705		if (unlikely(!pgtable)) {
   706			ret = VM_FAULT_OOM;
   707			goto release;
   708		}
   709	
   710		/*
   711		 * Skip zero-filling page if the logical mapping indicates
   712		 * that page contains valid data of the virtual address. This
   713		 * could happen if the page was a victim of device memory
   714		 * oversubscription.
   715		 */
   716		if (!(vma_is_peer_shared(vma) && gm_mapping_cpu(gm_mapping)))
   717			clear_huge_page(page, vmf->address, HPAGE_PMD_NR);
   718		/*
   719		 * The memory barrier inside __folio_mark_uptodate makes sure that
   720		 * clear_huge_page writes become visible before the set_pmd_at()
   721		 * write.
   722		 */
   723		__folio_mark_uptodate(folio);
   724	
   725		vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
   726		if (unlikely(!pmd_none(*vmf->pmd))) {
   727			goto unlock_release;
   728		} else {
   729			pmd_t entry;
   730	
   731			ret = check_stable_address_space(vma->vm_mm);
   732			if (ret)
   733				goto unlock_release;
   734	
   735			/* Deliver the page fault to userland */
   736			if (userfaultfd_missing(vma)) {
   737				spin_unlock(vmf->ptl);
   738				folio_put(folio);
   739				pte_free(vma->vm_mm, pgtable);
   740				ret = handle_userfault(vmf, VM_UFFD_MISSING);
   741				VM_BUG_ON(ret & VM_FAULT_FALLBACK);
   742				goto gm_mapping_release;
   743			}
   744	
   745			entry = mk_huge_pmd(page, vma->vm_page_prot);
   746			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
   747			folio_add_new_anon_rmap(folio, vma, haddr);
   748			folio_add_lru_vma(folio, vma);
   749			pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
   750			if (vma_is_peer_shared(vma) && gm_mapping_device(gm_mapping)) {
   751				vmf->page = page;
   752				ret = gm_host_fault_locked(vmf, PMD_ORDER);
   753				if (ret)
   754					goto unlock_release;
   755			}
   756	
   757			set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
   758			update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
   759			add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
   760			mm_inc_nr_ptes(vma->vm_mm);
   761			spin_unlock(vmf->ptl);
   762			count_vm_event(THP_FAULT_ALLOC);
   763			count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
   764			if (vma_is_peer_shared(vma)) {
 > 765				gm_mapping_flags_set(gm_mapping, GM_PAGE_CPU);
 > 766				gm_mapping->page = page;
   767				mutex_unlock(&gm_mapping->lock);
   768			}
   769		}
   770	
   771		return 0;
   772	unlock_release:
   773		spin_unlock(vmf->ptl);
   774	release:
   775		if (pgtable)
   776			pte_free(vma->vm_mm, pgtable);
   777		folio_put(folio);
   778	gm_mapping_release:
   779		if (vma_is_peer_shared(vma))
   780			mutex_unlock(&gm_mapping->lock);
   781		return ret;
   782	
   783	}
   784	
   785	/*
   786	 * always: directly stall for all thp allocations
   787	 * defer: wake kswapd and fail if not immediately available
   788	 * defer+madvise: wake kswapd and directly stall for MADV_HUGEPAGE, otherwise
   789	 *		  fail if not immediately available
   790	 * madvise: directly stall for MADV_HUGEPAGE, otherwise fail if not immediately
   791	 *	    available
   792	 * never: never stall for any thp allocation
   793	 */
   794	gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma)
   795	{
   796		const bool vma_madvised = vma && (vma->vm_flags & VM_HUGEPAGE);
   797	
   798		/* Always do synchronous compaction */
   799		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_hugepage_flags))
   800			return GFP_TRANSHUGE | (vma_madvised ? 0 : __GFP_NORETRY);
   801	
   802		/* Kick kcompactd and fail quickly */
   803		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_hugepage_flags))
   804			return GFP_TRANSHUGE_LIGHT | __GFP_KSWAPD_RECLAIM;
   805	
   806		/* Synchronous compaction if madvised, otherwise kick kcompactd */
   807		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transparent_hugepage_flags))
   808			return GFP_TRANSHUGE_LIGHT |
   809				(vma_madvised ? __GFP_DIRECT_RECLAIM :
   810						__GFP_KSWAPD_RECLAIM);
   811	
   812		/* Only do synchronous compaction if madvised */
   813		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_hugepage_flags))
   814			return GFP_TRANSHUGE_LIGHT |
   815			       (vma_madvised ? __GFP_DIRECT_RECLAIM : 0);
   816	
   817		return GFP_TRANSHUGE_LIGHT;
   818	}
   819	
   820	/* Caller must hold page table lock. */
   821	static void set_huge_zero_page(pgtable_t pgtable, struct mm_struct *mm,
   822			struct vm_area_struct *vma, unsigned long haddr, pmd_t *pmd,
   823			struct page *zero_page)
   824	{
   825		pmd_t entry;
   826		if (!pmd_none(*pmd))
   827			return;
   828		entry = mk_pmd(zero_page, vma->vm_page_prot);
   829		entry = pmd_mkhuge(entry);
   830		pgtable_trans_huge_deposit(mm, pmd, pgtable);
   831		set_pmd_at(mm, haddr, pmd, entry);
   832		mm_inc_nr_ptes(mm);
   833	}
   834	
   835	vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
   836	{
   837		struct vm_area_struct *vma = vmf->vma;
   838		gfp_t gfp;
   839		struct folio *folio = NULL;
   840		unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
   841		vm_fault_t ret = 0;
   842		struct gm_mapping *gm_mapping;
   843	
   844		if (vma_is_peer_shared(vma)) {
 > 845			struct vm_object *vm_obj = vma->vm_mm->vm_obj;
   846	
 > 847			xa_lock(vm_obj->logical_page_table);
   848			gm_mapping = vm_object_lookup(vm_obj, haddr);
   849			if (!gm_mapping) {
   850				vm_object_mapping_create(vm_obj, haddr);
   851				gm_mapping = vm_object_lookup(vm_obj, haddr);
   852			}
   853			xa_unlock(vm_obj->logical_page_table);
   854			mutex_lock(&gm_mapping->lock);
   855			if (unlikely(!pmd_none(*vmf->pmd))) {
   856				mutex_unlock(&gm_mapping->lock);
   857				goto gm_mapping_release;
   858			}
   859		}
   860	
   861		if (!transhuge_vma_suitable(vma, haddr)) {
   862			ret = VM_FAULT_FALLBACK;
   863			goto gm_mapping_release;
   864		}
   865		if (unlikely(anon_vma_prepare(vma))) {
   866			ret = VM_FAULT_OOM;
   867			goto gm_mapping_release;
   868		}
   869		khugepaged_enter_vma(vma, vma->vm_flags);
   870	
   871		if (!(vmf->flags & FAULT_FLAG_WRITE) &&
   872				!mm_forbids_zeropage(vma->vm_mm) &&
   873				!vma_is_peer_shared(vma) &&
   874				transparent_hugepage_use_zero_page()) {
   875			pgtable_t pgtable;
   876			struct page *zero_page;
   877			vm_fault_t ret;
   878			pgtable = pte_alloc_one(vma->vm_mm);
   879			if (unlikely(!pgtable))
   880				return VM_FAULT_OOM;
   881			zero_page = mm_get_huge_zero_page(vma->vm_mm);
   882			if (unlikely(!zero_page)) {
   883				pte_free(vma->vm_mm, pgtable);
   884				count_vm_event(THP_FAULT_FALLBACK);
   885				return VM_FAULT_FALLBACK;
   886			}
   887			vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
   888			ret = 0;
   889			if (pmd_none(*vmf->pmd)) {
   890				ret = check_stable_address_space(vma->vm_mm);
   891				if (ret) {
   892					spin_unlock(vmf->ptl);
   893					pte_free(vma->vm_mm, pgtable);
   894				} else if (userfaultfd_missing(vma)) {
   895					spin_unlock(vmf->ptl);
   896					pte_free(vma->vm_mm, pgtable);
   897					ret = handle_userfault(vmf, VM_UFFD_MISSING);
   898					VM_BUG_ON(ret & VM_FAULT_FALLBACK);
   899				} else {
   900					set_huge_zero_page(pgtable, vma->vm_mm, vma,
   901							   haddr, vmf->pmd, zero_page);
   902					update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
   903					spin_unlock(vmf->ptl);
   904				}
   905			} else {
   906				spin_unlock(vmf->ptl);
   907				pte_free(vma->vm_mm, pgtable);
   908			}
   909			return ret;
   910		}
   911		gfp = vma_thp_gfp_mask(vma);
   912	
   913		if (vma_is_peer_shared(vma) && gm_mapping_cpu(gm_mapping))
   914			folio = page_folio(gm_mapping->page);
   915		if (!folio) {
   916			if (vma_is_peer_shared(vma))
   917				gfp = GFP_TRANSHUGE;
   918			folio = vma_alloc_folio(gfp, HPAGE_PMD_ORDER, vma, haddr, true);
   919		}
   920		folio = vma_alloc_folio(gfp, HPAGE_PMD_ORDER, vma, haddr, true);
   921	
   922		if (unlikely(!folio)) {
   923			count_vm_event(THP_FAULT_FALLBACK);
   924			ret = VM_FAULT_FALLBACK;
   925			goto gm_mapping_release;
   926		}
   927		return __do_huge_pmd_anonymous_page(vmf, &folio->page, gfp);
   928	
   929	gm_mapping_release:
   930		if (vma_is_peer_shared(vma))
   931			mutex_unlock(&gm_mapping->lock);
   932		return ret;
   933	}
   934	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
