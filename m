Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834897;
	b=LNxfW0e1x6ehFJBp2xlZXvS2mjfpryJ6GIyZQ+U4bfDibl4L8gEYzcMRWnpwmSHYivQh
	 M0Adk7Wi3KifI5xbhBWcRnBGGsBssllZEfsCUcZ2G+JpbR66TbVP9CuR66SPa6zfSn9Cc
	 5SskARvuWmidk7klqhnKAmvNQcKaRKcLKvzwqrwKWQ7/MTi8S0eZVucCiqN3QA66Pj+N/
	 vGS3XxcvUcy1225k8Id62JzEkOjDyB2bXe02VHYZZqNVwy5BcDcJb4F0ENPgqFNvMMvQM
	 tHtdIMK+Tpf3eoXu2TNJdH6munx9poWwOVh/Pd0NE5ynUJp1FgT3IMngSLixxGPC8TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834897;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=So1NLMNe8qFea2jqMxQcSf1+UWVbDXKZq/YkUpN/nxQ=;
	b=05EnpAc6vUUgTpqMbz341tKxLkGmt0aD1zMqbN2sseWDg3GUd0thGXOwWp9jltAQ3IIh
	 wTQzdEL6n12hEaxejLE7K0tfQydmgG6JkHARLhuu77MIJJTckpwAKEMjfmGaOv4mChKem
	 9PRrGpMiDFQogYHJKqiojo8WI72kRBzg6KwN1u68PypN7TDmZ2B+nbWyvRW41bx383D07
	 2ifMNAIUUAyJaA/hYiCn+y4qoJV2ZepKFvNNTHhIUtfNvlZ3Ny6GStM5kFpPQYp/SQyi9
	 OzFQTW58VtxG4ZOtPGMWn+7SOi4rKzNOh3oG/ATcJ4Pg+a6XFG91Pq6qOQlAsmx1fTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fMIOaUm9;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5B606A336
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 13:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B5B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fMIOaUm9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794834897; x=1826370897;
  h=date:from:to:cc:subject:message-id;
  bh=ymfS/uIt59I9+3wQqDrTfpcFHg1bacAtvJBOzPM3SoA=;
  b=fMIOaUm97+TLm0Ws7GfyorSoR21lZ+RsKrSr9jniksEXCgX7hlkKRUn9
   rkMYAAfOWzm6UpIf5ff/IJMI9GnGij6mgprpv9DDlvNmacu3D/1PPSfeV
   PqMrdXrA5Xkm92Qa61Yr/8BXO1YAGM+5fsCtZM1ys6yP16347idkSIg14
   yHNnre8u6s9JE1Hu1CYivB59inEn9D0LeD0uEnvnbqWY3iKfeqQrXTIXz
   f9gMhUHF79kiA4a9uSASkwe+tHxbRlKfYmYgCl/rP2WbbaqXD2LYH6sb+
   fiGadQSMsSWTlTlwZzJKeStvN3Hg3/FAg1D0yN+hVGtiqGFky6ArjGGF8
   A==;
X-CSE-ConnectionGUID: p7TaHgXpTM6Nf4KfxrcQIg==
X-CSE-MsgGUID: fBQkd1MSTRaew4fau4lE+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3465036"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3465036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 05:14:57 -0800
X-CSE-ConnectionGUID: HYaq1xUTQp64UJR31hF0Jw==
X-CSE-MsgGUID: qweIwW9ISo2By1Cq/LbTnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9859831"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2026 05:14:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSwXt-000000002hO-1SJX;
	Mon, 16 Nov 2026 13:14:53 +0000
Date: Mon, 16 Nov 2026 14:13:58 +0100
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sspesa_v2 70/98]
 include/linux/hw_breakpoint.h:137:20: error: redefinition of
 'flush_ptrace_hw_breakpoint'
Message-ID: <202611161404.DpemKaU0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sspesa_v2
head:   6deccfa10a938ba2257b489c067a1928022d510d
commit: af18063f86dea6c4d9937e6ee9f4088839d7f364 [70/98] riscv: add ptrace requests for hardware breakpoints
config: riscv-randconfig-2200-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161404.DpemKaU0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d5c981bc431fd5e8ac0bc624472ea081515a1299)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161404.DpemKaU0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161404.DpemKaU0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace_preemptirq.c:11:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/trace/trace_preemptirq.c:14:
   In file included from kernel/trace/trace.h:15:
>> include/linux/hw_breakpoint.h:137:20: error: redefinition of 'flush_ptrace_hw_breakpoint'
     137 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)  { }
         |                    ^
   arch/riscv/include/asm/hw_breakpoint.h:58:20: note: previous definition is here
      58 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *task) { }
         |                    ^
   1 warning and 1 error generated.
