Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817A54A1D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737989234; cv=none; b=mGOTBYMUTNtC72kD2UeoTcFw7EhGhZzNck5/nqhAWDnIobmSsQRvcBgr4hYZweyKPphXxLkUU/S1gEvdtcXLYJrqps/8uS0Ww6Sn5eZ0miV7MIAas9Lf8+imgvndzRvCTIk8RStbtSAjsHtHaqdC1SfmlCFosVuhICUmGTg+/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737989234; c=relaxed/simple;
	bh=AV5MKj+8jsFotLZFJCOMrpvP5YBXULpj4ealMg6UlNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fU+nCwt0uvWtyD+S6cd8I7K7X+39FY8ONKH6fmI178WMBPNS8eOtNZpT13pdDHg9Qthm/dZFBwSKk8qRoUsnQZSoGONtQfc8sascLjeIMqg8Lt9VYn1wMz39ssrkiHsfLRSSDCknBFFBGy/Xy7t8GpkUqlTFODZXLB96Zff5Hm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xje+UnrK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xje+UnrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737989232; x=1769525232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AV5MKj+8jsFotLZFJCOMrpvP5YBXULpj4ealMg6UlNc=;
  b=Xje+UnrKQ827/Z6PSULhxoN8F118o+TSyafcMmzjYO6AKp5mTznGYG8R
   UWOtIF6bZcRrzJNj2LzzNfV2CI8tzdqG/NQkd7glC//bxS+1/SfRtd2B3
   YUjvduqlgy9N4uwqxpCosa7C06ZOvEW3eUUpkVy5aAwIIGtFrA1pnVbnh
   rKYI7oyK7Q9kH80si5RJNkTmfrv97qmys0dBfenG4vPPR3Dlkjy0aBNSM
   nmzxBLc3in7O3O0ODmJrysN8mN/mYwJwBsrKPQIhA5WIi2rWH0DP+Gmc6
   gmdaXz56vZKu1UIQ3cE1pWMaznXcNou5BSsU7fgZyZ5bD51wWGr3l/M31
   A==;
X-CSE-ConnectionGUID: QztTo/rXTHSukiMZ3SlVug==
X-CSE-MsgGUID: Y1CKg4y5RzS32VyFti5ouQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37650928"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="37650928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 06:47:12 -0800
X-CSE-ConnectionGUID: /h1I3EzmS/G0Hx8k2lKUJA==
X-CSE-MsgGUID: VnZK055MQ/qCjsk0fwM9CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145663920"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jan 2025 06:47:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcQOK-000grL-2H;
	Mon, 27 Jan 2025 14:47:08 +0000
Date: Mon, 27 Jan 2025 22:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous
 prototype for 'module_handle_host_smc'
Message-ID: <202501272210.INPzBz2Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   9384a0909faf38f44986663065e5419861a3d773
commit: a3040de297f4dca2983c59d38ea7f9d5d9fc589f [3/3] ANDROID: KVM: arm64: Allow 16 host_smc handlers
config: arm64-randconfig-004-20250127 (https://download.01.org/0day-ci/archive/20250127/202501272210.INPzBz2Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501272210.INPzBz2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501272210.INPzBz2Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:75:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
      75 | void __pkvm_unmask_serror(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:461:43: warning: initialized field overwritten [-Woverride-init]
     461 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:461:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:43: warning: initialized field overwritten [-Woverride-init]
     462 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: warning: initialized field overwritten [-Woverride-init]
     463 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: warning: initialized field overwritten [-Woverride-init]
     464 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: warning: initialized field overwritten [-Woverride-init]
     465 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:470:43: warning: initialized field overwritten [-Woverride-init]
     470 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:470:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:43: warning: initialized field overwritten [-Woverride-init]
     471 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: warning: initialized field overwritten [-Woverride-init]
     472 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: warning: initialized field overwritten [-Woverride-init]
     473 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: warning: initialized field overwritten [-Woverride-init]
     474 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:43: warning: initialized field overwritten [-Woverride-init]
     483 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:43: warning: initialized field overwritten [-Woverride-init]
     484 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:1810:39: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Wincompatible-pointer-types]
    1810 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct user_pt_regs *
   arch/arm64/kvm/hyp/include/nvhe/modules.h:27:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
      27 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~


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
