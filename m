Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174661993B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718666577; cv=none; b=BhUK3VSYaB90UiCA1MH14sjmmarYZbB0CCO0tBtyfF6txCQ4s0M918GW5QQKjQUEUli8VnaIyWD3nAr9RnPt2nRYwl0hi7oGFFqfOP5ZGS9hNeDx0/UTJ+SViuGMfKi+eQNiWfmSBQ9yqORItvFFglv8lbmuKf/2o77CzYFKKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718666577; c=relaxed/simple;
	bh=XTO79xtGUw18m0/bQ2jcMSLwzhGPPlQJgpzXkiMd1+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiY9CK8/iremStnjE/YSOubnj/3vucUypNl8H1jq/K/F4R1O67AAVg0OjhxaEr5qyXCdLfd9n/OBonvCr68W0EOn02xgzOgYADlsj7dUD+H+o0XbWSqTV3VFmTrymrV4mplhhWeRDX/pqE2SS0FlQy5boyfcOAm5TDVP/gB40W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWVhn88j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWVhn88j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718666577; x=1750202577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTO79xtGUw18m0/bQ2jcMSLwzhGPPlQJgpzXkiMd1+A=;
  b=OWVhn88jWANhd+bF6CbK2JtfzUXJjhBwcJKsxWcNQHQkkO1KKDd+anoN
   cfediDJM5Lvn/4gr5i8HddYu1EF0ojTEuOrZ5xtMvPZKMME8TregYv+wg
   lKxVT14cKkK3O8xPCi7N0EAuO9fCh17TBuaQtViQfEMLuPCMjK8fZEkls
   KOlhybQA5V8WuZ1MlS8x1D3L3jClAhCtMArN+kbljI2zelLuvd3CQrqn8
   w/xNLAzWybfxI5NH4PUbjleO/j6KBWRwn+di7sID7fzEpWfWJ1WP6aSFy
   vzbBMjuAdWunSpUrwlMsa4AEOz5NLfCwuReBkY4J5TRQScBdUjjzCVIV2
   g==;
X-CSE-ConnectionGUID: W8VYHhvGRcStwjqnEAPnxw==
X-CSE-MsgGUID: ATXKxZ5tTtuuHXb15h6vkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26096805"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="26096805"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 16:22:54 -0700
X-CSE-ConnectionGUID: vd+GB7hMSD2YBxqpkWrUBQ==
X-CSE-MsgGUID: 0MwVj8ISTNKw+YqXY1CAQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="46296648"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2024 16:22:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJLgY-0004zx-2E;
	Mon, 17 Jun 2024 23:22:50 +0000
Date: Tue, 18 Jun 2024 07:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 10/18]
 include/linux/ftrace.h:264:35: error: implicit declaration of function
 'ftrace_regs_get_stack_pointer'
Message-ID: <202406180752.vfjhlxVp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   bca8594b6a1ebda1c220b8adc951c172ade55468
commit: 53dbba3a910ff0bc30857c96bf40fbd39ce40d25 [10/18] tracing/fprobe: Enable fprobe events with CONFIG_DYNAMIC_FTRACE_WITH_ARGS
config: riscv-randconfig-001-20240618 (https://download.01.org/0day-ci/archive/20240618/202406180752.vfjhlxVp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180752.vfjhlxVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180752.vfjhlxVp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
   include/linux/ftrace.h: In function 'ftrace_get_regs':
   include/linux/ftrace.h:176:16: error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=implicit-function-declaration]
     176 |         return arch_ftrace_get_regs(fregs);
         |                ^~~~~~~~~~~~~~~~~~~~
         |                ftrace_get_regs
   include/linux/ftrace.h:176:16: warning: returning 'int' from a function with return type 'struct pt_regs *' makes pointer from integer without a cast [-Wint-conversion]
     176 |         return arch_ftrace_get_regs(fregs);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h: In function 'ftrace_regs_get_kernel_stack_nth':
>> include/linux/ftrace.h:264:35: error: implicit declaration of function 'ftrace_regs_get_stack_pointer' [-Werror=implicit-function-declaration]
     264 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:264:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     264 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                  ^
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=310187924
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2 shuffle=310187924
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=310187924
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=310187924
   make: Target 'prepare' not remade because of errors.


