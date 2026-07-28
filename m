Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0F22DEA93
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 23:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785280589; cv=none; b=MU3qbegefiy5i8w8BRfIZeD5dxB7/O0i8dtO9+7IFumIAJF8Z8kDBvAbcXWK9RWt+qS1wew9dtSmyWU2dVVfV+lLRJh7a+G7HLhBNj6S7XpwZk3rnp+akPMQI45n26j9VHZhxUaE6i4xeYfZUgS6g9YkFZjG2CtfN67Di3UDCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785280589; c=relaxed/simple;
	bh=WcwZfmXHnbXYtKOe6u2XVAdAOlsoNW4OAVDFntR+NqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jclR04F6soXoPPot0mnwpqEjU32TnxbaqNF/SZikoHBpnCHToBzEzGikzuE3qjL9MApkWkhnsA8wGjFyEuSB1k4N+nCdBWrsU1IWRkiWINNCwgaQcG1aPZylGO/66fKo5EMB1KcDLjx2fwayUQlFNywIgimcb47LNQb5RlOPEKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVZt/Aqq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVZt/Aqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785280587; x=1816816587;
  h=date:from:to:cc:subject:message-id;
  bh=WcwZfmXHnbXYtKOe6u2XVAdAOlsoNW4OAVDFntR+NqY=;
  b=GVZt/AqqjQ6jsJPXTt9Lnh4Dp/QSPZp2HAFP35kRBYiI89LtBoaGXMle
   4BXZExE8TXbCeQT70HrI99UqEHLFE7+92T66MokuCt5xWPCNSQZBLkM6x
   ZEelFSEefHWLPzv/+xurC3PLqQl/pg2xg/guiMCrBKXqpEa1EYqTGuxup
   heUuiYiDt/r7zl/u1SRqplVHywV7La2Ap2mWYtnVtDmLLH2kYHm59hTJc
   kk1h6EZdXADKmKvkRuVKRugHsLiJANr3ZhMCo6//kzr4EPhxmxKxOlzw9
   KXAQqZq4ZgVD2Cf+vz3saeqORp96i1G1LW+/0NRuFOrflR20UfqW137nw
   A==;
X-CSE-ConnectionGUID: SGqZD2fCREqXg6Lqztm/Nw==
X-CSE-MsgGUID: RE1mv9dLSaaqyTPMaCfhEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85920733"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85920733"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 16:16:25 -0700
X-CSE-ConnectionGUID: GiXIjMKCS+eSwdbkGnl3Jw==
X-CSE-MsgGUID: Evn4kA9TQ16QnojivNnRqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="259272910"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Jul 2026 16:16:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wor26-00000000eqT-0nu8;
	Tue, 28 Jul 2026 23:16:22 +0000
Date: Wed, 29 Jul 2026 07:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_bug_on_bad_eoi_vector 120/120]
 arch/x86/kvm/lapic.c:1625:6: error: conflicting types for
 'kvm_apic_set_eoi_accelerated'; have 'void(struct kvm_vcpu *, u8)' {aka
 'void(struct kvm_vcpu *, unsigned char)'}
Message-ID: <202607290650.dU7xZ2eC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/no_bug_on_bad_eoi_vector
head:   49569850d8b90a3da31a4d3e2518ce4aa618c242
commit: 49569850d8b90a3da31a4d3e2518ce4aa618c242 [120/120] KVM: x86: Track kvm_vcpu_arch.pending_ioapic_eoi as a u8 to drop dead BUG_ON()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260729/202607290650.dU7xZ2eC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290650.dU7xZ2eC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290650.dU7xZ2eC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/lapic.c:1625:6: error: conflicting types for 'kvm_apic_set_eoi_accelerated'; have 'void(struct kvm_vcpu *, u8)' {aka 'void(struct kvm_vcpu *, unsigned char)'}
    1625 | void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, u8 vector)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/irq.h:19,
                    from arch/x86/kvm/lapic.c:41:
   arch/x86/kvm/lapic.h:180:6: note: previous declaration of 'kvm_apic_set_eoi_accelerated' with type 'void(struct kvm_vcpu *, int)'
     180 | void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, int vector);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/lapic.c:20:
   arch/x86/kvm/lapic.c:1634:32: error: conflicting types for 'kvm_apic_set_eoi_accelerated'; have 'void(struct kvm_vcpu *, u8)' {aka 'void(struct kvm_vcpu *, unsigned char)'}
    1634 | EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_set_eoi_accelerated);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/kvm_types.h:13:9: note: in expansion of macro 'EXPORT_SYMBOL_FOR_MODULES'
      13 |         EXPORT_SYMBOL_FOR_MODULES(symbol, __stringify(KVM_SUB_MODULES))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/lapic.c:1634:1: note: in expansion of macro 'EXPORT_SYMBOL_FOR_KVM_INTERNAL'
    1634 | EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_set_eoi_accelerated);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/lapic.h:180:6: note: previous declaration of 'kvm_apic_set_eoi_accelerated' with type 'void(struct kvm_vcpu *, int)'
     180 | void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, int vector);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1625 arch/x86/kvm/lapic.c

  1620	
  1621	/*
  1622	 * this interface assumes a trap-like exit, which has already finished
  1623	 * desired side effect including vISR and vPPR update.
  1624	 */
> 1625	void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, u8 vector)
  1626	{
  1627		struct kvm_lapic *apic = vcpu->arch.apic;
  1628	
  1629		trace_kvm_eoi(apic, vector);
  1630	
  1631		kvm_ioapic_send_eoi(apic, vector);
  1632		kvm_make_request(KVM_REQ_EVENT, apic->vcpu);
  1633	}
  1634	EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_set_eoi_accelerated);
  1635	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
