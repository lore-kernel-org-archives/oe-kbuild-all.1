Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCCC38424D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314573; cv=none; b=QNBJnaLQhaHrz0DchVcXla5+EGMV2gXgUHWvC/7BXH/f5Rti5qZKVh1Ow3QDpWDPQxwELmZkxyLsOC0jRhcTjsYwNF2RWRg5acstdO9ICPJTkId+RhohFlM/f6qaE4aza2N/jvczhLSA0awrLrxsGE02gVsnx4iYEUeD5cGENN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314573; c=relaxed/simple;
	bh=jZV4Z4+8ODoTeEMobkFWNrhkjxaNCvstcf/UYMXElwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tBTo3P7x4k9UNBbtNbKeBdDy1Vv1dhMw+dmJ0EmLyywT0sabK3dx8aPzuX6ao7Z/lK4WvYpv0X94NIHQll5PjI8kMG64NE4F6KwYtQcCsWAm+aKvMQ1P2enQCDMh1wL6GzC+KjptuByuD5T28yUX5ha4X5Yc/dQxDgHE2CyyZk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E821czht; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E821czht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784314572; x=1815850572;
  h=date:from:to:cc:subject:message-id;
  bh=jZV4Z4+8ODoTeEMobkFWNrhkjxaNCvstcf/UYMXElwo=;
  b=E821czhtfc0/g7N8MgUaJ3dWkHX/z8KHUB0eVUlm8X4FzkaP7vTLzoiQ
   zjJjZNhWMFFjK+EnneYVNaFrnIvCwnlODilUJr2ejenAL27EK+fwAM0bx
   0Ehn8+9aDQdcCBAs9klERFA4Kft6ABw1jsCRla9Rnai3DYTRXW/We05jJ
   zP0LH1Ru0ubx1HQDsKD211F0hCG8XKcXv7Df+W/qFcH5t907dutvCOBZm
   dl9WW5oqYgwTOymhftHvwRNYBUlF+ZkJiId8jy0OrbWNCsem4cST1uWra
   QrbiPZhFXL2tdLPimS7+gaFMpuSG8YQqryj+9AD4yLGzDRR9TN/E3jFft
   Q==;
X-CSE-ConnectionGUID: vOOxFcWpSJahRemGRa4yOQ==
X-CSE-MsgGUID: 8555E+d8Qm21ikvlwhM8vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85190246"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85190246"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 11:56:11 -0700
X-CSE-ConnectionGUID: +qbd17ZlTPmMQaKEII5Isg==
X-CSE-MsgGUID: sE5wM5ToSy6QwNHsYAh8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="295055296"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Jul 2026 11:56:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wknjD-00000000T2U-0bqs;
	Fri, 17 Jul 2026 18:56:07 +0000
Date: Sat, 18 Jul 2026 02:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of
 'struct pkvm_sglist_page' will not be visible outside of this function
