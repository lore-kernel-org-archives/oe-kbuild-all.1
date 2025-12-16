Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE8934321C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866639; cv=none; b=FY3v/CEFHbatLmvzpukDFCG4659Een9+OHGFrLSROVeP3YEGnbPhPgLau8OMJPrtX/oLQcgFX2rd2U6zt2cyCTITRVw/bdm7dEupL5O2n8YBKAuBClx3tB1vd5wCLJQRfJbmMJC09QGCiPmlmrm7VuIJuCxhU5z75L4iij9UR1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866639; c=relaxed/simple;
	bh=caW85dJssnXMUQwTaxj47W5KTeAnRQzB3ILQfDFWr4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+YKKU9VRmL1Wq4pDaCnS+q2EVB2WHg1+G7y49r5yXbrtOX0FVcdANs/m0VFSiRRByphdCp3iipKYTMfR2adp0ms1Dts0ONXL31jHk6LZyDqsjNJfXJT3Tb5Eo/P1CfbsSXb7WkdAmhsHHESGtQIP76thMsggj+Kp+GFdaDkvwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npT/K1HB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npT/K1HB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765866635; x=1797402635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=caW85dJssnXMUQwTaxj47W5KTeAnRQzB3ILQfDFWr4I=;
  b=npT/K1HBztT8k6z0pL1apC9M2CnVGYGPeNyh52l+yC9lgdp2soaolMeP
   M7blpY+HCrtZjCMQOioASnk9FA0efsyCMzR1swSSdIHSRWSRWNMIqwqa2
   JXYQZ07Kfh5J+8NP+ejPqIWM2UHhShMJGVXsM0SgzywQzqxmH+8SmR4ZS
   YupNH6xVzRflKhnSB/vhH+gZ1SRgLAcOiPT4ZW8jw2K/QFlC2g/snbQQ6
   SysLbzYf64ruDjjRWQwu7ECx/5J2mFrg2CglJdzLq31ro8qrZlmbHtTmy
   mZyR7yXIp53qy7JpdpysZ1O7GJ+wirBqwryUCoCi2YEUtwMVgy46IEJvS
   Q==;
X-CSE-ConnectionGUID: az1OaslLTsyyQm1gpP2qAA==
X-CSE-MsgGUID: RoTalSjOTQuFNyqq1m9LNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66765605"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="66765605"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 22:30:29 -0800
X-CSE-ConnectionGUID: eJmQZk+DQ3+IZ2RMN6S80A==
X-CSE-MsgGUID: ZcQ8O+SWR+ubj9r2aUmoZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197213659"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Dec 2025 22:30:21 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVOZe-000000001FF-3x6a;
	Tue, 16 Dec 2025 06:30:18 +0000
Date: Tue, 16 Dec 2025 14:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
	wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
	sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
	akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
	ankur.a.arora@oracle.com, segher@kernel.crashing.org,
	tglx@linutronix.de, thomas.weissschuh@linutronix.de,
	peterz@infradead.org, menglong8.dong@gmail.com,
	bigeasy@linutronix.de, namcao@linutronix.de, mingo@kernel.org,
	atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 7/8] powerpc: Enable IRQ generic entry/exit path.
