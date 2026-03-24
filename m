Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C75390CA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376775; cv=none; b=uOEuRAI3IbECpOViiWo1xJWrlHKiVrURqsZbbEBbdjPpfZkpxrf/wOlZ2GixF85L+9mv3BTtJh/7KSlOhj4gPNj+uJa1cd8STNZ72i+bABCLKfKtioZbqxog8i5GXjtNZI+EqEqBZkOAQzwIXAaC0yIvMEbfz21sPibeK+0uo1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376775; c=relaxed/simple;
	bh=mgrSTeQ0pdxscHDQs8mDL5973z8CyUeBx5BMLxSXTvU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JKXaLVDPXPyggvdHurkEutYsvlDlCKaZHBTw7iBGD10EPnTz+4LQAyGn0dcGkbAcwrZwSCAcOJ7Zc94xqstUlX7ZX9fH71askY3Ei1Abymh8DS46qQ+1g/xu7Y1LczcysZb2wCL+veW4CkmCgMkFq7qLHznE1LvY76miIxE8b6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2EHUFWn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2EHUFWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774376773; x=1805912773;
  h=date:from:to:cc:subject:message-id;
  bh=mgrSTeQ0pdxscHDQs8mDL5973z8CyUeBx5BMLxSXTvU=;
  b=m2EHUFWnn4oOauxzfSEiJY8pRfQUfla6Xd6N9Dk34oCzK9AobRzvrLEH
   GQsfRY03Q4HQ3AvCaGTCL8kC04k9lNLCyXGR7XewojXZdQi+HK3DG/TJm
   aH8kfboxz0ErDMUeV6Y1VmW+bmTOo78A++AvJ6iV45SVjWQAxqVr7xpyI
   YZEenJtDVj2McvBPHiA2cfslJ+iS5CPIKdhEsE86eK4BjW7yHauqIBAu3
   jCxJN9j9Fym+zULn1Q8JRX2U2t0Qa0d7/qtDrWZcVpUv8mMn65/iIjlUz
   WMO8UuzTWywDY6E4vSvG63YNUm1C613lZ1PloWQmc4NdgF0DD9xoA+Tko
   w==;
X-CSE-ConnectionGUID: saefrzdjSdS+izZ7CbOMCQ==
X-CSE-MsgGUID: 2Y+e3gwCRByoSi+clbt96A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75431093"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75431093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 11:26:13 -0700
X-CSE-ConnectionGUID: mXESekENSsCPYUECG8X10A==
X-CSE-MsgGUID: B9yH1yVkQDeqqrSeTmq6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="220010778"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Mar 2026 11:26:09 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w56S7-000000005CZ-2Ryr;
	Tue, 24 Mar 2026 18:26:07 +0000
Date: Wed, 25 Mar 2026 02:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/hyp/nvhe/device/device.c:163:28: error: invalid use of
 undefined type 'struct pkvm_device_ops'
