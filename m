Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFD1C68AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719590909; cv=none; b=jk78D4FsNyJBsiUB2XGI5ubIf9WALqgtGODvEEHzYO8VSnmNiaGGas8x0tPCE/TfwiuOyIUzUD7OggYAtq5ftQ9z0ScWW3rJSIZEDqVkcrEIwd8/77JWLcshGpVIG6TcZXjmRekuHftsNBRVuR2r1JKKIKCQmQXzPZbff3IzWJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719590909; c=relaxed/simple;
	bh=t2EAy8X1rIcqkKVtZY5aX9JkkaT7Y6KhejNkuKBDBV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWpYetdnwAh8upeiIepBtJKo6jmJqF3eMd6kgV8NCDcb0kpQKmOd8ig9hxaWW/ibjR76vNx/YvkFq+BEi1PPXoFBOGawAmbwaSDkXMWaYms65vNt0ExqOsjeD8W9uNsJpp/rgtwqEFORa28vYwOoRNfXryc1W3aoKHaGP31Uyqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WR/7kLsk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WR/7kLsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719590907; x=1751126907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t2EAy8X1rIcqkKVtZY5aX9JkkaT7Y6KhejNkuKBDBV8=;
  b=WR/7kLskzoDSdz41OOj4AmTZm28mIM9yiWDR8jUVbORRetv9Rt59qhkD
   wumSqmTZMWRPSqjxgY7fkHD3acHJUIagGUjrqQ9m+jk78SyotZW5RGc8t
   IXTPfVDoOKtT+DduAmPfMPfuJk9RpQTBxezOnYGjg8jMaURXeB1QJm9PJ
   8OY+L/nI10Tyn4gVn2Sl4W7FAhsEZeMeEMOWWe5lID681MoTl/SFmFhrU
   nhmAdUsIce2J8ikeBNK/5C4vglDQNpl4IB1sQnJMHQiCVtb7t9BGgyuAs
   fX3zZOo7TNSoeuwVOzdnRmqNMngqmMrNK8Zyuj/aQB5YqJM5M+bGv5kMJ
   w==;
X-CSE-ConnectionGUID: 2wku6rA6RbW1DoObm1B2Ow==
X-CSE-MsgGUID: mQ6bHvq9SVaopSOMuuvfLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="17005103"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="17005103"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 09:08:26 -0700
X-CSE-ConnectionGUID: Qo+wlVuxT9KduHnMPkSoFw==
X-CSE-MsgGUID: klM3M0nVRF2kMiqfox5iPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="75979077"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jun 2024 09:08:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNE8w-000HJi-1T;
	Fri, 28 Jun 2024 16:08:10 +0000
Date: Sat, 29 Jun 2024 00:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_follow_pfn 73/92] arch/loongarch/kvm/mmu.c:810:31:
 error: passing argument 1 of 'kvm_faultin_pfn' from incompatible pointer
 type
Message-ID: <202406282351.ELJT96D6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   ddc17683711a347aaff45e1e0b178742df18ff4d
commit: f03397f70bfc8fe8ff9605632a2b27f17303fa72 [73/92] KVM: LoongArch: Use kvm_faultin_pfn() to map pfns into the guest
config: loongarch-randconfig-002-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282351.ELJT96D6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282351.ELJT96D6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282351.ELJT96D6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kvm/mmu.c: In function 'kvm_map_page_fast':
   arch/loongarch/kvm/mmu.c:538:19: warning: variable 'pfn' set but not used [-Wunused-but-set-variable]
     538 |         kvm_pfn_t pfn = 0;
         |                   ^~~
   arch/loongarch/kvm/mmu.c: In function 'kvm_map_page':
>> arch/loongarch/kvm/mmu.c:810:31: error: passing argument 1 of 'kvm_faultin_pfn' from incompatible pointer type [-Werror=incompatible-pointer-types]
     810 |         pfn = kvm_faultin_pfn(kvm, gfn, write, &writeable, &page);
         |                               ^~~
         |                               |
         |                               struct kvm *
   In file included from arch/loongarch/kvm/mmu.c:8:
   include/linux/kvm_host.h:1250:58: note: expected 'struct kvm_vcpu *' but argument is of type 'struct kvm *'
    1250 | static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
         |                                         ~~~~~~~~~~~~~~~~~^~~~
