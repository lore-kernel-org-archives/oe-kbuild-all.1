Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD733A75B6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 22:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859981; cv=none; b=CdBhGpzg9lUj3jKMrFdPBZ0Omu0GdVizQza9S65KRfQpRa5rUTkR8LMroc46XTjGb6tWLtgGBbB2ScETRk5AgOvNJHjELAmQdwqvVNWoK64OQFdhtO/8jP4VRP7GfsqozEdmeSBmDy/nwllo8b+VRc0HDMl5w3uzzUfUzxdGkBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859981; c=relaxed/simple;
	bh=Rk5eQMwJHkv6O7alYKUX6LiEWngq1Rth0mm2mJVJSPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HgkPRiWPSCVB3Pe5vhN+5gAGVrLVFyaENObUzhnnE07uVKioKYwJePycWjeGGnD2aMvHO67trmt74ef/ZHyU8AvqfNWYj/ze7fo7VdulyuO7ee+P552fxZItW2h746xMnFw82uwi5LEt1Vb5H1P3iqU9W+oqIY3wZ3QZTwcsd1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKUsM9Tl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKUsM9Tl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775859980; x=1807395980;
  h=date:from:to:cc:subject:message-id;
  bh=Rk5eQMwJHkv6O7alYKUX6LiEWngq1Rth0mm2mJVJSPk=;
  b=PKUsM9TlkIy0FL/elllDPvqtJJPtmi4HanuMjgGZYNu3MsGNkDawDOfn
   sNS6wCaSO9dLTMAKPGfqR+y+JV6qQzoJeNFsIYNNeZ0QzWC2s8MbpRkSB
   4qiOtX/jveapM72sb4wMWN9cWdvskLD8nuHqHUh1B1V3Ny1dfY02iwxQi
   wMa/EgQzWzk2gORChDyvrcoWa3r3Z65hIVcoBaAFPsTQuM43tJElkw81F
   mY3ZJHWcdzuuMkKb+5oKuc2Ui1HCiJzI/1q3MoKqnPXasSYZJyRO8ssqa
   oUoShCazpVKOxWtSqVG1AZz7wMPChrL6PPzZPtZT1NX5gnx8Qmcw2o2QN
   Q==;
X-CSE-ConnectionGUID: CsInB88oSimIkg6QD6hkMg==
X-CSE-MsgGUID: DcVQtGl4R2eErp8/P9sTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75927799"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="75927799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:26:19 -0700
X-CSE-ConnectionGUID: 27x8t05BRCmXu0I2E59aKQ==
X-CSE-MsgGUID: WxpnrdhqSw6S+8S5HKJsrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="252578549"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 15:26:18 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBKIp-000000000I1-3TuR;
	Fri, 10 Apr 2026 22:26:15 +0000
Date: Sat, 11 Apr 2026 06:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lindholm-alpha:entry 6/6] arch/alpha/kernel/signal.c:476:1:
 warning: no previous prototype for 'do_signal'
