Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938AB1BDC2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvAgFFvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705410382; x=1736946382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYMCjLndvrLudMuBlFl1gZbK2c6ujTtK9rRK9/yEb7g=;
  b=ZvAgFFvw0QxK0tzMf8F9Un2jxjxtTezolHQQUnmPMqEunbjHczaO2ZsQ
   xbM/B9A6q7VmHlBBjjCm1gZdEdnlUFh61nzkakEXW98gWz9FY4yu+h0b8
   1bwWB2sxyPl2SGvdK2++Zqu67uluHQb0NXmACIxwrsYt5yj/VkpdNQS0W
   iCywHKO2QvQhK8WQB2lThzeeqpApDO11vvx2H1vRcJ7OtiwYjQv1mFm+o
   /Hss6u/OoN9j4uzZStL/sTQI9AnVTUS9SjZNf/DDFzdycOv4eHKxRyE48
   /G8l5rCFBfrmjzeEtdDXssrpoQeCXgNI4K+Qo125LHB5vOyjOf7tHnUhu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="398719963"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="398719963"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 05:06:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="854347169"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="854347169"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jan 2024 05:06:07 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPj8n-0000iG-1R;
	Tue, 16 Jan 2024 13:06:05 +0000
Date: Tue, 16 Jan 2024 21:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>
Subject: [linux-next:master 697/13343] arch/loongarch/kvm/mmu.c:810:13:
 error: implicit declaration of function 'mmu_invalidate_retry_hva'; did you
 mean 'mmu_invalidate_retry_gfn'?
Message-ID: <202401162158.2FqwkuiP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
commit: 8569992d64b8f750e34b7858eac5d7daaf0f80fd [697/13343] KVM: Use gfn instead of hva for mmu_notifier_retry
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240116/202401162158.2FqwkuiP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401162158.2FqwkuiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401162158.2FqwkuiP-lkp@intel.com/

