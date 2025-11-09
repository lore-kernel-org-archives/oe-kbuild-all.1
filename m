Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED848175A5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762678888; cv=none; b=Ld/57S92JOjbdc/XBs/78IL+0O1esYiS4hPAVsZBDZz55EnElLvdN4GRb7+AlichluHaJfvfkqULIkm/UNJHMEjFpNnQOhcBzJGImmFmox79nyopyHkBr1Lze+EHzQxL7vHs1WttQdrvXuFEQGm1r8cxFJgeFAI00m0dZrByOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762678888; c=relaxed/simple;
	bh=5SVGLZu3s0vUpV8lZzzM2/EMzL3Ku3FfNFdPwVs2rAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eh6LTCAzYyHzPpXtPPXtDipIa4lc6yf0tkoX25bLue39HOk1hUsVgmTjt3rYc9HCfeid2CWlV9RxlgKp+HNbvE0Qw0LAk4CxXv9twvXjkbs1Frmwog6wiI35rg0X2AjTRMg4vt8J1xNJ0PLJLFPC5zumfwP6P4B5+sN0gzm1vZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7dHC6WL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7dHC6WL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762678886; x=1794214886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5SVGLZu3s0vUpV8lZzzM2/EMzL3Ku3FfNFdPwVs2rAk=;
  b=J7dHC6WLyPHSvBK/jOOAEABU86IBWYXyMP7wYjBYA7Uk1RBwjPMBwDMk
   L8tTlSCcTxCne/B9SLt5MiUhQ7MWsnJq+CuxH3EXRpBqgUD9b6ptVcpf/
   ohy6vQ4IsaEJfqvw1oGgH/drM03/G6maOfdatOU1dcWFL4vazfO0qWnfv
   m0xG8+LAxHefiIGy4Kg3L5MPNUPhmKgrhqg/+IfC1imep98BAhGsR1CPO
   uCdmZIENm221S9lXcsOuJbND0RsAgCXVa+JNf6ZdlFiwePws98sFpudR6
   +RCW8zXqCFOFnfI2hUxiwlc3owXMbYeTgnZSusZ/s8Q5Di6PaX0xihzqm
   Q==;
X-CSE-ConnectionGUID: T3qFcUZITFCOKaPr2uwI8A==
X-CSE-MsgGUID: J+Mfbb2vRruG5rG1Ld/33w==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="64916522"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="64916522"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 01:01:25 -0800
X-CSE-ConnectionGUID: GNLwoQsHRoKumja+rT12hw==
X-CSE-MsgGUID: Cr1F9l02SCOeoQIq1uF4Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="192809353"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Nov 2025 01:01:25 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI1IY-0001tL-0r;
	Sun, 09 Nov 2025 09:01:22 +0000
Date: Sun, 9 Nov 2025 17:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_prolog 6/8] arch/x86/kernel/uprobes.c:859
 __do_sys_uprobe() warn: inconsistent indenting
Message-ID: <202511091656.ysbsQyC5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_prolog
head:   0a54bb564fac2eaf528c88c5d6abc55213a4f073
commit: d61886bf13325710a187aeed37cef10307a87c36 [6/8] opt
config: x86_64-randconfig-161-20251109 (https://download.01.org/0day-ci/archive/20251109/202511091656.ysbsQyC5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511091656.ysbsQyC5-lkp@intel.com/

smatch warnings:
arch/x86/kernel/uprobes.c:859 __do_sys_uprobe() warn: inconsistent indenting

vim +859 arch/x86/kernel/uprobes.c

   809	
   810	SYSCALL_DEFINE0(uprobe)
   811	{
   812		struct pt_regs *regs = task_pt_regs(current);
   813		struct uprobe_syscall_args args;
   814		unsigned long ip, sp, sret;
   815		int err;
   816	
   817		trace_printk("SYS0\n");
   818	
   819		/* Allow execution only from uprobe trampolines. */
   820		if (!in_uprobe_trampoline(regs->ip))
   821			return -ENXIO;
   822	
   823		err = copy_from_user(&args, (void __user *)regs->sp, sizeof(args));
   824		if (err)
   825			goto sigill;
   826	
   827		ip = regs->ip;
   828	
   829		/*
   830		 * expose the "right" values of ax/r11/cx/ip/sp to uprobe_consumer/s, plus:
   831		 * - adjust ip to the probe address, call saved next instruction address
   832		 * - adjust sp to the probe's stack frame (check trampoline code)
   833		 */
   834		regs->ax  = args.ax;
   835		regs->r11 = args.r11;
   836		regs->cx  = args.cx;
   837		regs->ip  = args.retaddr - 5;
   838		regs->sp += sizeof(args);
   839		regs->orig_ax = -1;
   840	
   841		sp = regs->sp;
   842	
   843		err = shstk_pop((u64 *)&sret);
   844		if (err == -EFAULT || (!err && sret != args.retaddr))
   845			goto sigill;
   846	
   847		trace_printk("SYS1 ip %lx sp %lx retaddr %lx\n", regs->ip, regs->sp, args.retaddr);
   848		handle_syscall_uprobe(regs, regs->ip);
   849		trace_printk("SYS2 ip %lx sp %lx\n", regs->ip, regs->sp);
   850	
   851		/*
   852		 * Some of the uprobe consumers has changed sp, we can do nothing,
   853		 * just return via iret.
   854		 */
   855		if (regs->sp != sp) {
   856			/* skip the trampoline call */
   857			if (args.retaddr - 5 == regs->ip)
   858				regs->ip += 5;
 > 859		trace_printk("SYS3 ip %lx sp %lx\n", regs->ip, regs->sp);
   860			return regs->ax;
   861		}
   862	
   863		regs->sp -= sizeof(args);
   864	
   865		/* for the case uprobe_consumer has changed ax/r11/cx */
   866		args.ax  = regs->ax;
   867		args.r11 = regs->r11;
   868		args.cx  = regs->cx;
   869	
   870		/* keep return address unless we are instructed otherwise */
   871		if (args.retaddr - 5 != regs->ip)
   872			args.retaddr = regs->ip;
   873	
   874		if (shstk_push(args.retaddr) == -EFAULT)
   875			goto sigill;
   876	
   877		regs->ip = ip;
   878	
   879		err = copy_to_user((void __user *)regs->sp, &args, sizeof(args));
   880		if (err)
   881			goto sigill;
   882	
   883		/* ensure sysret, see do_syscall_64() */
   884		regs->r11 = regs->flags;
   885		regs->cx  = regs->ip;
   886		return 0;
   887	
   888	sigill:
   889		force_sig(SIGILL);
   890		return -1;
   891	}
   892	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
