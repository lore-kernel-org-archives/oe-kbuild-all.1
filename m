Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294EF15E81
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVyEet5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698669801; x=1730205801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lYq6O93fWQBmtBx1IlmiYxM9szjmXUR66/9dG0o3Tc0=;
  b=BVyEet5OHNyrMHSJhjzbHwxuCDfv73nEiAxev8rbesxlerb44nfHTrF0
   oqq/8OOtvNQy1MVIUjoUPnbnEkCIOD7oW3jAMD6k/2AM1Q9wwWiVZdrLf
   3tou026VJnMegUQr63rojQJk2EAqoTko47lkMab9jEiSKz8EmT1DySOZZ
   x2n/yu5CX0Dw8lCrNlB+29d04PhUmKCiBDef0ZnFNTjGlmxVggCkAr8Lq
   o46DHY+hC9Y9NhM7XndRQaVIe/fOxKs/0HBwm2NygShr7tonm5MY5Yvnk
   lER+jxolYpvxrRvxpK3qAfykdj2TEdtGKZ8AFBfnBTu+Ux3NANx2x2/WC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="378434329"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="378434329"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 05:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="789445599"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="789445599"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Oct 2023 05:43:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxRbw-000DGn-1h;
	Mon, 30 Oct 2023 12:43:16 +0000
Date: Mon, 30 Oct 2023 20:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 16069/16121] arch/loongarch/kvm/mmu.c:420:48:
 error: invalid use of undefined type 'struct kvm_gfn_range'
Message-ID: <202310302025.Pokm9vEs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c503e3eec382ac708ee7adf874add37b77c5d312
commit: bd6afa009a287836d57be3c25f6de989284bc072 [16069/16121] Merge branch 'next' of https://github.com/kvm-x86/linux.git
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231030/202310302025.Pokm9vEs-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310302025.Pokm9vEs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310302025.Pokm9vEs-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/loongarch/kvm/mmu.c:411:6: warning: no previous prototype for 'kvm_unmap_gfn_range' [-Wmissing-prototypes]
     411 | bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kvm/mmu.c: In function 'kvm_unmap_gfn_range':
>> arch/loongarch/kvm/mmu.c:420:48: error: invalid use of undefined type 'struct kvm_gfn_range'
     420 |         return kvm_ptw_top(kvm->arch.pgd, range->start << PAGE_SHIFT,
         |                                                ^~
   arch/loongarch/kvm/mmu.c:421:30: error: invalid use of undefined type 'struct kvm_gfn_range'
     421 |                         range->end << PAGE_SHIFT, &ctx);
         |                              ^~
   arch/loongarch/kvm/mmu.c: At top level:
>> arch/loongarch/kvm/mmu.c:424:6: warning: no previous prototype for 'kvm_set_spte_gfn' [-Wmissing-prototypes]
     424 | bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
         |      ^~~~~~~~~~~~~~~~
   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/highmem.h:5,
                    from arch/loongarch/kvm/mmu.c:6:
   arch/loongarch/kvm/mmu.c: In function 'kvm_set_spte_gfn':
   arch/loongarch/kvm/mmu.c:428:38: error: invalid use of undefined type 'struct kvm_gfn_range'
     428 |         kvm_pfn_t pfn = pte_pfn(range->arg.pte);
         |                                      ^~
   arch/loongarch/include/asm/pgtable.h:253:52: note: in definition of macro 'pte_pfn'
     253 | #define pte_pfn(x)              ((unsigned long)(((x).pte & _PFN_MASK) >> PFN_PTE_SHIFT))
         |                                                    ^
   arch/loongarch/kvm/mmu.c:429:26: error: invalid use of undefined type 'struct kvm_gfn_range'
     429 |         gpa_t gpa = range->start << PAGE_SHIFT;
         |                          ^~
   In file included from include/linux/mm_types_task.h:16,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13:
   arch/loongarch/kvm/mmu.c:443:49: error: invalid use of undefined type 'struct kvm_gfn_range'
     443 |         prot_bits |= _CACHE_MASK & pte_val(range->arg.pte);
         |                                                 ^~
   arch/loongarch/include/asm/page.h:59:27: note: in definition of macro 'pte_val'
      59 | #define pte_val(x)      ((x).pte)
         |                           ^
   arch/loongarch/kvm/mmu.c:450:57: error: invalid use of undefined type 'struct kvm_gfn_range'
     450 |         prot_bits |= __WRITEABLE & *ptep & pte_val(range->arg.pte);
         |                                                         ^~
   arch/loongarch/include/asm/page.h:59:27: note: in definition of macro 'pte_val'
      59 | #define pte_val(x)      ((x).pte)
         |                           ^
   arch/loongarch/kvm/mmu.c: At top level:
>> arch/loongarch/kvm/mmu.c:456:6: warning: no previous prototype for 'kvm_age_gfn' [-Wmissing-prototypes]
     456 | bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
         |      ^~~~~~~~~~~
   arch/loongarch/kvm/mmu.c: In function 'kvm_age_gfn':
   arch/loongarch/kvm/mmu.c:464:48: error: invalid use of undefined type 'struct kvm_gfn_range'
     464 |         return kvm_ptw_top(kvm->arch.pgd, range->start << PAGE_SHIFT,
         |                                                ^~
   arch/loongarch/kvm/mmu.c:465:38: error: invalid use of undefined type 'struct kvm_gfn_range'
     465 |                                 range->end << PAGE_SHIFT, &ctx);
         |                                      ^~
   arch/loongarch/kvm/mmu.c: At top level:
