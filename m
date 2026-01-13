Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AF235C1BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292509; cv=none; b=Hr9hS0JP2+gUE/VwlYmQkq84QgvpxthYey9BCqSNFVWbutwlz9Ck6d7C/L/obVAX6jq4jaXpbfMlY2qMrlVgNznAtptUZ9uWR/hyTYIAjmCEM9I0yJxzt9l2SphItzkwlX3mDRyCMrOxAMziDLXuddWgyuGYcEd9ARQmaEuyzjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292509; c=relaxed/simple;
	bh=4uvy1XaSKV2E+hgAr7Sto8Rn9KBoDfne1dT2yxOQgTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rBUYhAgfTQUQl7hUmUlt6e1KFYrklPlmtP94GsULGlMEAnkSXI0s59Mlesqf21x82p0ISZeQjHnlvQeYzVrelpkdUEYRD0B+2fW5dauTbX0Ix9Ks38cZ3jmTyK5Rt8v3p5Qlufw8XM8iqZoRDRB96FKl/CEa9k2+pNU3U+DUsA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ne2yAOxB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ne2yAOxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292508; x=1799828508;
  h=date:from:to:cc:subject:message-id;
  bh=4uvy1XaSKV2E+hgAr7Sto8Rn9KBoDfne1dT2yxOQgTM=;
  b=Ne2yAOxBMRS4gs3yQm6oGhOgzxH3ou6j0VIfzVreBgDUj2IT5aQYxmOX
   tIytJFaeY6TS35hsFQzVLJCT0XWzWWj1sL7BFu/sNk+MPdtyF/D+v31Iz
   YjU0nrtGrpOFlb4sVK8J03ZUv7uEebkS1MAkunDDSS6sAWx+j06VxPnQL
   +dNrPkBJW43VNvIU8fDdmXrSbq7AcIB133xNmv1m9JgkK3caXYh4yo1jT
   /llIHdOq7GxNE5KB25CmcSsWTFD0a1V3h8PjFvcqCDrKDBnQAUPBnydDF
   Q6D9tD67nx9iudVea2d133AXts/VTCE6pGlitfnL/WcVxrPq8din77MO1
   Q==;
X-CSE-ConnectionGUID: esEv9VwqTgWNAhn5iDwWgA==
X-CSE-MsgGUID: A6w5MwINTE+bdLtiq2C2+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625416"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625416"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:21:47 -0800
X-CSE-ConnectionGUID: 8cDUmGH/RMW5lM3iU3m11A==
X-CSE-MsgGUID: 9yY0o8T7QSiFwubTI8QS1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209153904"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jan 2026 00:21:45 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfZeo-00000000173-2i3Y;
	Tue, 13 Jan 2026 08:21:42 +0000
Date: Tue, 13 Jan 2026 09:21:22 +0100
From: kernel test robot <lkp@intel.com>
To: "Maciej Wieczor-Retman" <maciej.wieczor-retman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 294/303] arch/arm64/kernel/traps.c:1074:2:
 error: call to undeclared function 'kasan_die_unless_recover'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202601130951.tiOySRqt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   abb8eb84b7bb668d982e556b2b19f0e3ac42c591
commit: c22668ddeabded18adfebc428e99d20d59bc6d9d [294/303] arm64: unify software tag-based KASAN inline recovery path
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260113/202601130951.tiOySRqt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130951.tiOySRqt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130951.tiOySRqt-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:862:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     862 |         [ESR_ELx_EC_DABT_CUR]           = "DABT (current EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:863:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     863 |         [ESR_ELx_EC_SP_ALIGN]           = "SP Alignment",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:864:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     864 |         [ESR_ELx_EC_MOPS]               = "MOPS",
         |                                           ^~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:865:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     865 |         [ESR_ELx_EC_FP_EXC32]           = "FP (AArch32)",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:866:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     866 |         [ESR_ELx_EC_FP_EXC64]           = "FP (AArch64)",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:867:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     867 |         [ESR_ELx_EC_GCS]                = "Guarded Control Stack",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:868:25: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     868 |         [ESR_ELx_EC_SERROR]             = "SError",
         |                                           ^~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:869:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     869 |         [ESR_ELx_EC_BREAKPT_LOW]        = "Breakpoint (lower EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:870:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     870 |         [ESR_ELx_EC_BREAKPT_CUR]        = "Breakpoint (current EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:871:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     871 |         [ESR_ELx_EC_SOFTSTP_LOW]        = "Software Step (lower EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:872:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     872 |         [ESR_ELx_EC_SOFTSTP_CUR]        = "Software Step (current EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:873:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     873 |         [ESR_ELx_EC_WATCHPT_LOW]        = "Watchpoint (lower EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:874:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     874 |         [ESR_ELx_EC_WATCHPT_CUR]        = "Watchpoint (current EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:875:25: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     875 |         [ESR_ELx_EC_BKPT32]             = "BKPT (AArch32)",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:876:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     876 |         [ESR_ELx_EC_VECTOR32]           = "Vector catch (AArch32)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:877:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     877 |         [ESR_ELx_EC_BRK64]              = "BRK (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/traps.c:1074:2: error: call to undeclared function 'kasan_die_unless_recover'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1074 |         kasan_die_unless_recover(recover, "Oops - KASAN", regs, esr, die);
         |         ^
   44 warnings and 1 error generated.


vim +/kasan_die_unless_recover +1074 arch/arm64/kernel/traps.c

  1063	
  1064	int kasan_brk_handler(struct pt_regs *regs, unsigned long esr)
  1065	{
  1066		bool recover = esr & KASAN_ESR_RECOVER;
  1067		bool write = esr & KASAN_ESR_WRITE;
  1068		size_t size = KASAN_ESR_SIZE(esr);
  1069		void *addr = (void *)regs->regs[0];
  1070		u64 pc = regs->pc;
  1071	
  1072		kasan_report(addr, size, write, pc);
  1073	
> 1074		kasan_die_unless_recover(recover, "Oops - KASAN", regs, esr, die);
  1075	
  1076		/* If thread survives, skip over the brk instruction and continue: */
  1077		arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
  1078		return DBG_HOOK_HANDLED;
  1079	}
  1080	#endif
  1081	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
