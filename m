Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A98A163
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 05:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689398154; x=1720934154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHKY8lPXuJB3VVC11NqhKm0stTIgMaAy1EhfgO7Wwkg=;
  b=htI35g1EwiAZMNLKp7rz3O1lGJr09lHmEV7c3NV93qoqFIKqnFVMROA1
   pGHktauOJDCc+u0NVO196eDc2iLf0/Joc5U3L/hrmFgwPhHyELOOJn+E4
   ZKDFdIxv/ka5q1Vsu1lNQG/kXxGcrsuCYZp2gUCCYOWD3rSuBe8JS2rHW
   K2Ra82uF7G3dAnUmXT1eVWoVGJ7CiBaZadOauON/PLAN87P1A+ckuwywH
   xlwqpr9+ikqGT0GteiU+97vnqec3BNMDki1RDioduW/bOqwNeZxp1J48C
   pKctVZ3dkazXJ0lhWOUbAngheyyOUICI4djSLxOJ6GLZCgjqGZWX8ZmkE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="365675605"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="365675605"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 22:15:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="836267181"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="836267181"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2023 22:15:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKXdH-0007x3-0v;
	Sat, 15 Jul 2023 05:15:51 +0000
Date: Sat, 15 Jul 2023 13:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/gmem 17/38]
 arch/x86/kvm/../../../virt/kvm/guest_mem.c:126:26: error: 'struct
 kvm_gfn_range' has no member named 'pte'
Message-ID: <202307151339.0g23Soov-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem
head:   8f2e53f875afd2b57813e3dd259713ac2592f929
commit: 5388664d34523db492940a0b5955f07e3f5e6412 [17/38] KVM: x86: Add support for "protected VMs" that can utilize private memory
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230715/202307151339.0g23Soov-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151339.0g23Soov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307151339.0g23Soov-lkp@intel.com/

Note: the sean-jc/x86/gmem HEAD 8f2e53f875afd2b57813e3dd259713ac2592f929 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_mem.c: In function 'kvm_gmem_invalidate_begin':
>> arch/x86/kvm/../../../virt/kvm/guest_mem.c:126:26: error: 'struct kvm_gfn_range' has no member named 'pte'
     126 |                         .pte = __pte(0),
         |                          ^~~
>> arch/x86/kvm/../../../virt/kvm/guest_mem.c:126:32: error: incompatible types when initializing type 'long long unsigned int' using type 'pte_t'
     126 |                         .pte = __pte(0),
         |                                ^~~~~


vim +126 arch/x86/kvm/../../../virt/kvm/guest_mem.c

614fdcd72ea5f2 Sean Christopherson 2023-04-18  107  
614fdcd72ea5f2 Sean Christopherson 2023-04-18  108  static void kvm_gmem_invalidate_begin(struct kvm *kvm, struct kvm_gmem *gmem,
614fdcd72ea5f2 Sean Christopherson 2023-04-18  109  				      pgoff_t start, pgoff_t end)
614fdcd72ea5f2 Sean Christopherson 2023-04-18  110  {
614fdcd72ea5f2 Sean Christopherson 2023-04-18  111  	struct kvm_memory_slot *slot;
614fdcd72ea5f2 Sean Christopherson 2023-04-18  112  	unsigned long index;
614fdcd72ea5f2 Sean Christopherson 2023-04-18  113  	bool flush = false;
614fdcd72ea5f2 Sean Christopherson 2023-04-18  114  
614fdcd72ea5f2 Sean Christopherson 2023-04-18  115  	KVM_MMU_LOCK(kvm);
614fdcd72ea5f2 Sean Christopherson 2023-04-18  116  
614fdcd72ea5f2 Sean Christopherson 2023-04-18  117  	kvm_mmu_invalidate_begin(kvm);
614fdcd72ea5f2 Sean Christopherson 2023-04-18  118  
614fdcd72ea5f2 Sean Christopherson 2023-04-18  119  	xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
614fdcd72ea5f2 Sean Christopherson 2023-04-18  120  		pgoff_t pgoff = slot->gmem.pgoff;
614fdcd72ea5f2 Sean Christopherson 2023-04-18  121  
614fdcd72ea5f2 Sean Christopherson 2023-04-18  122  		struct kvm_gfn_range gfn_range = {
614fdcd72ea5f2 Sean Christopherson 2023-04-18  123  			.start = slot->base_gfn + max(pgoff, start) - pgoff,
614fdcd72ea5f2 Sean Christopherson 2023-04-18  124  			.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
614fdcd72ea5f2 Sean Christopherson 2023-04-18  125  			.slot = slot,
614fdcd72ea5f2 Sean Christopherson 2023-04-18 @126  			.pte = __pte(0),
614fdcd72ea5f2 Sean Christopherson 2023-04-18  127  			.may_block = true,
614fdcd72ea5f2 Sean Christopherson 2023-04-18  128  		};
614fdcd72ea5f2 Sean Christopherson 2023-04-18  129  
614fdcd72ea5f2 Sean Christopherson 2023-04-18  130  		kvm_mmu_invalidate_range_add(kvm, gfn_range.start, gfn_range.end);
614fdcd72ea5f2 Sean Christopherson 2023-04-18  131  
614fdcd72ea5f2 Sean Christopherson 2023-04-18  132  		flush |= kvm_unmap_gfn_range(kvm, &gfn_range);
614fdcd72ea5f2 Sean Christopherson 2023-04-18  133  	}
614fdcd72ea5f2 Sean Christopherson 2023-04-18  134  
614fdcd72ea5f2 Sean Christopherson 2023-04-18  135  	if (flush)
614fdcd72ea5f2 Sean Christopherson 2023-04-18  136  		kvm_flush_remote_tlbs(kvm);
614fdcd72ea5f2 Sean Christopherson 2023-04-18  137  
614fdcd72ea5f2 Sean Christopherson 2023-04-18  138  	KVM_MMU_UNLOCK(kvm);
614fdcd72ea5f2 Sean Christopherson 2023-04-18  139  }
614fdcd72ea5f2 Sean Christopherson 2023-04-18  140  

:::::: The code at line 126 was first introduced by commit
:::::: 614fdcd72ea5f22eba60aa11dec76ec560955abe KVM: Introduced ioctl() to allocate dedicated memory for guests

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
