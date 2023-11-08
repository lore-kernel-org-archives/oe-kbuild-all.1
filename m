Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F9CA4C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmyGm52F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699422995; x=1730958995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z6aiQsy3iYbWRx5kU1awLvpr92Vfgum+QI6Ey77wc+4=;
  b=YmyGm52FkEjFtxoGU0AwY5wEV1akpL8FZOZ/Zw0X0dp6GuVmuLWXNasS
   tON1PmZIsvlFUYrVjmG5c0BN6+pd89oTUMi0NlEstNPRGuAJ1l/fRueGu
   ov/hlrF20f7cu5exzoLnf27d5bNfhBS8bKBIFr21K3+KxcXRpnI2M8anA
   AiewS7osH9Jf4ubQf78oGeLmHkQOONwXIMdr5ouAo8c7YTmYsfHHAyxuh
   3pwg+ZqkcewUUxvSJOqbOir7er1IeGqYHJ4b5/pcq9KYwbSajEcetmgD7
   mWxD+VX4l21aeh6eFYl+v8WgEBLcjdZD+8trXCj2mIBou3qGO1IRw06sD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8348739"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="8348739"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 21:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880095785"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="880095785"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2023 21:56:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0bYB-0007ie-2e;
	Wed, 08 Nov 2023 05:56:27 +0000
Date: Wed, 8 Nov 2023 13:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Fuad Tabba <tabba@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [intel-tdx:kvm-upstream-next 7/321] arch/loongarch/kvm/mmu.c:422:1:
 warning: control reaches end of non-void function
Message-ID: <202311081318.kWHCGaJJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   b6ce7ab288890b0d531d7be9e01dad957ae6857d
commit: e63c8433fb7c60f1f7ac2d80a06e69b68e88d6d4 [7/321] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to CONFIG_KVM_GENERIC_MMU_NOTIFIER
config: loongarch-randconfig-002-20231108 (https://download.01.org/0day-ci/archive/20231108/202311081318.kWHCGaJJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081318.kWHCGaJJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081318.kWHCGaJJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kvm/mmu.c:411:6: warning: no previous prototype for 'kvm_unmap_gfn_range' [-Wmissing-prototypes]
     411 | bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kvm/mmu.c: In function 'kvm_unmap_gfn_range':
   arch/loongarch/kvm/mmu.c:420:48: error: invalid use of undefined type 'struct kvm_gfn_range'
     420 |         return kvm_ptw_top(kvm->arch.pgd, range->start << PAGE_SHIFT,
         |                                                ^~
   arch/loongarch/kvm/mmu.c:421:30: error: invalid use of undefined type 'struct kvm_gfn_range'
     421 |                         range->end << PAGE_SHIFT, &ctx);
         |                              ^~
   arch/loongarch/kvm/mmu.c: At top level:
   arch/loongarch/kvm/mmu.c:424:6: warning: no previous prototype for 'kvm_set_spte_gfn' [-Wmissing-prototypes]
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
   arch/loongarch/kvm/mmu.c:456:6: warning: no previous prototype for 'kvm_age_gfn' [-Wmissing-prototypes]
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
   arch/loongarch/kvm/mmu.c:468:6: warning: no previous prototype for 'kvm_test_age_gfn' [-Wmissing-prototypes]
     468 | bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
         |      ^~~~~~~~~~~~~~~~
   arch/loongarch/kvm/mmu.c: In function 'kvm_test_age_gfn':
   arch/loongarch/kvm/mmu.c:470:26: error: invalid use of undefined type 'struct kvm_gfn_range'
     470 |         gpa_t gpa = range->start << PAGE_SHIFT;
         |                          ^~
   arch/loongarch/kvm/mmu.c: In function 'kvm_map_page':
   arch/loongarch/kvm/mmu.c:787:24: error: 'struct kvm' has no member named 'mmu_invalidate_seq'; did you mean 'mn_invalidate_lock'?
     787 |         mmu_seq = kvm->mmu_invalidate_seq;
         |                        ^~~~~~~~~~~~~~~~~~
         |                        mn_invalidate_lock
   arch/loongarch/kvm/mmu.c:810:13: error: implicit declaration of function 'mmu_invalidate_retry_hva' [-Werror=implicit-function-declaration]
     810 |         if (mmu_invalidate_retry_hva(kvm, mmu_seq, hva)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kvm/mmu.c: In function 'kvm_unmap_gfn_range':
>> arch/loongarch/kvm/mmu.c:422:1: warning: control reaches end of non-void function [-Wreturn-type]
     422 | }
         | ^
   arch/loongarch/kvm/mmu.c: In function 'kvm_age_gfn':
   arch/loongarch/kvm/mmu.c:466:1: warning: control reaches end of non-void function [-Wreturn-type]
     466 | }
         | ^
   cc1: some warnings being treated as errors


vim +422 arch/loongarch/kvm/mmu.c

752e2cd7b4fb412 Tianrui Zhao 2023-10-02  410  
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  411  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  412  {
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  413  	kvm_ptw_ctx ctx;
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  414  
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  415  	ctx.flag = 0;
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  416  	ctx.ops = kvm_flush_pte;
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  417  	kvm_ptw_prepare(kvm, &ctx);
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  418  	INIT_LIST_HEAD(&ctx.list);
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  419  
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  420  	return kvm_ptw_top(kvm->arch.pgd, range->start << PAGE_SHIFT,
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  421  			range->end << PAGE_SHIFT, &ctx);
752e2cd7b4fb412 Tianrui Zhao 2023-10-02 @422  }
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  423  

:::::: The code at line 422 was first introduced by commit
:::::: 752e2cd7b4fb412f3e008493e0195e357bab9773 LoongArch: KVM: Implement kvm mmu operations

:::::: TO: Tianrui Zhao <zhaotianrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
