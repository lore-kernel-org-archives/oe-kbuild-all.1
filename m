Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2016B126BF1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 22:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730068981; cv=none; b=aWyFukdDPu3xrP1quA2VVOdi9y8A8fBOTEDl9Basyk02KRRBpuqonwAOUuYRH0yjdJ9tf+I9B0d90ZzWv8a/R/A0hCwQ8yG+r/I0gJGRiwK+kehjreFWYLyUTHJRxgOFzXo3WgXOyhYNiSGuHIXEY7QKqKmsee8+OVWk3QVu21k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730068981; c=relaxed/simple;
	bh=/VSlEXjVspeDEGspwdo8/QcqlWZpx5yGRI86aDNXnlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jOnLHFac2Lh0ItkqHJvUMA5wdKDAWNqMsWEIUyLSqUUeBdRaFnU7uFfFXkGyarHaNye4ftqlFGad3GanI7HURIspbHWV/z22nfJ5FWhSW28AfkXPADHFIowz4rwmNCfPvF2QkDv4IsCAWbHwimLTcQf8W3zaV90Uk+YIDmoHSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJum0gwd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJum0gwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730068978; x=1761604978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/VSlEXjVspeDEGspwdo8/QcqlWZpx5yGRI86aDNXnlg=;
  b=AJum0gwdDUJEGI8hXYMfuwT5KK50FzjRjif1oBFaG1GPFLO1j9PmoJNu
   wWRxNEY/JvKV88GrcbDG00kWTB3Zhj4+b+9MvK+zrYd0fsPP/9jWvEQ+e
   KItPxTgK59xv+pTD/X+opVsGbQo1wIa7pwWEkbgWzcET2oyla+hOs1/xv
   X0UBJQT1bYZ5otGSxO6MfkRPZKu6tZvYQ3Q7d/sW+/bW+wzY1lGC2FdMS
   pmEXBtsLMqPeeTqhQdkAqC6Q05d7VbXQL8UoHQrt45abuwi6WRtNSd3Ff
   0Htc1/9xR5PbURO55pyRx6AAOxbJRYTmMULs+jYJArgDmGpeDVfGT7RYv
   g==;
X-CSE-ConnectionGUID: 72LTYTSyTMqCHB22vHVJTQ==
X-CSE-MsgGUID: Xi5f0qtpQuq8flBDZuevzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52217108"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52217108"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 15:42:57 -0700
X-CSE-ConnectionGUID: 02u7uNh4SYiyapOHAA3mnA==
X-CSE-MsgGUID: WtKJVN7nQHqrVzuClrznaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="81017330"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Oct 2024 15:42:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5ByH-000b3A-26;
	Sun, 27 Oct 2024 22:42:53 +0000
Date: Mon, 28 Oct 2024 06:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Subject: [uml:next 44/50] arch/x86/um/signal.c:85:19: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202410280655.gOlEFwdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   d3b08e5f3f2829943342b88d3e2b44fb0ccdccab
commit: 3f17fed2149192c7d3b76a45a6a87b4ff22cd586 [44/50] um: switch to regset API and depend on XSTATE
config: um-randconfig-r123-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280655.gOlEFwdG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280655.gOlEFwdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280655.gOlEFwdG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/um/signal.c:85:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct _xstate_64 [noderef] __user *from_fp64 @@     got void * @@
   arch/x86/um/signal.c:85:19: sparse:     expected struct _xstate_64 [noderef] __user *from_fp64
   arch/x86/um/signal.c:85:19: sparse:     got void *
