Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CDE1FBEBE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748447908; cv=none; b=KO9r1SIw4KThZApN6Kwr77EtqojOrsHCr1jZAMxYFKm5/+5wDMZGQZd0ZjKOePlTPqvAQV7+xK2O16agh/6qWFAmNj2KVHPVrYxKEg4Ae24VyE8I0D8F8PtELNNDmovynoV9JOoen+j2fR9IME7RZx4j2Yl/Cjy+spwyxeFFsJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748447908; c=relaxed/simple;
	bh=Untn+63LfSIIc6bjBTpeBJjQ7ZxjhEvqOYBz1ptdS8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gk9N5BbXrP/6Gc5QT5XjT96Yoa5N9PJ7PRaIstdETSloayN014T1U0PJLxGMrJJqAJr0ebgzW8ogV/YXOKMdO6e5Hp5sGYhr62YYKr0UIkBh7viBNQdyBkaGVZf9akDgG+cKSd54TRHo0rifUC2YO0/v+1exPyBhNfLUDN3IR4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Grwg4Alc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Grwg4Alc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748447907; x=1779983907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Untn+63LfSIIc6bjBTpeBJjQ7ZxjhEvqOYBz1ptdS8k=;
  b=Grwg4AlchJY7cJYTVA/cqsYNyKJ4+R5CWls9NzPlEYLt1v0Ps74fScLz
   HAUF6xdLJYrjscSYkmMvLQxoeCQlJnrYms5ajdE3uRCIwwCBCvISGUH9M
   gRlvA51gkwYc5epvardtLqwlyAdldbfIygKVSs/prBRR7pHw7DGrBLYWC
   Ste9rmpc3xi8Bnt4WyBF5WKz0Uv0sicpEcJNvquGYA6uHs87kK7I02N1W
   Ml8fiU2OsUQ4qeO4+TrLYp2S3oMxqgynKfZk4iTiSfFnJ8CxSdiNVgbMP
   4MZks2/mMquqkRx+JQHJoddCmixOxHTtFtHfaZMo2PwjOD4aoX8CzLh4S
   Q==;
X-CSE-ConnectionGUID: 5lpBxNS5RJGOWi9jiL7Q+w==
X-CSE-MsgGUID: 2g0yJAArSMqhogN11ah3Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67897063"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="67897063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:58:24 -0700
X-CSE-ConnectionGUID: 21ZwWZUxTmOL+5GvjDHpEQ==
X-CSE-MsgGUID: GL1Pp4UlSf2j7GfbaUEnZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="144248095"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 08:58:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKJAZ-000Vp2-2u;
	Wed, 28 May 2025 15:58:19 +0000
Date: Wed, 28 May 2025 23:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2329/2329] include/linux/compiler.h:215:46:
 error: initializer element is not constant
