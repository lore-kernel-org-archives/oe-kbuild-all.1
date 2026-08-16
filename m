Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EF6212554
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886904; cv=none; b=jNNhjvh+GcdlRJRQNFOVx+gNu720p797LyeZx4D9KxC/c+Vqwl4QaEWZrUbmrBPexa+NyVKxYsOUMd50syhDl2YAeWzHio7QOEqbSTOrhTEYnEZsYOa5Ott0ZEgaNr4C9QzZXvjfaYJa+OlQBprY75R1FnZ+UtuoQZcaFwWWcgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886904; c=relaxed/simple;
	bh=G0HiV+9V6+H06sgQSoTEaawXsAnPaP5y4uym1wzFYBw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aBBP/9LoUzagzJ8hA6C/Ac7EStXjBbD/jfM1NgifvZmMWLTq2vV3ErZhM0hg3v+1Ra8TgMVySIpAfdkGAPMz5bjOvxiR6YzW0FKD6Wkw01r+UqTrqktbA/WsYLi8axq0rkCrmCUa1reDhoxkp0iO48JQhRC4O/9cu0r2r4Whg0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5BZKJwv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5BZKJwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786886903; x=1818422903;
  h=date:from:to:cc:subject:message-id;
  bh=G0HiV+9V6+H06sgQSoTEaawXsAnPaP5y4uym1wzFYBw=;
  b=e5BZKJwvQYbmHBG981GblvG6yZ6FD+FsDACf/qLab8uobqGM7heJvvgc
   e8X1uFO4VRh1/RA+H2etm4B3uTEMK6rcGKP/kyI8ZV2BYu/7DwS3sOL7t
   qGpVTTnfl9RzxZ0O4vK4X9/3pklOaDMIOWm4ipIEjjrB7M1eYRxiMOsgf
   ZnzOHAdwgJLE/VwiPO9Fk5QILezzkG1My9PF5d4xpoNyOOaBVmnr0RJAk
   kwhnLi//TqFqg284TopTN+XDMp9mn+5WCSe0flRzKclaHp9Wd9avWtwrb
   s/iZ4kLP11PvzRF+LkKwclxImeog0XrAa1lGXCWw6Wli2e+Rrcytr3mc0
   Q==;
X-CSE-ConnectionGUID: V5stTmYwRwKCUnb2t3Nk7w==
X-CSE-MsgGUID: 2Da36tFVROmpgipQ0ZFQuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="91256563"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="91256563"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 06:28:20 -0700
X-CSE-ConnectionGUID: CgiTSbqZQ+CXftPWVSrdzQ==
X-CSE-MsgGUID: z+aXUSTFSCC1mIn/8JB8FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="265281191"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Aug 2026 06:28:20 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvauP-000000006ao-0NXJ;
	Sun, 16 Aug 2026 13:28:17 +0000
Date: Sun, 16 Aug 2026 15:27:48 +0200
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: lib/sys_info.c:154:17: error: implicit declaration of
 function 'ftrace_dump'; did you mean 'ftrace_bug'?
Message-ID: <202608161520.80bt1KHN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Move-non-trace_printk-prototypes-back-to-kernel-h/20260814-235157
head:   5803c3be0223106fdafb05968cefd241bf88fef1
commit: 5803c3be0223106fdafb05968cefd241bf88fef1 tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean up kernel.h
date:   2 days ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260816/202608161520.80bt1KHN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161520.80bt1KHN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161520.80bt1KHN-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/sys_info.c: In function '__sys_info':
>> lib/sys_info.c:154:17: error: implicit declaration of function 'ftrace_dump'; did you mean 'ftrace_bug'? [-Wimplicit-function-declaration]
     154 |                 ftrace_dump(DUMP_ALL);
         |                 ^~~~~~~~~~~
         |                 ftrace_bug
>> lib/sys_info.c:154:29: error: 'DUMP_ALL' undeclared (first use in this function)
     154 |                 ftrace_dump(DUMP_ALL);
         |                             ^~~~~~~~
   lib/sys_info.c:154:29: note: each undeclared identifier is reported only once for each function it appears in
--
   samples/trace_printk/trace-printk.c: In function 'trace_printk_irq_work':
>> samples/trace_printk/trace-printk.c:20:9: error: implicit declaration of function 'trace_printk'; did you mean 'early_printk'? [-Wimplicit-function-declaration]
      20 |         trace_printk("(irq) This is a static string that will use trace_bputs\n");
         |         ^~~~~~~~~~~~
         |         early_printk
--
   drivers/tty/sysrq.c: In function 'sysrq_ftrace_dump':
>> drivers/tty/sysrq.c:331:9: error: implicit declaration of function 'ftrace_dump'; did you mean 'ftrace_bug'? [-Wimplicit-function-declaration]
     331 |         ftrace_dump(DUMP_ALL);
         |         ^~~~~~~~~~~
         |         ftrace_bug
