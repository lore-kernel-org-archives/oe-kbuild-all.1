Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851E621ABA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 22:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694844; cv=none; b=B1FVXpmPP4tO1bBKCwop83DMpUQy0m6eYNwDyo8/U/cUDxSKAls1k/K4uFFQomEBOpSRGN8Fepv8gWFfAGHQH6+taiOJjImsPxnAM3NIB3Wq1itajyoxOyyEu5anmYW8IreoFe32KG1wY4V54ttx5shZC50wDKZa6KJVwywk3cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694844; c=relaxed/simple;
	bh=/BsjYuXOboCTzTgh3/+Le0pki31l3/8KnyHjiidDKUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XFoutmL6hMbPf7PLco3EMtQOK9bhLKCTwQptT7K8QKG+YI2KuMisDscOIyb28hcliG9iDcNsZHLnuYi+UJIRhWFxMGHmJKyfO2aAvt6GqaAiJASqzmuG4M5t9ufbqQmshQCE/uxVcloNYeXaH/zzECD/imgpsJbkyyY6HMhiBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6zKYCVq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6zKYCVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747694843; x=1779230843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/BsjYuXOboCTzTgh3/+Le0pki31l3/8KnyHjiidDKUo=;
  b=Q6zKYCVqxGb5SOSRovxQM1rUcyR5zA4qYtJeKQqnSv9mDueZgPYxqYgH
   L0sg0vn9NmGrcBdl14vO3Of63N316KeuMAr9q5VE/LQu6aalC+SXjxzQK
   Myn2eDcT5+gs5u9cePPHKbLHkQ/SLbjLZbooNt/j8ogRb4IIkuFG3sv1Q
   Me+XQnIo8OSGk0ZaoFXfJCalUdDkYkNBV24u7IYRLyxn4IdcDVF9IwATm
   T3g3gwWnewlumUAicL4FQ00aanFshmD+6HiU6ABF6HxKonU3W6JZ/ghxo
   GoWo5bJXQ7U/WmonL1W0Oo7EqW3YYeC68kFjy/hf+DHxxCA4ETKdE603E
   w==;
X-CSE-ConnectionGUID: x+qQp50uR1O/yMlzWi/Lmw==
X-CSE-MsgGUID: My+JTwa0S/iKb4nkYF4mGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49764437"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49764437"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 15:47:21 -0700
X-CSE-ConnectionGUID: zcF89jkETnGTsMva3GzlwQ==
X-CSE-MsgGUID: /HETMxMdQdqiCDMXRW+NCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="176621207"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2025 15:47:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH9GP-000Lxo-14;
	Mon, 19 May 2025 22:47:17 +0000
Date: Tue, 20 May 2025 06:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:5: error: conflicting types for
 '__pkvm_host_donate_sglist_hyp'
