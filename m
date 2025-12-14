Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E11DFE09
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 00:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765672957; cv=none; b=Yscks1obENtVY9E/bCXOZUQQV198Uo8YDJDT6x4qc34k95G2SqVXRJOMmvyqu1uV907Km2EQBwPVhMub4sUBlok+nYK5RfGsgsGB+sX/7xB1XSLbFO6sdkQBxzr5x/50pS0rXTZGPvXC+FxT4KzMr560GYP19e87K1hC/jhnYOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765672957; c=relaxed/simple;
	bh=383IcDF9SEqpCfKk0vX9b3RdQzQPfqOeQTb5vGXZY5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7nob/QL7SqeNuR3WskZl3trLpm4VoDoMAlE1CxnUObKt9gPkG59ajwWhd7uIWClOvcpHbIO6v+P7Dwu+j5gVy2m80ZU5dIJo9To5AkMoqU0lXJ6uC2B4gctpkuheyuSceCqmk6TF4ozOJdE+Rcp60on8pZcR7QY1oUcMdbi7ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BK9auvHr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BK9auvHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765672955; x=1797208955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=383IcDF9SEqpCfKk0vX9b3RdQzQPfqOeQTb5vGXZY5M=;
  b=BK9auvHrlvkaWfxNMnPaJ0Ozf4XxwiOKwE1guRofgJ+5VSHGUnTjl802
   5emPEQx0msldbX7vU8qPff/KGZ6U88kHUzc+wRO/+qcmErnJcYY7EAveF
   R3ATXzYbhgOnaA4+FvmkSXZI1xzVq4RzdELGVLQOJXt6gZg8V3hJLzDIg
   eeSxFm1rRZWQt0ARpWrnqnKMfCdJXJhKKath0zQ3ho76UnFSrjt8b6PAN
   ZcDWsDWX8ei3o99pWTxGAwf2wqxfEPVcUdwrEFWWf8hNufJGQE8+4XrHp
   ca/Njpc69Ng61lklZ4ZphlxZPommYfw6GU9HHEMaCLOP/h4byYwhMEjV+
   g==;
X-CSE-ConnectionGUID: Wueei2LtTdmpDLULka0LEg==
X-CSE-MsgGUID: tITewp68RjaVgxT2nXl8XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67697100"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67697100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 16:42:34 -0800
X-CSE-ConnectionGUID: luTS/DZHSjOqfAfjyBvouw==
X-CSE-MsgGUID: MWwxR1LwRoq9y6sFKmE1TQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 16:42:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUaBz-000000008Nx-0gJU;
	Sun, 14 Dec 2025 00:42:31 +0000
Date: Sun, 14 Dec 2025 08:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/2] arch/x86/entry/common.c:163:
 warning: Function parameter or member 'regs' not described in
 'do_int80_emulation'
Message-ID: <202512140812.IChgFqEz-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6f1c2f8fd8c80fa50c9be0270d8474d6fa7412f2
commit: 07dbb10f153f483e8249acebdffedf922e2ec2e1 [0/2] x86/bhi: Add support for clearing branch history at syscall entry
config: i386-randconfig-061-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140812.IChgFqEz-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140812.IChgFqEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140812.IChgFqEz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/common.c:163: warning: Function parameter or member 'regs' not described in 'do_int80_emulation'


vim +163 arch/x86/entry/common.c

