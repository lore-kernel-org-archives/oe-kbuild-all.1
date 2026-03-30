Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0BE3C1998
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774874652; cv=none; b=s/vPYuE4Nosn+H8m9IJUF9j3epwSLlG4n3lJLdHcxE3Ge3OiZs+bvd0jitlKim+CSO4irTQAJEzzd9F8+hrQzBFWReoGiJtkChOWB6EBSUFkNbBSxB5r+8O3YiEyAIV8WoM3NEMeZydtenAFEbRWZ4tBSsNQ5Rz1MwhRFHO99WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774874652; c=relaxed/simple;
	bh=YdiKPNNy6g7//E/AQQF2uDEnxAyu3ewLuaQw0kFXXLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uoOANXeQl1yDI9QvDAakqdqa4RSW97SwGH4yL+1doYIuhiQ0+aODaNb+ZFv+9guOsIuhO/sBeFEQyu71Htbtihm6dj89RFRuN3/PmtNupSHd8VXQqH54dDZxz11ZjcScveaXLiBwn8nwDxM7uIVf6WGd/bKPSCGGYnG/66nmMrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHyIJpES; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHyIJpES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774874650; x=1806410650;
  h=date:from:to:cc:subject:message-id;
  bh=YdiKPNNy6g7//E/AQQF2uDEnxAyu3ewLuaQw0kFXXLw=;
  b=PHyIJpESIrmELMhlBKWfYEqeUr+2GkY8CClc1pTGgOyzZ0fKrYXG5glk
   JGefDQPX5mV+CPtADHWUBSsay1noc3c7EehQLAWf8gyo7PFRLwAG2KTtO
   TGyjc9taRbU3yOEf+sFXGnQBqz1YT7deoLK/wpwUHqOqbnkyzdkq+NW/1
   5v7SQziLphZo9l0IdPwIA3/++uG9WrscKGoWVex2pMfdlYJ/Hw5658RUZ
   2UEIJUDT1tVScnYnM2bNbA0gsbnxxn32WoVZUmxvhFsF534/iuzzEByy6
   yDI2Y8tGmNFqalOmHarwx9B+ePZrIXILY5+0KqEqUL/dzGN25aggDeDsD
   w==;
X-CSE-ConnectionGUID: tYyztBpER+iveStLk7qPIw==
X-CSE-MsgGUID: O7M26Jw3Ql+xTs+ujoxD9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="76057063"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="76057063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 05:44:10 -0700
X-CSE-ConnectionGUID: FYb6okF4QfOSCb1x3yIb7A==
X-CSE-MsgGUID: Bh+UJ6m+QXq4cfkuNHQbrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="227662540"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 05:44:08 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ByQ-0000000015x-1DO9;
	Mon, 30 Mar 2026 12:44:06 +0000
Date: Mon, 30 Mar 2026 20:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 5/5]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for
 function '__pkvm_unmask_serror'
Message-ID: <202603302005.5YsQUKas-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: a08dde8a50c098a8002175044a68f63a9de16a53 [5/5] ANDROID: KVM: arm64: Add pKVM module register_unmask_serror
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603302005.5YsQUKas-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302005.5YsQUKas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302005.5YsQUKas-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for function '__pkvm_unmask_serror' [-Wmissing-prototypes]
      56 | void __pkvm_unmask_serror(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | void __pkvm_unmask_serror(void)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     455 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     456 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:457:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     457 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:458:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     458 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:459:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     459 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     464 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     465 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     466 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     467 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:468:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     468 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     477 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:28: note: previous initialization is here

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/__pkvm_unmask_serror +56 arch/arm64/kvm/hyp/nvhe/hyp-main.c

    55	
  > 56	void __pkvm_unmask_serror(void)
    57	{
    58		u64 hcr = read_sysreg(HCR_EL2);
    59	
    60		if (!unmask_serror || !unmask_serror())
    61			return;
    62	
    63		write_sysreg(hcr | HCR_AMO, HCR_EL2);
    64		asm volatile("msr daifclr, #4");
    65		isb();
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
