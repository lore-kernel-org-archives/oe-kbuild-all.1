Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1C313298
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768647237; cv=none; b=rbo+wuwUcuLvMEsqfGlNqxMfd6WwmZAeBJcSJIgoWstmkMs5qp9IkQnheIpGwutcSw0cOFxTam3gOdHrTtuy2Jt3hvlOt22lEQqit7j2TRLTT8Mkg6XzCZiPx8J1WlW4ieRwjFQoWEd4qLsTI2O/eQiUilrTjpzln2cv+wPImME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768647237; c=relaxed/simple;
	bh=Gi4wK4KBTPlUjwia0r7fVMhCCyvJAC3wR6BpAbeWt3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nKl1hgd3FlX+DwaWflwjgrbNu15KAF8M1Cf0xhXNvA+Uqd4b6tXZTaFeGxBt2zm1sNTsznuX1rwASsCbd0Eese/qEdLJTdTZzbGytz5v84aFHiB6vGexTqfjSYCStLsPIT05xMMjxZ0wzV31c073LqfFnRdmgyCo1he5e2MIF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqlbN1ki; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqlbN1ki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768647236; x=1800183236;
  h=date:from:to:cc:subject:message-id;
  bh=Gi4wK4KBTPlUjwia0r7fVMhCCyvJAC3wR6BpAbeWt3s=;
  b=LqlbN1ki2EYw3sjz+CRsAg3yc+N4lMlXFXp5Fn8mLC+XVVPrz0M4z23x
   IOn4r0mr46iPcjHdQFSeFmycy7Blh6Kvy0qA33c8GNU5uIbWK6MMCdWgJ
   vZ/TzI6zklQuegsa4+Z9kDoIqqlA2ctTyIJ7lrJkvDRVEjcGxX1V8gHrr
   dpr/10zHRxBvcymWAnmjLKhQ5lPlX8C9XfNkPsuYuO0lJCNwWclkGNrq+
   Fw+2PeZ+eFhusVumQ2bNh3zCTUtal5dRy0OIAnMsX0GZAkxRHMvEM8wM2
   LvhVhNst9uoPUcfTOuTZ1BQ+M04fxF2RmOm3lpE7MzW6TVaLRGVmUzP1n
   g==;
X-CSE-ConnectionGUID: M/BmdNC4Q6G4VM63EdolAg==
X-CSE-MsgGUID: onfwsAPKQjK+A/dFzORolw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="92609452"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="92609452"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 02:53:53 -0800
X-CSE-ConnectionGUID: tGSENBbbRCuRzhGibpVG0g==
X-CSE-MsgGUID: 3IVuIhNqTB6cRyAtBK5vtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205353039"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2026 02:53:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh3wD-00000000LmC-2yD4;
	Sat, 17 Jan 2026 10:53:49 +0000
Date: Sat, 17 Jan 2026 18:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/kernel/signal.c:148:22: sparse: sparse: symbol
 'arch_ext_list' was not declared. Should it be static?
Message-ID: <202601171848.ydLTJYrz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: 818d78ba1b3f88d2bfee249f25020211488a26c3 riscv: signal: abstract header saving for setup_sigcontext
date:   4 weeks ago
config: riscv-randconfig-r121-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171848.ydLTJYrz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171848.ydLTJYrz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171848.ydLTJYrz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kernel/signal.c:148:22: sparse: sparse: symbol 'arch_ext_list' was not declared. Should it be static?
>> arch/riscv/kernel/signal.c:155:14: sparse: sparse: symbol 'nr_arch_exts' was not declared. Should it be static?
>> arch/riscv/kernel/signal.c:300:39: sparse: sparse: cast removes address space '__user' of expression
>> arch/riscv/kernel/signal.c:300:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct __riscv_ctx_hdr [noderef] __user *sc_ext_ptr @@     got void * @@
   arch/riscv/kernel/signal.c:300:36: sparse:     expected struct __riscv_ctx_hdr [noderef] __user *sc_ext_ptr
   arch/riscv/kernel/signal.c:300:36: sparse:     got void *

