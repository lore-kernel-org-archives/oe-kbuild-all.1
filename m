Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D6424CEEA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247903; cv=none; b=YsgndQxouPUWYbMXM6STQHnqe5+BrFyCVI/lhKIpwMf8edPaTnaDzpelimaYmEOzMIYlhVY0esVxHlbmZCt3/SpgGHN2S1oXJO15ALbdReFGBg/oqy+ESLNAYmK4dR85QvtMuNpLJC2bu2PUy32inUeqvrVTWjDqKemQyL1jzuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247903; c=relaxed/simple;
	bh=rYwiiE14mVjIVeU9oqYW3s+ZOY1Z1Sk4+pAk28KT1e8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I4GsBInaXabeJZD5Y4ebAmnhHce3ScCU4hgQR13ot37GQU9svdoLbJ3qBmoXgaErE6tYhcIOpSW2yOhKELotqyQB3B1IhE8mvh8Sg7kZTUHHSzcY8hG1U6lQMlgG9/CCsty8wlG2/vsFNUhz19qj50QqFztEbU3MRkGviZv2AHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q06rgGDm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q06rgGDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785247901; x=1816783901;
  h=date:from:to:cc:subject:message-id;
  bh=rYwiiE14mVjIVeU9oqYW3s+ZOY1Z1Sk4+pAk28KT1e8=;
  b=Q06rgGDmQRToQtw0E8VsRqqMnUQgiQu+GzfL7tDUSPC3vg9jcuHcZxcF
   kzukNLL8LWM7fDJcMxWRzIAiT8ZLJUGKul/n8fngR0Mu6DXZiYvp36Fi/
   rSqgdKrFEUXDf6IgAg1LaiHbU8PHxjEIE018GfUffisFtisSUUdt8I/8I
   2GNdWyY1RaAr3IGs2IABdFutTCNO3B8IL1vlBvjDmnli/t0k18E1Cfscp
   K00EaH5rbUo2SClnOARQy31Mtd6fnaUN39OkGb+LBDwee8tiODWYlhTeP
   xFweYCGcG80OiC1zQcZN+4RlMeENJwZNXwGByxR1iklyaY8iILwtp088B
   A==;
X-CSE-ConnectionGUID: sHIFaJOKSvuYgswTKqXQeA==
X-CSE-MsgGUID: ybWRi2kmSui1jlKC8WzZBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97205790"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="97205790"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:11:40 -0700
X-CSE-ConnectionGUID: fqiN51pYTySu4Cpes08Z4w==
X-CSE-MsgGUID: PkLOp4G3R3eEfoWM1oQiLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="257916667"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Jul 2026 07:11:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woiWu-00000000eQJ-353P;
	Tue, 28 Jul 2026 14:11:36 +0000
Date: Tue, 28 Jul 2026 22:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 1/1]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous
 prototype for 'module_handle_host_perm_fault'
Message-ID: <202607282242.6ZmZpAfK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   f957accaf5634f841071adb4f35286ef2779d5b1
commit: c141eb26c3393517c536d0db42f53d258d5cc3a4 [1/1] ANDROID: KVM: arm64: Rework pKVM module fault handler
config: arm64-randconfig-001-20260728 (https://download.01.org/0day-ci/archive/20260728/202607282242.6ZmZpAfK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282242.6ZmZpAfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282242.6ZmZpAfK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:58: error: parameter 1 ('notif') has incomplete type
    static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:13: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
                ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'pkvm_psci_notify':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:33:22: error: type of formal parameter 1 is incomplete
      pkvm_psci_notifier(notif, &host_ctxt->regs);
                         ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_cpu_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:19: error: 'PKVM_PSCI_CPU_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
                      ^~~~~~~~~~~~~~~~~~~~~
                      KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_system_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:19: error: 'PKVM_PSCI_SYSTEM_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
                      ^~~~~~~~~~~~~~~~~~~~~~~~
                      KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function '__kvm_host_psci_cpu_entry':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:254:19: error: 'PKVM_PSCI_CPU_ENTRY' undeclared (first use in this function); did you mean 'KVM_PSCI_RET_DENIED'?
     pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
                      ^~~~~~~~~~~~~~~~~~~
                      KVM_PSCI_RET_DENIED
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:19:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_entry_wfx,
                         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:22: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_entry_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:24: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:478:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_entry_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:478:24: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:479:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_entry_iabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:479:27: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:480:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_entry_dabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:480:27: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_exit_wfx,
                         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:22: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_exit_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:24: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:487:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_exit_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:487:24: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:488:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_exit_iabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:488:27: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:489:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_exit_dabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:489:27: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:498:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:498:27: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:499:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:499:27: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:1686:32: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=incompatible-pointer-types]
     if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
                                   ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:28:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
    handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/module_handle_host_perm_fault +33 arch/arm64/kvm/hyp/include/nvhe/modules.h

    16	
    17	#ifdef CONFIG_MODULES
    18	int __pkvm_init_module(void *host_mod);
    19	int __pkvm_register_hcall(unsigned long hfn_hyp_va);
    20	int handle_host_dynamic_hcall(struct user_pt_regs *regs, int id);
    21	void __pkvm_close_module_registration(void);
    22	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr);
    23	#else
    24	static inline int __pkvm_init_module(void *module_init) { return -EOPNOTSUPP; }
    25	static inline int
    26	__pkvm_register_hcall(unsigned long hfn_hyp_va) { return -EOPNOTSUPP; }
    27	static inline int
    28	handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
    29	{
    30		return HCALL_UNHANDLED;
    31	}
    32	static inline void __pkvm_close_module_registration(void) { }
  > 33	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