>> arch/x86/um/signal.c:100:38: sparse: sparse: incorrect type in argument 6 (different address spaces) @@     expected void const [noderef] __user *data @@     got void * @@
   arch/x86/um/signal.c:100:38: sparse:     expected void const [noderef] __user *data
   arch/x86/um/signal.c:100:38: sparse:     got void *
   arch/x86/um/signal.c:176:20: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/um/signal.c:176:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct _xstate_64 [noderef] __user *to_fp64 @@     got void * @@
   arch/x86/um/signal.c:176:17: sparse:     expected struct _xstate_64 [noderef] __user *to_fp64
   arch/x86/um/signal.c:176:17: sparse:     got void *
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:201:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got int * @@
   arch/x86/um/signal.c:201:9: sparse:     expected void const volatile [noderef] __user *ptr
   arch/x86/um/signal.c:201:9: sparse:     got int *
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:201:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *ptr @@     got int * @@
   arch/x86/um/signal.c:201:9: sparse:     expected void [noderef] __user *ptr
   arch/x86/um/signal.c:201:9: sparse:     got int *
   arch/x86/um/signal.c:242:16: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/um/signal.c:242:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *__x @@     got void [noderef] __user *[assigned] restorer @@
   arch/x86/um/signal.c:242:16: sparse:     expected void *__x
   arch/x86/um/signal.c:242:16: sparse:     got void [noderef] __user *[assigned] restorer
   arch/x86/um/signal.c:242:16: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/um/signal.c:242:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got void ** @@
   arch/x86/um/signal.c:242:16: sparse:     expected void const volatile [noderef] __user *ptr
   arch/x86/um/signal.c:242:16: sparse:     got void **
   arch/x86/um/signal.c:242:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:242:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:242:16: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/um/signal.c:242:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *ptr @@     got void ** @@
   arch/x86/um/signal.c:242:16: sparse:     expected void [noderef] __user *ptr
   arch/x86/um/signal.c:242:16: sparse:     got void **
   arch/x86/um/signal.c:298:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:298:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *__x @@     got void [noderef] __user *[assigned] restorer @@
   arch/x86/um/signal.c:298:16: sparse:     expected void *__x
   arch/x86/um/signal.c:298:16: sparse:     got void [noderef] __user *[assigned] restorer
   arch/x86/um/signal.c:298:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:298:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got void ** @@
   arch/x86/um/signal.c:298:16: sparse:     expected void const volatile [noderef] __user *ptr
   arch/x86/um/signal.c:298:16: sparse:     got void **
   arch/x86/um/signal.c:298:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:298:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:298:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:298:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *ptr @@     got void ** @@
   arch/x86/um/signal.c:298:16: sparse:     expected void [noderef] __user *ptr
   arch/x86/um/signal.c:298:16: sparse:     got void **
   arch/x86/um/signal.c:300:16: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/um/signal.c:300:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *__x @@     got struct siginfo [noderef] __user * @@
   arch/x86/um/signal.c:300:16: sparse:     expected void *__x
   arch/x86/um/signal.c:300:16: sparse:     got struct siginfo [noderef] __user *
   arch/x86/um/signal.c:300:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:300:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got void ** @@
   arch/x86/um/signal.c:300:16: sparse:     expected void const volatile [noderef] __user *ptr
   arch/x86/um/signal.c:300:16: sparse:     got void **
   arch/x86/um/signal.c:300:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:300:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:300:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:300:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *ptr @@     got void ** @@
   arch/x86/um/signal.c:300:16: sparse:     expected void [noderef] __user *ptr
   arch/x86/um/signal.c:300:16: sparse:     got void **
   arch/x86/um/signal.c:301:16: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/um/signal.c:301:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *__x @@     got struct ucontext [noderef] __user * @@
   arch/x86/um/signal.c:301:16: sparse:     expected void *__x
   arch/x86/um/signal.c:301:16: sparse:     got struct ucontext [noderef] __user *
   arch/x86/um/signal.c:301:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:301:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got void ** @@
   arch/x86/um/signal.c:301:16: sparse:     expected void const volatile [noderef] __user *ptr
   arch/x86/um/signal.c:301:16: sparse:     got void **
   arch/x86/um/signal.c:301:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:301:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:301:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:301:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *ptr @@     got void ** @@
   arch/x86/um/signal.c:301:16: sparse:     expected void [noderef] __user *ptr
   arch/x86/um/signal.c:301:16: sparse:     got void **