Message-ID: <202604110614.CouGiknY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git entry
head:   dd381ec93e43e70caf8dcc4bbad69a43aefb11cb
commit: dd381ec93e43e70caf8dcc4bbad69a43aefb11cb [6/6] alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604110614.CouGiknY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110614.CouGiknY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110614.CouGiknY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/alpha/kernel/signal.c:29:6: warning: no previous prototype for 'alpha_schedule_user_work' [-Wmissing-prototypes]
      29 | void alpha_schedule_user_work(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/alpha/kernel/signal.c:476:1: warning: no previous prototype for 'do_signal' [-Wmissing-prototypes]
     476 | do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
         | ^~~~~~~~~
   arch/alpha/kernel/signal.c:514:25: warning: no previous prototype for 'alpha_syscall_exit_to_user_mode' [-Wmissing-prototypes]
     514 | asmlinkage noinstr void alpha_syscall_exit_to_user_mode(struct pt_regs *regs)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/alpha/kernel/signal.c:522:25: warning: no previous prototype for 'alpha_syscall_enter_from_user_mode' [-Wmissing-prototypes]
     522 | asmlinkage noinstr void alpha_syscall_enter_from_user_mode(struct pt_regs *regs)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/alpha/kernel/signal.c:612:14: warning: no previous prototype for 'alpha_trace_enter_syscall' [-Wmissing-prototypes]
     612 | noinstr long alpha_trace_enter_syscall(struct pt_regs *regs)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/alpha/kernel/signal.c:630:23: warning: no previous prototype for 'alpha_finish_syscall' [-Wmissing-prototypes]
     630 | noinstr unsigned long alpha_finish_syscall(struct pt_regs *regs, long ret)
         |                       ^~~~~~~~~~~~~~~~~~~~
>> arch/alpha/kernel/signal.c:635:23: warning: no previous prototype for 'alpha_trace_finish_syscall' [-Wmissing-prototypes]
     635 | noinstr unsigned long alpha_trace_finish_syscall(struct pt_regs *regs, long ret)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/do_signal +476 arch/alpha/kernel/signal.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  460  
^1da177e4c3f41 Linus Torvalds    2005-04-16  461  
^1da177e4c3f41 Linus Torvalds    2005-04-16  462  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  463   * Note that 'init' is a special process: it doesn't get signals it doesn't
^1da177e4c3f41 Linus Torvalds    2005-04-16  464   * want to handle. Thus you cannot kill init even with a SIGKILL even by
^1da177e4c3f41 Linus Torvalds    2005-04-16  465   * mistake.
^1da177e4c3f41 Linus Torvalds    2005-04-16  466   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  467   * Note that we go through the signals twice: once to check the signals that
^1da177e4c3f41 Linus Torvalds    2005-04-16  468   * the kernel can handle, and then we build all the user-level signal handling
^1da177e4c3f41 Linus Torvalds    2005-04-16  469   * stack-frames in one go after that.
^1da177e4c3f41 Linus Torvalds    2005-04-16  470   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  471   * "r0" and "r19" are the registers we need to restore for system call
^1da177e4c3f41 Linus Torvalds    2005-04-16  472   * restart. "r0" is also used as an indicator whether we can restart at
^1da177e4c3f41 Linus Torvalds    2005-04-16  473   * all (if we get here from anything but a syscall return, it will be 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  474   */
dd381ec93e43e7 Magnus Lindholm   2026-04-10  475  void
d9d0738a898dd2 Al Viro           2012-09-05 @476  do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
^1da177e4c3f41 Linus Torvalds    2005-04-16  477  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  478  	unsigned long single_stepping = ptrace_cancel_bpt(current);
cfd60c0789f395 Al Viro           2012-11-07  479  	struct ksignal ksig;
^1da177e4c3f41 Linus Torvalds    2005-04-16  480  
^1da177e4c3f41 Linus Torvalds    2005-04-16  481  	/* This lets the debugger run, ... */
cfd60c0789f395 Al Viro           2012-11-07  482  	if (get_signal(&ksig)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  483  		/* ... so re-check the single stepping. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  484  		single_stepping |= ptrace_cancel_bpt(current);
^1da177e4c3f41 Linus Torvalds    2005-04-16  485  		/* Whee!  Actually deliver the signal.  */
b927b3e2c9bc39 Richard Henderson 2007-05-29  486  		if (r0)
cfd60c0789f395 Al Viro           2012-11-07  487  			syscall_restart(r0, r19, regs, &ksig.ka);
cfd60c0789f395 Al Viro           2012-11-07  488  		handle_signal(&ksig, regs);
cfd60c0789f395 Al Viro           2012-11-07  489  	} else {
cfd60c0789f395 Al Viro           2012-11-07  490  		single_stepping |= ptrace_cancel_bpt(current);
^1da177e4c3f41 Linus Torvalds    2005-04-16  491  		if (r0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  492  			switch (regs->r0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  493  			case ERESTARTNOHAND:
^1da177e4c3f41 Linus Torvalds    2005-04-16  494  			case ERESTARTSYS:
^1da177e4c3f41 Linus Torvalds    2005-04-16  495  			case ERESTARTNOINTR:
^1da177e4c3f41 Linus Torvalds    2005-04-16  496  				/* Reset v0 and a3 and replay syscall.  */
^1da177e4c3f41 Linus Torvalds    2005-04-16  497  				regs->r0 = r0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  498  				regs->r19 = r19;
^1da177e4c3f41 Linus Torvalds    2005-04-16  499  				regs->pc -= 4;
^1da177e4c3f41 Linus Torvalds    2005-04-16  500  				break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  501  			case ERESTART_RESTARTBLOCK:
cfd60c0789f395 Al Viro           2012-11-07  502  				/* Set v0 to the restart_syscall and replay */
^1da177e4c3f41 Linus Torvalds    2005-04-16  503  				regs->r0 = __NR_restart_syscall;
^1da177e4c3f41 Linus Torvalds    2005-04-16  504  				regs->pc -= 4;
^1da177e4c3f41 Linus Torvalds    2005-04-16  505  				break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  506  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  507  		}
51a7b448d4134e Al Viro           2012-05-21  508  		restore_saved_sigmask();
cfd60c0789f395 Al Viro           2012-11-07  509  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  510  	if (single_stepping)
^1da177e4c3f41 Linus Torvalds    2005-04-16  511  		ptrace_set_bpt(current);	/* re-set breakpoint */
^1da177e4c3f41 Linus Torvalds    2005-04-16  512  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  513  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  514  asmlinkage noinstr void alpha_syscall_exit_to_user_mode(struct pt_regs *regs)
^1da177e4c3f41 Linus Torvalds    2005-04-16  515  {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  516  	local_irq_disable_exit_to_user();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  517  	syscall_exit_to_user_mode_prepare(regs);
dd381ec93e43e7 Magnus Lindholm   2026-04-10  518  	exit_to_user_mode();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  519  }
dd381ec93e43e7 Magnus Lindholm   2026-04-10  520  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  521  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  522  asmlinkage noinstr void alpha_syscall_enter_from_user_mode(struct pt_regs *regs)
dd381ec93e43e7 Magnus Lindholm   2026-04-10  523  {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  524  	enter_from_user_mode(regs);
dd381ec93e43e7 Magnus Lindholm   2026-04-10  525  }
dd381ec93e43e7 Magnus Lindholm   2026-04-10  526  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  527  /*
dd381ec93e43e7 Magnus Lindholm   2026-04-10  528   * Return true for the errno values that allow restart.
dd381ec93e43e7 Magnus Lindholm   2026-04-10  529   */
dd381ec93e43e7 Magnus Lindholm   2026-04-10  530  static __always_inline bool alpha_is_restart_errno(unsigned long err)
dd381ec93e43e7 Magnus Lindholm   2026-04-10  531  {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  532  	return	err == ERESTARTSYS ||
dd381ec93e43e7 Magnus Lindholm   2026-04-10  533  		err == ERESTARTNOINTR ||
dd381ec93e43e7 Magnus Lindholm   2026-04-10  534  		err == ERESTARTNOHAND ||
dd381ec93e43e7 Magnus Lindholm   2026-04-10  535  		err == ERESTART_RESTARTBLOCK;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  536  }
dd381ec93e43e7 Magnus Lindholm   2026-04-10  537  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  538  static noinstr unsigned long
dd381ec93e43e7 Magnus Lindholm   2026-04-10  539  alpha_finish_syscall_common(struct pt_regs *regs, long ret, bool traced)
dd381ec93e43e7 Magnus Lindholm   2026-04-10  540  {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  541  	unsigned long restart = 1;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  542  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  543  	current_thread_info()->syscall_saved_r19 = regs->r19;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  544  	instrumentation_begin();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  545  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  546  	if (traced && (long)regs->r1 == -1) {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  547  		/*
dd381ec93e43e7 Magnus Lindholm   2026-04-10  548  		 * Skip-dispatch path: preserve raw return state so the gate
dd381ec93e43e7 Magnus Lindholm   2026-04-10  549  		 * can normalize "-1 success" to ENOSYS/a3=1 and decide restart.
dd381ec93e43e7 Magnus Lindholm   2026-04-10  550  		 */
dd381ec93e43e7 Magnus Lindholm   2026-04-10  551  		regs->r0 = ret;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  552  		restart = alpha_skip_return_restart_gate(regs);
dd381ec93e43e7 Magnus Lindholm   2026-04-10  553  		syscall_trace_leave(regs);
dd381ec93e43e7 Magnus Lindholm   2026-04-10  554  		instrumentation_end();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  555  		return restart;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  556  	}
dd381ec93e43e7 Magnus Lindholm   2026-04-10  557  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  558  	if (ret < 0) {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  559  		regs->r0 = -ret;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  560  		regs->r19 = 1;
6972d6f25d21e3 Al Viro           2012-09-05  561  	} else {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  562  		regs->r0 = ret;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  563  		regs->r19 = 0;
d0420c83f39f79 David Howells     2009-09-02  564  	}
dd381ec93e43e7 Magnus Lindholm   2026-04-10  565  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  566  	if (traced) {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  567  		restart = (regs->r19 == 1 &&
dd381ec93e43e7 Magnus Lindholm   2026-04-10  568  		alpha_is_restart_errno(regs->r0)) ? 0 : 1;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  569  		syscall_trace_leave(regs);
dd381ec93e43e7 Magnus Lindholm   2026-04-10  570  		instrumentation_end();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  571  		return restart;
^1da177e4c3f41 Linus Torvalds    2005-04-16  572  	}
dd381ec93e43e7 Magnus Lindholm   2026-04-10  573  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  574  	restart = (regs->r19 == 1 && alpha_is_restart_errno(regs->r0)) ? 0 : 1;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  575  	instrumentation_end();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  576  	return restart;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  577  }
dd381ec93e43e7 Magnus Lindholm   2026-04-10  578  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  579  void arch_do_signal_or_restart(struct pt_regs *regs)
dd381ec93e43e7 Magnus Lindholm   2026-04-10  580  {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  581  	unsigned long old_r19 = current_thread_info()->syscall_saved_r19;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  582  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  583  	do_signal(regs, regs->r2, old_r19);
dd381ec93e43e7 Magnus Lindholm   2026-04-10  584  }
dd381ec93e43e7 Magnus Lindholm   2026-04-10  585  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  586  /*
dd381ec93e43e7 Magnus Lindholm   2026-04-10  587   * Adjust this typedef to match Alpha's syscall table declaration.
dd381ec93e43e7 Magnus Lindholm   2026-04-10  588   * The asm currently calls sys_call_table[nr] with args in r16-r21.
dd381ec93e43e7 Magnus Lindholm   2026-04-10  589   */
dd381ec93e43e7 Magnus Lindholm   2026-04-10  590  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  591  noinstr unsigned long alpha_skip_return_restart_gate(struct pt_regs *regs)
dd381ec93e43e7 Magnus Lindholm   2026-04-10  592  {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  593  	if (regs->r19 == 0 && regs->r0 == (unsigned long)-1) {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  594  		regs->r0 = ENOSYS;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  595  		regs->r19 = 1;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  596  	}
dd381ec93e43e7 Magnus Lindholm   2026-04-10  597  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  598  	if (regs->r19 == 0)
dd381ec93e43e7 Magnus Lindholm   2026-04-10  599  		return 1;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  600  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  601  	if (regs->r0 == ERESTARTSYS ||
dd381ec93e43e7 Magnus Lindholm   2026-04-10  602  		regs->r0 == ERESTARTNOINTR ||
dd381ec93e43e7 Magnus Lindholm   2026-04-10  603  		regs->r0 == ERESTARTNOHAND ||
dd381ec93e43e7 Magnus Lindholm   2026-04-10  604  		regs->r0 == ERESTART_RESTARTBLOCK) {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  605  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  606  		return 0;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  607  	}
dd381ec93e43e7 Magnus Lindholm   2026-04-10  608  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  609  	return 1;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  610  }
dd381ec93e43e7 Magnus Lindholm   2026-04-10  611  
dd381ec93e43e7 Magnus Lindholm   2026-04-10 @612  noinstr long alpha_trace_enter_syscall(struct pt_regs *regs)
dd381ec93e43e7 Magnus Lindholm   2026-04-10  613  {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  614  	struct thread_info *ti = current_thread_info();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  615  	unsigned long nr;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  616  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  617  	if (!(ti->status & TS_SAVED_FP)) {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  618  		ti->status |= TS_SAVED_FP;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  619  		__save_fpu();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  620  	}
dd381ec93e43e7 Magnus Lindholm   2026-04-10  621  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  622  	instrumentation_begin();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  623  	nr = syscall_trace_enter(regs);
dd381ec93e43e7 Magnus Lindholm   2026-04-10  624  	regs->r1 = nr;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  625  	instrumentation_end();
dd381ec93e43e7 Magnus Lindholm   2026-04-10  626  
dd381ec93e43e7 Magnus Lindholm   2026-04-10  627  	return nr;
dd381ec93e43e7 Magnus Lindholm   2026-04-10  628  }
dd381ec93e43e7 Magnus Lindholm   2026-04-10  629  
dd381ec93e43e7 Magnus Lindholm   2026-04-10 @630  noinstr unsigned long alpha_finish_syscall(struct pt_regs *regs, long ret)
dd381ec93e43e7 Magnus Lindholm   2026-04-10  631  {
dd381ec93e43e7 Magnus Lindholm   2026-04-10  632  	return alpha_finish_syscall_common(regs, ret, false);
dd381ec93e43e7 Magnus Lindholm   2026-04-10  633  }
dd381ec93e43e7 Magnus Lindholm   2026-04-10  634  
dd381ec93e43e7 Magnus Lindholm   2026-04-10 @635  noinstr unsigned long alpha_trace_finish_syscall(struct pt_regs *regs, long ret)

:::::: The code at line 476 was first introduced by commit
:::::: d9d0738a898dd26a417d00a6923eef1015d33735 alpha: don't bother passing switch_stack separately from regs

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
