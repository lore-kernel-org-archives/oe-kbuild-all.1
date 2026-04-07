Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7267A374E64
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534130; cv=none; b=eT1/x7boI4TeM8XiDtn1ZtGyzb0iArUt6A7PH+GHfDXmqugJHh/iQkRNKu8NoZgyA5nOYC+UyVLIEvJYI/33rwg104aUlwCXq8R3Ap3DfXF0Frc9k3184qEk7iWJ5ZUrNj1VF1UfhFsY18RoecAVsqPtQxYtqMgBdao8TCgnvQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534130; c=relaxed/simple;
	bh=aCPnNDFnpg/4HlKtU3ebIEiQMTuDNjyvQGELcVpXiKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WFKFbAA4tnR6ad7ZaIcpbHfus+1DuMESYnlnM3nmscpz4ccmFSObOI6sQogkuFQT5S+9EbaKXIHcOe2/sNAqOVfXTVaOCU0zvGvbA5DDzzxfx951yfNap9Dbs3RephbdgCUwJToET7W09nNBzu7PlJ1KZFgG/yHubynmd9QC22I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6n3D05S; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6n3D05S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534128; x=1807070128;
  h=date:from:to:cc:subject:message-id;
  bh=aCPnNDFnpg/4HlKtU3ebIEiQMTuDNjyvQGELcVpXiKI=;
  b=I6n3D05SF6FPdC8wVWL4e2qm8ZlBdWvSWy80LgvtsbTqDKZ+yzMHE6Df
   6sQVI4eqWwnplFEIQ3vCNXyjl4J/8d8GjUegTudtRdhx6uC1Jx3S3CZK7
   FK9a6AEmATbhFsZVRcjFR0vZjniu4NjdeU/cvEpy7H9/3gp5c0HA1AieV
   xek1egzX8yST12dO6qWziAFTUf71EqvA4YDrMfPBfP4LtzZb+hjAl4b1e
   LzALyhgRL9rxSm1VdEmmV3w4h8Kp0FBgjqBeFw4wP1uZigeeigOluGXqI
   /wWUEoP2I5UXaCzplU22YZ1ZP7yiTBI2eng7huBhp5x9G49G0QcQhnRNw
   Q==;
X-CSE-ConnectionGUID: S6OeSuEvTrCDDntBFIHKqg==
X-CSE-MsgGUID: SzcaiUv7Sa+79kWu5Ins2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87192612"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87192612"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:55:28 -0700
X-CSE-ConnectionGUID: 7ZvOpedEQBS095g43MJQ2A==
X-CSE-MsgGUID: 1azueejUQ76/HB09DiPbHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="266036268"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Apr 2026 20:55:26 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xX9-0000000004X-3o3C;
	Tue, 07 Apr 2026 03:55:23 +0000
Date: Tue, 07 Apr 2026 11:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct
 pkvm_sglist_page' declared inside parameter list will not be visible outside
 of this definition or declaration
