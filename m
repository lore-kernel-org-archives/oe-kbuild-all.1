Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C187219E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765478813; cv=none; b=YPFAayR2MEPshZyBaMEt7HkWy+xL1P5/iQNjk8huUSOYKEjuj9hRmk08HO4nN/kahtM32VE0GcRfiCTg5DsDMolGIeYUUcFofUyjWJLKe4hlgsEUdahGZjskjq/mCAts8HrK6QhDHgrO12x4Vx8OVL4WSeQ/4bF2GyTHb1Y3liY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765478813; c=relaxed/simple;
	bh=nOTvFEL6EQ3Saq4cxQCq5tXTtqL3CC/zTTE4kP0qigw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/bouH5sijdGfmGOQT77RA6KZLe22d2b0hYg0wg+7xjztBWFeHVDCawtvcfw6HyA9ul4lerIwGaGHhPdICxFVUJGr7kYCtEKZmvwlGCnaXnAD55ms/0xbYtf+mYk3Z96j4qsvTtjCTjG42VLNFEyscVZtPXYvwBQ8rGdzdT4ylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9MOJnAN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9MOJnAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765478812; x=1797014812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nOTvFEL6EQ3Saq4cxQCq5tXTtqL3CC/zTTE4kP0qigw=;
  b=k9MOJnANDkHeIpTgMKLavcmo6Cu9Kiq0vJwJAulCs0O+klb0WaTCox2Z
   Eh6a2DWfJWDrrmEFIoUeIiLlB4miwcTBdd7G1eseYZxUYeXmGjDquxgcp
   tD2TbRPKc68alJZk8+q4rQM3SIBm9EZ6susS/mIrDT0WfRrjioY6y8tA3
   eykmegCbcf+JYdgZSU8/6zcfDqnQ5wdqcd3Bl0KSviq9yjPxcKxpaggr2
   w8Ej68PVwf5sAUnJU2o6S9OvEke75GlWr7Fvwxaco5wsxZbXqrFZnfKeU
   +oFsQhjfQooGleyuK57eau+TajU1Jgb3nI3f0lMmCmD4NYiuqyj14vaR1
   Q==;
X-CSE-ConnectionGUID: +GUh7A3zQ36CSY++c5jiMg==
X-CSE-MsgGUID: XsXzz0vTQwSk3k3pg4ig5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67641124"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67641124"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 10:46:51 -0800
X-CSE-ConnectionGUID: LoSjGeUxRm68r55LtapwBQ==
X-CSE-MsgGUID: iaoqVhK9QhaeuzKWjG7AiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196775278"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Dec 2025 10:46:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTlge-000000001Ae-1xK1;
	Thu, 11 Dec 2025 18:46:48 +0000
Date: Thu, 11 Dec 2025 19:46:27 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] arch/x86/entry/common.c:163: warning:
 Function parameter or member 'regs' not described in 'do_int80_emulation'
Message-ID: <202512111900.HRlObqRh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 93117cefb1a33b3c93d9450d966ce333f5e4a4a8 [3534/3534] x86/bhi: Add support for clearing branch history at syscall entry
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111900.HRlObqRh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111900.HRlObqRh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111900.HRlObqRh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/common.c:163: warning: Function parameter or member 'regs' not described in 'do_int80_emulation'


vim +163 arch/x86/entry/common.c