>> arch/loongarch/kvm/mmu.c:468:6: warning: no previous prototype for 'kvm_test_age_gfn' [-Wmissing-prototypes]
     468 | bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
         |      ^~~~~~~~~~~~~~~~
   arch/loongarch/kvm/mmu.c: In function 'kvm_test_age_gfn':
   arch/loongarch/kvm/mmu.c:470:26: error: invalid use of undefined type 'struct kvm_gfn_range'
     470 |         gpa_t gpa = range->start << PAGE_SHIFT;
         |                          ^~
   arch/loongarch/kvm/mmu.c: In function 'kvm_map_page':
>> arch/loongarch/kvm/mmu.c:787:24: error: 'struct kvm' has no member named 'mmu_invalidate_seq'; did you mean 'mn_invalidate_lock'?
     787 |         mmu_seq = kvm->mmu_invalidate_seq;
         |                        ^~~~~~~~~~~~~~~~~~
         |                        mn_invalidate_lock
>> arch/loongarch/kvm/mmu.c:810:13: error: implicit declaration of function 'mmu_invalidate_retry_hva' [-Werror=implicit-function-declaration]
     810 |         if (mmu_invalidate_retry_hva(kvm, mmu_seq, hva)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kvm/mmu.c: In function 'kvm_unmap_gfn_range':
>> arch/loongarch/kvm/mmu.c:422:1: error: control reaches end of non-void function [-Werror=return-type]
     422 | }
         | ^
   arch/loongarch/kvm/mmu.c: In function 'kvm_age_gfn':
   arch/loongarch/kvm/mmu.c:466:1: error: control reaches end of non-void function [-Werror=return-type]
     466 | }
         | ^
   cc1: some warnings being treated as errors


vim +420 arch/loongarch/kvm/mmu.c

752e2cd7b4fb41 Tianrui Zhao 2023-10-02  410  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02 @411  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  412  {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  413  	kvm_ptw_ctx ctx;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  414  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  415  	ctx.flag = 0;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  416  	ctx.ops = kvm_flush_pte;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  417  	kvm_ptw_prepare(kvm, &ctx);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  418  	INIT_LIST_HEAD(&ctx.list);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  419  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02 @420  	return kvm_ptw_top(kvm->arch.pgd, range->start << PAGE_SHIFT,
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  421  			range->end << PAGE_SHIFT, &ctx);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02 @422  }
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  423  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02 @424  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  425  {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  426  	unsigned long prot_bits;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  427  	kvm_pte_t *ptep;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  428  	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  429  	gpa_t gpa = range->start << PAGE_SHIFT;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  430  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  431  	ptep = kvm_populate_gpa(kvm, NULL, gpa, 0);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  432  	if (!ptep)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  433  		return false;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  434  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  435  	/* Replacing an absent or old page doesn't need flushes */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  436  	if (!kvm_pte_present(NULL, ptep) || !kvm_pte_young(*ptep)) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  437  		kvm_set_pte(ptep, 0);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  438  		return false;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  439  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  440  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  441  	/* Fill new pte if write protected or page migrated */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  442  	prot_bits = _PAGE_PRESENT | __READABLE;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  443  	prot_bits |= _CACHE_MASK & pte_val(range->arg.pte);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  444  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  445  	/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  446  	 * Set _PAGE_WRITE or _PAGE_DIRTY iff old and new pte both support
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  447  	 * _PAGE_WRITE for map_page_fast if next page write fault
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  448  	 * _PAGE_DIRTY since gpa has already recorded as dirty page
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  449  	 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  450  	prot_bits |= __WRITEABLE & *ptep & pte_val(range->arg.pte);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  451  	kvm_set_pte(ptep, kvm_pfn_pte(pfn, __pgprot(prot_bits)));
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  452  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  453  	return true;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  454  }
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  455  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02 @456  bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  457  {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  458  	kvm_ptw_ctx ctx;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  459  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  460  	ctx.flag = 0;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  461  	ctx.ops = kvm_mkold_pte;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  462  	kvm_ptw_prepare(kvm, &ctx);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  463  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  464  	return kvm_ptw_top(kvm->arch.pgd, range->start << PAGE_SHIFT,
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  465  				range->end << PAGE_SHIFT, &ctx);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  466  }
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  467  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02 @468  bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  469  {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  470  	gpa_t gpa = range->start << PAGE_SHIFT;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  471  	kvm_pte_t *ptep = kvm_populate_gpa(kvm, NULL, gpa, 0);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  472  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  473  	if (ptep && kvm_pte_present(NULL, ptep) && kvm_pte_young(*ptep))
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  474  		return true;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  475  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  476  	return false;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  477  }
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  478  

:::::: The code at line 420 was first introduced by commit
:::::: 752e2cd7b4fb412f3e008493e0195e357bab9773 LoongArch: KVM: Implement kvm mmu operations

:::::: TO: Tianrui Zhao <zhaotianrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
