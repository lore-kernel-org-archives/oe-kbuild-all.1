Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8680E23373E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 08:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583162; cv=none; b=EvT8vBLdwVVvSb1dPkg6RwyQw4ohZlascUPP8C9wqwecWHUZrC6egFeWf8rTZHK/XYzJ4xt7s/GfEowEa6bRKqDRyvz+lcQawTiUJspdZYkD5u/W3PEWyQ3NoUGBl3MScOjThcAyq3ay9cmHdJ/kX+Hrv4bR/cRYwAFF1KQANWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583162; c=relaxed/simple;
	bh=M+6r3d5g9elG+V6bE6YYOitA5Lo0f2KjgzcYFIJphNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aw/duEnkTxpA17thyvqAlnDBoTpJonfoKsBp3sfxAZJFc+zmOTj5kMPlFFE89RFCIgfpUiioIXRJv9PznPtPgL9jPoYHR11PjglBjJOjSLlCRDYXLPYEl/k/EiKgPlv8UtyCm9fnkvdeFRkwhsVGnDtOOjalwlXT0JHSr7SKsEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLcDXO0+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLcDXO0+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743583160; x=1775119160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+6r3d5g9elG+V6bE6YYOitA5Lo0f2KjgzcYFIJphNA=;
  b=gLcDXO0+gjNmRzHqlRib13NACUvfkIzowok4Rca6tU/t5UqhC+YcCKek
   BzTSLwaMoAVnV0VhYRqKsxNK2Ho+ZFr9a3DnnD8mo5QENAEXa9ruyheq8
   aIkw3dBRRxmsN4DK+PGHwdtGbqG0s5C0VdK1jUz3203xnR7/iJHKCn7QI
   kj6gv4kMXIPrbWqKRS2/wAtVm1DyMoPW1U0QzwhbgO6DDS9xKfmbhzpPI
   ncIKlrVREYCrfUmyMMLwSHbG0yy/4TVSZfWTi7WyIKF2S1pKb+4NXRmzb
   b1DUU5x8ppd93zYy3oYJcFf4LNVhv7gAhHBEN3LY7zdlSsuvIGA0DkKvH
   Q==;
X-CSE-ConnectionGUID: x2Ms5J4MQq6xn61kLmZx0g==
X-CSE-MsgGUID: 8tHabMcsSmCcLb1XQWrfEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45060021"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="45060021"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 01:39:19 -0700
X-CSE-ConnectionGUID: 0koXhXtgTBulAryY8kbiuA==
X-CSE-MsgGUID: cejdcdHQRGqquhcFpuVEAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="126523812"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Apr 2025 01:39:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tztcy-000Aa6-0c;
	Wed, 02 Apr 2025 08:39:16 +0000
Date: Wed, 2 Apr 2025 16:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/stale_mmio_cleanup 70/72]
 arch/x86/kvm/vmx/vmx.c:7364:43: error: 'struct kvm_arch' has no member named
 'mapped_host_mmio'
Message-ID: <202504021630.C3QkiAsX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/stale_mmio_cleanup
head:   1f284ca401d9620d6f0e4aea289cc2a50c4403e9
commit: 7df9be2ef92ca4407a365455e0670f4f07af7e25 [70/72] KVM: VMX: Apply MMIO mitigation if KVM maps MMIO into the guest
config: i386-buildonly-randconfig-001-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021630.C3QkiAsX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021630.C3QkiAsX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021630.C3QkiAsX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/x86/kvm/vmx/vmx.c: In function 'vmx_vcpu_enter_exit':
>> arch/x86/kvm/vmx/vmx.c:7364:43: error: 'struct kvm_arch' has no member named 'mapped_host_mmio'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                                           ^
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:7364:18: note: in expansion of macro 'READ_ONCE'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                  ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:43: error: 'struct kvm_arch' has no member named 'mapped_host_mmio'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                                           ^
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:7364:18: note: in expansion of macro 'READ_ONCE'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                  ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:43: error: 'struct kvm_arch' has no member named 'mapped_host_mmio'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                                           ^
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:7364:18: note: in expansion of macro 'READ_ONCE'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                  ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:43: error: 'struct kvm_arch' has no member named 'mapped_host_mmio'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                                           ^
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:7364:18: note: in expansion of macro 'READ_ONCE'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                  ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:43: error: 'struct kvm_arch' has no member named 'mapped_host_mmio'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                                           ^
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:7364:18: note: in expansion of macro 'READ_ONCE'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                  ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:43: error: 'struct kvm_arch' has no member named 'mapped_host_mmio'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                                           ^
   include/linux/compiler_types.h:498:27: note: in definition of macro '__unqual_scalar_typeof'
     498 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:7364:18: note: in expansion of macro 'READ_ONCE'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                  ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:344,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from arch/x86/kvm/vmx/vmx.c:17:
