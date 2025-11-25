Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F37E245022
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078839; cv=none; b=cCWS+IT7kDMVkiChsg31/qX6rk3J6e2TyJZ5iXIYCbyAkdqvblM2//FBL7vn+stnGoU7axGCgA1Uz2UC6TKbh9iB1UDkESOr/pLKRzh0bYWPHiVlNlUNY0JKGUlZvCD/nOGMTCW7ZUGuHWKUWbnekDGCgnI+/CElJodAzJV8U7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078839; c=relaxed/simple;
	bh=VJHgrMxglbNTps9USf7FCkpW8qo+GA4PUjejF6226FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WNaQ0HCz81yzs7edDAHk6TLMG5jWpjHC1xswwl+6/FOTZRxpNEUhC1R3pKk3DUI8BBeqqhSua6AVFDyIN53MvlCpzbZRHn0tUwdkV16lHcOtVhvXbR80JagLiF9w4bQ/X6QS4XBr0S36X4Mmndpg4gXi+IeWgRVu3LOXs1tzlPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM5tkj16; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM5tkj16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764078839; x=1795614839;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VJHgrMxglbNTps9USf7FCkpW8qo+GA4PUjejF6226FU=;
  b=aM5tkj16VmDchxIHwoqtI+zTv8xRT3pcRNDNha8WwQxiETE7+LQK12mI
   60ctLkN1erfzfx9MIxAbz1BtbbNSOvchdc5MbCwKAJlkEiPGRa4da8cgV
   ibT5qe7NG/wEhB3Q+LQNG7rhfvlql/+qtdBxWFp87KGHesMVUqrUcpe/m
   5D+kCurJVZonQJFdmij5/dlUmQglbVz50YILebH+D5nCvowG+hbv4JHDd
   y9WHFvxaXxciyR9iK+J5tzYJyY/2bL1t5EWjYc3XZNd/YeSFNlDADeHLt
   edQWxPJv3/noEUAWhhOAvENtCOo5+5cFRw0wefJTFmDTs7jaxCOXJaw4m
   g==;
X-CSE-ConnectionGUID: LSMR+eSMTjKqZUumcZoNhQ==
X-CSE-MsgGUID: /MwFPTN5RXOo+29/z75hXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65802475"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="65802475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:53:49 -0800
X-CSE-ConnectionGUID: umQ2nE0zQtKgx67iMI4JEQ==
X-CSE-MsgGUID: mYb1DRoOTeG7TYqMqMH6qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="215991426"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2025 05:53:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNtUH-000000001qb-02TK;
	Tue, 25 Nov 2025 13:53:45 +0000
Date: Tue, 25 Nov 2025 21:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:randomize-kstack-siphash 1/1]
 arch/riscv/kernel/traps.c:340:17: error: implicit declaration of function
 'add_random_kstack_offset'
Message-ID: <202511252102.k102Y7ED-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git randomize-kstack-siphash
head:   0783912db6e30339d55a5dc7eb6a696b440bedb3
commit: 0783912db6e30339d55a5dc7eb6a696b440bedb3 [1/1] HACK: use siphash to generate kstack offset per-task
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511252102.k102Y7ED-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252102.k102Y7ED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252102.k102Y7ED-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/traps.c: In function 'do_trap_ecall_u':
>> arch/riscv/kernel/traps.c:340:17: error: implicit declaration of function 'add_random_kstack_offset' [-Wimplicit-function-declaration]
     340 |                 add_random_kstack_offset();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/traps.c:355:17: error: implicit declaration of function 'choose_random_kstack_offset' [-Wimplicit-function-declaration]
     355 |                 choose_random_kstack_offset(get_random_u16());
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/add_random_kstack_offset +340 arch/riscv/kernel/traps.c