Message-ID: <202604041530.pJsWsyIN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   861ae8d9b142c1ff23fec0174b471dec9236fbae
commit: 93edf5c34a4239a22f09c63e965352bbeb97ad95 [1/1] ANDROID: KVM: arm64: Add __pkvm_host_donate_sglist_hyp
config: arm64-randconfig-002-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041530.pJsWsyIN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041530.pJsWsyIN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041530.pJsWsyIN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/ffa.c:37:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_entry_wfx,
                         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:22: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_entry_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:24: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_entry_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_entry_iabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_entry_dabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_exit_wfx,
                         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_exit_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_exit_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_exit_iabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_exit_dabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:27: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:2023:32: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=incompatible-pointer-types]
     if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
                                   ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:35:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
    handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:18:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:20:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
                                             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:5: note: previous declaration of '__pkvm_host_donate_sglist_hyp' was here
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
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1500:70: error: dereferencing pointer to incomplete type 'struct pkvm_sglist_page'
     WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
                                                                         ^~~~~~~
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1508:13: error: invalid use of undefined type 'struct pkvm_sglist_page'
      if (sglist[p].order > max_order) {
                ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1512:29: error: invalid use of undefined type 'struct pkvm_sglist_page'
      size = PAGE_SIZE << sglist[p].order;
                                ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1514:33: error: invalid use of undefined type 'struct pkvm_sglist_page'
      if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
                                    ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1518:32: error: invalid use of undefined type 'struct pkvm_sglist_page'
      phys = hyp_pfn_to_phys(sglist[p].pfn);
                                   ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:92:46: note: in definition of macro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1530:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
      size_t size = PAGE_SIZE << sglist[p].order;
                                       ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1531:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
      u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
                                       ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:92:46: note: in definition of macro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1543:34: error: invalid use of undefined type 'struct pkvm_sglist_page'
        phys = hyp_pfn_to_phys(sglist[p].pfn);
                                     ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:92:46: note: in definition of macro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1544:31: error: invalid use of undefined type 'struct pkvm_sglist_page'
        size = PAGE_SIZE << sglist[p].order;
                                  ^
--
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:21:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1868:8: error: implicit declaration of function 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
     ret = module_get_guest_trng_rng(entropy, nbits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
           module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:9: error: implicit declaration of function 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng_rng'? [-Werror=implicit-function-declaration]
     uuid = module_get_guest_trng_uuid();
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
            module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:7: warning: assignment to 'const uuid_t *' {aka 'const struct <anonymous> *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     uuid = module_get_guest_trng_uuid();
          ^
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
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


vim +48 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h

    40	
    41	int __pkvm_prot_finalize(void);
    42	int __pkvm_host_share_hyp(u64 pfn);
    43	int __pkvm_host_unshare_hyp(u64 pfn);
    44	int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
    45	int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, bool accept_mmio);
    46	int ___pkvm_host_donate_hyp_prot(u64 pfn, u64 nr_pages,
    47					 bool accept_mmio, enum kvm_pgtable_prot prot);
  > 48	int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
    49	int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
    50	int __pkvm_guest_share_hyp_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa, u64 *hyp_va);
    51	int __pkvm_guest_unshare_hyp_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa);
    52	int __pkvm_guest_share_ffa_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa, phys_addr_t *phys);
    53	int __pkvm_guest_unshare_ffa_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa);
    54	int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
    55	int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
    56	int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu);
    57	int __pkvm_host_donate_sglist_guest(struct pkvm_hyp_vcpu *vcpu);
    58	int __pkvm_host_reclaim_page_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm);
    59	int __pkvm_guest_share_host(u64 gfn, struct pkvm_hyp_vcpu *vcpu, u64 nr_pages, u64 *nr_shared);
    60	int __pkvm_guest_unshare_host(u64 gfn, struct pkvm_hyp_vcpu *vcpu, u64 nr_pages, u64 *nr_shared);
    61	int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
    62				    enum kvm_pgtable_prot prot);
    63	int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
    64	int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
    65	int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
    66	int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm);
    67	int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
    68	int __pkvm_host_split_guest(u64 gfn, u64 size, struct pkvm_hyp_vcpu *vcpu);
    69	int __pkvm_host_donate_ffa(u64 pfn, u64 nr_pages);
    70	int __pkvm_host_reclaim_ffa(u64 pfn, u64 nr_pages);
    71	int __pkvm_install_ioguard_page(struct pkvm_hyp_vcpu *hyp_vcpu, u64 ipa,
    72					u64 nr_pages, u64 *nr_guarded);
    73	bool __pkvm_check_ioguard_page(struct pkvm_hyp_vcpu *hyp_vcpu);
    74	int __pkvm_guest_relinquish_to_host(struct pkvm_hyp_vcpu *vcpu,
    75					    u64 ipa, u64 *ppa);
    76	u64 __pkvm_ptdump_get_config(pkvm_handle_t handle, enum pkvm_ptdump_ops op);
    77	u64 __pkvm_ptdump_walk_range(pkvm_handle_t handle, struct pkvm_ptdump_log_hdr *log_hva);
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
