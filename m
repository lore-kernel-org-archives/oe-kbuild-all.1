Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C941173E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695201651; x=1726737651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twJRWNYWnMIIIX1mRj+AWztTDGc+7AnM9GbZ+PRco+0=;
  b=f09sFjAgff0xHOhPO+NjGeqPOOcoDipMci2KSSzYOA5wGGvaYixp/94l
   Eezw75PZ31cLaAy8NiYgZUgmGojjZ7WBFBIL8PGOXdVqdrJPvSGtgAnXG
   4V9s2kztMi1tBdCP5DiKSdlr627CQdZ9xX3gSnqBnkvSzlJOnixhHjb/C
   EzJeqdzeN1kxa89Qz1Cb6e/50WFmBLvYbrdDPkXlxrbG3I8A/5Je3iurb
   Vl2wpJGRBPcZLDk9SxfgmxdDIi5ehr5DtGx2hRNAt479y234JV0GhZ+Ua
   kAV3bdMRXjw/TZNL0fnVIpojL4Bxp9d+ZWM76PTY1lsmeO79i+mqVoZ5q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446643869"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="446643869"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 02:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="740123092"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="740123092"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Sep 2023 02:20:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qitO1-0008Yu-1s;
	Wed, 20 Sep 2023 09:20:45 +0000
