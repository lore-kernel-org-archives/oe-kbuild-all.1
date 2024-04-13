Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9241CD11
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712992511; cv=none; b=U9p1c1tOLLFaEbdxmrExJBrWDy6l3XMDh2fUY05yZGfIaMQwq2Tm4UttfLlDrpXdYQdhyRyBy77lx+4lfslCD4iAH5xcYD0rInB95QaaCZlr2M17wewOcJpxPzwO4IPXM8e3CamRWLo19fLTmSmET/gofgFzVanU+82AyTOUWa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712992511; c=relaxed/simple;
	bh=RM3EMFXOiJzJzG4Fii7ET7ly82ENR7qOBL8zmm97I1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3C1yXU+T/zuELj6AIZAK6FIU/m1KoSqc3cK+knHvlp6PCtnC9PUW5bfaQiz3qST16V2i4k3bnL+7yMQnNgcIEJg+Lvg9V1ku4coo8BnQV30RVnvoCOuqx8QOVynbDTMW6E+X0TiwIIDenpNoVmk9xAKOVK7WQvO/lPbYAWUeI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddGOTZht; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddGOTZht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712992508; x=1744528508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RM3EMFXOiJzJzG4Fii7ET7ly82ENR7qOBL8zmm97I1E=;
  b=ddGOTZhtd0RJygEuuERErGfZsTHoLCP7/ye069Ko+WYHwURl845TlEuS
   7v6uwTh1onhOowD1AMN5IKot9yV3t1QVI5V8mt4YTckZbsmrDAmE+zU8H
   DJ/rBOvg52k97eFqsimaGuvlgkRKIft7q2gq+PH5D2SoBjqGf7JfUMsgW
   Ird2Z89vTd5zJ+Dv1Awv7lV4h+AOEnb4QYYTwrKMGKsUZ8ERCDYq6qn5c
   p+N3Iz90sr9eLDtvmFhtNtRa3DJR8sUbT8W44AVHXn7WIQ0QeUn3mIsgO
   ETFYj4orsNwWXv4+wd2wdkNG+1X0CullMX/lugT+89Df0VH2NhSP2Q1d/
   g==;
X-CSE-ConnectionGUID: 5lSK1RQPQYWRmgPquTw+6A==
X-CSE-MsgGUID: 5VYHAV/CRGyWQ/spMY9eVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8623571"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="8623571"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 00:15:08 -0700
X-CSE-ConnectionGUID: ymEFwKA8R4GANDpeYyRpsw==
X-CSE-MsgGUID: 7giWLI9AT/GE0alm5S1EEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21420693"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 13 Apr 2024 00:15:07 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvXbM-0001zs-0m;
	Sat, 13 Apr 2024 07:15:04 +0000
Date: Sat, 13 Apr 2024 15:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2387/7378] include/linux/compiler.h:215:60:
 error: initializer element is not constant
