Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EA51C765
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683802085; x=1715338085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ksDcN8y+82IlxhKRJxQiAvF7+43WgDGIwWslGfSfjIw=;
  b=Vy+cKiUlMV2B9Vtts34S/4efeI+2gKB7TP8Zqf2i1vsz/Vg5qmZtafOb
   T0ARi46dIKLcol7919YDi2CmNNuVJX5ufWBWB20hKSnRsuO7sHECIInt6
   fShHdmhGV1dTd8JjVh9unKMt/cWIfivmmrB20gFJTzyxNTGiHyPAfapk+
   xZa5sWZ6BuTsMCLhsevjt7SFCMRB+tzShdfUO36HpZsrv/PMmeO8NPe1n
   nW0iYxAWbQjRLDsc5BXDPzkPc9HO43/r9WBmJU7ydf1qA5a7da1/yZyAJ
   mvgg39QqyS4dr3YvmXaSaTjcaTQJWoskf4iC2ynQxzQbsTizluy7nE52l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436795231"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="436795231"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 03:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="843899860"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="843899860"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 May 2023 03:48:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px3q6-0003xo-0A;
	Thu, 11 May 2023 10:48:02 +0000
Date: Thu, 11 May 2023 18:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 295/341]
 arch/x86/virt/vmx/tdx/tdx_module_loader_old/np-seamldr.S:153: Error: no such
 instruction: `unwind_hint_empty'
Message-ID: <202305111853.31ppFr0k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   a8ba58bfbd61bb49f204238176ff563405f400a7
commit: fdb1f8cc8bf06007d6e88e30ace7373d93290044 [295/341] [REVERTME] x86/virt/tdx: Boot-time tdx module loading
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230511/202305111853.31ppFr0k-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/fdb1f8cc8bf06007d6e88e30ace7373d93290044
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout fdb1f8cc8bf06007d6e88e30ace7373d93290044
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111853.31ppFr0k-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/virt/vmx/tdx/tdx_module_loader_old/np-seamldr.S: Assembler messages:
>> arch/x86/virt/vmx/tdx/tdx_module_loader_old/np-seamldr.S:153: Error: no such instruction: `unwind_hint_empty'
   arch/x86/virt/vmx/tdx/tdx_module_loader_old/np-seamldr.S:167: Error: no such instruction: `unwind_hint_empty'


vim +153 arch/x86/virt/vmx/tdx/tdx_module_loader_old/np-seamldr.S

    14	
    15	/*
    16	 * u64 np_seamldr_launch(unsigned long seamldr_pa, unsigned long seamldr_size)
    17	 * Launch the NP-SEAMLDR by invoking the GETSEC[EnterACCS] instruction.
    18	 *
    19	 * @seamldr_pa(EDI): Physical address of the NP-SEAMLDR < 4GB
    20	 * @seamldr_size(ESI): Size of seamldr
    21	 * @return(RAX): 0 on success, seamldr error code on failure,
    22	 *               -EFAULT on exception
    23	 *
    24	 * The caller must saves/restores DR7 and the following MSRs:
    25	 *   IA32_MISC_ENABLE, IA32_EFER, IA32_PAT, IA32_DEBUGCTL, IA32_PEBS_ENABLE,
    26	 *   IA32_RTIT_CTRL, IA32_LBR_CTL
    27	 *
    28	 * The CPU state after GETSEC[EnterACC] to execute NP-SEAMLDR ACM.
    29	 * CR0: PE=1, PG=1, NE=1; other bits cleared.
    30	 * CR3: As provided by OS in R11.
    31	 * CR4: PAE=1, SMXE=1; PGE and LA57 are unchanged; other bits cleared.
    32	 * RFLAGS: Reset value (0x2). Note that the interrupts are masked.
    33	 * IA32_EFER: LME=1, LMA=1, NXE=1; other bits cleared.
    34	 * IA32_PAT: Reset value (0x00070406_00070406).
    35	 *
    36	 * RIP: As provided by OS in R10.
    37	 * RAX: EXITAC leaf number (0x3).
    38	 * RBX: As Provided by OS in R10.
    39	 * R9: Load status returned by NP-SEAMLDR: success (0x0) or error code.
    40	 * Other GPRs, including RSP 0x0
    41	 *
    42	 * CS: Flat.  Its segment selector is clobbered.
    43	 * DS: Flat.  Its segment selector is clobbered.
    44	 * GDTR: Base = As provided by OS in R9; Limit unchanged.
    45	 * IDTR: Base = As provided by OS in R12; Limit unchanged.
    46	 * DR7: 0x400
    47	 * IA32_DEBUGCTL: 0x0
    48	 * IA32_PERF_GLOBAL_CTRL: 0x0
    49	 * IA32_PEBS_ENABLE: 0x0
    50	 * IA32_RTIT_CTRL: TraceEn = 0, other bits are unchanged.
    51	 * IA32_LBR_CTRL: 0x0
    52	 * IA32_MISC_ENABLES: 0x8 (only thermal throttling is enabled)
    53	 * Other registers (including MSRs, XCR0, XSAVES-able registers, DRs): Unchanged
    54	 *
    55	 * Save/restore the following registries:
    56	 *   CR0, CR3, CR4,
    57	 *   rflags,
    58	 * Restore segment registers. don't save them because they have known values.
    59	 *   DS, ES, CS, SS
    60	 * Note that the CR4.CET depends on CR0.WP, so we need restore CR0 then CR4,
    61	 * otherwise #GP when we restore CR4.CET if CR0.WP = 0
    62	 */
    63		.text
    64		__INIT
    65		.code64
    66	SYM_FUNC_START(np_seamldr_launch)
    67		pushq	%rbp
    68		movq	%rsp, %rbp
    69	
    70		/* Save the callee-saved registers. */
    71		pushq	%r15
    72		pushq	%r14
    73		pushq	%r13
    74		pushq	%r12
    75		pushq	%rbx
    76	
    77		/*
    78		 * The NP-SEAMLDR clobbers %rflags to the reset value. Save rflags to
    79		 * restore system/control flags and unmask interrupts later.
    80		 */
    81		pushfq
    82	
    83		rdgsbase %rax
    84		movq	%rax, np_seamldr_saved_gs_base(%rip)
    85	
    86		/*
    87		 * The NP-SEAMLDR unconditionally sets CR4.PCIDE = 0 and restores CR3
    88		 * from %r11.  If CR4.PCIDE = 0, CR3 bit 3 and bit 4 are interpreted as
    89		 * PWT and PCD, not as a part of CR3.PCID[0:11].  When changing
    90		 * CR4.PCIDE from 0 to 1 if CR3.PCID != 0, it results in #GP.
    91		 *
    92		 * Clear CR3.PCID = 0 to avoid interpreting CR3.{PWT, PCD} and to allow
    93		 * to set CR4.PCIDE from 0 to 1.
    94		 */
    95		movq	%cr3, %r11
    96		pushq	%r11
    97		andq	$~X86_CR3_PCID_MASK, %r11
    98	
    99		/* EnterACCS and the NP-SEAMLDR modify CR4 and CR0. */
   100		movq	%cr4, %rax
   101		/*
   102		 * If exception or interrupt happens before restoring CR0/CR4, fsgsbase
   103		 * feature is disabled.  The handler needs to restore CR0/CR4 from the
   104		 * global variable.
   105		 */
   106		movq	%rax, np_seamldr_saved_cr4(%rip)
   107		movq	%cr0, %rax
   108		movq	%rax, np_seamldr_saved_cr0(%rip)
   109	
   110		/* Enable CR4.SMXE for GETSEC. */
   111		movq	%cr4, %rax
   112		orq	$X86_CR4_SMXE, %rax
   113		movq	%rax, %cr4
   114	
   115		/*
   116		 * Load R9-R12 immediately, they won't be clobbered, unlike RDX.
   117		 * The SEAMLDR spec: 4.1 OS/VMM Loader steps to launch the NP-SEAMLDR
   118		 *
   119		 *  - R9: GDT base to be set up by the SEAMLDR when returning to the
   120		 *        kernel
   121		 *  - R10: RIP of resume point
   122		 *  - R11: CR3 with PCID=0 when returning to kernel (set above)
   123		 *  - R12: IDT to be set up by the NP-SEAMLDR when returning to the
   124		 *	   kernel
   125		 */
   126		sgdt	kernel_gdt64(%rip)
   127		movq	kernel_gdt64_base(%rip), %r9
   128		leaq	.Lseamldr_resume(%rip), %r10
   129		sidt	kernel_idt64(%rip)
   130		movq	kernel_idt64_base(%rip), %r12
   131	
   132		/* Save RSP before invoking GETSEC[EnterACCS] */
   133		movq	%rsp, saved_rsp(%rip)
   134		/* The frame unwinder requires valid %rbp to restore %rbp early. */
   135		movq	%rbp, saved_rbp(%rip)
   136	
   137		/*
   138		 * Load the remaining params for EnterACCS.
   139		 *
   140		 *  - EBX: NP-SEAMLDR ACM physical address
   141		 *  - ECX: NP-SEAMLDR ACM size
   142		 *  - EAX: 2=EnterACCS
   143		 */
   144		movl	%edi, %ebx
   145		movl	%esi, %ecx
   146	
   147		/* Invoke GETSEC[EnterACCS] */
   148		movl	$2, %eax
   149	.Lseamldr_enteraccs:
   150		getsec
   151	
   152	.Lseamldr_resume:
 > 153		UNWIND_HINT_EMPTY
   154	
   155	1:
   156		movq	$0x400, %rax
   157		movq	$0x0, %rdx
   158		movl	$0x830, %ecx
   159		wrmsr
   160	
   161		movq	$0x2, %rax
   162		movq	$0x0, %rdx
   163		movl	$0x83f, %ecx
   164		wrmsr
   165	
   166	2:
   167		UNWIND_HINT_EMPTY
   168		/*
   169		 * The NP-SEAMLDR restores CRs, GDT, and IDT.  Segment registers are
   170		 * flat, but don't necessarily hold valid kernel selectors.  Reload the
   171		 * data segment selectors now.
   172		 *
   173		 * CR4.MCE: Cleared.
   174		 * rflags: Reset state 0x2.  Interrupt is masked.
   175		 * %cs, %ds, %es, %ss: Clobbered. The descriptor cache has flat segment.
   176		 * %r9: Status code NP-SEAMLDR returns.
   177		 *
   178		 * NP-SEAMLDR loads flat segment descriptor cache with its GDT and
   179		 * restores OS GDT, but it doesn't restore segment selectors and leaves
   180		 * segment selectors clobbered.  If exception/interrupt happens before
   181		 * restoring CS/SS, the clobbered CS/SS are saved and the handler is
   182		 * invoked with CS from IDT.  The following iret trying to re-load
   183		 * clobbered CS/SS segment selector causes #GP.
   184		 *
   185		 * np_seamldr_die_notify() corrects the clobbered CR4 and the saved
   186		 * CS/SS so that nmi handler and iret work as expected.
   187		 */
   188		movl	$__KERNEL_DS, %eax
   189		movl	%eax, %ds
   190		movl	%eax, %es
   191		movl	%eax, %ss
   192	
   193		/*
   194		 * The frame unwinder requires valid %rbp.  Restore %rbp early before
   195		 * enabling machine check and unmasking interrupts.
   196		 */
   197		movq	saved_rbp(%rip), %rbp
   198	
   199		/*
   200		 * Restore stack from RIP relative storage, and then restore everything
   201		 * else from the stack.
   202		*/
   203		movq	saved_rsp(%rip), %rsp
   204		/*
   205		 * The objtool loses stack size due to no way to specify its stack size.
   206		 */
   207		UNWIND_HINT sp_reg=ORC_REG_SP sp_offset=8*9 type=UNWIND_HINT_TYPE_CALL
   208	
   209		/* Far return to load the kernel CS. */
   210		pushq	$__KERNEL_CS
   211		leaq	.Lkernel_cs(%rip), %rax
   212		pushq	%rax
   213		lretq
   214	.Lkernel_cs:
   215		UNWIND_HINT sp_reg=ORC_REG_SP sp_offset=8*9 type=UNWIND_HINT_TYPE_CALL
   216	
   217		/* Restore CPU status, in reverse order of saving. */
   218		movq	np_seamldr_saved_cr0(%rip), %rax
   219		movq	%rax, %cr0
   220		movq	$0, np_seamldr_saved_cr0(%rip)
   221	
   222		movq	np_seamldr_saved_cr4(%rip), %rax
   223		/* This changes CR4.PCIDE from 0 to 1, CR3.PCID must be 0.  Or #GP. */
   224		movq	%rax, %cr4
   225		movq	$0, np_seamldr_saved_cr4(%rip)
   226	
   227		popq	%rax
   228		movq	%rax, %cr3	/* Restore CR3.PCID */
   229	
   230		movq	np_seamldr_saved_gs_base(%rip), %rax
   231		wrgsbase %rax
   232		movq	$0, np_seamldr_saved_gs_base(%rip)
   233	
   234		popfq	/* Restore system/control flags and unmask interrupts. */
   235	
   236		movq	%r9, %rax	/* Return value from NP-SEAMLDR is in %r9 */
   237	
   238		/* Restore the callee-saved registers. */
   239		popq	%rbx
   240		popq	%r12
   241		popq	%r13
   242		popq	%r14
   243		popq	%r15
   244	
   245		popq	%rbp
   246	
   247		/* Workaround for objtool to lose the stack size. */
   248		UNWIND_HINT_FUNC
   249		ret
   250	
   251		/*
   252		 * The CPU doesn't clobber its state when an exception happens with
   253		 * GETSEC[EtnerACCS] because it does the exception check before
   254		 * switching to the ACM mode.  Although it's unnecessary to restore the
   255		 * not-clobbered registers, share the exit code path because this isn't
   256		 * a fast path.
   257		 *
   258		 * If the GETSEC[EnterACCS] instruction faulted, return -EFAULT.
   259		 * As NP-SEAMLDR stores the error code in %r9, store the error code to
   260		 * %r9 to share the exit path.
   261		 */
   262	1:
   263		movq	$-EFAULT, %r9
   264		jmp	2b
   265		_ASM_EXTABLE(.Lseamldr_enteraccs, 1b)
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
