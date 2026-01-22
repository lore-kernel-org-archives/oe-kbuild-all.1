Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F07262F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769087739; cv=none; b=VQoHwqZIWYQPbDKaexCpSir8L/Nad4pZuSmNb+jT9/CjfmiPufxJ/4/VjmiCqDPXfyaUKuDoTA5cQndm4EzkKbnqBdnqXcR1MzeGfgucXoLPlnB3daKjUN62S6wqzN4WxtgXFd+D6Or23s1yR936FkuV+v3Ahu5rXAZvjkQav0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769087739; c=relaxed/simple;
	bh=6Btj7PggeVezsw0MY7/5W4QF1fvuP3yDU4Wv5hR8jhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vA9pBAAxIffkAsqKjPZ1hylSDvORfSkP8DCzIepPKvZMZ4Enr9EUifYYo0ipiuUDaEsUTVw01JZcqfnEPVjnKdN9T/DV654hXXwV8VmLzdFSdk+2ZoBXS2VhipGVsqF+yos2Ziz5l9wF+QK9vGJV3ESuM3gSH6hMbkAA07ct2Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBbkAn00; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBbkAn00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769087738; x=1800623738;
  h=date:from:to:cc:subject:message-id;
  bh=6Btj7PggeVezsw0MY7/5W4QF1fvuP3yDU4Wv5hR8jhA=;
  b=FBbkAn00FBPJv0qRtaCI/zp75N4U9YKBA8Ks9aas4KIMY6IEDPWZ64xH
   vIwn113rNkcPYdbH/s2uxpOX3E4Yrg+tiDY9Yg7UluXImmR4l97O4G552
   EDCmJ9G8WJJs09rr3Z0p6AABuPwXvCwXbp5v61VlVbOgouZ+Lr95NQmwI
   IgITeVAcfO2nNkto8aGl24fb/r9ul9a1IKllPg9r7LsMOHX7j5a3DYxKU
   l+Dd7ABu/AnYIYiss4rq2iI6Ydcp9wphW6kZ1iSr9VdqMGfPFC9cUDPk8
   stSs+IIV1KRXe5Zm5ZaLBeP67iH+v9Ryodtmh9xeRWholhOQ3Jer39PWA
   A==;
X-CSE-ConnectionGUID: Kajx5uYFRdOzsbNPUueifQ==
X-CSE-MsgGUID: e93U1d50T6yBKdJLJNM8fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="57893498"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="57893498"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 05:15:37 -0800
X-CSE-ConnectionGUID: DsJaE4VFQ3C+/hwlHkkaoQ==
X-CSE-MsgGUID: PdtHqFkgRwaRP0hC42EJBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="205983827"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 22 Jan 2026 05:15:36 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viuX7-000000000V7-09wv;
	Thu, 22 Jan 2026 13:15:33 +0000
Date: Thu, 22 Jan 2026 14:14:53 +0100
From: kernel test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/tdx_huge_sept 79/79]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:2551:20: warning: comparison of
 constant '0' with boolean expression is always false
Message-ID: <202601221423.5e12zVZ8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   491d01f5d2ac33f4da9d302ff18cdcb57c0d967b
commit: 491d01f5d2ac33f4da9d302ff18cdcb57c0d967b [79/79] KVM: x86: Split cross-boundary mirror leafs for KVM_SET_MEMORY_ATTRIBUTES
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260122/202601221423.5e12zVZ8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221423.5e12zVZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221423.5e12zVZ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_handle_gfn_range':
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2551:20: warning: comparison of constant '0' with boolean expression is always false [-Wbool-compare]
    2551 |         return ret < 0 ? ret : 0;
         |                    ^


vim +/0 +2551 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  2499	
  2500	static __always_inline int kvm_handle_gfn_range(struct kvm *kvm,
  2501							struct kvm_mmu_notifier_range *range)
  2502	{
  2503		struct kvm_gfn_range gfn_range;
  2504		struct kvm_memory_slot *slot;
  2505		struct kvm_memslots *slots;
  2506		struct kvm_memslot_iter iter;
  2507		bool found_memslot = false;
  2508		bool ret = false;
  2509		int i;
  2510	
  2511		gfn_range.arg = range->arg;
  2512		gfn_range.may_block = range->may_block;
  2513	
  2514		/*
  2515		 * If/when KVM supports more attributes beyond private .vs shared, this
  2516		 * _could_ set KVM_FILTER_{SHARED,PRIVATE} appropriately if the entire target
  2517		 * range already has the desired private vs. shared state (it's unclear
  2518		 * if that is a net win).  For now, KVM reaches this point if and only
  2519		 * if the private flag is being toggled, i.e. all mappings are in play.
  2520		 */
  2521	
  2522		for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
  2523			slots = __kvm_memslots(kvm, i);
  2524	
  2525			kvm_for_each_memslot_in_gfn_range(&iter, slots, range->start, range->end) {
  2526				slot = iter.slot;
  2527				gfn_range.slot = slot;
  2528	
  2529				gfn_range.start = max(range->start, slot->base_gfn);
  2530				gfn_range.end = min(range->end, slot->base_gfn + slot->npages);
  2531				if (gfn_range.start >= gfn_range.end)
  2532					continue;
  2533	
  2534				if (!found_memslot) {
  2535					found_memslot = true;
  2536					KVM_MMU_LOCK(kvm);
  2537					if (!IS_KVM_NULL_FN(range->on_lock))
  2538						range->on_lock(kvm);
  2539				}
  2540	
  2541				ret |= range->handler(kvm, &gfn_range);
  2542			}
  2543		}
  2544	
  2545		if (range->flush_on_ret && ret)
  2546			kvm_flush_remote_tlbs(kvm);
  2547	
  2548		if (found_memslot)
  2549			KVM_MMU_UNLOCK(kvm);
  2550	
> 2551		return ret < 0 ? ret : 0;
  2552	}
  2553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
