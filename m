Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600193;
	b=ZJqcjn3MVnaCBgIsAtaXcb2WMzJYX5HqZvj2bAs3N0rH1xU9pJRwmDwV1/CW8Vma9qEz
	 G7ii8F4rFNfzvJ9kmLzdcRxvAQu9uGcI6jaJWOS7lT33ZXVb1d+Fu0E9znP2etzQjKmxA
	 ClKeOQnaIzTzho9sE1UmIMRLzcLk7r156v0Tvlzc7Nczxje87En/VwwWJHpUSTBkjSN7Z
	 hIPzsh/h6zCC7cmmrTVzBRtHeWUYL3B2S0dM+6k0RgtYrt6qP2KXySqnudjVo3px3FOgF
	 Y9lV5sfysssGFgF40m9H0rAVz3dRon9a2BFedyYLTaB5on3oZThjVMD9IKxu3UeGBxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600193;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vSB0CHtsc3TJnDtrmcuRQjmCqd+GnRTHs6YFoLiyUD0=;
	b=fjC1fzWnUrLBto4Lmn2F5e9TXCdv5jzF/plLjdQo+6xAUsdDjom78hatWhKRjJBfB2TE
	 Oq/k4ZA6T2W32EcY5X4lMhiSFl3y3WBDDS+c9P2x/49lS1tTl0HwCRPzANPMD0il8QVi4
	 XeV6fUsAJInr1ewSt70hLr10kuaU/RbHK+0xL6t+wNRDLWFMFKy+eh811MGcPmLU7kNO+
	 MhL+3ZIjHIpcJh+lw/TnU9aYN3KVrZ0ywXO51Q/kSk1wgcoYJG415WUAenjEYExnh3nDV
	 b5D39vivgG/dL+ipldva/kCEs6BEPSJObi8RZixNC7a1XGfwKzT+CSemVc+6pZ2mfGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xz8LIw4K;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809F3606A31F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 16:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809F3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xz8LIw4K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792600192; x=1824136192;
  h=date:from:to:cc:subject:message-id;
  bh=9DvFI1gZSLQS4xYNthjgcWp15GVLAuYZFEhjmv+15fQ=;
  b=Xz8LIw4KRizW2KurqTb+70tQDy/gdi8JcgQOUj6O8lWZ0XDW0AsglV+f
   wNB9Gs0SgYDWwi4X3/ZhRc6HpBAI5ZYGa8gzdv1/QYtEnYmDexMOxmCF6
   Ja8l/SXFHMhp7hu9iVk9tXFl6IdmFqaJ/IoEKDy13zBHJtJak7bXt1ZnO
   bRAMsy4UcrEBdhctllK7Ngl5ePQWOJ31do3+IT2egSyqgsVVykmUBTK2O
   7Y5Sh2HvWDcUtDJFx5/ckJaZ2K6Ih9Kwa9ekveXubr4J8sDDYWhriR3hz
   0OLUmgNL8oaEMehRtvplZASohegkS7hCB2GSlvtUMGTCmxaCwviqnOyOE
   w==;
X-CSE-ConnectionGUID: bgB7jDEdSHCp05yd9b0Rag==
X-CSE-MsgGUID: gmilNCB8SrCtJxNCeb2AlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1227874"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1227874"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 09:29:52 -0700
X-CSE-ConnectionGUID: liKdattSQ72fJnVdHJb8Gg==
X-CSE-MsgGUID: 2JiGnkrpSGqPrgKJqdzaHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3012366"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Oct 2026 09:29:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJZCF-00000000Poc-2yRn;
	Wed, 21 Oct 2026 16:29:47 +0000
Date: Thu, 22 Oct 2026 00:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 3/3]
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: declaration of
 'struct pkvm_device_ops' will not be visible outside of this function
