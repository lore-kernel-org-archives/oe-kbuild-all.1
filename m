Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEE22D9796
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 04:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769661011; cv=none; b=P9RRlQkIODw/usg7jqO1MqbgfbM6CqrrKAxwIcJFNz9MAABr1aXKHRSSMRBaPksur4TVsmtWl1otB/DwlPpARtQgQNvlmpEY74PamgKDROqUXoK6XJrP6L4fO/hMDHp6uv5iwsLryZhCfwO51oNCCLmmebY8/T1VlOHrIknqNoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769661011; c=relaxed/simple;
	bh=p9LlSfqh3TF/mrghc0TEVJa94dJfUll/I13XwTDIW5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UbgMtvRlNF3FsAzaFZJKNuoT3LFmcueWl7nwvIDDuWaesiBfCdU8Px4DVluvFcQk2Jn5NV0XMa0eID9ClRTxe7PhfR6Cl8Ph8Bwkybq6eW//9sVuKb4kB1NaL0gzWmCGNkakQJf/8Fs1kX7qwYVd9f0H5lfqx4Fah0NyKxAEKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQV4fZ8R; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQV4fZ8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769661007; x=1801197007;
  h=date:from:to:cc:subject:message-id;
  bh=p9LlSfqh3TF/mrghc0TEVJa94dJfUll/I13XwTDIW5A=;
  b=aQV4fZ8RCjrR62jIyLFOzAsVJIxwQnwMs5lsNI2qlf5DDAo8wFgYdiBb
   /O3g7Vck7HTmm7iqMCwyzfCgbr6T/7pi1mesoTrcJmVx74Vp4eBNn9LhY
   2gTxbxSsEBJCqkx52SVdQZJzdtlnJsYIcvRReGFJGK+WzuuUcLzm8Wyzv
   dQ2zdzFd6C8+fmBNf5yhEdp1YmBom765zO5laBBRKJaQETlx1kUaX/orP
   m0JPL01b00I8MuG2fFD4TxYw+iyS0a/FolgwxC98f1Xdf8j/q7kqJKCa3
   sQfWW76aK7l14c3UYzSi7RyB6A6YtP1kFJWh+tSr0pOCcN1bBhzL7dpmv
   A==;
X-CSE-ConnectionGUID: MUZgs2nhRRWrnPDnYVOHTw==
X-CSE-MsgGUID: 3NsRe8ysQemeLdBPRkc1zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="58468335"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="58468335"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:30:05 -0800
X-CSE-ConnectionGUID: KeB4LLMMSm24cDHoVMe0tA==
X-CSE-MsgGUID: Ct9Nfy1HTlu062IQkUEsVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="246065085"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Jan 2026 20:30:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJfM-00000000b5I-3hLP;
	Thu, 29 Jan 2026 04:30:00 +0000
Date: Thu, 29 Jan 2026 12:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: incomplete result type
 'enum pkvm_smc_handler_ret' in function definition