Message-ID: <202512161441.xlMhHxvl-lkp@intel.com>
References: <20251214130245.43664-8-mkchauras@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214130245.43664-8-mkchauras@linux.ibm.com>

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya/powerpc-rename-arch_irq_disabled_regs/20251214-210813
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251214130245.43664-8-mkchauras%40linux.ibm.com
patch subject: [PATCH v2 7/8] powerpc: Enable IRQ generic entry/exit path.
config: powerpc-randconfig-r072-20251215 (https://download.01.org/0day-ci/archive/20251216/202512161441.xlMhHxvl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161441.xlMhHxvl-lkp@intel.com/

smatch warnings:
arch/powerpc/include/asm/entry-common.h:433 arch_enter_from_user_mode() warn: inconsistent indenting

vim +433 arch/powerpc/include/asm/entry-common.h

2b0f05f77f11f8 Mukesh Kumar Chaurasiya 2025-12-14  396  
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  397  static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  398  {
37ad0d88d9bff7 Mukesh Kumar Chaurasiya 2025-12-14  399  	kuap_lock();
37ad0d88d9bff7 Mukesh Kumar Chaurasiya 2025-12-14  400  
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  401  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  402  		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  403  
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  404  	BUG_ON(regs_is_unrecoverable(regs));
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  405  	BUG_ON(!user_mode(regs));
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  406  	BUG_ON(regs_irqs_disabled(regs));
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  407  
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  408  #ifdef CONFIG_PPC_PKEY
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  409  	if (mmu_has_feature(MMU_FTR_PKEY) && trap_is_syscall(regs)) {
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  410  		unsigned long amr, iamr;
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  411  		bool flush_needed = false;
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  412  		/*
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  413  		 * When entering from userspace we mostly have the AMR/IAMR
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  414  		 * different from kernel default values. Hence don't compare.
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  415  		 */
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  416  		amr = mfspr(SPRN_AMR);
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  417  		iamr = mfspr(SPRN_IAMR);
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  418  		regs->amr  = amr;
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  419  		regs->iamr = iamr;
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  420  		if (mmu_has_feature(MMU_FTR_KUAP)) {
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  421  			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  422  			flush_needed = true;
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  423  		}
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  424  		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  425  			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  426  			flush_needed = true;
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  427  		}
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  428  		if (flush_needed)
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  429  			isync();
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  430  	} else
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  431  #endif
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  432  		kuap_assert_locked();
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14 @433  	booke_restore_dbcr0();
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  434  	account_cpu_user_entry();
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  435  	account_stolen_time();
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  436  
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  437  	/*
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  438  	 * This is not required for the syscall exit path, but makes the
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  439  	 * stack frame look nicer. If this was initialised in the first stack
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  440  	 * frame, or if the unwinder was taught the first stack frame always
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  441  	 * returns to user with IRQS_ENABLED, this store could be avoided!
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  442  	 */
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  443  	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  444  
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  445  	/*
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  446  	 * If system call is called with TM active, set _TIF_RESTOREALL to
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  447  	 * prevent RFSCV being used to return to userspace, because POWER9
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  448  	 * TM implementation has problems with this instruction returning to
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  449  	 * transactional state. Final register values are not relevant because
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  450  	 * the transaction will be aborted upon return anyway. Or in the case
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  451  	 * of unsupported_scv SIGILL fault, the return state does not much
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  452  	 * matter because it's an edge case.
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  453  	 */
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  454  	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  455  	    unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  456  		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  457  
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  458  	/*
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  459  	 * If the system call was made with a transaction active, doom it and
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  460  	 * return without performing the system call. Unless it was an
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  461  	 * unsupported scv vector, in which case it's treated like an illegal
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  462  	 * instruction.
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  463  	 */
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  464  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  465  	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  466  	    !trap_is_unsupported_scv(regs)) {
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  467  		/* Enable TM in the kernel, and disable EE (for scv) */
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  468  		hard_irq_disable();
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  469  		mtmsr(mfmsr() | MSR_TM);
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  470  
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  471  		/* tabort, this dooms the transaction, nothing else */
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  472  		asm volatile(".long 0x7c00071d | ((%0) << 16)"
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  473  			     :: "r"(TM_CAUSE_SYSCALL | TM_CAUSE_PERSISTENT));
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  474  
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  475  		/*
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  476  		 * Userspace will never see the return value. Execution will
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  477  		 * resume after the tbegin. of the aborted transaction with the
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  478  		 * checkpointed register state. A context switch could occur
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  479  		 * or signal delivered to the process before resuming the
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  480  		 * doomed transaction context, but that should all be handled
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  481  		 * as expected.
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  482  		 */
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  483  		return;
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  484  	}
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  485  #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  486  }
1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