e09d243a518b56 Thomas Gleixner 2023-12-04  142  
d5f999317e83ef Thomas Gleixner 2023-12-04  143  /**
07dbb10f153f48 Pawan Gupta     2024-03-11  144   * do_int80_emulation - 32-bit legacy syscall C entry from asm
d5f999317e83ef Thomas Gleixner 2023-12-04  145   *
d5f999317e83ef Thomas Gleixner 2023-12-04  146   * This entry point can be used by 32-bit and 64-bit programs to perform
d5f999317e83ef Thomas Gleixner 2023-12-04  147   * 32-bit system calls.  Instances of INT $0x80 can be found inline in
d5f999317e83ef Thomas Gleixner 2023-12-04  148   * various programs and libraries.  It is also used by the vDSO's
d5f999317e83ef Thomas Gleixner 2023-12-04  149   * __kernel_vsyscall fallback for hardware that doesn't support a faster
d5f999317e83ef Thomas Gleixner 2023-12-04  150   * entry method.  Restarted 32-bit system calls also fall back to INT
d5f999317e83ef Thomas Gleixner 2023-12-04  151   * $0x80 regardless of what instruction was originally used to do the
d5f999317e83ef Thomas Gleixner 2023-12-04  152   * system call.
d5f999317e83ef Thomas Gleixner 2023-12-04  153   *
d5f999317e83ef Thomas Gleixner 2023-12-04  154   * This is considered a slow path.  It is not used by most libc
d5f999317e83ef Thomas Gleixner 2023-12-04  155   * implementations on modern hardware except during process startup.
d5f999317e83ef Thomas Gleixner 2023-12-04  156   *
d5f999317e83ef Thomas Gleixner 2023-12-04  157   * The arguments for the INT $0x80 based syscall are on stack in the
d5f999317e83ef Thomas Gleixner 2023-12-04  158   * pt_regs structure:
d5f999317e83ef Thomas Gleixner 2023-12-04  159   *   eax:				system call number
d5f999317e83ef Thomas Gleixner 2023-12-04  160   *   ebx, ecx, edx, esi, edi, ebp:	arg1 - arg 6
d5f999317e83ef Thomas Gleixner 2023-12-04  161   */
07dbb10f153f48 Pawan Gupta     2024-03-11  162  __visible noinstr void do_int80_emulation(struct pt_regs *regs)
d5f999317e83ef Thomas Gleixner 2023-12-04 @163  {
d5f999317e83ef Thomas Gleixner 2023-12-04  164  	int nr;
d5f999317e83ef Thomas Gleixner 2023-12-04  165  
e09d243a518b56 Thomas Gleixner 2023-12-04  166  	/* Kernel does not use INT $0x80! */
e09d243a518b56 Thomas Gleixner 2023-12-04  167  	if (unlikely(!user_mode(regs))) {
e09d243a518b56 Thomas Gleixner 2023-12-04  168  		irqentry_enter(regs);
e09d243a518b56 Thomas Gleixner 2023-12-04  169  		instrumentation_begin();
e09d243a518b56 Thomas Gleixner 2023-12-04  170  		panic("Unexpected external interrupt 0x80\n");
e09d243a518b56 Thomas Gleixner 2023-12-04  171  	}
e09d243a518b56 Thomas Gleixner 2023-12-04  172  
e09d243a518b56 Thomas Gleixner 2023-12-04  173  	/*
e09d243a518b56 Thomas Gleixner 2023-12-04  174  	 * Establish kernel context for instrumentation, including for
e09d243a518b56 Thomas Gleixner 2023-12-04  175  	 * int80_is_external() below which calls into the APIC driver.
e09d243a518b56 Thomas Gleixner 2023-12-04  176  	 * Identical for soft and external interrupts.
e09d243a518b56 Thomas Gleixner 2023-12-04  177  	 */
d5f999317e83ef Thomas Gleixner 2023-12-04  178  	enter_from_user_mode(regs);
d5f999317e83ef Thomas Gleixner 2023-12-04  179  
d5f999317e83ef Thomas Gleixner 2023-12-04  180  	instrumentation_begin();
d5f999317e83ef Thomas Gleixner 2023-12-04  181  	add_random_kstack_offset();
d5f999317e83ef Thomas Gleixner 2023-12-04  182  
e09d243a518b56 Thomas Gleixner 2023-12-04  183  	/* Validate that this is a soft interrupt to the extent possible */
e09d243a518b56 Thomas Gleixner 2023-12-04  184  	if (unlikely(int80_is_external()))
e09d243a518b56 Thomas Gleixner 2023-12-04  185  		panic("Unexpected external interrupt 0x80\n");
e09d243a518b56 Thomas Gleixner 2023-12-04  186  
d5f999317e83ef Thomas Gleixner 2023-12-04  187  	/*
d5f999317e83ef Thomas Gleixner 2023-12-04  188  	 * The low level idtentry code pushed -1 into regs::orig_ax
d5f999317e83ef Thomas Gleixner 2023-12-04  189  	 * and regs::ax contains the syscall number.
d5f999317e83ef Thomas Gleixner 2023-12-04  190  	 *
d5f999317e83ef Thomas Gleixner 2023-12-04  191  	 * User tracing code (ptrace or signal handlers) might assume
d5f999317e83ef Thomas Gleixner 2023-12-04  192  	 * that the regs::orig_ax contains a 32-bit number on invoking
d5f999317e83ef Thomas Gleixner 2023-12-04  193  	 * a 32-bit syscall.
d5f999317e83ef Thomas Gleixner 2023-12-04  194  	 *
d5f999317e83ef Thomas Gleixner 2023-12-04  195  	 * Establish the syscall convention by saving the 32bit truncated
d5f999317e83ef Thomas Gleixner 2023-12-04  196  	 * syscall number in regs::orig_ax and by invalidating regs::ax.
d5f999317e83ef Thomas Gleixner 2023-12-04  197  	 */
d5f999317e83ef Thomas Gleixner 2023-12-04  198  	regs->orig_ax = regs->ax & GENMASK(31, 0);
d5f999317e83ef Thomas Gleixner 2023-12-04  199  	regs->ax = -ENOSYS;
d5f999317e83ef Thomas Gleixner 2023-12-04  200  
d5f999317e83ef Thomas Gleixner 2023-12-04  201  	nr = syscall_32_enter(regs);
d5f999317e83ef Thomas Gleixner 2023-12-04  202  
d5f999317e83ef Thomas Gleixner 2023-12-04  203  	local_irq_enable();
d5f999317e83ef Thomas Gleixner 2023-12-04  204  	nr = syscall_enter_from_user_mode_work(regs, nr);
d5f999317e83ef Thomas Gleixner 2023-12-04  205  	do_syscall_32_irqs_on(regs, nr);
d5f999317e83ef Thomas Gleixner 2023-12-04  206  
d5f999317e83ef Thomas Gleixner 2023-12-04  207  	instrumentation_end();
d5f999317e83ef Thomas Gleixner 2023-12-04  208  	syscall_exit_to_user_mode(regs);
d5f999317e83ef Thomas Gleixner 2023-12-04  209  }
d5f999317e83ef Thomas Gleixner 2023-12-04  210  #else /* CONFIG_IA32_EMULATION */
d5f999317e83ef Thomas Gleixner 2023-12-04  211  

:::::: The code at line 163 was first introduced by commit
:::::: d5f999317e83efc07b8a7d26f9556b1271a6d373 x86/entry: Convert INT 0x80 emulation to IDTENTRY

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