ae4c9ae1882092 Thomas Gleixner 2024-01-02  142  
e0df47ab7f352c Thomas Gleixner 2024-01-02  143  /**
93117cefb1a33b Pawan Gupta     2024-05-07  144   * do_int80_emulation - 32-bit legacy syscall C entry from asm
e0df47ab7f352c Thomas Gleixner 2024-01-02  145   *
e0df47ab7f352c Thomas Gleixner 2024-01-02  146   * This entry point can be used by 32-bit and 64-bit programs to perform
e0df47ab7f352c Thomas Gleixner 2024-01-02  147   * 32-bit system calls.  Instances of INT $0x80 can be found inline in
e0df47ab7f352c Thomas Gleixner 2024-01-02  148   * various programs and libraries.  It is also used by the vDSO's
e0df47ab7f352c Thomas Gleixner 2024-01-02  149   * __kernel_vsyscall fallback for hardware that doesn't support a faster
e0df47ab7f352c Thomas Gleixner 2024-01-02  150   * entry method.  Restarted 32-bit system calls also fall back to INT
e0df47ab7f352c Thomas Gleixner 2024-01-02  151   * $0x80 regardless of what instruction was originally used to do the
e0df47ab7f352c Thomas Gleixner 2024-01-02  152   * system call.
e0df47ab7f352c Thomas Gleixner 2024-01-02  153   *
e0df47ab7f352c Thomas Gleixner 2024-01-02  154   * This is considered a slow path.  It is not used by most libc
e0df47ab7f352c Thomas Gleixner 2024-01-02  155   * implementations on modern hardware except during process startup.
e0df47ab7f352c Thomas Gleixner 2024-01-02  156   *
e0df47ab7f352c Thomas Gleixner 2024-01-02  157   * The arguments for the INT $0x80 based syscall are on stack in the
e0df47ab7f352c Thomas Gleixner 2024-01-02  158   * pt_regs structure:
e0df47ab7f352c Thomas Gleixner 2024-01-02  159   *   eax:				system call number
e0df47ab7f352c Thomas Gleixner 2024-01-02  160   *   ebx, ecx, edx, esi, edi, ebp:	arg1 - arg 6
e0df47ab7f352c Thomas Gleixner 2024-01-02  161   */
93117cefb1a33b Pawan Gupta     2024-05-07  162  __visible noinstr void do_int80_emulation(struct pt_regs *regs)
e0df47ab7f352c Thomas Gleixner 2024-01-02 @163  {
e0df47ab7f352c Thomas Gleixner 2024-01-02  164  	int nr;
e0df47ab7f352c Thomas Gleixner 2024-01-02  165  
ae4c9ae1882092 Thomas Gleixner 2024-01-02  166  	/* Kernel does not use INT $0x80! */
ae4c9ae1882092 Thomas Gleixner 2024-01-02  167  	if (unlikely(!user_mode(regs))) {
ae4c9ae1882092 Thomas Gleixner 2024-01-02  168  		irqentry_enter(regs);
ae4c9ae1882092 Thomas Gleixner 2024-01-02  169  		instrumentation_begin();
ae4c9ae1882092 Thomas Gleixner 2024-01-02  170  		panic("Unexpected external interrupt 0x80\n");
ae4c9ae1882092 Thomas Gleixner 2024-01-02  171  	}
ae4c9ae1882092 Thomas Gleixner 2024-01-02  172  
ae4c9ae1882092 Thomas Gleixner 2024-01-02  173  	/*
ae4c9ae1882092 Thomas Gleixner 2024-01-02  174  	 * Establish kernel context for instrumentation, including for
ae4c9ae1882092 Thomas Gleixner 2024-01-02  175  	 * int80_is_external() below which calls into the APIC driver.
ae4c9ae1882092 Thomas Gleixner 2024-01-02  176  	 * Identical for soft and external interrupts.
ae4c9ae1882092 Thomas Gleixner 2024-01-02  177  	 */
e0df47ab7f352c Thomas Gleixner 2024-01-02  178  	enter_from_user_mode(regs);
e0df47ab7f352c Thomas Gleixner 2024-01-02  179  
e0df47ab7f352c Thomas Gleixner 2024-01-02  180  	instrumentation_begin();
e0df47ab7f352c Thomas Gleixner 2024-01-02  181  	add_random_kstack_offset();
e0df47ab7f352c Thomas Gleixner 2024-01-02  182  
ae4c9ae1882092 Thomas Gleixner 2024-01-02  183  	/* Validate that this is a soft interrupt to the extent possible */
ae4c9ae1882092 Thomas Gleixner 2024-01-02  184  	if (unlikely(int80_is_external()))
ae4c9ae1882092 Thomas Gleixner 2024-01-02  185  		panic("Unexpected external interrupt 0x80\n");
ae4c9ae1882092 Thomas Gleixner 2024-01-02  186  
e0df47ab7f352c Thomas Gleixner 2024-01-02  187  	/*
e0df47ab7f352c Thomas Gleixner 2024-01-02  188  	 * The low level idtentry code pushed -1 into regs::orig_ax
e0df47ab7f352c Thomas Gleixner 2024-01-02  189  	 * and regs::ax contains the syscall number.
e0df47ab7f352c Thomas Gleixner 2024-01-02  190  	 *
e0df47ab7f352c Thomas Gleixner 2024-01-02  191  	 * User tracing code (ptrace or signal handlers) might assume
e0df47ab7f352c Thomas Gleixner 2024-01-02  192  	 * that the regs::orig_ax contains a 32-bit number on invoking
e0df47ab7f352c Thomas Gleixner 2024-01-02  193  	 * a 32-bit syscall.
e0df47ab7f352c Thomas Gleixner 2024-01-02  194  	 *
e0df47ab7f352c Thomas Gleixner 2024-01-02  195  	 * Establish the syscall convention by saving the 32bit truncated
e0df47ab7f352c Thomas Gleixner 2024-01-02  196  	 * syscall number in regs::orig_ax and by invalidating regs::ax.
e0df47ab7f352c Thomas Gleixner 2024-01-02  197  	 */
e0df47ab7f352c Thomas Gleixner 2024-01-02  198  	regs->orig_ax = regs->ax & GENMASK(31, 0);
e0df47ab7f352c Thomas Gleixner 2024-01-02  199  	regs->ax = -ENOSYS;
e0df47ab7f352c Thomas Gleixner 2024-01-02  200  
e0df47ab7f352c Thomas Gleixner 2024-01-02  201  	nr = syscall_32_enter(regs);
e0df47ab7f352c Thomas Gleixner 2024-01-02  202  
e0df47ab7f352c Thomas Gleixner 2024-01-02  203  	local_irq_enable();
e0df47ab7f352c Thomas Gleixner 2024-01-02  204  	nr = syscall_enter_from_user_mode_work(regs, nr);
e0df47ab7f352c Thomas Gleixner 2024-01-02  205  	do_syscall_32_irqs_on(regs, nr);
e0df47ab7f352c Thomas Gleixner 2024-01-02  206  
e0df47ab7f352c Thomas Gleixner 2024-01-02  207  	instrumentation_end();
e0df47ab7f352c Thomas Gleixner 2024-01-02  208  	syscall_exit_to_user_mode(regs);
e0df47ab7f352c Thomas Gleixner 2024-01-02  209  }
e0df47ab7f352c Thomas Gleixner 2024-01-02  210  #else /* CONFIG_IA32_EMULATION */
e0df47ab7f352c Thomas Gleixner 2024-01-02  211  

:::::: The code at line 163 was first introduced by commit
:::::: e0df47ab7f352c5f055d05102cc1dfcb43567ba8 x86/entry: Convert INT 0x80 emulation to IDTENTRY

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
