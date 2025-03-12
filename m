Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315D1422DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793332; cv=none; b=dvBwWs+5mhD9uiW5geioL6xyapjHWqQKq3reH29uWwFumzg9mGDvW1a/pY7iAAMJWgSqKi8wm1ViZuNHamMi7M+ubuLGOJBt1+8WqnoLlX9emifo6SX5LXNMM/SUr6MYNjV05Il0Pc/ncSYue3r2BT6i/KZVg9KRyGSxHy4KXpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793332; c=relaxed/simple;
	bh=EGZuUpDr//jaRdXf/uKu1IGEaACrrG+Adp9/cjvnSf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rP/FCro9wHGgh3eYsbuZpOmzPhBSke8ZPrtPJDCGXYHXdaUi7kJo7oKzuGVrAqsQB/H2OCUsatrqJzM323Eicv5WO9SbPoYQ0Sm9ksftXPW177/Iwq7IfhQmhUIJmwzlSEHEj1nFzyRGYYvSIEoOpxdMpGU6EjcmMSSzy3mPcsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeTjsSCK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeTjsSCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741793330; x=1773329330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EGZuUpDr//jaRdXf/uKu1IGEaACrrG+Adp9/cjvnSf8=;
  b=AeTjsSCKaHyFEq5F3/ajXOVatYmwNI/lh8m0tIiC0Al6XAbnJGdj67xL
   Girdnd/bLndOqhCd6sZJn49tcPI5DmUfayULyp1SwHzIco6RM/c2VCwpA
   buSoaVIJtgaVAGzy24yuC4goq5rFj3G05MqtpHQKxDfv1n9nr0CnvyJNg
   praN5EqD/Ht9S/KiLjmpTM5ufpcs1lKnbcnnL0TzAj1elRz7Pml1B3Q53
   LsL+Z7IGNHM9PwVPS7LIUd5McRzb9Zejw0TzNbVm9gWGkboCfUyTiW06G
   HwKIFRItuJ0j0fl1dw3uRsBGUnfb3cYittOth7QR+MxTKY8supN7oLRar
   A==;
X-CSE-ConnectionGUID: 5n1nHBfcThKSCia5Uarugg==
X-CSE-MsgGUID: GbzHfluiSai/8lNOT7FE5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42134162"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="42134162"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 08:28:50 -0700
X-CSE-ConnectionGUID: x7//u5VLT8S4jl7q7ubD6g==
X-CSE-MsgGUID: gz3SVc/aSoWHxmWPVjoWIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120630374"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 12 Mar 2025 08:28:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsO0k-0008eq-1e;
	Wed, 12 Mar 2025 15:28:46 +0000
Date: Wed, 12 Mar 2025 23:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 280/280]
 arch/x86/kvm/mmu/mmu.c:4595:39: error: invalid application of 'sizeof' to
 incomplete type 'struct kvm_pinned_page'
