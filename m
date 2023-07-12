Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1EE369
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 00:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689121950; x=1720657950;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2Ln7mAzQtTqNFLLzPkZ3EZI6fHO1cNDYBPGHi9/mOnI=;
  b=eXAWv7faIuyWLBjya0fjwqR/sOHyU/6TMTZu3yaWXMs1i056+aiXQCaQ
   5L0dQ9BkSBiNzwPGdkv74190fTKi1D25NRaS4wyMpth8yPXBgxl88jcAk
   cJuqUa+b3xUUOQfrwSudNhAuRJnxt98SDa8EXGxh1Byzu1gfqzVk1hHNX
   cPZm5HyHicHgj8KdVFSrYhHsrACMtdsZ2iW0Oly5kev3oZiSC1k9UD4LX
   n/lIgwUAtty6v6DOAUvmn0XNvn2GauDsDD5Os0H1S19Yi2DyOphP5AgqL
   N22UTSXr5rhHrz4QILIKdZOqyJPnSJIA1sCWO/jBS1hrGOHwLCqb4X+BQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="430896914"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="430896914"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 17:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="895387985"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="895387985"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Jul 2023 17:32:28 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJNmN-0005Dp-1v;
	Wed, 12 Jul 2023 00:32:27 +0000
Date: Wed, 12 Jul 2023 08:32:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:5.15/dovetail-xenomai 1/3]
 arch/arm/include/asm/module.h:48:59: error: unknown type name 'Elf32_Addr';
 did you mean 'Elf_Addr'?
Message-ID: <202307120842.fS2dCbdl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hao,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ef1fa9c790e4ab135c9beb006af1de69d2d48cd1
commit: 6002ecb4be45efad2cf795c15f5292643f98fc3f [1/3] Merge tag 'v5.15.85-dovetail1' into 5.15/dovetail-xenomai
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230712/202307120842.fS2dCbdl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120842.fS2dCbdl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120842.fS2dCbdl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/cdev.h:8,
                    from include/linux/clocksource.h:19,
                    from include/linux/clockchips.h:14,
                    from include/linux/tick.h:8,
                    from kernel/irq/irqptorture.c:11:
>> include/vdso/datapage.h:127:38: error: field 'mmio' has incomplete type
     127 |         struct clksrc_user_mmio_info mmio;
         |                                      ^~~~
>> include/vdso/datapage.h:132:40: error: 'CLOCKSOURCE_VDSO_MMIO' undeclared here (not in a function)
     132 |         struct clksrc_info clksrc_info[CLOCKSOURCE_VDSO_MMIO + CLKSRC_USER_MMIO_MAX];
         |                                        ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/datapage.h:132:64: error: 'CLKSRC_USER_MMIO_MAX' undeclared here (not in a function)
     132 |         struct clksrc_info clksrc_info[CLOCKSOURCE_VDSO_MMIO + CLKSRC_USER_MMIO_MAX];
         |                                                                ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:33,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/cdev.h:8,
                    from include/linux/clocksource.h:19,
                    from include/vdso/datapage.h:119,
                    from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from drivers/net/wireless/ath/ath11k/qmi.c:6:
>> arch/arm/include/asm/module.h:48:59: error: unknown type name 'Elf32_Addr'; did you mean 'Elf_Addr'?
      48 | u32 get_module_plt(struct module *mod, unsigned long loc, Elf32_Addr val);
         |                                                           ^~~~~~~~~~
         |                                                           Elf_Addr
   In file included from arch/arm/include/asm/module.h:5:
>> include/asm-generic/module.h:35:25: error: unknown type name 'Elf32_Sym'
      35 | #define Elf_Sym         Elf32_Sym
         |                         ^~~~~~~~~
   include/linux/module.h:349:9: note: in expansion of macro 'Elf_Sym'
     349 |         Elf_Sym *symtab;
         |         ^~~~~~~
>> include/asm-generic/module.h:35:25: error: unknown type name 'Elf32_Sym'
      35 | #define Elf_Sym         Elf32_Sym
         |                         ^~~~~~~~~
   include/linux/module.h:547:57: note: in expansion of macro 'Elf_Sym'
     547 | static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
         |                                                         ^~~~~~~
   include/linux/module.h: In function 'kallsyms_symbol_value':
>> include/linux/module.h:549:19: error: request for member 'st_value' in something not a structure or union
     549 |         return sym->st_value;
         |                   ^~
   include/linux/module.h: At top level:
>> include/asm-generic/module.h:37:25: error: unknown type name 'Elf32_Ehdr'
      37 | #define Elf_Ehdr        Elf32_Ehdr
         |                         ^~~~~~~~~~
   include/linux/module.h:835:32: note: in expansion of macro 'Elf_Ehdr'
     835 | void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
         |                                ^~~~~~~~
