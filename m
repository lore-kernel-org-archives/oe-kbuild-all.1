Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718E01A2392
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761967331; cv=none; b=nrBUNZaDgldGIAE+DKhaVSILfjJVLFEfVVcC2c0bAmOeD0itsb1MYSjNUwpjzKaG/XJTZ9dw41lU9VTRRe0MLoHTh+bzWyDeWdlnKZnr9w5S3D5Zhg5gM2ZkB46/tPn4BKHWrg56y2nPfs9I2txtQwQNak8cC4Ni/ardkNtx2qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761967331; c=relaxed/simple;
	bh=xbaIZUo21mP/WmcvSLztZ8YiDFcqh3OgeFMINz453ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZsbpwPsO3onLAqQ7hQehujPdZzYPCplTGcazYh5bBwUawwgIBdXk1a/Po0jRj2oX6zqoUVfeho0iu3beSmLbLq1YZQtDM6xAIuDFphhHeq7DjdJnTaWbMl/JIdwY2EuMzHuZ8CrhsKGkfH8TsAG0wiDKpTsE6z7eLcatpXopwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXn6FXe3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXn6FXe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761967329; x=1793503329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbaIZUo21mP/WmcvSLztZ8YiDFcqh3OgeFMINz453ps=;
  b=KXn6FXe3O5or6jr/F2737GQI6e0eRre+aahXEi5rg7aM/vCL1neTNkor
   +i2iXMd3cGw5MvE8QTW9Jjw6gxWHRxFqFzI0ILs9IbVun38msyXm65Wji
   X2dIuRV6uE7PKTwaenBelqWFUHTL/SJE1ln98xp+PyA1XDjYFyCKUL4Rj
   LxoGL4WL8kLECLrretYqG9zynjXf5HKnmlp8iT/rODKo4DdaYIjjkAFX6
   rzcgX/2T6goepQhI2PrEUy+KWSSVCrzLK82/wJg8DNgu1UqDSrcbpsvm1
   qBtmBIzCx8IHzI4IA/fvDEgFpN0FXzyqVrMaDF5sfm5YTAuq5W9GHCRrp
   Q==;
X-CSE-ConnectionGUID: 7yQv/1rQS5q5kmxai80c/g==
X-CSE-MsgGUID: 9MKYyCJRTvyXCGVvbnppiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="67991835"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="67991835"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 20:22:08 -0700
X-CSE-ConnectionGUID: oEXXwGDaRhSsqWMgoJ80LQ==
X-CSE-MsgGUID: +BTuLLl9SKCFRX/t9KXY9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="191519486"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2025 20:22:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF2Bo-000NtQ-1l;
	Sat, 01 Nov 2025 03:22:04 +0000
Date: Sat, 1 Nov 2025 11:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3081/3081] arch/x86/kvm/svm/nested.c:485:6:
 error: call to undeclared function 'to_hv_vcpu'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202511011104.PcEVHImG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6a5b2f9a14178b13fe5efc52ba6575f5294c1270
commit: 2a3cfce9a18a4b772f01830cbc95fe00125431d8 [3081/3081] KVM: x86: Make Hyper-V emulation optional
config: x86_64-randconfig-013-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011104.PcEVHImG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011104.PcEVHImG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011104.PcEVHImG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/nested.c:485:6: error: call to undeclared function 'to_hv_vcpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     485 |         if (to_hv_vcpu(vcpu) && npt_enabled)
         |             ^
   1 error generated.
--
>> arch/x86/kvm/x86.c:12528:8: error: call to undeclared function 'to_kvm_hv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    12528 |         kfree(to_kvm_hv(kvm)->hv_pa_pg);
          |               ^
>> arch/x86/kvm/x86.c:12528:24: error: member reference type 'int' is not a pointer
    12528 |         kfree(to_kvm_hv(kvm)->hv_pa_pg);
          |               ~~~~~~~~~~~~~~  ^
   2 errors generated.
--
   In file included from arch/x86/kvm/kvm-asm-offsets.c:10:
>> arch/x86/kvm/vmx/vmx.h:757:20: error: no member named 'hyperv_enabled' in 'struct kvm_vcpu_arch'
     757 |         return vcpu->arch.hyperv_enabled &&
         |                ~~~~~~~~~~ ^
   1 error generated.
--
>> arch/x86/kvm/lapic.c:1479:6: error: call to undeclared function 'to_hv_vcpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |             ^
>> arch/x86/kvm/lapic.c:1480:23: error: call to undeclared function 'to_hv_synic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                              ^
>> arch/x86/kvm/lapic.c:1480:48: error: member reference type 'int' is not a pointer
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                              ~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:50:37: note: expanded from macro 'bitop'
      50 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
>> arch/x86/kvm/lapic.c:1480:48: error: member reference type 'int' is not a pointer
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                              ~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:51:16: note: expanded from macro 'bitop'
      51 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
