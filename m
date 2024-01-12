Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8E6EB41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H49jkvap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705072661; x=1736608661;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1wkc6Ny2Krhmh/e7h+do8G0TkQn+t1UzOtJ6fwJxivs=;
  b=H49jkvapMxcrgLs1OBIXHj5F4UpvUc5WexaLw4yq9pklQtVs6cD5kCss
   oG12VKKYbT54Kcb3aYJgMC165kFRtrtdTt3ge7WGSzYYcPakY/QdIlnuU
   93ejyoOiR+TBicTxDIdSJy27HdHApu2EGHP/085DSLECSeZ1KdNoQIIrr
   8mdHCwP660j9ox+0IG/iVr+zYVGPmKLZWFhIbCasqVYLOU7vevutHMSKo
   fFf0epjGuwwu7naexv1oyVutByDSaeUS5QE2NhQGC29vMsS1k/bc6pUwT
   Ly1HbxDM/OxXkkQKqqrCrKiuhcKnjOn0e+H60qMkFavZTNQFTeIiXyB4n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="463480614"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="463480614"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 07:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="853316106"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="853316106"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jan 2024 07:17:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOJHt-0009bY-0H;
	Fri, 12 Jan 2024 15:17:37 +0000
Date: Fri, 12 Jan 2024 23:16:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15659/15708]
 arch/arm/mm/alignment.c:816:2: error: implicit declaration of function
 'mark_trap_entry' is invalid in C99