Message-ID: <202505282313.Lw9dIqW7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66b0cef2a959be1562a528e3d8cc260dc3803e61
commit: 654944510822988390470cbc5b6f914c19dd9b88 [2329/2329] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: arm64-randconfig-004-20250529 (https://download.01.org/0day-ci/archive/20250528/202505282313.Lw9dIqW7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282313.Lw9dIqW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282313.Lw9dIqW7-lkp@intel.com/

All errors (new ones prefixed by >>):

               ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1870:15: error: initializer element is not constant
     .proc_open = psi_io_open,
                  ^~~~~~~~~~~
   kernel/sched/psi.c:1870:15: note: (near initialization for 'psi_io_proc_ops.proc_open')
   kernel/sched/psi.c:1873:16: error: initializer element is not constant
     .proc_write = psi_io_write,
                   ^~~~~~~~~~~~
   kernel/sched/psi.c:1873:16: note: (near initialization for 'psi_io_proc_ops.proc_write')
   kernel/sched/psi.c:1874:15: error: initializer element is not constant
     .proc_poll = psi_fop_poll,
                  ^~~~~~~~~~~~
   kernel/sched/psi.c:1874:15: note: (near initialization for 'psi_io_proc_ops.proc_poll')
   kernel/sched/psi.c:1875:18: error: initializer element is not constant
     .proc_release = psi_fop_release,
                     ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1875:18: note: (near initialization for 'psi_io_proc_ops.proc_release')
   kernel/sched/psi.c:1879:15: error: initializer element is not constant
     .proc_open = psi_memory_open,
                  ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1879:15: note: (near initialization for 'psi_memory_proc_ops.proc_open')
   kernel/sched/psi.c:1882:16: error: initializer element is not constant
     .proc_write = psi_memory_write,
                   ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1882:16: note: (near initialization for 'psi_memory_proc_ops.proc_write')
   kernel/sched/psi.c:1883:15: error: initializer element is not constant
     .proc_poll = psi_fop_poll,
                  ^~~~~~~~~~~~
   kernel/sched/psi.c:1883:15: note: (near initialization for 'psi_memory_proc_ops.proc_poll')
   kernel/sched/psi.c:1884:18: error: initializer element is not constant
     .proc_release = psi_fop_release,
                     ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1884:18: note: (near initialization for 'psi_memory_proc_ops.proc_release')
   kernel/sched/psi.c:1888:15: error: initializer element is not constant
     .proc_open = psi_cpu_open,
                  ^~~~~~~~~~~~
   kernel/sched/psi.c:1888:15: note: (near initialization for 'psi_cpu_proc_ops.proc_open')
   kernel/sched/psi.c:1891:16: error: initializer element is not constant
     .proc_write = psi_cpu_write,
                   ^~~~~~~~~~~~~
   kernel/sched/psi.c:1891:16: note: (near initialization for 'psi_cpu_proc_ops.proc_write')
   kernel/sched/psi.c:1892:15: error: initializer element is not constant
     .proc_poll = psi_fop_poll,
                  ^~~~~~~~~~~~
   kernel/sched/psi.c:1892:15: note: (near initialization for 'psi_cpu_proc_ops.proc_poll')
   kernel/sched/psi.c:1893:18: error: initializer element is not constant
     .proc_release = psi_fop_release,
                     ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1893:18: note: (near initialization for 'psi_cpu_proc_ops.proc_release')
   kernel/sched/psi.c:1907:13: error: invalid storage class for function 'get_stat_names'
    static void get_stat_names(struct seq_file *m, int i, bool is_full)
                ^~~~~~~~~~~~~~
   kernel/sched/psi.c:1953:12: error: invalid storage class for function 'system_psi_stat_show'
    static int system_psi_stat_show(struct seq_file *m, void *v)
               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1958:12: error: invalid storage class for function 'psi_stat_open'
    static int psi_stat_open(struct inode *inode, struct file *file)
               ^~~~~~~~~~~~~
   kernel/sched/psi.c:1964:15: error: initializer element is not constant
     .proc_open = psi_stat_open,
                  ^~~~~~~~~~~~~
   kernel/sched/psi.c:1964:15: note: (near initialization for 'psi_stat_proc_ops.proc_open')
   kernel/sched/psi.c:1967:18: error: initializer element is not constant
     .proc_release = psi_fop_release,
                     ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1967:18: note: (near initialization for 'psi_stat_proc_ops.proc_release')
   kernel/sched/psi.c:1972:12: error: invalid storage class for function 'psi_irq_show'
    static int psi_irq_show(struct seq_file *m, void *v)
               ^~~~~~~~~~~~
   kernel/sched/psi.c:1977:12: error: invalid storage class for function 'psi_irq_open'
    static int psi_irq_open(struct inode *inode, struct file *file)
               ^~~~~~~~~~~~
   kernel/sched/psi.c:1982:16: error: invalid storage class for function 'psi_irq_write'
    static ssize_t psi_irq_write(struct file *file, const char __user *user_buf,
                   ^~~~~~~~~~~~~
   kernel/sched/psi.c:1989:15: error: initializer element is not constant
     .proc_open = psi_irq_open,
                  ^~~~~~~~~~~~
   kernel/sched/psi.c:1989:15: note: (near initialization for 'psi_irq_proc_ops.proc_open')
   kernel/sched/psi.c:1992:16: error: initializer element is not constant
     .proc_write = psi_irq_write,
                   ^~~~~~~~~~~~~
   kernel/sched/psi.c:1992:16: note: (near initialization for 'psi_irq_proc_ops.proc_write')
   kernel/sched/psi.c:1993:15: error: initializer element is not constant
     .proc_poll = psi_fop_poll,
                  ^~~~~~~~~~~~
   kernel/sched/psi.c:1993:15: note: (near initialization for 'psi_irq_proc_ops.proc_poll')
   kernel/sched/psi.c:1994:18: error: initializer element is not constant
     .proc_release = psi_fop_release,
                     ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1994:18: note: (near initialization for 'psi_irq_proc_ops.proc_release')
   kernel/sched/psi.c:1998:19: error: invalid storage class for function 'psi_proc_init'
    static int __init psi_proc_init(void)
                      ^~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
>> include/linux/compiler.h:215:46: error: initializer element is not constant
      __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                 ^
   include/linux/compiler.h:217:2: note: in expansion of macro '___ADDRESSABLE'
     ___ADDRESSABLE(sym, __section(".discard.addressable"))
     ^~~~~~~~~~~~~~
   include/linux/init.h:256:2: note: in expansion of macro '__ADDRESSABLE'
     __ADDRESSABLE(fn)
     ^~~~~~~~~~~~~
   include/linux/init.h:261:2: note: in expansion of macro '__define_initcall_stub'
     __define_initcall_stub(__stub, fn)   \
     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:274:2: note: in expansion of macro '____define_initcall'
     ____define_initcall(fn,     \
     ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:280:2: note: in expansion of macro '__unique_initcall'
     __unique_initcall(fn, id, __sec, __initcall_id(fn))
     ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
    #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
                                      ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:311:30: note: in expansion of macro '__define_initcall'
    #define device_initcall(fn)  __define_initcall(fn, 6)
                                 ^~~~~~~~~~~~~~~~~
   include/linux/init.h:316:24: note: in expansion of macro 'device_initcall'
    #define __initcall(fn) device_initcall(fn)
                           ^~~~~~~~~~~~~~~
   include/linux/module.h:88:24: note: in expansion of macro '__initcall'
    #define module_init(x) __initcall(x);
                           ^~~~~~~~~~
   kernel/sched/psi.c:2014:1: note: in expansion of macro 'module_init'
    module_init(psi_proc_init);
    ^~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:101:
   kernel/sched/membarrier.c:165:13: error: invalid storage class for function 'ipi_mb'
    static void ipi_mb(void *info)
                ^~~~~~
   kernel/sched/membarrier.c:170:13: error: invalid storage class for function 'ipi_sync_core'
    static void ipi_sync_core(void *info)
                ^~~~~~~~~~~~~
   kernel/sched/membarrier.c:187:13: error: invalid storage class for function 'ipi_rseq'
    static void ipi_rseq(void *info)
                ^~~~~~~~
   kernel/sched/membarrier.c:200:13: error: invalid storage class for function 'ipi_sync_rq_state'
    static void ipi_sync_rq_state(void *info)
                ^~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:245:12: error: invalid storage class for function 'membarrier_global_expedited'
    static int membarrier_global_expedited(void)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:310:12: error: invalid storage class for function 'membarrier_private_expedited'
    static int membarrier_private_expedited(int flags, int cpu_id)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:426:12: error: invalid storage class for function 'sync_runqueues_membarrier_state'
    static int sync_runqueues_membarrier_state(struct mm_struct *mm)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:483:12: error: invalid storage class for function 'membarrier_register_global_expedited'
    static int membarrier_register_global_expedited(void)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:502:12: error: invalid storage class for function 'membarrier_register_private_expedited'
    static int membarrier_register_private_expedited(int flags)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:544:12: error: invalid storage class for function 'membarrier_get_registrations'
    static int membarrier_get_registrations(void)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/build_utility.c:53:
>> include/linux/syscalls.h:157:33: error: redeclaration of '__syscall_meta__membarrier' with no linkage
     static struct syscall_metadata __syscall_meta_##sname;  \
                                    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:180:2: note: in expansion of macro 'SYSCALL_TRACE_EXIT_EVENT'
     SYSCALL_TRACE_EXIT_EVENT(sname);   \
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:2: note: in expansion of macro 'SYSCALL_METADATA'
     SYSCALL_METADATA(sname, x, __VA_ARGS__)   \
     ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:141:33: note: previous declaration of '__syscall_meta__membarrier' was here
     static struct syscall_metadata __syscall_meta_##sname;  \
                                    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:179:2: note: in expansion of macro 'SYSCALL_TRACE_ENTER_EVENT'
     SYSCALL_TRACE_ENTER_EVENT(sname);   \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:2: note: in expansion of macro 'SYSCALL_METADATA'
     SYSCALL_METADATA(sname, x, __VA_ARGS__)   \
     ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:182:4: error: redeclaration of '__syscall_meta__membarrier' with no linkage
       __syscall_meta_##sname = {    \
       ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:2: note: in expansion of macro 'SYSCALL_METADATA'
     SYSCALL_METADATA(sname, x, __VA_ARGS__)   \
     ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:157:33: note: previous declaration of '__syscall_meta__membarrier' was here
     static struct syscall_metadata __syscall_meta_##sname;  \
                                    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:180:2: note: in expansion of macro 'SYSCALL_TRACE_EXIT_EVENT'
     SYSCALL_TRACE_EXIT_EVENT(sname);   \
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:2: note: in expansion of macro 'SYSCALL_METADATA'
     SYSCALL_METADATA(sname, x, __VA_ARGS__)   \
     ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
    ^~~~~~~~~~~~~~~
   In file included from include/linux/compat.h:34,
                    from arch/arm64/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/cpufreq.h:12,
                    from kernel/sched/build_utility.c:22:
   arch/arm64/include/asm/syscall_wrapper.h:55:14: error: invalid storage class for function '__se_sys_membarrier'
     static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));  \
                 ^~~~~~~~
   include/linux/syscalls.h:230:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
    ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/syscall_wrapper.h:56:21: error: invalid storage class for function '__do_sys_membarrier'
     static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)); \
                        ^~~~~~~~
   include/linux/syscalls.h:230:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
    ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/syscall_wrapper.h:58:18: error: static declaration of '__arm64_sys_membarrier' follows non-static declaration
     asmlinkage long __arm64_sys##name(const struct pt_regs *regs)  \
                     ^~~~~~~~~~~
   include/linux/syscalls.h:230:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'