Message-ID: <202610220046.Xp9HKsyS-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   a3ec599e323d6ce4e9ce7f06cc0e2373e567f132
commit: 2d2f67ab8cbe5896278bbd7716c2bcad9f8cfc71 [3/3] ANDROID: KVM: arm64: power_lock for pKVM modules
config: arm64-randconfig-1000-20261021 (https://download.01.org/0day-ci/archive/20261022/202610220046.Xp9HKsyS-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220046.Xp9HKsyS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220046.Xp9HKsyS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/hyp-constants.c:5:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: declaration of 'struct pkvm_device_ops' will not be visible outside of this function [-Wvisibility]
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^
   1 warning generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/page_alloc.c:10:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: declaration of 'struct pkvm_device_ops' will not be visible outside of this function [-Wvisibility]
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^
   In file included from arch/arm64/kvm/hyp/nvhe/page_alloc.c:10:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   2 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: declaration of 'struct pkvm_device_ops' will not be visible outside of this function [-Wvisibility]
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:30:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: incomplete result type 'enum pkvm_smc_handler_ret' in function definition
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:45:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      45 | enum pkvm_smc_handler_ret
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: error: returning 'int' from a function with incompatible result type 'enum pkvm_smc_handler_ret'
      49 |         return false;
         |                ^~~~~
   4 warnings and 2 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: declaration of 'struct pkvm_device_ops' will not be visible outside of this function [-Wvisibility]
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: incomplete result type 'enum pkvm_smc_handler_ret' in function definition
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:45:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      45 | enum pkvm_smc_handler_ret
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: error: returning 'int' from a function with incompatible result type 'enum pkvm_smc_handler_ret'
      49 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:58: error: variable has incomplete type 'enum pkvm_psci_notification'
      30 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                                          ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:14:6: note: forward declaration of 'enum pkvm_psci_notification'
      14 | enum pkvm_psci_notification;
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
   4 warnings and 6 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:23:
   In file included from arch/arm64/kvm/hyp/include/nvhe/ffa.h:10:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: declaration of 'struct pkvm_device_ops' will not be visible outside of this function [-Wvisibility]
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:26:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: incomplete result type 'enum pkvm_smc_handler_ret' in function definition
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:45:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      45 | enum pkvm_smc_handler_ret
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: error: returning 'int' from a function with incompatible result type 'enum pkvm_smc_handler_ret'
      49 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:443:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     443 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:442:28: note: previous initialization is here
     442 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:444:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     444 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:442:28: note: previous initialization is here
     442 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:445:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     445 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:442:28: note: previous initialization is here
     442 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:446:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     446 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:442:28: note: previous initialization is here
     442 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:447:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     447 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:442:28: note: previous initialization is here
     442 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:452:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     452 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:451:28: note: previous initialization is here
     451 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:453:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     453 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:451:28: note: previous initialization is here
     451 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     454 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:451:28: note: previous initialization is here
     451 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
--
   In file included from arch/arm64/kvm/hyp/nvhe/device/device.c:8:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: declaration of 'struct pkvm_device_ops' will not be visible outside of this function [-Wvisibility]
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^
   In file included from arch/arm64/kvm/hyp/nvhe/device/device.c:8:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/device/device.c:163:28: error: incomplete definition of type 'struct pkvm_device_ops'
     163 |         if (!dev->ops || !dev->ops->reset)
         |                           ~~~~~~~~^
   include/kvm/device.h:41:9: note: forward declaration of 'struct pkvm_device_ops'
      41 |         struct pkvm_device_ops *ops;
         |                ^
   arch/arm64/kvm/hyp/nvhe/device/device.c:166:16: error: incomplete definition of type 'struct pkvm_device_ops'
     166 |         ret = dev->ops->reset(dev->cookie, host_to_guest);
         |               ~~~~~~~~^
   include/kvm/device.h:41:9: note: forward declaration of 'struct pkvm_device_ops'
      41 |         struct pkvm_device_ops *ops;
         |                ^
   arch/arm64/kvm/hyp/nvhe/device/device.c:194:26: error: incomplete definition of type 'struct pkvm_device_ops'
     194 |         if (dev->ops && dev->ops->power_lock) {
         |                         ~~~~~~~~^
   include/kvm/device.h:41:9: note: forward declaration of 'struct pkvm_device_ops'
      41 |         struct pkvm_device_ops *ops;
         |                ^
   arch/arm64/kvm/hyp/nvhe/device/device.c:195:17: error: incomplete definition of type 'struct pkvm_device_ops'
     195 |                 ret = dev->ops->power_lock(dev->cookie, true);
         |                       ~~~~~~~~^
   include/kvm/device.h:41:9: note: forward declaration of 'struct pkvm_device_ops'
      41 |         struct pkvm_device_ops *ops;
         |                ^
   arch/arm64/kvm/hyp/nvhe/device/device.c:356:19: error: incomplete definition of type 'struct pkvm_device_ops'
     356 |                 WARN_ON(dev->ops->power_lock && dev->ops->power_lock(dev->cookie, false));
         |                         ~~~~~~~~^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/kvm/device.h:41:9: note: forward declaration of 'struct pkvm_device_ops'
      41 |         struct pkvm_device_ops *ops;
         |                ^
   arch/arm64/kvm/hyp/nvhe/device/device.c:356:43: error: incomplete definition of type 'struct pkvm_device_ops'
     356 |                 WARN_ON(dev->ops->power_lock && dev->ops->power_lock(dev->cookie, false));
         |                                                 ~~~~~~~~^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/kvm/device.h:41:9: note: forward declaration of 'struct pkvm_device_ops'
      41 |         struct pkvm_device_ops *ops;
         |                ^
   arch/arm64/kvm/hyp/nvhe/device/device.c:410:5: error: conflicting types for 'pkvm_device_register_ops'
     410 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie)
         |     ^
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:5: note: previous declaration is here
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |     ^
   2 warnings and 7 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/trace.c:9:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: declaration of 'struct pkvm_device_ops' will not be visible outside of this function [-Wvisibility]
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^
   In file included from arch/arm64/kvm/hyp/nvhe/trace.c:9:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/trace.c:145:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     145 |         struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                        ^
   3 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:16:
>> arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:47: warning: declaration of 'struct pkvm_device_ops' will not be visible outside of this function [-Wvisibility]
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |                                               ^
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:22:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      43 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:46:1: error: incomplete result type 'enum pkvm_smc_handler_ret' in function definition
      46 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:45:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      45 | enum pkvm_smc_handler_ret
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:49:9: error: returning 'int' from a function with incompatible result type 'enum pkvm_smc_handler_ret'
      49 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |     ^
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:50:5: note: previous declaration is here
      50 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |     ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1633:69: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_sglist_page'
    1633 |         WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
         |                                                                            ^~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: note: forward declaration of 'struct pkvm_sglist_page'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1641:13: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1641 |                 if (sglist[p].order > max_order) {
         |                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: note: forward declaration of 'struct pkvm_sglist_page'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1645:29: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1645 |                 size = PAGE_SIZE << sglist[p].order;
         |                                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: note: forward declaration of 'struct pkvm_sglist_page'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1647:33: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1647 |                 if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
         |                                         ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: note: forward declaration of 'struct pkvm_sglist_page'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1651:32: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1651 |                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                        ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: note: forward declaration of 'struct pkvm_sglist_page'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1663:36: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1663 |                 size_t size = PAGE_SIZE << sglist[p].order;
         |                                            ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: note: forward declaration of 'struct pkvm_sglist_page'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1664:36: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1664 |                 u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                            ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: note: forward declaration of 'struct pkvm_sglist_page'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1684:34: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1684 |                                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                                        ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: note: forward declaration of 'struct pkvm_sglist_page'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1685:31: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1685 |                                 size = PAGE_SIZE << sglist[p].order;
         |                                                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1625:42: note: forward declaration of 'struct pkvm_sglist_page'
    1625 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   5 warnings and 12 errors generated.


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
