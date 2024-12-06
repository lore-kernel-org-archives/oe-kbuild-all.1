Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773BA38384
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733495666; cv=none; b=uRbxG0/55cutK6e7EJmunx3Z0aWVY0dmLvjW9noEUcF7lRGRt6JXuLQtxz34alnh42ZfGYiTJ9oLpWVHoS1bx+gDnHjsBI+gsd2SGeMQMUgaaICHdH46Z80sU7FPK+Mc//h3s9Y0Ag2ZcJzXxwjFE/3WzRUJe/tyDq/Tb4cwLFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733495666; c=relaxed/simple;
	bh=V9Qm5L5C/dANE/JEbckrG2qS6VJDFymwDmneLrZvrlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YM7xncS+sYUyfeBNVwTtQGtCG7lbCcUyDYfsUcgc4IURrzWFdEb+SXwptDEgbEIX2iVSJOn53ofq91uZodbBbm2Rfo+7DQxLOa6icOgT+jdzu5j5jhfIw1Ac43kiwZo3gAjcUqKgVDyXGcNi7ZRC/23G3wQB3OVuWM0I8vhtSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ss27FpSy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ss27FpSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733495664; x=1765031664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V9Qm5L5C/dANE/JEbckrG2qS6VJDFymwDmneLrZvrlw=;
  b=Ss27FpSyA2Mf6Zr96oZ3SHV4vSNZ+K1+wEiCl5mrIDVQwZpI+TD/ASnz
   gEHxoZRRz5g67SigrgnyzhcmlGsNufGsF0rUKVBlz1146fJsynqM8UB3q
   vGz43FjffU/4v51+UJFv6Ev60+4/DhwrvSUumgPsKVWmTbHZQT45KPi+l
   AGe9buf5LlN6EV05cmVxWNjx9urho2jcmS2a1lH2OsKRU9kc0h1QCE0O5
   U/Ff5vza/SVZCYxi0Xz4XhKqLiHe+wNKk6n9o2NWa+tV4//fQ0yNg2ScS
   yqCOWnbwQcLxu6t69oS8KxZ0n9z9/6ICWunGQ3Zlgvn7T3vjvL8B9hpnw
   g==;
X-CSE-ConnectionGUID: zszEaj06RGWyLrCVwEU70g==
X-CSE-MsgGUID: KHQJN+2dRt6NpNQgr/z8sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33729973"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="33729973"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 06:34:24 -0800
X-CSE-ConnectionGUID: IPMw/IrSRTuKfFsrTvT94A==
X-CSE-MsgGUID: pK69+kDRTgm2V8+gife+Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="131836823"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2024 06:34:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJZPJ-00019X-2M;
	Fri, 06 Dec 2024 14:34:13 +0000
Date: Fri, 6 Dec 2024 22:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
	tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kees@kernel.org,
	wad@chromium.org, akpm@linux-foundation.org,
	samitolvanen@google.com, masahiroy@kernel.org, hca@linux.ibm.com,
	aliceryhl@google.com, rppt@kernel.org, xur@google.com,
	paulmck@kernel.org, arnd@arndb.de, mbenes@suse.cz,
	puranjay@kernel.org, mark.rutland@arm.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH -next v5 20/22] entry: Add
 arch_ptrace_report_syscall_entry/exit()
Message-ID: <202412062236.pcOqNdrI-lkp@intel.com>
References: <20241206101744.4161990-21-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-21-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241205]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/arm64-ptrace-Replace-interrupts_enabled-with-regs_irqs_disabled/20241206-183134
base:   next-20241205
patch link:    https://lore.kernel.org/r/20241206101744.4161990-21-ruanjinjie%40huawei.com
patch subject: [PATCH -next v5 20/22] entry: Add arch_ptrace_report_syscall_entry/exit()
config: i386-buildonly-randconfig-002-20241206 (https://download.01.org/0day-ci/archive/20241206/202412062236.pcOqNdrI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412062236.pcOqNdrI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412062236.pcOqNdrI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/entry/syscall-common.c:30: warning: Function parameter or struct member 'regs' not described in 'arch_ptrace_report_syscall_entry'
>> kernel/entry/syscall-common.c:116: warning: Function parameter or struct member 'regs' not described in 'arch_ptrace_report_syscall_exit'
>> kernel/entry/syscall-common.c:116: warning: Function parameter or struct member 'step' not described in 'arch_ptrace_report_syscall_exit'


vim +30 kernel/entry/syscall-common.c

    19	
    20	/**
    21	 * arch_ptrace_report_syscall_entry - Architecture specific
    22	 *				      ptrace_report_syscall_entry().
    23	 *
    24	 * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entry().
    25	 * Defaults to ptrace_report_syscall_entry.
    26	 *
    27	 * The main purpose is to support arch-specific ptrace_report_syscall_entry()
    28	 * implementation.
    29	 */
  > 30	static inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
    31	
    32	#ifndef arch_ptrace_report_syscall_entry
    33	static inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
    34	{
    35		return ptrace_report_syscall_entry(regs);
    36	}
    37	#endif
    38	
    39	long syscall_trace_enter(struct pt_regs *regs, long syscall,
    40					unsigned long work)
    41	{
    42		long ret = 0;
    43	
    44		/*
    45		 * Handle Syscall User Dispatch.  This must comes first, since
    46		 * the ABI here can be something that doesn't make sense for
    47		 * other syscall_work features.
    48		 */
    49		if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
    50			if (syscall_user_dispatch(regs))
    51				return -1L;
    52		}
    53	
    54		/* Handle ptrace */
    55		if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
    56			ret = arch_ptrace_report_syscall_entry(regs);
    57			if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
    58				return -1L;
    59		}
    60	
    61		/* Do seccomp after ptrace, to catch any tracer changes. */
    62		if (work & SYSCALL_WORK_SECCOMP) {
    63			ret = __secure_computing(NULL);
    64			if (ret == -1L)
    65				return ret;
    66		}
    67	
    68		/* Either of the above might have changed the syscall number */
    69		syscall = syscall_get_nr(current, regs);
    70	
    71		if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
    72			trace_sys_enter(regs, syscall);
    73			/*
    74			 * Probes or BPF hooks in the tracepoint may have changed the
    75			 * system call number as well.
    76			 */
    77			syscall = syscall_get_nr(current, regs);
    78		}
    79	
    80		syscall_enter_audit(regs, syscall);
    81	
    82		return ret ? : syscall;
    83	}
    84	
    85	noinstr void syscall_enter_from_user_mode_prepare(struct pt_regs *regs)
    86	{
    87		enter_from_user_mode(regs);
    88		instrumentation_begin();
    89		local_irq_enable();
    90		instrumentation_end();
    91	}
    92	
    93	/*
    94	 * If SYSCALL_EMU is set, then the only reason to report is when
    95	 * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall
    96	 * instruction has been already reported in syscall_enter_from_user_mode().
    97	 */
    98	static inline bool report_single_step(unsigned long work)
    99	{
   100		if (work & SYSCALL_WORK_SYSCALL_EMU)
   101			return false;
   102	
   103		return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
   104	}
   105	
   106	/**
   107	 * arch_ptrace_report_syscall_exit - Architecture specific
   108	 *				     ptrace_report_syscall_exit.
   109	 *
   110	 * Invoked from syscall_exit_work() to wrap ptrace_report_syscall_exit().
   111	 *
   112	 * The main purpose is to support arch-specific ptrace_report_syscall_exit
   113	 * implementation.
   114	 */
   115	static inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
 > 116							   int step);
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