>> arch/x86/kvm/vmx/vmx.c:7364:43: error: 'struct kvm_arch' has no member named 'mapped_host_mmio'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                                           ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   arch/x86/kvm/vmx/vmx.c:7364:18: note: in expansion of macro 'READ_ONCE'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                  ^~~~~~~~~


vim +7364 arch/x86/kvm/vmx/vmx.c

  7347	
  7348	static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
  7349						unsigned int flags)
  7350	{
  7351		struct vcpu_vmx *vmx = to_vmx(vcpu);
  7352	
  7353		guest_state_enter_irqoff();
  7354	
  7355		/*
  7356		 * L1D Flush includes CPU buffer clear to mitigate MDS, but VERW
  7357		 * mitigation for MDS is done late in VMentry and is still
  7358		 * executed in spite of L1D Flush. This is because an extra VERW
  7359		 * should not matter much after the big hammer L1D Flush.
  7360		 */
  7361		if (static_branch_unlikely(&vmx_l1d_should_flush))
  7362			vmx_l1d_flush(vcpu);
  7363		else if (static_branch_unlikely(&mmio_stale_data_clear) &&
> 7364			 READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
  7365			mds_clear_cpu_buffers();
  7366	
  7367		vmx_disable_fb_clear(vmx);
  7368	
  7369		if (vcpu->arch.cr2 != native_read_cr2())
  7370			native_write_cr2(vcpu->arch.cr2);
  7371	
  7372		vmx->fail = __vmx_vcpu_run(vmx, (unsigned long *)&vcpu->arch.regs,
  7373					   flags);
  7374	
  7375		vcpu->arch.cr2 = native_read_cr2();
  7376		vcpu->arch.regs_avail &= ~VMX_REGS_LAZY_LOAD_SET;
  7377	
  7378		vmx->idt_vectoring_info = 0;
  7379	
  7380		vmx_enable_fb_clear(vmx);
  7381	
  7382		if (unlikely(vmx->fail)) {
  7383			vmx->exit_reason.full = 0xdead;
  7384			goto out;
  7385		}
  7386	
  7387		vmx->exit_reason.full = vmcs_read32(VM_EXIT_REASON);
  7388		if (likely(!vmx->exit_reason.failed_vmentry))
  7389			vmx->idt_vectoring_info = vmcs_read32(IDT_VECTORING_INFO_FIELD);
  7390	
  7391		if ((u16)vmx->exit_reason.basic == EXIT_REASON_EXCEPTION_NMI &&
  7392		    is_nmi(vmx_get_intr_info(vcpu))) {
  7393			kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
  7394			if (cpu_feature_enabled(X86_FEATURE_FRED))
  7395				fred_entry_from_kvm(EVENT_TYPE_NMI, NMI_VECTOR);
  7396			else
  7397				vmx_do_nmi_irqoff();
  7398			kvm_after_interrupt(vcpu);
  7399		}
  7400	
  7401	out:
  7402		guest_state_exit_irqoff();
  7403	}
  7404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
