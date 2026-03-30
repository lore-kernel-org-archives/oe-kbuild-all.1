Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285A62222AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 23:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774914663; cv=none; b=gZNLwmFC8ABcEfNlR7YEA194TzHdWaQR3Erpl1AdLYnJX0P65XdHbM8GBRsJ6x9xSXH090B3g+egbjgfKiA5DatLgeYXxGITQ+1jCvmDZcJ1tXJGL26R5e+Zm+Rk3baF8u3oCfGLOQ16qY6i1rKfES47OeKDIJ9iKANYekGTJQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774914663; c=relaxed/simple;
	bh=FqYqq0ZKRPLA1SxWABIaVrE9urguVk3RR854lR/fz5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ/OLqbhUb+1UJ59wAU3D9nQZshX1ajJ8TD/jYpV5KxS6WpsFrtaiUkYOMON30kddreEbqQ4DGbYxpUScx+VHi6ulFOhPXdJ1YT5F+r+h98aACPpeCfnUE3I19UlBmf1ZKzVCwDmIbM4j9hLDg/DJ0pABTJ0A7iEHKbSj6XBf28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpYA9Rzr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpYA9Rzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774914661; x=1806450661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FqYqq0ZKRPLA1SxWABIaVrE9urguVk3RR854lR/fz5M=;
  b=IpYA9RzrAMkeF3AKFKFpHU2jGa+EsaK1atxFc3ieh2itcc55qtTAMdu9
   44ApLJUs5/PbVBcZSYa05Lwi1LkoF4Q/tcrqWTDAo6FEVKMNC5jnbSWKe
   2+6GYRcQYeGltRLyJChKsb34XqrbHA+ApiX/LVsfzWBJUE8A5MIwXzByF
   HO4l4StPUUvutklwXCbh5Ti3wz8n804WondM9zii7kCypSZDVWPjCQdSz
   A/e/3x0PWmN7jInqW1CZx+dOQGLDMYz8tvBOBsWAPdK1XoEjGeF3EqNIT
   HjKLzEx3hre3DlvjDa0gjmDixMXJSTwueh35eOQqc82ZYhvxAHHAc1GNa
   w==;
X-CSE-ConnectionGUID: H8PKK85gTESqSMK4wCkFYQ==
X-CSE-MsgGUID: HCDXeMhXQRi3H8oNKp+Unw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75978960"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75978960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 16:51:00 -0700
X-CSE-ConnectionGUID: BQ8AXnWfS/i9Fl0h4Ob0jQ==
X-CSE-MsgGUID: oCrp48//TZOhAHlORKbE/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="226075224"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Mar 2026 16:50:59 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7MNk-000000001sp-4Bzy;
	Mon, 30 Mar 2026 23:50:57 +0000
Date: Tue, 31 Mar 2026 07:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] x86/topo: Unify srat_detect_node among
 amd/intel/hygon
Message-ID: <202603310712.dghXCGC6-lkp@intel.com>
References: <20260329120841.2118684-1-zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329120841.2118684-1-zlatistiv@gmail.com>

Hi Nikola,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on tip/x86/core v7.0-rc6 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikola-Z-Ivanov/x86-topo-Unify-srat_detect_node-among-amd-intel-hygon/20260330-114947
base:   linus/master
patch link:    https://lore.kernel.org/r/20260329120841.2118684-1-zlatistiv%40gmail.com
patch subject: [RFC PATCH] x86/topo: Unify srat_detect_node among amd/intel/hygon
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260331/202603310712.dghXCGC6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310712.dghXCGC6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310712.dghXCGC6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/nios2/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/nios2/kernel/asm-offsets.c:9:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
--
   In file included from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/nios2/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from arch/nios2/kernel/irq.c:13:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
   arch/nios2/kernel/irq.c:19:17: warning: no previous prototype for 'do_IRQ' [-Wmissing-prototypes]
      19 | asmlinkage void do_IRQ(int hwirq, struct pt_regs *regs)
         |                 ^~~~~~
