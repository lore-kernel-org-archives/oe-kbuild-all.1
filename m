Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D651FDA84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985332; cv=none; b=IwfmDMyPdwoRPnntsP1QBjEGrd4qyvoNLgj4ZymTHFrm4XRYBTAd5nR9k7z6cufHEWP9Ju2firZGrjJwYMoD21uo5PUGTrd6+99dLx+2fRXOMJbxQe5QEthkgzx1ykgJtlKC/BU4+OvrDiV4xdD59ab9flWFZXrOCN1AbGnLmno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985332; c=relaxed/simple;
	bh=m1Oweqc0CBTMABhhjxAIo1f17QBPWdXGAwYIU2NsUHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tSFZreeGI5ZSezCpeSl0We1CqHqCDXW3rdFm9BLj6FehJTcsL1BFYy75PBSOFuc6HPhVJsIBW6CXYTWYxOFi2zRH+gARAz7pt2UCCVnc90aHPs8bMuO//ShFHzOrsiu+FUlk+TDzDgnE4qnaQU3WKmQj0+FW5ZTQnVDfMtkB18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCz8F7qW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCz8F7qW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737985330; x=1769521330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m1Oweqc0CBTMABhhjxAIo1f17QBPWdXGAwYIU2NsUHU=;
  b=OCz8F7qWXhqbaU/AWd6NjM1yPndjyWZvTrM+V+N0TLzNoZj7Qv7oFs/Z
   DapCDF3jb9/uszbhrrkZx0fEIRmZ//Sg184lznI71UvyCOzfuXqABoyfu
   q/hwl8ubBS2aEmv0Ouhwj94fowmK0sLk0rqkxLuIdxIVJPmPX02poZC9T
   wPvjsInLZhWbY6nMeoRgfUaNq+QsGSfNzl25jaY6y2h7pyAmugSjtxLqh
   2gMr+MJ6FHi8rsZC28PzYaFpKPqNJlOPVsd2O4tiMXrvolsw7/XP9Q5sE
   H2EEoHrJBXyNCfyeVRyCjqaLvUghOuHsBJJzKM9NPuENT1RAjzSdeEJXV
   w==;
X-CSE-ConnectionGUID: h8mS3bPsTb+NTByDRDguaQ==
X-CSE-MsgGUID: Cwsr+stKSxaG8QVSzJPCig==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37697077"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="37697077"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 05:42:06 -0800
X-CSE-ConnectionGUID: AjILlCURTqahnnub4QdT8Q==
X-CSE-MsgGUID: Rl5ySlvSTFiIaXj+0Hxtaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="113473828"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2025 05:42:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcPNL-000goR-02;
	Mon, 27 Jan 2025 13:42:03 +0000
Date: Mon, 27 Jan 2025 21:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous
 prototype for 'module_handle_host_perm_fault'
Message-ID: <202501272141.EdW9cSYZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6c86d6f4feabb4fa0af487a2d44c460acf73bf42
commit: 0a901ecd7f9ffbc4169811c90a0f26ed1ee1df7a [3/3] ANDROID: KVM: arm64: Rework pKVM module fault handler
config: arm64-randconfig-004-20250127 (https://download.01.org/0day-ci/archive/20250127/202501272141.EdW9cSYZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501272141.EdW9cSYZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501272141.EdW9cSYZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      31 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      31 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:86:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
      86 | void __pkvm_unmask_serror(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: warning: initialized field overwritten [-Woverride-init]
     472 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: warning: initialized field overwritten [-Woverride-init]
     473 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: warning: initialized field overwritten [-Woverride-init]
     474 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: warning: initialized field overwritten [-Woverride-init]
     475 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: warning: initialized field overwritten [-Woverride-init]
     476 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:481:43: warning: initialized field overwritten [-Woverride-init]
     481 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:481:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:43: warning: initialized field overwritten [-Woverride-init]
     482 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:43: warning: initialized field overwritten [-Woverride-init]
     483 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:43: warning: initialized field overwritten [-Woverride-init]
     484 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: warning: initialized field overwritten [-Woverride-init]
     485 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:494:43: warning: initialized field overwritten [-Woverride-init]
     494 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:494:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:495:43: warning: initialized field overwritten [-Woverride-init]
     495 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:495:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:1821:39: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Wincompatible-pointer-types]
    1821 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct user_pt_regs *
   arch/arm64/kvm/hyp/include/nvhe/modules.h:26:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
      26 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~


vim +/module_handle_host_perm_fault +31 arch/arm64/kvm/hyp/include/nvhe/modules.h

    14	
    15	#ifdef CONFIG_MODULES
    16	int __pkvm_init_module(void *module_init);
    17	int __pkvm_register_hcall(unsigned long hfn_hyp_va);
    18	int handle_host_dynamic_hcall(struct user_pt_regs *regs, int id);
    19	void __pkvm_close_module_registration(void);
    20	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr);
    21	#else
    22	static inline int __pkvm_init_module(void *module_init) { return -EOPNOTSUPP; }
    23	static inline int
    24	__pkvm_register_hcall(unsigned long hfn_hyp_va) { return -EOPNOTSUPP; }
    25	static inline int
    26	handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
    27	{
    28		return HCALL_UNHANDLED;
    29	}
    30	static inline void __pkvm_close_module_registration(void) { }
  > 31	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