f0bddf50586da8 Guo Ren     2023-02-21  325  
05d450aabd7386 Song Shuai  2023-11-09  326  asmlinkage __visible __trap_section  __no_stack_protector
05d450aabd7386 Song Shuai  2023-11-09  327  void do_trap_ecall_u(struct pt_regs *regs)
f0bddf50586da8 Guo Ren     2023-02-21  328  {
f0bddf50586da8 Guo Ren     2023-02-21  329  	if (user_mode(regs)) {
52449c17bdd154 Celeste Liu 2023-08-01  330  		long syscall = regs->a7;
f0bddf50586da8 Guo Ren     2023-02-21  331  
f0bddf50586da8 Guo Ren     2023-02-21  332  		regs->epc += 4;
f0bddf50586da8 Guo Ren     2023-02-21  333  		regs->orig_a0 = regs->a0;
61119394631f21 Celeste Liu 2024-06-27  334  		regs->a0 = -ENOSYS;
f0bddf50586da8 Guo Ren     2023-02-21  335  
9657e9b7d2538d Björn Töpel 2023-06-29  336  		riscv_v_vstate_discard(regs);
9657e9b7d2538d Björn Töpel 2023-06-29  337  
9c2598d43510ef Björn Töpel 2023-04-03  338  		syscall = syscall_enter_from_user_mode(regs, syscall);
9c2598d43510ef Björn Töpel 2023-04-03  339  
05d450aabd7386 Song Shuai  2023-11-09 @340  		add_random_kstack_offset();
05d450aabd7386 Song Shuai  2023-11-09  341  
52449c17bdd154 Celeste Liu 2023-08-01  342  		if (syscall >= 0 && syscall < NR_syscalls)
f0bddf50586da8 Guo Ren     2023-02-21  343  			syscall_handler(regs, syscall);
61119394631f21 Celeste Liu 2024-06-27  344  
05d450aabd7386 Song Shuai  2023-11-09  345  		/*
05d450aabd7386 Song Shuai  2023-11-09  346  		 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
05d450aabd7386 Song Shuai  2023-11-09  347  		 * so the maximum stack offset is 1k bytes (10 bits).
05d450aabd7386 Song Shuai  2023-11-09  348  		 *
05d450aabd7386 Song Shuai  2023-11-09  349  		 * The actual entropy will be further reduced by the compiler when
05d450aabd7386 Song Shuai  2023-11-09  350  		 * applying stack alignment constraints: 16-byte (i.e. 4-bit) aligned
05d450aabd7386 Song Shuai  2023-11-09  351  		 * for RV32I or RV64I.
05d450aabd7386 Song Shuai  2023-11-09  352  		 *
05d450aabd7386 Song Shuai  2023-11-09  353  		 * The resulting 6 bits of entropy is seen in SP[9:4].
05d450aabd7386 Song Shuai  2023-11-09  354  		 */
05d450aabd7386 Song Shuai  2023-11-09 @355  		choose_random_kstack_offset(get_random_u16());
f0bddf50586da8 Guo Ren     2023-02-21  356  
f0bddf50586da8 Guo Ren     2023-02-21  357  		syscall_exit_to_user_mode(regs);
f0bddf50586da8 Guo Ren     2023-02-21  358  	} else {
f0bddf50586da8 Guo Ren     2023-02-21  359  		irqentry_state_t state = irqentry_nmi_enter(regs);
f0bddf50586da8 Guo Ren     2023-02-21  360  
f0bddf50586da8 Guo Ren     2023-02-21  361  		do_trap_error(regs, SIGILL, ILL_ILLTRP, regs->epc,
f0bddf50586da8 Guo Ren     2023-02-21  362  			"Oops - environment call from U-mode");
f0bddf50586da8 Guo Ren     2023-02-21  363  
f0bddf50586da8 Guo Ren     2023-02-21  364  		irqentry_nmi_exit(regs, state);
f0bddf50586da8 Guo Ren     2023-02-21  365  	}
f0bddf50586da8 Guo Ren     2023-02-21  366  

:::::: The code at line 340 was first introduced by commit
:::::: 05d450aabd7386246c5aafc341fe9febe5855967 riscv: Support RANDOMIZE_KSTACK_OFFSET

:::::: TO: Song Shuai <songshuaishuai@tinylab.org>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
