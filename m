Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667C063C3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691748101; x=1723284101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ExdsFxWKbFn3tNKsrfK16RbCCRpM7baUnvBaqKw8em0=;
  b=YO8jBjjiApGM4j+y8qC3CvJqbvadWuO/mU5cIjO7CZm5JRLiHJI5hIEV
   /hyfHMKbY3q41q3qOVbwgT/62pbW7ucnnnb96V/RWYRpQjAtJ/Chqqop7
   flDPU5bv2T34RN32qSVbL7UfC2B0sPXTs/LsNx5vpbp0I4iv26wS3oTSN
   /pGlHnpgTPRNly84okJ7/8+0FjWZ68gD/ffyULJSL8CaeyEm3+guiUpCc
   XBky/70dQj2kmPQwkCUZVvdbcnJwN/Ku8UjNI9LrL33RNYcFrwJrQDBC5
   KDntAEGRZda6ZuYJDgen7ICF5DU6A0d5vRc5/H10kzdSaOgbMrki+B0vG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="402616182"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="402616182"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 03:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="682485981"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="682485981"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 03:01:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUOxe-0007gu-0X;
	Fri, 11 Aug 2023 10:01:38 +0000
Date: Fri, 11 Aug 2023 18:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 5/8]
 include/linux/ftrace.h:138:9: error: implicit declaration of function
 'kernel_stack_pointer'; did you mean 'user_stack_pointer'?
