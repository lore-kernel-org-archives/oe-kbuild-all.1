Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA8BA50
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 00:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747267776; cv=none; b=hnOU/k/KEJcfXPyqOZAWYdcN22vegta2i0G0Ue7F3V2xB2EWAit6XnVR0vxNACOk3C51GD+VGf55cgx1gH/0M5sdU9v66Kpgzobl+E/4yHnqpLcZJBGnQNCUKLsBcRQ/wdYYUu4DiJer4wbEWRsmuUFwBp/ZXjr+rmtb7hZf8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747267776; c=relaxed/simple;
	bh=u5U8IBS0aj/yCkIaJ/fZu4+XiINvUVPyxrRtiX7Am4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XTTX4dzSIWrmOSM6GTNDrjDPkqxL4hlY4PZ4NUXdoBp/rrrUzwH2Q9dIjnl9oUSbzsD1hwPgleAmKIhG1KkYPfKCFUG/LtSA5luvBdZJcY1R8FS08wjMVhes3/04FH+laPcy6kUDdKW/ZqaV8lXzYgGWpMkDLYQw+u9E5770N3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+IlcLg/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+IlcLg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747267773; x=1778803773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u5U8IBS0aj/yCkIaJ/fZu4+XiINvUVPyxrRtiX7Am4w=;
  b=a+IlcLg/MfAdzmtvhk6DgJL/NA01WG4cHqqX2Hn9pcM7vR3iFGhB6Rn2
   ELu7O0bKXKyPldffgDcKe8QmpkqN4AQTzLtnhlMYtfFE6bqC6+BcUd3dC
   mEoEw1ZiWO7u33frVoPVy63urJo+AJ6OOPYrK1cELAkIKPsfplwvOnodA
   BMPnmfiKXklCe2bkFdd3paugtLRsrdjucY4qv205SOXSWWHNovCPIVhR4
   qpi6fDRh4GndJ8agUMKGDz7KHxkY0/gZZKn2eJbN8wiYMH0o51kDWSLgS
   2Hy/R5rkqj9UMx7T5Bm/+QbLiy35ggZ7PpPlUn1mgHPCXxJh7bB8bnADd
   w==;
X-CSE-ConnectionGUID: lhO7R8zcQVmSgZBkDgvTJw==
X-CSE-MsgGUID: T7PS7faOQOi1tTSERNF1QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51827118"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="51827118"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 17:09:32 -0700
X-CSE-ConnectionGUID: Fz8ecVpjQqySy/FciNl6uQ==
X-CSE-MsgGUID: hLtjp/coSv+G/x89VeWuBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="137924783"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2025 17:09:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFMAD-000Hhz-0h;
	Thu, 15 May 2025 00:09:29 +0000
Date: Thu, 15 May 2025 08:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexghiti:alex-for-next-sbi-3.0 80/96]
 arch/riscv/kernel/asm-offsets.c:517:23: error: 'SBI_EXT_FWFT' undeclared
