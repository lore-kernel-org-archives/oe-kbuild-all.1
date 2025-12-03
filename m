Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009183074BA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 20:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764792695; cv=none; b=qJrF1SIougwg0M3iapqH8UR8kBuMSJrnqlWO8NTwrEB3vc5gTEnnZUlHTcW2CQh0FS+OavUmqvF6TLrVSOG807UTLk4h66juUDs1kMNhLhlYnud6rG2IdwdcrXOhHTojHLTTZ91i+07C3KIIBP3EPmieTPf2YyTf/puCFpVjbEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764792695; c=relaxed/simple;
	bh=I758qliCdtplIdGqwUFlqO36aPwJac6JISp46RJBXj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Id7eMij8WA+fNHwGUXAHD/Ko21+NMVZ1oc6HevLAM+yeiGDBjGat8lphEGIhep1OTIjBER7g7iuwnw4KkRJSzgkybtJJKhO09d6RFEsJPLw1FZA2U6ECwZ/+je/MPeuG7t9EKJNegOJkemRWbRkfdN0V4bf4hB6iX9oxPFjRr3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXX+EeDU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXX+EeDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764792693; x=1796328693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I758qliCdtplIdGqwUFlqO36aPwJac6JISp46RJBXj4=;
  b=DXX+EeDUFUgyFXDtu9V/MYUPlG8rYLqPJMWFE1wFdLEibJCbvcT9GoSW
   nJxHSy/BZLwqm5gWnPta4+8Y42g+QdSSvQjKgBRupXkA0Bd0iDCN3YK6o
   1ihxbw4wuX312+j/QoKSLklEhxwK0mCxXg+/93uptURpZC+szRLMRDr01
   5C/rHVtp9bFk6H6bu00VfqpRudRtzj9JS37i0so8sJdHHU492fCDQaNYk
   uKw7+3WwnyCldnljAGILmE5gB5Bx3cE5cPWp++20oth1ZQpx6Wm8keyr/
   fvcOa9d9g7PEZrcu/rhVjaPvx8XaPy0PHLehhWXA7xdynmnACDb3EGvXv
   w==;
X-CSE-ConnectionGUID: 8sOVevdfRlasY9CjL9qeog==
X-CSE-MsgGUID: tvcYfAyFQIWOwRGfs7lq6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66966272"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="66966272"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 12:11:32 -0800
X-CSE-ConnectionGUID: Tcpy918UT6OOqGGwUAcJNw==
X-CSE-MsgGUID: tY5TI1SiRFSm8ZeXnGh3tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="194441174"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Dec 2025 12:11:30 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQtCB-00000000D6z-3gVK;
	Wed, 03 Dec 2025 20:11:27 +0000
Date: Thu, 4 Dec 2025 04:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: maohan4761@gmail.com, pjw@kernel.org, palmer@dabbelt.com
Cc: oe-kbuild-all@lists.linux.dev, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mao Han <han_mao@linux.alibaba.com>
Subject: Re: [PATCH 1/1] riscv: Optimize signal handling with sum enabled
 accesses