Message-ID: <202503122351.Dmionfev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   416b1b8e121ff0114c661e47e388426ad5cce864
commit: 09bf6b8a4a13018bbcea10b0f62f734ff6bbcb1a [280/280] ANDROID: REVERTME: HACK: kvm: pin all the pages used by protected VM
config: i386-buildonly-randconfig-003-20250312 (https://download.01.org/0day-ci/archive/20250312/202503122351.Dmionfev-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503122351.Dmionfev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503122351.Dmionfev-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from arch/x86/include/asm/msr.h:15,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from arch/x86/kvm/irq.h:13,
                    from arch/x86/kvm/mmu/mmu.c:19:
   arch/x86/kvm/mmu/mmu.c: In function 'direct_page_fault':
>> arch/x86/kvm/mmu/mmu.c:4595:39: error: invalid application of 'sizeof' to incomplete type 'struct kvm_pinned_page'
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:887:49: note: in expansion of macro 'alloc_hooks'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4595:25: note: in expansion of macro 'kmalloc'
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                         ^~~~~~~
>> arch/x86/kvm/mmu/mmu.c:4595:39: error: invalid application of 'sizeof' to incomplete type 'struct kvm_pinned_page'
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^
   include/linux/alloc_tag.h:231:24: note: in definition of macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:887:49: note: in expansion of macro 'alloc_hooks'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4595:25: note: in expansion of macro 'kmalloc'
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                         ^~~~~~~
>> arch/x86/kvm/mmu/mmu.c:4595:39: error: invalid application of 'sizeof' to incomplete type 'struct kvm_pinned_page'
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^
   include/linux/alloc_tag.h:234:24: note: in definition of macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:887:49: note: in expansion of macro 'alloc_hooks'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4595:25: note: in expansion of macro 'kmalloc'
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                         ^~~~~~~
>> arch/x86/kvm/mmu/mmu.c:4595:23: warning: assignment to 'struct kvm_pinned_page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                       ^
>> arch/x86/kvm/mmu/mmu.c:4630:22: error: invalid use of undefined type 'struct kvm_pinned_page'
    4630 |                 ppage->page = pfn_to_page(fault->pfn);
         |                      ^~
   arch/x86/kvm/mmu/mmu.c:4631:31: error: invalid use of undefined type 'struct kvm_pinned_page'
    4631 |                 get_page(ppage->page);
         |                               ^~
   arch/x86/kvm/mmu/mmu.c:4632:37: error: 'struct kvm' has no member named 'pkvm'
    4632 |                 spin_lock(&vcpu->kvm->pkvm.pinned_page_lock);
         |                                     ^~
   arch/x86/kvm/mmu/mmu.c:4633:32: error: invalid use of undefined type 'struct kvm_pinned_page'
    4633 |                 list_add(&ppage->list, &vcpu->kvm->pkvm.pinned_pages);
         |                                ^~
   arch/x86/kvm/mmu/mmu.c:4633:50: error: 'struct kvm' has no member named 'pkvm'
    4633 |                 list_add(&ppage->list, &vcpu->kvm->pkvm.pinned_pages);
         |                                                  ^~
   arch/x86/kvm/mmu/mmu.c:4634:39: error: 'struct kvm' has no member named 'pkvm'
    4634 |                 spin_unlock(&vcpu->kvm->pkvm.pinned_page_lock);
         |                                       ^~


vim +4595 arch/x86/kvm/mmu/mmu.c

  4583	
  4584	static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
  4585	{
  4586		struct kvm_pinned_page *ppage = NULL;
  4587		kvm_pfn_t orig_pfn;
  4588		int r;
  4589	
  4590		/* Dummy roots are used only for shadowing bad guest roots. */
  4591		if (WARN_ON_ONCE(kvm_mmu_is_dummy_root(vcpu->arch.mmu->root.hpa)))
  4592			return RET_PF_RETRY;
  4593	
  4594		if (vcpu->kvm->arch.vm_type == KVM_X86_PROTECTED_VM) {
> 4595			ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
  4596			if (!ppage)
  4597				return -ENOMEM;
  4598		}
  4599	
  4600		if (page_fault_handle_page_track(vcpu, fault))
  4601			return RET_PF_WRITE_PROTECTED;
  4602	
  4603		r = fast_page_fault(vcpu, fault);
  4604		if (r != RET_PF_INVALID)
  4605			return r;
  4606	
  4607		r = mmu_topup_memory_caches(vcpu, false);
  4608		if (r)
  4609			return r;
  4610	
  4611		r = kvm_faultin_pfn(vcpu, fault, ACC_ALL);
  4612		if (r != RET_PF_CONTINUE)
  4613			return r;
  4614	
  4615		orig_pfn = fault->pfn;
  4616	
  4617		r = RET_PF_RETRY;
  4618		write_lock(&vcpu->kvm->mmu_lock);
  4619	
  4620		if (is_page_fault_stale(vcpu, fault))
  4621			goto out_unlock;
  4622	
  4623		r = make_mmu_pages_available(vcpu);
  4624		if (r)
  4625			goto out_unlock;
  4626	
  4627		r = direct_map(vcpu, fault);
  4628	
  4629		if (ppage && r == RET_PF_FIXED) {
> 4630			ppage->page = pfn_to_page(fault->pfn);
  4631			get_page(ppage->page);
  4632			spin_lock(&vcpu->kvm->pkvm.pinned_page_lock);
  4633			list_add(&ppage->list, &vcpu->kvm->pkvm.pinned_pages);
  4634			spin_unlock(&vcpu->kvm->pkvm.pinned_page_lock);
  4635		}
  4636	
  4637	out_unlock:
  4638		write_unlock(&vcpu->kvm->mmu_lock);
  4639		kvm_release_pfn_clean(orig_pfn);
  4640		return r;
  4641	}
  4642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
