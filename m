Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E644A71E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 21:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786569771; cv=none; b=K/o55ZCdgQR15nInizdi9YdjD7TbXLJNjoPMCyG2RnCLgA3rBtxqOYycEmwzTSQxkkyLVv+SoDC9oR+AHr3k4R7MJYhvA6Kle9CH4Bsko/Olq7VnvwwEy037kzoQKecayz52nocy/jttbHoluaPMo/rFMztDxqjntu0UKbVgMqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786569771; c=relaxed/simple;
	bh=e2jb7pWERCpKB7Jx3C1SfX4SXFdQWvMGGaJWBpLdISY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y8QwAbxD5FMvZfwHa58QagnEmyiPebjDxBX58Apm+BHz0lWqMF/0JPYpvhi6PhcCtjUKXD6MwafdG+Sy4gfeTSQrgQkAQJrcUNl2wm72gukPv9MEIwlVkIGocCeBIIrjYaeaBKXW1+IFClAvsmq2lqIcgxuD4Mt3CuzTUOn+fXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vh8zCHDz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vh8zCHDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786569770; x=1818105770;
  h=date:from:to:cc:subject:message-id;
  bh=e2jb7pWERCpKB7Jx3C1SfX4SXFdQWvMGGaJWBpLdISY=;
  b=Vh8zCHDzFtvGLv5jGc/TaKtkd2MGoeA1PCZJMIgduSXj9BrdkwoThdy1
   RvX3Ecwm8jCQjZWFnguCRZJn60b67lfzoCX9MrygsD3ZFVaEWl2AaCUol
   MP7sc+zf2HUt2Vvgtj0W5cbqdgz0pa0YVztsZUOIC5iiWjU+GFojjolci
   uFhLbIcC/tb1F+w7IO0QpZWDVWlA07qcHs58NCD2Y1iJbijyoRTCxoEXv
   bZU+ROT7/D69BjdNKBxvEtHSIOtIz5SJX4MYV1Eaqf/3y0Lyn11I8Unfc
   Kmw6cBHk1m16D3iYOtEvJndOo6yPFH74SNd7+ExNNb/enzEhGMZ66eol3
   A==;
X-CSE-ConnectionGUID: 9ihl21SJTBuDNJiDLXFxMA==
X-CSE-MsgGUID: JbsfjlPIT8ScBcJAPJQnsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97485362"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97485362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 14:22:48 -0700
X-CSE-ConnectionGUID: peWBg0WCQHeKg/Y5f5pz/Q==
X-CSE-MsgGUID: q/VOhLF9SSmxA+gLEA0i2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="257545815"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Aug 2026 14:22:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuGPL-00000000Rkk-3KKi;
	Wed, 12 Aug 2026 21:22:43 +0000
Date: Thu, 13 Aug 2026 05:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v5 101/104]
 include/linux/perf_event.h:1597:2: error: no member named 'ip' in 'struct
 pt_regs'