>> arch/loongarch/kvm/mmu.c:881:52: error: 'writable' undeclared (first use in this function); did you mean 'writeable'?
     881 |         kvm_release_faultin_page(kvm, page, false, writable);
         |                                                    ^~~~~~~~
         |                                                    writeable
   arch/loongarch/kvm/mmu.c:881:52: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/kvm_faultin_pfn +810 arch/loongarch/kvm/mmu.c

   739	
   740	/*
   741	 * kvm_map_page() - Map a guest physical page.
   742	 * @vcpu:		vCPU pointer.
   743	 * @gpa:		Guest physical address of fault.
   744	 * @write:	Whether the fault was due to a write.
   745	 *
   746	 * Handle GPA faults by creating a new GPA mapping (or updating an existing
   747	 * one).
   748	 *
   749	 * This takes care of marking pages young or dirty (idle/dirty page tracking),
   750	 * asking KVM for the corresponding PFN, and creating a mapping in the GPA page
   751	 * tables. Derived mappings (GVA page tables and TLBs) must be handled by the
   752	 * caller.
   753	 *
   754	 * Returns:	0 on success
   755	 *		-EFAULT if there is no memory region at @gpa or a write was
   756	 *		attempted to a read-only memory region. This is usually handled
   757	 *		as an MMIO access.
   758	 */
   759	static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
   760	{
   761		bool writeable;
   762		int srcu_idx, err, retry_no = 0, level;
   763		unsigned long hva, mmu_seq, prot_bits;
   764		kvm_pfn_t pfn;
   765		kvm_pte_t *ptep, new_pte;
   766		gfn_t gfn = gpa >> PAGE_SHIFT;
   767		struct kvm *kvm = vcpu->kvm;
   768		struct kvm_memory_slot *memslot;
   769		struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
   770		struct page *page;
   771	
   772		/* Try the fast path to handle old / clean pages */
   773		srcu_idx = srcu_read_lock(&kvm->srcu);
   774		err = kvm_map_page_fast(vcpu, gpa, write);
   775		if (!err)
   776			goto out;
   777	
   778		memslot = gfn_to_memslot(kvm, gfn);
   779		hva = gfn_to_hva_memslot_prot(memslot, gfn, &writeable);
   780		if (kvm_is_error_hva(hva) || (write && !writeable)) {
   781			err = -EFAULT;
   782			goto out;
   783		}
   784	
   785		/* We need a minimum of cached pages ready for page table creation */
   786		err = kvm_mmu_topup_memory_cache(memcache, KVM_MMU_CACHE_MIN_PAGES);
   787		if (err)
   788			goto out;
   789	
   790	retry:
   791		/*
   792		 * Used to check for invalidations in progress, of the pfn that is
   793		 * returned by pfn_to_pfn_prot below.
   794		 */
   795		mmu_seq = kvm->mmu_invalidate_seq;
   796		/*
   797		 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads in
   798		 * kvm_faultin_pfn() (which calls get_user_pages()), so that we don't
   799		 * risk the page we get a reference to getting unmapped before we have a
   800		 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
   801		 *
   802		 * This smp_rmb() pairs with the effective smp_wmb() of the combination
   803		 * of the pte_unmap_unlock() after the PTE is zapped, and the
   804		 * spin_lock() in kvm_mmu_invalidate_invalidate_<page|range_end>() before
   805		 * mmu_invalidate_seq is incremented.
   806		 */
   807		smp_rmb();
   808	
   809		/* Slow path - ask KVM core whether we can access this GPA */
 > 810		pfn = kvm_faultin_pfn(kvm, gfn, write, &writeable, &page);
   811		if (is_error_noslot_pfn(pfn)) {
   812			err = -EFAULT;
   813			goto out;
   814		}
   815	
   816		/* Check if an invalidation has taken place since we got pfn */
   817		spin_lock(&kvm->mmu_lock);
   818		if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
   819			/*
   820			 * This can happen when mappings are changed asynchronously, but
   821			 * also synchronously if a COW is triggered by
   822			 * kvm_faultin_pfn().
   823			 */
   824			spin_unlock(&kvm->mmu_lock);
   825			kvm_release_page_unused(page);
   826			if (retry_no > 100) {
   827				retry_no = 0;
   828				schedule();
   829			}
   830			retry_no++;
   831			goto retry;
   832		}
   833	
   834		/*
   835		 * For emulated devices such virtio device, actual cache attribute is
   836		 * determined by physical machine.
   837		 * For pass through physical device, it should be uncachable
   838		 */
   839		prot_bits = _PAGE_PRESENT | __READABLE;
   840		if (pfn_valid(pfn))
   841			prot_bits |= _CACHE_CC;
   842		else
   843			prot_bits |= _CACHE_SUC;
   844	
   845		if (writeable) {
   846			prot_bits |= _PAGE_WRITE;
   847			if (write)
   848				prot_bits |= __WRITEABLE;
   849		}
   850	
   851		/* Disable dirty logging on HugePages */
   852		level = 0;
   853		if (!fault_supports_huge_mapping(memslot, hva, write)) {
   854			level = 0;
   855		} else {
   856			level = host_pfn_mapping_level(kvm, gfn, memslot);
   857			if (level == 1) {
   858				gfn = gfn & ~(PTRS_PER_PTE - 1);
   859				pfn = pfn & ~(PTRS_PER_PTE - 1);
   860			}
   861		}
   862	
   863		/* Ensure page tables are allocated */
   864		ptep = kvm_populate_gpa(kvm, memcache, gpa, level);
   865		new_pte = kvm_pfn_pte(pfn, __pgprot(prot_bits));
   866		if (level == 1) {
   867			new_pte = kvm_pte_mkhuge(new_pte);
   868			/*
   869			 * previous pmd entry is invalid_pte_table
   870			 * there is invalid tlb with small page
   871			 * need flush these invalid tlbs for current vcpu
   872			 */
   873			kvm_make_request(KVM_REQ_TLB_FLUSH, vcpu);
   874			++kvm->stat.hugepages;
   875		}  else if (kvm_pte_huge(*ptep) && write)
   876			ptep = kvm_split_huge(vcpu, ptep, gfn);
   877		else
   878			++kvm->stat.pages;
   879		kvm_set_pte(ptep, new_pte);
   880	
 > 881		kvm_release_faultin_page(kvm, page, false, writable);
   882		spin_unlock(&kvm->mmu_lock);
   883	
   884		if (prot_bits & _PAGE_DIRTY)
   885			mark_page_dirty_in_slot(kvm, memslot, gfn);
   886	
   887	out:
   888		srcu_read_unlock(&kvm->srcu, srcu_idx);
   889		return err;
   890	}
   891	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
