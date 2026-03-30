Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD6F27B353
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774893875; cv=none; b=FiHeAdEqZlW5+S8EaZLADcJ6IZfWduNMRuGnSi+QkDc9BZLFiSBryJGNDIhPzzC/saMJzPokp+OTfmRKK6XkYfzjFkJ23iUfumJfWcQVR6WGUlnsbdCNCE/ahAJnHl0Y6N7b0thI93mVP3NujEgjfHK7xyuKu1lrOYG4buPDp9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774893875; c=relaxed/simple;
	bh=oQGZrFgIi40y5ru2oFssag/kYOp3kpe7PQ5QsPCDJuc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JNKF/pIGf/T4UGjEIaE71BwfeGy7dWV9rh0CTu7FjdPVj43mF/6CQLsUNZPuT+owYBRDVuodJhSWheNU6o2xRULh8MmIDNmVMhMxTb4niGxPb072yrFQkB9B2jowdvWtBS4O0TtKfdMvJLnmSJ29TkzCoY8n7jNZ7SlhVV5WoW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Re74001v; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Re74001v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774893874; x=1806429874;
  h=date:from:to:cc:subject:message-id;
  bh=oQGZrFgIi40y5ru2oFssag/kYOp3kpe7PQ5QsPCDJuc=;
  b=Re74001v0pvKViRuFgoj+aVJO1a9d3FzWRTufPh6EYeei1JS3i5ctyCm
   JmKimLy7pHq4GwIe4OHIZVBel+/DsCowApJHeA6uInQW0Axtfti53AItj
   HVjtLrktfA92HUPTdFRbTwSWoZxx6yXLx/2HWIPWSt04UYMm+HaVE0m5b
   dG/tWUGU7U6CL3wv9T8JUDao+PbVO/MEJgU1lXm3ZTOe+/OZhJr2uxRzm
   JITAQ+MQAmyMh0wM3q5l7+hKighn1SaqPBNcAvwg4ui/vhaGqzwwFakEU
   qD3SyV+2VyF95JNl4M1dF9twfCjPOx40JxuI6YF00AWMjT+8ZNv+c3Ey7
   Q==;
X-CSE-ConnectionGUID: pTliou9ETI6fYfcKn+zfyw==
X-CSE-MsgGUID: esHuvc0QTTO8PrqZ0Gi0hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="87364016"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="87364016"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 11:04:33 -0700
X-CSE-ConnectionGUID: r6mHoW6cRDaN32uy3c3Dgw==
X-CSE-MsgGUID: vL21kMFjQnaMUgowNZMTnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="221715882"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Mar 2026 11:04:31 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7GyT-000000001TX-0Xj1;
	Mon, 30 Mar 2026 18:04:29 +0000
Date: Tue, 31 Mar 2026 02:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous
 prototype for function 'module_handle_guest_smc'
Message-ID: <202603310214.1moh0oes-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nikita,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   5857da52e68bd4d3b2f252eaf18d07a92addaa4b
commit: 128144da229a1de12ebe5bca87f607aa348c6ba9 [12/12] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-randconfig-001-20260330 (https://download.01.org/0day-ci/archive/20260331/202603310214.1moh0oes-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310214.1moh0oes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310214.1moh0oes-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:17:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:19:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      36 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:37:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      37 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous prototype for function 'module_handle_guest_smc' [-Wmissing-prototypes]
      38 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      38 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
         | static 
   4 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      36 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:37:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      37 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous prototype for function 'module_handle_guest_smc' [-Wmissing-prototypes]
      38 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      38 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
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
   5 warnings and 9 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      36 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:37:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      37 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous prototype for function 'module_handle_guest_smc' [-Wmissing-prototypes]
      38 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      38 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
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


vim +/module_handle_guest_smc +38 arch/arm64/kvm/hyp/include/nvhe/modules.h

    16	
    17	#ifdef CONFIG_MODULES
    18	int __pkvm_init_module(void *host_mod);
    19	int __pkvm_register_hcall(unsigned long hfn_hyp_va);
    20	int handle_host_dynamic_hcall(struct user_pt_regs *regs, int id);
    21	void __pkvm_close_module_registration(void);
    22	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr);
    23	bool module_handle_host_smc(struct user_pt_regs *regs);
    24	bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    25				     pkvm_handle_t handle);
    26	#else
    27	static inline int __pkvm_init_module(void *module_init) { return -EOPNOTSUPP; }
    28	static inline int
    29	__pkvm_register_hcall(unsigned long hfn_hyp_va) { return -EOPNOTSUPP; }
    30	static inline int
    31	handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
    32	{
    33		return HCALL_UNHANDLED;
    34	}
    35	static inline void __pkvm_close_module_registration(void) { }
    36	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
    37	bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
  > 38	bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
