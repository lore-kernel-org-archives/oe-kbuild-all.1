Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D9212549
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577241; cv=none; b=X8AeeyIV8Lq/HrjoQLcYxPbAvWHvLvDQlZzzzM5WH2srdF7IYqko45ZnjUTSmLR4pW6Qf4kafJ+oBYueRIAUEHRTZsNujSEErTuebzC0sfIgFF01fGKjs1upODRlkzXqAp7I2hISvJxww/zgo13xZi42UrPBVlaDzf5/nCUV8ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577241; c=relaxed/simple;
	bh=CXq6GtLbjn8c5LJkxGkORHPDHNZhBgO7gL/6HljyOyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D019s6IKIL32DUGItot/6iwTvuCPqgiIJK/+73K9GNJnow6r2td/fCtraXDQqvA1AULlfW/E71Pmm6Voznvq4OWNQ6/7iLfHGI4XOgrRpzIHpclO8x/CzsVRa8UPLl5R09HZbc4Wsw3TUSo0SHrfMnNBnkEo1EjPYY/El1CskWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enrfuRVw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enrfuRVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768577227; x=1800113227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CXq6GtLbjn8c5LJkxGkORHPDHNZhBgO7gL/6HljyOyM=;
  b=enrfuRVwC6IGF2k+FJfCFEmN7u0pfw2QN61w+2WTwsWVBrfDtFm2hD66
   7om5oWsYYjhRwAgbrprgNIL/sM7POZVsKrJlmCNhWa8vXu3jYqfZigI18
   v53wyAYZSdHlwFtMM7rDpikCDsUHszqCgMBlFqCp+5FOuS55lCQ4XzWki
   XH6NAK2Zslu/25f8Axr071720Di+4H92mV7R+bp9UsVWLrcKi7IlHlVV9
   Ie2Yq7To3hUn7YZiNyr1SDcVfti5KUCItef0j3eNYy/JmWDmqt46yTrGM
   KKDR5sVMoEB8qK684D/vOXZzPpE3pE1LvMd6FI5R6RMjDNfT5/TX+0P6o
   g==;
X-CSE-ConnectionGUID: vzVB9kKWT3quwjTIlc8b7A==
X-CSE-MsgGUID: 1jya6nYCSgK/VvTpPX36AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69625173"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69625173"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 07:27:06 -0800
X-CSE-ConnectionGUID: k+xCROj/T9ifYT6NN6bLBw==
X-CSE-MsgGUID: oqeqIRvQTSi6EOgjGVbNzA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jan 2026 07:27:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vglj4-00000000KyO-2AVJ;
	Fri, 16 Jan 2026 15:27:02 +0000
Date: Fri, 16 Jan 2026 23:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202601162329.SmQ34jS8-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/MIPS-copy-pic32-h-header-file-from-asm-mach-pic32-to-include-platform-data/20260110-005057
base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
patch link:    https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-13-99859c55783d%40redhat.com
patch subject: [PATCH 13/13] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260116/202601162329.SmQ34jS8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162329.SmQ34jS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601162329.SmQ34jS8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/traps.h:8,
                    from drivers/clk/microchip/clk-core.c:13:
   arch/x86/include/asm/debugreg.h: In function 'get_debugctlmsr':
>> arch/x86/include/asm/debugreg.h:180:26: error: 'struct cpuinfo_um' has no member named 'x86'
     180 |         if (boot_cpu_data.x86 < 6)
         |                          ^
   arch/x86/include/asm/debugreg.h: In function 'update_debugctlmsr':
   arch/x86/include/asm/debugreg.h:191:26: error: 'struct cpuinfo_um' has no member named 'x86'
     191 |         if (boot_cpu_data.x86 < 6)
         |                          ^
   In file included from arch/x86/include/asm/entry-common.h:8,
                    from include/linux/irq-entry-common.h:13,
                    from include/linux/entry-common.h:5,
                    from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/include/asm/traps.h:9:
   arch/x86/include/asm/nospec-branch.h: In function 'x86_clear_cpu_buffers':
   arch/x86/include/asm/nospec-branch.h:598:31: error: '__KERNEL_DS' undeclared (first use in this function)
     598 |         static const u16 ds = __KERNEL_DS;
         |                               ^~~~~~~~~~~
   arch/x86/include/asm/nospec-branch.h:598:31: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/x86/include/asm/entry-common.h:9:
   arch/x86/include/asm/io_bitmap.h: At top level:
>> arch/x86/include/asm/io_bitmap.h:13:32: error: 'IO_BITMAP_LONGS' undeclared here (not in a function); did you mean 'IDA_BITMAP_LONGS'?
      13 |         unsigned long   bitmap[IO_BITMAP_LONGS];
         |                                ^~~~~~~~~~~~~~~
         |                                IDA_BITMAP_LONGS
   arch/x86/include/asm/entry-common.h: In function 'arch_enter_from_user_mode':
>> arch/x86/include/asm/entry-common.h:22:39: error: implicit declaration of function 'native_save_fl' [-Wimplicit-function-declaration]
      22 |                 unsigned long flags = native_save_fl();
         |                                       ^~~~~~~~~~~~~~
>> arch/x86/include/asm/entry-common.h:23:38: error: 'X86_EFLAGS_DF' undeclared (first use in this function); did you mean 'X86_TRAP_DF'?
      23 |                 unsigned long mask = X86_EFLAGS_DF | X86_EFLAGS_NT;
         |                                      ^~~~~~~~~~~~~
         |                                      X86_TRAP_DF
>> arch/x86/include/asm/entry-common.h:23:54: error: 'X86_EFLAGS_NT' undeclared (first use in this function)
      23 |                 unsigned long mask = X86_EFLAGS_DF | X86_EFLAGS_NT;
         |                                                      ^~~~~~~~~~~~~
   In file included from arch/x86/include/asm/qspinlock.h:6,
                    from arch/x86/um/asm/spinlock.h:5,
                    from include/linux/spinlock.h:95,
                    from include/linux/sched.h:37,
                    from include/linux/percpu.h:12,
                    from include/linux/radix-tree.h:16,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from include/linux/clk-provider.h:9,
                    from drivers/clk/microchip/clk-core.c:6:
>> arch/um/include/asm/cpufeature.h:52:39: error: implicit declaration of function 'DISABLED_MASK_BIT_SET' [-Wimplicit-function-declaration]
      52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/entry-common.h:28:21: note: in expansion of macro 'cpu_feature_enabled'
      28 |                 if (cpu_feature_enabled(X86_FEATURE_SMAP) ||
         |                     ^~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/entry-common.h:30:33: error: 'X86_EFLAGS_AC' undeclared (first use in this function); did you mean 'X86_TRAP_AC'?
      30 |                         mask |= X86_EFLAGS_AC;
         |                                 ^~~~~~~~~~~~~
         |                                 X86_TRAP_AC
   In file included from include/asm-generic/bug.h:7,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/um/asm/barrier.h:6,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/of.h:15:
>> arch/x86/include/asm/entry-common.h:42:31: error: implicit declaration of function 'on_thread_stack'; did you mean 'setup_thread_stack'? [-Wimplicit-function-declaration]
      42 |                 WARN_ON_ONCE(!on_thread_stack());
         |                               ^~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   arch/x86/include/asm/entry-common.h:42:17: note: in expansion of macro 'WARN_ON_ONCE'
      42 |                 WARN_ON_ONCE(!on_thread_stack());
         |                 ^~~~~~~~~~~~
   arch/x86/include/asm/entry-common.h: In function 'arch_exit_work':
>> arch/x86/include/asm/entry-common.h:50:23: error: '_TIF_USER_RETURN_NOTIFY' undeclared (first use in this function)
      50 |         if (ti_work & _TIF_USER_RETURN_NOTIFY)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/bitops.h:6:
>> arch/x86/include/asm/entry-common.h:53:32: error: '_TIF_IO_BITMAP' undeclared (first use in this function)
      53 |         if (unlikely(ti_work & _TIF_IO_BITMAP))
         |                                ^~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> arch/x86/include/asm/entry-common.h:56:32: error: '_TIF_NEED_FPU_LOAD' undeclared (first use in this function)
      56 |         if (unlikely(ti_work & _TIF_NEED_FPU_LOAD))
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> arch/x86/include/asm/entry-common.h:57:17: error: implicit declaration of function 'switch_fpu_return' [-Wimplicit-function-declaration]
      57 |                 switch_fpu_return();
         |                 ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/entry-common.h: In function 'arch_exit_to_user_mode_prepare':
>> arch/x86/include/asm/entry-common.h:63:9: error: implicit declaration of function 'fpregs_assert_state_consistent' [-Wimplicit-function-declaration]
      63 |         fpregs_assert_state_consistent();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/entry-common.h: In function 'arch_exit_to_user_mode':
>> arch/x86/include/asm/entry-common.h:108:9: error: implicit declaration of function 'amd_clear_divider'; did you mean 'to_clk_divider'? [-Wimplicit-function-declaration]
     108 |         amd_clear_divider();
         |         ^~~~~~~~~~~~~~~~~
         |         to_clk_divider
   include/linux/irq-entry-common.h: In function '__exit_to_user_mode_prepare':
>> include/linux/irq-entry-common.h:31:49: error: '_TIF_UPROBE' undeclared (first use in this function)
      31 |         (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_UPROBE |           \
         |                                                 ^~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/irq-entry-common.h:225:32: note: in expansion of macro 'EXIT_TO_USER_MODE_WORK'
     225 |         if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h: At top level:
>> include/linux/entry-common.h:48:6: error: conflicting types for 'syscall_trace_enter'; have 'long int(struct pt_regs *, long int,  long unsigned int)'
      48 | long syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long work);
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/ptrace.h:19,
                    from arch/um/include/asm/processor-generic.h:13,
                    from arch/x86/um/asm/processor.h:41,
                    from include/linux/mutex.h:19,
                    from include/linux/kernfs.h:11:
   arch/um/include/asm/ptrace-generic.h:44:12: note: previous declaration of 'syscall_trace_enter' with type 'int(struct pt_regs *)'
      44 | extern int syscall_trace_enter(struct pt_regs *regs);
         |            ^~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/entry-common.h: In function 'syscall_enter_from_user_mode_work':
>> include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
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
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
>> include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
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
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
>> include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
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
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
>> include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
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
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
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
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:598:27: note: in definition of macro '__unqual_scalar_typeof'
     598 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382:
   include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:33:34: error: 'SYSCALL_WORK_SECCOMP' undeclared (first use in this function); did you mean 'SYSCALL_WORK_EXIT'?
      33 | #define SYSCALL_WORK_ENTER      (SYSCALL_WORK_SECCOMP |                 \
         |                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:34:34: error: 'SYSCALL_WORK_SYSCALL_TRACEPOINT' undeclared (first use in this function)
      34 |                                  SYSCALL_WORK_SYSCALL_TRACEPOINT |      \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:35:34: error: 'SYSCALL_WORK_SYSCALL_TRACE' undeclared (first use in this function)
      35 |                                  SYSCALL_WORK_SYSCALL_TRACE |           \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:36:34: error: 'SYSCALL_WORK_SYSCALL_EMU' undeclared (first use in this function)
      36 |                                  SYSCALL_WORK_SYSCALL_EMU |             \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:37:34: error: 'SYSCALL_WORK_SYSCALL_AUDIT' undeclared (first use in this function)
      37 |                                  SYSCALL_WORK_SYSCALL_AUDIT |           \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:38:34: error: 'SYSCALL_WORK_SYSCALL_USER_DISPATCH' undeclared (first use in this function)
      38 |                                  SYSCALL_WORK_SYSCALL_USER_DISPATCH |   \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h: In function 'syscall_exit_to_user_mode_work':
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);


vim +180 arch/x86/include/asm/debugreg.h

42181186ad4db9 Steven Rostedt  2011-12-16  174  
154fcf3a788868 Thomas Gleixner 2024-03-04  175  static inline unsigned long get_debugctlmsr(void)
154fcf3a788868 Thomas Gleixner 2024-03-04  176  {
154fcf3a788868 Thomas Gleixner 2024-03-04  177  	unsigned long debugctlmsr = 0;
154fcf3a788868 Thomas Gleixner 2024-03-04  178  
154fcf3a788868 Thomas Gleixner 2024-03-04  179  #ifndef CONFIG_X86_DEBUGCTLMSR
154fcf3a788868 Thomas Gleixner 2024-03-04 @180  	if (boot_cpu_data.x86 < 6)
154fcf3a788868 Thomas Gleixner 2024-03-04  181  		return 0;
154fcf3a788868 Thomas Gleixner 2024-03-04  182  #endif
c435e608cf59ff Ingo Molnar     2025-04-09  183  	rdmsrq(MSR_IA32_DEBUGCTLMSR, debugctlmsr);
154fcf3a788868 Thomas Gleixner 2024-03-04  184  
154fcf3a788868 Thomas Gleixner 2024-03-04  185  	return debugctlmsr;
154fcf3a788868 Thomas Gleixner 2024-03-04  186  }
154fcf3a788868 Thomas Gleixner 2024-03-04  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
