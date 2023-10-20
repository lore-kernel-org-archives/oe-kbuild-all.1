Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C1CA6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 07:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEAPKcD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697785521; x=1729321521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=euNS0kqF7eOmuJnthaC6/83xn7D0LUKoj20oXeYsr/A=;
  b=VEAPKcD5hwSo19LVU7SVXB+HTrNmPdRLrtAsTL169LeVZEEoK47GHX/2
   6YbOhpjNcjQIDI8o+nExeNtEw3i60tgiq6dRId8FcmRM26B+2tZypzXCp
   u55fbFTyFicCYjbZcb4heFeSovLtaTkOwYpDd3/UBo3pTa4D3qGZEHbsL
   ng3yGlosM7q9yZSWjW7jrpRgXAZyWwcAvXxWozeBGmpzUs7zsIC/Pk7K8
   ApNAyPgEH0HafxTPBMv2BJEUJknWYSC9M2ClPQbHmfTH/Es/4oRjz245A
   LPx4+oyH1Dw6TbmMBZNCMRdA0M7p1PJJX4y30tgRU2yozyt3VcrUzlxzW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="8008438"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="8008438"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 00:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="880987524"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="880987524"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Oct 2023 00:04:55 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtjYy-0003BY-2n;
	Fri, 20 Oct 2023 07:04:52 +0000
Date: Fri, 20 Oct 2023 15:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 4/4] include/linux/rcupdate.h:137:9:
 warning: 'return' with a value, in function returning void
Message-ID: <202310201426.RT4gkdwJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   f9a3a161b4eb14012fe048077374c34046b770a3
commit: f9a3a161b4eb14012fe048077374c34046b770a3 [4/4] rcu/tasks: Delay creation of RCU-Tasks gp kthread to real idle code
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231020/202310201426.RT4gkdwJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201426.RT4gkdwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201426.RT4gkdwJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/x86/um/shared/sysdep/kernel-offsets.h:3,
                    from arch/um/kernel/asm-offsets.c:1:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/um/kernel/asm-offsets.c:1:0:
   arch/x86/um/shared/sysdep/kernel-offsets.h: At top level:
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous declaration for 'foo' [-Wmissing-declarations]
    void foo(void)
         ^~~
--
   In file included from include/linux/rbtree.h:24:0,
                    from include/linux/mm_types.h:11,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from init/main.c:17:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rbtree.h:24:0,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/x86/um/ptrace_32.c:6:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
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
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ptrace.h:6,
                    from arch/x86/um/signal.c:9:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/um/signal.c: At top level:
   arch/x86/um/signal.c:453:6: warning: no previous declaration for 'sys_sigreturn' [-Wmissing-declarations]
    long sys_sigreturn(void)
         ^~~~~~~~~~~~~
   arch/x86/um/signal.c:560:6: warning: no previous declaration for 'sys_rt_sigreturn' [-Wmissing-declarations]
    long sys_rt_sigreturn(void)
         ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/x86/um/tls_32.c:7:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
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
   In file included from include/linux/rbtree.h:24:0,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/coredump.h:6,
                    from arch/x86/um/elfcore.c:3:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
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
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from kernel/panic.c:14:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/panic.c: In function '__warn':
   kernel/panic.c:666:3: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      vprintk(args->fmt, args->args);
      ^~~~~~~
--
   In file included from include/linux/rcuwait.h:5:0,
                    from include/linux/irq_work.h:6,
                    from kernel/irq_work.c:12:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq_work.c: At top level:
   kernel/irq_work.c:72:13: warning: no previous declaration for 'arch_irq_work_raise' [-Wmissing-declarations]
    void __weak arch_irq_work_raise(void)
                ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rbtree.h:24:0,
                    from include/linux/mm_types.h:11,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from arch/um/kernel/mem.c:7:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   arch/um/kernel/mem.c: At top level:
   arch/um/kernel/mem.c:202:8: warning: no previous declaration for 'pgd_alloc' [-Wmissing-declarations]
    pgd_t *pgd_alloc(struct mm_struct *mm)
           ^~~~~~~~~
   arch/um/kernel/mem.c:215:7: warning: no previous declaration for 'uml_kmalloc' [-Wmissing-declarations]
    void *uml_kmalloc(int size, int flags)
          ^~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/hardirq.h:9,
                    from arch/um/kernel/process.c:11:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
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
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/sched/signal.h:5,
                    from arch/um/kernel/reboot.c:6:
   include/linux/rcupdate.h: In function 'rcu_spawn_tasks_kthread':
>> include/linux/rcupdate.h:137:9: warning: 'return' with a value, in function returning void
     return 0;
            ^
   include/linux/rcupdate.h:135:20: note: declared here
    static inline void rcu_spawn_tasks_kthread(void)
                       ^~~~~~~~~~~~~~~~~~~~~~~
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
..


vim +/return +137 include/linux/rcupdate.h

   131	
   132	#ifdef CONFIG_TASKS_RCU
   133	int rcu_spawn_tasks_kthread(void);
   134	#else
   135	static inline void rcu_spawn_tasks_kthread(void)
   136	{
 > 137		return 0;
   138	}
   139	#endif
   140	
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
