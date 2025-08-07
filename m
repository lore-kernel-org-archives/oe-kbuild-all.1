Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190D218858
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 23:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754610640; cv=none; b=dE6yQZujnW3My/3+maNk1wNrySJ8BypJiOtBhImmF1QTnyllQNSc2uwA5ykkGkyL6ssU93OHA6JB01LJHv3KK9Gqg/Pq9qd7vaswUTuYV5Nf0xu4jMRv5hvh5FpIhTOMZFdHSPR4kvgH+B0y1lTR+NEtUtbriUnGVuB04F1H+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754610640; c=relaxed/simple;
	bh=ARvaOq+HFBgh3LW7nJy5z489DOu41/3B+0ByriI3Wls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EuP0fAbUDh4MOwP3Lz45E4SppAD+bddOttgq6FfEWaAsqeDh4yI85Wl+0gTO3xXpKNrCcwKRj3B2ToKuMA8lUtVlezlAGa70tX3uWsuykahNTy/FopN+hIj2ripak6yg8NHYWOxd4MRQZQ7WoGygFeiCjxHDiKICqtT01KucP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbhK4ml5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbhK4ml5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754610639; x=1786146639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ARvaOq+HFBgh3LW7nJy5z489DOu41/3B+0ByriI3Wls=;
  b=fbhK4ml5NrLSXk7KNpqv5gNL60sFzHaHUBxztujrreCvpBuXDEjJytoz
   jfpNmsq3bvY/GM9GkAhIPYltXrFYLE2VhN09aiYv7CKQkc70yEzts1a/P
   Gor8QfyUlEaxF9HtgxYJXRhqI9cTFG1as/Ul+RimpsxFz+egmmFbUD/nb
   HiAQXW57VmoNZAJYYnOiTbhtVSjR1cNyt4C3e+9ED9ypooth/CPHXSvQJ
   bOBKo2CaUjeqFkJpLs1vCIo12DCPyJIV9FUYNVEtXxnYsFetjILTnvI1C
   PUScKo8qVNstOIilqjOv/fyCDkiJYHA6+8YIm5hzDydb1g8W9kDic6WqH
   A==;
X-CSE-ConnectionGUID: 289IndV0TVuNopeeUhZ/TA==
X-CSE-MsgGUID: yupL7BDcQqiK5wKVcweeow==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56860240"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56860240"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 16:50:38 -0700
X-CSE-ConnectionGUID: fM5xdtz1QfiraXH/o/bg9Q==
X-CSE-MsgGUID: me0JnLChTaWXgQLohpg1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169414145"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 16:50:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukANW-0003Mp-1N;
	Thu, 07 Aug 2025 23:50:34 +0000
Date: Fri, 8 Aug 2025 07:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Yan Zhao <yan.y.zhao@intel.com>
Subject: [intel-tdx:huge_page_v2 57/204]
 arch/s390/kvm/../../../virt/kvm/guest_memfd.c:504:35: error:
 'KVM_FILTER_SHARED' undeclared
Message-ID: <202508080718.IbutVMGI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git huge_page_v2
head:   0744d0b90629d528fa94ff73dce7ceeaaed1560c
commit: cd0e3e3e24066f4045d103aa466affe1af30c385 [57/204] KVM: guest_memfd: Introduce KVM_GMEM_CONVERT_SHARED/PRIVATE ioctls
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250808/202508080718.IbutVMGI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080718.IbutVMGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080718.IbutVMGI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_invalidate_begin':
>> arch/s390/kvm/../../../virt/kvm/guest_memfd.c:493:43: error: storage size of 'filter' isn't known
     493 |                 enum kvm_gfn_range_filter filter;
         |                                           ^~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:496:26: error: 'KVM_FILTER_PRIVATE' undeclared (first use in this function)
     496 |                 filter = KVM_FILTER_PRIVATE;
         |                          ^~~~~~~~~~~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:496:26: note: each undeclared identifier is reported only once for each function it appears in