Date: Wed, 20 Sep 2023 17:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Yin Fengwei <fengwei.yin@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	syzbot+55cc72f8cc3a549119df@syzkaller.appspotmail.com
Subject: Re: [PATCH 2/2] mm: Abstract moving to the next PFN
Message-ID: <202309201731.Tr9SZYEz-lkp@intel.com>
References: <20230920035336.854212-2-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920035336.854212-2-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Abstract-moving-to-the-next-PFN/20230920-115500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230920035336.854212-2-willy%40infradead.org
patch subject: [PATCH 2/2] mm: Abstract moving to the next PFN
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230920/202309201731.Tr9SZYEz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201731.Tr9SZYEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201731.Tr9SZYEz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:29:0,
                    from include/linux/ring_buffer.h:5,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from init/main.c:21:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from arch/x86/um/ptrace_32.c:6:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   arch/x86/um/ptrace_32.c: At top level:
   arch/x86/um/ptrace_32.c:15:6: warning: no previous declaration for 'arch_switch_to' [-Wmissing-declarations]
    void arch_switch_to(struct task_struct *to)
         ^~~~~~~~~~~~~~
   arch/x86/um/ptrace_32.c:28:5: warning: no previous declaration for 'is_syscall' [-Wmissing-declarations]
    int is_syscall(unsigned long addr)
        ^~~~~~~~~~
   arch/x86/um/ptrace_32.c:125:5: warning: no previous declaration for 'poke_user' [-Wmissing-declarations]
    int poke_user(struct task_struct *child, long addr, long data)
        ^~~~~~~~~
   arch/x86/um/ptrace_32.c:177:5: warning: no previous declaration for 'peek_user' [-Wmissing-declarations]
    int peek_user(struct task_struct *child, long addr, long data)
        ^~~~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/x86/um/signal.c:9:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   arch/x86/um/signal.c: At top level:
   arch/x86/um/signal.c:453:6: warning: no previous declaration for 'sys_sigreturn' [-Wmissing-declarations]
    long sys_sigreturn(void)
         ^~~~~~~~~~~~~
   arch/x86/um/signal.c:560:6: warning: no previous declaration for 'sys_rt_sigreturn' [-Wmissing-declarations]
    long sys_rt_sigreturn(void)
         ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from include/linux/ring_buffer.h:5,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from arch/x86/um/tls_32.c:8:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   arch/x86/um/tls_32.c: At top level:
   arch/x86/um/tls_32.c:23:5: warning: no previous declaration for 'do_set_thread_area' [-Wmissing-declarations]
    int do_set_thread_area(struct user_desc *info)
        ^~~~~~~~~~~~~~~~~~
   arch/x86/um/tls_32.c:39:5: warning: no previous declaration for 'do_get_thread_area' [-Wmissing-declarations]
    int do_get_thread_area(struct user_desc *info)
        ^~~~~~~~~~~~~~~~~~
   arch/x86/um/tls_32.c:184:5: warning: no previous declaration for 'arch_switch_tls' [-Wmissing-declarations]
    int arch_switch_tls(struct task_struct *to)
        ^~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from include/linux/coredump.h:6,
                    from arch/x86/um/elfcore.c:3:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   arch/x86/um/elfcore.c: At top level:
   arch/x86/um/elfcore.c:10:12: warning: no previous declaration for 'elf_core_extra_phdrs' [-Wmissing-declarations]
    Elf32_Half elf_core_extra_phdrs(struct coredump_params *cprm)
               ^~~~~~~~~~~~~~~~~~~~
   arch/x86/um/elfcore.c:15:5: warning: no previous declaration for 'elf_core_write_extra_phdrs' [-Wmissing-declarations]
    int elf_core_write_extra_phdrs(struct coredump_params *cprm, loff_t offset)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/um/elfcore.c:42:5: warning: no previous declaration for 'elf_core_write_extra_data' [-Wmissing-declarations]
    int elf_core_write_extra_data(struct coredump_params *cprm)
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/um/elfcore.c:63:8: warning: no previous declaration for 'elf_core_extra_data_size' [-Wmissing-declarations]
    size_t elf_core_extra_data_size(struct coredump_params *cprm)
           ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:13,
                    from include/linux/kprobes.h:28,
                    from include/linux/kgdb.h:19,
                    from kernel/panic.c:15:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   kernel/panic.c: In function '__warn':
   kernel/panic.c:670:3: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      vprintk(args->fmt, args->args);
      ^~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from include/linux/memblock.h:12,
                    from arch/um/kernel/mem.c:8:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   arch/um/kernel/mem.c: At top level:
   arch/um/kernel/mem.c:202:8: warning: no previous declaration for 'pgd_alloc' [-Wmissing-declarations]
    pgd_t *pgd_alloc(struct mm_struct *mm)
           ^~~~~~~~~
   arch/um/kernel/mem.c:215:7: warning: no previous declaration for 'uml_kmalloc' [-Wmissing-declarations]
    void *uml_kmalloc(int size, int flags)
          ^~~~~~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from arch/um/kernel/process.c:12:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   arch/um/kernel/process.c: At top level:
   arch/um/kernel/process.c:51:5: warning: no previous declaration for 'pid_to_processor_id' [-Wmissing-declarations]
    int pid_to_processor_id(int pid)
        ^~~~~~~~~~~~~~~~~~~
   arch/um/kernel/process.c:87:7: warning: no previous declaration for '__switch_to' [-Wmissing-declarations]
    void *__switch_to(struct task_struct *from, struct task_struct *to)
          ^~~~~~~~~~~
   arch/um/kernel/process.c: In function 'new_thread_handler':
   arch/um/kernel/process.c:122:21: warning: variable 'n' set but not used [-Wunused-but-set-variable]
     int (*fn)(void *), n;
                        ^
   arch/um/kernel/process.c: At top level:
   arch/um/kernel/process.c:140:6: warning: no previous declaration for 'fork_handler' [-Wmissing-declarations]
    void fork_handler(void)
         ^~~~~~~~~~~~
   arch/um/kernel/process.c:217:6: warning: no previous declaration for 'arch_cpu_idle' [-Wmissing-declarations]
    void arch_cpu_idle(void)
         ^~~~~~~~~~~~~
   arch/um/kernel/process.c:253:5: warning: no previous declaration for 'copy_to_user_proc' [-Wmissing-declarations]
    int copy_to_user_proc(void __user *to, void *from, int size)
        ^~~~~~~~~~~~~~~~~
   arch/um/kernel/process.c:263:5: warning: no previous declaration for 'clear_user_proc' [-Wmissing-declarations]
    int clear_user_proc(void __user *buf, int size)
        ^~~~~~~~~~~~~~~
   arch/um/kernel/process.c:316:12: warning: no previous declaration for 'make_proc_sysemu' [-Wmissing-declarations]
    int __init make_proc_sysemu(void)
               ^~~~~~~~~~~~~~~~
   arch/um/kernel/process.c:356:15: warning: no previous declaration for 'arch_align_stack' [-Wmissing-declarations]
    unsigned long arch_align_stack(unsigned long sp)
                  ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from include/linux/oom.h:11,
                    from arch/um/kernel/reboot.c:11:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   arch/um/kernel/reboot.c: At top level:
   arch/um/kernel/reboot.c:45:6: warning: no previous declaration for 'machine_restart' [-Wmissing-declarations]
    void machine_restart(char * __unused)
         ^~~~~~~~~~~~~~~
   arch/um/kernel/reboot.c:51:6: warning: no previous declaration for 'machine_power_off' [-Wmissing-declarations]
    void machine_power_off(void)
         ^~~~~~~~~~~~~~~~~
   arch/um/kernel/reboot.c:57:6: warning: no previous declaration for 'machine_halt' [-Wmissing-declarations]
    void machine_halt(void)
         ^~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from arch/um/kernel/tlb.c:6:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   arch/um/kernel/tlb.c: At top level:
   arch/um/kernel/tlb.c:579:6: warning: no previous declaration for 'flush_tlb_mm_range' [-Wmissing-declarations]
    void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
         ^~~~~~~~~~~~~~~~~~
   arch/um/kernel/tlb.c:594:6: warning: no previous declaration for 'force_flush_all' [-Wmissing-declarations]
    void force_flush_all(void)
         ^~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29:0,
                    from arch/um/kernel/um_arch.c:9:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:209:34: error: invalid operands to binary + (have 'pte_t {aka struct <anonymous>}' and 'long unsigned int')
    #define pte_next_pfn(pte) ((pte) + (1UL << PFN_PTE_SHIFT))
                                     ^
   include/linux/pgtable.h:238:9: note: in expansion of macro 'pte_next_pfn'
      pte = pte_next_pfn(pte);
            ^~~~~~~~~~~~
   arch/um/kernel/um_arch.c: At top level:
   arch/um/kernel/um_arch.c:408:19: warning: no previous declaration for 'read_initrd' [-Wmissing-declarations]
    int __init __weak read_initrd(void)
                      ^~~~~~~~~~~
   arch/um/kernel/um_arch.c:461:7: warning: no previous declaration for 'text_poke' [-Wmissing-declarations]
    void *text_poke(void *addr, const void *opcode, size_t len)
          ^~~~~~~~~
   arch/um/kernel/um_arch.c:473:6: warning: no previous declaration for 'text_poke_sync' [-Wmissing-declarations]
    void text_poke_sync(void)
         ^~~~~~~~~~~~~~
..


vim +209 include/linux/pgtable.h

   207	
   208	#ifndef pte_next_pfn
 > 209	#define pte_next_pfn(pte)	((pte) + (1UL << PFN_PTE_SHIFT))
   210	#endif
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
