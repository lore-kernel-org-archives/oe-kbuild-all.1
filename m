Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66F39F185
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 07:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855719; cv=none; b=JWHf1oaDKEompPi9/XkQ+20n2OB5Lx+ghE3InK0Hh/HjpEZpAxYuSn3pTybrQ97GJ/oTBV3or3pkvAH9Jtbdh3OaLXpNGwg3fy8tIvpld44TnVydvfJU5XHquAueyKnMWb/OYeqwA3Yr5nxl1UIp7azCr8nkwwhA0WowkdAz6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855719; c=relaxed/simple;
	bh=Wz65wKGB8hF6DMlNRicFjyfi27smJbGH4Yi8pyOp8QY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZiCXuZ64McplcRgzzyGh0SoBMZJjeTbxnE7UlZDNLpKKiRCfxpGokgl1zG2/TevbXt0PNPMLWI9KXMdewtjcAO0VnP/hi/WrKvZbBESYn4lyU95drqEoG+kgSDy6219LFMELOMqp6554RkJ/SKY+vPO42L4Fb0I3pcImWlZmpzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbVCJn9V; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbVCJn9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774855718; x=1806391718;
  h=date:from:to:cc:subject:message-id;
  bh=Wz65wKGB8hF6DMlNRicFjyfi27smJbGH4Yi8pyOp8QY=;
  b=PbVCJn9VDGX+tSvd1uxfDV5Um89rlmsNy8TE6r5EmjiS5y2obQVNWonS
   3F+X7NvQzddx5vx4zgrya014Pq0k/BHyrTh4yeV3WIVTo7eR/Rw7awZqk
   4Zo5VkEQAkyI8HBVhLRKKo/SCMWmir3kGS4/RPiblAb7o7fJ9WOaTsCx2
   3wAK47Pn3rWI3IdH8BkY2+WZflzMLuK4kTa/F+BTwzYiZGnxHlcHBrkpj
   +I6FJDFbdeYR7ioinZQNkALTu0GnMX2CPN7WMTpNDttKh3LdAXnpjQeSW
   5guUWTpyMEliB8Ov6Vcn98o/6cOFaCZDjrA2NKhkUzVfPHTr6r+yKtuuR
   Q==;
X-CSE-ConnectionGUID: d3h+xZbEQt62ko+nxziGmw==
X-CSE-MsgGUID: tyNuu58dSCiolUOVwJxMKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79442586"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79442586"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 00:28:36 -0700
X-CSE-ConnectionGUID: N6zxDTDPSmafc8shEr/+CA==
X-CSE-MsgGUID: BGDodAIfSIW9RRCyoIMAuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="249166399"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2026 00:28:34 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7732-000000000ov-0kJR;
	Mon, 30 Mar 2026 07:28:32 +0000
Date: Mon, 30 Mar 2026 15:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous
 prototype for function 'module_handle_host_perm_fault'
Message-ID: <202603301553.oXD4raUZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   b050398b89b00b305b45dd70b8ab91470c42f155
commit: c141eb26c3393517c536d0db42f53d258d5cc3a4 [1/1] ANDROID: KVM: arm64: Rework pKVM module fault handler
config: arm64-randconfig-001-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301553.oXD4raUZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301553.oXD4raUZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301553.oXD4raUZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      33 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     476 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:28: note: previous initialization is here
     475 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     477 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:28: note: previous initialization is here
     475 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:478:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     478 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:28: note: previous initialization is here
     475 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:479:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     479 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:28: note: previous initialization is here
     475 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:480:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     480 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:28: note: previous initialization is here
     475 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     485 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:28: note: previous initialization is here
     484 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     486 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:28: note: previous initialization is here
     484 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:487:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     487 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:28: note: previous initialization is here
     484 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:488:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     488 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:28: note: previous initialization is here
     484 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:489:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     489 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:28: note: previous initialization is here
     484 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:498:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     498 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:497:28: note: previous initialization is here
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      33 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   1 warning generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      33 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
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
   1 warning and 4 errors generated.


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