Message-ID: <202505150834.94GUtmGm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux.git alex-for-next-sbi-3.0
head:   f478bb7469147d98ed15ea4caeebd0f7022b6a81
commit: 47c129a8340a093394a2f092ece2a9ca55591ba1 [80/96] riscv: enable kernel access to shadow stack memory via FWFT sbi call
config: riscv-randconfig-001-20250515 (https://download.01.org/0day-ci/archive/20250515/202505150834.94GUtmGm-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150834.94GUtmGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150834.94GUtmGm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:7:
   arch/riscv/kernel/asm-offsets.c: In function 'asm_offsets':
>> arch/riscv/kernel/asm-offsets.c:517:23: error: 'SBI_EXT_FWFT' undeclared (first use in this function)
     DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
                          ^~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
   arch/riscv/kernel/asm-offsets.c:517:23: note: each undeclared identifier is reported only once for each function it appears in
     DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
                          ^~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
>> arch/riscv/kernel/asm-offsets.c:518:27: error: 'SBI_EXT_FWFT_SET' undeclared (first use in this function)
     DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
                              ^~~~~~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
>> arch/riscv/kernel/asm-offsets.c:519:32: error: 'SBI_FWFT_SHADOW_STACK' undeclared (first use in this function); did you mean 'VM_SHADOW_STACK'?
     DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
                                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
>> arch/riscv/kernel/asm-offsets.c:520:33: error: 'SBI_FWFT_SET_FLAG_LOCK' undeclared (first use in this function); did you mean 'CSD_FLAG_LOCK'?
     DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
   make[3]: *** [scripts/Makefile.build:98: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2386734513
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=2386734513
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2386734513
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2386734513
   make: Target 'prepare' not remade because of errors.


vim +/SBI_EXT_FWFT +517 arch/riscv/kernel/asm-offsets.c

    92	
    93		DEFINE(PT_SIZE, sizeof(struct pt_regs));
    94		OFFSET(PT_EPC, pt_regs, epc);
    95		OFFSET(PT_RA, pt_regs, ra);
    96		OFFSET(PT_FP, pt_regs, s0);
    97		OFFSET(PT_S0, pt_regs, s0);
    98		OFFSET(PT_S1, pt_regs, s1);
    99		OFFSET(PT_S2, pt_regs, s2);
   100		OFFSET(PT_S3, pt_regs, s3);
   101		OFFSET(PT_S4, pt_regs, s4);
   102		OFFSET(PT_S5, pt_regs, s5);
   103		OFFSET(PT_S6, pt_regs, s6);
   104		OFFSET(PT_S7, pt_regs, s7);
   105		OFFSET(PT_S8, pt_regs, s8);
   106		OFFSET(PT_S9, pt_regs, s9);
   107		OFFSET(PT_S10, pt_regs, s10);
   108		OFFSET(PT_S11, pt_regs, s11);
   109		OFFSET(PT_SP, pt_regs, sp);
   110		OFFSET(PT_TP, pt_regs, tp);
   111		OFFSET(PT_A0, pt_regs, a0);
   112		OFFSET(PT_A1, pt_regs, a1);
   113		OFFSET(PT_A2, pt_regs, a2);
   114		OFFSET(PT_A3, pt_regs, a3);
   115		OFFSET(PT_A4, pt_regs, a4);
   116		OFFSET(PT_A5, pt_regs, a5);
   117		OFFSET(PT_A6, pt_regs, a6);
   118		OFFSET(PT_A7, pt_regs, a7);
   119		OFFSET(PT_T0, pt_regs, t0);
   120		OFFSET(PT_T1, pt_regs, t1);
   121		OFFSET(PT_T2, pt_regs, t2);
   122		OFFSET(PT_T3, pt_regs, t3);
   123		OFFSET(PT_T4, pt_regs, t4);
   124		OFFSET(PT_T5, pt_regs, t5);
   125		OFFSET(PT_T6, pt_regs, t6);
   126		OFFSET(PT_GP, pt_regs, gp);
   127		OFFSET(PT_ORIG_A0, pt_regs, orig_a0);
   128		OFFSET(PT_STATUS, pt_regs, status);
   129		OFFSET(PT_BADADDR, pt_regs, badaddr);
   130		OFFSET(PT_CAUSE, pt_regs, cause);
   131	
   132		OFFSET(SUSPEND_CONTEXT_REGS, suspend_context, regs);
   133	
   134		OFFSET(HIBERN_PBE_ADDR, pbe, address);
   135		OFFSET(HIBERN_PBE_ORIG, pbe, orig_address);
   136		OFFSET(HIBERN_PBE_NEXT, pbe, next);
   137	
   138		OFFSET(KVM_ARCH_GUEST_ZERO, kvm_vcpu_arch, guest_context.zero);
   139		OFFSET(KVM_ARCH_GUEST_RA, kvm_vcpu_arch, guest_context.ra);
   140		OFFSET(KVM_ARCH_GUEST_SP, kvm_vcpu_arch, guest_context.sp);
   141		OFFSET(KVM_ARCH_GUEST_GP, kvm_vcpu_arch, guest_context.gp);
   142		OFFSET(KVM_ARCH_GUEST_TP, kvm_vcpu_arch, guest_context.tp);
   143		OFFSET(KVM_ARCH_GUEST_T0, kvm_vcpu_arch, guest_context.t0);
   144		OFFSET(KVM_ARCH_GUEST_T1, kvm_vcpu_arch, guest_context.t1);
   145		OFFSET(KVM_ARCH_GUEST_T2, kvm_vcpu_arch, guest_context.t2);
   146		OFFSET(KVM_ARCH_GUEST_S0, kvm_vcpu_arch, guest_context.s0);
   147		OFFSET(KVM_ARCH_GUEST_S1, kvm_vcpu_arch, guest_context.s1);
   148		OFFSET(KVM_ARCH_GUEST_A0, kvm_vcpu_arch, guest_context.a0);
   149		OFFSET(KVM_ARCH_GUEST_A1, kvm_vcpu_arch, guest_context.a1);
   150		OFFSET(KVM_ARCH_GUEST_A2, kvm_vcpu_arch, guest_context.a2);
   151		OFFSET(KVM_ARCH_GUEST_A3, kvm_vcpu_arch, guest_context.a3);
   152		OFFSET(KVM_ARCH_GUEST_A4, kvm_vcpu_arch, guest_context.a4);
   153		OFFSET(KVM_ARCH_GUEST_A5, kvm_vcpu_arch, guest_context.a5);
   154		OFFSET(KVM_ARCH_GUEST_A6, kvm_vcpu_arch, guest_context.a6);
   155		OFFSET(KVM_ARCH_GUEST_A7, kvm_vcpu_arch, guest_context.a7);
   156		OFFSET(KVM_ARCH_GUEST_S2, kvm_vcpu_arch, guest_context.s2);
   157		OFFSET(KVM_ARCH_GUEST_S3, kvm_vcpu_arch, guest_context.s3);
   158		OFFSET(KVM_ARCH_GUEST_S4, kvm_vcpu_arch, guest_context.s4);
   159		OFFSET(KVM_ARCH_GUEST_S5, kvm_vcpu_arch, guest_context.s5);
   160		OFFSET(KVM_ARCH_GUEST_S6, kvm_vcpu_arch, guest_context.s6);
   161		OFFSET(KVM_ARCH_GUEST_S7, kvm_vcpu_arch, guest_context.s7);
   162		OFFSET(KVM_ARCH_GUEST_S8, kvm_vcpu_arch, guest_context.s8);
   163		OFFSET(KVM_ARCH_GUEST_S9, kvm_vcpu_arch, guest_context.s9);
   164		OFFSET(KVM_ARCH_GUEST_S10, kvm_vcpu_arch, guest_context.s10);
   165		OFFSET(KVM_ARCH_GUEST_S11, kvm_vcpu_arch, guest_context.s11);
   166		OFFSET(KVM_ARCH_GUEST_T3, kvm_vcpu_arch, guest_context.t3);
   167		OFFSET(KVM_ARCH_GUEST_T4, kvm_vcpu_arch, guest_context.t4);
   168		OFFSET(KVM_ARCH_GUEST_T5, kvm_vcpu_arch, guest_context.t5);
   169		OFFSET(KVM_ARCH_GUEST_T6, kvm_vcpu_arch, guest_context.t6);
   170		OFFSET(KVM_ARCH_GUEST_SEPC, kvm_vcpu_arch, guest_context.sepc);
   171		OFFSET(KVM_ARCH_GUEST_SSTATUS, kvm_vcpu_arch, guest_context.sstatus);
   172		OFFSET(KVM_ARCH_GUEST_HSTATUS, kvm_vcpu_arch, guest_context.hstatus);
   173		OFFSET(KVM_ARCH_GUEST_SCOUNTEREN, kvm_vcpu_arch, guest_csr.scounteren);
   174	
   175		OFFSET(KVM_ARCH_HOST_ZERO, kvm_vcpu_arch, host_context.zero);
   176		OFFSET(KVM_ARCH_HOST_RA, kvm_vcpu_arch, host_context.ra);
   177		OFFSET(KVM_ARCH_HOST_SP, kvm_vcpu_arch, host_context.sp);
   178		OFFSET(KVM_ARCH_HOST_GP, kvm_vcpu_arch, host_context.gp);
   179		OFFSET(KVM_ARCH_HOST_TP, kvm_vcpu_arch, host_context.tp);
   180		OFFSET(KVM_ARCH_HOST_T0, kvm_vcpu_arch, host_context.t0);
   181		OFFSET(KVM_ARCH_HOST_T1, kvm_vcpu_arch, host_context.t1);
   182		OFFSET(KVM_ARCH_HOST_T2, kvm_vcpu_arch, host_context.t2);
   183		OFFSET(KVM_ARCH_HOST_S0, kvm_vcpu_arch, host_context.s0);
   184		OFFSET(KVM_ARCH_HOST_S1, kvm_vcpu_arch, host_context.s1);
   185		OFFSET(KVM_ARCH_HOST_A0, kvm_vcpu_arch, host_context.a0);
   186		OFFSET(KVM_ARCH_HOST_A1, kvm_vcpu_arch, host_context.a1);
   187		OFFSET(KVM_ARCH_HOST_A2, kvm_vcpu_arch, host_context.a2);
   188		OFFSET(KVM_ARCH_HOST_A3, kvm_vcpu_arch, host_context.a3);
   189		OFFSET(KVM_ARCH_HOST_A4, kvm_vcpu_arch, host_context.a4);
   190		OFFSET(KVM_ARCH_HOST_A5, kvm_vcpu_arch, host_context.a5);
   191		OFFSET(KVM_ARCH_HOST_A6, kvm_vcpu_arch, host_context.a6);
   192		OFFSET(KVM_ARCH_HOST_A7, kvm_vcpu_arch, host_context.a7);
   193		OFFSET(KVM_ARCH_HOST_S2, kvm_vcpu_arch, host_context.s2);
   194		OFFSET(KVM_ARCH_HOST_S3, kvm_vcpu_arch, host_context.s3);
   195		OFFSET(KVM_ARCH_HOST_S4, kvm_vcpu_arch, host_context.s4);
   196		OFFSET(KVM_ARCH_HOST_S5, kvm_vcpu_arch, host_context.s5);
   197		OFFSET(KVM_ARCH_HOST_S6, kvm_vcpu_arch, host_context.s6);
   198		OFFSET(KVM_ARCH_HOST_S7, kvm_vcpu_arch, host_context.s7);
   199		OFFSET(KVM_ARCH_HOST_S8, kvm_vcpu_arch, host_context.s8);
   200		OFFSET(KVM_ARCH_HOST_S9, kvm_vcpu_arch, host_context.s9);
   201		OFFSET(KVM_ARCH_HOST_S10, kvm_vcpu_arch, host_context.s10);
   202		OFFSET(KVM_ARCH_HOST_S11, kvm_vcpu_arch, host_context.s11);
   203		OFFSET(KVM_ARCH_HOST_T3, kvm_vcpu_arch, host_context.t3);
   204		OFFSET(KVM_ARCH_HOST_T4, kvm_vcpu_arch, host_context.t4);
   205		OFFSET(KVM_ARCH_HOST_T5, kvm_vcpu_arch, host_context.t5);
   206		OFFSET(KVM_ARCH_HOST_T6, kvm_vcpu_arch, host_context.t6);
   207		OFFSET(KVM_ARCH_HOST_SEPC, kvm_vcpu_arch, host_context.sepc);
   208		OFFSET(KVM_ARCH_HOST_SSTATUS, kvm_vcpu_arch, host_context.sstatus);
   209		OFFSET(KVM_ARCH_HOST_HSTATUS, kvm_vcpu_arch, host_context.hstatus);
   210		OFFSET(KVM_ARCH_HOST_SSCRATCH, kvm_vcpu_arch, host_sscratch);
   211		OFFSET(KVM_ARCH_HOST_STVEC, kvm_vcpu_arch, host_stvec);
   212		OFFSET(KVM_ARCH_HOST_SCOUNTEREN, kvm_vcpu_arch, host_scounteren);
   213	
   214		OFFSET(KVM_ARCH_TRAP_SEPC, kvm_cpu_trap, sepc);
   215		OFFSET(KVM_ARCH_TRAP_SCAUSE, kvm_cpu_trap, scause);
   216		OFFSET(KVM_ARCH_TRAP_STVAL, kvm_cpu_trap, stval);
   217		OFFSET(KVM_ARCH_TRAP_HTVAL, kvm_cpu_trap, htval);
   218		OFFSET(KVM_ARCH_TRAP_HTINST, kvm_cpu_trap, htinst);
   219	
   220		/* F extension */
   221	
   222		OFFSET(KVM_ARCH_FP_F_F0, kvm_cpu_context, fp.f.f[0]);
   223		OFFSET(KVM_ARCH_FP_F_F1, kvm_cpu_context, fp.f.f[1]);
   224		OFFSET(KVM_ARCH_FP_F_F2, kvm_cpu_context, fp.f.f[2]);
   225		OFFSET(KVM_ARCH_FP_F_F3, kvm_cpu_context, fp.f.f[3]);
   226		OFFSET(KVM_ARCH_FP_F_F4, kvm_cpu_context, fp.f.f[4]);
   227		OFFSET(KVM_ARCH_FP_F_F5, kvm_cpu_context, fp.f.f[5]);
   228		OFFSET(KVM_ARCH_FP_F_F6, kvm_cpu_context, fp.f.f[6]);
   229		OFFSET(KVM_ARCH_FP_F_F7, kvm_cpu_context, fp.f.f[7]);
   230		OFFSET(KVM_ARCH_FP_F_F8, kvm_cpu_context, fp.f.f[8]);
   231		OFFSET(KVM_ARCH_FP_F_F9, kvm_cpu_context, fp.f.f[9]);
   232		OFFSET(KVM_ARCH_FP_F_F10, kvm_cpu_context, fp.f.f[10]);
   233		OFFSET(KVM_ARCH_FP_F_F11, kvm_cpu_context, fp.f.f[11]);
   234		OFFSET(KVM_ARCH_FP_F_F12, kvm_cpu_context, fp.f.f[12]);
   235		OFFSET(KVM_ARCH_FP_F_F13, kvm_cpu_context, fp.f.f[13]);
   236		OFFSET(KVM_ARCH_FP_F_F14, kvm_cpu_context, fp.f.f[14]);
   237		OFFSET(KVM_ARCH_FP_F_F15, kvm_cpu_context, fp.f.f[15]);
   238		OFFSET(KVM_ARCH_FP_F_F16, kvm_cpu_context, fp.f.f[16]);
   239		OFFSET(KVM_ARCH_FP_F_F17, kvm_cpu_context, fp.f.f[17]);
   240		OFFSET(KVM_ARCH_FP_F_F18, kvm_cpu_context, fp.f.f[18]);
   241		OFFSET(KVM_ARCH_FP_F_F19, kvm_cpu_context, fp.f.f[19]);
   242		OFFSET(KVM_ARCH_FP_F_F20, kvm_cpu_context, fp.f.f[20]);
   243		OFFSET(KVM_ARCH_FP_F_F21, kvm_cpu_context, fp.f.f[21]);
   244		OFFSET(KVM_ARCH_FP_F_F22, kvm_cpu_context, fp.f.f[22]);
   245		OFFSET(KVM_ARCH_FP_F_F23, kvm_cpu_context, fp.f.f[23]);
   246		OFFSET(KVM_ARCH_FP_F_F24, kvm_cpu_context, fp.f.f[24]);
   247		OFFSET(KVM_ARCH_FP_F_F25, kvm_cpu_context, fp.f.f[25]);
   248		OFFSET(KVM_ARCH_FP_F_F26, kvm_cpu_context, fp.f.f[26]);
   249		OFFSET(KVM_ARCH_FP_F_F27, kvm_cpu_context, fp.f.f[27]);
   250		OFFSET(KVM_ARCH_FP_F_F28, kvm_cpu_context, fp.f.f[28]);
   251		OFFSET(KVM_ARCH_FP_F_F29, kvm_cpu_context, fp.f.f[29]);
   252		OFFSET(KVM_ARCH_FP_F_F30, kvm_cpu_context, fp.f.f[30]);
   253		OFFSET(KVM_ARCH_FP_F_F31, kvm_cpu_context, fp.f.f[31]);
   254		OFFSET(KVM_ARCH_FP_F_FCSR, kvm_cpu_context, fp.f.fcsr);
   255	
   256		/* D extension */
   257	
   258		OFFSET(KVM_ARCH_FP_D_F0, kvm_cpu_context, fp.d.f[0]);
   259		OFFSET(KVM_ARCH_FP_D_F1, kvm_cpu_context, fp.d.f[1]);
   260		OFFSET(KVM_ARCH_FP_D_F2, kvm_cpu_context, fp.d.f[2]);
   261		OFFSET(KVM_ARCH_FP_D_F3, kvm_cpu_context, fp.d.f[3]);
   262		OFFSET(KVM_ARCH_FP_D_F4, kvm_cpu_context, fp.d.f[4]);
   263		OFFSET(KVM_ARCH_FP_D_F5, kvm_cpu_context, fp.d.f[5]);
   264		OFFSET(KVM_ARCH_FP_D_F6, kvm_cpu_context, fp.d.f[6]);
   265		OFFSET(KVM_ARCH_FP_D_F7, kvm_cpu_context, fp.d.f[7]);
   266		OFFSET(KVM_ARCH_FP_D_F8, kvm_cpu_context, fp.d.f[8]);
   267		OFFSET(KVM_ARCH_FP_D_F9, kvm_cpu_context, fp.d.f[9]);
   268		OFFSET(KVM_ARCH_FP_D_F10, kvm_cpu_context, fp.d.f[10]);
   269		OFFSET(KVM_ARCH_FP_D_F11, kvm_cpu_context, fp.d.f[11]);
   270		OFFSET(KVM_ARCH_FP_D_F12, kvm_cpu_context, fp.d.f[12]);
   271		OFFSET(KVM_ARCH_FP_D_F13, kvm_cpu_context, fp.d.f[13]);
   272		OFFSET(KVM_ARCH_FP_D_F14, kvm_cpu_context, fp.d.f[14]);
   273		OFFSET(KVM_ARCH_FP_D_F15, kvm_cpu_context, fp.d.f[15]);
   274		OFFSET(KVM_ARCH_FP_D_F16, kvm_cpu_context, fp.d.f[16]);
   275		OFFSET(KVM_ARCH_FP_D_F17, kvm_cpu_context, fp.d.f[17]);
   276		OFFSET(KVM_ARCH_FP_D_F18, kvm_cpu_context, fp.d.f[18]);
   277		OFFSET(KVM_ARCH_FP_D_F19, kvm_cpu_context, fp.d.f[19]);
   278		OFFSET(KVM_ARCH_FP_D_F20, kvm_cpu_context, fp.d.f[20]);
   279		OFFSET(KVM_ARCH_FP_D_F21, kvm_cpu_context, fp.d.f[21]);
   280		OFFSET(KVM_ARCH_FP_D_F22, kvm_cpu_context, fp.d.f[22]);
   281		OFFSET(KVM_ARCH_FP_D_F23, kvm_cpu_context, fp.d.f[23]);
   282		OFFSET(KVM_ARCH_FP_D_F24, kvm_cpu_context, fp.d.f[24]);
   283		OFFSET(KVM_ARCH_FP_D_F25, kvm_cpu_context, fp.d.f[25]);
   284		OFFSET(KVM_ARCH_FP_D_F26, kvm_cpu_context, fp.d.f[26]);
   285		OFFSET(KVM_ARCH_FP_D_F27, kvm_cpu_context, fp.d.f[27]);
   286		OFFSET(KVM_ARCH_FP_D_F28, kvm_cpu_context, fp.d.f[28]);
   287		OFFSET(KVM_ARCH_FP_D_F29, kvm_cpu_context, fp.d.f[29]);
   288		OFFSET(KVM_ARCH_FP_D_F30, kvm_cpu_context, fp.d.f[30]);
   289		OFFSET(KVM_ARCH_FP_D_F31, kvm_cpu_context, fp.d.f[31]);
   290		OFFSET(KVM_ARCH_FP_D_FCSR, kvm_cpu_context, fp.d.fcsr);
   291	
   292		/*
   293		 * THREAD_{F,X}* might be larger than a S-type offset can handle, but
   294		 * these are used in performance-sensitive assembly so we can't resort
   295		 * to loading the long immediate every time.
   296		 */
   297		DEFINE(TASK_THREAD_RA_RA,
   298			  offsetof(struct task_struct, thread.ra)
   299			- offsetof(struct task_struct, thread.ra)
   300		);
   301		DEFINE(TASK_THREAD_SP_RA,
   302			  offsetof(struct task_struct, thread.sp)
   303			- offsetof(struct task_struct, thread.ra)
   304		);
   305		DEFINE(TASK_THREAD_S0_RA,
   306			  offsetof(struct task_struct, thread.s[0])
   307			- offsetof(struct task_struct, thread.ra)
   308		);
   309		DEFINE(TASK_THREAD_S1_RA,
   310			  offsetof(struct task_struct, thread.s[1])
   311			- offsetof(struct task_struct, thread.ra)
   312		);
   313		DEFINE(TASK_THREAD_S2_RA,
   314			  offsetof(struct task_struct, thread.s[2])
   315			- offsetof(struct task_struct, thread.ra)
   316		);
   317		DEFINE(TASK_THREAD_S3_RA,
   318			  offsetof(struct task_struct, thread.s[3])
   319			- offsetof(struct task_struct, thread.ra)
   320		);
   321		DEFINE(TASK_THREAD_S4_RA,
   322			  offsetof(struct task_struct, thread.s[4])
   323			- offsetof(struct task_struct, thread.ra)
   324		);
   325		DEFINE(TASK_THREAD_S5_RA,
   326			  offsetof(struct task_struct, thread.s[5])
   327			- offsetof(struct task_struct, thread.ra)
   328		);
   329		DEFINE(TASK_THREAD_S6_RA,
   330			  offsetof(struct task_struct, thread.s[6])
   331			- offsetof(struct task_struct, thread.ra)
   332		);
   333		DEFINE(TASK_THREAD_S7_RA,
   334			  offsetof(struct task_struct, thread.s[7])
   335			- offsetof(struct task_struct, thread.ra)
   336		);
   337		DEFINE(TASK_THREAD_S8_RA,
   338			  offsetof(struct task_struct, thread.s[8])
   339			- offsetof(struct task_struct, thread.ra)
   340		);
   341		DEFINE(TASK_THREAD_S9_RA,
   342			  offsetof(struct task_struct, thread.s[9])
   343			- offsetof(struct task_struct, thread.ra)
   344		);
   345		DEFINE(TASK_THREAD_S10_RA,
   346			  offsetof(struct task_struct, thread.s[10])
   347			- offsetof(struct task_struct, thread.ra)
   348		);
   349		DEFINE(TASK_THREAD_S11_RA,
   350			  offsetof(struct task_struct, thread.s[11])
   351			- offsetof(struct task_struct, thread.ra)
   352		);
   353	
   354		DEFINE(TASK_THREAD_F0_F0,
   355			  offsetof(struct task_struct, thread.fstate.f[0])
   356			- offsetof(struct task_struct, thread.fstate.f[0])
   357		);
   358		DEFINE(TASK_THREAD_F1_F0,
   359			  offsetof(struct task_struct, thread.fstate.f[1])
   360			- offsetof(struct task_struct, thread.fstate.f[0])
   361		);
   362		DEFINE(TASK_THREAD_F2_F0,
   363			  offsetof(struct task_struct, thread.fstate.f[2])
   364			- offsetof(struct task_struct, thread.fstate.f[0])
   365		);
   366		DEFINE(TASK_THREAD_F3_F0,
   367			  offsetof(struct task_struct, thread.fstate.f[3])
   368			- offsetof(struct task_struct, thread.fstate.f[0])
   369		);
   370		DEFINE(TASK_THREAD_F4_F0,
   371			  offsetof(struct task_struct, thread.fstate.f[4])
   372			- offsetof(struct task_struct, thread.fstate.f[0])
   373		);
   374		DEFINE(TASK_THREAD_F5_F0,
   375			  offsetof(struct task_struct, thread.fstate.f[5])
   376			- offsetof(struct task_struct, thread.fstate.f[0])
   377		);
   378		DEFINE(TASK_THREAD_F6_F0,
   379			  offsetof(struct task_struct, thread.fstate.f[6])
   380			- offsetof(struct task_struct, thread.fstate.f[0])
   381		);
   382		DEFINE(TASK_THREAD_F7_F0,
   383			  offsetof(struct task_struct, thread.fstate.f[7])
   384			- offsetof(struct task_struct, thread.fstate.f[0])
   385		);
   386		DEFINE(TASK_THREAD_F8_F0,
   387			  offsetof(struct task_struct, thread.fstate.f[8])
   388			- offsetof(struct task_struct, thread.fstate.f[0])
   389		);
   390		DEFINE(TASK_THREAD_F9_F0,
   391			  offsetof(struct task_struct, thread.fstate.f[9])
   392			- offsetof(struct task_struct, thread.fstate.f[0])
   393		);
   394		DEFINE(TASK_THREAD_F10_F0,
   395			  offsetof(struct task_struct, thread.fstate.f[10])
   396			- offsetof(struct task_struct, thread.fstate.f[0])
   397		);
   398		DEFINE(TASK_THREAD_F11_F0,
   399			  offsetof(struct task_struct, thread.fstate.f[11])
   400			- offsetof(struct task_struct, thread.fstate.f[0])
   401		);
   402		DEFINE(TASK_THREAD_F12_F0,
   403			  offsetof(struct task_struct, thread.fstate.f[12])
   404			- offsetof(struct task_struct, thread.fstate.f[0])
   405		);
   406		DEFINE(TASK_THREAD_F13_F0,
   407			  offsetof(struct task_struct, thread.fstate.f[13])
   408			- offsetof(struct task_struct, thread.fstate.f[0])
   409		);
   410		DEFINE(TASK_THREAD_F14_F0,
   411			  offsetof(struct task_struct, thread.fstate.f[14])
   412			- offsetof(struct task_struct, thread.fstate.f[0])
   413		);
   414		DEFINE(TASK_THREAD_F15_F0,
   415			  offsetof(struct task_struct, thread.fstate.f[15])
   416			- offsetof(struct task_struct, thread.fstate.f[0])
   417		);
   418		DEFINE(TASK_THREAD_F16_F0,
   419			  offsetof(struct task_struct, thread.fstate.f[16])
   420			- offsetof(struct task_struct, thread.fstate.f[0])
   421		);
   422		DEFINE(TASK_THREAD_F17_F0,
   423			  offsetof(struct task_struct, thread.fstate.f[17])
   424			- offsetof(struct task_struct, thread.fstate.f[0])
   425		);
   426		DEFINE(TASK_THREAD_F18_F0,
   427			  offsetof(struct task_struct, thread.fstate.f[18])
   428			- offsetof(struct task_struct, thread.fstate.f[0])
   429		);
   430		DEFINE(TASK_THREAD_F19_F0,
   431			  offsetof(struct task_struct, thread.fstate.f[19])
   432			- offsetof(struct task_struct, thread.fstate.f[0])
   433		);
   434		DEFINE(TASK_THREAD_F20_F0,
   435			  offsetof(struct task_struct, thread.fstate.f[20])
   436			- offsetof(struct task_struct, thread.fstate.f[0])
   437		);
   438		DEFINE(TASK_THREAD_F21_F0,
   439			  offsetof(struct task_struct, thread.fstate.f[21])
   440			- offsetof(struct task_struct, thread.fstate.f[0])
   441		);
   442		DEFINE(TASK_THREAD_F22_F0,
   443			  offsetof(struct task_struct, thread.fstate.f[22])
   444			- offsetof(struct task_struct, thread.fstate.f[0])
   445		);
   446		DEFINE(TASK_THREAD_F23_F0,
   447			  offsetof(struct task_struct, thread.fstate.f[23])
   448			- offsetof(struct task_struct, thread.fstate.f[0])
   449		);
   450		DEFINE(TASK_THREAD_F24_F0,
   451			  offsetof(struct task_struct, thread.fstate.f[24])
   452			- offsetof(struct task_struct, thread.fstate.f[0])
   453		);
   454		DEFINE(TASK_THREAD_F25_F0,
   455			  offsetof(struct task_struct, thread.fstate.f[25])
   456			- offsetof(struct task_struct, thread.fstate.f[0])
   457		);
   458		DEFINE(TASK_THREAD_F26_F0,
   459			  offsetof(struct task_struct, thread.fstate.f[26])
   460			- offsetof(struct task_struct, thread.fstate.f[0])
   461		);
   462		DEFINE(TASK_THREAD_F27_F0,
   463			  offsetof(struct task_struct, thread.fstate.f[27])
   464			- offsetof(struct task_struct, thread.fstate.f[0])
   465		);
   466		DEFINE(TASK_THREAD_F28_F0,
   467			  offsetof(struct task_struct, thread.fstate.f[28])
   468			- offsetof(struct task_struct, thread.fstate.f[0])
   469		);
   470		DEFINE(TASK_THREAD_F29_F0,
   471			  offsetof(struct task_struct, thread.fstate.f[29])
   472			- offsetof(struct task_struct, thread.fstate.f[0])
   473		);
   474		DEFINE(TASK_THREAD_F30_F0,
   475			  offsetof(struct task_struct, thread.fstate.f[30])
   476			- offsetof(struct task_struct, thread.fstate.f[0])
   477		);
   478		DEFINE(TASK_THREAD_F31_F0,
   479			  offsetof(struct task_struct, thread.fstate.f[31])
   480			- offsetof(struct task_struct, thread.fstate.f[0])
   481		);
   482		DEFINE(TASK_THREAD_FCSR_F0,
   483			  offsetof(struct task_struct, thread.fstate.fcsr)
   484			- offsetof(struct task_struct, thread.fstate.f[0])
   485		);
   486	
   487		/*
   488		 * We allocate a pt_regs on the stack when entering the kernel.  This
   489		 * ensures the alignment is sane.
   490		 */
   491		DEFINE(PT_SIZE_ON_STACK, ALIGN(sizeof(struct pt_regs), STACK_ALIGN));
   492	
   493		OFFSET(KERNEL_MAP_VIRT_ADDR, kernel_mapping, virt_addr);
   494		OFFSET(SBI_HART_BOOT_TASK_PTR_OFFSET, sbi_hart_boot_data, task_ptr);
   495		OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
   496	
   497		DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe), STACK_ALIGN));
   498		OFFSET(STACKFRAME_FP, stackframe, fp);
   499		OFFSET(STACKFRAME_RA, stackframe, ra);
   500	
   501	#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
   502		DEFINE(FREGS_SIZE_ON_STACK, ALIGN(sizeof(struct __arch_ftrace_regs), STACK_ALIGN));
   503		DEFINE(FREGS_EPC,	    offsetof(struct __arch_ftrace_regs, epc));
   504		DEFINE(FREGS_RA,	    offsetof(struct __arch_ftrace_regs, ra));
   505		DEFINE(FREGS_SP,	    offsetof(struct __arch_ftrace_regs, sp));
   506		DEFINE(FREGS_S0,	    offsetof(struct __arch_ftrace_regs, s0));
   507		DEFINE(FREGS_T1,	    offsetof(struct __arch_ftrace_regs, t1));
   508		DEFINE(FREGS_A0,	    offsetof(struct __arch_ftrace_regs, a0));
   509		DEFINE(FREGS_A1,	    offsetof(struct __arch_ftrace_regs, a1));
   510		DEFINE(FREGS_A2,	    offsetof(struct __arch_ftrace_regs, a2));
   511		DEFINE(FREGS_A3,	    offsetof(struct __arch_ftrace_regs, a3));
   512		DEFINE(FREGS_A4,	    offsetof(struct __arch_ftrace_regs, a4));
   513		DEFINE(FREGS_A5,	    offsetof(struct __arch_ftrace_regs, a5));
   514		DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
   515		DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
   516	#endif
 > 517		DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
 > 518		DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
 > 519		DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
 > 520		DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
