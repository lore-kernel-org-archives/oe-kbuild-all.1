Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21712BE630
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296099; cv=none; b=bmZ1+afw7MaIdHF54NQYXddDMC886KtxE5x7WzqL7JZvpngJTOzW3Vx7HQzpJw95S0VMk4IKqwihWe6ovhWe/7wO9p1WcG2OhZbszrImynbVC7682kppabDLXeYbjTsWoNHSwgELWMq45JFAlYe3NQnaGDsAxh+iJR3EdxCNuE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296099; c=relaxed/simple;
	bh=4HrRNh9LU946cdz1ewe460YiPaVgsT5IqkQfyo7+h8o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gV7kj7TyOGjOT03Arh+T39wtsTySNqAZGHwxPwWhTwLhcgkaGMUb5C7Chhiu4rCjv5SJgvwgysfRQBkPJZZsi6Gw8Mmp1VFbzDlbaywgNBuaeG9IfkJo27WGZajbGhG7zvYlBZ7pXYmD0CLKYE4v525kw6BXMSVsHx44+NJpYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVxF2cIq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVxF2cIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784296098; x=1815832098;
  h=date:from:to:cc:subject:message-id;
  bh=4HrRNh9LU946cdz1ewe460YiPaVgsT5IqkQfyo7+h8o=;
  b=OVxF2cIqB0pd3wKJ/hP0lxSuUVrON4+zrmvuWG9GKgx9E0kxedmxhVwY
   7+fwbt75V7N5sb2NI+3Cf+Gr21rj7NYTGv+mQjEF/GclFk7U/958gY6yh
   yUT2KD535u/wSF/ssk+a1szXgMTNyoczVvaitW75+p7rjHGq3zERXzdyM
   XP81NzYDxPpjjbvjCXh3ET00XRbReASHFPvm+2RoOzbsDBYqKqTP6SEfI
   a0j8hwjU7AkiCfioSz5Durf2fc+VMLDVJZWFTFsPDf6j5SP6NJqUwZN9n
   s/tsA32bRzP8kXB/V/gjyyuUafOkhx8YWYaglWocJVzZfctmTq2jZA1jm
   Q==;
X-CSE-ConnectionGUID: 21o0zpWlShGzJFVSlDTOjg==
X-CSE-MsgGUID: A7ERKys9S12Cix3nStXisA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85009417"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85009417"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 06:48:17 -0700
X-CSE-ConnectionGUID: 8QxuCoTkQge6whCB+FbMyA==
X-CSE-MsgGUID: tJvXLqJZTCKTOoOnLEEuNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="255633404"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Jul 2026 06:48:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkivE-00000000SnM-37oI;
	Fri, 17 Jul 2026 13:48:12 +0000
Date: Fri, 17 Jul 2026 21:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous
 prototype for function 'module_handle_host_smc'
Message-ID: <202607172118.bKWfKi9S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   133d9641e9477c7e0c05a3fc18eb81d7579675b9
commit: a3040de297f4dca2983c59d38ea7f9d5d9fc589f [1/1] ANDROID: KVM: arm64: Allow 16 host_smc handlers
config: arm64-randconfig-004 (https://download.01.org/0day-ci/archive/20260717/202607172118.bKWfKi9S-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172118.bKWfKi9S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172118.bKWfKi9S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:75:6: warning: no previous prototype for function '__pkvm_unmask_serror' [-Wmissing-prototypes]
      75 | void __pkvm_unmask_serror(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | void __pkvm_unmask_serror(void)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:461:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     461 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:460:28: note: previous initialization is here
     460 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     462 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:460:28: note: previous initialization is here
     460 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     463 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:460:28: note: previous initialization is here
     460 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     464 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:460:28: note: previous initialization is here
     460 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     465 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:460:28: note: previous initialization is here
     460 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:470:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     470 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:469:28: note: previous initialization is here
     469 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     471 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:469:28: note: previous initialization is here
     469 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     472 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:469:28: note: previous initialization is here
     469 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     473 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:469:28: note: previous initialization is here
     469 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     474 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:469:28: note: previous initialization is here
     469 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   2 warnings generated.


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