Note: the linux-next/master HEAD 8d04a7e2ee3fd6aabb8096b00c64db0d735bc874 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arch/loongarch/kvm/mmu.c: In function 'kvm_map_page':
>> arch/loongarch/kvm/mmu.c:810:13: error: implicit declaration of function 'mmu_invalidate_retry_hva'; did you mean 'mmu_invalidate_retry_gfn'? [-Werror=implicit-function-declaration]
     810 |         if (mmu_invalidate_retry_hva(kvm, mmu_seq, hva)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
         |             mmu_invalidate_retry_gfn
   cc1: some warnings being treated as errors


vim +810 arch/loongarch/kvm/mmu.c

752e2cd7b4fb41 Tianrui Zhao 2023-10-02  732  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  733  /*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  734   * kvm_map_page() - Map a guest physical page.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  735   * @vcpu:		vCPU pointer.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  736   * @gpa:		Guest physical address of fault.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  737   * @write:	Whether the fault was due to a write.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  738   *
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  739   * Handle GPA faults by creating a new GPA mapping (or updating an existing
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  740   * one).
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  741   *
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  742   * This takes care of marking pages young or dirty (idle/dirty page tracking),
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  743   * asking KVM for the corresponding PFN, and creating a mapping in the GPA page
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  744   * tables. Derived mappings (GVA page tables and TLBs) must be handled by the
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  745   * caller.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  746   *
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  747   * Returns:	0 on success
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  748   *		-EFAULT if there is no memory region at @gpa or a write was
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  749   *		attempted to a read-only memory region. This is usually handled
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  750   *		as an MMIO access.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  751   */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  752  static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  753  {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  754  	bool writeable;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  755  	int srcu_idx, err, retry_no = 0, level;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  756  	unsigned long hva, mmu_seq, prot_bits;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  757  	kvm_pfn_t pfn;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  758  	kvm_pte_t *ptep, new_pte;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  759  	gfn_t gfn = gpa >> PAGE_SHIFT;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  760  	struct kvm *kvm = vcpu->kvm;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  761  	struct kvm_memory_slot *memslot;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  762  	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  763  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  764  	/* Try the fast path to handle old / clean pages */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  765  	srcu_idx = srcu_read_lock(&kvm->srcu);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  766  	err = kvm_map_page_fast(vcpu, gpa, write);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  767  	if (!err)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  768  		goto out;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  769  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  770  	memslot = gfn_to_memslot(kvm, gfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  771  	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writeable);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  772  	if (kvm_is_error_hva(hva) || (write && !writeable)) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  773  		err = -EFAULT;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  774  		goto out;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  775  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  776  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  777  	/* We need a minimum of cached pages ready for page table creation */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  778  	err = kvm_mmu_topup_memory_cache(memcache, KVM_MMU_CACHE_MIN_PAGES);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  779  	if (err)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  780  		goto out;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  781  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  782  retry:
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  783  	/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  784  	 * Used to check for invalidations in progress, of the pfn that is
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  785  	 * returned by pfn_to_pfn_prot below.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  786  	 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  787  	mmu_seq = kvm->mmu_invalidate_seq;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  788  	/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  789  	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads in
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  790  	 * gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  791  	 * risk the page we get a reference to getting unmapped before we have a
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  792  	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  793  	 *
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  794  	 * This smp_rmb() pairs with the effective smp_wmb() of the combination
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  795  	 * of the pte_unmap_unlock() after the PTE is zapped, and the
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  796  	 * spin_lock() in kvm_mmu_invalidate_invalidate_<page|range_end>() before
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  797  	 * mmu_invalidate_seq is incremented.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  798  	 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  799  	smp_rmb();
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  800  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  801  	/* Slow path - ask KVM core whether we can access this GPA */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  802  	pfn = gfn_to_pfn_prot(kvm, gfn, write, &writeable);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  803  	if (is_error_noslot_pfn(pfn)) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  804  		err = -EFAULT;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  805  		goto out;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  806  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  807  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  808  	/* Check if an invalidation has taken place since we got pfn */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  809  	spin_lock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02 @810  	if (mmu_invalidate_retry_hva(kvm, mmu_seq, hva)) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  811  		/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  812  		 * This can happen when mappings are changed asynchronously, but
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  813  		 * also synchronously if a COW is triggered by
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  814  		 * gfn_to_pfn_prot().
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  815  		 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  816  		spin_unlock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  817  		kvm_release_pfn_clean(pfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  818  		if (retry_no > 100) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  819  			retry_no = 0;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  820  			schedule();
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  821  		}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  822  		retry_no++;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  823  		goto retry;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  824  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  825  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  826  	/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  827  	 * For emulated devices such virtio device, actual cache attribute is
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  828  	 * determined by physical machine.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  829  	 * For pass through physical device, it should be uncachable
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  830  	 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  831  	prot_bits = _PAGE_PRESENT | __READABLE;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  832  	if (pfn_valid(pfn))
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  833  		prot_bits |= _CACHE_CC;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  834  	else
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  835  		prot_bits |= _CACHE_SUC;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  836  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  837  	if (writeable) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  838  		prot_bits |= _PAGE_WRITE;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  839  		if (write)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  840  			prot_bits |= __WRITEABLE;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  841  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  842  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  843  	/* Disable dirty logging on HugePages */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  844  	level = 0;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  845  	if (!fault_supports_huge_mapping(memslot, hva, PMD_SIZE, write)) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  846  		level = 0;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  847  	} else {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  848  		level = host_pfn_mapping_level(kvm, gfn, memslot);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  849  		if (level == 1) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  850  			gfn = gfn & ~(PTRS_PER_PTE - 1);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  851  			pfn = pfn & ~(PTRS_PER_PTE - 1);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  852  		}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  853  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  854  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  855  	/* Ensure page tables are allocated */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  856  	ptep = kvm_populate_gpa(kvm, memcache, gpa, level);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  857  	new_pte = kvm_pfn_pte(pfn, __pgprot(prot_bits));
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  858  	if (level == 1) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  859  		new_pte = kvm_pte_mkhuge(new_pte);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  860  		/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  861  		 * previous pmd entry is invalid_pte_table
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  862  		 * there is invalid tlb with small page
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  863  		 * need flush these invalid tlbs for current vcpu
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  864  		 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  865  		kvm_make_request(KVM_REQ_TLB_FLUSH, vcpu);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  866  		++kvm->stat.hugepages;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  867  	}  else if (kvm_pte_huge(*ptep) && write)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  868  		ptep = kvm_split_huge(vcpu, ptep, gfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  869  	else
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  870  		++kvm->stat.pages;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  871  	kvm_set_pte(ptep, new_pte);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  872  	spin_unlock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  873  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  874  	if (prot_bits & _PAGE_DIRTY) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  875  		mark_page_dirty_in_slot(kvm, memslot, gfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  876  		kvm_set_pfn_dirty(pfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  877  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  878  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  879  	kvm_set_pfn_accessed(pfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  880  	kvm_release_pfn_clean(pfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  881  out:
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  882  	srcu_read_unlock(&kvm->srcu, srcu_idx);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  883  	return err;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  884  }
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  885  

:::::: The code at line 810 was first introduced by commit
:::::: 752e2cd7b4fb412f3e008493e0195e357bab9773 LoongArch: KVM: Implement kvm mmu operations

:::::: TO: Tianrui Zhao <zhaotianrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
