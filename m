Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619959;
	b=FjfWXujSblRdPlILYGIBQDaGSrE8zXGafuFAs+fPxiHCA22iIfbeu5sKAxbJJbQ4VpTa
	 FIqEb3mWRehEzsKE9X9s3TcINEBoBZ0ir+ld+e+1sEdP1jq1KaMex+253ejjTmWUCtFtE
	 Wbg15ZoRgQ3ceiG04VwjxiiXcMMq35aIsoG8WxOlJBJIJstiCq4cQn745nBUcz52WTHHv
	 gBkj7DudgGT9kLUNmtRZJx+EVwaOOG65RoAqGncXxqDQ9dqX6JF9JqBLLBSzrgvXCCiyM
	 sMsKbc8LmR4i2ZXPuWazdUkE9rS7NS2PacCGyWhhr5JGn/EWe/KmZtIKtJdwMlNYLDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619959;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=V2vZCV1JsJw59Hri02egw6t2pXzeLH8lgiESlsbLmqk=;
	b=UNg7F5eAvq6s0Xkdgv7mQm8HzRJ5xLnCQxGcVf32w/JsKQN/tnDNmD7+MfpRv3aUhsJY
	 wWkCTku7m1SLaMoKYOoOdoc/AA1I5jYZgOgsEAShBBGg8CvdE+msUEmh6Z+oAd5upnXzd
	 tTgafbfJht92fgYmoUneHWMemJhLLT17LFmC/uRhRPyWyqPDcq0rgYgQOA5ywzd4pQ4dR
	 NCh4M/pTESzFpCn3OifTHfBCUfOoHG8/hEaPpiVUaSlIV0Q2jwX5Xw9IrX61IRoOMDlbN
	 OOdQByb3rtIeY6e+Vp+Y6UwDgYlDihsYvoCoKtjNfKk1MPxTLzxTZkUR8v8BYTCMElQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xoj9XejM;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60AD606A319
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 21:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B60AD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xoj9XejM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792619958; x=1824155958;
  h=date:from:to:cc:subject:message-id;
  bh=YUc5PMyfkJhd3C6U/Yb31ac7ypOHEIMfXc+dDRduquU=;
  b=Xoj9XejMqbKkvHkAcVRWtkHfKYoH3/+WsGtx7ql9H4iWCCfd2p4lVu4u
   VdgdfYx3tl0fL1+yKkBDjnDlbg4FuLnX4OQph0Ei32nZcCZOVTaldyv9g
   eARtOLiV38Dl67l4vLmXXW9p+U92SDBeI913ENeABqx/Qyeqq4p+5he5e
   dTM9qbl9hm6Ys+hw3aYRq2A6wh0S8VFpB/tyqwzXqZ5hxk+gX3ximc+OW
   z5+Xy7Vhr5FZKesLT4PADemGTGFwsBTk5JiMTxzb6omnGtzYo7rd2wFz8
   3kN603aqOu5iBOIZLbgLAloKZTJZttfAZAAXy17OO4sbsu9a4J4L9r/Kg
   g==;
X-CSE-ConnectionGUID: ar5ysnGhSOKQsnQ2lbBaPQ==
X-CSE-MsgGUID: dmrEqsR+Sai72kQbylKisw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1249019"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1249019"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 14:59:17 -0700
X-CSE-ConnectionGUID: 8HVvW/AoQ0GxsaGP8F9qSA==
X-CSE-MsgGUID: kUaJn5/bTs2TILT8OalOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3262863"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2026 14:59:15 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJeL3-00000000063-0NXv;
	Wed, 21 Oct 2026 21:59:13 +0000
Date: Wed, 21 Oct 2026 23:58:42 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4]
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct
 pkvm_device_ops' declared inside parameter list will not be visible outside
 of this definition or declaration
