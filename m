Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AAB17ADE1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 04:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734063084; cv=none; b=gA0k0erQI/kKdPb4oJqSWYZ7HlD7TagOSJkJBKckDzov/yyIPDr2NM2bPKK8aQAGSLGhHehL6LX0qbo8rBG77ooGGgnrZw+K+kN+xtVotMgOTEimR5dnXmBaxDqWtkbLbozWoKgaDVsQ/UVFE4I9tsY7xqUKQhY7uS08l6x3aEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734063084; c=relaxed/simple;
	bh=V260stKIcRbvWJCBHBnTHE6F0uCtF1ojstrld7D9kqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QA9poCBYlaSx2BHNDMCljiTKkKTRwFRDBG164VJD7lqiNkfFYIRmF6ik50TgTJukb1395wCBZdfLgYZ7ORwlgx67aO3289uQaP/n2syXqqIQgSvFVCvzTLgN6pw0ix8iv7dmvQYt1klt0c9g3wm9XP+aXOitCImoZA59ArQOnzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNKQMkcu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNKQMkcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734063083; x=1765599083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V260stKIcRbvWJCBHBnTHE6F0uCtF1ojstrld7D9kqA=;
  b=CNKQMkcuuZ8IQw2uvWkBPzgvwhUEVPJMuOhxxoVv8LSEU9xmT2QkfW8T
   ab6BIW4vyHyYXTyv23JwyDhG6HdmZWOqpvOcTG3+EgZy+EqkPQFtdhVJ+
   V2TqtjoDWV5PW4LWnjmLUMBtX7ivpB0pFuNL/RI8bP9amKjwIxiNh1G1j
   t81Rm+bTlwgL8NMxSALlpUKCT4ciYak1cL0rc0D9NxIBeNjAO8PbN/FRA
   nB60Wj2rrGrXwpxfI5LKGqY4JX2ooTwEuYzXdSNupnLHrXTXm3ssTBi4G
   HKbNT/rbJetiiwmkU6szM+vNHykLFjNOt96jBvm8YttEA5gOrV06YIBgK
   Q==;
X-CSE-ConnectionGUID: OBHExk9jSAeadRxPYE/DWA==
X-CSE-MsgGUID: BzMgTOeBTyOXmXxC5NoEDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="22096971"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="22096971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 20:11:21 -0800
X-CSE-ConnectionGUID: FGzsd+2tTYOKpLCzThb9hQ==
X-CSE-MsgGUID: JlRQEnTKQbef965BQWOrtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133803205"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2024 20:11:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLx1I-000BgI-2K;
	Fri, 13 Dec 2024 04:11:16 +0000
Date: Fri, 13 Dec 2024 12:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Alexandre Chartre <alexandre.chartre@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: arch/x86/entry/common.c:211: warning: Function parameter or struct
 member 'regs' not described in 'do_int80_emulation'
Message-ID: <202412131236.a5HhOqXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pawan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eefa7a9c069908412f8f5d15833901d1b46ae1b2
commit: 7390db8aea0d64e9deb28b8e1ce716f5020c7ee5 x86/bhi: Add support for clearing branch history at syscall entry
date:   8 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241213/202412131236.a5HhOqXo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131236.a5HhOqXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131236.a5HhOqXo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/common.c:211: warning: Function parameter or struct member 'regs' not described in 'do_int80_emulation'


vim +211 arch/x86/entry/common.c

