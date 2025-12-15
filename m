Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C55154425
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765810249; cv=none; b=htDSRZG+R5AhTlJVgpqN8EvDDaccLLBLieFGmKW+h1Pwi27KZF+P8nfHCg9YXgK1RkFZVAo2XldYqiggOCxXuKGOIdqvxkLnmlgle3mXJDwPpWmC9tvyklpia/oPD4RJ/NV+vhMU15nVfM91d+s4k/Yu/FAKmw6Xp1ybMD34s1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765810249; c=relaxed/simple;
	bh=FzYNLRdpmcXHZZwxP5++6K4LRrKGrKlTwO5tKEZlmt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ls6+Qqqm0t6svtgEcsYDMQFMlLLH9Kg5tpHBmaN0UI+N+un2awd8Ui1yKwVMraDP8Jqym/KUTNkahuLTyy7yiiBAb9SFtURecVxEi+Cq/b32D6GolNx1IaHoGAaTmX1VtM/gKNCEMnY/ozSfJTBpoHjCkB+6sFR+eMlQv5YHGYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fIsg1pmo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fIsg1pmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765810247; x=1797346247;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FzYNLRdpmcXHZZwxP5++6K4LRrKGrKlTwO5tKEZlmt4=;
  b=fIsg1pmoysb9n1/7Po2TkeuBPKlZz3+3KlXGG9hvhLEp3mYfPY3jbm2K
   w/9CEnKg+YxQJXIXY6qDfHPbE05vrDtmBSEisETtA/FzhxCdcixQlaFSp
   bHXmynA9J6RBSB2gewPOIq4GA/GEZ1iPxI1Z8YBIkKix0MNarzOZVGjMB
   1Xgtw8zNQZdNIQpKcgrG6AOL6rAyvLEXlA9PY8kE3WwRnZiKEAdTpxkUp
   0zEY+i3edUOjkLBGi3iI84tdbY3LJslmuCHs8iTHYDLT25XexbDJyIy0F
   riKEk67nw8/8Gbfq0kn//0cj+gCQZwSVFnV/Xb3Q3TA/sOKZWgQtEIo6q
   g==;
X-CSE-ConnectionGUID: TbjH0LW+RNi3kkF6RvlTjQ==
X-CSE-MsgGUID: cUL+SX3aQzOibkvPG9VqBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85122672"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="85122672"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:50:46 -0800
X-CSE-ConnectionGUID: y0jpO84aQY2XB9D6MqjXOw==
X-CSE-MsgGUID: Ee9XrRCuTL2FTXZqSt9pug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="228392794"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2025 06:50:45 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV9uN-000000000Nl-08tY;
	Mon, 15 Dec 2025 14:50:43 +0000
