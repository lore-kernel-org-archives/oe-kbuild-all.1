Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3010396B75
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109685; cv=none; b=RCAm5uPAmdoZWUum4HFSNLmDunoC4biYsmh2Lxqd+abcYtg670nf6UA7W/BTdVCXsSfGhxcxqQTM0PJeMIX8EOljYe1taB68JIX9jqK+tYyzdeDNfA3NJ+2EIzorCRz+6zNPeStkenjAYpEK0Acoi6eyoRLhgeaIfQsqYxKPP20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109685; c=relaxed/simple;
	bh=xzyzdYTFY2c6dxGtkwpCQEsK8rWPpd4tqd2MmmPtc+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XCzAx8LyqLihlVFDbsUAa+nafk0uGPWtvoO6GgljuHM1cdU7nAII+d5q29ajSrBkKNGb2Bi7h7NnMWgMPPbaJUKwvWJdGeQK/5kngPLqxM96yF/70pj49hNMTtkjgqfDVK5J+Fa9N2aUoA8FSmT6cx4JgwxytTB7Gzzx2ftoch4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAzKzDl0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAzKzDl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770109683; x=1801645683;
  h=date:from:to:cc:subject:message-id;
  bh=xzyzdYTFY2c6dxGtkwpCQEsK8rWPpd4tqd2MmmPtc+I=;
  b=HAzKzDl0B8iTi/c9HI22uhJE3AooLjcR8c44ULi8FK+faP4tnaaC4pkW
   dgoCSA4IFmPKzgrH5cveDa+v9VgNTZQ/RY5vDmRLuiH8kG4fsU4/D5KVu
   eqA2Fa5yDk4Fu52Uya2aQ6nRIVGoaD/LcBb9+0jZbYgo1yDsWqdBflvfo
   1sS6ssf9kQeAkcVZkn9rAKYRjBF0SohlxNKu5fad62rcycva3TDqrEPec
   jqS2VYKPKZ3pULGlXKe/aPZ5iJd+FJU0eg4dIBndBDKrCK2KfyvsYL/9j
   WSaEMpE8fnwVb34/GiT1Bb5hINzKhj5XSodY3lr8BgfxprWkOyGJFV7sG
   Q==;
X-CSE-ConnectionGUID: PTAjxu3TTb+JI7yEtQjZUQ==
X-CSE-MsgGUID: Siu9sJF5RXKuHwPkKtv6cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81591550"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="81591550"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:08:00 -0800
X-CSE-ConnectionGUID: O9qa+ELfQG64D1bSAKBglw==
X-CSE-MsgGUID: NWC0XGEvQcOkDh04/TyDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209081557"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2026 01:07:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnCO3-00000000gU0-0mkt;
	Tue, 03 Feb 2026 09:07:55 +0000
Date: Tue, 03 Feb 2026 17:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an
 incomplete type