vim +85 arch/x86/um/signal.c

    83	
    84	#ifdef CONFIG_X86_32
  > 85		from_fp64 = ((void *)sc.fpstate) + offsetof(struct _fpstate_32, _fxsr_env);
    86	#else
    87		from_fp64 = (void *)sc.fpstate;
    88	#endif
    89	
    90		err = copy_from_user(regs->regs.fp, from_fp64, host_fp_size);
    91		if (err)
    92			return 1;
    93	
    94	#ifdef CONFIG_X86_32
    95		/* Data is duplicated and this copy is the important one */
    96		err = copy_regset_from_user(current,
    97					    task_user_regset_view(current),
    98					    REGSET_FP_LEGACY, 0,
    99					    sizeof(struct user_i387_struct),
 > 100					    (void *)sc.fpstate);
   101		if (err < 0)
   102			return err;
   103	#endif
   104	
   105		return 0;
   106	}
   107	
   108	static int copy_sc_to_user(struct sigcontext __user *to,
   109				   struct _xstate __user *to_fp, struct pt_regs *regs,
   110				   unsigned long mask)
   111	{
   112		struct _xstate_64 __user *to_fp64;
   113		struct sigcontext sc;
   114		struct faultinfo * fi = &current->thread.arch.faultinfo;
   115		int err;
   116		memset(&sc, 0, sizeof(struct sigcontext));
   117	
   118	#define PUTREG(regno, regname) sc.regname = regs->regs.gp[HOST_##regno]
   119	
   120	#ifdef CONFIG_X86_32
   121		PUTREG(GS, gs);
   122		PUTREG(FS, fs);
   123		PUTREG(ES, es);
   124		PUTREG(DS, ds);
   125	#endif
   126		PUTREG(DI, di);
   127		PUTREG(SI, si);
   128		PUTREG(BP, bp);
   129		PUTREG(SP, sp);
   130		PUTREG(BX, bx);
   131		PUTREG(DX, dx);
   132		PUTREG(CX, cx);
   133		PUTREG(AX, ax);
   134	#ifdef CONFIG_X86_64
   135		PUTREG(R8, r8);
   136		PUTREG(R9, r9);
   137		PUTREG(R10, r10);
   138		PUTREG(R11, r11);
   139		PUTREG(R12, r12);
   140		PUTREG(R13, r13);
   141		PUTREG(R14, r14);
   142		PUTREG(R15, r15);
   143	#endif
   144	
   145		sc.cr2 = fi->cr2;
   146		sc.err = fi->error_code;
   147		sc.trapno = fi->trap_no;
   148		PUTREG(IP, ip);
   149		PUTREG(CS, cs);
   150		PUTREG(EFLAGS, flags);
   151	#ifdef CONFIG_X86_32
   152		PUTREG(SP, sp_at_signal);
   153		PUTREG(SS, ss);
   154	#endif
   155	#undef PUTREG
   156		sc.oldmask = mask;
   157		sc.fpstate = (unsigned long)to_fp;
   158	
   159		err = copy_to_user(to, &sc, sizeof(struct sigcontext));
   160		if (err)
   161			return 1;
   162	
   163	#ifdef CONFIG_X86_32
   164		err = copy_regset_to_user(current,
   165					  task_user_regset_view(current),
   166					  REGSET_FP_LEGACY, 0,
   167					  sizeof(struct _fpstate_32), to_fp);
   168		if (err < 0)
   169			return err;
   170	
   171		__put_user(X86_FXSR_MAGIC, &to_fp->fpstate.magic);
   172	
   173		BUILD_BUG_ON(offsetof(struct _xstate, xstate_hdr) !=
   174			     offsetof(struct _xstate_64, xstate_hdr) +
   175				offsetof(struct _fpstate_32, _fxsr_env));
 > 176		to_fp64 = (void *)to_fp + offsetof(struct _fpstate_32, _fxsr_env);
   177	#else
   178		to_fp64 = to_fp;
   179	#endif /* CONFIG_X86_32 */
   180	
   181		if (copy_to_user(to_fp64, regs->regs.fp, host_fp_size))
   182			return 1;
   183	
   184		/*
   185		 * Put magic/size values for userspace. We do not bother to verify them
   186		 * later on, however, userspace needs them should it try to read the
   187		 * XSTATE data. And ptrace does not fill in these parts.
   188		 */
   189		BUILD_BUG_ON(sizeof(int) != FP_XSTATE_MAGIC2_SIZE);
   190	#ifdef CONFIG_X86_32
   191		__put_user(offsetof(struct _fpstate_32, _fxsr_env) +
   192			   host_fp_size + FP_XSTATE_MAGIC2_SIZE,
   193			   &to_fp64->fpstate.sw_reserved.extended_size);
   194	#else
   195		__put_user(host_fp_size + FP_XSTATE_MAGIC2_SIZE,
   196			   &to_fp64->fpstate.sw_reserved.extended_size);
   197	#endif
   198		__put_user(host_fp_size, &to_fp64->fpstate.sw_reserved.xstate_size);
   199	
   200		__put_user(FP_XSTATE_MAGIC1, &to_fp64->fpstate.sw_reserved.magic1);
   201		__put_user(FP_XSTATE_MAGIC2, (int *)((void *)to_fp64 + host_fp_size));
   202	
   203		return 0;
   204	}
   205	
   206	#ifdef CONFIG_X86_32
   207	static int copy_ucontext_to_user(struct ucontext __user *uc,
   208					 struct _xstate __user *fp, sigset_t *set,
   209					 unsigned long sp)
   210	{
   211		int err = 0;
   212	
   213		err |= __save_altstack(&uc->uc_stack, sp);
   214		err |= copy_sc_to_user(&uc->uc_mcontext, fp, &current->thread.regs, 0);
   215		err |= copy_to_user(&uc->uc_sigmask, set, sizeof(*set));
   216		return err;
   217	}
   218	
   219	int setup_signal_stack_sc(unsigned long stack_top, struct ksignal *ksig,
   220				  struct pt_regs *regs, sigset_t *mask)
   221	{
   222		size_t math_size = offsetof(struct _fpstate_32, _fxsr_env) +
   223				   host_fp_size + FP_XSTATE_MAGIC2_SIZE;
   224		struct sigframe __user *frame;
   225		void __user *restorer;
   226		int err = 0, sig = ksig->sig;
   227		unsigned long fp_to;
   228	
   229		/* This is the same calculation as i386 - ((sp + 4) & 15) == 0 */
   230		stack_top = ((stack_top + 4) & -16UL) - 4;
   231		frame = (struct sigframe __user *) stack_top - 1;
   232		if (!access_ok(frame, sizeof(*frame)))
   233			return 1;
   234	
   235		/* Add required space for math frame */
   236		frame = (struct sigframe __user *)((unsigned long)frame - math_size);
   237	
   238		restorer = frame->retcode;
   239		if (ksig->ka.sa.sa_flags & SA_RESTORER)
   240			restorer = ksig->ka.sa.sa_restorer;
   241	
 > 242		err |= __put_user(restorer, (void **)&frame->pretcode);
   243		err |= __put_user(sig, &frame->sig);
   244	
   245		fp_to = (unsigned long)frame + sizeof(*frame);
   246	
   247		err |= copy_sc_to_user(&frame->sc,
   248				       (struct _xstate __user *)fp_to,
   249				       regs, mask->sig[0]);
   250		if (_NSIG_WORDS > 1)
   251			err |= __copy_to_user(&frame->extramask, &mask->sig[1],
   252					      sizeof(frame->extramask));
   253	
   254		/*
   255		 * This is popl %eax ; movl $,%eax ; int $0x80
   256		 *
   257		 * WE DO NOT USE IT ANY MORE! It's only left here for historical
   258		 * reasons and because gdb uses it as a signature to notice
   259		 * signal handler stack frames.
   260		 */
   261		err |= __put_user(0xb858, (short __user *)(frame->retcode+0));
   262		err |= __put_user(__NR_sigreturn, (int __user *)(frame->retcode+2));
   263		err |= __put_user(0x80cd, (short __user *)(frame->retcode+6));
   264	
   265		if (err)
   266			return err;
   267	
   268		PT_REGS_SP(regs) = (unsigned long) frame;
   269		PT_REGS_IP(regs) = (unsigned long) ksig->ka.sa.sa_handler;
   270		PT_REGS_AX(regs) = (unsigned long) sig;
   271		PT_REGS_DX(regs) = (unsigned long) 0;
   272		PT_REGS_CX(regs) = (unsigned long) 0;
   273		return 0;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