Date: Mon, 15 Dec 2025 22:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Subject: [linux-next:master 293/1223] arch/riscv/kernel/signal.c:133:15:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202512152232.eOvLxaYa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4a5663c04bb679631985a15efab774da58c37815
commit: 04e5bcd97ab8af51199d59fb9444653d25ed9fe7 [293/1223] riscv: signal: abstract header saving for setup_sigcontext
config: riscv-randconfig-r123-20251215 (https://download.01.org/0day-ci/archive/20251215/202512152232.eOvLxaYa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512152232.eOvLxaYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512152232.eOvLxaYa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *datap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] __user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *datap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] __user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *datap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] __user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *datap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] __user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:148:22: sparse: sparse: symbol 'arch_ext_list' was not declared. Should it be static?
>> arch/riscv/kernel/signal.c:155:14: sparse: sparse: symbol 'nr_arch_exts' was not declared. Should it be static?
>> arch/riscv/kernel/signal.c:300:39: sparse: sparse: cast removes address space '__user' of expression
>> arch/riscv/kernel/signal.c:300:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct __riscv_ctx_hdr [noderef] __user *sc_ext_ptr @@     got void * @@
   arch/riscv/kernel/signal.c:300:36: sparse:     expected struct __riscv_ctx_hdr [noderef] __user *sc_ext_ptr
   arch/riscv/kernel/signal.c:300:36: sparse:     got void *

vim +133 arch/riscv/kernel/signal.c

8ee0b41898fa26 Greentime Hu      2023-06-05  107  
8ee0b41898fa26 Greentime Hu      2023-06-05  108  /*
8ee0b41898fa26 Greentime Hu      2023-06-05  109   * Restore Vector extension context from the user's signal frame. This function
8ee0b41898fa26 Greentime Hu      2023-06-05  110   * assumes a valid extension header. So magic and size checking must be done by
8ee0b41898fa26 Greentime Hu      2023-06-05  111   * the caller.
8ee0b41898fa26 Greentime Hu      2023-06-05  112   */
8ee0b41898fa26 Greentime Hu      2023-06-05  113  static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26 Greentime Hu      2023-06-05  114  {
8ee0b41898fa26 Greentime Hu      2023-06-05  115  	long err;
8ee0b41898fa26 Greentime Hu      2023-06-05  116  	struct __sc_riscv_v_state __user *state = sc_vec;
8ee0b41898fa26 Greentime Hu      2023-06-05  117  	void __user *datap;
8ee0b41898fa26 Greentime Hu      2023-06-05  118  
c27fa53b858b4e Björn Töpel       2024-04-03  119  	/*
c27fa53b858b4e Björn Töpel       2024-04-03  120  	 * Mark the vstate as clean prior performing the actual copy,
c27fa53b858b4e Björn Töpel       2024-04-03  121  	 * to avoid getting the vstate incorrectly clobbered by the
c27fa53b858b4e Björn Töpel       2024-04-03  122  	 *  discarded vector state.
c27fa53b858b4e Björn Töpel       2024-04-03  123  	 */
c27fa53b858b4e Björn Töpel       2024-04-03  124  	riscv_v_vstate_set_restore(current, regs);
c27fa53b858b4e Björn Töpel       2024-04-03  125  
8ee0b41898fa26 Greentime Hu      2023-06-05  126  	/* Copy everything of __sc_riscv_v_state except datap. */
8ee0b41898fa26 Greentime Hu      2023-06-05  127  	err = __copy_from_user(&current->thread.vstate, &state->v_state,
8ee0b41898fa26 Greentime Hu      2023-06-05  128  			       offsetof(struct __riscv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu      2023-06-05  129  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu      2023-06-05  130  		return err;
8ee0b41898fa26 Greentime Hu      2023-06-05  131  
8ee0b41898fa26 Greentime Hu      2023-06-05  132  	/* Copy the pointer datap itself. */
8ee0b41898fa26 Greentime Hu      2023-06-05 @133  	err = __get_user(datap, &state->v_state.datap);
8ee0b41898fa26 Greentime Hu      2023-06-05  134  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu      2023-06-05  135  		return err;
8ee0b41898fa26 Greentime Hu      2023-06-05  136  	/*
8ee0b41898fa26 Greentime Hu      2023-06-05  137  	 * Copy the whole vector content from user space datap. Use
8ee0b41898fa26 Greentime Hu      2023-06-05  138  	 * copy_from_user to prevent information leak.
8ee0b41898fa26 Greentime Hu      2023-06-05  139  	 */
c27fa53b858b4e Björn Töpel       2024-04-03  140  	return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu      2023-06-05  141  }
04e5bcd97ab8af Andy Chiu         2025-11-12  142  
04e5bcd97ab8af Andy Chiu         2025-11-12  143  struct arch_ext_priv {
04e5bcd97ab8af Andy Chiu         2025-11-12  144  	__u32 magic;
04e5bcd97ab8af Andy Chiu         2025-11-12  145  	long (*save)(struct pt_regs *regs, void __user *sc_vec);
04e5bcd97ab8af Andy Chiu         2025-11-12  146  };
04e5bcd97ab8af Andy Chiu         2025-11-12  147  
04e5bcd97ab8af Andy Chiu         2025-11-12 @148  struct arch_ext_priv arch_ext_list[] = {
04e5bcd97ab8af Andy Chiu         2025-11-12  149  	{
04e5bcd97ab8af Andy Chiu         2025-11-12  150  		.magic = RISCV_V_MAGIC,
04e5bcd97ab8af Andy Chiu         2025-11-12  151  		.save = &save_v_state,
04e5bcd97ab8af Andy Chiu         2025-11-12  152  	},
04e5bcd97ab8af Andy Chiu         2025-11-12  153  };
04e5bcd97ab8af Andy Chiu         2025-11-12  154  
04e5bcd97ab8af Andy Chiu         2025-11-12 @155  const size_t nr_arch_exts = ARRAY_SIZE(arch_ext_list);
8ee0b41898fa26 Greentime Hu      2023-06-05  156  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  157  static long restore_sigcontext(struct pt_regs *regs,
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  158  	struct sigcontext __user *sc)
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  159  {
8ee0b41898fa26 Greentime Hu      2023-06-05  160  	void __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
8ee0b41898fa26 Greentime Hu      2023-06-05  161  	__u32 rsvd;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  162  	long err;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  163  	/* sc_regs is structured the same as the start of pt_regs */
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  164  	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
a45cedaa1ac0da Andy Chiu         2023-06-05  165  	if (unlikely(err))
a45cedaa1ac0da Andy Chiu         2023-06-05  166  		return err;
a45cedaa1ac0da Andy Chiu         2023-06-05  167  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  168  	/* Restore the floating-point state. */
a45cedaa1ac0da Andy Chiu         2023-06-05  169  	if (has_fpu()) {
a45cedaa1ac0da Andy Chiu         2023-06-05  170  		err = restore_fp_state(regs, &sc->sc_fpregs);
a45cedaa1ac0da Andy Chiu         2023-06-05  171  		if (unlikely(err))
a45cedaa1ac0da Andy Chiu         2023-06-05  172  			return err;
a45cedaa1ac0da Andy Chiu         2023-06-05  173  	}
a45cedaa1ac0da Andy Chiu         2023-06-05  174  
8ee0b41898fa26 Greentime Hu      2023-06-05  175  	/* Check the reserved word before extensions parsing */
8ee0b41898fa26 Greentime Hu      2023-06-05  176  	err = __get_user(rsvd, &sc->sc_extdesc.reserved);
8ee0b41898fa26 Greentime Hu      2023-06-05  177  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu      2023-06-05  178  		return err;
8ee0b41898fa26 Greentime Hu      2023-06-05  179  	if (unlikely(rsvd))
8ee0b41898fa26 Greentime Hu      2023-06-05  180  		return -EINVAL;
8ee0b41898fa26 Greentime Hu      2023-06-05  181  
8ee0b41898fa26 Greentime Hu      2023-06-05  182  	while (!err) {
8ee0b41898fa26 Greentime Hu      2023-06-05  183  		__u32 magic, size;
8ee0b41898fa26 Greentime Hu      2023-06-05  184  		struct __riscv_ctx_hdr __user *head = sc_ext_ptr;
a45cedaa1ac0da Andy Chiu         2023-06-05  185  
8ee0b41898fa26 Greentime Hu      2023-06-05  186  		err |= __get_user(magic, &head->magic);
8ee0b41898fa26 Greentime Hu      2023-06-05  187  		err |= __get_user(size, &head->size);
a45cedaa1ac0da Andy Chiu         2023-06-05  188  		if (unlikely(err))
8ee0b41898fa26 Greentime Hu      2023-06-05  189  			return err;
8ee0b41898fa26 Greentime Hu      2023-06-05  190  
8ee0b41898fa26 Greentime Hu      2023-06-05  191  		sc_ext_ptr += sizeof(*head);
8ee0b41898fa26 Greentime Hu      2023-06-05  192  		switch (magic) {
8ee0b41898fa26 Greentime Hu      2023-06-05  193  		case END_MAGIC:
8ee0b41898fa26 Greentime Hu      2023-06-05  194  			if (size != END_HDR_SIZE)
8ee0b41898fa26 Greentime Hu      2023-06-05  195  				return -EINVAL;
8ee0b41898fa26 Greentime Hu      2023-06-05  196  
8ee0b41898fa26 Greentime Hu      2023-06-05  197  			return 0;
8ee0b41898fa26 Greentime Hu      2023-06-05  198  		case RISCV_V_MAGIC:
d863910eabaffc Charlie Jenkins   2024-11-13  199  			if (!(has_vector() || has_xtheadvector()) || !riscv_v_vstate_query(regs) ||
8ee0b41898fa26 Greentime Hu      2023-06-05  200  			    size != riscv_v_sc_size)
8ee0b41898fa26 Greentime Hu      2023-06-05  201  				return -EINVAL;
8ee0b41898fa26 Greentime Hu      2023-06-05  202  
8ee0b41898fa26 Greentime Hu      2023-06-05  203  			err = __restore_v_state(regs, sc_ext_ptr);
a45cedaa1ac0da Andy Chiu         2023-06-05  204  			break;
8ee0b41898fa26 Greentime Hu      2023-06-05  205  		default:
a45cedaa1ac0da Andy Chiu         2023-06-05  206  			return -EINVAL;
a45cedaa1ac0da Andy Chiu         2023-06-05  207  		}
8ee0b41898fa26 Greentime Hu      2023-06-05  208  		sc_ext_ptr = (void __user *)head + size;
8ee0b41898fa26 Greentime Hu      2023-06-05  209  	}
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  210  	return err;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  211  }
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  212  
e92f469b0771e6 Vincent Chen      2023-06-05  213  static size_t get_rt_frame_size(bool cal_all)
8ee0b41898fa26 Greentime Hu      2023-06-05  214  {
8ee0b41898fa26 Greentime Hu      2023-06-05  215  	struct rt_sigframe __user *frame;
8ee0b41898fa26 Greentime Hu      2023-06-05  216  	size_t frame_size;
8ee0b41898fa26 Greentime Hu      2023-06-05  217  	size_t total_context_size = 0;
8ee0b41898fa26 Greentime Hu      2023-06-05  218  
8ee0b41898fa26 Greentime Hu      2023-06-05  219  	frame_size = sizeof(*frame);
8ee0b41898fa26 Greentime Hu      2023-06-05  220  
d863910eabaffc Charlie Jenkins   2024-11-13  221  	if (has_vector() || has_xtheadvector()) {
e92f469b0771e6 Vincent Chen      2023-06-05  222  		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
8ee0b41898fa26 Greentime Hu      2023-06-05  223  			total_context_size += riscv_v_sc_size;
e92f469b0771e6 Vincent Chen      2023-06-05  224  	}
8ee0b41898fa26 Greentime Hu      2023-06-05  225  
8ee0b41898fa26 Greentime Hu      2023-06-05  226  	frame_size += total_context_size;
8ee0b41898fa26 Greentime Hu      2023-06-05  227  
8ee0b41898fa26 Greentime Hu      2023-06-05  228  	frame_size = round_up(frame_size, 16);
8ee0b41898fa26 Greentime Hu      2023-06-05  229  	return frame_size;
8ee0b41898fa26 Greentime Hu      2023-06-05  230  }
8ee0b41898fa26 Greentime Hu      2023-06-05  231  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  232  SYSCALL_DEFINE0(rt_sigreturn)
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  233  {
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  234  	struct pt_regs *regs = current_pt_regs();
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  235  	struct rt_sigframe __user *frame;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  236  	struct task_struct *task;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  237  	sigset_t set;
e92f469b0771e6 Vincent Chen      2023-06-05  238  	size_t frame_size = get_rt_frame_size(false);
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  239  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  240  	/* Always make any pending restarted system calls return -EINTR */
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  241  	current->restart_block.fn = do_no_restart_syscall;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  242  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  243  	frame = (struct rt_sigframe __user *)regs->sp;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  244  
8ee0b41898fa26 Greentime Hu      2023-06-05  245  	if (!access_ok(frame, frame_size))
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  246  		goto badframe;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  247  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  248  	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  249  		goto badframe;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  250  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  251  	set_current_blocked(&set);
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  252  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  253  	if (restore_sigcontext(regs, &frame->uc.uc_mcontext))
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  254  		goto badframe;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  255  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  256  	if (restore_altstack(&frame->uc.uc_stack))
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  257  		goto badframe;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  258  
762df359aa5849 Al Viro           2021-09-24  259  	regs->cause = -1UL;
762df359aa5849 Al Viro           2021-09-24  260  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  261  	return regs->a0;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  262  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  263  badframe:
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  264  	task = current;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  265  	if (show_unhandled_signals) {
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  266  		pr_info_ratelimited(
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  267  			"%s[%d]: bad frame in %s: frame=%p pc=%p sp=%p\n",
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  268  			task->comm, task_pid_nr(task), __func__,
a4c3733d32a72f Christoph Hellwig 2019-10-28  269  			frame, (void *)regs->epc, (void *)regs->sp);
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  270  	}
3cf5d076fb4d48 Eric W. Biederman 2019-05-23  271  	force_sig(SIGSEGV);
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  272  	return 0;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  273  }
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  274  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  275  static long setup_sigcontext(struct rt_sigframe __user *frame,
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  276  	struct pt_regs *regs)
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  277  {
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  278  	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
8ee0b41898fa26 Greentime Hu      2023-06-05  279  	struct __riscv_ctx_hdr __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
04e5bcd97ab8af Andy Chiu         2025-11-12  280  	struct arch_ext_priv *arch_ext;
04e5bcd97ab8af Andy Chiu         2025-11-12  281  	long err, i, ext_size;
a45cedaa1ac0da Andy Chiu         2023-06-05  282  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  283  	/* sc_regs is structured the same as the start of pt_regs */
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  284  	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  285  	/* Save the floating-point state. */
37a7a2a10ec525 Jisheng Zhang     2021-05-12  286  	if (has_fpu())
007f5c35895786 Alan Kao          2018-10-09  287  		err |= save_fp_state(regs, &sc->sc_fpregs);
8ee0b41898fa26 Greentime Hu      2023-06-05  288  	/* Save the vector state. */
04e5bcd97ab8af Andy Chiu         2025-11-12  289  	for (i = 0; i < nr_arch_exts; i++) {
04e5bcd97ab8af Andy Chiu         2025-11-12  290  		arch_ext = &arch_ext_list[i];
04e5bcd97ab8af Andy Chiu         2025-11-12  291  		if (!arch_ext->save)
04e5bcd97ab8af Andy Chiu         2025-11-12  292  			continue;
04e5bcd97ab8af Andy Chiu         2025-11-12  293  
04e5bcd97ab8af Andy Chiu         2025-11-12  294  		ext_size = arch_ext->save(regs, sc_ext_ptr + 1);
04e5bcd97ab8af Andy Chiu         2025-11-12  295  		if (ext_size <= 0) {
04e5bcd97ab8af Andy Chiu         2025-11-12  296  			err |= ext_size;
04e5bcd97ab8af Andy Chiu         2025-11-12  297  		} else {
04e5bcd97ab8af Andy Chiu         2025-11-12  298  			err |= __put_user(arch_ext->magic, &sc_ext_ptr->magic);
04e5bcd97ab8af Andy Chiu         2025-11-12  299  			err |= __put_user(ext_size, &sc_ext_ptr->size);
04e5bcd97ab8af Andy Chiu         2025-11-12 @300  			sc_ext_ptr = (void *)sc_ext_ptr + ext_size;
04e5bcd97ab8af Andy Chiu         2025-11-12  301  		}
04e5bcd97ab8af Andy Chiu         2025-11-12  302  	}
8ee0b41898fa26 Greentime Hu      2023-06-05  303  	/* Write zero to fp-reserved space and check it on restore_sigcontext */
8ee0b41898fa26 Greentime Hu      2023-06-05  304  	err |= __put_user(0, &sc->sc_extdesc.reserved);
8ee0b41898fa26 Greentime Hu      2023-06-05  305  	/* And put END __riscv_ctx_hdr at the end. */
8ee0b41898fa26 Greentime Hu      2023-06-05  306  	err |= __put_user(END_MAGIC, &sc_ext_ptr->magic);
8ee0b41898fa26 Greentime Hu      2023-06-05  307  	err |= __put_user(END_HDR_SIZE, &sc_ext_ptr->size);
a45cedaa1ac0da Andy Chiu         2023-06-05  308  
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  309  	return err;
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  310  }
e2c0cdfba7f699 Palmer Dabbelt    2017-07-10  311  

:::::: The code at line 133 was first introduced by commit
:::::: 8ee0b41898fa26f66e32237f179b6989c65600d6 riscv: signal: Add sigcontext save/restore for vector

:::::: TO: Greentime Hu <greentime.hu@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
