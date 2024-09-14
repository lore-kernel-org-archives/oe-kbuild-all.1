Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998611D12EB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726330513; cv=none; b=X38k7JCzXHNjfw42R2ddhiyr6ncF6M1bsIWb2KlD3WUXjjihdSfTOhbrxHXoMahh+yFgtwpDi8DcWnKV2bNHFS145ssxkad8q6+ymTyVxBV8egFTkacb6U6mZsEsXAtN96ZJmImyhYrFgGnmqbd6kYz++PNN6dwDQN9CS1Tz3dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726330513; c=relaxed/simple;
	bh=99jCVrcEHKThldVE6apfPwrZ/f41Mrd9ol0m5LhNegM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fZc0qFHFjTmxpQWFPx82gssIx1GiwPiQ2YYAwIF0nueePxJJFagNg8dLqgwY0WC3EDHD8SoHd79Ex1fcHC+8VFt4kzywrtwbhBlKDq7rZhaqB0bF303wD02hUN2v6Q8OEZUCzyl7r/aI9ewgnDKaqtYEtgTAv3XPL+Rb6U+Ks1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivmikcxz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivmikcxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726330511; x=1757866511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99jCVrcEHKThldVE6apfPwrZ/f41Mrd9ol0m5LhNegM=;
  b=ivmikcxz0zwSbd9+kusu9veaD/9LkWd9eRtmz/Gs07ptl58B98F4L9lc
   cShla7G7Nj6bMmwzV0CdHHKOEiZI+FNj3wpe/0IGAoY8IYJkRLn/xW6bC
   p0S8Zlq5czJzIcJE6v0noN63bDpMPD5um418/0lhk/N3YGidJr/H7t9pS
   ka7bH0GeS/Vrbe8QDtuE+zhsQqA2c/gBNs/Evef5aRKBa7Ay2qp6f/jyz
   fdsdJfmRpCJ82qA/+v2cJ7loBkfVflUATqonwnFY4ia3U4JcjHQT5PlUi
   EsdwwiV/zhtAzQrS+keA+oq691WBZ+f9YbpHMyK4Md5sTm3MxH+X+mheJ
   w==;
X-CSE-ConnectionGUID: zxYaH3bTQdyH4wnar3nkGA==
X-CSE-MsgGUID: bKh4vGupRe6I6xJsjn7tlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35803087"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="35803087"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 09:15:10 -0700
X-CSE-ConnectionGUID: 5Tg8k8O3T7iEMbTk+4p7Tg==
X-CSE-MsgGUID: Y/DxrxGpTX+uxFbv3jaZ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="105881430"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2024 09:15:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spVQP-0007w2-3D;
	Sat, 14 Sep 2024 16:15:06 +0000
Date: Sun, 15 Sep 2024 00:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2387/13948] kernel/sched/psi.c:178:13: warning:
 'psi_avgs_work' used but never defined
Message-ID: <202409150029.IPJpZTLQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1910604f7315d411c0c10359055daddee968441f
commit: 654944510822988390470cbc5b6f914c19dd9b88 [2387/13948] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: loongarch-randconfig-r133-20240913 (https://download.01.org/0day-ci/archive/20240915/202409150029.IPJpZTLQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240915/202409150029.IPJpZTLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150029.IPJpZTLQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from include/linux/printk.h:6,
                    from include/linux/kernel.h:30:
   kernel/sched/psi.c:2014:13: error: initializer element is not constant
    2014 | module_init(psi_proc_init);
         |             ^~~~~~~~~~~~~
   include/linux/init.h:270:55: note: in definition of macro '____define_initcall'
     270 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
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
   In file included from include/linux/compiler_types.h:153,
                    from <command-line>:
>> include/linux/compiler-gcc.h:132:33: warning: 'alias' attribute ignored [-Wattributes]
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/compiler-gcc.h:135:33: note: in expansion of macro '__diag'
     135 | #define __diag_GCC_8(s)         __diag(s)
         |                                 ^~~~~~
   include/linux/compiler-gcc.h:123:9: note: in expansion of macro '__diag_GCC_8'
     123 |         __diag_GCC_ ## version(__diag_GCC_ ## severity s)
         |         ^~~~~~~~~~~
   include/linux/compiler_types.h:444:9: note: in expansion of macro '__diag_GCC'
     444 |         __diag_ ## compiler(version, ignore, option)
         |         ^~~~~~~
   include/linux/syscalls.h:242:9: note: in expansion of macro '__diag_ignore'
     242 |         __diag_ignore(GCC, 8, "-Wattribute-alias",                      \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   In file included from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/build_utility.c:53:
   include/linux/syscalls.h:247:28: error: invalid storage class for function '__do_sys_membarrier'
     247 |         static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
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
   include/linux/syscalls.h:249:25: error: static declaration of '__se_sys_membarrier' follows non-static declaration
     249 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
         |                         ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:248:25: note: previous declaration of '__se_sys_membarrier' with type 'long int(long int,  long int,  long int)'
     248 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__)); \
         |                         ^~~~~~~~
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
   include/linux/syscalls.h:251:28: error: implicit declaration of function '__do_sys_membarrier'; did you mean '__se_sys_membarrier'? [-Wimplicit-function-declaration]
     251 |                 long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
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
   include/linux/syscalls.h:257:28: error: invalid storage class for function '__do_sys_membarrier'
     257 |         static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
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
   kernel/sched/psi.c: At top level:
