Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5303740DFC7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774097190; cv=none; b=oxNWC85DZ2wMa0q/kAfGf0wiANuQ6QM/QG976XMz5TCTo2cbnUko+5OZ8EsZu6J+3QMLZuJAwTNMV+n6S8n5r273enrbmcsKgl6g6Qe70c6wAiVGSfdob7QbHStIYizfb/RcF3NV3V43eUKAyCP9kplNzy7UH7zL9ICftUakRzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774097190; c=relaxed/simple;
	bh=9ZLu/P8jsNHDbtZg1vw/gmJiS8rdRDoZ5xIbjLj4s3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lygqqx+ZKZevMOptPHm60UKrQHnTxNar4yZbObrXzokEhu8R7eoMRGD5F2aD9fVHmL97LbYvnYDBW9vw4/Sn+akwum0y2M+3Oiw11i5pMiV3Z4ailhRMnwsA4/DQ7m4EbhAR/7sXCJROuMGUEDS5AlaO7t1coMfwTuiJbLNpY9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PpNPmEyo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpNPmEyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774097188; x=1805633188;
  h=date:from:to:cc:subject:message-id;
  bh=9ZLu/P8jsNHDbtZg1vw/gmJiS8rdRDoZ5xIbjLj4s3I=;
  b=PpNPmEyoaj4GeYKqywnQBGpvd06WLhJKmUEUVs9dYlHS4XBOmoJ8w6+T
   pCesVKfaiMW2L8Hn4EgaSxJxVVNOWoLvmUEey5ZfPYSoNJNx5cQwyogon
   eaDTNGcoUiUiyNU1yEYT3asBJ8xbbZBFAS478DsyadqTnLUnh9LO6iYoQ
   RUgecoHLVgkBFjEO//LUOKtXIEZXdSMzKKz7UNOAdyuWX5iIaf1CoWWxs
   5W/BunuSzq/uOpagrwSvaEDjPuaScPouJODy/k6Hsbho3uSuIjZnNPVd3
   0l+XDj1zlTmb2I9+2rfA3ziWGhxgSvfhgjJFmzpVYE4Nv95/5wUroeQ1t
   w==;
X-CSE-ConnectionGUID: mu5xzOy8TvakE1HsuPsGDg==
X-CSE-MsgGUID: 8MJfl7BBS/GrMM4jrs3Elg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77772873"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="77772873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 05:46:28 -0700
X-CSE-ConnectionGUID: vex98jjfTPSuBBFai11qvA==
X-CSE-MsgGUID: /1yTm275RGylEbTK/8LqBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="223769018"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Mar 2026 05:46:25 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3vih-000000000ld-0UqB;
	Sat, 21 Mar 2026 12:46:23 +0000
Date: Sat, 21 Mar 2026 20:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/kvm/hyp/nvhe/device/device.c:163:28: error: incomplete definition
 of type 'struct pkvm_device_ops'
Message-ID: <202603212015.3Fv699Js-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   bda92803db1ff53c9b60734a6a9ef9c09491e678
commit: 2d2f67ab8cbe5896278bbd7716c2bcad9f8cfc71 [2/2] ANDROID: KVM: arm64: power_lock for pKVM modules
config: arm64-randconfig-004-20260321 (https://download.01.org/0day-ci/archive/20260321/202603212015.3Fv699Js-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603212015.3Fv699Js-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603212015.3Fv699Js-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> arch/arm64/kvm/hyp/nvhe/device/device.c:163:28: error: incomplete definition of type 'struct pkvm_device_ops'
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
>> arch/arm64/kvm/hyp/nvhe/device/device.c:410:5: error: conflicting types for 'pkvm_device_register_ops'
     410 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie)
         |     ^
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:222:5: note: previous declaration is here
     222 | int pkvm_device_register_ops(u64 phys, struct pkvm_device_ops *ops, void *cookie);
         |     ^
   2 warnings and 7 errors generated.
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
..


vim +163 arch/arm64/kvm/hyp/nvhe/device/device.c

   153	
   154	static int pkvm_device_reset(struct pkvm_device *dev, bool host_to_guest)
   155	{
   156		struct pkvm_dev_iommu *iommu;
   157		int ret;
   158		int i;
   159	
   160		hyp_assert_lock_held(&device_spinlock);
   161	
   162		/* Reset is mandatory. */
 > 163		if (!dev->ops || !dev->ops->reset)
   164			return -ENODEV;
   165	
   166		ret = dev->ops->reset(dev->cookie, host_to_guest);
   167		if (ret)
   168			return ret;
   169	
   170		for (i = 0 ; i < dev->nr_iommus ; ++i) {
   171			iommu = &dev->iommus[i];
   172			ret = kvm_iommu_dev_block_dma(iommu->id, iommu->endpoint, host_to_guest);
   173			if (WARN_ON(ret))
   174				return ret;
   175		}
   176		return 0;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
