Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791BE19CCF4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 21:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739656361; cv=none; b=t8kuGD3Z0aoFIPjGciOYgZT3s+GiwsuhS6gMRgkjE4wH8Sq7rjPA2mGFLAarDKoF8wmxJzWGennNCyyQXrrbYhQpkX0iAyvcAXypAwiTLbOdfRkieYq5wsU7UYxzBK9mwpbjEfIdG6FhFryvKqr/hJw/xYsdgek+PVHegj081cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739656361; c=relaxed/simple;
	bh=qzyrCY3OUkomRJawiCZTkrfJ59Jep8iHPYi9js+tWkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hsHhJjm79GxE+hpgzXkGnXNbHahzilPfGXxZ6sPAxnpwpn932k2WAtpykAmBPAdTHRzOinMM9T/glhJ8q2mTD81E53NBi7zGaYQwDEfb5602E9hXYgZ6dJzB7rARZTcQq+MnXm90GXqHAig/+c9quTcHIvcpdrixE5bKIHaF/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJG5NmQ5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJG5NmQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739656359; x=1771192359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qzyrCY3OUkomRJawiCZTkrfJ59Jep8iHPYi9js+tWkY=;
  b=UJG5NmQ5vEHKae1mqZ4CmTBMXaF98prD+GZqY2PVJCUXHxPfLJOaE7Mv
   fxUPv+zR3oe6F39V352BEaOd/rCGE5DRpQBt4jALJAL7ab0/KvuLDOkOM
   dVn7/gc94xGYAoszpgwEYugLkJrS+7QlhyJUkRkOafCVzUW2JIVUxBj+o
   JzkuLhdb3MaDMfAslQY25BHHQIZNGBBzMaC0KnMPlnMgysHqBKjnSHL7L
   lGXyX4mi9HxipA0X1Ry7Lj/EfdaaumKT5j+wtO58TBDNbIqxBAz4sL/ND
   q/LbYDUeiP6EUaQJ9cNoKDiXuXm5h3wQ3BaNoG9P5/W/1rjDt3su4Tl8k
   w==;
X-CSE-ConnectionGUID: m4iTPnEMQ1q0EjYsHT0MSw==
X-CSE-MsgGUID: cLZMsAlsREexr4VWhqA27Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="50596005"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="50596005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 13:52:38 -0800
X-CSE-ConnectionGUID: CM1865y5SLKBrz8w8qbnPg==
X-CSE-MsgGUID: 6TvNGWYlTxKou5f75mgKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150933505"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Feb 2025 13:52:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjQ5S-001BDQ-02;
	Sat, 15 Feb 2025 21:52:34 +0000
Date: Sun, 16 Feb 2025 05:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1928/1928] kernel/sched/psi.c:1763:12: error:
 invalid storage class for function 'psi_io_show'
