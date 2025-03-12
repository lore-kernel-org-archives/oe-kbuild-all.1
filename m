Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D1C1DFF7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741797141; cv=none; b=U6lSZfskmfRqt+6UKPMAttqp83fDdmZ5yJmGBpwYeKRxHrt8no2vK6xTsNC+F0GR+6b9rl8nd0GjJ8sYXMV/Kt9teiQQBoQ5iQJG9VCcipG9XB7k16Sps/Q6IedN2iD0CHIwSLREWF548WluKm/kQpF+zl0yVqBoP/cIWMElrW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741797141; c=relaxed/simple;
	bh=FUx4uFhPyShNg64nzxKBj62xZWcPGRPIZ7Bzpae1sYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOyqFIeiq3pOkGDgR1KhBNjH2PSpiTl4dEWKcB6H5IZa2tx6hkGSnRI9X5WZJGLupgCiO8lesEAirtVaBOC1L5RZgsySjfgiVmCOCw/IVkWeJiqIFyZn+nT4HnOxW1X/F+u+hROgi4DCi4aq8rCcj16UQI1OL6Xn9xH7M3dkVlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu4JxRhK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu4JxRhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741797140; x=1773333140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FUx4uFhPyShNg64nzxKBj62xZWcPGRPIZ7Bzpae1sYY=;
  b=mu4JxRhKdG5TrAVdajH2c2vctL3Md+DW7sRIdHJJXsp9ynXHDdek67wV
   an+sMInbm471CzWzVmGvLw+oZ143WGyb2GNxByHMPN9wAidL8vaA64Xli
   NB5okBdrvg29sGpKyw2RtWNDHboTBI+XYRcWuX2n/4uFWPP4CnE5kYueL
   DyZmwdQKjhPMIPK2hCWFSfl+jhYkSWRrij+/Wy6+nCHlca9bLe7P6O8Xy
   0cTB7GYKCsHDnpLx9j7AKmTSQa25+gLBeGRX1iBmXeYk94p3+ea/Jo7Ln
   pFG6vUZK0lz6K2wMJKDzEU8GP3Brtnu8lN5kFw3mBfj6uRFvuWjzMNSuu
   g==;
X-CSE-ConnectionGUID: CMqCJ2IkTsqQ8O7QfkLOsQ==
X-CSE-MsgGUID: 0Gjlb0vGSWu04IOKVLyFjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43087548"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="43087548"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 09:32:11 -0700
X-CSE-ConnectionGUID: d1a9cCHPSZSV1PKpdtbA8Q==
X-CSE-MsgGUID: j2UhEjnGRwuSKAaj+XU89A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120925881"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Mar 2025 09:32:02 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsOzw-0008j4-1b;
	Wed, 12 Mar 2025 16:32:00 +0000
Date: Thu, 13 Mar 2025 00:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 280/280]
 arch/x86/kvm/mmu/mmu.c:4757:51: error: 'struct kvm_arch' has no member named
 'pkvm'
Message-ID: <202503130055.JzKJIn18-lkp@intel.com>
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
commit: 6e27d23add2a1f16ed2a78641daed6d88a91a32c [280/280] ANDROID: pkvm: x86: Fix compiling issues found by 0day for arch s390/powerpc
config: i386-buildonly-randconfig-003-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130055.JzKJIn18-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130055.JzKJIn18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130055.JzKJIn18-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_tdp_page_fault':
   arch/x86/kvm/mmu/mmu.c:4739:39: error: invalid application of 'sizeof' to incomplete type 'struct kvm_pinned_page'
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:887:49: note: in expansion of macro 'alloc_hooks'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4739:25: note: in expansion of macro 'kmalloc'
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                         ^~~~~~~
   arch/x86/kvm/mmu/mmu.c:4739:39: error: invalid application of 'sizeof' to incomplete type 'struct kvm_pinned_page'
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^
   include/linux/alloc_tag.h:231:24: note: in definition of macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:887:49: note: in expansion of macro 'alloc_hooks'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4739:25: note: in expansion of macro 'kmalloc'
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                         ^~~~~~~
   arch/x86/kvm/mmu/mmu.c:4739:39: error: invalid application of 'sizeof' to incomplete type 'struct kvm_pinned_page'
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^
   include/linux/alloc_tag.h:234:24: note: in definition of macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:887:49: note: in expansion of macro 'alloc_hooks'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4739:25: note: in expansion of macro 'kmalloc'
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                         ^~~~~~~
   arch/x86/kvm/mmu/mmu.c:4739:23: warning: assignment to 'struct kvm_pinned_page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                       ^
   arch/x86/kvm/mmu/mmu.c:4755:30: error: invalid use of undefined type 'struct kvm_pinned_page'
    4755 |                         ppage->page = page;
         |                              ^~
>> arch/x86/kvm/mmu/mmu.c:4757:51: error: 'struct kvm_arch' has no member named 'pkvm'
    4757 |                         spin_lock(&vcpu->kvm->arch.pkvm.pinned_page_lock);
         |                                                   ^
   arch/x86/kvm/mmu/mmu.c:4758:40: error: invalid use of undefined type 'struct kvm_pinned_page'
    4758 |                         list_add(&ppage->list, &vcpu->kvm->arch.pkvm.pinned_pages);
         |                                        ^~
   arch/x86/kvm/mmu/mmu.c:4758:64: error: 'struct kvm_arch' has no member named 'pkvm'
    4758 |                         list_add(&ppage->list, &vcpu->kvm->arch.pkvm.pinned_pages);
         |                                                                ^
   arch/x86/kvm/mmu/mmu.c:4759:53: error: 'struct kvm_arch' has no member named 'pkvm'
    4759 |                         spin_unlock(&vcpu->kvm->arch.pkvm.pinned_page_lock);
         |                                                     ^


vim +4757 arch/x86/kvm/mmu/mmu.c

  4731	
  4732	int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
  4733	{
  4734		struct kvm_pinned_page *ppage = NULL;
  4735		struct page *page;
  4736		int r;
  4737	
  4738		if (vcpu->kvm->arch.vm_type == KVM_X86_PROTECTED_VM) {
> 4739			ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
  4740			if (!ppage)
  4741				return -ENOMEM;
  4742		}
  4743	
  4744	#ifdef CONFIG_X86_64
  4745		if (tdp_mmu_enabled)
  4746			r = kvm_tdp_mmu_page_fault(vcpu, fault);
  4747		else
  4748			r = direct_page_fault(vcpu, fault);
  4749	#else
  4750		r = direct_page_fault(vcpu, fault);
  4751	#endif
  4752	
  4753		if (ppage) {
  4754			if (r == RET_PF_FIXED && (page = kvm_pfn_to_refcounted_page(fault->pfn))) {
  4755				ppage->page = page;
  4756				get_page(page);
> 4757				spin_lock(&vcpu->kvm->arch.pkvm.pinned_page_lock);
  4758				list_add(&ppage->list, &vcpu->kvm->arch.pkvm.pinned_pages);
  4759				spin_unlock(&vcpu->kvm->arch.pkvm.pinned_page_lock);
  4760			} else {
  4761				kfree(ppage);
  4762			}
  4763		}
  4764	
  4765		return r;
  4766	}
  4767	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
