Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8068733FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675091831; x=1706627831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OrSqvMik5Ka5TivUhFmoYPOjQxG4XheKRRqFVbrWwlo=;
  b=ZUw6gB06CjyJ7fgWec4OI0CLGAtbe5E9fk4rAgQB6izhOog6Om/vcGxa
   OE9R0qfH3tPQHFqJt5hse2qhF0WG4OMvOlgwov+R98QQPWu/GuE+rEOfB
   L+xhqt+ZKWlwHafZ0hnEcwEFdEcN3HKyipvj6r+h8MpYZwgLakfyP5faq
   fau3vP7V94EGrntOV2q8LtgiNme5QGrqMY5T046KCIljx1OhdguJv9/5Q
   0RELKoVwElUD3D1ic1Ol353UKhS10AdqKbH+ZGa9tLWtrPwRmr+r5Luaa
   Dm2NBeS3Z7U/1dlPinI2Chzpfbx5N4ychr4rv8gDjqiyjHUksMC0soKCf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325277874"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="325277874"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 07:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694586462"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="694586462"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jan 2023 07:17:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMVu5-0003hI-26;
	Mon, 30 Jan 2023 15:17:05 +0000
Date: Mon, 30 Jan 2023 23:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:file_build_id 1/4] include/linux/buildid.h:31:13:
 warning: no previous prototype for 'build_id_init'
Message-ID: <202301302318.caoiL8kY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git file_build_id
head:   19769e82685efd26d7714d6f12601da7e48086e8
commit: 39dec2be008ec7c98f7ea818bc2c0f15a3586ef2 [1/4] mm: Store build id in file object
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230130/202301302318.caoiL8kY-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=39dec2be008ec7c98f7ea818bc2c0f15a3586ef2
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf file_build_id
        git checkout 39dec2be008ec7c98f7ea818bc2c0f15a3586ef2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash arch/arc/kernel/ fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/module.h:14,
                    from fs/open.c:13:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
--
   In file included from include/linux/module.h:14,
                    from fs/file_table.c:14:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   fs/file_table.c: In function 'file_free_rcu':
   fs/file_table.c:51:24: error: 'struct file' has no member named 'f_bid'
      51 |         build_id_free(f->f_bid);
         |                        ^~