Message-ID: <202602031737.oQoFd7pQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   367aa148ad18ea2d6d56373b83d5895390195cdd
commit: 489e4bb847d0800b869c810143d2be0f635d02f3 [2/2] ANDROID: KVM: arm64: Allow memcache topup from guest SMC handler
config: arm64-randconfig-002-20260203 (https://download.01.org/0day-ci/archive/20260203/202602031737.oQoFd7pQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031737.oQoFd7pQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031737.oQoFd7pQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1869:15: error: implicit declaration of function 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
    1869 |         ret = module_get_guest_trng_rng(entropy, nbits);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1888:16: error: implicit declaration of function 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
    1888 |         uuid = module_get_guest_trng_uuid();
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1888:14: warning: assignment to 'const uuid_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1888 |         uuid = module_get_guest_trng_uuid();
         |              ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'kvm_handle_pvm_smc64':
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1931:35: error: storage size of 'handler_ret' isn't known
    1931 |         enum pkvm_smc_handler_ret handler_ret;
         |                                   ^~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1951:14: error: 'GUEST_SMC_HANDLED' undeclared (first use in this function)
    1951 |         case GUEST_SMC_HANDLED:
         |              ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1951:14: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1954:14: error: 'GUEST_SMC_NOT_HANDLED' undeclared (first use in this function)
    1954 |         case GUEST_SMC_NOT_HANDLED:
         |              ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1957:14: error: 'GUEST_SMC_NEED_TOPUP' undeclared (first use in this function)
    1957 |         case GUEST_SMC_NEED_TOPUP:
         |              ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1931:35: warning: unused variable 'handler_ret' [-Wunused-variable]
    1931 |         enum pkvm_smc_handler_ret handler_ret;
         |                                   ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:18:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:20:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: At top level:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'; have 'int(struct pkvm_sglist_page *, size_t)' {aka 'int(struct pkvm_sglist_page *, long unsigned int)'}
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:5: note: previous declaration of '__pkvm_host_donate_sglist_hyp' with type 'int(struct pkvm_sglist_page *, size_t)' {aka 'int(struct pkvm_sglist_page *, long unsigned int)'}
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
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
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1500:76: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_sglist_page'
    1500 |         WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
         |                                                                            ^
   include/asm-generic/bug.h:171:32: note: in definition of macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1508:27: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1508 |                 if (sglist[p].order > max_order) {
         |                           ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1508:30: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1508 |                 if (sglist[p].order > max_order) {
         |                              ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1512:43: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1512 |                 size = PAGE_SIZE << sglist[p].order;
         |                                           ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1512:46: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1512 |                 size = PAGE_SIZE << sglist[p].order;
         |                                              ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1514:47: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1514 |                 if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
         |                                               ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1514:50: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1514 |                 if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
         |                                                  ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1518:46: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1518 |                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                              ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of macro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1518:49: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1518 |                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                                 ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of macro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1530:50: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1530 |                 size_t size = PAGE_SIZE << sglist[p].order;
         |                                                  ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1530:53: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1530 |                 size_t size = PAGE_SIZE << sglist[p].order;
         |                                                     ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1531:50: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1531 |                 u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                                  ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of macro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1531:53: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1531 |                 u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                                     ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of macro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1543:62: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1543 |                                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                                              ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of macro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1543:65: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1543 |                                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                                                 ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:49: note: in definition of macro 'hyp_pfn_to_phys'
      80 | #define hyp_pfn_to_phys(pfn)    ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1544:59: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1544 |                                 size = PAGE_SIZE << sglist[p].order;
         |                                                           ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1544:62: error: invalid use of undefined type 'struct pkvm_sglist_page'
    1544 |                                 size = PAGE_SIZE << sglist[p].order;
         |                                                              ^
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:58: error: parameter 1 ('notif') has incomplete type
      30 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:13: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      30 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'pkvm_psci_notify':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:33:36: error: type of formal parameter 1 is incomplete
      33 |                 pkvm_psci_notifier(notif, &host_ctxt->regs);
         |                                    ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_cpu_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:26: error: 'PKVM_PSCI_CPU_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     192 |         pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:26: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_system_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:26: error: 'PKVM_PSCI_SYSTEM_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     223 |         pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
         |                          KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function '__kvm_host_psci_cpu_entry':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:254:26: error: 'PKVM_PSCI_CPU_ENTRY' undeclared (first use in this function)
     254 |         pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      41 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      42 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an incomplete type
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_guest_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
      47 |         return false;
         |                ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
      44 | module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: At top level:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: warning: initialized field overwritten [-Woverride-init]
     463 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: warning: initialized field overwritten [-Woverride-init]
     464 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: warning: initialized field overwritten [-Woverride-init]
     465 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: warning: initialized field overwritten [-Woverride-init]
     466 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: warning: initialized field overwritten [-Woverride-init]
     467 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: warning: initialized field overwritten [-Woverride-init]
     472 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: warning: initialized field overwritten [-Woverride-init]
     473 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: warning: initialized field overwritten [-Woverride-init]
     474 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: warning: initialized field overwritten [-Woverride-init]
     475 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: warning: initialized field overwritten [-Woverride-init]
     476 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: warning: initialized field overwritten [-Woverride-init]
     485 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:43: warning: initialized field overwritten [-Woverride-init]
     486 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:2023:39: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2023 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct user_pt_regs *
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
      36 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors


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
    42	bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
    43	enum pkvm_smc_handler_ret
  > 44	module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
    45				pkvm_handle_t handle)
    46	{
  > 47		return false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
