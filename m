Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280DE36D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 00:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689295958; x=1720831958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LIWQl9CR9TDH718ddh6LtxfksSjt146LkTqhv9+PD5A=;
  b=Rc09jzXioSlynNExjPw0/h9OeWRNOcZcemXYDKQa7O+QJ8+7GiwyH9Ok
   xV5nXNp9wRvI3le2M68R4OCsRNAqnee8VBNzMeY1RfqX+TxcHy8qSCvqK
   XQn9/rA6DA9Txu63ThiHz8+44cOISiRYlQEmxy9Iy/xCHzm1LWBj8shj3
   xJlV+zTVWQzYlopcz31W1eSAIo8QzKzXbEeWltivmOMelumxMFRmR0k5z
   lbkHcUYZ9D6LqoQmTU4fMosVToPr+kQ5wJ3sORJy2Z8hZJRUj8/R0J5/i
   66eeseXyGTs6x0fxoA0tKRpe+dkEN30Jv2FIweSc3Mg9ZzRIUYawzIDCo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362818757"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="362818757"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 17:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="672510224"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="672510224"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jul 2023 17:52:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK72c-000713-00;
	Fri, 14 Jul 2023 00:52:14 +0000
Date: Fri, 14 Jul 2023 08:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/gmem 1/31] arch/arm64/kvm/mmu.c:1724:38: error: 'struct
 kvm_gfn_range' has no member named 'pte'
Message-ID: <202307140853.kXc3m9ET-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem
head:   9cbe075ae7adfaccafbef6c181188fefceaf7482
commit: 799ed8bc49dabefca5bb4b2c773cbe81ab3c0b61 [1/31] KVM: Wrap kvm_gfn_range.pte in a per-action union
config: arm64-randconfig-r021-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140853.kXc3m9ET-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140853.kXc3m9ET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140853.kXc3m9ET-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/mman.h:5,
                    from arch/arm64/kvm/mmu.c:7:
   arch/arm64/kvm/mmu.c: In function 'kvm_set_spte_gfn':
>> arch/arm64/kvm/mmu.c:1724:38: error: 'struct kvm_gfn_range' has no member named 'pte'
    1724 |         kvm_pfn_t pfn = pte_pfn(range->pte);
         |                                      ^~
   arch/arm64/include/asm/pgtable.h:91:48: note: in definition of macro 'pte_pfn'
      91 | #define pte_pfn(pte)            (__pte_to_phys(pte) >> PAGE_SHIFT)
         |                                                ^~~


vim +1724 arch/arm64/kvm/mmu.c

d5d8184d35c990 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1721  
cd4c7183522817 arch/arm64/kvm/mmu.c Sean Christopherson 2021-04-01  1722  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
d5d8184d35c990 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1723  {
cd4c7183522817 arch/arm64/kvm/mmu.c Sean Christopherson 2021-04-01 @1724  	kvm_pfn_t pfn = pte_pfn(range->pte);
d5d8184d35c990 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1725  
cd4c7183522817 arch/arm64/kvm/mmu.c Sean Christopherson 2021-04-01  1726  	if (!kvm->arch.mmu.pgt)
fcb8283920b135 arch/arm64/kvm/mmu.c kernel test robot   2021-04-27  1727  		return false;
d5d8184d35c990 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1728  
cd4c7183522817 arch/arm64/kvm/mmu.c Sean Christopherson 2021-04-01  1729  	WARN_ON(range->end - range->start != 1);
d5d8184d35c990 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1730  
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1731  	/*
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1732  	 * If the page isn't tagged, defer to user_mem_abort() for sanitising
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1733  	 * the MTE tags. The S2 pte should have been unmapped by
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1734  	 * mmu_notifier_invalidate_range_end().
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1735  	 */
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1736  	if (kvm_has_mte(kvm) && !page_mte_tagged(pfn_to_page(pfn)))
ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1737  		return false;
ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1738  
cd4c7183522817 arch/arm64/kvm/mmu.c Sean Christopherson 2021-04-01  1739  	/*
25aa28691bb960 arch/arm64/kvm/mmu.c Yanan Wang          2021-06-17  1740  	 * We've moved a page around, probably through CoW, so let's treat
25aa28691bb960 arch/arm64/kvm/mmu.c Yanan Wang          2021-06-17  1741  	 * it just like a translation fault and the map handler will clean
25aa28691bb960 arch/arm64/kvm/mmu.c Yanan Wang          2021-06-17  1742  	 * the cache to the PoC.
25aa28691bb960 arch/arm64/kvm/mmu.c Yanan Wang          2021-06-17  1743  	 *
e9edb17ae0a263 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1744  	 * The MMU notifiers will have unmapped a huge PMD before calling
cd4c7183522817 arch/arm64/kvm/mmu.c Sean Christopherson 2021-04-01  1745  	 * ->change_pte() (which in turn calls kvm_set_spte_gfn()) and
e9edb17ae0a263 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1746  	 * therefore we never need to clear out a huge PMD through this
e9edb17ae0a263 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1747  	 * calling path and a memcache is not required.
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1748  	 */
cd4c7183522817 arch/arm64/kvm/mmu.c Sean Christopherson 2021-04-01  1749  	kvm_pgtable_stage2_map(kvm->arch.mmu.pgt, range->start << PAGE_SHIFT,
cd4c7183522817 arch/arm64/kvm/mmu.c Sean Christopherson 2021-04-01  1750  			       PAGE_SIZE, __pfn_to_phys(pfn),
1577cb5823cefd arch/arm64/kvm/mmu.c Oliver Upton        2022-11-07  1751  			       KVM_PGTABLE_PROT_R, NULL, 0);
cd4c7183522817 arch/arm64/kvm/mmu.c Sean Christopherson 2021-04-01  1752  
fcb8283920b135 arch/arm64/kvm/mmu.c kernel test robot   2021-04-27  1753  	return false;
d5d8184d35c990 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1754  }
d5d8184d35c990 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1755  

:::::: The code at line 1724 was first introduced by commit
:::::: cd4c7183522817087278b3e000b8a888f9f91b5c KVM: arm64: Convert to the gfn-based MMU notifier callbacks

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