--
   In file included from include/linux/module.h:14,
                    from fs/pipe.c:12:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   fs/pipe.c:757:15: warning: no previous prototype for 'account_pipe_buffers' [-Wmissing-prototypes]
     757 | unsigned long account_pipe_buffers(struct user_struct *user,
         |               ^~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:763:6: warning: no previous prototype for 'too_many_pipe_buffers_soft' [-Wmissing-prototypes]
     763 | bool too_many_pipe_buffers_soft(unsigned long user_bufs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:770:6: warning: no previous prototype for 'too_many_pipe_buffers_hard' [-Wmissing-prototypes]
     770 | bool too_many_pipe_buffers_hard(unsigned long user_bufs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:777:6: warning: no previous prototype for 'pipe_is_unprivileged_user' [-Wmissing-prototypes]
     777 | bool pipe_is_unprivileged_user(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:1253:5: warning: no previous prototype for 'pipe_resize_ring' [-Wmissing-prototypes]
    1253 | int pipe_resize_ring(struct pipe_inode_info *pipe, unsigned int nr_slots)
         |     ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:14,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:88,
                    from fs/d_path.c:2:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   fs/d_path.c:317:7: warning: no previous prototype for 'simple_dname' [-Wmissing-prototypes]
     317 | char *simple_dname(struct dentry *dentry, char *buffer, int buflen)
         |       ^~~~~~~~~~~~
--
   In file included from include/linux/module.h:14,
                    from arch/arc/kernel/setup.c:13:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   arch/arc/kernel/setup.c:498:13: warning: no previous prototype for 'handle_uboot_args' [-Wmissing-prototypes]
     498 | void __init handle_uboot_args(void)
         |             ^~~~~~~~~~~~~~~~~
   arch/arc/kernel/setup.c:585:13: warning: no previous prototype for 'time_init' [-Wmissing-prototypes]
     585 | void __init time_init(void)
         |             ^~~~~~~~~
--
   In file included from include/linux/module.h:14,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:15,
                    from include/linux/irqchip.h:14,
                    from arch/arc/kernel/irq.c:7:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   arch/arc/kernel/irq.c:19:13: warning: no previous prototype for 'init_IRQ' [-Wmissing-prototypes]
      19 | void __init init_IRQ(void)
         |             ^~~~~~~~
   arch/arc/kernel/irq.c:42:6: warning: no previous prototype for 'arch_do_IRQ' [-Wmissing-prototypes]
      42 | void arch_do_IRQ(unsigned int hwirq, struct pt_regs *regs)
         |      ^~~~~~~~~~~
--
   In file included from include/linux/module.h:14,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/events/syscalls.h:10,
                    from arch/arc/kernel/ptrace.c:13:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   arch/arc/kernel/ptrace.c:344:16: warning: no previous prototype for 'syscall_trace_entry' [-Wmissing-prototypes]
     344 | asmlinkage int syscall_trace_entry(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arc/kernel/ptrace.c:358:17: warning: no previous prototype for 'syscall_trace_exit' [-Wmissing-prototypes]
     358 | asmlinkage void syscall_trace_exit(struct pt_regs *regs)
         |                 ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:14,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:88,
                    from arch/arc/kernel/signal.c:51:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   arch/arc/kernel/signal.c:401:6: warning: no previous prototype for 'do_signal' [-Wmissing-prototypes]
     401 | void do_signal(struct pt_regs *regs)
         |      ^~~~~~~~~
   arch/arc/kernel/signal.c:434:6: warning: no previous prototype for 'do_notify_resume' [-Wmissing-prototypes]
     434 | void do_notify_resume(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/kallsyms.h:10,
                    from include/linux/ftrace.h:13,
                    from include/linux/kprobes.h:28,
                    from arch/arc/kernel/traps.c:17:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   arch/arc/kernel/traps.c:68:48: warning: no previous prototype for 'do_privilege_fault' [-Wmissing-prototypes]
      68 | DO_ERROR_INFO(SIGILL, "Priv Op/Disabled Extn", do_privilege_fault, ILL_PRVOPC)
         |                                                ^~~~~~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:59:5: note: in definition of macro 'DO_ERROR_INFO'
      59 | int name(unsigned long address, struct pt_regs *regs) \
         |     ^~~~
   arch/arc/kernel/traps.c:69:44: warning: no previous prototype for 'do_extension_fault' [-Wmissing-prototypes]
      69 | DO_ERROR_INFO(SIGILL, "Invalid Extn Insn", do_extension_fault, ILL_ILLOPC)
         |                                            ^~~~~~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:59:5: note: in definition of macro 'DO_ERROR_INFO'
      59 | int name(unsigned long address, struct pt_regs *regs) \
         |     ^~~~
   arch/arc/kernel/traps.c:70:48: warning: no previous prototype for 'insterror_is_error' [-Wmissing-prototypes]
      70 | DO_ERROR_INFO(SIGILL, "Illegal Insn (or Seq)", insterror_is_error, ILL_ILLOPC)
         |                                                ^~~~~~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:59:5: note: in definition of macro 'DO_ERROR_INFO'
      59 | int name(unsigned long address, struct pt_regs *regs) \
         |     ^~~~
   arch/arc/kernel/traps.c:71:52: warning: no previous prototype for 'do_memory_error' [-Wmissing-prototypes]
      71 | DO_ERROR_INFO(SIGBUS, "Invalid Mem Access", __weak do_memory_error, BUS_ADRERR)
         |                                                    ^~~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:59:5: note: in definition of macro 'DO_ERROR_INFO'
      59 | int name(unsigned long address, struct pt_regs *regs) \
         |     ^~~~
   arch/arc/kernel/traps.c:72:42: warning: no previous prototype for 'trap_is_brkpt' [-Wmissing-prototypes]
      72 | DO_ERROR_INFO(SIGTRAP, "Breakpoint Set", trap_is_brkpt, TRAP_BRKPT)
         |                                          ^~~~~~~~~~~~~
   arch/arc/kernel/traps.c:59:5: note: in definition of macro 'DO_ERROR_INFO'
      59 | int name(unsigned long address, struct pt_regs *regs) \
         |     ^~~~
   arch/arc/kernel/traps.c:73:44: warning: no previous prototype for 'do_misaligned_error' [-Wmissing-prototypes]
      73 | DO_ERROR_INFO(SIGBUS, "Misaligned Access", do_misaligned_error, BUS_ADRALN)
         |                                            ^~~~~~~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:59:5: note: in definition of macro 'DO_ERROR_INFO'
      59 | int name(unsigned long address, struct pt_regs *regs) \
         |     ^~~~
   arch/arc/kernel/traps.c:74:56: warning: no previous prototype for 'do_trap5_error' [-Wmissing-prototypes]
      74 | DO_ERROR_INFO(SIGSEGV, "gcc generated __builtin_trap", do_trap5_error, 0)
         |                                                        ^~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:59:5: note: in definition of macro 'DO_ERROR_INFO'
      59 | int name(unsigned long address, struct pt_regs *regs) \
         |     ^~~~
   arch/arc/kernel/traps.c:79:5: warning: no previous prototype for 'do_misaligned_access' [-Wmissing-prototypes]
      79 | int do_misaligned_access(unsigned long address, struct pt_regs *regs,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:93:6: warning: no previous prototype for 'do_machine_check_fault' [-Wmissing-prototypes]
      93 | void do_machine_check_fault(unsigned long address, struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:110:6: warning: no previous prototype for 'do_non_swi_trap' [-Wmissing-prototypes]
     110 | void do_non_swi_trap(unsigned long address, struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:141:6: warning: no previous prototype for 'do_insterror_or_kprobe' [-Wmissing-prototypes]
     141 | void do_insterror_or_kprobe(unsigned long address, struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arc/kernel/traps.c:156:6: warning: no previous prototype for 'abort' [-Wmissing-prototypes]
     156 | void abort(void)
         |      ^~~~~
--
   In file included from include/linux/module.h:14,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:88,
                    from arch/arc/kernel/sys.c:3:
>> include/linux/buildid.h:31:13: warning: no previous prototype for 'build_id_init' [-Wmissing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: warning: no previous prototype for 'build_id_free' [-Wmissing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:29:37: note: in expansion of macro '__SYSCALL'
      29 | #define __SC_COMP(_nr, _sys, _comp) __SYSCALL(_nr, _sys)
         |                                     ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:34:1: note: in expansion of macro '__SC_COMP'
      34 | __SC_COMP(__NR_io_setup, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[0]')
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:29:37: note: in expansion of macro '__SYSCALL'
      29 | #define __SC_COMP(_nr, _sys, _comp) __SYSCALL(_nr, _sys)
         |                                     ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:34:1: note: in expansion of macro '__SC_COMP'
      34 | __SC_COMP(__NR_io_setup, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:36:1: note: in expansion of macro '__SYSCALL'
      36 | __SYSCALL(__NR_io_destroy, sys_io_destroy)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[1]')
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:36:1: note: in expansion of macro '__SYSCALL'
      36 | __SYSCALL(__NR_io_destroy, sys_io_destroy)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:29:37: note: in expansion of macro '__SYSCALL'
      29 | #define __SC_COMP(_nr, _sys, _comp) __SYSCALL(_nr, _sys)
         |                                     ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:38:1: note: in expansion of macro '__SC_COMP'
      38 | __SC_COMP(__NR_io_submit, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[2]')
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:29:37: note: in expansion of macro '__SYSCALL'
      29 | #define __SC_COMP(_nr, _sys, _comp) __SYSCALL(_nr, _sys)
         |                                     ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:38:1: note: in expansion of macro '__SC_COMP'
      38 | __SC_COMP(__NR_io_submit, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:40:1: note: in expansion of macro '__SYSCALL'
      40 | __SYSCALL(__NR_io_cancel, sys_io_cancel)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[3]')
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:40:1: note: in expansion of macro '__SYSCALL'
      40 | __SYSCALL(__NR_io_cancel, sys_io_cancel)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:20:34: note: in expansion of macro '__SYSCALL'
      20 | #define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _32)
         |                                  ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:43:1: note: in expansion of macro '__SC_3264'
      43 | __SC_3264(__NR_io_getevents, sys_io_getevents_time32, sys_io_getevents)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[4]')
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:20:34: note: in expansion of macro '__SYSCALL'
      20 | #define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _32)
         |                                  ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:43:1: note: in expansion of macro '__SC_3264'
      43 | __SC_3264(__NR_io_getevents, sys_io_getevents_time32, sys_io_getevents)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:48:1: note: in expansion of macro '__SYSCALL'
      48 | __SYSCALL(__NR_setxattr, sys_setxattr)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[5]')
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:48:1: note: in expansion of macro '__SYSCALL'
      48 | __SYSCALL(__NR_setxattr, sys_setxattr)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
      13 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:50:1: note: in expansion of macro '__SYSCALL'
      50 | __SYSCALL(__NR_lsetxattr, sys_lsetxattr)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[6]')
      13 | #define __SYSCALL(nr, call) [nr] = (call),
..


vim +/build_id_init +31 include/linux/buildid.h

    25	
    26	#ifdef CONFIG_FILE_BUILD_ID
    27	void __init build_id_init(void);
    28	void build_id_free(struct build_id *bid);
    29	int vma_get_build_id(struct vm_area_struct *vma, struct build_id **bidp);
    30	#else
  > 31	void __init build_id_init(void) { }
  > 32	void build_id_free(struct build_id *bid) { }
    33	#endif /* CONFIG_FILE_BUILD_ID */
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
