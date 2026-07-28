Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B4E284B4F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 23:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785280021; cv=none; b=RRCm48iPmXaMK8s6xndGruWeuo+SsFCJUUgKor1YK4hOoNqc3hEpcMvKbamZ0TmluKizsz+DuHZ9pn1JlPwjUnBaHtlTkVEqqHk0/1QYcVVItqupc7oWTU2LR7E+8crfi/Yz/T8qi8DZJwPemcm9aDLMWzET06OHglWu0HKuIc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785280021; c=relaxed/simple;
	bh=3aW3XndYi0yUh48Y6/CBdACLD6cSOFJ4F2aoiq2+8ao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g18TSSkM3iugEOd/rHKhCqT/GSXKUP/MQVukwc4uJOFAYJFKVxk8oMPsYwNRuwr7j0FhcE8BT5FpRu/d02GDWxJf9p1LKbhi6SX9TbhumZg7k6yBbTQ40iQOF1+z2bQHGfCL+7z6jI71aPM/goA6AFe8I+YosZYIRYdMaPcZ9RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iST38GIb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iST38GIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785280019; x=1816816019;
  h=date:from:to:cc:subject:message-id;
  bh=3aW3XndYi0yUh48Y6/CBdACLD6cSOFJ4F2aoiq2+8ao=;
  b=iST38GIbAVEIFRkfvGnE6eL8HNOompGxEKoLUlpal45yMAyp9LSFoFMk
   j1UwXxE8VlASj0H7dFmMZXPUfpFhDy+QeYuxTGkuB7TJ2IRls0+OxJzFy
   SP2krIP/BWjwe7QDW3FVjcnu7+yOcYMI0PQzQKUOlv/SuH+kPsR3FlVZH
   Yfwvm9Z0GJeHVsNt4zgH8dNhW52MOT9SefN+0S+mmXRXZkcv2B3FO3W3c
   RTspOsWsN8R8+E8j5zlfrXYbn2g3I+ou953Jtb8VoQTYxul2XFzHM7LJr
   LTyVQiOIeKeHG5dpkFAUh9kJsW2asGLwt12GzC7Pb47pGxDww9U/56Ysb
   g==;
X-CSE-ConnectionGUID: t1HhPpQNT4q4PEildkkSqQ==
X-CSE-MsgGUID: 1ap9RqxrSC+9pRo8EDcTdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85007170"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85007170"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 16:06:58 -0700
X-CSE-ConnectionGUID: Cox5/1ddTJakSP1NkGTd6w==
X-CSE-MsgGUID: WJX4GdvaSKiTo4499TMBxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="284370916"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jul 2026 16:06:57 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woqsx-0000000022E-1lFi;
	Tue, 28 Jul 2026 23:06:55 +0000
Date: Wed, 29 Jul 2026 01:06:03 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_bug_on_bad_eoi_vector 120/120]
 arch/x86/kvm/lapic.c:1625:6: error: conflicting types for
 'kvm_apic_set_eoi_accelerated'; have 'void(struct kvm_vcpu *, u8)' {aka
 'void(struct kvm_vcpu *, unsigned char)'}
Message-ID: <202607290105.TCwZYQef-lkp@intel.com>
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
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260729/202607290105.TCwZYQef-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290105.TCwZYQef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290105.TCwZYQef-lkp@intel.com/

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
