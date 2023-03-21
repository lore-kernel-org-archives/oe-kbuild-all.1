Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EC0D505
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 18:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679424293; x=1710960293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxtP4EI+XXytMpO+xEO+1PZvf3qr+LE+LXl80Fhs4EU=;
  b=MWaSP1e7WWMFmEggMjoLQ/HUkw3O1sTLYgvhWqKkcG0fLRcxbK7T4+lT
   Xb0+MYjkaTHQfkU52oobNFWQ2i12DJWlLuCGKrGjrIpoceZEwS98C5XNK
   n0iffuNUJZ74JYC+O4MFZ7Utlfr6A33F4DIshXjEXXk+ERh2Ov3h9uFWE
   R1W0QjXcOBOLGtLTTOGoDKSA7noeAgOuXzNnuXt3uaVylCcZHUVqb26cN
   a4QnLIxdq+Ps18cq95tUfMpFcWAS41NVC+jFtnUEWsvJUdxLImHUjVQEt
   aTtxmljJnEO1U+XX+x8uiUtLXAoDpFrU1ZWYHiDW/bdwIByM99Qq96vQ1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339068996"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="339068996"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 11:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750716886"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="750716886"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2023 11:44:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pegyW-000CIE-2j;
	Tue, 21 Mar 2023 18:44:48 +0000
Date: Wed, 22 Mar 2023 02:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 7928/9999]
 arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '('
 before '+' token
Message-ID: <202303220217.aljNvkwe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: 09a8b695254c3a3382d09d65b7eb30cc729dffb3 [7928/9999] Intel: perf/x86/lbr: Add interface to get LBR information
config: i386-randconfig-a014 (https://download.01.org/0day-ci/archive/20230322/202303220217.aljNvkwe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/alibaba/cloud-kernel/commit/09a8b695254c3a3382d09d65b7eb30cc729dffb3
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout 09a8b695254c3a3382d09d65b7eb30cc729dffb3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220217.aljNvkwe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/trace_events.h:20,
                    from include/trace/define_trace.h:96,
                    from drivers/usb/typec/ucsi/trace.h:144,
                    from drivers/usb/typec/ucsi/trace.c:3:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:87,
                    from init/main.c:20:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   init/main.c:496:20: warning: no previous prototype for 'mem_encrypt_init' [-Wmissing-prototypes]
     496 | void __init __weak mem_encrypt_init(void) { }
         |                    ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:87,
                    from init/do_mounts.h:5,
                    from init/do_mounts.c:26:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   init/do_mounts.c: In function 'change_floppy':
   init/do_mounts.c:480:9: warning: function 'change_floppy' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     480 |         vsprintf(buf, fmt, args);
         |         ^~~~~~~~
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:87,
                    from arch/x86/entry/common.c:27:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   arch/x86/entry/common.c:348:16: warning: no previous prototype for 'do_int80_syscall_32' [-Wmissing-prototypes]
     348 | __visible void do_int80_syscall_32(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~~~~
   arch/x86/entry/common.c:356:16: warning: no previous prototype for 'do_fast_syscall_32' [-Wmissing-prototypes]
     356 | __visible long do_fast_syscall_32(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:25,
                    from arch/x86/events/core.c:15:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   arch/x86/events/core.c:2308:6: warning: no previous prototype for 'arch_perf_update_userpage' [-Wmissing-prototypes]
    2308 | void arch_perf_update_userpage(struct perf_event *event,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/trace_events.h:20,
                    from include/trace/define_trace.h:96,
                    from arch/x86/include/asm/trace/irq_vectors.h:397,
                    from arch/x86/kernel/irq.c:23:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   arch/x86/kernel/irq.c:270:28: warning: no previous prototype for 'smp_x86_platform_ipi' [-Wmissing-prototypes]
     270 | __visible void __irq_entry smp_x86_platform_ipi(struct pt_regs *regs)
         |                            ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/irq.c:301:16: warning: no previous prototype for 'smp_kvm_posted_intr_ipi' [-Wmissing-prototypes]
     301 | __visible void smp_kvm_posted_intr_ipi(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/irq.c:314:16: warning: no previous prototype for 'smp_kvm_posted_intr_wakeup_ipi' [-Wmissing-prototypes]
     314 | __visible void smp_kvm_posted_intr_wakeup_ipi(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/irq.c:328:16: warning: no previous prototype for 'smp_kvm_posted_intr_nested_ipi' [-Wmissing-prototypes]
     328 | __visible void smp_kvm_posted_intr_nested_ipi(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:25,
                    from arch/x86/kernel/hw_breakpoint.c:30:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   arch/x86/kernel/hw_breakpoint.c: In function 'arch_build_bp_info':
   arch/x86/kernel/hw_breakpoint.c:278:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     278 |                 if (attr->bp_len == sizeof(long)) {
         |                    ^
   arch/x86/kernel/hw_breakpoint.c:282:9: note: here
     282 |         default:
         |         ^~~~~~~
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/events/power.h:12,
                    from arch/x86/kernel/process.c:25:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   arch/x86/kernel/process.c:720:13: warning: no previous prototype for 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
     720 | void __init arch_post_acpi_subsys_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/process.c: In function 'arch_post_acpi_subsys_init':
   arch/x86/kernel/process.c:722:17: warning: variable 'hi' set but not used [-Wunused-but-set-variable]
     722 |         u32 lo, hi;
         |                 ^~
   arch/x86/kernel/process.c: At top level:
   arch/x86/kernel/process.c:784:15: warning: no previous prototype for 'arch_randomize_brk' [-Wmissing-prototypes]
     784 | unsigned long arch_randomize_brk(struct mm_struct *mm)
         |               ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/process.c:851:6: warning: no previous prototype for 'do_arch_prctl_common' [-Wmissing-prototypes]
     851 | long do_arch_prctl_common(struct task_struct *task, int option,
         |      ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:25,
                    from arch/x86/kernel/ptrace.c:22:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   arch/x86/kernel/ptrace.c: In function 'set_segment_reg':
   arch/x86/kernel/ptrace.c:230:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     230 |                 if (unlikely(value == 0))
         |                    ^
   arch/x86/kernel/ptrace.c:233:9: note: here
     233 |         default:
         |         ^~~~~~~
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:87,
                    from arch/x86/kernel/vm86_32.c:37:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   arch/x86/kernel/vm86_32.c: In function 'mark_screen_rdonly':
   arch/x86/kernel/vm86_32.c:166:32: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
     166 |         struct vm_area_struct *vma;
         |                                ^~~
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/trace_events.h:20,
                    from include/trace/define_trace.h:96,
                    from include/trace/events/tlb.h:62,
                    from arch/x86/mm/init.c:33:
>> arch/x86/include/asm/perf_event.h:366:1: error: expected identifier or '(' before '+' token
     366 | +static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
         | ^
   arch/x86/mm/init.c:824:13: warning: no previous prototype for 'mem_encrypt_free_decrypted_mem' [-Wmissing-prototypes]
     824 | void __weak mem_encrypt_free_decrypted_mem(void) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +366 arch/x86/include/asm/perf_event.h

   362	
   363	#if defined(CONFIG_PERF_EVENTS) && defined(CONFIG_CPU_SUP_INTEL)
   364	extern int x86_perf_get_lbr(struct x86_pmu_lbr *lbr);
   365	#else
 > 366	+static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
   367	{
   368	       return -1;
   369	}
   370	#endif
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