Message-ID: <202505200629.6sLAnNai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   2b9ccc455b5a9cd79ab03ea2db35de2b0be6b911
commit: 887fb3f16c4839e84bbda9d46f7e5fd9db56e9ab [2/2] ANDROID: KVM: arm64: Add __pkvm_host_donate_sglist_hyp
config: arm64-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505200629.6sLAnNai-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200629.6sLAnNai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200629.6sLAnNai-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/events.c:7:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
      28 | static void (*pkvm_psci_notifier)(enum pkvm_psci_notification, struct user_pt_regs *);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:35: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:58: error: parameter 1 ('notif') has incomplete type
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:13: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'pkvm_psci_notify':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:32:22: error: type of formal parameter 1 is incomplete
      32 |   pkvm_psci_notifier(notif, &host_ctxt->regs);
         |                      ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:51: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_cpu_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: error: 'PKVM_PSCI_CPU_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     191 |  pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                   ^~~~~~~~~~~~~~~~~~~~~
         |                   KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_system_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:222:19: error: 'PKVM_PSCI_SYSTEM_SUSPEND' undeclared (first use in this function); did you mean 'KVM_CAP_ARM_SYSTEM_SUSPEND'?
     222 |  pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
         |                   KVM_CAP_ARM_SYSTEM_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function '__kvm_host_psci_cpu_entry':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:250:19: error: 'PKVM_PSCI_CPU_ENTRY' undeclared (first use in this function)
     250 |  pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                   ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/trace.c:9:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/trace.c: In function 'rb_move_tail':
   arch/arm64/kvm/hyp/nvhe/trace.c:144:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     144 |  struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                 ^~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:16:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:81:23: warning: no previous prototype for '__get_vcpu' [-Wmissing-prototypes]
      81 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         |                       ^~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_add_page':
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:539:2: error: implicit declaration of function '_iommu_iotlb_add_page'; did you mean 'iommu_iotlb_gather_add_page'? [-Werror=implicit-function-declaration]
     539 |  _iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
         |  ^~~~~~~~~~~~~~~~~~~~~
         |  iommu_iotlb_gather_add_page
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:17:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:19:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:496:5: warning: no previous prototype for '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     496 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:2357:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'
    2357 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:5: note: previous declaration of '__pkvm_host_donate_sglist_hyp' was here
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:7:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function '__pkvm_host_donate_sglist_hyp':
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:2366:71: error: dereferencing pointer to incomplete type 'struct pkvm_sglist_page'
    2366 |   WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
         |                                                                       ^~~~~~~
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     123 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:2370:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
    2370 |   u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                    ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:79:46: note: in definition of macro 'hyp_pfn_to_phys'
      79 | #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                              ^~~
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
    2373 |   if (check_shl_overflow(PAGE_SIZE, sglist[p].order, &size)) {
         |                                           ^
   include/linux/overflow.h:200:9: note: in definition of macro 'check_shl_overflow'
     200 |  typeof(s) _s = s;      \
         |         ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2373:43: error: invalid use of undefined type 'struct pkvm_sglist_page'
    2373 |   if (check_shl_overflow(PAGE_SIZE, sglist[p].order, &size)) {
         |                                           ^
   include/linux/overflow.h:200:17: note: in definition of macro 'check_shl_overflow'
     200 |  typeof(s) _s = s;      \
         |                 ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2395:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
    2395 |   size_t size = PAGE_SIZE << sglist[p].order;
         |                                    ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2396:36: error: invalid use of undefined type 'struct pkvm_sglist_page'
    2396 |   u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                    ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:79:46: note: in definition of macro 'hyp_pfn_to_phys'
      79 | #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                              ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2408:34: error: invalid use of undefined type 'struct pkvm_sglist_page'
    2408 |     phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                  ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:79:46: note: in definition of macro 'hyp_pfn_to_phys'
      79 | #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
         |                                              ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:2409:31: error: invalid use of undefined type 'struct pkvm_sglist_page'
    2409 |     size = PAGE_SIZE << sglist[p].order;
         |                               ^
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pkvm_sglist_page' declared inside parameter list will not be visible outside of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:77:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
      77 | void __pkvm_unmask_serror(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:22: warning: initialized field overwritten [-Woverride-init]
     463 |  [ESR_ELx_EC_WFx]  = handle_pvm_entry_wfx,
         |                      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:22: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:24: warning: initialized field overwritten [-Woverride-init]
     464 |  [ESR_ELx_EC_HVC64]  = handle_pvm_entry_hvc64,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:24: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: warning: initialized field overwritten [-Woverride-init]
     465 |  [ESR_ELx_EC_SYS64]  = handle_pvm_entry_sys64,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: warning: initialized field overwritten [-Woverride-init]
     466 |  [ESR_ELx_EC_IABT_LOW]  = handle_pvm_entry_iabt,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: warning: initialized field overwritten [-Woverride-init]
     467 |  [ESR_ELx_EC_DABT_LOW]  = handle_pvm_entry_dabt,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: warning: initialized field overwritten [-Woverride-init]
     472 |  [ESR_ELx_EC_WFx]  = handle_pvm_exit_wfx,
         |                      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: warning: initialized field overwritten [-Woverride-init]
     473 |  [ESR_ELx_EC_HVC64]  = handle_pvm_exit_hvc64,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: warning: initialized field overwritten [-Woverride-init]
     474 |  [ESR_ELx_EC_SYS64]  = handle_pvm_exit_sys64,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: warning: initialized field overwritten [-Woverride-init]
     475 |  [ESR_ELx_EC_IABT_LOW]  = handle_pvm_exit_iabt,
         |                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: warning: initialized field overwritten [-Woverride-init]
     476 |  [ESR_ELx_EC_DABT_LOW]  = handle_pvm_exit_dabt,
         |                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: warning: initialized field overwritten [-Woverride-init]
     485 |  [ESR_ELx_EC_IABT_LOW]  = handle_vm_exit_abt,
         |                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:27: warning: initialized field overwritten [-Woverride-init]
     486 |  [ESR_ELx_EC_DABT_LOW]  = handle_vm_exit_abt,
         |                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:27: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:1982:32: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1982 |  if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                ^~~~~~~~~~~~~~~~
         |                                |
         |                                struct user_pt_regs *
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:27:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
      27 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__pkvm_host_donate_sglist_hyp +2357 arch/arm64/kvm/hyp/nvhe/mem_protect.c

  2356	
> 2357	int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
  2358	{
  2359		int p, ret;
  2360	
  2361		host_lock_component();
  2362		hyp_lock_component();
  2363	
  2364		/* Checking we are reading hyp private memory */
  2365		if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
> 2366			WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
  2367							     PKVM_PAGE_OWNED));
  2368	
  2369		for (p = 0; p < nr_pages; p++) {
> 2370			u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
  2371			size_t size;
  2372	
  2373			if (check_shl_overflow(PAGE_SIZE, sglist[p].order, &size)) {
  2374				ret = -EINVAL;
  2375				goto unlock;
  2376			}
  2377	
  2378			if (!addr_is_memory(phys)) {
  2379				ret = -EINVAL;
  2380				goto unlock;
  2381			}
  2382	
  2383			ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
  2384			if (ret)
  2385				goto unlock;
  2386	
  2387			if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
  2388				ret = __hyp_check_page_state_range((u64)__hyp_va(phys), size, PKVM_NOPAGE);
  2389				if (ret)
  2390					goto unlock;
  2391			}
  2392		}
  2393	
  2394		for (p = 0; p < nr_pages; p++) {
  2395			size_t size = PAGE_SIZE << sglist[p].order;
  2396			u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
  2397			enum kvm_pgtable_prot prot;
  2398	
  2399			prot = pkvm_mkstate(PAGE_HYP, PKVM_PAGE_OWNED);
  2400			ret = pkvm_create_mappings_locked(__hyp_va(phys), __hyp_va(phys) + size, prot);
  2401			if (ret) {
  2402				WARN_ON(ret != -ENOMEM);
  2403	
  2404				kvm_iommu_host_stage2_idmap_complete(false);
  2405	
  2406				/* Rollback */
  2407				for (; p >= 0; p--) {
  2408					phys = hyp_pfn_to_phys(sglist[p].pfn);
  2409					size = PAGE_SIZE << sglist[p].order;
  2410	
  2411					WARN_ON(host_stage2_idmap_locked(phys, size,
  2412									 PKVM_HOST_MEM_PROT, false));
  2413					kvm_iommu_host_stage2_idmap(phys, phys + size, PKVM_HOST_MEM_PROT);
  2414					pkvm_remove_mappings_locked(__hyp_va(phys), __hyp_va(phys) + size);
  2415				}
  2416				kvm_iommu_host_stage2_idmap_complete(true);
  2417	
  2418				break;
  2419			}
  2420	
  2421			WARN_ON(__host_stage2_set_owner_locked(phys, size, PKVM_ID_HYP, true, 0, false));
  2422			kvm_iommu_host_stage2_idmap(phys, phys + size, 0);
  2423		}
  2424	
  2425		kvm_iommu_host_stage2_idmap_complete(false);
  2426	
  2427	unlock:
  2428		hyp_unlock_component();
  2429		host_unlock_component();
  2430	
  2431		return ret;
  2432	}
  2433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
