Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE363AF67A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864138; cv=none; b=DEhWuj76RsmToGmodHxN4s48RwbXz/zRF9RQq39NHUALoiZc+Oawbl0osrow6mF/ru9cZOWzRN9M+slmHeF34p6p6ZX/dttkTLCS9iupE8TMaQBmjvWA8iUC2VLcGOj1SLVTDsCtjbBvZtCWqNcqV1vEoG+yex8VJBrfjKIT2Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864138; c=relaxed/simple;
	bh=T8j0WTFr+Wi5FwI0MBQWLmG7NIV7Cx8ll6zF0fdVT0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ijOq2/FRnP2gsnG6gWmvLXSZlt1pw+DKObUp95d0a4mpOkgjWTNJYa2NoRET9kYFSuE32HNs0Wf5v5DOv2kDb0GPzPMiNG4b4quZXIWl1N+uBnErCalumoK/+/hrqDV5wq5MOQ3w+TCJzV0Dxpb0zjrBq3ce8G2ezdJ755VBte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoyunS2O; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoyunS2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774864135; x=1806400135;
  h=date:from:to:cc:subject:message-id;
  bh=T8j0WTFr+Wi5FwI0MBQWLmG7NIV7Cx8ll6zF0fdVT0c=;
  b=VoyunS2O2HJa9XL183URiEmSCntuXGUzYiRPy5LeMTLd1H+TqucVMhnq
   dDmimnnbkVHkYL5YhOc8TNszzpONUUtDrsVz2nBckglmd4Ep0uYCf1GpD
   dyf1HKidz8mwPABptY9FU6BmiBmqAI4yX17zxFhXoR86lVOxa8CSNbbD1
   tGTdYIjF8wCaeQe2A8ZehOg3BeyeUxBVSHLQf6BTPcxCL9BU0qslvHtxM
   km2Hu1oVdcEAs1IK0+7aP4r9qdgCbylY5kSIDnwceGxwLZ1RMe0dOlojS
   ZcZ5TdYJnGEgMhiS8S6VrvX0iSIQIq8z4nglYNqHj57NQLkCCokZLv7lG
   A==;
X-CSE-ConnectionGUID: pHGVTs34ScWlBdS1rzAf8A==
X-CSE-MsgGUID: G4bXqHm4QO2K0HVvvHrTCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="101310606"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="101310606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:48:52 -0700
X-CSE-ConnectionGUID: cYoKe/WkQMaJicW7ngo0wA==
X-CSE-MsgGUID: cNCeSG5VT5O5UXo4Tmq8RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="249211004"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2026 02:48:51 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w79En-000000000vV-00A9;
	Mon, 30 Mar 2026 09:48:49 +0000
Date: Mon, 30 Mar 2026 17:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:35:6: warning: no previous
 prototype for function 'module_handle_host_smc'
Message-ID: <202603301710.7FO4kr5I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   b050398b89b00b305b45dd70b8ab91470c42f155
commit: 30eefcc7af64a3a96243facc2c82f763c0022a0b [1/1] ANDROID: KVM: arm64: Allow 16 host_smc handlers
config: arm64-randconfig-001-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301710.7FO4kr5I-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301710.7FO4kr5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301710.7FO4kr5I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:34:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      34 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:35:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      35 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     465 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:28: note: previous initialization is here
     464 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     466 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:28: note: previous initialization is here
     464 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     467 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:28: note: previous initialization is here
     464 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:468:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     468 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:28: note: previous initialization is here
     464 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:469:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     469 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:28: note: previous initialization is here
     464 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     474 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     475 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     476 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     477 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:478:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     478 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:487:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     487 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:28: note: previous initialization is here
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:34:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      34 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:35:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      35 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   2 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:34:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      34 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:35:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      35 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:58: error: variable has incomplete type 'enum pkvm_psci_notification'
      30 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                                          ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:12:6: note: forward declaration of 'enum pkvm_psci_notification'
      12 | enum pkvm_psci_notification;
         |      ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_SUSPEND'
     192 |         pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:19: error: use of undeclared identifier 'PKVM_PSCI_SYSTEM_SUSPEND'
     223 |         pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:254:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_ENTRY'
     254 |         pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~
   2 warnings and 4 errors generated.


vim +/module_handle_host_smc +35 arch/arm64/kvm/hyp/include/nvhe/modules.h

    16	
    17	#ifdef CONFIG_MODULES
    18	int __pkvm_init_module(void *host_mod);
    19	int __pkvm_register_hcall(unsigned long hfn_hyp_va);
    20	int handle_host_dynamic_hcall(struct user_pt_regs *regs, int id);
    21	void __pkvm_close_module_registration(void);
    22	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr);
    23	bool module_handle_host_smc(struct user_pt_regs *regs);
    24	#else
    25	static inline int __pkvm_init_module(void *module_init) { return -EOPNOTSUPP; }
    26	static inline int
    27	__pkvm_register_hcall(unsigned long hfn_hyp_va) { return -EOPNOTSUPP; }
    28	static inline int
    29	handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
    30	{
    31		return HCALL_UNHANDLED;
    32	}
    33	static inline void __pkvm_close_module_registration(void) { }
  > 34	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
  > 35	bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
