Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7CE1CDFAC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 19:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755199984; cv=none; b=jPGE6ZkpQf9uCTn6kgKeKh74uk5Gq1x5wYyr9NJDg/P+90plOlYm4I+eFz0mFbX48dl1tyL+mkuEYWPFisdtqS2MUoM0CLEqLuQf1CGqoeHskDU7wU/Qe5ROUj6lKbdfKcDMCsOH2sRpY3Fy00DDomhHTfWTBQzhw36pPIuDvYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755199984; c=relaxed/simple;
	bh=wKM8YEXbYFesxFUfi8uFvttzReM7JRmVdNSPrOl6QMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtsAzpXX2DP8yVyZAyB4ZLx4UYeur51ub5xUyfUnCteURHF8seqASVLKSH9m5+hUsIyg1vmbfTsf8Qyq2skE6Qt/wTfUBmScfdTre4ler93/g+7+yzNeVMDj/ph6tf6V3aFJj5lFa/VNjLZqsgDFRw2kami5X1xQtD/QyU4ENk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pzqi1PB/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pzqi1PB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755199983; x=1786735983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wKM8YEXbYFesxFUfi8uFvttzReM7JRmVdNSPrOl6QMo=;
  b=Pzqi1PB/QRxgXVn/vlsXmM6XRB/qmRBWH+c4T4fHZUpw7VmrRqBn8Ppb
   vr0es4RrRJmxFn6cV3+bFsaajoe7VIIF+Yu4dbbfRjzV8h+GUtye4FlYl
   /4apGrrfvCQPD0MuSKJ/7Fg8fSHbiNjAw0IHZgKwAJAqC2vsvIUIzGAuX
   x4ChrvMy4OGIH4dsuXfonPfldtBuqRwAUIiudNK4eVCupMLMU4BOkIBNr
   LKTVXTy7X4yOegpKfy/tlEsyry9kOnx4YLGzWwjw06OrMKEQepM4I7Iaj
   BiVolq9RvyI325O5lXgCp5BKgEM9slcUZdkS3xHg1+RvlrVJeK11ANGH/
   w==;
X-CSE-ConnectionGUID: uq5jvAGPSs2/8p8+XJPLuQ==
X-CSE-MsgGUID: xzWqoGGSS2i8RQALsJHEBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="75096716"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="75096716"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 12:33:02 -0700
X-CSE-ConnectionGUID: AN70Biy2QciTjxhHCToEjA==
X-CSE-MsgGUID: EMWNslBxTH+taqrUJzkbZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166056552"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2025 12:33:01 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umdh4-0000K7-3C;
	Thu, 14 Aug 2025 19:32:58 +0000
Date: Thu, 14 Aug 2025 21:32:17 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous
 prototype for 'module_handle_host_perm_fault'
Message-ID: <202508142158.drQA7g6C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: 0a901ecd7f9ffbc4169811c90a0f26ed1ee1df7a [4/4] ANDROID: KVM: arm64: Rework pKVM module fault handler
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142158.drQA7g6C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142158.drQA7g6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142158.drQA7g6C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:86:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
    void __pkvm_unmask_serror(void)
         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_entry_wfx,
                         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_entry_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_entry_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_entry_iabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_entry_dabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:481:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_exit_wfx,
                         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:481:22: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_exit_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:24: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_exit_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:24: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_exit_iabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:27: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_exit_dabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:494:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:494:27: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:495:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:495:27: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:1821:32: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=incompatible-pointer-types]
     if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
                                   ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:26:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
    handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
