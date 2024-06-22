Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC5479DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719045584; cv=none; b=IzWP33AwsLl95tUtSHW8ywxSYtdP0gnb9NimUygLmtlAdx0NiTjSdRC+hH+GxlGBHfH5EqXlrc2nxYa6E46DqzJbk7Se2wlJ79+UND1muN/QWkSAbHmcVFne4owXm7rNuhN5ztHul7O1cAO48VwqBrygDUSFk51wgLvjjRaxrWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719045584; c=relaxed/simple;
	bh=p25g9CBAYbc4d09dpTaILMRvv+UdbTFfbhELW6CwjT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XRbdDaRfldWQqtBu3dTe01ZtnRVucelJjUlrmdRJhQmK/3Pj8+N0pkgZMAj4WqqaN/s22tA7+wnWY+09flzt5wBPfiPfeOxs3Cxb0kukKi2JD8d3ghu95521qDeyn0pul492ydfXFi05SwLCIg1LBxztaOQJ3HpatDKKYityRIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJOITnCN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJOITnCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719045581; x=1750581581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p25g9CBAYbc4d09dpTaILMRvv+UdbTFfbhELW6CwjT8=;
  b=KJOITnCNhBFSaxmfSqw9Gd+TwVMJKagXCFHIxWj1uLW5AREvhcEYRHi8
   aJ5tremzF/YvsTEt0BlPW77xqEoCZBsqMpQ+llOk82bbWLfMHAUCgX6tv
   4L+8fcJB2/JFAIxdt7TQF3eByiBXSjUCIv7UAvn6XMBEltuEukepAn6Zr
   TnAOx71f8lEXrYGqcB3r9GSSmiVViPT2DoU/T0KxAkdSiGIzC4K58vGob
   Qxwf8cq2nBp6aeetS1Mzo/qv/a3gYmPf7Fo4kDgc8oZ1+FdeDiL6K1O5p
   N2NXlQsAZiGKi1tVUbtTA/T49asazTgBwrk+afFUvi4p/soubH9+rOZll
   w==;
X-CSE-ConnectionGUID: x7hTR2gSTxyQQ5RjGfsHzA==
X-CSE-MsgGUID: mrB8kcgfQayXe9m8tMOa1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26712113"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="26712113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 01:39:41 -0700
X-CSE-ConnectionGUID: Ztbxz/OiQqeJhWqIyHXQkQ==
X-CSE-MsgGUID: +bKXy7lZQ8Svj4oOdfQbfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="42680862"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jun 2024 01:39:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKwHZ-0009TO-1z;
	Sat, 22 Jun 2024 08:39:37 +0000
Date: Sat, 22 Jun 2024 16:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_follow_pfn 9/28]
 arch/powerpc/kvm/book3s_64_mmu_hv.c:617:44: error: incompatible type for
 argument 6 of '__gfn_to_pfn_memslot'
Message-ID: <202406221631.jPPLJm7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   57ff012a34bc3bfac1ebb0724078e8fe47fdb60a
commit: c90e655590a56d8697a4e8b1b44f17cb4e7b01cb [9/28] KVM: Drop @atomic param from gfn=>pfn and hva=>pfn APIs
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240622/202406221631.jPPLJm7w-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221631.jPPLJm7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221631.jPPLJm7w-lkp@intel.com/

Note: the sean-jc/x86/mmu_follow_pfn HEAD 57ff012a34bc3bfac1ebb0724078e8fe47fdb60a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/book3s_64_mmu_hv.c: In function 'kvmppc_book3s_hv_page_fault':
>> arch/powerpc/kvm/book3s_64_mmu_hv.c:617:44: error: incompatible type for argument 6 of '__gfn_to_pfn_memslot'
     617 |                                            writing, &write_ok, NULL);
         |                                            ^~~~~~~
         |                                            |
         |                                            bool {aka _Bool}
   In file included from arch/powerpc/kvm/book3s_64_mmu_hv.c:10:
   include/linux/kvm_host.h:1219:56: note: expected 'bool *' {aka '_Bool *'} but argument is of type 'bool' {aka '_Bool'}
    1219 |                                bool write_fault, bool *writable, hva_t *hva);
         |                                                  ~~~~~~^~~~~~~~
   arch/powerpc/kvm/book3s_64_mmu_hv.c:617:53: error: passing argument 7 of '__gfn_to_pfn_memslot' from incompatible pointer type [-Werror=incompatible-pointer-types]
     617 |                                            writing, &write_ok, NULL);
         |                                                     ^~~~~~~~~
         |                                                     |
         |                                                     bool * {aka _Bool *}
   include/linux/kvm_host.h:1219:73: note: expected 'hva_t *' {aka 'long unsigned int *'} but argument is of type 'bool *' {aka '_Bool *'}
    1219 |                                bool write_fault, bool *writable, hva_t *hva);
         |                                                                  ~~~~~~~^~~
