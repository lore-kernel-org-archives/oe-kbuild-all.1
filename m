Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E4A149E09
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719042224; cv=none; b=Kgdllv5hp6KElOPG/mnmOgrHg58Vy6WCrnf2Qxlh1wSMkIhGiY5AlsC1Jr7FUYuz7Flczh93uBnJrNAMPNAZ7Id0udqmLTpGn5pT9vleUuibzVUM7o4aAgKo+nirFGUYRGZni53qn1goEQdheFsXroH+llX6dSLfCs9iJQZTYcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719042224; c=relaxed/simple;
	bh=Ml3K5/r/ofVIJmeWvnQoC504O6TGxWZQM0rIioYGKHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPbwYZeqT2QOvYH//lOt+XYRwnuDAf4buBqJLKASOOsxx9LCYQomQ2hI1+uKR3UKwM/id401VcUnkF5z+TqhnRixG42bZpijc3yMg9x+mdPYHrUprUKqwR2N9H+0RZCN7G01K0HR7Q8OLXOOie0U7MijTI8Tpexy6MHR2smjPhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZtu5Kps; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZtu5Kps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719042223; x=1750578223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ml3K5/r/ofVIJmeWvnQoC504O6TGxWZQM0rIioYGKHA=;
  b=OZtu5KpsvzNTNnzeAxa4k9LfkzrheG1Og+hZKeO+ZsXIKxvLjUHte3Z0
   Xr2FRgt1mZH783CWbuB5Urd4Z97d5z14lEntZaUAuaraGrYTEdAqZyPmh
   i/79i+SaH2vaow61ez54HbrhBwMFe+M6cx1y9WImgiyNkhwTzNsQyRsHc
   7+NSACnSU+xmTmamrEFpv8vrUxEnJM4rFEArvEbH9vVlq0VI5q4w7vD6X
   Go8H9C76X55ndbPotYZ/G8nNw0Klk8bgBlOW5o8WN8XHurMiXwp1fjrLP
   UQvJIRExRcHXVYiU4qyf7DpI7t7tTQH5Qr4s6+qa6i50D5VtvU0TNby4X
   Q==;
X-CSE-ConnectionGUID: M19MGvxURvS3SUdzZ4nLIg==
X-CSE-MsgGUID: Rf5OO8WiTC28lx87fkijaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19890986"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="19890986"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 00:43:39 -0700
X-CSE-ConnectionGUID: qEAYL9u7QgSd4vONiATKsA==
X-CSE-MsgGUID: GRXNiQqsQiK0GVnoq1vh3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="43484028"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Jun 2024 00:43:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKvPL-0009QA-1x;
	Sat, 22 Jun 2024 07:43:35 +0000
Date: Sat, 22 Jun 2024 15:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_follow_pfn 7/28]
 arch/x86/kvm/mmu/paging_tmpl.h:556:32: error: passing argument 1 of
 'kvm_release_page_clean' from incompatible pointer type
Message-ID: <202406221549.M7NVOJNs-lkp@intel.com>
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
commit: 85294ecb09b3f377a64f374c2841967c6be774eb [7/28] KVM: x86/mmu: Use
config: x86_64-randconfig-161-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221549.M7NVOJNs-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221549.M7NVOJNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221549.M7NVOJNs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/page.h:89,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from arch/x86/kvm/irq.h:13,
                    from arch/x86/kvm/mmu/mmu.c:19:
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'ept_prefetch_gpte':
>> include/asm-generic/memory_model.h:38:56: error: invalid operands to binary - (have 'struct page **' and 'struct page *')
      38 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                 ~      ^
         |                                                 |
         |                                                 struct page **
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   arch/x86/kvm/mmu/paging_tmpl.h:555:57: note: in expansion of macro 'page_to_pfn'
     555 |         mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
         |                                                         ^~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:4822:
>> arch/x86/kvm/mmu/paging_tmpl.h:556:32: error: passing argument 1 of 'kvm_release_page_clean' from incompatible pointer type [-Werror=incompatible-pointer-types]
     556 |         kvm_release_page_clean(page);
         |                                ^~~~
         |                                |
         |                                struct page **
   In file included from arch/x86/kvm/irq.h:15:
   include/linux/kvm_host.h:1209:42: note: expected 'struct page *' but argument is of type 'struct page **'
    1209 | void kvm_release_page_clean(struct page *page);
         |                             ~~~~~~~~~~~~~^~~~
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'paging64_prefetch_gpte':
>> include/asm-generic/memory_model.h:38:56: error: invalid operands to binary - (have 'struct page **' and 'struct page *')
      38 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                 ~      ^
         |                                                 |
         |                                                 struct page **
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   arch/x86/kvm/mmu/paging_tmpl.h:555:57: note: in expansion of macro 'page_to_pfn'
     555 |         mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
         |                                                         ^~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:4826:
>> arch/x86/kvm/mmu/paging_tmpl.h:556:32: error: passing argument 1 of 'kvm_release_page_clean' from incompatible pointer type [-Werror=incompatible-pointer-types]
     556 |         kvm_release_page_clean(page);
         |                                ^~~~
         |                                |
         |                                struct page **
   include/linux/kvm_host.h:1209:42: note: expected 'struct page *' but argument is of type 'struct page **'
    1209 | void kvm_release_page_clean(struct page *page);
         |                             ~~~~~~~~~~~~~^~~~
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'paging32_prefetch_gpte':
>> include/asm-generic/memory_model.h:38:56: error: invalid operands to binary - (have 'struct page **' and 'struct page *')
      38 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                 ~      ^
         |                                                 |
         |                                                 struct page **
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   arch/x86/kvm/mmu/paging_tmpl.h:555:57: note: in expansion of macro 'page_to_pfn'
     555 |         mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
         |                                                         ^~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:4830:
>> arch/x86/kvm/mmu/paging_tmpl.h:556:32: error: passing argument 1 of 'kvm_release_page_clean' from incompatible pointer type [-Werror=incompatible-pointer-types]
     556 |         kvm_release_page_clean(page);
         |                                ^~~~
         |                                |
         |                                struct page **
   include/linux/kvm_host.h:1209:42: note: expected 'struct page *' but argument is of type 'struct page **'
    1209 | void kvm_release_page_clean(struct page *page);
         |                             ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/kvm_release_page_clean +556 arch/x86/kvm/mmu/paging_tmpl.h

   531	
   532	static bool
   533	FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
   534			     u64 *spte, pt_element_t gpte)
   535	{
   536		struct kvm_memory_slot *slot;
   537		struct page *page[1];
   538		unsigned pte_access;
   539		gfn_t gfn;
   540	
   541		if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
   542			return false;
   543	
   544		gfn = gpte_to_gfn(gpte);
   545		pte_access = sp->role.access & FNAME(gpte_access)(gpte);
   546		FNAME(protect_clean_gpte)(vcpu->arch.mmu, &pte_access, gpte);
   547	
   548		slot = gfn_to_memslot_dirty_bitmap(vcpu, gfn, pte_access & ACC_WRITE_MASK);
   549		if (!slot)
   550			return false;
   551	
   552		if (gfn_to_page_many_atomic(slot, gfn, page, 1) != 1)
   553			return false;
   554	
 > 555		mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
 > 556		kvm_release_page_clean(page);
   557		return true;
   558	}
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