>> arch/x86/kvm/lapic.c:1480:48: error: member reference type 'int' is not a pointer
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                              ~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:52:50: note: expanded from macro 'bitop'
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
>> arch/x86/kvm/lapic.c:1480:48: error: member reference type 'int' is not a pointer
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                              ~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:53:17: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
>> arch/x86/kvm/lapic.c:1480:48: error: member reference type 'int' is not a pointer
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                              ~~~~~~~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   arch/x86/kvm/lapic.c:2954:6: error: call to undeclared function 'to_hv_vcpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |             ^
   arch/x86/kvm/lapic.c:2954:43: error: call to undeclared function 'to_hv_synic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                  ^
   arch/x86/kvm/lapic.c:2954:62: error: member reference type 'int' is not a pointer
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                  ~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:50:37: note: expanded from macro 'bitop'
      50 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   arch/x86/kvm/lapic.c:2954:62: error: member reference type 'int' is not a pointer
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                  ~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:51:16: note: expanded from macro 'bitop'
      51 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   arch/x86/kvm/lapic.c:2954:62: error: member reference type 'int' is not a pointer
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                  ~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:52:50: note: expanded from macro 'bitop'
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   arch/x86/kvm/lapic.c:2954:62: error: member reference type 'int' is not a pointer
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                  ~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:53:17: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   arch/x86/kvm/lapic.c:2954:62: error: member reference type 'int' is not a pointer
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                  ~~~~~~~~~~~~~~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   14 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/to_hv_vcpu +485 arch/x86/kvm/svm/nested.c

36e2e98363e6c1 Paolo Bonzini       2020-05-22  476  
d2e5601907bd29 Sean Christopherson 2021-06-09  477  static void nested_svm_transition_tlb_flush(struct kvm_vcpu *vcpu)
d2e5601907bd29 Sean Christopherson 2021-06-09  478  {
3f4a812edf5cb0 Vitaly Kuznetsov    2022-11-01  479  	/*
3f4a812edf5cb0 Vitaly Kuznetsov    2022-11-01  480  	 * KVM_REQ_HV_TLB_FLUSH flushes entries from either L1's VP_ID or
3f4a812edf5cb0 Vitaly Kuznetsov    2022-11-01  481  	 * L2's VP_ID upon request from the guest. Make sure we check for
3f4a812edf5cb0 Vitaly Kuznetsov    2022-11-01  482  	 * pending entries in the right FIFO upon L1/L2 transition as these
3f4a812edf5cb0 Vitaly Kuznetsov    2022-11-01  483  	 * requests are put by other vCPUs asynchronously.
3f4a812edf5cb0 Vitaly Kuznetsov    2022-11-01  484  	 */
3f4a812edf5cb0 Vitaly Kuznetsov    2022-11-01 @485  	if (to_hv_vcpu(vcpu) && npt_enabled)
3f4a812edf5cb0 Vitaly Kuznetsov    2022-11-01  486  		kvm_make_request(KVM_REQ_HV_TLB_FLUSH, vcpu);
3f4a812edf5cb0 Vitaly Kuznetsov    2022-11-01  487  
d2e5601907bd29 Sean Christopherson 2021-06-09  488  	/*
d2e5601907bd29 Sean Christopherson 2021-06-09  489  	 * TODO: optimize unconditional TLB flush/MMU sync.  A partial list of
d2e5601907bd29 Sean Christopherson 2021-06-09  490  	 * things to fix before this can be conditional:
d2e5601907bd29 Sean Christopherson 2021-06-09  491  	 *
d2e5601907bd29 Sean Christopherson 2021-06-09  492  	 *  - Flush TLBs for both L1 and L2 remote TLB flush
d2e5601907bd29 Sean Christopherson 2021-06-09  493  	 *  - Honor L1's request to flush an ASID on nested VMRUN
d2e5601907bd29 Sean Christopherson 2021-06-09  494  	 *  - Sync nested NPT MMU on VMRUN that flushes L2's ASID[*]
d2e5601907bd29 Sean Christopherson 2021-06-09  495  	 *  - Don't crush a pending TLB flush in vmcb02 on nested VMRUN
d2e5601907bd29 Sean Christopherson 2021-06-09  496  	 *  - Flush L1's ASID on KVM_REQ_TLB_FLUSH_GUEST
d2e5601907bd29 Sean Christopherson 2021-06-09  497  	 *
d2e5601907bd29 Sean Christopherson 2021-06-09  498  	 * [*] Unlike nested EPT, SVM's ASID management can invalidate nested
d2e5601907bd29 Sean Christopherson 2021-06-09  499  	 *     NPT guest-physical mappings on VMRUN.
d2e5601907bd29 Sean Christopherson 2021-06-09  500  	 */
d2e5601907bd29 Sean Christopherson 2021-06-09  501  	kvm_make_request(KVM_REQ_MMU_SYNC, vcpu);
d2e5601907bd29 Sean Christopherson 2021-06-09  502  	kvm_make_request(KVM_REQ_TLB_FLUSH_CURRENT, vcpu);
d2e5601907bd29 Sean Christopherson 2021-06-09  503  }
d2e5601907bd29 Sean Christopherson 2021-06-09  504  

:::::: The code at line 485 was first introduced by commit
:::::: 3f4a812edf5cb0a50e65fbdfafdb3e688da18f16 KVM: nSVM: hyper-v: Enable L2 TLB flush

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
