Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0741D1714B3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657106; cv=none; b=kU0FnHlhi9ohkF/M+istjfmdJfBUaWCdcycCdQ+xbpyCr7A6juTtVsISVTcqrIs73X7rm7/0HV49jG+GEMRSFWKKnBImHUsU8V/cM+zLexieTBCGTOKEcPc/cTjKQfuKK/rlLfm6wnLMQm38tlHjT7Bz2OiN6mlKQ5i2RYumSkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657106; c=relaxed/simple;
	bh=X6EFwW7aKFMpA9YM+ptMKcDI2GcLdowO5FfNIWuLqcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cT/raB59LySLSFo1capkC9GjyUQU32GFHP+QsLqJHjjFlWLjKTafmZ/TCx+cG45KBPLLH0yKOk/Nvyclokmcb8X1GWnRqLvHRdx6xr7qNa9vSU2r5y1VnrV35PJp2wpiwabmOAKWBNHbcnx90+TDSrt0IlAesoO4AbH2xsAjzWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGTMiiI4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGTMiiI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747657104; x=1779193104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X6EFwW7aKFMpA9YM+ptMKcDI2GcLdowO5FfNIWuLqcU=;
  b=kGTMiiI4SuSi7jTcaFTjEFH8Ix36Ny4IYtvWXiJMVYQOSifgmGQmeiKS
   6BKjIghLDQOnYaCaPG20QoMgAWesCapyf+2o67HS03BJ4xxtwMOX4UHUm
   G8NaMt8WkgO2f51yjKaQs36n0tBqGkBBFRLf9B+LG2XuDGYp34O2eyBbx
   BzcRNO33QcYMigL3rDvI3wv5MvqRuFOI/KDd8N1U/GY5wGpbXFY6K3c/S
   6iswqY0aeXBIDAjvmBVhVH/o0JifR35kEfstZxc5KteNwQSJc51PmfFop
   RA5l6DABZpjsTj+K4dFZFUhjFapX0HDWF9mrgAuVxN7aB5fvDti1DZBGF
   w==;
X-CSE-ConnectionGUID: sAUHwwchSU6TON9QlDHZWA==
X-CSE-MsgGUID: MGW9jqRvTPWfahR490MrPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49658032"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49658032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:18:23 -0700
X-CSE-ConnectionGUID: Vz0RFQIDSoOPnI1dKX/45w==
X-CSE-MsgGUID: hF4dbCenT0eNMRIOFlm1eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139396536"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 May 2025 05:18:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGzRj-000LTM-2B;
	Mon, 19 May 2025 12:18:19 +0000
Date: Mon, 19 May 2025 20:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 27/75]
 arch/s390/kvm/../../../virt/kvm/guest_memfd.c:504:35: error:
 'KVM_FILTER_SHARED' undeclared
Message-ID: <202505192014.wdmMr64h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 02bb15aeea3c78413143e7b2944e2b801c7024e7 [27/75] KVM: guest_memfd: Introduce KVM_GMEM_CONVERT_SHARED/PRIVATE ioctls
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250519/202505192014.wdmMr64h-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192014.wdmMr64h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192014.wdmMr64h-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> arch/s390/kvm/../../../virt/kvm/guest_memfd.c:493:43: warning: unused variable 'filter' [-Wunused-variable]
     493 |                 enum kvm_gfn_range_filter filter;
         |                                           ^~~~~~
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_create':
   arch/s390/kvm/../../../virt/kvm/guest_memfd.c:1122:13: error: implicit declaration of function 'kvm_arch_vm_supports_gmem_shared_mem' [-Wimplicit-function-declaration]
    1122 |         if (kvm_arch_vm_supports_gmem_shared_mem(kvm))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