Message-ID: <202601291222.JERpXVZD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   812c7d3ffdf4a4712d798339c0599329da55b325
commit: 489e4bb847d0800b869c810143d2be0f635d02f3 [2/2] ANDROID: KVM: arm64: Allow memcache topup from guest SMC handler
config: arm64-randconfig-003-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291222.JERpXVZD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291222.JERpXVZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291222.JERpXVZD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: incomplete result type 'enum pkvm_smc_handler_ret' in function definition
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      43 | enum pkvm_smc_handler_ret
         |      ^
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: error: returning 'int' from a function with incompatible result type 'enum pkvm_smc_handler_ret'
      47 |         return false;
         |                ^~~~~
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
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     476 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     485 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:28: note: previous initialization is here
     484 |         [0 ... ESR_ELx_EC_MAX]          = handle_vm_exit_generic,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     486 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: incomplete result type 'enum pkvm_smc_handler_ret' in function definition
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      43 | enum pkvm_smc_handler_ret
         |      ^
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: error: returning 'int' from a function with incompatible result type 'enum pkvm_smc_handler_ret'
      47 |         return false;
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
   3 warnings and 6 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: incomplete result type 'enum pkvm_smc_handler_ret' in function definition
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      43 | enum pkvm_smc_handler_ret
         |      ^
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: error: returning 'int' from a function with incompatible result type 'enum pkvm_smc_handler_ret'
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |     ^
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:5: note: previous declaration is here
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |     ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1500:69: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_sglist_page'
    1500 |         WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
         |                                                                            ^~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1508:13: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1508 |                 if (sglist[p].order > max_order) {
         |                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1512:29: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1512 |                 size = PAGE_SIZE << sglist[p].order;
         |                                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1514:33: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1514 |                 if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
         |                                         ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1518:32: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1518 |                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                        ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1530:36: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1530 |                 size_t size = PAGE_SIZE << sglist[p].order;
         |                                            ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1531:36: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1531 |                 u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                            ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1543:34: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1543 |                                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                                        ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1544:31: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1544 |                                 size = PAGE_SIZE << sglist[p].order;
         |                                                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   4 warnings and 12 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:18:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:20:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: incomplete result type 'enum pkvm_smc_handler_ret' in function definition
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      43 | enum pkvm_smc_handler_ret
         |      ^
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: error: returning 'int' from a function with incompatible result type 'enum pkvm_smc_handler_ret'
      47 |         return false;
         |                ^~~~~
   3 warnings and 2 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: incomplete result type 'enum pkvm_smc_handler_ret' in function definition
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      43 | enum pkvm_smc_handler_ret
         |      ^
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: error: returning 'int' from a function with incompatible result type 'enum pkvm_smc_handler_ret'
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1869:8: error: call to undeclared function 'module_get_guest_trng_rng'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1869 |         ret = module_get_guest_trng_rng(entropy, nbits);
         |               ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1869:8: note: did you mean 'module_handle_guest_trng_rng'?
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1855:13: note: 'module_handle_guest_trng_rng' declared here
    1855 | static bool module_handle_guest_trng_rng(struct kvm_vcpu *vcpu)
         |             ^
    1856 | {
    1857 |         u64 ret;
    1858 |         u64 entropy[DIV_ROUND_UP(ARM_SMCCC_TRNG_SMC64_BITS, 64)];
    1859 |         u64 nbits;
    1860 | 
    1861 |         nbits = smccc_get_arg1(vcpu);
    1862 |         if (nbits == 0 || nbits > ARM_SMCCC_TRNG_SMC64_BITS) {
    1863 |                 ret = ARM_SMCCC_TRNG_INVALID_PARAMETERS;
    1864 |                 goto err;
    1865 |         }
    1866 | 
    1867 |         memset(entropy, 0, sizeof(entropy));
    1868 | 
    1869 |         ret = module_get_guest_trng_rng(entropy, nbits);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~
         |               module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1888:9: error: call to undeclared function 'module_get_guest_trng_uuid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1888 |         uuid = module_get_guest_trng_uuid();
         |                ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1888:7: error: incompatible integer to pointer conversion assigning to 'const uuid_t *' from 'int' [-Wint-conversion]
    1888 |         uuid = module_get_guest_trng_uuid();
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1931:28: error: variable has incomplete type 'enum pkvm_smc_handler_ret'
    1931 |         enum pkvm_smc_handler_ret handler_ret;
         |                                   ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:43:6: note: forward declaration of 'enum pkvm_smc_handler_ret'
      43 | enum pkvm_smc_handler_ret
         |      ^
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1951:7: error: use of undeclared identifier 'GUEST_SMC_HANDLED'
    1951 |         case GUEST_SMC_HANDLED:
         |              ^~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1954:7: error: use of undeclared identifier 'GUEST_SMC_NOT_HANDLED'
    1954 |         case GUEST_SMC_NOT_HANDLED:
         |              ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1957:7: error: use of undeclared identifier 'GUEST_SMC_NEED_TOPUP'
    1957 |         case GUEST_SMC_NEED_TOPUP:
         |              ^~~~~~~~~~~~~~~~~~~~
   3 warnings and 9 errors generated.


vim +44 arch/arm64/kvm/hyp/include/nvhe/modules.h

    18	
    19	#ifdef CONFIG_MODULES
    20	int __pkvm_init_module(void *host_mod);
    21	int __pkvm_register_hcall(unsigned long hfn_hyp_va);
    22	int handle_host_dynamic_hcall(struct user_pt_regs *regs, int id);
    23	void __pkvm_close_module_registration(void);
    24	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr);
    25	bool module_handle_host_smc(struct user_pt_regs *regs);
    26	enum pkvm_smc_handler_ret
    27	module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    28				pkvm_handle_t handle);
    29	const uuid_t *module_get_guest_trng_uuid(void);
    30	u64 module_get_guest_trng_rng(u64 *entropy, int nbits);
    31	#else
    32	static inline int __pkvm_init_module(void *module_init) { return -EOPNOTSUPP; }
    33	static inline int
    34	__pkvm_register_hcall(unsigned long hfn_hyp_va) { return -EOPNOTSUPP; }
    35	static inline int
    36	handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
    37	{
    38		return HCALL_UNHANDLED;
    39	}
    40	static inline void __pkvm_close_module_registration(void) { }
    41	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
  > 42	bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
    43	enum pkvm_smc_handler_ret
  > 44	module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    45				pkvm_handle_t handle)
    46	{
  > 47		return false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
