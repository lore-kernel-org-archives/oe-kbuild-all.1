Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C60542A82
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729930683; cv=none; b=CLrtUr6RvrFwh+ILbt+fUqm8up0hZi1ceIS922C5ggy1DafRAmPP3wK6MLgxq92gc4SST4/XC9xZzPICO4KgNHDo+b/g/al87C6+ggtqOp0tJ6CqRzGh0yro0rKXvGgTWIXVDE1Cjk6m6OIuDt8SWd88HSjlpmiCUwY+ozccFgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729930683; c=relaxed/simple;
	bh=0moUX6xCOBO8b1FsiP5TF0dlX9fnw57X4sRy4i8oTPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qq1dIuWdUUgIWD8sDChyxQmMb3RbiZXuVMCtFDD9Nxv7CBKVIsy6GjYf9ZX1QazeY7I7J1YY0ER1Jsb8iGsVmjOGwZdvOQzZ6oro8P0TUAx007YNmO2sXxusSLCKguhPWrawGijgEvhNgIcZaOSHgsygL7tNFxflbZlDtQh5OH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OS3d06Xa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OS3d06Xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729930681; x=1761466681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0moUX6xCOBO8b1FsiP5TF0dlX9fnw57X4sRy4i8oTPs=;
  b=OS3d06XaloOa+NNsO0XGxpsnaUILb7FKgVDWfYvrbgC7DZq6G4ewPYFS
   xI7gNwtR38fYpDmMWm0IbmYswh1KLwtleav+C41fbt2IcsycCTk0NpkSY
   3AhRWhbzv/FEglgbRV8WZFx3Oe7zHPtebePWiJ9VNjr9auaeu9kgpOg4w
   8qkCQTz5l9wofHgRZlF+J+mQ1Q5giQqxxPJYZVLGvpOAe0D9sth6Pd7jr
   lY1jOqX3x+rtXaiyV/vvzqvV1MQoZCQZ/IpcdFsc7eNkwePeKeD8dkuBk
   MPlautBQN9x5dn9OwiIEp4sF8Si3rEOmeJqzwj0iGZb63/4W+1g23NxAs
   Q==;
X-CSE-ConnectionGUID: isCJQ036QuOKxzgor0FhFA==
X-CSE-MsgGUID: WIuhhwJCTBmNKObdM1cm4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40986391"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="40986391"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 01:18:01 -0700
X-CSE-ConnectionGUID: SNYRKAddQNOoBz9NYYbvcA==
X-CSE-MsgGUID: 0GcBeImAQk6OxkN9SGWjpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85905747"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Oct 2024 01:17:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4bzb-000ZQk-1b;
	Sat, 26 Oct 2024 08:17:51 +0000
Date: Sat, 26 Oct 2024 16:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com,
	linux@armlinux.org.uk, will@kernel.org, mark.rutland@arm.com,
	catalin.marinas@arm.com, sstabellini@kernel.org, maz@kernel.org,
	tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
	kees@kernel.org, wad@chromium.org, akpm@linux-foundation.org,
	samitolvanen@google.com, arnd@arndb.de, ojeda@kernel.org,
	rppt@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	samuel.holland@sifive.com, paulmck@kernel.org, aquini@redhat.com,
	petr.pavlu@suse.com, viro@zeniv.linux.org.uk,
	rmk+kernel@armlinux.org.uk, ardb@kernel.org,
	wangkefeng.wang@huawei.com, surenb@google.com,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH -next v4 17/19] entry: Add syscall arch functions to use
 generic syscall for arm64
Message-ID: <202410261801.FCY33zDQ-lkp@intel.com>
References: <20241025100700.3714552-18-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025100700.3714552-18-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241025]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/arm64-ptrace-Replace-interrupts_enabled-with-regs_irqs_disabled/20241025-181420
base:   next-20241025
patch link:    https://lore.kernel.org/r/20241025100700.3714552-18-ruanjinjie%40huawei.com
patch subject: [PATCH -next v4 17/19] entry: Add syscall arch functions to use generic syscall for arm64
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241026/202410261801.FCY33zDQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261801.FCY33zDQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261801.FCY33zDQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/entry/syscall-common.c:30: warning: Function parameter or struct member 'regs' not described in 'arch_pre_report_syscall_entry'
>> kernel/entry/syscall-common.c:53: warning: Function parameter or struct member 'regs' not described in 'arch_post_report_syscall_entry'
>> kernel/entry/syscall-common.c:53: warning: Function parameter or struct member 'saved_reg' not described in 'arch_post_report_syscall_entry'
>> kernel/entry/syscall-common.c:53: warning: Function parameter or struct member 'ret' not described in 'arch_post_report_syscall_entry'
>> kernel/entry/syscall-common.c:130: warning: Function parameter or struct member 'regs' not described in 'arch_pre_report_syscall_exit'
>> kernel/entry/syscall-common.c:130: warning: Function parameter or struct member 'work' not described in 'arch_pre_report_syscall_exit'
>> kernel/entry/syscall-common.c:152: warning: Function parameter or struct member 'regs' not described in 'arch_post_report_syscall_exit'
>> kernel/entry/syscall-common.c:152: warning: Function parameter or struct member 'saved_reg' not described in 'arch_post_report_syscall_exit'
>> kernel/entry/syscall-common.c:152: warning: Function parameter or struct member 'work' not described in 'arch_post_report_syscall_exit'


