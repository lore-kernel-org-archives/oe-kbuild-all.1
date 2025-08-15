Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0326B8821
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 01:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755220766; cv=none; b=WPJ63CMO5aEpfRo/VeO/T2CpDfRg56OAaXViMMacKw7vy2BBmONKWcw9EKG07jVmmNcNr2X1fk9TifiOe62wiY2LWHSCWPFvK2gZ3qX92rjIG8cYhna+0cOtHRiuEly7+563Hhzx3ucLjgR2Yjcjm/WxAL39Dru4XB9RXKGcI7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755220766; c=relaxed/simple;
	bh=IGDyp8ndptNGRx//s5VQ5D4TMbcupkHM0HbbwXTosBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rj/8x/WgyC81J4ZNb+Z35TCMPnywXCdECeiLNPXQj1BvBwmXNZMPyi3oCzOO/XRdVvXY/crY7L1w/j/trxLNWjMkM9DEokKtiagTNsbHA4DIBwJhCRZ3JDI/XxZM55KQtrd6b/VwB6hJENb0twJjJ5iIBNV3gYomzu7viKAFpPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0ji9cft; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0ji9cft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755220764; x=1786756764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IGDyp8ndptNGRx//s5VQ5D4TMbcupkHM0HbbwXTosBc=;
  b=K0ji9cftqhNzbbO5QPhqawhayQFy1JGXorPoBtVNtQMnuM3DtTwOdkwY
   s2pQWtzpGwAuWJCsSfOV0NXwG3EDl7cFvyXYEGHzlufqNytqBEyCf/Cp0
   cFKrSlRn75ooW5vavKxyhKjNaG7S2xCIQwZZ2hOnR9Vk0dwqEj0dFcPVZ
   njWI1qQcFf0usyl6z+E7tLHYpBhtNcleveIjxqNRxktdIdsontG0kyq8K
   MoYLKuSU90cQwc1BHmpDw3ugaW2Gofc8eDK3EFFYcpVBsqb0ae0NE8ZRx
   O4tliDe2TiQOVNMhj6cy38eprgO1v2ubAQjxxPhA+KaEUVlwEewMzpZiJ
   g==;
X-CSE-ConnectionGUID: L6aMELM1QY6k3jbKcv6OSQ==
X-CSE-MsgGUID: ChE4RVvPQEeymLNwt9JiHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61179665"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61179665"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 18:19:24 -0700
X-CSE-ConnectionGUID: ZVAk343mQl6Nvut/RiPdDA==
X-CSE-MsgGUID: o0ZTpd90T9iCaiQJKYOahA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171028097"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2025 18:19:22 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umj6G-0000OB-0q;
	Fri, 15 Aug 2025 01:19:20 +0000
Date: Fri, 15 Aug 2025 03:18:40 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4] arch/arm64/kvm/pkvm.c:756:5:
 warning: no previous prototype for 'pkvm_enable_smc_forwarding'
Message-ID: <202508150322.iHehrRYf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0b5aee52ee031640b7194c3a35ce6ba10f188e21
commit: 128144da229a1de12ebe5bca87f607aa348c6ba9 [4/4] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150322.iHehrRYf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150322.iHehrRYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150322.iHehrRYf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/pkvm.c:756:5: warning: no previous prototype for 'pkvm_enable_smc_forwarding' [-Wmissing-prototypes]
    int pkvm_enable_smc_forwarding(struct file *kvm_file)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:17:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:19:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:37:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:37:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
                                             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:5: note: previous declaration of '__pkvm_host_donate_sglist_hyp' was here
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:7:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function '__pkvm_host_donate_sglist_hyp':
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2366:71: error: dereferencing pointer to incomplete type 'struct pkvm_sglist_page'
      WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
                                                                          ^~~~~~~
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2370:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
      u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
                                       ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:79:46: note: in definition of macro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   In file included from include/linux/string.h:12,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:7:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2373:43: error: invalid use of undefined type 'struct pkvm_sglist_page'
      if (check_shl_overflow(PAGE_SIZE, sglist[p].order, &size)) {
                                              ^
   include/linux/overflow.h:200:9: note: in definition of macro 'check_shl_overflow'
     typeof(s) _s = s;      \
            ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2373:43: error: invalid use of undefined type 'struct pkvm_sglist_page'
      if (check_shl_overflow(PAGE_SIZE, sglist[p].order, &size)) {
                                              ^
   include/linux/overflow.h:200:17: note: in definition of macro 'check_shl_overflow'
     typeof(s) _s = s;      \
                    ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2395:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
      size_t size = PAGE_SIZE << sglist[p].order;
                                       ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2396:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
      u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
                                       ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:79:46: note: in definition of macro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2408:34: error: invalid use of undefined type 'struct pkvm_sglist_page'
        phys = hyp_pfn_to_phys(sglist[p].pfn);
                                     ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:79:46: note: in definition of macro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2409:31: error: invalid use of undefined type 'struct pkvm_sglist_page'
        size = PAGE_SIZE << sglist[p].order;
                                  ^
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:37:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous prototype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:77:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
    void __pkvm_unmask_serror(void)
         ^~~~~~~~~~~~~~~~~~~~
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
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:1982:32: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=incompatible-pointer-types]
     if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
                                   ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:31:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
    handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pkvm_enable_smc_forwarding +756 arch/arm64/kvm/pkvm.c

   755	
 > 756	int pkvm_enable_smc_forwarding(struct file *kvm_file)
   757	{
   758		struct kvm *host_kvm;
   759	
   760		if (!file_is_kvm(kvm_file))
   761			return -EINVAL;
   762	
   763		if (!kvm_get_kvm_safe(kvm_file->private_data))
   764			return -EINVAL;
   765	
   766		host_kvm = kvm_file->private_data;
   767		if (!host_kvm)
   768			return -EINVAL;
   769	
   770		host_kvm->arch.pkvm.smc_forwarded = true;
   771	
   772		return 0;
   773	}
   774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