55617fb991df535 Thomas Gleixner 2023-12-04  190  
be5341eb0d43b1e Thomas Gleixner 2023-12-04  191  /**
7390db8aea0d64e Pawan Gupta     2024-03-11  192   * do_int80_emulation - 32-bit legacy syscall C entry from asm
be5341eb0d43b1e Thomas Gleixner 2023-12-04  193   *
be5341eb0d43b1e Thomas Gleixner 2023-12-04  194   * This entry point can be used by 32-bit and 64-bit programs to perform
be5341eb0d43b1e Thomas Gleixner 2023-12-04  195   * 32-bit system calls.  Instances of INT $0x80 can be found inline in
be5341eb0d43b1e Thomas Gleixner 2023-12-04  196   * various programs and libraries.  It is also used by the vDSO's
be5341eb0d43b1e Thomas Gleixner 2023-12-04  197   * __kernel_vsyscall fallback for hardware that doesn't support a faster
be5341eb0d43b1e Thomas Gleixner 2023-12-04  198   * entry method.  Restarted 32-bit system calls also fall back to INT
be5341eb0d43b1e Thomas Gleixner 2023-12-04  199   * $0x80 regardless of what instruction was originally used to do the
be5341eb0d43b1e Thomas Gleixner 2023-12-04  200   * system call.
be5341eb0d43b1e Thomas Gleixner 2023-12-04  201   *
be5341eb0d43b1e Thomas Gleixner 2023-12-04  202   * This is considered a slow path.  It is not used by most libc
be5341eb0d43b1e Thomas Gleixner 2023-12-04  203   * implementations on modern hardware except during process startup.
be5341eb0d43b1e Thomas Gleixner 2023-12-04  204   *
be5341eb0d43b1e Thomas Gleixner 2023-12-04  205   * The arguments for the INT $0x80 based syscall are on stack in the
be5341eb0d43b1e Thomas Gleixner 2023-12-04  206   * pt_regs structure:
be5341eb0d43b1e Thomas Gleixner 2023-12-04  207   *   eax:				system call number
be5341eb0d43b1e Thomas Gleixner 2023-12-04  208   *   ebx, ecx, edx, esi, edi, ebp:	arg1 - arg 6
be5341eb0d43b1e Thomas Gleixner 2023-12-04  209   */
7390db8aea0d64e Pawan Gupta     2024-03-11  210  __visible noinstr void do_int80_emulation(struct pt_regs *regs)
be5341eb0d43b1e Thomas Gleixner 2023-12-04 @211  {
be5341eb0d43b1e Thomas Gleixner 2023-12-04  212  	int nr;
be5341eb0d43b1e Thomas Gleixner 2023-12-04  213  
55617fb991df535 Thomas Gleixner 2023-12-04  214  	/* Kernel does not use INT $0x80! */
55617fb991df535 Thomas Gleixner 2023-12-04  215  	if (unlikely(!user_mode(regs))) {
55617fb991df535 Thomas Gleixner 2023-12-04  216  		irqentry_enter(regs);
55617fb991df535 Thomas Gleixner 2023-12-04  217  		instrumentation_begin();
55617fb991df535 Thomas Gleixner 2023-12-04  218  		panic("Unexpected external interrupt 0x80\n");
55617fb991df535 Thomas Gleixner 2023-12-04  219  	}
55617fb991df535 Thomas Gleixner 2023-12-04  220  
55617fb991df535 Thomas Gleixner 2023-12-04  221  	/*
55617fb991df535 Thomas Gleixner 2023-12-04  222  	 * Establish kernel context for instrumentation, including for
55617fb991df535 Thomas Gleixner 2023-12-04  223  	 * int80_is_external() below which calls into the APIC driver.
55617fb991df535 Thomas Gleixner 2023-12-04  224  	 * Identical for soft and external interrupts.
55617fb991df535 Thomas Gleixner 2023-12-04  225  	 */
be5341eb0d43b1e Thomas Gleixner 2023-12-04  226  	enter_from_user_mode(regs);
be5341eb0d43b1e Thomas Gleixner 2023-12-04  227  
be5341eb0d43b1e Thomas Gleixner 2023-12-04  228  	instrumentation_begin();
be5341eb0d43b1e Thomas Gleixner 2023-12-04  229  	add_random_kstack_offset();
be5341eb0d43b1e Thomas Gleixner 2023-12-04  230  
55617fb991df535 Thomas Gleixner 2023-12-04  231  	/* Validate that this is a soft interrupt to the extent possible */
55617fb991df535 Thomas Gleixner 2023-12-04  232  	if (unlikely(int80_is_external()))
55617fb991df535 Thomas Gleixner 2023-12-04  233  		panic("Unexpected external interrupt 0x80\n");
55617fb991df535 Thomas Gleixner 2023-12-04  234  
be5341eb0d43b1e Thomas Gleixner 2023-12-04  235  	/*
be5341eb0d43b1e Thomas Gleixner 2023-12-04  236  	 * The low level idtentry code pushed -1 into regs::orig_ax
be5341eb0d43b1e Thomas Gleixner 2023-12-04  237  	 * and regs::ax contains the syscall number.
be5341eb0d43b1e Thomas Gleixner 2023-12-04  238  	 *
be5341eb0d43b1e Thomas Gleixner 2023-12-04  239  	 * User tracing code (ptrace or signal handlers) might assume
be5341eb0d43b1e Thomas Gleixner 2023-12-04  240  	 * that the regs::orig_ax contains a 32-bit number on invoking
be5341eb0d43b1e Thomas Gleixner 2023-12-04  241  	 * a 32-bit syscall.
be5341eb0d43b1e Thomas Gleixner 2023-12-04  242  	 *
be5341eb0d43b1e Thomas Gleixner 2023-12-04  243  	 * Establish the syscall convention by saving the 32bit truncated
be5341eb0d43b1e Thomas Gleixner 2023-12-04  244  	 * syscall number in regs::orig_ax and by invalidating regs::ax.
be5341eb0d43b1e Thomas Gleixner 2023-12-04  245  	 */
be5341eb0d43b1e Thomas Gleixner 2023-12-04  246  	regs->orig_ax = regs->ax & GENMASK(31, 0);
be5341eb0d43b1e Thomas Gleixner 2023-12-04  247  	regs->ax = -ENOSYS;
be5341eb0d43b1e Thomas Gleixner 2023-12-04  248  
be5341eb0d43b1e Thomas Gleixner 2023-12-04  249  	nr = syscall_32_enter(regs);
be5341eb0d43b1e Thomas Gleixner 2023-12-04  250  
be5341eb0d43b1e Thomas Gleixner 2023-12-04  251  	local_irq_enable();
be5341eb0d43b1e Thomas Gleixner 2023-12-04  252  	nr = syscall_enter_from_user_mode_work(regs, nr);
be5341eb0d43b1e Thomas Gleixner 2023-12-04  253  	do_syscall_32_irqs_on(regs, nr);
be5341eb0d43b1e Thomas Gleixner 2023-12-04  254  
be5341eb0d43b1e Thomas Gleixner 2023-12-04  255  	instrumentation_end();
be5341eb0d43b1e Thomas Gleixner 2023-12-04  256  	syscall_exit_to_user_mode(regs);
be5341eb0d43b1e Thomas Gleixner 2023-12-04  257  }
be5341eb0d43b1e Thomas Gleixner 2023-12-04  258  #else /* CONFIG_IA32_EMULATION */
be5341eb0d43b1e Thomas Gleixner 2023-12-04  259  

:::::: The code at line 211 was first introduced by commit
:::::: be5341eb0d43b1e754799498bd2e8756cc167a41 x86/entry: Convert INT 0x80 emulation to IDTENTRY

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