>> arch/powerpc/kvm/book3s_64_mmu_hv.c:616:23: error: too many arguments to function '__gfn_to_pfn_memslot'
     616 |                 pfn = __gfn_to_pfn_memslot(memslot, gfn, false, false, NULL,
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1217:11: note: declared here
    1217 | kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
         |           ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/powerpc/kvm/book3s_64_mmu_radix.c: In function 'kvmppc_book3s_instantiate_page':
>> arch/powerpc/kvm/book3s_64_mmu_radix.c:856:44: error: incompatible type for argument 6 of '__gfn_to_pfn_memslot'
     856 |                                            writing, upgrade_p, NULL);
         |                                            ^~~~~~~
         |                                            |
         |                                            bool {aka _Bool}
   In file included from arch/powerpc/kvm/book3s_64_mmu_radix.c:10:
   include/linux/kvm_host.h:1219:56: note: expected 'bool *' {aka '_Bool *'} but argument is of type 'bool' {aka '_Bool'}
    1219 |                                bool write_fault, bool *writable, hva_t *hva);
         |                                                  ~~~~~~^~~~~~~~
   arch/powerpc/kvm/book3s_64_mmu_radix.c:856:53: error: passing argument 7 of '__gfn_to_pfn_memslot' from incompatible pointer type [-Werror=incompatible-pointer-types]
     856 |                                            writing, upgrade_p, NULL);
         |                                                     ^~~~~~~~~
         |                                                     |
         |                                                     bool * {aka _Bool *}
   include/linux/kvm_host.h:1219:73: note: expected 'hva_t *' {aka 'long unsigned int *'} but argument is of type 'bool *' {aka '_Bool *'}
    1219 |                                bool write_fault, bool *writable, hva_t *hva);
         |                                                                  ~~~~~~~^~~
