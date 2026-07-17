Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2730568E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 08:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278291; cv=none; b=sc9ssDGfZtiRJ+rOKD2LyxvobcxBFR+dqjzj22gE8GT5Dch6rXPBFWyrBHEBI83OOsoESBJv2RLA+mcc9cHV12r4Tw35vSzO7fkhcCM3wcNL7PO9cASauqGa6qgykqEkrqCU9hcFMObClFfV/Z16PCk7oRHm9R+Q9JMge6pNI7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278291; c=relaxed/simple;
	bh=6b32ExehFWap7XfKD0IKuIEV8svGMrnFK68fxh3tRAQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SAILOlhQIMKlEKZoHOl3R5rT62LGTLaQkBCgO7u6osmq4NvAPQDIXf1fWkwhWRtn+lG6DHz9cdTnwaME1e2joc1o9w85YrjkBkG6hgOe6japJQM6ZwTCDj/AUP16dPcmK7CV7ce06oDLwBiT5VPOVKhT4wHCtHOc7vcrOzBrmoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ao+S3J/m; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ao+S3J/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784278289; x=1815814289;
  h=date:from:to:cc:subject:message-id;
  bh=6b32ExehFWap7XfKD0IKuIEV8svGMrnFK68fxh3tRAQ=;
  b=ao+S3J/mWRouBxvAvBxDUJCxyH974P0sNGYcSYFYBeSWDdMz1QSx/lTa
   qKc1QKHfaUcZWHnAASa2tmawAjRE6QyPp2jWOm1u/iNGolPmrv28+8wZN
   rJOTJlZSAFP8f/RI7VmmZUECNIQHJWOJJgtBwnD6v131kln9LgtFhHkeo
   kFF4VawXk1ESbwecHRl82ipbkAMk3MZZ0+cQMFac/U3GKe60GKVdMr8pZ
   K7K8s20ljgo7qzngK2tWDUUAPCYq0LEolbyeSIbsGkSmHv1wtHSZUSVuA
   pwJlS0pZNHpBVzuEXkc/DvsVyZdq5Ncf3KRAvUKTPgilc1mS9J11tiTJ8
   A==;
X-CSE-ConnectionGUID: VrUvnh+4RKqn9c0Q0pPjYA==
X-CSE-MsgGUID: gRPuUjyBQhO913F4O/Sq7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102373603"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="102373603"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 01:51:28 -0700
X-CSE-ConnectionGUID: S55DOuRXQ2qvOkxTMUQIUQ==
X-CSE-MsgGUID: omva/VFKRde9VlEpN+En1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="258728348"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jul 2026 01:51:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkeHu-00000000Sae-05e0;
	Fri, 17 Jul 2026 08:51:19 +0000
Date: Fri, 17 Jul 2026 16:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous
 prototype for function 'module_handle_host_perm_fault'
Message-ID: <202607171652.hHnIPUqm-lkp@intel.com>
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
commit: 0a901ecd7f9ffbc4169811c90a0f26ed1ee1df7a [1/1] ANDROID: KVM: arm64: Rework pKVM module fault handler
config: arm64-randconfig-004 (https://download.01.org/0day-ci/archive/20260717/202607171652.hHnIPUqm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171652.hHnIPUqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171652.hHnIPUqm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      31 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:86:6: warning: no previous prototype for function '__pkvm_unmask_serror' [-Wmissing-prototypes]
      86 | void __pkvm_unmask_serror(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      86 | void __pkvm_unmask_serror(void)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     472 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     473 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     474 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     475 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     476 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:481:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     481 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:480:28: note: previous initialization is here
     480 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     482 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:480:28: note: previous initialization is here
     480 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     483 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:480:28: note: previous initialization is here
     480 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     484 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:480:28: note: previous initialization is here
     480 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     485 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:480:28: note: previous initialization is here
     480 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      31 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   1 warning generated.


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
