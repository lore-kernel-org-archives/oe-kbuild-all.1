Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7222245001
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741794016; cv=none; b=r33GPOFF6yaZdWAVyuAqzAPuTkKGEti1HZ5/4/pMyhfoutrkC9/E6ExmHnI6fYxm2JqXE60pDGfTlSyvKM28nSy5bhrJW7yawkqe8rlYLPTtCSM49mHNbP0VksQRRFsirVHY3E1SqXb8VkztJUSpSQJL0vmzRhxTWex3cLMuX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741794016; c=relaxed/simple;
	bh=/52CkBmsjfTmPjWn6jpwT0h4ikUF9u+uH7qr/I/Fiqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GM2L1Bx4fNhzYZkxGK8odlYoAS9Hzq+jZYviEH0WUn6znot7woEnd4OAmDyKLbybkM160TI2/l6WRHsBFUbA4UUP53MHrsZZ2wLNJazNOlJekZJYDpP3lxgnO5nzqX4mZtJeYSALfvqwDRla70oaQGjzVOebNmHlj3njaCbWhwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGi3hiRp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGi3hiRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741794015; x=1773330015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/52CkBmsjfTmPjWn6jpwT0h4ikUF9u+uH7qr/I/Fiqo=;
  b=EGi3hiRpuXMf+OVGQrY3Qto5MdxkV18Loq53BE58bXaeqQLqD2YWP4vP
   C2mA6rjSa2ZkhqrP0RJpscYc1DRJoHvxAvG0S3m4s/09je9OSdlXblzdq
   BioKxUWh9h8B8pKrBKVd2qyiJ/6dPJdagxcrHKB+eZ5SaaltAG1ZLU2cI
   L+JVKOJylJsFZ7vSB8uqWGJx2gZ71XK/tiHY2gzybuVEeGRYB7GUNRgN2
   WakRFnph8OvuDC0sZoIJshk3lggxzoLcp2Im0w7dDDw3wUzWFYwxGOd4u
   OBqJ7BK7/v1/Q2jnIKYsc6KsocJml+puc6uAAXH/k2XNrLqa720AP0UEW
   Q==;
X-CSE-ConnectionGUID: YNxK7vmfTJCr7pzvCIn4jw==
X-CSE-MsgGUID: BsRqSIbyTqeD7LN37kaNGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42987565"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="42987565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 08:39:52 -0700
X-CSE-ConnectionGUID: anbCkLLVQt6tDfz3u5CJgA==
X-CSE-MsgGUID: WAuf9KfmROaLQRiJxE/xtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="124826744"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Mar 2025 08:39:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsOBP-0008fU-2H;
	Wed, 12 Mar 2025 15:39:47 +0000
Date: Wed, 12 Mar 2025 23:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 280/280]
 arch/x86/kvm/mmu/mmu.c:4595:25: error: invalid application of 'sizeof' to an
 incomplete type 'struct kvm_pinned_page'
Message-ID: <202503122341.39YxLHVY-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250312/202503122341.39YxLHVY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503122341.39YxLHVY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503122341.39YxLHVY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:4595:25: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_pinned_page'
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^~~~~~~~
   include/linux/slab.h:887:52: note: expanded from macro 'kmalloc'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                                            ^~~~~~~~~~~
   include/linux/alloc_tag.h:241:31: note: expanded from macro 'alloc_hooks'
     241 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:227:9: note: expanded from macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4586:9: note: forward declaration of 'struct kvm_pinned_page'
    4586 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
>> arch/x86/kvm/mmu/mmu.c:4595:25: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_pinned_page'
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^~~~~~~~
   include/linux/slab.h:887:52: note: expanded from macro 'kmalloc'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                                            ^~~~~~~~~~~
   include/linux/alloc_tag.h:241:31: note: expanded from macro 'alloc_hooks'
     241 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:231:10: note: expanded from macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4586:9: note: forward declaration of 'struct kvm_pinned_page'
    4586 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
>> arch/x86/kvm/mmu/mmu.c:4595:25: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_pinned_page'
    4595 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^~~~~~~~
   include/linux/slab.h:887:52: note: expanded from macro 'kmalloc'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                                            ^~~~~~~~~~~
   include/linux/alloc_tag.h:241:31: note: expanded from macro 'alloc_hooks'
     241 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:234:10: note: expanded from macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4586:9: note: forward declaration of 'struct kvm_pinned_page'
    4586 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
>> arch/x86/kvm/mmu/mmu.c:4630:8: error: incomplete definition of type 'struct kvm_pinned_page'
    4630 |                 ppage->page = pfn_to_page(fault->pfn);
         |                 ~~~~~^
   arch/x86/kvm/mmu/mmu.c:4586:9: note: forward declaration of 'struct kvm_pinned_page'
    4586 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
   arch/x86/kvm/mmu/mmu.c:4631:17: error: incomplete definition of type 'struct kvm_pinned_page'
    4631 |                 get_page(ppage->page);
         |                          ~~~~~^
   arch/x86/kvm/mmu/mmu.c:4586:9: note: forward declaration of 'struct kvm_pinned_page'
    4586 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
   arch/x86/kvm/mmu/mmu.c:4632:25: error: no member named 'pkvm' in 'struct kvm'
    4632 |                 spin_lock(&vcpu->kvm->pkvm.pinned_page_lock);
         |                            ~~~~~~~~~  ^
   arch/x86/kvm/mmu/mmu.c:4633:18: error: incomplete definition of type 'struct kvm_pinned_page'
    4633 |                 list_add(&ppage->list, &vcpu->kvm->pkvm.pinned_pages);
         |                           ~~~~~^
   arch/x86/kvm/mmu/mmu.c:4586:9: note: forward declaration of 'struct kvm_pinned_page'
    4586 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
   arch/x86/kvm/mmu/mmu.c:4633:38: error: no member named 'pkvm' in 'struct kvm'
    4633 |                 list_add(&ppage->list, &vcpu->kvm->pkvm.pinned_pages);
         |                                         ~~~~~~~~~  ^
   arch/x86/kvm/mmu/mmu.c:4634:27: error: no member named 'pkvm' in 'struct kvm'
    4634 |                 spin_unlock(&vcpu->kvm->pkvm.pinned_page_lock);
         |                              ~~~~~~~~~  ^
   9 errors generated.


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