Message-ID: <202401122309.ALW8AA1g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: aa0b4997697a45275adce7baf2abc76a69973778 [15659/15708] ARM: dovetail: route traps
config: arm-randconfig-004-20240112 (https://download.01.org/0day-ci/archive/20240112/202401122309.ALW8AA1g-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401122309.ALW8AA1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401122309.ALW8AA1g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mm/alignment.c:816:2: error: implicit declaration of function 'mark_trap_entry' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mark_trap_entry(ARM_TRAP_ALIGNMENT, regs);
           ^
>> arch/arm/mm/alignment.c:816:18: error: use of undeclared identifier 'ARM_TRAP_ALIGNMENT'
           mark_trap_entry(ARM_TRAP_ALIGNMENT, regs);
                           ^
>> arch/arm/mm/alignment.c:1005:2: error: implicit declaration of function 'mark_trap_exit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mark_trap_exit(ARM_TRAP_ALIGNMENT, regs);
           ^
   arch/arm/mm/alignment.c:1005:2: note: did you mean 'mark_trap_entry'?
   arch/arm/mm/alignment.c:816:2: note: 'mark_trap_entry' declared here
           mark_trap_entry(ARM_TRAP_ALIGNMENT, regs);
           ^
   arch/arm/mm/alignment.c:1005:17: error: use of undeclared identifier 'ARM_TRAP_ALIGNMENT'
           mark_trap_exit(ARM_TRAP_ALIGNMENT, regs);
                          ^
   4 errors generated.
--
>> arch/arm/kernel/ptrace.c:208:2: error: implicit declaration of function 'mark_trap_entry' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mark_trap_entry(ARM_TRAP_BREAK, regs);
           ^
   arch/arm/kernel/ptrace.c:208:18: error: use of undeclared identifier 'ARM_TRAP_BREAK'
           mark_trap_entry(ARM_TRAP_BREAK, regs);
                           ^
>> arch/arm/kernel/ptrace.c:210:2: error: implicit declaration of function 'mark_trap_exit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mark_trap_exit(ARM_TRAP_BREAK, regs);
           ^
   arch/arm/kernel/ptrace.c:210:2: note: did you mean 'mark_trap_entry'?
   arch/arm/kernel/ptrace.c:208:2: note: 'mark_trap_entry' declared here
           mark_trap_entry(ARM_TRAP_BREAK, regs);
           ^
   arch/arm/kernel/ptrace.c:210:17: error: use of undeclared identifier 'ARM_TRAP_BREAK'
           mark_trap_exit(ARM_TRAP_BREAK, regs);
                          ^
   arch/arm/kernel/ptrace.c:855:16: warning: no previous prototype for function 'syscall_trace_enter' [-Wmissing-prototypes]
   asmlinkage int syscall_trace_enter(struct pt_regs *regs)
                  ^
   arch/arm/kernel/ptrace.c:855:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage int syscall_trace_enter(struct pt_regs *regs)
              ^
              static 
   arch/arm/kernel/ptrace.c:883:17: warning: no previous prototype for function 'syscall_trace_exit' [-Wmissing-prototypes]
   asmlinkage void syscall_trace_exit(struct pt_regs *regs)
                   ^
   arch/arm/kernel/ptrace.c:883:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void syscall_trace_exit(struct pt_regs *regs)
              ^
              static 
   2 warnings and 4 errors generated.


vim +/mark_trap_entry +816 arch/arm/mm/alignment.c

   799	
   800	static int
   801	do_alignment(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
   802	{
   803		union offset_union offset;
   804		unsigned long instrptr;
   805		int (*handler)(unsigned long addr, u32 instr, struct pt_regs *regs);
   806		unsigned int type;
   807		u32 instr = 0;
   808		u16 tinstr = 0;
   809		int isize = 4;
   810		int thumb2_32b = 0;
   811		int fault, ret = 0;
   812	
   813		if (interrupts_enabled(regs))
   814			hard_local_irq_enable();
   815	
 > 816		mark_trap_entry(ARM_TRAP_ALIGNMENT, regs);
   817	
   818		instrptr = instruction_pointer(regs);
   819	
   820		if (thumb_mode(regs)) {
   821			u16 *ptr = (u16 *)(instrptr & ~1);
   822	
   823			fault = alignment_get_thumb(regs, ptr, &tinstr);
   824			if (!fault) {
   825				if (cpu_architecture() >= CPU_ARCH_ARMv7 &&
   826				    IS_T32(tinstr)) {
   827					/* Thumb-2 32-bit */
   828					u16 tinst2;
   829					fault = alignment_get_thumb(regs, ptr + 1, &tinst2);
   830					instr = __opcode_thumb32_compose(tinstr, tinst2);
   831					thumb2_32b = 1;
   832				} else {
   833					isize = 2;
   834					instr = thumb2arm(tinstr);
   835				}
   836			}
   837		} else {
   838			fault = alignment_get_arm(regs, (void *)instrptr, &instr);
   839		}
   840	
   841		if (fault) {
   842			type = TYPE_FAULT;
   843			goto bad_or_fault;
   844		}
   845	
   846		if (user_mode(regs))
   847			goto user;
   848	
   849		ai_sys += 1;
   850		ai_sys_last_pc = (void *)instruction_pointer(regs);
   851	
   852	 fixup:
   853	
   854		regs->ARM_pc += isize;
   855	
   856		switch (CODING_BITS(instr)) {
   857		case 0x00000000:	/* 3.13.4 load/store instruction extensions */
   858			if (LDSTHD_I_BIT(instr))
   859				offset.un = (instr & 0xf00) >> 4 | (instr & 15);
   860			else
   861				offset.un = regs->uregs[RM_BITS(instr)];
   862	
   863			if ((instr & 0x000000f0) == 0x000000b0 || /* LDRH, STRH */
   864			    (instr & 0x001000f0) == 0x001000f0)   /* LDRSH */
   865				handler = do_alignment_ldrhstrh;
   866			else if ((instr & 0x001000f0) == 0x000000d0 || /* LDRD */
   867				 (instr & 0x001000f0) == 0x000000f0)   /* STRD */
   868				handler = do_alignment_ldrdstrd;
   869			else if ((instr & 0x01f00ff0) == 0x01000090) /* SWP */
   870				goto swp;
   871			else
   872				goto bad;
   873			break;
   874	
   875		case 0x04000000:	/* ldr or str immediate */
   876			if (COND_BITS(instr) == 0xf0000000) /* NEON VLDn, VSTn */
   877				goto bad;
   878			offset.un = OFFSET_BITS(instr);
   879			handler = do_alignment_ldrstr;
   880			break;
   881	
   882		case 0x06000000:	/* ldr or str register */
   883			offset.un = regs->uregs[RM_BITS(instr)];
   884	
   885			if (IS_SHIFT(instr)) {
   886				unsigned int shiftval = SHIFT_BITS(instr);
   887	
   888				switch(SHIFT_TYPE(instr)) {
   889				case SHIFT_LSL:
   890					offset.un <<= shiftval;
   891					break;
   892	
   893				case SHIFT_LSR:
   894					offset.un >>= shiftval;
   895					break;
   896	
   897				case SHIFT_ASR:
   898					offset.sn >>= shiftval;
   899					break;
   900	
   901				case SHIFT_RORRRX:
   902					if (shiftval == 0) {
   903						offset.un >>= 1;
   904						if (regs->ARM_cpsr & PSR_C_BIT)
   905							offset.un |= 1 << 31;
   906					} else
   907						offset.un = offset.un >> shiftval |
   908								  offset.un << (32 - shiftval);
   909					break;
   910				}
   911			}
   912			handler = do_alignment_ldrstr;
   913			break;
   914	
   915		case 0x08000000:	/* ldm or stm, or thumb-2 32bit instruction */
   916			if (thumb2_32b) {
   917				offset.un = 0;
   918				handler = do_alignment_t32_to_handler(&instr, regs, &offset);
   919			} else {
   920				offset.un = 0;
   921				handler = do_alignment_ldmstm;
   922			}
   923			break;
   924	
   925		default:
   926			goto bad;
   927		}
   928	
   929		if (!handler)
   930			goto bad;
   931		type = handler(addr, instr, regs);
   932	
   933		if (type == TYPE_ERROR || type == TYPE_FAULT) {
   934			regs->ARM_pc -= isize;
   935			goto bad_or_fault;
   936		}
   937	
   938		if (type == TYPE_LDST)
   939			do_alignment_finish_ldst(addr, instr, regs, offset);
   940	
   941		if (thumb_mode(regs))
   942			regs->ARM_cpsr = it_advance(regs->ARM_cpsr);
   943	
   944		goto out;
   945	
   946	 bad_or_fault:
   947		if (type == TYPE_ERROR)
   948			goto bad;
   949		/*
   950		 * We got a fault - fix it up, or die.
   951		 */
   952		do_bad_area(addr, fsr, regs);
   953		goto out;
   954	
   955	 swp:
   956		pr_err("Alignment trap: not handling swp instruction\n");
   957	
   958	 bad:
   959		/*
   960		 * Oops, we didn't handle the instruction.
   961		 */
   962		pr_err("Alignment trap: not handling instruction "
   963			"%0*x at [<%08lx>]\n",
   964			isize << 1,
   965			isize == 2 ? tinstr : instr, instrptr);
   966		ai_skipped += 1;
   967		ret = 1;
   968		goto out;
   969	
   970	 user:
   971		ai_user += 1;
   972	
   973		if (ai_usermode & UM_WARN)
   974			printk("Alignment trap: %s (%d) PC=0x%08lx Instr=0x%0*x "
   975			       "Address=0x%08lx FSR 0x%03x\n", current->comm,
   976				task_pid_nr(current), instrptr,
   977				isize << 1,
   978				isize == 2 ? tinstr : instr,
   979			        addr, fsr);
   980	
   981		if (ai_usermode & UM_FIXUP)
   982			goto fixup;
   983	
   984		if (ai_usermode & UM_SIGNAL) {
   985			force_sig_fault(SIGBUS, BUS_ADRALN, (void __user *)addr);
   986		} else {
   987			/*
   988			 * We're about to disable the alignment trap and return to
   989			 * user space.  But if an interrupt occurs before actually
   990			 * reaching user space, then the IRQ vector entry code will
   991			 * notice that we were still in kernel space and therefore
   992			 * the alignment trap won't be re-enabled in that case as it
   993			 * is presumed to be always on from kernel space.
   994			 * Let's prevent that race by disabling interrupts here (they
   995			 * are disabled on the way back to user space anyway in
   996			 * entry-common.S) and disable the alignment trap only if
   997			 * there is no work pending for this thread.
   998			 */
   999			hard_local_irq_disable();
  1000			if (!(read_thread_flags() & _TIF_WORK_MASK))
  1001				set_cr(cr_no_alignment);
  1002		}
  1003	
  1004	out:
> 1005		mark_trap_exit(ARM_TRAP_ALIGNMENT, regs);
  1006	
  1007		return ret;
  1008	}
  1009	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
