Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7C1946C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 22:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738016403; cv=none; b=c7Z8a8O27ekBxKCi0+lXWbARrXbJ5YhfEJi0T8nEAwkSLcQIs4r3cONxUQ1OT120mikHFrOZroQV8/8iEqwzQhPF+2J5bTAhWL0Sfe82ZxghTWbPXyOkVWTumt0pRqppXuH0BCxshyDqjXIh/MmxqKpQu+WfQHbKNiSRfu2qMWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738016403; c=relaxed/simple;
	bh=Pp0Z/sAHy8/JGUT9E6wCgUpvv3chDsYwgM+Ic1TRDKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gu3UDMVfJR+dUv9yrnTmFUV3kXDNNoiayiwIS1EvPKiczf4OFLAKPitgLMxLeI7sRSeXW1wXI4ReSA3o1d2GBBs4sB/nXiGp4tltXIHlm1agsOLLEfZ5mny4q1uMPFQcha0Rjla3wkUA645H0sh2oQ7PWAkIXR2I0172zdUHRrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdcHe8/g; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdcHe8/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738016401; x=1769552401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pp0Z/sAHy8/JGUT9E6wCgUpvv3chDsYwgM+Ic1TRDKA=;
  b=FdcHe8/geirDn5w1hVypuOWsGrTG49MlsuNNMSCLzadM7GXDps6lKD6I
   NQ7dhNA9cxms73n3+eLWK5gSZbN1s3fzEtmZCMoEYoFjbevogyhdpT6jc
   WsmLPK+d1kd2RnFRrsMe1KeT+Adq1BfVUDh8FHvKT/M2BvgU7O89FpwAR
   aN17INKIKTX8pM+FKt1nx7EagQnTcoLb/Gh+943f2j1WeR5f1Oo7X/gtT
   tAT4KP+jrMjozC/fktOYG+hDPERJDc4i44yvB8lCwswoR0ajcy5w1ojqN
   YvYpyDLEHNzWZzooXD68gzCj19bz4j55YDpycVfJO0D9xoAkxwlMahnUq
   g==;
X-CSE-ConnectionGUID: d2nI5gHhTkCeE1OgPntwDA==
X-CSE-MsgGUID: o4RRFS8mSman+JT+G2R5qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49088044"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="49088044"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 14:19:56 -0800
X-CSE-ConnectionGUID: sJu1uwmWRrq7lr3IzL5oBw==
X-CSE-MsgGUID: CNtDx+l4RC+f3KyPVTl3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="108530272"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jan 2025 14:19:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcXSS-000hDJ-1E;
	Mon, 27 Jan 2025 22:19:52 +0000
Date: Tue, 28 Jan 2025 06:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:31:6: warning: no previous
 prototype for function 'module_handle_host_perm_fault'
Message-ID: <202501280629.nwIrYu6S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d9f67873f80b0ea18e39b6efa9c66db323e5ad04
commit: 0a901ecd7f9ffbc4169811c90a0f26ed1ee1df7a [1/1] ANDROID: KVM: arm64: Rework pKVM module fault handler
config: arm64-randconfig-002-20250128 (https://download.01.org/0day-ci/archive/20250128/202501280629.nwIrYu6S-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280629.nwIrYu6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280629.nwIrYu6S-lkp@intel.com/

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
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:19:
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
