Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D249B1E5B8E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948703; cv=none; b=n5Le7lHbicEI87j5NCaGn1FF6shSA+wSTV6DoSwyCsY9xLxzCL0UoOWzdR3HL1MgV3OXE1dxbkRntNiOjvpD+yHBv1Z6FqI4pEXr4Y2fgNJe/BwQOggzaRXcs0MSmYGlE/WDWpuKKBz7munJEuIWUerUDyyFhRYLisevCQEEIcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948703; c=relaxed/simple;
	bh=Q6CGiFt6eKzHFBpLK7fIVB++FotOQePmWvFMSYO45qY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYVaMSu31xmVVCxGl1GRGRSH/27+2Q6DK0y+XqhhKYTILNcz0FzPrju4UQRbtOD/VTS8EIOiHDGOcsd/vEFFBdA61Q5+24wWvHIxyZEDNtKx7zcoMUOBVtJQPmVtIK3H2Om0v+wiCQIn01k4+LfzLeBQqOiWpT3vCge7SDdfFiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ai/U3TLO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ai/U3TLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741948702; x=1773484702;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Q6CGiFt6eKzHFBpLK7fIVB++FotOQePmWvFMSYO45qY=;
  b=Ai/U3TLObNItE8g/RiuzjUjhB1DSj1X1XT+DRfFnbIm6VkUo1J6RJ1Et
   OIa0GUZYt0yYVFRSEtJhZoHCzvJtVm5oqLimFyPPAaNSpPhnN/JAGgbUI
   xjRCMUeC6bIeb1wgPWjtXR85ZXAw/faf9BH227J13gvOZPXejPHOxNA/H
   BM+u/ZXoGP+LS8kTFiAgLWnC09PxfEvVpgNJ8loy9vwO+ap7aK+HceRDd
   Lwmw4R3a/WvzTjzgKMfEbKKkGawl2wUmZe3x6HDOmJlWfK/SFAbmDHWre
   NxqdwRLVEHdT9FrKx6P164RUCaUZWZw6B762lFbpYlAritu6mJU1AmvZJ
   g==;
X-CSE-ConnectionGUID: 9VJrFGdmTI2Cn06ux5aQUg==
X-CSE-MsgGUID: E3Cm0UXITSSGs/xAESUpNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54475832"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54475832"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 03:38:21 -0700
X-CSE-ConnectionGUID: 3y1J8WADS4mRwvqt3VDw5g==
X-CSE-MsgGUID: coFCa8MrTf+BYy33VYfQaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126294625"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Mar 2025 03:38:20 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt2Qk-000ALs-0R
	for oe-kbuild-all@lists.linux.dev;
	Fri, 14 Mar 2025 10:38:18 +0000
Date: Fri, 14 Mar 2025 18:37:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 7/7]
 arch/powerpc/kvm/e500_mmu_host.c:447:9: error: call to undeclared function
 '__kvm_faultin_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202503141834.WopNPC3J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   685a54e0f0ccdc484187e319722de7fc7709e8fb
commit: ba3cf83f4a5063edb6ee150633e641954ce30478 [7/7] KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
config: powerpc64-randconfig-003-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141834.WopNPC3J-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141834.WopNPC3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141834.WopNPC3J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kvm/e500_mmu_host.c:21:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/kvm/e500_mmu_host.c:447:9: error: call to undeclared function '__kvm_faultin_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     447 |                 pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
         |                       ^
>> arch/powerpc/kvm/e500_mmu_host.c:500:2: error: call to undeclared function 'kvm_release_faultin_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     500 |         kvm_release_faultin_page(kvm, page, !!ret, writable);
         |         ^
   4 warnings and 2 errors generated.