>> include/asm-generic/module.h:33:25: error: unknown type name 'Elf32_Shdr'
      33 | #define Elf_Shdr        Elf32_Shdr
         |                         ^~~~~~~~~~
   include/linux/module.h:835:50: note: in expansion of macro 'Elf_Shdr'
     835 | void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
         |                                                  ^~~~~~~~
--
   In file included from include/vdso/datapage.h:119,
                    from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/cdev.h:8,
                    from drivers/rpmsg/rpmsg_char.c:12:
>> include/linux/clocksource.h:159:21: error: field 'cdev' has incomplete type
     159 |         struct cdev cdev;
         |                     ^~~~
--
   In file included from include/linux/module.h:33,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/cdev.h:8,
                    from include/linux/clocksource.h:19,
                    from include/vdso/datapage.h:119,
                    from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from arch/arm/kernel/ptrace.c:13:
>> arch/arm/include/asm/module.h:48:59: error: unknown type name 'Elf32_Addr'; did you mean 'Elf_Addr'?
      48 | u32 get_module_plt(struct module *mod, unsigned long loc, Elf32_Addr val);
         |                                                           ^~~~~~~~~~
         |                                                           Elf_Addr
   In file included from arch/arm/include/asm/module.h:5:
>> include/asm-generic/module.h:35:25: error: unknown type name 'Elf32_Sym'
      35 | #define Elf_Sym         Elf32_Sym
         |                         ^~~~~~~~~
   include/linux/module.h:349:9: note: in expansion of macro 'Elf_Sym'
     349 |         Elf_Sym *symtab;
         |         ^~~~~~~
>> include/asm-generic/module.h:35:25: error: unknown type name 'Elf32_Sym'
      35 | #define Elf_Sym         Elf32_Sym
         |                         ^~~~~~~~~
   include/linux/module.h:547:57: note: in expansion of macro 'Elf_Sym'
     547 | static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
         |                                                         ^~~~~~~
   include/linux/module.h: In function 'kallsyms_symbol_value':
>> include/linux/module.h:549:19: error: request for member 'st_value' in something not a structure or union
     549 |         return sym->st_value;
         |                   ^~
   include/linux/module.h: At top level:
>> include/asm-generic/module.h:37:25: error: unknown type name 'Elf32_Ehdr'
      37 | #define Elf_Ehdr        Elf32_Ehdr
         |                         ^~~~~~~~~~
   include/linux/module.h:835:32: note: in expansion of macro 'Elf_Ehdr'
     835 | void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
         |                                ^~~~~~~~
