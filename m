Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC8D2E2F1F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769091008; cv=none; b=YeWJNxbHCvE9Llk5/BcYAEP7NkAlpaeda53G4JBESr/0aAie+BU5E2zsOp+QldYOqAJtwHzKnaq75a/uSCnFWtyPpyxgWaklChDHJSDNze3G6SbG6pDe4CiNkeJX7Xp+PK97Rtcuvc6YACdx9iRY9YZ3ddytGzzpE5vhHEIL7SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769091008; c=relaxed/simple;
	bh=NH7p7hdhJv6oC/qgzIjHRmI72E7Sh6NSABncc1OTxPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LtUMqjhF6gVVFu4jxkT1J8sHcYTMGPZcNQUP/SqgT1taCp+lkLN2HBboRE3LBgnr+zi+LM9F7gLNac7XVYSFX094sNwyO64j3WnbT0uGXXM5UC4iJDQqf3vxIQDGK3Cib7zbV5glDYpxz1hkV4MfQgog4Bo/6CBTkNHdSIks2lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/KPL1vM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/KPL1vM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769091006; x=1800627006;
  h=date:from:to:cc:subject:message-id;
  bh=NH7p7hdhJv6oC/qgzIjHRmI72E7Sh6NSABncc1OTxPE=;
  b=A/KPL1vM0wZN0MGjbHRG/KD6D8rOLu6kEMG3Yshn3BWAXknmatSZ5mZK
   q7LIsuuuiFJ2pWMDAV0mzd5Q2T2MLsZziKgUoStnw/tqW1+Mb1LvUDJOR
   R8yXLY08TRaCcwZEXxHFDYwyPbwAlL0V7QO8Zf1O/yPfKwI2lUWCG52qY
   pXz32DwjfbV6B4rjjx/Rwkmm+/FiK22UWnbzjxH++ckBZegD77Dzbt6aa
   VkpLAOTY8xI5INX9P4Dn31Gb+oMaOlGGf5zZtwcWPOc+kBmitPUpVv6YO
   +FeKZ72KlsCYkqAffHmWVvQx9WlUDI9Ytg1VIjV4p6KERU2coyHCGHEK3
   Q==;
X-CSE-ConnectionGUID: q1903sIGQAy01hmIKesx+A==
X-CSE-MsgGUID: gv3NZA02Qn+ykeJq7yZ4EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70304442"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70304442"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 06:10:05 -0800
X-CSE-ConnectionGUID: Obk1OL6iT2yHBgJwbRMUMA==
X-CSE-MsgGUID: uLYZKnpkQte8K9ULOqloOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="207074627"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jan 2026 06:10:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vivNp-00000000Stl-1xRS;
	Thu, 22 Jan 2026 14:10:01 +0000
Date: Thu, 22 Jan 2026 22:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/tdx_huge_sept 79/79]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:2551:20: warning: comparison of
 constant '0' with boolean expression is always false
Message-ID: <202601222226.EsuUMuuQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   491d01f5d2ac33f4da9d302ff18cdcb57c0d967b
commit: 491d01f5d2ac33f4da9d302ff18cdcb57c0d967b [79/79] KVM: x86: Split cross-boundary mirror leafs for KVM_SET_MEMORY_ATTRIBUTES
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260122/202601222226.EsuUMuuQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222226.EsuUMuuQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601222226.EsuUMuuQ-lkp@intel.com/

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
