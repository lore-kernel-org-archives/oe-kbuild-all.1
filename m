Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F851FA25D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735914950; cv=none; b=HXi52Bqeajmq7tCocPiAlTzsTM97eJS2SeEsS20IlR9TexxDpSjuOQ0JFOifGARCdxgPZ0quZddwiQZbXmBgsFwneSe50ko9aHP816BrRBFyupL1aB2Ypv5MjaWMJlRErNIW02cXadRSEmM4ESwwvajIySnhWLCmq9i6Uw7SX8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735914950; c=relaxed/simple;
	bh=qmf2v3svAKqlyFeWqcpSzy5raDwhdc9i65PQUFNbo14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fu9UQFKRFNCKg1fGWUQvhMUXUfr4WQq/T3WLB0ENpq/5lKjMgrplO7nV0TTJo6W4n3xyZbqMSCCiHf63JZSsqTYWJEjjBJ0MY+0PCOM2vLCx7NNqgA7MWfFYxcEL/M69fLlmpL6wcOj6dshcLyy4MBLWueHZ2aEjp+iUmK1FJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kydUFt1s; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kydUFt1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735914948; x=1767450948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qmf2v3svAKqlyFeWqcpSzy5raDwhdc9i65PQUFNbo14=;
  b=kydUFt1s1fnXBMtnNjrgmGaalSpvWtfvteO+EtrEsCyblUDbhjArb5pM
   v0TiNPgyn8afb/vuSTC6NVB546QvJFIb3Shr1PeTzeXA8YzQXSHGHLxg/
   SaI0vuK2bZ7xgyKRxvPxWqf13WcGXYSpcEEttIHa2ZOd7x0GQAojnsNEH
   6I85jBHcboJAE+AMYieYVbXJnUGzXH4PEdoeAj4o9LXVmQ2MDw8gZad77
   lKOdUZd8LXbqan0rBUCOOzteB/K8RG7Q0hELudwlNypV5W0VzpMSjNJor
   opP/9GQL/i0elxq3Y7jxYGwhTRbgsxLz9Xj8S/9LUtUhQhc/PKzHkE4up
   w==;
X-CSE-ConnectionGUID: uKhZjcN4QJGNydBcqlmD0g==
X-CSE-MsgGUID: 4vv2Qov1RsK8rpVagBfoEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47577223"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="47577223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 06:35:47 -0800
X-CSE-ConnectionGUID: fMB1MLPOT3GLaX9/ANnf3g==
X-CSE-MsgGUID: 2EWCxXuCSsab7CxOuFIt5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="102282046"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jan 2025 06:33:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTiji-0009q3-16;
	Fri, 03 Jan 2025 14:33:14 +0000
Date: Fri, 3 Jan 2025 22:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 19/20]
 arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32
Message-ID: <202501032250.Tl8LVSfy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   67c5c1e927ddfd83fc95b6a446a54e19c25d13c2
commit: c8b0b99be092c9796b370707551d5a1192b4ce65 [19/20] ftrace: Add ftrace_get_symaddr to convert fentry_ip to symaddr
config: arm64-randconfig-r113-20250103 (https://download.01.org/0day-ci/archive/20250103/202501032250.Tl8LVSfy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501032250.Tl8LVSfy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501032250.Tl8LVSfy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32

vim +203 arch/arm64/kernel/ftrace.c

   145	
   146	/* Convert fentry_ip to the symbol address without kallsyms */
   147	unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
   148	{
   149		u32 insn;
   150	
   151		/*
   152		 * When using patchable-function-entry without pre-function NOPS, ftrace
   153		 * entry is the address of the first NOP after the function entry point.
   154		 *
   155		 * The compiler has either generated:
   156		 *
   157		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   158		 * func+04:		NOP		// To be patched to BL <caller>
   159		 *
   160		 * Or:
   161		 *
   162		 * func-04:		BTI	C
   163		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   164		 * func+04:		NOP		// To be patched to BL <caller>
   165		 *
   166		 * The fentry_ip is the address of `BL <caller>` which is at `func + 4`
   167		 * bytes in either case.
   168		 */
   169		if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
   170			return fentry_ip - AARCH64_INSN_SIZE;
   171	
   172		/*
   173		 * When using patchable-function-entry with pre-function NOPs, BTI is
   174		 * a bit different.
   175		 *
   176		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   177		 * func+04:		NOP		// To be patched to BL <caller>
   178		 *
   179		 * Or:
   180		 *
   181		 * func+00:	func:	BTI	C
   182		 * func+04:		NOP		// To be patched to MOV X9, LR
   183		 * func+08:		NOP		// To be patched to BL <caller>
   184		 *
   185		 * The fentry_ip is the address of `BL <caller>` which is at either
   186		 * `func + 4` or `func + 8` depends on whether there is a BTI.
   187		 */
   188	
   189		/* If there is no BTI, the func address should be one instruction before. */
   190		if (!IS_ENABLED(CONFIG_ARM64_BTI_KERNEL))
   191			return fentry_ip - AARCH64_INSN_SIZE;
   192	
   193		/* We want to be extra safe in case entry ip is on the page edge,
   194		 * but otherwise we need to avoid get_kernel_nofault()'s overhead.
   195		 */
   196		if ((fentry_ip & ~PAGE_MASK) < AARCH64_INSN_SIZE * 2) {
   197			if (get_kernel_nofault(insn, (u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2)))
   198				return 0;
   199		} else {
   200			insn = *(u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2);
   201		}
   202	
 > 203		if (aarch64_insn_is_bti(le32_to_cpu((__le32)insn)))
   204			return fentry_ip - AARCH64_INSN_SIZE * 2;
   205	
   206		return fentry_ip - AARCH64_INSN_SIZE;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