Message-ID: <202610212308.hLliU0yQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   e1d64d259fc9f324e893fbf276f98ea5446069df
commit: 2d2f67ab8cbe5896278bbd7716c2bcad9f8cfc71 [4/4] ANDROID: KVM: arm64: power_lock for pKVM modules
config: arm64-randconfig-2001-20261021 (https://download.01.org/0day-ci/archive/20261021/202610212308.hLliU0yQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610212308.hLliU0yQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610212308.hLliU0yQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/hyp-constants.c:5:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
                                                  ^~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/switch.c:29:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
                                                  ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:30:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: return type is an incomplete type
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: warning: 'return' with a value, in function returning void
     return false;
            ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: note: declared here
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/tlb.c:11:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
                                                  ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/tlb.c:11:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/ffa.h:10,
                    from arch/arm64/kvm/hyp/nvhe/hyp-main.c:23:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
                                                  ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:26:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: return type is an incomplete type
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: warning: 'return' with a value, in function returning void
     return false;
            ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: note: declared here
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: At top level:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:443:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_entry_wfx,
                         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:443:22: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:444:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_entry_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:444:24: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:445:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_entry_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:445:24: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:446:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_entry_iabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:446:27: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:447:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_entry_dabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:447:27: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:452:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_exit_wfx,
                         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:452:22: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:453:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_exit_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:453:24: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_exit_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:24: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_exit_iabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:27: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_exit_dabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:27: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:27: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:2076:32: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=incompatible-pointer-types]
     if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
                                   ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:26:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:38:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
    handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
                                                  ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: return type is an incomplete type
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: warning: 'return' with a value, in function returning void
     return false;
            ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: note: declared here
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
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
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/device/device.c:8:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
                                                  ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/device/device.c:8:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/device/device.c: In function 'pkvm_device_reset':
   arch/arm64/kvm/hyp/nvhe/device/device.c:163:28: error: dereferencing pointer to incomplete type 'struct pkvm_device_ops'
     if (!dev->ops || !dev->ops->reset)
                               ^~
   arch/arm64/kvm/hyp/nvhe/device/device.c: At top level:
   arch/arm64/kvm/hyp/nvhe/device/device.c:410:5: error: conflicting types for 'pkvm_device_register_ops'
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie)
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/device/device.c:8:
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:5: note: previous declaration of 'pkvm_device_register_ops' was here
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
        ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
                                                  ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: return type is an incomplete type
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: warning: 'return' with a value, in function returning void
     return false;
            ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: note: declared here
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: At top level:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
                                             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:5: note: previous declaration of '__pkvm_host_donate_sglist_hyp' was here
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1633:70: error: dereferencing pointer to incomplete type 'struct pkvm_sglist_page'
     WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
                                                                         ^~~~~~~
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1641:13: error: invalid use of undefined type 'struct pkvm_sglist_page'
      if (sglist[p].order > max_order) {
                ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1645:29: error: invalid use of undefined type 'struct pkvm_sglist_page'
      size = PAGE_SIZE << sglist[p].order;
                                ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1647:33: error: invalid use of undefined type 'struct pkvm_sglist_page'
      if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
                                    ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:19:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1651:32: error: invalid use of undefined type 'struct pkvm_sglist_page'
      phys = hyp_pfn_to_phys(sglist[p].pfn);
                                   ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:87:46: note: in definition of macro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1663:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
      size_t size = PAGE_SIZE << sglist[p].order;
                                       ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:19:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1664:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
      u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
                                       ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:87:46: note: in definition of macro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1684:34: error: invalid use of undefined type 'struct pkvm_sglist_page'
        phys = hyp_pfn_to_phys(sglist[p].pfn);
                                     ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:87:46: note: in definition of macro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1685:31: error: invalid use of undefined type 'struct pkvm_sglist_page'
        size = PAGE_SIZE << sglist[p].order;
                                  ^
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16,
                    from arch/arm64/kvm/hyp/nvhe/trace.c:9:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: 'struct pkvm_device_ops' declared inside parameter list will not be visible outside of this definition or declaration
    int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
                                                  ^~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/trace.c:9:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/trace.c: In function 'rb_move_tail':
   arch/arm64/kvm/hyp/nvhe/trace.c:145:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     struct hyp_buffer_page *tail_page, *new_tail, *new_head;
                                                    ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y] && 64BIT [=y]


vim +222 arch/arm64/kvm/hyp/include/nvhe/pkvm.h

   217	
   218	int pkvm_init_devices(void);
   219	int pkvm_device_hyp_assign_mmio(u64 pfn, u64 nr_pages);
   220	int pkvm_device_reclaim_mmio(u64 pfn, u64 nr_pages);
   221	int pkvm_host_map_guest_mmio(struct pkvm_hyp_vcpu *hyp_vcpu, u64 pfn, u64 gfn);
 > 222	int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
