Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6479B139579
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405373; cv=none; b=sx5VF2eVHePN0UVQvV1W0Yq2Vzdfh9gkXEpj9XZq5yNAK6E6jXVJkrTO9Wuh6+mngYWb7DwRyl2+v6bX7DkdEhbe1BqyU8BbJWEgLRiIRprH2OjUU+/ibHf05bvDT2WvAfZClmEuF26lsWEiQRh8gMUEvT7mEaMT9RehW4UJ63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405373; c=relaxed/simple;
	bh=IZ8a9S8JyJ6Dyt/lKdQcLLBWiaMwhUw8aQfzzvosIBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uiN0mlnpnqATOzQAN3eEWo92VXTRFLnVnVAHG3RAXzS8TtXvVc4xkEstxomJE5NY2cNRugGA436gE1zQxXZ4kJj3gMu8zlSllQs1iX5pJOW9Vhz2AAoMLvq6ZPK8JZhwiARPIxIHfVRUV4VKUD/kdfwg7+oXgtZ1t71/TwkY4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjUywL2b; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjUywL2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747405371; x=1778941371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZ8a9S8JyJ6Dyt/lKdQcLLBWiaMwhUw8aQfzzvosIBY=;
  b=EjUywL2b9biJOT1+GeoD7+UxstDosx3FFNuBcWEMlr4mWHAxTwCZ4+Op
   7xrNnLfQwEtkiChWSjls4rpK69Ml3tlJnpnVEU6w9OQ75npna42hNi8Zs
   1+msrb7ubia0u+4dkqSGzfShp0Jwag8gE+cxJH98yg/92njYcERUa7hTM
   HGwFTgd+UDToS/VEgIZEjRR4No5ySc9I91d+wXu4+bXgrIJRnpz1/iOul
   x13pFBMISoeJZ/TXHhzkoL7JoVZz4lwYj3x+cVQiLhg2Sx1QpWBUvkYOI
   xrSvDcIXUqBq0C3tXbZUj2dGITb65OZgDQwGMIXVohO+bl2pK5bWfiuWy
   A==;
X-CSE-ConnectionGUID: wbDks5EkTvq/vr2wqN2NKw==
X-CSE-MsgGUID: XjJPasb8RMm1J4sl2gPalw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53179354"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="53179354"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 07:22:50 -0700
X-CSE-ConnectionGUID: Dga0ZTD/TiSqFW1hM96lrQ==
X-CSE-MsgGUID: eS7YW2S6R1G3/v0EOvp7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138748018"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 07:22:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFvxX-000JPn-2r;
	Fri, 16 May 2025 14:22:47 +0000
Date: Fri, 16 May 2025 22:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexghiti:alex-for-next-sbi-3.0-rebase-6.15-rc6 30/76]
 arch/riscv/kernel/signal.c:148:22: sparse: sparse: symbol 'arch_ext_list'
 was not declared. Should it be static?
Message-ID: <202505162252.JaxpKhba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux.git alex-for-next-sbi-3.0-rebase-6.15-rc6
head:   b4ccd1840e0271059d83515be4496076ec09a5a8
commit: b5a058e306bc82bd34b01691a08e6554dbdfd896 [30/76] riscv: signal: abstract header saving for setup_sigcontext
config: riscv-randconfig-r122-20250516 (https://download.01.org/0day-ci/archive/20250516/202505162252.JaxpKhba-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250516/202505162252.JaxpKhba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505162252.JaxpKhba-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