--
   In file included from include/linux/gfp.h:8,
                    from include/linux/xarray.h:16,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from include/linux/clocksource.h:19,
                    from include/linux/clockchips.h:14,
                    from include/linux/tick.h:8,
                    from arch/nios2/kernel/process.c:21:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
   arch/nios2/kernel/process.c:34:6: warning: no previous prototype for 'arch_cpu_idle' [-Wmissing-prototypes]
      34 | void arch_cpu_idle(void)
         |      ^~~~~~~~~~~~~
   arch/nios2/kernel/process.c:43:6: warning: no previous prototype for 'machine_restart' [-Wmissing-prototypes]
      43 | void machine_restart(char *__unused)
         |      ^~~~~~~~~~~~~~~
   arch/nios2/kernel/process.c:54:6: warning: no previous prototype for 'machine_halt' [-Wmissing-prototypes]
      54 | void machine_halt(void)
         |      ^~~~~~~~~~~~
   arch/nios2/kernel/process.c:66:6: warning: no previous prototype for 'machine_power_off' [-Wmissing-prototypes]
      66 | void machine_power_off(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/nios2/kernel/process.c:152:6: warning: no previous prototype for 'dump' [-Wmissing-prototypes]
     152 | void dump(struct pt_regs *fp)
         |      ^~~~
   arch/nios2/kernel/process.c:253:16: warning: no previous prototype for 'nios2_clone' [-Wmissing-prototypes]
     253 | asmlinkage int nios2_clone(unsigned long clone_flags, unsigned long newsp,
         |                ^~~~~~~~~~~
--
   In file included from include/linux/gfp.h:8,
                    from include/linux/mm.h:8,
                    from arch/nios2/kernel/setup.c:15:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
   arch/nios2/kernel/setup.c:102:24: warning: no previous prototype for 'nios2_boot_init' [-Wmissing-prototypes]
     102 | asmlinkage void __init nios2_boot_init(unsigned r4, unsigned r5, unsigned r6,
         |                        ^~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:8,
                    from include/linux/mm.h:8,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/signal.c:14:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
   arch/nios2/kernel/signal.c:101:16: warning: no previous prototype for 'do_rt_sigreturn' [-Wmissing-prototypes]
     101 | asmlinkage int do_rt_sigreturn(struct switch_stack *sw)
         |                ^~~~~~~~~~~~~~~
   arch/nios2/kernel/signal.c:302:16: warning: no previous prototype for 'do_notify_resume' [-Wmissing-prototypes]
     302 | asmlinkage int do_notify_resume(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:8,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from arch/nios2/kernel/sys_nios2.c:13:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
   arch/nios2/kernel/sys_nios2.c:21:16: warning: no previous prototype for 'sys_cacheflush' [-Wmissing-prototypes]
      21 | asmlinkage int sys_cacheflush(unsigned long addr, unsigned long len,
         |                ^~~~~~~~~~~~~~
   arch/nios2/kernel/sys_nios2.c:57:16: warning: no previous prototype for 'sys_getpagesize' [-Wmissing-prototypes]
      57 | asmlinkage int sys_getpagesize(void)
         |                ^~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:8,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:84,
                    from arch/nios2/kernel/syscall_table.c:6:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:1:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       1 | __SYSCALL_WITH_COMPAT(0, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[0]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:1:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       1 | __SYSCALL_WITH_COMPAT(0, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:2:1: note: in expansion of macro '__SYSCALL'
       2 | __SYSCALL(1, sys_io_destroy)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[1]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:2:1: note: in expansion of macro '__SYSCALL'
       2 | __SYSCALL(1, sys_io_destroy)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:3:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       3 | __SYSCALL_WITH_COMPAT(2, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[2]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:3:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       3 | __SYSCALL_WITH_COMPAT(2, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:4:1: note: in expansion of macro '__SYSCALL'
       4 | __SYSCALL(3, sys_io_cancel)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[3]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:4:1: note: in expansion of macro '__SYSCALL'
       4 | __SYSCALL(3, sys_io_cancel)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:5:1: note: in expansion of macro '__SYSCALL'
       5 | __SYSCALL(4, sys_io_getevents_time32)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[4]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:5:1: note: in expansion of macro '__SYSCALL'
       5 | __SYSCALL(4, sys_io_getevents_time32)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:6:1: note: in expansion of macro '__SYSCALL'
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[5]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:6:1: note: in expansion of macro '__SYSCALL'
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:7:1: note: in expansion of macro '__SYSCALL'
       7 | __SYSCALL(6, sys_lsetxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[6]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:7:1: note: in expansion of macro '__SYSCALL'
       7 | __SYSCALL(6, sys_lsetxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
--
   In file included from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/nios2/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from arch/nios2/kernel/time.c:12:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
   arch/nios2/kernel/time.c:200:13: warning: no previous prototype for 'timer_interrupt' [-Wmissing-prototypes]
     200 | irqreturn_t timer_interrupt(int irq, void *dev_id)
         |             ^~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:8,
                    from include/linux/mm.h:8,
                    from arch/nios2/kernel/traps.c:18:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
   arch/nios2/kernel/traps.c:32:6: warning: no previous prototype for 'die' [-Wmissing-prototypes]
      32 | void die(const char *str, struct pt_regs *regs, long err)
         |      ^~~
   arch/nios2/kernel/traps.c:109:17: warning: no previous prototype for 'breakpoint_c' [-Wmissing-prototypes]
     109 | asmlinkage void breakpoint_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~
   arch/nios2/kernel/traps.c:122:17: warning: no previous prototype for 'handle_unaligned_c' [-Wmissing-prototypes]
     122 | asmlinkage void handle_unaligned_c(struct pt_regs *fp, int cause)
         |                 ^~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:147:17: warning: no previous prototype for 'handle_illegal_c' [-Wmissing-prototypes]
     147 | asmlinkage void handle_illegal_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:154:17: warning: no previous prototype for 'handle_supervisor_instr' [-Wmissing-prototypes]
     154 | asmlinkage void handle_supervisor_instr(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:161:17: warning: no previous prototype for 'handle_diverror_c' [-Wmissing-prototypes]
     161 | asmlinkage void handle_diverror_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:168:17: warning: no previous prototype for 'unhandled_exception' [-Wmissing-prototypes]
     168 | asmlinkage void unhandled_exception(struct pt_regs *regs, int cause)
         |                 ^~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:183:17: warning: no previous prototype for 'handle_trap_1_c' [-Wmissing-prototypes]
     183 | asmlinkage void handle_trap_1_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:188:17: warning: no previous prototype for 'handle_trap_2_c' [-Wmissing-prototypes]
     188 | asmlinkage void handle_trap_2_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:193:17: warning: no previous prototype for 'handle_trap_3_c' [-Wmissing-prototypes]
     193 | asmlinkage void handle_trap_3_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~
--
   In file included from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/nios2/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/nios2/kernel/asm-offsets.c:9:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~
   In file included from include/linux/gfp.h:8,
                    from include/linux/sched/mm.h:9,
                    from kernel/sched/sched.h:15,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/topology.h:44:30: warning: 'struct cpuinfo_x86' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^~~~~~~~~~~


vim +44 include/linux/topology.h

    42	
    43	int arch_update_cpu_topology(void);
  > 44	void srat_detect_node(struct cpuinfo_x86 *c);
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
