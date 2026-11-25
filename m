Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638692;
	b=BzeI9xRmaNqAi31hFfXeBns4BOmIYpmUxOUYByxFSiC9nx+QhtJxQSSY5LT7ZD1pdx5X
	 Ca19ueOIsKtTNe3MudUJk4yr76oVgOjYERWEVs/eMiy0qvshAM8kUw7EfGK8xuQZtG/37
	 NULJH49FvElsAR+EngCZEEfiWfSeBwdYUDCUd1zmR7PQ2ymA756UBhofifzBRDV5ZJ6cX
	 h/EvalETrB/GV3Dgvi4XiDYTum5s4x6ixTfVblArgJA96bOW9Z/w2uhTaqSduamfpczBJ
	 jHilWOHlypkVh0Y81Riyqb4coMAK9cWGpBljvpDwMg7fAElrwOFVV5c3Rj+DQJrCUlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638692;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Z4CXSGRiOXdcfZi1N7q99VT0l/djWWLvBGE9k6yufJg=;
	b=Ug3if+gD3D+8yS6opIwk7cIVOwiNqQlLzEr3cvYIjhNs/ZrFjM4SOSoxhVA2iirBTshU
	 S00sFcGcvqaYEi9Fxr3sxz3TulXpfX6+aYhMDXysEEIdtNGy4O7l56vVrxKTqgoDUX/Eh
	 yeIdASCK8/VekPYmsxS/pU8fhu5pUp6nk68spf9/D3Qd3cQPHHWBq1o4iqT+GSWzWdn3U
	 vX7AJ4+XEGqpG6bvVwzwoOZErfPAeTJONfkPRAkGaiLlfPeaaeOJ1KlMYdRGjsm1jYzyJ
	 OO8ZfPScCO6vz7lrOYVdC6Ef7CCa6hBb586Wc+yaL9xl9KKNQeXBfNay/tpZvz5Q0wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F8eWcMVV;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B8D606A326
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 20:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B8D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F8eWcMVV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795638692; x=1827174692;
  h=date:from:to:cc:subject:message-id;
  bh=QN8BSs3mRngRDncuvQaS9AzJIhoGnhaIKIdVAClQx4U=;
  b=F8eWcMVVQM1DPXy/MmMYdHv705dqn8BiJaj9t0lhj3FKGsk3WqooOiEK
   Vr24Sslj0d8S/QJpgK/3YxPgiFN2NuL+547fn3Dmfr6mbu3KsFoaeAxd1
   pekHsh65Gr2kabzn2bpp8mQn2Tu/onhbptp6PG8weRkQv7fIecN0LpjO2
   P9TXBkdjCmRl9td9TbmYZpyiW5faoFKXOASC5T+BeDINk1ZPOR2f0Fxi9
   pvKoBt6D1qUcJtnm1Y5yMXpNm5hsF48pY0Z3sAYLUyzbfZlp+JR/SYN7+
   35TL97raHeW6isG1m1BGBI86nnFnXj3BDRltO7RetgtqG2W7EvbrLXoV8
   w==;
X-CSE-ConnectionGUID: Rw1VtbXkSNeDvcfKDfTyfQ==
X-CSE-MsgGUID: BNfZ0mK+SSa8MCJbgRbSrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4420391"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4420391"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:51:10 -0800
X-CSE-ConnectionGUID: JDxOe0ggQwGvoYjQgkpZvA==
X-CSE-MsgGUID: RhUX+HeOSaGmQGQJXWcFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11741340"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2026 11:51:06 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWJ1A-0000000004v-2nIU;
	Wed, 25 Nov 2026 19:51:00 +0000
Date: Wed, 25 Nov 2026 20:50:07 +0100
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: arch/powerpc/include/asm/entry-common.h:450:15: warning:
 shift count >= width of type
Message-ID: <20261125204519.K0a0uXVo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4dce97c6c265544342e716e62fd24bbb232590c5
commit: bee25f97ad24641df55cb3887eb5bfcb2b9d8fbc powerpc: Enable GENERIC_ENTRY feature
date:   6 months ago
config: powerpc-randconfig-r2303-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125204519.K0a0uXVo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125204519.K0a0uXVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125204519.K0a0uXVo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/xmon/xmon.c:54:
   In file included from arch/powerpc/include/asm/interrupt.h:70:
   In file included from include/linux/irq-entry-common.h:14:
>> arch/powerpc/include/asm/entry-common.h:450:15: warning: shift count >= width of type [-Wshift-count-overflow]
     450 |             unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
         |             ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/reg.h:121:41: note: expanded from macro 'MSR_TM_TRANSACTIONAL'
     121 | #define MSR_TM_TRANSACTIONAL(x) (((x) & MSR_TS_MASK) == MSR_TS_T)
         |                                         ^
   arch/powerpc/include/asm/reg.h:119:22: note: expanded from macro 'MSR_TS_MASK'
     119 | #define MSR_TS_MASK     (MSR_TS_T | MSR_TS_S)   /* Transaction State bits */
         |                          ^
   arch/powerpc/include/asm/reg.h:118:18: note: expanded from macro 'MSR_TS_T'
     118 | #define MSR_TS_T        __MASK(MSR_TS_T_LG)     /*  Transaction Transactional */
         |                         ^
   arch/powerpc/include/asm/reg.h:66:23: note: expanded from macro '__MASK'
      66 | #define __MASK(X)       (1UL<<(X))
         |                             ^
   include/linux/compiler.h:47:68: note: expanded from macro 'unlikely'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:34:19: note: expanded from macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   In file included from arch/powerpc/xmon/xmon.c:54:
   In file included from arch/powerpc/include/asm/interrupt.h:70:
   In file included from include/linux/irq-entry-common.h:14:
>> arch/powerpc/include/asm/entry-common.h:450:15: warning: shift count >= width of type [-Wshift-count-overflow]
     450 |             unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
         |             ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/reg.h:121:41: note: expanded from macro 'MSR_TM_TRANSACTIONAL'
     121 | #define MSR_TM_TRANSACTIONAL(x) (((x) & MSR_TS_MASK) == MSR_TS_T)
         |                                         ^
   arch/powerpc/include/asm/reg.h:119:33: note: expanded from macro 'MSR_TS_MASK'
     119 | #define MSR_TS_MASK     (MSR_TS_T | MSR_TS_S)   /* Transaction State bits */
         |                                     ^
   arch/powerpc/include/asm/reg.h:117:18: note: expanded from macro 'MSR_TS_S'
     117 | #define MSR_TS_S        __MASK(MSR_TS_S_LG)     /*  Transaction Suspended */
         |                         ^
   arch/powerpc/include/asm/reg.h:66:23: note: expanded from macro '__MASK'
      66 | #define __MASK(X)       (1UL<<(X))
         |                             ^
   include/linux/compiler.h:47:68: note: expanded from macro 'unlikely'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:34:19: note: expanded from macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   In file included from arch/powerpc/xmon/xmon.c:54:
   In file included from arch/powerpc/include/asm/interrupt.h:70:
   In file included from include/linux/irq-entry-common.h:14:
>> arch/powerpc/include/asm/entry-common.h:450:15: warning: shift count >= width of type [-Wshift-count-overflow]
     450 |             unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
         |             ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/reg.h:121:57: note: expanded from macro 'MSR_TM_TRANSACTIONAL'
     121 | #define MSR_TM_TRANSACTIONAL(x) (((x) & MSR_TS_MASK) == MSR_TS_T)
         |                                                         ^
   arch/powerpc/include/asm/reg.h:118:18: note: expanded from macro 'MSR_TS_T'
     118 | #define MSR_TS_T        __MASK(MSR_TS_T_LG)     /*  Transaction Transactional */
         |                         ^
   arch/powerpc/include/asm/reg.h:66:23: note: expanded from macro '__MASK'
      66 | #define __MASK(X)       (1UL<<(X))
         |                             ^
   include/linux/compiler.h:47:68: note: expanded from macro 'unlikely'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:34:19: note: expanded from macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   arch/powerpc/xmon/xmon.c:3262:3: warning: unsequenced accesses to volatile qualified 'tsk' [-Wunsequenced-volatile]
    3261 |         printf("%16px %16lx %16px %6d %6d %c %2d %s\n", tsk,
         |                                                         ~~~
    3262 |                 tsk->thread.ksp, tsk->thread.regs,
         |                 ^
   4 warnings generated.


vim +450 arch/powerpc/include/asm/entry-common.h

893082ac769ba9 Mukesh Kumar Chaurasiya 2026-04-27  391  
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  392  static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  393  {
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  394  	kuap_lock();
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  395  
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  396  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  397  		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  398  
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  399  	BUG_ON(regs_is_unrecoverable(regs));
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  400  	BUG_ON(!user_mode(regs));
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  401  	BUG_ON(regs_irqs_disabled(regs));
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  402  
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  403  #ifdef CONFIG_PPC_PKEY
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  404  	if (mmu_has_feature(MMU_FTR_PKEY) && trap_is_syscall(regs)) {
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  405  		unsigned long amr, iamr;
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  406  		bool flush_needed = false;
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  407  		/*
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  408  		 * When entering from userspace we mostly have the AMR/IAMR
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  409  		 * different from kernel default values. Hence don't compare.
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  410  		 */
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  411  		amr = mfspr(SPRN_AMR);
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  412  		iamr = mfspr(SPRN_IAMR);
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  413  		regs->amr  = amr;
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  414  		regs->iamr = iamr;
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  415  		if (mmu_has_feature(MMU_FTR_KUAP)) {
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  416  			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  417  			flush_needed = true;
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  418  		}
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  419  		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  420  			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  421  			flush_needed = true;
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  422  		}
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  423  		if (flush_needed)
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  424  			isync();
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  425  	}
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  426  #endif
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  427  	kuap_assert_locked();
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  428  	booke_restore_dbcr0();
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  429  	account_cpu_user_entry();
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  430  	account_stolen_time();
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  431  
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  432  	/*
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  433  	 * This is not required for the syscall exit path, but makes the
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  434  	 * stack frame look nicer. If this was initialised in the first stack
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  435  	 * frame, or if the unwinder was taught the first stack frame always
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  436  	 * returns to user with IRQS_ENABLED, this store could be avoided!
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  437  	 */
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  438  	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  439  
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  440  	/*
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  441  	 * If system call is called with TM active, set _TIF_RESTOREALL to
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  442  	 * prevent RFSCV being used to return to userspace, because POWER9
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  443  	 * TM implementation has problems with this instruction returning to
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  444  	 * transactional state. Final register values are not relevant because
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  445  	 * the transaction will be aborted upon return anyway. Or in the case
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  446  	 * of unsupported_scv SIGILL fault, the return state does not much
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  447  	 * matter because it's an edge case.
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  448  	 */
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  449  	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27 @450  	    unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  451  		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  452  
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  453  	/*
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  454  	 * If the system call was made with a transaction active, doom it and
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  455  	 * return without performing the system call. Unless it was an
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  456  	 * unsupported scv vector, in which case it's treated like an illegal
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  457  	 * instruction.
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  458  	 */
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  459  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  460  	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  461  	    !trap_is_unsupported_scv(regs)) {
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  462  		/* Enable TM in the kernel, and disable EE (for scv) */
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  463  		hard_irq_disable();
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  464  		mtmsr(mfmsr() | MSR_TM);
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  465  
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  466  		/* tabort, this dooms the transaction, nothing else */
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  467  		asm volatile(".long 0x7c00071d | ((%0) << 16)"
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  468  			     :: "r"(TM_CAUSE_SYSCALL | TM_CAUSE_PERSISTENT));
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  469  
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  470  		/*
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  471  		 * Userspace will never see the return value. Execution will
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  472  		 * resume after the tbegin. of the aborted transaction with the
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  473  		 * checkpointed register state. A context switch could occur
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  474  		 * or signal delivered to the process before resuming the
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  475  		 * doomed transaction context, but that should all be handled
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  476  		 * as expected.
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  477  		 */
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  478  		return;
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  479  	}
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  480  #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  481  }
09a9d3a8499db6 Mukesh Kumar Chaurasiya 2026-04-27  482  

:::::: The code at line 450 was first introduced by commit
:::::: 09a9d3a8499db606563eb5e75a993419f4d1901e powerpc: introduce arch_enter_from_user_mode

:::::: TO: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
:::::: CC: Madhavan Srinivasan <maddy@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