Message-ID: <202607180221.5PjzVXyA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   133d9641e9477c7e0c05a3fc18eb81d7579675b9
commit: 887fb3f16c4839e84bbda9d46f7e5fd9db56e9ab [1/1] ANDROID: KVM: arm64: Add __pkvm_host_donate_sglist_hyp
config: arm64-randconfig-004 (https://download.01.org/0day-ci/archive/20260718/202607180221.5PjzVXyA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180221.5PjzVXyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180221.5PjzVXyA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/power/scmi.c:10:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   1 warning generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:77:6: warning: no previous prototype for function '__pkvm_unmask_serror' [-Wmissing-prototypes]
      77 | void __pkvm_unmask_serror(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      77 | void __pkvm_unmask_serror(void)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     463 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     464 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     465 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     466 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     467 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     472 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     473 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     474 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     475 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
--
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:17:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:19:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   3 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: declaration of 'enum pkvm_psci_notification' will not be visible outside of this function [-Wvisibility]
      28 | static void (*pkvm_psci_notifier)(enum pkvm_psci_notification, struct user_pt_regs *);
         |                                        ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:35: warning: declaration of 'enum pkvm_psci_notification' will not be visible outside of this function [-Wvisibility]
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                   ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:58: error: variable has incomplete type 'enum pkvm_psci_notification'
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                                          ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:35: note: forward declaration of 'enum pkvm_psci_notification'
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                   ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:51: warning: declaration of 'enum pkvm_psci_notification' will not be visible outside of this function [-Wvisibility]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |                                                   ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for function '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |     ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_SUSPEND'
     191 |         pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:222:19: error: use of undeclared identifier 'PKVM_PSCI_SYSTEM_SUSPEND'
     222 |         pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:250:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_ENTRY'
     250 |         pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~
   5 warnings and 4 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |     ^
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:5: note: previous declaration is here
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |     ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2366:70: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_sglist_page'
    2366 |                 WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
         |                                                                                    ^~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: note: forward declaration of 'struct pkvm_sglist_page'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2370:36: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    2370 |                 u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                            ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: note: forward declaration of 'struct pkvm_sglist_page'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2373:43: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    2373 |                 if (check_shl_overflow(PAGE_SIZE, sglist[p].order, &size)) {
         |                                                   ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: note: forward declaration of 'struct pkvm_sglist_page'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2373:43: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    2373 |                 if (check_shl_overflow(PAGE_SIZE, sglist[p].order, &size)) {
         |                                                   ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: note: forward declaration of 'struct pkvm_sglist_page'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2395:36: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    2395 |                 size_t size = PAGE_SIZE << sglist[p].order;
         |                                            ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: note: forward declaration of 'struct pkvm_sglist_page'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2396:36: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    2396 |                 u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                            ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: note: forward declaration of 'struct pkvm_sglist_page'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2408:34: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    2408 |                                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                                        ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: note: forward declaration of 'struct pkvm_sglist_page'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2409:31: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    2409 |                                 size = PAGE_SIZE << sglist[p].order;
         |                                                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: note: forward declaration of 'struct pkvm_sglist_page'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   4 warnings and 9 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:496:5: warning: no previous prototype for function '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     496 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         |     ^
   arch/arm64/kvm/hyp/nvhe/switch.c:496:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     496 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         | ^
         | static 
   2 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:16:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:81:23: warning: no previous prototype for function '__get_vcpu' [-Wmissing-prototypes]
      81 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         |                       ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:81:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      81 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         | ^
         | static 
   2 warnings generated.


vim +49 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h

    40	
    41	int __pkvm_prot_finalize(void);
    42	int __pkvm_host_share_hyp(u64 pfn);
    43	int __pkvm_host_unshare_hyp(u64 pfn);
    44	int __pkvm_host_reclaim_page(struct pkvm_hyp_vm *vm, u64 pfn, u64 ipa, u8 order);
    45	int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
    46	int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, bool accept_mmio);
    47	int ___pkvm_host_donate_hyp_prot(u64 pfn, u64 nr_pages,
    48					 bool accept_mmio, enum kvm_pgtable_prot prot);
  > 49	int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
    50	int __pkvm_host_donate_hyp_locked(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
    51	int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
    52	int __pkvm_guest_share_hyp_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa, u64 *hyp_va);
    53	int __pkvm_guest_unshare_hyp_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa);
    54	int __pkvm_guest_share_ffa_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa, phys_addr_t *phys);
    55	int __pkvm_guest_unshare_ffa_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa);
    56	int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
    57	int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
    58	int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, u64 nr_pages);
    59	int __pkvm_host_donate_sglist_guest(struct pkvm_hyp_vcpu *vcpu);
    60	int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
    61				    enum kvm_pgtable_prot prot, u64 nr_pages);
    62	int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm, u64 nr_pages);
    63	int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
    64	int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm, u64 size);
    65	int __pkvm_host_test_clear_young_guest(u64 gfn, u64 size, bool mkold, struct pkvm_hyp_vm *vm);
    66	kvm_pte_t __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
    67	int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *hyp_vcpu, u64 ipa,
    68				    u64 nr_pages, u64 *nr_shared);
    69	int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *hyp_vcpu, u64 ipa,
    70				      u64 nr_pages, u64 *nr_unshared);
    71	int __pkvm_install_ioguard_page(struct pkvm_hyp_vcpu *hyp_vcpu, u64 ipa,
    72					u64 nr_pages, u64 *nr_guarded);
    73	bool __pkvm_check_ioguard_page(struct pkvm_hyp_vcpu *hyp_vcpu);
    74	int __pkvm_guest_relinquish_to_host(struct pkvm_hyp_vcpu *vcpu,
    75					    u64 ipa, u64 *ppa);
    76	int __pkvm_use_dma(u64 phys_addr, size_t size, struct pkvm_hyp_vcpu *hyp_vcpu);
    77	int __pkvm_unuse_dma(u64 phys_addr, size_t size, struct pkvm_hyp_vcpu *hyp_vcpu);
    78	int __pkvm_host_lazy_pte(u64 pfn, u64 nr_pages, bool enable);
    79	u64 __pkvm_ptdump_get_config(pkvm_handle_t handle, enum pkvm_ptdump_ops op);
    80	u64 __pkvm_ptdump_walk_range(pkvm_handle_t handle, struct pkvm_ptdump_log_hdr *log_hva);
    81	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