>> drivers/tty/sysrq.c:331:21: error: 'DUMP_ALL' undeclared (first use in this function)
     331 |         ftrace_dump(DUMP_ALL);
         |                     ^~~~~~~~
   drivers/tty/sysrq.c:331:21: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from kernel/rcu/tree.c:70:
   kernel/rcu/tree_stall.h: In function 'rcu_stall_kick_kthreads':
   kernel/rcu/rcu.h:337:17: error: implicit declaration of function 'ftrace_dump'; did you mean 'ftrace_bug'? [-Wimplicit-function-declaration]
     337 |                 ftrace_dump(oops_dump_mode); \
         |                 ^~~~~~~~~~~
   kernel/rcu/tree_stall.h:238:17: note: in expansion of macro 'rcu_ftrace_dump'
     238 |                 rcu_ftrace_dump(DUMP_ALL);
         |                 ^~~~~~~~~~~~~~~
>> kernel/rcu/tree_stall.h:238:33: error: 'DUMP_ALL' undeclared (first use in this function)
     238 |                 rcu_ftrace_dump(DUMP_ALL);
         |                                 ^~~~~~~~
   kernel/rcu/rcu.h:337:29: note: in definition of macro 'rcu_ftrace_dump'
     337 |                 ftrace_dump(oops_dump_mode); \
         |                             ^~~~~~~~~~~~~~
   kernel/rcu/tree_stall.h:238:33: note: each undeclared identifier is reported only once for each function it appears in
     238 |                 rcu_ftrace_dump(DUMP_ALL);
         |                                 ^~~~~~~~
   kernel/rcu/rcu.h:337:29: note: in definition of macro 'rcu_ftrace_dump'
     337 |                 ftrace_dump(oops_dump_mode); \
         |                             ^~~~~~~~~~~~~~
   kernel/rcu/tree_stall.h: In function 'check_cpu_stall':
   kernel/rcu/tree_stall.h:859:41: error: 'DUMP_ALL' undeclared (first use in this function)
     859 |                         rcu_ftrace_dump(DUMP_ALL);
         |                                         ^~~~~~~~
   kernel/rcu/rcu.h:337:29: note: in definition of macro 'rcu_ftrace_dump'
     337 |                 ftrace_dump(oops_dump_mode); \
         |                             ^~~~~~~~~~~~~~


vim +154 lib/sys_info.c

d747755917bf8a Feng Tang       2025-07-03  138  
03ef32d665e8a2 Feng Tang       2025-11-13  139  static void __sys_info(unsigned long si_mask)
b76e89e50fc369 Feng Tang       2025-07-03  140  {
b76e89e50fc369 Feng Tang       2025-07-03  141  	if (si_mask & SYS_INFO_TASKS)
b76e89e50fc369 Feng Tang       2025-07-03  142  		show_state();
b76e89e50fc369 Feng Tang       2025-07-03  143  
b76e89e50fc369 Feng Tang       2025-07-03  144  	if (si_mask & SYS_INFO_MEM)
b76e89e50fc369 Feng Tang       2025-07-03  145  		show_mem();
b76e89e50fc369 Feng Tang       2025-07-03  146  
b76e89e50fc369 Feng Tang       2025-07-03  147  	if (si_mask & SYS_INFO_TIMERS)
b76e89e50fc369 Feng Tang       2025-07-03  148  		sysrq_timer_list_show();
b76e89e50fc369 Feng Tang       2025-07-03  149  
b76e89e50fc369 Feng Tang       2025-07-03  150  	if (si_mask & SYS_INFO_LOCKS)
b76e89e50fc369 Feng Tang       2025-07-03  151  		debug_show_all_locks();
b76e89e50fc369 Feng Tang       2025-07-03  152  
b76e89e50fc369 Feng Tang       2025-07-03  153  	if (si_mask & SYS_INFO_FTRACE)
b76e89e50fc369 Feng Tang       2025-07-03 @154  		ftrace_dump(DUMP_ALL);
b76e89e50fc369 Feng Tang       2025-07-03  155  
760fc597c33d5a Andy Shevchenko 2025-10-30  156  	if (si_mask & SYS_INFO_ALL_BT)
b76e89e50fc369 Feng Tang       2025-07-03  157  		trigger_all_cpu_backtrace();
b76e89e50fc369 Feng Tang       2025-07-03  158  
b76e89e50fc369 Feng Tang       2025-07-03  159  	if (si_mask & SYS_INFO_BLOCKED_TASKS)
b76e89e50fc369 Feng Tang       2025-07-03  160  		show_state_filter(TASK_UNINTERRUPTIBLE);
b76e89e50fc369 Feng Tang       2025-07-03  161  }
03ef32d665e8a2 Feng Tang       2025-11-13  162  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