vim +/arch_ext_list +148 arch/riscv/kernel/signal.c

   147	
 > 148	struct arch_ext_priv arch_ext_list[] = {
   149		{
   150			.magic = RISCV_V_MAGIC,
   151			.save = &save_v_state,
   152		},
   153	};
   154	
 > 155	const size_t nr_arch_exts = ARRAY_SIZE(arch_ext_list);
   156	
   157	static long restore_sigcontext(struct pt_regs *regs,
   158		struct sigcontext __user *sc)
   159	{
   160		void __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
   161		__u32 rsvd;
   162		long err;
   163		/* sc_regs is structured the same as the start of pt_regs */
   164		err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
   165		if (unlikely(err))
   166			return err;
   167	
   168		/* Restore the floating-point state. */
   169		if (has_fpu()) {
   170			err = restore_fp_state(regs, &sc->sc_fpregs);
   171			if (unlikely(err))
   172				return err;
   173		}
   174	
   175		/* Check the reserved word before extensions parsing */
   176		err = __get_user(rsvd, &sc->sc_extdesc.reserved);
   177		if (unlikely(err))
   178			return err;
   179		if (unlikely(rsvd))
   180			return -EINVAL;
   181	
   182		while (!err) {
   183			__u32 magic, size;
   184			struct __riscv_ctx_hdr __user *head = sc_ext_ptr;
   185	
   186			err |= __get_user(magic, &head->magic);
   187			err |= __get_user(size, &head->size);
   188			if (unlikely(err))
   189				return err;
   190	
   191			sc_ext_ptr += sizeof(*head);
   192			switch (magic) {
   193			case END_MAGIC:
   194				if (size != END_HDR_SIZE)
   195					return -EINVAL;
   196	
   197				return 0;
   198			case RISCV_V_MAGIC:
   199				if (!(has_vector() || has_xtheadvector()) || !riscv_v_vstate_query(regs) ||
   200				    size != riscv_v_sc_size)
   201					return -EINVAL;
   202	
   203				err = __restore_v_state(regs, sc_ext_ptr);
   204				break;
   205			default:
   206				return -EINVAL;
   207			}
   208			sc_ext_ptr = (void __user *)head + size;
   209		}
   210		return err;
   211	}
   212	
   213	static size_t get_rt_frame_size(bool cal_all)
   214	{
   215		struct rt_sigframe __user *frame;
   216		size_t frame_size;
   217		size_t total_context_size = 0;
   218	
   219		frame_size = sizeof(*frame);
   220	
   221		if (has_vector() || has_xtheadvector()) {
   222			if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
   223				total_context_size += riscv_v_sc_size;
   224		}
   225	
   226		frame_size += total_context_size;
   227	
   228		frame_size = round_up(frame_size, 16);
   229		return frame_size;
   230	}
   231	
   232	SYSCALL_DEFINE0(rt_sigreturn)
   233	{
   234		struct pt_regs *regs = current_pt_regs();
   235		struct rt_sigframe __user *frame;
   236		struct task_struct *task;
   237		sigset_t set;
   238		size_t frame_size = get_rt_frame_size(false);
   239	
   240		/* Always make any pending restarted system calls return -EINTR */
   241		current->restart_block.fn = do_no_restart_syscall;
   242	
   243		frame = (struct rt_sigframe __user *)regs->sp;
   244	
   245		if (!access_ok(frame, frame_size))
   246			goto badframe;
   247	
   248		if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
   249			goto badframe;
   250	
   251		set_current_blocked(&set);
   252	
   253		if (restore_sigcontext(regs, &frame->uc.uc_mcontext))
   254			goto badframe;
   255	
   256		if (restore_altstack(&frame->uc.uc_stack))
   257			goto badframe;
   258	
   259		regs->cause = -1UL;
   260	
   261		return regs->a0;
   262	
   263	badframe:
   264		task = current;
   265		if (show_unhandled_signals) {
   266			pr_info_ratelimited(
   267				"%s[%d]: bad frame in %s: frame=%p pc=%p sp=%p\n",
   268				task->comm, task_pid_nr(task), __func__,
   269				frame, (void *)regs->epc, (void *)regs->sp);
   270		}
   271		force_sig(SIGSEGV);
   272		return 0;
   273	}
   274	
   275	static long setup_sigcontext(struct rt_sigframe __user *frame,
   276		struct pt_regs *regs)
   277	{
   278		struct sigcontext __user *sc = &frame->uc.uc_mcontext;
   279		struct __riscv_ctx_hdr __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
   280		struct arch_ext_priv *arch_ext;
   281		long err, i, ext_size;
   282	
   283		/* sc_regs is structured the same as the start of pt_regs */
   284		err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
   285		/* Save the floating-point state. */
   286		if (has_fpu())
   287			err |= save_fp_state(regs, &sc->sc_fpregs);
   288		/* Save the vector state. */
   289		for (i = 0; i < nr_arch_exts; i++) {
   290			arch_ext = &arch_ext_list[i];
   291			if (!arch_ext->save)
   292				continue;
   293	
   294			ext_size = arch_ext->save(regs, sc_ext_ptr + 1);
   295			if (ext_size <= 0) {
   296				err |= ext_size;
   297			} else {
   298				err |= __put_user(arch_ext->magic, &sc_ext_ptr->magic);
   299				err |= __put_user(ext_size, &sc_ext_ptr->size);
 > 300				sc_ext_ptr = (void *)sc_ext_ptr + ext_size;
   301			}
   302		}
   303		/* Write zero to fp-reserved space and check it on restore_sigcontext */
   304		err |= __put_user(0, &sc->sc_extdesc.reserved);
   305		/* And put END __riscv_ctx_hdr at the end. */
   306		err |= __put_user(END_MAGIC, &sc_ext_ptr->magic);
   307		err |= __put_user(END_HDR_SIZE, &sc_ext_ptr->size);
   308	
   309		return err;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