Message-ID: <202608130514.xwVupB8t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   1d99b155d3c1ca9a30209d51590db002a606f30c
commit: c233229a39d9c174acce7057ff5248560ccba131 [101/104] gtrace: Add perf driver for tracing using perf tool
config: um-randconfig-r131-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130514.xwVupB8t-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130514.xwVupB8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130514.xwVupB8t-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:25:
>> arch/x86/include/asm/perf_event.h:710:47: warning: declaration of 'struct perf_event' will not be visible outside of this function [-Wvisibility]
     710 | static inline int forward_event_to_ibs(struct perf_event *event) { return -ENOENT; }
         |                                               ^
   arch/x86/include/asm/perf_event.h:770:40: warning: declaration of 'struct perf_event' will not be visible outside of this function [-Wvisibility]
     770 | extern int x86_perf_rdpmc_index(struct perf_event *event);
         |                                        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1597:2: error: no member named 'ip' in 'struct pt_regs'
    1597 |         perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/perf_event.h:747:10: note: expanded from macro 'perf_arch_fetch_caller_regs'
     747 |         (regs)->ip = (__ip);                                    \
         |         ~~~~~~  ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1597:2: error: no member named 'sp' in 'struct pt_regs'
    1597 |         perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/perf_event.h:748:10: note: expanded from macro 'perf_arch_fetch_caller_regs'
     748 |         (regs)->sp = (unsigned long)__builtin_frame_address(0); \
         |         ~~~~~~  ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1597:2: error: no member named 'cs' in 'struct pt_regs'
    1597 |         perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/perf_event.h:749:10: note: expanded from macro 'perf_arch_fetch_caller_regs'
     749 |         (regs)->cs = __KERNEL_CS;                               \
         |         ~~~~~~  ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1597:2: error: use of undeclared identifier '__KERNEL_CS'
    1597 |         perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/perf_event.h:749:15: note: expanded from macro 'perf_arch_fetch_caller_regs'
     749 |         (regs)->cs = __KERNEL_CS;                               \
         |                      ^~~~~~~~~~~
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1597:2: error: no member named 'flags' in 'struct pt_regs'
    1597 |         perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
         |         ^                           ~~~~
   arch/x86/include/asm/perf_event.h:750:8: note: expanded from macro 'perf_arch_fetch_caller_regs'
     750 |         regs->flags = 0;                                        \
         |         ~~~~  ^
   3 warnings and 5 errors generated.
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1410: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PERF_EVENTS
   Depends on [n]: HAVE_PERF_EVENTS [=n]
   Selected by [y]:
   - GTRACE [=y] && OF [=y]


vim +1597 include/linux/perf_event.h

5331d7b84613b83 Frederic Weisbecker 2010-03-04  1580  
5331d7b84613b83 Frederic Weisbecker 2010-03-04  1581  /*
d15d356887e770c Kairui Song         2019-04-23  1582   * When generating a perf sample in-line, instead of from an interrupt /
d15d356887e770c Kairui Song         2019-04-23  1583   * exception, we lack a pt_regs. This is typically used from software events
d15d356887e770c Kairui Song         2019-04-23  1584   * like: SW_CONTEXT_SWITCHES, SW_MIGRATIONS and the tie-in with tracepoints.
d15d356887e770c Kairui Song         2019-04-23  1585   *
d15d356887e770c Kairui Song         2019-04-23  1586   * We typically don't need a full set, but (for x86) do require:
5331d7b84613b83 Frederic Weisbecker 2010-03-04  1587   * - ip for PERF_SAMPLE_IP
5331d7b84613b83 Frederic Weisbecker 2010-03-04  1588   * - cs for user_mode() tests
d15d356887e770c Kairui Song         2019-04-23  1589   * - sp for PERF_SAMPLE_CALLCHAIN
d15d356887e770c Kairui Song         2019-04-23  1590   * - eflags for MISC bits and CALLCHAIN (see: perf_hw_regs())
d15d356887e770c Kairui Song         2019-04-23  1591   *
d15d356887e770c Kairui Song         2019-04-23  1592   * NOTE: assumes @regs is otherwise already 0 filled; this is important for
d15d356887e770c Kairui Song         2019-04-23  1593   * things like PERF_SAMPLE_REGS_INTR.
5331d7b84613b83 Frederic Weisbecker 2010-03-04  1594   */
b0f82b81fe6bbcf Frederic Weisbecker 2010-05-20  1595  static inline void perf_fetch_caller_regs(struct pt_regs *regs)
5331d7b84613b83 Frederic Weisbecker 2010-03-04  1596  {
b0f82b81fe6bbcf Frederic Weisbecker 2010-05-20 @1597  	perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
5331d7b84613b83 Frederic Weisbecker 2010-03-04  1598  }
5331d7b84613b83 Frederic Weisbecker 2010-03-04  1599  

:::::: The code at line 1597 was first introduced by commit
:::::: b0f82b81fe6bbcf78d478071f33e44554726bc81 perf: Drop the skip argument from perf_arch_fetch_regs_caller

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