>> arch/s390/kvm/../../../virt/kvm/guest_memfd.c:504:35: error: 'KVM_FILTER_SHARED' undeclared (first use in this function)
     504 |                         filter |= KVM_FILTER_SHARED;
         |                                   ^~~~~~~~~~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:507:24: error: variable 'gfn_range' has initializer but incomplete type
     507 |                 struct kvm_gfn_range gfn_range = {
         |                        ^~~~~~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:508:26: error: 'struct kvm_gfn_range' has no member named 'start'
     508 |                         .start = slot->base_gfn + max(pgoff, start) - pgoff,
         |                          ^~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:508:34: warning: excess elements in struct initializer
     508 |                         .start = slot->base_gfn + max(pgoff, start) - pgoff,
         |                                  ^~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:508:34: note: (near initialization for 'gfn_range')
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:509:26: error: 'struct kvm_gfn_range' has no member named 'end'
     509 |                         .end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
         |                          ^~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:509:32: warning: excess elements in struct initializer
     509 |                         .end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
         |                                ^~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:509:32: note: (near initialization for 'gfn_range')
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:510:26: error: 'struct kvm_gfn_range' has no member named 'slot'
     510 |                         .slot = slot,
         |                          ^~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:510:33: warning: excess elements in struct initializer
     510 |                         .slot = slot,
         |                                 ^~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:510:33: note: (near initialization for 'gfn_range')
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:511:26: error: 'struct kvm_gfn_range' has no member named 'may_block'
     511 |                         .may_block = true,
         |                          ^~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:511:38: warning: excess elements in struct initializer
     511 |                         .may_block = true,
         |                                      ^~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:511:38: note: (near initialization for 'gfn_range')
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:512:26: error: 'struct kvm_gfn_range' has no member named 'attr_filter'
     512 |                         .attr_filter = filter,
         |                          ^~~~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:512:40: warning: excess elements in struct initializer
     512 |                         .attr_filter = filter,
         |                                        ^~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:512:40: note: (near initialization for 'gfn_range')
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:507:38: error: storage size of 'gfn_range' isn't known
     507 |                 struct kvm_gfn_range gfn_range = {
         |                                      ^~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:507:38: warning: unused variable 'gfn_range' [-Wunused-variable]
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:493:43: warning: unused variable 'filter' [-Wunused-variable]
     493 |                 enum kvm_gfn_range_filter filter;
         |                                           ^~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_create':
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:1111:13: error: implicit declaration of function 'kvm_arch_vm_supports_gmem_shared_mem' [-Wimplicit-function-declaration]
    1111 |         if (kvm_arch_vm_supports_gmem_shared_mem(kvm))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for KVM_GENERIC_MEMORY_ATTRIBUTES
   Depends on [n]: KVM_GENERIC_MMU_NOTIFIER [=n]
   Selected by [y]:
   - KVM_GENERIC_GMEM_POPULATE [=y]


vim +/KVM_FILTER_SHARED +504 arch/s390/kvm/../../../virt/kvm/guest_memfd.c

   483	
   484	static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
   485					      pgoff_t end)
   486	{
   487		bool flush = false, found_memslot = false;
   488		struct kvm_memory_slot *slot;
   489		struct kvm *kvm = gmem->kvm;
   490		unsigned long index;
   491	
   492		xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
 > 493			enum kvm_gfn_range_filter filter;
   494			pgoff_t pgoff = slot->gmem.pgoff;
   495	
   496			filter = KVM_FILTER_PRIVATE;
   497			if (kvm_gmem_memslot_supports_shared(slot)) {
   498				/*
   499				 * Unmapping would also cause invalidation, but cannot
   500				 * rely on mmu_notifiers to do invalidation via
   501				 * unmapping, since memory may not be mapped to
   502				 * userspace.
   503				 */
 > 504				filter |= KVM_FILTER_SHARED;
   505			}
   506	
   507			struct kvm_gfn_range gfn_range = {
   508				.start = slot->base_gfn + max(pgoff, start) - pgoff,
   509				.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
   510				.slot = slot,
   511				.may_block = true,
   512				.attr_filter = filter,
   513			};
   514	
   515			if (!found_memslot) {
   516				found_memslot = true;
   517	
   518				KVM_MMU_LOCK(kvm);
   519				kvm_mmu_invalidate_begin(kvm);
   520			}
   521	
   522			flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
   523		}
   524	
   525		if (flush)
   526			kvm_flush_remote_tlbs(kvm);
   527	
   528		if (found_memslot)
   529			KVM_MMU_UNLOCK(kvm);
   530	}
   531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