vim +/__kvm_faultin_pfn +447 arch/powerpc/kvm/e500_mmu_host.c

   317	
   318	static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
   319		u64 gvaddr, gfn_t gfn, struct kvm_book3e_206_tlb_entry *gtlbe,
   320		int tlbsel, struct kvm_book3e_206_tlb_entry *stlbe,
   321		struct tlbe_ref *ref)
   322	{
   323		struct kvm_memory_slot *slot;
   324		unsigned long pfn = 0; /* silence GCC warning */
   325		struct page *page = NULL;
   326		unsigned long hva;
   327		int pfnmap = 0;
   328		int tsize = BOOK3E_PAGESZ_4K;
   329		int ret = 0;
   330		unsigned long mmu_seq;
   331		struct kvm *kvm = vcpu_e500->vcpu.kvm;
   332		unsigned long tsize_pages = 0;
   333		pte_t *ptep;
   334		unsigned int wimg = 0;
   335		pgd_t *pgdir;
   336		unsigned long flags;
   337		bool writable = false;
   338	
   339		/* used to check for invalidations in progress */
   340		mmu_seq = kvm->mmu_invalidate_seq;
   341		smp_rmb();
   342	
   343		/*
   344		 * Translate guest physical to true physical, acquiring
   345		 * a page reference if it is normal, non-reserved memory.
   346		 *
   347		 * gfn_to_memslot() must succeed because otherwise we wouldn't
   348		 * have gotten this far.  Eventually we should just pass the slot
   349		 * pointer through from the first lookup.
   350		 */
   351		slot = gfn_to_memslot(vcpu_e500->vcpu.kvm, gfn);
   352		hva = gfn_to_hva_memslot(slot, gfn);
   353	
   354		if (tlbsel == 1) {
   355			struct vm_area_struct *vma;
   356			mmap_read_lock(kvm->mm);
   357	
   358			vma = find_vma(kvm->mm, hva);
   359			if (vma && hva >= vma->vm_start &&
   360			    (vma->vm_flags & VM_PFNMAP)) {
   361				/*
   362				 * This VMA is a physically contiguous region (e.g.
   363				 * /dev/mem) that bypasses normal Linux page
   364				 * management.  Find the overlap between the
   365				 * vma and the memslot.
   366				 */
   367	
   368				unsigned long start, end;
   369				unsigned long slot_start, slot_end;
   370	
   371				pfnmap = 1;
   372	
   373				start = vma->vm_pgoff;
   374				end = start +
   375				      vma_pages(vma);
   376	
   377				pfn = start + ((hva - vma->vm_start) >> PAGE_SHIFT);
   378	
   379				slot_start = pfn - (gfn - slot->base_gfn);
   380				slot_end = slot_start + slot->npages;
   381	
   382				if (start < slot_start)
   383					start = slot_start;
   384				if (end > slot_end)
   385					end = slot_end;
   386	
   387				tsize = (gtlbe->mas1 & MAS1_TSIZE_MASK) >>
   388					MAS1_TSIZE_SHIFT;
   389	
   390				/*
   391				 * e500 doesn't implement the lowest tsize bit,
   392				 * or 1K pages.
   393				 */
   394				tsize = max(BOOK3E_PAGESZ_4K, tsize & ~1);
   395	
   396				/*
   397				 * Now find the largest tsize (up to what the guest
   398				 * requested) that will cover gfn, stay within the
   399				 * range, and for which gfn and pfn are mutually
   400				 * aligned.
   401				 */
   402	
   403				for (; tsize > BOOK3E_PAGESZ_4K; tsize -= 2) {
   404					unsigned long gfn_start, gfn_end;
   405					tsize_pages = 1UL << (tsize - 2);
   406	
   407					gfn_start = gfn & ~(tsize_pages - 1);
   408					gfn_end = gfn_start + tsize_pages;
   409	
   410					if (gfn_start + pfn - gfn < start)
   411						continue;
   412					if (gfn_end + pfn - gfn > end)
   413						continue;
   414					if ((gfn & (tsize_pages - 1)) !=
   415					    (pfn & (tsize_pages - 1)))
   416						continue;
   417	
   418					gvaddr &= ~((tsize_pages << PAGE_SHIFT) - 1);
   419					pfn &= ~(tsize_pages - 1);
   420					break;
   421				}
   422			} else if (vma && hva >= vma->vm_start &&
   423				   is_vm_hugetlb_page(vma)) {
   424				unsigned long psize = vma_kernel_pagesize(vma);
   425	
   426				tsize = (gtlbe->mas1 & MAS1_TSIZE_MASK) >>
   427					MAS1_TSIZE_SHIFT;
   428	
   429				/*
   430				 * Take the largest page size that satisfies both host
   431				 * and guest mapping
   432				 */
   433				tsize = min(__ilog2(psize) - 10, tsize);
   434	
   435				/*
   436				 * e500 doesn't implement the lowest tsize bit,
   437				 * or 1K pages.
   438				 */
   439				tsize = max(BOOK3E_PAGESZ_4K, tsize & ~1);
   440			}
   441	
   442			mmap_read_unlock(kvm->mm);
   443		}
   444	
   445		if (likely(!pfnmap)) {
   446			tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
 > 447			pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
   448			if (is_error_noslot_pfn(pfn)) {
   449				if (printk_ratelimit())
   450					pr_err("%s: real page not found for gfn %lx\n",
   451					       __func__, (long)gfn);
   452				return -EINVAL;
   453			}
   454	
   455			/* Align guest and physical address to page map boundaries */
   456			pfn &= ~(tsize_pages - 1);
   457			gvaddr &= ~((tsize_pages << PAGE_SHIFT) - 1);
   458		}
   459	
   460		spin_lock(&kvm->mmu_lock);
   461		if (mmu_invalidate_retry(kvm, mmu_seq)) {
   462			ret = -EAGAIN;
   463			goto out;
   464		}
   465	
   466	
   467		pgdir = vcpu_e500->vcpu.arch.pgdir;
   468		/*
   469		 * We are just looking at the wimg bits, so we don't
   470		 * care much about the trans splitting bit.
   471		 * We are holding kvm->mmu_lock so a notifier invalidate
   472		 * can't run hence pfn won't change.
   473		 */
   474		local_irq_save(flags);
   475		ptep = find_linux_pte(pgdir, hva, NULL, NULL);
   476		if (ptep) {
   477			pte_t pte = READ_ONCE(*ptep);
   478	
   479			if (pte_present(pte)) {
   480				wimg = (pte_val(pte) >> PTE_WIMGE_SHIFT) &
   481					MAS2_WIMGE_MASK;
   482				local_irq_restore(flags);
   483			} else {
   484				local_irq_restore(flags);
   485				pr_err_ratelimited("%s: pte not present: gfn %lx,pfn %lx\n",
   486						   __func__, (long)gfn, pfn);
   487				ret = -EINVAL;
   488				goto out;
   489			}
   490		}
   491		writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
   492	
   493		kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
   494					ref, gvaddr, stlbe);
   495	
   496		/* Clear i-cache for new pages */
   497		kvmppc_mmu_flush_icache(pfn);
   498	
   499	out:
 > 500		kvm_release_faultin_page(kvm, page, !!ret, writable);
   501		spin_unlock(&kvm->mmu_lock);
   502		return ret;
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