vim +/ftrace_regs_get_stack_pointer +264 include/linux/ftrace.h

   170	
   171	static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
   172	{
   173		if (!fregs)
   174			return NULL;
   175	
 > 176		return arch_ftrace_get_regs(fregs);
   177	}
   178	
   179	#if !defined(CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS) || \
   180		defined(CONFIG_HAVE_PT_REGS_TO_FTRACE_REGS_CAST)
   181	
   182	static __always_inline struct pt_regs *
   183	ftrace_partial_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
   184	{
   185		/*
   186		 * If CONFIG_HAVE_PT_REGS_TO_FTRACE_REGS_CAST=y, ftrace_regs memory
   187		 * layout is the same as pt_regs. So always returns that address.
   188		 * Since arch_ftrace_get_regs() will check some members and may return
   189		 * NULL, we can not use it.
   190		 */
   191		return &fregs->regs;
   192	}
   193	
   194	#endif /* !CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS || CONFIG_HAVE_PT_REGS_TO_FTRACE_REGS_CAST */
   195	
   196	#ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
   197	
   198	/*
   199	 * Please define arch dependent pt_regs which compatible to the
   200	 * perf_arch_fetch_caller_regs() but based on ftrace_regs.
   201	 * This requires
   202	 *   - user_mode(_regs) returns false (always kernel mode).
   203	 *   - able to use the _regs for stack trace.
   204	 */
   205	#ifndef arch_ftrace_fill_perf_regs
   206	/* As same as perf_arch_fetch_caller_regs(), do nothing by default */
   207	#define arch_ftrace_fill_perf_regs(fregs, _regs) do {} while (0)
   208	#endif
   209	
   210	static __always_inline struct pt_regs *
   211	ftrace_fill_perf_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
   212	{
   213		arch_ftrace_fill_perf_regs(fregs, regs);
   214		return regs;
   215	}
   216	
   217	#else /* !CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS */
   218	
   219	static __always_inline struct pt_regs *
   220	ftrace_fill_perf_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
   221	{
   222		return &fregs->regs;
   223	}
   224	
   225	#endif
   226	
   227	/*
   228	 * When true, the ftrace_regs_{get,set}_*() functions may be used on fregs.
   229	 * Note: this can be true even when ftrace_get_regs() cannot provide a pt_regs.
   230	 */
   231	static __always_inline bool ftrace_regs_has_args(struct ftrace_regs *fregs)
   232	{
   233		if (IS_ENABLED(CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS))
   234			return true;
   235	
   236		return ftrace_get_regs(fregs) != NULL;
   237	}
   238	
   239	#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
   240	#define ftrace_regs_get_instruction_pointer(fregs) \
   241		instruction_pointer(ftrace_get_regs(fregs))
   242	#define ftrace_regs_get_argument(fregs, n) \
   243		regs_get_kernel_argument(ftrace_get_regs(fregs), n)
   244	#define ftrace_regs_get_stack_pointer(fregs) \
   245		kernel_stack_pointer(ftrace_get_regs(fregs))
   246	#define ftrace_regs_get_return_value(fregs) \
   247		regs_return_value(ftrace_get_regs(fregs))
   248	#define ftrace_regs_set_return_value(fregs, ret) \
   249		regs_set_return_value(ftrace_get_regs(fregs), ret)
   250	#define ftrace_override_function_with_return(fregs) \
   251		override_function_with_return(ftrace_get_regs(fregs))
   252	#define ftrace_regs_query_register_offset(name) \
   253		regs_query_register_offset(name)
   254	#define ftrace_regs_get_frame_pointer(fregs) \
   255		frame_pointer(&(fregs)->regs)
   256	#endif
   257	
   258	#ifdef CONFIG_HAVE_REGS_AND_STACK_ACCESS_API
   259	static __always_inline unsigned long
   260	ftrace_regs_get_kernel_stack_nth(struct ftrace_regs *fregs, unsigned int nth)
   261	{
   262		unsigned long *stackp;
   263	
 > 264		stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
   265		if (((unsigned long)(stackp + nth) & ~(THREAD_SIZE - 1)) ==
   266		    ((unsigned long)stackp & ~(THREAD_SIZE - 1)))
   267			return *(stackp + nth);
   268	
   269		return 0;
   270	}
   271	#else /* !CONFIG_HAVE_REGS_AND_STACK_ACCESS_API */
   272	#define ftrace_regs_get_kernel_stack_nth(fregs, nth)	(0L)
   273	#endif /* CONFIG_HAVE_REGS_AND_STACK_ACCESS_API */
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