>> kernel/sched/psi.c:178:13: warning: 'psi_avgs_work' used but never defined
     178 | static void psi_avgs_work(struct work_struct *work);
         |             ^~~~~~~~~~~~~
>> kernel/sched/psi.c:180:13: warning: 'poll_timer_fn' used but never defined
     180 | static void poll_timer_fn(struct timer_list *t);
         |             ^~~~~~~~~~~~~
>> kernel/sched/autogroup.c:285:5: warning: 'autogroup_path' defined but not used [-Wunused-function]
     285 | int autogroup_path(struct task_group *tg, char *buf, int buflen)
         |     ^~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:269:6: warning: 'proc_sched_autogroup_show_task' defined but not used [-Wunused-function]
     269 | void proc_sched_autogroup_show_task(struct task_struct *p, struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:231:5: warning: 'proc_sched_autogroup_set_nice' defined but not used [-Wunused-function]
     231 | int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:216:6: warning: 'sched_autogroup_exit' defined but not used [-Wunused-function]
     216 | void sched_autogroup_exit(struct signal_struct *sig)
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:211:6: warning: 'sched_autogroup_fork' defined but not used [-Wunused-function]
     211 | void sched_autogroup_fork(struct signal_struct *sig)
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:147:6: warning: 'sched_autogroup_exit_task' defined but not used [-Wunused-function]
     147 | void sched_autogroup_exit_task(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:129:6: warning: 'task_wants_autogroup' defined but not used [-Wunused-function]
     129 | bool task_wants_autogroup(struct task_struct *p, struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:42:6: warning: 'autogroup_free' defined but not used [-Wunused-function]
      42 | void autogroup_free(struct task_group *tg)
         |      ^~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:33:13: warning: 'autogroup_init' defined but not used [-Wunused-function]
      33 | void __init autogroup_init(struct task_struct *init_task)
         |             ^~~~~~~~~~~~~~
>> include/linux/syscalls.h:249:25: warning: '__se_sys_membarrier' defined but not used [-Wunused-function]
     249 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
         |                         ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
>> kernel/sched/membarrier.c:233:6: warning: 'membarrier_update_current_mm' defined but not used [-Wunused-function]
     233 | void membarrier_update_current_mm(struct mm_struct *next_mm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/membarrier.c:217:6: warning: 'membarrier_exec_mmap' defined but not used [-Wunused-function]
     217 | void membarrier_exec_mmap(struct mm_struct *mm)
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1471:6: warning: 'psi_cgroup_restart' defined but not used [-Wunused-function]
    1471 | void psi_cgroup_restart(struct psi_group *group)
         |      ^~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1416:6: warning: 'cgroup_move_task' defined but not used [-Wunused-function]
    1416 | void cgroup_move_task(struct task_struct *task, struct css_set *to)
         |      ^~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1392:6: warning: 'psi_cgroup_free' defined but not used [-Wunused-function]
    1392 | void psi_cgroup_free(struct cgroup *cgroup)
         |      ^~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1373:5: warning: 'psi_cgroup_alloc' defined but not used [-Wunused-function]
    1373 | int psi_cgroup_alloc(struct cgroup *cgroup)
         |     ^~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1168:6: warning: 'psi_task_switch' defined but not used [-Wunused-function]
    1168 | void psi_task_switch(struct task_struct *prev, struct task_struct *next,
         |      ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:949:13: warning: 'poll_timer_fn' defined but not used [-Wunused-function]
     949 | static void poll_timer_fn(struct timer_list *t)
         |             ^~~~~~~~~~~~~


vim +/psi_avgs_work +178 kernel/sched/psi.c

eb414681d5a07d2 Johannes Weiner    2018-10-26  177  
bcc78db64168eb6 Suren Baghdasaryan 2019-05-14 @178  static void psi_avgs_work(struct work_struct *work);
eb414681d5a07d2 Johannes Weiner    2018-10-26  179  
8f91efd870ea5d8 Zhaoyang Huang     2021-06-11 @180  static void poll_timer_fn(struct timer_list *t);
8f91efd870ea5d8 Zhaoyang Huang     2021-06-11  181  

:::::: The code at line 178 was first introduced by commit
:::::: bcc78db64168eb6dede056fed2999f75f7ace309 psi: rename psi fields in preparation for psi trigger addition

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