vim +215 include/linux/compiler.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  206  
7290d58095712a Ard Biesheuvel 2018-08-21  207  /*
7290d58095712a Ard Biesheuvel 2018-08-21  208   * Force the compiler to emit 'sym' as a symbol, so that we can reference
7290d58095712a Ard Biesheuvel 2018-08-21  209   * it from inline assembler. Necessary in case 'sym' could be inlined
7290d58095712a Ard Biesheuvel 2018-08-21  210   * otherwise, or eliminated entirely due to lack of references that are
7290d58095712a Ard Biesheuvel 2018-08-21  211   * visible to the compiler.
7290d58095712a Ard Biesheuvel 2018-08-21  212   */
92efda8eb15295 Sami Tolvanen  2022-09-08  213  #define ___ADDRESSABLE(sym, __attrs) \
92efda8eb15295 Sami Tolvanen  2022-09-08  214  	static void * __used __attrs \
563a02b0c9704f Josh Poimboeuf 2020-08-18 @215  		__UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
92efda8eb15295 Sami Tolvanen  2022-09-08  216  #define __ADDRESSABLE(sym) \
92efda8eb15295 Sami Tolvanen  2022-09-08  217  	___ADDRESSABLE(sym, __section(".discard.addressable"))
7290d58095712a Ard Biesheuvel 2018-08-21  218  

:::::: The code at line 215 was first introduced by commit
:::::: 563a02b0c9704f69c0364befedd451f57fe88092 compiler.h: Make __ADDRESSABLE() symbol truly unique

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
