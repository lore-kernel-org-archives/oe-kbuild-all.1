Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92B182D6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 00:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792369556; cv=none; b=FpF1Xe9XzSfxbHRF651p8dKnWncYoQua4xXFLTnCMp2ctDVuW5Mlz4+cbIRw8i300TguJ0YWMKlcRYuxt1JaPrzP8W4h/SEClg35yU4WG21Y57UwTUfZQEJj1jxuU7ZCO4uoVkE36fXbe6EJm3xzxUNpUTHeij/K912cQFDrywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792369556; c=relaxed/simple;
	bh=N1A/yd/LsgfaWr5fYRwEM265vupjFBR1pf7r5ipTP8M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NPNeY8eMJq1quvgv7DT/ps8bLLowBaXecZL5kQSCML3f2pwXQrE4K+M9RJ2cuPIjEVhmbrUW6HZaXltivov1WdvjYga/+q2yFx2IiQTAzlhKit1J0viBhrLKWIXbxfrbL6pK+yaVxDqG2/kyzWlnpZN3FP8G1JqqxipxogCAAAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkC7S2JN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkC7S2JN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792369554; x=1823905554;
  h=date:from:to:cc:subject:message-id;
  bh=N1A/yd/LsgfaWr5fYRwEM265vupjFBR1pf7r5ipTP8M=;
  b=WkC7S2JNMXzWkOlDbeZ9569MFGWI3h3z20bWi5S5gtZbd1j1NLRhdWbb
   qgwSsl9PHVVqOd+1kKhdtVSdQ8AnHxz8KIWe4wqYjskBqrkvLuqjTB2Yf
   /fdk9tu5DlQ4L9VJtapDfVcDftQc3XDXuYHCpfUUwWLqR9wLVCqg4Xt9K
   i75CKKdWCDEWTl410ZtIHEzLgKuwCqbpa4QEwAGFhye5q3GzlzDq8j4k+
   CTjLX6wa8g+WHC77uSJYo9v+6EW/z5KZiJZ0BRGYfmLKBOf/K7jsbQ/Jz
   Ici7jwzttaB1Rl5g3AQFDvV87AhF62AiUPVUPK1G+iCaDQ0r+46yBkcfh
   Q==;
X-CSE-ConnectionGUID: pNsv5EaTR+Og7G+RCkV+eQ==
X-CSE-MsgGUID: NsFQ00z/Tn+V4DuHkP9U3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1036419"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1036419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 17:25:53 -0700
X-CSE-ConnectionGUID: /Jwu6O8LTi64J3c+ErT41w==
X-CSE-MsgGUID: r2aS38hoSaaewVa0uVz9tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2867807"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2026 17:25:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIbCH-00000000Kzy-1xvw;
	Mon, 19 Oct 2026 00:25:49 +0000
Date: Mon, 19 Oct 2026 08:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 32/32]
 arch/x86/include/asm/entry-common.h:80:45: warning: cast from pointer to
 integer of different size
Message-ID: <202610190847.c3TIjpgD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: 1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d [32/32] fred_update_rsp0
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261019/202610190847.c3TIjpgD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190847.c3TIjpgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190847.c3TIjpgD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irq-entry-common.h:14,
                    from include/linux/entry-common.h:6,
                    from arch/x86/kernel/signal.c:28:
   arch/x86/include/asm/entry-common.h: In function 'arch_exit_to_user_mode_prepare':
>> arch/x86/include/asm/entry-common.h:80:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      80 |                 wrmsrns(MSR_IA32_FRED_SSP0, (u64)task_shstk_top(current));
         |                                             ^
--
   In file included from include/linux/irq-entry-common.h:14,
                    from include/linux/entry-common.h:6,
                    from arch/x86/kernel/process.c:31:
   arch/x86/include/asm/entry-common.h: In function 'arch_exit_to_user_mode_prepare':
>> arch/x86/include/asm/entry-common.h:80:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      80 |                 wrmsrns(MSR_IA32_FRED_SSP0, (u64)task_shstk_top(current));
         |                                             ^
   arch/x86/kernel/process.c: At top level:
   arch/x86/kernel/process.c:179:23: warning: 'task_kshstk_top' defined but not used [-Wunused-function]
     179 | static unsigned long *task_kshstk_top(struct task_struct *tsk)
         |                       ^~~~~~~~~~~~~~~
   arch/x86/kernel/process.c:175:23: warning: 'task_kshstk_base' defined but not used [-Wunused-function]
     175 | static unsigned long *task_kshstk_base(struct task_struct *tsk)
         |                       ^~~~~~~~~~~~~~~~


vim +80 arch/x86/include/asm/entry-common.h

    69	
    70	static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
    71							  unsigned long ti_work)
    72	{
    73		fpregs_assert_state_consistent();
    74	
    75		if (unlikely(ti_work))
    76			arch_exit_work(ti_work);
    77	
    78		fred_update_rsp0();
    79		if (current->thread.kshstk_ssp)
  > 80			wrmsrns(MSR_IA32_FRED_SSP0, (u64)task_shstk_top(current));
    81	#ifdef CONFIG_COMPAT
    82		/*
    83		 * Compat syscalls set TS_COMPAT.  Make sure we clear it before
    84		 * returning to user mode.  We need to clear it *after* signal
    85		 * handling, because syscall restart has a fixup for compat
    86		 * syscalls.  The fixup is exercised by the ptrace_syscall_32
    87		 * selftest.
    88		 *
    89		 * We also need to clear TS_REGS_POKED_I386: the 32-bit tracer
    90		 * special case only applies after poking regs and before the
    91		 * very next return to user mode.
    92		 */
    93		current_thread_info()->status &= ~(TS_COMPAT | TS_I386_REGS_POKED);
    94	#endif
    95	
    96		/* Avoid unnecessary reads of 'x86_ibpb_exit_to_user' */
    97		if (cpu_feature_enabled(X86_FEATURE_IBPB_EXIT_TO_USER) &&
    98		    this_cpu_read(x86_ibpb_exit_to_user)) {
    99			indirect_branch_prediction_barrier();
   100			this_cpu_write(x86_ibpb_exit_to_user, false);
   101		}
   102	}
   103	#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
   104	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
