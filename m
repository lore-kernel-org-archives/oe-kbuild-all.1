Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE57F26B2DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554897; cv=none; b=pxCLNt6Radh9AwbM0CFYTZVy5jpI9wNDyJV43Wp1AduOo1RJZx7awBxr/ip4apYRtfj9rtuaV17xgfBSCUFpSVlxl424kzpGgl1J1LjJ0jCFbWrq2aJTP91F/a79gKBrhhYb7N+xIiWquaOih4kRboPR4BbUMLy5ogpB4xov1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554897; c=relaxed/simple;
	bh=gYV2E/9ZnZZCj9S7osAxN0UySYTQsaJkLN68aCKzq4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY89AeHLYf1NjzzwlVqrbX0QnWdeKksBVayd08xCyLzU8bsrH2xyWrePq6FvREPd9VFa8pad4eft2+BGhsETgn+ZDLKDXLehxX/Pow5ACClmApr2L3WwmkSPlsTOrffg9A4nWXGm80fu+if7mmR+OQUMb/YhilZjon8DA8IYTeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jloXDRQd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jloXDRQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768554895; x=1800090895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gYV2E/9ZnZZCj9S7osAxN0UySYTQsaJkLN68aCKzq4c=;
  b=jloXDRQdBWji/IY9ADkEHRTNlnmolNExNh7t6eAlkyaDnlceIaar0pOA
   r6uwENL4ANQKazmtk1rycutJua4pl5BoAmIiPxeyAIk2lO0PzTEcsqYrA
   j7MHPb2e1FmZLXQNCb/IBvfJrp0TOqCL89fTv6VCGz7QUpWYyFJ2MxQPU
   qUDZSIGQKWiz/Hy7Ex9D4w0w0+uOrLbW9oMF9WuYqCQvDLR/8k9xuV1KX
   8K1y5iM1eP27exmjC41WtMsGGPJa/EhvzvAQlrahCiYuCQoJJ3PauRL2k
   mBrXqgO9TupmHlew+xyyn3rO877xTurGa4mIXKAuk0OxAlxo/7F5McT2r
   Q==;
X-CSE-ConnectionGUID: iNq9abPFQJCPKSRKw6F0ng==
X-CSE-MsgGUID: G/gGhifYTQ+HmkNlaZOw7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73498039"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="73498039"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 01:14:51 -0800
X-CSE-ConnectionGUID: ldqjb39gTZmRNkNNEoDY3Q==
X-CSE-MsgGUID: 6fcqqb21RXG7MsJhw/tspw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204991903"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jan 2026 01:14:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgfup-00000000Kds-15Bi;
	Fri, 16 Jan 2026 09:14:47 +0000
Date: Fri, 16 Jan 2026 17:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202601161611.2PFhRacc-lkp@intel.com>
References: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>

Hi Brian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/MIPS-copy-pic32-h-header-file-from-asm-mach-pic32-to-include-platform-data/20260110-005057
base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
patch link:    https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-13-99859c55783d%40redhat.com
patch subject: [PATCH 13/13] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260116/202601161611.2PFhRacc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161611.2PFhRacc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161611.2PFhRacc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler_types.h:667:9: note: in expansion of macro '_compiletime_assert'
     667 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:647:23: note: in definition of macro '__compiletime_assert'
     647 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:667:9: note: in expansion of macro '_compiletime_assert'
     667 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:598:27: note: in definition of macro '__unqual_scalar_typeof'
     598 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:41:34: error: 'SYSCALL_WORK_SYSCALL_TRACEPOINT' undeclared (first use in this function)
      41 | #define SYSCALL_WORK_EXIT       (SYSCALL_WORK_SYSCALL_TRACEPOINT |      \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:42:34: error: 'SYSCALL_WORK_SYSCALL_TRACE' undeclared (first use in this function)
      42 |                                  SYSCALL_WORK_SYSCALL_TRACE |           \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:43:34: error: 'SYSCALL_WORK_SYSCALL_AUDIT' undeclared (first use in this function)
      43 |                                  SYSCALL_WORK_SYSCALL_AUDIT |           \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:44:34: error: 'SYSCALL_WORK_SYSCALL_USER_DISPATCH' undeclared (first use in this function)
      44 |                                  SYSCALL_WORK_SYSCALL_USER_DISPATCH |   \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:45:34: error: 'SYSCALL_WORK_SYSCALL_EXIT_TRAP' undeclared (first use in this function)
      45 |                                  SYSCALL_WORK_SYSCALL_EXIT_TRAP |       \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/entry-common.h:156:29: note: in expansion of macro 'SYSCALL_WORK_EXIT'
     156 |         if (unlikely(work & SYSCALL_WORK_EXIT))
         |                             ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/traps.h: At top level:
>> arch/x86/include/asm/traps.h:38:26: warning: 'struct math_emu_info' declared inside parameter list will not be visible outside of this definition or declaration
      38 | void math_emulate(struct math_emu_info *);
         |                          ^~~~~~~~~~~~~
>> arch/x86/include/asm/traps.h:45:46: warning: 'struct stack_info' declared inside parameter list will not be visible outside of this definition or declaration
      45 |                                       struct stack_info *info);
         |                                              ^~~~~~~~~~
   arch/x86/include/asm/traps.h: In function 'cond_local_irq_enable':
   arch/x86/include/asm/traps.h:50:17: error: 'struct pt_regs' has no member named 'flags'
      50 |         if (regs->flags & X86_EFLAGS_IF)
         |                 ^~
   arch/x86/include/asm/traps.h:50:27: error: 'X86_EFLAGS_IF' undeclared (first use in this function)
      50 |         if (regs->flags & X86_EFLAGS_IF)
         |                           ^~~~~~~~~~~~~
   arch/x86/include/asm/traps.h: In function 'cond_local_irq_disable':
   arch/x86/include/asm/traps.h:56:17: error: 'struct pt_regs' has no member named 'flags'
      56 |         if (regs->flags & X86_EFLAGS_IF)
         |                 ^~
   arch/x86/include/asm/traps.h:56:27: error: 'X86_EFLAGS_IF' undeclared (first use in this function)
      56 |         if (regs->flags & X86_EFLAGS_IF)
         |                           ^~~~~~~~~~~~~
   drivers/clk/microchip/clk-core.c: At top level:
   drivers/clk/microchip/clk-core.c:923:27: warning: initialized field overwritten [-Woverride-init]
     923 |         .determine_rate = __clk_mux_determine_rate,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/microchip/clk-core.c:923:27: note: (near initialization for 'pic32_sclk_ops.determine_rate')


vim +38 arch/x86/include/asm/traps.h

da654b74bda14c include/asm-x86/traps.h      Srinivasa Ds    2008-09-23  37  
d315760ffa261c arch/x86/include/asm/traps.h Tejun Heo       2009-02-09 @38  void math_emulate(struct math_emu_info *);
6ac8d51f01d345 include/asm-x86/traps.h      Jaswinder Singh 2008-07-15  39  
300638101329e8 arch/x86/include/asm/traps.h Tony Luck       2020-10-06  40  bool fault_in_kernel_space(unsigned long address);
300638101329e8 arch/x86/include/asm/traps.h Tony Luck       2020-10-06  41  
6271cfdfc0e473 arch/x86/include/asm/traps.h Andy Lutomirski 2016-08-30  42  #ifdef CONFIG_VMAP_STACK
44b979fa302cab arch/x86/include/asm/traps.h Peter Zijlstra  2021-09-15  43  void __noreturn handle_stack_overflow(struct pt_regs *regs,
44b979fa302cab arch/x86/include/asm/traps.h Peter Zijlstra  2021-09-15  44  				      unsigned long fault_address,
44b979fa302cab arch/x86/include/asm/traps.h Peter Zijlstra  2021-09-15 @45  				      struct stack_info *info);
6271cfdfc0e473 arch/x86/include/asm/traps.h Andy Lutomirski 2016-08-30  46  #endif
6271cfdfc0e473 arch/x86/include/asm/traps.h Andy Lutomirski 2016-08-30  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