Message-ID: <202603250211.vKUSJdno-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   6355550c251f2498dbaa876c13f44d99fff86935
commit: 2d2f67ab8cbe5896278bbd7716c2bcad9f8cfc71 [1/1] ANDROID: KVM: arm64: power_lock for pKVM modules
config: arm64-randconfig-r122-20260324 (https://download.01.org/0day-ci/archive/20260325/202603250211.vKUSJdno-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250211.vKUSJdno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250211.vKUSJdno-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/hyp-constants.c:5:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/switch.c:29:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:30:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: return type is an incomplete type
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
      49 |  return false;
         |         ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: note: declared here
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/tlb.c:11:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/tlb.c:11:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/ffa.h:10,
                    from arch/arm64/kvm/hyp/nvhe/hyp-main.c:23:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:26:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: return type is an incomplete type
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
      49 |  return false;
         |         ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: note: declared here
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: At top level:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:443:22: warning: initialized field overwritten [-Woverride-init]
     443 |  [ESR_ELx_EC_WFx]  = handle_pvm_entry_wfx,
         |                      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:443:22: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:444:24: warning: initialized field overwritten [-Woverride-init]
     444 |  [ESR_ELx_EC_HVC64]  = handle_pvm_entry_hvc64,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:444:24: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:445:24: warning: initialized field overwritten [-Woverride-init]
     445 |  [ESR_ELx_EC_SYS64]  = handle_pvm_entry_sys64,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:445:24: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:446:27: warning: initialized field overwritten [-Woverride-init]
     446 |  [ESR_ELx_EC_IABT_LOW]  = handle_pvm_entry_iabt,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:446:27: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:447:27: warning: initialized field overwritten [-Woverride-init]
     447 |  [ESR_ELx_EC_DABT_LOW]  = handle_pvm_entry_dabt,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:447:27: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:452:22: warning: initialized field overwritten [-Woverride-init]
     452 |  [ESR_ELx_EC_WFx]  = handle_pvm_exit_wfx,
         |                      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:452:22: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:453:24: warning: initialized field overwritten [-Woverride-init]
     453 |  [ESR_ELx_EC_HVC64]  = handle_pvm_exit_hvc64,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:453:24: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:24: warning: initialized field overwritten [-Woverride-init]
     454 |  [ESR_ELx_EC_SYS64]  = handle_pvm_exit_sys64,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:24: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:27: warning: initialized field overwritten [-Woverride-init]
     455 |  [ESR_ELx_EC_IABT_LOW]  = handle_pvm_exit_iabt,
         |                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:27: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:27: warning: initialized field overwritten [-Woverride-init]
     456 |  [ESR_ELx_EC_DABT_LOW]  = handle_pvm_exit_dabt,
         |                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:27: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:27: warning: initialized field overwritten [-Woverride-init]
     465 |  [ESR_ELx_EC_IABT_LOW]  = handle_vm_exit_abt,
         |                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:27: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: warning: initialized field overwritten [-Woverride-init]
     466 |  [ESR_ELx_EC_DABT_LOW]  = handle_vm_exit_abt,
         |                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:2076:32: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2076 |  if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                ^~~~~~~~~~~~~~~~
         |                                |
         |                                struct user_pt_regs *
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:26:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:38:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
      38 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: return type is an incomplete type
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
      49 |  return false;
         |         ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: note: declared here
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:58: error: parameter 1 ('notif') has incomplete type
      30 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:13: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      30 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'pkvm_psci_notify':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:33:22: error: type of formal parameter 1 is incomplete
      33 |   pkvm_psci_notifier(notif, &host_ctxt->regs);
         |                      ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_cpu_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:19: error: 'PKVM_PSCI_CPU_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     192 |  pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                   ^~~~~~~~~~~~~~~~~~~~~
         |                   KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_system_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:19: error: 'PKVM_PSCI_SYSTEM_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     223 |  pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
         |                   KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function '__kvm_host_psci_cpu_entry':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:254:19: error: 'PKVM_PSCI_CPU_ENTRY' undeclared (first use in this function)
     254 |  pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                   ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: return type is an incomplete type
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
      49 |  return false;
         |         ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: note: declared here
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: At top level:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:5: note: previous declaration of '__pkvm_host_donate_sglist_hyp' was here
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/processor.h:35,
                    from include/linux/sched.h:13,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:7:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function '__pkvm_host_donate_sglist_hyp':
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1633:69: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_sglist_page'
    1633 |  WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
         |                                                                     ^
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     123 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1641:13: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1641 |   if (sglist[p].order > max_order) {
         |             ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1641:16: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1641 |   if (sglist[p].order > max_order) {
         |                ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1645:29: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1645 |   size = PAGE_SIZE << sglist[p].order;
         |                             ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1645:32: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1645 |   size = PAGE_SIZE << sglist[p].order;
         |                                ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1647:33: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1647 |   if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
         |                                 ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1647:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1647 |   if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
         |                                    ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:19:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1651:32: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1651 |   phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:87:46: note: in definition of macro 'hyp_pfn_to_phys'
      87 | #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                              ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1651:35: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1651 |   phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                   ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:87:46: note: in definition of macro 'hyp_pfn_to_phys'
      87 | #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                              ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1663:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1663 |   size_t size = PAGE_SIZE << sglist[p].order;
         |                                    ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1663:39: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1663 |   size_t size = PAGE_SIZE << sglist[p].order;
         |                                       ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:19:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1664:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1664 |   u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                    ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:87:46: note: in definition of macro 'hyp_pfn_to_phys'
      87 | #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                              ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1664:39: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1664 |   u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                       ^
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/device/device.c:8:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/device/device.c:8:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/device/device.c: In function 'pkvm_device_reset':
>> arch/arm64/kvm/hyp/nvhe/device/device.c:163:28: error: invalid use of undefined type 'struct pkvm_device_ops'
     163 |  if (!dev->ops || !dev->ops->reset)
         |                            ^~
   arch/arm64/kvm/hyp/nvhe/device/device.c:166:16: error: invalid use of undefined type 'struct pkvm_device_ops'
     166 |  ret = dev->ops->reset(dev->cookie, host_to_guest);
         |                ^~
   arch/arm64/kvm/hyp/nvhe/device/device.c: In function '__pkvm_device_assign':
   arch/arm64/kvm/hyp/nvhe/device/device.c:194:26: error: invalid use of undefined type 'struct pkvm_device_ops'
     194 |  if (dev->ops && dev->ops->power_lock) {
         |                          ^~
   arch/arm64/kvm/hyp/nvhe/device/device.c:195:17: error: invalid use of undefined type 'struct pkvm_device_ops'
     195 |   ret = dev->ops->power_lock(dev->cookie, true);
         |                 ^~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kvm_types.h:20,
                    from arch/arm64/include/asm/kvm_host.h:18,
                    from arch/arm64/kvm/hyp/include/nvhe/iommu.h:5,
                    from arch/arm64/kvm/hyp/nvhe/device/device.c:7:
   arch/arm64/kvm/hyp/nvhe/device/device.c: In function 'pkvm_devices_teardown':
   arch/arm64/kvm/hyp/nvhe/device/device.c:356:19: error: invalid use of undefined type 'struct pkvm_device_ops'
     356 |   WARN_ON(dev->ops->power_lock && dev->ops->power_lock(dev->cookie, false));
         |                   ^~
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     123 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/device/device.c:356:43: error: invalid use of undefined type 'struct pkvm_device_ops'
     356 |   WARN_ON(dev->ops->power_lock && dev->ops->power_lock(dev->cookie, false));
         |                                           ^~
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     123 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/device/device.c: At top level:
   arch/arm64/kvm/hyp/nvhe/device/device.c:410:5: error: conflicting types for 'pkvm_device_register_ops'
     410 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/device/device.c:8:
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:5: note: previous declaration of 'pkvm_device_register_ops' was here
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +163 arch/arm64/kvm/hyp/nvhe/device/device.c

   153	
   154	static int pkvm_device_reset(struct pkvm_device *dev, bool host_to_guest)
   155	{
   156		struct pkvm_dev_iommu *iommu;
   157		int ret;
   158		int i;
   159	
   160		hyp_assert_lock_held(&device_spinlock);
   161	
   162		/* Reset is mandatory. */
 > 163		if (!dev->ops || !dev->ops->reset)
   164			return -ENODEV;
   165	
   166		ret = dev->ops->reset(dev->cookie, host_to_guest);
   167		if (ret)
   168			return ret;
   169	
   170		for (i = 0 ; i < dev->nr_iommus ; ++i) {
   171			iommu = &dev->iommus[i];
   172			ret = kvm_iommu_dev_block_dma(iommu->id, iommu->endpoint, host_to_guest);
   173			if (WARN_ON(ret))
   174				return ret;
   175		}
   176		return 0;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
