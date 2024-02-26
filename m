Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4591CAAE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 08:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708935618; cv=none; b=CKpneaLhSGX+WVG/d8LvitnCZOj0hT3isvYzoBo30qg3OipzS7SX8G9EC0IziVbTvQGiFLZIKNj76Mdnhsbwbb/A1xhCyc3IwRhD7XMJxaNd5rjshoBZFONWFmBVo0OPBW+38AVZxsTfNZ3LM6JnQAjMMYQvKMTrCKsDLnwF8kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708935618; c=relaxed/simple;
	bh=djBFmuFT1L0a1N3d4J3PalMsAo3G0Ua9pPufHzZGXq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XC9Q04VpgilSErskNuN7X13BjK0WBfov4Y9SaqUgcV8Np4IkoIDwEI0NN0Uvzxa0d2Es/E8lBtN16TJs72W02pxG2u/AWw+/v6fNdTC+kb+mkGY/FWhejuz0jJWrbLyeLgWigjssMHj8rGv5/zzl/Y6KtWotKNVOyAWJO1kug7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WV6B2sz1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WV6B2sz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708935616; x=1740471616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=djBFmuFT1L0a1N3d4J3PalMsAo3G0Ua9pPufHzZGXq0=;
  b=WV6B2sz1+oIHk6zHHCSyqUq4wcUNBmVllPECDVwALk1QXGB6KBjF3/5L
   FXumSGiZi0hY1EpGbhOTqHrB7r/k33GCTSreOjiObxosck1OyqwnGGiWn
   sCvGT4+uDTgPc5tSmz+oMo3QcC63rajzaq+0pFfTMk/pd9crZ6XgPbs55
   CoAfwSkgoTE4oA5tSJAEu8L+lBjxOAzOrkCnGIOZnOeE73a5+yJl6U661
   S5WC+ROWiorfVHpjy5bbHBjn30Z/9RgsBTRjR4c+fZwDXT32BuI8uTcJx
   CIkfn81zbJuEC0y2YoSt7M2PZsGg7ANn/Je/MVQ6+JyH2W4tqDi13ZZx6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="7022677"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7022677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 00:20:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11154419"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Feb 2024 00:20:13 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reWDa-000ABV-2R;
	Mon, 26 Feb 2024 08:20:10 +0000
Date: Mon, 26 Feb 2024 16:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 31/35]
 include/linux/ftrace.h:261:1: warning: 'ftrace_regs_get_return_address'
 declared 'static' but never defined
Message-ID: <202402261657.RVvjI8OK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   dae9b680d2415f2ba0c234713cac2a2022443d9a
commit: 85ea4fc216f7e8eb4a97a6fa417bfe78d679fb1a [31/35] fprobe: Rewrite fprobe on function-graph tracer
config: i386-randconfig-141-20240226 (https://download.01.org/0day-ci/archive/20240226/202402261657.RVvjI8OK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261657.RVvjI8OK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261657.RVvjI8OK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from kernel/fork.c:55:
>> include/linux/ftrace.h:261:1: warning: 'ftrace_regs_get_return_address' declared 'static' but never defined [-Wunused-function]
     261 | ftrace_regs_get_return_address(struct ftrace_regs *fregs);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/panic.c: In function '__warn':
   kernel/panic.c:670:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     670 |                 vprintk(args->fmt, args->args);
         |                 ^~~~~~~
   In file included from include/linux/kprobes.h:28,
                    from include/linux/kgdb.h:19,
                    from kernel/panic.c:15:
   include/linux/ftrace.h: At top level:
>> include/linux/ftrace.h:261:1: warning: 'ftrace_regs_get_return_address' declared 'static' but never defined [-Wunused-function]
     261 | ftrace_regs_get_return_address(struct ftrace_regs *fregs);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from kernel/ptrace.c:27:
>> include/linux/ftrace.h:261:1: warning: 'ftrace_regs_get_return_address' declared 'static' but never defined [-Wunused-function]
     261 | ftrace_regs_get_return_address(struct ftrace_regs *fregs);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:292,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from include/linux/sched.h:13,
                    from kernel/ptrace.c:13:
   In function 'fortify_memcpy_chk',
       inlined from 'syscall_get_arguments' at arch/x86/include/asm/syscall.h:87:2,
       inlined from 'ptrace_get_syscall_info_entry.constprop.isra' at kernel/ptrace.c:929:2:
   include/linux/fortify-string.h:537:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     537 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/audit.c: In function 'audit_log_vformat':
   kernel/audit.c:1979:9: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1979 |         len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args);
         |         ^~~
   kernel/audit.c:1988:17: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1988 |                 len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args2);
         |                 ^~~
   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from kernel/audit.c:44:
   include/linux/ftrace.h: At top level:
>> include/linux/ftrace.h:261:1: warning: 'ftrace_regs_get_return_address' declared 'static' but never defined [-Wunused-function]
     261 | ftrace_regs_get_return_address(struct ftrace_regs *fregs);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from include/linux/entry-common.h:7,
                    from kernel/entry/common.c:4:
>> include/linux/ftrace.h:261:1: warning: 'ftrace_regs_get_return_address' declared 'static' but never defined [-Wunused-function]
     261 | ftrace_regs_get_return_address(struct ftrace_regs *fregs);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:292,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from include/linux/sched.h:13,
                    from include/linux/context_tracking.h:5,
                    from kernel/entry/common.c:3:
   In function 'fortify_memcpy_chk',
       inlined from 'syscall_get_arguments' at arch/x86/include/asm/syscall.h:87:2,
       inlined from 'trace_event_raw_event_sys_enter' at include/trace/events/syscalls.h:18:1:
   include/linux/fortify-string.h:537:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     537 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'fortify_memcpy_chk',
       inlined from 'syscall_get_arguments' at arch/x86/include/asm/syscall.h:87:2,
       inlined from 'perf_trace_sys_enter' at include/trace/events/syscalls.h:18:1:
   include/linux/fortify-string.h:537:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     537 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'fortify_memcpy_chk',
       inlined from 'syscall_get_arguments' at arch/x86/include/asm/syscall.h:87:2,
       inlined from 'syscall_enter_audit' at kernel/entry/common.c:23:3,
       inlined from 'syscall_trace_enter' at kernel/entry/common.c:63:2:
   include/linux/fortify-string.h:537:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     537 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
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
   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from kernel/time/hrtimer.c:30:
>> include/linux/ftrace.h:261:1: warning: 'ftrace_regs_get_return_address' declared 'static' but never defined [-Wunused-function]
     261 | ftrace_regs_get_return_address(struct ftrace_regs *fregs);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/bpf/btf.c: In function 'btf_seq_show':
   kernel/bpf/btf.c:7137:29: warning: function 'btf_seq_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7137 |         seq_vprintf((struct seq_file *)show->target, fmt, args);
         |                             ^~~~~~~~
   kernel/bpf/btf.c: In function 'btf_snprintf_show':
   kernel/bpf/btf.c:7174:9: warning: function 'btf_snprintf_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7174 |         len = vsnprintf(show->target, ssnprintf->len_left, fmt, args);
         |         ^~~
   In file included from include/linux/perf_event.h:52,
                    from kernel/bpf/btf.c:24:
   include/linux/ftrace.h: At top level:
>> include/linux/ftrace.h:261:1: warning: 'ftrace_regs_get_return_address' declared 'static' but never defined [-Wunused-function]
     261 | ftrace_regs_get_return_address(struct ftrace_regs *fregs);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +261 include/linux/ftrace.h

   239	
   240	#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
   241	#define ftrace_regs_get_instruction_pointer(fregs) \
   242		instruction_pointer(ftrace_get_regs(fregs))
   243	#define ftrace_regs_get_argument(fregs, n) \
   244		regs_get_kernel_argument(ftrace_get_regs(fregs), n)
   245	#define ftrace_regs_get_stack_pointer(fregs) \
   246		kernel_stack_pointer(ftrace_get_regs(fregs))
   247	#define ftrace_regs_get_return_value(fregs) \
   248		regs_return_value(ftrace_get_regs(fregs))
   249	#define ftrace_regs_set_return_value(fregs, ret) \
   250		regs_set_return_value(ftrace_get_regs(fregs), ret)
   251	#define ftrace_override_function_with_return(fregs) \
   252		override_function_with_return(ftrace_get_regs(fregs))
   253	#define ftrace_regs_query_register_offset(name) \
   254		regs_query_register_offset(name)
   255	#define ftrace_regs_get_frame_pointer(fregs) \
   256		frame_pointer(&(fregs)->regs)
   257	
   258	#ifdef CONFIG_HAVE_FUNCTION_GRAPH_FREGS
   259	/* This function works correctly in ftrace entry function. */
   260	static __always_inline unsigned long
 > 261	ftrace_regs_get_return_address(struct ftrace_regs *fregs);
   262	#endif
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
