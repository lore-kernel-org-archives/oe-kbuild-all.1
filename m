Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327B825CC75
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 20:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755203472; cv=none; b=WMckVHOCxHIbgu+vERniTu4YmVxp/9uANv6a0dwSoEZDIm3InxrzMqLfPZx2gtCNYFKcetLCzbDs8ENmG+LyKlq/72vzURCgdwBJ5MUXLmBBp9BieCZn71GUuXRUv4uaAWX2EFutBapC86TwQdsljUT6BNAmsxLb4v5EaUYlo1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755203472; c=relaxed/simple;
	bh=1Ifr+3mCdgVeAgkw/J+5K/LLhcZ9qZFbR9khAJ8HbIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bMm5CFC9HMPDGxoQSAA7b9PNG+L0los52BlWzSQH91bPnDLuYvX8MdrpjoUMTOc86+uHsRYcbLrHeFAIDkltFEFBX4xII3PvWgGmHHFQpF7iPFd1nTRvO0j1cFlllzoug/oeOBSZuouU4V4fXZIi15+S7pkBAQYIiuhM9eCaMX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RA5n74JD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RA5n74JD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755203466; x=1786739466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Ifr+3mCdgVeAgkw/J+5K/LLhcZ9qZFbR9khAJ8HbIM=;
  b=RA5n74JDkLplv2VUSIF7JvPj8YeolY558R1HAcJJZacHB2s9xt13Tnm/
   V+dVf14kOCjVGCF0Y5ELTEJXRLwO4W18kJL4ujHBYD193KUTbQthCEr/M
   Zb4uHKB6yjOT4/jMbSfPysQbNEbswRodRS732GrLyjp0GMYP9VH00zr26
   Cxo8QVRKIUPbfhi2MJ1+ldDqogd5R+CR55/oxGuUcnsAFGvk/o0Mr8ZMZ
   CNN2uAwLQqTFumeLomQLP+5HjEDfAFxVx22NhWlEEJbcchHFjdh3fIKMc
   mA3A05Y/PjyJ5wi1ofbmG1w+JdGA3hMBHSy/BmW8FFB2bS0mfu9bRyIIp
   w==;
X-CSE-ConnectionGUID: xaiS619ETaCbdAocKHPYZg==
X-CSE-MsgGUID: Iv7ME7g2TNONhUd8pLniFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57246921"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57246921"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 13:31:06 -0700
X-CSE-ConnectionGUID: M9lhrxEzQVW3sMZ6s0JzQQ==
X-CSE-MsgGUID: CK6z+4yaSES8NlEwooiVMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204032073"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2025 13:31:05 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umebG-0000Kl-1e;
	Thu, 14 Aug 2025 20:31:02 +0000
Date: Thu, 14 Aug 2025 22:30:45 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous
 prototype for 'module_handle_host_smc'
Message-ID: <202508142225.dzz1cYl8-lkp@intel.com>
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
commit: a3040de297f4dca2983c59d38ea7f9d5d9fc589f [4/4] ANDROID: KVM: arm64: Allow 16 host_smc handlers
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142225.dzz1cYl8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142225.dzz1cYl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142225.dzz1cYl8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:75:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
    void __pkvm_unmask_serror(void)
         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:461:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_entry_wfx,
                         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:461:22: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_entry_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:24: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_entry_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:24: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_entry_iabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:27: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_entry_dabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:27: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:470:22: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  = handle_pvm_exit_wfx,
                         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:470:22: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  = handle_pvm_exit_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:24: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:24: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  = handle_pvm_exit_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:24: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_pvm_exit_iabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:27: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_pvm_exit_dabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:27: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:27: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:27: warning: initialized field overwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  = handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:27: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:1810:32: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=incompatible-pointer-types]
     if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
                                   ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:27:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
    handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~


vim +/module_handle_host_smc +33 arch/arm64/kvm/hyp/include/nvhe/modules.h

    14	
    15	#ifdef CONFIG_MODULES
    16	int __pkvm_init_module(void *module_init);
    17	int __pkvm_register_hcall(unsigned long hfn_hyp_va);
    18	int handle_host_dynamic_hcall(struct user_pt_regs *regs, int id);
    19	void __pkvm_close_module_registration(void);
    20	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr);
    21	bool module_handle_host_smc(struct user_pt_regs *regs);
    22	#else
    23	static inline int __pkvm_init_module(void *module_init) { return -EOPNOTSUPP; }
    24	static inline int
    25	__pkvm_register_hcall(unsigned long hfn_hyp_va) { return -EOPNOTSUPP; }
    26	static inline int
    27	handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
    28	{
    29		return HCALL_UNHANDLED;
    30	}
    31	static inline void __pkvm_close_module_registration(void) { }
    32	bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
  > 33	bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
