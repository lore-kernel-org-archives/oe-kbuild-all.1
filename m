Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC053191BB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847159; cv=none; b=l9jmzatsl0edyhukS0Nn5xDAfPYcP4oKSbnZX9lzjnBdkTzkTuye1Wl26XV+YjTh5CZAXq7UA4FW6M0Wb1Wx/VH8nXfnUpKiwEeuNMDPB+H7Uwy1FlEPSdRh02oqNL9QbS4za6vut1IAmboRISrj+6s1oWFUSopg9oJqT2yi1No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847159; c=relaxed/simple;
	bh=D4u4YmK/xt/IJQiaMSczs8eNtF0Mqij4DICsiu7nOKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u7TJwvCOmWaugyf11kZ9a+bPVl56gl4OVulBD1nStgXA4YgZYr/SBNoEcImYNV8EMuM1hMi5JVrVLM2zupag+UhYI2pZSM1QqK2SYQdQgFfyvy1OJgBQ9zWRejZ8iQIFBCWWs1AK3EwWBm/uzqOdWbTZMVaU7VgbaZ79qFvKoig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jr7nwvV0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jr7nwvV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785847157; x=1817383157;
  h=date:from:to:cc:subject:message-id;
  bh=D4u4YmK/xt/IJQiaMSczs8eNtF0Mqij4DICsiu7nOKc=;
  b=Jr7nwvV0eWYFOaTSs2KD3Dj7KLmsbV/GWs0tFEl41uOpdu0fz9Y/fDWB
   FrUohXjBhDZ+LvY+tIXGDvHva7L6gVNDcOQAbPhkONEfs0o5K4K+IjxQJ
   BBimPKXRgjdyLb6jDpBl7p5jcb54PyliNkyq/XikZcJ1z8FkaevGfa2TQ
   mc+5iCWv8hBpywXM7mgYvmkhzqMqKeZvcHc33GLYZf5j6GTrIR5EtFpSE
   HzdsqAZK4P6/qQOTFgnEkWGNuy/9zYIidLuf6CMWUEhQhs9ho7QQxt3Cl
   3WDGF26VuTOdJ2+CUr1IPQVEveGIqLNZV/xxNFBXkhyFi+yzIbR/CXxUS
   w==;
X-CSE-ConnectionGUID: 7I60H0baRcK3YdvqeH0bXg==
X-CSE-MsgGUID: LVSPnzfwTB6AYvcC37P5DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86271876"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86271876"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 05:39:16 -0700
X-CSE-ConnectionGUID: CzLr3wfcT6+HDb7kR0wVGw==
X-CSE-MsgGUID: IPMdgSJEQSesHzU9XdkapA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="291431795"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2026 05:39:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrEQJ-000000009rk-46EV;
	Tue, 04 Aug 2026 12:39:11 +0000