Message-ID: <202502160550.E90uGy3T-lkp@intel.com>
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
head:   01e57e5fa297f937102f9b58ee7905f638b8450f
commit: 654944510822988390470cbc5b6f914c19dd9b88 [1928/1928] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: loongarch-randconfig-r064-20250216 (https://download.01.org/0day-ci/archive/20250216/202502160550.E90uGy3T-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160550.E90uGy3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160550.E90uGy3T-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/sched/psi.c:447:13: error: invalid storage class for function 'psi_stat_flags_change'
     447 | static void psi_stat_flags_change(struct task_struct *task, int *stat_set,
         |             ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:469:13: error: invalid storage class for function 'get_recent_stat_times'
     469 | static void get_recent_stat_times(struct psi_group *group, int cpu,
         |             ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:516:20: error: invalid storage class for function 'update_throttle_type'
     516 | static inline void update_throttle_type(struct task_struct *task, int cpu,
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:520:13: error: invalid storage class for function 'collect_percpu_times'
     520 | static void collect_percpu_times(struct psi_group *group,
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:588:13: error: invalid storage class for function 'window_reset'
     588 | static void window_reset(struct psi_window *win, u64 now, u64 value,
         |             ^~~~~~~~~~~~
   kernel/sched/psi.c:607:12: error: invalid storage class for function 'window_update'
     607 | static u64 window_update(struct psi_window *win, u64 now, u64 value)
         |            ^~~~~~~~~~~~~
   kernel/sched/psi.c:633:12: error: invalid storage class for function 'update_triggers'
     633 | static u64 update_triggers(struct psi_group *group, u64 now, bool *update_total,
         |            ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:706:12: error: invalid storage class for function 'update_averages'
     706 | static u64 update_averages(struct psi_group *group, u64 now)
         |            ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:771:13: error: invalid storage class for function 'psi_avgs_work'
     771 | static void psi_avgs_work(struct work_struct *work)
         |             ^~~~~~~~~~~~~
   kernel/sched/psi.c:807:13: error: invalid storage class for function 'init_rtpoll_triggers'
     807 | static void init_rtpoll_triggers(struct psi_group *group, u64 now)
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:820:13: error: invalid storage class for function 'psi_schedule_rtpoll_work'
     820 | static void psi_schedule_rtpoll_work(struct psi_group *group, unsigned long delay,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:847:13: error: invalid storage class for function 'psi_rtpoll_work'
     847 | static void psi_rtpoll_work(struct psi_group *group)
         |             ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:931:12: error: invalid storage class for function 'psi_rtpoll_worker'
     931 | static int psi_rtpoll_worker(void *data)
         |            ^~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:949:13: error: invalid storage class for function 'poll_timer_fn'
     949 | static void poll_timer_fn(struct timer_list *t)
         |             ^~~~~~~~~~~~~
   kernel/sched/psi.c:957:13: error: invalid storage class for function 'record_times'
     957 | static void record_times(struct psi_group_cpu *groupc, u64 now)
         |             ^~~~~~~~~~~~
   kernel/sched/psi.c:990:13: error: invalid storage class for function 'psi_group_change'
     990 | static void psi_group_change(struct psi_group *group, int cpu,
         |             ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1106:13: error: invalid storage class for function 'task_is_in_psi_v1'
    1106 | static bool task_is_in_psi_v1(void)
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1112:33: error: invalid storage class for function 'task_psi_group'
    1112 | static inline struct psi_group *task_psi_group(struct task_struct *task)
         |                                 ^~~~~~~~~~~~~~
   kernel/sched/psi.c: In function 'task_psi_group':
   kernel/sched/psi.c:1120:52: error: 'cpuacct_cgrp_id' undeclared (first use in this function); did you mean 'cpuset_cgrp_id'?
    1120 |                         cgroup = task_cgroup(task, cpuacct_cgrp_id);
         |                                                    ^~~~~~~~~~~~~~~
         |                                                    cpuset_cgrp_id
   kernel/sched/psi.c:1120:52: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/psi.c: In function 'record_stat_times':
   kernel/sched/psi.c:1130:13: error: invalid storage class for function 'psi_flags_change'
    1130 | static void psi_flags_change(struct task_struct *task, int clear, int set)
         |             ^~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   kernel/sched/psi.c:1338:19: error: non-static declaration of 'psi_memstall_enter' follows static declaration
    1338 | EXPORT_SYMBOL_GPL(psi_memstall_enter);
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/psi.c:1338:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1338 | EXPORT_SYMBOL_GPL(psi_memstall_enter);
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1306:6: note: previous definition of 'psi_memstall_enter' with type 'void(long unsigned int *)'
    1306 | void psi_memstall_enter(unsigned long *flags)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1370:19: error: non-static declaration of 'psi_memstall_leave' follows static declaration
    1370 | EXPORT_SYMBOL_GPL(psi_memstall_leave);
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/psi.c:1370:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1370 | EXPORT_SYMBOL_GPL(psi_memstall_leave);
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1346:6: note: previous definition of 'psi_memstall_leave' with type 'void(long unsigned int *)'
    1346 | void psi_memstall_leave(unsigned long *flags)
         |      ^~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1763:12: error: invalid storage class for function 'psi_io_show'
    1763 | static int psi_io_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~
>> kernel/sched/psi.c:1768:12: error: invalid storage class for function 'psi_memory_show'
    1768 | static int psi_memory_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1773:12: error: invalid storage class for function 'psi_cpu_show'
    1773 | static int psi_cpu_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~
>> kernel/sched/psi.c:1778:12: error: invalid storage class for function 'psi_io_open'
    1778 | static int psi_io_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~
>> kernel/sched/psi.c:1783:12: error: invalid storage class for function 'psi_memory_open'
    1783 | static int psi_memory_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1788:12: error: invalid storage class for function 'psi_cpu_open'
    1788 | static int psi_cpu_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~
>> kernel/sched/psi.c:1793:16: error: invalid storage class for function 'psi_write'
    1793 | static ssize_t psi_write(struct file *file, const char __user *user_buf,
         |                ^~~~~~~~~
>> kernel/sched/psi.c:1836:16: error: invalid storage class for function 'psi_io_write'
    1836 | static ssize_t psi_io_write(struct file *file, const char __user *user_buf,
         |                ^~~~~~~~~~~~
>> kernel/sched/psi.c:1842:16: error: invalid storage class for function 'psi_memory_write'
    1842 | static ssize_t psi_memory_write(struct file *file, const char __user *user_buf,
         |                ^~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1848:16: error: invalid storage class for function 'psi_cpu_write'
    1848 | static ssize_t psi_cpu_write(struct file *file, const char __user *user_buf,
         |                ^~~~~~~~~~~~~
>> kernel/sched/psi.c:1854:17: error: invalid storage class for function 'psi_fop_poll'
    1854 | static __poll_t psi_fop_poll(struct file *file, poll_table *wait)
         |                 ^~~~~~~~~~~~
>> kernel/sched/psi.c:1861:12: error: invalid storage class for function 'psi_fop_release'
    1861 | static int psi_fop_release(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1870:27: error: initializer element is not constant
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
>> kernel/sched/psi.c:1907:13: error: invalid storage class for function 'get_stat_names'
    1907 | static void get_stat_names(struct seq_file *m, int i, bool is_full)
         |             ^~~~~~~~~~~~~~
>> kernel/sched/psi.c:1953:12: error: invalid storage class for function 'system_psi_stat_show'
    1953 | static int system_psi_stat_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1958:12: error: invalid storage class for function 'psi_stat_open'
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
>> kernel/sched/psi.c:1998:19: error: invalid storage class for function 'psi_proc_init'
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
>> include/linux/syscalls.h:247:28: error: invalid storage class for function '__do_sys_membarrier'
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
>> include/linux/syscalls.h:249:25: error: static declaration of '__se_sys_membarrier' follows non-static declaration
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
   kernel/sched/isolation.c:24:19: error: extern declaration of 'housekeeping_overridden' follows declaration with no linkage
      24 | EXPORT_SYMBOL_GPL(housekeeping_overridden);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/isolation.c:24:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      24 | EXPORT_SYMBOL_GPL(housekeeping_overridden);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/once.h:6,
                    from include/linux/prandom.h:12,
                    from include/linux/random.h:153,
                    from include/linux/nodemask.h:97,
                    from include/linux/sched.h:23,
                    from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/build_utility.c:13:
   kernel/sched/isolation.c:23:25: note: previous definition of 'housekeeping_overridden' with type 'struct static_key_false'
      23 | DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:390:33: note: in definition of macro 'DEFINE_STATIC_KEY_FALSE'
     390 |         struct static_key_false name = STATIC_KEY_FALSE_INIT
         |                                 ^~~~
   kernel/sched/isolation.c:37:19: error: non-static declaration of 'housekeeping_enabled' follows static declaration
      37 | EXPORT_SYMBOL_GPL(housekeeping_enabled);
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/isolation.c:37:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      37 | EXPORT_SYMBOL_GPL(housekeeping_enabled);
         | ^~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:105:
   kernel/sched/isolation.c:33:6: note: previous definition of 'housekeeping_enabled' with type 'bool(enum hk_type)' {aka '_Bool(enum hk_type)'}
      33 | bool housekeeping_enabled(enum hk_type type)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:54:19: error: non-static declaration of 'housekeeping_any_cpu' follows static declaration
      54 | EXPORT_SYMBOL_GPL(housekeeping_any_cpu);
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~


vim +/psi_io_show +1763 kernel/sched/psi.c

0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1761  
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1762  #ifdef CONFIG_PROC_FS
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19 @1763  static int psi_io_show(struct seq_file *m, void *v)
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1764  {
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1765  	return psi_show(m, &psi_system, PSI_IO);
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1766  }
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1767  
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19 @1768  static int psi_memory_show(struct seq_file *m, void *v)
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1769  {
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1770  	return psi_show(m, &psi_system, PSI_MEM);
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1771  }
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1772  
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19 @1773  static int psi_cpu_show(struct seq_file *m, void *v)
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1774  {
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1775  	return psi_show(m, &psi_system, PSI_CPU);
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1776  }
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1777  
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19 @1778  static int psi_io_open(struct inode *inode, struct file *file)
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1779  {
d82caa273565b4 Domenico Cerasuolo 2023-03-30  1780  	return single_open(file, psi_io_show, NULL);
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1781  }
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1782  
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19 @1783  static int psi_memory_open(struct inode *inode, struct file *file)
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1784  {
d82caa273565b4 Domenico Cerasuolo 2023-03-30  1785  	return single_open(file, psi_memory_show, NULL);
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1786  }
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1787  
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19 @1788  static int psi_cpu_open(struct inode *inode, struct file *file)
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1789  {
d82caa273565b4 Domenico Cerasuolo 2023-03-30  1790  	return single_open(file, psi_cpu_show, NULL);
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1791  }
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1792  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14 @1793  static ssize_t psi_write(struct file *file, const char __user *user_buf,
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1794  			 size_t nbytes, enum psi_res res)
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1795  {
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1796  	char buf[32];
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1797  	size_t buf_size;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1798  	struct seq_file *seq;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1799  	struct psi_trigger *new;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1800  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1801  	if (static_branch_likely(&psi_disabled))
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1802  		return -EOPNOTSUPP;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1803  
6fcca0fa48118e Suren Baghdasaryan 2020-02-03  1804  	if (!nbytes)
6fcca0fa48118e Suren Baghdasaryan 2020-02-03  1805  		return -EINVAL;
6fcca0fa48118e Suren Baghdasaryan 2020-02-03  1806  
4adcdcea717cb2 Miles Chen         2019-09-12  1807  	buf_size = min(nbytes, sizeof(buf));
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1808  	if (copy_from_user(buf, user_buf, buf_size))
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1809  		return -EFAULT;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1810  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1811  	buf[buf_size - 1] = '\0';
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1812  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1813  	seq = file->private_data;
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1814  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1815  	/* Take seq->lock to protect seq->private from concurrent writes */
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1816  	mutex_lock(&seq->lock);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1817  
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1818  	/* Allow only one trigger per file descriptor */
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1819  	if (seq->private) {
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1820  		mutex_unlock(&seq->lock);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1821  		return -EBUSY;
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1822  	}
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1823  
aff037078ecaec Suren Baghdasaryan 2023-06-29  1824  	new = psi_trigger_create(&psi_system, buf, res, file, NULL);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1825  	if (IS_ERR(new)) {
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1826  		mutex_unlock(&seq->lock);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1827  		return PTR_ERR(new);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1828  	}
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1829  
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1830  	smp_store_release(&seq->private, new);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1831  	mutex_unlock(&seq->lock);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1832  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1833  	return nbytes;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1834  }
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1835  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14 @1836  static ssize_t psi_io_write(struct file *file, const char __user *user_buf,
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1837  			    size_t nbytes, loff_t *ppos)
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1838  {
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1839  	return psi_write(file, user_buf, nbytes, PSI_IO);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1840  }
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1841  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14 @1842  static ssize_t psi_memory_write(struct file *file, const char __user *user_buf,
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1843  				size_t nbytes, loff_t *ppos)
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1844  {
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1845  	return psi_write(file, user_buf, nbytes, PSI_MEM);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1846  }
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1847  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14 @1848  static ssize_t psi_cpu_write(struct file *file, const char __user *user_buf,
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1849  			     size_t nbytes, loff_t *ppos)
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1850  {
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1851  	return psi_write(file, user_buf, nbytes, PSI_CPU);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1852  }
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1853  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14 @1854  static __poll_t psi_fop_poll(struct file *file, poll_table *wait)
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1855  {
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1856  	struct seq_file *seq = file->private_data;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1857  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1858  	return psi_trigger_poll(&seq->private, file, wait);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1859  }
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1860  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14 @1861  static int psi_fop_release(struct inode *inode, struct file *file)
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1862  {
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1863  	struct seq_file *seq = file->private_data;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1864  
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1865  	psi_trigger_destroy(seq->private);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1866  	return single_release(inode, file);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1867  }
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1868  
97a32539b9568b Alexey Dobriyan    2020-02-03  1869  static const struct proc_ops psi_io_proc_ops = {
97a32539b9568b Alexey Dobriyan    2020-02-03 @1870  	.proc_open	= psi_io_open,
97a32539b9568b Alexey Dobriyan    2020-02-03  1871  	.proc_read	= seq_read,
97a32539b9568b Alexey Dobriyan    2020-02-03  1872  	.proc_lseek	= seq_lseek,
97a32539b9568b Alexey Dobriyan    2020-02-03  1873  	.proc_write	= psi_io_write,
97a32539b9568b Alexey Dobriyan    2020-02-03  1874  	.proc_poll	= psi_fop_poll,
97a32539b9568b Alexey Dobriyan    2020-02-03  1875  	.proc_release	= psi_fop_release,
eb414681d5a07d Johannes Weiner    2018-10-26  1876  };
eb414681d5a07d Johannes Weiner    2018-10-26  1877  
97a32539b9568b Alexey Dobriyan    2020-02-03  1878  static const struct proc_ops psi_memory_proc_ops = {
97a32539b9568b Alexey Dobriyan    2020-02-03  1879  	.proc_open	= psi_memory_open,
97a32539b9568b Alexey Dobriyan    2020-02-03  1880  	.proc_read	= seq_read,
97a32539b9568b Alexey Dobriyan    2020-02-03  1881  	.proc_lseek	= seq_lseek,
97a32539b9568b Alexey Dobriyan    2020-02-03  1882  	.proc_write	= psi_memory_write,
97a32539b9568b Alexey Dobriyan    2020-02-03  1883  	.proc_poll	= psi_fop_poll,
97a32539b9568b Alexey Dobriyan    2020-02-03  1884  	.proc_release	= psi_fop_release,
eb414681d5a07d Johannes Weiner    2018-10-26  1885  };
eb414681d5a07d Johannes Weiner    2018-10-26  1886  
97a32539b9568b Alexey Dobriyan    2020-02-03  1887  static const struct proc_ops psi_cpu_proc_ops = {
97a32539b9568b Alexey Dobriyan    2020-02-03  1888  	.proc_open	= psi_cpu_open,
97a32539b9568b Alexey Dobriyan    2020-02-03  1889  	.proc_read	= seq_read,
97a32539b9568b Alexey Dobriyan    2020-02-03  1890  	.proc_lseek	= seq_lseek,
97a32539b9568b Alexey Dobriyan    2020-02-03  1891  	.proc_write	= psi_cpu_write,
97a32539b9568b Alexey Dobriyan    2020-02-03  1892  	.proc_poll	= psi_fop_poll,
97a32539b9568b Alexey Dobriyan    2020-02-03  1893  	.proc_release	= psi_fop_release,
eb414681d5a07d Johannes Weiner    2018-10-26  1894  };
eb414681d5a07d Johannes Weiner    2018-10-26  1895  
4a69b56540f405 Lu Jialin          2024-01-04  1896  #ifdef CONFIG_PSI_FINE_GRAINED
4a69b56540f405 Lu Jialin          2024-01-04  1897  static const char *const psi_stat_names[] = {
4a69b56540f405 Lu Jialin          2024-01-04  1898  	"cgroup_memory_reclaim",
25d00f6853c3c6 Lu Jialin          2024-01-04  1899  	"global_memory_reclaim",
25d00f6853c3c6 Lu Jialin          2024-01-04  1900  	"compact",
25d00f6853c3c6 Lu Jialin          2024-01-04  1901  	"cgroup_async_memory_reclaim",
25d00f6853c3c6 Lu Jialin          2024-01-04  1902  	"swap",
65494451082298 Lu Jialin          2024-01-04  1903  	"cpu_cfs_bandwidth",
65494451082298 Lu Jialin          2024-01-04  1904  	"cpu_qos",
4a69b56540f405 Lu Jialin          2024-01-04  1905  };
4a69b56540f405 Lu Jialin          2024-01-04  1906  
65494451082298 Lu Jialin          2024-01-04 @1907  static void get_stat_names(struct seq_file *m, int i, bool is_full)
65494451082298 Lu Jialin          2024-01-04  1908  {
65494451082298 Lu Jialin          2024-01-04  1909  	if (i <= PSI_SWAP_FULL && !is_full)
65494451082298 Lu Jialin          2024-01-04  1910  		return seq_printf(m, "%s\n", psi_stat_names[i / 2]);
65494451082298 Lu Jialin          2024-01-04  1911  	else if (i == PSI_CPU_CFS_BANDWIDTH_FULL)
65494451082298 Lu Jialin          2024-01-04  1912  		return seq_printf(m, "%s\n", "cpu_cfs_bandwidth");
65494451082298 Lu Jialin          2024-01-04  1913  #ifdef CONFIG_QOS_SCHED
65494451082298 Lu Jialin          2024-01-04  1914  	else if (i == PSI_CPU_QOS_FULL)
65494451082298 Lu Jialin          2024-01-04  1915  		return seq_printf(m, "%s\n", "cpu_qos");
65494451082298 Lu Jialin          2024-01-04  1916  #endif
65494451082298 Lu Jialin          2024-01-04  1917  }
65494451082298 Lu Jialin          2024-01-04  1918  
4a69b56540f405 Lu Jialin          2024-01-04  1919  int psi_stat_show(struct seq_file *m, struct psi_group *group)
4a69b56540f405 Lu Jialin          2024-01-04  1920  {
4a69b56540f405 Lu Jialin          2024-01-04  1921  	int i;
4a69b56540f405 Lu Jialin          2024-01-04  1922  	u64 now;
4a69b56540f405 Lu Jialin          2024-01-04  1923  
4a69b56540f405 Lu Jialin          2024-01-04  1924  	if (static_branch_likely(&psi_disabled))
4a69b56540f405 Lu Jialin          2024-01-04  1925  		return -EOPNOTSUPP;
4a69b56540f405 Lu Jialin          2024-01-04  1926  
4a69b56540f405 Lu Jialin          2024-01-04  1927  	mutex_lock(&group->avgs_lock);
4a69b56540f405 Lu Jialin          2024-01-04  1928  	now = sched_clock();
4a69b56540f405 Lu Jialin          2024-01-04  1929  	collect_percpu_times(group, PSI_AVGS, NULL);
4a69b56540f405 Lu Jialin          2024-01-04  1930  	if (now >= group->avg_next_update)
4a69b56540f405 Lu Jialin          2024-01-04  1931  		group->avg_next_update = update_averages(group, now);
4a69b56540f405 Lu Jialin          2024-01-04  1932  	mutex_unlock(&group->avgs_lock);
4a69b56540f405 Lu Jialin          2024-01-04  1933  
4a69b56540f405 Lu Jialin          2024-01-04  1934  	for (i = 0; i < NR_PSI_STAT_STATES; i++) {
4a69b56540f405 Lu Jialin          2024-01-04  1935  		unsigned long avg[3] = {0, };
4a69b56540f405 Lu Jialin          2024-01-04  1936  		int w;
4a69b56540f405 Lu Jialin          2024-01-04  1937  		u64 total;
65494451082298 Lu Jialin          2024-01-04  1938  		bool is_full = i % 2 || i > PSI_SWAP_FULL;
4a69b56540f405 Lu Jialin          2024-01-04  1939  
4a69b56540f405 Lu Jialin          2024-01-04  1940  		for (w = 0; w < 3; w++)
4a69b56540f405 Lu Jialin          2024-01-04  1941  			avg[w] = group->fine_grained_avg[i][w];
4a69b56540f405 Lu Jialin          2024-01-04  1942  		total = div_u64(group->fine_grained_total[PSI_AVGS][i], NSEC_PER_USEC);
65494451082298 Lu Jialin          2024-01-04  1943  		get_stat_names(m, i, is_full);
4a69b56540f405 Lu Jialin          2024-01-04  1944  		seq_printf(m, "%s avg10=%lu.%02lu avg60=%lu.%02lu avg300=%lu.%02lu total=%llu\n",
4a69b56540f405 Lu Jialin          2024-01-04  1945  			   is_full ? "full" : "some",
4a69b56540f405 Lu Jialin          2024-01-04  1946  			   LOAD_INT(avg[0]), LOAD_FRAC(avg[0]),
4a69b56540f405 Lu Jialin          2024-01-04  1947  			   LOAD_INT(avg[1]), LOAD_FRAC(avg[1]),
4a69b56540f405 Lu Jialin          2024-01-04  1948  			   LOAD_INT(avg[2]), LOAD_FRAC(avg[2]),
4a69b56540f405 Lu Jialin          2024-01-04  1949  			   total);
4a69b56540f405 Lu Jialin          2024-01-04  1950  	}
4a69b56540f405 Lu Jialin          2024-01-04  1951  	return 0;
4a69b56540f405 Lu Jialin          2024-01-04  1952  }
4a69b56540f405 Lu Jialin          2024-01-04 @1953  static int system_psi_stat_show(struct seq_file *m, void *v)
4a69b56540f405 Lu Jialin          2024-01-04  1954  {
4a69b56540f405 Lu Jialin          2024-01-04  1955  	return psi_stat_show(m, &psi_system);
4a69b56540f405 Lu Jialin          2024-01-04  1956  }
4a69b56540f405 Lu Jialin          2024-01-04  1957  
4a69b56540f405 Lu Jialin          2024-01-04 @1958  static int psi_stat_open(struct inode *inode, struct file *file)
4a69b56540f405 Lu Jialin          2024-01-04  1959  {
4a69b56540f405 Lu Jialin          2024-01-04  1960  	return single_open(file, system_psi_stat_show, NULL);
4a69b56540f405 Lu Jialin          2024-01-04  1961  }
4a69b56540f405 Lu Jialin          2024-01-04  1962  

:::::: The code at line 1763 was first introduced by commit
:::::: 5102bb1c9f82857a3164af9d7ab7ad628cb783ed psi: Fix "defined but not used" warnings when CONFIG_PROC_FS=n

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