>> include/asm-generic/module.h:33:25: error: unknown type name 'Elf32_Shdr'
      33 | #define Elf_Shdr        Elf32_Shdr
         |                         ^~~~~~~~~~
   include/linux/module.h:835:50: note: in expansion of macro 'Elf_Shdr'
     835 | void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
         |                                                  ^~~~~~~~
   arch/arm/kernel/ptrace.c:856:16: warning: no previous prototype for 'syscall_trace_enter' [-Wmissing-prototypes]
     856 | asmlinkage int syscall_trace_enter(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/ptrace.c:884:17: warning: no previous prototype for 'syscall_trace_exit' [-Wmissing-prototypes]
     884 | asmlinkage void syscall_trace_exit(struct pt_regs *regs)
         |                 ^~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/cdev.h:8,
                    from include/linux/clocksource.h:19,
                    from include/linux/clockchips.h:14,
                    from arch/arm/kernel/time.c:11:
>> include/vdso/datapage.h:127:38: error: field 'mmio' has incomplete type
     127 |         struct clksrc_user_mmio_info mmio;
         |                                      ^~~~
>> include/vdso/datapage.h:132:40: error: 'CLOCKSOURCE_VDSO_MMIO' undeclared here (not in a function)
     132 |         struct clksrc_info clksrc_info[CLOCKSOURCE_VDSO_MMIO + CLKSRC_USER_MMIO_MAX];
         |                                        ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/datapage.h:132:64: error: 'CLKSRC_USER_MMIO_MAX' undeclared here (not in a function)
     132 |         struct clksrc_info clksrc_info[CLOCKSOURCE_VDSO_MMIO + CLKSRC_USER_MMIO_MAX];
         |                                                                ^~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/time.c:88:13: warning: no previous prototype for 'time_init' [-Wmissing-prototypes]
      88 | void __init time_init(void)
         |             ^~~~~~~~~
--
   In file included from include/linux/module.h:33,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/cdev.h:8,
                    from include/linux/clocksource.h:19,
                    from include/vdso/datapage.h:119,
                    from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from arch/arm/kernel/module-plts.c:6:
>> arch/arm/include/asm/module.h:48:59: error: unknown type name 'Elf32_Addr'; did you mean 'Elf_Addr'?
      48 | u32 get_module_plt(struct module *mod, unsigned long loc, Elf32_Addr val);
         |                                                           ^~~~~~~~~~
         |                                                           Elf_Addr
   In file included from arch/arm/include/asm/module.h:5:
>> include/asm-generic/module.h:35:25: error: unknown type name 'Elf32_Sym'
      35 | #define Elf_Sym         Elf32_Sym
         |                         ^~~~~~~~~
   include/linux/module.h:349:9: note: in expansion of macro 'Elf_Sym'
     349 |         Elf_Sym *symtab;
         |         ^~~~~~~
>> include/asm-generic/module.h:35:25: error: unknown type name 'Elf32_Sym'
      35 | #define Elf_Sym         Elf32_Sym
         |                         ^~~~~~~~~
   include/linux/module.h:547:57: note: in expansion of macro 'Elf_Sym'
     547 | static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
         |                                                         ^~~~~~~
   include/linux/module.h: In function 'kallsyms_symbol_value':
>> include/linux/module.h:549:19: error: request for member 'st_value' in something not a structure or union
     549 |         return sym->st_value;
         |                   ^~
   include/linux/module.h: At top level:
>> include/asm-generic/module.h:37:25: error: unknown type name 'Elf32_Ehdr'
      37 | #define Elf_Ehdr        Elf32_Ehdr
         |                         ^~~~~~~~~~
   include/linux/module.h:835:32: note: in expansion of macro 'Elf_Ehdr'
     835 | void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
         |                                ^~~~~~~~
>> include/asm-generic/module.h:33:25: error: unknown type name 'Elf32_Shdr'
      33 | #define Elf_Shdr        Elf32_Shdr
         |                         ^~~~~~~~~~
   include/linux/module.h:835:50: note: in expansion of macro 'Elf_Shdr'
     835 | void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
         |                                                  ^~~~~~~~
   arch/arm/kernel/module-plts.c:51:5: warning: no previous prototype for 'get_module_plt' [-Wmissing-prototypes]
      51 | u32 get_module_plt(struct module *mod, unsigned long loc, Elf32_Addr val)
         |     ^~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:33,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/cdev.h:8,
                    from include/linux/clocksource.h:19,
                    from include/vdso/datapage.h:119,
                    from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/elfcore.h:13,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from arch/arm/kernel/machine_kexec.c:7:
>> arch/arm/include/asm/module.h:48:59: error: unknown type name 'Elf32_Addr'; did you mean 'Elf_Addr'?
      48 | u32 get_module_plt(struct module *mod, unsigned long loc, Elf32_Addr val);
         |                                                           ^~~~~~~~~~
         |                                                           Elf_Addr
   In file included from arch/arm/include/asm/module.h:5:
>> include/asm-generic/module.h:35:25: error: unknown type name 'Elf32_Sym'
      35 | #define Elf_Sym         Elf32_Sym
         |                         ^~~~~~~~~
   include/linux/module.h:349:9: note: in expansion of macro 'Elf_Sym'
     349 |         Elf_Sym *symtab;
         |         ^~~~~~~
>> include/asm-generic/module.h:35:25: error: unknown type name 'Elf32_Sym'
      35 | #define Elf_Sym         Elf32_Sym
         |                         ^~~~~~~~~
   include/linux/module.h:547:57: note: in expansion of macro 'Elf_Sym'
     547 | static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
         |                                                         ^~~~~~~
   include/linux/module.h: In function 'kallsyms_symbol_value':
>> include/linux/module.h:549:19: error: request for member 'st_value' in something not a structure or union
     549 |         return sym->st_value;
         |                   ^~
   include/linux/module.h: At top level:
>> include/asm-generic/module.h:37:25: error: unknown type name 'Elf32_Ehdr'
      37 | #define Elf_Ehdr        Elf32_Ehdr
         |                         ^~~~~~~~~~
   include/linux/module.h:835:32: note: in expansion of macro 'Elf_Ehdr'
     835 | void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
         |                                ^~~~~~~~
>> include/asm-generic/module.h:33:25: error: unknown type name 'Elf32_Shdr'
      33 | #define Elf_Shdr        Elf32_Shdr
         |                         ^~~~~~~~~~
   include/linux/module.h:835:50: note: in expansion of macro 'Elf_Shdr'
     835 | void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
         |                                                  ^~~~~~~~
   arch/arm/kernel/machine_kexec.c:76:6: warning: no previous prototype for 'machine_crash_nonpanic_core' [-Wmissing-prototypes]
      76 | void machine_crash_nonpanic_core(void *unused)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/cdev.h:8,
                    from include/linux/clocksource.h:19,
                    from arch/arm/mach-mvebu/board-v7.c:20:
>> include/vdso/datapage.h:127:38: error: field 'mmio' has incomplete type
     127 |         struct clksrc_user_mmio_info mmio;
         |                                      ^~~~
>> include/vdso/datapage.h:132:40: error: 'CLOCKSOURCE_VDSO_MMIO' undeclared here (not in a function)
     132 |         struct clksrc_info clksrc_info[CLOCKSOURCE_VDSO_MMIO + CLKSRC_USER_MMIO_MAX];
         |                                        ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/datapage.h:132:64: error: 'CLKSRC_USER_MMIO_MAX' undeclared here (not in a function)
     132 |         struct clksrc_info clksrc_info[CLOCKSOURCE_VDSO_MMIO + CLKSRC_USER_MMIO_MAX];
         |                                                                ^~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-mvebu/board-v7.c: In function 'mvebu_scan_mem':
   arch/arm/mach-mvebu/board-v7.c:87:27: warning: variable 'size' set but not used [-Wunused-but-set-variable]
      87 |                 u64 base, size;
         |                           ^~~~
--
   In file included from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/cdev.h:8,
                    from include/linux/clocksource.h:19,
                    from include/linux/timekeeper_internal.h:10,
                    from kernel/dovetail.c:6:
>> include/vdso/datapage.h:127:38: error: field 'mmio' has incomplete type
     127 |         struct clksrc_user_mmio_info mmio;
         |                                      ^~~~
>> include/vdso/datapage.h:132:40: error: 'CLOCKSOURCE_VDSO_MMIO' undeclared here (not in a function)
     132 |         struct clksrc_info clksrc_info[CLOCKSOURCE_VDSO_MMIO + CLKSRC_USER_MMIO_MAX];
         |                                        ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/datapage.h:132:64: error: 'CLKSRC_USER_MMIO_MAX' undeclared here (not in a function)
     132 |         struct clksrc_info clksrc_info[CLOCKSOURCE_VDSO_MMIO + CLKSRC_USER_MMIO_MAX];
         |                                                                ^~~~~~~~~~~~~~~~~~~~
   kernel/dovetail.c:68:12: warning: no previous prototype for 'handle_oob_syscall' [-Wmissing-prototypes]
      68 | int __weak handle_oob_syscall(struct pt_regs *regs)
         |            ^~~~~~~~~~~~~~~~~~
   kernel/dovetail.c:73:12: warning: no previous prototype for 'handle_pipelined_syscall' [-Wmissing-prototypes]
      73 | int __weak handle_pipelined_syscall(struct irq_stage *stage,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dovetail.c:79:13: warning: no previous prototype for 'handle_oob_mayday' [-Wmissing-prototypes]
      79 | void __weak handle_oob_mayday(struct pt_regs *regs)
         |             ^~~~~~~~~~~~~~~~~
   kernel/dovetail.c:107:5: warning: no previous prototype for '__pipeline_syscall' [-Wmissing-prototypes]
     107 | int __pipeline_syscall(struct pt_regs *regs)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/dovetail.c:256:13: warning: no previous prototype for 'handle_oob_trap_entry' [-Wmissing-prototypes]
     256 | void __weak handle_oob_trap_entry(unsigned int trapnr, struct pt_regs *regs)
         |             ^~~~~~~~~~~~~~~~~~~~~
   kernel/dovetail.c:281:13: warning: no previous prototype for 'handle_oob_trap_exit' [-Wmissing-prototypes]
     281 | void __weak handle_oob_trap_exit(unsigned int trapnr, struct pt_regs *regs)
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/dovetail.c:300:13: warning: no previous prototype for 'handle_inband_event' [-Wmissing-prototypes]
     300 | void __weak handle_inband_event(enum inband_event_type event, void *data)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/dovetail.c:312:13: warning: no previous prototype for 'resume_oob_task' [-Wmissing-prototypes]
     312 | void __weak resume_oob_task(struct task_struct *p)
         |             ^~~~~~~~~~~~~~~
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86 && X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [m]:
   - DWMAC_INTEL_PLAT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=m] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=m]


vim +48 arch/arm/include/asm/module.h

7d485f647c1f4a Ard Biesheuvel  2014-11-24  46  
4d58e7034d1971 Arnd Bergmann   2018-07-06  47  struct module;
7d485f647c1f4a Ard Biesheuvel  2014-11-24 @48  u32 get_module_plt(struct module *mod, unsigned long loc, Elf32_Addr val);
2e1926e7b5d39e Catalin Marinas 2009-02-11  49  

:::::: The code at line 48 was first introduced by commit
:::::: 7d485f647c1f4a6976264c90447fb0dbf07b111d ARM: 8220/1: allow modules outside of bl range

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