Message-ID: <202308111717.h6pPiOmD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   dfb22a7e201fa419633cc5ce757d6bffb000666a
commit: 81a0320aea7fac0e4209f7570aac3f2183eb2a98 [5/8] tracing/fprobe: Enable fprobe events with CONFIG_DYNAMIC_FTRACE_WITH_ARGS
config: um-defconfig (https://download.01.org/0day-ci/archive/20230811/202308111717.h6pPiOmD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111717.h6pPiOmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111717.h6pPiOmD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from init/main.c:21:
   include/linux/ftrace.h: In function 'ftrace_regs_get_kernel_stack_nth':
>> include/linux/ftrace.h:138:9: error: implicit declaration of function 'kernel_stack_pointer'; did you mean 'user_stack_pointer'? [-Werror=implicit-function-declaration]
     138 |         kernel_stack_pointer(ftrace_get_regs(fregs))
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:175:35: note: in expansion of macro 'ftrace_regs_get_stack_pointer'
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:175:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                  ^
   cc1: some warnings being treated as errors
--
   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from arch/x86/um/syscalls_64.c:10:
   include/linux/ftrace.h: In function 'ftrace_regs_get_kernel_stack_nth':
>> include/linux/ftrace.h:138:9: error: implicit declaration of function 'kernel_stack_pointer'; did you mean 'user_stack_pointer'? [-Werror=implicit-function-declaration]
     138 |         kernel_stack_pointer(ftrace_get_regs(fregs))
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:175:35: note: in expansion of macro 'ftrace_regs_get_stack_pointer'
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:175:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                  ^
   arch/x86/um/syscalls_64.c: At top level:
   arch/x86/um/syscalls_64.c:84:6: warning: no previous prototype for 'arch_switch_to' [-Wmissing-prototypes]
      84 | void arch_switch_to(struct task_struct *to)
         |      ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/kprobes.h:28,
                    from include/linux/kgdb.h:19,
                    from kernel/panic.c:15:
   include/linux/ftrace.h: In function 'ftrace_regs_get_kernel_stack_nth':
>> include/linux/ftrace.h:138:9: error: implicit declaration of function 'kernel_stack_pointer'; did you mean 'user_stack_pointer'? [-Werror=implicit-function-declaration]
     138 |         kernel_stack_pointer(ftrace_get_regs(fregs))
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:175:35: note: in expansion of macro 'ftrace_regs_get_stack_pointer'
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:175:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                  ^
   kernel/panic.c: In function '__warn':
   kernel/panic.c:666:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     666 |                 vprintk(args->fmt, args->args);
         |                 ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from kernel/time/hrtimer.c:30:
   include/linux/ftrace.h: In function 'ftrace_regs_get_kernel_stack_nth':
>> include/linux/ftrace.h:138:9: error: implicit declaration of function 'kernel_stack_pointer'; did you mean 'user_stack_pointer'? [-Werror=implicit-function-declaration]
     138 |         kernel_stack_pointer(ftrace_get_regs(fregs))
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:175:35: note: in expansion of macro 'ftrace_regs_get_stack_pointer'
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:175:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                  ^
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1651:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1651 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/perf_event.h:52,
                    from kernel/bpf/core.c:32:
   include/linux/ftrace.h: In function 'ftrace_regs_get_kernel_stack_nth':
>> include/linux/ftrace.h:138:9: error: implicit declaration of function 'kernel_stack_pointer'; did you mean 'user_stack_pointer'? [-Werror=implicit-function-declaration]
     138 |         kernel_stack_pointer(ftrace_get_regs(fregs))
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:175:35: note: in expansion of macro 'ftrace_regs_get_stack_pointer'
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:175:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                  ^
   kernel/bpf/core.c: At top level:
   kernel/bpf/core.c:1638:12: warning: no previous prototype for 'bpf_probe_read_kernel' [-Wmissing-prototypes]
    1638 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +138 include/linux/ftrace.h

a94617495342de Masami Hiramatsu (Google  2023-08-09  132) 
a94617495342de Masami Hiramatsu (Google  2023-08-09  133) #define ftrace_regs_get_instruction_pointer(fregs) \
a94617495342de Masami Hiramatsu (Google  2023-08-09  134) 	instruction_pointer(ftrace_get_regs(fregs))
a94617495342de Masami Hiramatsu (Google  2023-08-09  135) #define ftrace_regs_get_argument(fregs, n) \
a94617495342de Masami Hiramatsu (Google  2023-08-09  136) 	regs_get_kernel_argument(ftrace_get_regs(fregs), n)
a94617495342de Masami Hiramatsu (Google  2023-08-09  137) #define ftrace_regs_get_stack_pointer(fregs) \
a94617495342de Masami Hiramatsu (Google  2023-08-09 @138) 	kernel_stack_pointer(ftrace_get_regs(fregs))
a94617495342de Masami Hiramatsu (Google  2023-08-09  139) #define ftrace_regs_return_value(fregs) \
a94617495342de Masami Hiramatsu (Google  2023-08-09  140) 	regs_return_value(ftrace_get_regs(fregs))
a94617495342de Masami Hiramatsu (Google  2023-08-09  141) #define ftrace_regs_set_return_value(fregs, ret) \
a94617495342de Masami Hiramatsu (Google  2023-08-09  142) 	regs_set_return_value(ftrace_get_regs(fregs), ret)
a94617495342de Masami Hiramatsu (Google  2023-08-09  143) #define ftrace_override_function_with_return(fregs) \
a94617495342de Masami Hiramatsu (Google  2023-08-09  144) 	override_function_with_return(ftrace_get_regs(fregs))
a94617495342de Masami Hiramatsu (Google  2023-08-09  145) #define ftrace_regs_query_register_offset(name) \
a94617495342de Masami Hiramatsu (Google  2023-08-09  146) 	regs_query_register_offset(name)
a94617495342de Masami Hiramatsu (Google  2023-08-09  147) 
a94617495342de Masami Hiramatsu (Google  2023-08-09  148) #endif /* !CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS || !CONFIG_FUNCTION_TRACER */
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  149) 
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  150) static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  151) {
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  152) 	if (!fregs)
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  153) 		return NULL;
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  154) 
02a474ca266a47 Steven Rostedt (VMware    2020-10-27  155) 	return arch_ftrace_get_regs(fregs);
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  156) }
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  157) 
94d095ffa0e16b Mark Rutland              2022-11-03  158  /*
94d095ffa0e16b Mark Rutland              2022-11-03  159   * When true, the ftrace_regs_{get,set}_*() functions may be used on fregs.
94d095ffa0e16b Mark Rutland              2022-11-03  160   * Note: this can be true even when ftrace_get_regs() cannot provide a pt_regs.
94d095ffa0e16b Mark Rutland              2022-11-03  161   */
94d095ffa0e16b Mark Rutland              2022-11-03  162  static __always_inline bool ftrace_regs_has_args(struct ftrace_regs *fregs)
94d095ffa0e16b Mark Rutland              2022-11-03  163  {
94d095ffa0e16b Mark Rutland              2022-11-03  164  	if (IS_ENABLED(CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS))
94d095ffa0e16b Mark Rutland              2022-11-03  165  		return true;
94d095ffa0e16b Mark Rutland              2022-11-03  166  
94d095ffa0e16b Mark Rutland              2022-11-03  167  	return ftrace_get_regs(fregs) != NULL;
94d095ffa0e16b Mark Rutland              2022-11-03  168  }
94d095ffa0e16b Mark Rutland              2022-11-03  169  
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  170) static __always_inline unsigned long
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  171) ftrace_regs_get_kernel_stack_nth(struct ftrace_regs *fregs, unsigned int nth)
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  172) {
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  173) 	unsigned long *stackp;
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  174) 
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09 @175) 	stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  176) 	if (((unsigned long)(stackp + nth) & ~(THREAD_SIZE - 1)) ==
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  177) 	    ((unsigned long)stackp & ~(THREAD_SIZE - 1)))
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  178) 		return *(stackp + nth);
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  179) 
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  180) 	return 0;
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  181) }
81a0320aea7fac Masami Hiramatsu (Google  2023-08-09  182) 

:::::: The code at line 138 was first introduced by commit
:::::: a94617495342def61638903b49feba1627ab071e tracing: Expose ftrace_regs regardless of CONFIG_FUNCTION_TRACER

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Masami Hiramatsu (Google) <mhiramat@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