Date: Tue, 04 Aug 2026 20:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/percpu-fixup 11/18]
 arch/arm64/kernel/entry.S:204: Error: expected an integer or zero register at
 operand 1 -- `ldrh w,[,#320]'
Message-ID: <202608042009.ZPYWHDmV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/percpu-fixup
head:   9e0b9ccad924850288def352da05df0b54fb8aa8
commit: 636f49109b313ff05fac31d2d369c535b399d9a1 [11/18] arm64: percpu: Add infrastructure for preemptible this_cpu_*() ops
config: arm64-randconfig-003-20260804 (https://download.01.org/0day-ci/archive/20260804/202608042009.ZPYWHDmV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608042009.ZPYWHDmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608042009.ZPYWHDmV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry.S: Assembler messages:
>> arch/arm64/kernel/entry.S:204: Error: expected an integer or zero register at operand 1 -- `ldrh w,[,#320]'
   arch/arm64/kernel/entry.S:1064:  Info: macro invoked from here
>> arch/arm64/kernel/entry.S:205: Error: expected an integer or zero register at operand 1 -- `strh w,[tsk,#20]'
   arch/arm64/kernel/entry.S:1064:  Info: macro invoked from here


vim +204 arch/arm64/kernel/entry.S

    32	
    33		.macro	clear_gp_regs
    34		.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
    35		mov	x\n, xzr
    36		.endr
    37		.endm
    38	
    39		.macro kernel_ventry, el:req, ht:req, regsize:req, label:req
    40		.align 7
    41	.Lventry_start\@:
    42		.if	\el == 0
    43		/*
    44		 * This must be the first instruction of the EL0 vector entries. It is
    45		 * skipped by the trampoline vectors, to trigger the cleanup.
    46		 */
    47		b	.Lskip_tramp_vectors_cleanup\@
    48		.if	\regsize == 64
    49		mrs	x30, tpidrro_el0
    50		msr	tpidrro_el0, xzr
    51		.else
    52		mov	x30, xzr
    53		.endif
    54	.Lskip_tramp_vectors_cleanup\@:
    55		.endif
    56	
    57		sub	sp, sp, #PT_REGS_SIZE
    58		/*
    59		 * Test whether the SP has overflowed, without corrupting a GPR.
    60		 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
    61		 * should always be zero.
    62		 */
    63		add	sp, sp, x0			// sp' = sp + x0
    64		sub	x0, sp, x0			// x0' = sp' - x0 = (sp + x0) - x0 = sp
    65		tbnz	x0, #THREAD_SHIFT, 0f
    66		sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
    67		sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
    68		b	el\el\ht\()_\regsize\()_\label
    69	
    70	0:
    71		/*
    72		 * Either we've just detected an overflow, or we've taken an exception
    73		 * while on the overflow stack. Either way, we won't return to
    74		 * userspace, and can clobber EL0 registers to free up GPRs.
    75		 */
    76	
    77		/* Stash the original SP (minus PT_REGS_SIZE) in tpidr_el0. */
    78		msr	tpidr_el0, x0
    79	
    80		/* Recover the original x0 value and stash it in tpidrro_el0 */
    81		sub	x0, sp, x0
    82		msr	tpidrro_el0, x0
    83	
    84		/* Switch to the overflow stack */
    85		adr_this_cpu sp, overflow_stack + OVERFLOW_STACK_SIZE, x0
    86	
    87		/*
    88		 * Check whether we were already on the overflow stack. This may happen
    89		 * after panic() re-enables interrupts.
    90		 */
    91		mrs	x0, tpidr_el0			// sp of interrupted context
    92		sub	x0, sp, x0			// delta with top of overflow stack
    93		tst	x0, #~(OVERFLOW_STACK_SIZE - 1)	// within range?
    94		b.ne	__bad_stack			// no? -> bad stack pointer
    95	
    96		/* We were already on the overflow stack. Restore sp/x0 and carry on. */
    97		sub	sp, sp, x0
    98		mrs	x0, tpidrro_el0
    99		b	el\el\ht\()_\regsize\()_\label
   100	.org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
   101		.endm
   102	
   103		.macro	tramp_alias, dst, sym
   104		.set	.Lalias\@, TRAMP_VALIAS + \sym - .entry.tramp.text
   105		movz	\dst, :abs_g2_s:.Lalias\@
   106		movk	\dst, :abs_g1_nc:.Lalias\@
   107		movk	\dst, :abs_g0_nc:.Lalias\@
   108		.endm
   109	
   110		/*
   111		 * This macro corrupts x0-x3. It is the caller's duty  to save/restore
   112		 * them if required.
   113		 */
   114		.macro	apply_ssbd, state, tmp1, tmp2
   115	alternative_cb	ARM64_ALWAYS_SYSTEM, spectre_v4_patch_fw_mitigation_enable
   116		b	.L__asm_ssbd_skip\@		// Patched to NOP
   117	alternative_cb_end
   118		ldr_this_cpu	\tmp2, arm64_ssbd_callback_required, \tmp1
   119		cbz	\tmp2,	.L__asm_ssbd_skip\@
   120		ldr	\tmp2, [tsk, #TSK_TI_FLAGS]
   121		tbnz	\tmp2, #TIF_SSBD, .L__asm_ssbd_skip\@
   122		mov	w0, #ARM_SMCCC_ARCH_WORKAROUND_2
   123		mov	w1, #\state
   124	alternative_cb	ARM64_ALWAYS_SYSTEM, smccc_patch_fw_mitigation_conduit
   125		nop					// Patched to SMC/HVC #0
   126	alternative_cb_end
   127	.L__asm_ssbd_skip\@:
   128		.endm
   129	
   130		/* Check for MTE asynchronous tag check faults */
   131		.macro check_mte_async_tcf, tmp, ti_flags, thread_sctlr
   132	#ifdef CONFIG_ARM64_MTE
   133		.arch_extension lse
   134	alternative_if_not ARM64_MTE
   135		b	1f
   136	alternative_else_nop_endif
   137		/*
   138		 * Asynchronous tag check faults are only possible in ASYNC (2) or
   139		 * ASYM (3) modes. In each of these modes bit 1 of SCTLR_EL1.TCF0 is
   140		 * set, so skip the check if it is unset.
   141		 */
   142		tbz	\thread_sctlr, #(SCTLR_EL1_TCF0_SHIFT + 1), 1f
   143		mrs_s	\tmp, SYS_TFSRE0_EL1
   144		tbz	\tmp, #SYS_TFSR_EL1_TF0_SHIFT, 1f
   145		/* Asynchronous TCF occurred for TTBR0 access, set the TI flag */
   146		mov	\tmp, #_TIF_MTE_ASYNC_FAULT
   147		add	\ti_flags, tsk, #TSK_TI_FLAGS
   148		stset	\tmp, [\ti_flags]
   149	1:
   150	#endif
   151		.endm
   152	
   153		/* Clear the MTE asynchronous tag check faults */
   154		.macro clear_mte_async_tcf thread_sctlr
   155	#ifdef CONFIG_ARM64_MTE
   156	alternative_if ARM64_MTE
   157		/* See comment in check_mte_async_tcf above. */
   158		tbz	\thread_sctlr, #(SCTLR_EL1_TCF0_SHIFT + 1), 1f
   159		dsb	ish
   160		msr_s	SYS_TFSRE0_EL1, xzr
   161	1:
   162	alternative_else_nop_endif
   163	#endif
   164		.endm
   165	
   166		.macro mte_set_gcr, mte_ctrl, tmp
   167	#ifdef CONFIG_ARM64_MTE
   168		ubfx	\tmp, \mte_ctrl, #MTE_CTRL_GCR_USER_EXCL_SHIFT, #16
   169		orr	\tmp, \tmp, #SYS_GCR_EL1_RRND
   170		msr_s	SYS_GCR_EL1, \tmp
   171	#endif
   172		.endm
   173	
   174		.macro mte_set_kernel_gcr, tmp, tmp2
   175	#ifdef CONFIG_KASAN_HW_TAGS
   176	alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
   177		b	1f
   178	alternative_cb_end
   179		mov	\tmp, KERNEL_GCR_EL1
   180		msr_s	SYS_GCR_EL1, \tmp
   181	1:
   182	#endif
   183		.endm
   184	
   185		.macro mte_set_user_gcr, tsk, tmp, tmp2
   186	#ifdef CONFIG_KASAN_HW_TAGS
   187	alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
   188		b	1f
   189	alternative_cb_end
   190		ldr	\tmp, [\tsk, #THREAD_MTE_CTRL]
   191	
   192		mte_set_gcr \tmp, \tmp2
   193	1:
   194	#endif
   195		.endm
   196	
   197		.macro pcpu_gprs_entry, tsk, regs, tmp
   198		ldrh	w\tmp, [\tsk, #TSK_TI_PCPU_GPRS]
   199		strh	w\tmp, [\regs, #S_PCPU_GPRS]
   200		strh	wzr, [\tsk, #TSK_TI_PCPU_GPRS]
   201		.endm
   202	
   203		.macro pcpu_gprs_exit, tsk, regs, tmp
 > 204		ldrh	w\tmp, [\regs, #S_PCPU_GPRS]
 > 205		strh	w\tmp, [\tsk, #TSK_TI_PCPU_GPRS]
   206		.endm
   207	
   208		.macro	kernel_entry, el, regsize = 64
   209		.if	\el == 0
   210		alternative_insn nop, SET_PSTATE_DIT(1), ARM64_HAS_DIT
   211		.endif
   212		.if	\regsize == 32
   213		mov	w0, w0				// zero upper 32 bits of x0
   214		.endif
   215		stp	x0, x1, [sp, #16 * 0]
   216		stp	x2, x3, [sp, #16 * 1]
   217		stp	x4, x5, [sp, #16 * 2]
   218		stp	x6, x7, [sp, #16 * 3]
   219		stp	x8, x9, [sp, #16 * 4]
   220		stp	x10, x11, [sp, #16 * 5]
   221		stp	x12, x13, [sp, #16 * 6]
   222		stp	x14, x15, [sp, #16 * 7]
   223		stp	x16, x17, [sp, #16 * 8]
   224		stp	x18, x19, [sp, #16 * 9]
   225		stp	x20, x21, [sp, #16 * 10]
   226		stp	x22, x23, [sp, #16 * 11]
   227		stp	x24, x25, [sp, #16 * 12]
   228		stp	x26, x27, [sp, #16 * 13]
   229		stp	x28, x29, [sp, #16 * 14]
   230	
   231		.if	\el == 0
   232		clear_gp_regs
   233		mrs	x21, sp_el0
   234		ldr_this_cpu	tsk, __entry_task, x20
   235		msr	sp_el0, tsk
   236	
   237		/*
   238		 * Ensure MDSCR_EL1.SS is clear, since we can unmask debug exceptions
   239		 * when scheduling.
   240		 */
   241		ldr	x19, [tsk, #TSK_TI_FLAGS]
   242		disable_step_tsk x19, x20
   243	
   244		/* Check for asynchronous tag check faults in user space */
   245		ldr	x0, [tsk, THREAD_SCTLR_USER]
   246		check_mte_async_tcf x22, x23, x0
   247	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
