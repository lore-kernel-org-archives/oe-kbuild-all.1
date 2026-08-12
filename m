Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676FC1A6838
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 18:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786560417; cv=none; b=PfyfATDgsaUxNOhbGdFn4tr5mMJgGWbIwm7WzvFFrVcxV9G6heEwj8eJrz0rFdcGLlYdkmBq6BLhCfUWq/oT2+U/cKyaXe1CrdfnBn1un71gzq7f1V3yW7/MZnjkDXVByZSK0z3Qb4wobCgXds46oKVHoDKFWBMJvIK6A6fl0Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786560417; c=relaxed/simple;
	bh=MMyN5JRSQgHL5W1iemPm+So/JlTUBFWHXpeIq4x4TMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1lWF/rMV6juQvXOpAnecn6Zog/6jpG/j5P5QFNd95T2F7+JOkgOxf4sO+QIh1ZXdgWYlAcauHrEYGY/XhaLvr5VRllzExcmodxzDmpKu2kp9PJuzqCgRJwr6Of5We3psXc10XtpLcOSLYRY+maLH6o7CiJS27Mh5LFE+JfZTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwnuEoOe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwnuEoOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786560415; x=1818096415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MMyN5JRSQgHL5W1iemPm+So/JlTUBFWHXpeIq4x4TMo=;
  b=MwnuEoOeEGCWQrdMYhdiPGQdCpFewBNDZKkCB1ZA4dxj8rEuv+WjSTci
   vHOoJSh/RwW36yiWo0qNta/l5W8jMn24vIhBoo7aqlxB1NmtRtIUESKz2
   casHFSTxftqD4r+fAZfNu+K6tUq6dzQw1YygZe1ovA+1ZuG5IOC/AVOeS
   +AC1jpteOppCu83SI/9QJ8xAJa7Qt+uH4N2Y9QlG74XpyTgcTBjhdnGxV
   mN1GvQ1tFGGT7RCeeCau4gaLAYMvUIAX1Qkix48vHouCP39AvBh/jFo6k
   gh074gIO7b4vi/Z+3UhAucK6rk2UQ8AR2ll0UrcqBXG7ZnbiRRFt/gfCz
   w==;
X-CSE-ConnectionGUID: E6JFKkHSTo2Cl6kHNUS1zA==
X-CSE-MsgGUID: jQCh7Su2RWqGvwYXkecgKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="74666033"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="74666033"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 11:46:55 -0700
X-CSE-ConnectionGUID: TRCT1wNwTB2Ehei9cwh0Jw==
X-CSE-MsgGUID: I0zgriQVQ52nn4o+D2I3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="265712412"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2026 11:46:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuDyS-00000000RNC-45uo;
	Wed, 12 Aug 2026 18:46:48 +0000
Date: Thu, 13 Aug 2026 02:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Rui Qi <qirui.001@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3] riscv: stacktrace: fix stack-out-of-bounds in
 walk_stackframe()
Message-ID: <202608130244.qnFMlaYc-lkp@intel.com>
References: <20260625123906.211981-1-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625123906.211981-1-xujiakai2025@iscas.ac.cn>

Hi Jiakai,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.2-rc7 next-20260811]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiakai-Xu/riscv-stacktrace-fix-stack-out-of-bounds-in-walk_stackframe/20260812-091247
base:   linus/master
patch link:    https://lore.kernel.org/r/20260625123906.211981-1-xujiakai2025%40iscas.ac.cn
patch subject: [PATCH v3] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
config: riscv-randconfig-002-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130244.qnFMlaYc-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130244.qnFMlaYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130244.qnFMlaYc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from arch/riscv/kernel/stacktrace.c:7:
   arch/riscv/kernel/stacktrace.c: In function 'walk_stackframe':
>> arch/riscv/kernel/stacktrace.c:82:39: error: 'irq_stack_ptr' undeclared (first use in this function); did you mean 'irq_stat'?
      high = (unsigned long)this_cpu_read(irq_stack_ptr) +
                                          ^~~~~~~~~~~~~
   include/linux/compiler.h:239:40: note: in definition of macro 'TYPEOF_UNQUAL'
    # define TYPEOF_UNQUAL(exp) __typeof__(exp)
                                           ^~~
   include/linux/percpu-defs.h:499:29: note: in expansion of macro '__pcpu_size_call_return'
    #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
                                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/stacktrace.c:82:25: note: in expansion of macro 'this_cpu_read'
      high = (unsigned long)this_cpu_read(irq_stack_ptr) +
                            ^~~~~~~~~~~~~
   arch/riscv/kernel/stacktrace.c:82:39: note: each undeclared identifier is reported only once for each function it appears in
      high = (unsigned long)this_cpu_read(irq_stack_ptr) +
                                          ^~~~~~~~~~~~~
   include/linux/compiler.h:239:40: note: in definition of macro 'TYPEOF_UNQUAL'
    # define TYPEOF_UNQUAL(exp) __typeof__(exp)
                                           ^~~
   include/linux/percpu-defs.h:499:29: note: in expansion of macro '__pcpu_size_call_return'
    #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
                                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/stacktrace.c:82:25: note: in expansion of macro 'this_cpu_read'
      high = (unsigned long)this_cpu_read(irq_stack_ptr) +
                            ^~~~~~~~~~~~~