vim +30 kernel/entry/syscall-common.c

    19	
    20	/**
    21	 * arch_pre_report_syscall_entry - Architecture specific work before
    22	 *				   report_syscall_entry().
    23	 *
    24	 * Invoked from syscall_trace_enter() to prepare for ptrace_report_syscall_entry().
    25	 * Defaults to NOP.
    26	 *
    27	 * The main purpose is for saving a general purpose register clobbered
    28	 * in the tracee.
    29	 */
  > 30	static inline unsigned long arch_pre_report_syscall_entry(struct pt_regs *regs);
    31	
    32	#ifndef arch_pre_report_syscall_entry
    33	static inline unsigned long arch_pre_report_syscall_entry(struct pt_regs *regs)
    34	{
    35		return 0;
    36	}
    37	#endif
    38	
    39	/**
    40	 * arch_post_report_syscall_entry - Architecture specific work after
    41	 *			            report_syscall_entry().
    42	 *
    43	 * Invoked from syscall_trace_enter() after calling ptrace_report_syscall_entry().
    44	 * Defaults to NOP.
    45	 *
    46	 * The main purpose is for restoring a general purpose register clobbered
    47	 * in the trace saved in arch_pre_report_syscall_entry(), also it can
    48	 * do something arch-specific according to the return value of
    49	 * ptrace_report_syscall_entry().
    50	 */
    51	static inline void arch_post_report_syscall_entry(struct pt_regs *regs,
    52							  unsigned long saved_reg,
  > 53							  long ret);
    54	
    55	#ifndef arch_post_report_syscall_entry
    56	static inline void arch_post_report_syscall_entry(struct pt_regs *regs,
    57							  unsigned long saved_reg,
    58							  long ret)
    59	{
    60	}
    61	#endif
    62	
    63	long syscall_trace_enter(struct pt_regs *regs, long syscall,
    64					unsigned long work)
    65	{
    66		long ret = 0;
    67	
    68		/*
    69		 * Handle Syscall User Dispatch.  This must comes first, since
    70		 * the ABI here can be something that doesn't make sense for
    71		 * other syscall_work features.
    72		 */
    73		if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
    74			if (syscall_user_dispatch(regs))
    75				return -1L;
    76		}
    77	
    78		/* Handle ptrace */
    79		if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
    80			unsigned long saved_reg = arch_pre_report_syscall_entry(regs);
    81			ret = ptrace_report_syscall_entry(regs);
    82			arch_post_report_syscall_entry(regs, saved_reg, ret);
    83			if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
    84				return -1L;
    85		}
    86	
    87		/* Do seccomp after ptrace, to catch any tracer changes. */
    88		if (work & SYSCALL_WORK_SECCOMP) {
    89			ret = __secure_computing(NULL);
    90			if (ret == -1L)
    91				return ret;
    92		}
    93	
    94		/* Either of the above might have changed the syscall number */
    95		syscall = syscall_get_nr(current, regs);
    96	
    97		if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
    98			trace_sys_enter(regs, syscall);
    99			/*
   100			 * Probes or BPF hooks in the tracepoint may have changed the
   101			 * system call number as well.
   102			 */
   103			syscall = syscall_get_nr(current, regs);
   104		}
   105	
   106		syscall_enter_audit(regs, syscall);
   107	
   108		return ret ? : syscall;
   109	}
   110	
   111	noinstr void syscall_enter_from_user_mode_prepare(struct pt_regs *regs)
   112	{
   113		enter_from_user_mode(regs);
   114		instrumentation_begin();
   115		local_irq_enable();
   116		instrumentation_end();
   117	}
   118	
   119	/**
   120	 * arch_pre_report_syscall_exit - Architecture specific work before
   121	 *				  report_syscall_exit().
   122	 *
   123	 * Invoked from syscall_exit_work() to prepare for ptrace_report_syscall_exit().
   124	 * Defaults to NOP.
   125	 *
   126	 * The main purpose is for saving a general purpose register clobbered
   127	 * in the trace.
   128	 */
   129	static inline unsigned long arch_pre_report_syscall_exit(struct pt_regs *regs,
 > 130								     unsigned long work);
   131	
   132	#ifndef arch_pre_report_syscall_exit
   133	static inline unsigned long arch_pre_report_syscall_exit(struct pt_regs *regs,
   134								     unsigned long work)
   135	{
   136		return 0;
   137	}
   138	#endif
   139	
   140	/**
   141	 * arch_post_report_syscall_exit - Architecture specific work after
   142	 *			           report_syscall_exit().
   143	 *
   144	 * Invoked from syscall_exit_work() after calling ptrace_report_syscall_exit().
   145	 * Defaults to NOP.
   146	 *
   147	 * The main purpose is for restoring a general purpose register clobbered
   148	 * in the trace saved in arch_pre_report_syscall_exit().
   149	 */
   150	static inline void arch_post_report_syscall_exit(struct pt_regs *regs,
   151							 unsigned long saved_reg,
 > 152							 unsigned long work);
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
