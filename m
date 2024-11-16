Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AC72F2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 18:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731781799; cv=none; b=gyQUDSV4s/MvbUL7rD/gQvT87Jv0Ubg9+ggPCAkxELk2f5vKVfbTChlmpzKF5Jyi61rOBHld5p2+q3kgBr0l5YoaUKd5Sl5FLzu7drY5f2SaT0dBNMx2j0w1eQxOIcOiXp0Ppb9pE4xXZtIxuDDIlTaeoSxRd+oQiMEZhY5BcPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731781799; c=relaxed/simple;
	bh=OL+EX+k6wo0n+ThmIHKOFdOgd7vLFK5sRQtBXQ7HfDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAEndojPuPiTrpkeh3FFB8b8cFwu9hin41raHFYn2EgmJPR43XUTYhsxLtdQnXUpltXoL90aMtLfMhyaNTdsQRzXkDIirwtgYdQMD+Qg7JhxgbeLDgeAkZacm7e43eEdIj14TwAZ875BStIM0mFxL7hlJLoZl/T5I42cn4Uq89o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRxKPFmQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRxKPFmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731781797; x=1763317797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OL+EX+k6wo0n+ThmIHKOFdOgd7vLFK5sRQtBXQ7HfDI=;
  b=nRxKPFmQWhYHeI2d6Pk/HIfeTms9ksIQRrHV+NVoAkQlMLvN0oA86A8+
   9rvqiM8sCeUnPdLXObYYs3IIYUVEeLHEVz5Yogy8t/k2lxeF2MzLbo20L
   /0MplP1GTvZRQvaDitmgm6hBw6SYesV2KVO1Xs+I7rHMCliGEpWP7nrsp
   zRz3fsRjF59Dc07zkwSxl4wMKmB+jn9GeYVBgyD+LAUxNyXvOKJLThO5P
   hSqM80BoK71oJDgEravMWZ3QPTXduSZCwW0lxGQ1pu+jiQBVhvHlL8VE2
   0CiLs4BkBlx5vJpB91N7maA+lseROIjZ2QNabSQv7N0ZVfFQZkQCIQrSp
   g==;
X-CSE-ConnectionGUID: vi0p79AnQw6Pa0II2bZp5g==
X-CSE-MsgGUID: M0TDW2tmQVSWj6GG4j/ofA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54273691"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="54273691"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 10:29:56 -0800
X-CSE-ConnectionGUID: G81YTE62RIqc6lXnANB5Ng==
X-CSE-MsgGUID: /h7BzrwNRuqQlImzcC/A/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="126389373"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2024 10:29:56 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCNYP-00011d-1Z;
	Sat, 16 Nov 2024 18:29:53 +0000
Date: Sun, 17 Nov 2024 02:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 206/259]
 arch/x86/coco/tdx/tdx.c:381:2: error: extraneous closing brace ('}')
Message-ID: <202411170203.W9EezfPN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: c679d728be765bc07b0a2cff90e44768ed28804d [206/259] ANDROID: x86/tdx: Move virt exception handler code to virt_exception.c
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241117/202411170203.W9EezfPN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170203.W9EezfPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170203.W9EezfPN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/coco/tdx/tdx.c:17:
   In file included from arch/x86/include/asm/traps.h:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/coco/tdx/tdx.c:381:2: error: extraneous closing brace ('}')
     381 |         }
         |         ^
>> arch/x86/coco/tdx/tdx.c:383:2: error: expected identifier or '('
     383 |         if (!fault_in_kernel_space(ve->gla)) {
         |         ^
   5 warnings and 2 errors generated.


vim +381 arch/x86/coco/tdx/tdx.c

31d58c4e557d46 Kirill A. Shutemov         2022-04-06  380  
31d58c4e557d46 Kirill A. Shutemov         2022-04-06 @381  	}
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  382  
4c0c5dcb5471de Alexey Gladkov (Intel      2024-09-13 @383) 	if (!fault_in_kernel_space(ve->gla)) {
4c0c5dcb5471de Alexey Gladkov (Intel      2024-09-13  384) 		WARN_ONCE(1, "Access to userspace address is not supported");
4c0c5dcb5471de Alexey Gladkov (Intel      2024-09-13  385) 		return -EINVAL;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  386  static bool handle_in(struct pt_regs *regs, int size, int port)
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  387  {
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  388  	struct tdx_hypercall_args args = {
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  389  		.r10 = TDX_HYPERCALL_STANDARD,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  390  		.r11 = hcall_func(EXIT_REASON_IO_INSTRUCTION),
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  391  		.r12 = size,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  392  		.r13 = PORT_READ,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  393  		.r14 = port,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  394  	};
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  395  	u64 mask = GENMASK(BITS_PER_BYTE * size, 0);
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  396  	bool success;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  397  
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  398  	/*
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  399  	 * Emulate the I/O read via hypercall. More info about ABI can be found
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  400  	 * in TDX Guest-Host-Communication Interface (GHCI) section titled
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  401  	 * "TDG.VP.VMCALL<Instruction.IO>".
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  402  	 */
7a3a401874bea0 Kirill A. Shutemov         2023-03-21  403  	success = !__tdx_hypercall_ret(&args);
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  404  
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  405  	/* Update part of the register affected by the emulated instruction */
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  406  	regs->ax &= ~mask;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  407  	if (success)
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  408  		regs->ax |= args.r11 & mask;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  409  
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  410  	return success;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  411  }
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  412  

:::::: The code at line 381 was first introduced by commit
:::::: 31d58c4e557d46fa7f8557714250fb6f89c941ae x86/tdx: Handle in-kernel MMIO

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