Message-ID: <202404131542.5G4oleuA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2ce949a800b76538410170a027def9b8f24f791a
commit: 654944510822988390470cbc5b6f914c19dd9b88 [2387/7378] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: arm64-randconfig-r054-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131542.5G4oleuA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131542.5G4oleuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131542.5G4oleuA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |            ^~~~~~~~~~~~
   kernel/sched/psi.c:1778:12: error: invalid storage class for function 'psi_io_open'
    1778 | static int psi_io_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~
   kernel/sched/psi.c:1783:12: error: invalid storage class for function 'psi_memory_open'
    1783 | static int psi_memory_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1788:12: error: invalid storage class for function 'psi_cpu_open'
    1788 | static int psi_cpu_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~
   kernel/sched/psi.c:1793:16: error: invalid storage class for function 'psi_write'
    1793 | static ssize_t psi_write(struct file *file, const char __user *user_buf,
         |                ^~~~~~~~~
   kernel/sched/psi.c:1836:16: error: invalid storage class for function 'psi_io_write'
    1836 | static ssize_t psi_io_write(struct file *file, const char __user *user_buf,
         |                ^~~~~~~~~~~~
   kernel/sched/psi.c:1842:16: error: invalid storage class for function 'psi_memory_write'
    1842 | static ssize_t psi_memory_write(struct file *file, const char __user *user_buf,
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1848:16: error: invalid storage class for function 'psi_cpu_write'
    1848 | static ssize_t psi_cpu_write(struct file *file, const char __user *user_buf,
         |                ^~~~~~~~~~~~~
   kernel/sched/psi.c:1854:17: error: invalid storage class for function 'psi_fop_poll'
    1854 | static __poll_t psi_fop_poll(struct file *file, poll_table *wait)
         |                 ^~~~~~~~~~~~
   kernel/sched/psi.c:1861:12: error: invalid storage class for function 'psi_fop_release'
    1861 | static int psi_fop_release(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1870:27: error: initializer element is not constant
    1870 |         .proc_open      = psi_io_open,
         |                           ^~~~~~~~~~~
   kernel/sched/psi.c:1870:27: note: (near initialization for 'psi_io_proc_ops.proc_open')
   kernel/sched/psi.c:1873:27: error: initializer element is not constant
    1873 |         .proc_write     = psi_io_write,
         |                           ^~~~~~~~~~~~
   kernel/sched/psi.c:1873:27: note: (near initialization for 'psi_io_proc_ops.proc_write')
   kernel/sched/psi.c:1874:27: error: initializer element is not constant
    1874 |         .proc_poll      = psi_fop_poll,
         |                           ^~~~~~~~~~~~
   kernel/sched/psi.c:1874:27: note: (near initialization for 'psi_io_proc_ops.proc_poll')
   kernel/sched/psi.c:1875:27: error: initializer element is not constant
    1875 |         .proc_release   = psi_fop_release,
         |                           ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1875:27: note: (near initialization for 'psi_io_proc_ops.proc_release')
   kernel/sched/psi.c:1879:27: error: initializer element is not constant
    1879 |         .proc_open      = psi_memory_open,
         |                           ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1879:27: note: (near initialization for 'psi_memory_proc_ops.proc_open')
   kernel/sched/psi.c:1882:27: error: initializer element is not constant
    1882 |         .proc_write     = psi_memory_write,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1882:27: note: (near initialization for 'psi_memory_proc_ops.proc_write')
   kernel/sched/psi.c:1883:27: error: initializer element is not constant
    1883 |         .proc_poll      = psi_fop_poll,
         |                           ^~~~~~~~~~~~
   kernel/sched/psi.c:1883:27: note: (near initialization for 'psi_memory_proc_ops.proc_poll')
   kernel/sched/psi.c:1884:27: error: initializer element is not constant
    1884 |         .proc_release   = psi_fop_release,
         |                           ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1884:27: note: (near initialization for 'psi_memory_proc_ops.proc_release')
   kernel/sched/psi.c:1888:27: error: initializer element is not constant
    1888 |         .proc_open      = psi_cpu_open,
         |                           ^~~~~~~~~~~~
   kernel/sched/psi.c:1888:27: note: (near initialization for 'psi_cpu_proc_ops.proc_open')
   kernel/sched/psi.c:1891:27: error: initializer element is not constant
    1891 |         .proc_write     = psi_cpu_write,
         |                           ^~~~~~~~~~~~~
   kernel/sched/psi.c:1891:27: note: (near initialization for 'psi_cpu_proc_ops.proc_write')
   kernel/sched/psi.c:1892:27: error: initializer element is not constant
    1892 |         .proc_poll      = psi_fop_poll,
         |                           ^~~~~~~~~~~~
   kernel/sched/psi.c:1892:27: note: (near initialization for 'psi_cpu_proc_ops.proc_poll')
   kernel/sched/psi.c:1893:27: error: initializer element is not constant
    1893 |         .proc_release   = psi_fop_release,
         |                           ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1893:27: note: (near initialization for 'psi_cpu_proc_ops.proc_release')
   kernel/sched/psi.c:1907:13: error: invalid storage class for function 'get_stat_names'
    1907 | static void get_stat_names(struct seq_file *m, int i, bool is_full)
         |             ^~~~~~~~~~~~~~
   kernel/sched/psi.c:1953:12: error: invalid storage class for function 'system_psi_stat_show'
    1953 | static int system_psi_stat_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1958:12: error: invalid storage class for function 'psi_stat_open'
    1958 | static int psi_stat_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~
   kernel/sched/psi.c:1964:27: error: initializer element is not constant
    1964 |         .proc_open      = psi_stat_open,
         |                           ^~~~~~~~~~~~~
   kernel/sched/psi.c:1964:27: note: (near initialization for 'psi_stat_proc_ops.proc_open')
   kernel/sched/psi.c:1967:27: error: initializer element is not constant
    1967 |         .proc_release   = psi_fop_release,
         |                           ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1967:27: note: (near initialization for 'psi_stat_proc_ops.proc_release')
   kernel/sched/psi.c:1998:19: error: invalid storage class for function 'psi_proc_init'
    1998 | static int __init psi_proc_init(void)
         |                   ^~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12:
>> include/linux/compiler.h:215:60: error: initializer element is not constant
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                                                            ^
   include/linux/compiler.h:217:9: note: in expansion of macro '___ADDRESSABLE'
     217 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:256:9: note: in expansion of macro '__ADDRESSABLE'
     256 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:261:9: note: in expansion of macro '__define_initcall_stub'
     261 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:274:9: note: in expansion of macro '____define_initcall'
     274 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:311:41: note: in expansion of macro '__define_initcall'
     311 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:316:24: note: in expansion of macro 'device_initcall'
     316 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~
   include/linux/module.h:88:25: note: in expansion of macro '__initcall'
      88 | #define module_init(x)  __initcall(x);
         |                         ^~~~~~~~~~
   kernel/sched/psi.c:2014:1: note: in expansion of macro 'module_init'
    2014 | module_init(psi_proc_init);
         | ^~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:101:
   kernel/sched/membarrier.c:165:13: error: invalid storage class for function 'ipi_mb'
     165 | static void ipi_mb(void *info)
         |             ^~~~~~
   kernel/sched/membarrier.c:170:13: error: invalid storage class for function 'ipi_sync_core'
     170 | static void ipi_sync_core(void *info)
         |             ^~~~~~~~~~~~~
   kernel/sched/membarrier.c:187:13: error: invalid storage class for function 'ipi_rseq'
     187 | static void ipi_rseq(void *info)
         |             ^~~~~~~~
   kernel/sched/membarrier.c:200:13: error: invalid storage class for function 'ipi_sync_rq_state'
     200 | static void ipi_sync_rq_state(void *info)
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:245:12: error: invalid storage class for function 'membarrier_global_expedited'
     245 | static int membarrier_global_expedited(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:310:12: error: invalid storage class for function 'membarrier_private_expedited'
     310 | static int membarrier_private_expedited(int flags, int cpu_id)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:426:12: error: invalid storage class for function 'sync_runqueues_membarrier_state'
     426 | static int sync_runqueues_membarrier_state(struct mm_struct *mm)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:483:12: error: invalid storage class for function 'membarrier_register_global_expedited'
     483 | static int membarrier_register_global_expedited(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:502:12: error: invalid storage class for function 'membarrier_register_private_expedited'
     502 | static int membarrier_register_private_expedited(int flags)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:544:12: error: invalid storage class for function 'membarrier_get_registrations'
     544 | static int membarrier_get_registrations(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> arch/arm64/include/asm/syscall_wrapper.h:55:21: error: invalid storage class for function '__se_sys_membarrier'
      55 |         static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));             \
         |                     ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:56:28: error: invalid storage class for function '__do_sys_membarrier'
      56 |         static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));      \
         |                            ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:58:25: error: static declaration of '__arm64_sys_membarrier' follows non-static declaration
      58 |         asmlinkage long __arm64_sys##name(const struct pt_regs *regs)           \
         |                         ^~~~~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/syscall_wrapper.h:57:25: note: previous declaration of '__arm64_sys_membarrier' with type 'long int(const struct pt_regs *)'
      57 |         asmlinkage long __arm64_sys##name(const struct pt_regs *regs);          \
         |                         ^~~~~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c: In function '__arm64_sys_membarrier':
>> arch/arm64/include/asm/syscall_wrapper.h:60:24: error: implicit declaration of function '__se_sys_membarrier'; did you mean '__arm64_sys_membarrier'? [-Werror=implicit-function-declaration]
      60 |                 return __se_sys##name(SC_ARM64_REGS_TO_ARGS(x,__VA_ARGS__));    \
         |                        ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c: In function 'record_stat_times':
   arch/arm64/include/asm/syscall_wrapper.h:62:21: error: invalid storage class for function '__se_sys_membarrier'
      62 |         static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))              \
         |                     ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c: In function '__se_sys_membarrier':
>> arch/arm64/include/asm/syscall_wrapper.h:64:28: error: implicit declaration of function '__do_sys_membarrier'; did you mean '__se_sys_membarrier'? [-Werror=implicit-function-declaration]
      64 |                 long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));      \
         |                            ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c: In function 'record_stat_times':
   arch/arm64/include/asm/syscall_wrapper.h:69:28: error: invalid storage class for function '__do_sys_membarrier'
      69 |         static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
         |                            ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:109:
   kernel/sched/autogroup.c:7:28: error: section attribute cannot be specified for local variables
       7 | unsigned int __read_mostly sysctl_sched_autogroup_enabled = 1;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:15:35: error: initializer element is not constant
      15 |                 .data           = &sysctl_sched_autogroup_enabled,
         |                                   ^
   kernel/sched/autogroup.c:15:35: note: (near initialization for 'sched_autogroup_sysctls[0].data')
   kernel/sched/autogroup.c:25:20: error: invalid storage class for function 'sched_autogroup_sysctl_init'
      25 | static void __init sched_autogroup_sysctl_init(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:47:20: error: invalid storage class for function 'autogroup_destroy'
      47 | static inline void autogroup_destroy(struct kref *kref)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:60:20: error: invalid storage class for function 'autogroup_kref_put'
      60 | static inline void autogroup_kref_put(struct autogroup *ag)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:65:33: error: invalid storage class for function 'autogroup_kref_get'
      65 | static inline struct autogroup *autogroup_kref_get(struct autogroup *ag)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:71:33: error: invalid storage class for function 'autogroup_task_get'
      71 | static inline struct autogroup *autogroup_task_get(struct task_struct *p)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:85:33: error: invalid storage class for function 'autogroup_create'
      85 | static inline struct autogroup *autogroup_create(void)
         |                                 ^~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:158:1: error: invalid storage class for function 'autogroup_move_group'
     158 | autogroup_move_group(struct task_struct *p, struct autogroup *ag)
         | ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:202:15: error: non-static declaration of 'sched_autogroup_create_attach' follows static declaration
     202 | EXPORT_SYMBOL(sched_autogroup_create_attach);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:202:1: note: in expansion of macro 'EXPORT_SYMBOL'
     202 | EXPORT_SYMBOL(sched_autogroup_create_attach);
         | ^~~~~~~~~~~~~
   kernel/sched/autogroup.c:193:6: note: previous definition of 'sched_autogroup_create_attach' with type 'void(struct task_struct *)'
     193 | void sched_autogroup_create_attach(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:209:15: error: non-static declaration of 'sched_autogroup_detach' follows static declaration
     209 | EXPORT_SYMBOL(sched_autogroup_detach);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:209:1: note: in expansion of macro 'EXPORT_SYMBOL'
     209 | EXPORT_SYMBOL(sched_autogroup_detach);
         | ^~~~~~~~~~~~~
   kernel/sched/autogroup.c:205:6: note: previous definition of 'sched_autogroup_detach' with type 'void(struct task_struct *)'
     205 | void sched_autogroup_detach(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:221:19: error: invalid storage class for function 'setup_autogroup'
     221 | static int __init setup_autogroup(char *str)
         |                   ^~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/linux/kernel.h:30:
   kernel/sched/autogroup.c:227:24: error: initializer element is not constant
     227 | __setup("noautogroup", setup_autogroup);
         |                        ^~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/autogroup.c:227:1: note: in expansion of macro '__setup'
     227 | __setup("noautogroup", setup_autogroup);
         | ^~~~~~~
   kernel/sched/autogroup.c:227:24: note: (near initialization for '__setup_setup_autogroup.setup_func')
     227 | __setup("noautogroup", setup_autogroup);
         |                        ^~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/autogroup.c:227:1: note: in expansion of macro '__setup'
     227 | __setup("noautogroup", setup_autogroup);
         | ^~~~~~~
   kernel/sched/build_utility.c:110: error: expected declaration or statement at end of input
     110 | #endif
         | 
   kernel/sched/psi.c: At top level:
   kernel/sched/psi.c:178:13: warning: 'psi_avgs_work' used but never defined
     178 | static void psi_avgs_work(struct work_struct *work);
         |             ^~~~~~~~~~~~~
   kernel/sched/psi.c:180:13: warning: 'poll_timer_fn' used but never defined
     180 | static void poll_timer_fn(struct timer_list *t);
         |             ^~~~~~~~~~~~~
   kernel/sched/autogroup.c:285:5: warning: 'autogroup_path' defined but not used [-Wunused-function]
     285 | int autogroup_path(struct task_group *tg, char *buf, int buflen)
         |     ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:269:6: warning: 'proc_sched_autogroup_show_task' defined but not used [-Wunused-function]
     269 | void proc_sched_autogroup_show_task(struct task_struct *p, struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:231:5: warning: 'proc_sched_autogroup_set_nice' defined but not used [-Wunused-function]
     231 | int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:216:6: warning: 'sched_autogroup_exit' defined but not used [-Wunused-function]
     216 | void sched_autogroup_exit(struct signal_struct *sig)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:211:6: warning: 'sched_autogroup_fork' defined but not used [-Wunused-function]
     211 | void sched_autogroup_fork(struct signal_struct *sig)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:147:6: warning: 'sched_autogroup_exit_task' defined but not used [-Wunused-function]
     147 | void sched_autogroup_exit_task(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:129:6: warning: 'task_wants_autogroup' defined but not used [-Wunused-function]
     129 | bool task_wants_autogroup(struct task_struct *p, struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:42:6: warning: 'autogroup_free' defined but not used [-Wunused-function]
      42 | void autogroup_free(struct task_group *tg)
         |      ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:33:13: warning: 'autogroup_init' defined but not used [-Wunused-function]
      33 | void __init autogroup_init(struct task_struct *init_task)
         |             ^~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:62:21: warning: '__se_sys_membarrier' defined but not used [-Wunused-function]
      62 |         static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))              \
         |                     ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:58:25: warning: '__arm64_sys_membarrier' defined but not used [-Wunused-function]
      58 |         asmlinkage long __arm64_sys##name(const struct pt_regs *regs)           \
         |                         ^~~~~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:233:6: warning: 'membarrier_update_current_mm' defined but not used [-Wunused-function]
     233 | void membarrier_update_current_mm(struct mm_struct *next_mm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:217:6: warning: 'membarrier_exec_mmap' defined but not used [-Wunused-function]
     217 | void membarrier_exec_mmap(struct mm_struct *mm)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1471:6: warning: 'psi_cgroup_restart' defined but not used [-Wunused-function]
    1471 | void psi_cgroup_restart(struct psi_group *group)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1416:6: warning: 'cgroup_move_task' defined but not used [-Wunused-function]
    1416 | void cgroup_move_task(struct task_struct *task, struct css_set *to)
         |      ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1392:6: warning: 'psi_cgroup_free' defined but not used [-Wunused-function]
    1392 | void psi_cgroup_free(struct cgroup *cgroup)
         |      ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1373:5: warning: 'psi_cgroup_alloc' defined but not used [-Wunused-function]
    1373 | int psi_cgroup_alloc(struct cgroup *cgroup)
         |     ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1168:6: warning: 'psi_task_switch' defined but not used [-Wunused-function]
    1168 | void psi_task_switch(struct task_struct *prev, struct task_struct *next,
         |      ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:949:13: warning: 'poll_timer_fn' defined but not used [-Wunused-function]
     949 | static void poll_timer_fn(struct timer_list *t)
         |             ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