--
   In file included from kernel/trace/trace.c:18:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/trace/trace.c:58:
   In file included from kernel/trace/trace.h:15:
>> include/linux/hw_breakpoint.h:137:20: error: redefinition of 'flush_ptrace_hw_breakpoint'
     137 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)  { }
         |                    ^
   arch/riscv/include/asm/hw_breakpoint.h:58:20: note: previous definition is here
      58 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *task) { }
         |                    ^
   kernel/trace/trace.c:8186:23: warning: shift count is negative [-Wshift-count-negative]
    8186 |                     !((1ULL << i) & TOP_LEVEL_TRACE_FLAGS)) {
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:518:9: note: expanded from macro 'TOP_LEVEL_TRACE_FLAGS'
     518 |                TRACE_ITER(PROF_TEXT_OFFSET) | FPROFILE_DEFAULT_FLAGS)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.h:1528:42: note: expanded from macro 'TRACE_ITER'
    1528 |         (TRACE_ITER_##flag##_BIT < 0 ? 0 : 1ULL << (TRACE_ITER_##flag##_BIT))
         |                                                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8720:48: warning: shift count is negative [-Wshift-count-negative]
    8720 |         tr->trace_flags = global_trace.trace_flags & ~ZEROED_TRACE_FLAGS;
         |                                                       ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:522:28: note: expanded from macro 'ZEROED_TRACE_FLAGS'
     522 |         (TRACE_ITER(EVENT_FORK) | TRACE_ITER(FUNC_FORK) | TRACE_ITER(TRACE_PRINTK) | \
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.h:1528:42: note: expanded from macro 'TRACE_ITER'
    1528 |         (TRACE_ITER_##flag##_BIT < 0 ? 0 : 1ULL << (TRACE_ITER_##flag##_BIT))
         |                                                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8904:21: warning: shift count is negative [-Wshift-count-negative]
    8904 |                 if ((1ULL << i) & ZEROED_TRACE_FLAGS)
         |                                   ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:522:28: note: expanded from macro 'ZEROED_TRACE_FLAGS'
     522 |         (TRACE_ITER(EVENT_FORK) | TRACE_ITER(FUNC_FORK) | TRACE_ITER(TRACE_PRINTK) | \
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.h:1528:42: note: expanded from macro 'TRACE_ITER'
    1528 |         (TRACE_ITER_##flag##_BIT < 0 ? 0 : 1ULL << (TRACE_ITER_##flag##_BIT))
         |                                                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.
--
   In file included from kernel/trace/trace_sched_wakeup.c:16:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/trace/trace_sched_wakeup.c:20:
   In file included from kernel/trace/trace.h:15:
>> include/linux/hw_breakpoint.h:137:20: error: redefinition of 'flush_ptrace_hw_breakpoint'
     137 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)  { }
         |                    ^
   arch/riscv/include/asm/hw_breakpoint.h:58:20: note: previous definition is here
      58 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *task) { }
         |                    ^
   kernel/trace/trace_sched_wakeup.c:27:14: warning: variable 'wakeup_current_cpu' set but not used [-Wunused-but-set-global]
      27 | static int                      wakeup_current_cpu;
         |                                 ^
   2 warnings and 1 error generated.
--
   In file included from kernel/trace/trace_nop.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/trace/trace_nop.c:12:
   In file included from kernel/trace/trace.h:15:
>> include/linux/hw_breakpoint.h:137:20: error: redefinition of 'flush_ptrace_hw_breakpoint'
     137 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)  { }
         |                    ^
   arch/riscv/include/asm/hw_breakpoint.h:58:20: note: previous definition is here
      58 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *task) { }
         |                    ^
   kernel/trace/trace_nop.c:35:28: warning: variable 'ctx_trace' set but not used [-Wunused-but-set-global]
      35 | static struct trace_array       *ctx_trace;
         |                                  ^
   2 warnings and 1 error generated.


vim +/flush_ptrace_hw_breakpoint +137 include/linux/hw_breakpoint.h

24f1e32c60c45c8 include/linux/hw_breakpoint.h       Frederic Weisbecker 2009-09-09  136  
24f1e32c60c45c8 include/linux/hw_breakpoint.h       Frederic Weisbecker 2009-09-09 @137  static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)	{ }
b332828c39326b1 include/asm-generic/hw_breakpoint.h K.Prasad            2009-06-01  138  

:::::: The code at line 137 was first introduced by commit
:::::: 24f1e32c60c45c89a997c73395b69c8af6f0a84e hw-breakpoints: Rewrite the hw-breakpoints layer on top of perf events

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
