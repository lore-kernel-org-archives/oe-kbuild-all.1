Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D69194A60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 00:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738023189; cv=none; b=qcn9eScLnMPcXfZakE+8h+/jSzJArdyv+2Y+C6NAzA+GU0aJQezOXv7biheBqnGbw2Z37smobXRz/dsTWxbPXDVtXTWCk+7X8hNKeP1+khSXA3jlh5ePJOxzvn3mdjgO1V2IEV8ArFSEw7Eag1qcO1JpI2LyyUVpkqDdj17XAhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738023189; c=relaxed/simple;
	bh=Djde0pAahS+3tD8ffnfSYIFNWadVg5CJthPxbEpFen8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMzGyoUgN6UgDm55IPmOGBjp3MEQTLDTWyERT3Mj9b4NdYH5k8rk9X/Yu8BkV+JuNIoDorrXKbqL3LVyI5UF6ll1Kar36nvSzvF5oFSDiBYlQMqSweRNfS9EHrHUnBv6WLSRXOjd7ePw1puhOrDp5JigHe06CjWkd5V/ObiU1p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USqLV7sA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USqLV7sA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738023187; x=1769559187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Djde0pAahS+3tD8ffnfSYIFNWadVg5CJthPxbEpFen8=;
  b=USqLV7sALHmVAv1iszYg37SUjz2ZV9S9XI/tHlHJfcTiqoF972X14Kcc
   cH0Pd1asM9j9EN2Czy3llxNfL8Ls8KysAtcYSHIsdd0NZmskBp0fQ2AGU
   vDZ7aHB+rOxC5JGzgdhaxSmpGZ0yXnVy6UU4D6vp1MAuhrFsT4gZ3htTl
   p7wBB5AmZfFoIK+XRzMF3R75LOXveMhvkCAewRDI1RzUJ6Q/NN8/GRIw3
   NVYivgefd4iRMs1ohs4nfdiNgeLSj2NvImjUqk3U9UxmfxvfxRRFWhics
   NMEm53UMtequbfzGaMbI50zRSHTmoApLSxRoInztX61BBM7MiaSqmdUg/
   g==;
X-CSE-ConnectionGUID: FUTjhnwXT0GyOYMIAXfG5w==
X-CSE-MsgGUID: a6nesuelTTKvIAmdDmcS2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38203094"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="38203094"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 16:13:07 -0800
X-CSE-ConnectionGUID: mVeIJbrLRZiJqyL/lwiiFw==
X-CSE-MsgGUID: HQ32RNfhQkms9rw6WWT+rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145797280"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jan 2025 16:13:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcZDy-000hHT-2K;
	Tue, 28 Jan 2025 00:13:02 +0000
Date: Tue, 28 Jan 2025 08:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:33:6: warning: no previous
 prototype for function 'module_handle_host_smc'
Message-ID: <202501280858.HRVbW0p3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   777727da12d85dcea56ed52865552d534ae22892
commit: a3040de297f4dca2983c59d38ea7f9d5d9fc589f [1/1] ANDROID: KVM: arm64: Allow 16 host_smc handlers
config: arm64-randconfig-002-20250128 (https://download.01.org/0day-ci/archive/20250128/202501280858.HRVbW0p3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280858.HRVbW0p3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280858.HRVbW0p3-lkp@intel.com/

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
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:19:
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
