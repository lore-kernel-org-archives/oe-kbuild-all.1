Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6F375F63
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534010; cv=none; b=FlWa59K2qqRmn5vSZOhSRDiD9mPtmhHJS7ju6JiaZJeiXutBuoKjTfc35BUc1mJjLL1Po6a82kYAcWCKlCYsBDTw5w0D938FUzCUQpX6WIRmCiuLaTeaWoi+nfBpaO1ua3kxBt6om0NZucI/l5qWLZhYbPu72jt47NYH/zdi4FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534010; c=relaxed/simple;
	bh=ea6tGf5QeyZy2opFNcA+PyIHZJ5J53IrooKN/tG3fIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VqdzoEbIsQKwPg9S9eM2ROFWmItAcgzjLr5FiROWmIxHg8YA2UqgaVETxxKeUEM0sz7Of3Pzjiq+wFI2DShbybKq7m6SeUkJ9zAenfhc1H93Yue0Q8wOZ7gYKT0XuNSpvauwibL5JugEydONo9z1FY9ntWA/GodZ8P3fJ4NvJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMYA43NB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMYA43NB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534009; x=1807070009;
  h=date:from:to:cc:subject:message-id;
  bh=ea6tGf5QeyZy2opFNcA+PyIHZJ5J53IrooKN/tG3fIA=;
  b=cMYA43NBgH5BL0sGfCu5K5EmK5Nc2dscQ2+laoHXz9p/gbfA6sxGCBm/
   rGdCveq9wJWCB4ashefZ/zMiFNIMgizIzfLCvai/KDx893ODTexZeO0Sw
   UW4vpJazzpqOIqERz59bV8X+OrhVwxp7jkf3haRpjiGiKPpHxiXJMIcS+
   W1FhGmHgiU0oNOXMqGQEw+YKoO5hU5Jghree8DJRWXObZKn8t8msJMbUx
   X56ic42Z4k4IeMpUzN395qi6R17gvDXp9wHXkitmsg3QCdpULtJ50hO5Y
   W7MHSX1qhszDS5f/wu5rUxblAQoUvmbwT81aFIBVwtIWoExFF7pwx1RAL
   Q==;
X-CSE-ConnectionGUID: KwoRU6NvSaWfx5jJztHsVg==
X-CSE-MsgGUID: 4pjpaogTTB2JnrUfUvgNQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781626"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781626"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:53:26 -0700
X-CSE-ConnectionGUID: uB3I9ZYWRjG3aEVbtSlRnw==
X-CSE-MsgGUID: YYTQIfg0S2KiWUhF6SPVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225303585"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:53:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xVB-0000000003J-2x9x;
	Tue, 07 Apr 2026 03:53:21 +0000
Date: Tue, 07 Apr 2026 11:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous
 prototype for 'module_handle_host_perm_fault'
Message-ID: <202604041015.Ex1lwQCZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   861ae8d9b142c1ff23fec0174b471dec9236fbae
commit: c141eb26c3393517c536d0db42f53d258d5cc3a4 [1/1] ANDROID: KVM: arm64: Rework pKVM module fault handler
config: arm64-randconfig-002-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041015.Ex1lwQCZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041015.Ex1lwQCZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041015.Ex1lwQCZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
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
--
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