Message-ID: <202512040335.j2VwCIKL-lkp@intel.com>
References: <20251202074303.81485-2-maohan4761@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202074303.81485-2-maohan4761@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18]
[cannot apply to next-20251203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/maohan4761-gmail-com/riscv-Optimize-signal-handling-with-sum-enabled-accesses/20251202-154643
base:   linus/master
patch link:    https://lore.kernel.org/r/20251202074303.81485-2-maohan4761%40gmail.com
patch subject: [PATCH 1/1] riscv: Optimize signal handling with sum enabled accesses
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20251204/202512040335.j2VwCIKL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040335.j2VwCIKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040335.j2VwCIKL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/signal.c: In function 'restore_fp_state':
>> arch/riscv/kernel/signal.c:48:15: error: implicit declaration of function '__asm_copy_from_user_sum_enabled' [-Wimplicit-function-declaration]
      48 |         err = __asm_copy_from_user_sum_enabled(&current->thread.fstate, state, sizeof(*state));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c: In function 'save_fp_state':
>> arch/riscv/kernel/signal.c:63:15: error: implicit declaration of function '__asm_copy_to_user_sum_enabled' [-Wimplicit-function-declaration]
      63 |         err = __asm_copy_to_user_sum_enabled(state, &current->thread.fstate, sizeof(*state));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c: In function 'save_v_state':
>> arch/riscv/kernel/signal.c:97:16: error: implicit declaration of function '__put_user_sum_enabled' [-Wimplicit-function-declaration]
      97 |         err |= __put_user_sum_enabled((__force void *)datap, &state->v_state.datap);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c: In function '__restore_v_state':
>> arch/riscv/kernel/signal.c:136:15: error: implicit declaration of function '__get_user_sum_enabled' [-Wimplicit-function-declaration]
     136 |         err = __get_user_sum_enabled(datap, &state->v_state.datap);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c: In function '__riscv_sys_rt_sigreturn':
>> arch/riscv/kernel/signal.c:241:9: error: implicit declaration of function '__enable_user_access' [-Wimplicit-function-declaration]
     241 |         __enable_user_access();
         |         ^~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/signal.c:252:9: error: implicit declaration of function '__disable_user_access' [-Wimplicit-function-declaration]
     252 |         __disable_user_access();
         |         ^~~~~~~~~~~~~~~~~~~~~


vim +/__asm_copy_from_user_sum_enabled +48 arch/riscv/kernel/signal.c

    40	
    41	#ifdef CONFIG_FPU
    42	static long restore_fp_state(struct pt_regs *regs,
    43				     union __riscv_fp_state __user *sc_fpregs)
    44	{
    45		long err;
    46		struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
    47	
  > 48		err = __asm_copy_from_user_sum_enabled(&current->thread.fstate, state, sizeof(*state));
    49		if (unlikely(err))
    50			return err;
    51	
    52		fstate_restore(current, regs);
    53		return 0;
    54	}
    55	
    56	static long save_fp_state(struct pt_regs *regs,
    57				  union __riscv_fp_state __user *sc_fpregs)
    58	{
    59		long err;
    60		struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
    61	
    62		fstate_save(current, regs);
  > 63		err = __asm_copy_to_user_sum_enabled(state, &current->thread.fstate, sizeof(*state));
    64		return err;
    65	}
    66	#else
    67	#define save_fp_state(task, regs) (0)
    68	#define restore_fp_state(task, regs) (0)
    69	#endif
    70	
    71	#ifdef CONFIG_RISCV_ISA_V
    72	
    73	static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
    74	{
    75		struct __riscv_ctx_hdr __user *hdr;
    76		struct __sc_riscv_v_state __user *state;
    77		void __user *datap;
    78		long err;
    79	
    80		hdr = *sc_vec;
    81		/* Place state to the user's signal context space after the hdr */
    82		state = (struct __sc_riscv_v_state __user *)(hdr + 1);
    83		/* Point datap right after the end of __sc_riscv_v_state */
    84		datap = state + 1;
    85	
    86		/* datap is designed to be 16 byte aligned for better performance */
    87		WARN_ON(!IS_ALIGNED((unsigned long)datap, 16));
    88	
    89		get_cpu_vector_context();
    90		riscv_v_vstate_save(&current->thread.vstate, regs);
    91		put_cpu_vector_context();
    92	
    93		/* Copy everything of vstate but datap. */
    94		err = __asm_copy_to_user_sum_enabled(&state->v_state, &current->thread.vstate,
    95						offsetof(struct __riscv_v_ext_state, datap));
    96		/* Copy the pointer datap itself. */
  > 97		err |= __put_user_sum_enabled((__force void *)datap, &state->v_state.datap);
    98		/* Copy the whole vector content to user space datap. */
    99		err |= __asm_copy_to_user_sum_enabled(datap, current->thread.vstate.datap, riscv_v_vsize);
   100		/* Copy magic to the user space after saving  all vector conetext */
   101		err |= __put_user_sum_enabled(RISCV_V_MAGIC, &hdr->magic);
   102		err |= __put_user_sum_enabled(riscv_v_sc_size, &hdr->size);
   103		if (unlikely(err))
   104			return err;
   105	
   106		/* Only progress the sv_vec if everything has done successfully  */
   107		*sc_vec += riscv_v_sc_size;
   108		return 0;
   109	}
   110	
   111	/*
   112	 * Restore Vector extension context from the user's signal frame. This function
   113	 * assumes a valid extension header. So magic and size checking must be done by
   114	 * the caller.
   115	 */
   116	static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
   117	{
   118		long err;
   119		struct __sc_riscv_v_state __user *state = sc_vec;
   120		void __user *datap;
   121	
   122		/*
   123		 * Mark the vstate as clean prior performing the actual copy,
   124		 * to avoid getting the vstate incorrectly clobbered by the
   125		 *  discarded vector state.
   126		 */
   127		riscv_v_vstate_set_restore(current, regs);
   128	
   129		/* Copy everything of __sc_riscv_v_state except datap. */
   130		err = __asm_copy_from_user_sum_enabled(&current->thread.vstate, &state->v_state,
   131						offsetof(struct __riscv_v_ext_state, datap));
   132		if (unlikely(err))
   133			return err;
   134	
   135		/* Copy the pointer datap itself. */
 > 136		err = __get_user_sum_enabled(datap, &state->v_state.datap);
   137		if (unlikely(err))
   138			return err;
   139		/*
   140		 * Copy the whole vector content from user space datap. Use
   141		 * copy_from_user to prevent information leak.
   142		 */
   143		return __asm_copy_from_user_sum_enabled(current->thread.vstate.datap, datap, riscv_v_vsize);
   144	}
   145	#else
   146	#define save_v_state(task, regs) (0)
   147	#define __restore_v_state(task, regs) (0)
   148	#endif
   149	
   150	static long restore_sigcontext(struct pt_regs *regs,
   151		struct sigcontext __user *sc)
   152	{
   153		void __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
   154		__u32 rsvd;
   155		long err;
   156		/* sc_regs is structured the same as the start of pt_regs */
   157		err = __asm_copy_from_user_sum_enabled(regs, &sc->sc_regs, sizeof(sc->sc_regs));
   158		if (unlikely(err))
   159			return err;
   160	
   161		/* Restore the floating-point state. */
   162		if (has_fpu()) {
   163			err = restore_fp_state(regs, &sc->sc_fpregs);
   164			if (unlikely(err))
   165				return err;
   166		}
   167	
   168		/* Check the reserved word before extensions parsing */
   169		err = __get_user_sum_enabled(rsvd, &sc->sc_extdesc.reserved);
   170		if (unlikely(err))
   171			return err;
   172		if (unlikely(rsvd))
   173			return -EINVAL;
   174	
   175		while (!err) {
   176			__u32 magic, size;
   177			struct __riscv_ctx_hdr __user *head = sc_ext_ptr;
   178	
   179			err |= __get_user_sum_enabled(magic, &head->magic);
   180			err |= __get_user_sum_enabled(size, &head->size);
   181			if (unlikely(err))
   182				return err;
   183	
   184			sc_ext_ptr += sizeof(*head);
   185			switch (magic) {
   186			case END_MAGIC:
   187				if (size != END_HDR_SIZE)
   188					return -EINVAL;
   189	
   190				return 0;
   191			case RISCV_V_MAGIC:
   192				if (!(has_vector() || has_xtheadvector()) || !riscv_v_vstate_query(regs) ||
   193				    size != riscv_v_sc_size)
   194					return -EINVAL;
   195	
   196				err = __restore_v_state(regs, sc_ext_ptr);
   197				break;
   198			default:
   199				return -EINVAL;
   200			}
   201			sc_ext_ptr = (void __user *)head + size;
   202		}
   203		return err;
   204	}
   205	
   206	static size_t get_rt_frame_size(bool cal_all)
   207	{
   208		struct rt_sigframe __user *frame;
   209		size_t frame_size;
   210		size_t total_context_size = 0;
   211	
   212		frame_size = sizeof(*frame);
   213	
   214		if (has_vector() || has_xtheadvector()) {
   215			if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
   216				total_context_size += riscv_v_sc_size;
   217		}
   218	
   219		frame_size += total_context_size;
   220	
   221		frame_size = round_up(frame_size, 16);
   222		return frame_size;
   223	}
   224	
   225	SYSCALL_DEFINE0(rt_sigreturn)
   226	{
   227		struct pt_regs *regs = current_pt_regs();
   228		struct rt_sigframe __user *frame;
   229		struct task_struct *task;
   230		sigset_t set;
   231		size_t frame_size = get_rt_frame_size(false);
   232	
   233		/* Always make any pending restarted system calls return -EINTR */
   234		current->restart_block.fn = do_no_restart_syscall;
   235	
   236		frame = (struct rt_sigframe __user *)regs->sp;
   237	
   238		if (!access_ok(frame, frame_size))
   239			goto badframe;
   240	
 > 241		__enable_user_access();
   242		if (__asm_copy_from_user_sum_enabled(&set, &frame->uc.uc_sigmask, sizeof(set)))
   243			goto badframe;
   244	
   245		set_current_blocked(&set);
   246	
   247		if (restore_sigcontext(regs, &frame->uc.uc_mcontext))
   248			goto badframe;
   249	
   250		if (restore_altstack(&frame->uc.uc_stack))
   251			goto badframe;
   252		__disable_user_access();
   253	
   254		regs->cause = -1UL;
   255	
   256		return regs->a0;
   257	
   258	badframe:
   259		__disable_user_access();
   260		task = current;
   261		if (show_unhandled_signals) {
   262			pr_info_ratelimited(
   263				"%s[%d]: bad frame in %s: frame=%p pc=%p sp=%p\n",
   264				task->comm, task_pid_nr(task), __func__,
   265				frame, (void *)regs->epc, (void *)regs->sp);
   266		}
   267		force_sig(SIGSEGV);
   268		return 0;
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