>> arch/powerpc/kvm/book3s_64_mmu_radix.c:855:23: error: too many arguments to function '__gfn_to_pfn_memslot'
     855 |                 pfn = __gfn_to_pfn_memslot(memslot, gfn, false, false, NULL,
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1217:11: note: declared here
    1217 | kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
         |           ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__gfn_to_pfn_memslot +617 arch/powerpc/kvm/book3s_64_mmu_hv.c

697d3899dcb4bcd Paul Mackerras    2011-12-12  505  
8c99d34578628b5 Tianjia Zhang     2020-04-27  506  int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
697d3899dcb4bcd Paul Mackerras    2011-12-12  507  				unsigned long ea, unsigned long dsisr)
697d3899dcb4bcd Paul Mackerras    2011-12-12  508  {
697d3899dcb4bcd Paul Mackerras    2011-12-12  509  	struct kvm *kvm = vcpu->kvm;
6f22bd3265fb542 Alexander Graf    2014-06-11  510  	unsigned long hpte[3], r;
abb7c7ddbacd30b Paul Mackerras    2016-11-16  511  	unsigned long hnow_v, hnow_r;
6f22bd3265fb542 Alexander Graf    2014-06-11  512  	__be64 *hptep;
342d3db763f2621 Paul Mackerras    2011-12-12  513  	unsigned long mmu_seq, psize, pte_size;
1066f7724c73fca Paul Mackerras    2014-05-26  514  	unsigned long gpa_base, gfn_base;
cd758a9b57ee85f Paul Mackerras    2019-08-26  515  	unsigned long gpa, gfn, hva, pfn, hpa;
697d3899dcb4bcd Paul Mackerras    2011-12-12  516  	struct kvm_memory_slot *memslot;
342d3db763f2621 Paul Mackerras    2011-12-12  517  	unsigned long *rmap;
697d3899dcb4bcd Paul Mackerras    2011-12-12  518  	struct revmap_entry *rev;
cd758a9b57ee85f Paul Mackerras    2019-08-26  519  	struct page *page;
cd758a9b57ee85f Paul Mackerras    2019-08-26  520  	long index, ret;
30bda41aba4efb2 Aneesh Kumar K.V  2016-04-29  521  	bool is_ci;
cd758a9b57ee85f Paul Mackerras    2019-08-26  522  	bool writing, write_ok;
cd758a9b57ee85f Paul Mackerras    2019-08-26  523  	unsigned int shift;
bad3b5075eeb18c Paul Mackerras    2011-12-15  524  	unsigned long rcbits;
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  525  	long mmio_update;
cd758a9b57ee85f Paul Mackerras    2019-08-26  526  	pte_t pte, *ptep;
697d3899dcb4bcd Paul Mackerras    2011-12-12  527  
5a319350a46572d Paul Mackerras    2017-01-30  528  	if (kvm_is_radix(kvm))
8c99d34578628b5 Tianjia Zhang     2020-04-27  529  		return kvmppc_book3s_radix_page_fault(vcpu, ea, dsisr);
5a319350a46572d Paul Mackerras    2017-01-30  530  
697d3899dcb4bcd Paul Mackerras    2011-12-12  531  	/*
697d3899dcb4bcd Paul Mackerras    2011-12-12  532  	 * Real-mode code has already searched the HPT and found the
697d3899dcb4bcd Paul Mackerras    2011-12-12  533  	 * entry we're interested in.  Lock the entry and check that
697d3899dcb4bcd Paul Mackerras    2011-12-12  534  	 * it hasn't changed.  If it has, just return and re-execute the
697d3899dcb4bcd Paul Mackerras    2011-12-12  535  	 * instruction.
697d3899dcb4bcd Paul Mackerras    2011-12-12  536  	 */
697d3899dcb4bcd Paul Mackerras    2011-12-12  537  	if (ea != vcpu->arch.pgfault_addr)
697d3899dcb4bcd Paul Mackerras    2011-12-12  538  		return RESUME_GUEST;
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  539  
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  540  	if (vcpu->arch.pgfault_cache) {
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  541  		mmio_update = atomic64_read(&kvm->arch.mmio_update);
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  542  		if (mmio_update == vcpu->arch.pgfault_cache->mmio_update) {
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  543  			r = vcpu->arch.pgfault_cache->rpte;
8dc6cca556e4126 Paul Mackerras    2017-09-11  544  			psize = kvmppc_actual_pgsz(vcpu->arch.pgfault_hpte[0],
8dc6cca556e4126 Paul Mackerras    2017-09-11  545  						   r);
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  546  			gpa_base = r & HPTE_R_RPN & ~(psize - 1);
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  547  			gfn_base = gpa_base >> PAGE_SHIFT;
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  548  			gpa = gpa_base | (ea & (psize - 1));
8c99d34578628b5 Tianjia Zhang     2020-04-27  549  			return kvmppc_hv_emulate_mmio(vcpu, gpa, ea,
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  550  						dsisr & DSISR_ISSTORE);
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  551  		}
a56ee9f8f01c5a1 Yongji Xie        2016-11-04  552  	}
697d3899dcb4bcd Paul Mackerras    2011-12-12  553  	index = vcpu->arch.pgfault_index;
3f9d4f5a5f35e40 David Gibson      2016-12-20  554  	hptep = (__be64 *)(kvm->arch.hpt.virt + (index << 4));
3f9d4f5a5f35e40 David Gibson      2016-12-20  555  	rev = &kvm->arch.hpt.rev[index];
697d3899dcb4bcd Paul Mackerras    2011-12-12  556  	preempt_disable();
697d3899dcb4bcd Paul Mackerras    2011-12-12  557  	while (!try_lock_hpte(hptep, HPTE_V_HVLOCK))
697d3899dcb4bcd Paul Mackerras    2011-12-12  558  		cpu_relax();
6f22bd3265fb542 Alexander Graf    2014-06-11  559  	hpte[0] = be64_to_cpu(hptep[0]) & ~HPTE_V_HVLOCK;
6f22bd3265fb542 Alexander Graf    2014-06-11  560  	hpte[1] = be64_to_cpu(hptep[1]);
342d3db763f2621 Paul Mackerras    2011-12-12  561  	hpte[2] = r = rev->guest_rpte;
a4bd6eb07ca72d2 Aneesh Kumar K.V  2015-03-20  562  	unlock_hpte(hptep, hpte[0]);
697d3899dcb4bcd Paul Mackerras    2011-12-12  563  	preempt_enable();
697d3899dcb4bcd Paul Mackerras    2011-12-12  564  
abb7c7ddbacd30b Paul Mackerras    2016-11-16  565  	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
abb7c7ddbacd30b Paul Mackerras    2016-11-16  566  		hpte[0] = hpte_new_to_old_v(hpte[0], hpte[1]);
abb7c7ddbacd30b Paul Mackerras    2016-11-16  567  		hpte[1] = hpte_new_to_old_r(hpte[1]);
abb7c7ddbacd30b Paul Mackerras    2016-11-16  568  	}
697d3899dcb4bcd Paul Mackerras    2011-12-12  569  	if (hpte[0] != vcpu->arch.pgfault_hpte[0] ||
697d3899dcb4bcd Paul Mackerras    2011-12-12  570  	    hpte[1] != vcpu->arch.pgfault_hpte[1])
697d3899dcb4bcd Paul Mackerras    2011-12-12  571  		return RESUME_GUEST;
697d3899dcb4bcd Paul Mackerras    2011-12-12  572  
697d3899dcb4bcd Paul Mackerras    2011-12-12  573  	/* Translate the logical address and get the page */
8dc6cca556e4126 Paul Mackerras    2017-09-11  574  	psize = kvmppc_actual_pgsz(hpte[0], r);
1066f7724c73fca Paul Mackerras    2014-05-26  575  	gpa_base = r & HPTE_R_RPN & ~(psize - 1);
1066f7724c73fca Paul Mackerras    2014-05-26  576  	gfn_base = gpa_base >> PAGE_SHIFT;
1066f7724c73fca Paul Mackerras    2014-05-26  577  	gpa = gpa_base | (ea & (psize - 1));
70bddfefbdcdbfd Paul Mackerras    2012-09-20  578  	gfn = gpa >> PAGE_SHIFT;
697d3899dcb4bcd Paul Mackerras    2011-12-12  579  	memslot = gfn_to_memslot(kvm, gfn);
697d3899dcb4bcd Paul Mackerras    2011-12-12  580  
3c78f78af95615b Suresh E. Warrier 2014-12-03  581  	trace_kvm_page_fault_enter(vcpu, hpte, memslot, ea, dsisr);
3c78f78af95615b Suresh E. Warrier 2014-12-03  582  
697d3899dcb4bcd Paul Mackerras    2011-12-12  583  	/* No memslot means it's an emulated MMIO region */
70bddfefbdcdbfd Paul Mackerras    2012-09-20  584  	if (!memslot || (memslot->flags & KVM_MEMSLOT_INVALID))
8c99d34578628b5 Tianjia Zhang     2020-04-27  585  		return kvmppc_hv_emulate_mmio(vcpu, gpa, ea,
697d3899dcb4bcd Paul Mackerras    2011-12-12  586  					      dsisr & DSISR_ISSTORE);
697d3899dcb4bcd Paul Mackerras    2011-12-12  587  
1066f7724c73fca Paul Mackerras    2014-05-26  588  	/*
1066f7724c73fca Paul Mackerras    2014-05-26  589  	 * This should never happen, because of the slot_is_aligned()
1066f7724c73fca Paul Mackerras    2014-05-26  590  	 * check in kvmppc_do_h_enter().
1066f7724c73fca Paul Mackerras    2014-05-26  591  	 */
1066f7724c73fca Paul Mackerras    2014-05-26  592  	if (gfn_base < memslot->base_gfn)
1066f7724c73fca Paul Mackerras    2014-05-26  593  		return -EFAULT;
1066f7724c73fca Paul Mackerras    2014-05-26  594  
342d3db763f2621 Paul Mackerras    2011-12-12  595  	/* used to check for invalidations in progress */
20ec3ebd707c77f Chao Peng         2022-08-16  596  	mmu_seq = kvm->mmu_invalidate_seq;
342d3db763f2621 Paul Mackerras    2011-12-12  597  	smp_rmb();
342d3db763f2621 Paul Mackerras    2011-12-12  598  
3c78f78af95615b Suresh E. Warrier 2014-12-03  599  	ret = -EFAULT;
342d3db763f2621 Paul Mackerras    2011-12-12  600  	page = NULL;
4cf302bc106566c Paul Mackerras    2011-12-12  601  	writing = (dsisr & DSISR_ISSTORE) != 0;
4cf302bc106566c Paul Mackerras    2011-12-12  602  	/* If writing != 0, then the HPTE must allow writing, if we get here */
4cf302bc106566c Paul Mackerras    2011-12-12  603  	write_ok = writing;
342d3db763f2621 Paul Mackerras    2011-12-12  604  	hva = gfn_to_hva_memslot(memslot, gfn);
cd758a9b57ee85f Paul Mackerras    2019-08-26  605  
4cf302bc106566c Paul Mackerras    2011-12-12  606  	/*
cd758a9b57ee85f Paul Mackerras    2019-08-26  607  	 * Do a fast check first, since __gfn_to_pfn_memslot doesn't
cd758a9b57ee85f Paul Mackerras    2019-08-26  608  	 * do it with !atomic && !async, which is how we call it.
cd758a9b57ee85f Paul Mackerras    2019-08-26  609  	 * We always ask for write permission since the common case
cd758a9b57ee85f Paul Mackerras    2019-08-26  610  	 * is that the page is writable.
4cf302bc106566c Paul Mackerras    2011-12-12  611  	 */
dadbb612f6e50bb Souptick Joarder  2020-06-07  612  	if (get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
cd758a9b57ee85f Paul Mackerras    2019-08-26  613  		write_ok = true;
cd758a9b57ee85f Paul Mackerras    2019-08-26  614  	} else {
cd758a9b57ee85f Paul Mackerras    2019-08-26  615  		/* Call KVM generic code to do the slow-path check */
c8b88b332bedf47 Peter Xu          2022-10-11 @616  		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, false, NULL,
4a42d848db9544e David Stevens     2021-02-22 @617  					   writing, &write_ok, NULL);
cd758a9b57ee85f Paul Mackerras    2019-08-26  618  		if (is_error_noslot_pfn(pfn))
cd758a9b57ee85f Paul Mackerras    2019-08-26  619  			return -EFAULT;
cd758a9b57ee85f Paul Mackerras    2019-08-26  620  		page = NULL;
cd758a9b57ee85f Paul Mackerras    2019-08-26  621  		if (pfn_valid(pfn)) {
cd758a9b57ee85f Paul Mackerras    2019-08-26  622  			page = pfn_to_page(pfn);
cd758a9b57ee85f Paul Mackerras    2019-08-26  623  			if (PageReserved(page))
cd758a9b57ee85f Paul Mackerras    2019-08-26  624  				page = NULL;
4cf302bc106566c Paul Mackerras    2011-12-12  625  		}
4cf302bc106566c Paul Mackerras    2011-12-12  626  	}
cd758a9b57ee85f Paul Mackerras    2019-08-26  627  
cd758a9b57ee85f Paul Mackerras    2019-08-26  628  	/*
cd758a9b57ee85f Paul Mackerras    2019-08-26  629  	 * Read the PTE from the process' radix tree and use that
cd758a9b57ee85f Paul Mackerras    2019-08-26  630  	 * so we get the shift and attribute bits.
cd758a9b57ee85f Paul Mackerras    2019-08-26  631  	 */
9781e759b3258bc Aneesh Kumar K.V  2020-05-05  632  	spin_lock(&kvm->mmu_lock);
9781e759b3258bc Aneesh Kumar K.V  2020-05-05  633  	ptep = find_kvm_host_pte(kvm, mmu_seq, hva, &shift);
ae49dedaa92b552 Paul Mackerras    2020-04-16  634  	pte = __pte(0);
ae49dedaa92b552 Paul Mackerras    2020-04-16  635  	if (ptep)
9781e759b3258bc Aneesh Kumar K.V  2020-05-05  636  		pte = READ_ONCE(*ptep);
9781e759b3258bc Aneesh Kumar K.V  2020-05-05  637  	spin_unlock(&kvm->mmu_lock);
cd758a9b57ee85f Paul Mackerras    2019-08-26  638  	/*
cd758a9b57ee85f Paul Mackerras    2019-08-26  639  	 * If the PTE disappeared temporarily due to a THP
cd758a9b57ee85f Paul Mackerras    2019-08-26  640  	 * collapse, just return and let the guest try again.
cd758a9b57ee85f Paul Mackerras    2019-08-26  641  	 */
ae49dedaa92b552 Paul Mackerras    2020-04-16  642  	if (!pte_present(pte)) {
cd758a9b57ee85f Paul Mackerras    2019-08-26  643  		if (page)
cd758a9b57ee85f Paul Mackerras    2019-08-26  644  			put_page(page);
cd758a9b57ee85f Paul Mackerras    2019-08-26  645  		return RESUME_GUEST;
342d3db763f2621 Paul Mackerras    2011-12-12  646  	}
cd758a9b57ee85f Paul Mackerras    2019-08-26  647  	hpa = pte_pfn(pte) << PAGE_SHIFT;
cd758a9b57ee85f Paul Mackerras    2019-08-26  648  	pte_size = PAGE_SIZE;
cd758a9b57ee85f Paul Mackerras    2019-08-26  649  	if (shift)
cd758a9b57ee85f Paul Mackerras    2019-08-26  650  		pte_size = 1ul << shift;
cd758a9b57ee85f Paul Mackerras    2019-08-26  651  	is_ci = pte_ci(pte);
342d3db763f2621 Paul Mackerras    2011-12-12  652  
342d3db763f2621 Paul Mackerras    2011-12-12  653  	if (psize > pte_size)
342d3db763f2621 Paul Mackerras    2011-12-12  654  		goto out_put;
cd758a9b57ee85f Paul Mackerras    2019-08-26  655  	if (pte_size > psize)
cd758a9b57ee85f Paul Mackerras    2019-08-26  656  		hpa |= hva & (pte_size - psize);
342d3db763f2621 Paul Mackerras    2011-12-12  657  
342d3db763f2621 Paul Mackerras    2011-12-12  658  	/* Check WIMG vs. the actual page we're accessing */
30bda41aba4efb2 Aneesh Kumar K.V  2016-04-29  659  	if (!hpte_cache_flags_ok(r, is_ci)) {
30bda41aba4efb2 Aneesh Kumar K.V  2016-04-29  660  		if (is_ci)
3c78f78af95615b Suresh E. Warrier 2014-12-03  661  			goto out_put;
342d3db763f2621 Paul Mackerras    2011-12-12  662  		/*
342d3db763f2621 Paul Mackerras    2011-12-12  663  		 * Allow guest to map emulated device memory as
342d3db763f2621 Paul Mackerras    2011-12-12  664  		 * uncacheable, but actually make it cacheable.
342d3db763f2621 Paul Mackerras    2011-12-12  665  		 */
342d3db763f2621 Paul Mackerras    2011-12-12  666  		r = (r & ~(HPTE_R_W|HPTE_R_I|HPTE_R_G)) | HPTE_R_M;
342d3db763f2621 Paul Mackerras    2011-12-12  667  	}
342d3db763f2621 Paul Mackerras    2011-12-12  668  
caaa4c804fae7bb Paul Mackerras    2013-11-16  669  	/*
cd758a9b57ee85f Paul Mackerras    2019-08-26  670  	 * Set the HPTE to point to hpa.
cd758a9b57ee85f Paul Mackerras    2019-08-26  671  	 * Since the hpa is at PAGE_SIZE granularity, make sure we
caaa4c804fae7bb Paul Mackerras    2013-11-16  672  	 * don't mask out lower-order bits if psize < PAGE_SIZE.
caaa4c804fae7bb Paul Mackerras    2013-11-16  673  	 */
caaa4c804fae7bb Paul Mackerras    2013-11-16  674  	if (psize < PAGE_SIZE)
caaa4c804fae7bb Paul Mackerras    2013-11-16  675  		psize = PAGE_SIZE;
cd758a9b57ee85f Paul Mackerras    2019-08-26  676  	r = (r & HPTE_R_KEY_HI) | (r & ~(HPTE_R_PP0 - psize)) | hpa;
4cf302bc106566c Paul Mackerras    2011-12-12  677  	if (hpte_is_writable(r) && !write_ok)
4cf302bc106566c Paul Mackerras    2011-12-12  678  		r = hpte_make_readonly(r);
342d3db763f2621 Paul Mackerras    2011-12-12  679  	ret = RESUME_GUEST;
342d3db763f2621 Paul Mackerras    2011-12-12  680  	preempt_disable();
342d3db763f2621 Paul Mackerras    2011-12-12  681  	while (!try_lock_hpte(hptep, HPTE_V_HVLOCK))
342d3db763f2621 Paul Mackerras    2011-12-12  682  		cpu_relax();
abb7c7ddbacd30b Paul Mackerras    2016-11-16  683  	hnow_v = be64_to_cpu(hptep[0]);
abb7c7ddbacd30b Paul Mackerras    2016-11-16  684  	hnow_r = be64_to_cpu(hptep[1]);
abb7c7ddbacd30b Paul Mackerras    2016-11-16  685  	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
abb7c7ddbacd30b Paul Mackerras    2016-11-16  686  		hnow_v = hpte_new_to_old_v(hnow_v, hnow_r);
abb7c7ddbacd30b Paul Mackerras    2016-11-16  687  		hnow_r = hpte_new_to_old_r(hnow_r);
abb7c7ddbacd30b Paul Mackerras    2016-11-16  688  	}
38c53af853069ad Paul Mackerras    2017-11-08  689  
38c53af853069ad Paul Mackerras    2017-11-08  690  	/*
38c53af853069ad Paul Mackerras    2017-11-08  691  	 * If the HPT is being resized, don't update the HPTE,
38c53af853069ad Paul Mackerras    2017-11-08  692  	 * instead let the guest retry after the resize operation is complete.
072df8130c6b602 Paul Mackerras    2017-11-09  693  	 * The synchronization for mmu_ready test vs. set is provided
38c53af853069ad Paul Mackerras    2017-11-08  694  	 * by the HPTE lock.
38c53af853069ad Paul Mackerras    2017-11-08  695  	 */
072df8130c6b602 Paul Mackerras    2017-11-09  696  	if (!kvm->arch.mmu_ready)
38c53af853069ad Paul Mackerras    2017-11-08  697  		goto out_unlock;
38c53af853069ad Paul Mackerras    2017-11-08  698  
abb7c7ddbacd30b Paul Mackerras    2016-11-16  699  	if ((hnow_v & ~HPTE_V_HVLOCK) != hpte[0] || hnow_r != hpte[1] ||
342d3db763f2621 Paul Mackerras    2011-12-12  700  	    rev->guest_rpte != hpte[2])
342d3db763f2621 Paul Mackerras    2011-12-12  701  		/* HPTE has been changed under us; let the guest retry */
342d3db763f2621 Paul Mackerras    2011-12-12  702  		goto out_unlock;
342d3db763f2621 Paul Mackerras    2011-12-12  703  	hpte[0] = (hpte[0] & ~HPTE_V_ABSENT) | HPTE_V_VALID;
342d3db763f2621 Paul Mackerras    2011-12-12  704  
1066f7724c73fca Paul Mackerras    2014-05-26  705  	/* Always put the HPTE in the rmap chain for the page base address */
1066f7724c73fca Paul Mackerras    2014-05-26  706  	rmap = &memslot->arch.rmap[gfn_base - memslot->base_gfn];
342d3db763f2621 Paul Mackerras    2011-12-12  707  	lock_rmap(rmap);
342d3db763f2621 Paul Mackerras    2011-12-12  708  
342d3db763f2621 Paul Mackerras    2011-12-12  709  	/* Check if we might have been invalidated; let the guest retry if so */
342d3db763f2621 Paul Mackerras    2011-12-12  710  	ret = RESUME_GUEST;
20ec3ebd707c77f Chao Peng         2022-08-16  711  	if (mmu_invalidate_retry(vcpu->kvm, mmu_seq)) {
342d3db763f2621 Paul Mackerras    2011-12-12  712  		unlock_rmap(rmap);
342d3db763f2621 Paul Mackerras    2011-12-12  713  		goto out_unlock;
342d3db763f2621 Paul Mackerras    2011-12-12  714  	}
4cf302bc106566c Paul Mackerras    2011-12-12  715  
bad3b5075eeb18c Paul Mackerras    2011-12-15  716  	/* Only set R/C in real HPTE if set in both *rmap and guest_rpte */
bad3b5075eeb18c Paul Mackerras    2011-12-15  717  	rcbits = *rmap >> KVMPPC_RMAP_RC_SHIFT;
bad3b5075eeb18c Paul Mackerras    2011-12-15  718  	r &= rcbits | ~(HPTE_R_R | HPTE_R_C);
bad3b5075eeb18c Paul Mackerras    2011-12-15  719  
6f22bd3265fb542 Alexander Graf    2014-06-11  720  	if (be64_to_cpu(hptep[0]) & HPTE_V_VALID) {
4cf302bc106566c Paul Mackerras    2011-12-12  721  		/* HPTE was previously valid, so we need to invalidate it */
4cf302bc106566c Paul Mackerras    2011-12-12  722  		unlock_rmap(rmap);
6f22bd3265fb542 Alexander Graf    2014-06-11  723  		hptep[0] |= cpu_to_be64(HPTE_V_ABSENT);
4cf302bc106566c Paul Mackerras    2011-12-12  724  		kvmppc_invalidate_hpte(kvm, hptep, index);
bad3b5075eeb18c Paul Mackerras    2011-12-15  725  		/* don't lose previous R and C bits */
6f22bd3265fb542 Alexander Graf    2014-06-11  726  		r |= be64_to_cpu(hptep[1]) & (HPTE_R_R | HPTE_R_C);
4cf302bc106566c Paul Mackerras    2011-12-12  727  	} else {
342d3db763f2621 Paul Mackerras    2011-12-12  728  		kvmppc_add_revmap_chain(kvm, rev, rmap, index, 0);
4cf302bc106566c Paul Mackerras    2011-12-12  729  	}
342d3db763f2621 Paul Mackerras    2011-12-12  730  
abb7c7ddbacd30b Paul Mackerras    2016-11-16  731  	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
abb7c7ddbacd30b Paul Mackerras    2016-11-16  732  		r = hpte_old_to_new_r(hpte[0], r);
abb7c7ddbacd30b Paul Mackerras    2016-11-16  733  		hpte[0] = hpte_old_to_new_v(hpte[0]);
abb7c7ddbacd30b Paul Mackerras    2016-11-16  734  	}
6f22bd3265fb542 Alexander Graf    2014-06-11  735  	hptep[1] = cpu_to_be64(r);
342d3db763f2621 Paul Mackerras    2011-12-12  736  	eieio();
a4bd6eb07ca72d2 Aneesh Kumar K.V  2015-03-20  737  	__unlock_hpte(hptep, hpte[0]);
342d3db763f2621 Paul Mackerras    2011-12-12  738  	asm volatile("ptesync" : : : "memory");
342d3db763f2621 Paul Mackerras    2011-12-12  739  	preempt_enable();
4cf302bc106566c Paul Mackerras    2011-12-12  740  	if (page && hpte_is_writable(r))
cd758a9b57ee85f Paul Mackerras    2019-08-26  741  		set_page_dirty_lock(page);
342d3db763f2621 Paul Mackerras    2011-12-12  742  
342d3db763f2621 Paul Mackerras    2011-12-12  743   out_put:
3c78f78af95615b Suresh E. Warrier 2014-12-03  744  	trace_kvm_page_fault_exit(vcpu, hpte, ret);
3c78f78af95615b Suresh E. Warrier 2014-12-03  745  
cd758a9b57ee85f Paul Mackerras    2019-08-26  746  	if (page)
cd758a9b57ee85f Paul Mackerras    2019-08-26  747  		put_page(page);
342d3db763f2621 Paul Mackerras    2011-12-12  748  	return ret;
342d3db763f2621 Paul Mackerras    2011-12-12  749  
342d3db763f2621 Paul Mackerras    2011-12-12  750   out_unlock:
a4bd6eb07ca72d2 Aneesh Kumar K.V  2015-03-20  751  	__unlock_hpte(hptep, be64_to_cpu(hptep[0]));
342d3db763f2621 Paul Mackerras    2011-12-12  752  	preempt_enable();
342d3db763f2621 Paul Mackerras    2011-12-12  753  	goto out_put;
342d3db763f2621 Paul Mackerras    2011-12-12  754  }
342d3db763f2621 Paul Mackerras    2011-12-12  755  

:::::: The code at line 617 was first introduced by commit
:::::: 4a42d848db9544e3108875390886dc490d9c101e KVM: x86/mmu: Consider the hva in mmu_notifier retry

:::::: TO: David Stevens <stevensd@chromium.org>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