vim +82 arch/riscv/kernel/stacktrace.c

   > 7	#include <linux/export.h>
     8	#include <linux/kallsyms.h>
     9	#include <linux/sched.h>
    10	#include <linux/sched/debug.h>
    11	#include <linux/sched/task_stack.h>
    12	#include <linux/stacktrace.h>
    13	#include <linux/ftrace.h>
    14	
    15	#include <asm/stacktrace.h>
    16	
    17	#ifdef CONFIG_FRAME_POINTER
    18	
    19	/*
    20	 * This disables KASAN checking when reading a value from another task's stack,
    21	 * since the other task could be running on another CPU and could have poisoned
    22	 * the stack in the meantime.
    23	 */
    24	#define READ_ONCE_TASK_STACK(task, x)			\
    25	({							\
    26		unsigned long val;				\
    27		unsigned long addr = x;				\
    28		if ((task) == current)				\
    29			val = READ_ONCE(addr);			\
    30		else						\
    31			val = READ_ONCE_NOCHECK(addr);		\
    32		val;						\
    33	})
    34	
    35	extern asmlinkage void handle_exception(void);
    36	extern unsigned long ret_from_exception_end;
    37	
    38	#ifdef CONFIG_IRQ_STACKS
    39	DECLARE_PER_CPU(ulong *, irq_stack_ptr);
    40	#endif
    41	
    42	static inline int fp_is_valid(unsigned long fp, unsigned long sp,
    43				      unsigned long high)
    44	{
    45		unsigned long low;
    46	
    47		low = sp + sizeof(struct stackframe);
    48	
    49		return !(fp < low || fp > high || fp & 0x07);
    50	}
    51	
    52	void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
    53				     bool (*fn)(void *, unsigned long), void *arg)
    54	{
    55		unsigned long fp, sp, pc, high;
    56		int graph_idx = 0;
    57		int level = 0;
    58	
    59		if (regs) {
    60			fp = frame_pointer(regs);
    61			sp = user_stack_pointer(regs);
    62			pc = instruction_pointer(regs);
    63		} else if (task == NULL || task == current) {
    64			fp = (unsigned long)__builtin_frame_address(0);
    65			sp = current_stack_pointer;
    66			pc = (unsigned long)walk_stackframe;
    67			level = -1;
    68		} else {
    69			/* task blocked in __switch_to */
    70			fp = task->thread.s[0];
    71			sp = task->thread.sp;
    72			pc = task->thread.ra;
    73		}
    74	
    75		if (!task)
    76			task = current;
    77	
    78		if (sp >= (unsigned long)task_stack_page(task) &&
    79		    sp < (unsigned long)task_stack_page(task) + THREAD_SIZE) {
    80			high = (unsigned long)task_pt_regs(task);
    81		} else if (IS_ENABLED(CONFIG_IRQ_STACKS)) {
  > 82			high = (unsigned long)this_cpu_read(irq_stack_ptr) +
    83			       IRQ_STACK_SIZE;
    84		} else {
    85			high = (unsigned long)task_pt_regs(task);
    86		}
    87	
    88		for (;;) {
    89			struct stackframe *frame;
    90	
    91			if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
    92				break;
    93	
    94			if (unlikely(!fp_is_valid(fp, sp, high)))
    95				break;
    96	
    97			/* Unwind stack frame */
    98			frame = (struct stackframe *)fp - 1;
    99			sp = fp;
   100			if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp, high)) {
   101				/* We hit function where ra is not saved on the stack */
   102				fp = frame->ra;
   103				pc = regs->ra;
   104			} else {
   105				fp = READ_ONCE_TASK_STACK(task, frame->fp);
   106				pc = READ_ONCE_TASK_STACK(task, frame->ra);
   107				pc = ftrace_graph_ret_addr(task, &graph_idx, pc,
   108							   &frame->ra);
   109				if (pc >= (unsigned long)handle_exception &&
   110				    pc < (unsigned long)&ret_from_exception_end) {
   111					if (unlikely(!fn(arg, pc)))
   112						break;
   113	
   114					pc = ((struct pt_regs *)sp)->epc;
   115					fp = ((struct pt_regs *)sp)->s0;
   116				}
   117			}
   118	
   119		}
   120	}
   121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
